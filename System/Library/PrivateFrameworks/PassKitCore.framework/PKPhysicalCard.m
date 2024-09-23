@implementation PKPhysicalCard

- (PKPhysicalCard)initWithDictionary:(id)a3
{
  id v4;
  PKPhysicalCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountUserAltDSID;
  void *v10;
  uint64_t v11;
  NSString *FPANSuffix;
  uint64_t v13;
  NSString *trackingNumber;
  uint64_t v15;
  NSString *shippingCompany;
  void *v17;
  uint64_t v18;
  NSURL *frontFaceImageURL;
  uint64_t v20;
  NSString *nameOnCard;
  uint64_t v22;
  NSDate *lastUpdated;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *activationCodeHash;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPhysicalCard;
  v5 = -[PKPhysicalCard init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKPhysicalCardStateFromString(v10);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("FPANSuffix"));
    v11 = objc_claimAutoreleasedReturnValue();
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("trackingNumber"));
    v13 = objc_claimAutoreleasedReturnValue();
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("shippingCompany"));
    v15 = objc_claimAutoreleasedReturnValue();
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v15;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("customizationOptions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "PKURLForKey:", CFSTR("frontFaceImageURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v18;

    objc_msgSend(v17, "PKStringForKey:", CFSTR("name"));
    v20 = objc_claimAutoreleasedReturnValue();
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v20;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("orderActivity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pk_arrayByApplyingBlock:", &__block_literal_global_53);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
      v28 = v27;
    else
      v28 = 0;
    objc_storeStrong((id *)&v5->_orderActivity, v28);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("activationCodeHash"));
    v29 = objc_claimAutoreleasedReturnValue();
    activationCodeHash = v5->_activationCodeHash;
    v5->_activationCodeHash = (NSString *)v29;

    v5->_expirationMonth = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("expirationMonth"));
    v5->_expirationYear = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("expirationYear"));

  }
  return v5;
}

