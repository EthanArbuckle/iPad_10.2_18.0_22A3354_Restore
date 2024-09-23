@implementation RKResponseCountTimestampRecipient

- (RKResponseCountTimestampRecipient)initWithCount:(int)a3 timestamp:(id)a4 hasSameRecipient:(BOOL)a5
{
  id v9;
  RKResponseCountTimestampRecipient *v10;
  RKResponseCountTimestampRecipient *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RKResponseCountTimestampRecipient;
  v10 = -[RKResponseCountTimestampRecipient init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_count = a3;
    objc_storeStrong((id *)&v10->_timestamp, a4);
    v11->_hasSameRecipient = a5;
  }

  return v11;
}

- (int)count
{
  return self->_count;
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)hasSameRecipient
{
  return self->_hasSameRecipient;
}

- (void)setHasSameRecipient:(BOOL)a3
{
  self->_hasSameRecipient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
