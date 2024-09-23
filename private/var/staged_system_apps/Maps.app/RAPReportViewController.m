@implementation RAPReportViewController

- (RAPReportViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPReportViewController *v11;
  RAPReportViewControllerDelegate *v12;
  RAPReportViewControllerDelegate *rapDelegate;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPReportViewController;
  v11 = -[RAPReportViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  if (v11)
  {
    v12 = -[RAPReportViewControllerDelegate initWithReport:completion:delegate:]([RAPReportViewControllerDelegate alloc], "initWithReport:completion:delegate:", v8, v10, v11);
    rapDelegate = v11->_rapDelegate;
    v11->_rapDelegate = v12;

    if (v9)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedTitle"));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[RAPQuestion RAPTitle](RAPQuestion, "RAPTitle"));
    v15 = (void *)v14;
    -[RAPReportViewController setTitle:](v11, "setTitle:", v14);

  }
  return v11;
}

- (UIBarButtonItem)sendButtonItem
{
  return -[RAPReportViewControllerDelegate sendButtonItem](self->_rapDelegate, "sendButtonItem");
}

- (RAPReport)report
{
  return -[RAPReportViewControllerDelegate report](self->_rapDelegate, "report");
}

- (id)completion
{
  return -[RAPReportViewControllerDelegate completion](self->_rapDelegate, "completion");
}

- (void)invokeCompletionWithOutcome:(int64_t)a3
{
  -[RAPReportViewControllerDelegate invokeCompletionWithOutcome:](self->_rapDelegate, "invokeCompletionWithOutcome:", a3);
}

- (void)_send
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportViewController view](self, "view"));
  objc_msgSend(v3, "endEditing:", 1);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1009F7064;
  v4[3] = &unk_1011BD0B8;
  v4[4] = self;
  +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 1, v4);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoPart, 0);
  objc_storeStrong((id *)&self->_rapDelegate, 0);
}

@end
