@implementation TUIElementTextPlain

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIPlainTextConsuming;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementTextPlainBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextPlainBuilder, a2);
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 176, var0));
  objc_msgSend(v8, "setRole:", v9);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));

  objc_msgSend(v6, "addText:forRole:", v9, v8);
}

@end
