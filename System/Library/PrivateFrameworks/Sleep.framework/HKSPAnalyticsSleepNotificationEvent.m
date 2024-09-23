@implementation HKSPAnalyticsSleepNotificationEvent

- (HKSPAnalyticsSleepNotificationEvent)initWithType:(unint64_t)a3 action:(unint64_t)a4
{
  HKSPAnalyticsSleepNotificationEvent *v6;
  HKSPAnalyticsSleepNotificationEvent *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  NSDictionary *eventPayload;
  HKSPAnalyticsSleepNotificationEvent *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HKSPAnalyticsSleepNotificationEvent;
  v6 = -[HKSPAnalyticsSleepNotificationEvent init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, CFSTR("com.apple.SleepHealth.SleepNotificationEvent"));
    v8 = CFSTR("FocusIntroduction");
    if (!a3)
      v8 = CFSTR("BedtimeReminder");
    v17[0] = CFSTR("notificationType");
    v17[1] = CFSTR("notificationAction");
    v18[0] = v8;
    if (a4 - 1 > 3)
      v9 = CFSTR("Fired");
    else
      v9 = off_1E4E3D458[a4 - 1];
    v18[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v8;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    eventPayload = v7->_eventPayload;
    v7->_eventPayload = (NSDictionary *)v12;

    v14 = v7;
  }

  return v7;
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
