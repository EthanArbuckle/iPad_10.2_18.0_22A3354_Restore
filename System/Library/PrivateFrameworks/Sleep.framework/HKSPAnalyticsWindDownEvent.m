@implementation HKSPAnalyticsWindDownEvent

- (HKSPAnalyticsWindDownEvent)initWithWindDownEventData:(id)a3 watchProductType:(id)a4 weeksSinceOnboarded:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPAnalyticsWindDownEvent *v11;
  HKSPAnalyticsWindDownEvent *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *eventPayload;
  HKSPAnalyticsWindDownEvent *v25;
  id v27;
  void *v28;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HKSPAnalyticsWindDownEvent;
  v11 = -[HKSPAnalyticsWindDownEvent init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eventName, CFSTR("com.apple.SleepHealth.WindDownActionsEvent"));
    objc_msgSend((id)objc_opt_class(), "_payloadValueForWindDownAction:", objc_msgSend(v8, "action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "wasUsed");
    v15 = v10;
    v27 = v9;
    v16 = v9;
    v17 = (objc_class *)MEMORY[0x1E0C99E08];
    v18 = v13;
    v19 = [v17 alloc];
    v30[0] = CFSTR("windDownActionPresented");
    v30[1] = CFSTR("windDownActionUsed");
    v31[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(v19, "initWithDictionary:", v21);
    if (v16)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("activeWatchProductType"));
    if (v15)
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("weeksSinceOnboardedWindDownActions"));
    v23 = objc_msgSend(v22, "copy", v27);

    eventPayload = v12->_eventPayload;
    v12->_eventPayload = (NSDictionary *)v23;

    v25 = v12;
    v9 = v28;
  }

  return v12;
}

+ (id)_payloadValueForWindDownAction:(unint64_t)a3
{
  if (a3 > 3)
    return &stru_1E4E3E220;
  else
    return off_1E4E3A7E8[a3];
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
