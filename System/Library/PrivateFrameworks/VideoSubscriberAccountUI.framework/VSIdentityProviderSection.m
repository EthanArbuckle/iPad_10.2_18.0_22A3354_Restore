@implementation VSIdentityProviderSection

- (VSIdentityProviderSection)init
{
  VSIdentityProviderSection *v2;
  VSIdentityProviderSection *v3;
  NSArray *identityProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderSection;
  v2 = -[VSIdentityProviderSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identityProviders = v2->_identityProviders;
    v2->_identityProviders = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (void)setIdentityProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityProviders, 0);
}

@end
