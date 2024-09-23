@implementation HOOnboardingRootNavigationController

+ (id)stringForOnboardingStates:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", &stru_1000B5BE8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v4));

  return v5;
}

+ (id)onboardingStatesForHome:(id)a3
{
  return objc_msgSend(a1, "onboardingStatesForHome:pendingHomeIDsFromInvitations:", a3, 0);
}

- (HOOnboardingRootNavigationController)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithOnboardingStates:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingRootNavigationController.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOOnboardingRootNavigationController init]",
    v6);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithCoder:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithOnboardingStates:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingRootNavigationController.m"), 53, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOOnboardingRootNavigationController initWithCoder:]",
    v7);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("initWithOnboardingStates:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingRootNavigationController.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOOnboardingRootNavigationController initWithNibName:bundle:]",
    v8);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithRootViewController:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithOnboardingStates:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingRootNavigationController.m"), 65, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOOnboardingRootNavigationController initWithRootViewController:]",
    v7);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("initWithOnboardingStates:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingRootNavigationController.m"), 71, CFSTR("%s is unavailable; use %@ instead"),
    "-[HOOnboardingRootNavigationController initWithNavigationBarClass:toolbarClass:]",
    v8);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithOnboardingStates:(id)a3
{
  id v5;
  HOOnboardingRootNavigationController *v6;
  HOOnboardingRootNavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HOOnboardingIncomingInvitationViewController *v12;
  HOOnboardingIncomingInvitationViewController *invitationViewController;
  uint64_t v14;
  NSArray *onboardingViewControllers;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  void *v22;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HOOnboardingRootNavigationController;
  v6 = -[HOOnboardingRootNavigationController initWithNavigationBarClass:toolbarClass:](&v21, "initWithNavigationBarClass:toolbarClass:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_onboardingStates, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "incomingHomeInvitations"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = -[HOOnboardingIncomingInvitationViewController initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:]([HOOnboardingIncomingInvitationViewController alloc], "initWithIncomingInvitation:invitationHelper:incomingInvitationDelegate:", v11, 0, v7);
    invitationViewController = v7->_invitationViewController;
    v7->_invitationViewController = v12;

    -[HOOnboardingIncomingInvitationViewController setDelegate:](v7->_invitationViewController, "setDelegate:", v7);
    v14 = objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _onboardingViewControllersForStates:](v7, "_onboardingViewControllersForStates:", v5));
    onboardingViewControllers = v7->_onboardingViewControllers;
    v7->_onboardingViewControllers = (NSArray *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v16, "addHomeManagerObserver:", v7);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingViewControllers](v7, "onboardingViewControllers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
    v22 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[HOOnboardingRootNavigationController setViewControllers:](v7, "setViewControllers:", v19);

    -[HOOnboardingRootNavigationController setModalInPresentation:](v7, "setModalInPresentation:", 1);
  }

  return v7;
}

- (unint64_t)activeOnboardingState
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingViewControllers](self, "onboardingViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController topViewController](self, "topViewController"));
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = HFLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100077A48(self, v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingStates](self, "onboardingStates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  return (unint64_t)v10;
}

+ (id)onboardingStatesForHome:(id)a3 pendingHomeIDsFromInvitations:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  id v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSNumber *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;

  v5 = a3;
  v6 = a4;
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    v7 = HFLogForCategory(32);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      v9 = "(%s) Bypass all onboarding states in demo mode.";
      v10 = v8;
      v11 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "count"))
  {
    v12 = HFLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v5;
      v9 = "(%s) There are pending home IDs %@, so not creating onboarding states for home %@";
      v10 = v8;
      v11 = 32;
      goto LABEL_7;
    }
