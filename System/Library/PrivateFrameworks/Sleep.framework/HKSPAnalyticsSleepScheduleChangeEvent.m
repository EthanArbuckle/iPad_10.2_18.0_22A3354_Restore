@implementation HKSPAnalyticsSleepScheduleChangeEvent

- (HKSPAnalyticsSleepScheduleChangeEvent)initWithScheduleChangeInfo:(id)a3 provenanceInfo:(id)a4
{
  id v6;
  id v7;
  HKSPAnalyticsSleepScheduleChangeEvent *v8;
  HKSPAnalyticsSleepScheduleChangeEvent *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *eventPayload;
  HKSPAnalyticsSleepScheduleChangeEvent *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKSPAnalyticsSleepScheduleChangeEvent;
  v8 = -[HKSPAnalyticsSleepScheduleChangeEvent init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventName, CFSTR("com.apple.SleepHealth.ScheduleChangeEvent"));
    v10 = (void *)objc_opt_class();
    objc_msgSend(v6, "applicationPayloadValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "isSleepTrackingEnabled");
    objc_msgSend(v6, "activePairedWatchProductType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_payloadWithApplication:isSleepTrackingEnabled:activeWatchProductType:provenanceSource:", v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    eventPayload = v9->_eventPayload;
    v9->_eventPayload = (NSDictionary *)v15;

    v17 = v9;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@.%p] event=%@, payload=%@"), v5, self, self->_eventName, self->_eventPayload);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)_payloadWithApplication:(id)a3 isSleepTrackingEnabled:(BOOL)a4 activeWatchProductType:(id)a5 provenanceSource:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v7 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C99E08];
  v12 = a3;
  v13 = [v11 alloc];
  v19[0] = CFSTR("sourceChange");
  v19[1] = CFSTR("watchSleepTrackingEnabled");
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithDictionary:", v15);
  if (v9)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, CFSTR("activeWatchProductType"));
  if (v10)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("provenance"));
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (NSDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
  objc_storeStrong((id *)&self->_eventPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
