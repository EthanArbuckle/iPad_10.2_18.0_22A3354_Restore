@implementation ICStoreRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDialogResponseHandler, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_delegatedIdentity, 0);
}

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ICRequestContext clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestContext clientInfo](self, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@/%@; %@]>"), v4, self, v6, v8, self->_identity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (BOOL)allowsExpiredBags
{
  return self->_allowsExpiredBags;
}

- (ICStoreRequestContext)initWithBlock:(id)a3
{
  id v4;
  ICStoreRequestContext *v5;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __39__ICStoreRequestContext_initWithBlock___block_invoke;
  v8[3] = &unk_1E4389A50;
  v9 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICStoreRequestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = v9;
  v5 = -[ICRequestContext initWithBlock:](&v7, sel_initWithBlock_, v8);

  return v5;
}

void __39__ICStoreRequestContext_initWithBlock___block_invoke(uint64_t a1, void *a2)
{
  ICStoreURLResponseAuthenticationProvider *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 2);
  objc_msgSend(v11, "setAuthenticationProvider:", v3);

  +[ICUserIdentity nullIdentity](ICUserIdentity, "nullIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)*((_QWORD *)v11 + 7);
  *((_QWORD *)v11 + 7) = v4;

  +[ICUserIdentityStore nullIdentityStore](ICUserIdentityStore, "nullIdentityStore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v11 + 8);
  *((_QWORD *)v11 + 8) = v6;

  *((_BYTE *)v11 + 88) = 1;
  *((_QWORD *)v11 + 10) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  +[ICUserIdentityStore nullIdentityStore](ICUserIdentityStore, "nullIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v8, "isEqual:", *((_QWORD *)v11 + 8));

  if ((_DWORD)v3)
  {
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v9;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICStoreRequestContext;
  v4 = a3;
  -[ICRequestContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "ic_encodeUserIdentity:withStore:forKey:", self->_delegatedIdentity, self->_identityStore, CFSTR("delegatedIdentity"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "ic_encodeUserIdentity:withStore:forKey:", self->_identity, self->_identityStore, CFSTR("identity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityStore, CFSTR("identityStore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeDialogResponseHandler, CFSTR("storeDialogResponseHandler"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsExpiredBags, CFSTR("allowsExpiredBags"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_personalizationStyle, CFSTR("personalizationStyle"));

}

- (ICStoreRequestContext)initWithCoder:(id)a3
{
  id v4;
  ICStoreRequestContext *v5;
  uint64_t v6;
  ICUserIdentity *delegatedIdentity;
  uint64_t v8;
  ICUserIdentity *identity;
  uint64_t v10;
  ICUserIdentityStore *identityStore;
  uint64_t v12;
  ICStoreDialogResponseHandler *storeDialogResponseHandler;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICStoreRequestContext;
  v5 = -[ICRequestContext initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delegatedIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    delegatedIdentity = v5->_delegatedIdentity;
    v5->_delegatedIdentity = (ICUserIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (ICUserIdentity *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityStore"));
    v10 = objc_claimAutoreleasedReturnValue();
    identityStore = v5->_identityStore;
    v5->_identityStore = (ICUserIdentityStore *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeDialogResponseHandler"));
    v12 = objc_claimAutoreleasedReturnValue();
    storeDialogResponseHandler = v5->_storeDialogResponseHandler;
    v5->_storeDialogResponseHandler = (ICStoreDialogResponseHandler *)v12;

    v5->_allowsExpiredBags = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsExpiredBags"));
    v5->_personalizationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personalizationStyle"));
  }

  return v5;
}

void __39__ICStoreRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 6, *(id *)(*(_QWORD *)(a1 + 32) + 48));
  v4 = a2;
  objc_storeStrong(v4 + 7, *(id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_storeStrong(v4 + 8, *(id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_storeStrong(v4 + 9, *(id *)(*(_QWORD *)(a1 + 32) + 72));
  *((_BYTE *)v4 + 88) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88);
  v4[10] = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setStoreDialogResponseHandler:(id)a3
{
  ICStoreDialogResponseHandler *v5;
  ICStoreDialogResponseHandler *storeDialogResponseHandler;
  void *v7;

  v5 = (ICStoreDialogResponseHandler *)a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 243, CFSTR("Mutation not allowed beyond initialization."));

  }
  storeDialogResponseHandler = self->_storeDialogResponseHandler;
  self->_storeDialogResponseHandler = v5;

}

- (void)setAllowsExpiredBags:(BOOL)a3
{
  void *v6;

  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 248, CFSTR("Mutation not allowed beyond initialization."));

  }
  self->_allowsExpiredBags = a3;
}

void __90__ICStoreRequestContext_initWithIdentity_identityStore_clientInfo_authenticationProvider___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setClientInfo:", v3);
  objc_msgSend(v4, "setIdentity:", a1[5]);
  objc_msgSend(v4, "setIdentityStore:", a1[6]);
  objc_msgSend(v4, "setAuthenticationProvider:", a1[7]);

}

- (void)setIdentityStore:(id)a3
{
  ICUserIdentityStore *v5;
  ICUserIdentityStore *identityStore;
  void *v7;

  v5 = (ICUserIdentityStore *)a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 238, CFSTR("Mutation not allowed beyond initialization."));

  }
  identityStore = self->_identityStore;
  self->_identityStore = v5;

}

- (void)setIdentity:(id)a3
{
  ICUserIdentity *v5;
  ICUserIdentity *identity;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 233, CFSTR("Mutation not allowed beyond initialization."));

  }
  v5 = (ICUserIdentity *)objc_msgSend(v8, "copy");
  identity = self->_identity;
  self->_identity = v5;

}

- (void)setPersonalizationStyle:(int64_t)a3
{
  void *v6;

  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 253, CFSTR("Mutation not allowed beyond initialization."));

  }
  self->_personalizationStyle = a3;
}

- (ICStoreDialogResponseHandler)storeDialogResponseHandler
{
  return self->_storeDialogResponseHandler;
}

- (void)setDelegatedIdentity:(id)a3
{
  ICUserIdentity *v5;
  ICUserIdentity *delegatedIdentity;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICRequestContext _allowsMutation](self, "_allowsMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 228, CFSTR("Mutation not allowed beyond initialization."));

  }
  v5 = (ICUserIdentity *)objc_msgSend(v8, "copy");
  delegatedIdentity = self->_delegatedIdentity;
  self->_delegatedIdentity = v5;

}

- (ICUserIdentity)delegatedIdentity
{
  return self->_delegatedIdentity;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3
{
  id v4;
  void *v5;
  ICStoreRequestContext *v6;

  v4 = a3;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICStoreRequestContext initWithIdentity:clientInfo:](self, "initWithIdentity:clientInfo:", v4, v5);

  return v6;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 clientInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICStoreRequestContext *v9;

  v6 = a4;
  v7 = a3;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICStoreRequestContext initWithIdentity:identityStore:clientInfo:](self, "initWithIdentity:identityStore:clientInfo:", v7, v8, v6);

  return v9;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  ICStoreURLResponseAuthenticationProvider *v10;
  ICStoreRequestContext *v11;

  v7 = a5;
  v8 = a3;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 2);
  v11 = -[ICStoreRequestContext initWithIdentity:identityStore:clientInfo:authenticationProvider:](self, "initWithIdentity:identityStore:clientInfo:authenticationProvider:", v8, v9, v7, v10);

  return v11;
}

