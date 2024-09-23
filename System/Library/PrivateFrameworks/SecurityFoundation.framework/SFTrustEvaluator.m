@implementation SFTrustEvaluator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTrustEvaluator)init
{
  SFX509TrustPolicy *v3;
  SFTrustEvaluator *v4;

  v3 = objc_alloc_init(SFX509TrustPolicy);
  v4 = -[SFTrustEvaluator initWithTrustPolicy:](self, "initWithTrustPolicy:", v3);

  return v4;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3
{
  id v4;
  SFRevocationPolicy *v5;
  SFTrustEvaluator *v6;

  v4 = a3;
  v5 = objc_alloc_init(SFRevocationPolicy);
  v6 = -[SFTrustEvaluator initWithTrustPolicy:revocationPolicy:](self, "initWithTrustPolicy:revocationPolicy:", v4, v5);

  return v6;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4
{
  return -[SFTrustEvaluator initWithTrustPolicy:revocationPolicy:applicationAnchorCertificates:allowCertificateFetching:trustSystemAnchorCertificates:](self, "initWithTrustPolicy:revocationPolicy:applicationAnchorCertificates:allowCertificateFetching:trustSystemAnchorCertificates:", a3, a4, MEMORY[0x1E0C9AA60], 1, 1);
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4 applicationAnchorCertificates:(id)a5 allowCertificateFetching:(BOOL)a6 trustSystemAnchorCertificates:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  id v15;
  SFTrustEvaluator *v16;
  SFTrustEvaluator *v17;
  char v18;
  objc_super v20;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFTrustEvaluator;
  v16 = -[SFTrustEvaluator init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)v16->_trustEvaluatorInternal + 1, a3);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 2, a4);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 3, a5);
    *((_BYTE *)v17->_trustEvaluatorInternal + 32) = *((_BYTE *)v17->_trustEvaluatorInternal + 32) & 0xFE | a6;
    if (v7)
      v18 = 2;
    else
      v18 = 0;
    *((_BYTE *)v17->_trustEvaluatorInternal + 32) = *((_BYTE *)v17->_trustEvaluatorInternal + 32) & 0xFD | v18;
  }

  return v17;
}

- (SFTrustEvaluator)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFTrustEvaluator;
  return -[SFTrustEvaluator init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _QWORD *trustEvaluatorInternal;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  trustEvaluatorInternal = self->_trustEvaluatorInternal;
  return (id)objc_msgSend(v4, "initWithTrustPolicy:revocationPolicy:applicationAnchorCertificates:allowCertificateFetching:trustSystemAnchorCertificates:", trustEvaluatorInternal[1], trustEvaluatorInternal[2], trustEvaluatorInternal[3], trustEvaluatorInternal[4] & 1, (*((unsigned __int8 *)trustEvaluatorInternal + 32) >> 1) & 1);
}

- (SFTrustPolicy)trustPolicy
{
  return self->_trustPolicy;
}

- (void)setTrustPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFRevocationPolicy)revocationPolicy
{
  return self->_revocationPolicy;
}

- (void)setRevocationPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)applicationAnchorCertificates
{
  return self->_applicationAnchorCertificates;
}

- (void)setApplicationAnchorCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)allowCertificateFetching
{
  return self->_allowCertificateFetching;
}

- (void)setAllowCertificateFetching:(BOOL)a3
{
  self->_allowCertificateFetching = a3;
}

- (BOOL)trustSystemAnchorCertificates
{
  return self->_trustSystemAnchorCertificates;
}

- (void)setTrustSystemAnchorCertificates:(BOOL)a3
{
  self->_trustSystemAnchorCertificates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationAnchorCertificates, 0);
  objc_storeStrong((id *)&self->_revocationPolicy, 0);
  objc_storeStrong((id *)&self->_trustPolicy, 0);
  objc_storeStrong(&self->_trustEvaluatorInternal, 0);
}

@end
