@implementation RWIProtocolCSSRuleId

- (RWIProtocolCSSRuleId)initWithStyleSheetId:(id)a3 ordinal:(int)a4
{
  uint64_t v4;
  id v6;
  RWIProtocolCSSRuleId *v7;
  RWIProtocolCSSRuleId *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolCSSRuleId;
  v7 = -[RWIProtocolJSONObject init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("styleSheetId"));
    -[RWIProtocolCSSRuleId setStyleSheetId:](v7, "setStyleSheetId:", v6);
    -[RWIProtocolCSSRuleId setOrdinal:](v7, "setOrdinal:", v4);
    v8 = v7;
  }

  return v7;
}

- (void)setStyleSheetId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleId;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("styleSheetId"));
}

- (NSString)styleSheetId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleId;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("styleSheetId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOrdinal:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleId;
  -[RWIProtocolJSONObject setInteger:forKey:](&v3, sel_setInteger_forKey_, *(_QWORD *)&a3, CFSTR("ordinal"));
}

- (int)ordinal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleId;
  return -[RWIProtocolJSONObject integerForKey:](&v3, sel_integerForKey_, CFSTR("ordinal"));
}

@end
