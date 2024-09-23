@implementation TUIElementStyledBox

+ (id)supportedAttributes
{
  if (qword_2CB908 != -1)
    dispatch_once(&qword_2CB908, &stru_242920);
  return (id)qword_2CB900;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIStyledBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUISingleContentBoxBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  var0 = a4.var0;
  v8 = a5;
  v15 = a3;
  objc_msgSend(v8, "insetsForAttribute:node:", 112, var0);
  objc_msgSend(v15, "setInsets:");
  objc_msgSend(v8, "floatForAttribute:node:", 60, var0);
  objc_msgSend(v15, "setCornerRadius:");
  objc_msgSend(v15, "setContinuousCorners:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 59, 1, var0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 30, var0));
  objc_msgSend(v15, "setBackgroundColor:", v9);

  objc_msgSend(v8, "floatForAttribute:node:", 188, var0);
  objc_msgSend(v15, "setShadowRadius:");
  objc_msgSend(v8, "sizeForAttribute:node:", 186, var0);
  objc_msgSend(v15, "setShadowOffset:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 185, var0));
  objc_msgSend(v15, "setShadowColor:", v10);

  objc_msgSend(v8, "floatForAttribute:node:", 187, var0);
  objc_msgSend(v15, "setShadowOpacity:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "colorForAttribute:node:", 41, var0));
  objc_msgSend(v15, "setBorderColor:", v11);

  objc_msgSend(v8, "floatForAttribute:node:", 42, var0);
  objc_msgSend(v15, "setBorderWidth:");
  objc_msgSend(v15, "setClipsToBounds:", objc_msgSend(v8, "BOOLForAttribute:node:", 50, var0));
  objc_msgSend(v15, "setAllowsGroupBlending:", objc_msgSend(v8, "BOOLForAttribute:withDefault:node:", 5, 0, var0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringForAttribute:node:", 37, var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUIStyledBox, "blendModeFromString:", v12));
  objc_msgSend(v15, "setBlendMode:", v13);

  v14 = objc_msgSend(v8, "BOOLForAttribute:node:", 93, var0);
  objc_msgSend(v15, "setGrouped:", v14);

}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5;

  v5 = objc_msgSend(a4, "finalizeModelsWithParent:box:context:", a3, a3, a5);
}

@end
