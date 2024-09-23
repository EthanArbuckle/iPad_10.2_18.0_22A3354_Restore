@implementation STScreenTimeEnablementCoreAnalyticsEvent

- (STScreenTimeEnablementCoreAnalyticsEvent)initWithScreenTimeEnabled:(BOOL)a3 numberOfGuardians:(int64_t)a4 pinSet:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7
{
  STScreenTimeEnablementCoreAnalyticsEvent *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STScreenTimeEnablementCoreAnalyticsEvent;
  result = -[STScreenTimeEnablementCoreAnalyticsEvent init](&v13, sel_init);
  result->_screenTimeEnabled = a3;
  result->_pinSet = a5;
  result->_userAgeGroup = a6;
  result->_numberOfGuardians = a4;
  result->_userIsRemote = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.screenTimeEnablementChanged");
}

+ (id)description
{
  return CFSTR("ScreenTimeEnablementChanged");
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
  v10[0] = CFSTR("screenTimeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent screenTimeEnabled](self, "screenTimeEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("numberOfGuardians");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STScreenTimeEnablementCoreAnalyticsEvent numberOfGuardians](self, "numberOfGuardians"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("pinSet");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent pinSet](self, "pinSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("userAgeGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STScreenTimeEnablementCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("userIsRemote");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (int64_t)numberOfGuardians
{
  return self->_numberOfGuardians;
}

- (BOOL)pinSet
{
  return self->_pinSet;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end
