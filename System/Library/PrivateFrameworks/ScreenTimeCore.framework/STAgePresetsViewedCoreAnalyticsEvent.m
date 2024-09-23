@implementation STAgePresetsViewedCoreAnalyticsEvent

- (STAgePresetsViewedCoreAnalyticsEvent)initWithSessionId:(id)a3 isInitialSetup:(BOOL)a4
{
  id v6;
  STAgePresetsViewedCoreAnalyticsEvent *v7;
  uint64_t v8;
  NSString *sessionId;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAgePresetsViewedCoreAnalyticsEvent;
  v7 = -[STAgePresetsViewedCoreAnalyticsEvent init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sessionId = v7->_sessionId;
    v7->_sessionId = (NSString *)v8;

    v7->_initialSetup = a4;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.Family.AgePresetsViewed");
}

+ (id)description
{
  return CFSTR("AgePresetsViewed");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[STAgePresetsViewedCoreAnalyticsEvent sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STAgePresetsViewedCoreAnalyticsEvent initialSetup](self, "initialSetup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("initialSetup"));

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)initialSetup
{
  return self->_initialSetup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
