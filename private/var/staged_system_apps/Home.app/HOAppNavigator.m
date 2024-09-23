@implementation HOAppNavigator

+ (HOAppNavigator)navigatorWithRootViewController:(id)a3 baseController:(id)a4
{
  id v5;
  id v6;
  HOAppNavigator *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_new(HOAppNavigator);
  -[HOAppNavigator setRootViewController:](v7, "setRootViewController:", v6);

  -[HOAppNavigator setBaseController:](v7, "setBaseController:", v5);
  return v7;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void)setBaseController:(id)a3
{
  objc_storeStrong((id *)&self->_baseController, a3);
}

+ (void)addViewControllersToRegistry
{
  if (qword_1000D27A0 != -1)
    dispatch_once(&qword_1000D27A0, &stru_1000B6E40);
}

- (HOHomePodProfileInstaller)homePodProfileInstaller
{
  HOHomePodProfileInstaller *homePodProfileInstaller;
  HOHomePodProfileInstaller *v4;
  HOHomePodProfileInstaller *v5;

  homePodProfileInstaller = self->_homePodProfileInstaller;
  if (!homePodProfileInstaller)
  {
    v4 = objc_alloc_init(HOHomePodProfileInstaller);
    v5 = self->_homePodProfileInstaller;
    self->_homePodProfileInstaller = v4;

    homePodProfileInstaller = self->_homePodProfileInstaller;
  }
  return homePodProfileInstaller;
}

- (void)createOrShowHomeWithName:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002BF90;
  v14[3] = &unk_1000B6E90;
  objc_copyWeak(&v15, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v14));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C07C;
  v11[3] = &unk_1000B6EB8;
  objc_copyWeak(&v13, &location);
  v9 = v6;
  v12 = v9;
  v10 = objc_msgSend(v8, "recover:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)showHomeWithFuture:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C264;
  v6[3] = &unk_1000B6E90;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "flatMap:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)showHomeForName:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[HMHomeManager hf_homeFutureForName:](HMHomeManager, "hf_homeFutureForName:", a3));
  -[HOAppNavigator showHomeWithFuture:](self, "showHomeWithFuture:", v4);

}

- (id)createOrShowRoomWithName:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C4A4;
  v12[3] = &unk_1000B6EE0;
  objc_copyWeak(&v14, &location);
  v8 = v6;
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recover:", &stru_1000B6F00));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (id)createOrEditActionSetWithName:(id)a3 home:(id)a4 switchToHomeTab:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C6E0;
  v13[3] = &unk_1000B6F50;
  objc_copyWeak(&v15, &location);
  v16 = a5;
  v10 = v8;
  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addSuccessBlock:", v13));

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_showCreateOrEditActionSetViewControllerWithActionSetName:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionSets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name LIKE[cd] %@"), v11));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v8));

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      -[HOAppNavigator _editActionSet:home:](self, "_editActionSet:home:", v10, v6);

    }
    else
    {
      -[HOAppNavigator _createActionSetWithName:home:](self, "_createActionSetWithName:home:", v11, v6);
    }

  }
}

