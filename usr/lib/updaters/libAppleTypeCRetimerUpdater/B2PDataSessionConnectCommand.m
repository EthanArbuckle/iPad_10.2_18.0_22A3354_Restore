@implementation B2PDataSessionConnectCommand

- (B2PDataSessionConnectCommand)initWithSessionID:(unsigned __int8)a3 state:(int)a4
{
  B2PDataSessionConnectCommand *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)B2PDataSessionConnectCommand;
  result = -[B2PCommand initWithOpCode:](&v7, sel_initWithOpCode_, 16);
  if (result)
  {
    *(&result->super._route + 2) = a3;
    *(_DWORD *)&result->_sessionID = a4;
  }
  return result;
}

- (B2PDataSessionConnectCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  -[B2PDataSessionConnectCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

- (id)data
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendByte:", *(&self->super._route + 2));
  objc_msgSend(v3, "appendByte:", self->_sessionID);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v8.receiver = self;
  v8.super_class = (Class)B2PDataSessionConnectCommand;
  -[B2PCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tSession ID: %u (%s)\n"), *(&self->super._route + 2), stringForB2PDataSessionID(*(&self->super._route + 2)));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tState: %s"), stringForB2PDataSessionState(*(_DWORD *)&self->_sessionID));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)sessionID
{
  return *(&self->super._route + 2);
}

- (void)setSessionID:(unsigned __int8)a3
{
  *(&self->super._route + 2) = a3;
}

- (int)state
{
  return *(_DWORD *)&self->_sessionID;
}

- (void)setState:(int)a3
{
  *(_DWORD *)&self->_sessionID = a3;
}

@end
