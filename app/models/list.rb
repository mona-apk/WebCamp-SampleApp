class List < ApplicationRecord
  #refileが指定のカラムにアクセスするために必要
  #カラム名はimage+_idなので注意
  attachment :image
end
