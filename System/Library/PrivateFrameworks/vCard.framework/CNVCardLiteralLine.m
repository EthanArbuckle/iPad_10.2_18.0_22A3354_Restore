@implementation CNVCardLiteralLine

+ (id)lineWithLiteralValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLiteralValue:", v4);

  return v5;
}

- (CNVCardLiteralLine)initWithLiteralValue:(id)a3
{
  id v4;
  CNVCardLiteralLine *v5;
  uint64_t v6;
  NSData *literalValue;
  CNVCardLiteralLine *v8;

  v4 = a3;
  v5 = -[CNVCardLiteralLine init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    literalValue = v5->_literalValue;
    v5->_literalValue = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)serializeWithStrategy:(id)a3
{
  objc_msgSend(a3, "serializeOpaqueValue:", self->_literalValue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_literalValue, 0);
}

@end