- (ICStoreRequestContext)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5 authenticationProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ICStoreRequestContext *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 || !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreRequestContext.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityStore != nil && identity != nil"));

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__ICStoreRequestContext_initWithIdentity_identityStore_clientInfo_authenticationProvider___block_invoke;
  v22[3] = &unk_1E4389A28;
  v23 = v13;
  v24 = v11;
  v25 = v12;
  v26 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  v19 = -[ICStoreRequestContext initWithBlock:](self, "initWithBlock:", v22);

  return v19;
}

- (id)userAgent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;

  -[ICRequestContext deviceInfo](self, "deviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestContext _userAgentWithPlatformVersion](self, "_userAgentWithPlatformVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMac");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v3, "deviceModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "appendFormat:", CFSTR(" model/%@"), v8);

  }
  objc_msgSend(v3, "hardwarePlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" hwp/%@"), v9);
  objc_msgSend(v3, "buildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" build/%@"), v10);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isMac");

  if ((v13 & 1) == 0)
  {
    v14 = objc_msgSend(v3, "deviceClass") - 1;
    if (v14 <= 5 && ((0x2Fu >> v14) & 1) != 0)
      objc_msgSend(v11, "addObject:", off_1E4389A98[v14]);
  }
  v15 = objc_msgSend(v3, "fairPlayDeviceType");
  if ((_DWORD)v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dt:%d"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" (%@)"), v17);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithBlock:(id)a3
{
  id v3;
  id v4;
  objc_super v6;
  _QWORD v7[4];
  ICStoreRequestContext *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __39__ICStoreRequestContext_copyWithBlock___block_invoke;
  v7[3] = &unk_1E4389A78;
  v8 = self;
  v9 = a3;
  v6.receiver = v8;
  v6.super_class = (Class)ICStoreRequestContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v3 = v9;
  v4 = -[ICRequestContext copyWithBlock:](&v6, sel_copyWithBlock_, v7);

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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  CC_LONG64 v21;
  CC_LONG64 v22;
  uint64_t v23;
  CC_LONG64 v24;
  CC_LONG64 v25;
  CC_LONG64 v26;
  void *v27;
  void *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  CC_LONG64 v35;
  CC_LONG64 v36;
  uint64_t v37;
  CC_LONG64 v38;
  CC_LONG64 v39;
  CC_LONG64 v40;
  int v41;
  unint64_t v42;
  int v43;
  char *v44;
  int v45;
  unint64_t v46;
  ICUserIdentityStore *v47;
  unint64_t v48;
  unint64_t v49;
  CC_LONG64 v50;
  CC_LONG64 v51;
  uint64_t v52;
  CC_LONG64 v53;
  CC_LONG64 v54;
  CC_LONG64 v55;
  void *v56;
  void *v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unsigned __int8 v62;
  unint64_t v63;
  uint64_t v64;
  CC_LONG64 v65;
  CC_LONG64 v66;
  uint64_t v67;
  CC_LONG64 v68;
  CC_LONG64 v69;
  CC_LONG64 v70;
  int v71;
  unint64_t v72;
  int v73;
  char *v74;
  int v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  CC_LONG64 v80;
  CC_LONG64 v81;
  uint64_t v82;
  CC_LONG64 v83;
  CC_LONG64 v84;
  CC_LONG64 v85;
  void *v86;
  void *v87;
  char *v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unsigned __int8 v92;
  uint64_t v93;
  CC_LONG64 v94;
  CC_LONG64 v95;
  uint64_t v96;
  CC_LONG64 v97;
  CC_LONG64 v98;
  CC_LONG64 v99;
  int v100;
  unint64_t v101;
  int v102;
  char *v103;
  int v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  CC_LONG64 v109;
  CC_LONG64 v110;
  uint64_t v111;
  CC_LONG64 v112;
  CC_LONG64 v113;
  CC_LONG64 v114;
  void *v115;
  void *v116;
  char *v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unsigned __int8 v121;
  uint64_t v122;
  CC_LONG64 v123;
  CC_LONG64 v124;
  uint64_t v125;
  CC_LONG64 v126;
  CC_LONG64 v127;
  CC_LONG64 v128;
  int v129;
  unint64_t v130;
  int v131;
  char *v132;
  int v133;
  unint64_t v134;
  ICStoreDialogResponseHandler *v135;
  unint64_t v136;
  unint64_t v137;
  CC_LONG64 v138;
  CC_LONG64 v139;
  uint64_t v140;
  CC_LONG64 v141;
  CC_LONG64 v142;
  CC_LONG64 v143;
  void *v144;
  void *v145;
  char *v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unsigned __int8 v150;
  unint64_t v151;
  uint64_t v152;
  CC_LONG64 v153;
  CC_LONG64 v154;
  uint64_t v155;
  CC_LONG64 v156;
  CC_LONG64 v157;
  CC_LONG64 v158;
  int v159;
  unint64_t v160;
  int v161;
  char *v162;
  int v163;
  unint64_t v164;
  uint64_t allowsExpiredBags;
  CC_LONG64 v166;
  unint64_t v167;
  void *v168;
  void *v169;
  char *v170;
  unint64_t v171;
  int v172;
  int v173;
  unsigned __int8 v174;
  uint64_t v175;
  CC_LONG64 v176;
  CC_LONG64 v177;
  uint64_t v178;
  CC_LONG64 v179;
  CC_LONG64 v180;
  CC_LONG64 v181;
  int v182;
  unint64_t v183;
  int v184;
  char *v185;
  int v186;
  unint64_t v187;
  unint64_t personalizationStyle;
  uint64_t v189;
  unint64_t v190;
  CC_LONG64 v191;
  CC_LONG64 v192;
  uint64_t v193;
  CC_LONG64 v194;
  CC_LONG64 v195;
  CC_LONG64 v196;
  void *v197;
  void *v198;
  char *v199;
  unint64_t v200;
  unint64_t v201;
  unint64_t v202;
  unsigned __int8 v203;
  uint64_t v204;
  CC_LONG64 v205;
  CC_LONG64 v206;
  uint64_t v207;
  CC_LONG64 v208;
  CC_LONG64 v209;
  CC_LONG64 v210;
  int v211;
  unint64_t v212;
  int v213;
  char *v214;
  int v215;
  unint64_t v216;
  CC_LONG64 v217;
  CC_LONG64 v218;
  uint64_t v219;
  CC_LONG64 v220;
  CC_LONG64 v221;
  CC_LONG64 v222;
  CC_LONG64 v223;
  CC_LONG64 v224;
  CC_LONG64 v225;
  CC_LONG64 v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  CC_LONG64 v230;
  CC_LONG64 v231;
  CC_LONG64 v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  CC_LONG64 v244;
  CC_LONG64 v245;
  uint64_t v246;
  CC_LONG64 v247;
  CC_LONG64 *v248;
  int v249;
  void *v250;
  void *v251;
  CC_LONG64 *v252;
  CC_LONG64 v253;
  int v254;
  unint64_t v255;
  unint64_t v256;
  uint64_t v257;
  unsigned int v258;
  unsigned int v259;
  unint64_t v260;
  unsigned int v261;
  unint64_t v262;
  int v263;
  unint64_t v264;
  int v265;
  unint64_t v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unsigned int v270;
  unsigned __int8 *v271;
  char *v272;
  char *v273;
  uint64_t m;
  unsigned int v275;
  char *v276;
  id v277;
  char *v278;
  uint64_t v279;
  unint64_t v280;
  unsigned __int8 *v281;
  char *v282;
  char *v283;
  uint64_t j;
  unsigned int v285;
  char *v286;
  unsigned __int8 *v287;
  char *v288;
  char *v289;
  uint64_t k;
  unsigned int v291;
  char *v292;
  unsigned __int8 *v293;
  char *v294;
  char *v295;
  uint64_t i;
  unsigned int v297;
  char *v298;
  void *v299;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  unint64_t v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  unint64_t v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  unint64_t v333;
  unint64_t v334;
  objc_super v335;
  uint64_t v336;
  CC_SHA512_CTX v337;
  _BYTE v338[72];
  _OWORD data[4];
  uint64_t v340;
  uint64_t v341;

  v341 = *MEMORY[0x1E0C80C00];
  v3 = MSVHasherSharedSeed();
  v5 = v4;
  memset(&v337.hash[3], 0, 168);
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v336 = 1000;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v17 = v14 + v13;
  v337.hash[0] = __ROR8__(v17, 32);
  v337.hash[1] = v16 ^ __ROR8__(v15, 43);
  v337.count[0] = v16 ^ v11;
  v337.count[1] = v17 ^ __ROR8__(v13, 47);
  v337.hash[2] = 0x800000000000000;

  v335.receiver = self;
  v335.super_class = (Class)ICStoreRequestContext;
  v18 = -[ICRequestContext hash](&v335, sel_hash);
  *(_QWORD *)&data[0] = v18;
  if (v336 <= 3000)
  {
    v19 = v18;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v29 = (char *)BYTE3(v337.count[1]);
        v30 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v31 = v18 >> 8;
            v32 = v18 >> 16;
            v33 = v18;
            v19 = v18 >> 24;
            break;
          case 1:
            v32 = v18 >> 8;
            v33 = v337.count[1];
            LOBYTE(v31) = v18;
            v19 = v18 >> 16;
            break;
          case 2:
            LOBYTE(v32) = v18;
            v19 = v18 >> 8;
            v33 = v337.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            v33 = v337.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v32) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v31) = 0;
            v33 = 0;
            LOBYTE(v32) = 0;
            LODWORD(v19) = 0;
            break;
        }
        v41 = (v32 << 16) | ((_DWORD)v19 << 24) | v33 | (v31 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v43;
        v44 = (char *)((char *)data - v29 + 4);
        v29 = (char *)(v30 + (char *)data - v29);
        if (v30 >= 5)
        {
          do
          {
            v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            v30 = 5 * (v46 >> 19);
            v43 = v30 - 430675100;
          }
          while (v44 < v29);
          LODWORD(v337.count[0]) = v30 - 430675100;
        }
        switch((int)v29)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v29;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v29;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v29;
            BYTE2(v337.count[1]) = v29[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v20 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v318 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v319 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v318, "handleFailureInFunction:file:lineNumber:description:", v319, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v20 = v337.hash[2];
          }
          v34 = v20 & 0xFFFFFFFFFFFFFFLL | (v19 << 32);
          v35 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v36 = v337.hash[0] + (v34 ^ v337.hash[1]);
          v37 = __ROR8__(v34 ^ v337.hash[1], 48);
          v38 = (v36 ^ v37) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          v40 = v36 + v35;
          v337.hash[0] = __ROR8__(v40, 32);
          v337.hash[1] = v39;
          v337.count[0] = v38 ^ v34;
          v337.count[1] = v40 ^ __ROR8__(v35, 47);
          v20 = v20 & 0xFF00000000000000 | HIDWORD(v19);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v303, "handleFailureInFunction:file:lineNumber:description:", v304, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v20 = v337.hash[2];
          }
          v21 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v22 = v337.hash[0] + (v337.hash[1] ^ v19);
          v23 = __ROR8__(v337.hash[1] ^ v19, 48);
          v24 = (v22 ^ v23) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
          v26 = v22 + v21;
          v337.hash[0] = __ROR8__(v26, 32);
          v337.hash[1] = v25;
          v337.count[0] = v24 ^ v19;
          v337.count[1] = v26 ^ __ROR8__(v21, 47);
        }
        v337.hash[2] = v20 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  v47 = self->_identityStore;
  v48 = -[ICUserIdentityStore hash](v47, "hash");
  *(_QWORD *)&data[0] = v48;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v58 = (char *)BYTE3(v337.count[1]);
        v59 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v60 = v48 >> 8;
            v61 = v48 >> 16;
            v62 = v48;
            v63 = v48 >> 24;
            goto LABEL_75;
          case 1:
            v61 = v48 >> 8;
            v62 = v337.count[1];
            LOBYTE(v60) = v48;
            v63 = v48 >> 16;
            goto LABEL_75;
          case 2:
            LOBYTE(v61) = v48;
            v63 = v48 >> 8;
            v62 = v337.count[1];
            LODWORD(v60) = HIBYTE(LOWORD(v337.count[1]));
