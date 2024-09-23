@implementation TVRUIButtonEvent

- (id)_initWithButtonType:(int64_t)a3 eventType:(int64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRUIButtonEvent;
  result = -[TVRUIButtonEvent init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = a3;
    *((_QWORD *)result + 3) = a4;
  }
  return result;
}

+ (id)createButtonEvent:(int64_t)a3 buttonType:(int64_t)a4
{
  TVRUIButtonEvent *v6;

  v6 = objc_alloc_init(TVRUIButtonEvent);
  v6->_buttonType = a4;
  v6->_eventType = a3;
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_5);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButtonEvent buttonType](self, "buttonType"), CFSTR("buttonType"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButtonEvent eventType](self, "eventType"), CFSTR("eventType"));
  v6 = (id)objc_msgSend(v3, "appendClass:withName:", objc_opt_class(), CFSTR("class"));
  v7 = (void *)description_dateFormatter;
  -[TVRUIButtonEvent timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("timestamp"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __31__TVRUIButtonEvent_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)description_dateFormatter;
  description_dateFormatter = (uint64_t)v0;

}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
