@implementation HOInitialSetupStateController

- (void)_checkForAppOnboardingWillFinish
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController onboardingCompleteFuture](self, "onboardingCompleteFuture"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006DE0;
  v5[3] = &unk_1000B6080;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  v4 = objc_msgSend(v3, "flatMap:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)reloadState
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeFuture"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005C44;
  v6[3] = &unk_1000B6008;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addCompletionBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_updateOnboardingCompleteFutureForNewPresentationState:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  if (a3)
  {
    v4 = HFLogForCategory(9);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting onboardingCompleteFuture for home: %@", (uint8_t *)&v15, 0xCu);

    }
    v8 = objc_alloc_init((Class)NAFuture);
    -[HOInitialSetupStateController setOnboardingCompleteFuture:](self, "setOnboardingCompleteFuture:", v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController onboardingCompleteFuture](self, "onboardingCompleteFuture"));
    v10 = objc_msgSend(v9, "isFinished");

    if ((v10 & 1) != 0)
      return;
    v11 = HFLogForCategory(9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));
      v15 = 138412290;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "After evaluating the dataSync status and onboarding states for home %@, we decided we don't need to show any onboarding or dataSyncInProgress screens. Finishing onboardingCompleteFuture.", (uint8_t *)&v15, 0xCu);

    }
    -[HOInitialSetupStateController _checkForAppOnboardingWillFinish](self, "_checkForAppOnboardingWillFinish");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController onboardingCompleteFuture](self, "onboardingCompleteFuture"));
    objc_msgSend(v8, "finishWithNoResult");
  }

}

- (NAFuture)onboardingCompleteFuture
{
  return self->_onboardingCompleteFuture;
}

