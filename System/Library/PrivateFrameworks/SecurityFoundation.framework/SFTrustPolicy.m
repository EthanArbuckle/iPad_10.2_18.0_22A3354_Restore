@implementation SFTrustPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)evaluateCertificateChain:(id)a3 error:(id *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trustPolicyInternal, 0);
}

@end
