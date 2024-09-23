@implementation WipeAction

- (WipeAction)initWithProvider:(id)a3
{
  id v4;
  WipeAction *v5;
  WipeAction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WipeAction;
  v5 = -[WipeAction init](&v8, "init");
  v6 = v5;
  if (v5)
    -[WipeAction setProvider:](v5, "setProvider:", v4);

  return v6;
}

- (id)actionType
{
  return CFSTR("WipeAction");
}

- (void)runWithCompletion:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];
  uint8_t v23[16];

  v4 = +[FMDPreferencesMgr wipeState](FMDPreferencesMgr, "wipeState", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr wipeInfo](FMDPreferencesMgr, "wipeInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authId")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WipeAction provider](self, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId")),
        v10 = objc_msgSend(v9, "isEqualToString:", v6),
        v9,
        (v10 & 1) != 0))
  {
    objc_msgSend(v8, "setActivityState:", 2);
    if (v4 == 2)
    {
      v18 = sub_1000031B8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Wiping the device now...", v20, 2u);
      }

      -[WipeAction _wipeNow](self, "_wipeNow");
    }
    else if (v4 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authToken"));
      v12 = objc_msgSend(v11, "length");

      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending wipe ack...", buf, 2u);
        }

        -[WipeAction _sendWipeAck](self, "_sendWipeAck");
      }
      else
      {
        if (v15)
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Aborting wipe because ack was pending & no authToken available anymore", v21, 2u);
        }

        -[WipeAction _abortWipe](self, "_abortWipe");
      }
    }
  }
  else
  {
    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deleting old wipe state since the account info has changed", v23, 2u);
    }

    +[FMDPreferencesMgr setWipeState:](FMDPreferencesMgr, "setWipeState:", 0);
    +[FMDPreferencesMgr setWipeInfo:](FMDPreferencesMgr, "setWipeInfo:", 0);
  }

}

- (BOOL)shouldCancelAction:(id)a3
{
  return 1;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wipe(0x%p)"), self);
}

- (void)_sendWipeAck
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending wipe ack...", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr wipeInfo](FMDPreferencesMgr, "wipeInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("commandParams")));
  -[WipeAction _ackWipeCommand:withStatus:](self, "_ackWipeCommand:withStatus:", v6, 200);

}

- (void)_ackWipeCommand:(id)a3 withStatus:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  FMDRequestAckWipe *v10;
  id v11;
  uint8_t v12[8];
  _QWORD v13[5];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ackURL")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WipeAction provider](self, "provider"));
  if (v7)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    v10 = -[FMDRequestAckWipe initWithProvider:wipeCommand:cmdStatusCode:ackURL:]([FMDRequestAckWipe alloc], "initWithProvider:wipeCommand:cmdStatusCode:ackURL:", v8, v6, a4, v9);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100099BEC;
    v13[3] = &unk_1002C49A0;
    v13[4] = self;
    -[FMDRequest setCompletionHandler:](v10, "setCompletionHandler:", v13);
    objc_msgSend(v8, "enqueueRequest:", v10);

  }
  else
  {
    v11 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not acking the wipe command because there is no ack URL", v12, 2u);
    }
  }

}

- (void)_abortWipe
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Aborting wipe...", v7, 2u);
  }

  +[FMDPreferencesMgr setWipeInfo:](FMDPreferencesMgr, "setWipeInfo:", 0);
  +[FMDPreferencesMgr setWipeState:](FMDPreferencesMgr, "setWipeState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WipeAction provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
  objc_msgSend(v6, "setActivityState:", 0);
  objc_msgSend(v5, "reinitializeProviderWithAccount:", v6);

}

- (void)_wipeNow
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPowerMgr sharedInstance](FMDPowerMgr, "sharedInstance"));
  objc_msgSend(v3, "powerAssertionEnableWithReason:type:timeout:appliesOnLidClose:", CFSTR("Wiping"), CFSTR("PreventSystemSleep"), 300, 1);

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initiating Remote Wipe now...", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr wipeInfo](FMDPreferencesMgr, "wipeInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wipeMode")));
  if (+[FMDPreferencesMgr simulateWipe](FMDPreferencesMgr, "simulateWipe")
    || objc_msgSend(v7, "isEqualToString:", CFSTR("fake")))
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initiating Simulated Remote Wipe now...", buf, 2u);
    }

    v10 = objc_alloc_init((Class)FMAlert);
    objc_msgSend(v10, "setMsgText:", CFSTR("Simulated Wipe: Your device would have been wiped now."));
    objc_msgSend(v10, "setMsgTitle:", CFSTR("iCloud Remote Wipe"));
    objc_msgSend(v10, "setShowMsgInLockScreen:", 1);
    objc_msgSend(v10, "setDismissMsgOnUnlock:", 0);
    objc_msgSend(v10, "setDismissMsgOnLock:", 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009A07C;
    v12[3] = &unk_1002C1328;
    v12[4] = self;
    objc_msgSend(v10, "setDefaultButtonAction:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
    objc_msgSend(v11, "activateAlert:", v10);

  }
  else
  {
    -[WipeAction performWipe](self, "performWipe");
  }

}

- (void)performWipe
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = (id)objc_opt_new(FMDEraseProxy);
  v3 = (void *)objc_opt_new(FMDEraseOptions);
  -[WipeAction maxDelayInterval](self, "maxDelayInterval");
  objc_msgSend(v3, "setMaxDelayInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v5 = objc_msgSend(v4, "isInternalBuild");

  if (v5)
  {
    v6 = (uint64_t)+[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", CFSTR("wipeDelay"), kFMDPrefDomain);
    if (v6 >= 1)
      objc_msgSend(v3, "setCustomDelay:", (double)v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v8 = objc_msgSend(v7, "isInternalBuild");

  if (v8)
    objc_msgSend(v3, "setBrickDevice:", +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("EnableRemoteBrickWithWipe"), kFMDPrefDomain));
  objc_msgSend(v9, "eraseDeviceWithOptions:completion:", v3, &stru_1002C49C0);

}

- (double)maxDelayInterval
{
  return self->_maxDelayInterval;
}

- (void)setMaxDelayInterval:(double)a3
{
  self->_maxDelayInterval = a3;
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
}

@end
