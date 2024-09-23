@implementation PKPassShare

+ (id)createTaggedShare
{
  PKPassShare *v2;
  id v3;
  void *v4;

  v2 = objc_alloc_init(PKPassShare);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShare setIdentifier:](v2, "setIdentifier:", v4);

  -[PKPassShare setStatus:](v2, "setStatus:", 3);
  return v2;
}

- (PKPassShare)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassShare;
  return -[PKPassShare init](&v3, sel_init);
}

- (PKPassShare)initWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  NSString *v7;
  NSString *recipientNickname;
  NSString *v9;
  NSString *senderShareIdentifier;
  void *v11;
  NSDate *v12;
  NSDate *creationDate;
  int v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  PKPassSharedEntitlement *v23;
  NSObject *v24;
  uint64_t v25;
  NSArray *sharedEntitlements;
  PKPassShare *v27;
  PKPassShare *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_20;
  v35.receiver = self;
  v35.super_class = (Class)PKPassShare;
  self = -[PKPassShare init](&v35, sel_init);
  if (self)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("shareIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v5;

    if (self->_identifier)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("recipient"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      recipientNickname = self->_recipientNickname;
      self->_recipientNickname = v7;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("sender"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      senderShareIdentifier = self->_senderShareIdentifier;
      self->_senderShareIdentifier = v9;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_status = PKShareStatusFromString(v11);

      objc_msgSend(v4, "PKDateForKey:", CFSTR("creationDate"));
      v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
      creationDate = self->_creationDate;
      self->_creationDate = v12;

      v14 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("managementEnabled"));
      v15 = 2;
      if (!v14)
        v15 = 0;
      self->_manageability = v15;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = v4;
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sharedEntitlements"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v23 = -[PKPassSharedEntitlement initWithDictionary:]([PKPassSharedEntitlement alloc], "initWithDictionary:", v22);
            if (v23)
            {
              objc_msgSend(v16, "addObject:", v23);
            }
            else
            {
              PKLogFacilityTypeGetObject(0x20uLL);
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v37 = v22;
                _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "PKPassShare: Unable to create shared entitlement from %{private}@", buf, 0xCu);
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v19);
      }
      v25 = objc_msgSend(v16, "copy", self);
      self = v29;
      sharedEntitlements = v29->_sharedEntitlements;
      v29->_sharedEntitlements = (NSArray *)v25;

      v4 = v30;
      goto LABEL_19;
    }
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
LABEL_19:
  self = self;
  v27 = self;
LABEL_21:

  return v27;
}

