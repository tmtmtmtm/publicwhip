# encoding: UTF-8

class MembersController < ApplicationController
  def index
    @sort = params[:sort]
    # By default sort by last name
    @sort = "lastname" if @sort.nil?

    @australian_house = params[:house]
    @australian_house = "representatives" if @australian_house.nil?

    house = case @australian_house
    when "representatives"
      "commons"
    when "senate"
      "lords"
    else
      raise "Unexpected value"
    end

    short_collective_name = case @australian_house
    when "senate"
      "Senators"
    when "representatives"
      "Representatives"
    else
      raise "Unexpected value"      
    end

    @long_collective_name = case @australian_house
    when "senate"
      "Senators"
    when "representatives"
      "Members of the House of Representatives"
    else
      raise "Unexpected value"      
    end

    if @sort == "rebellions"
      @short_title = "Rebel #{short_collective_name} &#8212; Current".html_safe
    else
      @short_title = "#{short_collective_name} &#8212; Current".html_safe
    end
    @title = @short_title + " &#8212; The Public Whip".html_safe

    order = case @sort
    when "lastname"
      ["last_name", "first_name"]
    when "constituency"
      ["constituency"]
    when "party"      
      ["party", "last_name", "first_name"]
    when "rebellions"
      ["rebellions_fraction DESC", "last_name", "first_name"]
    when "attendance"
      ["attendance_fraction DESC", "last_name", "first_name"]
    else
      raise "Unexpected value"
    end

    @members = Member.current.where(house: house).joins(:member_info).select("*, votes_attended/votes_possible as attendance_fraction, rebellions/votes_attended as rebellions_fraction").order(order)
  end

  def show
    @first_name = params[:mpn].split("_")[0]
    @last_name = params[:mpn].split("_")[1]
    @electorate = params[:mpc]
    @australian_house = params[:house]
    @uk_house = case @australian_house
    when "representatives"
      "commons"
    when "senate"
      "lords"
    else
      raise
    end
    @display = params[:display]

    # TODO In reality there could be several members matching this and we should relate this back to being
    # a single person
    if @electorate == "Senate"
      @member = Member.where(first_name: @first_name, last_name: @last_name, house: @uk_house).first
    else
      @member = Member.where(first_name: @first_name, last_name: @last_name, constituency: @electorate, house: @uk_house).first
    end
    if @display == "allfriends"
      name = @member.senator? ? @member.name : "#{@member.name} MP, #{@member.electorate}"
      @short_title = "Friends of #{name}"
    else
      name = @member.senator? ? "Senator #{@member.name}" : "#{@member.name} MP, #{@member.constituency}"
      @short_title = "Voting Record — #{name}"
    end
    @title = "#{@short_title} — The Public Whip"
  end
end
