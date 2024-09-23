@implementation PKIdentityDocumentMetadata

- (PKIdentityDocumentMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 cardTemplateIdentifier:(id)a6 requiresSimultaneousRequestRouting:(BOOL)a7 preview:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PKPushProvisioningTarget *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPushProvisioningTarget *v24;
  PKIdentityDocumentMetadata *v25;
  uint64_t v27;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [PKPushProvisioningTarget alloc];
  v20 = (void *)objc_msgSend(v18, "copy");

  v21 = (void *)objc_msgSend(v16, "copy");
  v22 = (void *)objc_msgSend(v17, "copy");

  v23 = (void *)objc_msgSend(v15, "copy");
  LOBYTE(v27) = a7;
  v24 = -[PKPushProvisioningTarget initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:](v19, "initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:", 0, 3, v20, v21, v22, 0, 0, v23, 0, v27, 0, 0);

  v25 = -[PKIdentityDocumentMetadata initWithPushProvisioningTarget:preview:](self, "initWithPushProvisioningTarget:preview:", v24, v14);
  return v25;
}

- (PKIdentityDocumentMetadata)initWithPushProvisioningTarget:(id)a3 preview:(id)a4
{
  id v7;
  id v8;
  PKIdentityDocumentMetadata *v9;
  PKIdentityDocumentMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityDocumentMetadata;
  v9 = -[PKIdentityDocumentMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provisioningTarget, a3);
    objc_storeStrong((id *)&v10->_underlyingPreview, a4);
  }

  return v10;
}

- (PKAddPassMetadataPreview)underlyingPreview
{
  return self->_underlyingPreview;
}

- (void)setUnderlyingPreview:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingPreview, a3);
}

- (PKPushProvisioningTarget)provisioningTarget
{
  return self->_provisioningTarget;
}

- (void)setProvisioningTarget:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningTarget, a3);
}

- (NSString)credentialIdentifier
{
  return -[PKPushProvisioningTarget provisioningCredentialIdentifier](self->_provisioningTarget, "provisioningCredentialIdentifier");
}

- (NSString)sharingInstanceIdentifier
{
  return -[PKPushProvisioningTarget sharingInstanceIdentifier](self->_provisioningTarget, "sharingInstanceIdentifier");
}

- (NSString)cardTemplateIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[PKPushProvisioningTarget templateIdentifier](self->_provisioningTarget, "templateIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E2ADF4C0;
  v4 = v2;

  return v4;
}

- (NSString)cardConfigurationIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[PKPushProvisioningTarget cardConfigurationIdentifier](self->_provisioningTarget, "cardConfigurationIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E2ADF4C0;
  v4 = v2;

  return v4;
}

- (NSString)serverEnvironmentIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[PKPushProvisioningTarget environmentIdentifier](self->_provisioningTarget, "environmentIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E2ADF4C0;
  v4 = v2;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIdentityDocumentMetadata _extendableDescription:](self, "_extendableDescription:", v3);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)_extendableDescription:(id)a3
{
  PKAddPassMetadataPreview *underlyingPreview;
  id v5;

  underlyingPreview = self->_underlyingPreview;
  v5 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("passPreview: '%@'; "), underlyingPreview);
  objc_msgSend(v5, "appendFormat:", CFSTR("provisioningTarget: '%@';"), self->_provisioningTarget);

}

- (PKIdentityDocumentMetadata)initWithCoder:(id)a3
{
  id v4;
  PKIdentityDocumentMetadata *v5;
  uint64_t v6;
  PKAddPassMetadataPreview *underlyingPreview;
  uint64_t v8;
  PKPushProvisioningTarget *provisioningTarget;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityDocumentMetadata;
  v5 = -[PKIdentityDocumentMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingPreview = v5->_underlyingPreview;
    v5->_underlyingPreview = (PKAddPassMetadataPreview *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningTarget"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningTarget = v5->_provisioningTarget;
    v5->_provisioningTarget = (PKPushProvisioningTarget *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKAddPassMetadataPreview *underlyingPreview;
  id v5;

  underlyingPreview = self->_underlyingPreview;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", underlyingPreview, CFSTR("preview"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningTarget, CFSTR("provisioningTarget"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[PKAddPassMetadataPreview copy](self->_underlyingPreview, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[PKPushProvisioningTarget copy](self->_provisioningTarget, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (void)setServerEnvironmentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serverEnvironmentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverEnvironmentIdentifier, 0);
  objc_storeStrong((id *)&self->_underlyingPreview, 0);
  objc_storeStrong((id *)&self->_provisioningTarget, 0);
}

@end
