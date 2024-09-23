@implementation PKTransactionReleasedDataApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t client;
  id v5;

  client = self->_client;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", client, CFSTR("client"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usageDescription, CFSTR("usageDescription"));

}

- (PKTransactionReleasedDataApplication)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReleasedDataApplication *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *usageDescription;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReleasedDataApplication;
  v5 = -[PKTransactionReleasedDataApplication init](&v11, sel_init);
  if (v5)
  {
    v5->_client = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("client"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    usageDescription = v5->_usageDescription;
    v5->_usageDescription = (NSString *)v8;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_bundleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_usageDescription);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_client - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReleasedDataApplication *v4;
  PKTransactionReleasedDataApplication *v5;
  BOOL v6;

  v4 = (PKTransactionReleasedDataApplication *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReleasedDataApplication isEqualToReleasedDataApplication:](self, "isEqualToReleasedDataApplication:", v5);

  return v6;
}

- (BOOL)isEqualToReleasedDataApplication:(id)a3
{
  _QWORD *v4;
  NSString *bundleIdentifier;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *usageDescription;
  NSString *v11;

  v4 = a3;
  if (self->_client != v4[1])
    goto LABEL_8;
  bundleIdentifier = self->_bundleIdentifier;
  v6 = (NSString *)v4[2];
  if (bundleIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSString isEqual:](bundleIdentifier, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (bundleIdentifier != v6)
    goto LABEL_8;
LABEL_11:
  usageDescription = self->_usageDescription;
  v11 = (NSString *)v4[3];
  if (usageDescription && v11)
    v8 = -[NSString isEqual:](usageDescription, "isEqual:");
  else
    v8 = usageDescription == v11;
LABEL_9:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("client: '%lu'; "), self->_client);
  -[NSString description](self->_bundleIdentifier, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("bundleIdentifier: '%@'; "), v4);

  -[NSString description](self->_usageDescription, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("usageDescription: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_client);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("client"), self->_bundleIdentifier, CFSTR("bundleIdentifier"), self->_usageDescription, CFSTR("usageDescription"), 0);

  return v5;
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setClient:(unint64_t)a3
{
  self->_client = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)usageDescription
{
  return self->_usageDescription;
}

- (void)setUsageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_usageDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDescription, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
