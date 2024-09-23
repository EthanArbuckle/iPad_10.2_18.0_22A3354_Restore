@implementation TUIElementShelf

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)supportOnlyImmediateChildrenForContainedBuilding
{
  return 1;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIShelfBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementShelfBuilder, a2);
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  objc_msgSend(a4, "finalizeModelsWithParent:context:", a3, a5);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  uint64_t v9;
  id v10;

  var0 = a4.var0;
  v10 = a3;
  v8 = objc_msgSend(a5, "lengthForAttribute:node:", 58, var0);
  objc_msgSend(v10, "setContentWidth:", v8, v9);

}

@end
