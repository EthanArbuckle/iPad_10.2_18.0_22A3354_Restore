@implementation HOOnboardingInvitationRestrictedGuestAccessViewController

- (HOOnboardingInvitationRestrictedGuestAccessViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  UIViewController *v21;
  UIViewController *centerVC;
  void *v23;
  void *v24;
  HOOnboardingInvitationRestrictedGuestAccessViewController *v25;
  HOOnboardingInvitationJoiningHomeViewController *v26;
  HOOnboardingInvitationJoiningHomeViewController *joiningHomeVC;
  void *v28;
  HUIncomingInvitationResponseController *v29;
  HUIncomingInvitationResponseController *responseController;
  uint64_t v31;
  OBTrayButton *continueButton;
  OBTrayButton *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;

  v9 = a3;
  v42 = a4;
  v41 = a5;
  v10 = HFLogForCategory(69);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v45 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController initWithIncomingInvitation:invitationHelper:incomi"
          "ngInvitationDelegate:]";
    v46 = 2112;
    v47 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);

  }
  v13 = sub_10000CC70(CFSTR("HOIncomingInvitation_RestrictedGuest_YourAccess_Title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = sub_10000CC70(CFSTR("HOIncomingInvitation_RestrictedGuest_YourAccess_DetailText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_alloc((Class)HUScheduleAccessViewController);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "restrictedGuestSchedule"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v21 = (UIViewController *)objc_msgSend(v17, "initWithGuestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:", v18, v19, 0, v20, 0);
  centerVC = self->_centerVC;
  self->_centerVC = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("calendar.circle.fill")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_centerVC, "view"));
  v43.receiver = self;
  v43.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  v25 = -[HOOnboardingInvitationRestrictedGuestAccessViewController initWithTitle:detailText:icon:contentView:](&v43, "initWithTitle:detailText:icon:contentView:", v14, v16, v23, v24);

  if (v25)
  {
    objc_storeStrong((id *)&v25->_invitation, a3);
    objc_storeStrong((id *)&v25->_invitationHelper, a4);
    objc_storeWeak((id *)&v25->_incomingInvitationDelegate, v41);
    v26 = -[HOOnboardingInvitationJoiningHomeViewController initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:]([HOOnboardingInvitationJoiningHomeViewController alloc], "initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:", v9, v42, v41);
    joiningHomeVC = v25->_joiningHomeVC;
    v25->_joiningHomeVC = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController delegate](v25, "delegate"));
    -[HOOnboardingInvitationJoiningHomeViewController setDelegate:](v25->_joiningHomeVC, "setDelegate:", v28);

    v29 = (HUIncomingInvitationResponseController *)objc_msgSend(objc_alloc((Class)HUIncomingInvitationResponseController), "initWithDelegate:invitation:", v25, v9);
    responseController = v25->_responseController;
    v25->_responseController = v29;

    -[HOOnboardingInvitationRestrictedGuestAccessViewController setModalInPresentation:](v25, "setModalInPresentation:", 1);
    v31 = objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    continueButton = v25->_continueButton;
    v25->_continueButton = (OBTrayButton *)v31;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v25->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = v25->_continueButton;
    v34 = sub_10000CC70(CFSTR("HOContinueButtonTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[OBTrayButton setTitle:forState:](v33, "setTitle:forState:", v35, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v25->_continueButton, "addTarget:action:forControlEvents:", v25, "_continueButtonTapped:", 64);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController buttonTray](v25, "buttonTray"));
    objc_msgSend(v36, "addButton:", v25->_continueButton);

    v37 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v25, "_cancelButton:");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController navigationItem](v25, "navigationItem"));
    objc_msgSend(v38, "setRightBarButtonItem:", v37);

    -[HOOnboardingInvitationRestrictedGuestAccessViewController setContentInsets:](v25, "setContentInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v39, "addHomeManagerObserver:", v25);

  }
  return v25;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  -[HOOnboardingInvitationRestrictedGuestAccessViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController centerVC](self, "centerVC"));
  -[HOOnboardingInvitationRestrictedGuestAccessViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController centerVC](self, "centerVC"));
  objc_msgSend(v4, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  -[HOOnboardingInvitationRestrictedGuestAccessViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v4, "addHomeManagerObserver:", self);
  -[HOOnboardingInvitationRestrictedGuestAccessViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  -[HOOnboardingInvitationRestrictedGuestAccessViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v4, "removeHomeManagerObserver:", self);
  -[HOOnboardingInvitationRestrictedGuestAccessViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 0);

}

- (void)_continueButtonTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;

  v36 = a3;
  v4 = HFLogForCategory(68);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _continueButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Continue' button", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitationHelper](self, "invitationHelper"));
  v7 = objc_msgSend(v6, "isUnknownContact");

  if (v7)
  {
    v8 = HFLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitation](self, "invitation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_prettyDescription"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitationHelper](self, "invitationHelper"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "inviterContact"));
      *(_DWORD *)buf = 136315650;
      v44 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _continueButtonTapped:]";
      v45 = 2112;
      v46 = v11;
      v47 = 2112;
      v48 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) User invitation %@ is from unknown contact %@", buf, 0x20u);

    }
    v14 = sub_10000CC70(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitation](self, "invitation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "homeName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v17));

    v18 = sub_10000CC70(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Body"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitationHelper](self, "invitationHelper"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "inviterContact"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "givenName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), 0, v22));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v35, v34, 1));
    objc_initWeak((id *)buf, self);
    v24 = sub_10000CC70(CFSTR("HOUserIncomingInvitationView_AcceptButton"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003B8D4;
    v41[3] = &unk_1000B7A88;
    objc_copyWeak(&v42, (id *)buf);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v41));

    v27 = sub_10000CC70(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_IgnoreAndReport"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10003B994;
    v39[3] = &unk_1000B7A88;
    objc_copyWeak(&v40, (id *)buf);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 0, v39));

    v30 = sub_10000CC70(CFSTR("HOUserIncomingInvitationView_UnknownInviteAlert_Cancel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10003BA54;
    v37[3] = &unk_1000B6140;
    v32 = v23;
    v38 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 1, v37));

    objc_msgSend(v32, "addAction:", v29);
    objc_msgSend(v32, "addAction:", v26);
    objc_msgSend(v32, "addAction:", v33);
    -[HOOnboardingInvitationRestrictedGuestAccessViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v32, 1, 0);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[HOOnboardingInvitationRestrictedGuestAccessViewController _displayNextViewController](self, "_displayNextViewController");
  }

}

