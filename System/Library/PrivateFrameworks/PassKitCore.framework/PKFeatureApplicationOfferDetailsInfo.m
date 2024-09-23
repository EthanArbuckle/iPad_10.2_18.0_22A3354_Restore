@implementation PKFeatureApplicationOfferDetailsInfo

- (PKFeatureApplicationOfferDetailsInfo)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureApplicationOfferDetailsInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  NSString *primaryActionTitle;
  uint64_t v12;
  NSString *primaryActionIdentifier;
  uint64_t v14;
  NSString *secondaryActionTitle;
  uint64_t v16;
  NSString *secondaryActionIdentifier;
  uint64_t v18;
  NSString *disclosureTitle;
  __CFString *v20;
  __CFString *v21;
  char v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  void *v27;
  double v28;
  __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  NSString *heroImageURL;
  NSObject *v33;
  objc_super v35;
  uint8_t buf[4];
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKFeatureApplicationOfferDetailsInfo;
  v5 = -[PKFeatureApplicationOfferDetailsInfo init](&v35, sel_init);
  if (!v5)
    goto LABEL_20;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("body"));
  v8 = objc_claimAutoreleasedReturnValue();
  body = v5->_body;
  v5->_body = (NSString *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryActionTitle"));
  v10 = objc_claimAutoreleasedReturnValue();
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v10;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryActionIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v12;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryActionTitle"));
  v14 = objc_claimAutoreleasedReturnValue();
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryActionIdentifier"));
  v16 = objc_claimAutoreleasedReturnValue();
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v16;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("disclosureTitle"));
  v18 = objc_claimAutoreleasedReturnValue();
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v18;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("layout"));
  v20 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 == CFSTR("table"))
    goto LABEL_5;
  if (!v20)
  {
LABEL_9:
    v23 = 0;
    goto LABEL_10;
  }
  v22 = objc_msgSend(CFSTR("table"), "isEqualToString:", v20);

  if ((v22 & 1) == 0)
  {
    v24 = v21;
    if (v24 == CFSTR("text")
      || (v25 = v24, v26 = objc_msgSend(CFSTR("text"), "isEqualToString:", v24), v25, v26))
    {
      v23 = 2;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_5:
  v23 = 1;
LABEL_10:

  v5->_layout = v23;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("heroImage"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = PKScreenScale();
    v29 = CFSTR("2x");
    if (v28 > 2.0)
      v29 = CFSTR("3x");
    v30 = v29;
    objc_msgSend(v27, "PKStringForKey:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v31;

    if (!v5->_heroImageURL)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "No valid imageURL found for scale: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "No imageURLs specified", buf, 2u);
    }
  }

LABEL_20:
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationOfferDetailsInfo)initWithCoder:(id)a3
{
  id v4;
  PKFeatureApplicationOfferDetailsInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  NSString *primaryActionTitle;
  uint64_t v12;
  NSString *primaryActionIdentifier;
  uint64_t v14;
  NSString *secondaryActionTitle;
  uint64_t v16;
  NSString *secondaryActionIdentifier;
  uint64_t v18;
  NSString *disclosureTitle;
  uint64_t v20;
  NSString *heroImageURL;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFeatureApplicationOfferDetailsInfo;
  v5 = -[PKFeatureApplicationOfferDetailsInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryActionTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryActionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryActionIdentifier = v5->_primaryActionIdentifier;
    v5->_primaryActionIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryActionTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryActionIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    secondaryActionIdentifier = v5->_secondaryActionIdentifier;
    v5->_secondaryActionIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclosureTitle"));
    v18 = objc_claimAutoreleasedReturnValue();
    disclosureTitle = v5->_disclosureTitle;
    v5->_disclosureTitle = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heroImageURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSString *)v20;

    v5->_layout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layout"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryActionTitle, CFSTR("primaryActionTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryActionIdentifier, CFSTR("primaryActionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryActionTitle, CFSTR("secondaryActionTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryActionIdentifier, CFSTR("secondaryActionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disclosureTitle, CFSTR("disclosureTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageURL, CFSTR("heroImageURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_layout, CFSTR("layout"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("body: '%@'; "), self->_body);
  objc_msgSend(v3, "appendFormat:", CFSTR("primaryActionIdentifier: '%@'; "), self->_primaryActionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("primaryActionTitle: '%@'; "), self->_primaryActionTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryActionTitle: '%@'; "), self->_secondaryActionTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("secondaryActionIdentifier: '%@'; "), self->_secondaryActionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("disclosureTitle: '%@'; "), self->_disclosureTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("heroImageURL: '%@'; "), self->_heroImageURL);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_layout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("layout: '%@'; "), v4);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFeatureApplicationOfferDetailsInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  NSString *primaryActionTitle;
  uint64_t v12;
  NSString *primaryActionIdentifier;
  uint64_t v14;
  NSString *secondaryActionTitle;
  uint64_t v16;
  NSString *secondaryActionIdentifier;
  uint64_t v18;
  NSString *disclosureTitle;
  uint64_t v20;
  NSString *heroImageURL;

  v5 = -[PKFeatureApplicationOfferDetailsInfo init](+[PKFeatureApplicationOfferDetailsInfo allocWithZone:](PKFeatureApplicationOfferDetailsInfo, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  body = v5->_body;
  v5->_body = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_primaryActionTitle, "copyWithZone:", a3);
  primaryActionTitle = v5->_primaryActionTitle;
  v5->_primaryActionTitle = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_primaryActionIdentifier, "copyWithZone:", a3);
  primaryActionIdentifier = v5->_primaryActionIdentifier;
  v5->_primaryActionIdentifier = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_secondaryActionTitle, "copyWithZone:", a3);
  secondaryActionTitle = v5->_secondaryActionTitle;
  v5->_secondaryActionTitle = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_secondaryActionIdentifier, "copyWithZone:", a3);
  secondaryActionIdentifier = v5->_secondaryActionIdentifier;
  v5->_secondaryActionIdentifier = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_disclosureTitle, "copyWithZone:", a3);
  disclosureTitle = v5->_disclosureTitle;
  v5->_disclosureTitle = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_heroImageURL, "copyWithZone:", a3);
  heroImageURL = v5->_heroImageURL;
  v5->_heroImageURL = (NSString *)v20;

  v5->_layout = self->_layout;
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (void)setPrimaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)secondaryActionIdentifier
{
  return self->_secondaryActionIdentifier;
}

- (void)setSecondaryActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (void)setDisclosureTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_storeStrong((id *)&self->_secondaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
