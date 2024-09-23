@implementation HDSPWakeUpResultsNotification

- (HDSPWakeUpResultsNotification)initWithCategory:(unint64_t)a3 endMorningIndex:(int64_t)a4 goalAchieved:(id)a5 notificationVariant:(int64_t)a6 userFirstName:(id)a7
{
  id v12;
  id v13;
  HDSPWakeUpResultsNotification *v14;
  HDSPWakeUpResultsNotification *v15;
  uint64_t v16;
  HKQuantity *goalAchieved;
  unint64_t v18;
  int64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSString *userFirstName;
  HDSPWakeUpResultsNotification *v24;
  objc_super v26;

  v12 = a5;
  v13 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDSPWakeUpResultsNotification;
  v14 = -[HDSPWakeUpResultsNotification init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_category = a3;
    v16 = objc_msgSend(v12, "copy");
    goalAchieved = v15->_goalAchieved;
    v15->_goalAchieved = (HKQuantity *)v16;

    v15->_endMorningIndex = a4;
    if (a6 < 1)
    {
      v19 = 1;
    }
    else
    {
      if (a3 > 2)
        v18 = 0;
      else
        v18 = qword_216185EF8[a3];
      if (v18 < a6)
        v19 = 1;
      else
        v19 = a6;
    }
    v15->_notificationVariant = v19;
    v20 = v13;
    v21 = v20;
    if (v20 && objc_msgSend(v20, "length"))
    {
      objc_msgSend(v21, "hk_stripLeadingTrailingWhitespace");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

    userFirstName = v15->_userFirstName;
    v15->_userFirstName = (NSString *)v22;

    v24 = v15;
  }

  return v15;
}

+ (id)wakeUpResultsNotificationFromUserInfo:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEA9790]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v10 = v8;
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA9438]) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA9440]) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA9750]))
        goto LABEL_15;
      v11 = 2;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEA97A0]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEA97B8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(a1, "goalAchievedQuantityForCategory:userInfo:", v11, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEA9798]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategory:endMorningIndex:goalAchieved:notificationVariant:userFirstName:", v11, objc_msgSend(v10, "integerValue"), v13, objc_msgSend(v12, "integerValue"), v14);

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

      goto LABEL_20;
    }
LABEL_15:
    v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (NSString)categoryIdentifier
{
  return (NSString *)HDSPWakeUpResultsCategoryIdentifier(self->_category);
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x24BEA95D0];
}

- (NSDictionary)userInfo
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  v15[0] = *MEMORY[0x24BEA9790];
  HDSPWakeUpResultsCategoryIdentifier(self->_category);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = *MEMORY[0x24BEA97A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_endMorningIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = *MEMORY[0x24BEA97B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_notificationVariant);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  objc_msgSend((id)objc_opt_class(), "goalAchievedUserInfoKeyForCategory:", self->_category);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDSPWakeUpResultsNotification goalAchievedUserInfoValue](self, "goalAchievedUserInfoValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithDictionary:", v9);

  -[HDSPWakeUpResultsNotification userFirstName](self, "userFirstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HDSPWakeUpResultsNotification userFirstName](self, "userFirstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BEA9798]);

  }
  v13 = (void *)objc_msgSend(v10, "copy");

  return (NSDictionary *)v13;
}

- (BOOL)isEqualToNotification:(id)a3
{
  id v4;
  unint64_t category;
  int64_t endMorningIndex;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  category = self->_category;
  if (category == objc_msgSend(v4, "category")
    && (endMorningIndex = self->_endMorningIndex, endMorningIndex == objc_msgSend(v4, "endMorningIndex")))
  {
    v7 = -[HDSPWakeUpResultsNotification goalAchievedUserInfoValue](self, "goalAchievedUserInfoValue");
    v8 = v7 == objc_msgSend(v4, "goalAchievedUserInfoValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HDSPWakeUpResultsNotification *v4;
  BOOL v5;

  v4 = (HDSPWakeUpResultsNotification *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HDSPWakeUpResultsNotification isEqualToNotification:](self, "isEqualToNotification:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_endMorningIndex ^ self->_category;
  return v2 ^ -[HDSPWakeUpResultsNotification goalAchievedUserInfoValue](self, "goalAchievedUserInfoValue");
}

- (BOOL)isOneNight
{
  return self->_category == 0;
}

- (int64_t)goalAchievedUserInfoValue
{
  BOOL v3;
  HKQuantity *goalAchieved;
  void *v5;
  double v6;
  double v7;

  v3 = -[HDSPWakeUpResultsNotification isOneNight](self, "isOneNight");
  goalAchieved = self->_goalAchieved;
  if (v3)
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](goalAchieved, "doubleValueForUnit:", v5);
  v7 = v6;

  return (uint64_t)v7;
}

+ (id)goalAchievedUserInfoKeyForCategory:(unint64_t)a3
{
  id *v3;

  v3 = (id *)MEMORY[0x24BEA97B0];
  if (a3)
    v3 = (id *)MEMORY[0x24BEA97A8];
  return *v3;
}

+ (id)goalAchievedQuantityForCategory:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "goalAchievedUserInfoKeyForCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(MEMORY[0x24BDD4048], "dayUnit");
  else
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v10, "quantityWithUnit:doubleValue:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)category
{
  return self->_category;
}

- (HKQuantity)goalAchieved
{
  return self->_goalAchieved;
}

- (int64_t)endMorningIndex
{
  return self->_endMorningIndex;
}

- (int64_t)notificationVariant
{
  return self->_notificationVariant;
}

- (NSString)userFirstName
{
  return self->_userFirstName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFirstName, 0);
  objc_storeStrong((id *)&self->_goalAchieved, 0);
}

@end