- (void)showServiceWithName:(id)a3 serviceType:(id)a4 homeName:(id)a5 roomName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = HFLogForCategory(61);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Show service:%@, type:%@, home:%@, room:%@", buf, 0x2Au);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HMHomeManager hf_homeFutureForName:](HMHomeManager, "hf_homeFutureForName:", v12));
  objc_initWeak((id *)buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002CAC8;
  v21[3] = &unk_1000B6F78;
  objc_copyWeak(&v25, (id *)buf);
  v17 = v13;
  v22 = v17;
  v18 = v10;
  v23 = v18;
  v19 = v11;
  v24 = v19;
  v20 = objc_msgSend(v16, "flatMap:", v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

}

- (void)showCameraWithName:(id)a3 homeName:(id)a4 startDate:(id)a5 endDate:(id)a6 roomName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = HFLogForCategory(61);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Show camera:%@, startDate:%@, endDate:%@, home:%@, room:%@", buf, 0x34u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[HMHomeManager hf_homeFutureForName:](HMHomeManager, "hf_homeFutureForName:", v13));
  objc_initWeak((id *)buf, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002CDB8;
  v26[3] = &unk_1000B6FF0;
  objc_copyWeak(&v32, (id *)buf);
  v20 = v16;
  v27 = v20;
  v21 = v12;
  v28 = v21;
  v22 = v13;
  v29 = v22;
  v23 = v14;
  v30 = v23;
  v24 = v15;
  v31 = v24;
  v25 = objc_msgSend(v19, "flatMap:", v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

- (void)showHomeDashboardCellForActionSet:(id)a3 executeActionSetFuture:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeFuture"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002D264;
  v11[3] = &unk_1000B5C60;
  objc_copyWeak(&v12, &location);
  v10 = objc_msgSend(v9, "addSuccessBlock:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator baseController](self, "baseController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentConfirmationAlertForExecutingTriggerWithIdentifier:", v4));

  return v6;
}

- (id)showHomeInvitation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator baseController](self, "baseController"));
  objc_msgSend(v5, "showOnboardingIfNeededForHomeInvitation:", v4);

  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (id)showRoomWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeFuture"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D4C4;
  v10[3] = &unk_1000B6EE0;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v10));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)showCardForHomeKitIdentifier:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 inHome:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  Block_layout *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD v25[5];
  id v26;
  Block_layout *v27;
  _QWORD v28[5];
  id v29;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v11));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002D89C;
  v28[3] = &unk_1000B70C0;
  v28[4] = self;
  v13 = v11;
  v29 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", v28));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002DAA8;
  v25[3] = &unk_1000B7128;
  v26 = v13;
  v27 = &stru_1000B7098;
  v25[4] = self;
  v15 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", v25));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002DD98;
  v20[3] = &unk_1000B7150;
  v21 = v10;
  v22 = &stru_1000B7100;
  v23 = a4;
  v24 = a5;
  v17 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "flatMap:", v20));

  return v18;
}

- (id)showAccessory:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  HOAppNavigator *v19;
  unint64_t v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = objc_msgSend(objc_alloc((Class)HFBridgeItemProvider), "initWithHome:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reloadItems"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002DFEC;
  v15[3] = &unk_1000B71A0;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  v19 = self;
  v20 = a4;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v15));

  return v13;
}

- (id)showHomePodProfileInstallationFlowWithSender:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator homePodProfileInstaller](self, "homePodProfileInstaller"));
  v6 = objc_msgSend(v5, "isInstallNavigationControllerPresented");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator homePodProfileInstaller](self, "homePodProfileInstaller"));
    objc_msgSend(v7, "dismissInstallProfileViewControllerWithAnimation:", 0);

  }
  -[HOAppNavigator dismissViewController](self, "dismissViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator showHomeTab](self, "showHomeTab"));
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E35C;
  v12[3] = &unk_1000B71C8;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  v10 = objc_msgSend(v8, "addCompletionBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (id)showSoftwareUpdateForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator showHome:](self, "showHome:", v4));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002E510;
  v9[3] = &unk_1000B7230;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v9));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)showAboutResidentDeviceView
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)HUAboutResidentDeviceViewController), "initWithStyle:", 1);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v3);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v6;
}

- (id)addAccessoryWithURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v3 = a3;
  if ((+[HFUtilities supportsAccessorySetup](HFUtilities, "supportsAccessorySetup") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    if ((+[HMAccessorySetupCoordinator isSetupPayloadURL:](HMAccessorySetupCoordinator, "isSetupPayloadURL:", v3) & 1) == 0)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryItems"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &stru_1000B7270));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));

      v4 = (void *)v8;
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002E834;
    v22[3] = &unk_1000B72C0;
    v9 = v4;
    v23 = v9;
    v10 = v3;
    v24 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v22));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_10002EA14;
    v19 = &unk_1000B7350;
    v20 = v10;
    v21 = v9;
    v12 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", &v16));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", &stru_1000B7370, v16, v17, v18, v19));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v14;
}

- (id)showSiriPersonalRequestsSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests enablement sheet", buf, 2u);
    }

    -[HOAppNavigator dismissViewController](self, "dismissViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities home:onboardPersonalRequestsFromPresentingViewController:](HUHomeFeatureOnboardingUtilities, "home:onboardPersonalRequestsFromPresentingViewController:", v6, v10));
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests settings page", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002EFC8;
    v13[3] = &unk_1000B7398;
    v14 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v14, v13));
    v10 = v14;
  }

  return v11;
}

- (id)showRecognizeMyVoiceSettingsForHome:(id)a3 showEnablementSheet:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[8];
  uint64_t v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  v7 = HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing Recognize My Voice enablement sheet", buf, 2u);
    }

    -[HOAppNavigator dismissViewController](self, "dismissViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
    v17 = OnboardingDisplayOption_OnboardingFromUserInput;
    v18 = &__kCFBooleanTrue;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:", v6, v10, v11));

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing Personal Requests settings page", buf, 2u);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002F1A8;
    v14[3] = &unk_1000B7398;
    v15 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v15, v14));
    v10 = v15;
  }

  return v12;
}

- (id)showUserDetails:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2080;
    v17 = "-[HOAppNavigator showUserDetails:]";
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing deailts for user %@", buf, 0x20u);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F318;
  v12[3] = &unk_1000B7398;
  v13 = v4;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showUser:customizationBlock:](self, "_showUser:customizationBlock:", v9, v12));

  return v10;
}

- (id)showUserLockSettingsForHome:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing user lock settings page", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F418;
  v10[3] = &unk_1000B7398;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v7, v10));

  return v8;
}

- (id)showLocksOnboardingForHome:(id)a3 onboardingType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Showing lock onboarding", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F51C;
  v11[3] = &unk_1000B73E0;
  v12 = v5;
  v13 = a4;
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v11));

  return v9;
}

- (id)showLocksFirmwareSetupForHome:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a3;
  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing lock firmware setup", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F6C0;
  v9[3] = &unk_1000B7428;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v9));

  return v7;
}

- (id)showHH2OnboardingFlowForHome:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing HH2 Upgrade Onboarding", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F83C;
  v10[3] = &unk_1000B72C0;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v10));

  return v8;
}

- (id)showDropInUI:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HOAppNavigator *v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  -[HOAppNavigator dismissViewController](self, "dismissViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v7));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002FBF0;
  v17[3] = &unk_1000B70C0;
  v17[4] = self;
  v18 = v7;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v17));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002FD1C;
  v14[3] = &unk_1000B6B20;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = objc_msgSend(v10, "addCompletionBlock:", v14);

  return v10;
}

- (id)showDefaultAccountForHome:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing user default account page", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002FEE0;
  v10[3] = &unk_1000B7398;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v7, v10));

  return v8;
}

- (id)showCameraProfile:(id)a3 clipID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  HOAppNavigator *v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init((Class)NAFuture);
    v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clipManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandlerAdapter"));
    objc_msgSend(v10, "fetchClipWithUUID:completion:", v9, v11);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000300C8;
    v16[3] = &unk_1000B7478;
    v17 = v6;
    v18 = self;
    v19 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v16));

  }
  else
  {
    v13 = HFLogForCategory(14);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Show camera profile:%@.", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showRoomContainedObject:secondaryDestination:](self, "_showRoomContainedObject:secondaryDestination:", v6, 0));
  }

  return v12;
}

- (id)showFeedbackFlowForCameraClipID:(id)a3 cameraProfile:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  HOAppNavigator *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(20);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Show feedback flow for clip identifier:%@ and camera profile %@.", buf, 0x16u);
    }

    v11 = objc_alloc_init((Class)NAFuture);
    v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clipManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandlerAdapter"));
    objc_msgSend(v13, "fetchClipWithUUID:completion:", v12, v14);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100030448;
    v17[3] = &unk_1000B74C8;
    v18 = v7;
    v19 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v17));

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100078378(v10);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v15;
}

- (id)showSettingsForCameraProfile:(id)a3
{
  return -[HOAppNavigator _showRoomContainedObject:secondaryDestination:](self, "_showRoomContainedObject:secondaryDestination:", a3, 1);
}

