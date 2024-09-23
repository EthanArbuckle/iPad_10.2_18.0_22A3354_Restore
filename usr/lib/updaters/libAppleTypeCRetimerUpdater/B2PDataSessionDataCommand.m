@implementation B2PDataSessionDataCommand

- (B2PDataSessionDataCommand)initWithSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  id v8;
  B2PDataSessionDataCommand *v9;
  B2PDataSessionDataCommand *v10;
  uint64_t v11;
  NSData *sessionData;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)B2PDataSessionDataCommand;
  v9 = -[B2PCommand initWithOpCode:](&v14, sel_initWithOpCode_, 18);
  v10 = v9;
  if (v9)
  {
    v9->_sessionID = a3;
    v9->_status = a4;
    v11 = objc_msgSend(v8, "copy");
    sessionData = v10->_sessionData;
    v10->_sessionData = (NSData *)v11;

  }
  return v10;
}

- (id)data
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendByte:", self->_sessionID);
  objc_msgSend(v3, "appendByte:", LOBYTE(self->_status));
  objc_msgSend(v3, "appendData:", self->_sessionData);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)parseCommand:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  unsigned __int8 *v7;
  uint64_t v8;
  NSData *v9;
  NSData *sessionData;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 2)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
    self->_sessionID = *v7;
    self->_status = v7[1];
    v8 = objc_msgSend(v6, "length");
    if (v8 != 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7 + 2, v8 - 2);
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      sessionData = self->_sessionData;
      self->_sessionData = v9;

    }
  }

  return v5 > 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)B2PDataSessionDataCommand;
  -[B2PCommand description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tSession ID: %u (%s)\n"), self->_sessionID, stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tStatus: %s\n"), stringForB2PDataSessionStatus(self->_status));
  -[NSData byteString](self->_sessionData, "byteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tData: %@\n"), v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned __int8)a3
{
  self->_sessionID = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSData)sessionData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSessionData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
}

@end
