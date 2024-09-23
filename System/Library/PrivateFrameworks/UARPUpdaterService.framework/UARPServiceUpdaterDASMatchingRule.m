@implementation UARPServiceUpdaterDASMatchingRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterDASMatchingRule)initWithIdentifier:(id)a3 matchingDictionary:(id)a4
{
  UARPServiceUpdaterDASMatchingRule *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterDASMatchingRule;
  v6 = -[UARPServiceUpdaterDASMatchingRule init](&v8, sel_init);
  if (v6)
  {
    v6->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v6->_matchingDictionary = (NSDictionary *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterDASMatchingRule;
  -[UARPServiceUpdaterDASMatchingRule dealloc](&v3, sel_dealloc);
}

- (UARPServiceUpdaterDASMatchingRule)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)MEMORY[0x24BDBCF20];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  return -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:](self, "initWithIdentifier:matchingDictionary:", v5, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4)), CFSTR("matchingDictionary")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
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
        LOBYTE(v5) = -[NSDictionary isEqual:](self->_matchingDictionary, "isEqual:", *((_QWORD *)a3 + 2));
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  objc_msgSend(a4, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_identifier);
  objc_msgSend(a4, "appendWithTabDepth:format:", a3, CFSTR("%@\n"), self->_matchingDictionary);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: Identifier=%@, matchingDictionary=%@>"), NSStringFromClass(v4), self->_identifier, self->_matchingDictionary);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_identifier), "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)matchingDictionary
{
  return self->_matchingDictionary;
}

@end
