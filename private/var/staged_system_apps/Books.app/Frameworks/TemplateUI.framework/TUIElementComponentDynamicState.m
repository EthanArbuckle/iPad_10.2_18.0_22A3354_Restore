@implementation TUIElementComponentDynamicState

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB5C8 != -1)
    dispatch_once(&qword_2CB5C8, &stru_2408C8);
  return (id)qword_2CB5C0;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  var0 = a4.var0;
  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(v9, "bindingNameForAttribute:node:", 137, var0);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 116, var0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 113, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 150, var0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicStateForKind:instance:parameters:", v14, v11, v12));
  objc_msgSend(v8, "defineComponentBindingWithName:value:", v10, v13);

}

@end