LABEL_75:
            LODWORD(v48) = v63;
            break;
          case 3:
            v62 = v337.count[1];
            LODWORD(v60) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v61) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_72:
            LOBYTE(v60) = 0;
            v62 = 0;
            LOBYTE(v61) = 0;
            LODWORD(v48) = 0;
            break;
        }
        v71 = (v61 << 16) | ((_DWORD)v48 << 24) | v62 | (v60 << 8);
        HIDWORD(v72) = (461845907 * ((380141568 * v71) | ((-862048943 * v71) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v72) = HIDWORD(v72);
        v73 = 5 * (v72 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v73;
        v74 = (char *)((char *)data - v58 + 4);
        v58 = (char *)(v59 + (char *)data - v58);
        if (v59 >= 5)
        {
          do
          {
            v75 = *(_DWORD *)v74;
            v74 += 4;
            HIDWORD(v76) = (461845907 * ((380141568 * v75) | ((-862048943 * v75) >> 17))) ^ v73;
            LODWORD(v76) = HIDWORD(v76);
            v59 = 5 * (v76 >> 19);
            v73 = v59 - 430675100;
          }
          while (v74 < v58);
          LODWORD(v337.count[0]) = v59 - 430675100;
        }
        switch((int)v58)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v58;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v58;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v58;
            BYTE2(v337.count[1]) = v58[2];
            break;
          default:
            goto LABEL_72;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v49 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v334 = v48;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v320 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v321 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v320, "handleFailureInFunction:file:lineNumber:description:", v321, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v48 = v334;
            v49 = v337.hash[2];
          }
          v64 = v49 & 0xFFFFFFFFFFFFFFLL | (v48 << 32);
          v65 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v66 = v337.hash[0] + (v64 ^ v337.hash[1]);
          v67 = __ROR8__(v64 ^ v337.hash[1], 48);
          v68 = (v66 ^ v67) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v69 = v68 ^ __ROR8__(v66 ^ v67, 43);
          v70 = v66 + v65;
          v337.hash[0] = __ROR8__(v70, 32);
          v337.hash[1] = v69;
          v337.count[0] = v68 ^ v64;
          v337.count[1] = v70 ^ __ROR8__(v65, 47);
          v49 = v49 & 0xFF00000000000000 | HIDWORD(v48);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v333 = v48;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v305 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v306 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v305, "handleFailureInFunction:file:lineNumber:description:", v306, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v48 = v333;
            v49 = v337.hash[2];
          }
          v50 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v51 = v337.hash[0] + (v337.hash[1] ^ v48);
          v52 = __ROR8__(v337.hash[1] ^ v48, 48);
          v53 = (v51 ^ v52) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
          v55 = v51 + v50;
          v337.hash[0] = __ROR8__(v55, 32);
          v337.hash[1] = v54;
          v337.count[0] = v53 ^ v48;
          v337.count[1] = v55 ^ __ROR8__(v50, 47);
        }
        v337.hash[2] = v49 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }

  v77 = -[ICUserIdentity hashInStore:](self->_delegatedIdentity, "hashInStore:", self->_identityStore);
  *(_QWORD *)&data[0] = v77;
  if (v336 <= 3000)
  {
    v78 = v77;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v88 = (char *)BYTE3(v337.count[1]);
        v89 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v90 = v77 >> 8;
            v91 = v77 >> 16;
            v92 = v77;
            v78 = v77 >> 24;
            break;
          case 1:
            v91 = v77 >> 8;
            v92 = v337.count[1];
            LOBYTE(v90) = v77;
            v78 = v77 >> 16;
            break;
          case 2:
            LOBYTE(v91) = v77;
            v78 = v77 >> 8;
            v92 = v337.count[1];
            LODWORD(v90) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            v92 = v337.count[1];
            LODWORD(v90) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v91) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_114:
            LOBYTE(v90) = 0;
            v92 = 0;
            LOBYTE(v91) = 0;
            LODWORD(v78) = 0;
            break;
        }
        v100 = (v91 << 16) | ((_DWORD)v78 << 24) | v92 | (v90 << 8);
        HIDWORD(v101) = (461845907 * ((380141568 * v100) | ((-862048943 * v100) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v101) = HIDWORD(v101);
        v102 = 5 * (v101 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v102;
        v103 = (char *)((char *)data - v88 + 4);
        v88 = (char *)(v89 + (char *)data - v88);
        if (v89 >= 5)
        {
          do
          {
            v104 = *(_DWORD *)v103;
            v103 += 4;
            HIDWORD(v105) = (461845907 * ((380141568 * v104) | ((-862048943 * v104) >> 17))) ^ v102;
            LODWORD(v105) = HIDWORD(v105);
            v89 = 5 * (v105 >> 19);
            v102 = v89 - 430675100;
          }
          while (v103 < v88);
          LODWORD(v337.count[0]) = v89 - 430675100;
        }
        switch((int)v88)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v88;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v88;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v88;
            BYTE2(v337.count[1]) = v88[2];
            break;
          default:
            goto LABEL_114;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v79 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v322 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v323 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v322, "handleFailureInFunction:file:lineNumber:description:", v323, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v79 = v337.hash[2];
          }
          v93 = v79 & 0xFFFFFFFFFFFFFFLL | (v78 << 32);
          v94 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v95 = v337.hash[0] + (v93 ^ v337.hash[1]);
          v96 = __ROR8__(v93 ^ v337.hash[1], 48);
          v97 = (v95 ^ v96) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v98 = v97 ^ __ROR8__(v95 ^ v96, 43);
          v99 = v95 + v94;
          v337.hash[0] = __ROR8__(v99, 32);
          v337.hash[1] = v98;
          v337.count[0] = v97 ^ v93;
          v337.count[1] = v99 ^ __ROR8__(v94, 47);
          v79 = v79 & 0xFF00000000000000 | HIDWORD(v78);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v308 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v307, "handleFailureInFunction:file:lineNumber:description:", v308, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v79 = v337.hash[2];
          }
          v80 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v81 = v337.hash[0] + (v337.hash[1] ^ v78);
          v82 = __ROR8__(v337.hash[1] ^ v78, 48);
          v83 = (v81 ^ v82) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v84 = v83 ^ __ROR8__(v81 ^ v82, 43);
          v85 = v81 + v80;
          v337.hash[0] = __ROR8__(v85, 32);
          v337.hash[1] = v84;
          v337.count[0] = v83 ^ v78;
          v337.count[1] = v85 ^ __ROR8__(v80, 47);
        }
        v337.hash[2] = v79 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", v87, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  v106 = -[ICUserIdentity hashInStore:](self->_identity, "hashInStore:", self->_identityStore);
  *(_QWORD *)&data[0] = v106;
  if (v336 <= 3000)
  {
    v107 = v106;
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v117 = (char *)BYTE3(v337.count[1]);
        v118 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v119 = v106 >> 8;
            v120 = v106 >> 16;
            v121 = v106;
            v107 = v106 >> 24;
            break;
          case 1:
            v120 = v106 >> 8;
            v121 = v337.count[1];
            LOBYTE(v119) = v106;
            v107 = v106 >> 16;
            break;
          case 2:
            LOBYTE(v120) = v106;
            v107 = v106 >> 8;
            v121 = v337.count[1];
            LODWORD(v119) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            v121 = v337.count[1];
            LODWORD(v119) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v120) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_156:
            LOBYTE(v119) = 0;
            v121 = 0;
            LOBYTE(v120) = 0;
            LODWORD(v107) = 0;
            break;
        }
        v129 = (v120 << 16) | ((_DWORD)v107 << 24) | v121 | (v119 << 8);
        HIDWORD(v130) = (461845907 * ((380141568 * v129) | ((-862048943 * v129) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v130) = HIDWORD(v130);
        v131 = 5 * (v130 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v131;
        v132 = (char *)((char *)data - v117 + 4);
        v117 = (char *)(v118 + (char *)data - v117);
        if (v118 >= 5)
        {
          do
          {
            v133 = *(_DWORD *)v132;
            v132 += 4;
            HIDWORD(v134) = (461845907 * ((380141568 * v133) | ((-862048943 * v133) >> 17))) ^ v131;
            LODWORD(v134) = HIDWORD(v134);
            v118 = 5 * (v134 >> 19);
            v131 = v118 - 430675100;
          }
          while (v132 < v117);
          LODWORD(v337.count[0]) = v118 - 430675100;
        }
        switch((int)v117)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v117;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v117;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v117;
            BYTE2(v337.count[1]) = v117[2];
            break;
          default:
            goto LABEL_156;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v108 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v324 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v325 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v324, "handleFailureInFunction:file:lineNumber:description:", v325, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v108 = v337.hash[2];
          }
          v122 = v108 & 0xFFFFFFFFFFFFFFLL | (v107 << 32);
          v123 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v124 = v337.hash[0] + (v122 ^ v337.hash[1]);
          v125 = __ROR8__(v122 ^ v337.hash[1], 48);
          v126 = (v124 ^ v125) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v127 = v126 ^ __ROR8__(v124 ^ v125, 43);
          v128 = v124 + v123;
          v337.hash[0] = __ROR8__(v128, 32);
          v337.hash[1] = v127;
          v337.count[0] = v126 ^ v122;
          v337.count[1] = v128 ^ __ROR8__(v123, 47);
          v108 = v108 & 0xFF00000000000000 | HIDWORD(v107);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v309 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v309, "handleFailureInFunction:file:lineNumber:description:", v310, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v108 = v337.hash[2];
          }
          v109 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v110 = v337.hash[0] + (v337.hash[1] ^ v107);
          v111 = __ROR8__(v337.hash[1] ^ v107, 48);
          v112 = (v110 ^ v111) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v113 = v112 ^ __ROR8__(v110 ^ v111, 43);
          v114 = v110 + v109;
          v337.hash[0] = __ROR8__(v114, 32);
          v337.hash[1] = v113;
          v337.count[0] = v112 ^ v107;
          v337.count[1] = v114 ^ __ROR8__(v109, 47);
        }
        v337.hash[2] = v108 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "handleFailureInFunction:file:lineNumber:description:", v116, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  v135 = self->_storeDialogResponseHandler;
  v136 = -[ICStoreDialogResponseHandler hash](v135, "hash");
  *(_QWORD *)&data[0] = v136;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v146 = (char *)BYTE3(v337.count[1]);
        v147 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v148 = v136 >> 8;
            v149 = v136 >> 16;
            v150 = v136;
            v151 = v136 >> 24;
            goto LABEL_201;
          case 1:
            v149 = v136 >> 8;
            v150 = v337.count[1];
            LOBYTE(v148) = v136;
            v151 = v136 >> 16;
            goto LABEL_201;
          case 2:
            LOBYTE(v149) = v136;
            v151 = v136 >> 8;
            v150 = v337.count[1];
            LODWORD(v148) = HIBYTE(LOWORD(v337.count[1]));
