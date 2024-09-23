@implementation BSUIElementBooksUIComponent

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUIBooksUIComponentBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUIBoxAndActionBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  var0 = a4.var0;
  v8 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForAttribute:node:", 215, var0));
  v9 = objc_opt_class(NSDictionary);
  v10 = TUIDynamicCast(v9, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "setRawComponentModel:", v11);

}

@end
