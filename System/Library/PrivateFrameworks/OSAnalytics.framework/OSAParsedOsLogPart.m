@implementation OSAParsedOsLogPart

- (OSAParsedOsLogPart)initWithLiteral:(id)a3 isImmutable:(BOOL)a4
{
  id v7;
  OSAParsedOsLogPart *v8;
  OSAParsedOsLogPart *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSAParsedOsLogPart;
  v8 = -[OSAParsedOsLogPart init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isImmutable = a4;
    objc_storeStrong((id *)&v8->_stringValue, a3);
    v9->_isArgument = 0;
  }

  return v9;
}

- (OSAParsedOsLogPart)initWithStringArgument:(id)a3 isImmutable:(BOOL)a4
{
  id v7;
  OSAParsedOsLogPart *v8;
  OSAParsedOsLogPart *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSAParsedOsLogPart;
  v8 = -[OSAParsedOsLogPart init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isImmutable = a4;
    objc_storeStrong((id *)&v8->_stringValue, a3);
    v9->_isArgument = 1;
  }

  return v9;
}

- (OSAParsedOsLogPart)initWithIntegerArgumentStringValue:(id)a3
{
  id v5;
  OSAParsedOsLogPart *v6;
  OSAParsedOsLogPart *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OSAParsedOsLogPart;
  v6 = -[OSAParsedOsLogPart init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isImmutable = 1;
    objc_storeStrong((id *)&v6->_stringValue, a3);
    v7->_isArgument = 1;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isImmutable: %d, isArgument: %d, stringValue: %@"), self->_isImmutable, self->_isArgument, self->_stringValue);
}

- (BOOL)isImmutable
{
  return self->_isImmutable;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isArgument
{
  return self->_isArgument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
