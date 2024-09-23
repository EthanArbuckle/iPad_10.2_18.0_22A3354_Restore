@implementation PSUIAppInstallLockupViewCell

- (PSUIAppInstallLockupViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSUIAppInstallLockupViewCell *v9;
  uint64_t v10;
  NSString *openAppURL;
  uint64_t v12;
  NSString *appId;
  uint64_t v14;
  NSString *analyticsEventForApp;
  uint64_t v16;
  NSNumber *analyticsEventDetailsCode;
  NSObject *v18;
  NSString *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAppInstallLockupViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v21, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", CFSTR("PSUIAppOpenURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    openAppURL = v9->_openAppURL;
    v9->_openAppURL = (NSString *)v10;

    objc_msgSend(v8, "propertyForKey:", CFSTR("PSUIAppId"));
    v12 = objc_claimAutoreleasedReturnValue();
    appId = v9->_appId;
    v9->_appId = (NSString *)v12;

    objc_msgSend(v8, "propertyForKey:", CFSTR("PSUIAnalyticsEventForApp"));
    v14 = objc_claimAutoreleasedReturnValue();
    analyticsEventForApp = v9->_analyticsEventForApp;
    v9->_analyticsEventForApp = (NSString *)v14;

    objc_msgSend(v8, "propertyForKey:", CFSTR("PSUIAnalyticsEventDetailsCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    analyticsEventDetailsCode = v9->_analyticsEventDetailsCode;
    v9->_analyticsEventDetailsCode = (NSNumber *)v16;

    if (!v9->_analyticsEventDetailsCode)
      v9->_analyticsEventDetailsCode = (NSNumber *)&unk_24D51C428;
    -[PSUIAppInstallLockupViewCell _setupView](v9, "_setupView");
    -[PSUIAppInstallLockupViewCell getLogger](v9, "getLogger");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v9->_appId;
      *(_DWORD *)buf = 136315394;
      v23 = "-[PSUIAppInstallLockupViewCell initWithStyle:reuseIdentifier:specifier:]";
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "%s appId:%@", buf, 0x16u);
    }

  }
  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSUIAppInstallLockupViewCell;
  -[PSTableCell layoutSubviews](&v14, sel_layoutSubviews);
  -[PSUIAppInstallLockupViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSTableCell setCellEnabled:](self, "setCellEnabled:", 1);
  -[PSUIAppInstallLockupViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLayoutMargins:", 8.0, 15.0, 8.0, 12.0);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v13 = (void *)MEMORY[0x24BDD1628];
  -[PSUIAppInstallLockupViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  -[PSUIAppInstallLockupViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  -[PSUIAppInstallLockupViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v11);

  v20.receiver = self;
  v20.super_class = (Class)PSUIAppInstallLockupViewCell;
  -[PSUIAppInstallLockupViewCell updateConstraints](&v20, sel_updateConstraints);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_setupView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x24BE04480]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[PSUIAppInstallLockupViewCell setLockupView:](self, "setLockupView:", v4);

  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = *MEMORY[0x24BE04440];
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLockupSize:", v7);

  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE04450]), "initWithStringValue:", self->_appId);
  v9 = objc_alloc(MEMORY[0x24BE04478]);
  v10 = (void *)objc_msgSend(v9, "_initWithID:kind:context:clientID:", v14, *MEMORY[0x24BE04430], *MEMORY[0x24BE04420], CFSTR("SettingsView"));
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequest:", v10);

  -[PSUIAppInstallLockupViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAppInstallLockupViewCell lockupView](self, "lockupView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[PSUIAppInstallLockupViewCell layoutSubviews](self, "layoutSubviews");
}

