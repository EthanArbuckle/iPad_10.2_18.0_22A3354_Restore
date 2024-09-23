@implementation STDowntimeOverrideCoreAnalyticsEvent

- (STDowntimeOverrideCoreAnalyticsEvent)initWithDowntimeEnabled:(BOOL)a3 gracePeriodUsed:(BOOL)a4 scheduleEnabled:(BOOL)a5 hourOfDay:(int64_t)a6 userIsManaged:(BOOL)a7
{
  STDowntimeOverrideCoreAnalyticsEvent *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STDowntimeOverrideCoreAnalyticsEvent;
  result = -[STDowntimeOverrideCoreAnalyticsEvent init](&v13, sel_init);
  result->_downtimeEnabled = a3;
  result->_gracePeriodUsed = a4;
  result->_scheduleEnabled = a5;
  result->_hourOfDay = a6;
  result->_userIsManaged = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.downtimeOverrideChanged");
}

+ (id)description
{
  return CFSTR("DowntimeOverrideChanged");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("downtimeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent downtimeEnabled](self, "downtimeEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("gracePeriodUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent gracePeriodUsed](self, "gracePeriodUsed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("scheduleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent scheduleEnabled](self, "scheduleEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("hourOfDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STDowntimeOverrideCoreAnalyticsEvent hourOfDay](self, "hourOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("userIsManaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (BOOL)downtimeEnabled
{
  return self->_downtimeEnabled;
}

- (BOOL)gracePeriodUsed
{
  return self->_gracePeriodUsed;
}

- (BOOL)scheduleEnabled
{
  return self->_scheduleEnabled;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

@end
