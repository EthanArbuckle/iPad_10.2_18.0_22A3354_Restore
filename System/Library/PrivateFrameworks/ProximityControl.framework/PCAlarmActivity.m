@implementation PCAlarmActivity

- (id)initFromAlarm:(id)a3
{
  id v4;
  PCAlarmActivity *v5;
  PCAlarmActivity *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PCAlarmActivity;
  v5 = -[PCAlarmActivity initWithActivityType:](&v12, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.alarm"));
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    objc_msgSend(v4, "displayTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("ALARM_DEFAULT_TITLE"), "isEqualToString:", v7))
    {
      +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    -[PCAlarmActivity setTitle:](v6, "setTitle:", v7);
    v13[0] = CFSTR("fireDate");
    objc_msgSend(v4, "nextFireDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("displayTitle");
    v14[0] = v9;
    v14[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCAlarmActivity setUserInfo:](v6, "setUserInfo:", v10);

  }
  return v6;
}

- (PCAlarmActivity)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  PCAlarmActivity *v8;
  void *v9;
  void *v10;
  PCAlarmActivity *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.alarm"), "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PCAlarmActivity;
    v8 = -[PCAlarmActivity initWithActivityType:](&v13, sel_initWithActivityType_, v7);

    if (v8)
    {
      localizeActivityIfNeeded(v4, 0);
      makeIneligibleForProcessing(v8);
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCAlarmActivity setUserInfo:](v8, "setUserInfo:", v9);

      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCAlarmActivity setTitle:](v8, "setTitle:", v10);

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
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[PCAlarmActivity fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCAlarmActivity title](self, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v6, "setTimeStyle:", 1);
    objc_msgSend(v6, "setDateStyle:", 0);
    objc_msgSend(v6, "stringFromDate:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PCAlarmActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)fireDate
{
  void *v2;
  void *v3;

  -[PCAlarmActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fireDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  -[PCAlarmActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("displayTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)pcactivityType
{
  return 3;
}

- (id)bundleIdentifier
{
  return CFSTR("com.apple.mobiletimer");
}

- (id)image
{
  void *v2;
  void *v3;

  -[PCAlarmActivity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCActivityUtility iconForBundleIdentifier:](PCActivityUtility, "iconForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "pcactivityType");
  if (v5 == -[PCAlarmActivity pcactivityType](self, "pcactivityType"))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCAlarmActivity description](self, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