- (void)_displayNextViewController
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;

  v3 = HFLogForCategory(68);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _displayNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) Moving onto the next view controller 'Joining Home'", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController joiningHomeVC](self, "joiningHomeVC"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_reportJunk
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = HFLogForCategory(68);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _reportJunk]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped button", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController responseController](self, "responseController"));
  objc_msgSend(v5, "respondToInvitationWithResponse:", 4);

}

- (void)_cancelButton:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = HFLogForCategory(68);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _cancelButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button", (uint8_t *)&v7, 0xCu);
  }

  -[HOOnboardingInvitationRestrictedGuestAccessViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
  objc_msgSend(v6, "invitationViewControllerDidDecideLaterInvitation:", self);

}

- (NSString)segmentIdentifier
{
  return (NSString *)CFSTR("OnboardingInviteFlow");
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v5 = a4;
  v6 = HFLogForCategory(69);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
    v16 = 136315650;
    v17 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController homeManager:didAddHome:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) home <Name: %@, id: %@>", (uint8_t *)&v16, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController invitation](self, "invitation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeUUID"));
  v13 = objc_msgSend(v10, "hmf_isEqualToUUID:", v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v14, "setSelectedHome:userInitiated:", v5, 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    objc_msgSend(v15, "invitationViewControllerDidAcceptInvitation:", self);

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
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = HFLogForCategory(69);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HUStringFromIncomingInvitationResponseControllerState(objc_msgSend(v6, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_prettyDescription"));
    v14 = 136315650;
    v15 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController invitationResponseController:stateDidChange:]";
    v16 = 2114;
    v17 = v10;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", (uint8_t *)&v14, 0x20u);

  }
  if (a4 == 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    objc_msgSend(v13, "invitationViewControllerDidDecideLaterInvitation:", self);
LABEL_8:

    goto LABEL_9;
  }
  if (a4 == 2)
  {
    if (objc_msgSend(v6, "response") == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
      objc_msgSend(v13, "invitationViewControllerDidDeclineInvitation:", self);
    }
    else if (objc_msgSend(v6, "response") == (id)3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
      objc_msgSend(v13, "invitationViewControllerDidIgnoreInvitation:", self);
    }
    else
    {
      if (objc_msgSend(v6, "response") != (id)4)
        goto LABEL_9;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationRestrictedGuestAccessViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
      objc_msgSend(v13, "invitationViewControllerDidReportJunkInvitation:", self);
    }
    goto LABEL_8;
  }
LABEL_9:

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

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  return (HOOnboardingIncomingInvitationFlowDelegate *)objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);
}

- (void)setIncomingInvitationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_incomingInvitationDelegate, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
  objc_storeStrong((id *)&self->_responseController, a3);
}

- (UIViewController)centerVC
{
  return self->_centerVC;
}

- (void)setCenterVC:(id)a3
{
  objc_storeStrong((id *)&self->_centerVC, a3);
}

- (HOOnboardingInvitationJoiningHomeViewController)joiningHomeVC
{
  return self->_joiningHomeVC;
}

- (void)setJoiningHomeVC:(id)a3
{
  objc_storeStrong((id *)&self->_joiningHomeVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joiningHomeVC, 0);
  objc_storeStrong((id *)&self->_centerVC, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end
