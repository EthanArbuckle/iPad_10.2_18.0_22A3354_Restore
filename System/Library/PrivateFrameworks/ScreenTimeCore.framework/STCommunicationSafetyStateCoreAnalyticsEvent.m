@implementation STCommunicationSafetyStateCoreAnalyticsEvent

- (STCommunicationSafetyStateCoreAnalyticsEvent)initWithCommunicationSafetyEnabled:(BOOL)a3
{
  STCommunicationSafetyStateCoreAnalyticsEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCommunicationSafetyStateCoreAnalyticsEvent;
  result = -[STCommunicationSafetyStateCoreAnalyticsEvent init](&v5, sel_init);
  result->_communicationSafetyEnabled = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.ScreenTime.communicationSafetyState");
}

+ (id)description
{
  return CFSTR("CommunicationSafetyState");
}

- (NSDictionary)payload
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("communicationSafetyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCommunicationSafetyStateCoreAnalyticsEvent communicationSafetyEnabled](self, "communicationSafetyEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)communicationSafetyEnabled
{
  return self->_communicationSafetyEnabled;
}

@end
