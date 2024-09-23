@implementation SFAppleIDAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDAccount)initWithCoder:(id)a3
{
  id v4;
  SFAppleIDAccount *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSString *certificateToken;
  uint64_t v12;
  NSDate *certificateTokenCreationDate;
  uint64_t v14;
  SFAppleIDContactInfo *contactInfo;
  uint64_t v16;
  NSDate *creationDate;
  uint64_t v18;
  SFAppleIDIdentity *identity;
  uint64_t v20;
  NSData *privateKeyPersistentReference;
  uint64_t v22;
  SFAppleIDValidationRecord *validationRecord;
  SFAppleIDAccount *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFAppleIDAccount;
  v5 = -[SFAppleIDAccount init](&v26, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AltDSID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AltDSID"));
      v6 = objc_claimAutoreleasedReturnValue();
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AppleID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleID"));
      v8 = objc_claimAutoreleasedReturnValue();
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CertificateToken")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CertificateToken"));
      v10 = objc_claimAutoreleasedReturnValue();
      certificateToken = v5->_certificateToken;
      v5->_certificateToken = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CertificateTokenCreationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CertificateTokenCreationDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      certificateTokenCreationDate = v5->_certificateTokenCreationDate;
      v5->_certificateTokenCreationDate = (NSDate *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ContactInfo")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactInfo"));
      v14 = objc_claimAutoreleasedReturnValue();
      contactInfo = v5->_contactInfo;
      v5->_contactInfo = (SFAppleIDContactInfo *)v14;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CreationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
      v16 = objc_claimAutoreleasedReturnValue();
      creationDate = v5->_creationDate;
      v5->_creationDate = (NSDate *)v16;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Identity")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identity"));
      v18 = objc_claimAutoreleasedReturnValue();
      identity = v5->_identity;
      v5->_identity = (SFAppleIDIdentity *)v18;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PrivateKeyPersistentReference")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivateKeyPersistentReference"));
      v20 = objc_claimAutoreleasedReturnValue();
      privateKeyPersistentReference = v5->_privateKeyPersistentReference;
      v5->_privateKeyPersistentReference = (NSData *)v20;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidationRecord")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ValidationRecord"));
      v22 = objc_claimAutoreleasedReturnValue();
      validationRecord = v5->_validationRecord;
      v5->_validationRecord = (SFAppleIDValidationRecord *)v22;

    }
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *altDSID;
  NSString *appleID;
  NSString *certificateToken;
  NSDate *certificateTokenCreationDate;
  SFAppleIDContactInfo *contactInfo;
  NSDate *creationDate;
  SFAppleIDIdentity *identity;
  NSData *privateKeyPersistentReference;
  SFAppleIDValidationRecord *validationRecord;
  id v14;

  v4 = a3;
  altDSID = self->_altDSID;
  v14 = v4;
  if (altDSID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", altDSID, CFSTR("AltDSID"));
    v4 = v14;
  }
  appleID = self->_appleID;
  if (appleID)
  {
    objc_msgSend(v14, "encodeObject:forKey:", appleID, CFSTR("AppleID"));
    v4 = v14;
  }
  certificateToken = self->_certificateToken;
  if (certificateToken)
  {
    objc_msgSend(v14, "encodeObject:forKey:", certificateToken, CFSTR("CertificateToken"));
    v4 = v14;
  }
  certificateTokenCreationDate = self->_certificateTokenCreationDate;
  if (certificateTokenCreationDate)
  {
    objc_msgSend(v14, "encodeObject:forKey:", certificateTokenCreationDate, CFSTR("CertificateTokenCreationDate"));
    v4 = v14;
  }
  contactInfo = self->_contactInfo;
  if (contactInfo)
  {
    objc_msgSend(v14, "encodeObject:forKey:", contactInfo, CFSTR("ContactInfo"));
    v4 = v14;
  }
  creationDate = self->_creationDate;
  if (creationDate)
  {
    objc_msgSend(v14, "encodeObject:forKey:", creationDate, CFSTR("CreationDate"));
    v4 = v14;
  }
  identity = self->_identity;
  if (identity)
  {
    objc_msgSend(v14, "encodeObject:forKey:", identity, CFSTR("Identity"));
    v4 = v14;
  }
  privateKeyPersistentReference = self->_privateKeyPersistentReference;
  if (privateKeyPersistentReference)
  {
    objc_msgSend(v14, "encodeObject:forKey:", privateKeyPersistentReference, CFSTR("PrivateKeyPersistentReference"));
    v4 = v14;
  }
  validationRecord = self->_validationRecord;
  if (validationRecord)
  {
    objc_msgSend(v14, "encodeObject:forKey:", validationRecord, CFSTR("ValidationRecord"));
    v4 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_altDSID);
    objc_storeStrong(v5 + 2, self->_appleID);
    objc_storeStrong(v5 + 3, self->_certificateToken);
    objc_storeStrong(v5 + 4, self->_certificateTokenCreationDate);
    objc_storeStrong(v5 + 5, self->_contactInfo);
    objc_storeStrong(v5 + 6, self->_creationDate);
    objc_storeStrong(v5 + 7, self->_identity);
    objc_storeStrong(v5 + 8, self->_privateKeyPersistentReference);
    objc_storeStrong(v5 + 9, self->_validationRecord);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAppleIDAccount *v4;
  SFAppleIDAccount *v5;
  BOOL v6;

  v4 = (SFAppleIDAccount *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFAppleIDAccount isEqualToAccount:](self, "isEqualToAccount:", v5);

  return v6;
}

