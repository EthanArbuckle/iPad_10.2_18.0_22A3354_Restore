@implementation UARPServiceUpdaterAccessoryMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithIdentifier:(id)a3 xpcEventStream:(id)a4 matchingDictionary:(id)a5
{
  UARPServiceUpdaterAccessoryMatchingRule *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UARPServiceUpdaterAccessoryMatchingRule;
  v8 = -[UARPServiceUpdaterAccessoryMatchingRule init](&v10, sel_init);
  if (v8)
  {
    v8->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v8->_xpcEventStream = (NSString *)objc_msgSend(a4, "copy");
    v8->_matchingDictionary = (NSDictionary *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterAccessoryMatchingRule;
  -[UARPServiceUpdaterAccessoryMatchingRule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterAccessoryMatchingRule)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xpcEventStream"));
  v7 = (void *)MEMORY[0x24BDBCF20];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  return -[UARPServiceUpdaterAccessoryMatchingRule initWithIdentifier:xpcEventStream:matchingDictionary:](self, "initWithIdentifier:xpcEventStream:matchingDictionary:", v5, v6, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4)), CFSTR("matchingDictionary")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_xpcEventStream, CFSTR("xpcEventStream"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_matchingDictionary, CFSTR("matchingDictionary"));
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
      {
        v5 = -[NSString isEqual:](self->_xpcEventStream, "isEqual:", *((_QWORD *)a3 + 2));
        if (v5)
          LOBYTE(v5) = -[NSDictionary isEqual:](self->_matchingDictionary, "isEqual:", *((_QWORD *)a3 + 3));
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (const)transportDescription
{
  return (const char *)&unk_22CC02D2A;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Identifier=%@, Event Stream=%@>"), NSStringFromClass(v4), self->_identifier, self->_xpcEventStream);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), self->_identifier, self->_xpcEventStream), "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)xpcEventStream
{
  return self->_xpcEventStream;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end
