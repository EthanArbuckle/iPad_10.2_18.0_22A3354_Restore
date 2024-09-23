@implementation HOHomePodProfileInstaller

- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[HOProfileInstaller dismissInstallProfileViewControllerWithAnimation:](self, "dismissInstallProfileViewControllerWithAnimation:", 0);
  -[HOProfileInstaller setBaseViewController:](self, "setBaseViewController:", v7);

  -[HOProfileInstaller setSenderURLString:](self, "setSenderURLString:", v6);
  -[HOHomePodProfileInstaller _showProfileInstallationFlow](self, "_showProfileInstallationFlow");
}

- (void)_showProfileInstallationFlow
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HOManagedConfigurationUtilities popProfileDataFromHeadOfInstallationQueue](HOManagedConfigurationUtilities, "popProfileDataFromHeadOfInstallationQueue"));
  -[HOProfileInstaller setProfileData:](self, "setProfileData:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller profileData](self, "profileData"));
  if (v4)
  {
    if (+[HOManagedConfigurationUtilities isProfileInstallationUIAllowed](HOManagedConfigurationUtilities, "isProfileInstallationUIAllowed"))
    {
      v5 = objc_alloc((Class)MCInstallProfileViewController);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller profileData](self, "profileData"));
      v17 = objc_msgSend(v5, "initWithProfileDataFromSettingsJump:", v6);

      -[HOProfileInstaller setInstallProfileViewController:](self, "setInstallProfileViewController:", v17);
      objc_msgSend(v17, "setDelegate:", self);
      v7 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller baseViewController](self, "baseViewController"));
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      v15 = sub_10000D5F8(CFSTR("HOProfileUINotAllowedTitle"));
      v17 = (id)objc_claimAutoreleasedReturnValue(v15);
      v16 = sub_10000D5F8(CFSTR("HOProfileUINotAllowedMessage"));
      v7 = (id)objc_claimAutoreleasedReturnValue(v16);
      -[HOProfileInstaller showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:](self, "showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:", v17, v7, 1);
    }

  }
  else
  {
    v9 = HFLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[HOHomePodProfileInstaller _showProfileInstallationFlow]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) popped profile data is nil", buf, 0xCu);
    }

    v11 = sub_10000D5F8(CFSTR("HOProfileDataNotFoundDisplayTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_10000D5F8(CFSTR("HOProfileDataNotFoundDisplayMessage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HOProfileInstaller showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:](self, "showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:", v12, v14, 1);

  }
}

- (void)installProfileWithCompletionHandler:(id)a3
{
  -[HOProfileInstaller setInstallProfileVCCompletionBlock:](self, "setInstallProfileVCCompletionBlock:", a3);
  -[HOHomePodProfileInstaller _startProfileInstallation](self, "_startProfileInstallation");
}

- (void)deviceProfileCompletedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("errorCode")));

  v6 = objc_msgSend(v5, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileVCCompletionBlock](self, "installProfileVCCompletionBlock"));

  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileVCCompletionBlock](self, "installProfileVCCompletionBlock"));
    v9[2](v9, 0);

  }
  if (v6)
  {
    v10 = HFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v7 == (id)-6723)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[HOHomePodProfileInstaller deviceProfileCompletedNotification:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) profile installation canceled", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_100078E70(v12, v20, v21);
    }

    -[HOProfileInstaller dismissInstallProfileViewControllerWithAnimation:shouldOpenSenderURL:](self, "dismissInstallProfileViewControllerWithAnimation:shouldOpenSenderURL:", 1, 1);
  }
  else
  {
    -[HOProfileInstaller setInstallProfileVCCompletionBlock:](self, "setInstallProfileVCCompletionBlock:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller profileData](self, "profileData"));
    v24 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v13, &v24));
    v15 = v24;

    if (objc_msgSend(v14, "needsReboot"))
    {
      v16 = sub_10000D5F8(CFSTR("HOProfileInstallHomePodRebootTitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = sub_10000D5F8(CFSTR("HOProfileInstallHomePodRebootMessage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      -[HOProfileInstaller showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:](self, "showProfileInstallationAlertViewWithTitle:message:shouldGoBackToSenderURL:", v17, v19, 0);

    }
    else if (v15)
    {
      v22 = HFLogForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100078DFC();

    }
    else
    {
      -[HOProfileInstaller openSenderURL](self, "openSenderURL");
    }

  }
}

- (void)_startProfileInstallation
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allHomesFuture"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100047BCC;
  v6[3] = &unk_1000B5DC8;
  v6[4] = self;
  v5 = objc_msgSend(v4, "addCompletionBlock:", v6);

}

