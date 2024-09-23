@implementation PKPaymentCredential

- (PKPaymentCredential)init
{
  PKPaymentCredential *v2;
  PKSecureElementProvisioningState *v3;
  PKSecureElementProvisioningState *state;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentCredential;
  v2 = -[PKPaymentCredential init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKSecureElementProvisioningState);
    state = v2->_state;
    v2->_state = v3;

  }
  return v2;
}

- (PKPaymentCredential)initWithCoder:(id)a3
{
  id v4;
  PKPaymentCredential *v5;
  uint64_t v6;
  NSString *sanitizedPrimaryAccountNumber;
  uint64_t v8;
  NSString *sanitizedPrimaryAccountName;
  uint64_t v10;
  NSString *expiration;
  uint64_t v12;
  NSString *longDescription;
  uint64_t v14;
  NSString *secureElementReservationGroupIdentifier;
  uint64_t v16;
  PKSecureElementProvisioningState *state;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentCredential;
  v5 = -[PKPaymentCredential init](&v19, sel_init);
  if (v5)
  {
    v5->_credentialType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedPrimaryAccountNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    sanitizedPrimaryAccountNumber = v5->_sanitizedPrimaryAccountNumber;
    v5->_sanitizedPrimaryAccountNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedPrimaryAccountName"));
    v8 = objc_claimAutoreleasedReturnValue();
    sanitizedPrimaryAccountName = v5->_sanitizedPrimaryAccountName;
    v5->_sanitizedPrimaryAccountName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
    v10 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    longDescription = v5->_longDescription;
    v5->_longDescription = (NSString *)v12;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    v5->_deletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementReservationGroupIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    secureElementReservationGroupIdentifier = v5->_secureElementReservationGroupIdentifier;
    v5->_secureElementReservationGroupIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v16 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (PKSecureElementProvisioningState *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t credentialType;
  id v5;

  credentialType = self->_credentialType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", credentialType, CFSTR("credentialType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedPrimaryAccountNumber, CFSTR("sanitizedPrimaryAccountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedPrimaryAccountName, CFSTR("sanitizedPrimaryAccountName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longDescription, CFSTR("longDescription"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deletable, CFSTR("isDeletable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementReservationGroupIdentifier, CFSTR("secureElementReservationGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentCredential *v4;
  BOOL v5;

  v4 = (PKPaymentCredential *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PKPaymentCredential _isEqualToCredential:](self, "_isEqualToCredential:", v4);
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
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
  NSArray *metadata;
  NSArray *v21;
  char v22;

  v4 = a3;
  v5 = (void *)v4[6];
  v6 = self->_longDescription;
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
      goto LABEL_33;
  }
  if (self->_deletable != *((unsigned __int8 *)v4 + 8))
    goto LABEL_33;
  v11 = (void *)v4[5];
  v6 = self->_expiration;
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
      goto LABEL_33;
  }
  v14 = (void *)v4[3];
  v6 = self->_sanitizedPrimaryAccountNumber;
  v15 = v14;
  if (v6 == v15)
  {

    goto LABEL_23;
  }
  v8 = v15;
  if (!v6 || !v15)
  {
LABEL_7:

LABEL_33:
    v22 = 0;
    goto LABEL_34;
  }
  v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

  if (!v16)
    goto LABEL_33;
LABEL_23:
  v17 = (void *)v4[4];
  v6 = self->_sanitizedPrimaryAccountName;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_29;
  }
  v8 = v18;
  if (!v6 || !v18)
    goto LABEL_7;
  v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

  if (!v19)
    goto LABEL_33;
LABEL_29:
  if (self->_cardType != v4[7])
    goto LABEL_33;
  metadata = self->_metadata;
  v21 = (NSArray *)v4[8];
  if (metadata && v21)
    v22 = -[NSArray isEqual:](metadata, "isEqual:");
  else
    v22 = metadata == v21;
LABEL_34:

  return v22;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_longDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_expiration);
  objc_msgSend(v3, "safelyAddObject:", self->_sanitizedPrimaryAccountNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_metadata);
  objc_msgSend(v3, "safelyAddObject:", self->_sanitizedPrimaryAccountName);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardType - v4 + 32 * v4;
  v6 = self->_deletable - v5 + 32 * v5;

  return v6;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  return 0;
}

- (id)setupProductIdentifier
{
  return 0;
}

- (NSArray)appletTypes
{
  void *v2;
  void *v3;

  -[PKPaymentCredential paymentApplications](self, "paymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_arrayByApplyingBlock:", &__block_literal_global_84);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __34__PKPaymentCredential_appletTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appletTypeIdentifier");
}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return -[PKSecureElementProvisioningState requirementsResponse](self->_state, "requirementsResponse");
}

