class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :incoming
      t.integer :purely_untouched
      t.integer :touched_attempt
      t.integer :prospect
      t.integer :opportunity
      t.integer :nfa
      t.integer :nfa_prospect
      t.integer :nfa_opp
      t.integer :talk_time
      t.integer :total_call
      t.integer :out_ans
      t.integer :in_ans

      t.timestamps null: false
    end
  end
end
