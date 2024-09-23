@implementation RWIProtocolCSSRuleMatch

- (RWIProtocolCSSRuleMatch)initWithRule:(id)a3 matchingSelectors:(id)a4
{
  id v6;
  id v7;
  RWIProtocolCSSRuleMatch *v8;
  RWIProtocolCSSRuleMatch *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolCSSRuleMatch;
  v8 = -[RWIProtocolJSONObject init](&v11, sel_init);
  if (v8)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("rule"));
    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("matchingSelectors"));
    -[RWIProtocolCSSRuleMatch setRule:](v8, "setRule:", v6);
    -[RWIProtocolCSSRuleMatch setMatchingSelectors:](v8, "setMatchingSelectors:", v7);
    v9 = v8;
  }

  return v8;
}

- (void)setRule:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleMatch;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("rule"));
}

- (RWIProtocolCSSRule)rule
{
  void *v3;
  RWIProtocolCSSRule *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolCSSRule *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSRuleMatch;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("rule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolCSSRule alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSRuleMatch;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("rule"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setMatchingSelectors:(id)a3
{
  _DWORD *v4;
  objc_super v5;
  _DWORD *v6;

  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSRuleMatch;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v5, sel_setJSONArray_forKey_, &v6, CFSTR("matchingSelectors"));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v4;
  }
}

- (NSArray)matchingSelectors
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSRuleMatch;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("matchingSelectors"));
  Inspector::toObjCIntegerArray(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

@end
