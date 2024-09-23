@implementation ICMusicKitRequestContext

void __42__ICMusicKitRequestContext_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICDeveloperTokenDefaultProvider sharedProvider](ICDeveloperTokenDefaultProvider, "sharedProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[12];
  v3[12] = v4;

  v3[13] = 0;
  objc_msgSend(v3, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v3, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v6, "processName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = CFSTR("1");
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated MusicKit request context with a default client info.\nThis is not recommended, as you need to be explicit about the client identifier and client version your application is meant to use, per agreement with the AMP Core Services team.\nNevertheless, proceeding with clientIdentifier = \"%{public}@\" and clientVersion = \"%{public}@\".", (uint8_t *)&v15, 0x20u);
    }

    +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:](ICClientInfo, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:", v11, CFSTR("1"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClientInfo:", v14);

  }
}

- (int64_t)personalizationMethod
{
  return self->_personalizationMethod;
}

- (ICDeveloperTokenProvider)developerTokenProvider
{
  return self->_developerTokenProvider;
}

- (int64_t)_storeRequestPersonalizationStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMusicKitRequestContext;
  return -[ICStoreRequestContext personalizationStyle](&v3, sel_personalizationStyle);
}

- (id)description
{
  NSString *v3;
  void *v4;
  NSString *v5;
  NSString *cachedDescription;

  v3 = self->_cachedDescription;
  if (!v3)
  {
    -[ICMusicKitRequestContext _description](self, "_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v5;

    v3 = self->_cachedDescription;
  }
  return v3;
}

- (id)_description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t personalizationMethod;
  const __CFString *v11;
  int64_t v12;
  const __CFString *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[ICRequestContext clientInfo](self, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; client = %@/%@"), v8, v9);

  personalizationMethod = self->_personalizationMethod;
  if (personalizationMethod)
  {
    if (personalizationMethod != 1)
      goto LABEL_6;
    v11 = CFSTR("musicUserToken");
  }
  else
  {
    v11 = CFSTR("legacy");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; personalizationMethod = %@"), v11);
LABEL_6:
  v12 = -[ICMusicKitRequestContext personalizationStyle](self, "personalizationStyle");
  if (v12 == 1)
  {
    v13 = CFSTR("automatic");
  }
  else
  {
    if (v12 != 2)
      goto LABEL_11;
    v13 = CFSTR("always");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; personalizationStyle = %@"), v13);
LABEL_11:
  if ((-[ICDeveloperTokenProvider isMemberOfClass:](self->_developerTokenProvider, "isMemberOfClass:", objc_opt_class()) & 1) == 0)objc_msgSend(v6, "appendFormat:", CFSTR("; developerTokenProvider = %@"), self->_developerTokenProvider);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (int64_t)personalizationStyle
{
  int64_t result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICMusicKitRequestContext;
  result = -[ICStoreRequestContext personalizationStyle](&v3, sel_personalizationStyle);
  if (result != 2)
    return result == 1;
  return result;
}

- (ICMusicKitRequestContext)initWithBlock:(id)a3
{
  id v4;
  id v5;
  ICMusicKitRequestContext *v6;
  objc_super v8;
  _QWORD v9[4];
  ICMusicKitRequestContext *v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICMusicKitRequestContext_initWithBlock___block_invoke;
  v9[3] = &unk_1E438B068;
  v11 = v4;
  v10 = self;
  v8.receiver = v10;
  v8.super_class = (Class)ICMusicKitRequestContext;
  v5 = v4;
  v6 = -[ICStoreRequestContext initWithBlock:](&v8, sel_initWithBlock_, v9);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_developerTokenProvider, 0);
}

- (id)copyWithBlock:(id)a3
{
  id v3;
  id v4;
  objc_super v6;
  _QWORD v7[4];
  ICMusicKitRequestContext *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __42__ICMusicKitRequestContext_copyWithBlock___block_invoke;
  v7[3] = &unk_1E438B068;
  v8 = self;
  v9 = a3;
  v6.receiver = v8;
  v6.super_class = (Class)ICMusicKitRequestContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v3 = v9;
  v4 = -[ICStoreRequestContext copyWithBlock:](&v6, sel_copyWithBlock_, v7);

  return v4;
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
  ICDeveloperTokenProvider *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t personalizationMethod;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

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
  v66 = __ROR8__(v14 + v13, 32);
  v68 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_developerTokenProvider;
  v19 = -[ICDeveloperTokenProvider hash](v18, "hash");
  v20 = (v17 + v63) ^ __ROR8__(v63, 51);
  v21 = v66 + (v68 ^ v19);
  v22 = __ROR8__(v68 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v63, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v67 = __ROR8__(v25, 32);
  v69 = v24;
  v62 = v23 ^ v19;
  v64 = v25 ^ __ROR8__(v20, 47);

  personalizationMethod = self->_personalizationMethod;
  v27 = (v62 + v64) ^ __ROR8__(v64, 51);
  v28 = v67 + (v69 ^ personalizationMethod);
  v29 = __ROR8__(v69 ^ personalizationMethod, 48);
  v30 = (v28 ^ v29) + __ROR8__(v62 + v64, 32);
  v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  v32 = v28 + v27;
  v65 = v32 ^ __ROR8__(v27, 47);
  v33 = ((v30 ^ personalizationMethod) + v65) ^ __ROR8__(v65, 51);
  v34 = __ROR8__(v32, 32) + (v31 ^ 0x1800000000000000);
  v35 = __ROR8__(v31 ^ 0x1800000000000000, 48);
  v36 = (v34 ^ v35) + __ROR8__((v30 ^ personalizationMethod) + v65, 32);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v34 + v33;
  v39 = v38 ^ __ROR8__(v33, 47);
  v40 = (v36 ^ 0x1800000000000000) + v39;
  v41 = v40 ^ __ROR8__(v39, 51);
  v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
  v43 = __ROR8__(v37, 48);
  v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v41 + v42;
  v47 = v46 ^ __ROR8__(v41, 47);
  v48 = v47 + v44;
  v49 = v48 ^ __ROR8__(v47, 51);
  v50 = __ROR8__(v46, 32) + v45;
  v51 = __ROR8__(v45, 48);
  v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
  v54 = v49 + v50;
  v55 = v54 ^ __ROR8__(v49, 47);
  v56 = v55 + v52;
  v57 = v56 ^ __ROR8__(v55, 51);
  v58 = __ROR8__(v54, 32) + v53;
  v59 = __ROR8__(v53, 48);
  v60 = __ROR8__(v56, 32) + (v58 ^ v59);
  return (v57 + v58) ^ __ROR8__(v57, 47) ^ v60 ^ __ROR8__(v57 + v58, 32) ^ v60 ^ __ROR8__(v58 ^ v59, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICMusicKitRequestContext *v4;
  ICMusicKitRequestContext *v5;
  ICDeveloperTokenProvider *developerTokenProvider;
  ICDeveloperTokenProvider *v7;
  ICDeveloperTokenProvider *v8;
  ICDeveloperTokenProvider *v9;
  int v10;
  BOOL v11;
  objc_super v13;

  v4 = (ICMusicKitRequestContext *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICMusicKitRequestContext isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)ICMusicKitRequestContext;
      if (-[ICStoreRequestContext isEqual:](&v13, sel_isEqual_, v5))
      {
        developerTokenProvider = self->_developerTokenProvider;
        v7 = v5->_developerTokenProvider;
        if (developerTokenProvider == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = developerTokenProvider;
          v10 = -[ICDeveloperTokenProvider isEqual:](v9, "isEqual:", v8);

          if (!v10)
            goto LABEL_6;
        }
        v11 = self->_personalizationMethod == v5->_personalizationMethod;
        goto LABEL_11;
      }
LABEL_6:
      v11 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (ICMusicKitRequestContext)initWithCoder:(id)a3
{
  id v4;
  ICMusicKitRequestContext *v5;
  NSString *v6;
  Class v7;
  uint64_t v8;
  void *developerTokenProvider;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICMusicKitRequestContext;
  v5 = -[ICStoreRequestContext initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_personalizationMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personalizationMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerTokenProviderClassName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    if ((_ICDeveloperTokenProviderIsAllowedForClassName(v6) & 1) != 0)
    {
      v7 = NSClassFromString(v6);
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("developerTokenProvider"));
        v8 = objc_claimAutoreleasedReturnValue();
        developerTokenProvider = v5->_developerTokenProvider;
        v5->_developerTokenProvider = (ICDeveloperTokenProvider *)v8;
        goto LABEL_13;
      }
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v6;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Failed to look up class of developer token provider with name: %{public}@.", buf, 0xCu);
      }
      v11 = CFSTR("Failed to look up class of developer token provider with name: %@.");
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v6;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "Attempted to decode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %{public}@.", buf, 0xCu);
      }
      v11 = CFSTR("Attempted to decode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %@.");
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, v11, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }
    developerTokenProvider = (void *)v12;
    objc_msgSend(v4, "failWithError:", v12);

    v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicKitRequestContext;
  -[ICStoreRequestContext encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_personalizationMethod, CFSTR("personalizationMethod"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ICDeveloperTokenProviderIsAllowedForClassName(v6) & 1) != 0)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("developerTokenProviderClassName"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_developerTokenProvider, CFSTR("developerTokenProvider"));
  }
  else
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "Attempted to encode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %{public}@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, CFSTR("Attempted to encode an instance of ICMusicKitRequestContext with an unallowed class name for developerTokenProvider: %@."), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);

  }
}

