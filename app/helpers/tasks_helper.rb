module TasksHelper

  #タスクが完了している場合、"済"を表字する
  #タスクが未完了の場合、完了ボタンを表字する
  def kanryo_tag(task)
    result = ""
    if task.kanryo == true
      result = '済'
    else
      result = '<a class="btn btn-sm btn-primary" href="' + kanryo_task_path(task) + '">完了</a>'
    end
    #文字列をそのままhtmlタグとして出力
    result.html_safe
  end

  #期限（日付型）をYYYY/MM/DD形式の文字列で表示する
  def kigen_format(kigen)
    result = ""
    if kigen.present?
      result = kigen.strftime("%Y/%m/%d")
    end
    result
  end

end