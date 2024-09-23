@implementation HDSHBreathingDisturbanceAnalysisAnalyticsEvent

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.hid.bd.sleepnotification");
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (HDSHBreathingDisturbanceAnalysisAnalyticsEvent)initWithDefaultAnalyticsPayload:(id)a3
{
  id v5;
  HDSHBreathingDisturbanceAnalysisAnalyticsEvent *v6;
  HDSHBreathingDisturbanceAnalysisAnalyticsEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSHBreathingDisturbanceAnalysisAnalyticsEvent;
  v6 = -[HDSHBreathingDisturbanceAnalysisAnalyticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultAnalyticsPayload, a3);

  return v7;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  -[NSDictionary objectForKeyedSubscript:](self->_defaultAnalyticsPayload, "objectForKeyedSubscript:", CFSTR("bd_count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bd_count"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isImproveHealthAndActivityEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("is_improve_health_and_activity_allowed"));

  v12 = (void *)objc_msgSend(v7, "copy");
  return v12;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDictionary:", self->_defaultAnalyticsPayload);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "environmentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isImproveHealthAndActivityEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("is_improve_health_and_activity_allowed"));

  v11 = (void *)objc_msgSend(v7, "copy");
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAnalyticsPayload, 0);
}

@end