LABEL_201:
            LODWORD(v136) = v151;
            break;
          case 3:
            v150 = v337.count[1];
            LODWORD(v148) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v149) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_198:
            LOBYTE(v148) = 0;
            v150 = 0;
            LOBYTE(v149) = 0;
            LODWORD(v136) = 0;
            break;
        }
        v159 = (v149 << 16) | ((_DWORD)v136 << 24) | v150 | (v148 << 8);
        HIDWORD(v160) = (461845907 * ((380141568 * v159) | ((-862048943 * v159) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v160) = HIDWORD(v160);
        v161 = 5 * (v160 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v161;
        v162 = (char *)((char *)data - v146 + 4);
        v146 = (char *)(v147 + (char *)data - v146);
        if (v147 >= 5)
        {
          do
          {
            v163 = *(_DWORD *)v162;
            v162 += 4;
            HIDWORD(v164) = (461845907 * ((380141568 * v163) | ((-862048943 * v163) >> 17))) ^ v161;
            LODWORD(v164) = HIDWORD(v164);
            v147 = 5 * (v164 >> 19);
            v161 = v147 - 430675100;
          }
          while (v162 < v146);
          LODWORD(v337.count[0]) = v147 - 430675100;
        }
        switch((int)v146)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v146;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v146;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v146;
            BYTE2(v337.count[1]) = v146[2];
            break;
          default:
            goto LABEL_198;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v137 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            v326 = v136;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v328 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v327, "handleFailureInFunction:file:lineNumber:description:", v328, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v136 = v326;
            v137 = v337.hash[2];
          }
          v152 = v137 & 0xFFFFFFFFFFFFFFLL | (v136 << 32);
          v153 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v154 = v337.hash[0] + (v152 ^ v337.hash[1]);
          v155 = __ROR8__(v152 ^ v337.hash[1], 48);
          v156 = (v154 ^ v155) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v157 = v156 ^ __ROR8__(v154 ^ v155, 43);
          v158 = v154 + v153;
          v337.hash[0] = __ROR8__(v158, 32);
          v337.hash[1] = v157;
          v337.count[0] = v156 ^ v152;
          v337.count[1] = v158 ^ __ROR8__(v153, 47);
          v137 = v137 & 0xFF00000000000000 | HIDWORD(v136);
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v311 = v136;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v312, "handleFailureInFunction:file:lineNumber:description:", v313, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v136 = v311;
            v137 = v337.hash[2];
          }
          v138 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v139 = v337.hash[0] + (v337.hash[1] ^ v136);
          v140 = __ROR8__(v337.hash[1] ^ v136, 48);
          v141 = (v139 ^ v140) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v142 = v141 ^ __ROR8__(v139 ^ v140, 43);
          v143 = v139 + v138;
          v337.hash[0] = __ROR8__(v143, 32);
          v337.hash[1] = v142;
          v337.count[0] = v141 ^ v136;
          v337.count[1] = v143 ^ __ROR8__(v138, 47);
        }
        v337.hash[2] = v137 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "handleFailureInFunction:file:lineNumber:description:", v145, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }

  allowsExpiredBags = self->_allowsExpiredBags;
  LODWORD(data[0]) = self->_allowsExpiredBags;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v170 = (char *)BYTE3(v337.count[1]);
        v171 = (BYTE3(v337.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v172 = 0;
            v173 = 0;
            v174 = allowsExpiredBags;
            goto LABEL_243;
          case 1:
            v173 = 0;
            v174 = v337.count[1];
            v172 = allowsExpiredBags;
            goto LABEL_243;
          case 2:
            v174 = v337.count[1];
            v172 = HIBYTE(LOWORD(v337.count[1]));
            v173 = allowsExpiredBags;
            goto LABEL_243;
          case 3:
            v174 = v337.count[1];
            v172 = HIBYTE(LOWORD(v337.count[1]));
            v173 = BYTE2(v337.count[1]);
            goto LABEL_245;
          default:
            while (2)
            {
              v172 = 0;
              v174 = 0;
              v173 = 0;
LABEL_243:
              LODWORD(allowsExpiredBags) = 0;
LABEL_245:
              v182 = (v173 << 16) | ((_DWORD)allowsExpiredBags << 24) | v174 | (v172 << 8);
              HIDWORD(v183) = (461845907 * ((380141568 * v182) | ((-862048943 * v182) >> 17))) ^ LODWORD(v337.count[0]);
              LODWORD(v183) = HIDWORD(v183);
              v184 = 5 * (v183 >> 19) - 430675100;
              LODWORD(v337.count[0]) = v184;
              v185 = (char *)((char *)data - v170 + 4);
              v170 = (char *)(v171 + (char *)data - v170);
              if (v171 >= 5)
              {
                do
                {
                  v186 = *(_DWORD *)v185;
                  v185 += 4;
                  HIDWORD(v187) = (461845907 * ((380141568 * v186) | ((-862048943 * v186) >> 17))) ^ v184;
                  LODWORD(v187) = HIDWORD(v187);
                  v171 = 5 * (v187 >> 19);
                  v184 = v171 - 430675100;
                }
                while (v185 < v170);
                LODWORD(v337.count[0]) = v171 - 430675100;
              }
              switch((int)v170)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v337.count[1]) = *v170;
                  break;
                case 2:
                  LOWORD(v337.count[1]) = *(_WORD *)v170;
                  break;
                case 3:
                  LOWORD(v337.count[1]) = *(_WORD *)v170;
                  BYTE2(v337.count[1]) = v170[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v337.count[1]) &= 3u;
            HIDWORD(v337.count[0]) += 4;
            break;
        }
      }
      else if (v336 == 3000)
      {
        _MSV_XXH_XXH32_update(&v337, (char *)data, 4uLL);
      }
    }
    else if (v336)
    {
      if (v336 == 1000)
      {
        v166 = v337.hash[2];
        if ((v337.hash[2] & 0x400000000000000) != 0)
        {
          if ((v337.hash[2] & 0x300000000000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v329 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v330 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v329, "handleFailureInFunction:file:lineNumber:description:", v330, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

            v166 = v337.hash[2];
          }
          v175 = v166 & 0xFFFFFFFFFFFFFFLL | (allowsExpiredBags << 32);
          v176 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
          v177 = v337.hash[0] + (v175 ^ v337.hash[1]);
          v178 = __ROR8__(v175 ^ v337.hash[1], 48);
          v179 = (v177 ^ v178) + __ROR8__(v337.count[0] + v337.count[1], 32);
          v180 = v179 ^ __ROR8__(v177 ^ v178, 43);
          v181 = v177 + v176;
          v337.hash[0] = __ROR8__(v181, 32);
          v337.hash[1] = v180;
          v337.count[0] = v179 ^ v175;
          v337.count[1] = v181 ^ __ROR8__(v176, 47);
          v167 = v166 & 0xFF00000000000000;
        }
        else
        {
          if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v314 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v315 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v314, "handleFailureInFunction:file:lineNumber:description:", v315, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

            v166 = v337.hash[2];
          }
          v167 = v166 | allowsExpiredBags;
        }
        v337.hash[2] = v167 + 0x400000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "handleFailureInFunction:file:lineNumber:description:", v169, CFSTR("MSVHasher+Algorithms.h"), 192, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 4uLL);
    }
    else if (v336 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
    }
  }
  personalizationStyle = self->_personalizationStyle;
  *(_QWORD *)&data[0] = personalizationStyle;
  v189 = v336;
  if (v336 <= 3000)
  {
    if (v336 > 1999)
    {
      if (v336 == 2000)
      {
        v199 = (char *)BYTE3(v337.count[1]);
        v200 = (BYTE3(v337.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v337.count[1]))
        {
          case 0:
            v201 = personalizationStyle >> 8;
            v202 = personalizationStyle >> 16;
            v203 = personalizationStyle;
            personalizationStyle >>= 24;
            break;
          case 1:
            v202 = personalizationStyle >> 8;
            v203 = v337.count[1];
            LOBYTE(v201) = personalizationStyle;
            personalizationStyle >>= 16;
            break;
          case 2:
            LOBYTE(v202) = personalizationStyle;
            personalizationStyle >>= 8;
            v203 = v337.count[1];
            LODWORD(v201) = HIBYTE(LOWORD(v337.count[1]));
            break;
          case 3:
            v203 = v337.count[1];
            LODWORD(v201) = HIBYTE(LOWORD(v337.count[1]));
            LOBYTE(v202) = BYTE2(v337.count[1]);
            break;
          default:
LABEL_282:
            LOBYTE(v201) = 0;
            v203 = 0;
            LOBYTE(v202) = 0;
            LODWORD(personalizationStyle) = 0;
            break;
        }
        v211 = (v202 << 16) | ((_DWORD)personalizationStyle << 24) | v203 | (v201 << 8);
        HIDWORD(v212) = (461845907 * ((380141568 * v211) | ((-862048943 * v211) >> 17))) ^ LODWORD(v337.count[0]);
        LODWORD(v212) = HIDWORD(v212);
        v213 = 5 * (v212 >> 19) - 430675100;
        LODWORD(v337.count[0]) = v213;
        v214 = (char *)((char *)data - v199 + 4);
        v199 = (char *)(v200 + (char *)data - v199);
        if (v200 >= 5)
        {
          do
          {
            v215 = *(_DWORD *)v214;
            v214 += 4;
            HIDWORD(v216) = (461845907 * ((380141568 * v215) | ((-862048943 * v215) >> 17))) ^ v213;
            LODWORD(v216) = HIDWORD(v216);
            v200 = 5 * (v216 >> 19);
            v213 = v200 - 430675100;
          }
          while (v214 < v199);
          LODWORD(v337.count[0]) = v200 - 430675100;
        }
        switch((int)v199)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v337.count[1]) = *v199;
            break;
          case 2:
            LOWORD(v337.count[1]) = *(_WORD *)v199;
            break;
          case 3:
            LOWORD(v337.count[1]) = *(_WORD *)v199;
            BYTE2(v337.count[1]) = v199[2];
            break;
          default:
            goto LABEL_282;
        }
        BYTE3(v337.count[1]) &= 3u;
        HIDWORD(v337.count[0]) += 8;
      }
      else
      {
        if (v336 != 3000)
          goto LABEL_296;
        _MSV_XXH_XXH32_update(&v337, (char *)data, 8uLL);
      }
    }
    else if (v336)
    {
      if (v336 != 1000)
        goto LABEL_296;
      v190 = v337.hash[2];
      if ((v337.hash[2] & 0x400000000000000) != 0)
      {
        if ((v337.hash[2] & 0x300000000000000) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v331, "handleFailureInFunction:file:lineNumber:description:", v332, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v337.hash[2]);

          v190 = v337.hash[2];
        }
        v204 = v190 & 0xFFFFFFFFFFFFFFLL | (personalizationStyle << 32);
        v205 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
        v206 = v337.hash[0] + (v204 ^ v337.hash[1]);
        v207 = __ROR8__(v204 ^ v337.hash[1], 48);
        v208 = (v206 ^ v207) + __ROR8__(v337.count[0] + v337.count[1], 32);
        v209 = v208 ^ __ROR8__(v206 ^ v207, 43);
        v210 = v206 + v205;
        v337.hash[0] = __ROR8__(v210, 32);
        v337.hash[1] = v209;
        v337.count[0] = v208 ^ v204;
        v337.count[1] = v210 ^ __ROR8__(v205, 47);
        v190 = v190 & 0xFF00000000000000 | HIDWORD(personalizationStyle);
      }
      else
      {
        if ((v337.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v316, "handleFailureInFunction:file:lineNumber:description:", v317, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v337.hash[2]);

          v190 = v337.hash[2];
        }
        v191 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
        v192 = v337.hash[0] + (v337.hash[1] ^ personalizationStyle);
        v193 = __ROR8__(v337.hash[1] ^ personalizationStyle, 48);
        v194 = (v192 ^ v193) + __ROR8__(v337.count[0] + v337.count[1], 32);
        v195 = v194 ^ __ROR8__(v192 ^ v193, 43);
        v196 = v192 + v191;
        v337.hash[0] = __ROR8__(v196, 32);
        v337.hash[1] = v195;
        v337.count[0] = v194 ^ personalizationStyle;
        v337.count[1] = v196 ^ __ROR8__(v191, 47);
      }
      v337.hash[2] = v190 + 0x800000000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "handleFailureInFunction:file:lineNumber:description:", v198, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v336 <= 4000)
  {
    if (v336 == 3001)
    {
      _MSV_XXH_XXH64_update((char *)&v337, (char *)data, 8uLL);
    }
    else
    {
      if (v336 != 4000)
        goto LABEL_296;
      CC_MD5_Update((CC_MD5_CTX *)&v337, data, 4u);
    }
  }
  else
  {
    switch(v336)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v337, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v337, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v337, data, 4u);
        break;
      default:
        goto LABEL_296;
    }
  }
  v189 = v336;