- (PKPassShare)initWithSubcredentialDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *groupIdentifier;
  NSString *v7;
  NSString *senderShareIdentifier;
  NSString *v9;
  NSString *recipientNickname;
  void *v11;
  PKPassSharedEntitlement *v12;
  PKPassSharedEntitlement *v13;
  NSArray *v14;
  NSObject *p_super;
  PKPassShare *v16;
  void *v17;
  NSArray *v18;
  NSArray *credentialShares;
  NSArray *v20;
  NSObject *v21;
  _QWORD v23[4];
  PKPassShare *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v25.receiver = self;
    v25.super_class = (Class)PKPassShare;
    self = -[PKPassShare init](&v25, sel_init);
    if (!self)
    {
LABEL_15:
      self = self;
      v16 = self;
      goto LABEL_16;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("groupIdentifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    groupIdentifier = self->_groupIdentifier;
    self->_groupIdentifier = v5;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sharerGroupIdentifier"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    senderShareIdentifier = self->_senderShareIdentifier;
    self->_senderShareIdentifier = v7;

    objc_storeStrong((id *)&self->_identifier, self->_groupIdentifier);
    if (self->_identifier)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("friendlyName"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      recipientNickname = self->_recipientNickname;
      self->_recipientNickname = v9;

      self->_manageability = objc_msgSend(v4, "PKBoolForKey:", CFSTR("managementEnabled"));
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("entitlement"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKPassSharedEntitlement initWithSubcredentialDictionary:]([PKPassSharedEntitlement alloc], "initWithSubcredentialDictionary:", v11);
      v13 = v12;
      if (v12)
      {
        v28[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
        p_super = &self->_sharedEntitlements->super;
        self->_sharedEntitlements = v14;
      }
      else
      {
        PKLogFacilityTypeGetObject(0x20uLL);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v27 = v11;
          _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "PKPassShare: Unable to create shared entitlement from %{private}@", buf, 0xCu);
        }
      }

      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sharedKeysData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__PKPassShare_initWithSubcredentialDictionary___block_invoke;
      v23[3] = &unk_1E2AC5998;
      self = self;
      v24 = self;
      objc_msgSend(v17, "pk_arrayBySafelyApplyingBlock:", v23);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      credentialShares = self->_credentialShares;
      self->_credentialShares = v18;

      v20 = self->_credentialShares;
      if (!v20 || !-[NSArray count](v20, "count"))
      {

        PKLogFacilityTypeGetObject(0x20uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v27 = v11;
          _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "PKPassShare: Discarding subcredential share because missing shared key data from %{private}@", buf, 0xCu);
        }

        self = 0;
      }

      goto LABEL_15;
    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

PKPassCredentialShare *__47__PKPassShare_initWithSubcredentialDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  PKPassCredentialShare *v11;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  if (v4)
  {
    v5 = v4;
    v6 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v5;
    v7 = a2;
  }
  else
  {
    objc_msgSend(a2, "PKStringForKey:", CFSTR("sharerKeyID"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v9;
  }

  v11 = -[PKPassCredentialShare initWithSubcredentialDictionary:]([PKPassCredentialShare alloc], "initWithSubcredentialDictionary:", a2);
  return v11;
}

- (BOOL)appendCredentialShareDictionary:(id)a3 entitlements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  PKPassSharedEntitlement *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  PKPassShareTimeConfiguration *v31;
  PKPassShareTimeConfiguration *v32;
  uint64_t v33;
  NSArray *sharedEntitlements;
  void *v35;
  NSArray *credentialShares;
  id v37;
  PKPassCredentialShare *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  NSArray *v44;
  void *v45;
  uint64_t v47;
  PKPassShare *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  PKPassSharedEntitlement *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (!v6)
    goto LABEL_31;
  if (!v7)
    goto LABEL_31;
  v56 = 0;
  v10 = PKShareStatusFromCarKeyStatus(objc_msgSend(v6, "PKIntegerForKey:", CFSTR("status")), &v56);
  v9 = v56 == 0;
  if (v56)
    goto LABEL_31;
  v47 = v10;
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("keyConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PKStringForKey:", CFSTR("friendlyName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  -[PKPassShare setRecipientNickname:](self, "setRecipientNickname:", v12);

  v49 = v11;
  v13 = objc_msgSend(v11, "PKIntegerForKey:", CFSTR("rights"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (!v15)
    goto LABEL_25;
  v16 = v15;
  v17 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v53 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      objc_msgSend(v19, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 == v13)
      {
        v22 = objc_alloc_init(PKPassSharedEntitlement);
        objc_msgSend(v19, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassSharedEntitlement setEntitlementIdentifier:](v22, "setEntitlementIdentifier:", v23);

        objc_msgSend(v49, "PKDateForKey:", CFSTR("keyValidFrom"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "PKDateForKey:", CFSTR("keyValidTo"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v24, "compare:", v27) == 1;

          if (v26)
          {
LABEL_15:
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v26, "compare:", v29) == -1;

LABEL_18:
            if (v28 || v30)
            {
              v31 = objc_alloc_init(PKPassShareTimeConfiguration);
              v32 = v31;
              if (v28)
                -[PKPassShareTimeConfiguration setStartDate:](v31, "setStartDate:", v24);
              if (v30)
                -[PKPassShareTimeConfiguration setExpirationDate:](v32, "setExpirationDate:", v26);
              -[PKPassSharedEntitlement setTimeConfiguration:](v22, "setTimeConfiguration:", v32);

            }
            v57 = v22;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v33 = objc_claimAutoreleasedReturnValue();
            sharedEntitlements = v48->_sharedEntitlements;
            v48->_sharedEntitlements = (NSArray *)v33;

            goto LABEL_25;
          }
        }
        else
        {
          v28 = 0;
          if (v25)
            goto LABEL_15;
        }
        v30 = 0;
        goto LABEL_18;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v16)
      continue;
    break;
  }
LABEL_25:

  objc_msgSend(v6, "PKStringForKey:", CFSTR("keyID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  credentialShares = v48->_credentialShares;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __60__PKPassShare_appendCredentialShareDictionary_entitlements___block_invoke;
  v50[3] = &unk_1E2ADAF60;
  v37 = v35;
  v51 = v37;
  -[NSArray pk_firstObjectPassingTest:](credentialShares, "pk_firstObjectPassingTest:", v50);
  v38 = (PKPassCredentialShare *)objc_claimAutoreleasedReturnValue();
  v9 = 1;
  if (!v38)
  {
    v38 = objc_alloc_init(PKPassCredentialShare);
    -[PKPassCredentialShare setIdentifier:](v38, "setIdentifier:", v37);
    v39 = (void *)-[NSArray mutableCopy](v48->_credentialShares, "mutableCopy");
    v40 = v39;
    if (v39)
      v41 = v39;
    else
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = v41;

    objc_msgSend(v42, "addObject:", v38);
    v43 = objc_msgSend(v42, "copy");
    v44 = v48->_credentialShares;
    v48->_credentialShares = (NSArray *)v43;

  }
  objc_msgSend(v6, "PKStringForKey:", CFSTR("deviceType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassCredentialShare setTargetDevice:](v38, "setTargetDevice:", PKPassCredentialShareTargetDeviceFromString(v45));

  -[PKPassCredentialShare setStatus:](v38, "setStatus:", v47);
LABEL_31:

  return v9;
}

uint64_t __60__PKPassShare_appendCredentialShareDictionary_entitlements___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (NSUUID)uuidIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_identifier);
}

- (void)addCredentialShare:(id)a3
{
  NSArray *credentialShares;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  credentialShares = self->_credentialShares;
  v5 = a3;
  v6 = (void *)-[NSArray mutableCopy](credentialShares, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v8;

  objc_msgSend(v11, "addObject:", v5);
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  v10 = self->_credentialShares;
  self->_credentialShares = v9;

}

- (void)addCredentialShares:(id)a3
{
  NSArray *credentialShares;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  credentialShares = self->_credentialShares;
  v5 = a3;
  v6 = (void *)-[NSArray mutableCopy](credentialShares, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v8;

  objc_msgSend(v11, "addObjectsFromArray:", v5);
  v9 = (NSArray *)objc_msgSend(v11, "copy");
  v10 = self->_credentialShares;
  self->_credentialShares = v9;

}

- (void)setStatus:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    self->_status = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_credentialShares;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setStatus:", a3, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (unint64_t)status
{
  void *v3;
  unint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_credentialShares, "count"))
    return self->_status;
  -[NSArray firstObject](self->_credentialShares, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_credentialShares;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    if (v4 > 9)
      v8 = 1000;
    else
      v8 = qword_190456328[v4];
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "status", (_QWORD)v14);
        if (v11 != v4)
        {
          if (v11 > 9)
            v12 = 1000;
          else
            v12 = qword_190456328[v11];
          if (v12 < v8)
          {
            v4 = v11;
            v8 = v12;
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isSameUnderlyingShareAs:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSString *identifier;
  uint64_t v7;
  void *v8;
  char v9;
  BOOL v10;
  NSString *recipientHandle;
  NSString *groupIdentifier;
  uint64_t v13;
  void *v14;
  char v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  uint64_t v32;
  uint64_t v33;
  NSArray *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    identifier = self->_identifier;
    if (identifier)
    {
      objc_msgSend(v4, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = -[NSString isEqual:](identifier, "isEqual:", v7);

        if ((v9 & 1) != 0)
          goto LABEL_13;
      }
    }
    if ((recipientHandle = self->_recipientHandle) != 0
      && v5[7]
      && (-[NSString isEqual:](recipientHandle, "isEqual:") & 1) != 0
      || (groupIdentifier = self->_groupIdentifier) != 0
      && (objc_msgSend(v5, "groupIdentifier"), (v13 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v14 = (void *)v13,
          v15 = -[NSString isEqual:](groupIdentifier, "isEqual:", v13),
          v14,
          (v15 & 1) != 0))
    {
LABEL_13:
      v10 = 1;
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = self->_credentialShares;
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v33)
      {
        v17 = *(_QWORD *)v40;
        v34 = v16;
        v32 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v16);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v5, "credentialShares");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v36;
              do
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v36 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  objc_msgSend(v19, "identifier");
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    v27 = (void *)v26;
                    objc_msgSend(v25, "identifier");
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (v28)
                    {
                      v29 = (void *)v28;
                      v30 = objc_msgSend(v27, "isEqual:", v28);

                      if ((v30 & 1) != 0)
                      {

                        v10 = 1;
                        v16 = v34;
                        goto LABEL_35;
                      }
                    }
                    else
                    {

                    }
                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v22);
            }

            v16 = v34;
            v17 = v32;
          }
          v10 = 0;
          v33 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v33);
      }
      else
      {
        v10 = 0;
      }
LABEL_35:

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)mostRestrictiveShareability
{
  return PKSharedEntitlementsMostRestrictiveShareabilityForEntitlements(self->_sharedEntitlements);
}

- (BOOL)mostRestrictiveIntraAccountSharingEnabled
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sharedEntitlements;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "intraAccountSharingEnabled", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isLocalShare
{
  return -[NSArray pk_containsObjectPassingTest:](self->_credentialShares, "pk_containsObjectPassingTest:", &__block_literal_global_56_2);
}

BOOL __27__PKPassShare_isLocalShare__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "targetDevice") - 3) < 3;
}

