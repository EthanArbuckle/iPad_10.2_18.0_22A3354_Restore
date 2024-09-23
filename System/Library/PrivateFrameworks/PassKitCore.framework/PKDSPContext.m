@implementation PKDSPContext

- (id)copyWithZone:(_NSZone *)a3
{
  PKDSPContext *v5;
  uint64_t v6;
  NSString *secureElementID;
  uint64_t v8;
  NSString *phoneNumber;
  uint64_t v10;
  NSString *cardholderName;
  uint64_t v12;
  NSString *primaryAppleAccountFirstName;
  uint64_t v14;
  NSString *primaryAppleAccountLastName;
  uint64_t v16;
  NSString *serverEndpointIdentifier;
  uint64_t v18;
  NSString *peerPaymentRecipientAddress;

  v5 = -[PKDSPContext init](+[PKDSPContext allocWithZone:](PKDSPContext, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_secureElementID, "copyWithZone:", a3);
  secureElementID = v5->_secureElementID;
  v5->_secureElementID = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  phoneNumber = v5->_phoneNumber;
  v5->_phoneNumber = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_cardholderName, "copyWithZone:", a3);
  cardholderName = v5->_cardholderName;
  v5->_cardholderName = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_primaryAppleAccountFirstName, "copyWithZone:", a3);
  primaryAppleAccountFirstName = v5->_primaryAppleAccountFirstName;
  v5->_primaryAppleAccountFirstName = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_primaryAppleAccountLastName, "copyWithZone:", a3);
  primaryAppleAccountLastName = v5->_primaryAppleAccountLastName;
  v5->_primaryAppleAccountLastName = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_serverEndpointIdentifier, "copyWithZone:", a3);
  serverEndpointIdentifier = v5->_serverEndpointIdentifier;
  v5->_serverEndpointIdentifier = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_peerPaymentRecipientAddress, "copyWithZone:", a3);
  peerPaymentRecipientAddress = v5->_peerPaymentRecipientAddress;
  v5->_peerPaymentRecipientAddress = (NSString *)v18;

  v5->_eventFrequency = self->_eventFrequency;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSString *secureElementID;
  NSString *v8;
  NSString *cardholderName;
  NSString *v10;
  NSString *phoneNumber;
  NSString *v12;
  NSString *primaryAppleAccountFirstName;
  NSString *v14;
  NSString *primaryAppleAccountLastName;
  NSString *v16;
  NSString *serverEndpointIdentifier;
  NSString *v18;
  NSString *peerPaymentRecipientAddress;
  NSString *v20;
  BOOL v21;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_40;
  secureElementID = self->_secureElementID;
  v8 = (NSString *)v6[1];
  if (secureElementID && v8)
  {
    if ((-[NSString isEqual:](secureElementID, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (secureElementID != v8)
  {
    goto LABEL_40;
  }
  cardholderName = self->_cardholderName;
  v10 = (NSString *)v6[3];
  if (cardholderName && v10)
  {
    if ((-[NSString isEqual:](cardholderName, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (cardholderName != v10)
  {
    goto LABEL_40;
  }
  phoneNumber = self->_phoneNumber;
  v12 = (NSString *)v6[4];
  if (phoneNumber && v12)
  {
    if ((-[NSString isEqual:](phoneNumber, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (phoneNumber != v12)
  {
    goto LABEL_40;
  }
  primaryAppleAccountFirstName = self->_primaryAppleAccountFirstName;
  v14 = (NSString *)v6[7];
  if (primaryAppleAccountFirstName && v14)
  {
    if ((-[NSString isEqual:](primaryAppleAccountFirstName, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (primaryAppleAccountFirstName != v14)
  {
    goto LABEL_40;
  }
  primaryAppleAccountLastName = self->_primaryAppleAccountLastName;
  v16 = (NSString *)v6[8];
  if (primaryAppleAccountLastName && v16)
  {
    if ((-[NSString isEqual:](primaryAppleAccountLastName, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (primaryAppleAccountLastName != v16)
  {
    goto LABEL_40;
  }
  serverEndpointIdentifier = self->_serverEndpointIdentifier;
  v18 = (NSString *)v6[2];
  if (serverEndpointIdentifier && v18)
  {
    if ((-[NSString isEqual:](serverEndpointIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (serverEndpointIdentifier != v18)
  {
    goto LABEL_40;
  }
  peerPaymentRecipientAddress = self->_peerPaymentRecipientAddress;
  v20 = (NSString *)v6[5];
  if (!peerPaymentRecipientAddress || !v20)
  {
    if (peerPaymentRecipientAddress == v20)
      goto LABEL_38;
LABEL_40:
    v21 = 0;
    goto LABEL_41;
  }
  if ((-[NSString isEqual:](peerPaymentRecipientAddress, "isEqual:") & 1) == 0)
    goto LABEL_40;
LABEL_38:
  v21 = self->_eventFrequency == v6[6];
LABEL_41:

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_secureElementID);
  objc_msgSend(v3, "safelyAddObject:", self->_cardholderName);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAppleAccountLastName);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAppleAccountFirstName);
  objc_msgSend(v3, "safelyAddObject:", self->_serverEndpointIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentRecipientAddress);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_eventFrequency - v4 + 32 * v4;

  return v5;
}

- (void)setPrimaryAppleAccount:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *primaryAppleAccountFirstName;
  NSString *v8;
  NSString *primaryAppleAccountLastName;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  primaryAppleAccountFirstName = self->_primaryAppleAccountFirstName;
  self->_primaryAppleAccountFirstName = v6;

  objc_msgSend(v4, "lastName");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (NSString *)objc_msgSend(v10, "copy");
  primaryAppleAccountLastName = self->_primaryAppleAccountLastName;
  self->_primaryAppleAccountLastName = v8;

}

- (PKDSPContext)initWithCoder:(id)a3
{
  id v4;
  PKDSPContext *v5;
  uint64_t v6;
  NSString *secureElementID;
  uint64_t v8;
  NSString *serverEndpointIdentifier;
  uint64_t v10;
  NSString *cardholderName;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSString *peerPaymentRecipientAddress;
  void *v16;
  uint64_t v17;
  NSString *primaryAppleAccountFirstName;
  uint64_t v19;
  NSString *primaryAppleAccountLastName;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDSPContext;
  v5 = -[PKDSPContext init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementID"));
    v6 = objc_claimAutoreleasedReturnValue();
    secureElementID = v5->_secureElementID;
    v5->_secureElementID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverEndpointIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverEndpointIdentifier = v5->_serverEndpointIdentifier;
    v5->_serverEndpointIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentRecipientAddress"));
    v14 = objc_claimAutoreleasedReturnValue();
    peerPaymentRecipientAddress = v5->_peerPaymentRecipientAddress;
    v5->_peerPaymentRecipientAddress = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventFrequency"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventFrequency = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAppleAccountFirstName"));
    v17 = objc_claimAutoreleasedReturnValue();
    primaryAppleAccountFirstName = v5->_primaryAppleAccountFirstName;
    v5->_primaryAppleAccountFirstName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAppleAccountLastName"));
    v19 = objc_claimAutoreleasedReturnValue();
    primaryAppleAccountLastName = v5->_primaryAppleAccountLastName;
    v5->_primaryAppleAccountLastName = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *secureElementID;
  void *v5;
  id v6;

  secureElementID = self->_secureElementID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", secureElementID, CFSTR("secureElementID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serverEndpointIdentifier, CFSTR("serverEndpointIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peerPaymentRecipientAddress, CFSTR("peerPaymentRecipientAddress"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventFrequency);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("eventFrequency"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryAppleAccountFirstName, CFSTR("primaryAppleAccountFirstName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryAppleAccountLastName, CFSTR("primaryAppleAccountLastName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)secureElementID
{
  return self->_secureElementID;
}

- (void)setSecureElementID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serverEndpointIdentifier
{
  return self->_serverEndpointIdentifier;
}

- (void)setServerEndpointIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)peerPaymentRecipientAddress
{
  return self->_peerPaymentRecipientAddress;
}

- (void)setPeerPaymentRecipientAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)eventFrequency
{
  return self->_eventFrequency;
}

- (void)setEventFrequency:(unint64_t)a3
{
  self->_eventFrequency = a3;
}

- (NSString)primaryAppleAccountFirstName
{
  return self->_primaryAppleAccountFirstName;
}

- (void)setPrimaryAppleAccountFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)primaryAppleAccountLastName
{
  return self->_primaryAppleAccountLastName;
}

- (void)setPrimaryAppleAccountLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountLastName, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccountFirstName, 0);
  objc_storeStrong((id *)&self->_peerPaymentRecipientAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_serverEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementID, 0);
}

@end