- (BOOL)isEqualToAccount:(id)a3
{
  SFAppleIDAccount *v4;
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
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  char v53;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = (SFAppleIDAccount *)a3;
  if (self == v4)
  {
    v53 = 1;
    goto LABEL_33;
  }
  -[SFAppleIDAccount altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount altDSID](v4, "altDSID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[SFAppleIDAccount altDSID](self, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount altDSID](v4, "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_32;
  }
  -[SFAppleIDAccount appleID](self, "appleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount appleID](v4, "appleID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[SFAppleIDAccount appleID](self, "appleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount appleID](v4, "appleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  -[SFAppleIDAccount certificateToken](self, "certificateToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount certificateToken](v4, "certificateToken");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[SFAppleIDAccount certificateToken](self, "certificateToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount certificateToken](v4, "certificateToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_32;
  }
  -[SFAppleIDAccount certificateTokenCreationDate](self, "certificateTokenCreationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount certificateTokenCreationDate](v4, "certificateTokenCreationDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[SFAppleIDAccount certificateTokenCreationDate](self, "certificateTokenCreationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount certificateTokenCreationDate](v4, "certificateTokenCreationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_32;
  }
  -[SFAppleIDAccount contactInfo](self, "contactInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount contactInfo](v4, "contactInfo");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29 == (void *)v30)
  {

  }
  else
  {
    v31 = (void *)v30;
    -[SFAppleIDAccount contactInfo](self, "contactInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount contactInfo](v4, "contactInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_32;
  }
  -[SFAppleIDAccount creationDate](self, "creationDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount creationDate](v4, "creationDate");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v35 == (void *)v36)
  {

  }
  else
  {
    v37 = (void *)v36;
    -[SFAppleIDAccount creationDate](self, "creationDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount creationDate](v4, "creationDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_32;
  }
  -[SFAppleIDAccount identity](self, "identity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount identity](v4, "identity");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v41 == (void *)v42)
  {

  }
  else
  {
    v43 = (void *)v42;
    -[SFAppleIDAccount identity](self, "identity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount identity](v4, "identity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_32;
  }
  -[SFAppleIDAccount privateKeyPersistentReference](self, "privateKeyPersistentReference");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount privateKeyPersistentReference](v4, "privateKeyPersistentReference");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v47 == (void *)v48)
  {

  }
  else
  {
    v49 = (void *)v48;
    -[SFAppleIDAccount privateKeyPersistentReference](self, "privateKeyPersistentReference");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount privateKeyPersistentReference](v4, "privateKeyPersistentReference");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
    {
LABEL_32:
      v53 = 0;
      goto LABEL_33;
    }
  }
  -[SFAppleIDAccount validationRecord](self, "validationRecord");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDAccount validationRecord](v4, "validationRecord");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v55 == (void *)v56)
  {
    v53 = 1;
    v57 = v55;
  }
  else
  {
    v57 = (void *)v56;
    -[SFAppleIDAccount validationRecord](self, "validationRecord");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDAccount validationRecord](v4, "validationRecord");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v58, "isEqual:", v59);

  }
LABEL_33:

  return v53;
}

- (SFAppleIDAccount)initWithAppleID:(id)a3
{
  id v5;
  SFAppleIDAccount *v6;
  SFAppleIDAccount *v7;
  uint64_t v8;
  NSDate *creationDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFAppleIDAccount;
  v6 = -[SFAppleIDAccount init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appleID, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v8;

  }
  return v7;
}

- (SFAppleIDAccount)initWithDictionary:(id)a3
{
  id v4;
  SFAppleIDAccount *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  uint64_t v9;
  NSString *appleID;
  uint64_t v11;
  NSString *certificateToken;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFAppleIDContactInfo *v22;
  SFAppleIDContactInfo *contactInfo;
  void *v24;
  void *v25;
  void *v26;
  SFAppleIDValidationRecord *v27;
  SFAppleIDValidationRecord *validationRecord;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFAppleIDAccount;
  v5 = -[SFAppleIDAccount init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encDsId"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleID"));
      v9 = objc_claimAutoreleasedReturnValue();
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v9;
    }
    else
    {
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)&stru_1E483B8E8;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleID"));
    v11 = objc_claimAutoreleasedReturnValue();
    certificateToken = v5->_certificateToken;
    v5->_certificateToken = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirstName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirstName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("FirstName"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("LastName"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedEmail"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedEmail"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("ValidatedEmails"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedPhones"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedPhones"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("ValidatedPhones"));

    }
    v22 = -[SFAppleIDContactInfo initWithDictionary:]([SFAppleIDContactInfo alloc], "initWithDictionary:", v13);
    contactInfo = v5->_contactInfo;
    v5->_contactInfo = v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleIDAccountValidationRecordData"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("ValidationRecordData"));

    }
    v27 = -[SFAppleIDValidationRecord initWithDictionary:]([SFAppleIDValidationRecord alloc], "initWithDictionary:", v24);
    validationRecord = v5->_validationRecord;
    v5->_validationRecord = v27;

  }
  return v5;
}

