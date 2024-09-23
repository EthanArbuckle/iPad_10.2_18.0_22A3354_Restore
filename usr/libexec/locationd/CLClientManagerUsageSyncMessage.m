@implementation CLClientManagerUsageSyncMessage

- (void)dealloc
{
  objc_super v3;

  self->_messageType = 0;
  self->_dataPayload = 0;

  self->_idsOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLClientManagerUsageSyncMessage;
  -[CLClientManagerUsageSyncMessage dealloc](&v3, "dealloc");
}

- (BOOL)isMessageOfType:(id)a3
{
  return -[NSString isEqual:](-[CLClientManagerUsageSyncMessage messageType](self, "messageType"), "isEqual:", a3);
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)dataPayload
{
  return self->_dataPayload;
}

- (void)setDataPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
