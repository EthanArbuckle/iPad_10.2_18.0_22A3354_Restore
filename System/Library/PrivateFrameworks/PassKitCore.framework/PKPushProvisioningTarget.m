@implementation PKPushProvisioningTarget

- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[PKPushProvisioningTarget initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:](self, "initWithAppleIdentifier:appleIdentifierType:provisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:nonce:accountHash:templateIdentifier:relyingPartyIdentifier:requiresSimultaneousRequestRouting:targetDevice:environmentIdentifier:", a3, a4, a5, a6, a7, a8, 0, 0, 0, v9, 1, 0);
}

- (PKPushProvisioningTarget)initWithAppleIdentifier:(id)a3 appleIdentifierType:(int64_t)a4 provisioningCredentialIdentifier:(id)a5 cardConfigurationIdentifier:(id)a6 sharingInstanceIdentifier:(id)a7 nonce:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresSimultaneousRequestRouting:(BOOL)a12 targetDevice:(unint64_t)a13 environmentIdentifier:(id)a14
{
  id v20;
  PKPushProvisioningTarget *v21;
  PKPushProvisioningTarget *v22;
  NSDate *v23;
  NSDate *creationDate;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v27 = a11;
  v20 = a14;
  v35.receiver = self;
  v35.super_class = (Class)PKPushProvisioningTarget;
  v21 = -[PKPushProvisioningTarget init](&v35, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_appleIdentifier, a3);
    v22->_appleIdentifierType = a4;
    objc_storeStrong((id *)&v22->_provisioningCredentialIdentifier, a5);
    objc_storeStrong((id *)&v22->_cardConfigurationIdentifier, a6);
    objc_storeStrong((id *)&v22->_sharingInstanceIdentifier, a7);
    v23 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    creationDate = v22->_creationDate;
    v22->_creationDate = v23;

    objc_storeStrong((id *)&v22->_nonce, a8);
    objc_storeStrong((id *)&v22->_accountHash, a9);
    objc_storeStrong((id *)&v22->_templateIdentifier, a10);
    objc_storeStrong((id *)&v22->_relyingPartyIdentifier, a11);
    v22->_requiresSimultaneousRequestRouting = a12;
    v22->_targetDevice = a13;
    objc_storeStrong((id *)&v22->_environmentIdentifier, a14);
  }

  return v22;
}

