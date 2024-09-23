@implementation HOOnboardingIncomingInvitationViewController

- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3
{
  return -[HOOnboardingIncomingInvitationViewController initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:](self, "initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:", a3, 0, 0);
}

- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  HOOnboardingIncomingInvitationViewController *v15;
  HOOnboardingIncomingInvitationViewController *v16;
  HUIncomingInvitationResponseController *v17;
  HUIncomingInvitationResponseController *responseController;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  UIImageView *v27;
  UIImageView *imageView;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  __objc2_class *v34;
  OBWelcomeController *v35;
  OBWelcomeController *restrictedGuestNextViewController;
  objc_super v38;
  uint8_t buf[4];
  void *v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
    objc_msgSend(v10, "setMode:", 1);
  else
    v10 = objc_msgSend(objc_alloc((Class)HUInvitationHelper), "initWithMode:", 1);
  objc_msgSend(v10, "setInvitation:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "detailText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeInvitationTitle"));
  if (objc_msgSend(v10, "isUnknownContact"))
    v14 = CFSTR("person.crop.circle.badge.questionmark");
  else
    v14 = 0;
  v38.receiver = self;
  v38.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  v15 = -[HOOnboardingIncomingInvitationViewController initWithTitle:detailText:symbolName:](&v38, "initWithTitle:detailText:symbolName:", v13, v12, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_invitationHelper, v10);
    -[HUInvitationHelper setDelegate:](v16->_invitationHelper, "setDelegate:", v16);
    objc_storeWeak((id *)&v16->_incomingInvitationDelegate, v11);
    objc_storeStrong((id *)&v16->_invitation, a3);
    v17 = (HUIncomingInvitationResponseController *)objc_msgSend(objc_alloc((Class)HUIncomingInvitationResponseController), "initWithDelegate:invitation:", v16, v9);
    responseController = v16->_responseController;
    v16->_responseController = v17;

    v19 = HFLogForCategory(9);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_prettyDescription"));
      *(_DWORD *)buf = 138412290;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Onboarding invitation %@", buf, 0xCu);

    }
    v22 = HUImageNamed(CFSTR("Onboarding-Home-Invite"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (-[HMIncomingHomeInvitation isInviteeRestrictedGuest](v16->_invitation, "isInviteeRestrictedGuest"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 150.0));
      v25 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("house.circle.fill"), v24));

      v26 = 4;
      v23 = (void *)v25;
    }
    else
    {
      v26 = 1;
    }
    v27 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v23);
    imageView = v16->_imageView;
    v16->_imageView = v27;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v16->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v16->_imageView, "setContentMode:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController contentView](v16, "contentView"));
    objc_msgSend(v29, "addSubview:", v16->_imageView);

    v30 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v16, "_cancelButton:");
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController navigationItem](v16, "navigationItem"));
    objc_msgSend(v31, "setRightBarButtonItem:", v30);

    -[HOOnboardingIncomingInvitationViewController setModalInPresentation:](v16, "setModalInPresentation:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v32, "addHomeManagerObserver:", v16);
    objc_msgSend(v32, "addHomeObserver:", v16);
    if (_os_feature_enabled_impl("Home", "RestrictedGuest")
      && objc_msgSend(v9, "isInviteeRestrictedGuest"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "restrictedGuestSchedule"));

      if (v33)
        v34 = HOOnboardingInvitationRestrictedGuestAccessViewController;
      else
        v34 = HOOnboardingInvitationJoiningHomeViewController;
      v35 = (OBWelcomeController *)objc_msgSend([v34 alloc], "initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:", v9, v10, v11);
      restrictedGuestNextViewController = v16->_restrictedGuestNextViewController;
      v16->_restrictedGuestNextViewController = v35;

    }
    -[HOOnboardingIncomingInvitationViewController _configureButtons](v16, "_configureButtons");

  }
  return v16;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  -[HOOnboardingIncomingInvitationViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[HOOnboardingIncomingInvitationViewController _updateImageConstraints](self, "_updateImageConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;

  v9.receiver = self;
  v9.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  -[HOOnboardingIncomingInvitationViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v4, "addHomeManagerObserver:", self);
  -[HOOnboardingIncomingInvitationViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 0);
  v5 = HFLogForCategory(69);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v11 = "-[HOOnboardingIncomingInvitationViewController viewWillAppear:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s invitation = %@.", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;

  v9.receiver = self;
  v9.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  -[HOOnboardingIncomingInvitationViewController viewWillDisappear:](&v9, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v4, "removeHomeManagerObserver:", self);
  v5 = HFLogForCategory(69);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v11 = "-[HOOnboardingIncomingInvitationViewController viewWillDisappear:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s invitation = %@.", buf, 0x16u);

  }
}

