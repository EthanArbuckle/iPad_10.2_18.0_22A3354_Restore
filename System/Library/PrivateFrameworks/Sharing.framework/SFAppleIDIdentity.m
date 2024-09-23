@implementation SFAppleIDIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDIdentity)initWithCoder:(id)a3
{
  id v4;
  SFAppleIDIdentity *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSString *appleID;
  uint64_t v12;
  NSDate *certificateExpirationDate;
  uint64_t v14;
  NSData *certificatePersistentReference;
  uint64_t v16;
  NSDate *intermediateCertificateExpirationDate;
  uint64_t v18;
  NSData *intermediateCertificatePersistentReference;
  uint64_t v20;
  NSDate *lastValidationAttemptDate;
  uint64_t v22;
  NSDate *lastValidationDate;
  uint64_t v24;
  NSDate *modificationDate;
  uint64_t v26;
  NSString *serialNumber;
  uint64_t v28;
  NSData *privateKeyPersistentReference;
  SFAppleIDIdentity *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFAppleIDIdentity;
  v5 = -[SFAppleIDIdentity init](&v32, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AccountIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AltDSID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AltDSID"));
      v8 = objc_claimAutoreleasedReturnValue();
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AppleID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleID"));
      v10 = objc_claimAutoreleasedReturnValue();
      appleID = v5->_appleID;
      v5->_appleID = (NSString *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CertificateExpirationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CertificateExpirationDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      certificateExpirationDate = v5->_certificateExpirationDate;
      v5->_certificateExpirationDate = (NSDate *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CertificatePersistentReference")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CertificatePersistentReference"));
      v14 = objc_claimAutoreleasedReturnValue();
      certificatePersistentReference = v5->_certificatePersistentReference;
      v5->_certificatePersistentReference = (NSData *)v14;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("IntermediateCertificateExpirationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IntermediateCertificateExpirationDate"));
      v16 = objc_claimAutoreleasedReturnValue();
      intermediateCertificateExpirationDate = v5->_intermediateCertificateExpirationDate;
      v5->_intermediateCertificateExpirationDate = (NSDate *)v16;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("IntermediateCertificatePersistentReference")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IntermediateCertificatePersistentReference"));
      v18 = objc_claimAutoreleasedReturnValue();
      intermediateCertificatePersistentReference = v5->_intermediateCertificatePersistentReference;
      v5->_intermediateCertificatePersistentReference = (NSData *)v18;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("LastValidationAttemptDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastValidationAttemptDate"));
      v20 = objc_claimAutoreleasedReturnValue();
      lastValidationAttemptDate = v5->_lastValidationAttemptDate;
      v5->_lastValidationAttemptDate = (NSDate *)v20;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("LastValidationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastValidationDate"));
      v22 = objc_claimAutoreleasedReturnValue();
      lastValidationDate = v5->_lastValidationDate;
      v5->_lastValidationDate = (NSDate *)v22;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("LinkedToCurrentUser")))
      v5->_linkedToCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LinkedToCurrentUser"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ModificationDate")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
      v24 = objc_claimAutoreleasedReturnValue();
      modificationDate = v5->_modificationDate;
      v5->_modificationDate = (NSDate *)v24;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SerialNumber")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SerialNumber"));
      v26 = objc_claimAutoreleasedReturnValue();
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSString *)v26;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PrivateKeyPersistentReference")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivateKeyPersistentReference"));
      v28 = objc_claimAutoreleasedReturnValue();
      privateKeyPersistentReference = v5->_privateKeyPersistentReference;
      v5->_privateKeyPersistentReference = (NSData *)v28;

    }
    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *accountIdentifier;
  NSString *altDSID;
  NSString *appleID;
  NSDate *certificateExpirationDate;
  NSData *certificatePersistentReference;
  NSDate *intermediateCertificateExpirationDate;
  NSData *intermediateCertificatePersistentReference;
  NSDate *lastValidationAttemptDate;
  NSDate *lastValidationDate;
  NSDate *modificationDate;
  NSData *privateKeyPersistentReference;
  NSString *serialNumber;
  id v17;

  v4 = a3;
  accountIdentifier = self->_accountIdentifier;
  v17 = v4;
  if (accountIdentifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", accountIdentifier, CFSTR("AccountIdentifier"));
    v4 = v17;
  }
  altDSID = self->_altDSID;
  if (altDSID)
  {
    objc_msgSend(v17, "encodeObject:forKey:", altDSID, CFSTR("AltDSID"));
    v4 = v17;
  }
  appleID = self->_appleID;
  if (appleID)
  {
    objc_msgSend(v17, "encodeObject:forKey:", appleID, CFSTR("AppleID"));
    v4 = v17;
  }
  certificateExpirationDate = self->_certificateExpirationDate;
  if (certificateExpirationDate)
  {
    objc_msgSend(v17, "encodeObject:forKey:", certificateExpirationDate, CFSTR("CertificateExpirationDate"));
    v4 = v17;
  }
  certificatePersistentReference = self->_certificatePersistentReference;
  if (certificatePersistentReference)
  {
    objc_msgSend(v17, "encodeObject:forKey:", certificatePersistentReference, CFSTR("CertificatePersistentReference"));
    v4 = v17;
  }
  intermediateCertificateExpirationDate = self->_intermediateCertificateExpirationDate;
  if (intermediateCertificateExpirationDate)
  {
    objc_msgSend(v17, "encodeObject:forKey:", intermediateCertificateExpirationDate, CFSTR("IntermediateCertificateExpirationDate"));
    v4 = v17;
  }
  intermediateCertificatePersistentReference = self->_intermediateCertificatePersistentReference;
  if (intermediateCertificatePersistentReference)
  {
    objc_msgSend(v17, "encodeObject:forKey:", intermediateCertificatePersistentReference, CFSTR("IntermediateCertificatePersistentReference"));
    v4 = v17;
  }
  lastValidationAttemptDate = self->_lastValidationAttemptDate;
  if (lastValidationAttemptDate)
  {
    objc_msgSend(v17, "encodeObject:forKey:", lastValidationAttemptDate, CFSTR("LastValidationAttemptDate"));
    v4 = v17;
  }
  lastValidationDate = self->_lastValidationDate;
  if (lastValidationDate)
  {
    objc_msgSend(v17, "encodeObject:forKey:", lastValidationDate, CFSTR("LastValidationDate"));
    v4 = v17;
  }
  if (self->_linkedToCurrentUser)
  {
    objc_msgSend(v17, "encodeBool:forKey:", 1, CFSTR("LinkedToCurrentUser"));
    v4 = v17;
  }
  modificationDate = self->_modificationDate;
  if (modificationDate)
  {
    objc_msgSend(v17, "encodeObject:forKey:", modificationDate, CFSTR("ModificationDate"));
    v4 = v17;
  }
  privateKeyPersistentReference = self->_privateKeyPersistentReference;
  if (privateKeyPersistentReference)
  {
    objc_msgSend(v17, "encodeObject:forKey:", privateKeyPersistentReference, CFSTR("PrivateKeyPersistentReference"));
    v4 = v17;
  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    objc_msgSend(v17, "encodeObject:forKey:", serialNumber, CFSTR("SerialNumber"));
    v4 = v17;
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
    objc_storeStrong((id *)(v4 + 32), self->_accountIdentifier);
    objc_storeStrong((id *)(v5 + 40), self->_altDSID);
    objc_storeStrong((id *)(v5 + 48), self->_appleID);
    objc_storeStrong((id *)(v5 + 56), self->_certificateExpirationDate);
    objc_storeStrong((id *)(v5 + 64), self->_certificatePersistentReference);
    objc_storeStrong((id *)(v5 + 72), self->_intermediateCertificateExpirationDate);
    objc_storeStrong((id *)(v5 + 80), self->_intermediateCertificatePersistentReference);
    objc_storeStrong((id *)(v5 + 88), self->_lastValidationAttemptDate);
    objc_storeStrong((id *)(v5 + 96), self->_lastValidationDate);
    *(_BYTE *)(v5 + 24) = self->_linkedToCurrentUser;
    objc_storeStrong((id *)(v5 + 104), self->_modificationDate);
    objc_storeStrong((id *)(v5 + 120), self->_serialNumber);
    objc_storeStrong((id *)(v5 + 112), self->_privateKeyPersistentReference);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAppleIDIdentity *v4;
  SFAppleIDIdentity *v5;
  BOOL v6;

  v4 = (SFAppleIDIdentity *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFAppleIDIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v5);

  return v6;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  SFAppleIDIdentity *v4;
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
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  _BOOL4 v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  char v72;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;

  v4 = (SFAppleIDIdentity *)a3;
  if (self == v4)
  {
    v72 = 1;
    goto LABEL_46;
  }
  -[SFAppleIDIdentity accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity accountIdentifier](v4, "accountIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[SFAppleIDIdentity accountIdentifier](self, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity accountIdentifier](v4, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity altDSID](self, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity altDSID](v4, "altDSID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[SFAppleIDIdentity altDSID](self, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity altDSID](v4, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity appleID](self, "appleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity appleID](v4, "appleID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[SFAppleIDIdentity appleID](self, "appleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity appleID](v4, "appleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity certificateExpirationDate](v4, "certificateExpirationDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity certificateExpirationDate](v4, "certificateExpirationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity certificatePersistentReference](v4, "certificatePersistentReference");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29 == (void *)v30)
  {

  }
  else
  {
    v31 = (void *)v30;
    -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity certificatePersistentReference](v4, "certificatePersistentReference");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity intermediateCertificateExpirationDate](v4, "intermediateCertificateExpirationDate");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v35 == (void *)v36)
  {

  }
  else
  {
    v37 = (void *)v36;
    -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity intermediateCertificateExpirationDate](v4, "intermediateCertificateExpirationDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity intermediateCertificatePersistentReference](self, "intermediateCertificatePersistentReference");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity intermediateCertificatePersistentReference](v4, "intermediateCertificatePersistentReference");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v41 == (void *)v42)
  {

  }
  else
  {
    v43 = (void *)v42;
    -[SFAppleIDIdentity intermediateCertificatePersistentReference](self, "intermediateCertificatePersistentReference");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity intermediateCertificatePersistentReference](v4, "intermediateCertificatePersistentReference");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity lastValidationAttemptDate](self, "lastValidationAttemptDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity lastValidationAttemptDate](v4, "lastValidationAttemptDate");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v47 == (void *)v48)
  {

  }
  else
  {
    v49 = (void *)v48;
    -[SFAppleIDIdentity lastValidationAttemptDate](self, "lastValidationAttemptDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity lastValidationAttemptDate](v4, "lastValidationAttemptDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity lastValidationDate](self, "lastValidationDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity lastValidationDate](v4, "lastValidationDate");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v53 == (void *)v54)
  {

  }
  else
  {
    v55 = (void *)v54;
    -[SFAppleIDIdentity lastValidationDate](self, "lastValidationDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity lastValidationDate](v4, "lastValidationDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_45;
  }
  v59 = -[SFAppleIDIdentity linkedToCurrentUser](self, "linkedToCurrentUser");
  if (v59 != -[SFAppleIDIdentity linkedToCurrentUser](v4, "linkedToCurrentUser"))
  {
LABEL_45:
    v72 = 0;
    goto LABEL_46;
  }
  -[SFAppleIDIdentity modificationDate](self, "modificationDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity modificationDate](v4, "modificationDate");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v60 == (void *)v61)
  {

  }
  else
  {
    v62 = (void *)v61;
    -[SFAppleIDIdentity modificationDate](self, "modificationDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity modificationDate](v4, "modificationDate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity serialNumber](self, "serialNumber");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity serialNumber](v4, "serialNumber");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v66 == (void *)v67)
  {

  }
  else
  {
    v68 = (void *)v67;
    -[SFAppleIDIdentity serialNumber](self, "serialNumber");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity serialNumber](v4, "serialNumber");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqual:", v70);

    if (!v71)
      goto LABEL_45;
  }
  -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity privateKeyPersistentReference](v4, "privateKeyPersistentReference");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v74 == (void *)v75)
  {
    v72 = 1;
    v76 = v74;
  }
  else
  {
    v76 = (void *)v75;
    -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity privateKeyPersistentReference](v4, "privateKeyPersistentReference");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v77, "isEqual:", v78);

  }
