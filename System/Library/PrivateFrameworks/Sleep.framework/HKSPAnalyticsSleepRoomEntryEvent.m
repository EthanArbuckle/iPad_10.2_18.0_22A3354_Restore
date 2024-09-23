@implementation HKSPAnalyticsSleepRoomEntryEvent

- (HKSPAnalyticsSleepRoomEntryEvent)initWithProvenanceInfo:(id)a3 isOnboarded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HKSPAnalyticsSleepRoomEntryEvent *v7;
  HKSPAnalyticsSleepRoomEntryEvent *v8;
  uint64_t v9;
  NSDictionary *eventPayload;
  HKSPAnalyticsSleepRoomEntryEvent *v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPAnalyticsSleepRoomEntryEvent;
  v7 = -[HKSPAnalyticsSleepRoomEntryEvent init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_eventName, CFSTR("com.apple.SleepHealth.SleepRoomView"));
    objc_msgSend((id)objc_opt_class(), "_payloadWithProvidenceInfo:isOnboarded:", v6, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    eventPayload = v8->_eventPayload;
    v8->_eventPayload = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
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

+ (id)_payloadWithProvidenceInfo:(id)a3 isOnboarded:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v4 = a4;
  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("provenance");
  v5 = a3;
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("context");
  objc_msgSend(v5, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v7;
  v11[2] = CFSTR("isOnboardedSleep");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
