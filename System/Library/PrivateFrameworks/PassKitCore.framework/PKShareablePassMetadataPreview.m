@implementation PKShareablePassMetadataPreview

+ (PKShareablePassMetadataPreview)previewWithTemplateIdentifier:(NSString *)templateIdentifier
{
  NSString *v3;
  id v4;

  v3 = templateIdentifier;
  v4 = -[PKShareablePassMetadataPreview _initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:]([PKShareablePassMetadataPreview alloc], "_initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:", 0, 0, v3);

  return (PKShareablePassMetadataPreview *)v4;
}

- (PKShareablePassMetadataPreview)initWithTemplateIdentifier:(NSString *)templateIdentifier
{
  NSString *v4;
  PKShareablePassMetadataPreview *v5;

  v4 = templateIdentifier;
  v5 = -[PKShareablePassMetadataPreview _initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:]([PKShareablePassMetadataPreview alloc], "_initWithPassThumbnail:localizedDescription:provisioningTemplateIdentifier:", 0, 0, v4);

  return v5;
}

- (id)_initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4 provisioningTemplateIdentifier:(id)a5
{
  id v9;
  PKShareablePassMetadataPreview *v10;
  PKShareablePassMetadataPreview *v11;

  v9 = a5;
  v10 = -[PKAddPassMetadataPreview initWithPassThumbnail:localizedDescription:](self, "initWithPassThumbnail:localizedDescription:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_provisioningTemplateIdentifier, a5);

  return v11;
}

- (PKShareablePassMetadataPreview)initWithCoder:(id)a3
{
  id v4;
  PKShareablePassMetadataPreview *v5;
  uint64_t v6;
  NSString *ownerDisplayName;
  uint64_t v8;
  NSString *provisioningTemplateIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShareablePassMetadataPreview;
  v5 = -[PKAddPassMetadataPreview initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerDisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningTemplateIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningTemplateIdentifier = v5->_provisioningTemplateIdentifier;
    v5->_provisioningTemplateIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKShareablePassMetadataPreview;
  v4 = a3;
  -[PKAddPassMetadataPreview encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_ownerDisplayName, CFSTR("ownerDisplayName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningTemplateIdentifier, CFSTR("provisioningTemplateIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_extendableDescription:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKShareablePassMetadataPreview;
  v4 = a3;
  -[PKAddPassMetadataPreview _extendableDescription:](&v5, sel__extendableDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("ownerDisplayName: '%@'; "), self->_ownerDisplayName);
  objc_msgSend(v4, "appendFormat:", CFSTR("provisioningTemplateIdentifier: '%@'; "),
    self->_provisioningTemplateIdentifier);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKShareablePassMetadataPreview;
  v4 = -[PKAddPassMetadataPreview copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_ownerDisplayName, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_provisioningTemplateIdentifier, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(NSString *)ownerDisplayName
{
  objc_storeStrong((id *)&self->_ownerDisplayName, ownerDisplayName);
}

- (NSString)provisioningTemplateIdentifier
{
  return self->_provisioningTemplateIdentifier;
}

- (void)setProvisioningTemplateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
}

@end