- (void)_handleProfileInstallationForHome:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "hf_allHomePodsSupportRemoteProfileInstallation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_homePods"));
    -[HOHomePodProfileInstaller _presentHomePodSelectionAlertWithHomePods:](self, "_presentHomePodSelectionAlertWithHomePods:", v4);

  }
  else
  {
    -[HOHomePodProfileInstaller _presentManagedConfigurationProfileInstallation](self, "_presentManagedConfigurationProfileInstallation");
  }

}

- (void)_installProfileForHomePod:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HOHomePodProfileInstaller *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller profileData](self, "profileData"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047DB0;
  v7[3] = &unk_1000B78E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v6, "installManagedConfigurationProfileWithData:completionHandler:", v5, v7);

}

- (void)_installProfileForHomePods:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  _QWORD v7[5];
  NSMutableArray *v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048034;
  v7[3] = &unk_1000B8070;
  v7[4] = self;
  v8 = objc_opt_new(NSMutableArray);
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v5, "na_each:", v7);

}

- (void)_presentManagedConfigurationProfileInstallation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  const __CFString *v9;
  void *v10;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new(SFClient);
  v9 = CFSTR("profileData");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller profileData](self, "profileData"));
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000484C4;
  v6[3] = &unk_1000B8098;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "showDevicePickerWithInfo:completion:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_presentHomeSelectionAlertWithHomes:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = sub_10000D5F8(CFSTR("HOProfileInstallChooseHomeTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 1));

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_1000B80D8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004870C;
  v12[3] = &unk_1000B6728;
  v12[4] = self;
  v13 = v7;
  v8 = v7;
  objc_msgSend(v11, "na_each:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomePodProfileInstaller _cancelAction](self, "_cancelAction"));
  objc_msgSend(v8, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_presentHomePodSelectionAlertWithHomePods:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  HOHomePodProfileInstaller *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = sub_10000D5F8(CFSTR("HOProfileInstallChooseHomePodTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_10000D5F8(CFSTR("HOProfileInstallChooseHomePodMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

  v10 = sub_10000D5F8(CFSTR("HOProfileInstallAlertAllButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000489A0;
  v24[3] = &unk_1000B78C0;
  v24[4] = self;
  v25 = v4;
  v12 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v24));

  objc_msgSend(v9, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingComparator:", &stru_1000B80F8));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100048A18;
  v21 = &unk_1000B8120;
  v22 = self;
  v23 = v9;
  v15 = v9;
  objc_msgSend(v14, "na_each:", &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomePodProfileInstaller _cancelAction](self, "_cancelAction", v18, v19, v20, v21, v22));
  objc_msgSend(v15, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)_presentCompletionAlert
{
  __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = sub_10000D5F8(CFSTR("HOProfileInstallCompletedTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1));

  v6 = sub_10000D5F8(CFSTR("HOProfileInstallAlertOKButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100048BF0;
  v10[3] = &unk_1000B6140;
  v10[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v10));
  objc_msgSend(v5, "addAction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  objc_msgSend(v9, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_presentErrorAlert
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = sub_10000D5F8(CFSTR("HOProfileHomePodSearchFailedTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_10000D5F8(CFSTR("HOProfileHomePodSearchFailedMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v8 = sub_10000D5F8(CFSTR("HOProfileInstallAlertOKButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100048D24;
  v12[3] = &unk_1000B6140;
  v12[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v12));
  objc_msgSend(v7, "addAction:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  objc_msgSend(v11, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_presentPartialErrorAlertForHomePods:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v4 = a3;
  v5 = sub_10000D5F8(CFSTR("HOProfileHomePodsInstallFailedMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%lu"), &v24, objc_msgSend(v4, "count")));
  v8 = v24;

  if (objc_msgSend(v4, "count") == (id)1)
  {
    v9 = sub_10000D5F8(CFSTR("HOProfileHomePodInstallFailedMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v23 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_displayName"));
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), &v23, v12));
    v14 = v23;

    v7 = (void *)v13;
    v8 = v14;
  }
  v15 = sub_10000D5F8(CFSTR("HOProfileInstallCompletedTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v7, 1));

  v18 = sub_10000D5F8(CFSTR("HOProfileInstallAlertOKButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100048F5C;
  v22[3] = &unk_1000B6140;
  v22[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, v22));
  objc_msgSend(v17, "addAction:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  objc_msgSend(v21, "presentViewController:animated:completion:", v17, 1, 0);

}

- (id)_cancelAction
{
  __CFString *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = sub_10000D5F8(CFSTR("HOProfileInstallAlertCancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100049008;
  v7[3] = &unk_1000B6140;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 1, v7));

  return v5;
}

@end