- (NSString)segmentIdentifier
{
  return (NSString *)CFSTR("OnboardingInviteFlow");
}

- (HOOnboardingChildViewController)nextViewController
{
  void *v3;
  unsigned int v4;
  void *v5;

  if (_os_feature_enabled_impl("Home", "RestrictedGuest")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation")),
        v4 = objc_msgSend(v3, "isInviteeRestrictedGuest"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController restrictedGuestNextViewController](self, "restrictedGuestNextViewController"));
  }
  else
  {
    v5 = 0;
  }
  return (HOOnboardingChildViewController *)v5;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v5 = a4;
  v6 = HFLogForCategory(69);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[HOOnboardingIncomingInvitationViewController homeManager:didAddHome:]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v15, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeUUID"));
  v11 = objc_msgSend(v8, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController acceptedPendingAddHomeTimeoutCancellationToken](self, "acceptedPendingAddHomeTimeoutCancellationToken"));
    objc_msgSend(v12, "cancel");

    -[HOOnboardingIncomingInvitationViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v13, "setSelectedHome:userInitiated:", v5, 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    objc_msgSend(v14, "invitationViewControllerDidAcceptInvitation:", self);

  }
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v6 = a3;
  v7 = HFLogForCategory(69);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HUStringFromIncomingInvitationResponseControllerState(objc_msgSend(v6, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315650;
    v27 = "-[HOOnboardingIncomingInvitationViewController invitationResponseController:stateDidChange:]";
    v28 = 2114;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", buf, 0x20u);

  }
  switch(a4)
  {
    case 3uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
      objc_msgSend(v19, "invitationViewControllerDidDecideLaterInvitation:", self);

      break;
    case 2uLL:
      if (objc_msgSend(v6, "response") == (id)1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
        v14 = sub_10000C2E8(CFSTR("HOJoiningHome_Label_Title"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v13, "setText:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
        objc_msgSend(v16, "sizeToFit");

        objc_initWeak((id *)buf, self);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100019714;
        v24[3] = &unk_1000B60F0;
        objc_copyWeak(&v25, (id *)buf);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "afterDelay:performBlock:", v24, 120.0));
        -[HOOnboardingIncomingInvitationViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", v18);

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
      else if (objc_msgSend(v6, "response") == (id)2)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
        objc_msgSend(v20, "invitationViewControllerDidDeclineInvitation:", self);

      }
      else if (objc_msgSend(v6, "response") == (id)3)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
        objc_msgSend(v21, "invitationViewControllerDidIgnoreInvitation:", self);

      }
      else if (objc_msgSend(v6, "response") == (id)4)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
        objc_msgSend(v22, "invitationViewControllerDidReportJunkInvitation:", self);

      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "response")));
        NSLog(CFSTR("Unexpected response %@"), v23);

      }
      break;
    case 1uLL:
      -[HOOnboardingIncomingInvitationViewController _showSpinner](self, "_showSpinner");
      break;
  }

}

- (void)invitationUtilityDidUpdateInformation:(id)a3
{
  void *v4;

  -[OBTrayButton removeTarget:action:forControlEvents:](self->_declineOrIgnoreInvitationButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v4, "removeAllButtons");

  -[HOOnboardingIncomingInvitationViewController _configureButtons](self, "_configureButtons");
}

