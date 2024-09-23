@implementation PKPaymentOfferDynamicContent

- (PKPaymentOfferDynamicContent)initWithDictionary:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  PKPaymentOfferDynamicContent *v8;
  uint64_t v9;
  NSDictionary *contentByPageType;
  PKPaymentOfferDynamicContent *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PKPaymentOfferDynamicContent_initWithDictionary___block_invoke;
  v14[3] = &unk_1E2AC28F0;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);

  if (objc_msgSend(v7, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPaymentOfferDynamicContent;
    v8 = -[PKPaymentOfferDynamicContent init](&v13, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v7, "copy");
      contentByPageType = v8->_contentByPageType;
      v8->_contentByPageType = (NSDictionary *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __51__PKPaymentOfferDynamicContent_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  PKPaymentOfferDynamicContentPage *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  char v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  int v36;
  void *v37;
  void *v38;
  __CFString *v39;

  v5 = a2;
  v6 = a3;
  v7 = (__CFString *)v5;
  v39 = v7;
  if (v7 == CFSTR("splashScreen"))
  {
    v9 = 1;
LABEL_35:

    v10 = -[PKPaymentOfferDynamicContentPage initWithDictionary:pageType:]([PKPaymentOfferDynamicContentPage alloc], "initWithDictionary:pageType:", v6, v9);
    v37 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safelySetObject:forKey:", v10, v38);

    goto LABEL_36;
  }
  if (v7)
  {
    v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("splashScreen"));

    if ((v8 & 1) != 0)
    {
      v9 = 1;
LABEL_34:
      v7 = v39;
      goto LABEL_35;
    }
    v11 = v39;
    if (v11 == CFSTR("installmentOfferSelection")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("installmentOfferSelection")),
          v12,
          (v13 & 1) != 0))
    {
      v9 = 2;
      goto LABEL_34;
    }
    v14 = v12;
    if (v14 == CFSTR("webviewScreen")
      || (v15 = v14,
          v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("webviewScreen")),
          v15,
          (v16 & 1) != 0))
    {
      v9 = 3;
      goto LABEL_34;
    }
    v17 = v15;
    if (v17 == CFSTR("offersChanged")
      || (v18 = v17,
          v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("offersChanged")),
          v18,
          (v19 & 1) != 0))
    {
      v9 = 4;
      goto LABEL_34;
    }
    v20 = v18;
    if (v20 == CFSTR("ineligibleOffers")
      || (v21 = v20,
          v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("ineligibleOffers")),
          v21,
          (v22 & 1) != 0))
    {
      v9 = 5;
      goto LABEL_34;
    }
    v23 = v21;
    if (v23 == CFSTR("languageNotice")
      || (v24 = v23,
          v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("languageNotice")),
          v24,
          (v25 & 1) != 0))
    {
      v9 = 6;
      goto LABEL_34;
    }
    v26 = v24;
    if (v26 == CFSTR("offerSummary")
      || (v27 = v26,
          v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("offerSummary")),
          v27,
          (v28 & 1) != 0))
    {
      v9 = 7;
      goto LABEL_34;
    }
    v29 = v27;
    if (v29 == CFSTR("offerShortSummary")
      || (v30 = v29,
          v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("offerShortSummary")),
          v30,
          (v31 & 1) != 0))
    {
      v9 = 8;
      goto LABEL_34;
    }
    v32 = v30;
    if (v32 == CFSTR("offerPaymentSummary")
      || (v33 = v32,
          v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("offerPaymentSummary")),
          v33,
          (v34 & 1) != 0))
    {
      v9 = 9;
      goto LABEL_34;
    }
    v35 = v33;
    if (v35 == CFSTR("provisioning")
      || (v10 = (PKPaymentOfferDynamicContentPage *)v35,
          v36 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("provisioning")),
          v10,
          v36))
    {
      v9 = 10;
      goto LABEL_34;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_36:

}

- (id)dictionaryRepresentation
{
  id v3;
  NSDictionary *contentByPageType;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  contentByPageType = self->_contentByPageType;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PKPaymentOfferDynamicContent_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E2AD7D98;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](contentByPageType, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __56__PKPaymentOfferDynamicContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue") - 1;
  if (v6 > 9)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD7DD8[v6];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dictionaryRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safelySetObject:forKey:", v9, v7);
}

- (id)dynamicContentPageForPageType:(unint64_t)a3
{
  NSDictionary *contentByPageType;
  void *v4;
  void *v5;

  contentByPageType = self->_contentByPageType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](contentByPageType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContent *v4;
  PKPaymentOfferDynamicContent *v5;
  NSDictionary *contentByPageType;
  NSDictionary *v7;
  char v8;

  v4 = (PKPaymentOfferDynamicContent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    contentByPageType = self->_contentByPageType;
    v7 = v5->_contentByPageType;
    if (contentByPageType && v7)
      v8 = -[NSDictionary isEqual:](contentByPageType, "isEqual:");
    else
      v8 = contentByPageType == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_contentByPageType);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("contentByPageType: '%@'; "), self->_contentByPageType);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContent)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *contentByPageType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferDynamicContent;
  v5 = -[PKPaymentOfferDynamicContent init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("contentByPageType"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentByPageType = v5->_contentByPageType;
    v5->_contentByPageType = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contentByPageType, CFSTR("contentByPageType"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContent *v5;
  uint64_t v6;
  NSDictionary *contentByPageType;

  v5 = -[PKPaymentOfferDynamicContent init](+[PKPaymentOfferDynamicContent allocWithZone:](PKPaymentOfferDynamicContent, "allocWithZone:"), "init");
  v6 = -[NSDictionary copyWithZone:](self->_contentByPageType, "copyWithZone:", a3);
  contentByPageType = v5->_contentByPageType;
  v5->_contentByPageType = (NSDictionary *)v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentByPageType, 0);
}

@end
