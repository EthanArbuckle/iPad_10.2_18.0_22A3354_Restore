@implementation PKACAccountChange

- (PKACAccountChange)initWithChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5
{
  return -[PKACAccountChange initWithChangeType:event:newAccount:oldAccount:](self, "initWithChangeType:event:newAccount:oldAccount:", *(_QWORD *)&a3, 0, a4, a5);
}

- (PKACAccountChange)initWithChangeType:(int)a3 event:(int64_t)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  PKACAccountChange *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  char v39;
  PKACAccountChange *v40;
  NSObject *v42;
  objc_super v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v8 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v43.receiver = self;
  v43.super_class = (Class)PKACAccountChange;
  v12 = -[PKACAccountChange init](&v43, sel_init);
  if (!v12)
  {
LABEL_25:
    v40 = v12;
    goto LABEL_26;
  }
  if (v10)
    v13 = v10;
  else
    v13 = v11;
  v14 = v13;
  objc_msgSend(v14, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0C8F030];
  v18 = v16;
  v19 = v17;
  if (v18 == v19)
  {
    v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v20 = v19;
  if (v18 && v19)
  {
    v21 = objc_msgSend(v18, "isEqualToString:", v19);

    if ((v21 & 1) != 0)
    {
      v22 = 0;
LABEL_19:
      v12->_type = v22;
      v12->_operation = -[PKACAccountChange _operationTypeForChangeType:newAccount:oldAccount:](v12, "_operationTypeForChangeType:newAccount:oldAccount:", v8, v10, v11);
      v12->_event = a4;
      v28 = *MEMORY[0x1E0C8EF10];
      v29 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF10]);
      v12->_enablementOfWalletDataclassChanged = v29 ^ objc_msgSend(v11, "isEnabledForDataclass:", v28);
      v30 = *MEMORY[0x1E0C8EF28];
      v31 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF28]);
      v12->_enablementOfUbiquityDataclassChanged = v31 ^ objc_msgSend(v11, "isEnabledForDataclass:", v30);
      LOBYTE(v30) = objc_msgSend(v10, "aa_isManagedAppleID");
      v12->_accountManagedStateChanged = v30 ^ objc_msgSend(v11, "aa_isManagedAppleID");
      v32 = *MEMORY[0x1E0CFAAE8];
      v33 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
      v12->_accountOrderChanged = v33 ^ objc_msgSend(v11, "aa_isAccountClass:", v32);
      objc_msgSend(v10, "ams_storefront");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ams_storefront");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      v37 = v35;
      v38 = v37;
      if (v36 == v37)
      {
        v39 = 0;
      }
      else
      {
        v39 = 1;
        if (v36 && v37)
          v39 = objc_msgSend(v36, "isEqualToString:", v37) ^ 1;
      }

      v12->_accountStorefrontChanged = v39;
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v14, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)*MEMORY[0x1E0C8F170];
  v18 = v23;
  v25 = v24;
  if (v18 == v25)
  {
    v22 = 1;
    goto LABEL_18;
  }
  v26 = v25;
  if (v18 && v25)
  {
    v27 = objc_msgSend(v18, "isEqualToString:", v25);

    if ((v27 & 1) != 0)
    {
      v22 = 1;
      goto LABEL_19;
    }
  }
  else
  {

  }
  PKLogFacilityTypeGetObject(0);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v14;
    _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, "Error: attempted to initialize PKACAccountChange for unknown account type %@", buf, 0xCu);
  }

  v40 = 0;
LABEL_26:

  return v40;
}

- (BOOL)enablementOfRelevantDataclassesChanged
{
  return self->_enablementOfWalletDataclassChanged || self->_enablementOfUbiquityDataclassChanged;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKACAccountChange)initWithCoder:(id)a3
{
  id v4;
  PKACAccountChange *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKACAccountChange;
  v5 = -[PKACAccountChange init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_operation = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_event = objc_msgSend(v8, "integerValue");

    v5->_enablementOfWalletDataclassChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("walletDataclassChanged"));
    v5->_enablementOfUbiquityDataclassChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ubiquityDataclassChanged"));
    v5->_accountManagedStateChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("managedStateChanged"));
    v5->_accountOrderChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("orderChanged"));
    v5->_accountStorefrontChanged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("storefrontChanged"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v9 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_operation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("operation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("event"));

  objc_msgSend(v9, "encodeBool:forKey:", self->_enablementOfWalletDataclassChanged, CFSTR("walletDataclassChanged"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_enablementOfUbiquityDataclassChanged, CFSTR("ubiquityDataclassChanged"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_accountManagedStateChanged, CFSTR("managedStateChanged"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_accountOrderChanged, CFSTR("orderChanged"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_accountStorefrontChanged, CFSTR("storefrontChanged"));

}

- (id)description
{
  id result;
  int64_t type;
  const __CFString *v5;
  unint64_t operation;
  unint64_t event;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  result = (id)MEMORY[0x1E0CB3940];
  type = self->_type;
  if (type)
  {
    if (type != 1)
    {
LABEL_23:
      __break(1u);
      return result;
    }
    v5 = CFSTR("itunesstore");
  }
  else
  {
    v5 = CFSTR("appleaccount");
  }
  operation = self->_operation;
  if (operation >= 4)
    goto LABEL_23;
  event = self->_event;
  if (event >= 3)
    goto LABEL_23;
  v8 = off_1E2ADA400[operation];
  v9 = off_1E2ADA420[event];
  if (self->_enablementOfWalletDataclassChanged)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_enablementOfUbiquityDataclassChanged)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_accountManagedStateChanged)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_accountOrderChanged)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_accountStorefrontChanged)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %@, operation: %@, event: %@, wallet dataclass changed: %@, ubiquity dataclass changed: %@, managed state changed: %@, order changed: %@, storefront changed: %@"), v5, v8, v9, v10, v11, v12, v13, v14);
}

- (int64_t)_operationTypeForChangeType:(int)a3 newAccount:(id)a4 oldAccount:(id)a5
{
  id v8;
  id v9;
  int64_t type;
  uint64_t v11;
  int v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a4;
  v9 = a5;
  type = self->_type;
  if (type == 1)
  {
    v15 = (a3 - 1);
    if (v15 <= 2)
      v14 = v15 + 1;
    else
      v14 = 0;
  }
  else if (type)
  {
    v14 = 0;
  }
  else
  {
    v11 = *MEMORY[0x1E0CFAAE8];
    v12 = objc_msgSend(v8, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
    v13 = objc_msgSend(v9, "aa_isAccountClass:", v11);
    if (((v12 ^ 1) & 1) != 0 || v13)
    {
      v16 = 3;
      if (((v12 ^ 1) & v13) == 0)
        v16 = 0;
      if ((v12 & v13) != 0)
        v14 = 2;
      else
        v14 = v16;
    }
    else
    {
      v14 = 1;
    }
  }

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)operation
{
  return self->_operation;
}

- (int64_t)event
{
  return self->_event;
}

- (BOOL)enablementOfWalletDataclassChanged
{
  return self->_enablementOfWalletDataclassChanged;
}

- (BOOL)enablementOfUbiquityDataclassChanged
{
  return self->_enablementOfUbiquityDataclassChanged;
}

- (BOOL)accountManagedStateChanged
{
  return self->_accountManagedStateChanged;
}

- (BOOL)accountOrderChanged
{
  return self->_accountOrderChanged;
}

- (BOOL)accountStorefrontChanged
{
  return self->_accountStorefrontChanged;
}

@end