- (HOInitialSetupStateController)initWithDelegate:(id)a3
{
  id v4;
  HOInitialSetupStateController *v5;
  HOInitialSetupStateController *v6;
  NAFuture *v7;
  NAFuture *onboardingCompleteFuture;
  uint64_t v9;
  HFHomeKitDispatcher *dispatcher;
  NSMutableSet *v11;
  NSMutableSet *pendingHomeIDsFromInvitations;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HOInitialSetupStateController;
  v5 = -[HOInitialSetupStateController init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NAFuture *)objc_alloc_init((Class)NAFuture);
    onboardingCompleteFuture = v6->_onboardingCompleteFuture;
    v6->_onboardingCompleteFuture = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    dispatcher = v6->_dispatcher;
    v6->_dispatcher = (HFHomeKitDispatcher *)v9;

    -[HFHomeKitDispatcher addHomeManagerObserver:](v6->_dispatcher, "addHomeManagerObserver:", v6);
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingHomeIDsFromInvitations = v6->_pendingHomeIDsFromInvitations;
    v6->_pendingHomeIDsFromInvitations = v11;

    v13 = +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
    objc_initWeak(&location, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v16 = HFHomePreferencesChangedNotification;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100016A90;
    v19[3] = &unk_1000B5FE0;
    objc_copyWeak(&v20, &location);
    v17 = objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v16, 0, v15, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_reloadStateWithInvitation:(id)a3 home:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unsigned int v63;
  unsigned int v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  unsigned int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  __CFString *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  id v94[4];
  uint8_t buf[4];
  _BYTE v96[20];
  id v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;

  v88 = a3;
  v6 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    v7 = HFLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Skipping reloading initial setup state as this is an internal unit test", buf, 2u);
    }
    goto LABEL_70;
  }
  +[HUHomeEnergyWrapper setupGridForecastSnapshotsFor:](HUHomeEnergyWrapper, "setupGridForecastSnapshotsFor:", v6);
  v9 = HFLogForCategory(9);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "hf_prettyDescription"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v96 = v11;
    *(_WORD *)&v96[8] = 2112;
    *(_QWORD *)&v96[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Recomputing initial setup state. invitation = %@ | home = %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeManager"));
  v89 = objc_msgSend(v13, "dataSyncState");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeManager"));
  v86 = objc_msgSend(v15, "status");

  v8 = CFPreferencesCopyAppValue(HFForcedDataSyncStateKey, HFHomeDomain);
  if (v8)
  {
    v16 = HFLogForCategory(9);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v96 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using override data sync state %@", buf, 0xCu);
    }

    v89 = -[NSObject unsignedIntegerValue](v8, "unsignedIntegerValue");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController onboardingStatesForHome:](HOOnboardingRootNavigationController, "onboardingStatesForHome:", v6));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:](HOOnboardingRootNavigationController, "onboardingStatesForHome:pendingHomeIDsFromInvitations:", v6, v19));

  v20 = HFLogForCategory(9);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = NSStringFromHMHomeManagerDataSyncState(v89);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = HMHomeManagerStatusToString(v86);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v87));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "home"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "hf_prettyDescription"));
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v96 = v23;
    *(_WORD *)&v96[8] = 2112;
    *(_QWORD *)&v96[10] = v25;
    *(_WORD *)&v96[18] = 2048;
    v97 = v86;
    v98 = 2112;
    v99 = v26;
    v100 = 2112;
    v101 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "dataSyncState: %@, status: %@ (%lu), desired onboardingStates: %@ for home: %@", buf, 0x34u);

  }
  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v30 = v89 == (id)3 || (v86 & 0x20) != 0;
  else
    v30 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "homeManager"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hh2MigrationFailedError"));
  if (v33)
    v34 = (v89 == (id)4) & ~objc_msgSend(v32, "hasOptedToHH2");
  else
    v34 = 0;

  v35 = HFLogForCategory(9);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hh2MigrationFailedError"));
    v38 = objc_msgSend(v32, "hasOptedToHH2");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v96 = v34;
    *(_WORD *)&v96[4] = 2112;
    *(_QWORD *)&v96[6] = v37;
    *(_WORD *)&v96[14] = 1024;
    *(_DWORD *)&v96[16] = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "isHH2MigrationFailedError: %d, hh2MigrationFailedError: %@, hasOptedToHH2: %d", buf, 0x18u);

  }
  if (!v30)
  {
    if (v34)
    {
      v41 = HFLogForCategory(9);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = NSStringFromHMHomeManagerDataSyncState(v89);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v96 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Setting desiredState from syncState: %@ to HOInitialSetupPresentationStateNone since isHH2MigrationFailedError is YES", buf, 0xCu);

      }
      v85 = 0;
      v39 = 0;
      v40 = 0;
      goto LABEL_50;
    }
    if (v89 != (id)1)
    {
      v85 = 0;
      v39 = 0;
      v40 = 2;
      goto LABEL_51;
    }
    if (!objc_msgSend(v87, "count"))
    {
      if (v88)
      {
        v42 = objc_msgSend(&off_1000BF2C0, "mutableCopy");
        v50 = objc_opt_class(HMIncomingHomeInvitation);
        v51 = v88;
        if ((objc_opt_isKindOfClass(v51, v50) & 1) != 0)
          v52 = v51;
        else
          v52 = 0;
        v53 = v52;

        if (objc_msgSend(v53, "isInviteeRestrictedGuest"))
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[HOUtilities onboardingStatesForRestrictedGuestInvitation:](HOUtilities, "onboardingStatesForRestrictedGuestInvitation:", v53));
          -[NSObject na_safeAddObjectsFromArray:](v42, "na_safeAddObjectsFromArray:", v54);

        }
        v84 = -[NSObject copy](v42, "copy");

        v55 = HFLogForCategory(9);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v84));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "hf_prettyDescription"));
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v96 = "-[HOInitialSetupStateController _reloadStateWithInvitation:home:]";
          *(_WORD *)&v96[8] = 2112;
          *(_QWORD *)&v96[10] = v57;
          *(_WORD *)&v96[18] = 2112;
          v97 = v58;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "(%s) Including onboardingStates %@ for %@", buf, 0x20u);

        }
        v85 = 0;
        v39 = 0;
        v40 = 3;
        v87 = v84;
        goto LABEL_50;
      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedOnboardingController](self, "presentedOnboardingController"));
      v80 = objc_msgSend(v79, "isDisplayingRestrictedGuestIncomingInvitationFlow");

      if (!v80)
      {
        v85 = 0;
        v39 = 0;
        v40 = 0;
        goto LABEL_51;
      }
      v81 = HFLogForCategory(9);
      v42 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v87));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "hf_prettyDescription"));
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v96 = "-[HOInitialSetupStateController _reloadStateWithInvitation:home:]";
        *(_WORD *)&v96[8] = 2112;
        *(_QWORD *)&v96[10] = v82;
        *(_WORD *)&v96[18] = 2112;
        v97 = v83;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(%s) Including onboardingStates %@ for %@", buf, 0x20u);

      }
      v85 = 0;
      v39 = 0;
      goto LABEL_49;
    }
    v45 = objc_msgSend(v87, "containsObject:", &off_1000BF560);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedOnboardingController](self, "presentedOnboardingController"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "onboardingStates"));
    v48 = objc_msgSend(v47, "containsObject:", &off_1000BF560);

    if ((v45 ^ 1 | v48) == 1)
    {
      if ((v45 | v48 ^ 1) == 1)
      {
        if (v88)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "hf_prettyDescription"));
          v85 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Show Invitation %@"), v49));

          v39 = 1;
        }
        else
        {
          v85 = 0;
          v39 = 0;
        }