- (BOOL)isRevokable
{
  unint64_t status;
  BOOL v3;
  uint64_t v4;

  status = self->_status;
  v3 = status > 9;
  v4 = (1 << status) & 0x340;
  return (v3 || v4 == 0) && self->_manageability != 0;
}

- (BOOL)isEditable
{
  unint64_t status;
  BOOL v3;
  uint64_t v4;

  status = self->_status;
  v3 = status > 9;
  v4 = (1 << status) & 0x340;
  return (v3 || v4 == 0) && self->_manageability > 1;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot set nil identifier on share"));
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (void)updateDisplayableSharedEntitlementsFromDisplayableEntitlements:(id)a3
{
  void *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *displayableSharedEntitlements;
  NSArray *v17;
  PKPassShare *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_61);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = self;
    v6 = self->_sharedEntitlements;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "entitlementIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");

          objc_msgSend(v14, "replaceEntitlementWithSharedEntitlement:", v11);
          objc_msgSend(v5, "safelyAddObject:", v14);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v15 = objc_msgSend(v5, "copy");
    displayableSharedEntitlements = v18->_displayableSharedEntitlements;
    v18->_displayableSharedEntitlements = (NSArray *)v15;

  }
  else
  {
    v17 = self->_displayableSharedEntitlements;
    self->_displayableSharedEntitlements = (NSArray *)MEMORY[0x1E0C9AA60];

  }
}

