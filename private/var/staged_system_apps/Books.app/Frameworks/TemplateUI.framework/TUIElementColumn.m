@implementation TUIElementColumn

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIColumnBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  var0 = a4.var0;
  v8 = a5;
  v12 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForAttribute:node:", 55, var0));
  objc_msgSend(v12, "setColumnSpan:", v9);

  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 57, var0, NAN);
  v11 = v10;

  objc_msgSend(v12, "setContainerFraction:", v11);
}

@end
