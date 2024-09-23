@implementation ACFComponents

+ (id)components
{
  id v3;

  objc_sync_enter(a1);
  v3 = (id)sComponents;
  objc_sync_exit(a1);
  return v3;
}

+ (void)setComponents:(id)a3
{
  id v5;

  objc_sync_enter(a1);
  if ((objc_msgSend(a3, "isEqual:", sComponents) & 1) == 0)
  {
    v5 = (id)sComponents;
    sComponents = (uint64_t)a3;
  }
  objc_sync_exit(a1);
}

- (void)dealloc
{
  objc_super v3;

  -[ACFComponents setCryptograph:](self, "setCryptograph:", 0);
  -[ACFComponents setKeychainManager:](self, "setKeychainManager:", 0);
  -[ACFComponents setCertificateStoragePolicy:](self, "setCertificateStoragePolicy:", 0);
  -[ACFComponents setTransportClass:](self, "setTransportClass:", 0);
  -[ACFComponents setLocalAuthenticationContextClass:](self, "setLocalAuthenticationContextClass:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACFComponents;
  -[ACFComponents dealloc](&v3, sel_dealloc);
}

- (id)createTransport
{
  -[ACFComponents transportClass](self, "transportClass");
  return (id)objc_opt_new();
}

- (id)createLocalAuthenticationContext
{
  -[ACFComponents localAuthenticationContextClass](self, "localAuthenticationContextClass");
  return (id)objc_opt_new();
}

- (ACFKeychainManagerProtocol)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (ACFCryptographProtocol)cryptograph
{
  return self->_cryptograph;
}

- (void)setCryptograph:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (ACFCertificateStoragePolicy)certificateStoragePolicy
{
  return self->_certificateStoragePolicy;
}

- (void)setCertificateStoragePolicy:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (Class)transportClass
{
  return self->_transportClass;
}

- (void)setTransportClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (Class)localAuthenticationContextClass
{
  return self->_localAuthenticationContextClass;
}

- (void)setLocalAuthenticationContextClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
