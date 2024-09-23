@implementation TUIElementSymbolImage

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUISymbolImageBox, a2);
}

+ (BOOL)supportAttribute:(unsigned __int16)a3 feature:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("multicolor"));
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  uint64_t var0;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIFontWeight v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a5;
  var0 = a4.var0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontSpecForNode:", a4.var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 137, var0));
  objc_msgSend(v8, "setName:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 192, var0));
  objc_msgSend(v8, "setScale:", +[TUISymbolImageBox scaleFromString:](TUISymbolImageBox, "scaleFromString:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 222, var0));
  objc_msgSend(v11, "weight");
  objc_msgSend(v8, "setWeight:", +[TUISymbolImageBox weightFromString:withDefault:](TUISymbolImageBox, "weightFromString:withDefault:", v14, UIImageSymbolWeightForFontWeight(v15)));

  if (v11)
    objc_msgSend(v11, "pointSize");
  else
    v16 = 17.0;
  objc_msgSend(v8, "setFontSize:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 167, var0));
  objc_msgSend(v8, "setRenderingMode:", +[TUISymbolImageBox renderingModeFromString:](TUISymbolImageBox, "renderingModeFromString:", v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "foregroundColor"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "foregroundColor"));
    v23 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v8, "setColors:", v20);

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorArrayForAttribute:node:", 51, var0));
    objc_msgSend(v8, "setColors:", v19);
  }

  objc_msgSend(v8, "setBaseline:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 33, 1, var0));
  objc_msgSend(v9, "insetsForAttribute:withDefault:node:", 112, var0, NAN, NAN, NAN, NAN);
  objc_msgSend(v8, "setInsets:");
  objc_msgSend(v8, "setHflipForRTL:", objc_msgSend(v9, "BOOLForAttribute:node:", 99, var0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 37, var0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUISymbolImageBox, "blendModeFromString:", v21));
  objc_msgSend(v8, "setBlendMode:", v22);

}

@end