LABEL_296:
  memset(&v338[8], 0, 64);
  *(_QWORD *)v338 = v189;
  if (v189 <= 3000)
  {
    if (v189 <= 1999)
    {
      if (!v189)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v250, "handleFailureInFunction:file:lineNumber:description:", v251, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_343;
      }
      if (v189 != 1000)
        goto LABEL_343;
      v217 = (v337.count[0] + v337.count[1]) ^ __ROR8__(v337.count[1], 51);
      v218 = v337.hash[0] + (v337.hash[1] ^ v337.hash[2]);
      v219 = __ROR8__(v337.hash[1] ^ v337.hash[2], 48);
      v220 = (v218 ^ v219) + __ROR8__(v337.count[0] + v337.count[1], 32);
      v221 = v220 ^ __ROR8__(v218 ^ v219, 43);
      v222 = v218 + v217;
      v223 = v222 ^ __ROR8__(v217, 47);
      v224 = (v220 ^ v337.hash[2]) + v223;
      v225 = v224 ^ __ROR8__(v223, 51);
      v226 = (__ROR8__(v222, 32) ^ 0xFFLL) + v221;
      v227 = __ROR8__(v221, 48);
      v228 = __ROR8__(v224, 32) + (v226 ^ v227);
      v229 = v228 ^ __ROR8__(v226 ^ v227, 43);
      v230 = v225 + v226;
      v231 = v230 ^ __ROR8__(v225, 47);
      v232 = v231 + v228;
      v233 = v232 ^ __ROR8__(v231, 51);
      v234 = __ROR8__(v230, 32) + v229;
      v235 = __ROR8__(v229, 48);
      v236 = __ROR8__(v232, 32) + (v234 ^ v235);
      v237 = v236 ^ __ROR8__(v234 ^ v235, 43);
      v238 = v233 + v234;
      v239 = v238 ^ __ROR8__(v233, 47);
      v240 = v239 + v236;
      v241 = v240 ^ __ROR8__(v239, 51);
      v242 = __ROR8__(v238, 32) + v237;
      v243 = __ROR8__(v237, 48);
      v244 = __ROR8__(v240, 32) + (v242 ^ v243);
      v245 = v244 ^ __ROR8__(v242 ^ v243, 43);
      v246 = v241 + v242;
      v337.count[0] = v244;
      v337.count[1] = v246 ^ __ROR8__(v241, 47);
      v337.hash[0] = __ROR8__(v246, 32);
      v337.hash[1] = v245;
      v247 = v337.count[1] ^ v244 ^ v337.hash[0] ^ v245;
      goto LABEL_330;
    }
    if (v189 != 2000)
    {
      if (v189 != 3000)
        goto LABEL_343;
      v248 = &v337.hash[1];
      if (HIDWORD(v337.count[0]))
        v249 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v337.count[1], (uint32x4_t)xmmword_1A06E75B0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v337.count[1], (uint32x4_t)xmmword_1A06E75A0)));
      else
        v249 = LODWORD(v337.hash[0]) + 374761393;
      v261 = LODWORD(v337.count[0]) + v249;
      v262 = v337.hash[3] & 0xF;
      if (v262 >= 4)
      {
        do
        {
          v263 = *(_DWORD *)v248;
          v248 = (CC_LONG64 *)((char *)v248 + 4);
          HIDWORD(v264) = v261 - 1028477379 * v263;
          LODWORD(v264) = HIDWORD(v264);
          v261 = 668265263 * (v264 >> 15);
          v262 -= 4;
        }
        while (v262 > 3);
      }
      for (; v262; --v262)
      {
        v265 = *(unsigned __int8 *)v248;
        v248 = (CC_LONG64 *)((char *)v248 + 1);
        HIDWORD(v266) = v261 + 374761393 * v265;
        LODWORD(v266) = HIDWORD(v266);
        v261 = -1640531535 * (v266 >> 21);
      }
      v267 = -1028477379 * ((-2048144777 * (v261 ^ (v261 >> 15))) ^ ((-2048144777 * (v261 ^ (v261 >> 15))) >> 13));
      v268 = v267 ^ HIWORD(v267);
      goto LABEL_342;
    }
    switch(BYTE3(v337.count[1]))
    {
      case 1u:
        v254 = LOBYTE(v337.count[1]);
        break;
      case 2u:
        v254 = LOWORD(v337.count[1]);
        break;
      case 3u:
        v254 = LOWORD(v337.count[1]) | (BYTE2(v337.count[1]) << 16);
        break;
      default:
        v269 = v337.count[0];
        goto LABEL_341;
    }
    v269 = (461845907 * ((380141568 * v254) | ((-862048943 * v254) >> 17))) ^ LODWORD(v337.count[0]);
