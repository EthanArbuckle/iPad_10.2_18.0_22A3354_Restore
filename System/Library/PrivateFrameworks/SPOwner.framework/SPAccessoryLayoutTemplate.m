@implementation SPAccessoryLayoutTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPartIdentifier:", -[SPAccessoryLayoutTemplate partIdentifier](self, "partIdentifier"));
  -[SPAccessoryLayoutTemplate partType](self, "partType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPartType:", v6);

  -[SPAccessoryLayoutTemplate partName](self, "partName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPartName:", v8);

  -[SPAccessoryLayoutTemplate partSymbol](self, "partSymbol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPartSymbol:", v10);

  objc_msgSend(v4, "setIsPrimary:", -[SPAccessoryLayoutTemplate isPrimary](self, "isPrimary"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[SPAccessoryLayoutTemplate partIdentifier](self, "partIdentifier"), CFSTR("partIdentifier"));
  -[SPAccessoryLayoutTemplate partType](self, "partType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("partType"));

  -[SPAccessoryLayoutTemplate partName](self, "partName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("partName"));

  -[SPAccessoryLayoutTemplate partSymbol](self, "partSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("partSymbol"));

  objc_msgSend(v7, "encodeBool:forKey:", -[SPAccessoryLayoutTemplate isPrimary](self, "isPrimary"), CFSTR("isPrimary"));
}

- (SPAccessoryLayoutTemplate)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *partType;
  NSString *v7;
  NSString *partName;
  NSString *v9;
  NSString *partSymbol;
  char v11;

  v4 = a3;
  self->_partIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partIdentifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partType"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  partType = self->_partType;
  self->_partType = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  partName = self->_partName;
  self->_partName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partSymbol"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  partSymbol = self->_partSymbol;
  self->_partSymbol = v9;

  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPrimary"));
  self->_isPrimary = v11;
  return self;
}

- (unsigned)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(unsigned __int8)a3
{
  self->_partIdentifier = a3;
}

- (NSString)partType
{
  return self->_partType;
}

- (void)setPartType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)partSymbol
{
  return self->_partSymbol;
}

- (void)setPartSymbol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partSymbol, 0);
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_partType, 0);
}

@end
