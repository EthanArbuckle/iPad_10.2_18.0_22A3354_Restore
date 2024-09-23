@implementation PKPayLaterMerchant

- (PKPayLaterMerchant)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterMerchant *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  void *v8;
  uint64_t v9;
  NSString *rawName;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *rawCity;
  uint64_t v15;
  NSString *city;
  uint64_t v17;
  NSString *rawState;
  uint64_t v19;
  NSString *state;
  uint64_t v21;
  NSString *rawCountry;
  uint64_t v23;
  NSString *country;
  uint64_t v25;
  NSString *rawCANL;
  uint64_t v27;
  NSString *zipcode;
  uint64_t v29;
  NSString *industryCategory;
  uint64_t v31;
  NSString *authNetworkData;
  uint64_t v33;
  NSString *clearingNetworkData;
  uint64_t v35;
  NSURL *originURL;
  uint64_t v37;
  NSString *webMerchantIdentifier;
  uint64_t v39;
  NSString *webMerchantName;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PKPayLaterMerchant;
  v5 = -[PKPayLaterMerchant init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    v5->_merchantCategoryCode = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("merchantCategoryCode"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merchantCategory = PKMerchantCategoryFromString(v8);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawName"));
    v9 = objc_claimAutoreleasedReturnValue();
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantName"));
    v11 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawCity"));
    v13 = objc_claimAutoreleasedReturnValue();
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantCity"));
    v15 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawState"));
    v17 = objc_claimAutoreleasedReturnValue();
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v17;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantState"));
    v19 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v19;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawCountry"));
    v21 = objc_claimAutoreleasedReturnValue();
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v21;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantCountry"));
    v23 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v23;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawCANL"));
    v25 = objc_claimAutoreleasedReturnValue();
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v25;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantZip"));
    v27 = objc_claimAutoreleasedReturnValue();
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v27;

    v5->_cleanConfidence = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("merchantCleanConfidence"));
    v5->_industryCode = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("merchantIndustryCode"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantIndustryCategory"));
    v29 = objc_claimAutoreleasedReturnValue();
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v29;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("authNetworkData"));
    v31 = objc_claimAutoreleasedReturnValue();
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v31;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("clearingNetworkData"));
    v33 = objc_claimAutoreleasedReturnValue();
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v33;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("originURL"));
    v35 = objc_claimAutoreleasedReturnValue();
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v35;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("webMerchantIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v37;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("webMerchantName"));
    v39 = objc_claimAutoreleasedReturnValue();
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v39;

    v5->_adamIdentifier = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("adamIdentifier"));
  }

  return v5;
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

