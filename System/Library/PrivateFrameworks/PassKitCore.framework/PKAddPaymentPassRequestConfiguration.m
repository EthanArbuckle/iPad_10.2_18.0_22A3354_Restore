@implementation PKAddPaymentPassRequestConfiguration

- (id)_filterWebServices:(id)a3 primaryAccountIdentifierRequired:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  _BOOL4 v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id obj;
  int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "count");
  if (!v7)
    goto LABEL_50;
  -[PKAddPaymentPassRequestConfiguration primaryAccountIdentifier](self, "primaryAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPaymentPassRequestConfiguration paymentNetwork](self, "paymentNetwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKAddPaymentPassRequestConfiguration requiresFelicaSecureElement](self, "requiresFelicaSecureElement");
  v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("HID"));
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BMAC")) & 1) == 0)
  {
    v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("SPTCC"));
    if (v8)
      goto LABEL_4;
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v12 = 1;
  if (!v8)
    goto LABEL_6;
LABEL_4:
  v13 = objc_msgSend(v8, "length") != 0;
LABEL_7:
  if ((((v13 || v10) | v12 | v11) & 1) == 0)
  {
    v6 = v6;
    goto LABEL_49;
  }
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v15 = (void *)v14;
  v41 = v12;
  v39 = v9;
  v37 = v4;
  if ((v10 | v11 | v12) != 1)
    goto LABEL_34;
  v35 = v13;
  v38 = (void *)v14;
  v36 = v8;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v16)
    goto LABEL_29;
  v17 = v16;
  v18 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v47 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      v21 = (void *)MEMORY[0x19400CFE8]();
      objc_msgSend(v20, "targetDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_27;
        v23 = objc_msgSend(v22, "felicaSecureElementIsAvailable");
      }
      else
      {
        v23 = 1;
      }
      if ((v23 & v11) == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_27;
        v23 = objc_msgSend(v22, "supportsExpressForAutomaticSelectionTechnologyType:", 2);
      }
      if ((v23 & v41) != 1)
      {
        if (!v23)
          goto LABEL_27;
LABEL_26:
        objc_msgSend(v38, "addObject:", v20);
        goto LABEL_27;
      }
      v24 = PKPaymentCredentialTypeForPaymentNetworkName(v39);
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v22, "supportsCredentialType:", v24) & 1) != 0)
        goto LABEL_26;
LABEL_27:

      objc_autoreleasePoolPop(v21);
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  }
  while (v17);
LABEL_29:

  v15 = v38;
  if (objc_msgSend(v38, "count"))
    v6 = (id)objc_msgSend(v38, "copy");
  else
    v6 = 0;
  v13 = v35;

  objc_msgSend(v38, "removeAllObjects");
  v8 = v36;
  v9 = v39;
LABEL_34:
  if (v13)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = v6;
    v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v6);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          v30 = (void *)MEMORY[0x19400CFE8]();
          objc_msgSend(v29, "targetDevice");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "paymentWebService:canProvisionPaymentPassWithPrimaryAccountIdentifier:", v29, v8);

          if (v32)
            objc_msgSend(v15, "addObject:", v29);
          objc_autoreleasePoolPop(v30);
        }
        v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v26);
    }

    if (objc_msgSend(v15, "count"))
    {
      v33 = objc_msgSend(v15, "copy");

      objc_msgSend(v15, "removeAllObjects");
      v6 = (id)v33;
      v9 = v39;
    }
    else
    {
      v9 = v39;
      if (v37)
      {

        v6 = 0;
      }
    }
  }
  v6 = v6;

LABEL_49:
  v7 = v6;
LABEL_50:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAddPaymentPassRequestConfiguration)init
{
  return -[PKAddPaymentPassRequestConfiguration initWithEncryptionScheme:](self, "initWithEncryptionScheme:", CFSTR("EV_ECC_v2"));
}