- (void)setRequirementsResponse:(id)a3
{
  -[PKSecureElementProvisioningState setRequirementsResponse:](self->_state, "setRequirementsResponse:", a3);
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return -[PKSecureElementProvisioningState eligibilityResponse](self->_state, "eligibilityResponse");
}

- (void)setEligibilityResponse:(id)a3
{
  -[PKSecureElementProvisioningState setEligibilityResponse:](self->_state, "setEligibilityResponse:", a3);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sanitizedPrimaryAccountName
{
  return self->_sanitizedPrimaryAccountName;
}

- (void)setSanitizedPrimaryAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (void)setDeletable:(BOOL)a3
{
  self->_deletable = a3;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)couldSupportSuperEasyProvisioning
{
  return self->_couldSupportSuperEasyProvisioning;
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplications, a3);
}

- (void)setAppletTypes:(id)a3
{
  objc_storeStrong((id *)&self->_appletTypes, a3);
}

- (NSString)secureElementReservationGroupIdentifier
{
  return self->_secureElementReservationGroupIdentifier;
}

- (void)setSecureElementReservationGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, a3);
}

- (PKSecureElementProvisioningState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_appletTypes, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountName, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
}

- (BOOL)isRemoteCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)remoteCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isRemoteCredential](self, "isRemoteCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isPrecursorCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)precursorCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isPrecursorCredential](self, "isPrecursorCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isLocalPassCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)localPassCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isLocalPassCredential](self, "isLocalPassCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isPeerPaymentCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)peerPaymentCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isPeerPaymentCredential](self, "isPeerPaymentCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isContactlessProductCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)contactlessProductCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isContactlessProductCredential](self, "isContactlessProductCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isDigitalIssuanceProductCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)digitalIssuanceProductCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isDigitalIssuanceProductCredential](self, "isDigitalIssuanceProductCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isPurchasedProductCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)purchasedProductCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isPurchasedProductCredential](self, "isPurchasedProductCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isAccountCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isAccountCredential](self, "isAccountCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isAccountReferenceCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountReferenceCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isAccountReferenceCredential](self, "isAccountReferenceCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isShareableCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)shareableCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isShareableCredential](self, "isShareableCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isIdentityCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)identityCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isIdentityCredential](self, "isIdentityCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isLocalAppletSubcredentialPassCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)localAppletSubcredentialPassCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isLocalAppletSubcredentialPassCredential](self, "isLocalAppletSubcredentialPassCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isIssuerProvisioningExtensionCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)issuerProvisioningExtensionCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isIssuerProvisioningExtensionCredential](self, "isIssuerProvisioningExtensionCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isHomeKeyCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)homeKeyCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isHomeKeyCredential](self, "isHomeKeyCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isSafariCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)safariCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isSafariCredential](self, "isSafariCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isCarKeyTerminalPairingCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)carKeyTerminalPairingCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isCarKeyTerminalPairingCredential](self, "isCarKeyTerminalPairingCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)_originalProvisioningDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[PKPaymentCredential isRemoteCredential](self, "isRemoteCredential"))
  {
    if (!-[PKPaymentCredential isAccountCredential](self, "isAccountCredential"))
    {
      if (-[PKPaymentCredential isPeerPaymentCredential](self, "isPeerPaymentCredential"))
      {
        -[PKPaymentCredential peerPaymentCredential](self, "peerPaymentCredential");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v3 = v5;
        objc_msgSend(v5, "account");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "createdDate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      if (!-[PKPaymentCredential isAccountCredential](self, "isAccountCredential"))
      {
        v4 = 0;
        return v4;
      }
    }
    -[PKPaymentCredential accountCredential](self, "accountCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[PKPaymentCredential remoteCredential](self, "remoteCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalProvisioningDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v4;
}

- (int64_t)compare:(id)a3 withBackedUpDefaultPaymentPassSerialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  int64_t v14;
  void *v16;
  void *v17;
  char v18;
  int v19;
  int v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  unsigned int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;

  v6 = a3;
  v7 = a4;
  -[PKPaymentCredential remoteCredential](self, "remoteCredential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if ((v10 & 1) != 0)
    goto LABEL_3;
  -[PKPaymentCredential underlyingPaymentPass](self, "underlyingPaymentPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v7);

  if ((v13 & 1) != 0)
    goto LABEL_3;
  objc_msgSend(v6, "remoteCredential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serialNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", v7);

  if ((v18 & 1) != 0)
  {
LABEL_6:
    v14 = 1;
    goto LABEL_4;
  }
  v19 = __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(self);
  v20 = __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(v6);
  if (!v19)
  {
    if (v20)
      goto LABEL_6;
    v26 = -[PKPaymentCredential isPurchasedProductCredential](self, "isPurchasedProductCredential");
    v27 = objc_msgSend(v6, "isPurchasedProductCredential");
    if (v26)
    {
      if (!v27)
        goto LABEL_3;
      -[PKPaymentCredential purchasedProductCredential](self, "purchasedProductCredential");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "purchasedProductCredential");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "purchase");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "purchaseDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "purchase");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "purchaseDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v31, "compare:", v33);

      goto LABEL_18;
    }
    if ((v27 & 1) != 0)
      goto LABEL_6;
    v36 = -[PKPaymentCredential isIssuerProvisioningExtensionCredential](self, "isIssuerProvisioningExtensionCredential");
    v37 = objc_msgSend(v6, "isIssuerProvisioningExtensionCredential");
    if (!v36)
    {
      if ((v37 & 1) != 0)
        goto LABEL_6;
      v41 = -[PKPaymentCredential isSafariCredential](self, "isSafariCredential");
      v42 = objc_msgSend(v6, "isSafariCredential");
      if (!v41)
      {
        v14 = v42;
        goto LABEL_4;
      }
      if (!v42)
        goto LABEL_3;
      -[PKPaymentCredential longDescription](self, "longDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "longDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v28, "compare:", v29);
LABEL_19:

      goto LABEL_4;
    }
    if (!v37)
      goto LABEL_3;
    -[PKPaymentCredential issuerProvisioningExtensionCredential](self, "issuerProvisioningExtensionCredential");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "issuerProvisioningExtensionCredential");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "entry");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "entry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "title");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v38 && v39)
    {
      v14 = objc_msgSend(v38, "compare:", v39);
    }
    else
    {
      v14 = v39 != 0;
      if (v38)
      {
        v14 = -1;
        goto LABEL_60;
      }
    }
    if (!v14)
    {
      objc_msgSend(v30, "addRequestConfiguration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "primaryAccountSuffix");
      v44 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v44;
      objc_msgSend(v31, "addRequestConfiguration");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "primaryAccountSuffix");
      v46 = objc_claimAutoreleasedReturnValue();

      if (v38 && v46)
      {
        v14 = objc_msgSend(v38, "compare:", v46);
      }
      else
      {
        v14 = v46 != 0;
        if (v38)
        {
          v14 = -1;
LABEL_59:
          v40 = (void *)v46;
          goto LABEL_60;
        }
      }
      if (!v14)
      {
        if (v28 > v29)
          v14 = -1;
        else
          v14 = v28 < v29;
      }
      goto LABEL_59;
    }