- (id)showNetworkSettingsForHome:(id)a3
{
  return -[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a3, &stru_1000B74E8);
}

- (id)showNetworkSettingsForNetworkConfigurationProfile:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003079C;
  v9[3] = &unk_1000B7398;
  v10 = a3;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a4, v9));

  return v7;
}

- (id)showNetworkSettingsForAccessory:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000308D0;
  v9[3] = &unk_1000B7398;
  v10 = a3;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a4, v9));

  return v7;
}

- (id)showBridgeSettingsForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030A14;
  v9[3] = &unk_1000B7398;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v5, v9));

  return v7;
}

- (id)showBridgeSettingsForHome:(id)a3
{
  return -[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a3, &stru_1000B7558);
}

- (id)showNotificationSettingsForHome:(id)a3
{
  return -[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a3, &stru_1000B7578);
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 inHome:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030BDC;
  v9[3] = &unk_1000B7398;
  v10 = a3;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a4, v9));

  return v7;
}

- (id)showFaceRecognitionSettingsForHome:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAppNavigator.m"), 809, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v5, &stru_1000B7598));

  return v6;
}

- (id)showFaceRecognitionSettingsForPerson:(id)a3 personManager:(id)a4 inHome:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAppNavigator.m"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100030E24;
  v17[3] = &unk_1000B75E8;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v11, v17));

  return v14;
}

- (id)showFaceRecognitionSettingsForUnknownPersonEvent:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOAppNavigator.m"), 828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100031008;
  v13[3] = &unk_1000B7398;
  v14 = v7;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", v8, v13));

  return v10;
}

- (id)showAddAutomationFlow
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeFuture"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000311C4;
  v6[3] = &unk_1000B5C60;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addSuccessBlock:", v6));
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

- (id)showAddSceneFlowOnHomeTab
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeFuture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator createOrEditActionSetWithName:home:switchToHomeTab:](self, "createOrEditActionSetWithName:home:switchToHomeTab:", 0, v4, 1));

  return v5;
}

- (id)showAddSceneFlowOnCurrentTab
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeFuture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator createOrEditActionSetWithName:home:switchToHomeTab:](self, "createOrEditActionSetWithName:home:switchToHomeTab:", 0, v4, 0));

  return v5;
}

- (id)showHomeEditor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator showHomeSettingsForHome:](self, "showHomeSettingsForHome:", v4));

  return v5;
}

- (id)showRoomEditor
{
  return -[HOAppNavigator _showRoomSettingsWithRoom:](self, "_showRoomSettingsWithRoom:", 0);
}

- (id)showHomeTab
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator baseController](self, "baseController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectTabWithIdentifier:", HFHomeAppTabIdentifierHome));

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000314A0;
  v7[3] = &unk_1000B7658;
  v7[4] = self;
  v5 = objc_msgSend(v4, "addCompletionBlock:", v7);
  return v4;
}

- (id)showAutomationTab
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator baseController](self, "baseController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectTabWithIdentifier:", HFHomeAppTabIdentifierTriggers));

  return v3;
}

- (id)showDiscoverTab
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator baseController](self, "baseController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectTabWithIdentifier:", HFHomeAppTabIdentifierDiscover));

  return v3;
}

- (id)_selectTabWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hu_dismissViewControllerAnimated:", v4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003165C;
  v12[3] = &unk_1000B7680;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v12));

  return v10;
}

- (id)_selectCurrentTabAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hu_dismissViewControllerAnimated:", v3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031738;
  v9[3] = &unk_1000B6C28;
  v9[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v9));

  return v7;
}

- (void)_createHomeWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  HOAddLocationViewController *v8;

  v4 = a3;
  v8 = -[HOAddLocationViewController initWithName:delegate:]([HOAddLocationViewController alloc], "initWithName:delegate:", v4, self);

  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v7 = objc_msgSend(v6, "hu_presentPreloadableViewController:animated:", v5, 1);

}

- (id)_selectHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homeFuture"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000318D0;
  v9[3] = &unk_1000B76A8;
  v10 = v3;
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v9));

  return v7;
}

