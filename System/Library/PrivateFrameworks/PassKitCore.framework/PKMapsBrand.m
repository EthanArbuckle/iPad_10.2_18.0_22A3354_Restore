@implementation PKMapsBrand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMapsBrand)initWithCoder:(id)a3
{
  id v4;
  PKMapsBrand *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *phoneNumber;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  NSString *detailedCategory;
  uint64_t v14;
  NSData *stylingInfoData;
  uint64_t v16;
  NSURL *logoURL;
  uint64_t v18;
  NSURL *heroImageURL;
  uint64_t v20;
  NSString *heroImageAttributionName;
  uint64_t v22;
  NSURL *businessChatURL;
  uint64_t v24;
  NSDate *lastProcessedDate;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKMapsBrand;
  v5 = -[PKMapsBrand init](&v27, sel_init);
  if (v5)
  {
    v5->_identifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("identifier"));
    v5->_resultProviderIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("resultProviderIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v10;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("brandCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandMapsCategory"));
    v12 = objc_claimAutoreleasedReturnValue();
    detailedCategory = v5->_detailedCategory;
    v5->_detailedCategory = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandStylingInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    stylingInfoData = v5->_stylingInfoData;
    v5->_stylingInfoData = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandLogoURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandHeroImageURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandHeroImageAttributionName"));
    v20 = objc_claimAutoreleasedReturnValue();
    heroImageAttributionName = v5->_heroImageAttributionName;
    v5->_heroImageAttributionName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandBusinessChatURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    businessChatURL = v5->_businessChatURL;
    v5->_businessChatURL = (NSURL *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastProcessedDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_resultProviderIdentifier, CFSTR("resultProviderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("brandCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailedCategory, CFSTR("brandMapsCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stylingInfoData, CFSTR("brandStylingInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoURL, CFSTR("brandLogoURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageURL, CFSTR("brandHeroImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageAttributionName, CFSTR("brandHeroImageAttributionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatURL, CFSTR("brandBusinessChatURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastProcessedDate, CFSTR("lastProcessedDate"));

}

- (PKMapsBrand)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKMapsBrand *v5;
  PKMapsBrand *v6;
  PKMapsBrand *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsBrand;
  v5 = -[PKMapsBrand init](&v9, sel_init);
  v6 = v5;
  if (v5)
    -[PKMapsBrand applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);
  if (-[PKMapsBrand isValid](v6, "isValid"))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *name;
  NSURL *v8;
  NSURL *businessChatURL;
  void *v10;
  NSURL *v11;
  NSURL *url;
  NSString *v13;
  NSString *phoneNumber;
  NSURL *v15;
  NSURL *logoURL;
  NSURL *v17;
  NSURL *heroImageURL;
  NSString *v19;
  NSString *heroImageAttributionName;
  NSString *v21;
  NSString *detailedCategory;
  NSData *v23;
  NSData *stylingInfoData;
  id v25;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v25;
  if (v25)
  {
    self->_identifier = objc_msgSend(v25, "pk_encryptedUint64ForKey:", CFSTR("brandIdentifier"));
    self->_resultProviderIdentifier = objc_msgSend(v25, "pk_encryptedIntForKey:", CFSTR("brandResultProviderIdentifier"));
    objc_msgSend(v25, "pk_encryptedStringForKey:", CFSTR("brandName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v25, "pk_encryptedUrlForKey:", CFSTR("brandBusinessChatURL"));
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    businessChatURL = self->_businessChatURL;
    self->_businessChatURL = v8;

    if (!self->_category)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", CFSTR("brandCategory"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_category = PKMerchantCategoryFromString(v10);

    }
    if (!self->_url)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", CFSTR("brandURL"));
      v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v11;

    }
    v5 = v25;
    if (!self->_phoneNumber)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", CFSTR("brandPhoneNumber"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v13;

      v5 = v25;
    }
    if (!self->_logoURL)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", CFSTR("brandLogoURL"));
      v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
      logoURL = self->_logoURL;
      self->_logoURL = v15;

      v5 = v25;
    }
    if (!self->_heroImageURL)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", CFSTR("brandHeroImageURL"));
      v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
      heroImageURL = self->_heroImageURL;
      self->_heroImageURL = v17;

      v5 = v25;
    }
    if (!self->_heroImageAttributionName)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", CFSTR("brandHeroImageAttributionName"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      heroImageAttributionName = self->_heroImageAttributionName;
      self->_heroImageAttributionName = v19;

      v5 = v25;
    }
    if (!self->_detailedCategory)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", CFSTR("brandMapsCategory"));
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      detailedCategory = self->_detailedCategory;
      self->_detailedCategory = v21;

      v5 = v25;
    }
    if (!self->_stylingInfoData)
    {
      objc_msgSend(v25, "pk_encryptedDataForKey:", CFSTR("brandStylingInfo"));
      v23 = (NSData *)objc_claimAutoreleasedReturnValue();
      stylingInfoData = self->_stylingInfoData;
      self->_stylingInfoData = v23;

      v5 = v25;
    }
  }

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    -[PKMapsBrand _encodeDeviceDataForCloudStoreCoder:](self, "_encodeDeviceDataForCloudStoreCoder:", a3);
}

- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("brandIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_resultProviderIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("brandResultProviderIdentifier"));

  objc_msgSend(v5, "setObject:forKey:", self->_name, CFSTR("brandName"));
  objc_msgSend(v5, "setObject:forKey:", self->_phoneNumber, CFSTR("brandPhoneNumber"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("brandURL"));

  PKMerchantCategoryToString(self->_category);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("brandCategory"));

  objc_msgSend(v5, "setObject:forKey:", self->_detailedCategory, CFSTR("brandMapsCategory"));
  -[NSURL absoluteString](self->_logoURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("brandLogoURL"));

  objc_msgSend(v5, "setObject:forKey:", self->_stylingInfoData, CFSTR("brandStylingInfo"));
  if (PKApplePayContainerEnvironment() == 2)
  {
    -[NSURL absoluteString](self->_businessChatURL, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("brandBusinessChatURL"));

    -[NSURL absoluteString](self->_heroImageURL, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("brandHeroImageURL"));

    objc_msgSend(v5, "setObject:forKey:", self->_heroImageAttributionName, CFSTR("brandHeroImageAttributionName"));
  }

}

+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    objc_msgSend(a1, "_deleteDeviceDataFromCloudStoreRecord:", a3);
}

+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandResultProviderIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandName"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandPhoneNumber"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandURL"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandCategory"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandMapsCategory"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandLogoURL"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("brandStylingInfo"));

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  PKMapsBrand *v4;
  PKMapsBrand *v5;
  BOOL v6;

  v4 = (PKMapsBrand *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKMapsBrand isEqualToMapsBrand:](self, "isEqualToMapsBrand:", v5);

  return v6;
}

