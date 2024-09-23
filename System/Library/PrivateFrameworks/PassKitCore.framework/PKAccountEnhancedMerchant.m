@implementation PKAccountEnhancedMerchant

- (PKAccountEnhancedMerchant)init
{
  PKAccountEnhancedMerchant *v2;
  PKRemoteImageSet *v3;
  uint64_t v4;
  uint64_t v5;
  PKRemoteImageSet *logoImage;
  PKRemoteImageSet *v7;
  PKRemoteImageSet *iconImage;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKAccountEnhancedMerchant;
  v2 = -[PKAccountEnhancedMerchant init](&v10, sel_init);
  if (v2)
  {
    v3 = [PKRemoteImageSet alloc];
    v4 = MEMORY[0x1E0C9AA60];
    v5 = -[PKRemoteImageSet initWithName:dictionaries:](v3, "initWithName:dictionaries:", CFSTR("logoImage"), MEMORY[0x1E0C9AA60]);
    logoImage = v2->_logoImage;
    v2->_logoImage = (PKRemoteImageSet *)v5;

    v7 = -[PKRemoteImageSet initWithName:dictionaries:]([PKRemoteImageSet alloc], "initWithName:dictionaries:", CFSTR("iconImage"), v4);
    iconImage = v2->_iconImage;
    v2->_iconImage = v7;

  }
  return v2;
}

