@implementation PKShareablePassMetadata

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:](self, "_initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:", a3, a4, a5, 0, 0, 0, 0, 0, 0, v6, 0);
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier cardConfigurationIdentifier:(NSString *)cardConfigurationIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:](self, "_initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:", credentialIdentifier, cardConfigurationIdentifier, sharingInstanceIdentifier, passThumbnailImage, ownerDisplayName, localizedDescription, 0, 0, 0, v9, 0);
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription accountHash:(NSString *)accountHash templateIdentifier:(NSString *)templateIdentifier relyingPartyIdentifier:(NSString *)relyingPartyIdentifier requiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice
{
  uint64_t v12;

  LOBYTE(v12) = requiresUnifiedAccessCapableDevice;
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:](self, "_initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:", credentialIdentifier, 0, sharingInstanceIdentifier, passThumbnailImage, ownerDisplayName, localizedDescription, accountHash, templateIdentifier, relyingPartyIdentifier, v12, 0);
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardTemplateIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:](self, "_initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:", credentialIdentifier, 0, sharingInstanceIdentifier, 0, 0, 0, 0, templateIdentifier, 0, v7, preview);
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardConfigurationIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:](self, "_initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:passPreviewMetadata:", credentialIdentifier, templateIdentifier, sharingInstanceIdentifier, 0, 0, 0, 0, 0, 0, v7, preview);
}

- (id)_initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5 passThumbnailImage:(CGImage *)a6 ownerDisplayName:(id)a7 localizedDescription:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresUnifiedAccessCapableDevice:(BOOL)a12 passPreviewMetadata:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PKPushProvisioningTarget *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PKPushProvisioningTarget *v31;
  id v32;
  uint64_t v34;
  id v35;
  id v36;

  v36 = a13;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v35 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = [PKPushProvisioningTarget alloc];
  v26 = (void *)objc_msgSend(v24, "copy");

  v27 = (void *)objc_msgSend(v23, "copy");
  v28 = (void *)objc_msgSend(v22, "copy");

  v29 = (void *)objc_msgSend(v19, "copy");
  v30 = (void *)objc_msgSend(v18, "copy");

  LOBYTE(v34) = a12;
  v31 = -[PKPushProvisioningTarget initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:](v25, "initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:", 0, 3, v26, v27, v28, 0, v20, v29, v30, v34, 0, 0);

  v32 = -[PKShareablePassMetadata _initWithPushProvisioningTarget:passThumbnailImage:ownerDisplayName:localizedDescription:passPreviewMetadata:](self, "_initWithPushProvisioningTarget:passThumbnailImage:ownerDisplayName:localizedDescription:passPreviewMetadata:", v31, a6, v21, v35, v36);
  return v32;
}

- (PKShareablePassMetadata)initWithPushProvisioningTarget:(id)a3
{
  return (PKShareablePassMetadata *)-[PKShareablePassMetadata _initWithPushProvisioningTarget:passThumbnailImage:ownerDisplayName:localizedDescription:passPreviewMetadata:](self, "_initWithPushProvisioningTarget:passThumbnailImage:ownerDisplayName:localizedDescription:passPreviewMetadata:", a3, 0, 0, 0, 0);
}

- (id)_initWithPushProvisioningTarget:(id)a3 passThumbnailImage:(CGImage *)a4 ownerDisplayName:(id)a5 localizedDescription:(id)a6 passPreviewMetadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  PKShareablePassMetadata *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = -[PKShareablePassMetadataPreview _initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:]([PKShareablePassMetadataPreview alloc], "_initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:", 0, 0, 0);
  v19 = v18;
  v24.receiver = self;
  v24.super_class = (Class)PKShareablePassMetadata;
  v20 = -[PKShareablePassMetadata init](&v24, sel_init);
  if (v20)
  {
    if (v14)
    {
      v21 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v19, "setOwnerDisplayName:", v21);

    }
    if (a4)
      objc_msgSend(v19, "setPassThumbnailImage:", a4);
    if (v15)
    {
      v22 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v19, "setLocalizedDescription:", v22);

    }
    objc_storeStrong((id *)&v20->_provisioningTarget, a3);
    objc_storeStrong((id *)&v20->_preview, v19);
  }

  return v20;
}

- (PKAddPassMetadataPreview)underlyingPreview
{
  return (PKAddPassMetadataPreview *)self->_preview;
}

- (void)setUnderlyingPreview:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_preview, a3);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x1BuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Unable to set underlying preview as it is not the expected subclass: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (PKPushProvisioningTarget)provisioningTarget
{
  return self->_provisioningTarget;
}

- (void)setProvisioningTarget:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningTarget, a3);
}

- (NSString)accountHash
{
  return -[PKPushProvisioningTarget accountHash](self->_provisioningTarget, "accountHash");
}

- (void)setAccountHash:(NSString *)accountHash
{
  -[PKPushProvisioningTarget setAccountHash:](self->_provisioningTarget, "setAccountHash:", accountHash);
}

