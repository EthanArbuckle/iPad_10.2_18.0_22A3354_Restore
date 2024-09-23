@implementation APProxySessionConfigurationProvider

- (APProxySessionConfigurationProvider)initWithDefaultProxyURL:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  APProxySessionConfigurationProvider *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  APUnfairLock *lock;
  NSArray *protocolClasses;

  v5 = a3;
  v10 = (APProxySessionConfigurationProvider *)objc_msgSend_init(self, v6, v7, v8, v9);
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v15 = objc_msgSend_initWithOptions_(v11, v12, 1, v13, v14);
    lock = v10->_lock;
    v10->_lock = (APUnfairLock *)v15;

    objc_storeStrong((id *)&v10->_defaultProxyURL, a3);
    protocolClasses = v10->_protocolClasses;
    v10->_protocolClasses = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v10;
}

- (void)setProxyURL:(id)a3
{
  NSURL *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSURL *proxyURL;
  NSURL *v14;
  NSURLSessionConfiguration *connectProxyConfig;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = (NSURL *)a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v20, v9, v10, v11, v12);
  proxyURL = self->_proxyURL;
  self->_proxyURL = v4;
  v14 = v4;

  connectProxyConfig = self->_connectProxyConfig;
  self->_connectProxyConfig = 0;

  objc_msgSend_unlock(v20, v16, v17, v18, v19);
}

- (void)addProtocolClasses:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSURLSessionConfiguration *connectProxyConfig;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v30, v9, v10, v11, v12);
  objc_msgSend_protocolClasses(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v17, v18, (uint64_t)v4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setProtocolClasses_(self, v22, (uint64_t)v21, v23, v24);
  connectProxyConfig = self->_connectProxyConfig;
  self->_connectProxyConfig = 0;

  objc_msgSend_unlock(v30, v26, v27, v28, v29);
}

- (void)setProtocolClasses:(id)a3
{
  objc_storeStrong((id *)&self->_protocolClasses, a3);
}

- (NSArray)protocolClasses
{
  return self->_protocolClasses;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (id)connectProxyConfig
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSURLSessionConfiguration *v15;
  NSURLSessionConfiguration *connectProxyConfig;
  NSURLSessionConfiguration *v17;

  objc_msgSend_lock(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);
  if (!self->_connectProxyConfig)
  {
    objc_msgSend__createConnectProxyConfig(self, v11, v12, v13, v14);
    v15 = (NSURLSessionConfiguration *)objc_claimAutoreleasedReturnValue();
    connectProxyConfig = self->_connectProxyConfig;
    self->_connectProxyConfig = v15;

  }
  objc_msgSend_unlock(v6, v11, v12, v13, v14);
  v17 = self->_connectProxyConfig;

  return v17;
}

- (id)_createConnectProxyConfig
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isEqualToString;
  const char *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v77[4];
  _QWORD v78[5];

  v78[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_proxyURL(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_port(v6, v12, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || !v11)
  {
    objc_msgSend_defaultProxyURL(self, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_host(v21, v22, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_port(v21, v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v26;
    v20 = (void *)v31;
    v6 = v21;
  }
  objc_msgSend_scheme(v6, v16, v17, v18, v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v32, v33, (uint64_t)CFSTR("http"), v34, v35);

  v77[0] = CFSTR("HTTPEnable");
  v77[1] = CFSTR("HTTPSEnable");
  v78[0] = &unk_24F4E3DC0;
  v78[1] = &unk_24F4E3DC0;
  v38 = &unk_24F4E3DD8;
  v39 = *MEMORY[0x24BDB7748];
  v77[2] = *MEMORY[0x24BDB7738];
  v77[3] = v39;
  v40 = &unk_24F4E3DF0;
  if (v20)
  {
    v38 = v20;
    v40 = v20;
  }
  v78[2] = v38;
  v78[3] = v40;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)v78, (uint64_t)v77, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v41;
  if (v11)
  {
    v47 = (void *)objc_msgSend_mutableCopy(v41, v42, v43, v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v47, v48, (uint64_t)v11, *MEMORY[0x24BDB7730], v49);
    objc_msgSend_setObject_forKeyedSubscript_(v47, v50, (uint64_t)v11, *MEMORY[0x24BDB7740], v51);
    v56 = objc_msgSend_copy(v47, v52, v53, v54, v55);

    v46 = (void *)v56;
  }
  v57 = isEqualToString ^ 1u;
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDB74B8], v42, v43, v44, v45);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConnectionProxyDictionary_(v58, v59, (uint64_t)v46, v60, v61);
  objc_msgSend_protocolClasses(self, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtocolClasses_(v58, v67, (uint64_t)v66, v68, v69);

  objc_msgSend_set_preventsSystemHTTPProxyAuthentication_(v58, v70, 1, v71, v72);
  objc_msgSend_set_requiresSecureHTTPSProxyConnection_(v58, v73, v57, v74, v75);

  return v58;
}

- (NSURL)proxyURL
{
  return self->_proxyURL;
}

- (NSURL)defaultProxyURL
{
  return self->_defaultProxyURL;
}

- (void)setDefaultProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultProxyURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_defaultProxyURL, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_protocolClasses, 0);
  objc_storeStrong((id *)&self->_connectProxyConfig, 0);
}

@end