- (PKAddPaymentPassRequestConfiguration)initWithEncryptionScheme:(PKEncryptionScheme)encryptionScheme
{
  NSString *v4;
  PKAddPaymentPassRequestConfiguration *v5;
  uint64_t v6;
  NSString *v7;
  NSArray *cardDetails;
  objc_super v10;

  v4 = encryptionScheme;
  if (-[NSString length](v4, "length"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAddPaymentPassRequestConfiguration;
    v5 = -[PKAddPaymentPassRequestConfiguration init](&v10, sel_init);
    if (v5)
    {
      v6 = -[NSString copy](v4, "copy");
      v7 = v5->_encryptionScheme;
      v5->_encryptionScheme = (NSString *)v6;

      v5->_style = 0;
      cardDetails = v5->_cardDetails;
      v5->_cardDetails = (NSArray *)MEMORY[0x1E0C9AA60];

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3
{
  unint64_t v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "secureElementPassProvisioningForMAIDs") & 1) != 0)
  {
    v4 = 1;
    v5 = v7;
LABEL_5:
    self->_allowManagedAppleID = v4;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v7, "passesAllAccess");
  v5 = v7;
  if ((v6 & 1) == 0)
  {
    v4 = 2;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassRequestConfiguration;
  -[PKAddPaymentPassRequestConfiguration dealloc](&v2, sel_dealloc);
}

- (PKAddPaymentPassRequestConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddPaymentPassRequestConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *encryptionScheme;
  void *v9;
  uint64_t v10;
  NSString *cardholderName;
  void *v12;
  uint64_t v13;
  NSString *primaryAccountSuffix;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *cardDetails;
  void *v21;
  uint64_t v22;
  NSString *localizedDescription;
  void *v24;
  uint64_t v25;
  NSString *primaryAccountIdentifier;
  void *v27;
  uint64_t v28;
  NSString *paymentNetwork;
  void *v30;
  uint64_t v31;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKAddPaymentPassRequestConfiguration;
  v5 = -[PKAddPaymentPassRequestConfiguration init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionScheme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    encryptionScheme = v5->_encryptionScheme;
    v5->_encryptionScheme = (NSString *)v7;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountSuffix"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    primaryAccountSuffix = v5->_primaryAccountSuffix;
    v5->_primaryAccountSuffix = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("cardDetails"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    cardDetails = v5->_cardDetails;
    v5->_cardDetails = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentNetwork"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    paymentNetwork = v5->_paymentNetwork;
    v5->_paymentNetwork = (NSString *)v28;

    v5->_requiresFelicaSecureElement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresFelicaSecureElement"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowManagedAppleID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("true")) & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      v32 = objc_msgSend(v30, "isEqualToString:", CFSTR("false"));
      v31 = 2;
      if (!v32)
        v31 = 0;
    }
    v5->_allowManagedAppleID = v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *encryptionScheme;
  unint64_t allowManagedAppleID;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  encryptionScheme = self->_encryptionScheme;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", encryptionScheme, CFSTR("encryptionScheme"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_primaryAccountSuffix, CFSTR("primaryAccountSuffix"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_cardDetails, CFSTR("cardDetails"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_paymentNetwork, CFSTR("paymentNetwork"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_requiresFelicaSecureElement, CFSTR("requiresFelicaSecureElement"));
  allowManagedAppleID = self->_allowManagedAppleID;
  v6 = CFSTR("true");
  if (allowManagedAppleID != 1)
    v6 = 0;
  if (allowManagedAppleID == 2)
    v7 = CFSTR("false");
  else
    v7 = v6;
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("allowManagedAppleID"));

}

- (id)_effectiveDetails
{
  NSArray *v3;
  id v4;
  void *v5;
  void *v6;
  PKLabeledValue *v7;
  void *v8;
  PKLabeledValue *v9;
  void *v10;
  PKLabeledValue *v11;
  void *v12;
  void *v13;
  PKLabeledValue *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKLabeledValue *v23;
  uint64_t v24;
  void *v25;

  v3 = self->_cardDetails;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](self->_cardholderName, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = [PKLabeledValue alloc];
    PKLocalizedPaymentString(CFSTR("NAME"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKLabeledValue initWithLabel:value:](v7, "initWithLabel:value:", v8, v6);

    objc_msgSend(v4, "addObject:", v9);
  }
  -[NSString stringByTrimmingCharactersInSet:](self->_primaryAccountSuffix, "stringByTrimmingCharactersInSet:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = [PKLabeledValue alloc];
    PKLocalizedPaymentString(CFSTR("CARD_NUMBER"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKMaskedPaymentPAN((uint64_t)v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKLabeledValue initWithLabel:value:](v11, "initWithLabel:value:", v12, v13);

    objc_msgSend(v4, "addObject:", v14);
  }

  v15 = -[NSArray count](v3, "count");
  if (v15)
  {
    v16 = v15;
    for (i = 0; i != v16; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "label");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "length") && objc_msgSend(v22, "length"))
      {
        v23 = -[PKLabeledValue initWithLabel:value:]([PKLabeledValue alloc], "initWithLabel:value:", v20, v22);
        objc_msgSend(v4, "addObject:", v23);

      }
    }
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    v24 = 4;
  else
    v24 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "subarrayWithRange:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)isPaymentAccount
{
  return -[NSString isEqualToString:](self->_paymentNetwork, "isEqualToString:", CFSTR("Barcode"));
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptionScheme: '%@'; "), self->_encryptionScheme);
  if (self->_cardholderName)
    objc_msgSend(v3, "appendFormat:", CFSTR("cardholderName: '%@'; "), self->_cardholderName);
  if (self->_primaryAccountSuffix)
    objc_msgSend(v3, "appendFormat:", CFSTR("primaryAccountSuffix: '%@'; "), self->_primaryAccountSuffix);
  if (self->_localizedDescription)
    objc_msgSend(v3, "appendFormat:", CFSTR("localizedDescription: '%@'; "), self->_localizedDescription);
  if (self->_paymentNetwork)
    objc_msgSend(v3, "appendFormat:", CFSTR("paymentNetwork: '%@'; "), self->_paymentNetwork);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (PKEncryptionScheme)encryptionScheme
{
  return self->_encryptionScheme;
}

- (PKAddPaymentPassStyle)style
{
  return self->_style;
}

- (void)setStyle:(PKAddPaymentPassStyle)style
{
  self->_style = style;
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(NSString *)cardholderName
{
  objc_setProperty_nonatomic_copy(self, a2, cardholderName, 32);
}

- (NSString)primaryAccountSuffix
{
  return self->_primaryAccountSuffix;
}

- (void)setPrimaryAccountSuffix:(NSString *)primaryAccountSuffix
{
  objc_setProperty_nonatomic_copy(self, a2, primaryAccountSuffix, 40);
}

- (NSArray)cardDetails
{
  return self->_cardDetails;
}

- (void)setCardDetails:(NSArray *)cardDetails
{
  objc_setProperty_nonatomic_copy(self, a2, cardDetails, 48);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  objc_setProperty_nonatomic_copy(self, a2, localizedDescription, 56);
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, primaryAccountIdentifier, 64);
}

- (PKPaymentNetwork)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(PKPaymentNetwork)paymentNetwork
{
  objc_setProperty_nonatomic_copy(self, a2, paymentNetwork, 72);
}

- (NSSet)productIdentifiers
{
  return self->_productIdentifiers;
}

- (void)setProductIdentifiers:(NSSet *)productIdentifiers
{
  objc_setProperty_nonatomic_copy(self, a2, productIdentifiers, 80);
}

- (BOOL)requiresFelicaSecureElement
{
  return self->_requiresFelicaSecureElement;
}

- (void)setRequiresFelicaSecureElement:(BOOL)requiresFelicaSecureElement
{
  self->_requiresFelicaSecureElement = requiresFelicaSecureElement;
}

- (unint64_t)allowManagedAppleID
{
  return self->_allowManagedAppleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_cardDetails, 0);
  objc_storeStrong((id *)&self->_primaryAccountSuffix, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end
