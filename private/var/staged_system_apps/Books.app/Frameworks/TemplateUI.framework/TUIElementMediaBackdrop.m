@implementation TUIElementMediaBackdrop

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIMediaBackdropBox, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(TUISingleContentBoxBuilder, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  uint64_t var0;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v9 = a5;
  v10 = a6;
  var0 = a4.var0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 173, a4.var0));
  objc_msgSend(v24, "setLoad:", TUIResourceLoadFromString(v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 86, var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox layerContentsGravityFromString:](TUIBox, "layerContentsGravityFromString:", v13));
  objc_msgSend(v24, "setContentsGravity:", v14);

  objc_msgSend(v9, "floatForAttribute:node:", 60, var0);
  objc_msgSend(v24, "setCornerRadius:");
  objc_msgSend(v24, "setContinuousCorners:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 59, 1, var0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 80, var0));
  objc_msgSend(v24, "setFallbackColor:", v15);

  objc_msgSend(v24, "setCrossfadesContents:", objc_msgSend(v9, "BOOLForAttribute:node:", 63, var0));
  objc_msgSend(v24, "setShouldRasterize:", objc_msgSend(v9, "BOOLForAttribute:node:", 162, var0));
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 146, var0, 1.0);
  v17 = fmin(v16, 1.0);
  if (v17 < 0.0)
    v17 = 0.0;
  objc_msgSend(v24, "setOpacity:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 37, var0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUIImageBox, "blendModeFromString:", v18));
  objc_msgSend(v24, "setBlendMode:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 213, var0));
  if (v20)
  {
    objc_msgSend(v24, "setUrlString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseURLForNode:", var0));
    objc_msgSend(v24, "setBaseURL:", v21);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 172, var0));
    objc_msgSend(v24, "setResourceKind:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 171, var0));
    objc_msgSend(v24, "setResourceInstance:", v23);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 174, var0));
    objc_msgSend(v24, "setResourceOptions:", v21);
  }

}

@end