LABEL_47:
        v60 = HFLogForCategory(9);
        v42 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v96 = v85;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "preemptionReason: %@", buf, 0xCu);
        }
LABEL_49:
        v40 = 3;
LABEL_50:

        goto LABEL_51;
      }
      v39 = 1;
      v59 = CFSTR("Dismiss Invitation Onboarding");
    }
    else
    {
      v39 = 1;
      v59 = CFSTR("Show Invitation Onboarding");
    }
    v85 = (__CFString *)v59;
    goto LABEL_47;
  }
  v85 = 0;
  v39 = 0;
  v40 = 1;
LABEL_51:
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "home"));
  v63 = +[HFServiceMigrationController homeNeedsMigration:](HFServiceMigrationController, "homeNeedsMigration:", v62);

  if (v89 == (id)1)
    v64 = v63;
  else
    v64 = 0;
  if (v64 == 1)
  {
    v65 = objc_alloc((Class)HFServiceMigrationController);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "home"));
    v68 = objc_msgSend(v65, "initWithHome:", v67);

    v69 = objc_msgSend(v68, "migrateServicesToAccessory");
  }
  v70 = 0;
  if (v6 && v89 == (id)1)
  {
    if ((+[HFUtilities isInternalTest](HFUtilities, "isInternalTest") & 1) != 0)
    {
      v70 = 0;
    }
    else
    {
      v71 = objc_alloc((Class)HFRedesignMigrationController);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "home"));
      v70 = objc_msgSend(v71, "initWithHome:", v73);

      objc_msgSend(v70, "performMigrationIfNeeded");
    }
  }
  if (v40 == -[HOInitialSetupStateController presentationState](self, "presentationState"))
    v74 = v39;
  else
    v74 = 1;
  if ((v74 & 1) != 0)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded](self, "_dismissPresentedViewControllerIfNeeded"));
    -[HOInitialSetupStateController setPresentationState:](self, "setPresentationState:", v40);
    objc_initWeak((id *)buf, self);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_100016C6C;
    v92[3] = &unk_1000B6058;
    objc_copyWeak(v94, (id *)buf);
    v94[1] = (id)v40;
    v94[2] = v89;
    v94[3] = v86;
    v93 = v87;
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "flatMap:", v92));
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_100016DA4;
    v90[3] = &unk_1000B5A00;
    v91 = v70;
    v77 = objc_msgSend(v76, "addCompletionBlock:", v90);

    objc_destroyWeak(v94);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if ((id)-[HOInitialSetupStateController presentationState](self, "presentationState") == (id)2)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedDataSyncingController](self, "presentedDataSyncingController"));
      objc_msgSend(v78, "setDataSyncState:", v89);

    }
    -[HOInitialSetupStateController _updateOnboardingCompleteFutureForNewPresentationState:](self, "_updateOnboardingCompleteFutureForNewPresentationState:", v40);
    objc_msgSend(v70, "performMigrationSuccessTasks");
  }

