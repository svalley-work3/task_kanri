class Task < ApplicationRecord

  #期限のアクセサー（画面入力用）
  attr_accessor :kigen_str

  #kanryo（文字列）の値がある場合、絞込みを行う
  scope :by_kanryo, ->(kanryo){
    if kanryo.present?
      #bool型の変数
      kanryo_bool = true
      if kanryo == "true"
        kanryo_bool = true
      else
        kanryo_bool = false
      end
      where('kanryo = ?', kanryo_bool)
    end
  }

  validate :check_name
  validate :check_shosai
  validate :check_kigen_str

  private

  #nameのバリデーション
  def check_name
    if !name.present?
      errors.add("タスク","を入力してください")
    elsif name.length > 20
      errors.add("タスク","は20文字以内で入力してください")
    end
  end

  #shosaiのバリデーション
  def check_shosai
    if shosai.present? && shosai.length > 100
      errors.add("タスク詳細","は100文字以内で入力してください")
    end
  end

  #kigen_strのバリデーション
  def check_kigen_str
    if kigen_str.present? && !is_yyyymmdd?(kigen_str)
      errors.add("期限","のフォーマットが不正です")
    end
  end

  #文字列がyyyyMMdd型であるか
  def is_yyyymmdd?(yyyymmdd)
    if !yyyymmdd.present?
      return false
    end
    if yyyymmdd.length != 8
      return false
    end
    if !(yyyymmdd =~ /^[0-9]+$/)
      return false
    end

    result = true
    begin
      yyyy = yyyymmdd[0..3].to_i
      mm = yyyymmdd[4..5].to_i
      dd = yyyymmdd[6..7].to_i
      Date.new(yyyy,mm,dd)
    rescue
      result = false
    end
    result
  end

end