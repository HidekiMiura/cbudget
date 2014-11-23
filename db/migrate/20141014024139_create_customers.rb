class CreateCustomers < ActiveRecord::Migration                         
  def change                         
    create_table :customers do |t|                         
      t.string     :email,null:false            # メールアドレス       
      t.string     :email_for_index,null:false  # 索引用メールアドレス       
      t.string     :nickname,null:false         # ニックネーム       
      t.string     :family_name,null:false      # 氏       
      t.string     :given_name,null:false       # 名       
      t.string     :family_name_kana,null:false # 氏（カナ）       
      t.string     :given_name_kana,null:false  # 名（カナ）       
      t.string     :gender                      # 性別       
      t.string     :hashed_password             # パスワード
      t.date       :birthday                    # 誕生日       
      
      t.timestamps       
    end                         
 add_index :customers, :email_for_index,unique:true    
 add_index :customers, [ :family_name_kana, :given_name_kana ]    
  end                         
end                         
