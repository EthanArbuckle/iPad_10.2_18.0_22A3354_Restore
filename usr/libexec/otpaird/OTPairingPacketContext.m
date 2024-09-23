@implementation OTPairingPacketContext

- (OTPairingPacketContext)initWithMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  OTPairingPacketContext *v11;
  OTPairingPacketContext *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)OTPairingPacketContext;
  v11 = -[OTPairingPacketContext init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    -[OTPairingPacketContext setMessage:](v11, "setMessage:", v8);
    -[OTPairingPacketContext setFromID:](v12, "setFromID:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "incomingResponseIdentifier"));
    -[OTPairingPacketContext setIncomingResponseIdentifier:](v12, "setIncomingResponseIdentifier:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outgoingResponseIdentifier"));
    -[OTPairingPacketContext setOutgoingResponseIdentifier:](v12, "setOutgoingResponseIdentifier:", v14);

  }
  return v12;
}

- (int)messageType
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext message](self, "message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("m")));

  if (v4)
  {
    v5 = objc_msgSend(v4, "intValue");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext packetData](self, "packetData"));

    if (v6)
      v5 = 1;
    else
      v5 = 2;
  }

  return v5;
}

- (NSString)sessionIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext message](self, "message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("session")));

  return (NSString *)v3;
}

- (NSData)packetData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext message](self, "message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("packet")));

  return (NSData *)v3;
}

- (NSError)error
{
  NSError *error;
  void *v4;
  void *v5;
  NSError *v6;
  NSError *v7;
  NSError *v8;

  if (-[OTPairingPacketContext messageType](self, "messageType") == 2)
  {
    error = self->_error;
    if (!error)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext message](self, "message"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error")));

      v6 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.otpaird"), 4, v5));
      v7 = self->_error;
      self->_error = v6;

      error = self->_error;
    }
    v8 = error;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSDictionary)message
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)fromID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFromID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)incomingResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIncomingResponseIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)outgoingResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutgoingResponseIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