LABEL_46:

  return v72;
}

- (SFAppleIDIdentity)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v7;
  id v8;
  SFAppleIDIdentity *v9;
  SFAppleIDIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFAppleIDIdentity;
  v9 = -[SFAppleIDIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_altDSID, a4);
    objc_storeStrong((id *)&v10->_appleID, a3);
  }

  return v10;
}

- (SFAppleIDIdentity)initWithDictionary:(id)a3
{
  id v4;
  SFAppleIDIdentity *v5;
  uint64_t v6;
  NSDate *certificateExpirationDate;
  uint64_t v8;
  NSData *certificatePersistentReference;
  void *v10;
  uint64_t v11;
  NSString *encDSID;
  uint64_t v13;
  NSData *intermediateCertificatePersistentReference;
  uint64_t v15;
  NSDate *lastValidationAttemptDate;
  uint64_t v17;
  NSDate *lastValidationDate;
  uint64_t v19;
  NSDate *modificationDate;
  uint64_t v21;
  NSString *serialNumber;
  uint64_t v23;
  NSData *privateKeyPersistentReference;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFAppleIDIdentity;
  v5 = -[SFAppleIDIdentity init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Expires"));
    v6 = objc_claimAutoreleasedReturnValue();
    certificateExpirationDate = v5->_certificateExpirationDate;
    v5->_certificateExpirationDate = (NSDate *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CertificateReference"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificatePersistentReference = v5->_certificatePersistentReference;
    v5->_certificatePersistentReference = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encDsId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encDsId"));
      v11 = objc_claimAutoreleasedReturnValue();
      encDSID = v5->_encDSID;
      v5->_encDSID = (NSString *)v11;
    }
    else
    {
      encDSID = v5->_encDSID;
      v5->_encDSID = (NSString *)&stru_1E483B8E8;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntermediateCertificateReference"));
    v13 = objc_claimAutoreleasedReturnValue();
    intermediateCertificatePersistentReference = v5->_intermediateCertificatePersistentReference;
    v5->_intermediateCertificatePersistentReference = (NSData *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastValidationAttempt"));
    v15 = objc_claimAutoreleasedReturnValue();
    lastValidationAttemptDate = v5->_lastValidationAttemptDate;
    v5->_lastValidationAttemptDate = (NSDate *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastSuccessfulValidation"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastValidationDate = v5->_lastValidationDate;
    v5->_lastValidationDate = (NSDate *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ModificationDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerialNumber"));
    v21 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CertificatePrivateKeyReference"));
    v23 = objc_claimAutoreleasedReturnValue();
    privateKeyPersistentReference = v5->_privateKeyPersistentReference;
    v5->_privateKeyPersistentReference = (NSData *)v23;

  }
  return v5;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSString *appleID;
  NSData *certificatePersistentReference;
  void *v24;
  const char *v25;
  id v26;

  NSAppendPrintF();
  v26 = 0;
  NSAppendPrintF();
  v3 = v26;

  NSAppendPrintF();
  v4 = v3;

  appleID = self->_appleID;
  NSAppendPrintF();
  v5 = v4;

  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate", appleID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v7 = v5;

  certificatePersistentReference = self->_certificatePersistentReference;
  NSAppendPrintF();
  v8 = v7;

  -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate", certificatePersistentReference);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v9 = v8;

  -[SFAppleIDIdentity intermediateCertificateSerialNumber](self, "intermediateCertificateSerialNumber", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v11 = v9;

  NSAppendPrintF();
  v12 = v11;

  NSAppendPrintF();
  v13 = v12;

  NSAppendPrintF();
  v14 = v13;

  NSAppendPrintF();
  v15 = v14;

  if (self->_linkedToCurrentUser)
    v16 = "yes";
  else
    v16 = "no";
  v25 = v16;
  NSAppendPrintF();
  v17 = v15;

  -[SFAppleIDIdentity needsRenewal](self, "needsRenewal", v25);
  NSAppendPrintF();
  v18 = v17;

  NSAppendPrintF();
  v19 = v18;

  NSAppendPrintF();
  v20 = v19;

  return v20;
}

- (__SecCertificate)copyCertificate
{
  return -[SFAppleIDIdentity copyCertificateWithType:](self, "copyCertificateWithType:", 0);
}

- (__SecCertificate)copyCertificateWithType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  __SecCertificate *v10;
  __CFString *v11;
  __CFString *v12;
  void *v14;
  CFTypeRef result;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  result = 0;
  if (a3 == 1)
  {
    -[SFAppleIDIdentity intermediateCertificatePersistentReference](self, "intermediateCertificatePersistentReference");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      if (gLogCategory_SFAppleIDIdentity > 60)
      {
        v8 = 0;
        v10 = 0;
        v6 = 0;
        goto LABEL_27;
      }
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
        LogPrintF();
      goto LABEL_15;
    }
    -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (!v5)
  {
LABEL_15:
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      v11 = CFSTR("?");
      if (a3 == 1)
        v11 = CFSTR("Intermediate");
      if (!a3)
        v11 = CFSTR("Leaf");
      v12 = v11;
      -[SFAppleIDIdentity appleID](self, "appleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v6 = 0;
    v8 = 0;
    goto LABEL_24;
  }
  v7 = *MEMORY[0x1E0CD70E0];
  v16[0] = *MEMORY[0x1E0CD6C98];
  v16[1] = v7;
  v17[0] = *MEMORY[0x1E0CD6CA0];
  v17[1] = v5;
  v16[2] = *MEMORY[0x1E0CD7028];
  v17[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemCopyMatching(v8, &result))
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_36;
    }
    goto LABEL_24;
  }
  if (!result)
  {
    if (gLogCategory_SFAppleIDIdentity > 60)
    {
LABEL_26:
      v10 = 0;
      goto LABEL_27;
    }
    if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
      goto LABEL_36;
    goto LABEL_24;
  }
  v9 = CFGetTypeID(result);
  if (v9 != SecCertificateGetTypeID())
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
LABEL_36:
      LogPrintF();
    }
LABEL_24:
    if (result)
      CFRelease(result);
    goto LABEL_26;
  }
  v10 = (__SecCertificate *)result;
LABEL_27:

  return v10;
}

- (__SecCertificate)copyIntermediateCertificate
{
  return -[SFAppleIDIdentity copyCertificateWithType:](self, "copyCertificateWithType:", 1);
}

- (__SecKey)copyPrivateKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  __SecKey *v9;
  void *v11;
  CFTypeRef result;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  result = 0;
  -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      -[SFAppleIDIdentity appleID](self, "appleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v7 = 0;
    goto LABEL_21;
  }
  v4 = *MEMORY[0x1E0CD6C98];
  v14[0] = *MEMORY[0x1E0CD6CC0];
  v5 = *MEMORY[0x1E0CD70E0];
  v13[0] = v4;
  v13[1] = v5;
  -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x1E0CD7028];
  v14[1] = v6;
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (SecItemCopyMatching(v7, &result))
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
LABEL_18:
    LogPrintF();
