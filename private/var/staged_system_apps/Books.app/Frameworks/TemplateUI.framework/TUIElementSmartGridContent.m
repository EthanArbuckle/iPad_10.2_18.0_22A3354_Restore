@implementation TUIElementSmartGridContent

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding
{
  return 1;
}

+ (BOOL)shouldAutoEnumerateNode
{
  return 1;
}

+ (BOOL)allowEmptyEnumerator
{
  return 1;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUISmartGridContentBuilder, a2);
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUICellModel, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUIElementSmartGridCellConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "identifierWithNode:", var0));
  objc_msgSend(v8, "setIdentifier:", v9);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "configureCell:", v9);
  objc_msgSend(v8, "finalizeModelsWithParent:context:", v9, v7);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  _objc_msgSend(a4, "addCell:", a3);
}

@end
