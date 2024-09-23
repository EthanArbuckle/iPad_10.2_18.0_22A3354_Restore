@implementation MCTargetDeviceResolver

+ (BOOL)purgatorySupportedForDevice:(unint64_t)a3
{
  return a3 == 1 || a3 == 6;
}

+ (unint64_t)watchAvailability
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry activePairedDeviceSelectorBlock](NRPairedDeviceRegistry, "activePairedDeviceSelectorBlock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry pairedDevicesSelectorBlock](NRPairedDeviceRegistry, "pairedDevicesSelectorBlock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v7));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v13 = NRDevicePropertyIsAltAccount;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), "valueForProperty:", v13, (_QWORD)v18));
          v16 = objc_msgSend(v15, "BOOLValue");

          if ((v16 & 1) != 0)
          {

            v6 = 1;
            goto LABEL_15;
          }
          v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (objc_msgSend(v9, "count"))
      v6 = 2;
    else
      v6 = 3;
LABEL_15:

  }
  return v6;
}

+ (BOOL)isHomePodAvailable
{
  return +[HMClientConnection areAnySpeakersConfigured](HMClientConnection, "areAnySpeakersConfigured");
}

+ (void)showResolutionPromptWithWatchOption:(BOOL)a3 homePodOption:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(id, id);
  id v9;
  unsigned int v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  unsigned int v23;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = objc_msgSend(a1, "watchAvailability");
  v10 = objc_msgSend(a1, "isHomePodAvailable");
  v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCTargetDeviceResolver stringForWatchAvailability:](MCTargetDeviceResolver, "stringForWatchAvailability:", v9));
    v17[0] = 67240962;
    v17[1] = v6;
    v18 = 2114;
    v19 = v13;
    v20 = 1026;
    v21 = v5;
    v22 = 1026;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver state: Watch Valid? %{public}d | Watch State? %{public}@ | HomePod Valid? %{public}d | HomePod Available? %{public}d", (uint8_t *)v17, 0x1Eu);

  }
  if ((unint64_t)v9 >= 2)
    v6 = 0;
  v14 = v10 & v5;
  v15 = _MCLogObjects[0];
  v16 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v6 && v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone, Watch, and HomePod", (uint8_t *)v17, 2u);
    }
    objc_msgSend(a1, "_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:", v8);
  }
  else if (v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone and HomePod", (uint8_t *)v17, 2u);
    }
    objc_msgSend(a1, "_showPromptForHomePodWithCompletionBlock:", v8);
  }
  else if (v6)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone and Watch", (uint8_t *)v17, 2u);
    }
    objc_msgSend(a1, "_showPromptForWatchWithCompletionBlock:", v8);
  }
  else
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver skipping prompt because only this device is available", (uint8_t *)v17, 2u);
    }
    v8[2](v8, +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"));
  }

}

+ (void)_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v6 = MCLocalizedString(CFSTR("INSTALL_PAIRED_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = MCLocalizedString(CFSTR("INSTALL_PAIRED_MSG"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = MCLocalizedStringByDevice(CFSTR("INSTALL_PAIRED_COMPANION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = MCLocalizedString(CFSTR("INSTALL_PAIRED_OTHER"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = MCLocalizedString(CFSTR("INSTALL_PAIRED_CANCEL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001FD80;
  v18[3] = &unk_1000E37E0;
  v19 = v4;
  v20 = a1;
  v16 = v4;
  BYTE2(v17) = 1;
  LOWORD(v17) = 0;
  objc_msgSend(v5, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v7, v9, v15, v11, v13, 0.0, 0, v17, 0, v18);

}

+ (void)_showPromptForHomePodAndWatchWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v5 = MCLocalizedString(CFSTR("INSTALL_PAIRED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = MCLocalizedString(CFSTR("INSTALL_PAIRED_MSG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = MCLocalizedString(CFSTR("INSTALL_PAIRED_COMPANION_HOMEPOD"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = MCLocalizedString(CFSTR("INSTALL_PAIRED_COMPANION_WATCH"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = MCLocalizedString(CFSTR("INSTALL_PAIRED_CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001FF64;
  v17[3] = &unk_1000E3808;
  v18 = v3;
  v15 = v3;
  BYTE2(v16) = 1;
  LOWORD(v16) = 0;
  objc_msgSend(v4, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v6, v8, v14, v10, v12, 0.0, 0, v16, 0, v17);

}

+ (void)_showPromptForHomePodWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v5 = MCLocalizedString(CFSTR("INSTALL_PAIRED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = MCLocalizedString(CFSTR("INSTALL_PAIRED_MSG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = MCLocalizedStringByDevice(CFSTR("INSTALL_PAIRED_COMPANION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = MCLocalizedString(CFSTR("INSTALL_PAIRED_COMPANION_HOMEPOD"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = MCLocalizedString(CFSTR("INSTALL_PAIRED_CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000200E4;
  v17[3] = &unk_1000E3808;
  v18 = v3;
  v15 = v3;
  BYTE2(v16) = 1;
  LOWORD(v16) = 0;
  objc_msgSend(v4, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v6, v8, v14, v10, v12, 0.0, 0, v16, 0, v17);

}

+ (void)_showPromptForWatchWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v5 = MCLocalizedString(CFSTR("INSTALL_PAIRED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = MCLocalizedString(CFSTR("INSTALL_PAIRED_MSG"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = MCLocalizedStringByDevice(CFSTR("INSTALL_PAIRED_COMPANION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = MCLocalizedString(CFSTR("INSTALL_PAIRED_COMPANION_WATCH"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = MCLocalizedString(CFSTR("INSTALL_PAIRED_CANCEL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000202B0;
  v17[3] = &unk_1000E3808;
  v18 = v3;
  v15 = v3;
  BYTE2(v16) = 1;
  LOWORD(v16) = 0;
  objc_msgSend(v4, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", 0, v6, v8, v14, v10, v12, 0.0, 0, v16, 0, v17);

}

+ (id)stringForWatchAvailability:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_1000E3828[a3];
}

@end
