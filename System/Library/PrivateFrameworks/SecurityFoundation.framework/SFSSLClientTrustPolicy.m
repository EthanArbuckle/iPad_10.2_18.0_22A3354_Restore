@implementation SFSSLClientTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLClientTrustPolicy)initWithClientName:(id)a3
{
  id v4;
  SFSSLClientTrustPolicy *v5;
  uint64_t v6;
  _QWORD *sslClientTrustPolicyInternal;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSSLClientTrustPolicy;
  v5 = -[SFSSLClientTrustPolicy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sslClientTrustPolicyInternal = v5->_sslClientTrustPolicyInternal;
    v8 = (void *)sslClientTrustPolicyInternal[1];
    sslClientTrustPolicyInternal[1] = v6;

  }
  return v5;
}

- (SFSSLClientTrustPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSSLClientTrustPolicy;
  return -[SFSSLClientTrustPolicy init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSSLClientTrustPolicy;
  v4 = -[SFTrustPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setClientName:", *((_QWORD *)self->_sslClientTrustPolicyInternal + 1));
  return v4;
}

- (NSString)clientName
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_sslClientTrustPolicyInternal + 1), "copy");
}

- (void)setClientName:(id)a3
{
  uint64_t v4;
  _QWORD *sslClientTrustPolicyInternal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  sslClientTrustPolicyInternal = self->_sslClientTrustPolicyInternal;
  v6 = (void *)sslClientTrustPolicyInternal[1];
  sslClientTrustPolicyInternal[1] = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sslClientTrustPolicyInternal, 0);
}

@end
