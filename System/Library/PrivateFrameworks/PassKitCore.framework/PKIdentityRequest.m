@implementation PKIdentityRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_descriptor)
    objc_msgSend(v3, "appendFormat:", CFSTR("descriptor: %@, "), self->_descriptor);
  if (self->_nonce)
    objc_msgSend(v4, "appendFormat:", CFSTR("nonce: %@, "), self->_nonce);
  if (self->_merchantIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("merchantIdentifier: %@, "), self->_merchantIdentifier);
  if (self->_merchantNameOverride)
    objc_msgSend(v4, "appendFormat:", CFSTR("merchantNameOverride: %@, "), self->_merchantNameOverride);
  if (self->_merchantPrivacyPolicyOverride)
    objc_msgSend(v4, "appendFormat:", CFSTR("merchantPrivacyPolicyOverride: %@, "), self->_merchantPrivacyPolicyOverride);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)asDIIdentityRequest
{
  id v3;
  PKIdentityDocumentDescriptor *descriptor;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D16A28]);
  descriptor = self->_descriptor;
  if (descriptor)
  {
    DIIdentityDocumentDescriptorFromPKIdentityDocumentDescriptor(descriptor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDescriptor:", v5);

  }
  objc_msgSend(v3, "setNonce:", self->_nonce);
  objc_msgSend(v3, "setMerchantIdentifier:", self->_merchantIdentifier);
  objc_msgSend(v3, "setMerchantNameOverride:", self->_merchantNameOverride);
  objc_msgSend(v3, "setMerchantPrivacyPolicyOverride:", self->_merchantPrivacyPolicyOverride);
  return v3;
}

- (id)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)descriptor
{
  objc_storeStrong((id *)&self->_descriptor, descriptor);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
  objc_setProperty_nonatomic_copy(self, a2, nonce, 16);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, merchantIdentifier, 24);
}

- (NSString)merchantNameOverride
{
  return self->_merchantNameOverride;
}

- (void)setMerchantNameOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)merchantPrivacyPolicyOverride
{
  return self->_merchantPrivacyPolicyOverride;
}

- (void)setMerchantPrivacyPolicyOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantPrivacyPolicyOverride, 0);
  objc_storeStrong((id *)&self->_merchantNameOverride, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
