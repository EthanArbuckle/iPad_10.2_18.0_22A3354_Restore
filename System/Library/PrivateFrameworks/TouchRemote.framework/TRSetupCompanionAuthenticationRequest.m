@implementation TRSetupCompanionAuthenticationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ACAccount *account;
  AKDevice *companionDevice;
  NSSet *targetedAccountServices;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupCompanionAuthenticationRequest;
  -[TRMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  account = self->_account;
  if (account)
    objc_msgSend(v4, "encodeObject:forKey:", account, CFSTR("TRSetupAuthenticationMessages_ac"));
  companionDevice = self->_companionDevice;
  if (companionDevice)
    objc_msgSend(v4, "encodeObject:forKey:", companionDevice, CFSTR("TRSetupAuthenticationMessages_cD"));
  targetedAccountServices = self->_targetedAccountServices;
  if (targetedAccountServices)
    objc_msgSend(v4, "encodeObject:forKey:", targetedAccountServices, CFSTR("TRSetupAuthenticationMessages_tAS"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldUseAIDA, CFSTR("TRSetupAuthenticationMessages_sUA"));

}

- (TRSetupCompanionAuthenticationRequest)initWithCoder:(id)a3
{
  id v4;
  TRSetupCompanionAuthenticationRequest *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  AKDevice *companionDevice;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *targetedAccountServices;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRSetupCompanionAuthenticationRequest;
  v5 = -[TRMessage initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupAuthenticationMessages_ac"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRSetupAuthenticationMessages_cD"));
    v8 = objc_claimAutoreleasedReturnValue();
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("TRSetupAuthenticationMessages_tAS"));
    v13 = objc_claimAutoreleasedReturnValue();
    targetedAccountServices = v5->_targetedAccountServices;
    v5->_targetedAccountServices = (NSSet *)v13;

    v5->_shouldUseAIDA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TRSetupAuthenticationMessages_sUA"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  ACAccount *account;
  AKDevice *companionDevice;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  account = self->_account;
  companionDevice = self->_companionDevice;
  _StringFromAccountServices(self->_targetedAccountServices);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_shouldUseAIDA)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("account:[-%@-] companionDevice:[-%@-] targetedAccountServices:%@ shouldUseAIDA:[-%@-]"), account, companionDevice, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)TRSetupCompanionAuthenticationRequest;
  -[TRMessage description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSSet)targetedAccountServices
{
  return self->_targetedAccountServices;
}

- (void)setTargetedAccountServices:(id)a3
{
  objc_storeStrong((id *)&self->_targetedAccountServices, a3);
}

- (AKDevice)companionDevice
{
  return self->_companionDevice;
}

- (void)setCompanionDevice:(id)a3
{
  objc_storeStrong((id *)&self->_companionDevice, a3);
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionDevice, 0);
  objc_storeStrong((id *)&self->_targetedAccountServices, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
