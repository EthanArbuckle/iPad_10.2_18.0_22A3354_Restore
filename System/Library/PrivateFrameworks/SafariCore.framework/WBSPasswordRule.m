@implementation WBSPasswordRule

+ (id)ruleWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPasswordRuleType:value:", a3, v6);

  return v7;
}

- (WBSPasswordRule)initWithPasswordRuleType:(int64_t)a3 value:(id)a4
{
  id v7;
  WBSPasswordRule *v8;
  WBSPasswordRule *v9;
  WBSPasswordRule *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordRule;
  v8 = -[WBSPasswordRule init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_value, a4);
    v10 = v9;
  }

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
