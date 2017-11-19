Rails.application.routes.draw do
  #アプリケーションのルートディレクトリのページを決定
  root to: "tasks#index"
  #tasksコントローラーの7つのアクションを作成する
  resources :tasks do
    member do
      #一覧画面 完了ボタン押下時のアクション
      get "kanryo"
    end
  end
end