- (id)description
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  NSAppendPrintF();
  v12 = 0;
  NSAppendPrintF();
  v2 = v12;

  NSAppendPrintF();
  v3 = v2;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  NSAppendPrintF();
  v6 = v5;

  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  NSAppendPrintF();
  v9 = v8;

  NSAppendPrintF();
  v10 = v9;

  return v10;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)certificateToken
{
  return self->_certificateToken;
}

- (void)setCertificateToken:(id)a3
{
  objc_storeStrong((id *)&self->_certificateToken, a3);
}

- (NSDate)certificateTokenCreationDate
{
  return self->_certificateTokenCreationDate;
}

- (void)setCertificateTokenCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_certificateTokenCreationDate, a3);
}

- (SFAppleIDContactInfo)contactInfo
{
  return self->_contactInfo;
}

- (void)setContactInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contactInfo, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (SFAppleIDIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSData)privateKeyPersistentReference
{
  return self->_privateKeyPersistentReference;
}

- (void)setPrivateKeyPersistentReference:(id)a3
{
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, a3);
}

- (SFAppleIDValidationRecord)validationRecord
{
  return self->_validationRecord;
}

- (void)setValidationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_validationRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationRecord, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contactInfo, 0);
  objc_storeStrong((id *)&self->_certificateTokenCreationDate, 0);
  objc_storeStrong((id *)&self->_certificateToken, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
