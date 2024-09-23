@implementation TUIElementSymbolImagePlain

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementSymbolImagePlainBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementSymbolImagePlainBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIPlainImageConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  uint64_t var0;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  UIFontWeight v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  TUIImageModel *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  TUIImageModel *v44;
  TUIImageModel *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;

  v9 = a5;
  v10 = a6;
  var0 = a4.var0;
  v12 = a3;
  v13 = v10;
  v49 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontSpecForNode:", a4.var0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "environment"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mappedSpecIfNeededWithEnvironment:", v15));

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 137, var0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 192, var0));
  v18 = +[TUISymbolImageBox scaleFromString:](TUISymbolImageBox, "scaleFromString:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 222, var0));
  objc_msgSend(v16, "weight");
  v21 = +[TUISymbolImageBox weightFromString:withDefault:](TUISymbolImageBox, "weightFromString:withDefault:", v19, UIImageSymbolWeightForFontWeight(v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 167, var0));
  v23 = +[TUISymbolImageBox renderingModeFromString:](TUISymbolImageBox, "renderingModeFromString:", v22);

  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 51, var0));
  v48 = (void *)v24;
  if (v24)
  {
    v51 = v24;
    v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  }
  else
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorArrayForAttribute:node:", 51, var0));
  }
  v26 = (void *)v25;
  objc_msgSend(v16, "pointSize");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration tui_configurationWithPointSize:weight:scale:renderingMode:colors:](UIImageSymbolConfiguration, "tui_configurationWithPointSize:weight:scale:renderingMode:colors:", v21, v18, v23, v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v50, v27));
  if (!v28)
  {
    v47 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "manager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageResourceCache"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "customImageBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v50, v31, v27));

    v13 = v10;
    v16 = v47;
  }
  if ((objc_msgSend(v28, "tui_isMulticolorSymbolWithSymbolRenderingMode:", v23) & 1) == 0
    && objc_msgSend(v26, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
    v33 = v16;
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithTintColor:", v32));

    v28 = (void *)v34;
    v16 = v33;
  }
  if (objc_msgSend(v9, "BOOLForAttribute:node:", 99, var0))
  {
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageFlippedForRightToLeftLayoutDirection"));

    v28 = (void *)v35;
  }
  if (v28)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierWithNode:", var0));
    v37 = v16;
    v38 = [TUIImageModel alloc];
    objc_msgSend(v28, "size");
    v40 = v39;
    v42 = v41;
    v43 = objc_msgSend(v28, "renderingMode");
    v44 = v38;
    v16 = v37;
    v45 = -[TUIImageModel initWithIdentifier:image:size:renderMode:alignmentRectInsets:](v44, "initWithIdentifier:image:size:renderMode:alignmentRectInsets:", v36, v28, v43, v40, v42, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v49, "setImageModel:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 176, var0));
  objc_msgSend(v49, "setRole:", v46);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));

  objc_msgSend(v6, "addImageModel:forRole:", v9, v8);
}

@end
