@implementation VUICachedMetricsEvent

- (VUICachedMetricsEvent)initWithEventType:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;
  VUICachedMetricsEvent *v8;
  uint64_t v9;
  NSString *eventType;
  uint64_t v11;
  NSDictionary *eventData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUICachedMetricsEvent;
  v8 = -[VUICachedMetricsEvent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    eventType = v8->_eventType;
    v8->_eventType = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    eventData = v8->_eventData;
    v8->_eventData = (NSDictionary *)v11;

  }
  return v8;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