LABEL_8:
    v13 = &__NSArray0__struct;
    goto LABEL_9;
  }
  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "homeManager"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "incomingHomeInvitations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "na_filter:", &stru_1000B5B48));

  v19 = objc_msgSend(v16, "hf_hasSeenOnboardingWelcomeView");
  if (v5)
    v20 = v19;
  else
    v20 = 0;
  v21 = objc_msgSend(v16, "hf_lastNewFeaturesViewVersionSeen");
  v22 = +[HOOnboardingNewFeaturesViewController newFeaturesOnboardingVersion](HOOnboardingNewFeaturesViewController, "newFeaturesOnboardingVersion");
  if (!objc_msgSend(v18, "count"))
  {
LABEL_22:
    if (!v20)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (!v20 || HFForceFirstTimeOnboarding())
  {
    -[NSObject addObject:](v8, "addObject:", &off_1000BF470);
    if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
    {
      v41 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "na_firstObjectPassingTest:", &stru_1000B5B68));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[HOUtilities onboardingStatesForRestrictedGuestInvitation:](HOUtilities, "onboardingStatesForRestrictedGuestInvitation:", v23));
        -[NSObject na_safeAddObjectsFromArray:](v8, "na_safeAddObjectsFromArray:", v24);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "na_map:", &stru_1000B5BA8));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description"));

      v27 = HFLogForCategory(9);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hf_prettyDescription"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v8));
        *(_DWORD *)buf = 136315906;
        v43 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
        v44 = 2112;
        v45 = v26;
        v46 = 2112;
        v47 = v39;
        v48 = 2112;
        v49 = v40;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "(%s) incomingInvitations = %@. rgIncomingInvitation = %@. onboardingStates = %@", buf, 0x2Au);

      }
      v21 = v41;
    }
    goto LABEL_22;
  }
LABEL_23:
  if (!HFForceFirstTimeOnboarding())
  {
    if (v22 <= (uint64_t)v21 && (((uint64_t (*)(void))HFForceNewFeaturesOnboarding)() & 1) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_24:
  v29 = HFLogForCategory(9);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", HFForceFirstTimeOnboarding());
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 136315394;
    v43 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
    v44 = 2112;
    v45 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(%s) *** HFForceFirstTimeOnboarding = [%@] ***", buf, 0x16u);

  }
  v33 = HFForceNewFeaturesOnboarding(-[NSObject addObject:](v8, "addObject:", &off_1000BF488));
  if ((v33 & 1) == 0)
    goto LABEL_32;
  if ((HFForceNewFeaturesOnboarding(v33) & 1) == 0)
    NSLog(CFSTR("WHOOPS - we should never show both the Welcome & the New Features View"));
LABEL_31:
  -[NSObject addObject:](v8, "addObject:", &off_1000BF4A0);
LABEL_32:
  if (objc_msgSend(v5, "hf_currentUserIsRestrictedGuest"))
  {
    if (-[NSObject containsObject:](v8, "containsObject:", &off_1000BF488))
      -[NSObject removeObject:](v8, "removeObject:", &off_1000BF488);
    if (-[NSObject containsObject:](v8, "containsObject:", &off_1000BF4A0))
      -[NSObject removeObject:](v8, "removeObject:", &off_1000BF4A0);
    v34 = HFLogForCategory(9);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "hf_prettyDescription"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_minimumDescription"));
      *(_DWORD *)buf = 136315650;
      v43 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      v44 = 2112;
      v45 = v37;
      v46 = 2112;
      v47 = v38;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "(%s) Not including 'welcome' and 'new features' because current user is RG of home. user = %@ | home = %@", buf, 0x20u);

    }
  }
  v13 = -[NSObject copy](v8, "copy");

LABEL_9:
  return v13;
}

+ (id)stringForOnboardingState:(unint64_t)a3
{
  if (a3 < 7)
    return *(&off_1000B5CD0 + a3);
  NSLog(CFSTR("Unknown onboarding state %lu"), a2, a3);
  return CFSTR("Unknown");
}

