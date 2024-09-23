@implementation PKPassAuxiliaryPassInformationItem

- (PKPassAuxiliaryPassInformationItem)initWithItemInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PKPassAuxiliaryPassInformationItem *v13;
  uint64_t v14;
  NSString *identifier;
  void *v16;
  uint64_t v17;
  NSString *title;
  void *v19;
  uint64_t v20;
  NSString *subtitle;
  void *v22;
  uint64_t v23;
  NSString *subtitle2;
  uint64_t v25;
  NSURL *mapsURL;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  PKPassDetailSection *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSString *detailFooterLeadingTitle;
  void *v49;
  uint64_t v50;
  NSString *detailFooterLeadingText;
  void *v52;
  uint64_t v53;
  NSString *detailFooterTrailingTitle;
  void *v55;
  uint64_t v56;
  NSString *detailFooterTrailingText;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  uint64_t v63;
  NSString *v64;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  NSString *v68;
  uint64_t v69;
  NSString *v70;
  PKMerchant *merchant;
  void *v72;
  void *v73;
  uint64_t v74;
  NSString *v75;
  uint64_t v76;
  NSArray *fields;
  uint64_t v78;
  NSArray *sections;
  void *v81;
  void *v82;
  id v83;
  id obj;
  PKPassAuxiliaryPassInformationItem *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  objc_super v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v99.receiver = self;
  v99.super_class = (Class)PKPassAuxiliaryPassInformationItem;
  v13 = -[PKPassAuxiliaryPassInformationItem init](&v99, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "PKStringForKey:", CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v16, v11, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v17;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("subtitle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v19, v11, v12);
    v20 = objc_claimAutoreleasedReturnValue();
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v20;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("subtitle2"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v22, v11, v12);
    v23 = objc_claimAutoreleasedReturnValue();
    subtitle2 = v13->_subtitle2;
    v13->_subtitle2 = (NSString *)v23;

    objc_msgSend(v10, "PKURLForKey:", CFSTR("mapsURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    mapsURL = v13->_mapsURL;
    v13->_mapsURL = (NSURL *)v25;

    objc_msgSend(v10, "PKStringForKey:", CFSTR("locationCategory"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v13->_merchantCategory = PKMerchantCategoryFromString(v27);
    v81 = v28;
    v85 = v13;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v82 = v10;
    objc_msgSend(v10, "objectForKey:", CFSTR("fields"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v96 != v33)
            objc_enumerationMutation(v30);
          _FieldForTypeWithDictionaryAndBundle(3, *(void **)(*((_QWORD *)&v95 + 1) + 8 * i), v11, v12, 0, 0, a6);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "safelyAddObject:", v35);
          objc_msgSend(v35, "key");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "pk_safelyAddObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
      }
      while (v32);
    }

    v37 = (void *)objc_msgSend(v29, "copy");
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v82, "objectForKey:", CFSTR("sections"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v92;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v92 != v42)
            objc_enumerationMutation(v39);
          v44 = -[PKPassDetailSection initWithDictionary:allowedRows:bundle:privateBundle:]([PKPassDetailSection alloc], "initWithDictionary:allowedRows:bundle:privateBundle:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j), v37, v11, v12);
          objc_msgSend(v38, "safelyAddObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v41);
    }

    v10 = v82;
    objc_msgSend(v82, "objectForKey:", CFSTR("footerConfiguration"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "PKStringForKey:", CFSTR("leadingTitle"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v46, v11, v12);
    v47 = objc_claimAutoreleasedReturnValue();
    v13 = v85;
    detailFooterLeadingTitle = v85->_detailFooterLeadingTitle;
    v85->_detailFooterLeadingTitle = (NSString *)v47;

    objc_msgSend(v45, "PKStringForKey:", CFSTR("leadingDetailText"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v49, v11, v12);
    v50 = objc_claimAutoreleasedReturnValue();
    detailFooterLeadingText = v85->_detailFooterLeadingText;
    v85->_detailFooterLeadingText = (NSString *)v50;

    objc_msgSend(v45, "PKStringForKey:", CFSTR("trailingTitle"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v52, v11, v12);
    v53 = objc_claimAutoreleasedReturnValue();
    detailFooterTrailingTitle = v85->_detailFooterTrailingTitle;
    v85->_detailFooterTrailingTitle = (NSString *)v53;

    objc_msgSend(v45, "PKStringForKey:", CFSTR("trailingDetailText"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPassStringForPassBundle(v55, v11, v12);
    v56 = objc_claimAutoreleasedReturnValue();
    detailFooterTrailingText = v85->_detailFooterTrailingText;
    v85->_detailFooterTrailingText = (NSString *)v56;

    if (!v85->_subtitle)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      obj = v86;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v88;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v88 != v60)
              objc_enumerationMutation(obj);
            v62 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v62, "value");
              v63 = objc_claimAutoreleasedReturnValue();
              v64 = v85->_subtitle;
              v85->_subtitle = (NSString *)v63;

              if (!v85->_detailFooterLeadingText)
              {
                if (v85->_detailFooterTrailingText)
                  goto LABEL_42;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v83 = v62;
                  objc_msgSend(v83, "displayableStartDate");
                  v67 = objc_claimAutoreleasedReturnValue();
                  v68 = v85->_detailFooterLeadingText;
                  v85->_detailFooterLeadingText = (NSString *)v67;

                  objc_msgSend(v83, "displayableEndDate");
                  v69 = objc_claimAutoreleasedReturnValue();
                  v70 = v85->_detailFooterTrailingText;
                  v85->_detailFooterTrailingText = (NSString *)v69;

                }
                if (!v85->_detailFooterLeadingText)
                {
LABEL_42:
                  if (!v85->_detailFooterTrailingTitle)
                  {
                    objc_msgSend(v62, "value");
                    v65 = objc_claimAutoreleasedReturnValue();
                    v66 = v85->_detailFooterLeadingText;
                    v85->_detailFooterLeadingText = (NSString *)v65;

                  }
                }
              }
            }
          }
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
        }
        while (v59);
      }

      v13 = v85;
      v10 = v82;
    }
    if (!v13->_subtitle2)
    {
      merchant = v13->_merchant;
      if (merchant)
      {
        -[PKMerchant mapsMerchant](merchant, "mapsMerchant");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "postalAddress");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        PKMerchantFormattedLocationForPostalAddress(v73);
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = v13->_subtitle2;
        v13->_subtitle2 = (NSString *)v74;

      }
    }
    v76 = objc_msgSend(v86, "copy");
    fields = v13->_fields;
    v13->_fields = (NSArray *)v76;

    v78 = objc_msgSend(v38, "copy");
    sections = v13->_sections;
    v13->_sections = (NSArray *)v78;

  }
  return v13;
}

