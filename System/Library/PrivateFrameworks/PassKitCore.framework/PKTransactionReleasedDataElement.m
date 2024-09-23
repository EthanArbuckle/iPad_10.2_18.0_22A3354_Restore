@implementation PKTransactionReleasedDataElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReleasedDataElement)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReleasedDataElement *v5;
  uint64_t v6;
  NSString *elementNamespace;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReleasedDataElement;
  v5 = -[PKTransactionReleasedDataElement init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementNamespace"));
    v6 = objc_claimAutoreleasedReturnValue();
    elementNamespace = v5->_elementNamespace;
    v5->_elementNamespace = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_retentionIntent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retentionIntent"));
    v5->_retentionPeriod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retentionPeriod"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *elementNamespace;
  id v5;

  elementNamespace = self->_elementNamespace;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", elementNamespace, CFSTR("elementNamespace"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_retentionIntent, CFSTR("retentionIntent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_retentionPeriod, CFSTR("retentionPeriod"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_elementNamespace);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_retentionIntent - v4 + 32 * v4;
  v6 = self->_retentionPeriod - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReleasedDataElement *v4;
  PKTransactionReleasedDataElement *v5;
  BOOL v6;

  v4 = (PKTransactionReleasedDataElement *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReleasedDataElement isEqualToReleasedDataElement:](self, "isEqualToReleasedDataElement:", v5);

  return v6;
}

- (BOOL)isEqualToReleasedDataElement:(id)a3
{
  _QWORD *v4;
  NSString *elementNamespace;
  NSString *v6;
  BOOL v7;
  NSString *identifier;
  NSString *v9;
  BOOL v10;

  v4 = a3;
  elementNamespace = self->_elementNamespace;
  v6 = (NSString *)v4[1];
  if (elementNamespace)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (elementNamespace != v6)
      goto LABEL_16;
  }
  else if ((-[NSString isEqual:](elementNamespace, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  v9 = (NSString *)v4[2];
  if (!identifier || !v9)
  {
    if (identifier == v9)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_14:
  if (self->_retentionIntent != v4[3])
    goto LABEL_16;
  v10 = self->_retentionPeriod == v4[4];
LABEL_17:

  return v10;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("namespace: '%@'; "), self->_elementNamespace);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("retention: '%lu'; "), self->_retentionIntent);
  objc_msgSend(v3, "appendFormat:", CFSTR("retentionPeriod: '%lu'; "), self->_retentionPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  NSString *elementNamespace;
  NSString *identifier;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  elementNamespace = self->_elementNamespace;
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_retentionIntent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_retentionPeriod);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", elementNamespace, CFSTR("namespace"), identifier, CFSTR("identifier"), v6, CFSTR("retentionIntent"), v7, CFSTR("retentionPeriod"), 0);

  return v8;
}

- (NSString)elementNamespace
{
  return self->_elementNamespace;
}

- (void)setElementNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_elementNamespace, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)retentionIntent
{
  return self->_retentionIntent;
}

- (void)setRetentionIntent:(unint64_t)a3
{
  self->_retentionIntent = a3;
}

- (int64_t)retentionPeriod
{
  return self->_retentionPeriod;
}

- (void)setRetentionPeriod:(int64_t)a3
{
  self->_retentionPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementNamespace, 0);
}

@end
