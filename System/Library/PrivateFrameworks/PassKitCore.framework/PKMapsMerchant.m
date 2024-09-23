@implementation PKMapsMerchant

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
  void *v13;

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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationLatitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("locationLatitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationLongitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("locationLongitude"));

  -[NSURL absoluteString](self->_heroImageURL, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("heroImageURL"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_heroImageAttributionName, CFSTR("heroImageAttributionName"));
  PKMerchantCategoryToString(self->_category);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("category"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_detailedCategory, CFSTR("detailedCategory"));
  -[NSURL absoluteString](self->_businessChatURL, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("businessChatURL"));

  -[NSData description](self->_stylingInfoData, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("stylingInfo"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
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
  CNPostalAddress *postalAddress;
  CNPostalAddress *v17;
  NSURL *heroImageURL;
  NSURL *v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  void *v23;
  NSString *v24;
  _BOOL4 v25;
  char v26;
  NSData *stylingInfoData;
  NSData *v29;
  NSURL *businessChatURL;
  NSURL *v31;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_identifier != v4[3] || self->_resultProviderIdentifier != *((_DWORD *)v4 + 4))
    goto LABEL_46;
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
      goto LABEL_45;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_46;
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
      goto LABEL_45;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_46;
  }
  url = self->_url;
  v15 = (NSURL *)*((_QWORD *)v5 + 6);
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (url != v15)
  {
    goto LABEL_46;
  }
  if (self->_locationLatitude != *((double *)v5 + 7) || self->_locationLongitude != *((double *)v5 + 8))
    goto LABEL_46;
  postalAddress = self->_postalAddress;
  v17 = (CNPostalAddress *)*((_QWORD *)v5 + 9);
  if (postalAddress && v17)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (postalAddress != v17)
  {
    goto LABEL_46;
  }
  heroImageURL = self->_heroImageURL;
  v19 = (NSURL *)*((_QWORD *)v5 + 10);
  if (heroImageURL && v19)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0)
      goto LABEL_46;
  }
  else if (heroImageURL != v19)
  {
    goto LABEL_46;
  }
  v20 = (void *)*((_QWORD *)v5 + 11);
  v7 = self->_heroImageAttributionName;
  v21 = v20;
  if (v7 == v21)
  {

  }
  else
  {
    v9 = v21;
    if (!v7 || !v21)
      goto LABEL_45;
    v22 = -[NSString isEqualToString:](v7, "isEqualToString:", v21);

    if (!v22)
      goto LABEL_46;
  }
  if (self->_category != *((_QWORD *)v5 + 12))
    goto LABEL_46;
  v23 = (void *)*((_QWORD *)v5 + 13);
  v7 = self->_detailedCategory;
  v24 = v23;
  if (v7 == v24)
  {

    goto LABEL_49;
  }
  v9 = v24;
  if (!v7 || !v24)
  {
LABEL_45:

    goto LABEL_46;
  }
  v25 = -[NSString isEqualToString:](v7, "isEqualToString:", v24);

  if (!v25)
    goto LABEL_46;
LABEL_49:
  stylingInfoData = self->_stylingInfoData;
  v29 = (NSData *)*((_QWORD *)v5 + 14);
  if (stylingInfoData && v29)
  {
    if ((-[NSData isEqual:](stylingInfoData, "isEqual:") & 1) != 0)
      goto LABEL_54;
LABEL_46:
    v26 = 0;
    goto LABEL_47;
  }
  if (stylingInfoData != v29)
    goto LABEL_46;
LABEL_54:
  businessChatURL = self->_businessChatURL;
  v31 = (NSURL *)*((_QWORD *)v5 + 15);
  if (businessChatURL && v31)
    v26 = -[NSURL isEqual:](businessChatURL, "isEqual:");
  else
    v26 = businessChatURL == v31;
LABEL_47:

  return v26;
}

- (BOOL)hasCloudArchivableDeviceData
{
  BOOL result;
  CLLocationCoordinate2D v4;

  result = self->_identifier
        || self->_resultProviderIdentifier > 0
        || self->_name
        || self->_phoneNumber
        || self->_url
        || (v4 = CLLocationCoordinate2DMake(self->_locationLatitude, self->_locationLongitude),
            CLLocationCoordinate2DIsValid(v4))
        || self->_postalAddress
        || self->_heroImageURL
        || self->_heroImageAttributionName
        || self->_category
        || self->_detailedCategory
        || self->_stylingInfoData
        || self->_businessChatURL != 0;
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
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", getMKWalletMerchantStylingInfoClass_1[0](), self->_stylingInfoData, 0);
    v4 = (MKWalletMerchantStylingInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lazyStylingInfo;
    self->_lazyStylingInfo = v4;

    lazyStylingInfo = self->_lazyStylingInfo;
  }
  v6 = lazyStylingInfo;
  return v6;
}

