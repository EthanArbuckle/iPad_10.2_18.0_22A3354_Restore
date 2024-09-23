@implementation TUIElementMenuItem

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementMenuItemBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementMenuItemBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIMenuItemBuilding;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7;
  _TUIElementMenuItemBuilder *v8;
  id v9;

  v7 = a5;
  v8 = objc_alloc_init(_TUIElementMenuItemBuilder);
  -[_TUIElementMenuItemBuilder setIsEnabled:](v8, "setIsEnabled:", objc_msgSend(v7, "BOOLForAttribute:withDefault:node:", 74, 1, a3.var0));
  v9 = objc_msgSend(v7, "BOOLForAttribute:node:", 145, a3.var0);

  -[_TUIElementMenuItemBuilder setIsOn:](v8, "setIsOn:", v9);
  return v8;
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "finalizeMenuItem"));
  objc_msgSend(v6, "addModel:", v7);

}

@end
