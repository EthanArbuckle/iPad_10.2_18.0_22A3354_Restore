@implementation PKPhysicalCardAction

- (PKPhysicalCardAction)initWithActionType:(unint64_t)a3
{
  PKPhysicalCardAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicalCardAction;
  result = -[PKPhysicalCardAction init](&v5, sel_init);
  if (result)
    result->_actionType = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardAction)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCardAction *v5;
  uint64_t v6;
  NSString *activationCode;
  uint64_t v8;
  NSString *artworkIdentifier;
  uint64_t v10;
  CNPostalAddress *shippingAddress;
  uint64_t v12;
  NSString *nameOnCard;
  uint64_t v14;
  PKPhysicalCardPriceOption *priceOption;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPhysicalCardAction;
  v5 = -[PKPhysicalCardAction init](&v17, sel_init);
  if (v5)
  {
    v5->_actionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    activationCode = v5->_activationCode;
    v5->_activationCode = (NSString *)v6;

    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    shippingAddress = v5->_shippingAddress;
    v5->_shippingAddress = (CNPostalAddress *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v12 = objc_claimAutoreleasedReturnValue();
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priceOption"));
    v14 = objc_claimAutoreleasedReturnValue();
    priceOption = v5->_priceOption;
    v5->_priceOption = (PKPhysicalCardPriceOption *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t actionType;
  id v5;

  actionType = self->_actionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", actionType, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationCode, CFSTR("activationCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkIdentifier, CFSTR("artworkIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shippingAddress, CFSTR("shippingAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameOnCard, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_priceOption, CFSTR("priceOption"));

}

- (BOOL)isEqual:(id)a3
{
  PKPhysicalCardAction *v4;
  PKPhysicalCardAction *v5;
  BOOL v6;

  v4 = (PKPhysicalCardAction *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPhysicalCardAction isEqualToPhysicalCardAction:](self, "isEqualToPhysicalCardAction:", v5);

  return v6;
}

- (BOOL)isEqualToPhysicalCardAction:(id)a3
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
  BOOL v14;
  CNPostalAddress *shippingAddress;
  CNPostalAddress *v17;
  NSString *nameOnCard;
  NSString *v19;
  PKPhysicalCardPriceOption *priceOption;
  PKPhysicalCardPriceOption *v21;

  v4 = a3;
  v5 = (void *)v4[2];
  v6 = self->_activationCode;
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
      goto LABEL_14;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_15;
  }
  v11 = (void *)v4[4];
  v6 = self->_artworkIdentifier;
  v12 = v11;
  if (v6 != v12)
  {
    v8 = v12;
    if (v6 && v12)
    {
      v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_15;
      goto LABEL_18;
    }
LABEL_14:

    goto LABEL_15;
  }

LABEL_18:
  shippingAddress = self->_shippingAddress;
  v17 = (CNPostalAddress *)v4[5];
  if (shippingAddress && v17)
  {
    if ((-[CNPostalAddress isEqual:](shippingAddress, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (shippingAddress != v17)
  {
    goto LABEL_15;
  }
  nameOnCard = self->_nameOnCard;
  v19 = (NSString *)v4[6];
  if (nameOnCard && v19)
  {
    if ((-[NSString isEqual:](nameOnCard, "isEqual:") & 1) == 0)
      goto LABEL_15;
  }
  else if (nameOnCard != v19)
  {
    goto LABEL_15;
  }
  priceOption = self->_priceOption;
  v21 = (PKPhysicalCardPriceOption *)v4[7];
  if (priceOption && v21)
  {
    if (!-[PKPhysicalCardPriceOption isEqual:](priceOption, "isEqual:"))
      goto LABEL_15;
  }
  else if (priceOption != v21)
  {
    goto LABEL_15;
  }
  if (self->_actionType == v4[1])
  {
    v14 = self->_reason == v4[3];
    goto LABEL_16;
  }
LABEL_15:
  v14 = 0;
LABEL_16:

  return v14;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_activationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_artworkIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_shippingAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_nameOnCard);
  objc_msgSend(v3, "safelyAddObject:", self->_priceOption);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_actionType - v4 + 32 * v4;
  v6 = self->_reason - v5 + 32 * v5;

  return v6;
}

- (id)jsonRepresentation
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t actionType;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = self->_actionType - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2ABE478[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("action"));
  actionType = self->_actionType;
  if (actionType == 5)
  {
    PKStringFromPhysicalCardOrderReason(self->_reason);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_artworkIdentifier, CFSTR("artworkIdentifier"));
    -[PKPhysicalCardAction _shippingAddressJSONRepresentation](self, "_shippingAddressJSONRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("shippingAddress"));

    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_nameOnCard, CFSTR("name"));
    -[PKPhysicalCardPriceOption jsonDictionaryRepresentation](self->_priceOption, "jsonDictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("priceOption"));

  }
  else if (actionType == 4)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_activationCode, CFSTR("activationCode"));
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (id)_shippingAddressJSONRepresentation
{
  id v3;
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

  if (self->_shippingAddress)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CNPostalAddress street](self->_shippingAddress, "street");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("addressLine1"));

    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("addressLine2"));

    }
    -[CNPostalAddress city](self->_shippingAddress, "city");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("city"));

    -[CNPostalAddress state](self->_shippingAddress, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

    -[CNPostalAddress postalCode](self->_shippingAddress, "postalCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("postalCode"));

    -[CNPostalAddress ISOCountryCode](self->_shippingAddress, "ISOCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("countryCode"));

    v13 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKPhysicalCardPriceOption)priceOption
{
  return self->_priceOption;
}

- (void)setPriceOption:(id)a3
{
  objc_storeStrong((id *)&self->_priceOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceOption, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_activationCode, 0);
}

@end