LABEL_60:

LABEL_18:
    goto LABEL_19;
  }
  if (!v20)
    goto LABEL_3;
  v21 = -[PKPaymentCredential cardType](self, "cardType");
  v22 = objc_msgSend(v6, "cardType");
  if (v21 == v22)
    goto LABEL_10;
  if (v21 && v22)
  {
    if (v21 >= v22)
    {
      if (v21 > v22)
        goto LABEL_6;
LABEL_10:
      -[PKPaymentCredential _originalProvisioningDate](self, "_originalProvisioningDate");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_originalProvisioningDate");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v23 && v24)
      {
        v14 = objc_msgSend((id)v23, "compare:", v24);
        if (v14)
        {
LABEL_30:

          goto LABEL_4;
        }
      }
      else
      {
        if (v23)
          v14 = -1;
        else
          v14 = 1;
        if (v23 | v24)
          goto LABEL_30;
      }
      -[PKPaymentCredential longDescription](self, "longDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "longDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v34, "compare:", v35);

      goto LABEL_30;
    }
LABEL_3:
    v14 = -1;
    goto LABEL_4;
  }
  if (v21)
    v14 = -1;
  else
    v14 = 1;
  if (!(v22 | v21))
    goto LABEL_10;
LABEL_4:

  return v14;
}