- (void)_createRoomWithName:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = objc_msgSend(objc_alloc((Class)HFRoomBuilder), "initWithHome:", v6);

  objc_msgSend(v12, "setName:", v7);
  v8 = objc_msgSend(objc_alloc((Class)HUEditRoomViewController), "initWithRoomBuilder:presentationDelegate:addRoomDelegate:", v12, self, 0);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v11 = objc_msgSend(v10, "hu_presentPreloadableViewController:animated:", v9, 1);

}

- (void)_addPeopleToHome:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "hf_canAddHomeMember");
  v6 = objc_msgSend(v4, "hf_canAddAccessCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pinCodeManagerForHome:", v4));

  if (v5 && v6)
  {
    v9 = objc_msgSend(objc_alloc((Class)HUAddPersonRoleViewController), "initWithHome:", v4);
    objc_msgSend(v9, "setPinCodeManager:", v8);
    v10 = v9;
LABEL_7:
    objc_msgSend(v10, "setPresentationDelegate:", self);
    v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v9);
    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    goto LABEL_8;
  }
  if (v5)
  {
    if (!_os_feature_enabled_impl("Home", "RestrictedGuest"))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
      +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:](HUAddPeopleViewController, "presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:", v11, v4, 0, 0, self);
      goto LABEL_13;
    }
    v10 = objc_msgSend(objc_alloc((Class)HUAddPersonRoleViewController), "initWithHome:", v4);
    v9 = v10;
    goto LABEL_7;
  }
  if (!v6)
  {
    v14 = HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100078428(v15, v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_14;
  }
  v9 = objc_msgSend(objc_alloc((Class)HUAddGuestViewController), "initWithPinCodeManager:home:", v8, v4);
  objc_msgSend(v9, "setPresentationDelegate:", self);
  v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v9);
LABEL_8:

  if (v11)
  {
    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
    v13 = objc_msgSend(v12, "hu_presentPreloadableViewController:animated:", v11, 1);

LABEL_13:
  }
LABEL_14:

}

- (id)_showDashboardForRoomContainedObject:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100031D30;
  v12[3] = &unk_1000B76D0;
  v12[4] = a3;
  v6 = a3;
  v7 = sub_100031D30((uint64_t)v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_parentRoom"));

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showHomeTabForHome:animated:](self, "_showHomeTabForHome:animated:", v9, v4));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showRoom:animated:](self, "_showRoom:animated:", v8, v4));
  }

  return v10;
}

- (id)_showHomeTabForHome:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectTabWithIdentifier:animated:](self, "_selectTabWithIdentifier:animated:", HFHomeAppTabIdentifierHome, v4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031EC0;
  v11[3] = &unk_1000B76F8;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v11));

  return v9;
}

- (id)_showRoom:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  BOOL v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v7));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100032118;
  v16[3] = &unk_1000B7720;
  v16[4] = self;
  v17 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v16));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032134;
  v13[3] = &unk_1000B76F8;
  v13[4] = self;
  v14 = v6;
  v15 = a4;
  v10 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v13));

  return v11;
}

- (id)_showRoomContainedCamera:(id)a3 forCameraClip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showDashboardForRoomContainedObject:animated:](self, "_showDashboardForRoomContainedObject:animated:", v6, 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032370;
  v13[3] = &unk_1000B74A0;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v13));

  return v11;
}

- (id)showRoomContainedCamera:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showDashboardForRoomContainedObject:animated:](self, "_showDashboardForRoomContainedObject:animated:", v8, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100032598;
    v14[3] = &unk_1000B6FA0;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v14));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showRoomContainedObject:secondaryDestination:](self, "_showRoomContainedObject:secondaryDestination:", v8, 0));
  }

  return v12;
}

- (id)_showRoomContainedObject:(id)a3 secondaryDestination:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _showDashboardForRoomContainedObject:animated:](self, "_showDashboardForRoomContainedObject:animated:", v6, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032748;
  v11[3] = &unk_1000B7748;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v11));

  return v9;
}

