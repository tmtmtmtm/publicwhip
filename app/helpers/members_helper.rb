module MembersHelper
  def member_path2(member, params = {})
    member_path(params.merge({
        mpn: member.url_name,
        mpc: member.url_electorate,
        house: member.australian_house
      }))
  end

  def members_path2(params)
    p = ""
    p += "&parliament=#{params[:parliament]}" if params[:parliament]
    p += "&house=#{params[:house]}" if params[:house]
    p += "&sort=#{params[:sort]}"
    r = "/mps.php"
    r += "?" + p[1..-1] if p != ""
    r
  end

  def members_nav_link(member, members, display, name, title, active, policy = nil)
    params = {display: display}
    params = params.merge(dmp: policy.id) if policy
    content_tag(:li, class: ("active" if active)) do
      link_to name, member_path2(member, params), title: title
    end
  end

  def vote_records_start_date(member)
    # HACK WARNING
    formatted_date([member.entered_house, Date.new(2006,1,1)].max, true)
  end

  def member_until(member)
    member.left_house > Date.today ? 'still in office' : formatted_date(member.left_house, true)
  end

  def vote_class(vote)
    if vote.nil?
      ""
    elsif vote.rebellion?
      "rebel"
    else
      ""
    end
  end
end