uint64_t __112__PKPaymentCredential_PKPaymentCredentialSubclassAdditions__compare_withBackedUpDefaultPaymentPassSerialNumber___block_invoke(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isRemoteCredential") & 1) != 0
    || (objc_msgSend(v1, "isAccountCredential") & 1) != 0
    || (objc_msgSend(v1, "isPeerPaymentCredential") & 1) != 0
    || (objc_msgSend(v1, "isAppleBalanceCredential") & 1) != 0
    || (objc_msgSend(v1, "isShareableCredential") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isHomeKeyCredential");
  }

  return v2;
}

- (id)underlyingPaymentPass
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PKPaymentCredential isRemoteCredential](self, "isRemoteCredential"))
  {
    -[PKPaymentCredential remoteCredential](self, "remoteCredential");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v6 = v3;
    objc_msgSend(v3, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!-[PKPaymentCredential isPeerPaymentCredential](self, "isPeerPaymentCredential"))
  {
    if (-[PKPaymentCredential isLocalAppletSubcredentialPassCredential](self, "isLocalAppletSubcredentialPassCredential"))
    {
      -[PKPaymentCredential localAppletSubcredentialPassCredential](self, "localAppletSubcredentialPassCredential");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[PKPaymentCredential isHomeKeyCredential](self, "isHomeKeyCredential"))
    {
      -[PKPaymentCredential homeKeyCredential](self, "homeKeyCredential");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[PKPaymentCredential isLocalPassCredential](self, "isLocalPassCredential"))
    {
      -[PKPaymentCredential localPassCredential](self, "localPassCredential");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (-[PKPaymentCredential isAccountCredential](self, "isAccountCredential"))
    {
      -[PKPaymentCredential accountCredential](self, "accountCredential");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[PKPaymentCredential isPrecursorCredential](self, "isPrecursorCredential"))
      {
        v8 = 0;
        return v8;
      }
      -[PKPaymentCredential precursorCredential](self, "precursorCredential");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  -[PKPaymentCredential peerPaymentCredential](self, "peerPaymentCredential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedPassUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passWithUniqueID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v8;
}

- (BOOL)isAppleBalanceCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)appleBalanceCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isAppleBalanceCredential](self, "isAppleBalanceCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isStatefulTransferCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)statefulTransferCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isStatefulTransferCredential](self, "isStatefulTransferCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isExternalOfferCredential
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)externalOfferCredential
{
  PKPaymentCredential *v3;

  if (-[PKPaymentCredential isExternalOfferCredential](self, "isExternalOfferCredential"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (id)fakeRemoteCredentials
{
  void *v2;
  PKPaymentRemoteCredential *v3;
  PKPaymentRemoteCredential *v4;
  PKPaymentRemoteCredential *v5;
  PKPaymentRemoteCredential *v6;
  PKPaymentRemoteCredential *v7;
  PKPaymentRemoteCredential *v8;
  PKPaymentRemoteCredential *v9;
  PKPaymentRemoteCredential *v10;
  PKPaymentRemoteCredential *v11;
  PKPaymentRemoteCredential *v12;
  void *v13;
  PKPaymentRemoteCredential *v14;
  PKPaymentRemoteCredential *v15;
  PKPaymentRemoteCredential *v16;
  void *v17;
  void *v18;
  int i;
  void *v20;
  PKPaymentRemoteCredential *v21;
  void *v22;
  PKPaymentRemoteCredential *v23;
  PKAccount *v24;
  id v25;
  void *v26;
  void *v27;
  PKPaymentRemoteCredential *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  PKAccountCredential *v37;
  PKPaymentRemoteCredential *v38;
  void *v39;
  PKPaymentRemoteCredential *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[7];
  _QWORD v52[7];
  _QWORD v53[11];
  _QWORD v54[11];
  _QWORD v55[11];
  _QWORD v56[11];
  _QWORD v57[10];
  _QWORD v58[10];
  _QWORD v59[9];
  _QWORD v60[9];
  _QWORD v61[9];
  _QWORD v62[9];
  _QWORD v63[9];
  _QWORD v64[11];

  v64[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = CFSTR("identifier");
  v63[1] = CFSTR("status");
  v64[0] = CFSTR("1234");
  v64[1] = &unk_1E2C3EEA8;
  v63[2] = CFSTR("cardType");
  v63[3] = CFSTR("sanitizedPrimaryAccountNumber");
  v64[2] = &unk_1E2C3EEC0;
  v64[3] = CFSTR("1234");
  v63[4] = CFSTR("expiration");
  v63[5] = CFSTR("longDescription");
  v64[4] = CFSTR("12/34");
  v64[5] = CFSTR("Suica Card - Available");
  v63[6] = CFSTR("summaryMetadata");
  v63[7] = CFSTR("paymentCardType");
  v64[6] = &unk_1E2C3E0C8;
  v64[7] = CFSTR("transit");
  v63[8] = CFSTR("metadata");
  v64[8] = &unk_1E2C3E0E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v45);
  objc_msgSend(v2, "addObject:", v3);

  v61[0] = CFSTR("identifier");
  v61[1] = CFSTR("status");
  v62[0] = CFSTR("5678");
  v62[1] = &unk_1E2C3EEA8;
  v61[2] = CFSTR("cardType");
  v61[3] = CFSTR("paymentCardType");
  v62[2] = &unk_1E2C3EEC0;
  v62[3] = CFSTR("transit");
  v61[4] = CFSTR("sanitizedPrimaryAccountNumber");
  v61[5] = CFSTR("expiration");
  v62[4] = CFSTR("5678");
  v62[5] = CFSTR("12/30");
  v61[6] = CFSTR("longDescription");
  v61[7] = CFSTR("summaryMetadata");
  v62[6] = CFSTR("Suica Card - Available");
  v62[7] = &unk_1E2C3E0F8;
  v61[8] = CFSTR("metadata");
  v62[8] = &unk_1E2C3E110;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v44);
  objc_msgSend(v2, "addObject:", v4);

  v59[0] = CFSTR("identifier");
  v59[1] = CFSTR("status");
  v60[0] = CFSTR("1999");
  v60[1] = &unk_1E2C3EED8;
  v59[2] = CFSTR("cardType");
  v59[3] = CFSTR("sanitizedPrimaryAccountNumber");
  v60[2] = &unk_1E2C3EEC0;
  v60[3] = CFSTR("1999");
  v59[4] = CFSTR("expiration");
  v59[5] = CFSTR("longDescription");
  v60[4] = CFSTR("12/30");
  v60[5] = CFSTR("Suica Card - Already Provisioned");
  v59[6] = CFSTR("summaryMetadata");
  v59[7] = CFSTR("paymentCardType");
  v60[6] = &unk_1E2C3E128;
  v60[7] = CFSTR("transit");
  v59[8] = CFSTR("metadata");
  v60[8] = &unk_1E2C3E140;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v43);
  objc_msgSend(v2, "addObject:", v5);

  v57[0] = CFSTR("identifier");
  v57[1] = CFSTR("status");
  v58[0] = CFSTR("2999");
  v58[1] = &unk_1E2C3EEF0;
  v57[2] = CFSTR("cardType");
  v57[3] = CFSTR("sanitizedPrimaryAccountNumber");
  v58[2] = &unk_1E2C3EEC0;
  v58[3] = CFSTR("8888");
  v57[4] = CFSTR("expiration");
  v57[5] = CFSTR("longDescription");
  v58[4] = CFSTR("12/32");
  v58[5] = CFSTR("Suica Card - Blacklisted");
  v57[6] = CFSTR("statusDescription");
  v57[7] = CFSTR("summaryMetadata");
  v58[6] = CFSTR("It is not possible to add this card at the moment. It will be available in within 24 hours.");
  v58[7] = &unk_1E2C3E158;
  v57[8] = CFSTR("paymentCardType");
  v57[9] = CFSTR("metadata");
  v58[8] = CFSTR("transit");
  v58[9] = &unk_1E2C3E170;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v42);
  objc_msgSend(v2, "addObject:", v6);

  v55[0] = CFSTR("identifier");
  v55[1] = CFSTR("status");
  v56[0] = CFSTR("29999");
  v56[1] = &unk_1E2C3EF08;
  v55[2] = CFSTR("cardType");
  v55[3] = CFSTR("sanitizedPrimaryAccountNumber");
  v56[2] = &unk_1E2C3EEC0;
  v56[3] = CFSTR("8888");
  v55[4] = CFSTR("expiration");
  v55[5] = CFSTR("longDescription");
  v56[4] = CFSTR("12/32");
  v56[5] = CFSTR("Suica Card - Transfer");
  v55[6] = CFSTR("statusDescription");
  v55[7] = CFSTR("summaryMetadata");
  v56[6] = CFSTR("It is not possible to add this card at the moment. It will be available in within 24 hours.");
  v56[7] = &unk_1E2C3E188;
  v55[8] = CFSTR("metadata");
  v55[9] = CFSTR("paymentCardType");
  v56[8] = &unk_1E2C3E1A0;
  v56[9] = CFSTR("transit");
  v55[10] = CFSTR("transferableFromDevices");
  v56[10] = &unk_1E2C3E1B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v41);
  objc_msgSend(v2, "addObject:");
  v53[0] = CFSTR("identifier");
  v53[1] = CFSTR("status");
  v54[0] = CFSTR("299399");
  v54[1] = &unk_1E2C3EF08;
  v53[2] = CFSTR("cardType");
  v53[3] = CFSTR("sanitizedPrimaryAccountNumber");
  v54[2] = &unk_1E2C3EEC0;
  v54[3] = CFSTR("8388");
  v53[4] = CFSTR("expiration");
  v53[5] = CFSTR("longDescription");
  v54[4] = CFSTR("12/32");
  v54[5] = CFSTR("Suica Card2 - Transfer");
  v53[6] = CFSTR("statusDescription");
  v53[7] = CFSTR("summaryMetadata");
  v54[6] = CFSTR("It is not possible to add this card at the moment. It will be available in within 24 hours.");
  v54[7] = &unk_1E2C3E188;
  v53[8] = CFSTR("metadata");
  v53[9] = CFSTR("paymentCardType");
  v54[8] = &unk_1E2C3E1A0;
  v54[9] = CFSTR("transit");
  v53[10] = CFSTR("transferableFromDevices");
  v54[10] = &unk_1E2C3E1D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v39);
  objc_msgSend(v2, "addObject:");
  v7 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40A58);
  objc_msgSend(v2, "addObject:", v7);

  v8 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40A80);
  objc_msgSend(v2, "addObject:", v8);

  v9 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40AA8);
  objc_msgSend(v2, "addObject:", v9);

  v10 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40AD0);
  objc_msgSend(v2, "addObject:", v10);

  v11 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40AF8);
  objc_msgSend(v2, "addObject:", v11);

  v12 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40B20);
  objc_msgSend(v2, "addObject:", v12);

  v13 = (void *)objc_msgSend(&unk_1E2C40B20, "mutableCopy");
  v14 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40B48);
  objc_msgSend(v2, "addObject:", v14);

  v15 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40B70);
  objc_msgSend(v2, "addObject:", v15);

  v16 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", &unk_1E2C40B98);
  v17 = v2;
  objc_msgSend(v2, "addObject:", v16);

  v18 = 0;
  for (i = 0; i != 5; ++i)
  {
    v20 = v18;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), (i + 10000));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("identifier"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("sanitizedPrimaryAccountNumber"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("sanitizedPrimaryAccountNumber"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("sanitizedPrimaryAccountPrefix"));
    v21 = [PKPaymentRemoteCredential alloc];
    v22 = (void *)objc_msgSend(v13, "copy");
    v23 = -[PKPaymentRemoteCredential initWithDictionary:](v21, "initWithDictionary:", v22);
    objc_msgSend(v17, "addObject:", v23);

  }
  v24 = objc_alloc_init(PKAccount);
  -[PKAccount setFeature:](v24, "setFeature:", 2);
  v25 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount setAccountIdentifier:](v24, "setAccountIdentifier:", v26);

  v37 = -[PKAccountCredential initWithAccount:]([PKAccountCredential alloc], "initWithAccount:", v24);
  objc_msgSend(v17, "addObject:");
  v51[0] = CFSTR("identifier");
  v51[1] = CFSTR("status");
  v52[0] = CFSTR("909090");
  v52[1] = &unk_1E2C3EEA8;
  v51[2] = CFSTR("cardType");
  v51[3] = CFSTR("longDescription");
  v52[2] = &unk_1E2C3EF98;
  v52[3] = CFSTR("Apple Account");
  v51[4] = CFSTR("sanitizedPrimaryAccountNumber");
  v51[5] = CFSTR("paymentCardType");
  v52[4] = CFSTR("1234");
  v52[5] = CFSTR("payment");
  v51[6] = CFSTR("summaryMetadata");
  v52[6] = &unk_1E2C3E1E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PKPaymentRemoteCredential initWithDictionary:]([PKPaymentRemoteCredential alloc], "initWithDictionary:", v27);
  objc_msgSend(v17, "addObject:", v28);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = v17;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v47;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v34), "setDeletable:", ((v32 + v34) & 1) == 0);
        ++v34;
      }
      while (v31 != v34);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v32 += v34;
    }
    while (v31);
  }

  v35 = (void *)objc_msgSend(v29, "copy");
  return v35;
}

@end
