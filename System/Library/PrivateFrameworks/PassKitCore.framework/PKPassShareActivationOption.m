@implementation PKPassShareActivationOption

- (PKPassShareActivationOption)init
{
  return -[PKPassShareActivationOption initWithDefaultIdentifierForType:](self, "initWithDefaultIdentifierForType:", 0);
}

- (PKPassShareActivationOption)initWithDefaultIdentifierForType:(unint64_t)a3
{
  const __CFString *v4;

  if (a3 - 1 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E2AC5C58[a3 - 1];
  return -[PKPassShareActivationOption initWithIdentifier:type:](self, "initWithIdentifier:type:", v4, a3);
}

- (PKPassShareActivationOption)initWithCarKeyIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  uint64_t v7;
  PKPassShareActivationOption *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("sharingPasswordActivation"))
    goto LABEL_4;
  if (!v4)
  {
LABEL_16:

    v8 = 0;
    goto LABEL_17;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("sharingPasswordActivation"));

  if ((v6 & 1) == 0)
  {
    v9 = v5;
    if (v9 == CFSTR("devicePinActivation")
      || (v10 = v9,
          v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("devicePinActivation")),
          v10,
          (v11 & 1) != 0))
    {
      v7 = 1;
      goto LABEL_5;
    }
    v12 = v10;
    if (v12 == CFSTR("ownerKeyActivation"))
      goto LABEL_15;
    v13 = v12;
    v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("ownerKeyActivation"));

    if ((v14 & 1) != 0)
      goto LABEL_15;
    v15 = v13;
    if (v15 == CFSTR("friendKeyActivation")
      || (v16 = v15,
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("friendKeyActivation")),
          v16,
          (v17 & 1) != 0)
      || (v18 = v16, v18 == CFSTR("keyFobActivation"))
      || (v19 = v18,
          v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("keyFobActivation")),
          v19,
          (v20 & 1) != 0))
    {
LABEL_15:
      v7 = 3;
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_4:
  v7 = 2;
LABEL_5:
  v8 = -[PKPassShareActivationOption initWithIdentifier:type:](self, "initWithIdentifier:type:", v5, v7);
LABEL_17:

  return v8;
}

- (PKPassShareActivationOption)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7;
  PKPassShareActivationOption *v8;
  PKPassShareActivationOption *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassShareActivationOption;
  v8 = -[PKPassShareActivationOption init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (id)vehicleEnteredPin
{
  return -[PKPassShareActivationOption initWithIdentifier:type:]([PKPassShareActivationOption alloc], "initWithIdentifier:type:", CFSTR("sharingPasswordActivation"), 2);
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PKPassShareActivationOption localizationKeyPostfix](self, "localizationKeyPostfix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SHARE_ACTIVATION_NAME_%@"), v3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  PKLocalizedShareableCredentialString(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localizationKeyPostfix
{
  unint64_t type;
  __CFString *v4;
  __CFString *v6;
  NSString *result;
  __CFString *v8;
  __CFString *v9;
  char v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;

  type = self->_type;
  switch(type)
  {
    case 1uLL:
      return (NSString *)CFSTR("PINCODE");
    case 3uLL:
      v8 = self->_identifier;
      if (v8 == CFSTR("ownerKeyActivation"))
        return (NSString *)CFSTR("OWNERKEY");
      v9 = v8;
      if (v8
        && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("ownerKeyActivation")),
            v9,
            (v10 & 1) != 0))
      {
        return (NSString *)CFSTR("OWNERKEY");
      }
      else
      {
        v11 = self->_identifier;
        if (v11 == CFSTR("friendKeyActivation"))
          return (NSString *)CFSTR("FRIENDKEY");
        v12 = v11;
        if (v11
          && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("friendKeyActivation")),
              v12,
              (v13 & 1) != 0))
        {
          return (NSString *)CFSTR("FRIENDKEY");
        }
        else
        {
          v14 = self->_identifier;
          result = (NSString *)CFSTR("KEYFOB");
          if (v14 != CFSTR("keyFobActivation") && v14)
          {
            -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("keyFobActivation"));

            return (NSString *)CFSTR("KEYFOB");
          }
        }
      }
      break;
    case 2uLL:
      v4 = self->_identifier;
      if (v4 != CFSTR("sharingPasswordActivation") && v4 != 0)
      {
        v6 = v4;
        -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("sharingPasswordActivation"));

      }
      return (NSString *)CFSTR("VEP");
    default:
      return (NSString *)CFSTR("UNKNOWN");
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareActivationOption)initWithCoder:(id)a3
{
  id v4;
  PKPassShareActivationOption *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *value;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassShareActivationOption;
  v5 = -[PKPassShareActivationOption init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPassShareActivationOptionTypeFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v9;

    v5->_valueLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueLength"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  unint64_t v5;
  const __CFString *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  v5 = self->_type - 1;
  if (v5 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC5C58[v5];
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("type"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_valueLength, CFSTR("valueLength"));

}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<Option; "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  v4 = self->_type - 1;
  if (v4 > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC5C58[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  if (self->_value)
    objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  if (self->_valueLength)
    objc_msgSend(v3, "appendFormat:", CFSTR("valueLength: '%ld'; "), self->_valueLength);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "addObject:");
  if (self->_value)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_valueLength - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassShareActivationOption *v4;
  PKPassShareActivationOption *v5;
  BOOL v6;

  v4 = (PKPassShareActivationOption *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassShareActivationOption isEqualToPassShareActivationOption:](self, "isEqualToPassShareActivationOption:", v5);

  return v6;
}

- (BOOL)isEqualToPassShareActivationOption:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *value;
  NSString *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_16;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_16;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  if (self->_type != v4[2])
    goto LABEL_16;
  value = self->_value;
  v9 = (NSString *)v4[3];
  if (!value || !v9)
  {
    if (value == v9)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSString isEqual:](value, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_14:
  v10 = self->_valueLength == v4[4];
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassShareActivationOption *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *value;

  v4 = objc_alloc_init(PKPassShareActivationOption);
  v5 = -[NSString copy](self->_identifier, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v4->_type = self->_type;
  v7 = -[NSString copy](self->_value, "copy");
  value = v4->_value;
  v4->_value = (NSString *)v7;

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int64_t)valueLength
{
  return self->_valueLength;
}

- (void)setValueLength:(int64_t)a3
{
  self->_valueLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