- (PKPushProvisioningTarget)initWithProvisioningDict:(id)a3
{
  id v5;
  PKPushProvisioningTarget *v6;
  PKPushProvisioningTarget *v7;
  NSDate *v8;
  NSDate *creationDate;
  uint64_t v10;
  NSString *accountHash;
  uint64_t v12;
  NSString *relyingPartyIdentifier;
  uint64_t v14;
  NSString *provisioningCredentialIdentifier;
  PKPushProvisioningTarget *v16;
  objc_super v18;

  v5 = a3;
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPushProvisioningTarget;
    v6 = -[PKPushProvisioningTarget init](&v18, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_additionalProvisioningDictionary, a3);
      v8 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
      creationDate = v7->_creationDate;
      v7->_creationDate = v8;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("accountHash"));
      v10 = objc_claimAutoreleasedReturnValue();
      accountHash = v7->_accountHash;
      v7->_accountHash = (NSString *)v10;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("relyingPartyIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      relyingPartyIdentifier = v7->_relyingPartyIdentifier;
      v7->_relyingPartyIdentifier = (NSString *)v12;

      v7->_requiresSimultaneousRequestRouting = objc_msgSend(v5, "PKBoolForKey:", CFSTR("requiresUnifiedAccessCapableDevice"));
      objc_msgSend(v5, "PKStringForKey:", CFSTR("provisioningCredentialIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      provisioningCredentialIdentifier = v7->_provisioningCredentialIdentifier;
      v7->_provisioningCredentialIdentifier = (NSString *)v14;

    }
    self = v7;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PKPushProvisioningTarget *v4;
  PKPushProvisioningTarget *v5;
  BOOL v6;

  v4 = (PKPushProvisioningTarget *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPushProvisioningTarget isEqualToProvisioningTarget:](self, "isEqualToProvisioningTarget:", v5);

  return v6;
}

- (BOOL)isEqualToProvisioningTarget:(id)a3
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
  NSDate *creationDate;
  NSDate *v21;
  NSString *nonce;
  NSString *v23;
  void *v24;
  NSString *v25;
  _BOOL4 v26;
  void *v27;
  NSString *v28;
  _BOOL4 v29;
  void *v30;
  NSString *v31;
  _BOOL4 v32;
  char v33;
  NSString *environmentIdentifier;
  NSString *v36;
  NSDictionary *additionalProvisioningDictionary;
  NSDictionary *v38;
  NSString *verificationCode;
  NSString *v40;
  NSString *secondarySource;
  NSString *v42;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_55;
  v6 = (void *)*((_QWORD *)v4 + 4);
  v7 = self->_appleIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_54;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_55;
  }
  v11 = (void *)*((_QWORD *)v5 + 5);
  v7 = self->_provisioningCredentialIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_54;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_55;
  }
  v14 = (void *)*((_QWORD *)v5 + 6);
  v7 = self->_cardConfigurationIdentifier;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_54;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_55;
  }
  v17 = (void *)*((_QWORD *)v5 + 7);
  v7 = self->_sharingInstanceIdentifier;
  v18 = v17;
  if (v7 == v18)
  {

  }
  else
  {
    v9 = v18;
    if (!v7 || !v18)
      goto LABEL_54;
    v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_55;
  }
  creationDate = self->_creationDate;
  v21 = (NSDate *)*((_QWORD *)v5 + 8);
  if (creationDate && v21)
  {
    if ((-[NSDate isEqual:](creationDate, "isEqual:") & 1) == 0)
      goto LABEL_55;
  }
  else if (creationDate != v21)
  {
    goto LABEL_55;
  }
  nonce = self->_nonce;
  v23 = (NSString *)*((_QWORD *)v5 + 13);
  if (nonce && v23)
  {
    if ((-[NSString isEqual:](nonce, "isEqual:") & 1) == 0)
      goto LABEL_55;
  }
  else if (nonce != v23)
  {
    goto LABEL_55;
  }
  if (self->_appleIdentifierType != *((_QWORD *)v5 + 3))
    goto LABEL_55;
  v24 = (void *)*((_QWORD *)v5 + 9);
  v7 = self->_accountHash;
  v25 = v24;
  if (v7 == v25)
  {

  }
  else
  {
    v9 = v25;
    if (!v7 || !v25)
      goto LABEL_54;
    v26 = -[NSString isEqualToString:](v7, "isEqualToString:", v25);

    if (!v26)
      goto LABEL_55;
  }
  v27 = (void *)*((_QWORD *)v5 + 10);
  v7 = self->_templateIdentifier;
  v28 = v27;
  if (v7 == v28)
  {

  }
  else
  {
    v9 = v28;
    if (!v7 || !v28)
      goto LABEL_54;
    v29 = -[NSString isEqualToString:](v7, "isEqualToString:", v28);

    if (!v29)
      goto LABEL_55;
  }
  v30 = (void *)*((_QWORD *)v5 + 11);
  v7 = self->_relyingPartyIdentifier;
  v31 = v30;
  if (v7 == v31)
  {

    goto LABEL_58;
  }
  v9 = v31;
  if (!v7 || !v31)
  {
LABEL_54:

    goto LABEL_55;
  }
  v32 = -[NSString isEqualToString:](v7, "isEqualToString:", v31);

  if (!v32)
    goto LABEL_55;
