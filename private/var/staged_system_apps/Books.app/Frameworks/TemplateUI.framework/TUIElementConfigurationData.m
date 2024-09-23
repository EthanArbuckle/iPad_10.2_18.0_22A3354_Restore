@implementation TUIElementConfigurationData

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIConfigurationBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 137, a4.var0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 215, a4.var0));

  if (v9 && v10)
    objc_msgSend(v11, "addConfigurationData:withKey:", v10, v9);

}

@end
