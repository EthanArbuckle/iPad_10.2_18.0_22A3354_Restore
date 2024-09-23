@implementation RAPReportViewControllerDelegate

- (RAPReportViewControllerDelegate)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  RAPReportViewControllerDelegate *v10;
  RAPReportViewControllerDelegate *v11;
  id v12;
  id completion;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportViewControllerDelegate;
  v10 = -[RAPReportViewControllerDelegate init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_report, a3);
    v12 = objc_msgSend(v9, "copy");
    completion = v11->_completion;
    v11->_completion = v12;

  }
  return v11;
}

- (RAPReportViewControllerDelegate)initWithReport:(id)a3 completion:(id)a4 delegate:(id)a5
{
  id v8;
  RAPReportViewControllerDelegate *v9;
  RAPReportViewControllerDelegate *v10;
  id v11;
  uint64_t v12;
  char isKindOfClass;
  id WeakRetained;
  void *v15;

  v8 = a5;
  v9 = -[RAPReportViewControllerDelegate initWithReport:question:completion:](self, "initWithReport:question:completion:", a3, 0, a4);
  v10 = v9;
  if (v9)
  {
    v11 = objc_storeWeak((id *)&v9->_delegate, v8);
    v12 = objc_opt_class(UIViewController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v12);

    if ((isKindOfClass & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[RAPQuestion RAPTitle](RAPQuestion, "RAPTitle"));
      objc_msgSend(WeakRetained, "setTitle:", v15);

    }
  }

  return v10;
}

- (void)invokeCompletionWithOutcome:(int64_t)a3
{
  void (**completion)(id, id, int64_t);
  id WeakRetained;

  completion = (void (**)(id, id, int64_t))self->_completion;
  if (completion)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    completion[2](completion, WeakRetained, a3);

  }
}

- (UIBarButtonItem)sendButtonItem
{
  UIBarButtonItem *sendButtonItem;
  id WeakRetained;
  RAPReportViewControllerDelegate *v5;
  RAPReportViewControllerDelegate *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  RAPReport *report;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *v14;
  _QWORD v16[4];
  UIBarButtonItem *v17;

  sendButtonItem = self->_sendButtonItem;
  if (!sendButtonItem)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "_send") & 1) != 0)
      v5 = (RAPReportViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
    else
      v5 = self;
    v6 = v5;

    v7 = objc_alloc((Class)UIBarButtonItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Submit"), CFSTR("localized string not found"), 0));
    v10 = objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, v6, "_send");

    objc_msgSend(v10, "setEnabled:", -[RAPReport canCreateSubmittableProblem](self->_report, "canCreateSubmittableProblem"));
    report = self->_report;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1009F3D68;
    v16[3] = &unk_1011DF3D8;
    v12 = (UIBarButtonItem *)v10;
    v17 = v12;
    -[RAPReport addObserver:changeHandler:](report, "addObserver:changeHandler:", self, v16);
    v13 = self->_sendButtonItem;
    self->_sendButtonItem = v12;
    v14 = v12;

    sendButtonItem = self->_sendButtonItem;
  }
  return sendButtonItem;
}

- (RAPUserInfoPart)userInfoPart
{
  RAPUserInfoPart *userInfoPart;
  RAPUserInfoPart *v4;
  RAPUserInfoPart *v5;

  userInfoPart = self->_userInfoPart;
  if (!userInfoPart)
  {
    v4 = objc_alloc_init(RAPUserInfoPart);
    v5 = self->_userInfoPart;
    self->_userInfoPart = v4;

    userInfoPart = self->_userInfoPart;
  }
  return userInfoPart;
}

- (void)_send
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1009F3E34;
  v2[3] = &unk_1011BD0B8;
  v2[4] = self;
  +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 1, v2);
}

- (void)dealloc
{
  objc_super v3;

  -[RAPReport removeObserver:](self->_report, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RAPReportViewControllerDelegate;
  -[RAPReportViewControllerDelegate dealloc](&v3, "dealloc");
}

- (RAPReport)report
{
  return self->_report;
}

- (id)completion
{
  return self->_completion;
}

- (RAPReportViewControllerProtocol)delegate
{
  return (RAPReportViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoPart, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
