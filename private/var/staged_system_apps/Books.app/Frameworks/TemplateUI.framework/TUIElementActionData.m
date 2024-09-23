@implementation TUIElementActionData

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIActionDataBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementActionDataObject, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 137, var0));
  objc_msgSend(v9, "setKey:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 215, var0));
  objc_msgSend(v9, "setValue:", v11);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
    objc_msgSend(v6, "setActionData:forKey:", v8, v9);

  }
}

@end