- (PKAccountEnhancedMerchant)initWithDictionary:(id)a3
{
  id v4;
  PKAccountEnhancedMerchant *v5;
  PKAccountEnhancedMerchant *v6;
  PKAccountEnhancedMerchant *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKAccountEnhancedMerchant;
    v5 = -[PKAccountEnhancedMerchant init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[PKAccountEnhancedMerchant _initWithMerchantDictionary:](v5, "_initWithMerchantDictionary:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithMerchantDictionary:(id)a3
{
  NSString *v4;
  NSString *privateIdentifier;
  NSString *v6;
  NSString *name;
  NSString *v8;
  NSString *detailedDescription;
  void *v10;
  PKRemoteImageSet *v11;
  PKRemoteImageSet *logoImage;
  void *v13;
  PKRemoteImageSet *v14;
  PKRemoteImageSet *iconImage;
  void *v16;
  NSNumber *v17;
  NSNumber *adamID;
  void *v19;
  NSSet *v20;
  NSSet *brandMUIDs;
  void *v22;
  NSSet *v23;
  NSSet *excludedMUIDs;
  NSURL *v25;
  NSURL *website;
  NSURL *v27;
  NSURL *loyaltyPassURL;
  void *v29;
  NSSet *v30;
  NSSet *paymentIdentifiers;
  void *v32;
  NSSet *v33;
  NSSet *mapsSearchStrings;
  NSString *v35;
  NSString *disclosures;
  NSString *v37;
  NSString *mapsSearchText;
  NSString *v39;
  NSString *paymentSheetRewardsText;
  NSString *v41;
  NSString *paymentSheetMerchantRewardsText;
  NSDate *v43;
  NSDate *paymentSheetOverrideStart;
  NSDate *v45;
  NSDate *paymentSheetOverrideEnd;
  void *v47;
  NSSet *v48;
  NSSet *enhancedRewardsProgramIdentifiers;
  id v50;

  v50 = a3;
  objc_msgSend(v50, "PKStringForKey:", CFSTR("privateIdentifier"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  privateIdentifier = self->_privateIdentifier;
  self->_privateIdentifier = v4;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("name"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v6;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("description"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailedDescription = self->_detailedDescription;
  self->_detailedDescription = v8;

  objc_msgSend(v50, "PKArrayForKey:", CFSTR("logoImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKRemoteImageSet initWithName:dictionaries:]([PKRemoteImageSet alloc], "initWithName:dictionaries:", CFSTR("logoImage"), v10);
  logoImage = self->_logoImage;
  self->_logoImage = v11;

  objc_msgSend(v50, "PKArrayForKey:", CFSTR("iconImage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKRemoteImageSet initWithName:dictionaries:]([PKRemoteImageSet alloc], "initWithName:dictionaries:", CFSTR("iconImage"), v13);
  iconImage = self->_iconImage;
  self->_iconImage = v14;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("adamID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nonZeroUnsignedLongLongNSNumberValue");
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  adamID = self->_adamID;
  self->_adamID = v17;

  objc_msgSend(v50, "objectForKey:", CFSTR("brandMUIDs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "nonZeroUnsignedLongLongSetValue");
    v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = v20;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKAccountEnhancedMerchant setBrandMUIDsFromJSONString:](self, "setBrandMUIDsFromJSONString:", v19);
      goto LABEL_7;
    }
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = 0;
  }

LABEL_7:
  objc_msgSend(v50, "objectForKey:", CFSTR("excludedMUIDs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "nonZeroUnsignedLongLongSetValue");
    v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = v23;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKAccountEnhancedMerchant setExcludedMUIDsFromJSONString:](self, "setExcludedMUIDsFromJSONString:", v22);
      goto LABEL_13;
    }
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = 0;
  }

LABEL_13:
  objc_msgSend(v50, "PKURLForKey:", CFSTR("website"));
  v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
  website = self->_website;
  self->_website = v25;

  objc_msgSend(v50, "PKURLForKey:", CFSTR("loyaltyPassURL"));
  v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
  loyaltyPassURL = self->_loyaltyPassURL;
  self->_loyaltyPassURL = v27;

  objc_msgSend(v50, "objectForKey:", CFSTR("paymentIdentifiers"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "stringSetValue");
    v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = v30;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKAccountEnhancedMerchant setPaymentIdentifiersFromJSONString:](self, "setPaymentIdentifiersFromJSONString:", v29);
      goto LABEL_19;
    }
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = 0;
  }

LABEL_19:
  objc_msgSend(v50, "objectForKey:", CFSTR("mapsSearchStrings"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v32, "stringSetValue");
    v33 = (NSSet *)objc_claimAutoreleasedReturnValue();
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = v33;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKAccountEnhancedMerchant setMapsSearchStringsFromJSONString:](self, "setMapsSearchStringsFromJSONString:", v32);
      goto LABEL_25;
    }
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = 0;
  }

LABEL_25:
  objc_msgSend(v50, "PKStringForKey:", CFSTR("disclosures"));
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  disclosures = self->_disclosures;
  self->_disclosures = v35;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("mapsSearchText"));
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  mapsSearchText = self->_mapsSearchText;
  self->_mapsSearchText = v37;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("paymentSheetRewardsText"));
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentSheetRewardsText = self->_paymentSheetRewardsText;
  self->_paymentSheetRewardsText = v39;

  objc_msgSend(v50, "PKStringForKey:", CFSTR("paymentSheetMerchantRewardsText"));
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentSheetMerchantRewardsText = self->_paymentSheetMerchantRewardsText;
  self->_paymentSheetMerchantRewardsText = v41;

  self->_suppressPaymentSheetRewardsHint = objc_msgSend(v50, "PKBoolForKey:", CFSTR("suppressPaymentSheetRewardsHint"));
  objc_msgSend(v50, "PKDateForKey:", CFSTR("paymentSheetOverrideStart"));
  v43 = (NSDate *)objc_claimAutoreleasedReturnValue();
  paymentSheetOverrideStart = self->_paymentSheetOverrideStart;
  self->_paymentSheetOverrideStart = v43;

  objc_msgSend(v50, "PKDateForKey:", CFSTR("paymentSheetOverrideEnd"));
  v45 = (NSDate *)objc_claimAutoreleasedReturnValue();
  paymentSheetOverrideEnd = self->_paymentSheetOverrideEnd;
  self->_paymentSheetOverrideEnd = v45;

  objc_msgSend(v50, "objectForKey:", CFSTR("enhancedRewardsProgramIdentifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v47, "stringSetValue");
    v48 = (NSSet *)objc_claimAutoreleasedReturnValue();
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = v48;
LABEL_30:

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = 0;
    goto LABEL_30;
  }
  -[PKAccountEnhancedMerchant setEnhancedRewardsProgramIdentifiersFromJSONString:](self, "setEnhancedRewardsProgramIdentifiersFromJSONString:", v47);
LABEL_31:

}

- (void)setBrandMUIDsFromJSONString:(id)a3
{
  NSSet *v4;
  NSSet *brandMUIDs;

  if (a3)
  {
    objc_msgSend(a3, "jsonNonZeroUnsignedLongLongNSNumberSetValue");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = v4;
  }
  else
  {
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = 0;
  }

}

- (void)setExcludedMUIDsFromJSONString:(id)a3
{
  NSSet *v4;
  NSSet *excludedMUIDs;

  if (a3)
  {
    objc_msgSend(a3, "jsonNonZeroUnsignedLongLongNSNumberSetValue");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = v4;
  }
  else
  {
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = 0;
  }

}

- (void)setPaymentIdentifiersFromJSONString:(id)a3
{
  NSSet *v4;
  NSSet *paymentIdentifiers;

  if (a3)
  {
    objc_msgSend(a3, "jsonStringSetValue");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = v4;
  }
  else
  {
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = 0;
  }

}

- (void)setEnhancedRewardsProgramIdentifiersFromJSONString:(id)a3
{
  NSSet *v4;
  NSSet *enhancedRewardsProgramIdentifiers;

  if (a3)
  {
    objc_msgSend(a3, "jsonStringSetValue");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = v4;
  }
  else
  {
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = 0;
  }

}

- (void)setMapsSearchStringsFromJSONString:(id)a3
{
  NSSet *v4;
  NSSet *mapsSearchStrings;

  if (a3)
  {
    objc_msgSend(a3, "jsonStringSetValue");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = v4;
  }
  else
  {
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = 0;
  }

}

- (id)brandMUIDsAsJSONString
{
  return -[NSSet jsonString](self->_brandMUIDs, "jsonString");
}

- (id)excludedMUIDsAsJSONString
{
  return -[NSSet jsonString](self->_excludedMUIDs, "jsonString");
}

- (id)paymentIdentifiersAsJSONString
{
  return -[NSSet jsonString](self->_paymentIdentifiers, "jsonString");
}

- (id)mapsSearchStringsAsJSONString
{
  return -[NSSet jsonString](self->_mapsSearchStrings, "jsonString");
}

- (BOOL)hasMapsLocations
{
  return -[NSSet count](self->_brandMUIDs, "count") != 0;
}

- (BOOL)hasLinkedApplication
{
  return self->_adamID || objc_msgSend(0, "unsignedLongLongValue") != 0;
}

- (id)hashedPaymentIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[NSSet allObjects](self->_paymentIdentifiers, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_218);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53__PKAccountEnhancedMerchant_hashedPaymentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SHA256Hash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_stringIfNotEmpty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasWebsite
{
  return self->_website != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("privateIdentifier: '%@'; "), self->_privateIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  -[NSString truncatedStringWithEllipsis](self->_detailedDescription, "truncatedStringWithEllipsis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("description: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("logoImage: '%@'; "), self->_logoImage);
  objc_msgSend(v3, "appendFormat:", CFSTR("iconImage: '%@'; "), self->_iconImage);
  objc_msgSend(v3, "appendFormat:", CFSTR("adamID: '%@'; "), self->_adamID);
  -[NSSet jsonString](self->_brandMUIDs, "jsonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("brandMUIDs: '%@'; "), v5);

  -[NSSet jsonString](self->_excludedMUIDs, "jsonString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("excludedMUIDs: '%@'; "), v6);

  -[NSURL absoluteString](self->_website, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("website: '%@'; "), v7);

  -[NSURL absoluteString](self->_loyaltyPassURL, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("loyaltyPassURL: '%@'; "), v8);

  -[NSSet jsonString](self->_paymentIdentifiers, "jsonString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentIdentifiers: '%@'"), v9);

  -[NSString truncatedStringWithEllipsis](self->_disclosures, "truncatedStringWithEllipsis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("disclosures: '%@'"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("mapsSearchText: '%@'"), self->_mapsSearchText);
  -[NSSet jsonString](self->_mapsSearchStrings, "jsonString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("mapsSearchStrings: '%@'"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("paymentSheetRewardsText: '%@'"), self->_paymentSheetRewardsText);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentSheetMerchantRewardsText: '%@'"), self->_paymentSheetMerchantRewardsText);
  objc_msgSend(v3, "appendFormat:", CFSTR("suppressPaymentSheetRewardsHint: '%d'"), self->_suppressPaymentSheetRewardsHint);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentSheetOverrideStart: '%@'"), self->_paymentSheetOverrideStart);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentSheetOverrideEnd: '%@'"), self->_paymentSheetOverrideEnd);
  -[NSSet jsonString](self->_enhancedRewardsProgramIdentifiers, "jsonString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("enhancedRewardsProgramIdentifiers: '%@'"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountEnhancedMerchant *v4;
  PKAccountEnhancedMerchant *v5;
  BOOL v6;

  v4 = (PKAccountEnhancedMerchant *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountEnhancedMerchant isEqualToAccountEnhancedMerchant:](self, "isEqualToAccountEnhancedMerchant:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchant:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  PKRemoteImageSet *logoImage;
  PKRemoteImageSet *v18;
  PKRemoteImageSet *iconImage;
  PKRemoteImageSet *v20;
  NSNumber *adamID;
  NSNumber *v22;
  NSSet *brandMUIDs;
  NSSet *v24;
  NSSet *excludedMUIDs;
  NSSet *v26;
  NSURL *website;
  NSURL *v28;
  NSURL *loyaltyPassURL;
  NSURL *v30;
  NSSet *paymentIdentifiers;
  NSSet *v32;
  void *v33;
  NSString *v34;
  _BOOL4 v35;
  void *v36;
  NSString *v37;
  _BOOL4 v38;
  NSSet *mapsSearchStrings;
  NSSet *v40;
  void *v41;
  NSString *v42;
  _BOOL4 v43;
  void *v44;
  NSString *v45;
  _BOOL4 v46;
  char v47;
  NSDate *paymentSheetOverrideStart;
  NSDate *v50;
  NSDate *paymentSheetOverrideEnd;
  NSDate *v52;
  NSSet *enhancedRewardsProgramIdentifiers;
  NSSet *v54;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_89;
  v6 = (void *)*((_QWORD *)v4 + 2);
  v7 = self->_privateIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_88;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_89;
  }
  v11 = (void *)*((_QWORD *)v5 + 3);
  v7 = self->_name;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_88;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_89;
  }
  v14 = (void *)*((_QWORD *)v5 + 4);
  v7 = self->_detailedDescription;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_88;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_89;
  }
  logoImage = self->_logoImage;
  v18 = (PKRemoteImageSet *)*((_QWORD *)v5 + 5);
  if (logoImage && v18)
  {
    if (!-[PKRemoteImageSet isEqual:](logoImage, "isEqual:"))
      goto LABEL_89;
  }
  else if (logoImage != v18)
  {
    goto LABEL_89;
  }
  iconImage = self->_iconImage;
  v20 = (PKRemoteImageSet *)*((_QWORD *)v5 + 6);
  if (iconImage && v20)
  {
    if (!-[PKRemoteImageSet isEqual:](iconImage, "isEqual:"))
      goto LABEL_89;
  }
  else if (iconImage != v20)
  {
    goto LABEL_89;
  }
  adamID = self->_adamID;
  v22 = (NSNumber *)*((_QWORD *)v5 + 7);
  if (adamID && v22)
  {
    if ((-[NSNumber isEqual:](adamID, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (adamID != v22)
  {
    goto LABEL_89;
  }
  brandMUIDs = self->_brandMUIDs;
  v24 = (NSSet *)*((_QWORD *)v5 + 8);
  if (brandMUIDs && v24)
  {
    if ((-[NSSet isEqual:](brandMUIDs, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (brandMUIDs != v24)
  {
    goto LABEL_89;
  }
  excludedMUIDs = self->_excludedMUIDs;
  v26 = (NSSet *)*((_QWORD *)v5 + 9);
  if (excludedMUIDs && v26)
  {
    if ((-[NSSet isEqual:](excludedMUIDs, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (excludedMUIDs != v26)
  {
    goto LABEL_89;
  }
  website = self->_website;
  v28 = (NSURL *)*((_QWORD *)v5 + 10);
  if (website && v28)
  {
    if ((-[NSURL isEqual:](website, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (website != v28)
  {
    goto LABEL_89;
  }
  loyaltyPassURL = self->_loyaltyPassURL;
  v30 = (NSURL *)*((_QWORD *)v5 + 11);
  if (loyaltyPassURL && v30)
  {
    if ((-[NSURL isEqual:](loyaltyPassURL, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (loyaltyPassURL != v30)
  {
    goto LABEL_89;
  }
  paymentIdentifiers = self->_paymentIdentifiers;
  v32 = (NSSet *)*((_QWORD *)v5 + 12);
  if (paymentIdentifiers && v32)
  {
    if ((-[NSSet isEqual:](paymentIdentifiers, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (paymentIdentifiers != v32)
  {
    goto LABEL_89;
  }
  v33 = (void *)*((_QWORD *)v5 + 13);
  v7 = self->_disclosures;
  v34 = v33;
  if (v7 == v34)
  {

  }
  else
  {
    v9 = v34;
    if (!v7 || !v34)
      goto LABEL_88;
    v35 = -[NSString isEqualToString:](v7, "isEqualToString:", v34);

    if (!v35)
      goto LABEL_89;
  }
  v36 = (void *)*((_QWORD *)v5 + 14);
  v7 = self->_mapsSearchText;
  v37 = v36;
  if (v7 == v37)
  {

  }
  else
  {
    v9 = v37;
    if (!v7 || !v37)
      goto LABEL_88;
    v38 = -[NSString isEqualToString:](v7, "isEqualToString:", v37);

    if (!v38)
      goto LABEL_89;
  }
  mapsSearchStrings = self->_mapsSearchStrings;
  v40 = (NSSet *)*((_QWORD *)v5 + 15);
  if (mapsSearchStrings && v40)
  {
    if ((-[NSSet isEqual:](mapsSearchStrings, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (mapsSearchStrings != v40)
  {
    goto LABEL_89;
  }
  v41 = (void *)*((_QWORD *)v5 + 16);
  v7 = self->_paymentSheetRewardsText;
  v42 = v41;
  if (v7 == v42)
  {

  }
  else
  {
    v9 = v42;
    if (!v7 || !v42)
      goto LABEL_88;
    v43 = -[NSString isEqualToString:](v7, "isEqualToString:", v42);

    if (!v43)
      goto LABEL_89;
  }
  v44 = (void *)*((_QWORD *)v5 + 17);
  v7 = self->_paymentSheetMerchantRewardsText;
  v45 = v44;
  if (v7 == v45)
  {

    goto LABEL_92;
  }
  v9 = v45;
  if (!v7 || !v45)
  {
LABEL_88:

    goto LABEL_89;
  }
  v46 = -[NSString isEqualToString:](v7, "isEqualToString:", v45);

  if (!v46)
    goto LABEL_89;
LABEL_92:
  paymentSheetOverrideStart = self->_paymentSheetOverrideStart;
  v50 = (NSDate *)*((_QWORD *)v5 + 18);
  if (paymentSheetOverrideStart && v50)
  {
    if ((-[NSDate isEqual:](paymentSheetOverrideStart, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (paymentSheetOverrideStart != v50)
  {
    goto LABEL_89;
  }
  paymentSheetOverrideEnd = self->_paymentSheetOverrideEnd;
  v52 = (NSDate *)*((_QWORD *)v5 + 19);
  if (!paymentSheetOverrideEnd || !v52)
  {
    if (paymentSheetOverrideEnd == v52)
      goto LABEL_102;
LABEL_89:
    v47 = 0;
    goto LABEL_90;
  }
  if ((-[NSDate isEqual:](paymentSheetOverrideEnd, "isEqual:") & 1) == 0)
    goto LABEL_89;
LABEL_102:
  if (self->_suppressPaymentSheetRewardsHint != v5[8])
    goto LABEL_89;
  enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
  v54 = (NSSet *)*((_QWORD *)v5 + 20);
  if (enhancedRewardsProgramIdentifiers && v54)
    v47 = -[NSSet isEqual:](enhancedRewardsProgramIdentifiers, "isEqual:");
  else
    v47 = enhancedRewardsProgramIdentifiers == v54;
LABEL_90:

  return v47;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_privateIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_detailedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_logoImage);
  objc_msgSend(v3, "safelyAddObject:", self->_iconImage);
  objc_msgSend(v3, "safelyAddObject:", self->_adamID);
  objc_msgSend(v3, "safelyAddObject:", self->_brandMUIDs);
  objc_msgSend(v3, "safelyAddObject:", self->_excludedMUIDs);
  objc_msgSend(v3, "safelyAddObject:", self->_website);
  objc_msgSend(v3, "safelyAddObject:", self->_loyaltyPassURL);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_disclosures);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsSearchText);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentSheetRewardsText);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentSheetMerchantRewardsText);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentSheetOverrideStart);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentSheetOverrideEnd);
  objc_msgSend(v3, "safelyAddObject:", self->_enhancedRewardsProgramIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsSearchStrings);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_suppressPaymentSheetRewardsHint - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEnhancedMerchant)initWithCoder:(id)a3
{
  id v4;
  PKAccountEnhancedMerchant *v5;
  uint64_t v6;
  NSString *privateIdentifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *detailedDescription;
  uint64_t v12;
  PKRemoteImageSet *logoImage;
  uint64_t v14;
  PKRemoteImageSet *iconImage;
  uint64_t v16;
  NSNumber *adamID;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *brandMUIDs;
  uint64_t v24;
  NSSet *excludedMUIDs;
  uint64_t v26;
  NSURL *website;
  uint64_t v28;
  NSURL *loyaltyPassURL;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSSet *paymentIdentifiers;
  uint64_t v36;
  NSString *disclosures;
  uint64_t v38;
  NSString *mapsSearchText;
  uint64_t v40;
  NSString *paymentSheetRewardsText;
  uint64_t v42;
  NSString *paymentSheetMerchantRewardsText;
  uint64_t v44;
  NSDate *paymentSheetOverrideStart;
  uint64_t v46;
  NSDate *paymentSheetOverrideEnd;
  uint64_t v48;
  NSSet *enhancedRewardsProgramIdentifiers;
  uint64_t v50;
  NSSet *mapsSearchStrings;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)PKAccountEnhancedMerchant;
  v5 = -[PKAccountEnhancedMerchant init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    privateIdentifier = v5->_privateIdentifier;
    v5->_privateIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v10 = objc_claimAutoreleasedReturnValue();
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImage"));
    v12 = objc_claimAutoreleasedReturnValue();
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKRemoteImageSet *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconImage = v5->_iconImage;
    v5->_iconImage = (PKRemoteImageSet *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adamID"));
    v16 = objc_claimAutoreleasedReturnValue();
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("brandMUIDs"));
    v22 = objc_claimAutoreleasedReturnValue();
    brandMUIDs = v5->_brandMUIDs;
    v5->_brandMUIDs = (NSSet *)v22;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("excludedMUIDs"));
    v24 = objc_claimAutoreleasedReturnValue();
    excludedMUIDs = v5->_excludedMUIDs;
    v5->_excludedMUIDs = (NSSet *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("website"));
    v26 = objc_claimAutoreleasedReturnValue();
    website = v5->_website;
    v5->_website = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loyaltyPassURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    loyaltyPassURL = v5->_loyaltyPassURL;
    v5->_loyaltyPassURL = (NSURL *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("paymentIdentifiers"));
    v34 = objc_claimAutoreleasedReturnValue();
    paymentIdentifiers = v5->_paymentIdentifiers;
    v5->_paymentIdentifiers = (NSSet *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclosures"));
    v36 = objc_claimAutoreleasedReturnValue();
    disclosures = v5->_disclosures;
    v5->_disclosures = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsSearchText"));
    v38 = objc_claimAutoreleasedReturnValue();
    mapsSearchText = v5->_mapsSearchText;
    v5->_mapsSearchText = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSheetRewardsText"));
    v40 = objc_claimAutoreleasedReturnValue();
    paymentSheetRewardsText = v5->_paymentSheetRewardsText;
    v5->_paymentSheetRewardsText = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSheetMerchantRewardsText"));
    v42 = objc_claimAutoreleasedReturnValue();
    paymentSheetMerchantRewardsText = v5->_paymentSheetMerchantRewardsText;
    v5->_paymentSheetMerchantRewardsText = (NSString *)v42;

    v5->_suppressPaymentSheetRewardsHint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressPaymentSheetRewardsHint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSheetOverrideStart"));
    v44 = objc_claimAutoreleasedReturnValue();
    paymentSheetOverrideStart = v5->_paymentSheetOverrideStart;
    v5->_paymentSheetOverrideStart = (NSDate *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSheetOverrideEnd"));
    v46 = objc_claimAutoreleasedReturnValue();
    paymentSheetOverrideEnd = v5->_paymentSheetOverrideEnd;
    v5->_paymentSheetOverrideEnd = (NSDate *)v46;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("enhancedRewardsProgramIdentifier"));
    v48 = objc_claimAutoreleasedReturnValue();
    enhancedRewardsProgramIdentifiers = v5->_enhancedRewardsProgramIdentifiers;
    v5->_enhancedRewardsProgramIdentifiers = (NSSet *)v48;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("mapsSearchStrings"));
    v50 = objc_claimAutoreleasedReturnValue();
    mapsSearchStrings = v5->_mapsSearchStrings;
    v5->_mapsSearchStrings = (NSSet *)v50;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *privateIdentifier;
  id v5;

  privateIdentifier = self->_privateIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", privateIdentifier, CFSTR("privateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailedDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoImage, CFSTR("logoImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconImage, CFSTR("iconImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adamID, CFSTR("adamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brandMUIDs, CFSTR("brandMUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedMUIDs, CFSTR("excludedMUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_website, CFSTR("website"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loyaltyPassURL, CFSTR("loyaltyPassURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentIdentifiers, CFSTR("paymentIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disclosures, CFSTR("disclosures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapsSearchText, CFSTR("mapsSearchText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentSheetRewardsText, CFSTR("paymentSheetRewardsText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentSheetMerchantRewardsText, CFSTR("paymentSheetMerchantRewardsText"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressPaymentSheetRewardsHint, CFSTR("suppressPaymentSheetRewardsHint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentSheetOverrideStart, CFSTR("paymentSheetOverrideStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentSheetOverrideEnd, CFSTR("paymentSheetOverrideEnd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enhancedRewardsProgramIdentifiers, CFSTR("enhancedRewardsProgramIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapsSearchStrings, CFSTR("mapsSearchStrings"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_privateIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_detailedDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[PKRemoteImageSet copyWithZone:](self->_logoImage, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[PKRemoteImageSet copyWithZone:](self->_iconImage, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSNumber copyWithZone:](self->_adamID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  -[NSSet deepCopyWithZone:](self->_brandMUIDs, "deepCopyWithZone:", a3);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  -[NSSet deepCopyWithZone:](self->_excludedMUIDs, "deepCopyWithZone:", a3);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[NSURL copyWithZone:](self->_website, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  v24 = -[NSURL copyWithZone:](self->_loyaltyPassURL, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v24;

  -[NSSet deepCopyWithZone:](self->_paymentIdentifiers, "deepCopyWithZone:", a3);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  v28 = -[NSString copyWithZone:](self->_disclosures, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v28;

  v30 = -[NSString copyWithZone:](self->_mapsSearchText, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v30;

  v32 = -[NSString copyWithZone:](self->_paymentSheetRewardsText, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v32;

  v34 = -[NSString copyWithZone:](self->_paymentSheetMerchantRewardsText, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v34;

  *(_BYTE *)(v5 + 8) = self->_suppressPaymentSheetRewardsHint;
  v36 = -[NSDate copyWithZone:](self->_paymentSheetOverrideStart, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v36;

  v38 = -[NSDate copyWithZone:](self->_paymentSheetOverrideEnd, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v38;

  -[NSSet deepCopyWithZone:](self->_enhancedRewardsProgramIdentifiers, "deepCopyWithZone:", a3);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v40;

  -[NSSet deepCopyWithZone:](self->_mapsSearchStrings, "deepCopyWithZone:", a3);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v42;

  return (id)v5;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_privateIdentifier;
}

- (NSString)privateIdentifier
{
  return self->_privateIdentifier;
}

- (void)setPrivateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privateIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (void)setDetailedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_detailedDescription, a3);
}

- (PKRemoteImageSet)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_logoImage, a3);
}

- (PKRemoteImageSet)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (NSSet)brandMUIDs
{
  return self->_brandMUIDs;
}

- (void)setBrandMUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_brandMUIDs, a3);
}

- (NSSet)excludedMUIDs
{
  return self->_excludedMUIDs;
}

- (void)setExcludedMUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_excludedMUIDs, a3);
}

- (NSURL)website
{
  return self->_website;
}

- (void)setWebsite:(id)a3
{
  objc_storeStrong((id *)&self->_website, a3);
}

- (NSURL)loyaltyPassURL
{
  return self->_loyaltyPassURL;
}

- (void)setLoyaltyPassURL:(id)a3
{
  objc_storeStrong((id *)&self->_loyaltyPassURL, a3);
}

- (NSSet)paymentIdentifiers
{
  return self->_paymentIdentifiers;
}

- (void)setPaymentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_paymentIdentifiers, a3);
}

- (NSString)disclosures
{
  return self->_disclosures;
}

- (void)setDisclosures:(id)a3
{
  objc_storeStrong((id *)&self->_disclosures, a3);
}

- (NSString)mapsSearchText
{
  return self->_mapsSearchText;
}

- (void)setMapsSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSearchText, a3);
}

- (NSSet)mapsSearchStrings
{
  return self->_mapsSearchStrings;
}

- (void)setMapsSearchStrings:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSearchStrings, a3);
}

- (NSString)paymentSheetRewardsText
{
  return self->_paymentSheetRewardsText;
}

- (void)setPaymentSheetRewardsText:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetRewardsText, a3);
}

- (NSString)paymentSheetMerchantRewardsText
{
  return self->_paymentSheetMerchantRewardsText;
}

- (void)setPaymentSheetMerchantRewardsText:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetMerchantRewardsText, a3);
}

- (BOOL)suppressPaymentSheetRewardsHint
{
  return self->_suppressPaymentSheetRewardsHint;
}

- (void)setSuppressPaymentSheetRewardsHint:(BOOL)a3
{
  self->_suppressPaymentSheetRewardsHint = a3;
}

- (NSDate)paymentSheetOverrideStart
{
  return self->_paymentSheetOverrideStart;
}

- (void)setPaymentSheetOverrideStart:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetOverrideStart, a3);
}

- (NSDate)paymentSheetOverrideEnd
{
  return self->_paymentSheetOverrideEnd;
}

- (void)setPaymentSheetOverrideEnd:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSheetOverrideEnd, a3);
}

- (NSSet)enhancedRewardsProgramIdentifiers
{
  return self->_enhancedRewardsProgramIdentifiers;
}

- (void)setEnhancedRewardsProgramIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedRewardsProgramIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedRewardsProgramIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentSheetOverrideEnd, 0);
  objc_storeStrong((id *)&self->_paymentSheetOverrideStart, 0);
  objc_storeStrong((id *)&self->_paymentSheetMerchantRewardsText, 0);
  objc_storeStrong((id *)&self->_paymentSheetRewardsText, 0);
  objc_storeStrong((id *)&self->_mapsSearchStrings, 0);
  objc_storeStrong((id *)&self->_mapsSearchText, 0);
  objc_storeStrong((id *)&self->_disclosures, 0);
  objc_storeStrong((id *)&self->_paymentIdentifiers, 0);
  objc_storeStrong((id *)&self->_loyaltyPassURL, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_excludedMUIDs, 0);
  objc_storeStrong((id *)&self->_brandMUIDs, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_privateIdentifier, 0);
}

@end
