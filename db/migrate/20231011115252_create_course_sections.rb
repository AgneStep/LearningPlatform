class CreateCourseSections < ActiveRecord::Migration[7.0]
  def change
    create_table :course_sections do |t|

      t.timestamps
    end
  end
end
