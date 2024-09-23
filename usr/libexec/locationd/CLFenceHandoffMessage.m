@implementation CLFenceHandoffMessage

- (void)dealloc
{
  objc_super v3;

  self->_payload = 0;
  self->_primaryKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLFenceHandoffMessage;
  -[CLFenceHandoffMessage dealloc](&v3, "dealloc");
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)primaryKey
{
  return self->_primaryKey;
}

- (void)setPrimaryKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