- (NSString)relyingPartyIdentifier
{
  return -[PKPushProvisioningTarget relyingPartyIdentifier](self->_provisioningTarget, "relyingPartyIdentifier");
}

- (void)setRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier
{
  -[PKPushProvisioningTarget setRelyingPartyIdentifier:](self->_provisioningTarget, "setRelyingPartyIdentifier:", relyingPartyIdentifier);
}

- (NSString)templateIdentifier
{
  return -[PKPushProvisioningTarget templateIdentifier](self->_provisioningTarget, "templateIdentifier");
}

- (BOOL)requiresUnifiedAccessCapableDevice
{
  return -[PKPushProvisioningTarget requiresSimultaneousRequestRouting](self->_provisioningTarget, "requiresSimultaneousRequestRouting");
}

- (void)setRequiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice
{
  -[PKPushProvisioningTarget setRequiresSimultaneousRequestRouting:](self->_provisioningTarget, "setRequiresSimultaneousRequestRouting:", requiresUnifiedAccessCapableDevice);
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

- (void)setServerEnvironmentIdentifier:(NSString *)serverEnvironmentIdentifier
{
  -[PKPushProvisioningTarget setEnvironmentIdentifier:](self->_provisioningTarget, "setEnvironmentIdentifier:", serverEnvironmentIdentifier);
}

- (CGImageRef)passThumbnailImage
{
  return -[PKAddPassMetadataPreview passThumbnailImage](self->_preview, "passThumbnailImage");
}

- (NSString)localizedDescription
{
  return -[PKAddPassMetadataPreview localizedDescription](self->_preview, "localizedDescription");
}

- (NSString)ownerDisplayName
{
  return -[PKShareablePassMetadataPreview ownerDisplayName](self->_preview, "ownerDisplayName");
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passPreview: '%@'; "), self->_preview);
  objc_msgSend(v3, "appendFormat:", CFSTR("provisioningTarget: '%@';"), self->_provisioningTarget);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (PKShareablePassMetadata)initWithCoder:(id)a3
{
  id v4;
  PKShareablePassMetadata *v5;
  uint64_t v6;
  PKShareablePassMetadataPreview *preview;
  uint64_t v8;
  PKPushProvisioningTarget *provisioningTarget;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShareablePassMetadata;
  v5 = -[PKShareablePassMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
    v6 = objc_claimAutoreleasedReturnValue();
    preview = v5->_preview;
    v5->_preview = (PKShareablePassMetadataPreview *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningTarget"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningTarget = v5->_provisioningTarget;
    v5->_provisioningTarget = (PKPushProvisioningTarget *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKShareablePassMetadataPreview *preview;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  preview = self->_preview;
  v15 = a3;
  objc_msgSend(v15, "encodeObject:forKey:", preview, CFSTR("preview"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_provisioningTarget, CFSTR("provisioningTarget"));
  -[PKPushProvisioningTarget provisioningCredentialIdentifier](self->_provisioningTarget, "provisioningCredentialIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("credentialIdentifier"));

  -[PKPushProvisioningTarget cardConfigurationIdentifier](self->_provisioningTarget, "cardConfigurationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("cardConfigurationIdentifier"));

  -[PKPushProvisioningTarget sharingInstanceIdentifier](self->_provisioningTarget, "sharingInstanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("sharingInstanceIdentifier"));

  -[PKAddPassMetadataPreview pkPassThumbnailImage](self->_preview, "pkPassThumbnailImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("thumbnailImage"));

  -[PKAddPassMetadataPreview localizedDescription](self->_preview, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("localizedDescription"));

  -[PKShareablePassMetadataPreview ownerDisplayName](self->_preview, "ownerDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("ownerDisplayName"));

  -[PKPushProvisioningTarget nonce](self->_provisioningTarget, "nonce");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("nonce"));

  -[PKPushProvisioningTarget accountHash](self->_provisioningTarget, "accountHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("accountHash"));

  -[PKPushProvisioningTarget templateIdentifier](self->_provisioningTarget, "templateIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("templateIdentifier"));

  -[PKPushProvisioningTarget relyingPartyIdentifier](self->_provisioningTarget, "relyingPartyIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("relyingPartyIdentifier"));

  objc_msgSend(v15, "encodeBool:forKey:", -[PKPushProvisioningTarget requiresSimultaneousRequestRouting](self->_provisioningTarget, "requiresSimultaneousRequestRouting"), CFSTR("requiresUnifiedAccessCapableDevice"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[PKPushProvisioningTarget targetDevice](self->_provisioningTarget, "targetDevice"), CFSTR("targetDevice"));

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
  v5 = -[PKShareablePassMetadataPreview copy](self->_preview, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[PKPushProvisioningTarget copy](self->_provisioningTarget, "copy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (PKShareablePassMetadataPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_provisioningTarget, 0);
}

@end
