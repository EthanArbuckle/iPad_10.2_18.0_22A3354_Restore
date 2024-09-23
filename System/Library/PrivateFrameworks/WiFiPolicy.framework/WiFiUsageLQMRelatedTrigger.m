@implementation WiFiUsageLQMRelatedTrigger

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (WiFiUsageLQMRelatedTrigger)initWithTrigger:(id)a3 andReason:(id)a4 andTimestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  WiFiUsageLQMRelatedTrigger *v13;
  WiFiUsageLQMRelatedTrigger *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)WiFiUsageLQMRelatedTrigger;
    v14 = -[WiFiUsageLQMRelatedTrigger init](&v16, sel_init);
    objc_storeStrong((id *)&v14->_trigger, a3);
    objc_storeStrong((id *)&v14->_reason, a4);
    objc_storeStrong((id *)&v14->_timestamp, a5);
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@(%@) @ %@}"), self->_trigger, self->_reason, self->_timestamp);
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