PKPhysicalCardOrderActivityEvent *__37__PKPhysicalCard_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCardOrderActivityEvent *v3;

  v2 = a2;
  v3 = -[PKPhysicalCardOrderActivityEvent initWithDictionary:]([PKPhysicalCardOrderActivityEvent alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)latestOrderActivity
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_orderActivity;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "date", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "compare:", v10);

          if (v11 != 1)
            continue;
        }
        v12 = v8;

        v5 = v12;
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)latestShippingActivity
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_shippingActivity;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "timestamp", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "timestamp");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "compare:", v10);

          if (v11 != 1)
            continue;
        }
        v12 = v8;

        v5 = v12;
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)physicalCard:(id)a3 matchesActivationCode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (v5 && v6 && v7)
  {
    objc_msgSend(v5, "activationCodeHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v12)
    {
      objc_msgSend(v12, "SHA256Hash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "hexEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
        if (v15 && v16)
          LOBYTE(v9) = objc_msgSend(v15, "isEqualToString:", v16);
      }

    }
  }

  return (char)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCard)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountUserAltDSID;
  uint64_t v10;
  NSString *FPANSuffix;
  uint64_t v12;
  NSURL *frontFaceImageURL;
  uint64_t v14;
  NSString *nameOnCard;
  uint64_t v16;
  NSDate *lastUpdated;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSSet *orderActivity;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSSet *shippingActivity;
  uint64_t v28;
  NSString *trackingNumber;
  uint64_t v30;
  NSString *shippingCompany;
  uint64_t v32;
  NSString *activationCodeHash;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPhysicalCard;
  v5 = -[PKPhysicalCard init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FPANSuffix"));
    v10 = objc_claimAutoreleasedReturnValue();
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frontFaceImageURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("orderActivity"));
    v21 = objc_claimAutoreleasedReturnValue();
    orderActivity = v5->_orderActivity;
    v5->_orderActivity = (NSSet *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("shippingActivity"));
    v26 = objc_claimAutoreleasedReturnValue();
    shippingActivity = v5->_shippingActivity;
    v5->_shippingActivity = (NSSet *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingNumber"));
    v28 = objc_claimAutoreleasedReturnValue();
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingCompany"));
    v30 = objc_claimAutoreleasedReturnValue();
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationCodeHash"));
    v32 = objc_claimAutoreleasedReturnValue();
    activationCodeHash = v5->_activationCodeHash;
    v5->_activationCodeHash = (NSString *)v32;

    v5->_expirationMonth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expirationMonth"));
    v5->_expirationYear = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expirationYear"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FPANSuffix, CFSTR("FPANSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_frontFaceImageURL, CFSTR("frontFaceImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameOnCard, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderActivity, CFSTR("orderActivity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shippingActivity, CFSTR("shippingActivity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trackingNumber, CFSTR("trackingNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shippingCompany, CFSTR("shippingCompany"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationCodeHash, CFSTR("activationCodeHash"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_expirationMonth, CFSTR("expirationMonth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_expirationYear, CFSTR("expirationYear"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *accountUserAltDSID;
  NSString *v8;
  NSURL *frontFaceImageURL;
  NSURL *v10;
  NSString *nameOnCard;
  NSString *v12;
  NSDate *lastUpdated;
  NSDate *v14;
  NSString *FPANSuffix;
  NSString *v16;
  NSString *trackingNumber;
  NSString *v18;
  NSString *shippingCompany;
  NSString *v20;
  NSSet *orderActivity;
  NSSet *v22;
  NSSet *shippingActivity;
  NSSet *v24;
  NSString *activationCodeHash;
  NSString *v26;
  BOOL v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_60;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (identifier != v6)
  {
    goto LABEL_60;
  }
  accountUserAltDSID = self->_accountUserAltDSID;
  v8 = (NSString *)v4[2];
  if (accountUserAltDSID && v8)
  {
    if ((-[NSString isEqual:](accountUserAltDSID, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (accountUserAltDSID != v8)
  {
    goto LABEL_60;
  }
  frontFaceImageURL = self->_frontFaceImageURL;
  v10 = (NSURL *)v4[5];
  if (frontFaceImageURL && v10)
  {
    if ((-[NSURL isEqual:](frontFaceImageURL, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (frontFaceImageURL != v10)
  {
    goto LABEL_60;
  }
  nameOnCard = self->_nameOnCard;
  v12 = (NSString *)v4[6];
  if (nameOnCard && v12)
  {
    if ((-[NSString isEqual:](nameOnCard, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (nameOnCard != v12)
  {
    goto LABEL_60;
  }
  lastUpdated = self->_lastUpdated;
  v14 = (NSDate *)v4[7];
  if (lastUpdated && v14)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (lastUpdated != v14)
  {
    goto LABEL_60;
  }
  FPANSuffix = self->_FPANSuffix;
  v16 = (NSString *)v4[4];
  if (FPANSuffix && v16)
  {
    if ((-[NSString isEqual:](FPANSuffix, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (FPANSuffix != v16)
  {
    goto LABEL_60;
  }
  trackingNumber = self->_trackingNumber;
  v18 = (NSString *)v4[8];
  if (trackingNumber && v18)
  {
    if ((-[NSString isEqual:](trackingNumber, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (trackingNumber != v18)
  {
    goto LABEL_60;
  }
  shippingCompany = self->_shippingCompany;
  v20 = (NSString *)v4[9];
  if (shippingCompany && v20)
  {
    if ((-[NSString isEqual:](shippingCompany, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (shippingCompany != v20)
  {
    goto LABEL_60;
  }
  orderActivity = self->_orderActivity;
  v22 = (NSSet *)v4[10];
  if (orderActivity && v22)
  {
    if ((-[NSSet isEqual:](orderActivity, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (orderActivity != v22)
  {
    goto LABEL_60;
  }
  shippingActivity = self->_shippingActivity;
  v24 = (NSSet *)v4[11];
  if (shippingActivity && v24)
  {
    if ((-[NSSet isEqual:](shippingActivity, "isEqual:") & 1) == 0)
      goto LABEL_60;
  }
  else if (shippingActivity != v24)
  {
    goto LABEL_60;
  }
  if (self->_state != v4[3])
    goto LABEL_60;
  activationCodeHash = self->_activationCodeHash;
  v26 = (NSString *)v4[12];
  if (!activationCodeHash || !v26)
  {
    if (activationCodeHash == v26)
      goto LABEL_58;
LABEL_60:
    v27 = 0;
    goto LABEL_61;
  }
  if ((-[NSString isEqual:](activationCodeHash, "isEqual:") & 1) == 0)
    goto LABEL_60;
LABEL_58:
  if (self->_expirationMonth != v4[13])
    goto LABEL_60;
  v27 = self->_expirationYear == v4[14];
LABEL_61:

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_frontFaceImageURL);
  objc_msgSend(v3, "safelyAddObject:", self->_nameOnCard);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_FPANSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_orderActivity);
  objc_msgSend(v3, "safelyAddObject:", self->_shippingActivity);
  objc_msgSend(v3, "safelyAddObject:", self->_trackingNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_shippingCompany);
  objc_msgSend(v3, "safelyAddObject:", self->_activationCodeHash);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_expirationMonth - v5 + 32 * v5;
  v7 = self->_expirationYear - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserAltDSID: '%@'; "), self->_accountUserAltDSID);
  v4 = self->_state - 1;
  if (v4 > 4)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC85D8[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v5);
  -[NSURL description](self->_frontFaceImageURL, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("frontFaceImageURL: '%@'; "), v6);

  -[NSString description](self->_nameOnCard, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("nameOnCard: '%@'; "), v7);

  -[NSDate description](self->_lastUpdated, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), v8);

  -[NSString description](self->_FPANSuffix, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("FPANSuffix: '%@'; "), v9);

  -[NSSet description](self->_orderActivity, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("orderActivity: '%@'; "), v10);

  -[NSSet description](self->_shippingActivity, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("shippingActivity: '%@'; "), v11);

  -[NSString description](self->_activationCodeHash, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("activationCodeHash: '%@'; "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("expirationMonth: %lu; "), self->_expirationMonth);
  objc_msgSend(v3, "appendFormat:", CFSTR("expirationYear: %lu; "), self->_expirationYear);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPhysicalCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountUserAltDSID;
  uint64_t v10;
  NSURL *frontFaceImageURL;
  uint64_t v12;
  NSString *nameOnCard;
  uint64_t v14;
  NSDate *lastUpdated;
  uint64_t v16;
  NSString *FPANSuffix;
  uint64_t v18;
  NSString *trackingNumber;
  uint64_t v20;
  NSString *shippingCompany;
  uint64_t v22;
  NSSet *orderActivity;
  uint64_t v24;
  NSSet *shippingActivity;
  uint64_t v26;
  NSString *activationCodeHash;

  v5 = -[PKPhysicalCard init](+[PKPhysicalCard allocWithZone:](PKPhysicalCard, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountUserAltDSID, "copyWithZone:", a3);
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v8;

  v5->_state = self->_state;
  v10 = -[NSURL copyWithZone:](self->_frontFaceImageURL, "copyWithZone:", a3);
  frontFaceImageURL = v5->_frontFaceImageURL;
  v5->_frontFaceImageURL = (NSURL *)v10;

  v12 = -[NSString copyWithZone:](self->_nameOnCard, "copyWithZone:", a3);
  nameOnCard = v5->_nameOnCard;
  v5->_nameOnCard = (NSString *)v12;

  v14 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v14;

  v16 = -[NSString copyWithZone:](self->_FPANSuffix, "copyWithZone:", a3);
  FPANSuffix = v5->_FPANSuffix;
  v5->_FPANSuffix = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_trackingNumber, "copyWithZone:", a3);
  trackingNumber = v5->_trackingNumber;
  v5->_trackingNumber = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_shippingCompany, "copyWithZone:", a3);
  shippingCompany = v5->_shippingCompany;
  v5->_shippingCompany = (NSString *)v20;

  v22 = -[NSSet copyWithZone:](self->_orderActivity, "copyWithZone:", a3);
  orderActivity = v5->_orderActivity;
  v5->_orderActivity = (NSSet *)v22;

  v24 = -[NSSet copyWithZone:](self->_shippingActivity, "copyWithZone:", a3);
  shippingActivity = v5->_shippingActivity;
  v5->_shippingActivity = (NSSet *)v24;

  v26 = -[NSString copyWithZone:](self->_activationCodeHash, "copyWithZone:", a3);
  activationCodeHash = v5->_activationCodeHash;
  v5->_activationCodeHash = (NSString *)v26;

  v5->_expirationMonth = self->_expirationMonth;
  v5->_expirationYear = self->_expirationYear;
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  NSURL *frontFaceImageURL;
  void *v10;
  NSString *nameOnCard;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  v6 = self->_state - 1;
  if (v6 > 4)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AC85D8[v6];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("state"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  frontFaceImageURL = self->_frontFaceImageURL;
  if (frontFaceImageURL)
  {
    -[NSURL absoluteString](frontFaceImageURL, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("frontFaceImageURL"));

  }
  nameOnCard = self->_nameOnCard;
  if (nameOnCard)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", nameOnCard, CFSTR("name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("customizationOptions"));
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (id)shipmentTrackingURL
{
  void *v3;
  void *v4;

  if (-[NSString length](self->_shippingCompany, "length") && -[NSString length](self->_trackingNumber, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@"), self->_shippingCompany, self->_trackingNumber);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)formattedExpiration
{
  unint64_t expirationYear;
  unint64_t expirationMonth;
  void *v4;

  expirationYear = self->_expirationYear;
  if (expirationYear && (expirationMonth = self->_expirationMonth) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02lu/%lu"), expirationMonth, expirationYear);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isExpiredInCalendar:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  BOOL v7;

  -[PKPhysicalCard expirationDateInCalendar:](self, "expirationDateInCalendar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && self->_state == 5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v7 = v6 > 0.0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)expirationDateInCalendar:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (self->_expirationYear && self->_expirationMonth)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v5, "setYear:", self->_expirationYear);
    objc_msgSend(v5, "setMonth:", self->_expirationMonth + 1);
    objc_msgSend(v5, "setSecond:", -1);
    objc_msgSend(v4, "dateFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)FPANSuffix
{
  return self->_FPANSuffix;
}

- (void)setFPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)frontFaceImageURL
{
  return self->_frontFaceImageURL;
}

- (void)setFrontFaceImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void)setTrackingNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)shippingCompany
{
  return self->_shippingCompany;
}

- (void)setShippingCompany:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)orderActivity
{
  return self->_orderActivity;
}

- (void)setOrderActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)shippingActivity
{
  return self->_shippingActivity;
}

- (void)setShippingActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)activationCodeHash
{
  return self->_activationCodeHash;
}

- (void)setActivationCodeHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)expirationMonth
{
  return self->_expirationMonth;
}

- (void)setExpirationMonth:(unint64_t)a3
{
  self->_expirationMonth = a3;
}

- (unint64_t)expirationYear
{
  return self->_expirationYear;
}

- (void)setExpirationYear:(unint64_t)a3
{
  self->_expirationYear = a3;
}

- (PKImage)frontFaceImage
{
  return self->_frontFaceImage;
}

- (void)setFrontFaceImage:(id)a3
{
  objc_storeStrong((id *)&self->_frontFaceImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontFaceImage, 0);
  objc_storeStrong((id *)&self->_activationCodeHash, 0);
  objc_storeStrong((id *)&self->_shippingActivity, 0);
  objc_storeStrong((id *)&self->_orderActivity, 0);
  objc_storeStrong((id *)&self->_shippingCompany, 0);
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_frontFaceImageURL, 0);
  objc_storeStrong((id *)&self->_FPANSuffix, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
