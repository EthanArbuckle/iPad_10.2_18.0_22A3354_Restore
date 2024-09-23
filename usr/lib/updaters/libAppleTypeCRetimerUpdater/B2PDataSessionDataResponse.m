@implementation B2PDataSessionDataResponse

- (B2PDataSessionDataResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 sessionID:(unsigned __int8)a5 dataSessionStatus:(int)a6 data:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  B2PDataSessionDataResponse *v13;
  B2PDataSessionDataResponse *v14;
  uint64_t v15;
  NSData *sessionData;
  objc_super v18;

  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)B2PDataSessionDataResponse;
  v13 = -[B2PResponse initWithOpCode:route:status:](&v18, sel_initWithOpCode_route_status_, 19, v10, v9);
  v14 = v13;
  if (v13)
  {
    v13->_sessionID = a5;
    v13->_dataSessionStatus = a6;
    v15 = objc_msgSend(v12, "copy");
    sessionData = v14->_sessionData;
    v14->_sessionData = (NSData *)v15;

  }
  return v14;
}

- (BOOL)parseResponse:(id)a3
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
    self->_dataSessionStatus = v7[1];
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

- (id)data
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendByte:", self->_sessionID);
  objc_msgSend(v3, "appendByte:", LOBYTE(self->_dataSessionStatus));
  if (self->_sessionData)
    objc_msgSend(v3, "appendData:");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSData *sessionData;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v10.receiver = self;
  v10.super_class = (Class)B2PDataSessionDataResponse;
  -[B2PResponse description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tSession ID: %u (%s)\n"), self->_sessionID, stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tStatus: %u (%s)\n"), self->_dataSessionStatus, stringForB2PDataSessionStatus(self->_dataSessionStatus));
  sessionData = self->_sessionData;
  if (sessionData)
  {
    -[NSData byteString](sessionData, "byteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tData: %@\n"), v7);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (int)dataSessionStatus
{
  return self->_dataSessionStatus;
}

- (NSData)sessionData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
}

@end
