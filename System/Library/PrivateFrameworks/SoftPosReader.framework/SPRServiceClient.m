@implementation SPRServiceClient

+ (SPRServiceClient)shared
{
  if (qword_254DEDF40 != -1)
    dispatch_once(&qword_254DEDF40, &unk_24D3CCAB8);
  return (SPRServiceClient *)(id)qword_254DEDF48;
}

- (NSDate)buildDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_215976DC0;
  v17 = sub_215976DD0;
  v18 = 0;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)&unk_24D3CD4C0, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_215976E30;
  v12[3] = &unk_24D3CD4E8;
  v12[4] = &v13;
  objc_msgSend_copyBuildDateWithReply_(v5, v6, (uint64_t)v12, v7, v8, v9);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSDate *)v10;
}

- (id)proxyDescription
{
  return CFSTR("XPC service");
}

- (SPRPrimer)sharedPrimer
{
  int64_t *p_primerPredicate;
  _QWORD block[5];

  p_primerPredicate = &self->_primerPredicate;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215976ED4;
  block[3] = &unk_24D3CD148;
  block[4] = self;
  if (*p_primerPredicate != -1)
    dispatch_once(p_primerPredicate, block);
  return self->_sharedPrimer;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_connection(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v7, v8, v9, v10, v11, v12);

  objc_msgSend_onDisconnect(self, v13, v14, v15, v16, v17);
}

- (BOOL)abortAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  int *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD v38[2];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_connection(self, a2, (uint64_t)a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_processIdentifier(v8, v9, v10, v11, v12, v13);

  objc_msgSend_xpcClient(SPRLogger, v15, v16, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v38[0] = 67109120;
    v38[1] = v14;
    _os_log_impl(&dword_215968000, v20, OS_LOG_TYPE_INFO, "Terminating daemon (PID=%d) with SIGABRT...", (uint8_t *)v38, 8u);
  }

  v26 = terminate_with_reason();
  if (v26)
  {
    if (a3)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD1128];
      v29 = __error();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, v28, *v29, 0, v31);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_onDisconnect(self, v21, v22, v23, v24, v25);
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x24BDD17F0], v32, v33, v34, v35, v36, 0.5);
  }
  return v26 == 0;
}

- (BOOL)jetsamAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  int *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD v38[2];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_connection(self, a2, (uint64_t)a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_processIdentifier(v8, v9, v10, v11, v12, v13);

  objc_msgSend_xpcClient(SPRLogger, v15, v16, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v38[0] = 67109120;
    v38[1] = v14;
    _os_log_impl(&dword_215968000, v20, OS_LOG_TYPE_INFO, "Terminating daemon (PID=%d) with Jetsam...", (uint8_t *)v38, 8u);
  }

  v26 = terminate_with_reason();
  if (v26)
  {
    if (a3)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD1128];
      v29 = __error();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, v28, *v29, 0, v31);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend_onDisconnect(self, v21, v22, v23, v24, v25);
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x24BDD17F0], v32, v33, v34, v35, v36, 0.5);
  }
  return v26 == 0;
}

- (void)onDisconnect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_invalidate(self->_sharedPrimer, a2, v2, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPrimer, 0);
}

@end
