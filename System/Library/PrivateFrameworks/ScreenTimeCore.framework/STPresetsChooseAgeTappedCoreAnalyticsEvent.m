@implementation STPresetsChooseAgeTappedCoreAnalyticsEvent

- (STPresetsChooseAgeTappedCoreAnalyticsEvent)initWithSessionId:(id)a3
{
  id v4;
  STPresetsChooseAgeTappedCoreAnalyticsEvent *v5;
  uint64_t v6;
  NSString *sessionId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STPresetsChooseAgeTappedCoreAnalyticsEvent;
  v5 = -[STPresetsChooseAgeTappedCoreAnalyticsEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v6;

  }
  return v5;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.Family.PresetsChooseAgeTapped");
}

+ (id)description
{
  return CFSTR("PresetsChooseAgeTapped");
}

- (NSDictionary)payload
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[STPresetsChooseAgeTappedCoreAnalyticsEvent sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sessionId"));

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
