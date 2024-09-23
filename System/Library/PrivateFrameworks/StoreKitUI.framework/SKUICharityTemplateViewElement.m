@implementation SKUICharityTemplateViewElement

- (SKUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICharityTemplateViewElement *v11;
  uint64_t v12;
  NSString *campaignIdentifier;
  uint64_t v14;
  NSString *charityMetadataURLString;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICharityTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICharityTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("campaignID"));
    v12 = objc_claimAutoreleasedReturnValue();
    campaignIdentifier = v11->_campaignIdentifier;
    v11->_campaignIdentifier = (NSString *)v12;

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v14 = objc_claimAutoreleasedReturnValue();
    charityMetadataURLString = v11->_charityMetadataURLString;
    v11->_charityMetadataURLString = (NSString *)v14;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICharityTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *campaignIdentifier;
  NSString *v9;
  NSString *charityMetadataURLString;
  objc_super v12;

  v4 = (SKUICharityTemplateViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUICharityTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v12, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUICharityTemplateViewElement campaignIdentifier](v4, "campaignIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    campaignIdentifier = self->_campaignIdentifier;
    self->_campaignIdentifier = v7;

    -[SKUICharityTemplateViewElement charityMetadataURLString](v4, "charityMetadataURLString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    charityMetadataURLString = self->_charityMetadataURLString;
    self->_charityMetadataURLString = v9;

  }
  return v6;
}

- (NSString)campaignIdentifier
{
  return self->_campaignIdentifier;
}

- (NSString)charityMetadataURLString
{
  return self->_charityMetadataURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charityMetadataURLString, 0);
  objc_storeStrong((id *)&self->_campaignIdentifier, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICharityTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
