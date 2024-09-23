@implementation LNQueryParameterMetadata(Workflow)

- (id)wf_supportedContentOperators
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  WFContentOperatorToLNComparisonPropertyMapping();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "comparators");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__LNQueryParameterMetadata_Workflow__wf_supportedContentOperators__block_invoke;
  v7[3] = &unk_1E7AF3EA8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "if_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_propertyQueryWithValue:()Workflow contentOperator:parameterIndex:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a3;
  WFContentOperatorToLNComparisonPropertyMapping();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C18]), "initWithPropertyIndex:value:type:", v7, v8, objc_msgSend(v11, "unsignedIntegerValue"));
  return v12;
}

@end
