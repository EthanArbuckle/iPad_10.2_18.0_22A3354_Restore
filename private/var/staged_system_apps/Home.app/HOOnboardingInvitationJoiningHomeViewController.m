@implementation HOOnboardingInvitationJoiningHomeViewController

- (HOOnboardingInvitationJoiningHomeViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  HOOnboardingInvitationJoiningHomeViewController *v25;
  HUIncomingInvitationResponseController *v26;
  HUIncomingInvitationResponseController *responseController;
  void *v28;
  void *v29;
  HOOnboardingInvitationJoinedHomeViewController *v30;
  HOOnboardingInvitationJoinedHomeViewController *joinedHomeVC;
  void *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title"), CFSTR("_"), CFSTR("HOLocalizable")));

  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v12))
  {
    v35 = v9;
    v36 = v8;
    v37 = v7;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = sub_100039498();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v15)
    {
      v16 = v15;
      v34 = a4;
      v17 = *(_QWORD *)v42;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title"), CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title"), v19));

        if (!-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title")))break;
        if (v16 == (id)++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v16)
            goto LABEL_4;
          v21 = CFSTR("_");
          break;
        }
      }
      a4 = v34;
    }
    else
    {
      v21 = CFSTR("_");
    }

    v12 = v21;
    v8 = v36;
    v7 = v37;
    v9 = v35;
  }
  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v12))
    NSLog(CFSTR("Sensitive key '%@' not found!"), CFSTR("HOIncomingInvitation_RestrictedGuest_JoiningHome_Title"));
  else
    v11 = v12;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("house.circle.fill")));
  v40.receiver = self;
  v40.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  v25 = -[HOOnboardingInvitationJoiningHomeViewController initWithTitle:detailText:icon:](&v40, "initWithTitle:detailText:icon:", v23, 0, v24);

  if (v25)
  {
    objc_storeStrong((id *)&v25->_invitation, a3);
    objc_storeStrong((id *)&v25->_invitationHelper, a4);
    objc_storeWeak((id *)&v25->_incomingInvitationDelegate, v9);
    v26 = (HUIncomingInvitationResponseController *)objc_msgSend(objc_alloc((Class)HUIncomingInvitationResponseController), "initWithDelegate:invitation:", v25, v7);
    responseController = v25->_responseController;
    v25->_responseController = v26;

    -[HOOnboardingInvitationJoiningHomeViewController setModalInPresentation:](v25, "setModalInPresentation:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationItem](v25, "navigationItem"));
    objc_msgSend(v28, "setHidesBackButton:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v29, "addHomeManagerObserver:", v25);
    v30 = -[HOOnboardingInvitationJoinedHomeViewController initWithIncomingInvitation:delegate:]([HOOnboardingInvitationJoinedHomeViewController alloc], "initWithIncomingInvitation:delegate:", v7, v9);
    joinedHomeVC = v25->_joinedHomeVC;
    v25->_joinedHomeVC = v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController delegate](v25, "delegate"));
    -[HOOnboardingInvitationJoinedHomeViewController setDelegate:](v25->_joinedHomeVC, "setDelegate:", v32);

  }
  return v25;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  -[HOOnboardingInvitationJoiningHomeViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  -[HOOnboardingInvitationJoiningHomeViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleAppDidForeground", UIApplicationWillEnterForegroundNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleAppDidEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v17.receiver = self;
  v17.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  -[HOOnboardingInvitationJoiningHomeViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v4 = HFLogForCategory(69);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v7 = HUStringFromIncomingInvitationResponseControllerState(objc_msgSend(v6, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "invitation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315650;
    v19 = "-[HOOnboardingInvitationJoiningHomeViewController viewWillAppear:]";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) State is %@ for incoming invitation = %@.", buf, 0x20u);

  }
  -[HOOnboardingInvitationJoiningHomeViewController setAcceptInvitationError:](self, "setAcceptInvitationError:", 0);
  -[HOOnboardingInvitationJoiningHomeViewController setDidPushNextViewController:](self, "setDidPushNextViewController:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
  if (objc_msgSend(v12, "state") == (id)3)
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v14 = objc_msgSend(v13, "state");

    if (v14 != (id)2)
    {
      -[HOOnboardingInvitationJoiningHomeViewController _cancelTimer](self, "_cancelTimer");
      -[HOOnboardingInvitationJoiningHomeViewController _startAddHomeTimeout](self, "_startAddHomeTimeout");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
      objc_msgSend(v15, "respondToInvitationWithResponse:", 1);
      goto LABEL_8;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationController](self, "navigationController"));
  v16 = objc_msgSend(v15, "popToRootViewControllerAnimated:", 1);
LABEL_8:

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = a3;
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "invitation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v12 = "-[HOOnboardingInvitationJoiningHomeViewController viewWillDisappear:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);

  }
  v10.receiver = self;
  v10.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  -[HOOnboardingInvitationJoiningHomeViewController viewWillDisappear:](&v10, "viewWillDisappear:", v3);
  -[HOOnboardingInvitationJoiningHomeViewController _cancelTimer](self, "_cancelTimer");
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
  unsigned int v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v5 = a4;
  v6 = HFLogForCategory(69);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_minimumDescription"));
    v14 = 136315394;
    v15 = "-[HOOnboardingInvitationJoiningHomeViewController homeManager:didAddHome:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v14, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController invitation](self, "invitation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeUUID"));
  v12 = objc_msgSend(v9, "hmf_isEqualToUUID:", v11);

  if (v12)
  {
    -[HOOnboardingInvitationJoiningHomeViewController _moveToNextViewController](self, "_moveToNextViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v13, "setSelectedHome:userInitiated:", v5, 1);

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
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v6 = a3;
  v7 = HFLogForCategory(69);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HUStringFromIncomingInvitationResponseControllerState(objc_msgSend(v6, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_prettyDescription"));
    v27 = 136315650;
    v28 = "-[HOOnboardingInvitationJoiningHomeViewController invitationResponseController:stateDidChange:]";
    v29 = 2114;
    v30 = v10;
    v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", (uint8_t *)&v27, 0x20u);

  }
  if (a4 == 3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    v23 = objc_opt_respondsToSelector(v22, "invitationViewControllerDidDecideLaterInvitation:error:");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    v20 = v24;
    if ((v23 & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "error"));
      objc_msgSend(v20, "invitationViewControllerDidDecideLaterInvitation:error:", self, v26);

    }
    else
    {
      objc_msgSend(v24, "invitationViewControllerDidDecideLaterInvitation:", self);
    }
    goto LABEL_15;
  }
  if (a4 == 2 && objc_msgSend(v6, "response") == (id)1)
  {
    v13 = HFLogForCategory(69);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hf_prettyDescription"));
      v27 = 136315394;
      v28 = "-[HOOnboardingInvitationJoiningHomeViewController invitationResponseController:stateDidChange:]";
      v29 = 2112;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(%s) Starting timer for invitation %@", (uint8_t *)&v27, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController acceptedPendingAddHomeTimeoutCancellationToken](self, "acceptedPendingAddHomeTimeoutCancellationToken"));

    if (!v17)
      -[HOOnboardingInvitationJoiningHomeViewController _startAddHomeTimeout](self, "_startAddHomeTimeout");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
    v19 = objc_opt_respondsToSelector(v18, "acceptedInvitationPendingForNewHome:");

    if ((v19 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController incomingInvitationDelegate](self, "incomingInvitationDelegate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
      objc_msgSend(v20, "acceptedInvitationPendingForNewHome:", v21);

LABEL_15:
    }
  }

}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (void)_handleAppDidEnterBackground
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v3 = HFLogForCategory(70);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    v8 = 136315394;
    v9 = "-[HOOnboardingInvitationJoiningHomeViewController _handleAppDidEnterBackground]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", (uint8_t *)&v8, 0x16u);

  }
  -[HOOnboardingInvitationJoiningHomeViewController _cancelTimer](self, "_cancelTimer");
}

- (void)_cancelTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;

  v3 = HFLogForCategory(69);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    v9 = 136315394;
    v10 = "-[HOOnboardingInvitationJoiningHomeViewController _cancelTimer]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", (uint8_t *)&v9, 0x16u);

  }
  -[HOOnboardingInvitationJoiningHomeViewController _hideSpinner](self, "_hideSpinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController acceptedPendingAddHomeTimeoutCancellationToken](self, "acceptedPendingAddHomeTimeoutCancellationToken"));
  objc_msgSend(v8, "cancel");

  -[HOOnboardingInvitationJoiningHomeViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", 0);
  -[HOOnboardingInvitationJoiningHomeViewController setAcceptInvitationError:](self, "setAcceptInvitationError:", 0);
}

- (void)_moveToNextViewController
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;

  v3 = HFLogForCategory(69);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v25 = "-[HOOnboardingInvitationJoiningHomeViewController _moveToNextViewController]";
    v26 = 2112;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) Cancelling addHomeTimeout and moving onto the next view controller 'Home Joined' for %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController acceptedPendingAddHomeTimeoutCancellationToken](self, "acceptedPendingAddHomeTimeoutCancellationToken"));
  objc_msgSend(v8, "cancel");

  -[HOOnboardingInvitationJoiningHomeViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationController](self, "navigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "visibleViewController"));
  v11 = objc_opt_class(UIAlertController);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = HFLogForCategory(69);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[HOOnboardingInvitationJoiningHomeViewController _moveToNextViewController]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(%s) There's an alert presented. Dismissing that first before moving onto the next view controller", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationController](self, "navigationController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visibleViewController"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000382A0;
    v22[3] = &unk_1000B60F0;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else if (!-[HOOnboardingInvitationJoiningHomeViewController didPushNextViewController](self, "didPushNextViewController"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationController](self, "navigationController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "visibleViewController"));
    v19 = objc_msgSend(v18, "isEqual:", self);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController navigationController](self, "navigationController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController joinedHomeVC](self, "joinedHomeVC"));
      objc_msgSend(v20, "pushViewController:animated:", v21, 1);

      -[HOOnboardingInvitationJoiningHomeViewController setDidPushNextViewController:](self, "setDidPushNextViewController:", 1);
    }
  }
}

