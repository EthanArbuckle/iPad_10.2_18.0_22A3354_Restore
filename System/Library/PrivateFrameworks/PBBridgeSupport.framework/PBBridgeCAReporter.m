@implementation PBBridgeCAReporter

+ (void)recordTabSelection:(int64_t)a3 classicCount:(unint64_t)a4 tinkerCount:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v12[1] = CFSTR("classicCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  v12[2] = CFSTR("tinkerCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.TabViewSelection"), v11);

}

+ (void)sendEvent:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  pbb_shared_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "[PBBridgeCAReporter] Sending event: <%{public}@; %{public}@>",
      (uint8_t *)&v8,
      0x16u);
  }

  AnalyticsSendEvent();
}

+ (id)descriptionForSuccessType:(unint64_t)a3
{
  if (a3 > 0x39)
    return &stru_24CBBF548;
  else
    return off_24CBBD828[a3];
}

+ (void)activationServerRespondedAtPage:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  PBBuddyControllerDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ActivationResponded-%@"), v5, CFSTR("screen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.activationRespond"), v7);

}

+ (void)incrementSuccessType:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("type");
  +[PBBridgeCAReporter descriptionForSuccessType:](PBBridgeCAReporter, "descriptionForSuccessType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.flow"), v5);

}

+ (id)descriptionForTimingType:(unint64_t)a3
{
  if (a3 > 0xA)
    return &stru_24CBBF548;
  else
    return off_24CBBD9F8[a3];
}

+ (void)pushTimingType:(unint64_t)a3 withValue:(double)a4
{
  id v6;

  +[PBBridgeCAReporter descriptionForTimingType:](PBBridgeCAReporter, "descriptionForTimingType:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pushTimingForTypeNamed:withValue:", v6, a4);

}

+ (void)pushTimingForTypeNamed:(id)a3 withValue:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("duration");
  v11[0] = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.timing"), v9);
}

+ (id)descriptionForCommTimingType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = &stru_24CBBF548;
  if (a3 == 1)
    v3 = CFSTR("OWD");
  if (a3)
    return (id)v3;
  else
    return CFSTR("RTT");
}

+ (void)pushCommunicationTimingType:(unint64_t)a3 withValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("type");
  +[PBBridgeCAReporter descriptionForCommTimingType:](PBBridgeCAReporter, "descriptionForCommTimingType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("duration");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.comm.timing"), v8);

}

+ (id)stringForSigninPair:(unint64_t)a3
{
  if (a3 < 3)
    return off_24CBBDA50[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not handled %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)recordSigninEventPair:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("value");
  v7[0] = CFSTR("pair");
  objc_msgSend(a1, "stringForSigninPair:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.signin"), v5);

}

+ (id)stringForSigninFollowup:(unint64_t)a3
{
  if (!a3)
    return CFSTR("NoSignin");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not handled %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)recordSigninEventFollowup:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("value");
  v7[0] = CFSTR("followup");
  objc_msgSend(a1, "stringForSigninFollowup:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.signin"), v5);

}

+ (id)stringForSigninEventDaily:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("SignedIn");
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not handled %lu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("NotSignedIn");
  }
  return v3;
}

+ (void)recordSigninEventDaily:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("value");
  v7[0] = CFSTR("daily");
  objc_msgSend(a1, "stringForSigninEventDaily:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.signin"), v5);

}

+ (id)stringForSigninEventPostPair:(unint64_t)a3
{
  if (!a3)
    return CFSTR("SignedIn");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not handled %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)recordSigninEventPostPair:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("value");
  v7[0] = CFSTR("postpair");
  objc_msgSend(a1, "stringForSigninEventPostPair:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.nanobuddy.signin"), v5);

}

+ (void)recordAlreadyPairedAlertFired:(BOOL)a3 afterDuration:(double)a4 hasFiredBefore:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v5 = a5;
  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("AlreadyPairedAlertFired");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v12[1] = CFSTR("DetectionDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  v12[2] = CFSTR("HasFiredBefore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AlreadyPairedAlert.Fired"), v11);

}

+ (void)recordAlreadyPairedAlertLearnedMore:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("LearnMoreChoice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AlreadyPairedAlert.Response"), v5);

}

+ (void)recordAlreadyPairedAlertFiredAndWatchRecovered:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("RecoveryInterval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AlreadyPairedAlert.Recovered"), v5);

}

