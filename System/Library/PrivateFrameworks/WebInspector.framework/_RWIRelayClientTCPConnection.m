@implementation _RWIRelayClientTCPConnection

+ (id)connectionFromTCPConnection:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  _RWIRelayClientTCPConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_RWIRelayClientTCPConnection initWithTCPConnection:delegate:]([_RWIRelayClientTCPConnection alloc], "initWithTCPConnection:delegate:", v6, v5);

  return v7;
}

+ (id)connectionFromLockdownCheckinWithInfo:(void *)a3 delegate:(id)a4
{
  id v5;
  __CFDictionary *Mutable;

  v5 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BEDC4A8], a3);
  secure_lockdown_checkin();
  CFRelease(Mutable);
  NSLog(CFSTR("Unable to check in with lockdown."));

  return 0;
}

- (_RWIRelayClientTCPConnection)initWithTCPConnection:(id)a3 delegate:(id)a4
{
  id v7;
  _RWIRelayClientTCPConnection *v8;
  _RWIRelayClientTCPConnection *v9;
  id *p_connection;
  _RWIRelayClientTCPConnection *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RWIRelayClientTCPConnection;
  v8 = -[_RWIRelayClientConnection initWithDelegate:](&v13, sel_initWithDelegate_, a4);
  v9 = v8;
  if (v8)
  {
    p_connection = (id *)&v8->_connection;
    objc_storeStrong((id *)&v8->_connection, a3);
    objc_msgSend(*p_connection, "setDelegate:", v9);
    objc_msgSend(*p_connection, "startReceiving");
    v11 = v9;
  }

  return v9;
}

- (void)closeInternal
{
  _RWITCPConnection *connection;
  _RWITCPConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[_RWITCPConnection setDelegate:](connection, "setDelegate:", 0);
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (void)tcpConnection:(id)a3 didReceiveMessage:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a4, 0, 0, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v6)
    -[_RWIRelayClientConnection dispatchRelayMessage:](self, "dispatchRelayMessage:", v5);

}

- (void)sendMessage:(id)a3
{
  void *v4;
  BOOL v5;
  uint64_t v6;

  if (self->_connection)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = v6 == 0;
    else
      v5 = 0;
    if (v5)
      -[_RWITCPConnection sendMessage:](self->_connection, "sendMessage:", v4);
    else
      -[_RWIRelayClientConnection closeFromConnection](self, "closeFromConnection");

  }
}

- (_RWITCPConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
