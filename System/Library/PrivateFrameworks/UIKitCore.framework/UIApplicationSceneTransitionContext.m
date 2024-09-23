@implementation UIApplicationSceneTransitionContext

- (void)setExecTime:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 4);

}

- (BOOL)isUISubclass
{
  return 1;
}

- (void)setSignpostID:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 6);

}

- (void)setShouldTakeKeyboardFocus:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 9);

}

- (void)setForTesting:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 2);

}

- (void)setStatusBarAnimation:(int64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 11);

}

- (BOOL)disableTouchCancellationOnRotation
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 12);

  return v3;
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSDictionary *v15;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIApplicationSceneTransitionContext clickAttribution](self, "clickAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_opt_new();
    v9 = v8;

    objc_msgSend(v9, "setObject:forKey:", v5, CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
  }
  else
  {
    v9 = 0;
  }
  -[UIApplicationSceneTransitionContext pasteSharingToken](self, "pasteSharingToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (!v9)
    {
      v11 = (void *)objc_msgSend(v4, "mutableCopy");
      v12 = v11;
      if (v11)
        v13 = v11;
      else
        v13 = (id)objc_opt_new();
      v9 = v13;

    }
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("UIApplicationLaunchOptionsPasteSharingTokenKey"));
  }
  if (v9)
    v14 = v9;
  else
    v14 = v4;
  v15 = v14;

  return v15;
}

- (UISPasteSharingToken)pasteSharingToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC5BE0];
  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_secureDecodedFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISPasteSharingToken *)v5;
}

- (UISClickAttribution)clickAttribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC5B98];
  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_secureDecodedFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISClickAttribution *)v5;
}

- (void)setClickAttribution:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v5, 13);
}

- (void)setLaunchMetricsPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 7);

}

- (void)setUserLaunchEventTime:(double)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 5);

}

- (BOOL)safeMode
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

- (OS_xpc_object)launchMetricsPayload
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v3;
}

- (void)setPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("UIApplicationLaunchOptionsEventAttributionKey"));
    -[UIApplicationSceneTransitionContext setClickAttribution:](self, "setClickAttribution:", v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *MEMORY[0x1E0DC5D10];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC5D10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!v6)
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", v7);
    -[UIApplicationSceneTransitionContext setPasteSharingToken:](self, "setPasteSharingToken:", v8);
  }
  if (v6)
    v9 = v6;
  else
    v9 = v4;
  v11 = v9;

  -[FBSSettings otherSettings](self, "otherSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v11, 1);

}

- (BOOL)shouldTakeKeyboardFocus
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 9);

  return v3;
}

- (int64_t)statusBarAnimation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (double)userLaunchEventTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (unint64_t)signpostID
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)forTesting
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

- (double)execTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setSafeMode:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 3);

}

- (BOOL)waitForBackgroundTaskCompletion
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 10);

  return v3;
}

- (void)setWaitForBackgroundTaskCompletion:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 10);

}

- (void)setDisableTouchCancellationOnRotation:(BOOL)a3
{
  id v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 12);

}

- (void)setPasteSharingToken:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v5, 14);
}

- (void)_setLifecycleActionType:(unint64_t)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 8);

}

- (unint64_t)_lifecycleActionType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
    return 0;
  else
    return off_1E16C87C0[a3 - 1];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v11;
  __CFString *v12;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  switch(a5)
  {
    case 2uLL:
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
      BSSettingFlagIsYes();
      NSStringFromBOOL();
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 8uLL:
      _UIApplicationSceneLifecycleActionTypeDescription(objc_msgSend(v6, "integerValue"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0xBuLL:
      v11 = objc_msgSend(v6, "integerValue");
      v12 = CFSTR("none");
      if (v11 == 1)
        v12 = CFSTR("fade");
      if (v11 == 2)
        v12 = CFSTR("slide");
      v9 = v12;
LABEL_3:
      v8 = v9;
      break;
    default:
      break;
  }

  return v8;
}

@end