- (void)_configureButtons
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  char **v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  unsigned int v55;

  v3 = sub_10000C2E8(CFSTR("HHOUserIncomingInvitationView_ConsentNotice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
  v7 = objc_msgSend(v6, "isInviteeRestrictedGuest");

  if (v7)
  {

    v4 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v8, "addCaptionText:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v10 = objc_msgSend(v9, "isUnknownContact");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  if (v10)
  {
    -[HOOnboardingIncomingInvitationViewController setDeclineOrIgnoreInvitationButton:](self, "setDeclineOrIgnoreInvitationButton:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    -[HOOnboardingIncomingInvitationViewController setMainActionButton:](self, "setMainActionButton:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
    v14 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_IgnoreButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "setTitle:forState:", v15, 0);
    v16 = &selRef__ignoreOrReportAlert_;
  }
  else
  {
    -[HOOnboardingIncomingInvitationViewController setMainActionButton:](self, "setMainActionButton:", v11);

    if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
      v17 = objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    else
      v17 = objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    v18 = (void *)v17;
    -[HOOnboardingIncomingInvitationViewController setDeclineOrIgnoreInvitationButton:](self, "setDeclineOrIgnoreInvitationButton:", v17);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
    v19 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_DeclineButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v13, "setTitle:forState:", v15, 0);
    v16 = &selRef__declineInvitation_;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, *v16, 64);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController headerView](self, "headerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "homeInvitationTitle"));
  objc_msgSend(v21, "setTitle:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "detailText"));
  objc_msgSend(v24, "setDetailText:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v29 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_AcceptButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    v32 = objc_msgSend(v31, "isInviteeRestrictedGuest");

    if (v32)
    {
      v33 = sub_10000C2E8(CFSTR("HOIncomingInvitation_RestrictedGuest_JoinHomeButton"));
      v34 = objc_claimAutoreleasedReturnValue(v33);

      v35 = HFLogForCategory(9);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "hf_prettyDescription"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
        v50 = 136315650;
        v51 = "-[HOOnboardingIncomingInvitationViewController _configureButtons]";
        v52 = 2112;
        v53 = v38;
        v54 = 1024;
        v55 = objc_msgSend(v39, "isInviteeRestrictedGuest");
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@. isInviteeRestrictedGuest = %{BOOL}d", (uint8_t *)&v50, 0x1Cu);

      }
      v30 = (void *)v34;
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
  objc_msgSend(v40, "setTitle:forState:", v30, 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
  objc_msgSend(v41, "addTarget:action:forControlEvents:", self, "_handleMainActionButton:", 64);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v43 = objc_msgSend(v42, "isUnknownContact");

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
  if (v43)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
    objc_msgSend(v44, "addButton:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
    v47 = objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
  }
  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
    objc_msgSend(v44, "addButton:", v48);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
    v47 = objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
  }
  v49 = (void *)v47;
  objc_msgSend(v46, "addButton:", v47);

}

- (void)_updateImageConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController knownContactImageConstraints](self, "knownContactImageConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

  -[HOOnboardingIncomingInvitationViewController setKnownContactImageConstraints:](self, "setKnownContactImageConstraints:", &__NSArray0__struct);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  LODWORD(v3) = objc_msgSend(v4, "isUnknownContact");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController imageView](self, "imageView"));
  v22 = v5;
  if ((_DWORD)v3)
  {
    objc_msgSend(v5, "setHidden:", 1);

  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
    objc_msgSend(v6, "bounds");
    v8 = v7;

    if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController view](self, "view"));
      objc_msgSend(v9, "frame");
      v11 = v10 * 0.65;

    }
    else
    {
      v11 = v8 + -82.0;
    }
    v23 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_imageView, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v13));
    v24[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v24[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", v11));
    v24[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
    -[HOOnboardingIncomingInvitationViewController setKnownContactImageConstraints:](self, "setKnownContactImageConstraints:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController knownContactImageConstraints](self, "knownContactImageConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
}

- (void)_ignoreOrReportAlert:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29[2];
  _QWORD v30[4];
  id v31[2];
  uint8_t buf[4];
  HOOnboardingIncomingInvitationViewController *v33;
  __int16 v34;
  void *v35;

  v24 = a3;
  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v33 = self;
    v34 = 2112;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  v9 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteActionSheet_Title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v25, 0, 0));
  objc_initWeak((id *)buf, self);
  v14 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteActionSheet_Ignore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001A488;
  v30[3] = &unk_1000B6118;
  objc_copyWeak(v31, (id *)buf);
  v31[1] = (id)a2;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v30));

  v17 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteActionSheet_Report"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001A570;
  v28[3] = &unk_1000B6118;
  objc_copyWeak(v29, (id *)buf);
  v29[1] = (id)a2;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 2, v28));

  v20 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteActionSheet_Cancel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001A658;
  v26[3] = &unk_1000B6140;
  v22 = v13;
  v27 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, v26));

  objc_msgSend(v22, "addAction:", v16);
  objc_msgSend(v22, "addAction:", v19);
  objc_msgSend(v22, "addAction:", v23);
  -[HOOnboardingIncomingInvitationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

  objc_destroyWeak(v29);
  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);

}

- (void)_reportJunk:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  HOOnboardingIncomingInvitationViewController *v11;
  __int16 v12;
  void *v13;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController responseController](self, "responseController"));
  objc_msgSend(v9, "respondToInvitationWithResponse:", 4);

}

