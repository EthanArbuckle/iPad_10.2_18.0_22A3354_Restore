@implementation HAPBTLETransactionIdentifier

+ (unsigned)generateRequestIdentifier
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v6 = 0;
  v2 = sub_100012548(1uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "getBytes:length:", &v6, 1);
  v4 = v6;

  return v4;
}

+ (id)randomTransactionIdentifier
{
  id v2;
  void *v3;
  HAPBTLETransactionIdentifier *v4;
  HAPBTLETransactionIdentifier *v5;
  unsigned __int8 v7;

  v7 = 0;
  v2 = sub_100012548(1uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "getBytes:length:", &v7, 1);
  v4 = [HAPBTLETransactionIdentifier alloc];
  v5 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v4, "initWithUnsignedCharValue:", v7);

  return v5;
}

- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3
{
  HAPBTLETransactionIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPBTLETransactionIdentifier;
  result = -[HAPBTLETransactionIdentifier init](&v5, "init");
  if (result)
    result->_unsignedCharValue = a3;
  return result;
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLETransactionIdentifier shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, Identifier = %u>"), v5, v6, -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue")));
  if (v3)

  return v7;
}

- (id)debugDescription
{
  return -[HAPBTLETransactionIdentifier descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLETransactionIdentifier descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)hash
{
  return -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPBTLETransactionIdentifier *v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;

  v5 = (HAPBTLETransactionIdentifier *)a3;
  if (self == v5)
  {
    v8 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPBTLETransactionIdentifier, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue");
      v8 = v7 == -[HAPBTLETransactionIdentifier unsignedCharValue](v5, "unsignedCharValue");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unsigned)unsignedCharValue
{
  return self->_unsignedCharValue;
}

@end