- (id)displayName
{
  void *v3;
  uint64_t v4;
  void *mapsBrand;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *name;

  -[PKMapsBrand name](self->_mapsBrand, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    mapsBrand = self->_mapsBrand;
LABEL_5:
    objc_msgSend(mapsBrand, "name");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  -[PKMapsMerchant name](self->_mapsMerchant, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    mapsBrand = self->_mapsMerchant;
    goto LABEL_5;
  }
  if (-[NSString length](self->_name, "length"))
  {
    name = self->_name;
  }
  else
  {
    if (!-[NSString length](self->_rawName, "length"))
    {
      PKLocalizedCocoonString(CFSTR("NEW_INSTALLMENT_MERCHANT_NAME"), 0);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    name = self->_rawName;
  }
  v8 = name;
  return v8;
}

- (BOOL)displayNameIsFallbackString
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[NSString length](self->_name, "length"))
    return 0;
  -[PKMapsBrand name](self->_mapsBrand, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v3 = 0;
  }
  else
  {
    -[PKMapsMerchant name](self->_mapsMerchant, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      v3 = 0;
    else
      v3 = -[NSString length](self->_rawName, "length") == 0;

  }
  return v3;
}

- (id)displayNamePurchase
{
  void *v3;
  id v4;
  void *v5;

  -[PKPayLaterMerchant displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPayLaterMerchant displayNameIsFallbackString](self, "displayNameIsFallbackString"))
  {
    v4 = v3;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("MERCHANT_NAME_PURCHASE"), CFSTR("%@"), v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (int64_t)merchantCategory
{
  id *p_mapsBrand;
  uint64_t merchantCategory;

  p_mapsBrand = (id *)&self->_mapsBrand;
  merchantCategory = self->_merchantCategory;
  if (-[PKMapsBrand category](self->_mapsBrand, "category")
    || (p_mapsBrand = (id *)&self->_mapsMerchant, -[PKMapsMerchant category](self->_mapsMerchant, "category")))
  {
    merchantCategory = objc_msgSend(*p_mapsBrand, "category");
  }
  if (!merchantCategory)
    merchantCategory = self->_fallbackCategory;
  if (merchantCategory)
    return merchantCategory;
  else
    return 2;
}

- (BOOL)payLaterMerchantDictionaryIsEqual:(id)a3
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
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  void *v23;
  NSString *v24;
  _BOOL4 v25;
  void *v26;
  NSString *v27;
  _BOOL4 v28;
  void *v29;
  NSString *v30;
  _BOOL4 v31;
  void *v32;
  NSString *v33;
  _BOOL4 v34;
  void *v35;
  NSString *v36;
  _BOOL4 v37;
  void *v38;
  NSString *v39;
  _BOOL4 v40;
  void *v41;
  NSString *v42;
  _BOOL4 v43;
  void *v44;
  NSString *v45;
  _BOOL4 v46;
  void *v47;
  NSString *v48;
  _BOOL4 v49;
  NSURL *originURL;
  NSURL *v51;
  BOOL v52;
  void *v54;
  NSString *v55;
  _BOOL4 v56;
  void *v57;
  NSString *v58;
  _BOOL4 v59;

  v4 = a3;
  v5 = (void *)v4[2];
  v6 = self->_merchantIdentifier;
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
      goto LABEL_7;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_96;
  }
  if (self->_merchantCategoryCode != v4[3])
    goto LABEL_96;
  v11 = (void *)v4[6];
  v6 = self->_rawName;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_7;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_96;
  }
  v14 = (void *)v4[7];
  v6 = self->_name;
  v15 = v14;
  if (v6 == v15)
  {

  }
  else
  {
    v8 = v15;
    if (!v6 || !v15)
      goto LABEL_7;
    v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_96;
  }
  v17 = (void *)v4[8];
  v6 = self->_rawCity;
  v18 = v17;
  if (v6 == v18)
  {

  }
  else
  {
    v8 = v18;
    if (!v6 || !v18)
      goto LABEL_7;
    v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_96;
  }
  v20 = (void *)v4[9];
  v6 = self->_city;
  v21 = v20;
  if (v6 == v21)
  {

  }
  else
  {
    v8 = v21;
    if (!v6 || !v21)
      goto LABEL_7;
    v22 = -[NSString isEqualToString:](v6, "isEqualToString:", v21);

    if (!v22)
      goto LABEL_96;
  }
  v23 = (void *)v4[10];
  v6 = self->_rawState;
  v24 = v23;
  if (v6 == v24)
  {

  }
  else
  {
    v8 = v24;
    if (!v6 || !v24)
      goto LABEL_7;
    v25 = -[NSString isEqualToString:](v6, "isEqualToString:", v24);

    if (!v25)
      goto LABEL_96;
  }
  v26 = (void *)v4[11];
  v6 = self->_state;
  v27 = v26;
  if (v6 == v27)
  {

  }
  else
  {
    v8 = v27;
    if (!v6 || !v27)
      goto LABEL_7;
    v28 = -[NSString isEqualToString:](v6, "isEqualToString:", v27);

    if (!v28)
      goto LABEL_96;
  }
  v29 = (void *)v4[12];
  v6 = self->_rawCountry;
  v30 = v29;
  if (v6 == v30)
  {

  }
  else
  {
    v8 = v30;
    if (!v6 || !v30)
      goto LABEL_7;
    v31 = -[NSString isEqualToString:](v6, "isEqualToString:", v30);

    if (!v31)
      goto LABEL_96;
  }
  v32 = (void *)v4[13];
  v6 = self->_country;
  v33 = v32;
  if (v6 == v33)
  {

  }
  else
  {
    v8 = v33;
    if (!v6 || !v33)
      goto LABEL_7;
    v34 = -[NSString isEqualToString:](v6, "isEqualToString:", v33);

    if (!v34)
      goto LABEL_96;
  }
  v35 = (void *)v4[15];
  v6 = self->_rawCANL;
  v36 = v35;
  if (v6 == v36)
  {

  }
  else
  {
    v8 = v36;
    if (!v6 || !v36)
      goto LABEL_7;
    v37 = -[NSString isEqualToString:](v6, "isEqualToString:", v36);

    if (!v37)
      goto LABEL_96;
  }
  v38 = (void *)v4[14];
  v6 = self->_zipcode;
  v39 = v38;
  if (v6 == v39)
  {

  }
  else
  {
    v8 = v39;
    if (!v6 || !v39)
      goto LABEL_7;
    v40 = -[NSString isEqualToString:](v6, "isEqualToString:", v39);

    if (!v40)
      goto LABEL_96;
  }
  if (self->_cleanConfidence != v4[20] || self->_industryCode != v4[16])
    goto LABEL_96;
  v41 = (void *)v4[17];
  v6 = self->_industryCategory;
  v42 = v41;
  if (v6 == v42)
  {

  }
  else
  {
    v8 = v42;
    if (!v6 || !v42)
      goto LABEL_7;
    v43 = -[NSString isEqualToString:](v6, "isEqualToString:", v42);

    if (!v43)
      goto LABEL_96;
  }
  v44 = (void *)v4[18];
  v6 = self->_authNetworkData;
  v45 = v44;
  if (v6 == v45)
  {

  }
  else
  {
    v8 = v45;
    if (!v6 || !v45)
      goto LABEL_7;
    v46 = -[NSString isEqualToString:](v6, "isEqualToString:", v45);

    if (!v46)
      goto LABEL_96;
  }
  v47 = (void *)v4[19];
  v6 = self->_clearingNetworkData;
  v48 = v47;
  if (v6 == v48)
  {

  }
  else
  {
    v8 = v48;
    if (!v6 || !v48)
      goto LABEL_7;
    v49 = -[NSString isEqualToString:](v6, "isEqualToString:", v48);

    if (!v49)
      goto LABEL_96;
  }
  originURL = self->_originURL;
  v51 = (NSURL *)v4[21];
  if (originURL && v51)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0)
      goto LABEL_96;
  }
  else if (originURL != v51)
  {
    goto LABEL_96;
  }
  v54 = (void *)v4[22];
  v6 = self->_webMerchantIdentifier;
  v55 = v54;
  if (v6 == v55)
  {

    goto LABEL_104;
  }
  v8 = v55;
  if (!v6 || !v55)
  {
LABEL_7:

    goto LABEL_96;
  }
  v56 = -[NSString isEqualToString:](v6, "isEqualToString:", v55);

  if (!v56)
    goto LABEL_96;