- (BOOL)isDisplayingRestrictedGuestIncomingInvitationFlow
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  if (-[HOOnboardingRootNavigationController hasNextStepInRestrictedGuestIncomingInvitationFlow](self, "hasNextStepInRestrictedGuestIncomingInvitationFlow"))
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_opt_class(HOOnboardingInvitationJoinedHomeViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v3 = v7 != 0;

  }
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
    v11 = objc_opt_class(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingState:](HOOnboardingRootNavigationController, "stringForOnboardingState:", -[HOOnboardingRootNavigationController activeOnboardingState](self, "activeOnboardingState")));
    v14 = 136315906;
    v15 = "-[HOOnboardingRootNavigationController isDisplayingRestrictedGuestIncomingInvitationFlow]";
    v16 = 1024;
    v17 = v3;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Returning %{BOOL}d | visibleVC = %@ | states = %@", (uint8_t *)&v14, 0x26u);

  }
  return v3;
}

- (BOOL)hasNextStepInRestrictedGuestIncomingInvitationFlow
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[28];

  v3 = objc_opt_class(HOOnboardingIncomingInvitationViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
  v8 = objc_msgSend(v7, "isInviteeRestrictedGuest");

  if (v8)
  {
    v9 = HFLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
      v12 = objc_opt_class(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingState:](HOOnboardingRootNavigationController, "stringForOnboardingState:", -[HOOnboardingRootNavigationController activeOnboardingState](self, "activeOnboardingState")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitation"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hf_prettyDescription"));
      v27 = 136315906;
      v28 = "-[HOOnboardingRootNavigationController hasNextStepInRestrictedGuestIncomingInvitationFlow]";
      v29 = 2112;
      *(_QWORD *)v30 = v12;
      *(_WORD *)&v30[8] = 2112;
      *(_QWORD *)&v30[10] = v13;
      *(_WORD *)&v30[18] = 2112;
      *(_QWORD *)&v30[20] = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning YES | visibleVC = %@ | states = %@ | invitation = %@", (uint8_t *)&v27, 0x2Au);

    }
    LOBYTE(v16) = 1;
  }
  else
  {
    v17 = objc_opt_class(HOOnboardingInvitationRestrictedGuestAccessViewController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
    if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    if (v19)
    {
      v16 = 1;
    }
    else
    {
      v20 = objc_opt_class(HOOnboardingInvitationJoiningHomeViewController);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
      if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v16 = v22 != 0;

    }
    v23 = HFLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingState:](HOOnboardingRootNavigationController, "stringForOnboardingState:", -[HOOnboardingRootNavigationController activeOnboardingState](self, "activeOnboardingState")));
      v27 = 136315906;
      v28 = "-[HOOnboardingRootNavigationController hasNextStepInRestrictedGuestIncomingInvitationFlow]";
      v29 = 1024;
      *(_DWORD *)v30 = v16;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v24;
      *(_WORD *)&v30[14] = 2112;
      *(_QWORD *)&v30[16] = v25;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) Returning %{BOOL}d | visibleVC = %@ | activeOnboardingState = %@", (uint8_t *)&v27, 0x26u);

    }
  }

  return v16;
}

- (void)invitationViewControllerDidIgnoreInvitation:(id)a3
{
  -[HOOnboardingRootNavigationController didIgnoreInvitation:viewController:](self, "didIgnoreInvitation:viewController:", 0, a3);
}

- (void)didIgnoreInvitation:(id)a3 viewController:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HOOnboardingRootNavigationController _presentNextViewControllerWithCurrentViewController:skipRelated:](self, "_presentNextViewControllerWithCurrentViewController:skipRelated:", a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v7 = objc_opt_respondsToSelector(v6, "onboardingNavigationController:didIgnoreInvitation:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v8, "onboardingNavigationController:didIgnoreInvitation:", self, v9);

  }
}

- (void)invitationViewControllerDidDeclineInvitation:(id)a3
{
  -[HOOnboardingRootNavigationController didDeclineInvitation:viewController:](self, "didDeclineInvitation:viewController:", 0, a3);
}

