@implementation TUIElementRule

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIRuleBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;
  void *v10;
  id v11;

  var0 = a4.var0;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 51, var0));
  objc_msgSend(v9, "setColor:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 16, var0));
  objc_msgSend(v9, "setAxis:", +[TUIBox axisFromString:](TUIBox, "axisFromString:", v11));

}

@end
