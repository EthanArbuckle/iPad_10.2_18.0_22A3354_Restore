@implementation FMDMessageMgr_iOS

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1003063A8 != -1)
    dispatch_once(&qword_1003063A8, &stru_1002C1208);
  v2 = (void *)qword_1003063A0;
  if (!qword_1003063A0)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMDMessageMgr_iOS singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1003063A0;
  }
  return v2;
}

- (FMDMessageMgr_iOS)init
{
  id v3;
  NSObject *v4;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1002254E4(v4);

  return 0;
}

- (id)initSingleton
{
  FMDMessageMgr_iOS *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMDMessageMgr_iOS;
  v2 = -[FMDMessageMgr_iOS init](&v13, "init");
  if (v2)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100225520(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)&qword_1003063A0, v2);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)qword_1003063A0;
  qword_1003063A0 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMDMessageMgr_iOS;
  -[FMDMessageMgr_iOS dealloc](&v6, "dealloc");
}

- (void)activateMessage:(id)a3
{
  id v4;
  void *v5;
  __CFUserNotification *v6;
  __CFUserNotification *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CFTimeInterval v39;
  CFUserNotificationRef v40;
  CFUserNotificationRef v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  _QWORD block[5];
  uint8_t buf[4];
  _QWORD v56[2];
  _QWORD v57[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = -[FMDMessageMgr_iOS cfNotification](self, "cfNotification");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMessageMgr_iOS activeMessage](self, "activeMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMessageMgr_iOS _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v8));
    objc_msgSend(v9, "endTransaction:", v10);

    CFUserNotificationCancel(v7);
    -[FMDMessageMgr_iOS setCfNotification:](self, "setCfNotification:", 0);
    -[FMDMessageMgr_iOS setActiveMessage:](self, "setActiveMessage:", 0);

  }
  v11 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableSoundPlayback"), kFMDNotBackedUpPrefDomain);
  if (objc_msgSend(v4, "showMessage"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultButtonTitle"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", kCFUserNotificationDefaultButtonTitleKey, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateButtonTitle"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", kCFUserNotificationAlternateButtonTitleKey, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgText"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", kCFUserNotificationAlertMessageKey, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgTitle"));
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", kCFUserNotificationAlertHeaderKey, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "showMsgInLockScreen")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, kCFUserNotificationAlertTopMostKey);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "dismissMsgOnUnlock") ^ 1));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, SBUserNotificationDontDismissOnUnlock);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "dismissMsgOnLock")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, SBUserNotificationDismissOnLock);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationAllowMenuButtonDismissal);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationAllowInCarKey);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationIgnoresQuietMode);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationSystemAperturePresentationKey);
    v19 = objc_alloc_init((Class)SBSUserNotificationSystemApertureContentDefinition);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathForResource:ofType:", CFSTR("findiphone-asset-JINDO"), CFSTR("ca")));

    v53 = (void *)v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SBSUserNotificationCAPackageDefinition definitionWithCAPackagePath:](SBSUserNotificationCAPackageDefinition, "definitionWithCAPackagePath:", v21));
    objc_msgSend(v19, "setLeadingAssetDefinition:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgText"));
    objc_msgSend(v19, "setAlertMessage:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msgTitle"));
    objc_msgSend(v19, "setAlertHeader:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BSColor colorWithRed:green:blue:alpha:](BSColor, "colorWithRed:green:blue:alpha:", 0.287, 1.0, 0.719, 1.0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SBSUserNotificationColorDefinition definitionWithColor:](SBSUserNotificationColorDefinition, "definitionWithColor:", v25));
    objc_msgSend(v19, "setKeyColor:", v26);
    if ((objc_opt_respondsToSelector(v19, "setPreventsAutomaticDismissal:") & 1) != 0)
      objc_msgSend(v19, "setPreventsAutomaticDismissal:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "build"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, SBUserNotificationSystemApertureContentDefinitionKey);

    if (objc_msgSend(v4, "playSound"))
    {
      if ((v11 & 1) != 0)
      {
        v28 = sub_1000031B8();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Play sound will be activated, but sound playback is disabled.", buf, 2u);
        }
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "soundName"));
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pathForResource:ofType:", v33, CFSTR("caf")));

        v34 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v29, 0);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, kCFUserNotificationSoundURLKey);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002D7E70, SBUserNotificationSoundAlertTypeKey);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", TLAlertTopicSystemNotificationFindMyDevice, SBUserNotificationSoundAlertTopicKey);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "soundDuration")));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, SBUserNotificationSoundRepeatDurationKey);

        if (objc_msgSend(v4, "vibrate"))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMessageMgr_iOS _vibrationPattern](self, "_vibrationPattern"));
          v52 = v34;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMessageMgr_iOS _fillVibrationPattern:toDuration:](self, "_fillVibrationPattern:toDuration:", v36, (double)(int)objc_msgSend(v4, "soundDuration")));

          v56[0] = CFSTR("Intensity");
          v56[1] = CFSTR("VibePattern");
          v57[0] = &off_1002D8300;
          v57[1] = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, SBUserNotificationSoundVibrationPatternKey);

          v34 = v52;
        }

      }
    }
    *(_DWORD *)buf = 0;
    objc_msgSend(v4, "timeout");
    v40 = CFUserNotificationCreate(kCFAllocatorDefault, v39, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v5);
    if (v40)
    {
      v41 = v40;
      -[FMDMessageMgr_iOS setActiveMessage:](self, "setActiveMessage:", v4);
      -[FMDMessageMgr_iOS setCfNotification:](self, "setCfNotification:", v41);
      CFRelease(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMessageMgr_iOS _xpcTransactionNameFor:](self, "_xpcTransactionNameFor:", v4));
      objc_msgSend(v42, "beginTransaction:", v43);

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006F8C;
      block[3] = &unk_1002C1228;
      block[4] = v41;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v44 = sub_1000031B8();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_1002255E4((uint64_t)buf, v45, v46, v47, v48, v49, v50, v51);

    }
  }
  else if (objc_msgSend(v4, "playSound"))
  {
    if ((v11 & 1) != 0)
    {
      v30 = sub_1000031B8();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Play sound will be activated, but sound playback is disabled.", buf, 2u);
      }

    }
    else
    {
      -[FMDMessageMgr_iOS _playSoundFor:](self, "_playSoundFor:", v4);
    }
  }

}