- (void)openButtonAction
{
  void *v3;
  NSString *openAppURL;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *analyticsEventForApp;
  NSNumber *analyticsEventDetailsCode;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char);
  void *v17;
  PSUIAppInstallLockupViewCell *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  openAppURL = self->_openAppURL;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](openAppURL, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[PSUIAppInstallLockupViewCell openButtonAction]";
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s for URL: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __48__PSUIAppInstallLockupViewCell_openButtonAction__block_invoke;
  v17 = &unk_24D502280;
  v18 = self;
  v10 = v7;
  v19 = v10;
  objc_msgSend(v9, "openURL:options:completionHandler:", v10, MEMORY[0x24BDBD1B8], &v14);

  analyticsEventForApp = self->_analyticsEventForApp;
  if (analyticsEventForApp)
  {
    v20[0] = 0x24D508488;
    v20[1] = 0x24D5084A8;
    analyticsEventDetailsCode = self->_analyticsEventDetailsCode;
    v21[0] = CFSTR("OpenSupportApp");
    v21[1] = analyticsEventDetailsCode;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PSAnalyticsSendEvent_0(analyticsEventForApp, v13);

  }
}

void __48__PSUIAppInstallLockupViewCell_openButtonAction__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_2161C6000, v3, OS_LOG_TYPE_ERROR, "Could not open URL: %@!!", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)installButtonAction
{
  NSObject *v3;
  NSString *appId;
  NSString *analyticsEventForApp;
  NSNumber *analyticsEventDetailsCode;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    appId = self->_appId;
    *(_DWORD *)buf = 136315650;
    v11 = "-[PSUIAppInstallLockupViewCell installButtonAction]";
    v12 = 2112;
    v13 = appId;
    v14 = 1024;
    v15 = installButtonAction_installStarted;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s appId:%@ installStarted=%d", buf, 0x1Cu);
  }

  analyticsEventForApp = self->_analyticsEventForApp;
  if (analyticsEventForApp && (installButtonAction_installStarted & 1) == 0)
  {
    v8[0] = 0x24D508488;
    v8[1] = 0x24D5084A8;
    analyticsEventDetailsCode = self->_analyticsEventDetailsCode;
    v9[0] = CFSTR("InstallSupportApp");
    v9[1] = analyticsEventDetailsCode;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PSAnalyticsSendEvent_0(analyticsEventForApp, v7);

  }
  installButtonAction_installStarted = 1;
}

- (void)lockupViewFailed:(id)a3
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleLockupViewFailure:", v4);

}

- (void)lockupViewDidBeginRequest:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PSUIAppInstallLockupViewCell lockupViewDidBeginRequest:]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)lockupViewDidFinishRequest:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PSUIAppInstallLockupViewCell lockupViewDidFinishRequest:]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PSUIAppInstallLockupViewCell lockupView:didFailRequestWithError:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s with error: %@", (uint8_t *)&v7, 0x16u);
  }

  -[PSUIAppInstallLockupViewCell lockupViewFailed:](self, "lockupViewFailed:", v5);
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[PSUIAppInstallLockupViewCell lockupView:appStateDidChange:]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x24BE043E0]) & 1) != 0
    || objc_msgSend(v7, "isEqual:", *MEMORY[0x24BE043E8]))
  {
    v9 = (void *)MEMORY[0x24BE04498];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_24D5028C8, CFSTR("AppInstallCell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textMetadataWithTitle:subtitle:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BE04468]);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__PSUIAppInstallLockupViewCell_lockupView_appStateDidChange___block_invoke;
    v17[3] = &unk_24D501660;
    v17[4] = self;
    v14 = (void *)objc_msgSend(v13, "initWithMetadata:action:", v12, v17);
    objc_msgSend(v6, "lockup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lockupWithOffer:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLockup:", v16);

  }
  else if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BE043D8]))
  {
    -[PSUIAppInstallLockupViewCell installButtonAction](self, "installButtonAction");
  }

}

uint64_t __61__PSUIAppInstallLockupViewCell_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openButtonAction");
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[PSUIAppInstallLockupViewCell getLogger](self, "getLogger", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[PSUIAppInstallLockupViewCell presentingViewControllerForLockupView:]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AppInstall"));
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_analyticsEventDetailsCode, 0);
  objc_storeStrong((id *)&self->_analyticsEventForApp, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_openAppURL, 0);
}

@end
