@implementation PKPayLaterDynamicContentPage

- (PKPayLaterDynamicContentPage)initWithDictionary:(id)a3 pageType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKApplyFooterContent *v12;
  PKPayLaterDynamicContentPage *v13;
  void *v14;
  void *v15;
  PKPayLaterDynamicContentPageItem *v16;
  PKPayLaterDynamicContentPage *v17;
  uint64_t v18;
  NSDictionary *contentByIdentifier;
  uint64_t v20;
  NSDictionary *productSectionByType;
  uint64_t v22;
  NSArray *sections;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id obj;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  objc_super v41;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_contentByIdentifierFromDictionary:pageType:", v6, a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = a4;
    objc_msgSend((id)objc_opt_class(), "_productSectionByTypeFromDictionary:pageType:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("products"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("headerTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("headerSubtitle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("altHeaderSubtitle"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("altHeaderSubtitleTimeInterval"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("primaryActionTitle"));
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("primaryActionIdentifier"));
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("altPrimaryActionTitle"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("altPrimaryActionIdentifier"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("secondaryActionTitle"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("secondaryActionIdentifier"));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKStringForKey:", CFSTR("productType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = PKPayLaterAccountProductTypeFromString(v10);

    objc_msgSend(v6, "PKStringForKey:", CFSTR("optionIdentifier"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKCurrencyAmountForKey:", CFSTR("minimumAmount"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKCurrencyAmountForKey:", CFSTR("maximumAmount"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("footerContent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      v12 = -[PKApplyFooterContent initWithDictionary:]([PKApplyFooterContent alloc], "initWithDictionary:", v11);
    else
      v12 = 0;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_110);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPayLaterDynamicContentPageItem initWithDictionary:]([PKPayLaterDynamicContentPageItem alloc], "initWithDictionary:", v6);
    obj = v9;
    if (objc_msgSend(v8, "count")
      || v9
      || v40
      || v39
      || v38
      || v37
      || v36
      || v35
      || v34
      || v33
      || v12
      || objc_msgSend(v15, "count")
      || v16
      || v32
      || v31
      || v27
      || v30)
    {
      v41.receiver = self;
      v41.super_class = (Class)PKPayLaterDynamicContentPage;
      v17 = -[PKPayLaterDynamicContentPage init](&v41, sel_init);
      if (v17)
      {
        if (objc_msgSend(v29, "count"))
        {
          v18 = objc_msgSend(v29, "copy");
          contentByIdentifier = v17->_contentByIdentifier;
          v17->_contentByIdentifier = (NSDictionary *)v18;
        }
        else
        {
          contentByIdentifier = v17->_contentByIdentifier;
          v17->_contentByIdentifier = 0;
        }

        if (objc_msgSend(v7, "count"))
        {
          v20 = objc_msgSend(v7, "copy");
          productSectionByType = v17->_productSectionByType;
          v17->_productSectionByType = (NSDictionary *)v20;
        }
        else
        {
          productSectionByType = v17->_productSectionByType;
          v17->_productSectionByType = 0;
        }

        objc_storeStrong((id *)&v17->_headerTitle, v9);
        objc_storeStrong((id *)&v17->_altHeaderSubtitle, v39);
        v17->_altHeaderSubtitleTimeInterval = v25;
        objc_storeStrong((id *)&v17->_headerSubtitle, v40);
        objc_storeStrong((id *)&v17->_primaryActionTitle, v38);
        objc_storeStrong((id *)&v17->_primaryActionIdentifier, v37);
        objc_storeStrong((id *)&v17->_altPrimaryActionTitle, v36);
        objc_storeStrong((id *)&v17->_altPrimaryActionIdentifier, v35);
        objc_storeStrong((id *)&v17->_secondaryActionTitle, v34);
        objc_storeStrong((id *)&v17->_secondaryActionIdentifier, v33);
        objc_storeStrong((id *)&v17->_footerContent, v12);
        objc_storeStrong((id *)&v17->_contentItem, v16);
        if (objc_msgSend(v15, "count"))
        {
          v22 = objc_msgSend(v15, "copy");
          sections = v17->_sections;
          v17->_sections = (NSArray *)v22;
        }
        else
        {
          sections = v17->_sections;
          v17->_sections = 0;
        }

        v17->_productType = v27;
        objc_storeStrong((id *)&v17->_optionIdentifier, v30);
        objc_storeStrong((id *)&v17->_minimumAmount, v32);
        objc_storeStrong((id *)&v17->_maximumAmount, v31);
        v17->_pageType = v26;
      }
      self = v17;
      v13 = self;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

PKPayLaterDynamicContentSection *__60__PKPayLaterDynamicContentPage_initWithDictionary_pageType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPayLaterDynamicContentSection *v3;

  v2 = a2;
  v3 = -[PKPayLaterDynamicContentSection initWithDictionary:]([PKPayLaterDynamicContentSection alloc], "initWithDictionary:", v2);

  return v3;
}

+ (id)_contentByIdentifierFromDictionary:(id)a3 pageType:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  PKPayLaterDynamicContentPage *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = v4;
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("products"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v4, "mutableCopy", v19);
        objc_msgSend(v10, "removeObjectForKey:", CFSTR("products"));
        objc_msgSend(v10, "removeObjectForKey:", CFSTR("footerContent"));
        v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v11, "addEntriesFromDictionary:", v9);
        objc_msgSend(v11, "addEntriesFromDictionary:", v10);
        v12 = -[PKPayLaterDynamicContentPage initWithDictionary:pageType:]([PKPayLaterDynamicContentPage alloc], "initWithDictionary:pageType:", v11, a4);
        v13 = -[PKPayLaterDynamicContentPage productType](v12, "productType");
        -[PKPayLaterDynamicContentPage optionIdentifier](v12, "optionIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKPayLaterDynamicContentPage keyForProductType:optionIdentifier:](PKPayLaterDynamicContentPage, "keyForProductType:optionIdentifier:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 && v15)
          objc_msgSend(v19, "setObject:forKey:", v12, v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }
  v16 = v19;
  if (objc_msgSend(v19, "count", v19))
    v17 = (void *)objc_msgSend(v16, "copy");
  else
    v17 = 0;

  return v17;
}

+ (id)_productSectionByTypeFromDictionary:(id)a3 pageType:(unint64_t)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  uint64_t v14;
  void *v15;
  PKPayLaterDynamicContentPageItem *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = v4;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("productSectionTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v7)
    goto LABEL_24;
  v8 = v7;
  v9 = *(_QWORD *)v31;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v31 != v9)
        objc_enumerationMutation(v6);
      v11 = (__CFString *)*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10);
      v12 = v11;
      if (v11 == CFSTR("availableProductsSection"))
      {
LABEL_9:
        v14 = 1;
LABEL_10:

        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PKPayLaterDynamicContentPageItem initWithDictionary:]([PKPayLaterDynamicContentPageItem alloc], "initWithDictionary:", v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safelySetObject:forKey:", v16, v17);

        goto LABEL_12;
      }
      if (v11)
      {
        v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("availableProductsSection"));

        if ((v13 & 1) != 0)
          goto LABEL_9;
        v18 = v12;
        if (v18 == CFSTR("unavailableProductsSection")
          || (v19 = v18, v20 = -[__CFString isEqualToString:](v18, "isEqualToString:"),
                         v19,
                         (v20 & 1) != 0))
        {
          v14 = 2;
          goto LABEL_10;
        }
        v21 = v19;
        if (v21 == CFSTR("otherProductsSection")
          || (v22 = v21, v23 = -[__CFString isEqualToString:](v21, "isEqualToString:"),
                         v22,
                         (v23 & 1) != 0))
        {
          v14 = 3;
          goto LABEL_10;
        }
        v24 = v22;
        if (v24 == CFSTR("selectedOptionProductSection")
          || (v15 = v24, v25 = -[__CFString isEqualToString:](v24, "isEqualToString:"), v15, v25))
        {
          v14 = 4;
          goto LABEL_10;
        }
      }
      else
      {
        v15 = 0;
      }
LABEL_12:

      ++v10;
    }
    while (v8 != v10);
    v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v8 = v26;
  }
  while (v26);
