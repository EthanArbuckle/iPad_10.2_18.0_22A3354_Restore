@implementation HOProfileInstaller

- (HOProfileInstaller)init
{
  HOProfileInstaller *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOProfileInstaller;
  v2 = -[HOProfileInstaller init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "deviceProfileCompletedNotification:", CFSTR("com.apple.sharing.DeviceProfile"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HOProfileInstaller;
  -[HOProfileInstaller dealloc](&v4, "dealloc");
}

- (void)showProfileInstallationAlertViewWithTitle:(id)a3 message:(id)a4 shouldGoBackToSenderURL:(BOOL)a5
{
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v19 = a3;
  v20 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v19));
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = CFSTR("HOProfileInstallAlertOKButton");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HOProfileInstallAlertOKButton"), CFSTR("_"), CFSTR("HOLocalizable")));

  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v8))
  {
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = sub_1000471FC();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("HOProfileInstallAlertOKButton"), CFSTR("HOProfileInstallAlertOKButton"), v14));

        if (!-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("HOProfileInstallAlertOKButton")))break;
        if (v11 == (id)++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v16 = CFSTR("_");
    }

  }
  else
  {
    v16 = v8;
  }
  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v16))
    NSLog(CFSTR("Sensitive key '%@' not found!"), CFSTR("HOProfileInstallAlertOKButton"));
  else
    v7 = v16;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100046A10;
  v24[3] = &unk_1000B7F98;
  objc_copyWeak(&v25, &location);
  v26 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v24));

  objc_msgSend(v23, "addAction:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller baseViewController](self, "baseViewController"));
  objc_msgSend(v18, "presentViewController:animated:completion:", v23, 1, 0);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)openSenderURL
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller senderURLString](self, "senderURLString"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[HOProfileInstaller senderURLString](self, "senderURLString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller senderURLString](self, "senderURLString"));
    v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("://"));

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller senderURLString](self, "senderURLString"));
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://"), v8));

      v5 = v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = objc_msgSend(v11, "canOpenURL:", v10);

    if (v12)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100046D6C;
      v28[3] = &unk_1000B6DB8;
      v28[4] = self;
      objc_msgSend(v13, "openURL:withCompletionHandler:", v10, v28);
LABEL_6:

LABEL_18:
      goto LABEL_19;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v27 = 0;
    v16 = objc_msgSend(v15, "openURL:withOptions:error:", v10, 0, &v27);
    v17 = v27;

    if ((v16 & 1) == 0)
    {
      v18 = HFLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_100078CFC();
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[HOProfileInstaller openSenderURL]";
        v31 = 2112;
        v32 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(%s) url %@ could not be opened, trying sensitive URL", buf, 0x16u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v26 = v17;
      v22 = objc_msgSend(v21, "openSensitiveURL:withOptions:error:", v10, 0, &v26);
      v13 = v26;

      if ((v22 & 1) == 0)
      {
        v23 = HFLogForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        if (v13)
        {
          if (v25)
            sub_100078C90();
        }
        else if (v25)
        {
          sub_100078C1C();
        }

        goto LABEL_6;
      }
      v17 = v13;
    }

    goto LABEL_18;
  }
  v14 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100078B9C(v5);
LABEL_19:

}

- (void)showProfileInstallationFlowFromViewController:(id)a3 withSenderURLString:(id)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOProfileInstaller.m"), 118, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HOProfileInstaller showProfileInstallationFlowFromViewController:withSenderURLString:]", objc_opt_class(self));

}

- (void)deviceProfileCompletedNotification:(id)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOProfileInstaller.m"), 125, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HOProfileInstaller deviceProfileCompletedNotification:]", objc_opt_class(self));

}

- (void)showRebootAlertAndReboot
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOProfileInstaller.m"), 133, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HOProfileInstaller showRebootAlertAndReboot]", objc_opt_class(self));

}

- (void)installProfileWithCompletionHandler:(id)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOProfileInstaller.m"), 139, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HOProfileInstaller installProfileWithCompletionHandler:]", objc_opt_class(self));

}

- (BOOL)isInstallNavigationControllerPresented
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));
  v5 = v4 != 0;

  return v5;
}

- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3
{
  -[HOProfileInstaller dismissInstallProfileViewControllerWithAnimation:shouldOpenSenderURL:](self, "dismissInstallProfileViewControllerWithAnimation:shouldOpenSenderURL:", a3, 0);
}

- (void)dismissInstallProfileViewControllerWithAnimation:(BOOL)a3 shouldOpenSenderURL:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileVCCompletionBlock](self, "installProfileVCCompletionBlock"));

    if (v9)
    {
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileVCCompletionBlock](self, "installProfileVCCompletionBlock"));
      v10[2](v10, 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOProfileInstaller installProfileViewController](self, "installProfileViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navigationController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentingViewController"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100047108;
    v14[3] = &unk_1000B7F70;
    v14[4] = self;
    v15 = a4;
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v5, v14);

  }
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setBaseViewController:(id)a3
{
  objc_storeStrong((id *)&self->_baseViewController, a3);
}

- (NSString)senderURLString
{
  return self->_senderURLString;
}

- (void)setSenderURLString:(id)a3
{
  objc_storeStrong((id *)&self->_senderURLString, a3);
}

- (MCInstallProfileViewController)installProfileViewController
{
  return self->_installProfileViewController;
}

- (void)setInstallProfileViewController:(id)a3
{
  objc_storeStrong((id *)&self->_installProfileViewController, a3);
}

- (id)installProfileVCCompletionBlock
{
  return self->_installProfileVCCompletionBlock;
}

- (void)setInstallProfileVCCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_installProfileVCCompletionBlock, 0);
  objc_storeStrong((id *)&self->_installProfileViewController, 0);
  objc_storeStrong((id *)&self->_senderURLString, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
}

@end
