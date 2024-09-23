@implementation POKerberosStatus

- (id)dictionaryRepresentation
{
  id v3;
  NSString *ticketKeyPath;
  void *v5;
  NSString *realm;
  void *v7;
  NSString *cacheName;
  void *v9;
  NSString *upn;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  ticketKeyPath = self->_ticketKeyPath;
  NSStringFromSelector(sel_ticketKeyPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", ticketKeyPath, v5);

  realm = self->_realm;
  NSStringFromSelector(sel_realm);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", realm, v7);

  cacheName = self->_cacheName;
  NSStringFromSelector(sel_cacheName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", cacheName, v9);

  upn = self->_upn;
  NSStringFromSelector("upn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", upn, v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_importSuccessful);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_importSuccessful);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_exchangeRequired);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_exchangeRequired);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_failedToConnect);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_failedToConnect);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);

  return v3;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[POKerberosStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 11, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__POKerberosStatus_dataRepresentation__block_invoke;
    v9[3] = &unk_2514FF9D0;
    v10 = v5;
    v6 = __38__POKerberosStatus_dataRepresentation__block_invoke((uint64_t)v9);

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

id __38__POKerberosStatus_dataRepresentation__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing kerberos status"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (POKerberosStatus)initWithDictionary:(id)a3
{
  id v4;
  POKerberosStatus *v5;
  void *v6;
  uint64_t v7;
  NSString *ticketKeyPath;
  void *v9;
  uint64_t v10;
  NSString *realm;
  void *v12;
  uint64_t v13;
  NSString *cacheName;
  void *v15;
  uint64_t v16;
  NSString *upn;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = -[POKerberosStatus init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_ticketKeyPath);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    ticketKeyPath = v5->_ticketKeyPath;
    v5->_ticketKeyPath = (NSString *)v7;

    NSStringFromSelector(sel_realm);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    realm = v5->_realm;
    v5->_realm = (NSString *)v10;

    NSStringFromSelector(sel_cacheName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    cacheName = v5->_cacheName;
    v5->_cacheName = (NSString *)v13;

    NSStringFromSelector("upn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    upn = v5->_upn;
    v5->_upn = (NSString *)v16;

    NSStringFromSelector(sel_importSuccessful);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_importSuccessful = objc_msgSend(v19, "BOOLValue");

    NSStringFromSelector(sel_exchangeRequired);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_exchangeRequired = objc_msgSend(v21, "BOOLValue");

    NSStringFromSelector(sel_failedToConnect);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_failedToConnect = objc_msgSend(v23, "BOOLValue");

  }
  return v5;
}

- (POKerberosStatus)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  POKerberosStatus *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __33__POKerberosStatus_initWithData___block_invoke;
    v10[3] = &unk_2514FF9D0;
    v11 = v5;
    v7 = __33__POKerberosStatus_initWithData___block_invoke((uint64_t)v10);

    v8 = 0;
  }
  else
  {
    self = -[POKerberosStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v8 = self;
  }

  return v8;
}

id __33__POKerberosStatus_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing kerberos status"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POKerberosStatus dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POKerberosStatus)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POKerberosStatus *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POKerberosStatus initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POKerberosStatus dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSString)ticketKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTicketKeyPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRealm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)cacheName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCacheName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)upn
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)importSuccessful
{
  return self->_importSuccessful;
}

- (void)setImportSuccessful:(BOOL)a3
{
  self->_importSuccessful = a3;
}

- (BOOL)exchangeRequired
{
  return self->_exchangeRequired;
}

- (void)setExchangeRequired:(BOOL)a3
{
  self->_exchangeRequired = a3;
}

- (BOOL)failedToConnect
{
  return self->_failedToConnect;
}

- (void)setFailedToConnect:(BOOL)a3
{
  self->_failedToConnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upn, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_ticketKeyPath, 0);
}

@end
