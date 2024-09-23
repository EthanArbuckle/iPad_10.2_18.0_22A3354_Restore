@implementation TUIElementComponentViewState

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a6;
  v8 = objc_msgSend(a5, "bindingNameForAttribute:node:", 137, a4.var0);
  v9 = v8;
  if (TUINameIsValid(v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentViewStateWithName:", v9));
    objc_msgSend(v11, "defineComponentBindingWithName:value:", v9, v10);

  }
}

@end
