@implementation STCommunicationLimitsCoreAnalyticsEvent

- (STCommunicationLimitsCoreAnalyticsEvent)initWithCommunicationLimited:(BOOL)a3 contactManagementEnabled:(BOOL)a4 contactEditingAllowed:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7
{
  STCommunicationLimitsCoreAnalyticsEvent *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STCommunicationLimitsCoreAnalyticsEvent;
  result = -[STCommunicationLimitsCoreAnalyticsEvent init](&v13, sel_init);
  result->_communicationLimited = a3;
  result->_contactManagementEnabled = a4;
  result->_contactEditingAllowed = a5;
  result->_userAgeGroup = a6;
  result->_userIsRemote = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.communicationLimitsChanged");
}

+ (id)description
{
  return CFSTR("CommunicationLimitsChanged");
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
  v10[0] = CFSTR("communicationLimited");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent communicationLimited](self, "communicationLimited"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("contactManagementEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent contactManagementEnabled](self, "contactManagementEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("contactEditingAllowed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent contactEditingAllowed](self, "contactEditingAllowed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("userAgeGroup");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STCommunicationLimitsCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("userIsRemote");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (BOOL)communicationLimited
{
  return self->_communicationLimited;
}

- (BOOL)contactManagementEnabled
{
  return self->_contactManagementEnabled;
}

- (BOOL)contactEditingAllowed
{
  return self->_contactEditingAllowed;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end