- (void)_handleAppDidForeground
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = HFLogForCategory(70);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController responseController](self, "responseController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "invitation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315394;
    v13 = "-[HOOnboardingInvitationJoiningHomeViewController _handleAppDidForeground]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);

  }
  -[HOOnboardingInvitationJoiningHomeViewController setDidPushNextViewController:](self, "setDidPushNextViewController:", 0);
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController _didHomeGetAdded](self, "_didHomeGetAdded"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038510;
  v10[3] = &unk_1000B7980;
  objc_copyWeak(&v11, (id *)buf);
  v9 = objc_msgSend(v8, "flatMap:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_startAddHomeTimeout
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  -[HOOnboardingInvitationJoiningHomeViewController _showSpinner](self, "_showSpinner");
  objc_initWeak(&location, self);
  -[HOOnboardingInvitationJoiningHomeViewController setAcceptInvitationError:](self, "setAcceptInvitationError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100038800;
  v8 = &unk_1000B60F0;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "afterDelay:performBlock:", &v5, 120.0));
  -[HOOnboardingInvitationJoiningHomeViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_didHomeGetAdded
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allHomesFuture"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038C24;
  v7[3] = &unk_1000B79D0;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v7));

  return v5;
}

- (void)_showSpinner
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
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

  -[HOOnboardingInvitationJoiningHomeViewController _hideSpinner](self, "_hideSpinner");
  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[HOOnboardingInvitationJoiningHomeViewController setSpinner:](self, "setSpinner:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));
  objc_msgSend(v5, "sizeToFit");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));
  objc_msgSend(v6, "startAnimating");

  v7 = objc_alloc((Class)UIStackView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));
  v21 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v10 = objc_msgSend(v7, "initWithArrangedSubviews:", v9);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setAlignment:", 3);
  objc_msgSend(v10, "setDistribution:", 3);
  objc_msgSend(v10, "setSpacing:", 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 20.0));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController view](self, "view"));
  objc_msgSend(v20, "setNeedsLayout");

}

- (void)_hideSpinner
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingInvitationJoiningHomeViewController spinner](self, "spinner"));
    objc_msgSend(v4, "removeFromSuperview");

    -[HOOnboardingInvitationJoiningHomeViewController setSpinner:](self, "setSpinner:", 0);
  }
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

- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken
{
  return self->_acceptedPendingAddHomeTimeoutCancellationToken;
}

- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, a3);
}

- (NSError)acceptInvitationError
{
  return self->_acceptInvitationError;
}

- (void)setAcceptInvitationError:(id)a3
{
  objc_storeStrong((id *)&self->_acceptInvitationError, a3);
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
  objc_storeStrong((id *)&self->_responseController, a3);
}

- (HOOnboardingInvitationJoinedHomeViewController)joinedHomeVC
{
  return self->_joinedHomeVC;
}

- (void)setJoinedHomeVC:(id)a3
{
  objc_storeStrong((id *)&self->_joinedHomeVC, a3);
}

- (BOOL)didPushNextViewController
{
  return self->_didPushNextViewController;
}

- (void)setDidPushNextViewController:(BOOL)a3
{
  self->_didPushNextViewController = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_joinedHomeVC, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_acceptInvitationError, 0);
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end