LABEL_70:
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (HOInitialSetupStateControllerDelegate)delegate
{
  return (HOInitialSetupStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)showOnboardingIfNeededForHomeInvitation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController dispatcher](self, "dispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeFuture"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016C14;
  v9[3] = &unk_1000B6030;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  v8 = objc_msgSend(v6, "addCompletionBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (id)_presentiCloudDisabledControllerWithState:(unint64_t)a3 andStatus:(unint64_t)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  HOiCloudDisabledViewController *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;

  v7 = HFLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromHMHomeManagerDataSyncState(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v15 = 138412290;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting data syncing controller for state %@", (uint8_t *)&v15, 0xCu);

  }
  v11 = objc_alloc_init(HOiCloudDisabledViewController);
  -[HOiCloudDisabledViewController setDataSyncState:](v11, "setDataSyncState:", a3);
  -[HOiCloudDisabledViewController setStatus:](v11, "setStatus:", a4);
  -[HOiCloudDisabledViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 0);
  -[HOInitialSetupStateController setPresentediCloudWarningController:](self, "setPresentediCloudWarningController:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateController:presentViewController:forState:", self, v11, 1));

  return v13;
}

- (id)_presentDataSyncingControllerWithState:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  HODataSyncingViewController *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;

  v5 = HFLogForCategory(9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromHMHomeManagerDataSyncState(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v13 = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting data syncing controller for state %@", (uint8_t *)&v13, 0xCu);

  }
  v9 = objc_alloc_init(HODataSyncingViewController);
  -[HODataSyncingViewController setDataSyncState:](v9, "setDataSyncState:", a3);
  -[HODataSyncingViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 1);
  -[HOInitialSetupStateController setPresentedDataSyncingController:](self, "setPresentedDataSyncingController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateController:presentViewController:forState:", self, v9, 2));

  return v11;
}

- (id)_presentOnboardingWithStates:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  HOOnboardingRootNavigationController *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;

  v4 = a3;
  v5 = HFLogForCategory(9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HOOnboardingRootNavigationController stringForOnboardingStates:](HOOnboardingRootNavigationController, "stringForOnboardingStates:", v4));
    v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Displaying onboarding for states %@", (uint8_t *)&v12, 0xCu);

  }
  v8 = -[HOOnboardingRootNavigationController initWithOnboardingStates:]([HOOnboardingRootNavigationController alloc], "initWithOnboardingStates:", v4);
  -[HOOnboardingRootNavigationController setOnboardingDelegate:](v8, "setOnboardingDelegate:", self);
  -[HOOnboardingRootNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  -[HOInitialSetupStateController setPresentedOnboardingController:](self, "setPresentedOnboardingController:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateController:presentViewController:forState:", self, v8, 3));

  return v10;
}

- (id)_dismissPresentedViewControllerIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  unint64_t v21;
  const __CFString *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  objc_class *v28;
  NSString *v29;
  char *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  __CFString *v36;
  unint64_t v37;
  const __CFString *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  const __CFString *v43;
  objc_class *v44;
  NSString *v45;
  NSObject *v46;
  NSObject *v47;
  int v49;
  const char *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;

  v3 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController _presentedViewControllerForState:](self, "_presentedViewControllerForState:", -[HOInitialSetupStateController presentationState](self, "presentationState")));
  v5 = objc_opt_class(HOOnboardingRootNavigationController);
  v6 = v4;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
  {
    v9 = HFLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[HOInitialSetupStateController presentationState](self, "presentationState");
      if (v11 > 3)
        v12 = CFSTR("(unknown)");
      else
        v12 = off_1000B60C8[v11];
      v49 = 136315650;
      v50 = "-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded]";
      v51 = 2112;
      v52 = v6;
      v53 = 2112;
      v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%s) onboardingRootNav is nil because presentedVC = %@ | presentationState = %@", (uint8_t *)&v49, 0x20u);
    }

  }
  v13 = -[__CFString hasNextStepInRestrictedGuestIncomingInvitationFlow](v8, "hasNextStepInRestrictedGuestIncomingInvitationFlow");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString visibleViewController](v8, "visibleViewController"));
  if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___HOOnboardingChildViewController))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if ((objc_opt_respondsToSelector(v16, "didUserTriggerOnboardingDismissal") & 1) != 0)
  {
    v17 = objc_msgSend(v16, "didUserTriggerOnboardingDismissal");
    if (!v13)
      goto LABEL_22;
  }
  else
  {
    v17 = 0;
    if (!v13)
      goto LABEL_22;
  }
  if ((id)-[HOInitialSetupStateController presentationState](self, "presentationState") == (id)3)
    v18 = v17;
  else
    v18 = 1;
  if ((v18 & 1) != 0)
  {
LABEL_22:
    if (!v6)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentlyPresentedViewController"));

      v25 = HFLogForCategory(9);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (!v27)
        {
LABEL_44:

          -[HOInitialSetupStateController _setPresentedViewController:forState:](self, "_setPresentedViewController:forState:", 0, -[HOInitialSetupStateController presentationState](self, "presentationState"));
          -[HOInitialSetupStateController setPresentationState:](self, "setPresentationState:", 0);
          v46 = v3;
          v3 = v46;
          goto LABEL_48;
        }
        v28 = (objc_class *)objc_opt_class(self);
        v29 = NSStringFromClass(v28);
        v30 = (char *)objc_claimAutoreleasedReturnValue(v29);
        v49 = 138412546;
        v50 = v30;
        v51 = 2112;
        v52 = v24;
        v31 = "%@: No presentedVC to dismiss, but delegate has presented view controller: %@";
        v32 = v26;
        v33 = 22;
      }
      else
      {
        if (!v27)
          goto LABEL_44;
        v44 = (objc_class *)objc_opt_class(self);
        v45 = NSStringFromClass(v44);
        v30 = (char *)objc_claimAutoreleasedReturnValue(v45);
        v49 = 138412290;
        v50 = v30;
        v31 = "%@: No presentedVC to dismiss, and delegate doesn't have a view controller presented";
        v32 = v26;
        v33 = 12;
      }
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v49, v33);

      goto LABEL_44;
    }
    v19 = HFLogForCategory(9);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = -[HOInitialSetupStateController presentationState](self, "presentationState");
      if (v21 > 3)
        v22 = CFSTR("(unknown)");
      else
        v22 = off_1000B60C8[v21];
      v49 = 138412546;
      v50 = (const char *)v22;
      v51 = 2112;
      v52 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Dismissing presented initial setup state %@ VC: %@", (uint8_t *)&v49, 0x16u);
    }

    v39 = objc_claimAutoreleasedReturnValue(-[__CFString presentingViewController](v6, "presentingViewController"));
    if (!v39)
    {
      v40 = objc_opt_class(HOOnboardingRootNavigationController);
      if ((objc_opt_isKindOfClass(v6, v40) & 1) != 0)
        goto LABEL_36;
      v41 = HFLogForCategory(9);
      v39 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v42 = -[HOInitialSetupStateController presentationState](self, "presentationState");
        if (v42 > 3)
          v43 = CFSTR("(unknown)");
        else
          v43 = off_1000B60C8[v42];
        v49 = 138412546;
        v50 = (const char *)v6;
        v51 = 2112;
        v52 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "No presenting VC for presented VC %@ even though we think it's presented! Presentation state: %@", (uint8_t *)&v49, 0x16u);
      }
    }

LABEL_36:
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
    v26 = v3;
    v3 = objc_claimAutoreleasedReturnValue(-[__CFString stateController:dismissViewController:forState:](v24, "stateController:dismissViewController:forState:", self, v6, -[HOInitialSetupStateController presentationState](self, "presentationState")));
    goto LABEL_44;
  }
  v34 = HFLogForCategory(9);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString visibleViewController](v8, "visibleViewController"));
    v37 = -[HOInitialSetupStateController presentationState](self, "presentationState");
    if (v37 > 3)
      v38 = CFSTR("(unknown)");
    else
      v38 = off_1000B60C8[v37];
    v49 = 136315650;
    v50 = "-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded]";
    v51 = 2112;
    v52 = v36;
    v53 = 2112;
    v54 = v38;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "(%s) Not dismissing the currently presented restricted guest incoming invitation onboarding flow, because it should move onto the next view controller instead of dismissing | visibleVC = %@ | state = %@", (uint8_t *)&v49, 0x20u);

  }
  v46 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_48:
  v47 = v46;

  return v47;
}

- (void)setPresentationState:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  unint64_t presentationState;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;

  if (self->_presentationState != a3)
  {
    v5 = HFLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class(self);
      v8 = NSStringFromClass(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v9;
      presentationState = self->_presentationState;
      if (presentationState > 3)
        v12 = CFSTR("(unknown)");
      else
        v12 = off_1000B60C8[presentationState];
      if (a3 > 3)
        v13 = CFSTR("(unknown)");
      else
        v13 = off_1000B60C8[a3];
      v14 = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Changing presentation state from %@ to %@", (uint8_t *)&v14, 0x20u);

    }
  }
  self->_presentationState = a3;
}

