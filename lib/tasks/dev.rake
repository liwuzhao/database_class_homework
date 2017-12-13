namespace :dev do
  task :fake_people => :environment do

    age_arr = []
    (18..80).each do |i|
      age_arr << i
    end

    work_position_arr = %w(辅导员 院长 系主任 班主任 教师 书记)
    title_arr = %w(助教 讲师 副教授 教授)
    political_status_arr = %w(党员 群众)
    education_arr = %w(本科 硕士 博士)

    100.times do |i|
      puts "第#{i}个人员"
      Person.create(
        number: Faker::Number.unique.number(6),
        name: Faker::Name.unique.name,
        sex: ["男","女"].sample,
        age: age_arr.sample,
        work_position: work_position_arr.sample,
        title: title_arr.sample,
        political_status: political_status_arr.sample,
        education: education_arr.sample,
        working_time: Faker::Time.between(20.years.ago, Date.today, :all),
        come_university_time: Faker::Time.between(20.days.ago, Date.today, :all),
        category_id: [1,2,3,4,5].sample
      )
    end
  end



end
