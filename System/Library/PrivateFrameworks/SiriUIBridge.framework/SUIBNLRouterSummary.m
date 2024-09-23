@implementation SUIBNLRouterSummary

- (SUIBNLRouterSummary)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBNLRouterSummaryMutation *);
  SUIBNLRouterSummary *v5;
  SUIBNLRouterSummary *v6;
  SUIBNLRouterSummaryMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *rewrittenUtterance;
  objc_super v12;

  v4 = (void (**)(id, SUIBNLRouterSummaryMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBNLRouterSummary;
  v5 = -[SUIBNLRouterSummary init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBNLRouterSummaryMutation);
    v4[2](v4, v7);
    -[SUIBNLRouterSummaryMutation rewrittenUtterance](v7, "rewrittenUtterance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    rewrittenUtterance = v6->_rewrittenUtterance;
    v6->_rewrittenUtterance = (NSString *)v9;

  }
  return v6;
}

- (SUIBNLRouterSummary)init
{
  return -[SUIBNLRouterSummary initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBNLRouterSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SUIBNLRouterSummary *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBNLRouterSummary::rewrittenUtterance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__SUIBNLRouterSummary_initWithCoder___block_invoke;
  v9[3] = &unk_2518A43B8;
  v10 = v5;
  v6 = v5;
  v7 = -[SUIBNLRouterSummary initWithBuilder:](self, "initWithBuilder:", v9);

  return v7;
}

uint64_t __37__SUIBNLRouterSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRewrittenUtterance:", *(_QWORD *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_rewrittenUtterance, CFSTR("SUIBNLRouterSummary::rewrittenUtterance"));
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
}

@end
