@implementation ICRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_networkConstraints, 0);
}

- (ICClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (ICRequestContext)initWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  ICRequestContext *v5;
  ICRequestContext *v6;
  uint64_t v7;
  ICURLResponseAuthenticationProvider *authenticationProvider;
  uint64_t v9;
  ICClientInfo *clientInfo;
  uint64_t v11;
  ICDeviceInfo *deviceInfo;
  objc_super v14;

  v4 = (void (**)(id, _QWORD))a3;
  v14.receiver = self;
  v14.super_class = (Class)ICRequestContext;
  v5 = -[ICRequestContext init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 8) |= 1u;
    +[ICURLResponseAuthenticationProvider defaultProvider](ICURLResponseAuthenticationProvider, "defaultProvider");
    v7 = objc_claimAutoreleasedReturnValue();
    authenticationProvider = v6->_authenticationProvider;
    v6->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v7;

    +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
    v9 = objc_claimAutoreleasedReturnValue();
    clientInfo = v6->_clientInfo;
    v6->_clientInfo = (ICClientInfo *)v9;

    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v11 = objc_claimAutoreleasedReturnValue();
    deviceInfo = v6->_deviceInfo;
    v6->_deviceInfo = (ICDeviceInfo *)v11;

    ((void (**)(id, ICRequestContext *))v4)[2](v4, v6);
    *((_BYTE *)v6 + 8) &= ~1u;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientInfo, CFSTR("clientInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkConstraints, CFSTR("networkConstraints"));
  if (self->_authenticationProvider)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_ICURLResponseAuthenticationProviderIsAllowedForClassName(v6) & 1) != 0)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authenticationProviderClassName"));
      objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationProvider, CFSTR("authenticationProvider"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, CFSTR("Attempted to encode an instance of ICRequestContext with an unallowed class name for authenticationProvider: %@."), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "msv_description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

      }
      objc_msgSend(v4, "failWithError:", v7);

    }
  }

}

