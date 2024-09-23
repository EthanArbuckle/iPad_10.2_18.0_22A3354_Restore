@implementation HKSPAnalyticsOnboardingEvent

- (HKSPAnalyticsOnboardingEvent)initWithOnboardingInfo:(id)a3 provenanceInfo:(id)a4
{
  id v6;
  id v7;
  HKSPAnalyticsOnboardingEvent *v8;
  HKSPAnalyticsOnboardingEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *eventPayload;
  HKSPAnalyticsOnboardingEvent *v27;
  id v29;
  objc_super v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HKSPAnalyticsOnboardingEvent;
  v8 = -[HKSPAnalyticsOnboardingEvent init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventName, CFSTR("com.apple.SleepHealth.OnboardingSteps"));
    objc_msgSend(v6, "stepPayloadValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryPointPayloadValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionPayloadValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    objc_msgSend(v7, "presentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = (objc_class *)MEMORY[0x1E0C99E08];
    v17 = v14;
    v18 = v13;
    v19 = v11;
    v20 = v10;
    v21 = [v16 alloc];
    v31[0] = CFSTR("step");
    v31[1] = CFSTR("entryPoint");
    v32[0] = v20;
    v32[1] = v19;
    v31[2] = CFSTR("device");
    +[HKSPAnalyticsManager currentDeviceType](HKSPAnalyticsManager, "currentDeviceType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v22;
    v32[3] = v18;
    v31[3] = CFSTR("provenance");
    v31[4] = CFSTR("context");
    v32[4] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(v21, "initWithDictionary:", v23);
    if (v15)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, CFSTR("action"));
    v25 = objc_msgSend(v24, "copy");

    eventPayload = v9->_eventPayload;
    v9->_eventPayload = (NSDictionary *)v25;

    v27 = v9;
    v7 = v29;
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