LABEL_58:
  if (self->_requiresSimultaneousRequestRouting != v5[16] || self->_targetDevice != *((_QWORD *)v5 + 14))
    goto LABEL_55;
  environmentIdentifier = self->_environmentIdentifier;
  v36 = (NSString *)*((_QWORD *)v5 + 15);
  if (environmentIdentifier && v36)
  {
    if ((-[NSString isEqual:](environmentIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_55;
  }
  else if (environmentIdentifier != v36)
  {
    goto LABEL_55;
  }
  additionalProvisioningDictionary = self->_additionalProvisioningDictionary;
  v38 = (NSDictionary *)*((_QWORD *)v5 + 1);
  if (additionalProvisioningDictionary && v38)
  {
    if ((-[NSDictionary isEqual:](additionalProvisioningDictionary, "isEqual:") & 1) == 0)
      goto LABEL_55;
  }
  else if (additionalProvisioningDictionary != v38)
  {
    goto LABEL_55;
  }
  verificationCode = self->_verificationCode;
  v40 = (NSString *)*((_QWORD *)v5 + 12);
  if (verificationCode && v40)
  {
    if ((-[NSString isEqual:](verificationCode, "isEqual:") & 1) != 0)
      goto LABEL_75;
LABEL_55:
    v33 = 0;
    goto LABEL_56;
  }
  if (verificationCode != v40)
    goto LABEL_55;
LABEL_75:
  secondarySource = self->_secondarySource;
  v42 = (NSString *)*((_QWORD *)v5 + 16);
  if (secondarySource && v42)
    v33 = -[NSString isEqual:](secondarySource, "isEqual:");
  else
    v33 = secondarySource == v42;
LABEL_56:

  return v33;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_appleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_provisioningCredentialIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_cardConfigurationIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_sharingInstanceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_creationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_nonce);
  objc_msgSend(v3, "safelyAddObject:", self->_accountHash);
  objc_msgSend(v3, "safelyAddObject:", self->_templateIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_relyingPartyIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_environmentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_additionalProvisioningDictionary);
  objc_msgSend(v3, "safelyAddObject:", self->_verificationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_secondarySource);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_requiresSimultaneousRequestRouting - v4 + 32 * v4;
  v6 = self->_targetDevice - v5 + 32 * v5;
  v7 = self->_appleIdentifierType - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPushProvisioningTarget)initWithCoder:(id)a3
{
  id v4;
  PKPushProvisioningTarget *v5;
  uint64_t v6;
  NSString *appleIdentifier;
  uint64_t v8;
  NSString *provisioningCredentialIdentifier;
  uint64_t v10;
  NSString *cardConfigurationIdentifier;
  uint64_t v12;
  NSString *sharingInstanceIdentifier;
  uint64_t v14;
  NSDate *creationDate;
  uint64_t v16;
  NSString *nonce;
  uint64_t v18;
  NSString *accountHash;
  uint64_t v20;
  NSString *templateIdentifier;
  uint64_t v22;
  NSString *relyingPartyIdentifier;
  uint64_t v24;
  NSString *environmentIdentifier;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSDictionary *additionalProvisioningDictionary;
  uint64_t v32;
  NSString *verificationCode;
  uint64_t v34;
  NSString *secondarySource;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKPushProvisioningTarget;
  v5 = -[PKPushProvisioningTarget init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appleIdentifier = v5->_appleIdentifier;
    v5->_appleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningCredentialIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialIdentifier = v5->_provisioningCredentialIdentifier;
    v5->_provisioningCredentialIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardConfigurationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardConfigurationIdentifier = v5->_cardConfigurationIdentifier;
    v5->_cardConfigurationIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v16 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v16;

    v5->_appleIdentifierType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifierType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountHash"));
    v18 = objc_claimAutoreleasedReturnValue();
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    templateIdentifier = v5->_templateIdentifier;
    v5->_templateIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v22;

    v5->_requiresSimultaneousRequestRouting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresSimultaneousRequestRouting"));
    v5->_targetDevice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environmentIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    environmentIdentifier = v5->_environmentIdentifier;
    v5->_environmentIdentifier = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("additionalProvisioningDictionary"));
    v30 = objc_claimAutoreleasedReturnValue();
    additionalProvisioningDictionary = v5->_additionalProvisioningDictionary;
    v5->_additionalProvisioningDictionary = (NSDictionary *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verificationCode"));
    v32 = objc_claimAutoreleasedReturnValue();
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondarySource"));
    v34 = objc_claimAutoreleasedReturnValue();
    secondarySource = v5->_secondarySource;
    v5->_secondarySource = (NSString *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appleIdentifier;
  id v5;

  appleIdentifier = self->_appleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appleIdentifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningCredentialIdentifier, CFSTR("provisioningCredentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardConfigurationIdentifier, CFSTR("cardConfigurationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_appleIdentifierType, CFSTR("identifierType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountHash, CFSTR("accountHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_templateIdentifier, CFSTR("templateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresSimultaneousRequestRouting, CFSTR("requiresSimultaneousRequestRouting"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_targetDevice, CFSTR("targetDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environmentIdentifier, CFSTR("environmentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalProvisioningDictionary, CFSTR("additionalProvisioningDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySource, CFSTR("secondarySource"));

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appleIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_provisioningCredentialIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_cardConfigurationIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_sharingInstanceIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSDate copyWithZone:](self->_creationDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_nonce, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  *(_QWORD *)(v5 + 24) = self->_appleIdentifierType;
  v18 = -[NSString copyWithZone:](self->_accountHash, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_templateIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v20;

  v22 = -[NSString copyWithZone:](self->_relyingPartyIdentifier, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  *(_BYTE *)(v5 + 16) = self->_requiresSimultaneousRequestRouting;
  *(_QWORD *)(v5 + 112) = self->_targetDevice;
  v24 = -[NSString copy](self->_environmentIdentifier, "copy");
  v25 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v24;

  v26 = -[NSDictionary copy](self->_additionalProvisioningDictionary, "copy");
  v27 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v26;

  v28 = -[NSString copy](self->_verificationCode, "copy");
  v29 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v28;

  v30 = -[NSString copy](self->_secondarySource, "copy");
  v31 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v30;

  return (id)v5;
}

- (id)jsonRepresentation
{
  id v3;
  unint64_t appleIdentifierType;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appleIdentifier, CFSTR("identifier"));
  appleIdentifierType = self->_appleIdentifierType;
  if (appleIdentifierType > 3)
    v5 = CFSTR("signInWithApple");
  else
    v5 = off_1E2AD9830[appleIdentifierType];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardConfigurationIdentifier, CFSTR("cardConfigurationIdentifier"));
  PKW3CDateStringFromDate(self->_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("creationDate"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_provisioningCredentialIdentifier, CFSTR("provisioningCredentialIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountHash, CFSTR("accountHash"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_templateIdentifier, CFSTR("templateIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_environmentIdentifier, CFSTR("environmentIdentifier"));
  if (self->_additionalProvisioningDictionary)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (int64_t)appleIdentifierType
{
  return self->_appleIdentifierType;
}

- (void)setAppleIdentifierType:(int64_t)a3
{
  self->_appleIdentifierType = a3;
}

- (NSString)appleIdentifier
{
  return self->_appleIdentifier;
}

- (void)setAppleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)provisioningCredentialIdentifier
{
  return self->_provisioningCredentialIdentifier;
}

- (NSString)cardConfigurationIdentifier
{
  return self->_cardConfigurationIdentifier;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (void)setAccountHash:(id)a3
{
  objc_storeStrong((id *)&self->_accountHash, a3);
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, a3);
}

- (BOOL)requiresSimultaneousRequestRouting
{
  return self->_requiresSimultaneousRequestRouting;
}

- (void)setRequiresSimultaneousRequestRouting:(BOOL)a3
{
  self->_requiresSimultaneousRequestRouting = a3;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_storeStrong((id *)&self->_verificationCode, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(unint64_t)a3
{
  self->_targetDevice = a3;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void)setEnvironmentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_environmentIdentifier, a3);
}

- (NSString)secondarySource
{
  return self->_secondarySource;
}

- (void)setSecondarySource:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySource, 0);
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_appleIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalProvisioningDictionary, 0);
}

@end