- (void)_cancelButton:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HOOnboardingIncomingInvitationViewController *v15;
  __int16 v16;
  void *v17;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v14 = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v14, 0x16u);

  }
  -[HOOnboardingIncomingInvitationViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
  v10 = objc_opt_respondsToSelector(v9, "didDecideLaterForInvitation:viewController:error:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    objc_msgSend(v12, "didDecideLaterForInvitation:viewController:error:", v13, self, 0);

  }
  else
  {
    objc_msgSend(v11, "invitationViewControllerDidDecideLaterInvitation:", self);
  }

}

- (void)_ignoreInvitation:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  HOOnboardingIncomingInvitationViewController *v11;
  __int16 v12;
  void *v13;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController responseController](self, "responseController"));
  objc_msgSend(v9, "respondToInvitationWithResponse:", 3);

}

- (void)_declineInvitation:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  HOOnboardingIncomingInvitationViewController *v11;
  __int16 v12;
  void *v13;

  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v10, 0x16u);

  }
  -[HOOnboardingIncomingInvitationViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController responseController](self, "responseController"));
  objc_msgSend(v9, "respondToInvitationWithResponse:", 2);

}

- (void)_handleMainActionButton:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = HFLogForCategory(68);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315650;
    v21 = "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]";
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s User tapped %@ button. invitation = %@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%s) Accepting invitation"), "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
  v12 = objc_msgSend(v11, "isInviteeRestrictedGuest");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invitation.isInviteeRestrictedGuest = %@."), "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]", v13));

  if (_os_feature_enabled_impl("Home", "RestrictedGuest")
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation")),
        v16 = objc_msgSend(v15, "isInviteeRestrictedGuest"),
        v15,
        v16))
  {
    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@. Continuing to next view controller."), v14));

    -[HOOnboardingIncomingInvitationViewController _continue](self, "_continue");
    v14 = (void *)v17;
  }
  else
  {
    -[HOOnboardingIncomingInvitationViewController _acceptInvitation](self, "_acceptInvitation");
  }
  v18 = HFLogForCategory(9);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = (const char *)v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)_continue
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController restrictedGuestNextViewController](self, "restrictedGuestNextViewController"));
    v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___HOOnboardingChildViewController);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController restrictedGuestNextViewController](self, "restrictedGuestNextViewController"));
      if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___HOOnboardingChildViewController))
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController delegate](self, "delegate"));
      objc_msgSend(v7, "setDelegate:", v8);

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController navigationController](self, "navigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController restrictedGuestNextViewController](self, "restrictedGuestNextViewController"));
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  }
}

- (void)_acceptInvitation
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37[2];
  _QWORD v38[4];
  id v39[2];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  v4 = objc_msgSend(v3, "isUnknownContact");

  if (v4)
  {
    v5 = HFLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inviterContact"));
      *(_DWORD *)buf = 138412546;
      v41 = v8;
      v42 = 2112;
      v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User invitation %@ is from unknown contact %@", buf, 0x16u);

    }
    v11 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitation](self, "invitation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v14));

    v15 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Body"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "inviterContact"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "givenName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v19));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, v31, 1));
    objc_initWeak((id *)buf, self);
    v21 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_AcceptButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001B374;
    v38[3] = &unk_1000B6118;
    objc_copyWeak(v39, (id *)buf);
    v39[1] = (id)a2;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 0, v38));

    v24 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_IgnoreAndReport"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001B458;
    v36[3] = &unk_1000B6118;
    objc_copyWeak(v37, (id *)buf);
    v37[1] = (id)a2;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v36));

    v27 = sub_10000C2E8(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Cancel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001B540;
    v34[3] = &unk_1000B6140;
    v29 = v20;
    v35 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 1, v34));

    objc_msgSend(v29, "addAction:", v26);
    objc_msgSend(v29, "addAction:", v23);
    objc_msgSend(v29, "addAction:", v30);
    -[HOOnboardingIncomingInvitationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);

    objc_destroyWeak(v37);
    objc_destroyWeak(v39);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HOOnboardingIncomingInvitationViewController _reallyAcceptInvitation](self, "_reallyAcceptInvitation");
  }
}

- (void)_reallyAcceptInvitation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController responseController](self, "responseController"));
  objc_msgSend(v2, "respondToInvitationWithResponse:", 1);

}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));
    objc_msgSend(v4, "removeFromSuperview");

    -[HOOnboardingIncomingInvitationViewController setSpinner:](self, "setSpinner:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
    objc_msgSend(v6, "removeFromSuperview");

    -[HOOnboardingIncomingInvitationViewController setJoiningHomeLabel:](self, "setJoiningHomeLabel:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController mainActionButton](self, "mainActionButton"));
  objc_msgSend(v7, "setHidden:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController declineOrIgnoreInvitationButton](self, "declineOrIgnoreInvitationButton"));
  objc_msgSend(v8, "setHidden:", 0);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController view](self, "view"));
  objc_msgSend(v9, "setNeedsLayout");

}

