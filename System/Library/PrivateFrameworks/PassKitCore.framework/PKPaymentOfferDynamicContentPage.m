@implementation PKPaymentOfferDynamicContentPage

- (PKPaymentOfferDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentOfferDynamicContentPage *v14;
  PKPaymentOfferDynamicContentPage *v15;
  PKPaymentOfferDynamicContentIcon *v16;
  PKPaymentOfferDynamicContentIcon *iconURL;
  PKApplyFooterContent *v18;
  PKApplyFooterContent *footerContent;
  PKApplyFooterContent *v20;
  PKApplyFooterContent *altFooterContent;
  PKPaymentOfferDynamicContentCustomLayout *v22;
  PKPaymentOfferDynamicContentCustomLayout *customLayout;
  PKPaymentOfferDynamicContentPage *v24;
  id obj;
  objc_super v28;

  v5 = a3;
  objc_msgSend(v5, "PKStringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKStringForKey:", CFSTR("subtitle"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKStringForKey:", CFSTR("body"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKStringForKey:", CFSTR("primaryActionTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKStringForKey:", CFSTR("secondaryActionTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("iconURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("footerContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("altFooterContent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("customLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || obj
    || v7
    || v8
    || v9
    || objc_msgSend(v10, "count")
    || objc_msgSend(v10, "count")
    || objc_msgSend(v11, "count")
    || objc_msgSend(v12, "count")
    || objc_msgSend(v13, "count"))
  {
    v28.receiver = self;
    v28.super_class = (Class)PKPaymentOfferDynamicContentPage;
    v14 = -[PKPaymentOfferDynamicContentPage init](&v28, sel_init);
    v15 = v14;
    if (v14)
    {
      v14->_pageType = a4;
      objc_storeStrong((id *)&v14->_title, v6);
      objc_storeStrong((id *)&v15->_subtitle, obj);
      objc_storeStrong((id *)&v15->_body, v7);
      objc_storeStrong((id *)&v15->_primaryActionTitle, v8);
      objc_storeStrong((id *)&v15->_secondaryActionTitle, v9);
      if (objc_msgSend(v10, "count"))
      {
        v16 = -[PKPaymentOfferDynamicContentIcon initWithDictionary:]([PKPaymentOfferDynamicContentIcon alloc], "initWithDictionary:", v10);
        iconURL = v15->_iconURL;
        v15->_iconURL = v16;

      }
      if (objc_msgSend(v11, "count"))
      {
        v18 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v11);
        footerContent = v15->_footerContent;
        v15->_footerContent = v18;

      }
      if (objc_msgSend(v12, "count"))
      {
        v20 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v12);
        altFooterContent = v15->_altFooterContent;
        v15->_altFooterContent = v20;

      }
      if (objc_msgSend(v13, "count"))
      {
        v22 = -[PKPaymentOfferDynamicContentCustomLayout initWithArray:]([PKPaymentOfferDynamicContentCustomLayout alloc], "initWithArray:", v13);
        customLayout = v15->_customLayout;
        v15->_customLayout = v22;

      }
    }
    self = v15;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = self->_pageType - 1;
  if (v5 > 9)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD7DD8[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("pageType"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_body, CFSTR("body"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_primaryActionTitle, CFSTR("primaryActionTitle"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_secondaryActionTitle, CFSTR("secondaryActionTitle"));
  -[PKPaymentOfferDynamicContentIcon dictionaryRepresentation](self->_iconURL, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("iconURL"));

  -[PKApplyFooterContent dictionaryRepresentation](self->_footerContent, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("footerContent"));

  -[PKApplyFooterContent dictionaryRepresentation](self->_altFooterContent, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("altFooterContent"));

  -[PKPaymentOfferDynamicContentCustomLayout dictionaryRepresentation](self->_customLayout, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("customLayout"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentPage *v4;
  PKPaymentOfferDynamicContentPage *v5;
  PKPaymentOfferDynamicContentPage *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *subtitle;
  NSString *v14;
  _BOOL4 v15;
  NSString *body;
  NSString *v17;
  _BOOL4 v18;
  NSString *primaryActionTitle;
  NSString *v20;
  _BOOL4 v21;
  NSString *secondaryActionTitle;
  NSString *v23;
  _BOOL4 v24;
  PKPaymentOfferDynamicContentIcon *iconURL;
  PKPaymentOfferDynamicContentIcon *v27;
  PKApplyFooterContent *footerContent;
  PKApplyFooterContent *v29;
  PKApplyFooterContent *altFooterContent;
  PKApplyFooterContent *v31;
  PKPaymentOfferDynamicContentCustomLayout *customLayout;
  PKPaymentOfferDynamicContentCustomLayout *v33;

  v4 = (PKPaymentOfferDynamicContentPage *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_35;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_36;
        }
        subtitle = v6->_subtitle;
        v8 = self->_subtitle;
        v14 = subtitle;
        if (v8 == v14)
        {

        }
        else
        {
          v10 = v14;
          if (!v8 || !v14)
            goto LABEL_35;
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_36;
        }
        body = v6->_body;
        v8 = self->_body;
        v17 = body;
        if (v8 == v17)
        {

        }
        else
        {
          v10 = v17;
          if (!v8 || !v17)
            goto LABEL_35;
          v18 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

          if (!v18)
            goto LABEL_36;
        }
        primaryActionTitle = v6->_primaryActionTitle;
        v8 = self->_primaryActionTitle;
        v20 = primaryActionTitle;
        if (v8 == v20)
        {

        }
        else
        {
          v10 = v20;
          if (!v8 || !v20)
            goto LABEL_35;
          v21 = -[NSString isEqualToString:](v8, "isEqualToString:", v20);

          if (!v21)
            goto LABEL_36;
        }
        secondaryActionTitle = v6->_secondaryActionTitle;
        v8 = self->_secondaryActionTitle;
        v23 = secondaryActionTitle;
        if (v8 == v23)
        {

LABEL_40:
          iconURL = self->_iconURL;
          v27 = v6->_iconURL;
          if (iconURL && v27)
          {
            if (!-[PKPaymentOfferDynamicContentIcon isEqual:](iconURL, "isEqual:"))
              goto LABEL_36;
          }
          else if (iconURL != v27)
          {
            goto LABEL_36;
          }
          footerContent = self->_footerContent;
          v29 = v6->_footerContent;
          if (footerContent && v29)
          {
            if (!-[PKApplyFooterContent isEqual:](footerContent, "isEqual:"))
              goto LABEL_36;
          }
          else if (footerContent != v29)
          {
            goto LABEL_36;
          }
          altFooterContent = self->_altFooterContent;
          v31 = v6->_altFooterContent;
          if (altFooterContent && v31)
          {
            if (!-[PKApplyFooterContent isEqual:](altFooterContent, "isEqual:"))
              goto LABEL_36;
          }
          else if (altFooterContent != v31)
          {
            goto LABEL_36;
          }
          customLayout = self->_customLayout;
          v33 = v6->_customLayout;
          if (customLayout && v33)
          {
            if (-[PKPaymentOfferDynamicContentCustomLayout isEqual:](customLayout, "isEqual:"))
              goto LABEL_60;
          }
          else if (customLayout == v33)
          {
LABEL_60:
            v12 = self->_pageType == v6->_pageType;
            goto LABEL_37;
          }
LABEL_36:
          v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          v24 = -[NSString isEqualToString:](v8, "isEqualToString:", v23);

          if (!v24)
            goto LABEL_36;
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    v12 = 0;
  }
LABEL_38:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_body);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryActionTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryActionTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_iconURL);
  objc_msgSend(v3, "safelyAddObject:", self->_footerContent);
  objc_msgSend(v3, "safelyAddObject:", self->_altFooterContent);
  objc_msgSend(v3, "safelyAddObject:", self->_customLayout);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_pageType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v4 = self->_pageType - 1;
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD7DD8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("pageType: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("body: '%@'; "), self->_body);
  objc_msgSend(v3, "appendFormat:", CFSTR("primaryActionTitle: '%@'; "), self->_primaryActionTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryActionTitle: '%@'; "), self->_secondaryActionTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("iconURL: '%@'; "), self->_iconURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("footerContent: '%@'; "), self->_footerContent);
  objc_msgSend(v3, "appendFormat:", CFSTR("altFooterContent: '%@'; "), self->_altFooterContent);
  objc_msgSend(v3, "appendFormat:", CFSTR("customLayout: '%@'; "), self->_customLayout);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentPage)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentPage *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *body;
  uint64_t v12;
  NSString *primaryActionTitle;
  uint64_t v14;
  NSString *secondaryActionTitle;
  uint64_t v16;
  PKApplyFooterContent *footerContent;
  uint64_t v18;
  PKApplyFooterContent *altFooterContent;
  uint64_t v20;
  PKPaymentOfferDynamicContentCustomLayout *customLayout;
  uint64_t v22;
  PKPaymentOfferDynamicContentIcon *iconURL;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferDynamicContentPage;
  v5 = -[PKPaymentOfferDynamicContentPage init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v10 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryActionTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryActionTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v14;

    v5->_pageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerContent"));
    v16 = objc_claimAutoreleasedReturnValue();
    footerContent = v5->_footerContent;
    v5->_footerContent = (PKApplyFooterContent *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altFooterContent"));
    v18 = objc_claimAutoreleasedReturnValue();
    altFooterContent = v5->_altFooterContent;
    v5->_altFooterContent = (PKApplyFooterContent *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customLayout"));
    v20 = objc_claimAutoreleasedReturnValue();
    customLayout = v5->_customLayout;
    v5->_customLayout = (PKPaymentOfferDynamicContentCustomLayout *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (PKPaymentOfferDynamicContentIcon *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryActionTitle, CFSTR("primaryActionTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryActionTitle, CFSTR("secondaryActionTitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pageType, CFSTR("pageType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_footerContent, CFSTR("footerContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altFooterContent, CFSTR("altFooterContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customLayout, CFSTR("customLayout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentPage *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *body;
  uint64_t v12;
  NSString *primaryActionTitle;
  uint64_t v14;
  NSString *secondaryActionTitle;
  PKApplyFooterContent *v16;
  PKApplyFooterContent *footerContent;
  PKApplyFooterContent *v18;
  PKApplyFooterContent *altFooterContent;
  PKPaymentOfferDynamicContentCustomLayout *v20;
  PKPaymentOfferDynamicContentCustomLayout *customLayout;
  PKPaymentOfferDynamicContentIcon *v22;
  PKPaymentOfferDynamicContentIcon *iconURL;

  v5 = -[PKPaymentOfferDynamicContentPage init](+[PKPaymentOfferDynamicContentPage allocWithZone:](PKPaymentOfferDynamicContentPage, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  body = v5->_body;
  v5->_body = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_primaryActionTitle, "copyWithZone:", a3);
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_secondaryActionTitle, "copyWithZone:", a3);
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  v16 = -[PKApplyFooterContent copyWithZone:](self->_footerContent, "copyWithZone:", a3);
  footerContent = v5->_footerContent;
  v5->_footerContent = v16;

  v18 = -[PKApplyFooterContent copyWithZone:](self->_altFooterContent, "copyWithZone:", a3);
  altFooterContent = v5->_altFooterContent;
  v5->_altFooterContent = v18;

  v20 = -[PKPaymentOfferDynamicContentCustomLayout copyWithZone:](self->_customLayout, "copyWithZone:", a3);
  customLayout = v5->_customLayout;
  v5->_customLayout = v20;

  v22 = -[PKPaymentOfferDynamicContentIcon copyWithZone:](self->_iconURL, "copyWithZone:", a3);
  iconURL = v5->_iconURL;
  v5->_iconURL = v22;

  v5->_pageType = self->_pageType;
  return v5;
}

- (unint64_t)pageType
{
  return self->_pageType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (PKPaymentOfferDynamicContentIcon)iconURL
{
  return self->_iconURL;
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (PKApplyFooterContent)altFooterContent
{
  return self->_altFooterContent;
}

- (PKPaymentOfferDynamicContentCustomLayout)customLayout
{
  return self->_customLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_altFooterContent, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
