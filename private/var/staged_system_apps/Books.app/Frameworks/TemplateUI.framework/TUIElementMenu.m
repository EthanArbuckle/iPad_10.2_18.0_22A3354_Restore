@implementation TUIElementMenu

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementMenuBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementMenuBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIMenuConsuming;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  _TUIElementMenuBuilder *v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = objc_alloc_init(_TUIElementMenuBuilder);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForAttribute:node:", 204, a3.var0));
  -[_TUIElementMenuBuilder setTitle:](v8, "setTitle:", v9);

  v10 = objc_msgSend(v7, "BOOLForAttribute:node:", 107, a3.var0);
  -[_TUIElementMenuBuilder setIsInline:](v8, "setIsInline:", v10);
  return v8;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "finalizeMenuItem"));
  objc_msgSend(v6, "addMenuContainer:", v7);

}

@end
