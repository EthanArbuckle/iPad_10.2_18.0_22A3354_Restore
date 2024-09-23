@implementation BSUIWelcomeGDPRViewController

- (BSUIWelcomeGDPRViewController)initWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BSUIWelcomeGDPRViewController *v14;
  id v15;
  id completion;
  objc_super v18;

  v4 = a3;
  v5 = BSUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Welcome to Apple Books"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v8 = BSUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Find great books and audiobooks you can read or listen to anywhere, on all your Apple devices."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v11 = BSUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("welcome-app-icon-ios"), v12));

  v18.receiver = self;
  v18.super_class = (Class)BSUIWelcomeGDPRViewController;
  v14 = -[BSUIWelcomeGDPRViewController initWithTitle:detailText:icon:contentLayout:](&v18, "initWithTitle:detailText:icon:contentLayout:", v7, v10, v13, 2);
  if (v14)
  {
    v15 = objc_msgSend(v4, "copy");
    completion = v14->_completion;
    v14->_completion = v15;

  }
  return v14;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BSUIWelcomeGDPRViewController *v45;
  objc_super v46;
  uint8_t buf[4];
  void *v48;
  _QWORD v49[4];

  v46.receiver = self;
  v46.super_class = (Class)BSUIWelcomeGDPRViewController;
  -[BSUIWelcomeGDPRViewController viewDidLoad](&v46, "viewDidLoad");
  v3 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v3, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  v6 = BSUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Features vary by region."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
  objc_msgSend(v3, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", v3);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v49[0] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v49[1] = v37;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v49[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v45 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v16));
  v49[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  v19 = BUOnboardingAllBundleIDs();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = BSUIWelcomeScreenLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v20;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewDidLoad: bundleIdentifiers: %{public}@", buf, 0xCu);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifiers:](OBPrivacyLinkController, "linkWithBundleIdentifiers:", v20));
  objc_msgSend(v23, "setUnderlineLinks:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("BrandColor")));
  objc_msgSend(v23, "setCustomTintColor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController buttonTray](v45, "buttonTray"));
  objc_msgSend(v25, "setPrivacyLinkController:", v23);

  v27 = objc_opt_class(UIControl, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
  v29 = BUDynamicCast(v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  objc_msgSend(v30, "addTarget:action:forControlEvents:", v45, "_privacyLinkPressed:", 0x2000);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v32 = BSUIBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Get Started"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  objc_msgSend(v31, "setTitle:forState:", v34, 0);
  objc_msgSend(v31, "addTarget:action:forControlEvents:", v45, "_getStartedPressed:", 64);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_welcomeButtonColor](UIColor, "bc_welcomeButtonColor"));
  objc_msgSend(v31, "setTintColor:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController buttonTray](v45, "buttonTray"));
  objc_msgSend(v36, "addButton:", v31);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSDate *v9;
  NSDate *appearDate;
  objc_super v11;
  uint8_t buf[16];

  v3 = a3;
  v5 = BSUIWelcomeScreenLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewWillAppear", buf, 2u);
  }

  v11.receiver = self;
  v11.super_class = (Class)BSUIWelcomeGDPRViewController;
  -[BSUIWelcomeGDPRViewController viewWillAppear:](&v11, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v7)
    v8 = -[BSUIWelcomeGDPRViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("GetStarted"));
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  appearDate = self->_appearDate;
  self->_appearDate = v9;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  v5 = BSUIWelcomeScreenLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: viewWillDisappear", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)BSUIWelcomeGDPRViewController;
  -[BSUIWelcomeGDPRViewController viewWillDisappear:](&v9, "viewWillDisappear:", v3);
  if (self->_appearDate)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v8, "emitGetStartedViewEventWithTracker:startDate:", v7, self->_appearDate);

  }
}

- (void)_getStartedPressed:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v4 = BSUIWelcomeScreenLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: _getStartedPressed", v8, 2u);
  }

  -[BSUIWelcomeGDPRViewController _analyticsSubmitGetStartedActionEventForGDPRLink:](self, "_analyticsSubmitGetStartedActionEventForGDPRLink:", 0);
  v6 = objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController completion](self, "completion"));
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

}

- (void)_privacyLinkPressed:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = BSUIWelcomeScreenLog(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BSUIWelcomeGDPRViewController: _privacyLinkPressed", v6, 2u);
  }

  -[BSUIWelcomeGDPRViewController _analyticsSubmitGetStartedActionEventForGDPRLink:](self, "_analyticsSubmitGetStartedActionEventForGDPRLink:", 1);
}

- (void)_analyticsSubmitGetStartedActionEventForGDPRLink:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BSUIWelcomeGDPRViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v5 = v4;
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v4, "emitGetStartedActionEventWithTracker:type:", v7, v6);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_appearDate, 0);
}

@end
