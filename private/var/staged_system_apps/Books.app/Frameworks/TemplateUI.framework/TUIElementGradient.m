@implementation TUIElementGradient

+ (id)supportedAttributes
{
  if (qword_2CB198 != -1)
    dispatch_once(&qword_2CB198, &stru_23D810);
  return (id)qword_2CB190;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIGradient, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 196, a4.var0));
  objc_msgSend(v20, "setGradientStartColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 75, a4.var0));
  objc_msgSend(v20, "setGradientEndColor:", v12);

  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 197, a4.var0, 0.0);
  objc_msgSend(v20, "setGradientStartPosition:");
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 76, a4.var0, 1.0);
  objc_msgSend(v20, "setGradientEndPosition:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 68, a4.var0));
  objc_msgSend(v20, "setGradientDirection:", +[TUIGradient directionFromString:](TUIGradient, "directionFromString:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 37, a4.var0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUIGradient, "blendModeFromString:", v14));
  objc_msgSend(v20, "setBlendMode:", v15);

  objc_msgSend(v20, "setContinuousCorners:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 59, 1, a4.var0));
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 38, a4.var0, 0.0);
  objc_msgSend(v20, "setGradientBlurOffset:");
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 39, a4.var0, 0.0);
  objc_msgSend(v20, "setGradientBlurRadius:");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "gradientStartColor"));

  if (!v16)
    objc_msgSend(v10, "reportError:", 1022);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "gradientEndColor"));

  if (!v17)
    objc_msgSend(v10, "reportError:", 1023);
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 146, a4.var0, 1.0);
  v19 = fmin(v18, 1.0);
  if (v19 < 0.0)
    v19 = 0.0;
  objc_msgSend(v20, "setOpacity:", v19);

}

+ (BOOL)instantiateChildren
{
  return 0;
}

@end
