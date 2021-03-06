require 'spec_helper'
# Compare results of rendering pages via rails and via the old php app

describe DivisionsController, :type => :request do
  include HTMLCompareHelper
  fixtures :all

  describe "#show" do
    it {compare_static("/division.php?date=2013-03-14&number=1")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allvotes")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allpossible")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=policies", false, false, "_2")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=policies", false, false, "_2")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=policies", false, false, "_2")}
    it {compare_static("/division.php?date=2013-03-14&number=1&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allvotes&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allpossible&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible&sort=name")}
    it {compare_static("/division.php?date=2013-03-14&number=1&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allvotes&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allpossible&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible&sort=vote")}
    it {compare_static("/division.php?date=2013-03-14&number=1&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allvotes&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&display=allpossible&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible&sort=constituency")}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible&sort=constituency")}

    it {compare_static("/division.php?date=2006-12-06&number=3&house=representatives")}
    # house=representatives or house=senate appears twice. This is obviously wrong
    it {compare_static("/division.php?date=2006-12-06&number=3&mpn=Tony_Abbott&mpc=Warringah&house=representatives&house=representatives")}
    it {compare_static("/division.php?date=2006-12-06&number=3&mpn=Kevin_Rudd&mpc=Griffith&house=representatives&house=representatives")}
    it {compare_static("/division.php?date=2013-03-14&number=1&mpn=Christine_Milne&mpc=Senate&house=senate&house=senate")}

    it {compare_static("/division.php?date=2013-03-14&number=1&display=policies", true)}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=representatives&display=policies", true)}
    it {compare_static("/division.php?date=2013-03-14&number=1&house=senate&display=policies", true)}
    it {compare_static("/division.php?date=2009-11-25&number=8&house=senate&display=policies", true)}
    it {compare_static("/division.php?date=2009-11-25&number=8&house=senate&display=policies&dmp=2", true)}
    it {compare_static("/division.php?date=2009-11-25&number=8&house=senate&display=policies&dmp=1", true)}
    it {compare_static("/division.php?date=2006-12-06&number=3&display=policies", true)}
  end

  describe "#index" do
    it {compare_static("/divisions.php")}
    it {compare_static("/divisions.php?rdisplay=2007")}
    it {compare_static("/divisions.php?rdisplay=2004")}
    it {compare_static("/divisions.php?rdisplay=all")}
    it {compare_static("/divisions.php?rdisplay2=rebels")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels")}
    it {compare_static("/divisions.php?house=representatives")}
    it {compare_static("/divisions.php?rdisplay=2007&house=representatives")}
    it {compare_static("/divisions.php?rdisplay=2004&house=representatives")}
    it {compare_static("/divisions.php?rdisplay=all&house=representatives")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=representatives")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives")}
    it {compare_static("/divisions.php?house=senate")}
    it {compare_static("/divisions.php?rdisplay=2007&house=senate")}
    it {compare_static("/divisions.php?rdisplay=2004&house=senate")}
    it {compare_static("/divisions.php?rdisplay=all&house=senate")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=senate")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate")}

    it {compare_static("/divisions.php?sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&sort=subject")}
    it {compare_static("/divisions.php?rdisplay2=rebels&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=subject")}
    it {compare_static("/divisions.php?house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=subject")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=subject")}

    it {compare_static("/divisions.php?sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay2=rebels&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=rebellions")}
    it {compare_static("/divisions.php?house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=rebellions")}

    it {compare_static("/divisions.php?sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay2=rebels&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=turnout")}
    it {compare_static("/divisions.php?house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay2=rebels&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=turnout")}

    it {compare_static("/divisions.php?rdisplay2=Australian%20Labor%20Party_party&house=representatives")}
    it {compare_static("/divisions.php?rdisplay2=Liberal%20Party_party&house=representatives")}
    it {compare_static("/divisions.php?rdisplay2=Australian%20Greens_party&house=senate")}

    it {compare_static("/divisions.php?rdisplay2=Australian%20Labor%20Party_party&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay2=Liberal%20Party_party&house=representatives&sort=subject")}
    it {compare_static("/divisions.php?rdisplay2=Australian%20Greens_party&house=senate&sort=subject")}

    it {compare_static("/divisions.php?rdisplay2=Australian%20Labor%20Party_party&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay2=Liberal%20Party_party&house=representatives&sort=rebellions")}
    it {compare_static("/divisions.php?rdisplay2=Australian%20Greens_party&house=senate&sort=rebellions")}

    it {compare_static("/divisions.php?rdisplay2=Australian%20Labor%20Party_party&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay2=Liberal%20Party_party&house=representatives&sort=turnout")}
    it {compare_static("/divisions.php?rdisplay2=Australian%20Greens_party&house=senate&sort=turnout")}

    it {compare_static("/divisions.php?rdisplay=2007&rdisplay2=Australian%20Labor%20Party_party&house=representatives")}
  end

  describe '#edit' do
    it { compare_static '/account/wiki.php?type=motion&date=2009-11-25&number=8&house=senate&rr=%2Fdivision.php%3Fdate%3D2009-11-25%26number%3D8%26house%3Dsenate', true }
    it { compare_static '/account/wiki.php?type=motion&date=2013-03-14&number=1&house=representatives&rr=%2Fdivision.php%3Fdate%3D2013-03-14%26number%3D1%26house%3Drepresentatives', true }
  end

  describe '#update' do
    it { compare_static '/account/wiki.php?type=motion&date=2009-11-25&number=8&house=senate&rr=%2Fdivision.php%3Fdate%3D2009-11-25%26number%3D8%26house%3Dsenate', true, {submit: 'Save', newtitle: 'A lovely new title', newdescription: 'And a great new description'}, "_2" }
    it { compare_static '/account/wiki.php?type=motion&date=2009-11-25&number=8&house=senate', true, submit: 'Save', newtitle: 'A lovely new title', newdescription: 'And a great new description' }
  end

  describe '#add_policy_vote' do
    describe 'makes no changes' do
      it {compare_static '/division.php?date=2006-12-06&number=3&display=policies&dmp=2', true, submit: 'Update', vote2: 'no'}
      it {compare_static '/division.php?date=2009-11-25&number=8&house=senate&display=policies&dmp=2', true, {submit: 'Update', vote2: '--'}, "_2"}
    end

    it 'updates an existing policy division' do
      compare_static '/division.php?date=2013-03-14&number=1&house=senate&display=policies&dmp=2', true, submit: 'Update', vote2: 'aye3'
    end

    describe 'creates a new policy division' do
      it {compare_static '/division.php?date=2013-03-14&number=1&display=policies&dmp=2', true, submit: 'Update', vote2: 'aye3'}
      it {compare_static '/division.php?date=2013-03-14&number=1&house=senate&display=policies&dmp=1', true, submit: 'Update', vote1: 'aye3'}
    end

    it 'removes a policy division' do
      compare_static('/division.php?date=2013-03-14&number=1&dmp=1&display=policies', true, submit: 'Update', vote1: '--')
    end

    it 'recalculates MP agreement percentages' do
      # Just post to Rails
      compare_static '/division.php?date=2013-03-14&number=1&house=senate&display=policies&dmp=2', true, submit: 'Update', vote2: 'aye3'
      # Rails does the recalculation in a background job so make sure that's done
      Delayed::Worker.new.work_off
      # Compare Rails what the PHP app would generate (because it would rebuild it's cache)
      compare_static '/mp.php?mpn=Christine_Milne&mpc=Senate&house=senate', true
    end
  end
end
