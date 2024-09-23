@implementation PHThumperSetupController

+ (void)showThumperAvailableDialogIfNecessary
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v20;

  if ((+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling") & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021C94;
    block[3] = &unk_100089B18;
    block[4] = a1;
    if (qword_1000A36F8 != -1)
      dispatch_once(&qword_1000A36F8, block);
    if (!+[TUCallCapabilities supportsThumperCalling](TUCallCapabilities, "supportsThumperCalling")|| (+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled") & 1) != 0|| (objc_msgSend(a1, "_userHasAlreadyBeenPrompted") & 1) != 0)
    {
      _objc_msgSend(a1, "_removeHasShownPromptDefaultIfNecessary");
    }
    else
    {
      v3 = sub_10000E6C4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Showing upgrade-to-Thumper prompt because Thumper can be enabled but is not enabled already, and we haven't shown a prompt to the user already.", buf, 2u);
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = TUStringKeyForNetworkAndProduct(CFSTR("THUMPER_UPGRADE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10008B240, CFSTR("General")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("THUMPER_UPGRADE_MESSAGE"), &stru_10008B240, CFSTR("General")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_10008B240, CFSTR("General")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_ON"), &stru_10008B240, CFSTR("General")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:](IMUserNotification, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", CFSTR("ThumperServiceAvailableNotification"), v8, v9, v11, v10, 0));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "setUsesNotificationCenter:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        objc_msgSend(v13, "setRepresentedApplicationBundle:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"));
        objc_msgSend(v15, "addUserNotification:listener:completionHandler:", v13, 0, &stru_100089C58);

      }
      v16 = sub_10000E6C4();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = CFSTR("HasOfferedTHMPUpgrade");
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting %@ default because we are prompting the user", buf, 0xCu);
      }

      sub_100034678(CFSTR("HasOfferedTHMPUpgrade"), &__kCFBooleanTrue);
    }
  }
}

+ (BOOL)_userHasAlreadyBeenPrompted
{
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = sub_10000CF14(CFSTR("HasOfferedTHMPUpgrade"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)_removeHasShownPromptDefaultIfNecessary
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;

  if (+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled")&& objc_msgSend(a1, "_userHasAlreadyBeenPrompted"))
  {
    v3 = sub_10000E6C4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = CFSTR("HasOfferedTHMPUpgrade");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing %@ default because Thumper is now enabled", (uint8_t *)&v5, 0xCu);
    }

    sub_100034678(CFSTR("HasOfferedTHMPUpgrade"), &__kCFBooleanFalse);
  }
}

@end
