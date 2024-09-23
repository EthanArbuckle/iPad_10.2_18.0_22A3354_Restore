@implementation SPRPrimer

+ (SPRPrimer)shared
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_shared(SPRServiceClient, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedPrimer(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPRPrimer *)v12;
}

- (NSDictionary)configuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_21597358C;
  v19 = sub_21597359C;
  v5 = MEMORY[0x24BDAC760];
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2159735A4;
  v14[3] = &unk_24D3CCD60;
  v14[4] = self;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v14, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = sub_21597360C;
  v13[3] = &unk_24D3CD0D0;
  v13[4] = &v15;
  objc_msgSend_copyConfigurationWithReply_(v6, v7, (uint64_t)v13, v8, v9, v10);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSDictionary *)v11;
}

- (SPRProvider)getProvider
{
  int64_t *p_providerPredicate;
  _QWORD block[5];

  p_providerPredicate = &self->_providerPredicate;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2159736A4;
  block[3] = &unk_24D3CD148;
  block[4] = self;
  if (*p_providerPredicate != -1)
    dispatch_once(p_providerPredicate, block);
  return self->_provider;
}

- (NSURL)attestationBackendURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("Server.MPOC.Monitoring.Url"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

- (NSURL)configuratorBackendURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("Server.Configurator.Url"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

- (NSURL)monitoringBackendURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("Server.MPOC.Monitoring.Url"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

- (NSURL)storageURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_configuration(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("Storage.Location.Path"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v11;
}

- (SPRPrimer)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SPRPrimer *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_21597358C;
  v24[4] = sub_21597359C;
  v25 = (id)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10, v11);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_215973A9C;
  v23[3] = &unk_24D3CD198;
  v23[4] = v24;
  v16 = (id)objc_msgSend_initWithConnector_(self, v12, (uint64_t)v23, v13, v14, v15);
  objc_msgSend_connectAndReturnError_(v16, v17, (uint64_t)a4, v18, v19, v20);
  v21 = (SPRPrimer *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v24, 8);
  return v21;
}

+ (SPRPrimer)primerWithConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  SPRPrimer *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = [SPRPrimer alloc];
  v10 = (void *)objc_msgSend_initWithConfiguration_error_(v6, v7, (uint64_t)v5, (uint64_t)a4, v8, v9);

  return (SPRPrimer *)v10;
}

- (id)attestationManagerAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)monitorManagerAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)persistenceFactoryAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)secureChannelAndReturnError:(id *)a3
{
  SPRSecureChannel *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];

  v5 = [SPRSecureChannel alloc];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_215973FE0;
  v19[3] = &unk_24D3CD1E8;
  v19[4] = self;
  v10 = (void *)objc_msgSend_initWithConnector_(v5, v6, (uint64_t)v19, v7, v8, v9);
  v15 = v10;
  if (a3)
  {
    objc_msgSend_connectAndReturnError_(v10, v11, (uint64_t)a3, v12, v13, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v10;
  }
  v17 = v16;

  return v17;
}

- (void)onDisconnect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_invalidate(self->_provider, a2, v2, v3, v4, v5);
}

- (id)secureChannelWithName:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;

  return (id)objc_msgSend_secureChannelAndReturnError_(self, a2, (uint64_t)a4, (uint64_t)a4, v4, v5);
}

- (BOOL)isProduction
{
  return self->_isProduction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