LABEL_24:
  if (objc_msgSend(v5, "count"))
    v27 = (void *)objc_msgSend(v5, "copy");
  else
    v27 = 0;

  return v27;
}

- (id)dynamicContentPageForProductType:(unint64_t)a3 optionIdentifier:(id)a4
{
  void *v5;
  PKPayLaterDynamicContentPage *v6;

  +[PKPayLaterDynamicContentPage keyForProductType:optionIdentifier:](PKPayLaterDynamicContentPage, "keyForProductType:optionIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[NSDictionary objectForKey:](self->_contentByIdentifier, "objectForKey:", v5),
        (v6 = (PKPayLaterDynamicContentPage *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = self;
  }

  return v6;
}

- (id)productSectionForType:(unint64_t)a3
{
  NSDictionary *productSectionByType;
  void *v4;
  void *v5;

  productSectionByType = self->_productSectionByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](productSectionByType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyForProductType:(unint64_t)a3 optionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  PKPayLaterAccountProductTypeToString(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_headerTitle)
    objc_msgSend(v3, "appendFormat:", CFSTR("headerTitle: '%@'; "), self->_headerTitle);
  if (self->_headerSubtitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("headerSubtitle: '%@'; "), self->_headerSubtitle);
  if (self->_altHeaderSubtitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("altHeaderSubtitle: '%@'; "), self->_altHeaderSubtitle);
  if (self->_altHeaderSubtitleTimeInterval >= 1)
    objc_msgSend(v4, "appendFormat:", CFSTR("altHeaderSubtitleTimeInterval: %ld; "),
      self->_altHeaderSubtitleTimeInterval);
  if (self->_headerSubtitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("headerSubtitle: '%@'; "), self->_headerSubtitle);
  if (self->_primaryActionTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("primaryActionTitle: '%@'; "), self->_primaryActionTitle);
  if (self->_primaryActionIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("primaryActionIdentifier: '%@'; "), self->_primaryActionIdentifier);
  if (self->_altPrimaryActionTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("altPrimaryActionTitle: '%@'; "), self->_altPrimaryActionTitle);
  if (self->_altPrimaryActionIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("altPrimaryActionIdentifier: '%@'; "), self->_altPrimaryActionIdentifier);
  if (self->_secondaryActionTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("secondaryActionTitle: '%@'; "), self->_secondaryActionTitle);
  if (self->_secondaryActionIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("secondaryActionIdentifier: '%@'; "), self->_secondaryActionIdentifier);
  if (self->_contentItem)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentItem: '%@'; "), self->_contentItem);
  if (self->_footerContent)
    objc_msgSend(v4, "appendFormat:", CFSTR("footerContent: '%@'; "), self->_footerContent);
  if (-[NSArray count](self->_sections, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("sections: '%@'; "), self->_sections);
  if (-[NSDictionary count](self->_contentByIdentifier, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("contentByIdentifier: '%@'; "), self->_contentByIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (unint64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(unint64_t)a3
{
  self->_pageType = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)altHeaderSubtitle
{
  return self->_altHeaderSubtitle;
}

- (void)setAltHeaderSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)altHeaderSubtitleTimeInterval
{
  return self->_altHeaderSubtitleTimeInterval;
}

- (void)setAltHeaderSubtitleTimeInterval:(int64_t)a3
{
  self->_altHeaderSubtitleTimeInterval = a3;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (void)setPrimaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)altPrimaryActionTitle
{
  return self->_altPrimaryActionTitle;
}

- (void)setAltPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)altPrimaryActionIdentifier
{
  return self->_altPrimaryActionIdentifier;
}

- (void)setAltPrimaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)secondaryActionIdentifier
{
  return self->_secondaryActionIdentifier;
}

- (void)setSecondaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKCurrencyAmount)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
  objc_storeStrong((id *)&self->_minimumAmount, a3);
}

- (PKCurrencyAmount)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAmount, a3);
}

- (PKPayLaterDynamicContentPageItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKApplyFooterContent)footerContent
{
  return self->_footerContent;
}

- (void)setFooterContent:(id)a3
{
  objc_storeStrong((id *)&self->_footerContent, a3);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSString)optionIdentifier
{
  return self->_optionIdentifier;
}

- (void)setOptionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionIdentifier, 0);
  objc_storeStrong((id *)&self->_footerContent, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_altPrimaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_altHeaderSubtitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_productSectionByType, 0);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
}

@end