- (ICRequestContext)initWithCoder:(id)a3
{
  id v4;
  ICRequestContext *v5;
  void *v6;
  uint64_t v7;
  ICClientInfo *clientInfo;
  uint64_t v9;
  ICDeviceInfo *deviceInfo;
  void *v11;
  uint64_t v12;
  ICNetworkConstraints *networkConstraints;
  NSString *v14;
  Class v15;
  uint64_t v16;
  ICURLResponseAuthenticationProvider *authenticationProvider;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICRequestContext;
  v5 = -[ICRequestContext init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v7;

    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v9 = objc_claimAutoreleasedReturnValue();
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (ICDeviceInfo *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkConstraints"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    networkConstraints = v5->_networkConstraints;
    v5->_networkConstraints = (ICNetworkConstraints *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationProviderClassName"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (_ICURLResponseAuthenticationProviderIsAllowedForClassName(v14))
    {
      v15 = NSClassFromString(v14);
      if (v15)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("authenticationProvider"));
        v16 = objc_claimAutoreleasedReturnValue();
        authenticationProvider = v5->_authenticationProvider;
        v5->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v16;

        goto LABEL_11;
      }
      v18 = CFSTR("Failed to look up class of authentication provider with name: %@.");
    }
    else
    {
      v18 = CFSTR("Attempted to decode an instance of ICRequestContext with an unallowed class name for authenticationProvider: %@.");
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, v18, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "msv_description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

      }
      objc_msgSend(v4, "failWithError:", v20);

      v5 = 0;
      goto LABEL_13;
    }
LABEL_11:
    if (v5->_authenticationProvider)
    {
LABEL_14:

      goto LABEL_15;
    }
    +[ICURLResponseAuthenticationProvider defaultProvider](ICURLResponseAuthenticationProvider, "defaultProvider");
    v23 = objc_claimAutoreleasedReturnValue();
    v20 = v5->_authenticationProvider;
    v5->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v23;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

void __34__ICRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 3, *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = a2;
  objc_storeStrong(v4 + 4, *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong(v4 + 5, *(id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeStrong(v4 + 2, *(id *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setClientInfo:(id)a3
{
  ICClientInfo *v5;
  ICClientInfo *clientInfo;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICRequestContext.m"), 182, CFSTR("Mutation not allowed beyond initialization."));

  }
  v5 = (ICClientInfo *)objc_msgSend(v8, "copy");
  clientInfo = self->_clientInfo;
  self->_clientInfo = v5;

}

- (void)setAuthenticationProvider:(id)a3
{
  ICURLResponseAuthenticationProvider *v5;
  ICURLResponseAuthenticationProvider *authenticationProvider;
  void *v7;

  v5 = (ICURLResponseAuthenticationProvider *)a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICRequestContext.m"), 177, CFSTR("Mutation not allowed beyond initialization."));

  }
  authenticationProvider = self->_authenticationProvider;
  self->_authenticationProvider = v5;

}

- (BOOL)_allowsMutation
{
  return *((_BYTE *)self + 8) & 1;
}

- (void)setNetworkConstraints:(id)a3
{
  ICNetworkConstraints *v5;
  ICNetworkConstraints *networkConstraints;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICRequestContext.m"), 192, CFSTR("Mutation not allowed beyond initialization."));

  }
  v5 = (ICNetworkConstraints *)objc_msgSend(v8, "copy");
  networkConstraints = self->_networkConstraints;
  self->_networkConstraints = v5;

}

- (void)setDeviceInfo:(id)a3
{
  ICDeviceInfo *v5;
  ICDeviceInfo *deviceInfo;
  void *v7;

  v5 = (ICDeviceInfo *)a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICRequestContext.m"), 187, CFSTR("Mutation not allowed beyond initialization."));

  }
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v5;

}

- (ICDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (id)_userAgentWithPlatformVersion
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  -[ICRequestContext _genericUserAgent](self, "_genericUserAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICDeviceInfo productPlatform](self->_deviceInfo, "productPlatform");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceInfo productVersion](self->_deviceInfo, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMac");

  if (v8)
  {
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" (Macintosh; OS X %@)"), v6);
    -[ICRequestContext _webkitUserAgentVersion](self, "_webkitUserAgentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" AppleWebKit/%@"), v9);
LABEL_14:

    goto LABEL_15;
  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAppleTV");

  if (v11)
  {

    v5 = CFSTR("iOS");
  }
  if (-[__CFString length](v5, "length") && objc_msgSend(v6, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@/%@"), v5, v6);
  if (-[ICDeviceInfo isAppleTV](self->_deviceInfo, "isAppleTV"))
  {
    -[ICDeviceInfo productVersion](self->_deviceInfo, "productVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" AppleTV/%@"), v9);
    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

- (id)_genericUserAgent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ICClientInfo _clientIdentifierForUserAgent](self->_clientInfo, "_clientIdentifierForUserAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICClientInfo clientVersion](self->_clientInfo, "clientVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/%@"), v4, v5);

  return v6;
}

- (ICURLResponseAuthenticationProvider)authenticationProvider
{
  return self->_authenticationProvider;
}

- (ICNetworkConstraints)networkConstraints
{
  return self->_networkConstraints;
}

- (id)copyWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__ICRequestContext_copyWithBlock___block_invoke;
  v9[3] = &unk_1E438C9E8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v9);

  return v7;
}

- (ICRequestContext)initWithClientInfo:(id)a3
{
  id v4;
  void *v5;
  ICRequestContext *v6;

  v4 = a3;
  +[ICURLResponseAuthenticationProvider defaultProvider](ICURLResponseAuthenticationProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICRequestContext initWithClientInfo:authenticationProvider:](self, "initWithClientInfo:authenticationProvider:", v4, v5);

  return v6;
}

- (ICRequestContext)initWithClientInfo:(id)a3 authenticationProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  ICRequestContext *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__ICRequestContext_initWithClientInfo_authenticationProvider___block_invoke;
  v12[3] = &unk_1E438C9C0;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[ICRequestContext initWithBlock:](self, "initWithBlock:", v12);

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICClientInfo clientIdentifier](self->_clientInfo, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICClientInfo clientVersion](self->_clientInfo, "clientVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@/%@]>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ICClientInfo *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ICDeviceInfo *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  ICURLResponseAuthenticationProvider *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  ICNetworkConstraints *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v88 = __ROR8__(v14 + v13, 32);
  v93 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v83 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_clientInfo;
  v19 = -[ICClientInfo hash](v18, "hash");
  v20 = (v17 + v83) ^ __ROR8__(v83, 51);
  v21 = v88 + (v93 ^ v19);
  v22 = __ROR8__(v93 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v83, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v89 = __ROR8__(v25, 32);
  v94 = v24;
  v79 = v23 ^ v19;
  v84 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_deviceInfo;
  v27 = -[ICDeviceInfo hash](v26, "hash");
  v28 = (v79 + v84) ^ __ROR8__(v84, 51);
  v29 = v89 + (v94 ^ v27);
  v30 = __ROR8__(v94 ^ v27, 48);
  v31 = (v29 ^ v30) + __ROR8__(v79 + v84, 32);
  v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  v33 = v29 + v28;
  v90 = __ROR8__(v33, 32);
  v95 = v32;
  v80 = v31 ^ v27;
  v85 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_authenticationProvider;
  v35 = -[ICURLResponseAuthenticationProvider hash](v34, "hash");
  v36 = (v80 + v85) ^ __ROR8__(v85, 51);
  v37 = v90 + (v95 ^ v35);
  v38 = __ROR8__(v95 ^ v35, 48);
  v39 = (v37 ^ v38) + __ROR8__(v80 + v85, 32);
  v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  v41 = v37 + v36;
  v91 = __ROR8__(v41, 32);
  v96 = v40;
  v81 = v39 ^ v35;
  v86 = v41 ^ __ROR8__(v36, 47);

  v42 = self->_networkConstraints;
  v43 = -[ICNetworkConstraints hash](v42, "hash");
  v44 = (v81 + v86) ^ __ROR8__(v86, 51);
  v45 = v91 + (v96 ^ v43);
  v46 = __ROR8__(v96 ^ v43, 48);
  v47 = (v45 ^ v46) + __ROR8__(v81 + v86, 32);
  v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  v49 = v45 + v44;
  v92 = __ROR8__(v49, 32);
  v97 = v48;
  v82 = v47 ^ v43;
  v87 = v49 ^ __ROR8__(v44, 47);

  v50 = (v82 + v87) ^ __ROR8__(v87, 51);
  v51 = v92 + (v97 ^ 0x2800000000000000);
  v52 = __ROR8__(v97 ^ 0x2800000000000000, 48);
  v53 = (v51 ^ v52) + __ROR8__(v82 + v87, 32);
  v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  v55 = v51 + v50;
  v56 = v55 ^ __ROR8__(v50, 47);
  v57 = (v53 ^ 0x2800000000000000) + v56;
  v58 = v57 ^ __ROR8__(v56, 51);
  v59 = (__ROR8__(v55, 32) ^ 0xFFLL) + v54;
  v60 = __ROR8__(v54, 48);
  v61 = __ROR8__(v57, 32) + (v59 ^ v60);
  v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  v63 = v58 + v59;
  v64 = v63 ^ __ROR8__(v58, 47);
  v65 = v64 + v61;
  v66 = v65 ^ __ROR8__(v64, 51);
  v67 = __ROR8__(v63, 32) + v62;
  v68 = __ROR8__(v62, 48);
  v69 = __ROR8__(v65, 32) + (v67 ^ v68);
  v70 = v69 ^ __ROR8__(v67 ^ v68, 43);
  v71 = v66 + v67;
  v72 = v71 ^ __ROR8__(v66, 47);
  v73 = v72 + v69;
  v74 = v73 ^ __ROR8__(v72, 51);
  v75 = __ROR8__(v71, 32) + v70;
  v76 = __ROR8__(v70, 48);
  v77 = __ROR8__(v73, 32) + (v75 ^ v76);
  return (v74 + v75) ^ __ROR8__(v74, 47) ^ v77 ^ __ROR8__(v74 + v75, 32) ^ v77 ^ __ROR8__(v75 ^ v76, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICRequestContext *v4;
  ICRequestContext *v5;
  ICClientInfo *clientInfo;
  ICClientInfo *v7;
  ICClientInfo *v8;
  ICClientInfo *v9;
  _BOOL4 v10;
  char v11;
  ICDeviceInfo *deviceInfo;
  ICDeviceInfo *v13;
  ICDeviceInfo *v14;
  ICDeviceInfo *v15;
  int v16;
  ICURLResponseAuthenticationProvider *authenticationProvider;
  ICURLResponseAuthenticationProvider *v18;
  ICURLResponseAuthenticationProvider *v19;
  ICURLResponseAuthenticationProvider *v20;
  _BOOL4 v21;
  ICNetworkConstraints *networkConstraints;
  ICNetworkConstraints *v23;
  ICNetworkConstraints *v24;
  ICNetworkConstraints *v25;

  v4 = (ICRequestContext *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICRequestContext isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      clientInfo = self->_clientInfo;
      v7 = v5->_clientInfo;
      if (clientInfo == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = clientInfo;
        v10 = -[ICClientInfo isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_15;
      }
      deviceInfo = self->_deviceInfo;
      v13 = v5->_deviceInfo;
      if (deviceInfo == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = deviceInfo;
        v16 = -[ICDeviceInfo isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_15;
      }
      authenticationProvider = self->_authenticationProvider;
      v18 = v5->_authenticationProvider;
      if (authenticationProvider == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = authenticationProvider;
        v21 = -[ICURLResponseAuthenticationProvider isEqual:](v20, "isEqual:", v19);

        if (!v21)
        {
LABEL_15:
          v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      networkConstraints = self->_networkConstraints;
      v23 = v5->_networkConstraints;
      v24 = networkConstraints;
      v25 = v24;
      if (v24 == v23)
        v11 = 1;
      else
        v11 = -[ICNetworkConstraints isEqual:](v24, "isEqual:", v23);

      goto LABEL_21;
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (NSString)userAgent
{
  if (-[ICDeviceInfo isInternalBuild](self->_deviceInfo, "isInternalBuild"))
    -[ICRequestContext _genericUserAgent](self, "_genericUserAgent");
  else
    -[ICRequestContext _userAgentWithPlatformVersion](self, "_userAgentWithPlatformVersion");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_webkitUserAgentVersion
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16750;
  v10 = __Block_byref_object_dispose__16751;
  v11 = 0;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__ICRequestContext__webkitUserAgentVersion__block_invoke;
    v5[3] = &unk_1E438CA10;
    v5[4] = &v6;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  }
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__ICRequestContext__webkitUserAgentVersion__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v20[0] = v6;
  v20[1] = CFSTR("Frameworks");
  v20[2] = CFSTR("WebKit.framework");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invertedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v13);

    if (v14 < 4 || v14 == 0x7FFFFFFFFFFFFFFFLL && (unint64_t)objc_msgSend(v11, "length") < 4)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = v11;
      v17 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v16;
    }
    else
    {
      objc_msgSend(v11, "substringFromIndex:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v17 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

  }
}

void __62__ICRequestContext_initWithClientInfo_authenticationProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setClientInfo:", v3);
  objc_msgSend(v4, "setAuthenticationProvider:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
