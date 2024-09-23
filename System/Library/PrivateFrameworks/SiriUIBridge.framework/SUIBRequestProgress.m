@implementation SUIBRequestProgress

- (SUIBRequestProgress)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBRequestProgressMutation *);
  SUIBRequestProgress *v5;
  SUIBRequestProgress *v6;
  SUIBRequestProgressMutation *v7;
  uint64_t v8;
  SUIBNLRouterSummary *nlRouterSummary;
  uint64_t v10;
  SUIBIntelligenceFlowActionSummary *intelligenceFlowActionSummary;
  objc_super v13;

  v4 = (void (**)(id, SUIBRequestProgressMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)SUIBRequestProgress;
  v5 = -[SUIBRequestProgress init](&v13, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBRequestProgressMutation);
    v4[2](v4, v7);
    v6->_progressType = -[SUIBRequestProgressMutation progressType](v7, "progressType");
    -[SUIBRequestProgressMutation nlRouterSummary](v7, "nlRouterSummary");
    v8 = objc_claimAutoreleasedReturnValue();
    nlRouterSummary = v6->_nlRouterSummary;
    v6->_nlRouterSummary = (SUIBNLRouterSummary *)v8;

    -[SUIBRequestProgressMutation intelligenceFlowActionSummary](v7, "intelligenceFlowActionSummary");
    v10 = objc_claimAutoreleasedReturnValue();
    intelligenceFlowActionSummary = v6->_intelligenceFlowActionSummary;
    v6->_intelligenceFlowActionSummary = (SUIBIntelligenceFlowActionSummary *)v10;

  }
  return v6;
}

- (SUIBRequestProgress)init
{
  return -[SUIBRequestProgress initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBRequestProgress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  SUIBRequestProgress *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBRequestProgress::progressType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBRequestProgress::nlRouterSummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBRequestProgress::intelligenceFlowActionSummary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37__SUIBRequestProgress_initWithCoder___block_invoke;
  v13[3] = &unk_2518A4488;
  v15 = v8;
  v16 = v6;
  v14 = v7;
  v9 = v8;
  v10 = v7;
  v11 = -[SUIBRequestProgress initWithBuilder:](self, "initWithBuilder:", v13);

  return v11;
}

void __37__SUIBRequestProgress_initWithCoder___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setProgressType:", v3);
  objc_msgSend(v4, "setNlRouterSummary:", a1[4]);
  objc_msgSend(v4, "setIntelligenceFlowActionSummary:", a1[5]);

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t progressType;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  progressType = self->_progressType;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", progressType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SUIBRequestProgress::progressType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_nlRouterSummary, CFSTR("SUIBRequestProgress::nlRouterSummary"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_intelligenceFlowActionSummary, CFSTR("SUIBRequestProgress::intelligenceFlowActionSummary"));

}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (SUIBNLRouterSummary)nlRouterSummary
{
  return self->_nlRouterSummary;
}

- (SUIBIntelligenceFlowActionSummary)intelligenceFlowActionSummary
{
  return self->_intelligenceFlowActionSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceFlowActionSummary, 0);
  objc_storeStrong((id *)&self->_nlRouterSummary, 0);
}

@end
