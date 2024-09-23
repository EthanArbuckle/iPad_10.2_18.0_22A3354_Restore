@implementation TUIElementConfiguration

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIConfigurationConsuming;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIConfiguration, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementConfigurationBuilder, a2);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "finalizeConfiguration"));
  objc_msgSend(v6, "setData:", v7);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  _objc_msgSend(a4, "addConfiguration:", a3);
}

@end
