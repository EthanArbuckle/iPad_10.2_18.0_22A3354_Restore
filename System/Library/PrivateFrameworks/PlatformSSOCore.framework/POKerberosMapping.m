@implementation POKerberosMapping

- (id)dictionaryRepresentation
{
  id v3;
  NSString *ticketKeyPath;
  void *v5;
  NSString *messageBufferKeyName;
  void *v7;
  NSString *realmKeyName;
  void *v9;
  NSString *serviceNameKeyName;
  void *v11;
  NSString *clientNameKeyName;
  void *v13;
  NSString *encryptionKeyTypeKeyName;
  void *v15;
  NSString *sessionKeyKeyName;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  ticketKeyPath = self->_ticketKeyPath;
  NSStringFromSelector(sel_ticketKeyPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", ticketKeyPath, v5);

  messageBufferKeyName = self->_messageBufferKeyName;
  NSStringFromSelector(sel_messageBufferKeyName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", messageBufferKeyName, v7);

  realmKeyName = self->_realmKeyName;
  NSStringFromSelector(sel_realmKeyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", realmKeyName, v9);

  serviceNameKeyName = self->_serviceNameKeyName;
  NSStringFromSelector(sel_serviceNameKeyName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", serviceNameKeyName, v11);

  clientNameKeyName = self->_clientNameKeyName;
  NSStringFromSelector(sel_clientNameKeyName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", clientNameKeyName, v13);

  encryptionKeyTypeKeyName = self->_encryptionKeyTypeKeyName;
  NSStringFromSelector(sel_encryptionKeyTypeKeyName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", encryptionKeyTypeKeyName, v15);

  sessionKeyKeyName = self->_sessionKeyKeyName;
  NSStringFromSelector(sel_sessionKeyKeyName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", sessionKeyKeyName, v17);

  return v3;
}

- (POKerberosMapping)initWithDictionary:(id)a3
{
  id v4;
  POKerberosMapping *v5;
  void *v6;
  uint64_t v7;
  NSString *ticketKeyPath;
  void *v9;
  uint64_t v10;
  NSString *messageBufferKeyName;
  void *v12;
  uint64_t v13;
  NSString *realmKeyName;
  void *v15;
  uint64_t v16;
  NSString *serviceNameKeyName;
  void *v18;
  uint64_t v19;
  NSString *clientNameKeyName;
  void *v21;
  uint64_t v22;
  NSString *encryptionKeyTypeKeyName;
  void *v24;
  uint64_t v25;
  NSString *sessionKeyKeyName;

  v4 = a3;
  v5 = -[POKerberosMapping init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_ticketKeyPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v7;

    NSStringFromSelector(sel_messageBufferKeyName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    messageBufferKeyName = v5->_messageBufferKeyName;
    v5->_messageBufferKeyName = (NSString *)v10;

    NSStringFromSelector(sel_realmKeyName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    realmKeyName = v5->_realmKeyName;
    v5->_realmKeyName = (NSString *)v13;

    NSStringFromSelector(sel_serviceNameKeyName);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    serviceNameKeyName = v5->_serviceNameKeyName;
    v5->_serviceNameKeyName = (NSString *)v16;

    NSStringFromSelector(sel_clientNameKeyName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    clientNameKeyName = v5->_clientNameKeyName;
    v5->_clientNameKeyName = (NSString *)v19;

    NSStringFromSelector(sel_encryptionKeyTypeKeyName);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    encryptionKeyTypeKeyName = v5->_encryptionKeyTypeKeyName;
    v5->_encryptionKeyTypeKeyName = (NSString *)v22;

    NSStringFromSelector(sel_sessionKeyKeyName);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    sessionKeyKeyName = v5->_sessionKeyKeyName;
    v5->_sessionKeyKeyName = (NSString *)v25;

  }
  return v5;
}

- (NSString)ticketKeyPath
{
  return self->_ticketKeyPath;
}

- (void)setTicketKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_ticketKeyPath, a3);
}

- (NSString)messageBufferKeyName
{
  return self->_messageBufferKeyName;
}

- (void)setMessageBufferKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_messageBufferKeyName, a3);
}

- (NSString)realmKeyName
{
  return self->_realmKeyName;
}

- (void)setRealmKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_realmKeyName, a3);
}

- (NSString)serviceNameKeyName
{
  return self->_serviceNameKeyName;
}

- (void)setServiceNameKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceNameKeyName, a3);
}

- (NSString)clientNameKeyName
{
  return self->_clientNameKeyName;
}

- (void)setClientNameKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_clientNameKeyName, a3);
}

- (NSString)encryptionKeyTypeKeyName
{
  return self->_encryptionKeyTypeKeyName;
}

- (void)setEncryptionKeyTypeKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKeyTypeKeyName, a3);
}

- (NSString)sessionKeyKeyName
{
  return self->_sessionKeyKeyName;
}

- (void)setSessionKeyKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_sessionKeyKeyName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKeyKeyName, 0);
  objc_storeStrong((id *)&self->_encryptionKeyTypeKeyName, 0);
  objc_storeStrong((id *)&self->_clientNameKeyName, 0);
  objc_storeStrong((id *)&self->_serviceNameKeyName, 0);
  objc_storeStrong((id *)&self->_realmKeyName, 0);
  objc_storeStrong((id *)&self->_messageBufferKeyName, 0);
  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

@end
