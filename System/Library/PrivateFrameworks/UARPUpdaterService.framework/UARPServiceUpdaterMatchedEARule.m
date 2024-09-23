@implementation UARPServiceUpdaterMatchedEARule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedEARule)initWithEAIdentifier:(id)a3 accessorySerialNumber:(id)a4
{
  UARPServiceUpdaterMatchedEARule *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterMatchedEARule;
  v6 = -[UARPServiceUpdaterMatchedEARule init](&v8, sel_init);
  if (v6)
  {
    v6->_eaIdentifier = (NSString *)objc_msgSend(a3, "copy");
    v6->_accessorySerialNumber = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterMatchedEARule;
  -[UARPServiceUpdaterMatchedEARule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  return -[UARPServiceUpdaterMatchedEARule initWithEAIdentifier:accessorySerialNumber:](self, "initWithEAIdentifier:accessorySerialNumber:", v5, objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_eaIdentifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_accessorySerialNumber, CFSTR("serialNumber"));
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
      v5 = -[NSString isEqual:](self->_eaIdentifier, "isEqual:", *((_QWORD *)a3 + 1));
      if (v5)
        LOBYTE(v5) = -[NSString isEqual:](self->_accessorySerialNumber, "isEqual:", *((_QWORD *)a3 + 2));
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: EAIdentifier=%@, acessorySerialNumber=%@"), NSStringFromClass(v4), self->_eaIdentifier, self->_accessorySerialNumber);
}

- (NSString)eaIdentifier
{
  return self->_eaIdentifier;
}

- (NSString)accessorySerialNumber
{
  return self->_accessorySerialNumber;
}

@end
