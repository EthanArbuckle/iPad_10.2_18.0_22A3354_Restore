@implementation NetworkQualityRemoteConfiguration

- (NetworkQualityRemoteConfiguration)initWithData:(id)a3 andConfig:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NetworkQualityRemoteConfiguration *v9;
  id v11;

  v6 = a4;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
  {
    self = -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:](self, "initWithDictionary:andConfig:", v7, v6);
    v9 = self;
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[NetworkQualityRemoteConfiguration initWithData:andConfig:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (NetworkQualityRemoteConfiguration)initWithDictionary:(id)a3 andConfig:(id)a4
{
  NetworkQualityRemoteConfiguration *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSString *v22;
  NSObject *v23;
  NetworkQualityRemoteConfiguration *v24;
  NSString *v25;
  NetworkQualityRemoteConfiguration *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *port;
  uint64_t v33;
  NSString *v34;
  void *v35;
  int v36;
  NetworkQualityRemoteConfiguration *v37;
  const __CFString *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  NSString *v43;
  id obj;
  id v46;
  void *v47;
  NSString *v48;
  NetworkQualityRemoteConfiguration *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  NSString *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v48 = (NSString *)a3;
  v46 = a4;
  v59.receiver = self;
  v59.super_class = (Class)NetworkQualityRemoteConfiguration;
  v49 = -[NetworkQualityRemoteConfiguration init](&v59, sel_init);
  v6 = v49;
  if (!v49)
    goto LABEL_58;
  netqual_log_init();
  v7 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    v64 = 1024;
    v65 = 50;
    v66 = 2112;
    v67 = v48;
    _os_log_impl(&dword_20E622000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Got configuration: %@", buf, 0x1Cu);
  }
  -[NSString objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("version"), a4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_33:
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:].cold.1();
    goto LABEL_41;
  }
  if (!v47)
    goto LABEL_33;
  -[NSString objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("urls"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }
  if (!objc_msgSend(v8, "count"))
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:].cold.2();

LABEL_41:
    v26 = 0;
    goto LABEL_59;
  }
  v50 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v9 = objc_msgSend(&unk_24C97CD40, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (!v9)
    goto LABEL_20;
  v10 = *(_QWORD *)v56;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v56 != v10)
        objc_enumerationMutation(&unk_24C97CD40);
      v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v8, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v13)
          continue;
        objc_msgSend(&unk_24C97CD40, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setObject:forKeyedSubscript:", v15, v14);

      }
    }
    v9 = objc_msgSend(&unk_24C97CD40, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  }
  while (v9);
LABEL_20:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = objc_msgSend(&unk_24C97CD68, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v52;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(&unk_24C97CD68);
        objc_msgSend(v50, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
        {
          netqual_log_init();
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
            -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:].cold.4();

          goto LABEL_41;
        }
      }
      v16 = objc_msgSend(&unk_24C97CD68, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v16)
        continue;
      break;
    }
  }
  objc_storeStrong((id *)&v49->_urls, v50);
  -[NSString objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("test_endpoint"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_43:
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEBUG))
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:].cold.3();
    v27 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v46, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLWithString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "port");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (v31)
    {
      objc_msgSend(v29, "scheme");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("https"));

      if (v36)
      {
        v37 = v49;
        port = v49->_port;
        v38 = CFSTR("443");
      }
      else
      {
        objc_msgSend(v29, "scheme");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("http"));

        if (!v40)
        {
LABEL_53:

          v21 = 0;
          goto LABEL_54;
        }
        v37 = v49;
        port = v49->_port;
        v38 = CFSTR("80");
      }
      v37->_port = &v38->isa;
    }
    else
    {
      objc_msgSend(v29, "port");
      port = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(port, "stringValue");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v49->_port;
      v49->_port = (NSString *)v33;

    }
    goto LABEL_53;
  }
  if (!v21)
    goto LABEL_43;
  v22 = v49->_port;
  v49->_port = (NSString *)CFSTR("443");

  netqual_log_init();
  v23 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v24 = v49;
    v25 = v49->_port;
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    v64 = 1024;
    v65 = 103;
    v66 = 2112;
    v67 = v25;
    _os_log_impl(&dword_20E622000, v23, OS_LOG_TYPE_INFO, "%s:%u - Assuming port %@", buf, 0x1Cu);
    goto LABEL_55;
  }
LABEL_54:
  v24 = v49;
LABEL_55:
  -[NetworkQualityRemoteConfiguration setTestEndpoint:](v24, "setTestEndpoint:", v21);
  netqual_log_init();
  v41 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v42 = v41;
    -[NetworkQualityRemoteConfiguration testEndpoint](v49, "testEndpoint");
    v43 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    v64 = 1024;
    v65 = 107;
    v66 = 2112;
    v67 = v43;
    _os_log_impl(&dword_20E622000, v42, OS_LOG_TYPE_INFO, "%s:%u - test endpoint: %@", buf, 0x1Cu);

  }
  objc_storeStrong((id *)&v49->_config, obj);

  v6 = v49;
LABEL_58:
  v26 = v6;
LABEL_59:

  return v26;
}

- (id)URLForURLType:(int)a3
{
  NSDictionary *urls;
  void *v4;
  void *v5;

  urls = self->_urls;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](urls, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)portForURLType:(int)a3
{
  if (a3 > 2)
    return CFSTR("0");
  else
    return self->_port;
}

- (id)testEndpoint:(int)a3
{
  uint64_t v3;
  nw_endpoint_t host;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;

  v3 = *(_QWORD *)&a3;
  if (-[NetworkQualityConfiguration edgeRelay](self->_config, "edgeRelay")
    || -[NetworkQualityConfiguration edgeRelayRemote](self->_config, "edgeRelayRemote"))
  {
    goto LABEL_3;
  }
  -[NetworkQualityConfiguration hostOverride](self->_config, "hostOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NetworkQualityConfiguration hostOverride](self->_config, "hostOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = objc_retainAutorelease(v7);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    -[NetworkQualityRemoteConfiguration portForURLType:](self, "portForURLType:", v3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    host = nw_endpoint_create_host(v10, (const char *)objc_msgSend(v11, "UTF8String"));

    return host;
  }
  -[NetworkQualityRemoteConfiguration testEndpoint](self, "testEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NetworkQualityRemoteConfiguration testEndpoint](self, "testEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_3:
  host = 0;
  return host;
}

- (NSString)testEndpoint
{
  return self->_testEndpoint;
}

- (void)setTestEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

- (void)initWithData:andConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Could not deserialize data: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDictionary:andConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - server response without version spec", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDictionary:andConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_20E622000, v0, v1, "%s:%u - No urls in data", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDictionary:andConfig:.cold.3()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  *(_DWORD *)((char *)&v1[3] + 2) = 90;
  _os_log_debug_impl(&dword_20E622000, v0, OS_LOG_TYPE_DEBUG, "%s:%u - server response without test_endpoint spec", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDictionary:andConfig:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Missing required configuration %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDictionary:andConfig:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20E622000, v0, v1, "%s:%u - Caught an exception %@ while parsing JSON response", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

@end
