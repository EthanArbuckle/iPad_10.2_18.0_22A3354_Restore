@implementation SiriIntentEvent

- (SiriIntentEvent)initWithIntentId:(id)a3 eventType:(int64_t)a4 eventData:(id)a5 createdAt:(id)a6
{
  id v11;
  id v12;
  id v13;
  SiriIntentEvent *v14;
  SiriIntentEvent *v15;
  uint64_t v16;
  NSData *eventData;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SiriIntentEvent;
  v14 = -[SiriIntentEvent init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_intentId, a3);
    v15->_eventType = a4;
    v16 = objc_msgSend(v12, "copy");
    eventData = v15->_eventData;
    v15->_eventData = (NSData *)v16;

    objc_storeStrong((id *)&v15->_createdAt, a6);
  }

  return v15;
}

- (NSString)intentId
{
  return self->_intentId;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
}

@end