- (void)_editActionSet:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = objc_msgSend(objc_alloc((Class)HFActionSetBuilder), "initWithExistingObject:inHome:", v7, v6);

  v8 = objc_msgSend(objc_alloc((Class)HUSceneActionEditorViewController), "initWithActionSetBuilder:mode:", v12, 0);
  objc_msgSend(v8, "setPresentationDelegate:", self);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v11 = objc_msgSend(v10, "hu_presentPreloadableViewController:animated:", v9, 1);

}

- (void)_createActionSetWithName:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_msgSend(objc_alloc((Class)HFActionSetBuilder), "initWithHome:", v7);
    objc_msgSend(v8, "setName:", v6);
    v9 = objc_msgSend(objc_alloc((Class)HUSceneActionEditorViewController), "initWithActionSetBuilder:mode:", v8, 0);
    objc_msgSend(v9, "setPresentationDelegate:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v9));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HUSceneUtilities initialViewControllerForAddingSceneWithPresentationDelegate:home:](HUSceneUtilities, "initialViewControllerForAddingSceneWithPresentationDelegate:home:", self, v7));
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032960;
  v12[3] = &unk_1000B7770;
  v12[4] = self;
  v11 = objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (id)_showUser:(id)a3 customizationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeFutureWithUser:", v6));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100032BAC;
  v20[3] = &unk_1000B6EE0;
  objc_copyWeak(&v22, &location);
  v10 = v6;
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v20));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100032C78;
  v16[3] = &unk_1000B7798;
  objc_copyWeak(&v19, &location);
  v12 = v10;
  v17 = v12;
  v13 = v7;
  v18 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recover:", v16));

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
  return v14;
}

- (id)_showLocationListWithHome:(id)a3 customizationBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  HOAppNavigator *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectTabWithIdentifier:animated:](self, "_selectTabWithIdentifier:animated:", HFHomeAppTabIdentifierHome, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032EA8;
  v13[3] = &unk_1000B77C0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v13));

  return v11;
}

- (id)_showRoomSettingsWithRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectTabWithIdentifier:animated:](self, "_selectTabWithIdentifier:animated:", HFHomeAppTabIdentifierHome, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", &stru_1000B77E0));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033030;
  v10[3] = &unk_1000B7538;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v10));

  return v8;
}

- (id)_serviceWithName:(id)a3 type:(id)a4 home:(id)a5 room:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_allServices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name LIKE[cd] %@"), v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_allServices"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("serviceType LIKE %@"), v9));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filteredArrayUsingPredicate:", v17));

  }
  else
  {
    v18 = &__NSArray0__struct;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_allServices"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("serviceType LIKE %@"), v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filteredArrayUsingPredicate:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
  return v24;
}

- (id)_cameraProfileWithName:(id)a3 home:(id)a4 room:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_allCameraProfiles"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("accessory.name LIKE[cd] %@"), v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));
  if (v8)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_allCameraProfiles"));
  else
    v13 = &__NSArray0__struct;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_allCameraProfiles"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
  return v17;
}

- (id)showHome:(id)a3
{
  return -[HOAppNavigator _showHomeTabForHome:animated:](self, "_showHomeTabForHome:animated:", a3, 1);
}

- (id)showRoom:(id)a3
{
  return -[HOAppNavigator _showRoom:animated:](self, "_showRoom:animated:", a3, 1);
}

- (void)showAllHomesSettings
{
  id v2;

  v2 = -[HOAppNavigator showHomeSettingsForHome:](self, "showHomeSettingsForHome:", 0);
}

- (void)showHomeSettings:(id)a3
{
  id v3;

  v3 = -[HOAppNavigator showHomeSettingsForHome:](self, "showHomeSettingsForHome:", a3);
}

- (void)showRoomSettings:(id)a3
{
  id v3;

  v3 = -[HOAppNavigator showRoomSettingsForRoom:](self, "showRoomSettingsForRoom:", a3);
}

- (void)showDashboardSectionListViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);

  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v6 = objc_msgSend(v5, "hu_presentPreloadableViewController:animated:", v7, 1);

}

- (void)showStatusDetailsForStatusItemClass:(Class)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectTabWithIdentifier:animated:](self, "_selectTabWithIdentifier:animated:", HFHomeAppTabIdentifierHome, 1));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033554;
  v6[3] = &unk_1000B7800;
  v6[4] = a3;
  v5 = objc_msgSend(v4, "flatMap:", v6);

}

