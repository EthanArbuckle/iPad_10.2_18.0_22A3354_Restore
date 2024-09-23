@implementation TUIElementLayoutOption

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUILayoutOptionBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  double v9;
  double v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v11 = a3;
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 135, var0, NAN);
  objc_msgSend(v11, "setMinScale:");
  objc_msgSend(v8, "floatForAttribute:withDefault:node:", 131, var0, NAN);
  v10 = v9;

  objc_msgSend(v11, "setMaxScale:", v10);
}

@end
