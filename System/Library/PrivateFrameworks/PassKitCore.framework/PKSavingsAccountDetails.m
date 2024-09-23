@implementation PKSavingsAccountDetails

- (PKSavingsAccountDetails)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *routingNumber;
  uint64_t v16;
  NSString *accountNumber;
  void *v18;
  uint64_t v19;
  NSTimeZone *productTimeZone;
  PKSavingsAccountStepUpDetails *v21;
  void *v22;
  uint64_t v23;
  PKSavingsAccountStepUpDetails *fccStepUpDetails;
  uint64_t v25;
  NSString *termsIdentifier;
  uint64_t v27;
  NSURL *privacyPolicyURL;
  uint64_t v29;
  NSString *businessChatIdentifier;
  uint64_t v31;
  NSURL *contactWebsite;
  uint64_t v33;
  NSString *contactNumber;
  PKSavingsAccountSummary *v35;
  void *v36;
  uint64_t v37;
  PKSavingsAccountSummary *accountSummary;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKSavingsAccountDetails;
  v5 = -[PKSavingsAccountDetails init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("routingNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("productTimeZone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v19;

    }
    v5->_moreInfoRequired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("moreInfoRequired"));
    v5->_fccStepUpRequired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("fccStepUpRequired"));
    v21 = [PKSavingsAccountStepUpDetails alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("fccStepUpDetails"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKSavingsAccountStepUpDetails initWithDictionary:](v21, "initWithDictionary:", v22);
    fccStepUpDetails = v5->_fccStepUpDetails;
    v5->_fccStepUpDetails = (PKSavingsAccountStepUpDetails *)v23;

    v5->_termsAcceptanceRequired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("privacyPolicyURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v27;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v29;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("contactWebsite"));
    v31 = objc_claimAutoreleasedReturnValue();
    contactWebsite = v5->_contactWebsite;
    v5->_contactWebsite = (NSURL *)v31;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("contactNumber"));
    v33 = objc_claimAutoreleasedReturnValue();
    contactNumber = v5->_contactNumber;
    v5->_contactNumber = (NSString *)v33;

    v35 = [PKSavingsAccountSummary alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("accountSummary"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PKSavingsAccountSummary initWithDictionary:](v35, "initWithDictionary:", v36);
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKSavingsAccountSummary *)v37;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *routingNumber;
  uint64_t v16;
  NSString *accountNumber;
  uint64_t v18;
  NSTimeZone *productTimeZone;
  uint64_t v20;
  PKSavingsAccountStepUpDetails *fccStepUpDetails;
  uint64_t v22;
  NSString *termsIdentifier;
  uint64_t v24;
  NSURL *privacyPolicyURL;
  uint64_t v26;
  NSString *businessChatIdentifier;
  uint64_t v28;
  NSURL *contactWebsite;
  uint64_t v30;
  NSString *contactNumber;
  uint64_t v32;
  PKSavingsAccountSummary *accountSummary;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKSavingsAccountDetails;
  v5 = -[PKSavingsAccountDetails init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productTimeZone"));
    v18 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v18;

    v5->_moreInfoRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("moreInfoRequired"));
    v5->_fccStepUpRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fccStepUpRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fccStepUpDetails"));
    v20 = objc_claimAutoreleasedReturnValue();
    fccStepUpDetails = v5->_fccStepUpDetails;
    v5->_fccStepUpDetails = (PKSavingsAccountStepUpDetails *)v20;

    v5->_termsAcceptanceRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactWebsite"));
    v28 = objc_claimAutoreleasedReturnValue();
    contactWebsite = v5->_contactWebsite;
    v5->_contactWebsite = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactNumber"));
    v30 = objc_claimAutoreleasedReturnValue();
    contactNumber = v5->_contactNumber;
    v5->_contactNumber = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountSummary"));
    v32 = objc_claimAutoreleasedReturnValue();
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKSavingsAccountSummary *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *createdDate;
  id v5;

  createdDate = self->_createdDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", createdDate, CFSTR("createdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productTimeZone, CFSTR("productTimeZone"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_moreInfoRequired, CFSTR("moreInfoRequired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fccStepUpRequired, CFSTR("fccStepUpRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fccStepUpDetails, CFSTR("fccStepUpDetails"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_termsAcceptanceRequired, CFSTR("termsAcceptanceRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyPolicyURL, CFSTR("privacyPolicyURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatIdentifier, CFSTR("businessChatIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactWebsite, CFSTR("contactWebsite"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactNumber, CFSTR("contactNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountSummary, CFSTR("accountSummary"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *createdDate;
  NSDate *v6;
  NSDate *lastUpdatedDate;
  NSDate *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSString *currencyCode;
  NSString *v15;
  NSString *routingNumber;
  NSString *v17;
  NSString *accountNumber;
  NSString *v19;
  NSTimeZone *productTimeZone;
  NSTimeZone *v21;
  NSString *termsIdentifier;
  NSString *v23;
  NSURL *privacyPolicyURL;
  NSURL *v25;
  NSString *businessChatIdentifier;
  NSString *v27;
  NSURL *contactWebsite;
  NSURL *v29;
  NSString *contactNumber;
  NSString *v31;
  PKSavingsAccountSummary *accountSummary;
  PKSavingsAccountSummary *v33;
  PKSavingsAccountStepUpDetails *fccStepUpDetails;
  PKSavingsAccountStepUpDetails *v35;
  BOOL v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_74;
  createdDate = self->_createdDate;
  v6 = (NSDate *)v4[3];
  if (createdDate && v6)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (createdDate != v6)
  {
    goto LABEL_74;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  v8 = (NSDate *)v4[2];
  if (lastUpdatedDate && v8)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (lastUpdatedDate != v8)
  {
    goto LABEL_74;
  }
  v9 = (void *)v4[4];
  v10 = self->_countryCode;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_74;
    }
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_74;
  }
  currencyCode = self->_currencyCode;
  v15 = (NSString *)v4[5];
  if (currencyCode && v15)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (currencyCode != v15)
  {
    goto LABEL_74;
  }
  routingNumber = self->_routingNumber;
  v17 = (NSString *)v4[6];
  if (routingNumber && v17)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (routingNumber != v17)
  {
    goto LABEL_74;
  }
  accountNumber = self->_accountNumber;
  v19 = (NSString *)v4[7];
  if (accountNumber && v19)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (accountNumber != v19)
  {
    goto LABEL_74;
  }
  productTimeZone = self->_productTimeZone;
  v21 = (NSTimeZone *)v4[8];
  if (productTimeZone && v21)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (productTimeZone != v21)
  {
    goto LABEL_74;
  }
  if (self->_moreInfoRequired != *((unsigned __int8 *)v4 + 8)
    || self->_fccStepUpRequired != *((unsigned __int8 *)v4 + 9)
    || self->_termsAcceptanceRequired != *((unsigned __int8 *)v4 + 10))
  {
    goto LABEL_74;
  }
  termsIdentifier = self->_termsIdentifier;
  v23 = (NSString *)v4[10];
  if (termsIdentifier && v23)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (termsIdentifier != v23)
  {
    goto LABEL_74;
  }
  privacyPolicyURL = self->_privacyPolicyURL;
  v25 = (NSURL *)v4[11];
  if (privacyPolicyURL && v25)
  {
    if ((-[NSURL isEqual:](privacyPolicyURL, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (privacyPolicyURL != v25)
  {
    goto LABEL_74;
  }
  businessChatIdentifier = self->_businessChatIdentifier;
  v27 = (NSString *)v4[12];
  if (businessChatIdentifier && v27)
  {
    if ((-[NSString isEqual:](businessChatIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (businessChatIdentifier != v27)
  {
    goto LABEL_74;
  }
  contactWebsite = self->_contactWebsite;
  v29 = (NSURL *)v4[13];
  if (contactWebsite && v29)
  {
    if ((-[NSURL isEqual:](contactWebsite, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (contactWebsite != v29)
  {
    goto LABEL_74;
  }
  contactNumber = self->_contactNumber;
  v31 = (NSString *)v4[14];
  if (contactNumber && v31)
  {
    if ((-[NSString isEqual:](contactNumber, "isEqual:") & 1) == 0)
      goto LABEL_74;
  }
  else if (contactNumber != v31)
  {
    goto LABEL_74;
  }
  accountSummary = self->_accountSummary;
  v33 = (PKSavingsAccountSummary *)v4[15];
  if (!accountSummary || !v33)
  {
    if (accountSummary == v33)
      goto LABEL_70;
LABEL_74:
    v36 = 0;
    goto LABEL_75;
  }
  if (!-[PKSavingsAccountSummary isEqual:](accountSummary, "isEqual:"))
    goto LABEL_74;
LABEL_70:
  fccStepUpDetails = self->_fccStepUpDetails;
  v35 = (PKSavingsAccountStepUpDetails *)v4[9];
  if (fccStepUpDetails && v35)
    v36 = -[PKSavingsAccountStepUpDetails isEqual:](fccStepUpDetails, "isEqual:");
  else
    v36 = fccStepUpDetails == v35;
LABEL_75:

  return v36;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_accountNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_routingNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_productTimeZone);
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_privacyPolicyURL);
  objc_msgSend(v3, "safelyAddObject:", self->_businessChatIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_contactWebsite);
  objc_msgSend(v3, "safelyAddObject:", self->_contactNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_accountSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_fccStepUpDetails);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_moreInfoRequired - v4 + 32 * v4;
  v6 = self->_fccStepUpRequired - v5 + 32 * v5;
  v7 = self->_termsAcceptanceRequired - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_lastUpdatedDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdatedDate: '%@'; "), v4);

  -[NSDate description](self->_createdDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("routingNumber: '%@'; "), self->_routingNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountNumber: '%@'; "), self->_accountNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("productTimeZone: '%@'; "), self->_productTimeZone);
  if (self->_moreInfoRequired)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("moreInfoRequired: '%@'; "), v6);
  if (self->_fccStepUpRequired)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("fccStepUpRequired: '%@'; "), v7);
  -[PKSavingsAccountStepUpDetails description](self->_fccStepUpDetails, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fccStepUpDetails: '%@'; "), v8);

  if (self->_termsAcceptanceRequired)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("termsAcceptanceRequired: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("privacyPolicyURL: '%@'; "), self->_privacyPolicyURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatIdentifier: '%@'; "), self->_businessChatIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("contactWebsite: '%@'; "), self->_contactWebsite);
  objc_msgSend(v3, "appendFormat:", CFSTR("contactNumber: '%@'; "), self->_contactNumber);
  -[PKSavingsAccountSummary description](self->_accountSummary, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("summary: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSavingsAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *routingNumber;
  uint64_t v16;
  NSString *accountNumber;
  uint64_t v18;
  NSTimeZone *productTimeZone;
  PKSavingsAccountStepUpDetails *v20;
  PKSavingsAccountStepUpDetails *fccStepUpDetails;
  uint64_t v22;
  NSString *termsIdentifier;
  uint64_t v24;
  NSURL *privacyPolicyURL;
  uint64_t v26;
  NSString *businessChatIdentifier;
  uint64_t v28;
  NSURL *contactWebsite;
  uint64_t v30;
  NSString *contactNumber;
  PKSavingsAccountSummary *v32;
  PKSavingsAccountSummary *accountSummary;

  v5 = -[PKSavingsAccountDetails init](+[PKSavingsAccountDetails allocWithZone:](PKSavingsAccountDetails, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_createdDate, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v10 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_routingNumber, "copyWithZone:", a3);
  routingNumber = v5->_routingNumber;
  v5->_routingNumber = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  accountNumber = v5->_accountNumber;
  v5->_accountNumber = (NSString *)v16;

  v18 = -[NSTimeZone copyWithZone:](self->_productTimeZone, "copyWithZone:", a3);
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v18;

  v5->_moreInfoRequired = self->_moreInfoRequired;
  v5->_fccStepUpRequired = self->_fccStepUpRequired;
  v20 = -[PKSavingsAccountStepUpDetails copyWithZone:](self->_fccStepUpDetails, "copyWithZone:", a3);
  fccStepUpDetails = v5->_fccStepUpDetails;
  v5->_fccStepUpDetails = v20;

  v5->_termsAcceptanceRequired = self->_termsAcceptanceRequired;
  v22 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v22;

  v24 = -[NSURL copyWithZone:](self->_privacyPolicyURL, "copyWithZone:", a3);
  privacyPolicyURL = v5->_privacyPolicyURL;
  v5->_privacyPolicyURL = (NSURL *)v24;

  v26 = -[NSString copyWithZone:](self->_businessChatIdentifier, "copyWithZone:", a3);
  businessChatIdentifier = v5->_businessChatIdentifier;
  v5->_businessChatIdentifier = (NSString *)v26;

  v28 = -[NSURL copyWithZone:](self->_contactWebsite, "copyWithZone:", a3);
  contactWebsite = v5->_contactWebsite;
  v5->_contactWebsite = (NSURL *)v28;

  v30 = -[NSString copyWithZone:](self->_contactNumber, "copyWithZone:", a3);
  contactNumber = v5->_contactNumber;
  v5->_contactNumber = (NSString *)v30;

  v32 = -[PKSavingsAccountSummary copyWithZone:](self->_accountSummary, "copyWithZone:", a3);
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v32;

  return v5;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZone, a3);
}

- (BOOL)moreInfoRequired
{
  return self->_moreInfoRequired;
}

- (void)setMoreInfoRequired:(BOOL)a3
{
  self->_moreInfoRequired = a3;
}

- (BOOL)fccStepUpRequired
{
  return self->_fccStepUpRequired;
}

- (void)setFccStepUpRequired:(BOOL)a3
{
  self->_fccStepUpRequired = a3;
}

- (PKSavingsAccountStepUpDetails)fccStepUpDetails
{
  return self->_fccStepUpDetails;
}

- (void)setFccStepUpDetails:(id)a3
{
  objc_storeStrong((id *)&self->_fccStepUpDetails, a3);
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)contactWebsite
{
  return self->_contactWebsite;
}

- (void)setContactWebsite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)contactNumber
{
  return self->_contactNumber;
}

- (void)setContactNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKSavingsAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
  objc_storeStrong((id *)&self->_accountSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_contactNumber, 0);
  objc_storeStrong((id *)&self->_contactWebsite, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_fccStepUpDetails, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end
