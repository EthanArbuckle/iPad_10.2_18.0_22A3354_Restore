@implementation AppLaunchAddressCorrectionAlert

- (void)displayAlertIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  id completionBlock;
  _QWORD v6[5];

  v4 = objc_msgSend(a3, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007B7D5C;
  v6[3] = &unk_1011AE8F8;
  v6[4] = self;
  -[AppLaunchAddressCorrectionAlert _fetchShouldDisplayAlertWithHandler:](self, "_fetchShouldDisplayAlertWithHandler:", v6);
}

- (void)cancelAlertIfNecessary
{
  uint64_t Integer;
  void *v4;
  unsigned int v5;
  BOOL v6;
  void *v7;

  if (self->_isDisplayingAlert)
  {
    Integer = GEOConfigGetInteger(MapsConfig_AddressCorrectionAuthorizationStatus, off_1014B2F58);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HasAcknowledgedAddressCorrectionAlert2021"));

    if (Integer)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      objc_msgSend(v7, "dismissCurrentInterruptionOfKind:", 17);

      -[AppLaunchAddressCorrectionAlert _alertDidFinishProcessing](self, "_alertDidFinishProcessing");
    }
  }
}

- (id)_actionsForPromptOptions:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppLaunchAddressCorrectionAlert _localizedStringForAddressCorrectionOutcome:](self, "_localizedStringForAddressCorrectionOutcome:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "unsignedIntegerValue", (_QWORD)v14)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v11, 0, 0));
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_localizedStringForAddressCorrectionOutcome:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("AddressCorrection_Permission_LearnMore");
      break;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("AddressCorrection_Permission_DontAllow");
      break;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("AddressCorrection_Permission_Allow");
      break;
    default:
      v6 = 0;
      return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (void)_fetchShouldDisplayAlertWithHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t Integer;
  void *v10;
  unsigned int v11;
  _QWORD v12[4];
  void (**v13)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = objc_msgSend(v4, "isLocationServicesAuthorizationNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v7 = objc_msgSend(v6, "isLocationServicesApproved");

  if (v5 || (v7 & 1) == 0 || objc_msgSend(UIApp, "launchedToTest"))
  {
    v3[2](v3, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    if (objc_msgSend(v8, "userMode") == 1
      || objc_msgSend(v8, "isEphemeralMultiUser")
      || (Integer = GEOConfigGetInteger(MapsConfig_AddressCorrectionAuthorizationStatus, off_1014B2F58),
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("HasAcknowledgedAddressCorrectionAlert2021")),
          v10,
          Integer)
      && v11
      || (MGGetBoolAnswer(CFSTR("CoreRoutineCapability")) & 1) == 0)
    {
      v3[2](v3, 0);
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1007B82C4;
      v12[3] = &unk_1011ADA00;
      v13 = v3;
      GEORegisterNetworkDefaults(v12);

    }
  }

}

- (void)_displayAlert
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  const __CFString *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  AppLaunchAddressCorrectionAlert *v18;
  BOOL v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  v7 = v4 != (id)5;
  if (v4 == (id)5)
    v8 = CFSTR("AddressCorrection_Permission_Message (macOS)");
  else
    v8 = CFSTR("AddressCorrection_Permission_Message (iOS)");
  if (v4 == (id)5)
    v9 = &off_101273D28;
  else
    v9 = &off_101273D40;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

  v20[0] = CFSTR("kMapsInterruptionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AddressCorrection_Permission_Title"), CFSTR("localized string not found"), 0));
  v21[0] = v12;
  v21[1] = v10;
  v20[1] = CFSTR("kMapsInterruptionMessage");
  v20[2] = CFSTR("kMapsInterruptionActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppLaunchAddressCorrectionAlert _actionsForPromptOptions:](self, "_actionsForPromptOptions:", v9));
  v21[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007B8624;
  v16[3] = &unk_1011C7068;
  v19 = v7;
  v17 = v9;
  v18 = self;
  objc_msgSend(v15, "interruptApplicationWithKind:userInfo:completionHandler:", 17, v14, v16);

}

- (void)_alertDidFinishProcessing
{
  id v3;
  NSObject *v4;
  id completionBlock;
  void (**v6)(_QWORD);
  id v7;
  uint8_t v8[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AppLaunchAddressCorrectionAlert: alert dismissed", v8, 2u);
  }

  self->_isDisplayingAlert = 0;
  completionBlock = self->_completionBlock;
  if (completionBlock)
  {
    v6 = (void (**)(_QWORD))objc_retainBlock(completionBlock);
    v7 = self->_completionBlock;
    self->_completionBlock = 0;

    v6[2](v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
