@implementation POKerberosEntry

- (BOOL)hasAllRequiredValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[POKerberosEntry ticketKeyPath](self, "ticketKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[POKerberosEntry messageBuffer](self, "messageBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[POKerberosEntry realm](self, "realm");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        -[POKerberosEntry serviceName](self, "serviceName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
        {
          -[POKerberosEntry clientName](self, "clientName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "length") && -[POKerberosEntry encryptionKeyType](self, "encryptionKeyType") >= 1)
          {
            -[POKerberosEntry sessionKey](self, "sessionKey");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "length") != 0;

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSString *ticketKeyPath;
  void *v5;
  void *v6;
  void *v7;
  NSString *realm;
  void *v9;
  NSString *serviceName;
  void *v11;
  NSString *clientName;
  void *v13;
  int encryptionKeyType;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  ticketKeyPath = self->_ticketKeyPath;
  NSStringFromSelector(sel_ticketKeyPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", ticketKeyPath, v5);

  -[NSData base64EncodedStringWithOptions:](self->_messageBuffer, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageBuffer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  realm = self->_realm;
  NSStringFromSelector(sel_realm);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", realm, v9);

  serviceName = self->_serviceName;
  NSStringFromSelector(sel_serviceName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", serviceName, v11);

  clientName = self->_clientName;
  NSStringFromSelector(sel_clientName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", clientName, v13);

  encryptionKeyType = self->_encryptionKeyType;
  if (encryptionKeyType)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_encryptionKeyType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &unk_24EC10B28;
  }
  NSStringFromSelector(sel_encryptionKeyType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

  if (encryptionKeyType)
  -[NSData base64EncodedStringWithOptions:](self->_sessionKey, "base64EncodedStringWithOptions:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessionKey);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

  v19 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v19, "setFormatOptions:", 1907);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("created"));

  return v3;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[POKerberosEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 11, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    v6 = __37__POKerberosEntry_dataRepresentation__block_invoke();
    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

id __37__POKerberosEntry_dataRepresentation__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to serialize kerberos entry."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return v0;
}

- (POKerberosEntry)initWithData:(id)a3
{
  id v4;
  POKerberosEntry *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  POKerberosEntry *v10;
  void *v11;
  uint64_t v12;
  NSString *ticketKeyPath;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData *messageBuffer;
  void *v21;
  uint64_t v22;
  NSString *realm;
  void *v24;
  uint64_t v25;
  NSString *serviceName;
  void *v27;
  uint64_t v28;
  NSString *clientName;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSData *sessionKey;
  _QWORD v40[4];
  id v41;
  id v42;

  v4 = a3;
  v5 = -[POKerberosEntry init](self, "init");
  if (!v5)
  {
LABEL_11:
    v10 = v5;
    goto LABEL_12;
  }
  v42 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 16, &v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v42;
  if (!v7)
  {
    NSStringFromSelector(sel_ticketKeyPath);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v12;

    NSStringFromSelector(sel_messageBuffer);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_messageBuffer);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "initWithBase64EncodedString:options:", v18, 0);
      messageBuffer = v5->_messageBuffer;
      v5->_messageBuffer = (NSData *)v19;

    }
    NSStringFromSelector(sel_realm);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    realm = v5->_realm;
    v5->_realm = (NSString *)v22;

    NSStringFromSelector(sel_serviceName);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v25;

    NSStringFromSelector(sel_clientName);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v28;

    NSStringFromSelector(sel_encryptionKeyType);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      v5->_encryptionKeyType = objc_msgSend(v31, "intValue");
    NSStringFromSelector(sel_sessionKey);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_sessionKey);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v34, "initWithBase64EncodedString:options:", v36, 0);
      sessionKey = v5->_sessionKey;
      v5->_sessionKey = (NSData *)v37;

    }
    goto LABEL_11;
  }
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __32__POKerberosEntry_initWithData___block_invoke;
  v40[3] = &unk_24EC025A0;
  v41 = v7;
  v8 = v7;
  v9 = __32__POKerberosEntry_initWithData___block_invoke((uint64_t)v40);

  v10 = 0;
LABEL_12:

  return v10;
}

id __32__POKerberosEntry_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to deserialize kerberos entry."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POKerberosHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

- (NSString)ticketKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTicketKeyPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)messageBuffer
{
  return self->_messageBuffer;
}

- (void)setMessageBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_messageBuffer, a3);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (int)encryptionKeyType
{
  return self->_encryptionKeyType;
}

- (void)setEncryptionKeyType:(int)a3
{
  self->_encryptionKeyType = a3;
}

- (NSData)sessionKey
{
  return self->_sessionKey;
}

- (void)setSessionKey:(id)a3
{
  objc_storeStrong((id *)&self->_sessionKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_messageBuffer, 0);
  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

void __37__POKerberosEntry_dataRepresentation__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22307D000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
