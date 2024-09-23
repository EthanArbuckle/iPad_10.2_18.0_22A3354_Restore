@implementation PKPaymentMethod

+ (PKPaymentMethod)paymentMethodWithProtobuf:(id)a3
{
  id v3;
  PKPaymentMethod *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentMethod);
  objc_msgSend(v3, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMethod setNetwork:](v4, "setNetwork:", v5);

  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMethod setDisplayName:](v4, "setDisplayName:", v6);

  LODWORD(v6) = objc_msgSend(v3, "type");
  -[PKPaymentMethod setType:](v4, "setType:", v6);
  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentMethod *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PKProtobufPaymentMethod);
  -[PKPaymentMethod displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMethod setDisplayName:](v3, "setDisplayName:", v4);

  -[PKPaymentMethod network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentMethod setNetwork:](v3, "setNetwork:", v5);

  -[PKProtobufPaymentMethod setType:](v3, "setType:", -[PKPaymentMethod type](self, "type"));
  return v3;
}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentMethod)initWithPaymentPass:(id)a3 obfuscateNetworks:(BOOL)a4
{
  return -[PKPaymentMethod initWithPaymentPass:paymentApplication:obfuscateNetworks:](self, "initWithPaymentPass:paymentApplication:obfuscateNetworks:", a3, 0, a4);
}

- (PKPaymentMethod)initWithPaymentPass:(id)a3 paymentApplication:(id)a4 obfuscateNetworks:(BOOL)a5
{
  id v8;
  id v9;
  PKPaymentMethod *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSString *network;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  NSString *displayName;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentMethod;
  v10 = -[PKPaymentMethod init](&v21, sel_init);
  if (v10)
  {
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v8, "devicePrimaryInAppPaymentApplication");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v10->_type = objc_msgSend(v11, "paymentType");
    if (a5)
      goto LABEL_12;
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v12, "paymentNetworkIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    network = v10->_network;
    v10->_network = (NSString *)v13;

    objc_msgSend(v8, "primaryAccountNumberSuffix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dpanSuffix");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10->_network, v15);
    }
    else
    {
      if (!v16)
      {
        v18 = v10->_network;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v10->_network, v16);
    }
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    displayName = v10->_displayName;
    v10->_displayName = v18;

LABEL_12:
  }

  return v10;
}

- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3
{
  id v4;
  void *v5;
  PKPaymentMethod *v6;

  v4 = a3;
  objc_msgSend(v4, "primaryPaymentApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentMethod initWithRemotePaymentInstrument:paymentApplication:](self, "initWithRemotePaymentInstrument:paymentApplication:", v4, v5);

  return v6;
}

- (PKPaymentMethod)initWithRemotePaymentInstrument:(id)a3 paymentApplication:(id)a4
{
  id v5;
  PKPaymentMethod *v6;
  objc_super v8;

  v5 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentMethod;
  v6 = -[PKPaymentMethod init](&v8, sel_init);
  if (v6)
    v6->_type = objc_msgSend(v5, "paymentType");

  return v6;
}

- (PKPaymentMethod)initWithPeerPaymentQuote:(id)a3
{
  id v4;
  PKPaymentMethod *v5;
  uint64_t v6;
  NSString *peerPaymentQuoteIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  v5 = -[PKPaymentMethod init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    peerPaymentQuoteIdentifier = v5->_peerPaymentQuoteIdentifier;
    v5->_peerPaymentQuoteIdentifier = (NSString *)v6;

  }
  return v5;
}

- (PKPaymentMethod)initWithBindToken:(id)a3
{
  id v4;
  PKPaymentMethod *v5;
  uint64_t v6;
  NSString *bindToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  v5 = -[PKPaymentMethod init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bindToken = v5->_bindToken;
    v5->_bindToken = (NSString *)v6;

  }
  return v5;
}

- (PKPaymentMethod)initWithBankAccount:(id)a3
{
  id v5;
  PKPaymentMethod *v6;
  PKPaymentMethod *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethod;
  v6 = -[PKPaymentMethod init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bankAccount, a3);

  return v7;
}

- (PKPaymentMethod)initWithPayLaterAccount:(id)a3 primaryAccountNumberSuffix:(id)a4 obfuscateNetworks:(BOOL)a5
{
  id v8;
  id v9;
  PKPaymentMethod *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *network;
  NSString *v15;
  NSString *displayName;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentMethod;
  v10 = -[PKPaymentMethod init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "payLaterDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_type = objc_msgSend(v11, "paymentType");

    if (!a5)
    {
      objc_msgSend(v8, "payLaterDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v12, "cardNetwork"));
      v13 = objc_claimAutoreleasedReturnValue();
      network = v10->_network;
      v10->_network = (NSString *)v13;

      if (v9)
        v15 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v10->_network, v9);
      else
        v15 = v10->_network;
      displayName = v10->_displayName;
      v10->_displayName = v15;

    }
  }

  return v10;
}

- (PKPaymentPass)paymentPass
{
  return -[PKPass paymentPass](self->_secureElementPass, "paymentPass");
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementPass, a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v14 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[PKPaymentMethod type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("type"));

  -[PKPaymentMethod displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[PKPaymentMethod network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("network"));

  -[PKPaymentMethod secureElementPass](self, "secureElementPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("paymentPass"));

  -[PKPaymentMethod remoteInstrument](self, "remoteInstrument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("remoteInstrument"));

  -[PKPaymentMethod peerPaymentQuoteIdentifier](self, "peerPaymentQuoteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("peerPaymentQuoteIdentifier"));

  -[PKPaymentMethod billingAddress](self, "billingAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("billingAddress"));

  -[PKPaymentMethod bindToken](self, "bindToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("installmentBindToken"));

  -[PKPaymentMethod bankAccount](self, "bankAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("bankAccount"));

  objc_msgSend(v14, "encodeBool:forKey:", -[PKPaymentMethod usePeerPaymentBalance](self, "usePeerPaymentBalance"), CFSTR("usePeerPaymentBalance"));
}

- (PKPaymentMethod)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMethod *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentMethod;
  v5 = -[PKPaymentMethod init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setType:](v5, "setType:", objc_msgSend(v6, "unsignedIntegerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setDisplayName:](v5, "setDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("network"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setNetwork:](v5, "setNetwork:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("paymentPass"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setSecureElementPass:](v5, "setSecureElementPass:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteInstrument"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setRemoteInstrument:](v5, "setRemoteInstrument:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentQuoteIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setPeerPaymentQuoteIdentifier:](v5, "setPeerPaymentQuoteIdentifier:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setBillingAddress:](v5, "setBillingAddress:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentBindToken"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setBindToken:](v5, "setBindToken:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentMethod setBankAccount:](v5, "setBankAccount:", v17);

    -[PKPaymentMethod setUsePeerPaymentBalance:](v5, "setUsePeerPaymentBalance:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePeerPaymentBalance")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentMethod *v5;
  uint64_t v6;
  NSString *network;
  uint64_t v8;
  NSString *displayName;

  v5 = -[PKPaymentMethod init](+[PKPaymentMethod allocWithZone:](PKPaymentMethod, "allocWithZone:"), "init");
  v5->_type = self->_type;
  v6 = -[NSString copyWithZone:](self->_network, "copyWithZone:", a3);
  network = v5->_network;
  v5->_network = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *network;
  NSString *displayName;
  PKSecureElementPass *secureElementPass;
  void *v8;
  PKRemotePaymentInstrument *remoteInstrument;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  network = self->_network;
  if (network)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", network, CFSTR("network"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", displayName, CFSTR("displayName"));
  secureElementPass = self->_secureElementPass;
  if (secureElementPass)
  {
    -[PKSecureElementPass dictionaryWithValuesForKeys:](secureElementPass, "dictionaryWithValuesForKeys:", &unk_1E2C3E7D0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("paymentPass"));
LABEL_9:

    goto LABEL_10;
  }
  remoteInstrument = self->_remoteInstrument;
  if (remoteInstrument)
  {
    v19[0] = CFSTR("primaryAccountIdentifier");
    -[PKRemotePaymentInstrument primaryAccountIdentifier](remoteInstrument, "primaryAccountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v19[1] = CFSTR("primaryAccountNumberSuffix");
    -[PKRemotePaymentInstrument primaryAccountNumberSuffix](self->_remoteInstrument, "primaryAccountNumberSuffix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    v19[2] = CFSTR("deviceAccountIdentifier");
    -[PKRemotePaymentInstrument primaryPaymentApplication](self->_remoteInstrument, "primaryPaymentApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dpanIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v12;
    v19[3] = CFSTR("deviceAccountNumberSuffix");
    -[PKRemotePaymentInstrument primaryPaymentApplication](self->_remoteInstrument, "primaryPaymentApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dpanSuffix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("paymentPass"));

    goto LABEL_9;
  }
  if (self->_peerPaymentQuoteIdentifier || self->_bankAccount)
    objc_msgSend(v4, "setObject:forKeyedSubscript:");
LABEL_10:
  v16 = CFSTR("Debit");
  switch(self->_type)
  {
    case 0uLL:
      goto LABEL_17;
    case 1uLL:
      goto LABEL_16;
    case 2uLL:
      v16 = CFSTR("Credit");
      goto LABEL_16;
    case 3uLL:
      v16 = CFSTR("Prepaid");
      goto LABEL_16;
    case 4uLL:
      v16 = CFSTR("Store");
      goto LABEL_16;
    case 5uLL:
      v16 = CFSTR("eMoney");
      goto LABEL_16;
    default:
      v16 = CFSTR("Unknown");
LABEL_16:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("type"));
LABEL_17:
      v17 = (void *)objc_msgSend(v4, "copy", v16);

      return v17;
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKPaymentNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKPaymentMethodType)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CNContact)billingAddress
{
  return self->_billingAddress;
}

- (void)setBillingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKRemotePaymentInstrument)remoteInstrument
{
  return self->_remoteInstrument;
}

- (void)setRemoteInstrument:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInstrument, a3);
}

- (NSString)peerPaymentQuoteIdentifier
{
  return self->_peerPaymentQuoteIdentifier;
}

- (void)setPeerPaymentQuoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)usePeerPaymentBalance
{
  return self->_usePeerPaymentBalance;
}

- (void)setUsePeerPaymentBalance:(BOOL)a3
{
  self->_usePeerPaymentBalance = a3;
}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (void)setBankAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bankAccount, a3);
}

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void)setBindToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindToken, 0);
  objc_storeStrong((id *)&self->_bankAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuoteIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteInstrument, 0);
  objc_storeStrong((id *)&self->_billingAddress, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