- (id)showAccessoryTypeGroup:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003371C;
  v20[3] = &unk_1000B7720;
  v20[4] = self;
  v21 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v20));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033738;
  v16[3] = &unk_1000B7828;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v12 = v9;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v16));

  return v14;
}

- (id)showScenesSectionWithDashboardTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003399C;
  v20[3] = &unk_1000B7720;
  v20[4] = self;
  v21 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v20));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000339B8;
  v16[3] = &unk_1000B7828;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v12 = v9;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v16));

  return v14;
}

- (id)showSpeakersAndTVsSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100033C1C;
  v20[3] = &unk_1000B7720;
  v20[4] = self;
  v21 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v20));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033C38;
  v16[3] = &unk_1000B7828;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v12 = v9;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v16));

  return v14;
}

- (id)showCamerasSectionWithTitle:(id)a3 forHome:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  _QWORD v20[5];
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectHome:](self, "_selectHome:", v9));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100033E9C;
  v20[3] = &unk_1000B7720;
  v20[4] = self;
  v21 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v20));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033EB8;
  v16[3] = &unk_1000B7828;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a5;
  v12 = v9;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v16));

  return v14;
}

- (id)showHomeSettingsForHome:(id)a3
{
  return -[HOAppNavigator _showLocationListWithHome:customizationBlock:](self, "_showLocationListWithHome:customizationBlock:", a3, 0);
}

- (id)showRoomSettingsForRoom:(id)a3
{
  return -[HOAppNavigator _showRoomSettingsWithRoom:](self, "_showRoomSettingsWithRoom:", a3);
}

- (void)scrollToDefaultPositionInCurrentContextAnimated:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator _selectCurrentTabAnimated:](self, "_selectCurrentTabAnimated:", 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003408C;
  v7[3] = &unk_1000B7850;
  v7[4] = self;
  v8 = a3;
  v6 = objc_msgSend(v5, "addCompletionBlock:", v7);

}

- (void)dismissViewController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)addAccessoryToHome:(id)a3 room:(id)a4
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (+[HFUtilities supportsAccessorySetup](HFUtilities, "supportsAccessorySetup"))
    v6 = +[HFAddAndSetupNewAccessoriesHandler addAndSetupNewAccessoriesForHome:room:](HFAddAndSetupNewAccessoriesHandler, "addAndSetupNewAccessoriesForHome:room:", v7, v5);

}

- (void)addSceneToHome:(id)a3
{
  id v3;

  v3 = -[HOAppNavigator showAddSceneFlowOnCurrentTab](self, "showAddSceneFlowOnCurrentTab", a3);
}

- (void)addAutomationToHome:(id)a3
{
  id v3;

  v3 = -[HOAppNavigator showAddAutomationFlow](self, "showAddAutomationFlow", a3);
}

- (void)addRoomToHome:(id)a3
{
  -[HOAppNavigator _createRoomWithName:home:](self, "_createRoomWithName:home:", 0, a3);
}

- (void)addPeopleToHome:(id)a3
{
  -[HOAppNavigator _addPeopleToHome:](self, "_addPeopleToHome:", a3);
}

- (void)addHome
{
  if ((+[HFUtilities isAMac](HFUtilities, "isAMac") & 1) == 0)
    -[HOAppNavigator _createHomeWithName:](self, "_createHomeWithName:", 0);
}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator currentViewController](self, "currentViewController"));
  objc_msgSend(v15, "na_safeSetObject:forKey:", v5, HFAnalyticsDataSourceViewControllerKey);
  v6 = objc_opt_class(HUDashboardViewController);
  v7 = v5;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator dashboardContextTypeDescriptionForAnalytics](self, "dashboardContextTypeDescriptionForAnalytics"));
  v11 = 0;
  if (objc_msgSend(v10, "length") && v9)
  {
    v12 = (objc_class *)objc_opt_class(v9);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v14, v10));

  }
  objc_msgSend(v15, "na_safeSetObject:forKey:", v11, HFAnalyticsDataSourceViewControllerOverrideClassNameKey);
  objc_msgSend(v15, "na_safeSetObject:forKey:", v4, HFAnalyticsDataContextMenuTitleKey);

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 36, v15);
}

