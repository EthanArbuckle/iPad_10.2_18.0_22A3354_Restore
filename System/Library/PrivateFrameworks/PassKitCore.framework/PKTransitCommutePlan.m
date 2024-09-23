@implementation PKTransitCommutePlan

- (void)_updateFieldsByKey
{
  NSMutableDictionary *fieldsByKey;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  NSObject *v7;
  PKPassField *title;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  PKPassField *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  PKPassField *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  fieldsByKey = self->_fieldsByKey;
  if (fieldsByKey)
  {
    -[NSMutableDictionary removeAllObjects](fieldsByKey, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_fieldsByKey;
    self->_fieldsByKey = v4;

  }
  -[PKPassField key](self->_title, "key");
  v6 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v6;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKey:](self->_fieldsByKey, "setObject:forKey:", self->_title, v6);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      title = self->_title;
      *(_DWORD *)buf = 138412290;
      v24 = title;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Encountered nil key in parsing title field PKPassField: %@", buf, 0xCu);
    }

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_details;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(PKPassField **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PKPassField key](v14, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSMutableDictionary setObject:forKey:](self->_fieldsByKey, "setObject:forKey:", v14, v15);
        }
        else
        {
          PKLogFacilityTypeGetObject(0xCuLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v14;
            _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Encountered nil key in parsing detail field PKPassField: %@", buf, 0xCu);
          }

        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)_updateProperties
{
  void *v3;
  void *v4;
  void *v5;

  self->_properties &= 0xFFFFFFFFFFFFFFFALL;
  -[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("expiryDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("startDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  self->_properties |= 1uLL;
LABEL_5:
  -[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("amountRemaining"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    self->_properties |= 4uLL;
}

- (id)passFieldForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_fieldsByKey, "objectForKeyedSubscript:", a3);
}

- (BOOL)hasExpiredPlanDate
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKTransitCommutePlan expiryDate](self, "expiryDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v4 = objc_msgSend(v2, "compare:", v3) != 1;
  else
    v4 = 0;

  return v4;
}

- (NSSet)foreignReferenceIdentifiers
{
  void *v2;
  void *v3;

  -[PKTransitCommutePlan passFieldForKey:](self, "passFieldForKey:", CFSTR("amountRemaining"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "foreignReferenceIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSString)formattedDateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlan startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlan expiryDate](self, "expiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "compare:", v3) == 1)
  {
    -[PKTransitCommutePlan startDateString](self, "startDateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("COMMUTE_PLAN_STARTS_ON");
    if (!v6)
      goto LABEL_8;
LABEL_13:
    PKLocalizedPaymentString(&v7->isa, CFSTR("%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v5 && (PKStoreDemoModeEnabled() & 1) == 0)
  {
    if (objc_msgSend(v5, "compare:", v3) == 1)
      v7 = CFSTR("COMMUTE_PLAN_EXPIRES_ON");
    else
      v7 = CFSTR("COMMUTE_PLAN_EXPIRED_ON");
    -[PKTransitCommutePlan expiryDateString](self, "expiryDateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
    goto LABEL_13;
  }
  v6 = 0;
LABEL_8:
  v8 = 0;
LABEL_14:

  return (NSString *)v8;
}

- (BOOL)isPlanDisplayable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKTransitCommutePlan expiryDate](self, "expiryDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", v2) != 1;

  return v4;
}

- (BOOL)isPlanAvailable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKTransitCommutePlan startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compare:", v3) != -1 && -[PKTransitCommutePlan isPlanDisplayable](self, "isPlanDisplayable");

  return v5;
}

- (BOOL)hasDisplayableInformation
{
  return (unint64_t)-[NSMutableDictionary count](self->_fieldsByKey, "count") > 1;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
    uniqueIdentifier = self->_identifier;
  return uniqueIdentifier;
}

- (id)updateWithCommutePlanDetail:(id)a3
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
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v4 = a3;
  v5 = (void *)-[PKTransitCommutePlan mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueIdentifier:", v6);

  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v7);

  objc_msgSend(v4, "expiryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpiryDate:", v8);

  objc_msgSend(v4, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "descriptionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "length");

    if (v15)
    {
      v16 = v10;
      if (!v16 || (v17 = v16, v18 = objc_msgSend(v16, "length"), v17, !v18))
        objc_msgSend(v5, "setTitleText:", v14);
    }
  }
  v19 = v11;
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "length");

    if (v21)
    {
      v22 = v12;
      if (!v22 || (v23 = v22, v24 = objc_msgSend(v22, "length"), v23, !v24))
        objc_msgSend(v5, "setDescriptionText:", v20);
    }
  }
  v25 = (void *)objc_msgSend(v5, "copy");

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  -[PKTransitCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceAccountIdentifiers, CFSTR("deviceAccountIdentifiers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_details, CFSTR("details"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_properties, CFSTR("properties"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_usage, CFSTR("usage"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresAppletSourceOfTruth, CFSTR("requiresAppletSourceOfTruth"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isDeviceBound, CFSTR("isDeviceBound"));

}

- (PKTransitCommutePlan)initWithCoder:(id)a3
{
  id v4;
  PKTransitCommutePlan *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *uniqueIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *deviceAccountIdentifiers;
  uint64_t v15;
  PKPassField *title;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *details;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  NSDate *expiryDate;
  uint64_t v26;
  PKPassField *usage;

  v4 = a3;
  v5 = -[PKTransitCommutePlan init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("deviceAccountIdentifiers"));
    v13 = objc_claimAutoreleasedReturnValue();
    deviceAccountIdentifiers = v5->_deviceAccountIdentifiers;
    v5->_deviceAccountIdentifiers = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v15 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (PKPassField *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("details"));
    v20 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSArray *)v20;

    v5->_properties = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("properties"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usage"));
    v26 = objc_claimAutoreleasedReturnValue();
    usage = v5->_usage;
    v5->_usage = (PKPassField *)v26;

    v5->_requiresAppletSourceOfTruth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAppletSourceOfTruth"));
    v5->_isDeviceBound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeviceBound"));
    -[PKTransitCommutePlan _updateFieldsByKey](v5, "_updateFieldsByKey");
    -[PKTransitCommutePlan _updateProperties](v5, "_updateProperties");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v6);

  -[PKTransitCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  objc_msgSend(v5, "setUniqueIdentifier:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_deviceAccountIdentifiers, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceAccountIdentifiers:", v9);

  v10 = -[PKPassField copyWithZone:](self->_title, "copyWithZone:", a3);
  objc_msgSend(v5, "setTitle:", v10);

  v11 = (void *)-[NSArray copyWithZone:](self->_details, "copyWithZone:", a3);
  objc_msgSend(v5, "setDetails:", v11);

  objc_msgSend(v5, "setProperties:", self->_properties);
  v12 = (void *)-[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartDate:", v12);

  v13 = (void *)-[NSDate copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setExpiryDate:", v13);

  v14 = -[PKPassField copyWithZone:](self->_usage, "copyWithZone:", a3);
  objc_msgSend(v5, "setUsage:", v14);

  objc_msgSend(v5, "setRequiresAppletSourceOfTruth:", self->_requiresAppletSourceOfTruth);
  objc_msgSend(v5, "setIsDeviceBound:", self->_isDeviceBound);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSString mutableCopyWithZone:](self->_identifier, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v6);

  -[PKTransitCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setUniqueIdentifier:", v8);

  v9 = (void *)-[NSArray mutableCopyWithZone:](self->_deviceAccountIdentifiers, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setDeviceAccountIdentifiers:", v9);

  v10 = -[PKPassField copyWithZone:](self->_title, "copyWithZone:", a3);
  objc_msgSend(v5, "setTitle:", v10);

  v11 = (void *)-[NSArray mutableCopyWithZone:](self->_details, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setDetails:", v11);

  objc_msgSend(v5, "setProperties:", self->_properties);
  v12 = (void *)-[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartDate:", v12);

  v13 = (void *)-[NSDate copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setExpiryDate:", v13);

  v14 = -[PKPassField copyWithZone:](self->_usage, "copyWithZone:", a3);
  objc_msgSend(v5, "setUsage:", v14);

  objc_msgSend(v5, "setRequiresAppletSourceOfTruth:", self->_requiresAppletSourceOfTruth);
  objc_msgSend(v5, "setIsDeviceBound:", self->_isDeviceBound);
  return v5;
}

- (void)setTitle:(id)a3
{
  PKPassField *v4;
  PKPassField *title;

  v4 = (PKPassField *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

  -[PKTransitCommutePlan _updateFieldsByKey](self, "_updateFieldsByKey");
  -[PKTransitCommutePlan _updateProperties](self, "_updateProperties");
}

- (void)setDetails:(id)a3
{
  NSArray *v4;
  NSArray *details;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  details = self->_details;
  self->_details = v4;

  -[PKTransitCommutePlan _updateFieldsByKey](self, "_updateFieldsByKey");
  -[PKTransitCommutePlan _updateProperties](self, "_updateProperties");
}

- (id)_expiryField
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("expiryDate"));
}

- (id)_startField
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("startDate"));
}

- (NSString)titleText
{
  return -[PKPassField label](self->_title, "label");
}

- (NSString)descriptionText
{
  return -[PKPassField value](self->_title, "value");
}

- (void)setTitleText:(id)a3
{
  -[PKPassField setLabel:](self->_title, "setLabel:", a3);
}

- (void)setDescriptionText:(id)a3
{
  -[PKPassField setUnformattedValue:](self->_title, "setUnformattedValue:", a3);
}

- (NSDate)expiryDate
{
  NSDate *expiryDate;
  NSDate *v3;
  void *v4;

  expiryDate = self->_expiryDate;
  if (expiryDate)
  {
    v3 = expiryDate;
  }
  else
  {
    -[PKTransitCommutePlan _expiryField](self, "_expiryField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _dateFromField(v4);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSDate)startDate
{
  NSDate *startDate;
  NSDate *v3;
  void *v4;

  startDate = self->_startDate;
  if (startDate)
  {
    v3 = startDate;
  }
  else
  {
    -[PKTransitCommutePlan _startField](self, "_startField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _dateFromField(v4);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)expiryDateString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKTransitCommutePlan expiryDate](self, "expiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlan _expiryField](self, "_expiryField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", objc_msgSend(v4, "dateStyle"));
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)startDateString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKTransitCommutePlan startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlan _startField](self, "_startField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", objc_msgSend(v4, "dateStyle"));
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PKPassField)usage
{
  return (PKPassField *)-[NSMutableDictionary objectForKey:](self->_fieldsByKey, "objectForKey:", CFSTR("usage"));
}

- (BOOL)isEqual:(id)a3
{
  PKTransitCommutePlan *v4;
  PKTransitCommutePlan *v5;
  NSString *identifier;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  PKPassField *title;
  PKPassField *v13;
  NSArray *details;
  NSArray *v15;
  NSArray *deviceAccountIdentifiers;
  NSArray *v17;
  NSDate *startDate;
  NSDate *v19;
  NSDate *expiryDate;
  NSDate *v21;
  PKPassField *usage;
  PKPassField *v23;

  v4 = (PKTransitCommutePlan *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier && v7)
      {
        if ((-[NSString isEqual:](identifier, "isEqual:") & 1) != 0)
        {
LABEL_6:
          -[PKTransitCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransitCommutePlan uniqueIdentifier](v5, "uniqueIdentifier");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)v9;
          if (v8 && v9)
          {
            if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
              goto LABEL_46;
          }
          else if (v8 != (void *)v9)
          {
            goto LABEL_46;
          }
          title = self->_title;
          v13 = v5->_title;
          if (title && v13)
          {
            if ((-[PKPassField isEqual:](title, "isEqual:") & 1) == 0)
              goto LABEL_46;
          }
          else if (title != v13)
          {
            goto LABEL_46;
          }
          details = self->_details;
          v15 = v5->_details;
          if (details && v15)
          {
            if ((-[NSArray isEqual:](details, "isEqual:") & 1) == 0)
              goto LABEL_46;
          }
          else if (details != v15)
          {
            goto LABEL_46;
          }
          deviceAccountIdentifiers = self->_deviceAccountIdentifiers;
          v17 = v5->_deviceAccountIdentifiers;
          if (deviceAccountIdentifiers && v17)
          {
            if ((-[NSArray isEqual:](deviceAccountIdentifiers, "isEqual:") & 1) == 0)
              goto LABEL_46;
          }
          else if (deviceAccountIdentifiers != v17)
          {
            goto LABEL_46;
          }
          startDate = self->_startDate;
          v19 = v5->_startDate;
          if (startDate && v19)
          {
            if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
              goto LABEL_46;
          }
          else if (startDate != v19)
          {
            goto LABEL_46;
          }
          expiryDate = self->_expiryDate;
          v21 = v5->_expiryDate;
          if (expiryDate && v21)
          {
            if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0)
              goto LABEL_46;
          }
          else if (expiryDate != v21)
          {
            goto LABEL_46;
          }
          if (self->_properties == v5->_properties
            && self->_requiresAppletSourceOfTruth == v5->_requiresAppletSourceOfTruth
            && self->_isDeviceBound == v5->_isDeviceBound)
          {
            usage = self->_usage;
            v23 = v5->_usage;
            if (usage && v23)
              v11 = -[PKPassField isEqual:](usage, "isEqual:");
            else
              v11 = usage == v23;
            goto LABEL_47;
          }
LABEL_46:
          v11 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      else if (identifier == v7)
      {
        goto LABEL_6;
      }
      v11 = 0;
LABEL_48:

      goto LABEL_49;
    }
    v11 = 0;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  -[PKTransitCommutePlan uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "addObjectsFromArray:", self->_details);
  objc_msgSend(v3, "addObjectsFromArray:", self->_deviceAccountIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_usage);
  v5 = PKCombinedHash(17, v3);
  v6 = self->_properties - v5 + 32 * v5;
  v7 = self->_requiresAppletSourceOfTruth - v6 + 32 * v6;
  v8 = self->_isDeviceBound - v7 + 32 * v7;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)deviceAccountIdentifiers
{
  return self->_deviceAccountIdentifiers;
}

- (void)setDeviceAccountIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKPassField)title
{
  return self->_title;
}

- (NSArray)details
{
  return self->_details;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setStartDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setExpiryDateString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)requiresAppletSourceOfTruth
{
  return self->_requiresAppletSourceOfTruth;
}

- (void)setRequiresAppletSourceOfTruth:(BOOL)a3
{
  self->_requiresAppletSourceOfTruth = a3;
}

- (BOOL)isDeviceBound
{
  return self->_isDeviceBound;
}

- (void)setIsDeviceBound:(BOOL)a3
{
  self->_isDeviceBound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_expiryDateString, 0);
  objc_storeStrong((id *)&self->_startDateString, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldsByKey, 0);
}

@end
