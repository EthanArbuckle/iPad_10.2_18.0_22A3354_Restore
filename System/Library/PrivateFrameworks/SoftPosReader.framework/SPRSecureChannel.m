@implementation SPRSecureChannel

+ (NSString)serverResponseHeader
{
  return (NSString *)CFSTR("header");
}

+ (NSString)serverResponseBody
{
  return (NSString *)CFSTR("body");
}

- (SPRSecureChannel)init
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
  SPRSecureChannel *v12;

  objc_msgSend_shared(SPRPrimer, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secureChannelAndReturnError_(v7, v8, 0, v9, v10, v11);
  v12 = (SPRSecureChannel *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)startDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)startDownloadTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)securingRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_2159769A0;
  v31 = sub_2159769B0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_2159769A0;
  v25 = sub_2159769B0;
  v7 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2159769B8;
  v20[3] = &unk_24D3CCCC0;
  v20[4] = &v27;
  objc_msgSend_syncProxyWithErrorHandler_(self, v8, (uint64_t)v20, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_2159769C8;
  v19[3] = &unk_24D3CD440;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend_securingRequest_reply_(v12, v13, (uint64_t)v6, (uint64_t)v19, v14, v15);

  if (a4)
  {
    v16 = (void *)v28[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (SPRSecureChannel)initWithName:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SPRSecureChannel *v13;

  objc_msgSend_shared(SPRPrimer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secureChannelAndReturnError_(v8, v9, (uint64_t)a4, v10, v11, v12);
  v13 = (SPRSecureChannel *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)secureChannelWithName:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_shared(SPRPrimer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secureChannelAndReturnError_(v7, v8, (uint64_t)a4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)startSessionWithRequest:(id)a3 configuration:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)startSessionWithRequest:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD1858];
  v7 = a3;
  objc_msgSend_ephemeralSessionConfiguration(v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startSessionWithRequest_configuration_error_(self, v14, (uint64_t)v7, (uint64_t)v13, (uint64_t)a4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)startSessionAsyncWithRequest:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)startSessionAsyncWithRequest:(id)a3 delegate:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  v8 = (void *)MEMORY[0x24BDD1858];
  v9 = a4;
  v10 = a3;
  objc_msgSend_ephemeralSessionConfiguration(v8, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend_startSessionAsyncWithRequest_configuration_delegate_error_(self, v17, (uint64_t)v10, (uint64_t)v16, (uint64_t)v9, (uint64_t)a5);

  return (char)a5;
}

@end
