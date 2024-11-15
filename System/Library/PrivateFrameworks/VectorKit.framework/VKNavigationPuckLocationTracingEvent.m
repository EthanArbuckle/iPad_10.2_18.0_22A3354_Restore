@implementation VKNavigationPuckLocationTracingEvent

- (VKNavigationPuckLocationTracingEvent)initWithEventType:(int64_t)a3 timestamp:(double)a4 locationUUID:(id)a5
{
  id v9;
  VKNavigationPuckLocationTracingEvent *v10;
  VKNavigationPuckLocationTracingEvent *v11;
  VKNavigationPuckLocationTracingEvent *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VKNavigationPuckLocationTracingEvent;
  v10 = -[VKNavigationPuckLocationTracingEvent init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_eventType = a3;
    v10->_timestamp = a4;
    objc_storeStrong((id *)&v10->_locationUUID, a5);
    v12 = v11;
  }

  return v11;
}

- (int64_t)type
{
  return self->_eventType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSUUID)locationUUID
{
  return self->_locationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUUID, 0);
}

@end
