@implementation TUIElementVisualEffect

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2CB608 != -1)
    dispatch_once(&qword_2CB608, &stru_240E98);
  return (id)qword_2CB600;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIVisualEffectBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUISingleContentBoxBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  id v9;

  var0 = a4.var0;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 40, var0));
  objc_msgSend(v8, "setBlurStyle:", +[TUIVisualEffectBox blurEffectStyleFromString:](TUIVisualEffectBox, "blurEffectStyleFromString:", v9));

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5;

  v5 = objc_msgSend(a4, "finalizeModelsWithParent:box:context:", a3, a3, a5);
}

@end