- (CLLocation)location
{
  double latitude;
  double longitude;
  void *v5;
  CLLocationCoordinate2D v7;

  v7 = CLLocationCoordinate2DMake(self->_locationLatitude, self->_locationLongitude);
  latitude = v7.latitude;
  longitude = v7.longitude;
  if (!CLLocationCoordinate2DIsValid(v7) || self->_locationLatitude == 0.0 && self->_locationLongitude == 0.0)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
  return (CLLocation *)v5;
}

- (void)setLocation:(id)a3
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v6;

  objc_msgSend(a3, "coordinate");
  latitude = v6.latitude;
  longitude = v6.longitude;
  if (CLLocationCoordinate2DIsValid(v6))
  {
    self->_locationLatitude = latitude;
    self->_locationLongitude = longitude;
  }
}

- (BOOL)isValid
{
  return self->_identifier && -[NSString length](self->_name, "length") != 0;
}

- (PKMapsMerchant)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKMapsMerchant *v5;
  PKMapsMerchant *v6;
  PKMapsMerchant *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchant;
  v5 = -[PKMapsMerchant init](&v9, sel_init);
  v6 = v5;
  if (v5)
    -[PKMapsMerchant applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);
  if (-[PKMapsMerchant isValid](v6, "isValid"))
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
  double v11;
  double v12;
  NSString *v13;
  NSString *phoneNumber;
  NSURL *v15;
  NSURL *url;
  CNPostalAddress *v17;
  CNPostalAddress *v18;
  CNPostalAddress *postalAddress;
  NSURL *v20;
  NSURL *heroImageURL;
  NSString *v22;
  NSString *heroImageAttributionName;
  void *v24;
  NSData *v25;
  NSData *stylingInfoData;
  id v27;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v27;
  if (v27)
  {
    self->_identifier = objc_msgSend(v27, "pk_encryptedUint64ForKey:", CFSTR("merchantMapsIdentifier"));
    self->_resultProviderIdentifier = objc_msgSend(v27, "pk_encryptedIntForKey:", CFSTR("merchantResultProviderIdentifier"));
    objc_msgSend(v27, "pk_encryptedStringForKey:", CFSTR("merchantMapsName"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v27, "pk_encryptedUrlForKey:", CFSTR("merchantBusinessChatURL"));
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    businessChatURL = self->_businessChatURL;
    self->_businessChatURL = v8;

    objc_msgSend(v27, "pk_encryptedLocationForKey:", CFSTR("merchantLocation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    self->_locationLatitude = v11;
    self->_locationLongitude = v12;
    if (!self->_phoneNumber)
    {
      objc_msgSend(v27, "pk_encryptedStringForKey:", CFSTR("merchantPhoneNumber"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v13;

    }
    if (!self->_url)
    {
      objc_msgSend(v27, "pk_encryptedUrlForKey:", CFSTR("merchantURL"));
      v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v15;

    }
    if (!self->_postalAddress)
    {
      objc_msgSend(v27, "pk_encryptedDictionaryForKey:", CFSTR("merchantPostalAddress"));
      v17 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v17);
        v17 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();
      }
      postalAddress = self->_postalAddress;
      self->_postalAddress = v17;

    }
    if (!self->_heroImageURL)
    {
      objc_msgSend(v27, "pk_encryptedUrlForKey:", CFSTR("merchantHeroImageURL"));
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
      heroImageURL = self->_heroImageURL;
      self->_heroImageURL = v20;

    }
    if (!self->_heroImageAttributionName)
    {
      objc_msgSend(v27, "pk_encryptedStringForKey:", CFSTR("merchantHeroImageAttributionName"));
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      heroImageAttributionName = self->_heroImageAttributionName;
      self->_heroImageAttributionName = v22;

    }
    if (!self->_category)
    {
      objc_msgSend(v27, "pk_encryptedStringForKey:", CFSTR("merchantCategory"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_category = PKMerchantCategoryFromString(v24);

    }
    if (!self->_stylingInfoData)
    {
      objc_msgSend(v27, "pk_encryptedDataForKey:", CFSTR("merchantStylingInfo"));
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      stylingInfoData = self->_stylingInfoData;
      self->_stylingInfoData = v25;

    }
    v5 = v27;
  }

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    -[PKMapsMerchant _encodeDeviceDataForCloudStoreCoder:](self, "_encodeDeviceDataForCloudStoreCoder:", a3);
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
  void *v13;
  id v14;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("merchantMapsIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_resultProviderIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("merchantResultProviderIdentifier"));

  objc_msgSend(v5, "setObject:forKey:", self->_name, CFSTR("merchantMapsName"));
  objc_msgSend(v5, "setObject:forKey:", self->_phoneNumber, CFSTR("merchantPhoneNumber"));
  -[NSURL absoluteString](self->_url, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("merchantURL"));

  -[PKMapsMerchant location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("merchantLocation"));

  -[PKMapsMerchant _jsonEncodedPostalAddressString](self, "_jsonEncodedPostalAddressString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("merchantPostalAddress"));

  -[NSURL absoluteString](self->_heroImageURL, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("merchantHeroImageURL"));

  PKMerchantCategoryToString(self->_category);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("merchantCategory"));

  objc_msgSend(v5, "setObject:forKey:", self->_detailedCategory, CFSTR("merchantMapsCategory"));
  objc_msgSend(v5, "setObject:forKey:", self->_heroImageAttributionName, CFSTR("merchantHeroImageAttributionName"));
  objc_msgSend(v5, "setObject:forKey:", self->_stylingInfoData, CFSTR("merchantStylingInfo"));
  if (PKApplePayContainerEnvironment() == 2)
  {
    -[NSURL absoluteString](self->_businessChatURL, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("merchantBusinessChatURL"));

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
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantMapsIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantResultProviderIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantMapsName"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantPhoneNumber"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantURL"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantLocation"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantPostalAddress"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantHeroImageURL"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantCategory"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantMapsCategory"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantHeroImageAttributionName"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("merchantStylingInfo"));

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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMapsMerchant)initWithCoder:(id)a3
{
  id v4;
  PKMapsMerchant *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *phoneNumber;
  uint64_t v10;
  NSURL *url;
  double v12;
  double v13;
  uint64_t v14;
  CNPostalAddress *postalAddress;
  uint64_t v16;
  NSURL *heroImageURL;
  uint64_t v18;
  NSString *heroImageAttributionName;
  uint64_t v20;
  NSData *stylingInfoData;
  uint64_t v22;
  NSString *detailedCategory;
  uint64_t v24;
  NSURL *businessChatURL;
  uint64_t v26;
  NSDate *lastProcessedDate;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKMapsMerchant;
  v5 = -[PKMapsMerchant init](&v29, sel_init);
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

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLatitude"));
    v5->_locationLatitude = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLongitude"));
    v5->_locationLongitude = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heroImageURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantHeroImageAttributionName"));
    v18 = objc_claimAutoreleasedReturnValue();
    heroImageAttributionName = v5->_heroImageAttributionName;
    v5->_heroImageAttributionName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantStylingInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    stylingInfoData = v5->_stylingInfoData;
    v5->_stylingInfoData = (NSData *)v20;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantMapsCategory"));
    v22 = objc_claimAutoreleasedReturnValue();
    detailedCategory = v5->_detailedCategory;
    v5->_detailedCategory = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantBusinessChatURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    businessChatURL = v5->_businessChatURL;
    v5->_businessChatURL = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastProcessedDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v26;

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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("locationLatitude"), self->_locationLatitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("locationLongitude"), self->_locationLongitude);
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddress, CFSTR("postalAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageURL, CFSTR("heroImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heroImageAttributionName, CFSTR("merchantHeroImageAttributionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stylingInfoData, CFSTR("merchantStylingInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("merchantCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailedCategory, CFSTR("merchantMapsCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatURL, CFSTR("merchantBusinessChatURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastProcessedDate, CFSTR("lastProcessedDate"));

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

  -[PKMapsMerchant jsonRepresentation](self, "jsonRepresentation");
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

- (BOOL)isEqual:(id)a3
{
  PKMapsMerchant *v4;
  PKMapsMerchant *v5;
  BOOL v6;

  v4 = (PKMapsMerchant *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKMapsMerchant isEqualToMapsMerchant:](self, "isEqualToMapsMerchant:", v5);

  return v6;
}

- (BOOL)isEqualToMapsMerchant:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *phoneNumber;
  NSString *v10;
  NSURL *url;
  NSURL *v12;
  CNPostalAddress *postalAddress;
  CNPostalAddress *v14;
  NSURL *heroImageURL;
  NSURL *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  _BOOL4 v21;
  void *v22;
  NSString *v23;
  _BOOL4 v24;
  BOOL v25;
  NSURL *businessChatURL;
  NSURL *v28;

  v4 = a3;
  name = self->_name;
  v6 = (NSString *)v4[4];
  if (name)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (name != v6)
      goto LABEL_41;
  }
  else
  {
    v8 = -[NSString isEqual:](name, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_41;
  }
  phoneNumber = self->_phoneNumber;
  v10 = (NSString *)v4[5];
  if (phoneNumber && v10)
  {
    if ((-[NSString isEqual:](phoneNumber, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (phoneNumber != v10)
  {
    goto LABEL_41;
  }
  url = self->_url;
  v12 = (NSURL *)v4[6];
  if (url && v12)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (url != v12)
  {
    goto LABEL_41;
  }
  postalAddress = self->_postalAddress;
  v14 = (CNPostalAddress *)v4[9];
  if (postalAddress && v14)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (postalAddress != v14)
  {
    goto LABEL_41;
  }
  heroImageURL = self->_heroImageURL;
  v16 = (NSURL *)v4[10];
  if (heroImageURL && v16)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (heroImageURL != v16)
  {
    goto LABEL_41;
  }
  v17 = (void *)v4[13];
  v18 = self->_detailedCategory;
  v19 = v17;
  if (v18 == v19)
  {

  }
  else
  {
    v20 = v19;
    if (!v18 || !v19)
      goto LABEL_40;
    v21 = -[NSString isEqualToString:](v18, "isEqualToString:", v19);

    if (!v21)
      goto LABEL_41;
  }
  v22 = (void *)v4[11];
  v18 = self->_heroImageAttributionName;
  v23 = v22;
  if (v18 != v23)
  {
    v20 = v23;
    if (v18 && v23)
    {
      v24 = -[NSString isEqualToString:](v18, "isEqualToString:", v23);

      if (!v24)
        goto LABEL_41;
      goto LABEL_44;
    }
LABEL_40:

    goto LABEL_41;
  }

LABEL_44:
  businessChatURL = self->_businessChatURL;
  v28 = (NSURL *)v4[15];
  if (businessChatURL && v28)
  {
    if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0)
      goto LABEL_41;
  }
  else if (businessChatURL != v28)
  {
    goto LABEL_41;
  }
  if (self->_category == v4[12]
    && self->_identifier == v4[3]
    && self->_resultProviderIdentifier == *((_DWORD *)v4 + 4)
    && self->_locationLatitude == *((double *)v4 + 7)
    && self->_locationLongitude == *((double *)v4 + 8))
  {
    v25 = (self->_stylingInfoData != 0) ^ (v4[14] == 0);
    goto LABEL_42;
  }
LABEL_41:
  v25 = 0;
LABEL_42:

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_url);
  objc_msgSend(v3, "safelyAddObject:", self->_postalAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageURL);
  objc_msgSend(v3, "safelyAddObject:", self->_heroImageAttributionName);
  objc_msgSend(v3, "safelyAddObject:", self->_detailedCategory);
  objc_msgSend(v3, "safelyAddObject:", self->_businessChatURL);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_identifier - v4 + 32 * v4;
  v6 = self->_resultProviderIdentifier - v5 + 32 * v5;
  v7 = (unint64_t)self->_locationLatitude - v6 + 32 * v6;
  v8 = (unint64_t)self->_locationLongitude - v7 + 32 * v7;
  v9 = self->_category - v8 + 32 * v8;

  return v9;
}

- (id)_jsonEncodedPostalAddressString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[CNPostalAddress dictionaryRepresentation](self->_postalAddress, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
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

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)heroImageAttributionName
{
  return self->_heroImageAttributionName;
}

- (void)setHeroImageAttributionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)stylingInfoData
{
  return self->_stylingInfoData;
}

- (NSURL)businessChatURL
{
  return self->_businessChatURL;
}

- (void)setBusinessChatURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_businessChatURL, 0);
  objc_storeStrong((id *)&self->_stylingInfoData, 0);
  objc_storeStrong((id *)&self->_detailedCategory, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lazyStylingInfo, 0);
}

@end