- (void)didDeclineInvitation:(id)a3 viewController:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HOOnboardingRootNavigationController _presentNextViewControllerWithCurrentViewController:skipRelated:](self, "_presentNextViewControllerWithCurrentViewController:skipRelated:", a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v7 = objc_opt_respondsToSelector(v6, "onboardingNavigationController:didDeclineInvitation:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v8, "onboardingNavigationController:didDeclineInvitation:", self, v9);

  }
}

- (void)invitationViewControllerDidAcceptInvitation:(id)a3
{
  -[HOOnboardingRootNavigationController didAcceptInvitation:viewController:](self, "didAcceptInvitation:viewController:", 0, a3);
}

- (void)didAcceptInvitation:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(69);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_prettyDescription"));
    v14 = 136315650;
    v15 = "-[HOOnboardingRootNavigationController didAcceptInvitation:viewController:]";
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Did accept invitation %@ | viewController %@", (uint8_t *)&v14, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v12 = objc_opt_respondsToSelector(v11, "onboardingNavigationController:didAcceptInvitation:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v13, "onboardingNavigationController:didAcceptInvitation:", self, v6);

  }
  -[HOOnboardingRootNavigationController _finishedOnboarding](self, "_finishedOnboarding");

}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4
{
  -[HOOnboardingRootNavigationController didDecideLaterForInvitation:viewController:error:](self, "didDecideLaterForInvitation:viewController:error:", 0, a3, a4);
}

- (void)didDecideLaterForInvitation:(id)a3 viewController:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = HFLogForCategory(69);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_prettyDescription"));
    v18 = 136315906;
    v19 = "-[HOOnboardingRootNavigationController didDecideLaterForInvitation:viewController:error:]";
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) Deciding later for invitation %@ | viewController %@ | error %@", (uint8_t *)&v18, 0x2Au);

  }
  -[HOOnboardingRootNavigationController _presentNextViewControllerWithCurrentViewController:skipRelated:](self, "_presentNextViewControllerWithCurrentViewController:skipRelated:", v9, 1);
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
    objc_msgSend(v14, "handleError:operationType:options:retryBlock:cancelBlock:", v10, HFOperationAcceptInvitation, 0, 0, 0);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v16 = objc_opt_respondsToSelector(v15, "onboardingNavigationController:didDecideLaterInvitation:error:");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v17, "onboardingNavigationController:didDecideLaterInvitation:error:", self, v8, v10);

  }
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3
{
  -[HOOnboardingRootNavigationController invitationViewControllerDidDecideLaterInvitation:error:](self, "invitationViewControllerDidDecideLaterInvitation:error:", a3, 0);
}

- (void)invitationViewControllerDidReportJunkInvitation:(id)a3
{
  -[HOOnboardingRootNavigationController didReportJunkForInvitation:viewController:](self, "didReportJunkForInvitation:viewController:", 0, a3);
}

- (void)didReportJunkForInvitation:(id)a3 viewController:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HOOnboardingRootNavigationController _presentNextViewControllerWithCurrentViewController:skipRelated:](self, "_presentNextViewControllerWithCurrentViewController:skipRelated:", a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v7 = objc_opt_respondsToSelector(v6, "onboardingNavigationController:didReportJunkInvitation:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v8, "onboardingNavigationController:didReportJunkInvitation:", self, v9);

  }
}

- (void)acceptedInvitationPendingForNewHome:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "onboardingNavigationController:acceptedInvitationAndWaitingForHomeToLand:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
    objc_msgSend(v6, "onboardingNavigationController:acceptedInvitationAndWaitingForHomeToLand:", self, v7);

  }
}

