@implementation SUIBIntelligenceFlowParameterSummary

- (SUIBIntelligenceFlowParameterSummary)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBIntelligenceFlowParameterSummaryMutation *);
  SUIBIntelligenceFlowParameterSummary *v5;
  SUIBIntelligenceFlowParameterSummary *v6;
  SUIBIntelligenceFlowParameterSummaryMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *value;
  objc_super v12;

  v4 = (void (**)(id, SUIBIntelligenceFlowParameterSummaryMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)SUIBIntelligenceFlowParameterSummary;
  v5 = -[SUIBIntelligenceFlowParameterSummary init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBIntelligenceFlowParameterSummaryMutation);
    v4[2](v4, v7);
    v6->_valueType = -[SUIBIntelligenceFlowParameterSummaryMutation valueType](v7, "valueType");
    -[SUIBIntelligenceFlowParameterSummaryMutation value](v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    value = v6->_value;
    v6->_value = (NSString *)v9;

  }
  return v6;
}

- (SUIBIntelligenceFlowParameterSummary)init
{
  return -[SUIBIntelligenceFlowParameterSummary initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBIntelligenceFlowParameterSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  SUIBIntelligenceFlowParameterSummary *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBIntelligenceFlowParameterSummary::valueType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBIntelligenceFlowParameterSummary::value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SUIBIntelligenceFlowParameterSummary_initWithCoder___block_invoke;
  v11[3] = &unk_2518A4350;
  v12 = v7;
  v13 = v6;
  v8 = v7;
  v9 = -[SUIBIntelligenceFlowParameterSummary initWithBuilder:](self, "initWithBuilder:", v11);

  return v9;
}

void __54__SUIBIntelligenceFlowParameterSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setValueType:", v3);
  objc_msgSend(v4, "setValue:", *(_QWORD *)(a1 + 32));

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t valueType;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  valueType = self->_valueType;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", valueType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SUIBIntelligenceFlowParameterSummary::valueType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_value, CFSTR("SUIBIntelligenceFlowParameterSummary::value"));
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