- (void)stopAllSounds
{
  -[FMDMessageMgr_iOS stopSound](self, "stopSound");
}

- (void)_playSoundFor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_opt_new(FMDGenericMessage);
  objc_msgSend(v7, "setSoundDuration:", objc_msgSend(v3, "soundDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "soundName"));
  objc_msgSend(v7, "setSoundName:", v4);

  v5 = objc_msgSend(v3, "vibrate");
  objc_msgSend(v7, "setVibrate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  objc_msgSend(v6, "playSoundWithMessage:completion:", v7, &stru_1002C1268);

}

- (void)stopSound
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  objc_msgSend(v2, "stopSoundMessageWithCompletion:", &stru_1002C1288);

}

- (id)_xpcTransactionNameFor:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Message-%lX"), a3);
}

- (id)_fillVibrationPattern:(id)a3 toDuration:(double)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  if ((uint64_t)a4 >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7));
      objc_msgSend(v6, "addObject:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 + 1));
      objc_msgSend(v6, "addObject:", v10);
      v8 += (uint64_t)objc_msgSend(v10, "integerValue");
      v7 += 2;
      if (v7 >= (unint64_t)objc_msgSend(v5, "count"))
        v7 = 0;

    }
    while (v8 < 1000 * (uint64_t)a4);
  }
  v11 = objc_msgSend(v6, "copy");

  return v11;
}

- (id)_vibrationPattern
{
  return &off_1002D8E88;
}

- (FMDMessage)activeMessage
{
  return self->_activeMessage;
}

- (void)setActiveMessage:(id)a3
{
  objc_storeStrong((id *)&self->_activeMessage, a3);
}

- (__CFUserNotification)cfNotification
{
  return self->_cfNotification;
}

- (void)setCfNotification:(__CFUserNotification *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMessage, 0);
}

@end
