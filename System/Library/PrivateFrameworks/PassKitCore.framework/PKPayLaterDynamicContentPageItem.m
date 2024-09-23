@implementation PKPayLaterDynamicContentPageItem

- (PKPayLaterDynamicContentPageItem)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKApplyFooterContent *v10;
  void *v11;
  PKApplyFooterContent *v12;
  PKPayLaterDynamicContentPageItem *v13;
  PKPayLaterDynamicContentPageItem *v14;
  id *p_isa;
  void *v17;
  id v18;
  id obj;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentTitle"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentSubtitle"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentDetailLeading"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentDetailSubtitleLeading"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentDetailTrailing"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("systemImage"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("systemImageColors"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("linkText"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKURLForKey:", CFSTR("linkURL"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_281);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("errorTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("altContentSubtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footerContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v9);
  else
    v10 = 0;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("altFooterContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    v12 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v11);
  else
    v12 = 0;
  obj = (id)v5;
  if (v5 || v27 || v26 || v25 || v24 || v23 || v22 || v21 || v20 || objc_msgSend(v6, "count") || v7 || v8 || v10 || v12)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKPayLaterDynamicContentPageItem;
    v14 = -[PKPayLaterDynamicContentPageItem init](&v28, sel_init);
    p_isa = (id *)&v14->super.isa;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_identifier, obj);
      objc_storeStrong(p_isa + 2, v27);
      objc_storeStrong(p_isa + 3, v26);
      objc_storeStrong(p_isa + 4, v25);
      objc_storeStrong(p_isa + 5, v24);
      objc_storeStrong(p_isa + 6, v23);
      objc_storeStrong(p_isa + 9, v22);
      objc_storeStrong(p_isa + 10, v18);
      objc_storeStrong(p_isa + 7, v21);
      objc_storeStrong(p_isa + 8, v20);
      objc_storeStrong(p_isa + 11, v6);
      objc_storeStrong(p_isa + 12, v7);
      objc_storeStrong(p_isa + 13, v8);
      objc_storeStrong(p_isa + 14, v10);
      objc_storeStrong(p_isa + 15, v12);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

PKPayLaterDynamicContentSection *__55__PKPayLaterDynamicContentPageItem_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPayLaterDynamicContentSection *v3;

  v2 = a2;
  v3 = -[PKPayLaterDynamicContentSection initWithDictionary:]([PKPayLaterDynamicContentSection alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_contentTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentTitle: '%@'; "), self->_contentTitle);
  if (self->_contentSubtitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentSubtitle: '%@'; "), self->_contentSubtitle);
  if (self->_contentDetailLeading)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentDetailLeading: '%@'; "), self->_contentDetailLeading);
  if (self->_contentDetailSubtitleLeading)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentDetailSubtitleLeading: '%@'; "),
      self->_contentDetailSubtitleLeading);
  if (self->_contentDetailTrailing)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentDetailTrailing: '%@'; "), self->_contentDetailTrailing);
  if (self->_systemImageName)
    objc_msgSend(v4, "appendFormat:", CFSTR("systemImage: '%@'; "), self->_systemImageName);
  if (self->_systemImageColors)
    objc_msgSend(v4, "appendFormat:", CFSTR("systemImageColors: '%@'; "), self->_systemImageColors);
  if (self->_linkText)
    objc_msgSend(v4, "appendFormat:", CFSTR("linkText: '%@'; "), self->_linkText);
  if (self->_linkURL)
    objc_msgSend(v4, "appendFormat:", CFSTR("linkURL: '%@'; "), self->_linkURL);
  if (self->_sections)
    objc_msgSend(v4, "appendFormat:", CFSTR("sections: '%@'; "), self->_sections);
  if (self->_errorTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("errorTitle: '%@'; "), self->_errorTitle);
  if (self->_altContentSubtitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("altContentSubtitle: '%@'; "), self->_altContentSubtitle);
  if (self->_footerContent)
    objc_msgSend(v4, "appendFormat:", CFSTR("footerContent: '%@'; "), self->_footerContent);
  if (self->_altFooterContent)
    objc_msgSend(v4, "appendFormat:", CFSTR("altFooterContent: '%@'; "), self->_altFooterContent);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contentSubtitle
{
  return self->_contentSubtitle;
}

- (void)setContentSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentDetailLeading
{
  return self->_contentDetailLeading;
}

- (void)setContentDetailLeading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contentDetailSubtitleLeading
{
  return self->_contentDetailSubtitleLeading;
}

- (void)setContentDetailSubtitleLeading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)contentDetailTrailing
{
  return self->_contentDetailTrailing;
}

- (void)setContentDetailTrailing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)systemImageColors
{
  return self->_systemImageColors;
}

- (void)setSystemImageColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)altContentSubtitle
{
  return self->_altContentSubtitle;
}

- (void)setAltContentSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
  objc_storeStrong((id *)&self->_footerContent, a3);
}

- (PKApplyFooterContent)altFooterContent
{
  return self->_altFooterContent;
}

- (void)setAltFooterContent:(id)a3
{
  objc_storeStrong((id *)&self->_altFooterContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altFooterContent, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_altContentSubtitle, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_systemImageColors, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_contentDetailTrailing, 0);
  objc_storeStrong((id *)&self->_contentDetailSubtitleLeading, 0);
  objc_storeStrong((id *)&self->_contentDetailLeading, 0);
  objc_storeStrong((id *)&self->_contentSubtitle, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
