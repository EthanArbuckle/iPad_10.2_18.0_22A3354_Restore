@implementation SCLContact

- (SCLContact)init
{
  return (SCLContact *)-[SCLContact _initWithContactIdentifier:type:value:](self, "_initWithContactIdentifier:type:value:", 0, 0, 0);
}

- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  SCLContact *v10;
  uint64_t v11;
  NSString *contactIdentifier;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SCLContact;
  v10 = -[SCLContact init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    v10->_type = a4;
    v13 = objc_msgSend(v9, "copy");
    value = v10->_value;
    v10->_value = (NSString *)v13;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[SCLContact contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SCLContact type](self, "type") ^ v4;
  -[SCLContact value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SCLContact *v4;
  SCLContact *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SCLContact *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCLContact contactIdentifier](self, "contactIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLContact contactIdentifier](v5, "contactIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects()
        && (v8 = -[SCLContact type](self, "type"), v8 == -[SCLContact type](v5, "type")))
      {
        -[SCLContact value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLContact value](v5, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualStrings();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLContact contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("contactIdentifier"));

  v5 = -[SCLContact type](self, "type");
  v6 = CFSTR("unknown");
  if (v5 == 2)
    v6 = CFSTR("phone");
  if (v5 == 1)
    v7 = CFSTR("email");
  else
    v7 = v6;
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("type"));
  -[SCLContact value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("value"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLContact _initWithContactIdentifier:type:value:]([SCLContact alloc], "_initWithContactIdentifier:type:value:", self->_contactIdentifier, self->_type, self->_value);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SCLContact *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SCLContact _initWithContactIdentifier:type:value:](self, "_initWithContactIdentifier:type:value:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactIdentifier;
  id v5;

  contactIdentifier = self->_contactIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
