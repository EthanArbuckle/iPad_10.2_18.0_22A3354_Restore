@implementation STViewAllActivityCoreAnalyticsEvent

- (STViewAllActivityCoreAnalyticsEvent)initWithDaysSinceLastView:(int64_t)a3 userAgeGroup:(int64_t)a4 userIsManaged:(BOOL)a5 userIsRemote:(BOOL)a6
{
  STViewAllActivityCoreAnalyticsEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STViewAllActivityCoreAnalyticsEvent;
  result = -[STViewAllActivityCoreAnalyticsEvent init](&v11, sel_init);
  result->_daysSinceLastView = a3;
  result->_userAgeGroup = a4;
  result->_userIsManaged = a5;
  result->_userIsRemote = a6;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.allActivityViewed");
}

+ (id)description
{
  return CFSTR("AllActivityViewed");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("daysSinceLastView");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STViewAllActivityCoreAnalyticsEvent daysSinceLastView](self, "daysSinceLastView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("userAgeGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STViewAllActivityCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("userIsManaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STViewAllActivityCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("userIsRemote");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STViewAllActivityCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (int64_t)daysSinceLastView
{
  return self->_daysSinceLastView;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end