- (void)childViewControllerDidFinish:(id)a3
{
  -[HOOnboardingRootNavigationController childViewControllerDidFinish:shouldSkipRelatedChildren:](self, "childViewControllerDidFinish:shouldSkipRelatedChildren:", a3, 0);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[10];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v5 = a4;
  v6 = HFLogForCategory(9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[HOOnboardingRootNavigationController homeManager:didAddHome:]";
    v17 = 2112;
    *(_QWORD *)v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v5, "hf_homeHasMigratedIntoHomeApp");
  v8 = objc_msgSend(v5, "hf_homeHasMigratedIntoHomeApp");
  v9 = -[HOOnboardingRootNavigationController isDisplayingRestrictedGuestIncomingInvitationFlow](self, "isDisplayingRestrictedGuestIncomingInvitationFlow");
  v10 = HFLogForCategory(9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController visibleViewController](self, "visibleViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingStates](self, "onboardingStates"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v13));
    v15 = 136316418;
    v16 = "-[HOOnboardingRootNavigationController homeManager:didAddHome:]";
    v17 = 1024;
    *(_DWORD *)v18 = v8 & (v9 ^ 1);
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v8;
    v19 = 1024;
    v20 = v9;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) shouldFinishOnboarding = %{BOOL}d | hasMigrated = %{BOOL}d | isRGFlow = %{BOOL}d | visibleVC = %@ | states = %@", (uint8_t *)&v15, 0x32u);

  }
  if ((v8 & (v9 ^ 1)) != 0)
    -[HOOnboardingRootNavigationController _finishedOnboarding](self, "_finishedOnboarding");

}

- (void)_finishedOnboarding
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
  v5 = objc_msgSend(v4, "hf_setHomeHasMigratedServicesToAccessories:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v6, "removeHomeManagerObserver:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingDelegate](self, "onboardingDelegate"));
  objc_msgSend(v7, "onboardingNavigationControllerDidFinish:", self);

}

- (void)_presentNextViewControllerWithCurrentViewController:(id)a3 skipRelated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  BOOL v44;
  uint8_t buf[4];
  void *v46;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController onboardingViewControllers](self, "onboardingViewControllers"));
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[HOOnboardingRootNavigationController _finishedOnboarding](self, "_finishedOnboarding");
  }
  else
  {
    if ((objc_opt_respondsToSelector(v6, "segmentIdentifier") & 1) != 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "segmentIdentifier"));
    else
      v9 = 0;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100012B20;
    v41[3] = &unk_1000B5C10;
    v43 = v8;
    v41[4] = self;
    v44 = a4;
    v10 = v9;
    v42 = v10;
    v11 = sub_100012B20((uint64_t)v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___HUPreloadableViewController))
        v14 = -[HOOnboardingRootNavigationController hu_pushPreloadableViewController:animated:](self, "hu_pushPreloadableViewController:animated:", v13, 1);
      else
        -[HOOnboardingRootNavigationController pushViewController:animated:](self, "pushViewController:animated:", v13, 1);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "home"));

      v17 = HFLogForCategory(9);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Finished presenting view controillers for App Onboarding. home = %@", buf, 0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "homeManager"));
      v21 = objc_msgSend(v20, "hf_setHasSeenOnboardingWelcomeView:", 1);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "homeManager"));
      v24 = objc_msgSend(v23, "hf_setSeenNewFeaturesViewVersion:", +[HOOnboardingNewFeaturesViewController newFeaturesOnboardingVersion](HOOnboardingNewFeaturesViewController, "newFeaturesOnboardingVersion"));

      if (v16)
      {
        v25 = objc_msgSend(v16, "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:", 1);
        -[HOOnboardingRootNavigationController _finishedOnboarding](self, "_finishedOnboarding");
      }
      else
      {
        v26 = objc_msgSend(objc_alloc((Class)HFHomeBuilder), "initWithExistingObject:inHome:", 0, 0);
        v27 = HULocalizedString(CFSTR("HUFirstHomeDefaultName"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        objc_msgSend(v26, "setName:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "commitItem"));
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100012C28;
        v39[3] = &unk_1000B5C38;
        v30 = v26;
        v40 = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "recover:", v39));

        objc_initWeak((id *)buf, self);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100012CFC;
        v37[3] = &unk_1000B5C60;
        objc_copyWeak(&v38, (id *)buf);
        v32 = objc_msgSend(v31, "addSuccessBlock:", v37);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100012DAC;
        v35[3] = &unk_1000B5C88;
        v33 = v30;
        v36 = v33;
        v34 = objc_msgSend(v31, "addFailureBlock:", v35);

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);

      }
    }

  }
}