- (id)currentViewController
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v3 = objc_opt_class(HOMainTabBarController);
  v4 = v2;
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedViewController"));

    v4 = (id)v7;
  }
  v8 = objc_opt_class(UINavigationController);
  v9 = v4;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v9;
    v15 = v14;

    v9 = v15;
  }
  v16 = v9;

  return v16;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v6 = objc_msgSend(v5, "hu_dismissViewControllerAnimated:", 1);

  v7 = v9;
  if (v9)
  {
    v8 = -[HOAppNavigator showRoom:](self, "showRoom:", v9);
    v7 = v9;
  }

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hu_dismissViewControllerAnimated:", 1));

  return v5;
}

- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController"));
  v6 = objc_msgSend(v5, "hu_dismissViewControllerAnimated:", 1);

  v7 = v9;
  if (v9)
  {
    v8 = -[HOAppNavigator showHome:](self, "showHome:", v9);
    v7 = v9;
  }

}

- (void)locationListViewControllerDidFinish:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HOAppNavigator rootViewController](self, "rootViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (HOBaseController)baseController
{
  return self->_baseController;
}

- (void)setHomePodProfileInstaller:(id)a3
{
  objc_storeStrong((id *)&self->_homePodProfileInstaller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePodProfileInstaller, 0);
  objc_storeStrong((id *)&self->_baseController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

- (void)_configureDashboardContextWithHome:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  HOAppNavigator *v8;
  HOAppNavigator *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HOAppNavigator *v14;
  uint64_t v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = (HOAppNavigator *)a4;
  v9 = self;
  v10 = -[HOAppNavigator viewControllers](v8, "viewControllers");
  v11 = sub_10005D394(0, &qword_1000D1678, UIViewController_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0)
      v15 = v12;
    else
      v15 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v12);
    v13 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v12);
  if (v13 >= 2)
  {
    v14 = (HOAppNavigator *)-[HOAppNavigator popToRootViewControllerAnimated:](v8, "popToRootViewControllerAnimated:", v5);

    v8 = v9;
    v9 = v14;
  }

}

- (void)_configureDashboardContextWithAccessoryTypeGroup:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  HOAppNavigator *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_10006C290(v10, v11, v12, a6);

}

- (void)_configureSpeakersAndTVsDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
  sub_10006B944(self, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, id))&dispatch thunk of static DashboardContext.speakersAndTVsDashboard(with:for:));
}

- (void)_configureScenesDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
  sub_10006B944(self, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, id))&dispatch thunk of static DashboardContext.scenesDashboard(with:for:));
}

- (void)_configureDashboardContextWithRoom:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  HOAppNavigator *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_10006C52C(v8, v9, a5);

}

- (void)_configureCameraDashboardContextWithTitle:(id)a3 home:(id)a4 navigationController:(id)a5 animated:(BOOL)a6
{
  sub_10006B944(self, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, id))&dispatch thunk of static DashboardContext.camerasDashboard(with:for:));
}

- (void)configureDashboardContextWithDashboardContext:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v9;
  id v10;
  HOAppNavigator *v11;

  v9 = a3;
  v10 = a4;
  v11 = self;
  _sSo14HOAppNavigatorC7HomeAppE25configureDashboardContext4with20navigationController8animatedy0C2UI0fG0CSg_So012UINavigationJ0CSbtF_0(a3, v10, a5);

}

- (id)dashboardContextTypeDescriptionForAnalytics
{
  HOAppNavigator *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v2 = self;
  v3 = -[HOAppNavigator currentViewController](v2, "currentViewController");
  v4 = objc_opt_self(HUDashboardViewController);
  v5 = (void *)swift_dynamicCastObjCClass(v3, v4);
  if (!v5)
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v5, "context");
  dispatch thunk of DashboardContext.typeDescriptionForAnalytics.getter();
  v8 = v7;

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    return v9;
  }
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v9;
}

@end
