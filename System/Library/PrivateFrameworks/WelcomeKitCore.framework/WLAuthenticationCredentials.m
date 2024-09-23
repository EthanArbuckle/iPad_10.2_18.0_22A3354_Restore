@implementation WLAuthenticationCredentials

+ (id)generateAuthenticationCredentialsContainingSelfSignedCertificate
{
  WLAuthenticationCredentials *v2;
  dispatch_semaphore_t v3;
  WLAuthenticationCredentials *v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  WLAuthenticationCredentials *v7;
  _QWORD v9[4];
  WLAuthenticationCredentials *v10;
  dispatch_semaphore_t v11;

  v2 = objc_alloc_init(WLAuthenticationCredentials);
  v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__WLAuthenticationCredentials_generateAuthenticationCredentialsContainingSelfSignedCertificate__block_invoke;
  v9[3] = &unk_24E376458;
  v4 = v2;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  +[WLAuthenticationUtilities generateSelfSignedCertificateWithOrganization:commonName:completion:](WLAuthenticationUtilities, "generateSelfSignedCertificateWithOrganization:commonName:completion:", CFSTR("Apple Inc"), CFSTR("iOS Migration"), v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = v11;
  v7 = v4;

  return v7;
}

intptr_t __95__WLAuthenticationCredentials_generateAuthenticationCredentialsContainingSelfSignedCertificate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "setLocalCertificate:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPublicKey:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setPrivateKey:", a4);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecCertificate)localCertificate
{
  return self->_localCertificate;
}

- (void)setLocalCertificate:(__SecCertificate *)a3
{
  self->_localCertificate = a3;
}

- (__SecCertificate)remoteCertificate
{
  return self->_remoteCertificate;
}

- (void)setRemoteCertificate:(__SecCertificate *)a3
{
  self->_remoteCertificate = a3;
}

@end
