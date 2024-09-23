@implementation INCodableObjectAttribute

id __90__INCodableObjectAttribute_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_parameterStateForIntentValue:parameterDefinition:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