LABEL_21:
    v9 = 0;
    goto LABEL_6;
  }
  if (!result)
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v8 = CFGetTypeID(result);
  if (v8 != SecKeyGetTypeID())
  {
    if (gLogCategory_SFAppleIDIdentity > 60
      || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  v9 = (__SecKey *)result;
LABEL_6:

  return v9;
}

- (BOOL)isDateInThePast:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  v7 = v6 == -1;
  return v7;
}

- (BOOL)certificateExpired
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v7;

  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFAppleIDIdentity isDateInThePast:](self, "isDateInThePast:", v3);

  if (v4
    && gLogCategory_SFAppleIDIdentity <= 30
    && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
  {
    -[SFAppleIDIdentity appleID](self, "appleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  return v4;
}

- (NSDate)certificateExpirationDate
{
  NSDate **p_certificateExpirationDate;
  id v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  int v6;
  id v7;
  NSDate *v8;
  id v10;

  p_certificateExpirationDate = &self->_certificateExpirationDate;
  if (self->_certificateExpirationDate || (v4 = -[SFAppleIDIdentity copyCertificate](self, "copyCertificate")) == 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = v4;
    v10 = 0;
    v6 = SFAppleIDExpirationDateForCertificate((uint64_t)v4, &v10);
    v7 = v10;
    v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_certificateExpirationDate, v7);
    }
    CFRelease(v5);
  }
  v8 = *p_certificateExpirationDate;

  return v8;
}

