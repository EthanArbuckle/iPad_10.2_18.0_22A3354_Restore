@implementation ICQUsageQuotaRequest

- (ICQUsageQuotaRequest)initWithAccount:(id)a3 accountStore:(id)a4 URLString:(id)a5
{
  id v8;
  id v9;
  ICQUsageQuotaRequest *v10;
  ICQUsageQuotaRequest *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQUsageQuotaRequest;
  v10 = -[AARequest initWithURLString:](&v13, sel_initWithURLString_, a5);
  v11 = v10;
  if (v10)
  {
    -[ICQUsageQuotaRequest setAccount:](v10, "setAccount:", v8);
    -[ICQUsageQuotaRequest setAccountStore:](v11, "setAccountStore:", v9);
  }

  return v11;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQUsageQuotaRequest;
  -[AARequest urlRequest](&v8, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_class();
  -[ICQUsageQuotaRequest account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addHeadersToRequest:forAccount:", v4, v6);

  return v4;
}

+ (void)addHeadersToRequest:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("https"));

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "aa_personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aa_authToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Basic %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v17, CFSTR("Authorization"));

  }
  objc_msgSend(v5, "aa_addMultiUserDeviceHeaderIfEnabled");
  objc_msgSend(v5, "ak_addAnisetteHeaders");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "infoDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CFBundleName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "osName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04958], "currentInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "osVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@/%@ %@/%@"), v21, v22, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addValue:forHTTPHeaderField:", v27, CFSTR("User-agent"));
  v33 = 0;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66C40]), "initWithAccount:delegate:eventQueue:error:", v6, 0, 0, &v33);
  v29 = v33;
  if (v29)
  {
    _ICQGetLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:].cold.1((uint64_t)v29, v30);
  }
  else
  {
    objc_msgSend(v28, "backupDeviceUUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v31, CFSTR("X-Client-Backup-UUID"));

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v30 = objc_claimAutoreleasedReturnValue();
    -[NSObject sf_udidString](v30, "sf_udidString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v32, CFSTR("X-Client-UDID"));

  }
}

+ (void)addHeadersForPrimaryAccountToRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDB4398];
  v5 = a3;
  objc_msgSend(v4, "defaultStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addHeadersToRequest:forAccount:", v5, v6);

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)addHeadersToRequest:(uint64_t)a1 forAccount:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[ICQUsageQuotaRequest addHeadersToRequest:forAccount:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end