LABEL_341:
    v270 = -2048144789 * (v269 ^ HIDWORD(v337.count[0]) ^ ((v269 ^ HIDWORD(v337.count[0])) >> 16));
    v268 = (-1028477387 * (v270 ^ (v270 >> 13))) ^ ((-1028477387 * (v270 ^ (v270 >> 13))) >> 16);
    LODWORD(v337.count[0]) = v268;
LABEL_342:
    *(_DWORD *)&v338[8] = v268;
    goto LABEL_343;
  }
  if (v189 > 4000)
  {
    switch(v189)
    {
      case 4001:
        CC_SHA1_Final(&v338[8], (CC_SHA1_CTX *)&v337);
        break;
      case 4256:
        CC_SHA256_Final(&v338[8], (CC_SHA256_CTX *)&v337);
        break;
      case 4512:
        CC_SHA512_Final(&v338[8], &v337);
        break;
    }
    goto LABEL_343;
  }
  if (v189 == 3001)
  {
    v252 = &v337.hash[3];
    if (v337.count[0] < 0x20)
      v253 = v337.hash[1] + 0x27D4EB2F165667C5;
    else
      v253 = 0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((0x85EBCA77C2B2AE63
               - 0x61C8864E7A143579
               * ((0x85EBCA77C2B2AE63
                 - 0x61C8864E7A143579
                 * ((__ROR8__(v337.hash[0], 57)
                   + __ROR8__(v337.count[1], 63)
                   + __ROR8__(v337.hash[1], 52)
                   + __ROR8__(v337.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                  * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.count[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v337.hash[2], 33)));
    v255 = v253 + v337.count[0];
    v256 = v337.count[0] & 0x1F;
    if (v256 >= 8)
    {
      do
      {
        v257 = *v252++;
        v255 = 0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v257, 33)) ^ v255, 37);
        v256 -= 8;
      }
      while (v256 > 7);
    }
    if (v256 >= 4)
    {
      v258 = *(_DWORD *)v252;
      v252 = (CC_LONG64 *)((char *)v252 + 4);
      v255 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v258) ^ v255, 41);
      v256 -= 4;
    }
    for (; v256; --v256)
    {
      v259 = *(unsigned __int8 *)v252;
      v252 = (CC_LONG64 *)((char *)v252 + 1);
      v255 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v259) ^ v255, 53);
    }
    v260 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v255 ^ (v255 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v255 ^ (v255 >> 33))) >> 29));
    v247 = v260 ^ HIDWORD(v260);
