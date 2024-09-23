@implementation TUIElementAspectBox

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIAspectBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;

  var0 = a4.var0;
  v8 = a3;
  objc_msgSend(a5, "floatForAttribute:withDefault:node:", 13, var0, 1.0);
  objc_msgSend(v8, "setAspectRatio:");

}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  uint64_t var0;
  id v9;
  id v10;
  void *v11;
  id v12;

  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 96, var0));
  objc_msgSend(v10, "setHalign:", +[TUIBox halignFromString:](TUIBox, "halignFromString:", v11));

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 216, var0));
  objc_msgSend(v10, "setValign:", +[TUIBox valignFromString:](TUIBox, "valignFromString:", v12));

}

@end
