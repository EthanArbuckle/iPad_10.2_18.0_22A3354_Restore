@implementation SUIBIntelligenceFlowActionSummary

- (SUIBIntelligenceFlowActionSummary)initWithBuilder:(id)a3
{
  void (**v4)(id, SUIBIntelligenceFlowActionSummaryMutation *);
  SUIBIntelligenceFlowActionSummary *v5;
  SUIBIntelligenceFlowActionSummary *v6;
  SUIBIntelligenceFlowActionSummaryMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *formatString;
  void *v11;
  uint64_t v12;
  NSDictionary *parameterSummaries;
  objc_super v15;

  v4 = (void (**)(id, SUIBIntelligenceFlowActionSummaryMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SUIBIntelligenceFlowActionSummary;
  v5 = -[SUIBIntelligenceFlowActionSummary init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SUIBIntelligenceFlowActionSummaryMutation);
    v4[2](v4, v7);
    -[SUIBIntelligenceFlowActionSummaryMutation formatString](v7, "formatString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    formatString = v6->_formatString;
    v6->_formatString = (NSString *)v9;

    -[SUIBIntelligenceFlowActionSummaryMutation parameterSummaries](v7, "parameterSummaries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    parameterSummaries = v6->_parameterSummaries;
    v6->_parameterSummaries = (NSDictionary *)v12;

  }
  return v6;
}

- (SUIBIntelligenceFlowActionSummary)init
{
  return -[SUIBIntelligenceFlowActionSummary initWithBuilder:](self, "initWithBuilder:", &__block_literal_global);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUIBIntelligenceFlowActionSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  SUIBIntelligenceFlowActionSummary *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUIBIntelligenceFlowActionSummary::formatString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("SUIBIntelligenceFlowActionSummary::parameterSummaries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__SUIBIntelligenceFlowActionSummary_initWithCoder___block_invoke;
  v12[3] = &unk_2518A42E8;
  v13 = v5;
  v14 = v7;
  v8 = v7;
  v9 = v5;
  v10 = -[SUIBIntelligenceFlowActionSummary initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

void __51__SUIBIntelligenceFlowActionSummary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFormatString:", v3);
  objc_msgSend(v4, "setParameterSummaries:", *(_QWORD *)(a1 + 40));

}

- (void)encodeWithCoder:(id)a3
{
  NSString *formatString;
  id v5;

  formatString = self->_formatString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", formatString, CFSTR("SUIBIntelligenceFlowActionSummary::formatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameterSummaries, CFSTR("SUIBIntelligenceFlowActionSummary::parameterSummaries"));

}

- (id)parameterMatches
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUIBRegexMatch *v11;
  SUIBRegexMatch *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SUIBIntelligenceFlowActionSummary formatString](self, "formatString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUIBIntelligenceFlowActionSummaryParameterMatcher matchesIn:](SUIBIntelligenceFlowActionSummaryParameterMatcher, "matchesIn:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [SUIBRegexMatch alloc];
        v12 = -[SUIBRegexMatch initWithBridgedMatch:](v11, "initWithBridgedMatch:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSDictionary)parameterSummaries
{
  return self->_parameterSummaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSummaries, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end
