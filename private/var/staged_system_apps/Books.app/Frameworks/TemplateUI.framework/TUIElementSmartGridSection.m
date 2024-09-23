@implementation TUIElementSmartGridSection

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)shouldAutoEnumerateNode
{
  return 1;
}

+ (BOOL)allowEmptyEnumerator
{
  return 1;
}

+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding
{
  return 1;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUISectionModel, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementSmartSectionBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUIElementSmartGridSectionConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  id v10;

  var0 = a4.var0;
  v8 = a5;
  v10 = a3;
  objc_msgSend(v10, "setColumns:", objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 52, 0x7FFFFFFFFFFFFFFFLL, var0));
  v9 = objc_msgSend(v8, "unsignedIntegerForAttribute:withDefault:node:", 177, 0x7FFFFFFFFFFFFFFFLL, var0);

  objc_msgSend(v10, "setRows:", v9);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  objc_msgSend(a4, "finalizeModelsWithParent:context:", a3, a5);
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  _objc_msgSend(a4, "addSection:", a3);
}

@end
