@implementation PCTimerActivity

- (id)initFromTimer:(id)a3
{
  id v4;
  PCTimerActivity *v5;
  PCTimerActivity *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PCTimerActivity;
  v5 = -[PCTimerActivity initWithActivityType:](&v13, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.timer"));
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    objc_msgSend(v4, "displayTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("TIMER_DEFAULT_TITLE"), "isEqualToString:", v7))
    {
      +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[PCTimerActivity setTitle:](v6, "setTitle:", v7);
    v9 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "remainingTime");
    objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("fireDate");
    v14[1] = CFSTR("displayTitle");
    v15[0] = v10;
    v15[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCTimerActivity setUserInfo:](v6, "setUserInfo:", v11);

  }
  return v6;
}

- (PCTimerActivity)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  PCTimerActivity *v8;
  void *v9;
  void *v10;
  PCTimerActivity *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.timer"), "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PCTimerActivity;
    v8 = -[PCTimerActivity initWithActivityType:](&v13, sel_initWithActivityType_, v7);

    if (v8)
    {
      localizeActivityIfNeeded(v4, 7);
      makeIneligibleForProcessing(v8);
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCTimerActivity setUserInfo:](v8, "setUserInfo:", v9);

      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCTimerActivity setTitle:](v8, "setTitle:", v10);

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  -[PCTimerActivity timeLeft](self, "timeLeft");
  v4 = v3;
  -[PCTimerActivity displayTitle](self, "displayTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || v4 == 0.0 || v4 < 0.0)
  {
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PCActivityUtility formattedDurationFor:](PCActivityUtility, "formattedDurationFor:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PCTimerActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (double)timeLeft
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PCTimerActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fireDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (id)fireDate
{
  void *v2;
  void *v3;

  -[PCTimerActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fireDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayTitle
{
  void *v2;
  void *v3;

  -[PCTimerActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("displayTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)pcactivityType
{
  return 4;
}

- (id)bundleIdentifier
{
  return CFSTR("com.apple.mobiletimer");
}

- (id)image
{
  void *v2;
  void *v3;

  -[PCTimerActivity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCActivityUtility iconForBundleIdentifier:](PCActivityUtility, "iconForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "pcactivityType");
  if (v5 == -[PCTimerActivity pcactivityType](self, "pcactivityType"))
  {
    v6 = 0;
  }
  else
  {
    -[PCTimerActivity description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v6;
}

@end
