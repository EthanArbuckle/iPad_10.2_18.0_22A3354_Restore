@implementation PKMerchant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMerchant)initWithCoder:(id)a3
{
  id v4;
  PKMerchant *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *rawName;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSString *industryCategory;
  uint64_t v14;
  NSString *rawCANL;
  uint64_t v16;
  NSString *rawCity;
  uint64_t v18;
  NSString *rawState;
  uint64_t v20;
  NSString *rawCountry;
  uint64_t v22;
  NSString *city;
  uint64_t v24;
  NSString *state;
  uint64_t v26;
  NSString *zip;
  uint64_t v28;
  NSURL *originURL;
  uint64_t v30;
  NSString *webMerchantIdentifier;
  uint64_t v32;
  NSString *webMerchantName;
  uint64_t v34;
  NSString *merchantIdentifier;
  uint64_t v36;
  NSString *displayNameIgnoringBrand;
  uint64_t v38;
  NSURL *fallbackLogoImageURL;
  uint64_t v40;
  PKMapsMerchant *mapsMerchant;
  uint64_t v42;
  uint64_t v43;
  PKMapsMerchant *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  PKMapsBrand *mapsBrand;
  uint64_t v51;
  NSString *fallbackDetailedCategory;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKMerchant;
  v5 = -[PKMerchant init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawName"));
    v8 = objc_claimAutoreleasedReturnValue();
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("industryCategory"));
    v12 = objc_claimAutoreleasedReturnValue();
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v12;

    v5->_industryCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("industryCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawCANL"));
    v14 = objc_claimAutoreleasedReturnValue();
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawCity"));
    v16 = objc_claimAutoreleasedReturnValue();
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawState"));
    v18 = objc_claimAutoreleasedReturnValue();
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawCountry"));
    v20 = objc_claimAutoreleasedReturnValue();
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v22 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v24 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zip"));
    v26 = objc_claimAutoreleasedReturnValue();
    zip = v5->_zip;
    v5->_zip = (NSString *)v26;

    v5->_cleanConfidenceLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cleanConfidenceLevel"));
    v5->_adamIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adamID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webMerchantIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webMerchantName"));
    v32 = objc_claimAutoreleasedReturnValue();
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v34;

    v5->_useRawMerchantData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useRawMerchantDataKey"));
    v5->_mapsDataIsFromLocalMatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localMapsMatch"));
    v5->_useDisplayNameIgnoringBrand = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDisplayNameIgnoringBrand"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameIgnoringBrand"));
    v36 = objc_claimAutoreleasedReturnValue();
    displayNameIgnoringBrand = v5->_displayNameIgnoringBrand;
    v5->_displayNameIgnoringBrand = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackLogoImageURL"));
    v38 = objc_claimAutoreleasedReturnValue();
    fallbackLogoImageURL = v5->_fallbackLogoImageURL;
    v5->_fallbackLogoImageURL = (NSURL *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsMerchant"));
    v40 = objc_claimAutoreleasedReturnValue();
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = (PKMapsMerchant *)v40;

    if (!v5->_mapsMerchant)
    {
      v42 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("identifier"));
      if (v42)
      {
        v43 = v42;
        v44 = objc_alloc_init(PKMapsMerchant);
        -[PKMapsMerchant setIdentifier:](v44, "setIdentifier:", v43);
        -[PKMapsMerchant setResultProviderIdentifier:](v44, "setResultProviderIdentifier:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("resultProviderIdentifier")));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsName"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMapsMerchant setName:](v44, "setName:", v45);

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMapsMerchant setPhoneNumber:](v44, "setPhoneNumber:", v46);

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMapsMerchant setURL:](v44, "setURL:", v47);

        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLatitude"));
        -[PKMapsMerchant setLocationLatitude:](v44, "setLocationLatitude:");
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLongitude"));
        -[PKMapsMerchant setLocationLongitude:](v44, "setLocationLongitude:");
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalAddress"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMapsMerchant setPostalAddress:](v44, "setPostalAddress:", v48);

        if (-[PKMapsMerchant isValid](v44, "isValid"))
          objc_storeStrong((id *)&v5->_mapsMerchant, v44);

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsBrand"));
    v49 = objc_claimAutoreleasedReturnValue();
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = (PKMapsBrand *)v49;

    v5->_fallbackcategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantFallbackCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantFallbackMapsCategory"));
    v51 = objc_claimAutoreleasedReturnValue();
    fallbackDetailedCategory = v5->_fallbackDetailedCategory;
    v5->_fallbackDetailedCategory = (NSString *)v51;

    if (!v5->_displayName)
      -[PKMerchant _regenerateDisplayName](v5, "_regenerateDisplayName");
    if (!v5->_displayNameIgnoringBrand)
      -[PKMerchant _regenerateDisplayNameIgnoringBrand](v5, "_regenerateDisplayNameIgnoringBrand");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  -[PKMerchant name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[PKMerchant rawName](self, "rawName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("rawName"));

  -[PKMerchant displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[PKMerchant industryCategory](self, "industryCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("industryCategory"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant industryCode](self, "industryCode"), CFSTR("industryCode"));
  -[PKMerchant rawCANL](self, "rawCANL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("rawCANL"));

  -[PKMerchant rawCity](self, "rawCity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("rawCity"));

  -[PKMerchant rawState](self, "rawState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("rawState"));

  -[PKMerchant rawCountry](self, "rawCountry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("rawCountry"));

  -[PKMerchant city](self, "city");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("city"));

  -[PKMerchant state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("state"));

  -[PKMerchant zip](self, "zip");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("zip"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant cleanConfidenceLevel](self, "cleanConfidenceLevel"), CFSTR("cleanConfidenceLevel"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant adamIdentifier](self, "adamIdentifier"), CFSTR("adamID"));
  -[PKMerchant originURL](self, "originURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("originURL"));

  -[PKMerchant webMerchantIdentifier](self, "webMerchantIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("webMerchantIdentifier"));

  -[PKMerchant webMerchantName](self, "webMerchantName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("webMerchantName"));

  -[PKMerchant merchantIdentifier](self, "merchantIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("merchantIdentifier"));

  -[PKMerchant mapsMerchant](self, "mapsMerchant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("mapsMerchant"));

  -[PKMerchant mapsBrand](self, "mapsBrand");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("mapsBrand"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant fallbackcategory](self, "fallbackcategory"), CFSTR("merchantFallbackCategory"));
  -[PKMerchant fallbackDetailedCategory](self, "fallbackDetailedCategory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("merchantFallbackMapsCategory"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant useRawMerchantData](self, "useRawMerchantData"), CFSTR("useRawMerchantDataKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant mapsDataIsFromLocalMatch](self, "mapsDataIsFromLocalMatch"), CFSTR("localMapsMatch"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant useDisplayNameIgnoringBrand](self, "useDisplayNameIgnoringBrand"), CFSTR("useDisplayNameIgnoringBrand"));
  -[PKMerchant displayNameIgnoringBrand](self, "displayNameIgnoringBrand");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("displayNameIgnoringBrand"));

  -[PKMerchant fallbackLogoImageURL](self, "fallbackLogoImageURL");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("fallbackLogoImageURL"));

}

- (PKMerchant)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKMerchant *v5;
  PKMapsMerchant *v6;
  PKMapsMerchant *mapsMerchant;
  PKMapsBrand *v8;
  PKMapsBrand *mapsBrand;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMerchant;
  v5 = -[PKMerchant init](&v11, sel_init);
  if (v5)
  {
    v6 = -[PKMapsMerchant initWithCloudStoreCoder:]([PKMapsMerchant alloc], "initWithCloudStoreCoder:", v4);
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = v6;

    v8 = -[PKMapsBrand initWithCloudStoreCoder:]([PKMapsBrand alloc], "initWithCloudStoreCoder:", v4);
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = v8;

    -[PKMerchant applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);
  }
  if (!-[PKMerchant isValid](v5, "isValid"))
  {

    v5 = 0;
  }

  return v5;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *name;
  NSString *v8;
  NSString *rawName;
  NSString *v10;
  NSString *industryCategory;
  NSString *v12;
  NSString *rawCANL;
  NSString *v14;
  NSString *rawCity;
  NSString *v16;
  NSString *rawState;
  NSString *v18;
  NSString *rawCountry;
  NSString *v20;
  NSString *city;
  NSString *v22;
  NSString *zip;
  NSString *v24;
  NSString *state;
  NSString *v26;
  NSString *merchantIdentifier;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  NSString *fallbackDetailedCategory;
  NSURL *v33;
  NSURL *originURL;
  NSString *v35;
  NSString *webMerchantIdentifier;
  NSString *v37;
  NSString *webMerchantName;
  PKMapsMerchant *mapsMerchant;
  PKMapsMerchant *v40;
  PKMapsMerchant *v41;
  PKMapsBrand *mapsBrand;
  PKMapsBrand *v43;
  PKMapsBrand *v44;
  id v45;

  v45 = a3;
  objc_msgSend(v45, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantRawName"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawName = self->_rawName;
    self->_rawName = v8;

    self->_industryCode = objc_msgSend(v5, "pk_encryptedIntegerForKey:", CFSTR("merchantIndustryCode"));
    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantIndustryCategory"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    industryCategory = self->_industryCategory;
    self->_industryCategory = v10;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantRawCANL"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCANL = self->_rawCANL;
    self->_rawCANL = v12;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantRawCity"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCity = self->_rawCity;
    self->_rawCity = v14;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantRawState"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawState = self->_rawState;
    self->_rawState = v16;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantRawCountry"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCountry = self->_rawCountry;
    self->_rawCountry = v18;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantCity"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    city = self->_city;
    self->_city = v20;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantZip"));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    zip = self->_zip;
    self->_zip = v22;

    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantState"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    self->_state = v24;

    self->_cleanConfidenceLevel = objc_msgSend(v5, "pk_encryptedIntegerForKey:", CFSTR("merchantCleanConfidenceLevel"));
    objc_msgSend(v5, "pk_encryptedStringForKey:", CFSTR("merchantIdentifier"));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    merchantIdentifier = self->_merchantIdentifier;
    self->_merchantIdentifier = v26;

  }
  objc_msgSend(v45, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "pk_encryptedStringForKey:", CFSTR("merchantFallbackCategory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fallbackcategory = PKMerchantCategoryFromString(v30);

    objc_msgSend(v29, "pk_encryptedStringForKey:", CFSTR("merchantFallbackMapsCategory"));
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    fallbackDetailedCategory = self->_fallbackDetailedCategory;
    self->_fallbackDetailedCategory = v31;

    self->_adamIdentifier = objc_msgSend(v29, "pk_encryptedIntegerForKey:", CFSTR("adamID"));
    objc_msgSend(v29, "pk_encryptedUrlForKey:", CFSTR("originURL"));
    v33 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originURL = self->_originURL;
    self->_originURL = v33;

    objc_msgSend(v29, "pk_encryptedStringForKey:", CFSTR("webMerchantIdentifier"));
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    webMerchantIdentifier = self->_webMerchantIdentifier;
    self->_webMerchantIdentifier = v35;

    objc_msgSend(v29, "pk_encryptedStringForKey:", CFSTR("webMerchantName"));
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    webMerchantName = self->_webMerchantName;
    self->_webMerchantName = v37;

    self->_useRawMerchantData = objc_msgSend(v29, "pk_encryptedBoolForKey:", CFSTR("useRawMerchantDataKey"));
    mapsMerchant = self->_mapsMerchant;
    if (mapsMerchant)
    {
      -[PKMapsMerchant applyPropertiesFromCloudStoreRecord:](mapsMerchant, "applyPropertiesFromCloudStoreRecord:", v45);
    }
    else
    {
      v40 = -[PKMapsMerchant initWithCloudStoreCoder:]([PKMapsMerchant alloc], "initWithCloudStoreCoder:", v45);
      v41 = self->_mapsMerchant;
      self->_mapsMerchant = v40;

    }
    mapsBrand = self->_mapsBrand;
    if (mapsBrand)
    {
      -[PKMapsBrand applyPropertiesFromCloudStoreRecord:](mapsBrand, "applyPropertiesFromCloudStoreRecord:", v45);
    }
    else
    {
      v43 = -[PKMapsBrand initWithCloudStoreCoder:]([PKMapsBrand alloc], "initWithCloudStoreCoder:", v45);
      v44 = self->_mapsBrand;
      self->_mapsBrand = v43;

    }
  }

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6;
  PKMapsMerchant *mapsMerchant;
  PKMapsBrand *mapsBrand;
  void *v9;
  id v10;

  v6 = a3;
  mapsMerchant = self->_mapsMerchant;
  v10 = v6;
  if (mapsMerchant)
    -[PKMapsMerchant encodeWithCloudStoreCoder:codingType:](mapsMerchant, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  else
    +[PKMapsMerchant deleteFromCloudStoreRecord:codingType:](PKMapsMerchant, "deleteFromCloudStoreRecord:codingType:", v6, a4);
  mapsBrand = self->_mapsBrand;
  if (mapsBrand)
    -[PKMapsBrand encodeWithCloudStoreCoder:codingType:](mapsBrand, "encodeWithCloudStoreCoder:codingType:", v10, a4);
  else
    +[PKMapsBrand deleteFromCloudStoreRecord:codingType:](PKMapsBrand, "deleteFromCloudStoreRecord:codingType:", v10, a4);
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    -[PKMerchant _encodeDeviceDataWithCloudStoreCoder:](self, "_encodeDeviceDataWithCloudStoreCoder:", v10);
  v9 = v10;
  if (a4 - 1 <= 1)
  {
    -[PKMerchant _encodeServerDataWithCloudStoreCoder:](self, "_encodeServerDataWithCloudStoreCoder:", v10);
    v9 = v10;
  }

}

- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = self->_fallbackcategory - 1;
  if (v7 > 6)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2ADB170[v7];
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("merchantFallbackCategory"));
  objc_msgSend(v6, "setObject:forKey:", self->_fallbackDetailedCategory, CFSTR("merchantFallbackMapsCategory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_adamIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("adamID"));

  -[NSURL absoluteString](self->_originURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("originURL"));

  objc_msgSend(v6, "setObject:forKey:", self->_webMerchantIdentifier, CFSTR("webMerchantIdentifier"));
  objc_msgSend(v6, "setObject:forKey:", self->_webMerchantName, CFSTR("webMerchantName"));
  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useRawMerchantData);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("useRawMerchantDataKey"));

  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self->_name, CFSTR("merchantName"));
  objc_msgSend(v5, "setObject:forKey:", self->_rawName, CFSTR("merchantRawName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_industryCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("merchantIndustryCode"));

  objc_msgSend(v5, "setObject:forKey:", self->_industryCategory, CFSTR("merchantIndustryCategory"));
  objc_msgSend(v5, "setObject:forKey:", self->_rawCANL, CFSTR("merchantRawCANL"));
  objc_msgSend(v5, "setObject:forKey:", self->_rawCity, CFSTR("merchantRawCity"));
  objc_msgSend(v5, "setObject:forKey:", self->_rawState, CFSTR("merchantRawState"));
  objc_msgSend(v5, "setObject:forKey:", self->_rawCountry, CFSTR("merchantRawCountry"));
  objc_msgSend(v5, "setObject:forKey:", self->_city, CFSTR("merchantCity"));
  objc_msgSend(v5, "setObject:forKey:", self->_zip, CFSTR("merchantZip"));
  objc_msgSend(v5, "setObject:forKey:", self->_state, CFSTR("merchantState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cleanConfidenceLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("merchantCleanConfidenceLevel"));

  objc_msgSend(v5, "setObject:forKey:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
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

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSURL *originURL;
  NSURL *v12;
  NSString *webMerchantName;
  NSString *v14;
  NSString *webMerchantIdentifier;
  NSString *v16;
  BOOL v17;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4 || self->_fallbackcategory != *((_QWORD *)v4 + 21))
    goto LABEL_30;
  v6 = (void *)*((_QWORD *)v4 + 22);
  v7 = self->_fallbackDetailedCategory;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_30;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_30;
  }
  if (self->_adamIdentifier != *((_QWORD *)v5 + 7))
  {
LABEL_30:
    v17 = 0;
    goto LABEL_31;
  }
  originURL = self->_originURL;
  v12 = (NSURL *)*((_QWORD *)v5 + 4);
  if (originURL && v12)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0)
      goto LABEL_30;
  }
  else if (originURL != v12)
  {
    goto LABEL_30;
  }
  webMerchantName = self->_webMerchantName;
  v14 = (NSString *)*((_QWORD *)v5 + 6);
  if (webMerchantName && v14)
  {
    if ((-[NSString isEqual:](webMerchantName, "isEqual:") & 1) == 0)
      goto LABEL_30;
  }
  else if (webMerchantName != v14)
  {
    goto LABEL_30;
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  v16 = (NSString *)*((_QWORD *)v5 + 5);
  if (!webMerchantIdentifier || !v16)
  {
    if (webMerchantIdentifier == v16)
      goto LABEL_26;
    goto LABEL_30;
  }
  if ((-[NSString isEqual:](webMerchantIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_30;
LABEL_26:
  if (self->_useRawMerchantData != v5[8]
    || !-[PKMapsMerchant isCloudArchivableDeviceDataEqual:](self->_mapsMerchant, "isCloudArchivableDeviceDataEqual:", *((_QWORD *)v5 + 24))|| !-[PKMapsBrand isCloudArchivableDeviceDataEqual:](self->_mapsBrand, "isCloudArchivableDeviceDataEqual:", *((_QWORD *)v5 + 25)))
  {
    goto LABEL_30;
  }
  v17 = self->_mapsDataIsFromLocalMatch == v5[10];
LABEL_31:

  return v17;
}

- (BOOL)hasCloudArchivableDeviceData
{
  return self->_fallbackcategory
      || self->_fallbackDetailedCategory
      || self->_adamIdentifier
      || self->_originURL
      || self->_webMerchantIdentifier
      || self->_webMerchantName
      || self->_useRawMerchantData
      || -[PKMapsMerchant hasCloudArchivableDeviceData](self->_mapsMerchant, "hasCloudArchivableDeviceData")
      || -[PKMapsBrand hasCloudArchivableDeviceData](self->_mapsBrand, "hasCloudArchivableDeviceData");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_rawName);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_industryCategory);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCANL);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCity);
  objc_msgSend(v3, "safelyAddObject:", self->_rawState);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCountry);
  objc_msgSend(v3, "safelyAddObject:", self->_city);
  objc_msgSend(v3, "safelyAddObject:", self->_state);
  objc_msgSend(v3, "safelyAddObject:", self->_zip);
  objc_msgSend(v3, "safelyAddObject:", self->_originURL);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantName);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsMerchant);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsBrand);
  objc_msgSend(v3, "safelyAddObject:", self->_fallbackDetailedCategory);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_industryCode - v4 + 32 * v4;
  v6 = self->_cleanConfidenceLevel - v5 + 32 * v5;
  v7 = self->_adamIdentifier - v6 + 32 * v6;
  v8 = self->_fallbackcategory - v7 + 32 * v7;
  v9 = self->_useRawMerchantData - v8 + 32 * v8;
  v10 = self->_useDisplayNameIgnoringBrand - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKMerchant *v4;
  PKMerchant *v5;
  BOOL v6;

  v4 = (PKMerchant *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKMerchant isEqualToMerchant:](self, "isEqualToMerchant:", v5);

  return v6;
}

- (BOOL)isEqualToMerchant:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *v6;
  BOOL v7;
  NSString *rawName;
  NSString *v9;
  NSString *displayName;
  NSString *v11;
  NSString *industryCategory;
  NSString *v13;
  NSString *rawCANL;
  NSString *v15;
  NSString *rawCity;
  NSString *v17;
  NSString *rawState;
  NSString *v19;
  NSString *rawCountry;
  NSString *v21;
  NSString *city;
  NSString *v23;
  NSString *state;
  NSString *v25;
  NSString *zip;
  NSString *v27;
  NSURL *originURL;
  NSURL *v29;
  NSString *webMerchantName;
  NSString *v31;
  NSString *webMerchantIdentifier;
  NSString *v33;
  NSString *merchantIdentifier;
  NSString *v35;
  PKMapsMerchant *mapsMerchant;
  PKMapsMerchant *v37;
  PKMapsBrand *mapsBrand;
  PKMapsBrand *v39;
  NSString *fallbackDetailedCategory;
  NSString *v41;
  NSURL *fallbackLogoImageURL;
  NSURL *v43;
  BOOL v44;

  v4 = a3;
  name = self->_name;
  v6 = (NSString *)v4[10];
  if (name)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (name != v6)
      goto LABEL_106;
  }
  else if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
  {
    goto LABEL_106;
  }
  rawName = self->_rawName;
  v9 = (NSString *)v4[11];
  if (rawName && v9)
  {
    if ((-[NSString isEqual:](rawName, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (rawName != v9)
  {
    goto LABEL_106;
  }
  displayName = self->_displayName;
  v11 = (NSString *)v4[2];
  if (displayName && v11)
  {
    if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (displayName != v11)
  {
    goto LABEL_106;
  }
  industryCategory = self->_industryCategory;
  v13 = (NSString *)v4[9];
  if (industryCategory && v13)
  {
    if ((-[NSString isEqual:](industryCategory, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (industryCategory != v13)
  {
    goto LABEL_106;
  }
  rawCANL = self->_rawCANL;
  v15 = (NSString *)v4[13];
  if (rawCANL && v15)
  {
    if ((-[NSString isEqual:](rawCANL, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (rawCANL != v15)
  {
    goto LABEL_106;
  }
  rawCity = self->_rawCity;
  v17 = (NSString *)v4[14];
  if (rawCity && v17)
  {
    if ((-[NSString isEqual:](rawCity, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (rawCity != v17)
  {
    goto LABEL_106;
  }
  rawState = self->_rawState;
  v19 = (NSString *)v4[15];
  if (rawState && v19)
  {
    if ((-[NSString isEqual:](rawState, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (rawState != v19)
  {
    goto LABEL_106;
  }
  rawCountry = self->_rawCountry;
  v21 = (NSString *)v4[16];
  if (rawCountry && v21)
  {
    if ((-[NSString isEqual:](rawCountry, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (rawCountry != v21)
  {
    goto LABEL_106;
  }
  city = self->_city;
  v23 = (NSString *)v4[17];
  if (city && v23)
  {
    if ((-[NSString isEqual:](city, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (city != v23)
  {
    goto LABEL_106;
  }
  state = self->_state;
  v25 = (NSString *)v4[18];
  if (state && v25)
  {
    if ((-[NSString isEqual:](state, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (state != v25)
  {
    goto LABEL_106;
  }
  zip = self->_zip;
  v27 = (NSString *)v4[19];
  if (zip && v27)
  {
    if ((-[NSString isEqual:](zip, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (zip != v27)
  {
    goto LABEL_106;
  }
  originURL = self->_originURL;
  v29 = (NSURL *)v4[4];
  if (originURL && v29)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (originURL != v29)
  {
    goto LABEL_106;
  }
  webMerchantName = self->_webMerchantName;
  v31 = (NSString *)v4[6];
  if (webMerchantName && v31)
  {
    if ((-[NSString isEqual:](webMerchantName, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (webMerchantName != v31)
  {
    goto LABEL_106;
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  v33 = (NSString *)v4[5];
  if (webMerchantIdentifier && v33)
  {
    if ((-[NSString isEqual:](webMerchantIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (webMerchantIdentifier != v33)
  {
    goto LABEL_106;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v35 = (NSString *)v4[12];
  if (merchantIdentifier && v35)
  {
    if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (merchantIdentifier != v35)
  {
    goto LABEL_106;
  }
  mapsMerchant = self->_mapsMerchant;
  v37 = (PKMapsMerchant *)v4[24];
  if (mapsMerchant && v37)
  {
    if (!-[PKMapsMerchant isEqual:](mapsMerchant, "isEqual:"))
      goto LABEL_106;
  }
  else if (mapsMerchant != v37)
  {
    goto LABEL_106;
  }
  mapsBrand = self->_mapsBrand;
  v39 = (PKMapsBrand *)v4[25];
  if (mapsBrand && v39)
  {
    if (!-[PKMapsBrand isEqual:](mapsBrand, "isEqual:"))
      goto LABEL_106;
  }
  else if (mapsBrand != v39)
  {
    goto LABEL_106;
  }
  fallbackDetailedCategory = self->_fallbackDetailedCategory;
  v41 = (NSString *)v4[22];
  if (fallbackDetailedCategory && v41)
  {
    if ((-[NSString isEqual:](fallbackDetailedCategory, "isEqual:") & 1) == 0)
      goto LABEL_106;
  }
  else if (fallbackDetailedCategory != v41)
  {
    goto LABEL_106;
  }
  fallbackLogoImageURL = self->_fallbackLogoImageURL;
  v43 = (NSURL *)v4[23];
  if (!fallbackLogoImageURL || !v43)
  {
    if (fallbackLogoImageURL == v43)
      goto LABEL_99;
LABEL_106:
    v44 = 0;
    goto LABEL_107;
  }
  if ((-[NSURL isEqual:](fallbackLogoImageURL, "isEqual:") & 1) == 0)
    goto LABEL_106;
LABEL_99:
  if (self->_industryCode != v4[8]
    || self->_cleanConfidenceLevel != v4[20]
    || self->_adamIdentifier != v4[7]
    || self->_fallbackcategory != v4[21]
    || self->_useRawMerchantData != *((unsigned __int8 *)v4 + 8)
    || self->_useDisplayNameIgnoringBrand != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_106;
  }
  v44 = self->_mapsDataIsFromLocalMatch == *((unsigned __int8 *)v4 + 10);
LABEL_107:

  return v44;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PKMerchant jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  else
    v5 = 0;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v8, self, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)jsonDictionaryRepresentation
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
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_industryCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("industryCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_industryCategory, CFSTR("industryCategory"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawName, CFSTR("rawName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCANL, CFSTR("rawCANL"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCity, CFSTR("rawCity"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawState, CFSTR("rawState"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCountry, CFSTR("rawCountry"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_city, CFSTR("city"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_state, CFSTR("state"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_zip, CFSTR("zip"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cleanConfidenceLevel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cleanConfidenceLevel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKMerchant isValid](self, "isValid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isValid"));

  -[PKMerchant originURL](self, "originURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originURL"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_webMerchantIdentifier, CFSTR("webMerchantID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_webMerchantName, CFSTR("webMerchantName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKMerchant adamIdentifier](self, "adamIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("adamID"));

  -[PKMerchant merchantIdentifier](self, "merchantIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("merchantIdentifier"));

  -[PKMapsMerchant jsonRepresentation](self->_mapsMerchant, "jsonRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("mapsMerchant"));

  -[PKMapsBrand jsonRepresentation](self->_mapsBrand, "jsonRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("mapsBrand"));

  v13 = self->_fallbackcategory - 1;
  if (v13 > 6)
    v14 = CFSTR("unknown");
  else
    v14 = off_1E2ADB170[v13];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("fallbackCategory"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_fallbackDetailedCategory, CFSTR("fallbackDetailedCategory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useRawMerchantData);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("useRawMerchantData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useDisplayNameIgnoringBrand);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("useDisplayNameIgnoringBrand"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_displayNameIgnoringBrand, CFSTR("displayNameIgnoringBrand"));
  -[NSURL absoluteString](self->_fallbackLogoImageURL, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("fallbackLogoImageURL"));

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

- (void)setMapsMerchant:(id)a3
{
  PKMapsMerchant *v5;
  PKMapsMerchant *v6;

  v5 = (PKMapsMerchant *)a3;
  if (self->_mapsMerchant != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapsMerchant, a3);
    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
    -[PKMerchant _regenerateDisplayNameIgnoringBrand](self, "_regenerateDisplayNameIgnoringBrand");
    v5 = v6;
  }

}

- (void)setMapsBrand:(id)a3
{
  PKMapsBrand *v5;
  PKMapsBrand *v6;

  v5 = (PKMapsBrand *)a3;
  if (self->_mapsBrand != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mapsBrand, a3);
    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
    v5 = v6;
  }

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  if (self->_name != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    name = self->_name;
    self->_name = v4;

    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
  }
}

- (void)setRawName:(id)a3
{
  NSString *v4;
  NSString *rawName;

  if (self->_rawName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    rawName = self->_rawName;
    self->_rawName = v4;

    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
  }
}

- (void)setUseRawMerchantData:(BOOL)a3
{
  if (((!self->_useRawMerchantData ^ a3) & 1) == 0)
  {
    self->_useRawMerchantData = a3;
    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
  }
}

- (void)setWebMerchantName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_webMerchantName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_webMerchantName, a3);
    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
    v5 = v6;
  }

}

- (NSString)displayName
{
  NSString *displayName;

  displayName = self->_displayName;
  if (!displayName)
  {
    -[PKMerchant _regenerateDisplayName](self, "_regenerateDisplayName");
    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)displayNameIgnoringBrand
{
  NSString *displayNameIgnoringBrand;

  displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  if (!displayNameIgnoringBrand)
  {
    -[PKMerchant _regenerateDisplayNameIgnoringBrand](self, "_regenerateDisplayNameIgnoringBrand");
    displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  }
  return displayNameIgnoringBrand;
}

- (BOOL)isValid
{
  return -[NSString length](self->_name, "length") || -[NSString length](self->_rawName, "length") != 0;
}

- (BOOL)hasMapsMatch
{
  return self->_mapsMerchant || self->_mapsBrand != 0;
}

- (NSURL)heroImageURL
{
  void *v2;
  void *v4;
  void *v5;
  id v6;

  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    -[PKMapsMerchant heroImageURL](self->_mapsMerchant, "heroImageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[PKMapsBrand heroImageURL](self->_mapsBrand, "heroImageURL");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  return (NSURL *)v2;
}

- (NSURL)logoImageURL
{
  NSURL *v3;

  if (self->_useRawMerchantData
    || (-[PKMapsBrand logoURL](self->_mapsBrand, "logoURL"), (v3 = (NSURL *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = self->_fallbackLogoImageURL;
  }
  return v3;
}

- (NSString)heroImageAttribution
{
  void *v2;
  PKMapsMerchant **p_mapsMerchant;
  void *v5;
  PKMapsBrand **p_mapsBrand;
  PKMapsBrand *mapsBrand;
  void *v8;

  if (self->_useRawMerchantData)
    goto LABEL_2;
  p_mapsMerchant = &self->_mapsMerchant;
  -[PKMapsMerchant heroImageURL](self->_mapsMerchant, "heroImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_6:
    -[PKMapsMerchant heroImageAttributionName](*p_mapsMerchant, "heroImageAttributionName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v2;
  }
  mapsBrand = self->_mapsBrand;
  p_mapsBrand = &self->_mapsBrand;
  -[PKMapsBrand heroImageURL](mapsBrand, "heroImageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    p_mapsMerchant = (PKMapsMerchant **)p_mapsBrand;
    goto LABEL_6;
  }
LABEL_2:
  v2 = 0;
  return (NSString *)v2;
}

- (NSString)phoneNumber
{
  void *v2;
  void *v4;
  void *v5;
  id v6;

  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    -[PKMapsMerchant phoneNumber](self->_mapsMerchant, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[PKMapsBrand phoneNumber](self->_mapsBrand, "phoneNumber");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  return (NSString *)v2;
}

- (NSURL)businessChatURL
{
  void *v2;
  void *v4;
  void *v5;
  id v6;

  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    -[PKMapsMerchant businessChatURL](self->_mapsMerchant, "businessChatURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[PKMapsBrand businessChatURL](self->_mapsBrand, "businessChatURL");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  return (NSURL *)v2;
}

- (int64_t)category
{
  int64_t v3;
  int64_t result;
  int64_t v5;

  if (self->_useRawMerchantData)
    return self->_fallbackcategory;
  v3 = -[PKMapsBrand category](self->_mapsBrand, "category");
  result = -[PKMapsMerchant category](self->_mapsMerchant, "category");
  v5 = result;
  if (v3)
    result = v3;
  if (!(v3 | v5))
    return self->_fallbackcategory;
  return result;
}

- (NSString)detailedCategory
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!self->_useRawMerchantData
    && ((-[PKMapsBrand detailedCategory](self->_mapsBrand, "detailedCategory"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         -[PKMapsMerchant detailedCategory](self->_mapsMerchant, "detailedCategory"),
         v5 = objc_claimAutoreleasedReturnValue(),
         v6 = (void *)v5,
         (v7 = v4) != 0)
     || (v7 = (void *)v5) != 0))
  {
    v3 = v7;

  }
  else
  {
    v3 = self->_fallbackDetailedCategory;
  }
  return v3;
}

- (void)_regenerateDisplayName
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  char v10;
  NSString *v11;
  NSString *name;
  NSString *v13;
  NSString *displayName;

  if (self->_useRawMerchantData)
  {
    v3 = 0;
    goto LABEL_19;
  }
  -[PKMapsMerchant name](self->_mapsMerchant, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsBrand name](self->_mapsBrand, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v4, "length");
  if (v7)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v10 = objc_msgSend(v4, "containsString:", v5);
    v9 = v5;
    if ((v10 & 1) == 0)
    {
      if (objc_msgSend(v5, "containsString:", v4))
        v9 = v5;
      else
        v9 = v4;
    }
    goto LABEL_17;
  }
  if (v6)
    v9 = v5;
  else
    v9 = v4;
  if (v7 | v6)
  {
LABEL_17:
    v3 = v9;
    goto LABEL_18;
  }
  v3 = 0;
LABEL_18:

LABEL_19:
  if (!objc_msgSend(v3, "length"))
  {
    v11 = self->_webMerchantName;

    if (!-[NSString length](v11, "length"))
    {
      name = self->_name;
      if (!name)
        name = self->_rawName;
      v13 = name;

      v11 = v13;
    }
    PKMerchantFormattedDisplayName(v11);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  displayName = self->_displayName;
  self->_displayName = (NSString *)v3;

}

- (void)_regenerateDisplayNameIgnoringBrand
{
  NSString *v3;
  NSString *displayNameIgnoringBrand;
  id v5;

  -[PKMapsMerchant name](self->_mapsMerchant, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PKMerchantFormattedDisplayName(v5);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  self->_displayNameIgnoringBrand = v3;

}

- (id)uniqueIdentifier
{
  uint64_t v3;

  if (self->_mapsBrand)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mapsBrand-%lu"), -[PKMapsBrand identifier](self->_mapsBrand, "identifier"), v3);
  }
  else if (self->_mapsMerchant)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mapsMerchant-%lu"), -[PKMapsMerchant identifier](self->_mapsMerchant, "identifier"), v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("merchant-%@-%@"), self->_rawName, self->_name);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldBeCombinedWithMerchant:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSString *v37;
  uint64_t v38;
  void *v39;
  NSString *rawCANL;
  NSString *v41;
  NSString *v42;
  uint64_t v43;
  BOOL v44;
  NSString *webMerchantIdentifier;
  void *v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "mapsBrand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "useRawMerchantData") & 1) != 0 || self->_useRawMerchantData)
    goto LABEL_87;
  if (v9 && self->_mapsBrand)
  {
    v10 = objc_msgSend(v9, "identifier");
    if (v10 != -[PKMapsBrand identifier](self->_mapsBrand, "identifier"))
    {
      objc_msgSend(v8, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMerchant displayName](self, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if (v13 == v14)
      {

      }
      else
      {
        v15 = v14;
        if (!v13 || !v14)
        {

          goto LABEL_18;
        }
        v3 = (void *)-[NSObject caseInsensitiveCompare:](v13, "caseInsensitiveCompare:", v14);

        if (v3)
          goto LABEL_83;
      }
      -[PKMapsBrand url](self->_mapsBrand, "url");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[PKMapsBrand url](self->_mapsBrand, "url");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "url");
        v17 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v17;
        if (v5 && v17)
        {
          v18 = objc_msgSend(v5, "isEqual:", v17);
          v19 = v6;
          if ((v18 & 1) != 0)
            goto LABEL_29;
        }
        else
        {
          v19 = v5;
          if (v5 == (void *)v17)
            goto LABEL_29;
        }
      }
      -[PKMapsBrand detailedCategory](self->_mapsBrand, "detailedCategory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_31;
      -[PKMapsBrand detailedCategory](self->_mapsBrand, "detailedCategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "detailedCategory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v21;
      v23 = v22;
      if (v4 != v23)
      {
        v3 = v23;
        if (v4 && v23)
        {
          v24 = objc_msgSend(v4, "isEqualToString:", v23);

          if ((v24 & 1) != 0)
          {
            v25 = 1;
            goto LABEL_77;
          }
        }
        else
        {

        }
LABEL_31:
        v62 = v20;
        -[PKMapsBrand phoneNumber](self->_mapsBrand, "phoneNumber");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          -[PKMapsBrand phoneNumber](self->_mapsBrand, "phoneNumber");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "phoneNumber");
          v27 = objc_claimAutoreleasedReturnValue();
          v59 = v20;
          if (v20 && v27)
          {
            v58 = (void *)v27;
            if ((objc_msgSend(v20, "isEqual:", v27) & 1) != 0)
            {
              v61 = 1;
LABEL_74:

              goto LABEL_75;
            }
          }
          else
          {
            if (v20 == (void *)v27)
            {
              v61 = 1;

LABEL_75:
LABEL_76:

              v20 = v62;
              v25 = v61;
              if (!v62)
              {
LABEL_78:

                if (v16)
                {

                }
                if ((v25 & 1) != 0)
                  goto LABEL_98;
                PKLogFacilityTypeGetObject(0);
                v13 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  goto LABEL_82;
                objc_msgSend(v8, "displayName");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v64 = v15;
                _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "We found 2 brands with the same name but they didn't match on any properties: %@", buf, 0xCu);
LABEL_18:

LABEL_82:
                goto LABEL_83;
              }
LABEL_77:

              goto LABEL_78;
            }
            v58 = (void *)v27;
          }
        }
        -[PKMapsBrand logoURL](self->_mapsBrand, "logoURL");
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          -[PKMapsBrand logoURL](self->_mapsBrand, "logoURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logoURL");
          v28 = objc_claimAutoreleasedReturnValue();
          v56 = v20;
          if (v20 && v28)
          {
            v55 = (void *)v28;
            if ((objc_msgSend(v20, "isEqual:", v28) & 1) != 0)
            {
              v61 = 1;
LABEL_68:
              v36 = (void *)v60;
LABEL_72:

LABEL_73:
              if (!v26)
                goto LABEL_76;
              goto LABEL_74;
            }
          }
          else
          {
            if (v20 == (void *)v28)
            {
              v61 = 1;
              v55 = v20;
              goto LABEL_68;
            }
            v55 = (void *)v28;
          }
          v57 = v3;
        }
        else
        {
          v57 = v3;
        }
        -[PKMapsBrand heroImageURL](self->_mapsBrand, "heroImageURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[PKMapsBrand heroImageURL](self->_mapsBrand, "heroImageURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "heroImageURL");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v20 && v30)
          {
            v51 = (void *)v30;
            if ((objc_msgSend(v20, "isEqual:") & 1) != 0)
            {
              v61 = 1;
              goto LABEL_70;
            }
          }
          else
          {
            if (v20 == (void *)v30)
            {
              v61 = 1;
              v51 = v20;
              goto LABEL_70;
            }
            v51 = (void *)v30;
          }
          v52 = v26;
          v53 = v6;
          v54 = v5;
        }
        else
        {
          v52 = v26;
          v53 = v6;
          v54 = v5;
        }
        -[PKMapsBrand businessChatURL](self->_mapsBrand, "businessChatURL", v51);
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          -[PKMapsBrand businessChatURL](self->_mapsBrand, "businessChatURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "businessChatURL");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          if (v33 && v34)
            v61 = objc_msgSend(v33, "isEqual:", v34);
          else
            v61 = v33 == (void *)v34;

        }
        else
        {
          v61 = 0;
        }
        v6 = v53;
        v5 = v54;
        v26 = v52;
        if (!v29)
        {
LABEL_71:
          v3 = v57;
          v36 = (void *)v60;
          if (!v60)
            goto LABEL_73;
          goto LABEL_72;
        }
LABEL_70:

        goto LABEL_71;
      }

      v19 = v6;
      if (v16)
      {
LABEL_29:

LABEL_94:
      }
    }
LABEL_98:
    v44 = 1;
    goto LABEL_107;
  }
LABEL_83:
  objc_msgSend(v8, "mapsMerchant", v51);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = v37;
  if (v37)
  {
    if (self->_mapsMerchant)
    {
      v38 = -[NSString identifier](v37, "identifier");
      if (v38 == -[PKMapsMerchant identifier](self->_mapsMerchant, "identifier"))
        goto LABEL_94;
    }
  }

LABEL_87:
  if (self->_rawCANL)
  {
    objc_msgSend(v8, "rawCANL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    rawCANL = self->_rawCANL;
    v16 = v39;
    v41 = rawCANL;
    if (v16 == v41)
    {

      goto LABEL_94;
    }
    v42 = v41;
    if (v16 && v41)
    {
      v43 = -[NSString caseInsensitiveCompare:](v16, "caseInsensitiveCompare:", v41);

      if (!v43)
        goto LABEL_98;
    }
    else
    {

    }
  }
  if (self->_adamIdentifier && objc_msgSend(v8, "adamIdentifier") == self->_adamIdentifier)
    goto LABEL_98;
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier)
  {
    objc_msgSend(v8, "webMerchantIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = webMerchantIdentifier;
    v48 = v46;
    v49 = v48;
    if (v47 == v48)
    {
      v44 = 1;
    }
    else if (v48)
    {
      v44 = -[NSString caseInsensitiveCompare:](v47, "caseInsensitiveCompare:", v48) == NSOrderedSame;
    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    v44 = 0;
  }
LABEL_107:

  return v44;
}

- (BOOL)hasBetterVisualPropertiesThanMerchant:(id)a3
{
  id v4;
  void *v5;
  PKMapsBrand *mapsBrand;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  PKMapsMerchant *mapsMerchant;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "mapsBrand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (mapsBrand = self->_mapsBrand, v5, !mapsBrand))
  {
    if (self->_mapsBrand)
    {
      objc_msgSend(v4, "mapsBrand");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_21;
      if (self->_mapsBrand)
        goto LABEL_13;
    }
    objc_msgSend(v4, "mapsBrand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_13;
    objc_msgSend(v4, "mapsMerchant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

      goto LABEL_16;
    }
    if (!self->_mapsMerchant)
    {
LABEL_16:
      objc_msgSend(v4, "mapsMerchant");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_13;
      mapsMerchant = self->_mapsMerchant;

      if (!mapsMerchant)
        goto LABEL_13;
      -[PKMapsMerchant heroImageURL](self->_mapsMerchant, "heroImageURL");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_13;
      v12 = (void *)v22;
      objc_msgSend(v4, "mapsMerchant");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "heroImageURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_21:
    v18 = 1;
    goto LABEL_22;
  }
  -[PKMapsBrand heroImageURL](self->_mapsBrand, "heroImageURL");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v4, "mapsBrand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heroImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_21;
  }
  -[PKMapsBrand logoURL](self->_mapsBrand, "logoURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_13;
  v12 = (void *)v11;
  objc_msgSend(v4, "mapsBrand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logoURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v15 = v14;

  if (!v15)
    goto LABEL_21;
LABEL_13:
  v18 = 0;
LABEL_22:

  return v18;
}

- (NSURL)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (int64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(int64_t)a3
{
  self->_adamIdentifier = a3;
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)rawName
{
  return self->_rawName;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)rawCANL
{
  return self->_rawCANL;
}

- (void)setRawCANL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)rawCity
{
  return self->_rawCity;
}

- (void)setRawCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)rawState
{
  return self->_rawState;
}

- (void)setRawState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)rawCountry
{
  return self->_rawCountry;
}

- (void)setRawCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)cleanConfidenceLevel
{
  return self->_cleanConfidenceLevel;
}

- (void)setCleanConfidenceLevel:(int64_t)a3
{
  self->_cleanConfidenceLevel = a3;
}

- (BOOL)useRawMerchantData
{
  return self->_useRawMerchantData;
}

- (BOOL)useDisplayNameIgnoringBrand
{
  return self->_useDisplayNameIgnoringBrand;
}

- (void)setUseDisplayNameIgnoringBrand:(BOOL)a3
{
  self->_useDisplayNameIgnoringBrand = a3;
}

- (int64_t)fallbackcategory
{
  return self->_fallbackcategory;
}

- (void)setFallbackcategory:(int64_t)a3
{
  self->_fallbackcategory = a3;
}

- (NSString)fallbackDetailedCategory
{
  return self->_fallbackDetailedCategory;
}

- (void)setFallbackDetailedCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)fallbackLogoImageURL
{
  return self->_fallbackLogoImageURL;
}

- (void)setFallbackLogoImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (PKMapsMerchant)mapsMerchant
{
  return self->_mapsMerchant;
}

- (PKMapsBrand)mapsBrand
{
  return self->_mapsBrand;
}

- (BOOL)mapsDataIsFromLocalMatch
{
  return self->_mapsDataIsFromLocalMatch;
}

- (void)setMapsDataIsFromLocalMatch:(BOOL)a3
{
  self->_mapsDataIsFromLocalMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsBrand, 0);
  objc_storeStrong((id *)&self->_mapsMerchant, 0);
  objc_storeStrong((id *)&self->_fallbackLogoImageURL, 0);
  objc_storeStrong((id *)&self->_fallbackDetailedCategory, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_rawCountry, 0);
  objc_storeStrong((id *)&self->_rawState, 0);
  objc_storeStrong((id *)&self->_rawCity, 0);
  objc_storeStrong((id *)&self->_rawCANL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_displayNameIgnoringBrand, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
