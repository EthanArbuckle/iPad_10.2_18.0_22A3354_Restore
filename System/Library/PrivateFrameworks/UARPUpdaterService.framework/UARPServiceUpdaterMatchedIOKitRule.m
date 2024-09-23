@implementation UARPServiceUpdaterMatchedIOKitRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithIdentifier:(id)a3 registryEntryID:(unint64_t)a4
{
  UARPServiceUpdaterMatchedIOKitRule *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterMatchedIOKitRule;
  v6 = -[UARPServiceUpdaterMatchedIOKitRule init](&v8, sel_init);
  if (v6)
  {
    v6->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v6->_registryEntryID = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterMatchedIOKitRule;
  -[UARPServiceUpdaterMatchedIOKitRule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterMatchedIOKitRule)initWithCoder:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  return -[UARPServiceUpdaterMatchedIOKitRule initWithIdentifier:registryEntryID:](self, "initWithIdentifier:registryEntryID:", v5, objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registryEntryID")), "unsignedLongLongValue"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_registryEntryID), CFSTR("registryEntryID"));
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = -[NSString isEqual:](self->_identifier, "isEqual:", *((_QWORD *)a3 + 1));
      if (v5)
        LOBYTE(v5) = self->_registryEntryID == *((_QWORD *)a3 + 2);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Identifier=%@, Registry Entry ID=0x%llx"), NSStringFromClass(v4), self->_identifier, self->_registryEntryID);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

@end