- (void)setDeveloperTokenProvider:(id)a3
{
  ICDeveloperTokenProvider *v5;
  void *v6;
  ICDeveloperTokenProvider *developerTokenProvider;
  void *v8;
  void *v9;
  id v10;

  v5 = (ICDeveloperTokenProvider *)a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitRequestContext.m"), 201, CFSTR("Mutation not allowed beyond initialization."));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitRequestContext.m"), 206, CFSTR("Setting up a MusicKit request context with a developer token provider that is not provided by iTunesCloud.framework is not supported."));

  }
  developerTokenProvider = self->_developerTokenProvider;
  self->_developerTokenProvider = v5;

}

- (void)setPersonalizationMethod:(int64_t)a3
{
  void *v6;

  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitRequestContext.m"), 212, CFSTR("Mutation not allowed beyond initialization."));

  }
  self->_personalizationMethod = a3;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  uint64_t v6;
  void *v7;
  objc_super v8;

  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitRequestContext.m"), 234, CFSTR("Mutation not allowed beyond initialization."));

  }
  if (a3 == 2)
    v6 = 2;
  else
    v6 = a3 == 1;
  v8.receiver = self;
  v8.super_class = (Class)ICMusicKitRequestContext;
  -[ICStoreRequestContext setPersonalizationStyle:](&v8, sel_setPersonalizationStyle_, v6);
}

void __42__ICMusicKitRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 12, *(id *)(*(_QWORD *)(a1 + 32) + 96));
  v4 = a2;
  v4[13] = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
