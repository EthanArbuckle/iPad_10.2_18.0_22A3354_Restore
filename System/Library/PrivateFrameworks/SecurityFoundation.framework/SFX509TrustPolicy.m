@implementation SFX509TrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFX509TrustPolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFX509TrustPolicy;
  return -[SFX509TrustPolicy init](&v3, sel_init);
}

- (SFX509TrustPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFX509TrustPolicy;
  return -[SFX509TrustPolicy init](&v4, sel_init, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_x509TrustPolicyInternal, 0);
}

@end
