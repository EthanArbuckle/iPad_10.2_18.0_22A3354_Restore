@implementation SFAppleIDValidationRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDValidationRecord)initWithCoder:(id)a3
{
  id v4;
  SFAppleIDValidationRecord *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDate *nextCheckDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *validatedEmailHashes;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *validatedPhoneHashes;
  uint64_t v24;
  NSDate *validStartDate;
  uint64_t v26;
  NSNumber *version;
  SFAppleIDValidationRecord *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFAppleIDValidationRecord;
  v5 = -[SFAppleIDValidationRecord init](&v30, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AltDSID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AltDSID"));
      v6 = objc_claimAutoreleasedReturnValue();
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Data")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
      v8 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Identifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
      v10 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("NextCheckDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NextCheckDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      nextCheckDate = v5->_nextCheckDate;
      v5->_nextCheckDate = (NSDate *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SuggestedValidDuration")))
      v5->_suggestedValidDuration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SuggestedValidDuration"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidatedEmailHashes")))
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("ValidatedEmailHashes"));
      v17 = objc_claimAutoreleasedReturnValue();
      validatedEmailHashes = v5->_validatedEmailHashes;
      v5->_validatedEmailHashes = (NSArray *)v17;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidatedPhoneHashes")))
    {
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("ValidatedPhoneHashes"));
      v22 = objc_claimAutoreleasedReturnValue();
      validatedPhoneHashes = v5->_validatedPhoneHashes;
      v5->_validatedPhoneHashes = (NSArray *)v22;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidStartDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ValidStartDate"));
      v24 = objc_claimAutoreleasedReturnValue();
      validStartDate = v5->_validStartDate;
      v5->_validStartDate = (NSDate *)v24;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Version")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
      v26 = objc_claimAutoreleasedReturnValue();
      version = v5->_version;
      v5->_version = (NSNumber *)v26;

    }
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *altDSID;
  NSData *data;
  NSString *identifier;
  NSDate *nextCheckDate;
  NSArray *validatedEmailHashes;
  NSArray *validatedPhoneHashes;
  NSDate *validStartDate;
  void *v12;
  NSNumber *version;
  id v14;

  v4 = a3;
  altDSID = self->_altDSID;
  v14 = v4;
  if (altDSID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", altDSID, CFSTR("AltDSID"));
    v4 = v14;
  }
  data = self->_data;
  if (data)
  {
    objc_msgSend(v14, "encodeObject:forKey:", data, CFSTR("Data"));
    v4 = v14;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v14, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
    v4 = v14;
  }
  nextCheckDate = self->_nextCheckDate;
  if (nextCheckDate)
  {
    objc_msgSend(v14, "encodeObject:forKey:", nextCheckDate, CFSTR("NextCheckDate"));
    v4 = v14;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_suggestedValidDuration, CFSTR("SuggestedValidDuration"));
  validatedEmailHashes = self->_validatedEmailHashes;
  if (validatedEmailHashes)
    objc_msgSend(v14, "encodeObject:forKey:", validatedEmailHashes, CFSTR("ValidatedEmailHashes"));
  validatedPhoneHashes = self->_validatedPhoneHashes;
  if (validatedPhoneHashes)
    objc_msgSend(v14, "encodeObject:forKey:", validatedPhoneHashes, CFSTR("ValidatedPhoneHashes"));
  validStartDate = self->_validStartDate;
  v12 = v14;
  if (validStartDate)
  {
    objc_msgSend(v14, "encodeObject:forKey:", validStartDate, CFSTR("ValidStartDate"));
    v12 = v14;
  }
  version = self->_version;
  if (version)
  {
    objc_msgSend(v14, "encodeObject:forKey:", version, CFSTR("Version"));
    v12 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_altDSID);
    objc_storeStrong((id *)(v5 + 16), self->_data);
    objc_storeStrong((id *)(v5 + 24), self->_identifier);
    objc_storeStrong((id *)(v5 + 32), self->_nextCheckDate);
    *(_QWORD *)(v5 + 40) = self->_suggestedValidDuration;
    objc_storeStrong((id *)(v5 + 48), self->_validatedEmailHashes);
    objc_storeStrong((id *)(v5 + 56), self->_validatedPhoneHashes);
    objc_storeStrong((id *)(v5 + 64), self->_validStartDate);
    objc_storeStrong((id *)(v5 + 72), self->_version);
  }
  return (id)v5;
}

