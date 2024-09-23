@implementation ICAuthorizeMachineURLRequest

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSString *keybagPath;
  int ContextIdentifierForFolderPath;
  NSString *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  NSString *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSData *tokenData;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSString *v41;
  objc_super v42;
  id v43;
  NSString *v44;
  id v45;
  id v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  ICAuthorizeMachineURLRequest *v51;
  __int16 v52;
  NSString *v53;
  __int16 v54;
  NSString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v9, "DSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if (!v12)
  {
    v48 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to build URL Request [no DSID in builder properties] - builderProperties=%@"), v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v35);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_30:
    v33 = 0;
    goto LABEL_31;
  }
  v13 = -[NSString isEqualToString:](self->_reason, "isEqualToString:", CFSTR("refetch"));
  v47 = 0;
  keybagPath = self->_keybagPath;
  v46 = 0;
  ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(keybagPath, &v47, &v46);
  v16 = (NSString *)v46;
  if (!ContextIdentifierForFolderPath)
  {
    v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v51 = self;
      v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_1A03E3000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting context ID failed with error: %{public}@", buf, 0x16u);
    }

    goto LABEL_26;
  }
  if (v13)
    v17 = 8;
  else
    v17 = 1;
  v44 = v16;
  v45 = 0;
  v18 = ICFairPlayCopyKeyBagSyncDataWithContextID(v47, v12, v17, &v45, &v44);
  v19 = v45;
  v41 = v44;

  if (!v18)
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_keybagPath;
      *(_DWORD *)buf = 138543874;
      v51 = self;
      v52 = 2114;
      v53 = v21;
      v54 = 2114;
      v55 = v41;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Copying keybag sync data for path %{public}@ failed with error: %{public}@", buf, 0x20u);
    }

  }
  if (!v19)
  {
    v16 = v41;
LABEL_26:
    v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = self;
      _os_log_impl(&dword_1A03E3000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Missing kbsync data, failing request.", buf, 0xCu);
    }

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7502, 0);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_30;
  }
  v40 = v8;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = v19;
  v24 = v22;
  v39 = v23;
  objc_msgSend(v22, "setObject:forKey:");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("ownerDsid"));

  tokenData = self->_tokenData;
  if (tokenData)
    objc_msgSend(v24, "setObject:forKey:", tokenData, CFSTR("token"));
  -[ICURLRequest requestContext](self, "requestContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "deviceInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "deviceGUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
  {
    objc_msgSend(v29, "uppercaseString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v30, CFSTR("guid"));

  }
  objc_msgSend(v28, "deviceName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v24, "setObject:forKey:", v31, CFSTR("machineName"));
  if (-[NSString length](self->_reason, "length"))
    objc_msgSend(v24, "setObject:forKey:", self->_reason, CFSTR("reason"));
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v24, 100, 0, &v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSString *)v43;

  if (v32)
  {
    v33 = (void *)objc_msgSend(v40, "mutableCopy");
    objc_msgSend(v33, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v33, "setHTTPBody:", v32);
    objc_msgSend(v33, "setValue:forHTTPHeaderField:", CFSTR("application/x-apple-plist"), CFSTR("Content-Type"));
  }
  else
  {
    v38 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v51 = self;
      v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_1A03E3000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to serialize request with error: %{public}@", buf, 0x16u);
    }

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v33 = 0;
  }

  if (v33)
  {
    v8 = v40;
    if (!v16)
    {
      v42.receiver = self;
      v42.super_class = (Class)ICAuthorizeMachineURLRequest;
      -[ICStoreURLRequest buildStoreURLRequestWithURLRequest:builderProperties:completionHandler:](&v42, sel_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler_, v33, v9, v10);
      goto LABEL_32;
    }
  }
  else
  {
    v8 = v40;
  }
LABEL_31:
  v10[2](v10, 0, v16);

LABEL_32:
}

- (NSString)keybagPath
{
  return self->_keybagPath;
}

- (void)setKeybagPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_keybagPath, 0);
}

@end
