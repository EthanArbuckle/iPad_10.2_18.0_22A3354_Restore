@implementation STWeeklyReportUserNotificationContext

- (STWeeklyReportUserNotificationContext)init
{
  STWeeklyReportUserNotificationContext *v2;
  STWeeklyReportUserNotificationContext *v3;
  NSString *notificationBodyKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWeeklyReportUserNotificationContext;
  v2 = -[STUserNotificationContext initWithIdentifier:](&v6, sel_initWithIdentifier_, CFSTR("weekly_usage_report"));
  v3 = v2;
  if (v2)
  {
    notificationBodyKey = v2->_notificationBodyKey;
    v2->_notificationBodyKey = (NSString *)CFSTR("WeeklyReportNotificationDefaultBody");

  }
  return v3;
}

- (STWeeklyReportUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STWeeklyReportUserNotificationContext *v5;
  uint64_t v6;
  NSData *weeklyReportData;
  double v8;
  uint64_t v9;
  NSNumber *totalUsage;
  uint64_t v11;
  NSString *notificationBodyKey;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STWeeklyReportUserNotificationContext;
  v5 = -[STUserNotificationContext initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weeklyReportData"));
    v6 = objc_claimAutoreleasedReturnValue();
    weeklyReportData = v5->_weeklyReportData;
    v5->_weeklyReportData = (NSData *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("deltaScreenTimeUsage"));
    v5->_deltaScreenTimeUsage = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalUsage"));
    v9 = objc_claimAutoreleasedReturnValue();
    totalUsage = v5->_totalUsage;
    v5->_totalUsage = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationBodyKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    notificationBodyKey = v5->_notificationBodyKey;
    v5->_notificationBodyKey = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeeklyReportUserNotificationContext;
  v4 = a3;
  -[STUserNotificationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_weeklyReportData, CFSTR("weeklyReportData"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("deltaScreenTimeUsage"), self->_deltaScreenTimeUsage);
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalUsage, CFSTR("totalUsage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_notificationBodyKey, CFSTR("notificationBodyKey"));

}

- (void)setDeltaScreenTimeUsage:(double)a3 totalUsage:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *notificationBodyKey;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  NSString *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[STWeeklyReportUserNotificationContext setDeltaScreenTimeUsage:](self, "setDeltaScreenTimeUsage:", a3);
  -[STWeeklyReportUserNotificationContext setTotalUsage:](self, "setTotalUsage:", v6);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setAllowedUnits:", 96);
  objc_msgSend(v7, "setUnitsStyle:", 3);
  objc_msgSend(v6, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSecond:", (uint64_t)(v9 / 7.0));
  objc_msgSend(v7, "stringFromDateComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 0.05 && a3 <= 2.0)
  {
    notificationBodyKey = self->_notificationBodyKey;
    self->_notificationBodyKey = (NSString *)CFSTR("WeeklyReportNotificationPositiveDeltaBody");

    v17 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringFromNumber:numberStyle:", v18, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v19;
    v26[1] = v11;
    v20 = (void *)MEMORY[0x1E0C99D20];
    v21 = v26;
LABEL_9:
    objc_msgSend(v20, "arrayWithObjects:count:", v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", v22);

    goto LABEL_10;
  }
  if (a3 <= -0.05 && a3 >= -0.9)
  {
    v13 = self->_notificationBodyKey;
    self->_notificationBodyKey = (NSString *)CFSTR("WeeklyReportNotificationNegativeDeltaBody");

    v14 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v19;
    v25[1] = v11;
    v20 = (void *)MEMORY[0x1E0C99D20];
    v21 = v25;
    goto LABEL_9;
  }
  v23 = self->_notificationBodyKey;
  if ((uint64_t)(v9 / 7.0) <= 59)
  {
    self->_notificationBodyKey = (NSString *)CFSTR("WeeklyReportNotificationLessThanOneMinute");

    goto LABEL_11;
  }
  self->_notificationBodyKey = (NSString *)CFSTR("WeeklyReportNotificationDefaultBody");

  v24 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUserNotificationContext setLocalizedUserNotificationBodyArguments:](self, "setLocalizedUserNotificationBodyArguments:", v19);
LABEL_10:

LABEL_11:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  STWeeklyReportUserNotificationContext *v11;
  id v12;

  v9[1] = 3221225472;
  v9[2] = __90__STWeeklyReportUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E9370AC8;
  v10 = a3;
  v11 = self;
  v12 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STWeeklyReportUserNotificationContext;
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = v12;
  v7 = v10;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](&v8, sel_customizeNotificationContent_withCompletionBlock_, v7, v9);

}

uint64_t __90__STWeeklyReportUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("WeeklyReportNotificationTitle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v2);

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "notificationBodyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedUserNotificationBodyArguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUserNotificationStringForKey:arguments:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBody:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setCategoryIdentifier:", CFSTR("com.apple.screentime.weekly-usage-report"));
  objc_msgSend(*(id *)(a1 + 40), "weeklyReportData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13 = CFSTR("weeklyReportData");
    objc_msgSend(*(id *)(a1 + 40), "weeklyReportData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUserInfo:", v9);

  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setScheme:", CFSTR("prefs"));
  objc_msgSend(v10, "setPath:", CFSTR("root=SCREEN_TIME&path=SCREEN_TIME_SUMMARY"));
  objc_msgSend(v10, "setFragment:", CFSTR("WEEK"));
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setDefaultActionURL:", v11);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (NSData)weeklyReportData
{
  return self->_weeklyReportData;
}

- (void)setWeeklyReportData:(id)a3
{
  objc_storeStrong((id *)&self->_weeklyReportData, a3);
}

- (double)deltaScreenTimeUsage
{
  return self->_deltaScreenTimeUsage;
}

- (void)setDeltaScreenTimeUsage:(double)a3
{
  self->_deltaScreenTimeUsage = a3;
}

- (NSNumber)totalUsage
{
  return self->_totalUsage;
}

- (void)setTotalUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)notificationBodyKey
{
  return self->_notificationBodyKey;
}

- (void)setNotificationBodyKey:(id)a3
{
  objc_storeStrong((id *)&self->_notificationBodyKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationBodyKey, 0);
  objc_storeStrong((id *)&self->_totalUsage, 0);
  objc_storeStrong((id *)&self->_weeklyReportData, 0);
}

@end
