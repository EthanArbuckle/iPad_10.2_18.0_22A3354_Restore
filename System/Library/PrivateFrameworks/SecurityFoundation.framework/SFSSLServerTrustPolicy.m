@implementation SFSSLServerTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLServerTrustPolicy)initWithServerName:(id)a3
{
  id v4;
  SFSSLServerTrustPolicy *v5;
  uint64_t v6;
  _QWORD *sslServerTrustPolicyInternal;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSSLServerTrustPolicy;
  v5 = -[SFSSLServerTrustPolicy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sslServerTrustPolicyInternal = v5->_sslServerTrustPolicyInternal;
    v8 = (void *)sslServerTrustPolicyInternal[1];
    sslServerTrustPolicyInternal[1] = v6;

  }
  return v5;
}

- (SFSSLServerTrustPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSSLServerTrustPolicy;
  return -[SFSSLServerTrustPolicy init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSSLServerTrustPolicy;
  v4 = -[SFTrustPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setServerName:", *((_QWORD *)self->_sslServerTrustPolicyInternal + 1));
  return v4;
}

- (NSString)serverName
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_sslServerTrustPolicyInternal + 1), "copy");
}

- (void)setServerName:(id)a3
{
  uint64_t v4;
  _QWORD *sslServerTrustPolicyInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  sslServerTrustPolicyInternal = self->_sslServerTrustPolicyInternal;
  v6 = (void *)sslServerTrustPolicyInternal[1];
  sslServerTrustPolicyInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sslServerTrustPolicyInternal, 0);
}

@end
