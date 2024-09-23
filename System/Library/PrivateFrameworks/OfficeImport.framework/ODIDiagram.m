@implementation ODIDiagram

+ (id)mapDiagram:(id)a3 drawingTheme:(id)a4
{
  id v5;
  id v6;
  OADGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  OADOrientedBounds *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  OADOrientedBounds *v42;
  void *v43;
  void *v44;
  ODIState *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(OADGroup);
  -[OADDrawable setHidden:](v7, "setHidden:", objc_msgSend(v5, "hidden"));
  -[OADDrawable setId:](v7, "setId:", objc_msgSend(v5, "id"));
  objc_msgSend(v5, "drawableProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAltDescription:", v9);

  objc_msgSend(v5, "drawableProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orientedBounds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOrientedBounds:", v12);

  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawableProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAspectRatioLocked:", objc_msgSend(v15, "isAspectRatioLocked"));

  objc_msgSend(v5, "drawableProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clickHyperlink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClickHyperlink:", v17);

  objc_msgSend(v5, "drawableProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hoverHyperlink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHoverHyperlink:", v20);

  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawableProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWrdInline:", objc_msgSend(v23, "isWrdInline"));

  objc_msgSend(v5, "clientData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable setClientData:](v7, "setClientData:", v24);

  objc_msgSend(v5, "parent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawable setParent:](v7, "setParent:", v25);

  objc_msgSend(v5, "drawableProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "orientedBounds");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = [OADOrientedBounds alloc];
  objc_msgSend(v27, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v27, "rotation");
  v38 = v37;
  v39 = objc_msgSend(v27, "flipX");
  v40 = objc_msgSend(v27, "flipY");
  LODWORD(v41) = v38;
  v42 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v28, "initWithBounds:rotation:flipX:flipY:", v39, v40, v30, v32, v34, v36, v41);

  -[OADDrawable drawableProperties](v7, "drawableProperties");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setOrientedBounds:", v42);

  objc_msgSend(v5, "equivalentDrawables");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "count"))
  {
    -[OADGroup addChildren:](v7, "addChildren:", v44);
    -[OADOrientedBounds bounds](v42, "bounds");
    -[OADGroup setLogicalBounds:](v7, "setLogicalBounds:", TSURectWithSize());
  }
  else
  {
    v45 = -[ODIState initWithDiagram:group:drawingTheme:]([ODIState alloc], "initWithDiagram:group:drawingTheme:", v5, v7, v6);
    objc_msgSend(v5, "documentPoint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "children");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48)
    {
      objc_msgSend(v46, "propertySet");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "layoutTypeId");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mapLayoutTypeId:state:", v50, v45);

    }
  }

  return v7;
}

void __38__ODIDiagram_mapDiagram_drawingTheme___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

+ (void)mapLayoutTypeId:(id)a3 state:(id)a4
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("urn:microsoft.com/office/officeart/2005/8/layout/")) & 1) != 0)
  {
    v6 = CFSTR("urn:microsoft.com/office/officeart/2005/8/layout/");
  }
  else
  {
    if ((objc_msgSend(v12, "hasPrefix:", CFSTR("urn:microsoft.com/office/officeart/2008/layout/")) & 1) == 0)
    {
      +[ODILinear mapUnknownWithState:](ODILinear, "mapUnknownWithState:", v5);
      goto LABEL_29;
    }
    v6 = CFSTR("urn:microsoft.com/office/officeart/2008/layout/");
  }
  v7 = objc_msgSend(v12, "rangeOfString:", CFSTR("#"));
  if (v8)
  {
    objc_msgSend(v12, "substringToIndex:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v9;
  }
  objc_msgSend(v12, "substringFromIndex:", -[__CFString length](v6, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AlternatingHexagons")) & 1) != 0)
  {
    v11 = CFSTR("vList2");
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AlternatingPictureBlocks")) & 1) != 0)
  {
    v11 = CFSTR("vList7");
  }
  else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LinedList")) & 1) != 0)
  {
    v11 = CFSTR("vList8");
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("AccentedPicture")))
      goto LABEL_17;
    v11 = CFSTR("vList9");
  }

  v10 = (void *)v11;
LABEL_17:
  if (!+[ODIBending mapIdentifier:state:](ODIBending, "mapIdentifier:state:", v10, v5)
    && !+[ODILinear mapIdentifier:state:](ODILinear, "mapIdentifier:state:", v10, v5)
    && !+[ODICycle mapIdentifier:state:](ODICycle, "mapIdentifier:state:", v10, v5)
    && !+[ODIVenn mapIdentifier:state:](ODIVenn, "mapIdentifier:state:", v10, v5)
    && !+[ODIPyramid mapIdentifier:state:](ODIPyramid, "mapIdentifier:state:", v10, v5)
    && !+[ODIHierarchy mapIdentifier:state:](ODIHierarchy, "mapIdentifier:state:", v10, v5)
    && !+[ODIArrow mapIdentifier:state:](ODIArrow, "mapIdentifier:state:", v10, v5)
    && !+[ODIArrow3 mapIdentifier:state:](ODIArrow3, "mapIdentifier:state:", v10, v5)
    && !+[ODIArrow4 mapIdentifier:state:](ODIArrow4, "mapIdentifier:state:", v10, v5)
    && !+[ODIHorizonalList3 mapIdentifier:state:](ODIHorizonalList3, "mapIdentifier:state:", v10, v5))
  {
    +[ODILinear mapUnknownWithState:](ODILinear, "mapUnknownWithState:", v5);
  }

LABEL_29:
}

@end
