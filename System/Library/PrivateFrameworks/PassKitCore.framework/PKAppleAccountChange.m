@implementation PKAppleAccountChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountChange)initWithEvent:(int64_t)a3 currentAccount:(id)a4 previousAccount:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  char v18;
  PKAppleAccountChange *v19;
  PKAppleAccountState *v20;
  PKAppleAccountState *currentState;
  PKAppleAccountState *v22;
  PKAppleAccountState *previousState;
  PKAppleAccountChange *v24;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
    v9 = v8;
  objc_msgSend(v9, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0C8F030];
  v14 = v12;
  v15 = v13;
  if (v14 != v15)
  {
    v16 = v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    if (v17)
    {

    }
    else
    {
      v18 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v18 & 1) != 0)
        goto LABEL_12;
    }
    v24 = 0;
    goto LABEL_16;
  }

LABEL_12:
  v26.receiver = self;
  v26.super_class = (Class)PKAppleAccountChange;
  v19 = -[PKAppleAccountChange init](&v26, sel_init);
  if (v19)
  {
    v19->_type = objc_msgSend((id)objc_opt_class(), "changeTypeToAccount:fromAccount:", v8, v10);
    v19->_event = a3;
    v20 = -[PKAppleAccountState initWithAccount:]([PKAppleAccountState alloc], "initWithAccount:", v8);
    currentState = v19->_currentState;
    v19->_currentState = v20;

    v22 = -[PKAppleAccountState initWithAccount:]([PKAppleAccountState alloc], "initWithAccount:", v10);
    previousState = v19->_previousState;
    v19->_previousState = v22;

  }
  self = v19;
  v24 = self;
LABEL_16:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v8 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("event"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_currentState, CFSTR("currentState"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_previousState, CFSTR("previousState"));

}

- (PKAppleAccountChange)initWithCoder:(id)a3
{
  id v4;
  PKAppleAccountChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKAppleAccountState *currentState;
  uint64_t v10;
  PKAppleAccountState *previousState;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAppleAccountChange;
  v5 = -[PKAppleAccountChange init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_event = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentState"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentState = v5->_currentState;
    v5->_currentState = (PKAppleAccountState *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousState"));
    v10 = objc_claimAutoreleasedReturnValue();
    previousState = v5->_previousState;
    v5->_previousState = (PKAppleAccountState *)v10;

  }
  return v5;
}

- (BOOL)didEnablementOfRelevantDataclassesChange
{
  return -[PKAppleAccountChange didEnablementOfWalletDataclassChange](self, "didEnablementOfWalletDataclassChange")
      || -[PKAppleAccountChange didEnablementOfUbiquityDataclassChange](self, "didEnablementOfUbiquityDataclassChange");
}

- (BOOL)didEnablementOfWalletDataclassChange
{
  BOOL v3;

  v3 = -[PKAppleAccountState isWalletDataclassEnabled](self->_currentState, "isWalletDataclassEnabled");
  return v3 ^ -[PKAppleAccountState isWalletDataclassEnabled](self->_previousState, "isWalletDataclassEnabled");
}

- (BOOL)didEnablementOfUbiquityDataclassChange
{
  BOOL v3;

  v3 = -[PKAppleAccountState isUbiquityDataclassEnabled](self->_currentState, "isUbiquityDataclassEnabled");
  return v3 ^ -[PKAppleAccountState isUbiquityDataclassEnabled](self->_previousState, "isUbiquityDataclassEnabled");
}

- (BOOL)didAccountManagedStateChange
{
  BOOL v3;

  v3 = -[PKAppleAccountState isManaged](self->_currentState, "isManaged");
  return v3 ^ -[PKAppleAccountState isManaged](self->_previousState, "isManaged");
}

- (BOOL)didAccountOrderChange
{
  BOOL v3;

  v3 = -[PKAppleAccountState isPrimary](self->_currentState, "isPrimary");
  return v3 ^ -[PKAppleAccountState isPrimary](self->_previousState, "isPrimary");
}

- (BOOL)shouldBeNotedByPassLibrary
{
  int64_t type;

  type = self->_type;
  if (type == 3)
    return -[PKAppleAccountChange event](self, "event") == 1;
  if (type != 2)
  {
    if (type == 1)
      return -[PKAppleAccountChange event](self, "event") == 2;
    return 0;
  }
  if (-[PKAppleAccountChange event](self, "event") != 2)
    return 0;
  return -[PKAppleAccountChange didEnablementOfRelevantDataclassesChange](self, "didEnablementOfRelevantDataclassesChange")|| -[PKAppleAccountChange didAccountManagedStateChange](self, "didAccountManagedStateChange")|| -[PKAppleAccountChange didAccountOrderChange](self, "didAccountOrderChange");
}

- (id)description
{
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  int64_t event;
  const __CFString *v6;

  v2 = self->_type - 1;
  if (v2 > 2)
    v3 = CFSTR("unsupported");
  else
    v3 = off_1E2ADBA98[v2];
  v4 = CFSTR("unknown");
  event = self->_event;
  if (event == 1)
    v4 = CFSTR("will-change");
  if (event == 2)
    v6 = CFSTR("did-change");
  else
    v6 = v4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("changeType: %@, event: %@, \n before - \n  %@,\n after - \n  %@,\n (will notify library: %i)"), v3, v6, self->_previousState, self->_currentState, -[PKAppleAccountChange shouldBeNotedByPassLibrary](self, "shouldBeNotedByPassLibrary"));
}

+ (int64_t)changeTypeToAccount:(id)a3 fromAccount:(id)a4
{
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  int64_t v9;

  v5 = *MEMORY[0x1E0CFAAE8];
  v6 = a4;
  v7 = objc_msgSend(a3, "aa_isAccountClass:", v5);
  v8 = objc_msgSend(v6, "aa_isAccountClass:", v5);

  v9 = 3;
  if (((v7 ^ 1) & v8) == 0)
    v9 = 0;
  if ((v7 & v8) != 0)
    v9 = 2;
  if (v7 ^ 1 | v8)
    return v9;
  else
    return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)event
{
  return self->_event;
}

- (PKAppleAccountState)currentState
{
  return self->_currentState;
}

- (PKAppleAccountState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end