uint64_t __78__PKPassShare_updateDisplayableSharedEntitlementsFromDisplayableEntitlements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entitlementIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShare)initWithCoder:(id)a3
{
  id v4;
  PKPassShare *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *recipientNickname;
  uint64_t v11;
  NSString *senderShareIdentifier;
  uint64_t v13;
  NSDate *creationDate;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *sharedEntitlements;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *displayableSharedEntitlements;
  uint64_t v26;
  NSString *groupIdentifier;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *credentialShares;
  uint64_t v33;
  NSString *subcredentialIdentifier;
  uint64_t v35;
  NSString *recipientHandle;
  uint64_t v37;
  PKPassShareActivationOptions *activationOptions;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKPassShare;
  v5 = -[PKPassShare init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientNickname"));
    v9 = objc_claimAutoreleasedReturnValue();
    recipientNickname = v5->_recipientNickname;
    v5->_recipientNickname = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderShareIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    senderShareIdentifier = v5->_senderShareIdentifier;
    v5->_senderShareIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manageability"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_manageability = objc_msgSend(v15, "unsignedIntegerValue");

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("sharedEntitlement"));
    v19 = objc_claimAutoreleasedReturnValue();
    sharedEntitlements = v5->_sharedEntitlements;
    v5->_sharedEntitlements = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("displayableSharedEntitlements"));
    v24 = objc_claimAutoreleasedReturnValue();
    displayableSharedEntitlements = v5->_displayableSharedEntitlements;
    v5->_displayableSharedEntitlements = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("credentialShares"));
    v31 = objc_claimAutoreleasedReturnValue();
    credentialShares = v5->_credentialShares;
    v5->_credentialShares = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subcredentialIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientHandle"));
    v35 = objc_claimAutoreleasedReturnValue();
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationOptions"));
    v37 = objc_claimAutoreleasedReturnValue();
    activationOptions = v5->_activationOptions;
    v5->_activationOptions = (PKPassShareActivationOptions *)v37;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("status"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_recipientNickname, CFSTR("recipientNickname"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_senderShareIdentifier, CFSTR("senderShareIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_manageability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("manageability"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_sharedEntitlements, CFSTR("sharedEntitlement"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_displayableSharedEntitlements, CFSTR("displayableSharedEntitlements"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_credentialShares, CFSTR("credentialShares"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_subcredentialIdentifier, CFSTR("subcredentialIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_recipientHandle, CFSTR("recipientHandle"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_activationOptions, CFSTR("activationOptions"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKShareStatusToString(-[PKPassShare status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("recipientNickname: '%@'; "), self->_recipientNickname);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientHandle: '%@'; "), self->_recipientHandle);
  objc_msgSend(v6, "appendFormat:", CFSTR("senderShareIdentifier: '%@'; "), self->_senderShareIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("creationDate: '%@'; "), self->_creationDate);
  PKPassShareManageabilityToString(self->_manageability);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("manageability: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR("groupIdentifier: '%@'; "), self->_groupIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("credentialShares: '%@'; "), self->_credentialShares);
  objc_msgSend(v6, "appendFormat:", CFSTR("subcredentialIdentifier: '%@'; "), self->_subcredentialIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("activationOptions: '%@'; "), self->_activationOptions);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nsharedEntitlement: '%@'\n; "), self->_sharedEntitlements);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "addObject:");
  if (self->_recipientNickname)
    objc_msgSend(v4, "addObject:");
  if (self->_senderShareIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_creationDate)
    objc_msgSend(v4, "addObject:");
  if (self->_sharedEntitlements)
    objc_msgSend(v4, "addObject:");
  if (self->_groupIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_credentialShares)
    objc_msgSend(v4, "addObject:");
  if (self->_subcredentialIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->_recipientHandle)
    objc_msgSend(v4, "addObject:");
  if (self->_activationOptions)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_status - v5 + 32 * v5;
  v7 = self->_manageability - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassShare *v4;
  PKPassShare *v5;
  PKPassShare *v6;
  NSString *identifier;
  NSString *v8;
  unint64_t v9;
  NSString *recipientNickname;
  NSString *v11;
  NSString *senderShareIdentifier;
  NSString *v13;
  NSDate *creationDate;
  NSDate *v15;
  NSArray *sharedEntitlements;
  NSArray *v17;
  NSString *groupIdentifier;
  NSString *v19;
  NSArray *credentialShares;
  NSArray *v21;
  NSString *subcredentialIdentifier;
  NSString *v23;
  NSString *recipientHandle;
  NSString *v25;
  PKPassShareActivationOptions *activationOptions;
  PKPassShareActivationOptions *v27;

  v4 = (PKPassShare *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!self)
        {
LABEL_57:

          goto LABEL_58;
        }
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
            goto LABEL_56;
        }
        else if (identifier != v8)
        {
          goto LABEL_56;
        }
        v9 = -[PKPassShare status](self, "status");
        if (v9 == -[PKPassShare status](v6, "status"))
        {
          recipientNickname = self->_recipientNickname;
          v11 = v6->_recipientNickname;
          if (recipientNickname && v11)
          {
            if ((-[NSString isEqual:](recipientNickname, "isEqual:") & 1) == 0)
              goto LABEL_56;
          }
          else if (recipientNickname != v11)
          {
            goto LABEL_56;
          }
          senderShareIdentifier = self->_senderShareIdentifier;
          v13 = v6->_senderShareIdentifier;
          if (senderShareIdentifier && v13)
          {
            if ((-[NSString isEqual:](senderShareIdentifier, "isEqual:") & 1) == 0)
              goto LABEL_56;
          }
          else if (senderShareIdentifier != v13)
          {
            goto LABEL_56;
          }
          creationDate = self->_creationDate;
          v15 = v6->_creationDate;
          if (creationDate && v15)
          {
            if ((-[NSDate isEqual:](creationDate, "isEqual:") & 1) == 0)
              goto LABEL_56;
          }
          else if (creationDate != v15)
          {
            goto LABEL_56;
          }
          if (self->_manageability == v6->_manageability)
          {
            sharedEntitlements = self->_sharedEntitlements;
            v17 = v6->_sharedEntitlements;
            if (sharedEntitlements && v17)
            {
              if ((-[NSArray isEqual:](sharedEntitlements, "isEqual:") & 1) == 0)
                goto LABEL_56;
            }
            else if (sharedEntitlements != v17)
            {
              goto LABEL_56;
            }
            groupIdentifier = self->_groupIdentifier;
            v19 = v6->_groupIdentifier;
            if (groupIdentifier && v19)
            {
              if ((-[NSString isEqual:](groupIdentifier, "isEqual:") & 1) == 0)
                goto LABEL_56;
            }
            else if (groupIdentifier != v19)
            {
              goto LABEL_56;
            }
            credentialShares = self->_credentialShares;
            v21 = v6->_credentialShares;
            if (credentialShares && v21)
            {
              if ((-[NSArray isEqual:](credentialShares, "isEqual:") & 1) == 0)
                goto LABEL_56;
            }
            else if (credentialShares != v21)
            {
              goto LABEL_56;
            }
            subcredentialIdentifier = self->_subcredentialIdentifier;
            v23 = v6->_subcredentialIdentifier;
            if (subcredentialIdentifier && v23)
            {
              if ((-[NSString isEqual:](subcredentialIdentifier, "isEqual:") & 1) == 0)
                goto LABEL_56;
            }
            else if (subcredentialIdentifier != v23)
            {
              goto LABEL_56;
            }
            recipientHandle = self->_recipientHandle;
            v25 = v6->_recipientHandle;
            if (recipientHandle && v25)
            {
              if ((-[NSString isEqual:](recipientHandle, "isEqual:") & 1) != 0)
              {
LABEL_52:
                activationOptions = self->_activationOptions;
                v27 = v6->_activationOptions;
                if (activationOptions && v27)
                  LOBYTE(self) = -[PKPassShareActivationOptions isEqual:](activationOptions, "isEqual:");
                else
                  LOBYTE(self) = activationOptions == v27;
                goto LABEL_57;
              }
            }
            else if (recipientHandle == v25)
            {
              goto LABEL_52;
            }
          }
        }
LABEL_56:
        LOBYTE(self) = 0;
        goto LABEL_57;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_58:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassShare *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *recipientNickname;
  uint64_t v9;
  NSString *senderShareIdentifier;
  uint64_t v11;
  NSDate *creationDate;
  uint64_t v13;
  NSArray *sharedEntitlements;
  uint64_t v15;
  NSString *groupIdentifier;
  uint64_t v17;
  NSArray *credentialShares;
  uint64_t v19;
  NSString *subcredentialIdentifier;
  uint64_t v21;
  NSString *recipientHandle;
  uint64_t v23;
  PKPassShareActivationOptions *activationOptions;
  uint64_t v25;
  NSArray *displayableSharedEntitlements;

  v4 = -[PKPassShare init](+[PKPassShare allocWithZone:](PKPassShare, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v7 = -[NSString copy](self->_recipientNickname, "copy");
  recipientNickname = v4->_recipientNickname;
  v4->_recipientNickname = (NSString *)v7;

  v9 = -[NSString copy](self->_senderShareIdentifier, "copy");
  senderShareIdentifier = v4->_senderShareIdentifier;
  v4->_senderShareIdentifier = (NSString *)v9;

  v11 = -[NSDate copy](self->_creationDate, "copy");
  creationDate = v4->_creationDate;
  v4->_creationDate = (NSDate *)v11;

  v13 = -[NSArray copy](self->_sharedEntitlements, "copy");
  sharedEntitlements = v4->_sharedEntitlements;
  v4->_sharedEntitlements = (NSArray *)v13;

  v15 = -[NSString copy](self->_groupIdentifier, "copy");
  groupIdentifier = v4->_groupIdentifier;
  v4->_groupIdentifier = (NSString *)v15;

  v4->_status = self->_status;
  v4->_manageability = self->_manageability;
  v17 = -[NSArray copy](self->_credentialShares, "copy");
  credentialShares = v4->_credentialShares;
  v4->_credentialShares = (NSArray *)v17;

  v19 = -[NSString copy](self->_subcredentialIdentifier, "copy");
  subcredentialIdentifier = v4->_subcredentialIdentifier;
  v4->_subcredentialIdentifier = (NSString *)v19;

  v21 = -[NSString copy](self->_recipientHandle, "copy");
  recipientHandle = v4->_recipientHandle;
  v4->_recipientHandle = (NSString *)v21;

  v23 = -[PKPassShareActivationOptions copy](self->_activationOptions, "copy");
  activationOptions = v4->_activationOptions;
  v4->_activationOptions = (PKPassShareActivationOptions *)v23;

  v25 = -[NSArray copy](self->_displayableSharedEntitlements, "copy");
  displayableSharedEntitlements = v4->_displayableSharedEntitlements;
  v4->_displayableSharedEntitlements = (NSArray *)v25;

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)senderShareIdentifier
{
  return self->_senderShareIdentifier;
}

- (void)setSenderShareIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderShareIdentifier, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (unint64_t)manageability
{
  return self->_manageability;
}

- (void)setManageability:(unint64_t)a3
{
  self->_manageability = a3;
}

- (NSString)recipientNickname
{
  return self->_recipientNickname;
}

- (void)setRecipientNickname:(id)a3
{
  objc_storeStrong((id *)&self->_recipientNickname, a3);
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
  objc_storeStrong((id *)&self->_recipientHandle, a3);
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void)setSharedEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEntitlements, a3);
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (void)setDisplayableSharedEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, a3);
}

- (NSArray)credentialShares
{
  return self->_credentialShares;
}

- (void)setCredentialShares:(id)a3
{
  objc_storeStrong((id *)&self->_credentialShares, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (void)setSubcredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentialIdentifier, a3);
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void)setActivationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_activationOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialShares, 0);
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, 0);
  objc_storeStrong((id *)&self->_sharedEntitlements, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_recipientNickname, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_senderShareIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
