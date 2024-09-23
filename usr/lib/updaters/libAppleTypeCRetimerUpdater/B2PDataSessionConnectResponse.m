@implementation B2PDataSessionConnectResponse

- (BOOL)parseResponse:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 2)
  {
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    self->_sessionID = *v6;
    self->_state = v6[1];
  }

  return v5 > 1;
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
  v8.super_class = (Class)B2PDataSessionConnectResponse;
  -[B2PResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\tSession ID: %u (%s)\n"), self->_sessionID, stringForB2PDataSessionID(self->_sessionID));
  objc_msgSend(v5, "appendFormat:", CFSTR("\tState: %u (%s)"), self->_state, stringForB2PDataSessionState(self->_state));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)sessionID
{
  return self->_sessionID;
}

- (int)state
{
  return self->_state;
}

@end
