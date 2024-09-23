@implementation WFUserConfigureEvent

+ (id)configureEventWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5
{
  return -[WFUserConfigureEvent initWithType:new:old:]([WFUserConfigureEvent alloc], "initWithType:new:old:", a3, a4, a5);
}

- (WFUserConfigureEvent)initWithType:(int64_t)a3 new:(int64_t)a4 old:(int64_t)a5
{
  WFUserConfigureEvent *v8;
  WFUserConfigureEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *eventDictionary;
  objc_super v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)WFUserConfigureEvent;
  v8 = -[WFUserConfigureEvent init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v17[0] = CFSTR("type");
    -[WFUserConfigureEvent _eventTypeStringForType:](v8, "_eventTypeStringForType:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v17[1] = CFSTR("value");
    -[WFUserConfigureEvent _configureValueStringForType:](v9, "_configureValueStringForType:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    v17[2] = CFSTR("previousValue");
    -[WFUserConfigureEvent _configureValueStringForType:](v9, "_configureValueStringForType:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v13 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v9->_eventDictionary;
    v9->_eventDictionary = (NSDictionary *)v13;

  }
  return v9;
}

- (id)_configureValueStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return CFSTR("unknown");
  else
    return off_24DC34668[a3];
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_24DC346C0[a3];
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.event");
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);
}

@end