- (id)_onboardingViewControllersForStates:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012F6C;
  v7[3] = &unk_1000B5CB0;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_viewControllerForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __objc2_class *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingHomeInvitations"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = v8;
  v10 = 0;
  switch(a3)
  {
    case 0uLL:
      if (!v8)
        goto LABEL_17;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController invitationViewController](self, "invitationViewController"));
      goto LABEL_7;
    case 1uLL:
      v12 = HOOnboardingWelcomeViewController;
      goto LABEL_6;
    case 2uLL:
      v12 = HOOnboardingNewFeaturesViewController;
LABEL_6:
      v11 = objc_msgSend([v12 alloc], "initWithDelegate:", self);
      goto LABEL_7;
    case 4uLL:
      if (!objc_msgSend(v8, "isInviteeRestrictedGuest")
        || !_os_feature_enabled_impl("Home", "RestrictedGuest"))
      {
        goto LABEL_17;
      }
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _invitationRestrictedGuestAccessViewController](self, "_invitationRestrictedGuestAccessViewController"));
      goto LABEL_7;
    case 5uLL:
      if (!objc_msgSend(v8, "isInviteeRestrictedGuest")
        || !_os_feature_enabled_impl("Home", "RestrictedGuest"))
      {
        goto LABEL_17;
      }
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _invitationJoiningHomeViewController](self, "_invitationJoiningHomeViewController"));
      goto LABEL_7;
    case 6uLL:
      if (objc_msgSend(v8, "isInviteeRestrictedGuest")
        && _os_feature_enabled_impl("Home", "RestrictedGuest"))
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _invitationJoinedHomeViewController](self, "_invitationJoinedHomeViewController"));
LABEL_7:
        v10 = v11;
      }
      else
      {
LABEL_17:
        v10 = 0;
      }
LABEL_18:

      return v10;
    default:
      goto LABEL_18;
  }
}

- (id)_invitationRestrictedGuestAccessViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
  {
    v3 = objc_opt_class(HOOnboardingInvitationRestrictedGuestAccessViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController invitationViewController](self, "invitationViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextViewController"));
    if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_invitationJoiningHomeViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _invitationRestrictedGuestAccessViewController](self, "_invitationRestrictedGuestAccessViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextViewController"));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController invitationViewController](self, "invitationViewController"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextViewController"));

    }
    v9 = objc_opt_class(HOOnboardingInvitationJoiningHomeViewController);
    v10 = v6;
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v7 = v11;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_invitationJoinedHomeViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (_os_feature_enabled_impl("Home", "RestrictedGuest"))
  {
    v3 = objc_opt_class(HOOnboardingInvitationJoinedHomeViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingRootNavigationController _invitationJoiningHomeViewController](self, "_invitationJoiningHomeViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextViewController"));
    if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (HOOnboardingRootNavigationControllerDelegate)onboardingDelegate
{
  return (HOOnboardingRootNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_onboardingDelegate);
}

- (void)setOnboardingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingDelegate, a3);
}

- (NSArray)onboardingStates
{
  return self->_onboardingStates;
}

- (NSArray)onboardingViewControllers
{
  return self->_onboardingViewControllers;
}

- (void)setOnboardingViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingViewControllers, a3);
}

- (HOOnboardingIncomingInvitationViewController)invitationViewController
{
  return self->_invitationViewController;
}

- (void)setInvitationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_invitationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationViewController, 0);
  objc_storeStrong((id *)&self->_onboardingViewControllers, 0);
  objc_storeStrong((id *)&self->_onboardingStates, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

@end
