@implementation TUIElementImage

+ (id)supportedAttributes
{
  if (qword_2CB720 != -1)
    dispatch_once(&qword_2CB720, &stru_241520);
  return (id)qword_2CB718;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIImageBox, a2);
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 173, a4.var0));
  objc_msgSend(v29, "setLoad:", TUIResourceLoadFromString(v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 87, a4.var0));
  objc_msgSend(v29, "setFilter:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 86, a4.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox layerContentsGravityFromString:](TUIBox, "layerContentsGravityFromString:", v13));
  objc_msgSend(v29, "setContentsGravity:", v14);

  v15 = objc_msgSend(v9, "lengthForAttribute:node:", 115, a4.var0);
  objc_msgSend(v29, "setIntrinsicWidth:", v15, v16);
  v17 = objc_msgSend(v9, "lengthForAttribute:node:", 114, a4.var0);
  objc_msgSend(v29, "setIntrinsicHeight:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 126, a4.var0));
  objc_msgSend(v29, "setMaskColor:", v19);

  objc_msgSend(v9, "floatForAttribute:node:", 60, a4.var0);
  objc_msgSend(v29, "setCornerRadius:");
  objc_msgSend(v29, "setContinuousCorners:", objc_msgSend(v9, "BOOLForAttribute:withDefault:node:", 59, 1, a4.var0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 80, a4.var0));
  objc_msgSend(v29, "setFallbackColor:", v20);

  objc_msgSend(v29, "setHflipForRTL:", objc_msgSend(v9, "BOOLForAttribute:node:", 99, a4.var0));
  objc_msgSend(v29, "setCrossfadesContents:", objc_msgSend(v9, "BOOLForAttribute:node:", 63, a4.var0));
  objc_msgSend(v29, "setShouldRasterize:", objc_msgSend(v9, "BOOLForAttribute:node:", 162, a4.var0));
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 146, a4.var0, 1.0);
  v22 = fmin(v21, 1.0);
  if (v22 < 0.0)
    v22 = 0.0;
  objc_msgSend(v29, "setOpacity:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 37, a4.var0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox blendModeFromString:](TUIImageBox, "blendModeFromString:", v23));
  objc_msgSend(v29, "setBlendMode:", v24);

  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 127, a4.var0, NAN);
  objc_msgSend(v29, "setMaxAspectRatio:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 213, a4.var0));
  if (v25)
  {
    objc_msgSend(v29, "setUrlString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseURLForNode:", a4.var0));
    objc_msgSend(v29, "setBaseURL:", v26);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 172, a4.var0));
    objc_msgSend(v29, "setResourceKind:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 171, a4.var0));
    objc_msgSend(v29, "setResourceInstance:", v28);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 174, a4.var0));
    objc_msgSend(v29, "setResourceOptions:", v26);
  }

}

@end