- (void)setPresentedOnboardingController:(id)a3
{
  id v4;
  HOOnboardingRootNavigationController *v5;
  HOOnboardingRootNavigationController *v6;
  HOOnboardingRootNavigationController *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  HOOnboardingRootNavigationController *presentedOnboardingController;
  HOOnboardingRootNavigationController *v15;
  int v16;
  void *v17;
  __int16 v18;
  HOOnboardingRootNavigationController *v19;
  __int16 v20;
  HOOnboardingRootNavigationController *v21;

  v4 = a3;
  v5 = self->_presentedOnboardingController;
  v6 = (HOOnboardingRootNavigationController *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v5)
    {
      v8 = -[HOOnboardingRootNavigationController isEqual:](v5, "isEqual:", v6);

      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    v9 = HFLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      presentedOnboardingController = self->_presentedOnboardingController;
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = presentedOnboardingController;
      v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Changing presented onboarding controller from %@ to %@", (uint8_t *)&v16, 0x20u);

    }
  }
LABEL_10:
  v15 = self->_presentedOnboardingController;
  self->_presentedOnboardingController = v7;

}

- (id)_presentedViewControllerForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = v6;
  v16 = v5;
  v17 = v4;
  v18 = v3;
  switch(a3)
  {
    case 0uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentlyPresentedViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedOnboardingController](self, "presentedOnboardingController"));

      if (v11 == v12)
        goto LABEL_4;
      v13 = 0;
      break;
    case 1uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentediCloudWarningController](self, "presentediCloudWarningController"));
      break;
    case 2uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedDataSyncingController](self, "presentedDataSyncingController"));
      break;
    case 3uLL:
LABEL_4:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController presentedOnboardingController](self, "presentedOnboardingController", v15, v16, v17, v18, v7, v8));
      break;
    default:
      v13 = 0;
      break;
  }
  return v13;
}

- (void)_setPresentedViewController:(id)a3 forState:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;

  v6 = a3;
  v7 = HFLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    if (a4 > 3)
      v13 = CFSTR("(unknown)");
    else
      v13 = off_1000B60C8[a4];
    *(_DWORD *)buf = 138412802;
    v35 = v11;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting presented view controller for state %@ VC: %@", buf, 0x20u);

  }
  v14 = -[HOInitialSetupStateController presentationState](self, "presentationState");
  switch(v14)
  {
    case 1uLL:
      v22 = objc_opt_class(HOiCloudDisabledViewController);
      v23 = v6;
      v24 = v23;
      if (v23)
      {
        if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0)
          v25 = v24;
        else
          v25 = 0;
        v19 = v25;
        if (!v19)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v22, objc_opt_class(v24));

        }
      }
      else
      {
        v19 = 0;
      }

      -[HOInitialSetupStateController setPresentediCloudWarningController:](self, "setPresentediCloudWarningController:", v19);
      goto LABEL_33;
    case 2uLL:
      v28 = objc_opt_class(HODataSyncingViewController);
      v29 = v6;
      v30 = v29;
      if (v29)
      {
        if ((objc_opt_isKindOfClass(v29, v28) & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v19 = v31;
        if (!v19)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v28, objc_opt_class(v30));

        }
      }
      else
      {
        v19 = 0;
      }

      -[HOInitialSetupStateController setPresentedDataSyncingController:](self, "setPresentedDataSyncingController:", v19);
      goto LABEL_33;
    case 3uLL:
      v15 = objc_opt_class(HOOnboardingRootNavigationController);
      v16 = v6;
      v17 = v16;
      if (v16)
      {
        if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;
        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class(v17));

        }
      }
      else
      {
        v19 = 0;
      }

      -[HOInitialSetupStateController setPresentedOnboardingController:](self, "setPresentedOnboardingController:", v19);
LABEL_33:

      break;
  }

}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "count") != (id)1)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  if (objc_msgSend(v5, "invitationState") != (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v7 = objc_msgSend(v6, "invitationState");

    if (v7 == (id)3)
      goto LABEL_6;
LABEL_5:
    -[HOInitialSetupStateController reloadState](self, "reloadState");
    goto LABEL_6;
  }

LABEL_6:
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
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;

  v5 = a4;
  v6 = HFLogForCategory(9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v14 = 136315650;
    v15 = "-[HOInitialSetupStateController homeManager:didAddHome:]";
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) added new home = %@ | Removing new home from pendingHomeIDs if possible. Remaining pending homes = %@", (uint8_t *)&v14, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
    objc_msgSend(v12, "removeObject:", v13);

  }
}

