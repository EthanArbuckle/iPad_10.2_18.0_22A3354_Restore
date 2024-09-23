@implementation RAPPrivacyViewController

- (RAPPrivacyViewController)initWithUserEnteredEmailAddress:(id)a3
{
  id v5;
  RAPPrivacyViewController *v6;
  RAPPrivacyViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPrivacyViewController;
  v6 = -[RAPPrivacyViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userEnteredEmailAddress, a3);

  return v7;
}

- (void)presentPrivacyScreenForShortcutType:(int64_t)a3 completion:(id)a4
{
  id v6;
  _RAPPrivacyInformationController *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a4;
  v7 = -[_RAPPrivacyInformationController initWithShortcutType:completion:]([_RAPPrivacyInformationController alloc], "initWithShortcutType:completion:", a3, v6);
  objc_initWeak(&location, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BBF480;
  v9[3] = &unk_1011BD1E0;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  -[_RAPPrivacyInformationController setCompletion:](v7, "setCompletion:", v9);
  -[RAPPrivacyViewController _presentPrivacyController:](self, "_presentPrivacyController:", v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)presentPrivacyScreen:(id)a3
{
  id v4;
  NSString *userEnteredEmailAddress;
  NSString *v6;
  id v7;
  NSString *v8;
  RAPReportComposerNavigationController *v9;
  _RAPPrivacyInformationController *v10;
  void *v11;
  _RAPPrivacyInformationController *v12;

  v4 = a3;
  userEnteredEmailAddress = self->_userEnteredEmailAddress;
  if (userEnteredEmailAddress)
  {
    v6 = userEnteredEmailAddress;
  }
  else
  {
    v7 = sub_1003DDA94();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;
  v9 = objc_alloc_init(RAPReportComposerNavigationController);
  v10 = -[_RAPPrivacyInformationController initWithCompletion:emailAddress:isUserEnteredEmailAddress:]([_RAPPrivacyInformationController alloc], "initWithCompletion:emailAddress:isUserEnteredEmailAddress:", v4, v8, userEnteredEmailAddress != 0);
  v12 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  -[RAPReportComposerNavigationController setViewControllers:](v9, "setViewControllers:", v11);

  -[RAPPrivacyViewController _presentPrivacyController:](self, "_presentPrivacyController:", v9);
}

- (void)_presentPrivacyController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyWindow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
  if (v6)
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
      v5 = v7;
    }
    while (v8);
  }
  else
  {
    v7 = v5;
  }
  v9 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0 && sub_1002A8AA0(v7) == 5)
  {
    objc_msgSend(v14, "setModalPresentationStyle:", 2);
    objc_msgSend(v14, "setModalInPresentation:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_mapsSceneDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rapPresenter"));
    objc_msgSend(v11, "presentViewController:animated:", v14, 1);

  }
  else if (objc_msgSend(v7, "isViewLoaded"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));

    if (v13)
    {
      objc_msgSend(v14, "setModalPresentationStyle:", 2);
      objc_msgSend(v14, "setModalInPresentation:", 1);
      objc_msgSend(v7, "presentViewController:animated:completion:", v14, 1, 0);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEnteredEmailAddress, 0);
}

@end
