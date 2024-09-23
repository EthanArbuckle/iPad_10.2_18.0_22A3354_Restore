@implementation CLLocationStreamingMessage

- (void)dealloc
{
  objc_super v3;

  self->_messageType = 0;
  self->_payload = 0;

  self->_idsOptions = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamingMessage;
  -[CLLocationStreamingMessage dealloc](&v3, "dealloc");
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
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
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int)a3
{
  self->_protocolVersion = a3;
}

@end