- (void)onboardingNavigationControllerDidFinish:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = HFLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing onboarding if needed and finishing onboardingCompleteFuture", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController _dismissPresentedViewControllerIfNeeded](self, "_dismissPresentedViewControllerIfNeeded"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018014;
  v8[3] = &unk_1000B60A8;
  v8[4] = self;
  v7 = objc_msgSend(v6, "addSuccessBlock:", v8);

}

- (void)onboardingNavigationController:(id)a3 acceptedInvitationAndWaitingForHomeToLand:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    *(_DWORD *)buf = 136315650;
    v21 = "-[HOInitialSetupStateController onboardingNavigationController:acceptedInvitationAndWaitingForHomeToLand:]";
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was accepted and is pending for new home to land. invitation = %@ | navigationController = %@", buf, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homes"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018220;
  v18[3] = &unk_1000B5E18;
  v14 = v7;
  v19 = v14;
  v15 = objc_msgSend(v13, "na_any:", v18);

  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeUUID"));
    objc_msgSend(v16, "na_safeAddObject:", v17);

  }
}

- (void)onboardingNavigationController:(id)a3 didAcceptInvitation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v17 = 136315906;
    v18 = "-[HOInitialSetupStateController onboardingNavigationController:didAcceptInvitation:]";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation acceptance completed. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v17, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
    objc_msgSend(v15, "removeObject:", v16);

  }
}

- (void)onboardingNavigationController:(id)a3 didDeclineInvitation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v17 = 136315906;
    v18 = "-[HOInitialSetupStateController onboardingNavigationController:didDeclineInvitation:]";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was declined. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v17, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
    objc_msgSend(v15, "removeObject:", v16);

  }
}

- (void)onboardingNavigationController:(id)a3 didIgnoreInvitation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v17 = 136315906;
    v18 = "-[HOInitialSetupStateController onboardingNavigationController:didIgnoreInvitation:]";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was ignored. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v17, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
    objc_msgSend(v15, "removeObject:", v16);

  }
}

- (void)onboardingNavigationController:(id)a3 didReportJunkInvitation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_prettyDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v17 = 136315906;
    v18 = "-[HOInitialSetupStateController onboardingNavigationController:didReportJunkInvitation:]";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was reported as junk. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | navigationController = %@", (uint8_t *)&v17, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUUID"));
    objc_msgSend(v15, "removeObject:", v16);

  }
}

- (void)onboardingNavigationController:(id)a3 didDecideLaterInvitation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = HFLogForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_prettyDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v20 = 136316162;
    v21 = "-[HOInitialSetupStateController onboardingNavigationController:didDecideLaterInvitation:error:]";
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) Incoming invitation was marked as decided later. Invitation's home is no longer pending. invitation = %@ | pending homes = %@ | error = %@ | navigationController = %@", (uint8_t *)&v20, 0x34u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeUUID"));
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOInitialSetupStateController pendingHomeIDsFromInvitations](self, "pendingHomeIDsFromInvitations"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeUUID"));
    objc_msgSend(v18, "removeObject:", v19);

  }
}

- (HOOnboardingRootNavigationController)presentedOnboardingController
{
  return self->_presentedOnboardingController;
}

- (HODataSyncingViewController)presentedDataSyncingController
{
  return self->_presentedDataSyncingController;
}

- (void)setPresentedDataSyncingController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedDataSyncingController, a3);
}

- (void)setOnboardingCompleteFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingCompleteFuture, a3);
}

- (HOiCloudDisabledViewController)presentediCloudWarningController
{
  return self->_presentediCloudWarningController;
}

- (void)setPresentediCloudWarningController:(id)a3
{
  objc_storeStrong((id *)&self->_presentediCloudWarningController, a3);
}

- (NSMutableSet)pendingHomeIDsFromInvitations
{
  return self->_pendingHomeIDsFromInvitations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHomeIDsFromInvitations, 0);
  objc_storeStrong((id *)&self->_presentediCloudWarningController, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_onboardingCompleteFuture, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentedDataSyncingController, 0);
  objc_storeStrong((id *)&self->_presentedOnboardingController, 0);
}

@end
