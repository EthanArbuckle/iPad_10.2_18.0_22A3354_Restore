@implementation NRLinkDirectorMessage

- (void)dealloc
{
  char *messageBufferPtr;
  objc_super v4;

  if (self)
  {
    messageBufferPtr = self->_messageBufferPtr;
    if (messageBufferPtr)
    {
      free(messageBufferPtr);
      self->_messageBufferPtr = 0;
    }
    self->_messageLen = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NRLinkDirectorMessage;
  -[NRLinkDirectorMessage dealloc](&v4, "dealloc");
}

- (id)description
{
  id v3;
  unint64_t v4;
  uint64_t messageVersion;
  uint64_t payloadLength;

  v3 = objc_alloc((Class)NSString);
  v4 = sub_100021BEC((uint64_t)self);
  if (self)
  {
    messageVersion = self->_messageVersion;
    payloadLength = self->_payloadLength;
  }
  else
  {
    messageVersion = 0;
    payloadLength = 0;
  }
  return objc_msgSend(v3, "initWithFormat:", CFSTR("[%llu, vers %u, len %u]"), v4, messageVersion, payloadLength);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_preferredLink, 0);
}

@end