- (NSDate)intermediateCertificateExpirationDate
{
  NSDate **p_intermediateCertificateExpirationDate;
  id v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  int v6;
  id v7;
  NSDate *v8;
  id v10;

  p_intermediateCertificateExpirationDate = &self->_intermediateCertificateExpirationDate;
  if (self->_intermediateCertificateExpirationDate
    || (v4 = -[SFAppleIDIdentity copyIntermediateCertificate](self, "copyIntermediateCertificate")) == 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = v4;
    v10 = 0;
    v6 = SFAppleIDExpirationDateForCertificate((uint64_t)v4, &v10);
    v7 = v10;
    v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_intermediateCertificateExpirationDate, v7);
    }
    CFRelease(v5);
  }
  v8 = *p_intermediateCertificateExpirationDate;

  return v8;
}

- (NSString)intermediateCertificateSerialNumber
{
  NSString **p_intermediateCertificateSerialNumber;
  id v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  int v6;
  id v7;
  NSString *v8;
  id v10;

  p_intermediateCertificateSerialNumber = &self->_intermediateCertificateSerialNumber;
  if (self->_intermediateCertificateSerialNumber
    || (v4 = -[SFAppleIDIdentity copyIntermediateCertificate](self, "copyIntermediateCertificate")) == 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = v4;
    v10 = 0;
    v6 = SFAppleIDSerialNumberForCertificate(v4, &v10);
    v7 = v10;
    v3 = v10;
    if (v6)
    {
      if (gLogCategory_SFAppleIDIdentity <= 60
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_storeStrong((id *)p_intermediateCertificateSerialNumber, v7);
    }
    CFRelease(v5);
  }
  v8 = *p_intermediateCertificateSerialNumber;

  return v8;
}

- (BOOL)intermediateCertificateExpired
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v7;

  -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFAppleIDIdentity isDateInThePast:](self, "isDateInThePast:", v3);

  if (v4
    && gLogCategory_SFAppleIDIdentity <= 30
    && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
  {
    -[SFAppleIDIdentity appleID](self, "appleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  return v4;
}

- (BOOL)isInvalid
{
  void *v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  void *v6;
  __SecCertificate *v7;
  __SecCertificate *v8;
  __SecIdentity *v9;
  void *v11;

  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[SFAppleIDIdentity certificateExpired](self, "certificateExpired"))
    {
      if (gLogCategory_SFAppleIDIdentity <= 50)
      {
        if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
          goto LABEL_17;
        goto LABEL_28;
      }
    }
    else
    {
      v4 = -[SFAppleIDIdentity copyCertificate](self, "copyCertificate");
      if (v4)
      {
        v5 = v4;
        -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          if (-[SFAppleIDIdentity intermediateCertificateExpired](self, "intermediateCertificateExpired"))
          {
            if (gLogCategory_SFAppleIDIdentity > 50
              || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          else
          {
            v7 = -[SFAppleIDIdentity copyIntermediateCertificate](self, "copyIntermediateCertificate");
            if (v7)
            {
              v8 = v7;
              v9 = -[SFAppleIDIdentity copyIdentity](self, "copyIdentity");
              if (v9)
              {
                CFRelease(v5);
                CFRelease(v8);
                CFRelease(v9);
                return 0;
              }
              if (gLogCategory_SFAppleIDIdentity <= 50
                && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              CFRelease(v5);
              CFRelease(v8);
              goto LABEL_28;
            }
            if (gLogCategory_SFAppleIDIdentity > 50
              || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
        }
        else if (gLogCategory_SFAppleIDIdentity > 50
               || gLogCategory_SFAppleIDIdentity == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_27;
        }
        LogPrintF();
LABEL_27:
        CFRelease(v5);
        goto LABEL_28;
      }
      if (gLogCategory_SFAppleIDIdentity <= 50)
      {
        if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
LABEL_17:
          LogPrintF();
LABEL_28:
        if (gLogCategory_SFAppleIDIdentity <= 30
          && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
        {
          -[SFAppleIDIdentity appleID](self, "appleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
      }
    }
  }
  else if (gLogCategory_SFAppleIDIdentity <= 50)
  {
    if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
      goto LABEL_17;
    goto LABEL_28;
  }
  return 1;
}

- (BOOL)needsRenewal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
        goto LABEL_18;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  objc_msgSend(v3, "dateByAddingTimeInterval:", 7776000.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity certificateExpirationDate](self, "certificateExpirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == 1)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
        goto LABEL_18;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
        goto LABEL_18;
      goto LABEL_19;
    }
LABEL_23:
    v12 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v3, "dateByAddingTimeInterval:", 7776000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDIdentity intermediateCertificateExpirationDate](self, "intermediateCertificateExpirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 == 1)
  {
    if (gLogCategory_SFAppleIDIdentity <= 50)
    {
      if (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize())
LABEL_18:
        LogPrintF();
LABEL_19:
      if (gLogCategory_SFAppleIDIdentity <= 30
        && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
      {
        -[SFAppleIDIdentity appleID](self, "appleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (__SecIdentity)copyIdentity
{
  __SecCertificate *v3;
  __SecCertificate *v4;
  __SecKey *v5;
  __SecKey *v6;
  __SecIdentity *v7;
  void *v9;

  v3 = -[SFAppleIDIdentity copyCertificate](self, "copyCertificate");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = -[SFAppleIDIdentity copyPrivateKey](self, "copyPrivateKey");
  if (v5)
  {
    v6 = v5;
    v7 = (__SecIdentity *)SecIdentityCreate();
    if (!v7
      && gLogCategory_SFAppleIDIdentity <= 60
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      -[SFAppleIDIdentity appleID](self, "appleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    CFRelease(v4);
  }
  else
  {
    v7 = 0;
    v6 = v4;
  }
  CFRelease(v6);
  return v7;
}

- (void)removeFromKeychain
{
  void *v3;
  void *v4;
  void *v5;
  SecKeyRef v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SecCertificateRef certificate;

  -[SFAppleIDIdentity appleID](self, "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  certificate = 0;
  -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SFAppleIDCopyCertificateFromKeychainForReference(v5, (CFTypeRef *)&certificate);

    if (certificate)
    {
      v6 = SecCertificateCopyKey(certificate);
      v4 = v6;
      if (v6)
      {
        v11 = 0;
        SFAppleIDCopyKeychainReferenceForKey((uint64_t)v6, &v11);
        v7 = v11;
        if (v7)
          SFAppleIDRemoveKeyFromKeychain(v3, v7);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
      v4 = 0;
    }
    -[SFAppleIDIdentity certificatePersistentReference](self, "certificatePersistentReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SFAppleIDRemoveCertificateFromKeychain(v3, v8);

  }
  else
  {
    v7 = 0;
  }
  -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SFAppleIDIdentity privateKeyPersistentReference](self, "privateKeyPersistentReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SFAppleIDRemoveKeyFromKeychain(v3, v10);

  }
  if (certificate)
    CFRelease(certificate);
  if (v4)
    CFRelease(v4);

}

- (int)verifyKeys
{
  int v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  __SecKey *v6;
  __SecKey *v7;
  __SecKey *v8;
  uint64_t AlgorithmId;
  uint64_t v10;
  __SecKey *v11;
  id v12;
  const __CFData *v13;
  int v14;
  const __CFData *v15;
  const __CFData *v17;
  CFTypeRef cf;

  v3 = 201234;
  cf = 0;
  v4 = -[SFAppleIDIdentity copyCertificate](self, "copyCertificate");
  if (!v4)
  {
    v12 = 0;
    v13 = 0;
    v3 = 201203;
    goto LABEL_33;
  }
  v5 = v4;
  v6 = -[SFAppleIDIdentity copyPrivateKey](self, "copyPrivateKey");
  if (!v6)
  {
    CFRelease(v5);
    v12 = 0;
    v13 = 0;
    v3 = 201206;
    goto LABEL_33;
  }
  v7 = v6;
  v8 = SecCertificateCopyKey(v5);
  if (v8)
  {
    AlgorithmId = SecKeyGetAlgorithmId();
    if (gLogCategory_SFAppleIDIdentity <= 50
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = SecKeyGetAlgorithmId();
    if (gLogCategory_SFAppleIDIdentity <= 50
      && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (AlgorithmId == v10)
    {
      cf = 0;
      v11 = (__SecKey *)SecKeyCopyMatchingPrivateKey();
      if (v7 == v11 || v11 && CFEqual(v7, v11))
      {
        if (gLogCategory_SFAppleIDIdentity <= 50
          && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 5000));
        objc_msgSend(v12, "mutableBytes");
        RandomBytes();
        v17 = 0;
        v14 = SFAppleIDSignedHashForData(v12, v7, &v17);
        v15 = v17;
        v13 = v15;
        if (v14)
        {
          if (gLogCategory_SFAppleIDIdentity <= 60
            && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_29;
        }
        if (-[__CFData length](v15, "length"))
        {
          if (SFAppleIDVerifySignedHashForData(v12, v13, v8))
          {
            if (gLogCategory_SFAppleIDIdentity <= 60
              && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v3 = 201235;
            goto LABEL_29;
          }
          if (gLogCategory_SFAppleIDIdentity <= 50
            && (gLogCategory_SFAppleIDIdentity != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        else
        {
          FPrintF();
        }
        v3 = 0;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v3 = 201233;
      }
    }
    else
    {
      v12 = 0;
      v11 = 0;
      v13 = 0;
      v3 = 201231;
    }
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v13 = 0;
    v3 = 201230;
  }
LABEL_29:
  CFRelease(v5);
  CFRelease(v7);
  if (v8)
    CFRelease(v8);
  if (v11)
    CFRelease(v11);
LABEL_33:

  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setCertificateExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_certificateExpirationDate, a3);
}

- (NSData)certificatePersistentReference
{
  return self->_certificatePersistentReference;
}

- (void)setCertificatePersistentReference:(id)a3
{
  objc_storeStrong((id *)&self->_certificatePersistentReference, a3);
}

- (void)setIntermediateCertificateExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateCertificateExpirationDate, a3);
}

- (NSData)intermediateCertificatePersistentReference
{
  return self->_intermediateCertificatePersistentReference;
}

- (void)setIntermediateCertificatePersistentReference:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateCertificatePersistentReference, a3);
}

- (NSDate)lastValidationAttemptDate
{
  return self->_lastValidationAttemptDate;
}

- (void)setLastValidationAttemptDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastValidationAttemptDate, a3);
}

- (NSDate)lastValidationDate
{
  return self->_lastValidationDate;
}

- (void)setLastValidationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastValidationDate, a3);
}

- (BOOL)linkedToCurrentUser
{
  return self->_linkedToCurrentUser;
}

- (void)setLinkedToCurrentUser:(BOOL)a3
{
  self->_linkedToCurrentUser = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSData)privateKeyPersistentReference
{
  return self->_privateKeyPersistentReference;
}

- (void)setPrivateKeyPersistentReference:(id)a3
{
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_privateKeyPersistentReference, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastValidationDate, 0);
  objc_storeStrong((id *)&self->_lastValidationAttemptDate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificatePersistentReference, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificatePersistentReference, 0);
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_encDSID, 0);
}

@end