LABEL_104:
  v57 = (void *)v4[23];
  v6 = self->_webMerchantName;
  v58 = v57;
  if (v6 == v58)
  {

LABEL_110:
    v52 = self->_adamIdentifier == v4[24];
    goto LABEL_97;
  }
  v8 = v58;
  if (!v6 || !v58)
    goto LABEL_7;
  v59 = -[NSString isEqualToString:](v6, "isEqualToString:", v58);

  if (v59)
    goto LABEL_110;
LABEL_96:
  v52 = 0;
LABEL_97:

  return v52;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterMerchant *v4;
  PKPayLaterMerchant *v5;
  BOOL v6;

  v4 = (PKPayLaterMerchant *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterMerchant isEqualToPayLaterMerchant:](self, "isEqualToPayLaterMerchant:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterMerchant:(id)a3
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
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  void *v23;
  NSString *v24;
  _BOOL4 v25;
  void *v26;
  NSString *v27;
  _BOOL4 v28;
  void *v29;
  NSString *v30;
  _BOOL4 v31;
  void *v32;
  NSString *v33;
  _BOOL4 v34;
  void *v35;
  NSString *v36;
  _BOOL4 v37;
  void *v38;
  NSString *v39;
  _BOOL4 v40;
  void *v41;
  NSString *v42;
  _BOOL4 v43;
  void *v44;
  NSString *v45;
  _BOOL4 v46;
  void *v47;
  NSString *v48;
  _BOOL4 v49;
  PKMapsMerchant *mapsMerchant;
  PKMapsMerchant *v51;
  PKMapsBrand *mapsBrand;
  PKMapsBrand *v53;
  NSDate *lastMerchantReprocessingDate;
  NSDate *v55;
  void *v56;
  NSString *v57;
  _BOOL4 v58;
  void *v59;
  NSString *v60;
  _BOOL4 v61;
  BOOL v62;
  NSURL *originURL;
  NSURL *v65;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_116;
  v6 = (void *)*((_QWORD *)v4 + 2);
  v7 = self->_merchantIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_115;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_116;
  }
  if (self->_merchantCategoryCode != *((_QWORD *)v5 + 3)
    || self->_merchantCategory != *((_QWORD *)v5 + 4)
    || self->_fallbackCategory != *((_QWORD *)v5 + 5))
  {
    goto LABEL_116;
  }
  v11 = (void *)*((_QWORD *)v5 + 6);
  v7 = self->_rawName;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_115;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_116;
  }
  v14 = (void *)*((_QWORD *)v5 + 15);
  v7 = self->_rawCANL;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_115;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_116;
  }
  v17 = (void *)*((_QWORD *)v5 + 8);
  v7 = self->_rawCity;
  v18 = v17;
  if (v7 == v18)
  {

  }
  else
  {
    v9 = v18;
    if (!v7 || !v18)
      goto LABEL_115;
    v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_116;
  }
  v20 = (void *)*((_QWORD *)v5 + 10);
  v7 = self->_rawState;
  v21 = v20;
  if (v7 == v21)
  {

  }
  else
  {
    v9 = v21;
    if (!v7 || !v21)
      goto LABEL_115;
    v22 = -[NSString isEqualToString:](v7, "isEqualToString:", v21);

    if (!v22)
      goto LABEL_116;
  }
  v23 = (void *)*((_QWORD *)v5 + 12);
  v7 = self->_rawCountry;
  v24 = v23;
  if (v7 == v24)
  {

  }
  else
  {
    v9 = v24;
    if (!v7 || !v24)
      goto LABEL_115;
    v25 = -[NSString isEqualToString:](v7, "isEqualToString:", v24);

    if (!v25)
      goto LABEL_116;
  }
  v26 = (void *)*((_QWORD *)v5 + 7);
  v7 = self->_name;
  v27 = v26;
  if (v7 == v27)
  {

  }
  else
  {
    v9 = v27;
    if (!v7 || !v27)
      goto LABEL_115;
    v28 = -[NSString isEqualToString:](v7, "isEqualToString:", v27);

    if (!v28)
      goto LABEL_116;
  }
  v29 = (void *)*((_QWORD *)v5 + 9);
  v7 = self->_city;
  v30 = v29;
  if (v7 == v30)
  {

  }
  else
  {
    v9 = v30;
    if (!v7 || !v30)
      goto LABEL_115;
    v31 = -[NSString isEqualToString:](v7, "isEqualToString:", v30);

    if (!v31)
      goto LABEL_116;
  }
  v32 = (void *)*((_QWORD *)v5 + 11);
  v7 = self->_state;
  v33 = v32;
  if (v7 == v33)
  {

  }
  else
  {
    v9 = v33;
    if (!v7 || !v33)
      goto LABEL_115;
    v34 = -[NSString isEqualToString:](v7, "isEqualToString:", v33);

    if (!v34)
      goto LABEL_116;
  }
  v35 = (void *)*((_QWORD *)v5 + 14);
  v7 = self->_zipcode;
  v36 = v35;
  if (v7 == v36)
  {

  }
  else
  {
    v9 = v36;
    if (!v7 || !v36)
      goto LABEL_115;
    v37 = -[NSString isEqualToString:](v7, "isEqualToString:", v36);

    if (!v37)
      goto LABEL_116;
  }
  v38 = (void *)*((_QWORD *)v5 + 13);
  v7 = self->_country;
  v39 = v38;
  if (v7 == v39)
  {

  }
  else
  {
    v9 = v39;
    if (!v7 || !v39)
      goto LABEL_115;
    v40 = -[NSString isEqualToString:](v7, "isEqualToString:", v39);

    if (!v40)
      goto LABEL_116;
  }
  v41 = (void *)*((_QWORD *)v5 + 19);
  v7 = self->_clearingNetworkData;
  v42 = v41;
  if (v7 == v42)
  {

  }
  else
  {
    v9 = v42;
    if (!v7 || !v42)
      goto LABEL_115;
    v43 = -[NSString isEqualToString:](v7, "isEqualToString:", v42);

    if (!v43)
      goto LABEL_116;
  }
  v44 = (void *)*((_QWORD *)v5 + 18);
  v7 = self->_authNetworkData;
  v45 = v44;
  if (v7 == v45)
  {

  }
  else
  {
    v9 = v45;
    if (!v7 || !v45)
      goto LABEL_115;
    v46 = -[NSString isEqualToString:](v7, "isEqualToString:", v45);

    if (!v46)
      goto LABEL_116;
  }
  v47 = (void *)*((_QWORD *)v5 + 17);
  v7 = self->_industryCategory;
  v48 = v47;
  if (v7 == v48)
  {

  }
  else
  {
    v9 = v48;
    if (!v7 || !v48)
      goto LABEL_115;
    v49 = -[NSString isEqualToString:](v7, "isEqualToString:", v48);

    if (!v49)
      goto LABEL_116;
  }
  mapsMerchant = self->_mapsMerchant;
  v51 = (PKMapsMerchant *)*((_QWORD *)v5 + 25);
  if (mapsMerchant && v51)
  {
    if (!-[PKMapsMerchant isEqual:](mapsMerchant, "isEqual:"))
      goto LABEL_116;
  }
  else if (mapsMerchant != v51)
  {
    goto LABEL_116;
  }
  mapsBrand = self->_mapsBrand;
  v53 = (PKMapsBrand *)*((_QWORD *)v5 + 26);
  if (mapsBrand && v53)
  {
    if (!-[PKMapsBrand isEqual:](mapsBrand, "isEqual:"))
      goto LABEL_116;
  }
  else if (mapsBrand != v53)
  {
    goto LABEL_116;
  }
  lastMerchantReprocessingDate = self->_lastMerchantReprocessingDate;
  v55 = (NSDate *)*((_QWORD *)v5 + 27);
  if (lastMerchantReprocessingDate && v55)
  {
    if ((-[NSDate isEqual:](lastMerchantReprocessingDate, "isEqual:") & 1) == 0)
      goto LABEL_116;
  }
  else if (lastMerchantReprocessingDate != v55)
  {
    goto LABEL_116;
  }
  v56 = (void *)*((_QWORD *)v5 + 22);
  v7 = self->_webMerchantIdentifier;
  v57 = v56;
  if (v7 == v57)
  {

  }
  else
  {
    v9 = v57;
    if (!v7 || !v57)
      goto LABEL_115;
    v58 = -[NSString isEqualToString:](v7, "isEqualToString:", v57);

    if (!v58)
      goto LABEL_116;
  }
  v59 = (void *)*((_QWORD *)v5 + 23);
  v7 = self->_webMerchantName;
  v60 = v59;
  if (v7 != v60)
  {
    v9 = v60;
    if (v7 && v60)
    {
      v61 = -[NSString isEqualToString:](v7, "isEqualToString:", v60);

      if (!v61)
        goto LABEL_116;
      goto LABEL_119;
    }
LABEL_115:

    goto LABEL_116;
  }

