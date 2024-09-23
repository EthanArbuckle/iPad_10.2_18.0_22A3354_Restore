@implementation TUIElementComponentBind

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB5B8 != -1)
    dispatch_once(&qword_2CB5B8, &stru_2408A8);
  return (id)qword_2CB5B0;
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
  id v11;

  var0 = a4.var0;
  v8 = a6;
  v9 = a5;
  v10 = objc_msgSend(v9, "bindingNameForAttribute:node:", 137, var0);
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 215, var0));

  objc_msgSend(v8, "defineComponentBindingWithName:value:", v10, v11);
}

@end