- (BOOL)isEqualToMapsBrand:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  NSURL *url;
  NSURL *v15;
  void *v16;
  NSString *v17;
  _BOOL4 v18;
  BOOL v19;
  NSURL *logoURL;
  NSURL *v22;
  NSURL *heroImageURL;
  NSURL *v24;
  NSString *heroImageAttributionName;
  NSString *v26;
  NSURL *businessChatURL;
  NSURL *v28;

  v4 = a3;
  v5 = (void *)v4[4];
  v6 = self->_name;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_25;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_26;
  }
  v11 = (void *)v4[5];
  v6 = self->_phoneNumber;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_25;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_26;
  }
  url = self->_url;
  v15 = (NSURL *)v4[6];
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (url != v15)
  {
    goto LABEL_26;
  }
  v16 = (void *)v4[8];
  v6 = self->_detailedCategory;
  v17 = v16;
  if (v6 != v17)
  {
    v8 = v17;
    if (v6 && v17)
    {
      v18 = -[NSString isEqualToString:](v6, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_26;
      goto LABEL_29;
    }
LABEL_25:

    goto LABEL_26;
  }

LABEL_29:
  logoURL = self->_logoURL;
  v22 = (NSURL *)v4[10];
  if (logoURL && v22)
  {
    if ((-[NSURL isEqual:](logoURL, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (logoURL != v22)
  {
    goto LABEL_26;
  }
  heroImageURL = self->_heroImageURL;
  v24 = (NSURL *)v4[11];
  if (heroImageURL && v24)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (heroImageURL != v24)
  {
    goto LABEL_26;
  }
  heroImageAttributionName = self->_heroImageAttributionName;
  v26 = (NSString *)v4[12];
  if (heroImageAttributionName && v26)
  {
    if ((-[NSString isEqual:](heroImageAttributionName, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (heroImageAttributionName != v26)
  {
    goto LABEL_26;
  }
  businessChatURL = self->_businessChatURL;
  v28 = (NSURL *)v4[13];
  if (businessChatURL && v28)
  {
    if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (businessChatURL != v28)
  {
    goto LABEL_26;
  }
  if (self->_category == v4[7] && self->_identifier == v4[3] && self->_resultProviderIdentifier == *((_DWORD *)v4 + 4))
  {
    v19 = (self->_stylingInfoData != 0) ^ (v4[9] == 0);
    goto LABEL_27;
  }
LABEL_26:
  v19 = 0;
LABEL_27:

  return v19;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_url);
  objc_msgSend(v3, "safelyAddObject:", self->_detailedCategory);
  objc_msgSend(v3, "safelyAddObject:", self->_logoURL);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageURL);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageAttributionName);
  objc_msgSend(v3, "safelyAddObject:", self->_businessChatURL);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_identifier - v4 + 32 * v4;
  v6 = self->_resultProviderIdentifier - v5 + 32 * v5;
  v7 = self->_category - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  -[PKMapsBrand jsonRepresentation](self, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSDate description](self->_lastProcessedDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("lastProcessedDate"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  else
    v7 = 0;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v10, self, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)jsonRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_resultProviderIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resultProviderIdentifier"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_phoneNumber, CFSTR("phoneNumber"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("url"));

  PKMerchantCategoryToString(self->_category);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("category"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_detailedCategory, CFSTR("detailedCategory"));
  -[NSURL absoluteString](self->_logoURL, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("logoURL"));

  -[NSURL absoluteString](self->_heroImageURL, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("heroImageURL"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_heroImageAttributionName, CFSTR("heroImageAttributionName"));
  -[NSURL absoluteString](self->_businessChatURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("businessChatURL"));

  -[NSData description](self->_stylingInfoData, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("stylingInfoData"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  NSURL *url;
  NSURL *v15;
  NSURL *logoURL;
  NSURL *v17;
  void *v18;
  NSString *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  char v23;
  NSURL *businessChatURL;
  NSURL *v25;
  NSURL *heroImageURL;
  NSURL *v27;
  NSString *heroImageAttributionName;
  NSString *v29;
  NSData *stylingInfoData;
  NSData *v32;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_33;
  v6 = (void *)v4[4];
  v7 = self->_name;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_32;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_33;
  }
  v11 = (void *)*((_QWORD *)v5 + 5);
  v7 = self->_phoneNumber;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_32;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_33;
  }
  url = self->_url;
  v15 = (NSURL *)*((_QWORD *)v5 + 6);
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (url != v15)
  {
    goto LABEL_33;
  }
  if (self->_category != *((_QWORD *)v5 + 7)
    || self->_identifier != *((_QWORD *)v5 + 3)
    || self->_resultProviderIdentifier != *((_DWORD *)v5 + 4))
  {
    goto LABEL_33;
  }
  logoURL = self->_logoURL;
  v17 = (NSURL *)*((_QWORD *)v5 + 10);
  if (logoURL && v17)
  {
    if ((-[NSURL isEqual:](logoURL, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (logoURL != v17)
  {
    goto LABEL_33;
  }
  v18 = (void *)*((_QWORD *)v5 + 8);
  v7 = self->_detailedCategory;
  v19 = v18;
  if (v7 != v19)
  {
    v9 = v19;
    if (v7 && v19)
    {
      v20 = -[NSString isEqualToString:](v7, "isEqualToString:", v19);

      if (v20)
        goto LABEL_55;
LABEL_33:
      v21 = 0;
      goto LABEL_34;
    }
LABEL_32:

    goto LABEL_33;
  }

LABEL_55:
  stylingInfoData = self->_stylingInfoData;
  v32 = (NSData *)*((_QWORD *)v5 + 9);
  if (stylingInfoData && v32)
    v21 = -[NSData isEqual:](stylingInfoData, "isEqual:");
  else
    v21 = stylingInfoData == v32;
LABEL_34:
  v22 = PKApplePayContainerEnvironment();
  if (v22 == 2)
    v23 = 0;
  else
    v23 = v21;
  if (v22 == 2 && v21)
  {
    businessChatURL = self->_businessChatURL;
    v25 = (NSURL *)*((_QWORD *)v5 + 13);
    if (businessChatURL && v25)
    {
      if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0)
        goto LABEL_51;
    }
    else if (businessChatURL != v25)
    {
      goto LABEL_51;
    }
    heroImageURL = self->_heroImageURL;
    v27 = (NSURL *)*((_QWORD *)v5 + 11);
    if (heroImageURL && v27)
    {
      if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) != 0)
      {
LABEL_47:
        heroImageAttributionName = self->_heroImageAttributionName;
        v29 = (NSString *)*((_QWORD *)v5 + 12);
        if (heroImageAttributionName && v29)
          v23 = -[NSString isEqual:](heroImageAttributionName, "isEqual:");
        else
          v23 = heroImageAttributionName == v29;
        goto LABEL_52;
      }
    }
    else if (heroImageURL == v27)
    {
      goto LABEL_47;
    }
LABEL_51:
    v23 = 0;
  }
LABEL_52:

  return v23;
}

- (BOOL)hasCloudArchivableDeviceData
{
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  BOOL result;

  v3 = self->_identifier
    || self->_resultProviderIdentifier > 0
    || self->_name
    || self->_phoneNumber
    || self->_url
    || self->_category
    || self->_detailedCategory
    || self->_logoURL
    || self->_stylingInfoData != 0;
  v4 = PKApplePayContainerEnvironment();
  v5 = v4 == 2;
  result = v4 == 2 || v3;
  if (v5 && !v3)
    return self->_businessChatURL || self->_heroImageURL || self->_heroImageAttributionName != 0;
  return result;
}

- (void)setStylingInfoData:(id)a3
{
  MKWalletMerchantStylingInfo *lazyStylingInfo;
  id v6;

  objc_storeStrong((id *)&self->_stylingInfoData, a3);
  v6 = a3;
  lazyStylingInfo = self->_lazyStylingInfo;
  self->_lazyStylingInfo = 0;

}

- (id)stylingInfo
{
  MKWalletMerchantStylingInfo *lazyStylingInfo;
  MKWalletMerchantStylingInfo *v4;
  MKWalletMerchantStylingInfo *v5;
  MKWalletMerchantStylingInfo *v6;

  lazyStylingInfo = self->_lazyStylingInfo;
  if (!lazyStylingInfo)
  {
    if (!self->_stylingInfoData)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getMKWalletMerchantStylingInfoClass[0](), self->_stylingInfoData, 0);
    v4 = (MKWalletMerchantStylingInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lazyStylingInfo;
    self->_lazyStylingInfo = v4;

    lazyStylingInfo = self->_lazyStylingInfo;
  }
  v6 = lazyStylingInfo;
  return v6;
}

- (BOOL)isValid
{
  return self->_identifier && -[NSString length](self->_name, "length") != 0;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)detailedCategory
{
  return self->_detailedCategory;
}

- (void)setDetailedCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)stylingInfoData
{
  return self->_stylingInfoData;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_heroImageURL, a3);
}

- (NSString)heroImageAttributionName
{
  return self->_heroImageAttributionName;
}

- (void)setHeroImageAttributionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)businessChatURL
{
  return self->_businessChatURL;
}

- (void)setBusinessChatURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_businessChatURL, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_stylingInfoData, 0);
  objc_storeStrong((id *)&self->_detailedCategory, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lazyStylingInfo, 0);
}

@end
