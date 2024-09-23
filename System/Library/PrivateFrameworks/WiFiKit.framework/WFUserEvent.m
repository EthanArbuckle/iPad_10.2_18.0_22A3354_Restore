@implementation WFUserEvent

+ (id)eventWithType:(int64_t)a3
{
  return -[WFUserEvent initWithType:state:stateEnum:]([WFUserEvent alloc], "initWithType:state:stateEnum:", a3, 0, 0);
}

+ (id)eventWithType:(int64_t)a3 state:(BOOL)a4
{
  return -[WFUserEvent initWithType:state:stateEnum:]([WFUserEvent alloc], "initWithType:state:stateEnum:", a3, a4, 0);
}

- (WFUserEvent)initWithType:(int64_t)a3 state:(BOOL)a4 stateEnum:(unsigned int)a5
{
  _BOOL4 v6;
  WFUserEvent *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *eventDictionary;
  objc_super v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v6 = a4;
  v20[3] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)WFUserEvent;
  v8 = -[WFUserEvent init](&v18, sel_init);
  if (v8)
  {
    v9 = CFSTR("false");
    if (v6)
      v9 = CFSTR("true");
    v10 = v9;
    v11 = v10;
    if (a3 == 2)
    {

      if (a5 > 2)
        v11 = CFSTR("unknown");
      else
        v11 = off_24DC35FB0[a5];
    }
    v19[0] = CFSTR("type");
    -[WFUserEvent _eventTypeStringForType:](v8, "_eventTypeStringForType:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = v11;
    v19[1] = CFSTR("value");
    v19[2] = CFSTR("process");
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "processName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v15 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v8->_eventDictionary;
    v8->_eventDictionary = (NSDictionary *)v15;

  }
  return v8;
}

+ (id)eventWithType:(int64_t)a3 stateEnum:(unsigned int)a4
{
  return -[WFUserEvent initWithType:state:stateEnum:]([WFUserEvent alloc], "initWithType:state:stateEnum:", a3, 0, *(_QWORD *)&a4);
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD)
    return CFSTR("unknown");
  else
    return off_24DC35FC8[a3];
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