+ (void)recordEndOfLifePhoneAlertPresented:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("EOLType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.EndOfLifePhoneAlert.Fired"), v5);

}

+ (void)recordEndOfLifePhoneAlertUserResponse:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("LearnMoreChoice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.EndOfLifePhoneAlert.Response"), v5);

}

+ (void)recordSetupAppInstallChoice:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("installAllApps");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.InstallAppSetup.Response"), v5);

}

+ (void)recordAllWatchesDetailButtonVisit:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("PairingType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AllWatchesDetailButtonVisit.Response"), v5);

}

+ (void)recordUserAwarenessNotificationDuringSetup
{
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AwarenessNotificationDuringSetup.Fired"), 0);
}

+ (void)recordUserAwarenessNotificationDuringSetupUserEngaged
{
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.AwarenessNotificationDuringSetup.Engaged"), 0);
}

+ (void)recordPasscodeCreatedWithType:(int64_t)a3 wasChallenged:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a4;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("PasscodeType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v10[1] = CFSTR("HasBeenChallenged");
  v8 = MEMORY[0x24BDBD1C0];
  if (v4)
    v8 = MEMORY[0x24BDBD1C8];
  v11[0] = v6;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.PasscodeChoice"), v9);

}

+ (void)recordPasscodeChallenge:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("ChallengeType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.PasscodeChallenge"), v5);

}

+ (void)recordTransitionedDynamicHelpViewFromType:(int64_t)a3 toType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("FromType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("ToType");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.DynamicHelpTransitioned"), v8);

}

+ (void)recordTinkerGuardianAcceptedDiagsAndUsage:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = MEMORY[0x24BDBD1C8];
  else
    v4 = MEMORY[0x24BDBD1C0];
  v6 = CFSTR("Choice");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.Tinker.DiagsAndUsage"), v5);

}

+ (void)recordPairingTimeBackupsCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("BackupsCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.BackupsCount"), v5);

}

+ (void)recordDeviceEnrollmentResult:(BOOL)a3 retryCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("EnrollmentResult");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("EnrollmentRetryCount");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.DeviceEnrollment"), v8);

}

+ (id)_reportingPlatform
{
  return CFSTR("iOS");
}

+ (id)_orientationHumanReadable:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("UnsetCrown");
  if (a3 == 2)
    v3 = CFSTR("CrownOnLeft");
  if (a3 == 1)
    return CFSTR("CrownOnRight");
  else
    return (id)v3;
}

+ (id)_wristChoiceHumanReadable:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("UnsetHand");
  if (a3 == 2)
    v3 = CFSTR("RightHand");
  if (a3 == 1)
    return CFSTR("LeftHand");
  else
    return (id)v3;
}

+ (void)recordUserInitiatedDeviceOrientationChange:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("DeviceOrientation");
  objc_msgSend(a1, "_orientationHumanReadable:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("SettingsPlatform");
  v8[0] = v4;
  objc_msgSend(a1, "_reportingPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.UserInitiatedDeviceOrientationChange"), v6);

}

+ (void)recordUserInitiatedDeviceWristChange:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WristChoice");
  objc_msgSend(a1, "_wristChoiceHumanReadable:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("SettingsPlatform");
  v8[0] = v4;
  objc_msgSend(a1, "_reportingPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.UserInitiatedDeviceWristChange"), v6);

}

+ (id)_pairingStyle:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PairingUnset");
  if (a3 == 2)
    v3 = CFSTR("PairingAutomatic");
  if (a3 == 1)
    return CFSTR("PairingManual");
  else
    return (id)v3;
}

+ (void)recordPairingInitiatedDeviceOrientationChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("DeviceOrientation");
  objc_msgSend(a1, "_orientationHumanReadable:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("SettingsPlatform");
  v10[0] = v6;
  objc_msgSend(a1, "_pairingStyle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.UserInitiatedDeviceOrientationChange"), v8);

}

+ (void)recordPairingInitiatedDeviceWristChoice:(int64_t)a3 pairingSelectionType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("WristChoice");
  objc_msgSend(a1, "_wristChoiceHumanReadable:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("SettingsPlatform");
  v10[0] = v6;
  objc_msgSend(a1, "_pairingStyle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.UserInitiatedDeviceWristChange"), v8);

}

+ (void)recordMaterial:(unint64_t)a3 andSize:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("Material");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("Size");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sendEvent:with:", CFSTR("com.apple.Bridge.MaterialDetails"), v8);

}

@end
