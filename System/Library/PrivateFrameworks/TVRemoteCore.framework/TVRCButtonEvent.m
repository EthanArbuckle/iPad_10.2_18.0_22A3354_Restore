@implementation TVRCButtonEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)buttonEventForButton:(id)a3 eventType:(int64_t)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = -[TVRCButtonEvent _init]([TVRCButtonEvent alloc], "_init");
  v7 = (void *)v6[2];
  v6[2] = v5;
  v8 = v5;

  v6[3] = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRCButtonEvent;
  return -[TVRCButtonEvent init](&v3, sel_init);
}

- (TVRCButtonEvent)initWithCoder:(id)a3
{
  id v4;
  TVRCButtonEvent *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  TVRCButton *button;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCButtonEvent;
  v5 = -[TVRCButtonEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("button"));
    v8 = objc_claimAutoreleasedReturnValue();
    button = v5->_button;
    v5->_button = (TVRCButton *)v8;

    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_button, CFSTR("button"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventType, CFSTR("eventType"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t eventType;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  eventType = self->_eventType;
  if (eventType >= 4)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unknown %@"), v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = off_24DCD7E08[eventType];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; type=%@; button=%@>"), v4, self, v6, self->_button);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (TVRCButton)button
{
  return self->_button;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
