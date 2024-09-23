@implementation TUIElementTextFragmentInstantiator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  void *v8;
  id v9;

  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 0, a4.var0));
  if (v8)
    objc_msgSend(v9, "appendString:", v8);

}

@end