LABEL_330:
    *(_QWORD *)&v338[8] = v247;
    goto LABEL_343;
  }
  if (v189 == 4000)
    CC_MD5_Final(&v338[8], (CC_MD5_CTX *)&v337);
LABEL_343:
  data[0] = *(_OWORD *)v338;
  data[1] = *(_OWORD *)&v338[16];
  data[2] = *(_OWORD *)&v338[32];
  data[3] = *(_OWORD *)&v338[48];
  v340 = *(_QWORD *)&v338[64];
  if (*(uint64_t *)v338 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(_QWORD *)&data[0] == 4256)
      {
        v293 = (unsigned __int8 *)data + 8;
        v294 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v295 = v294;
        for (i = 0; i != 64; i += 2)
        {
          v297 = *v293++;
          v298 = &v294[i];
          *v298 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v297 >> 4];
          v298[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v297 & 0xF];
        }
        v277 = objc_alloc(MEMORY[0x1E0CB3940]);
        v278 = v295;
        v279 = 64;
      }
      else
      {
        if (*(_QWORD *)&data[0] != 4512)
          goto LABEL_371;
        v281 = (unsigned __int8 *)data + 8;
        v282 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v283 = v282;
        for (j = 0; j != 128; j += 2)
        {
          v285 = *v281++;
          v286 = &v282[j];
          *v286 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v285 >> 4];
          v286[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v285 & 0xF];
        }
        v277 = objc_alloc(MEMORY[0x1E0CB3940]);
        v278 = v283;
        v279 = 128;
      }
    }
    else if (*(_QWORD *)&data[0] == 4000)
    {
      v287 = (unsigned __int8 *)data + 8;
      v288 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v289 = v288;
      for (k = 0; k != 32; k += 2)
      {
        v291 = *v287++;
        v292 = &v288[k];
        *v292 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v291 >> 4];
        v292[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v291 & 0xF];
      }
      v277 = objc_alloc(MEMORY[0x1E0CB3940]);
      v278 = v289;
      v279 = 32;
    }
    else
    {
      if (*(_QWORD *)&data[0] != 4001)
        goto LABEL_371;
      v271 = (unsigned __int8 *)data + 8;
      v272 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v273 = v272;
      for (m = 0; m != 40; m += 2)
      {
        v275 = *v271++;
        v276 = &v272[m];
        *v276 = MSVFastHexStringFromBytes_hexCharacters_37049[(unint64_t)v275 >> 4];
        v276[1] = MSVFastHexStringFromBytes_hexCharacters_37049[v275 & 0xF];
      }
      v277 = objc_alloc(MEMORY[0x1E0CB3940]);
      v278 = v273;
      v279 = 40;
    }
    v299 = (void *)objc_msgSend(v277, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v278, v279, 4, 1);
    v280 = objc_msgSend(v299, "hash");

    return v280;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(_QWORD *)&data[0] != 1000)
    {
      if (*(_QWORD *)&data[0] != 2000)
        goto LABEL_371;
      return DWORD2(data[0]);
    }
    return *((_QWORD *)&data[0] + 1);
  }
  if (*(_QWORD *)&data[0] == 3000)
    return DWORD2(data[0]);
  if (*(_QWORD *)&data[0] != 3001)
  {
LABEL_371:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger _MSVHashGetHash(MSVHash)");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v301, "handleFailureInFunction:file:lineNumber:description:", v302, CFSTR("MSVHasher+Algorithms.h"), 301, CFSTR("Cannot obtain hash from unknown hasher algorithm"));

    return 0;
  }
  return *((_QWORD *)&data[0] + 1);
}

