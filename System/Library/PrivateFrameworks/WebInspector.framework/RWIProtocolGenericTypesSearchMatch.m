@implementation RWIProtocolGenericTypesSearchMatch

- (RWIProtocolGenericTypesSearchMatch)initWithLineNumber:(double)a3 lineContent:(id)a4
{
  id v6;
  RWIProtocolGenericTypesSearchMatch *v7;
  RWIProtocolGenericTypesSearchMatch *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  v7 = -[RWIProtocolJSONObject init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("lineContent"));
    -[RWIProtocolGenericTypesSearchMatch setLineNumber:](v7, "setLineNumber:", a3);
    -[RWIProtocolGenericTypesSearchMatch setLineContent:](v7, "setLineContent:", v6);
    v8 = v7;
  }

  return v7;
}

- (void)setLineNumber:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("lineNumber"), a3);
}

- (double)lineNumber
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("lineNumber"));
  return result;
}

- (void)setLineContent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("lineContent"));
}

- (NSString)lineContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("lineContent"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