LABEL_119:
  originURL = self->_originURL;
  v65 = (NSURL *)*((_QWORD *)v5 + 21);
  if (originURL && v65)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0)
      goto LABEL_116;
  }
  else if (originURL != v65)
  {
    goto LABEL_116;
  }
  if (self->_requiresMerchantReprocessing == v5[8]
    && self->_industryCode == *((_QWORD *)v5 + 16)
    && self->_cleanConfidence == *((_QWORD *)v5 + 20))
  {
    v62 = self->_adamIdentifier == *((_QWORD *)v5 + 24);
    goto LABEL_117;
  }
LABEL_116:
  v62 = 0;
LABEL_117:

  return v62;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_rawName);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCANL);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCity);
  objc_msgSend(v3, "safelyAddObject:", self->_rawState);
  objc_msgSend(v3, "safelyAddObject:", self->_rawCountry);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_city);
  objc_msgSend(v3, "safelyAddObject:", self->_state);
  objc_msgSend(v3, "safelyAddObject:", self->_zipcode);
  objc_msgSend(v3, "safelyAddObject:", self->_country);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsBrand);
  objc_msgSend(v3, "safelyAddObject:", self->_mapsMerchant);
  objc_msgSend(v3, "safelyAddObject:", self->_industryCategory);
  objc_msgSend(v3, "safelyAddObject:", self->_authNetworkData);
  objc_msgSend(v3, "safelyAddObject:", self->_clearingNetworkData);
  objc_msgSend(v3, "safelyAddObject:", self->_lastMerchantReprocessingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_originURL);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantName);
  objc_msgSend(v3, "safelyAddObject:", self->_webMerchantIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_merchantCategoryCode - v4 + 32 * v4;
  v6 = self->_merchantCategory - v5 + 32 * v5;
  v7 = self->_cleanConfidence - v6 + 32 * v6;
  v8 = self->_industryCode - v7 + 32 * v7;
  v9 = self->_requiresMerchantReprocessing - v8 + 32 * v8;
  v10 = self->_fallbackCategory - v9 + 32 * v9;
  v11 = self->_adamIdentifier - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: '%@'; "), self->_merchantIdentifier);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_merchantCategoryCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategoryCode: '%@'; "), v4);

  PKMerchantCategoryToString(self->_merchantCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategory: '%@'; "), v5);

  PKMerchantCategoryToString(self->_fallbackCategory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fallbackCategory: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("rawName: '%@'; "), self->_rawName);
  objc_msgSend(v3, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("rawCity: '%@'; "), self->_rawCity);
  objc_msgSend(v3, "appendFormat:", CFSTR("city: '%@'; "), self->_city);
  objc_msgSend(v3, "appendFormat:", CFSTR("rawState: '%@'; "), self->_rawState);
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("rawCountry: '%@'; "), self->_rawCountry);
  objc_msgSend(v3, "appendFormat:", CFSTR("country: '%@'; "), self->_country);
  objc_msgSend(v3, "appendFormat:", CFSTR("rawCANL: '%@'; "), self->_rawCANL);
  objc_msgSend(v3, "appendFormat:", CFSTR("zipcode: '%@'; "), self->_zipcode);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cleanConfidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cleanConfidence: '%@'; "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_industryCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("industryCode: '%@'; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("industryCategory: '%@'; "), self->_industryCategory);
  objc_msgSend(v3, "appendFormat:", CFSTR("mapsMerchant: '%@'; "), self->_mapsMerchant);
  objc_msgSend(v3, "appendFormat:", CFSTR("mapsBrand: '%@'; "), self->_mapsBrand);
  if (self->_requiresMerchantReprocessing)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresMerchantReprocessing: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastMerchantReprocessingDate: '%@'; "), self->_lastMerchantReprocessingDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("clearingNetworkData: '%@'; "), self->_clearingNetworkData);
  objc_msgSend(v3, "appendFormat:", CFSTR("authNetworkData: '%@'; "), self->_authNetworkData);
  objc_msgSend(v3, "appendFormat:", CFSTR("originURL: '%@'; "), self->_originURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("webMerchantName: '%@'; "), self->_webMerchantName);
  objc_msgSend(v3, "appendFormat:", CFSTR("webMerchantIdentifier: '%@'; "), self->_webMerchantIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("authNetworkData: %ld; "), self->_adamIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_merchantCategoryCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("merchantCategoryCode"));

  PKMerchantCategoryToString(self->_merchantCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("merchantCategory"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawName, CFSTR("merchantRawName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("merchantName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCity, CFSTR("merchantRawCity"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_city, CFSTR("merchantCity"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawState, CFSTR("merchantRawState"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_state, CFSTR("merchantState"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCountry, CFSTR("merchantRawCountry"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_country, CFSTR("merchantCountry"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rawCANL, CFSTR("merchantRawCANL"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_zipcode, CFSTR("merchantZip"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cleanConfidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("merchantCleanConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_industryCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("merchantIndustryCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_industryCategory, CFSTR("merchantIndustryCategory"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_authNetworkData, CFSTR("authNetworkData"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clearingNetworkData, CFSTR("clearingNetworkData"));
  -[NSURL absoluteString](self->_originURL, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("originURL"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_webMerchantIdentifier, CFSTR("webMerchantIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_webMerchantName, CFSTR("webMerchantName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_adamIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("adamIdentifier"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterMerchant)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterMerchant *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *rawName;
  uint64_t v10;
  NSString *rawCANL;
  uint64_t v12;
  NSString *rawCity;
  uint64_t v14;
  NSString *rawState;
  uint64_t v16;
  NSString *rawCountry;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *city;
  uint64_t v22;
  NSString *state;
  uint64_t v24;
  NSString *zipcode;
  uint64_t v26;
  NSString *country;
  uint64_t v28;
  NSString *authNetworkData;
  uint64_t v30;
  NSString *clearingNetworkData;
  uint64_t v32;
  NSString *industryCategory;
  uint64_t v34;
  PKMapsBrand *mapsBrand;
  uint64_t v36;
  PKMapsMerchant *mapsMerchant;
  uint64_t v38;
  NSDate *lastMerchantReprocessingDate;
  uint64_t v40;
  NSString *webMerchantName;
  uint64_t v42;
  NSString *webMerchantIdentifier;
  uint64_t v44;
  NSURL *originURL;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKPayLaterMerchant;
  v5 = -[PKPayLaterMerchant init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    v5->_merchantCategoryCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategoryCode"));
    v5->_merchantCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCategory"));
    v5->_fallbackCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fallbackCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawName"));
    v8 = objc_claimAutoreleasedReturnValue();
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawCANL"));
    v10 = objc_claimAutoreleasedReturnValue();
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawCity"));
    v12 = objc_claimAutoreleasedReturnValue();
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawState"));
    v14 = objc_claimAutoreleasedReturnValue();
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawCountry"));
    v16 = objc_claimAutoreleasedReturnValue();
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantName"));
    v18 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCity"));
    v20 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantState"));
    v22 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantZip"));
    v24 = objc_claimAutoreleasedReturnValue();
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCountry"));
    v26 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authNetworkData"));
    v28 = objc_claimAutoreleasedReturnValue();
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearingNetworkData"));
    v30 = objc_claimAutoreleasedReturnValue();
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v30;

    v5->_cleanConfidence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCleanConfidence"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIndustryCategory"));
    v32 = objc_claimAutoreleasedReturnValue();
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v32;

    v5->_industryCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantIndustryCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsBrand"));
    v34 = objc_claimAutoreleasedReturnValue();
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = (PKMapsBrand *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapsMerchant"));
    v36 = objc_claimAutoreleasedReturnValue();
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = (PKMapsMerchant *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastMerchantReprocessingDate"));
    v38 = objc_claimAutoreleasedReturnValue();
    lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
    v5->_lastMerchantReprocessingDate = (NSDate *)v38;

    v5->_requiresMerchantReprocessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresMerchantReprocessing"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webMerchantName"));
    v40 = objc_claimAutoreleasedReturnValue();
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webMerchantIdentifier"));
    v42 = objc_claimAutoreleasedReturnValue();
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originURL"));
    v44 = objc_claimAutoreleasedReturnValue();
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v44;

    v5->_adamIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adamIdentifier"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *merchantIdentifier;
  id v5;

  merchantIdentifier = self->_merchantIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCategoryCode, CFSTR("merchantCategoryCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCategory, CFSTR("merchantCategory"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fallbackCategory, CFSTR("fallbackCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawName, CFSTR("merchantRawName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawCANL, CFSTR("merchantRawCANL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawCity, CFSTR("merchantRawCity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawState, CFSTR("merchantRawState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawCountry, CFSTR("merchantRawCountry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("merchantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("merchantCity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("merchantState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zipcode, CFSTR("merchantZip"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("merchantCountry"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cleanConfidence, CFSTR("merchantCleanConfidence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapsBrand, CFSTR("mapsBrand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapsMerchant, CFSTR("mapsMerchant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastMerchantReprocessingDate, CFSTR("lastMerchantReprocessingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_industryCategory, CFSTR("merchantIndustryCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clearingNetworkData, CFSTR("clearingNetworkData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authNetworkData, CFSTR("authNetworkData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_industryCode, CFSTR("merchantIndustryCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresMerchantReprocessing, CFSTR("requiresMerchantReprocessing"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webMerchantName, CFSTR("webMerchantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webMerchantIdentifier, CFSTR("webMerchantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originURL, CFSTR("originURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_adamIdentifier, CFSTR("adamIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterMerchant *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *rawName;
  uint64_t v10;
  NSString *rawCANL;
  uint64_t v12;
  NSString *rawCity;
  uint64_t v14;
  NSString *rawState;
  uint64_t v16;
  NSString *rawCountry;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *city;
  uint64_t v22;
  NSString *state;
  uint64_t v24;
  NSString *zipcode;
  uint64_t v26;
  NSString *country;
  uint64_t v28;
  NSString *industryCategory;
  uint64_t v30;
  NSString *authNetworkData;
  uint64_t v32;
  NSString *clearingNetworkData;
  uint64_t v34;
  NSDate *lastMerchantReprocessingDate;
  uint64_t v36;
  NSString *webMerchantName;
  uint64_t v38;
  NSString *webMerchantIdentifier;
  uint64_t v40;
  NSURL *originURL;

  v5 = -[PKPayLaterMerchant init](+[PKPayLaterMerchant allocWithZone:](PKPayLaterMerchant, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  v5->_merchantCategoryCode = self->_merchantCategoryCode;
  v5->_fallbackCategory = self->_fallbackCategory;
  v5->_merchantCategory = self->_merchantCategory;
  v8 = -[NSString copyWithZone:](self->_rawName, "copyWithZone:", a3);
  rawName = v5->_rawName;
  v5->_rawName = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_rawCANL, "copyWithZone:", a3);
  rawCANL = v5->_rawCANL;
  v5->_rawCANL = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_rawCity, "copyWithZone:", a3);
  rawCity = v5->_rawCity;
  v5->_rawCity = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_rawState, "copyWithZone:", a3);
  rawState = v5->_rawState;
  v5->_rawState = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_rawCountry, "copyWithZone:", a3);
  rawCountry = v5->_rawCountry;
  v5->_rawCountry = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  city = v5->_city;
  v5->_city = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  state = v5->_state;
  v5->_state = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_zipcode, "copyWithZone:", a3);
  zipcode = v5->_zipcode;
  v5->_zipcode = (NSString *)v24;

  v26 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  country = v5->_country;
  v5->_country = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_industryCategory, "copyWithZone:", a3);
  industryCategory = v5->_industryCategory;
  v5->_industryCategory = (NSString *)v28;

  v5->_industryCode = self->_industryCode;
  v30 = -[NSString copyWithZone:](self->_authNetworkData, "copyWithZone:", a3);
  authNetworkData = v5->_authNetworkData;
  v5->_authNetworkData = (NSString *)v30;

  v32 = -[NSString copyWithZone:](self->_clearingNetworkData, "copyWithZone:", a3);
  clearingNetworkData = v5->_clearingNetworkData;
  v5->_clearingNetworkData = (NSString *)v32;

  v34 = -[NSDate copyWithZone:](self->_lastMerchantReprocessingDate, "copyWithZone:", a3);
  lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
  v5->_lastMerchantReprocessingDate = (NSDate *)v34;

  v5->_requiresMerchantReprocessing = self->_requiresMerchantReprocessing;
  v5->_cleanConfidence = self->_cleanConfidence;
  v36 = -[NSString copyWithZone:](self->_webMerchantName, "copyWithZone:", a3);
  webMerchantName = v5->_webMerchantName;
  v5->_webMerchantName = (NSString *)v36;

  v38 = -[NSString copyWithZone:](self->_webMerchantIdentifier, "copyWithZone:", a3);
  webMerchantIdentifier = v5->_webMerchantIdentifier;
  v5->_webMerchantIdentifier = (NSString *)v38;

  v40 = -[NSURL copyWithZone:](self->_originURL, "copyWithZone:", a3);
  originURL = v5->_originURL;
  v5->_originURL = (NSURL *)v40;

  v5->_adamIdentifier = self->_adamIdentifier;
  return v5;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(int64_t)a3
{
  self->_merchantCategoryCode = a3;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (int64_t)fallbackCategory
{
  return self->_fallbackCategory;
}

- (void)setFallbackCategory:(int64_t)a3
{
  self->_fallbackCategory = a3;
}

- (NSString)rawName
{
  return self->_rawName;
}

- (void)setRawName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)rawCity
{
  return self->_rawCity;
}

- (void)setRawCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)rawState
{
  return self->_rawState;
}

- (void)setRawState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)rawCountry
{
  return self->_rawCountry;
}

- (void)setRawCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)zipcode
{
  return self->_zipcode;
}

- (void)setZipcode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)rawCANL
{
  return self->_rawCANL;
}

- (void)setRawCANL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)authNetworkData
{
  return self->_authNetworkData;
}

- (void)setAuthNetworkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)clearingNetworkData
{
  return self->_clearingNetworkData;
}

- (void)setClearingNetworkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)cleanConfidence
{
  return self->_cleanConfidence;
}

- (void)setCleanConfidence:(int64_t)a3
{
  self->_cleanConfidence = a3;
}

- (NSURL)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(int64_t)a3
{
  self->_adamIdentifier = a3;
}

- (PKMapsMerchant)mapsMerchant
{
  return self->_mapsMerchant;
}

- (void)setMapsMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_mapsMerchant, a3);
}

- (PKMapsBrand)mapsBrand
{
  return self->_mapsBrand;
}

- (void)setMapsBrand:(id)a3
{
  objc_storeStrong((id *)&self->_mapsBrand, a3);
}

- (BOOL)requiresMerchantReprocessing
{
  return self->_requiresMerchantReprocessing;
}

- (void)setRequiresMerchantReprocessing:(BOOL)a3
{
  self->_requiresMerchantReprocessing = a3;
}

- (NSDate)lastMerchantReprocessingDate
{
  return self->_lastMerchantReprocessingDate;
}

- (void)setLastMerchantReprocessingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMerchantReprocessingDate, 0);
  objc_storeStrong((id *)&self->_mapsBrand, 0);
  objc_storeStrong((id *)&self->_mapsMerchant, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_clearingNetworkData, 0);
  objc_storeStrong((id *)&self->_authNetworkData, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_rawCANL, 0);
  objc_storeStrong((id *)&self->_zipcode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_rawCountry, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_rawState, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_rawCity, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