- (id)expirationDate
{
  void *v3;
  void *v4;
  void *v5;

  -[SFAppleIDValidationRecord validStartDate](self, "validStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && -[SFAppleIDValidationRecord suggestedValidDuration](self, "suggestedValidDuration"))
  {
    -[SFAppleIDValidationRecord validStartDate](self, "validStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)-[SFAppleIDValidationRecord suggestedValidDuration](self, "suggestedValidDuration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAppleIDValidationRecord *v4;
  SFAppleIDValidationRecord *v5;
  BOOL v6;

  v4 = (SFAppleIDValidationRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFAppleIDValidationRecord isEqualToValidationRecord:](self, "isEqualToValidationRecord:", v5);

  return v6;
}

- (BOOL)isEqualToValidationRecord:(id)a3
{
  SFAppleIDValidationRecord *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  char v48;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = (SFAppleIDValidationRecord *)a3;
  if (self == v4)
  {
    v48 = 1;
    goto LABEL_30;
  }
  -[SFAppleIDValidationRecord altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord altDSID](v4, "altDSID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[SFAppleIDValidationRecord altDSID](self, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord altDSID](v4, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord data](v4, "data");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[SFAppleIDValidationRecord data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord data](v4, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord identifier](v4, "identifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[SFAppleIDValidationRecord identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord identifier](v4, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord nextCheckDate](self, "nextCheckDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord nextCheckDate](v4, "nextCheckDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[SFAppleIDValidationRecord nextCheckDate](self, "nextCheckDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord nextCheckDate](v4, "nextCheckDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_29;
  }
  v29 = -[SFAppleIDValidationRecord suggestedValidDuration](self, "suggestedValidDuration");
  if (v29 != -[SFAppleIDValidationRecord suggestedValidDuration](v4, "suggestedValidDuration"))
  {
LABEL_29:
    v48 = 0;
    goto LABEL_30;
  }
  -[SFAppleIDValidationRecord validatedEmailHashes](self, "validatedEmailHashes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord validatedEmailHashes](v4, "validatedEmailHashes");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v30 == (void *)v31)
  {

  }
  else
  {
    v32 = (void *)v31;
    -[SFAppleIDValidationRecord validatedEmailHashes](self, "validatedEmailHashes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord validatedEmailHashes](v4, "validatedEmailHashes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord validatedPhoneHashes](self, "validatedPhoneHashes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord validatedPhoneHashes](v4, "validatedPhoneHashes");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v36 == (void *)v37)
  {

  }
  else
  {
    v38 = (void *)v37;
    -[SFAppleIDValidationRecord validatedPhoneHashes](self, "validatedPhoneHashes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord validatedPhoneHashes](v4, "validatedPhoneHashes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord validStartDate](self, "validStartDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord validStartDate](v4, "validStartDate");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v42 == (void *)v43)
  {

  }
  else
  {
    v44 = (void *)v43;
    -[SFAppleIDValidationRecord validStartDate](self, "validStartDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord validStartDate](v4, "validStartDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_29;
  }
  -[SFAppleIDValidationRecord version](self, "version");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord version](v4, "version");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v50 == (void *)v51)
  {
    v48 = 1;
    v52 = v50;
  }
  else
  {
    v52 = (void *)v51;
    -[SFAppleIDValidationRecord version](self, "version");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDValidationRecord version](v4, "version");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v53, "isEqual:", v54);

  }
LABEL_30:

  return v48;
}

- (SFAppleIDValidationRecord)initWithDictionary:(id)a3
{
  id v4;
  SFAppleIDValidationRecord *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSDate *nextCheckDate;
  uint64_t v12;
  NSNumber *version;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFAppleIDValidationRecord;
  v5 = -[SFAppleIDValidationRecord init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidationRecordData"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidationRecordDataID"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidationRecordNextCheckDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    nextCheckDate = v5->_nextCheckDate;
    v5->_nextCheckDate = (NSDate *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"));
    v12 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSNumber *)v12;

  }
  return v5;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unint64_t suggestedValidDuration;
  void *v15;
  id v16;

  NSAppendPrintF();
  v16 = 0;
  NSAppendPrintF();
  v3 = v16;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  NSAppendPrintF();
  v6 = v5;

  suggestedValidDuration = self->_suggestedValidDuration;
  NSAppendPrintF();
  v7 = v6;

  -[NSArray componentsJoinedByString:](self->_validatedEmailHashes, "componentsJoinedByString:", CFSTR(", "), suggestedValidDuration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v8 = v7;

  -[NSArray componentsJoinedByString:](self->_validatedPhoneHashes, "componentsJoinedByString:", CFSTR(", "), v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v10 = v8;

  NSAppendPrintF();
  v11 = v10;

  NSAppendPrintF();
  v12 = v11;

  return v12;
}

- (BOOL)isInvalid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord altDSID](self, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize())
          goto LABEL_28;
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  -[SFAppleIDValidationRecord data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize())
          goto LABEL_28;
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  -[SFAppleIDValidationRecord data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize())
          goto LABEL_28;
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  -[SFAppleIDValidationRecord expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60)
    {
      if (gLogCategory_SFAppleIDValidationRecord == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize())
          goto LABEL_28;
      }
      else
      {
        v9 = 0;
      }
      goto LABEL_27;
    }
LABEL_24:
    v9 = 0;
LABEL_28:
    v10 = 1;
    goto LABEL_7;
  }
  v9 = v8;
  if (objc_msgSend(v8, "compare:", v3) != 1)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_28;
    }
LABEL_27:
    LogPrintF();
    goto LABEL_28;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)needsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDValidationRecord nextCheckDate](self, "nextCheckDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
LABEL_15:
    LogPrintF();
LABEL_24:
    v8 = 0;
LABEL_25:
    v11 = 1;
    goto LABEL_6;
  }
  -[SFAppleIDValidationRecord nextCheckDate](self, "nextCheckDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v3);

  if (v6 != 1)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60
      && (gLogCategory_SFAppleIDValidationRecord != -1 || _LogCategory_Initialize()))
    {
      -[SFAppleIDValidationRecord nextCheckDate](self, "nextCheckDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_24;
  }
  -[SFAppleIDValidationRecord expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (gLogCategory_SFAppleIDValidationRecord > 60
      || gLogCategory_SFAppleIDValidationRecord == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  v8 = v7;
  objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "compare:", v9);

  if (v10 != -1)
  {
    if (gLogCategory_SFAppleIDValidationRecord <= 60
      && (gLogCategory_SFAppleIDValidationRecord != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_25;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)nextCheckDate
{
  return self->_nextCheckDate;
}

- (void)setNextCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextCheckDate, a3);
}

- (unint64_t)suggestedValidDuration
{
  return self->_suggestedValidDuration;
}

- (void)setSuggestedValidDuration:(unint64_t)a3
{
  self->_suggestedValidDuration = a3;
}

- (NSArray)validatedEmailHashes
{
  return self->_validatedEmailHashes;
}

- (void)setValidatedEmailHashes:(id)a3
{
  objc_storeStrong((id *)&self->_validatedEmailHashes, a3);
}

- (NSArray)validatedPhoneHashes
{
  return self->_validatedPhoneHashes;
}

- (void)setValidatedPhoneHashes:(id)a3
{
  objc_storeStrong((id *)&self->_validatedPhoneHashes, a3);
}

- (NSDate)validStartDate
{
  return self->_validStartDate;
}

- (void)setValidStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_validStartDate, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_validStartDate, 0);
  objc_storeStrong((id *)&self->_validatedPhoneHashes, 0);
  objc_storeStrong((id *)&self->_validatedEmailHashes, 0);
  objc_storeStrong((id *)&self->_nextCheckDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