- (void)_showSpinner
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  -[HOOnboardingIncomingInvitationViewController _hideSpinner](self, "_hideSpinner");
  v3 = +[HFUtilities isAMac](HFUtilities, "isAMac");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController buttonTray](self, "buttonTray"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setHidden:", 1);
  else
    objc_msgSend(v4, "removeFromSuperview");

  v6 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[HOOnboardingIncomingInvitationViewController setSpinner:](self, "setSpinner:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));
  objc_msgSend(v8, "sizeToFit");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));
  objc_msgSend(v9, "startAnimating");

  v10 = objc_alloc_init((Class)UILabel);
  -[HOOnboardingIncomingInvitationViewController setJoiningHomeLabel:](self, "setJoiningHomeLabel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HUFontUtilities preferredFontForTextStyle:traits:](HUFontUtilities, "preferredFontForTextStyle:traits:", UIFontTextStyleTitle3, 32770));
  objc_msgSend(v12, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v14, "setTextColor:", v15);

  v16 = objc_alloc((Class)UIStackView);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController spinner](self, "spinner"));
  v36[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController joiningHomeLabel](self, "joiningHomeLabel"));
  v36[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
  v20 = objc_msgSend(v16, "initWithArrangedSubviews:", v19);

  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "setAlignment:", 3);
  objc_msgSend(v20, "setDistribution:", 3);
  objc_msgSend(v20, "setSpacing:", 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController contentView](self, "contentView"));
  objc_msgSend(v21, "addSubview:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController invitationHelper](self, "invitationHelper"));
  LODWORD(v18) = objc_msgSend(v22, "isUnknownContact");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  if ((_DWORD)v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController contentView](self, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 20.0));
    objc_msgSend(v26, "setActive:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController contentView](self, "contentView"));
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController imageView](self, "imageView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v30, 20.0));
    objc_msgSend(v31, "setActive:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController imageView](self, "imageView"));
  }
  v32 = v28;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerXAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v33));
  objc_msgSend(v34, "setActive:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingIncomingInvitationViewController view](self, "view"));
  objc_msgSend(v35, "setNeedsLayout");

}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  return (HOOnboardingChildViewControllerNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->_navigationBarDelegate);
}

- (void)setNavigationBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBarDelegate, a3);
}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  return (HOOnboardingChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)didUserTriggerOnboardingDismissal
{
  return self->didUserTriggerOnboardingDismissal;
}

- (void)setDidUserTriggerOnboardingDismissal:(BOOL)a3
{
  self->didUserTriggerOnboardingDismissal = a3;
}

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  return (HOOnboardingIncomingInvitationFlowDelegate *)objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);
}

- (void)setIncomingInvitationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_incomingInvitationDelegate, a3);
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (HUInvitationHelper)invitationHelper
{
  return self->_invitationHelper;
}

- (void)setInvitationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_invitationHelper, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSArray)knownContactImageConstraints
{
  return self->_knownContactImageConstraints;
}

- (void)setKnownContactImageConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_knownContactImageConstraints, a3);
}

- (OBTrayButton)mainActionButton
{
  return self->_mainActionButton;
}

- (void)setMainActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_mainActionButton, a3);
}

- (OBTrayButton)declineOrIgnoreInvitationButton
{
  return self->_declineOrIgnoreInvitationButton;
}

- (void)setDeclineOrIgnoreInvitationButton:(id)a3
{
  objc_storeStrong((id *)&self->_declineOrIgnoreInvitationButton, a3);
}

- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken
{
  return self->_acceptedPendingAddHomeTimeoutCancellationToken;
}

- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, a3);
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
  objc_storeStrong((id *)&self->_responseController, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UILabel)joiningHomeLabel
{
  return self->_joiningHomeLabel;
}

- (void)setJoiningHomeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_joiningHomeLabel, a3);
}

- (OBWelcomeController)restrictedGuestNextViewController
{
  return self->_restrictedGuestNextViewController;
}

- (void)setRestrictedGuestNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedGuestNextViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestNextViewController, 0);
  objc_storeStrong((id *)&self->_joiningHomeLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, 0);
  objc_storeStrong((id *)&self->_declineOrIgnoreInvitationButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_knownContactImageConstraints, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end
