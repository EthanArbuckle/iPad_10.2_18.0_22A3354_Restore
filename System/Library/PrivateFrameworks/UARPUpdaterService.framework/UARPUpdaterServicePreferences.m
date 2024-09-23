@implementation UARPUpdaterServicePreferences

- (UARPUpdaterServicePreferences)initWithDomain:(id)a3
{
  id v4;
  UARPUpdaterServicePreferences *v5;
  uint64_t v6;
  NSString *domain;
  UARPUpdaterServicePreferences *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UARPUpdaterServicePreferences;
  v5 = -[UARPUpdaterServicePreferences init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)uuidForAccessory:(id)a3 serialNumber:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  NSString *domain;
  NSObject *v18;
  const char *v19;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", self->_domain);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, a5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (NSString *)v14;
        v16 = v13;
      }
      else
      {
        objc_msgSend(v10, "removeObjectForKey:", v8);
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setObject:forKey:", v16, v11);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v22 = v15;
          v23 = 2112;
          v24 = v8;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Updated corrupt UUID <%@> for identifier <%@> and serial number <%@>", buf, 0x20u);
        }
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)buf = 138412802;
      v22 = v15;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v18 = MEMORY[0x24BDACB70];
      v19 = "Existing UUID <%@> for identifier <%@> and serial number <%@>";
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v16, v11);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412802;
      v22 = v15;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v18 = MEMORY[0x24BDACB70];
      v19 = "Created new UUID <%@> for identifier <%@> and serial number <%@>";
    }
    _os_log_impl(&dword_22CC00000, v18, OS_LOG_TYPE_INFO, v19, buf, 0x20u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    domain = self->_domain;
    *(_DWORD *)buf = 138412290;
    v22 = domain;
    _os_log_impl(&dword_22CC00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Could not query prefs at %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