- (void)setMerchant:(id)a3
{
  PKMerchant **p_merchant;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *subtitle2;
  id v10;

  v10 = a3;
  p_merchant = &self->_merchant;
  objc_storeStrong((id *)&self->_merchant, a3);
  if (!self->_subtitle2 && *p_merchant)
  {
    -[PKMerchant mapsMerchant](*p_merchant, "mapsMerchant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postalAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKMerchantFormattedLocationForPostalAddress(v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle2 = self->_subtitle2;
    self->_subtitle2 = v8;

  }
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_title, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_subtitle, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_subtitle2, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_detailFooterLeadingTitle, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_detailFooterLeadingText, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_detailFooterTrailingTitle, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_detailFooterTrailingText, "hash") - v9 + 32 * v9;
  v11 = -[NSURL hash](self->_mapsURL, "hash");
  return self->_merchantCategory - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10) + 0x31809BE32FDED1;
}

- (PKPassAuxiliaryPassInformationItem)initWithCoder:(id)a3
{
  id v4;
  PKPassAuxiliaryPassInformationItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *subtitle2;
  uint64_t v14;
  NSString *detailFooterLeadingTitle;
  uint64_t v16;
  NSString *detailFooterLeadingText;
  uint64_t v18;
  NSString *detailFooterTrailingTitle;
  uint64_t v20;
  NSString *detailFooterTrailingText;
  uint64_t v22;
  NSURL *mapsURL;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *sections;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *fields;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPassAuxiliaryPassInformationItem;
  v5 = -[PKPassAuxiliaryPassInformationItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle2"));
    v12 = objc_claimAutoreleasedReturnValue();
    subtitle2 = v5->_subtitle2;
    v5->_subtitle2 = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    detailFooterLeadingTitle = v5->_detailFooterLeadingTitle;
    v5->_detailFooterLeadingTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingDetailText"));
    v16 = objc_claimAutoreleasedReturnValue();
    detailFooterLeadingText = v5->_detailFooterLeadingText;
    v5->_detailFooterLeadingText = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingTitle"));
    v18 = objc_claimAutoreleasedReturnValue();
    detailFooterTrailingTitle = v5->_detailFooterTrailingTitle;
    v5->_detailFooterTrailingTitle = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingDetailText"));
    v20 = objc_claimAutoreleasedReturnValue();
    detailFooterTrailingText = v5->_detailFooterTrailingText;
    v5->_detailFooterTrailingText = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    mapsURL = v5->_mapsURL;
    v5->_mapsURL = (NSURL *)v22;

    v5->_merchantCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationCategory"));
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("sections"));
    v27 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("fields"));
    v32 = objc_claimAutoreleasedReturnValue();
    fields = v5->_fields;
    v5->_fields = (NSArray *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle2, CFSTR("subtitle2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailFooterLeadingTitle, CFSTR("leadingTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailFooterLeadingText, CFSTR("leadingDetailText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailFooterTrailingTitle, CFSTR("trailingTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailFooterTrailingText, CFSTR("trailingDetailText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapsURL, CFSTR("mapsURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCategory, CFSTR("locationCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sections, CFSTR("sections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fields, CFSTR("fields"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryPassInformationItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *subtitle2;
  uint64_t v14;
  NSString *detailFooterLeadingTitle;
  uint64_t v16;
  NSString *detailFooterLeadingText;
  uint64_t v18;
  NSString *detailFooterTrailingTitle;
  uint64_t v20;
  NSString *detailFooterTrailingText;
  uint64_t v22;
  NSURL *mapsURL;
  uint64_t v24;
  NSArray *sections;
  uint64_t v26;
  NSArray *fields;

  v5 = -[PKPassAuxiliaryPassInformationItem init](+[PKPassAuxiliaryPassInformationItem allocWithZone:](PKPassAuxiliaryPassInformationItem, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_subtitle2, "copyWithZone:", a3);
  subtitle2 = v5->_subtitle2;
  v5->_subtitle2 = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_detailFooterLeadingTitle, "copyWithZone:", a3);
  detailFooterLeadingTitle = v5->_detailFooterLeadingTitle;
  v5->_detailFooterLeadingTitle = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_detailFooterLeadingText, "copyWithZone:", a3);
  detailFooterLeadingText = v5->_detailFooterLeadingText;
  v5->_detailFooterLeadingText = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_detailFooterTrailingTitle, "copyWithZone:", a3);
  detailFooterTrailingTitle = v5->_detailFooterTrailingTitle;
  v5->_detailFooterTrailingTitle = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_detailFooterTrailingText, "copyWithZone:", a3);
  detailFooterTrailingText = v5->_detailFooterTrailingText;
  v5->_detailFooterTrailingText = (NSString *)v20;

  v22 = -[NSURL copyWithZone:](self->_mapsURL, "copyWithZone:", a3);
  mapsURL = v5->_mapsURL;
  v5->_mapsURL = (NSURL *)v22;

  v5->_merchantCategory = self->_merchantCategory;
  v24 = -[NSArray copyWithZone:](self->_sections, "copyWithZone:", a3);
  sections = v5->_sections;
  v5->_sections = (NSArray *)v24;

  v26 = -[NSArray copyWithZone:](self->_fields, "copyWithZone:", a3);
  fields = v5->_fields;
  v5->_fields = (NSArray *)v26;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("_subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("_subtitle2: '%@'; "), self->_subtitle2);
  objc_msgSend(v3, "appendFormat:", CFSTR("_mapsURL: '%@'; "), self->_mapsURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("_merchantCategory: '%ld'; "), self->_merchantCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("_sections: '%@'; "), self->_sections);
  objc_msgSend(v3, "appendFormat:", CFSTR("_fields: '%@'; "), self->_fields);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPassAuxiliaryPassInformationItem *v4;
  PKPassAuxiliaryPassInformationItem *v5;
  BOOL v6;

  v4 = (PKPassAuxiliaryPassInformationItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassAuxiliaryPassInformationItem _isEqualToItem:](self, "_isEqualToItem:", v5);

  return v6;
}

- (BOOL)_isEqualToItem:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *title;
  NSString *v9;
  NSString *subtitle;
  NSString *v11;
  NSString *subtitle2;
  NSString *v13;
  NSURL *mapsURL;
  NSURL *v15;
  BOOL v16;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_29;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_29;
  }
  title = self->_title;
  v9 = (NSString *)v4[2];
  if (title && v9)
  {
    if ((-[NSString isEqual:](title, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (title != v9)
  {
    goto LABEL_29;
  }
  subtitle = self->_subtitle;
  v11 = (NSString *)v4[3];
  if (subtitle && v11)
  {
    if ((-[NSString isEqual:](subtitle, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (subtitle != v11)
  {
    goto LABEL_29;
  }
  subtitle2 = self->_subtitle2;
  v13 = (NSString *)v4[4];
  if (subtitle2 && v13)
  {
    if ((-[NSString isEqual:](subtitle2, "isEqual:") & 1) == 0)
      goto LABEL_29;
  }
  else if (subtitle2 != v13)
  {
    goto LABEL_29;
  }
  mapsURL = self->_mapsURL;
  v15 = (NSURL *)v4[9];
  if (!mapsURL || !v15)
  {
    if (mapsURL == v15)
      goto LABEL_27;
LABEL_29:
    v16 = 0;
    goto LABEL_30;
  }
  if ((-[NSURL isEqual:](mapsURL, "isEqual:") & 1) == 0)
    goto LABEL_29;
LABEL_27:
  v16 = self->_merchantCategory == v4[11];
LABEL_30:

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (void)setSubtitle2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)detailFooterLeadingTitle
{
  return self->_detailFooterLeadingTitle;
}

- (void)setDetailFooterLeadingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)detailFooterTrailingTitle
{
  return self->_detailFooterTrailingTitle;
}

- (void)setDetailFooterTrailingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)detailFooterLeadingText
{
  return self->_detailFooterLeadingText;
}

- (void)setDetailFooterLeadingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)detailFooterTrailingText
{
  return self->_detailFooterTrailingText;
}

- (void)setDetailFooterTrailingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)mapsURL
{
  return self->_mapsURL;
}

- (void)setMapsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_mapsURL, 0);
  objc_storeStrong((id *)&self->_detailFooterTrailingText, 0);
  objc_storeStrong((id *)&self->_detailFooterLeadingText, 0);
  objc_storeStrong((id *)&self->_detailFooterTrailingTitle, 0);
  objc_storeStrong((id *)&self->_detailFooterLeadingTitle, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