- (BOOL)isEqual:(id)a3
{
  ICStoreRequestContext *v4;
  ICStoreRequestContext *v5;
  ICUserIdentityStore *identityStore;
  ICUserIdentityStore *v7;
  ICUserIdentityStore *v8;
  ICUserIdentityStore *v9;
  _BOOL4 v10;
  BOOL v11;
  ICUserIdentity *delegatedIdentity;
  ICUserIdentityStore *v13;
  ICUserIdentity *v14;
  ICUserIdentity *v15;
  ICUserIdentityStore *v16;
  ICUserIdentityStore *v17;
  _BOOL4 v18;
  ICUserIdentity *identity;
  ICUserIdentityStore *v20;
  ICUserIdentityStore *v21;
  _BOOL4 v22;
  ICStoreDialogResponseHandler *storeDialogResponseHandler;
  ICStoreDialogResponseHandler *v25;
  ICStoreDialogResponseHandler *v26;
  ICStoreDialogResponseHandler *v27;
  _BOOL4 v28;
  objc_super v29;

  v4 = (ICStoreRequestContext *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICStoreRequestContext isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      v29.receiver = self;
      v29.super_class = (Class)ICStoreRequestContext;
      if (!-[ICRequestContext isEqual:](&v29, sel_isEqual_, v5))
        goto LABEL_22;
      identityStore = self->_identityStore;
      v7 = v5->_identityStore;
      if (identityStore == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identityStore;
        v10 = -[ICUserIdentityStore isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_22;
      }
      delegatedIdentity = v5->_delegatedIdentity;
      v13 = self->_identityStore;
      v14 = self->_delegatedIdentity;
      v15 = delegatedIdentity;
      v16 = v13;
      v17 = v16;
      if (v14 == v15)
      {

      }
      else
      {
        if (!v14 || !v15)
          goto LABEL_21;
        v18 = -[ICUserIdentity isEqualToIdentity:inStore:](v14, "isEqualToIdentity:inStore:", v15, v16);

        if (!v18)
          goto LABEL_22;
      }
      identity = v5->_identity;
      v20 = self->_identityStore;
      v14 = self->_identity;
      v15 = identity;
      v21 = v20;
      v17 = v21;
      if (v14 == v15)
      {

LABEL_26:
        storeDialogResponseHandler = self->_storeDialogResponseHandler;
        v25 = v5->_storeDialogResponseHandler;
        if (storeDialogResponseHandler == v25)
        {

        }
        else
        {
          v26 = v25;
          v27 = storeDialogResponseHandler;
          v28 = -[ICStoreDialogResponseHandler isEqual:](v27, "isEqual:", v26);

          if (!v28)
            goto LABEL_22;
        }
        if (!self->_allowsExpiredBags != v5->_allowsExpiredBags)
        {
          v11 = self->_personalizationStyle == v5->_personalizationStyle;
          goto LABEL_23;
        }
LABEL_22:
        v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      if (v14 && v15)
      {
        v22 = -[ICUserIdentity isEqualToIdentity:inStore:](v14, "isEqualToIdentity:inStore:", v15, v21);

        if (!v22)
          goto LABEL_22;
        goto LABEL_26;
      }
LABEL_21:

      goto LABEL_22;
    }
    v11 = 0;
  }
LABEL_24:

  return v11;
}

+ (id)activeStoreAccountRequestContext
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithIdentity:", v3);

  return v4;
}

@end
