@implementation ICConnectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberStoreID, 0);
  objc_storeStrong((id *)&self->_purchaseClientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryBagKey, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)encodeWithCoder:(id)a3
{
  ICUserIdentity *userIdentity;
  ICUserIdentityStore *userIdentityStore;
  id v6;

  userIdentity = self->_userIdentity;
  userIdentityStore = self->_userIdentityStore;
  v6 = a3;
  objc_msgSend(v6, "ic_encodeUserIdentity:withStore:forKey:", userIdentity, userIdentityStore, CFSTR("userIdentity"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userIdentityStore, CFSTR("userIdentityStore"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_libraryBagKey, CFSTR("libraryBagKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_buildIdentifier, CFSTR("buildIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_purchaseClientIdentifier, CFSTR("purchaseClientIdentifier"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_requestReason, CFSTR("requestReason"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_familyMemberStoreID, CFSTR("familyMemberStoreID"));
  objc_msgSend(v6, "encodeTCCIdentity:forKey:", self->_clientIdentity, CFSTR("tccUserIdentity"));

}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (ICConnectionConfiguration)init
{
  void *v3;
  void *v4;
  ICConnectionConfiguration *v5;

  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](self, "initWithUserIdentity:userIdentityStore:", v3, v4);

  return v5;
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICConnectionConfiguration *v9;

  v6 = a4;
  v7 = a3;
  MSVTCCIdentityForCurrentProcess();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:clientIdentity:](self, "initWithUserIdentity:userIdentityStore:clientIdentity:", v7, v6, v8);

  return v9;
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4 clientIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICConnectionConfiguration *v12;
  ICConnectionConfiguration *v13;
  __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;
  NSString *buildIdentifier;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *purchaseClientIdentifier;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ICConnectionConfiguration;
  v12 = -[ICConnectionConfiguration init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentity, a3);
    objc_storeStrong((id *)&v13->_userIdentityStore, a4);
    objc_storeStrong((id *)&v13->_clientIdentity, a5);
    v14 = (__CFString *)MGCopyAnswer();
    if (!-[__CFString length](v14, "length"))
    {

      v14 = CFSTR("UNKNOWN");
    }
    v15 = _os_feature_enabled_impl();
    v16 = CFSTR("1.5");
    if (v15)
      v16 = CFSTR("1.6");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v16, v14);
    v17 = objc_claimAutoreleasedReturnValue();
    buildIdentifier = v13->_buildIdentifier;
    v13->_buildIdentifier = (NSString *)v17;

    v19 = (void *)MEMORY[0x1E0CB3940];
    ICGetCloudDAAPClientPrefix();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@%@"), CFSTR("1.2"), v20, v14);
    v21 = objc_claimAutoreleasedReturnValue();
    purchaseClientIdentifier = v13->_purchaseClientIdentifier;
    v13->_purchaseClientIdentifier = (NSString *)v21;

    v13->_requestReason = 0;
  }

  return v13;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (ICConnectionConfiguration)initWithCoder:(id)a3
{
  id v4;
  ICConnectionConfiguration *v5;
  uint64_t v6;
  ICUserIdentity *userIdentity;
  uint64_t v8;
  ICUserIdentityStore *userIdentityStore;
  uint64_t v10;
  NSURL *baseURL;
  uint64_t v12;
  NSString *libraryBagKey;
  uint64_t v14;
  NSString *buildIdentifier;
  uint64_t v16;
  NSString *purchaseClientIdentifier;
  uint64_t v18;
  NSNumber *familyMemberStoreID;
  uint64_t v20;
  OS_tcc_identity *clientIdentity;

  v4 = a3;
  v5 = -[ICConnectionConfiguration init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentityStore"));
    v8 = objc_claimAutoreleasedReturnValue();
    userIdentityStore = v5->_userIdentityStore;
    v5->_userIdentityStore = (ICUserIdentityStore *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryBagKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    libraryBagKey = v5->_libraryBagKey;
    v5->_libraryBagKey = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    buildIdentifier = v5->_buildIdentifier;
    v5->_buildIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseClientIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    purchaseClientIdentifier = v5->_purchaseClientIdentifier;
    v5->_purchaseClientIdentifier = (NSString *)v16;

    v5->_requestReason = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyMemberStoreID"));
    v18 = objc_claimAutoreleasedReturnValue();
    familyMemberStoreID = v5->_familyMemberStoreID;
    v5->_familyMemberStoreID = (NSNumber *)v18;

    objc_msgSend(v4, "decodeTCCIdentityForKey:", CFSTR("tccUserIdentity"));
    v20 = objc_claimAutoreleasedReturnValue();
    clientIdentity = v5->_clientIdentity;
    v5->_clientIdentity = (OS_tcc_identity *)v20;

  }
  return v5;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (NSString)purchaseClientIdentifier
{
  return self->_purchaseClientIdentifier;
}

- (NSNumber)familyMemberStoreID
{
  return self->_familyMemberStoreID;
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3
{
  id v4;
  void *v5;
  ICConnectionConfiguration *v6;

  v4 = a3;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](self, "initWithUserIdentity:userIdentityStore:", v4, v5);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [userIdentity:%@]>"), v5, self, self->_userIdentity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  unint64_t v18;

  -[ICConnectionConfiguration userIdentity](self, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICConnectionConfiguration userIdentityStore](self, "userIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hashInStore:", v4);
  -[ICConnectionConfiguration userIdentityStore](self, "userIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;
  -[ICConnectionConfiguration baseURL](self, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[ICConnectionConfiguration libraryBagKey](self, "libraryBagKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  -[ICConnectionConfiguration buildIdentifier](self, "buildIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[ICConnectionConfiguration purchaseClientIdentifier](self, "purchaseClientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  v16 = v11 ^ v15 ^ -[ICConnectionConfiguration requestReason](self, "requestReason");
  -[ICConnectionConfiguration familyMemberStoreID](self, "familyMemberStoreID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  ICConnectionConfiguration *v4;
  ICConnectionConfiguration *v5;
  id v6;
  id v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  int64_t v36;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;

  v4 = (ICConnectionConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICConnectionConfiguration userIdentityStore](self, "userIdentityStore");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration userIdentityStore](v5, "userIdentityStore");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_43:

          goto LABEL_44;
        }
      }
      -[ICConnectionConfiguration userIdentity](self, "userIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration userIdentity](v5, "userIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration userIdentityStore](self, "userIdentityStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v14 = v11;
      v15 = v12;
      v16 = v15;
      v49 = v6;
      if (v13 == v14)
      {

      }
      else
      {
        LOBYTE(v9) = 0;
        v17 = v15;
        v18 = v14;
        v19 = v13;
        if (!v13 || !v14)
          goto LABEL_40;
        v20 = objc_msgSend(v13, "isEqualToIdentity:inStore:", v14, v15);

        if (!v20)
        {
          LOBYTE(v9) = 0;
LABEL_42:
          v6 = v49;

          goto LABEL_43;
        }
      }
      -[ICConnectionConfiguration baseURL](self, "baseURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration baseURL](v5, "baseURL");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v19 != (void *)v48)
      {
        -[ICConnectionConfiguration baseURL](self, "baseURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICConnectionConfiguration baseURL](v5, "baseURL");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          LOBYTE(v9) = 0;
LABEL_39:

          v18 = (id)v48;
          v17 = v46;
LABEL_40:
          v25 = v19;

          v19 = v18;
          goto LABEL_41;
        }
      }
      -[ICConnectionConfiguration libraryBagKey](self, "libraryBagKey");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration libraryBagKey](v5, "libraryBagKey");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v23;
      v44 = v22;
      if (v22 == v23)
      {

      }
      else
      {
        v24 = v23;
        v9 = objc_msgSend(v22, "isEqual:", v23);

        if (!v9)
        {

          if (v19 != (void *)v48)
            goto LABEL_39;
LABEL_21:
          v25 = v19;
LABEL_41:

          goto LABEL_42;
        }
      }
      -[ICConnectionConfiguration buildIdentifier](self, "buildIdentifier");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration buildIdentifier](v5, "buildIdentifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v47 = v26;
      v42 = v27;
      if (v26 == v27)
      {

      }
      else
      {
        v28 = v27;
        v9 = objc_msgSend(v47, "isEqual:", v27);

        if (!v9)
        {
          v29 = (void *)v48;
          goto LABEL_38;
        }
      }
      -[ICConnectionConfiguration purchaseClientIdentifier](self, "purchaseClientIdentifier");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration purchaseClientIdentifier](v5, "purchaseClientIdentifier");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v31;
      v41 = v30;
      if (v30 == v31)
      {

      }
      else
      {
        v32 = v31;
        v9 = objc_msgSend(v30, "isEqual:", v31);

        if (!v9)
        {
          v29 = (void *)v48;
LABEL_37:

LABEL_38:
          if (v19 != v29)
            goto LABEL_39;
          goto LABEL_21;
        }
      }
      -[ICConnectionConfiguration familyMemberStoreID](self, "familyMemberStoreID");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[ICConnectionConfiguration familyMemberStoreID](v5, "familyMemberStoreID");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v34;
      if (v33 == v34)
      {

      }
      else
      {
        v35 = v34;
        v38 = objc_msgSend(v33, "isEqual:", v34);

        if (!v38)
        {
          LOBYTE(v9) = 0;
LABEL_36:
          v29 = (void *)v48;

          goto LABEL_37;
        }
      }
      v36 = -[ICConnectionConfiguration requestReason](self, "requestReason");
      LOBYTE(v9) = v36 == -[ICConnectionConfiguration requestReason](v5, "requestReason");
      goto LABEL_36;
    }
    LOBYTE(v9) = 0;
  }
LABEL_44:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICConnectionConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = [ICConnectionConfiguration alloc];
  -[ICConnectionConfiguration userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICConnectionConfiguration userIdentityStore](self, "userIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICConnectionConfiguration initWithUserIdentity:userIdentityStore:](v4, "initWithUserIdentity:userIdentityStore:", v5, v6);

  v8 = -[NSURL copy](self->_baseURL, "copy");
  v9 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v8;

  v10 = -[NSString copy](self->_libraryBagKey, "copy");
  v11 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v10;

  v12 = -[NSString copy](self->_buildIdentifier, "copy");
  v13 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v12;

  v14 = -[NSString copy](self->_purchaseClientIdentifier, "copy");
  v15 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v14;

  *(_QWORD *)(v7 + 64) = self->_requestReason;
  objc_storeStrong((id *)(v7 + 72), self->_familyMemberStoreID);
  objc_storeStrong((id *)(v7 + 24), self->_clientIdentity);
  return (id)v7;
}

- (void)setUserIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)libraryBagKey
{
  return self->_libraryBagKey;
}

- (void)setLibraryBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBuildIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPurchaseClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (void)setFamilyMemberStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

+ (id)configurationFromSourceConfiguration:(id)a3 userIdentity:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "setUserIdentity:", v5);

  return v6;
}

@end
