@implementation SFAuthenticateAccountsServiceConfiguration

- (SFAuthenticateAccountsServiceConfiguration)init
{
  char *v2;
  char *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAuthenticateAccountsServiceConfiguration;
  v2 = -[SFAuthenticateAccountsServiceConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)(v2 + 12) = 0x700000000;
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = 0;

    *((_WORD *)v3 + 4) = 0;
  }
  return (SFAuthenticateAccountsServiceConfiguration *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SFAuthenticateAccountsServiceConfiguration *v4;
  uint64_t v5;
  NSSet *existingAccountsIdentifiers;

  v4 = objc_alloc_init(SFAuthenticateAccountsServiceConfiguration);
  v4->_serviceType = self->_serviceType;
  v4->_targetedAccountTypes = self->_targetedAccountTypes;
  v5 = -[NSSet copy](self->_existingAccountsIdentifiers, "copy");
  existingAccountsIdentifiers = v4->_existingAccountsIdentifiers;
  v4->_existingAccountsIdentifiers = (NSSet *)v5;

  v4->_isHomeSharingSetupNeeded = self->_isHomeSharingSetupNeeded;
  v4->_isHomeKitSetupNeeded = self->_isHomeKitSetupNeeded;
  return v4;
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned int)a3
{
  self->_serviceType = a3;
}

- (unsigned)targetedAccountTypes
{
  return self->_targetedAccountTypes;
}

- (void)setTargetedAccountTypes:(unsigned int)a3
{
  self->_targetedAccountTypes = a3;
}

- (NSSet)existingAccountsIdentifiers
{
  return self->_existingAccountsIdentifiers;
}

- (void)setExistingAccountsIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isHomeSharingSetupNeeded
{
  return self->_isHomeSharingSetupNeeded;
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  self->_isHomeSharingSetupNeeded = a3;
}

- (BOOL)isHomeKitSetupNeeded
{
  return self->_isHomeKitSetupNeeded;
}

- (void)setIsHomeKitSetupNeeded:(BOOL)a3
{
  self->_isHomeKitSetupNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccountsIdentifiers, 0);
}

@end
