@implementation BSUIElementSeriesStackImage

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(BSUISeriesStackImageBox, a2);
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
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 173, a4.var0));
  objc_msgSend(v28, "setLoad:", TUIResourceLoadFromString());

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 87, a4.var0));
  objc_msgSend(v28, "setFilter:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 86, a4.var0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBox layerContentsGravityFromString:](TUIBox, "layerContentsGravityFromString:", v13));
  objc_msgSend(v28, "setContentsGravity:", v14);

  v15 = objc_msgSend(v9, "lengthForAttribute:node:", 223, a4.var0);
  objc_msgSend(v28, "setWidth:", v15, v16);
  v17 = objc_msgSend(v9, "lengthForAttribute:node:", 115, a4.var0);
  objc_msgSend(v28, "setIntrinsicWidth:", v17, v18);
  v19 = objc_msgSend(v9, "lengthForAttribute:node:", 114, a4.var0);
  objc_msgSend(v28, "setIntrinsicHeight:", v19, v20);
  objc_msgSend(v9, "floatForAttribute:withDefault:node:", 127, a4.var0, 1.56);
  objc_msgSend(v28, "setMaxAspectRatio:");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorForAttribute:node:", 80, a4.var0));
  objc_msgSend(v28, "setFallbackColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseURLForNode:", a4.var0));
  objc_msgSend(v28, "setBaseURL:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringArrayForAttribute:node:", 61, a4.var0));
  if (objc_msgSend(v23, "count"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringArrayForAttribute:node:", 62, a4.var0));
    objc_msgSend(v28, "setCoverFilters:", v24);

    objc_msgSend(v28, "setCoverURLStrings:", v23);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringForAttribute:node:", 172, a4.var0));
    objc_msgSend(v28, "setResourceKind:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 171, a4.var0));
    objc_msgSend(v28, "setResourceInstance:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForAttribute:node:", 174, a4.var0));
    objc_msgSend(v28, "setResourceOptions:", v27);

  }
}

@end
