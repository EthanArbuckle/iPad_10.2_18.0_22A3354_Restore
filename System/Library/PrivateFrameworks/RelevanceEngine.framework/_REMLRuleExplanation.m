@implementation _REMLRuleExplanation

- (_REMLRuleExplanation)initWithRule:(id)a3
{
  id v5;
  _REMLRuleExplanation *v6;
  _REMLRuleExplanation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REMLRuleExplanation;
  v6 = -[_REMLRuleExplanation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rule, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
}

@end
