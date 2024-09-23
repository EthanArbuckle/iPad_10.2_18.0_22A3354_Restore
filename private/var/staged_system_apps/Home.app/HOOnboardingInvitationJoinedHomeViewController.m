@implementation HOOnboardingInvitationJoinedHomeViewController

- (HOOnboardingInvitationJoinedHomeViewController)initWithIncomingInvitation:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HOOnboardingInvitationJoinedHomeViewController *v13;
  uint64_t v14;
  OBTrayButton *continueButton;
  OBTrayButton *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a4;
  v7 = a3;
  v8 = sub_10000CE58(CFSTR("HOIncomingInvitation_RestrictedGuest_JoinedHome_Title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("house.circle.fill")));
  v22.receiver = self;
  v22.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  v13 = -[HOOnboardingInvitationJoinedHomeViewController initWithTitle:detailText:icon:](&v22, "initWithTitle:detailText:icon:", v11, 0, v12);

  if (v13)
  {
    objc_storeWeak((id *)&v13->_incomingInvitationDelegate, v6);
    v14 = objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    continueButton = v13->_continueButton;
    v13->_continueButton = (OBTrayButton *)v14;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v13->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = v13->_continueButton;
    v17 = sub_10000CE58(CFSTR("HOWelcomeView_Button_Continue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[OBTrayButton setTitle:forState:](v16, "setTitle:forState:", v18, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v13->_continueButton, "addTarget:action:forControlEvents:", v13, "_continueButtonTapped:", 64);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController buttonTray](v13, "buttonTray"));
    objc_msgSend(v19, "addButton:", v13->_continueButton);

    -[HOOnboardingInvitationJoinedHomeViewController setModalInPresentation:](v13, "setModalInPresentation:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController navigationItem](v13, "navigationItem"));
    objc_msgSend(v20, "setHidesBackButton:", 1);

  }
  return v13;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;

  v8.receiver = self;
  v8.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  -[HOOnboardingInvitationJoinedHomeViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = HFLogForCategory(70);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController invitation](self, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v10 = "-[HOOnboardingInvitationJoinedHomeViewController viewWillAppear:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@.", buf, 0x16u);

  }
  -[HOOnboardingInvitationJoinedHomeViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;

  v3 = a3;
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController invitation](self, "invitation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v11 = "-[HOOnboardingInvitationJoinedHomeViewController viewWillDisappear:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);

  }
  v9.receiver = self;
  v9.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  -[HOOnboardingInvitationJoinedHomeViewController viewWillDisappear:](&v9, "viewWillDisappear:", v3);
}

- (void)_continueButtonTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v4 = HFLogForCategory(68);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[HOOnboardingInvitationJoinedHomeViewController _continueButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Continue' button", (uint8_t *)&v11, 0xCu);
  }

  -[HOOnboardingInvitationJoinedHomeViewController setDidUserTriggerOnboardingDismissal:](self, "setDidUserTriggerOnboardingDismissal:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
  v7 = objc_opt_respondsToSelector(v6, "didAcceptInvitation:viewController:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoinedHomeViewController invitation](self, "invitation"));
    objc_msgSend(v9, "didAcceptInvitation:viewController:", v10, self);

  }
  else
  {
    objc_msgSend(v8, "invitationViewControllerDidAcceptInvitation:", self);
  }

}

- (void)nextButtonPressed
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = HFLogForCategory(68);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[HOOnboardingInvitationJoinedHomeViewController nextButtonPressed]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Next' button", (uint8_t *)&v4, 0xCu);
  }

}

- (NSString)segmentIdentifier
{
  return (NSString *)CFSTR("OnboardingInviteFlow");
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  return (HOOnboardingChildViewControllerNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->navigationBarDelegate);
}

- (void)setNavigationBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->navigationBarDelegate, a3);
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

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  return (HOOnboardingIncomingInvitationFlowDelegate *)objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);
}

- (void)setIncomingInvitationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_incomingInvitationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->navigationBarDelegate);
}

@end
