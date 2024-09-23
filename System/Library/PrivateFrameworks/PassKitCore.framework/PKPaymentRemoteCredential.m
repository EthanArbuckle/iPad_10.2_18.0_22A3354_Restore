@implementation PKPaymentRemoteCredential

- (PKPaymentRemoteCredential)init
{
  return -[PKPaymentRemoteCredential initWithDictionary:](self, "initWithDictionary:", 0);
}

- (PKPaymentRemoteCredential)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRemoteCredential *v5;
  PKPaymentRemoteCredential *v6;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKPaymentRemoteCredential;
    v5 = -[PKPaymentCredential init](&v8, sel_init);
    v6 = v5;
    if (v5)
      -[PKPaymentRemoteCredential updateWithDictionary:](v5, "updateWithDictionary:", v4);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (PKPaymentRemoteCredential)initWithIdentifier:(id)a3 status:(int64_t)a4 credentialType:(int64_t)a5 passURL:(id)a6
{
  id v10;
  id v11;
  PKPaymentRemoteCredential *v12;
  PKPaymentRemoteCredential *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSURL *passURL;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRemoteCredential;
  v12 = -[PKPaymentCredential init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PKPaymentCredential setCredentialType:](v12, "setCredentialType:", a5);
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_status = a4;
    v16 = objc_msgSend(v11, "copy");
    passURL = v13->_passURL;
    v13->_passURL = (NSURL *)v16;

  }
  return v13;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  NSString *v7;
  NSString *passTypeIdentifier;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSURL *passURL;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *summaryMetadata;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSString *summaryMetadataDescription;
  uint64_t v58;
  NSString *statusDescription;
  uint64_t v60;
  NSString *ownershipTokenIdentifier;
  PKPaymentRemoteCredentialFIDOProfile *v62;
  void *v63;
  uint64_t v64;
  PKPaymentRemoteCredentialFIDOProfile *fidoProfile;
  void *v66;
  void *v67;
  uint64_t v68;
  NSArray *transferableFromDevices;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSDate *originalProvisioningDate;
  uint64_t v76;
  NSString *identityAccountKeyIdentifier;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  PKPaymentRemoteCredential *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("passTypeIdentifier"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  passTypeIdentifier = self->_passTypeIdentifier;
  self->_passTypeIdentifier = v7;

  objc_msgSend(v4, "PKNumberForKey:", CFSTR("status"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &unk_1E2C3EDB8;
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  v85 = v12;
  v78 = objc_msgSend(v12, "integerValue");
  -[PKPaymentRemoteCredential setStatus:](self, "setStatus:");
  objc_msgSend(v4, "PKURLForKey:", CFSTR("passURL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentRemoteCredential setPassURL:](self, "setPassURL:", v13);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("serialNumber"));
  v14 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v14;
  if (v14)
  {
    -[PKPaymentRemoteCredential setSerialNumber:](self, "setSerialNumber:", v14);
  }
  else
  {
    passURL = self->_passURL;
    if (passURL)
    {
      -[NSURL lastPathComponent](passURL, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRemoteCredential setSerialNumber:](self, "setSerialNumber:", v16);

    }
  }
  -[PKPaymentCredential setDeletable:](self, "setDeletable:", objc_msgSend(v4, "PKBoolForKey:", CFSTR("isDeletable")));
  objc_msgSend(v4, "objectForKey:", CFSTR("cardType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v17, "integerValue");
  else
    v18 = 0;
  -[PKPaymentCredential setCredentialType:](self, "setCredentialType:", v18);
  objc_msgSend(v4, "PKStringForKey:", CFSTR("sanitizedPrimaryAccountNumber"));
  v87 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredential setSanitizedPrimaryAccountNumber:](self, "setSanitizedPrimaryAccountNumber:", v19);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("sanitizedPrimaryAccountName"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredential setSanitizedPrimaryAccountName:](self, "setSanitizedPrimaryAccountName:", v20);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("expiration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredential setExpiration:](self, "setExpiration:", v21);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("nonce"));
  v22 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredential state](v87, "state");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNonce:", v22);

  v83 = (void *)v22;
  v87->_couldSupportSuperEasyProvisioning = v22 != 0;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("longDescription"));
  v24 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)v24;
  if (v24)
  {
    -[PKPaymentCredential setLongDescription:](v87, "setLongDescription:", v24);
  }
  else
  {
    PKDisplayablePaymentNetworkNameForPaymentCredentialType(v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setLongDescription:](v87, "setLongDescription:", v25);

  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("metadata"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v94 != v30)
          objc_enumerationMutation(v27);
        +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    }
    while (v29);
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentCardType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    v35 = PKWebServicesPaymentCardTypeFromString(v33);
    v36 = 4;
    if (v35 != 5)
      v36 = v35;
    if (v35 == 4)
      v37 = 3;
    else
      v37 = v36;
    -[PKPaymentCredential setCardType:](v87, "setCardType:", v37);
  }
  v81 = v34;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("productIdentifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_storeStrong((id *)&v87->_productIdentifier, v38);
  v80 = v38;
  v39 = (void *)objc_msgSend(v26, "copy");
  -[PKPaymentCredential setMetadata:](v87, "setMetadata:", v39);

  v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = v4;
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("summaryMetadata"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v90 != v44)
          objc_enumerationMutation(v41);
        +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:](PKPaymentCredentialMetadata, "paymentCredentialMetadataWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(v40, "addObject:", v46);
          objc_msgSend(v46, "displayString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend(v88, "addObject:", v47);

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    }
    while (v43);
  }
  v48 = objc_msgSend(v40, "copy");
  summaryMetadata = v87->_summaryMetadata;
  v87->_summaryMetadata = (NSArray *)v48;

  if (!objc_msgSend(v88, "count"))
  {
    PKSanitizedPrimaryAccountRepresentationForPaymentCredential(v87);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "length"))
    {
      if (v78 == 2)
      {
        PKLocalizedPaymentString(CFSTR("IDMS_CARD_ON_FILE_DETAIL"), CFSTR("%@"), v50);
        v51 = objc_claimAutoreleasedReturnValue();

        v50 = (void *)v51;
      }
      objc_msgSend(v88, "addObject:", v50);
    }

  }
  v52 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "objectForKey:", *MEMORY[0x1E0C997D8]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "stringWithFormat:", CFSTR("%@ "), v54);
  v55 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v55;
  objc_msgSend(v88, "componentsJoinedByString:", v55);
  v56 = objc_claimAutoreleasedReturnValue();
  summaryMetadataDescription = v87->_summaryMetadataDescription;
  v87->_summaryMetadataDescription = (NSString *)v56;

  objc_msgSend(v86, "PKStringForKey:", CFSTR("statusDescription"));
  v58 = objc_claimAutoreleasedReturnValue();
  statusDescription = v87->_statusDescription;
  v87->_statusDescription = (NSString *)v58;

  objc_msgSend(v86, "PKStringForKey:", CFSTR("ownershipTokenIdentifier"));
  v60 = objc_claimAutoreleasedReturnValue();
  ownershipTokenIdentifier = v87->_ownershipTokenIdentifier;
  v87->_ownershipTokenIdentifier = (NSString *)v60;

  v62 = [PKPaymentRemoteCredentialFIDOProfile alloc];
  objc_msgSend(v86, "PKDictionaryForKey:", CFSTR("fidoProfile"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[PKPaymentRemoteCredentialFIDOProfile initWithDictionary:](v62, "initWithDictionary:", v63);
  fidoProfile = v87->_fidoProfile;
  v87->_fidoProfile = (PKPaymentRemoteCredentialFIDOProfile *)v64;

  objc_msgSend(v86, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("transferableFromDevices"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    objc_msgSend(v66, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_230_0);
    v68 = objc_claimAutoreleasedReturnValue();
    transferableFromDevices = v87->_transferableFromDevices;
    v87->_transferableFromDevices = (NSArray *)v68;

  }
  objc_msgSend(v86, "PKStringForKey:", CFSTR("transferType"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v87->_transferType = PKRemoteCredentialTransferTypeFromString(v70);

  if (!v87->_transferType && -[NSArray count](v87->_transferableFromDevices, "count"))
    v87->_transferType = 1;
  v87->_supportsSuperEasyProvisioning = objc_msgSend(v86, "PKBoolForKey:", CFSTR("supportsFrictionlessProvisioning"));
  objc_msgSend(v86, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentApplications"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_239);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v72, "count"))
    v73 = v72;
  else
    v73 = 0;
  -[PKPaymentCredential setPaymentApplications:](v87, "setPaymentApplications:", v73);
  objc_msgSend(v86, "PKDateForKey:", CFSTR("originalProvisioningDate"));
  v74 = objc_claimAutoreleasedReturnValue();
  originalProvisioningDate = v87->_originalProvisioningDate;
  v87->_originalProvisioningDate = (NSDate *)v74;

  objc_msgSend(v86, "PKStringForKey:", CFSTR("identityAccountKeyIdentifier"));
  v76 = objc_claimAutoreleasedReturnValue();
  identityAccountKeyIdentifier = v87->_identityAccountKeyIdentifier;
  v87->_identityAccountKeyIdentifier = (NSString *)v76;

}

PKExternalDestinationDevice *__50__PKPaymentRemoteCredential_updateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKExternalDestinationDevice *v3;

  v2 = a2;
  v3 = -[PKExternalDestinationDevice initWithDictionary:]([PKExternalDestinationDevice alloc], "initWithDictionary:", v2);

  return v3;
}

PKProvisioningPaymentApplication *__50__PKPaymentRemoteCredential_updateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKProvisioningPaymentApplication *v3;

  v2 = a2;
  v3 = -[PKProvisioningPaymentApplication initWithDictionary:]([PKProvisioningPaymentApplication alloc], "initWithDictionary:", v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRemoteCredential *v4;
  PKPaymentRemoteCredential *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  NSArray *summaryMetadata;
  NSArray *v14;
  NSString *summaryMetadataDescription;
  NSString *v16;
  _BOOL4 v17;
  objc_super v19;

  v4 = (PKPaymentRemoteCredential *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)PKPaymentRemoteCredential;
      if (!-[PKPaymentCredential isEqual:](&v19, sel_isEqual_, v5))
      {
LABEL_24:
        v11 = 0;
LABEL_25:

        goto LABEL_26;
      }
      identifier = v5->_identifier;
      v7 = self->_identifier;
      v8 = identifier;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (v7)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
        {
LABEL_10:

          goto LABEL_24;
        }
        v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (!v12)
          goto LABEL_24;
      }
      summaryMetadata = self->_summaryMetadata;
      v14 = v5->_summaryMetadata;
      if (summaryMetadata && v14)
      {
        if ((-[NSArray isEqual:](summaryMetadata, "isEqual:") & 1) == 0)
          goto LABEL_24;
      }
      else if (summaryMetadata != v14)
      {
        goto LABEL_24;
      }
      summaryMetadataDescription = v5->_summaryMetadataDescription;
      v7 = self->_summaryMetadataDescription;
      v16 = summaryMetadataDescription;
      if (v7 == v16)
      {

        goto LABEL_28;
      }
      v9 = v16;
      if (v7 && v16)
      {
        v17 = -[NSString isEqualToString:](v7, "isEqualToString:", v16);

        if (!v17)
          goto LABEL_24;
LABEL_28:
        v11 = self->_requiresMetadata == v5->_requiresMetadata;
        goto LABEL_25;
      }
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_26:

  return v11;
}

- (void)setSupportsSuperEasyProvisioning:(BOOL)a3
{
  self->_supportsSuperEasyProvisioning = a3;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return self->_supportsSuperEasyProvisioning;
}

- (void)setCouldSupportSuperEasyProvisioning:(BOOL)a3
{
  self->_couldSupportSuperEasyProvisioning = a3;
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_summaryMetadata);
  objc_msgSend(v3, "safelyAddObject:", self->_summaryMetadataDescription);
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteCredential;
  v4 = -[PKPaymentCredential hash](&v8, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_requiresMetadata - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  __CFString *identifier;
  void *v4;
  __CFString *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  identifier = (__CFString *)self->_identifier;
  if (!identifier)
    identifier = CFSTR("n/a");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = identifier;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>: Identifier: %@"), v7, self, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  void *v3;

  if (self->_transferType == 2)
    goto LABEL_2;
  if (-[PKPaymentCredential cardType](self, "cardType") != 4)
  {
    -[PKPaymentRemoteCredential summaryMetadataDescription](self, "summaryMetadataDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 != 1)
  {
LABEL_2:
    v3 = 0;
  }
  else
  {
    PKLocalizedIdentityString(CFSTR("PRECURSOR_PASS_SETUP_ASSISTANT_VERIFICATION_REQUIRED"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)summaryMetadataDescription
{
  NSString *v3;

  if (self->_requiresMetadata && !-[NSArray count](self->_summaryMetadata, "count"))
  {
    PKLocalizedPaymentString(CFSTR("LOADING_METADATA"), 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_summaryMetadataDescription;
  }
  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t rank;
  unint64_t v12;

  v4 = a3;
  v5 = -[PKPaymentCredential cardType](self, "cardType");
  if (v5 < objc_msgSend(v4, "cardType"))
    goto LABEL_7;
  v6 = -[PKPaymentCredential cardType](self, "cardType");
  if (v6 <= objc_msgSend(v4, "cardType"))
  {
    v7 = -[PKPaymentCredential credentialType](self, "credentialType");
    if (v7 >= objc_msgSend(v4, "credentialType"))
    {
      v8 = -[PKPaymentCredential credentialType](self, "credentialType");
      if (v8 > objc_msgSend(v4, "credentialType"))
        goto LABEL_5;
      rank = self->_rank;
      if (rank >= objc_msgSend(v4, "rank"))
      {
        v12 = self->_rank;
        v9 = v12 > objc_msgSend(v4, "rank");
        goto LABEL_8;
      }
    }
LABEL_7:
    v9 = -1;
    goto LABEL_8;
  }
LABEL_5:
  v9 = 1;
LABEL_8:

  return v9;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)summaryMetadata
{
  return self->_summaryMetadata;
}

- (void)setSummaryMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setSummaryMetadataDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void)setOwnershipTokenIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)requiresMetadata
{
  return self->_requiresMetadata;
}

- (void)setRequiresMetadata:(BOOL)a3
{
  self->_requiresMetadata = a3;
}

- (PKPaymentRemoteCredentialFIDOProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (void)setFidoProfile:(id)a3
{
  objc_storeStrong((id *)&self->_fidoProfile, a3);
}

- (NSDate)originalProvisioningDate
{
  return self->_originalProvisioningDate;
}

- (void)setOriginalProvisioningDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalProvisioningDate, a3);
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, a3);
}

- (NSArray)transferableFromDevices
{
  return self->_transferableFromDevices;
}

- (void)setTransferableFromDevices:(id)a3
{
  objc_storeStrong((id *)&self->_transferableFromDevices, a3);
}

- (int64_t)transferType
{
  return self->_transferType;
}

- (void)setTransferType:(int64_t)a3
{
  self->_transferType = a3;
}

- (NSString)transferableFromDeviceIdentifier
{
  return self->_transferableFromDeviceIdentifier;
}

- (void)setTransferableFromDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferableFromDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableFromDevices, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_originalProvisioningDate, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_summaryMetadata, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_summaryMetadataDescription, 0);
}

@end
