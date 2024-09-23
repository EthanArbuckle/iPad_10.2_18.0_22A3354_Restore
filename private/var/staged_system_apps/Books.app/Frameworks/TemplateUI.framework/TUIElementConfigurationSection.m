@implementation TUIElementConfigurationSection

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIConfigurationBuilding;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementConfigurationSectionBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementConfigurationSectionBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 137, var0));
  objc_msgSend(v8, "setName:", v9);

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
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "finalizeConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  if (v8 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    objc_msgSend(v6, "addConfigurationData:withKey:", v7, v9);

  }
}

@end
