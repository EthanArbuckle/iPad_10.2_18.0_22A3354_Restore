@implementation TUIStyledBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v4, "insets");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v10 = objc_msgSend(v9, "validatedIntrinsicWidthConsideringSpecified");
  v12 = v11;

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v10, v12, v6 + v8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v4, "insets");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v10 = objc_msgSend(v9, "validatedIntrinsicHeightConsideringSpecified");
  v12 = v11;

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v10, v12, v6 + v8);
}

- (double)computedHeightAbovePivot
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v3, "insets");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  objc_msgSend(v6, "computedHeightAbovePivot");
  v8 = v5 + v7;

  return v8;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v19, "insets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  -[TUILayout flexedWidth](self, "flexedWidth");
  -[TUILayout flexedWidth](self, "flexedWidth");
  objc_msgSend(v20, "setFlexedWidth:", v11 - v6 - v10);
  -[TUILayout flexedHeight](self, "flexedHeight");
  -[TUILayout flexedHeight](self, "flexedHeight");
  objc_msgSend(v20, "setFlexedHeight:", v12 - v4 - v8);
  -[TUILayout computeWidth](self, "computeWidth");
  objc_msgSend(v20, "setContainingWidth:", v13 - v6 - v10);
  -[TUILayout containingHeight](self, "containingHeight");
  -[TUILayout containingHeight](self, "containingHeight");
  objc_msgSend(v20, "setContainingHeight:", v14 - v4 - v8);
  objc_msgSend(v20, "validateLayout");
  objc_msgSend(v20, "setComputedOrigin:", v6, v4);
  objc_msgSend(v20, "computedTransformedSize");
  v16 = v6 + v10 + v15;
  v18 = v4 + v8 + v17;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v16, v18);
  -[TUIStyledBoxLayout layoutNonContentChildrenWithSize:](self, "layoutNonContentChildrenWithSize:", v16, v18);

}

- (void)layoutNonContentChildrenWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  height = a3.height;
  width = a3.width;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "box"));
        v11 = objc_msgSend(v10, "role") == 0;

        if (!v11)
        {
          objc_msgSend(v9, "setContainingWidth:", width);
          objc_msgSend(v9, "setContainingHeight:", height);
          objc_msgSend(v9, "computedWidth");
          v13 = NAN;
          if ((v12 & 0x8000000000000) != 0)
            v13 = width;
          objc_msgSend(v9, "setFlexedWidth:", v13);
          objc_msgSend(v9, "computedHeight");
          v15 = NAN;
          if ((v14 & 0x8000000000000) != 0)
            v15 = height;
          objc_msgSend(v9, "setFlexedHeight:", v15);
          objc_msgSend(v9, "validateLayout");
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v5 = objc_msgSend(v4, "computedWidth");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v8, "insets");
  v10 = v9;
  v12 = v11;

  v13 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v5, v7, v10 + v12);
  return v13;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v5 = objc_msgSend(v4, "computedHeight");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v8, "insets");
  v10 = v9;
  v12 = v11;

  v13 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthWithDelta((uint64_t)v5, v7, v10 + v12);
  return v13;
}

- (void)onChildrenUpdated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIStyledBoxLayout;
  -[TUILayout onChildrenUpdated](&v3, "onChildrenUpdated");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
  -[TUIStyledBoxLayout _updateSpecifiedWidth](self, "_updateSpecifiedWidth");
  objc_storeWeak((id *)&self->_contentChild, 0);
}

- (void)_updateSpecifiedWidth
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL8 v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v3, "width");
  if ((v4 & 0x6000000000000) == 0x2000000000000)
  {
    objc_msgSend(v9, "specifiedWidth");
    v6 = HIWORD(v5) & 7;
    v8 = v6 == 4 || v6 == 1;
  }
  else
  {
    v8 = 0;
  }
  -[TUILayout setSpecifiedWidthComputeInherited:](self, "setSpecifiedWidthComputeInherited:", v8);

}

- (BOOL)_needsRenderModel
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundColor"));
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shadowColor"));
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "borderColor"));
      if (v9)
      {
        v5 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
        if ((objc_msgSend(v10, "clipsToBounds") & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "blendMode"));
          v5 = v12 != 0;

        }
      }

    }
  }

  return v5;
}

- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3
{
  return 0;
}

- (BOOL)_needsSubviewsRenderModelWithContext:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  if ((objc_msgSend(v5, "clipsToBounds") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "blendMode"));
    if (v8)
    {
      v6 = 1;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)TUIStyledBoxLayout;
      v6 = -[TUILayout shouldUseSubviewRenderModelWithContext:](&v10, "shouldUseSubviewRenderModelWithContext:", v4);
    }

  }
  return v6;
}

- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3
{
  return !-[TUIStyledBoxLayout _needsSubviewsRenderModelWithContext:](self, "_needsSubviewsRenderModelWithContext:", a3);
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  _TUIStyledBoxStyler *v12;
  _TUIStyledLayerConfig *v13;
  TUIRenderModelLayer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  TUIRenderModelTransform *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  double tx;
  double c;
  double ty;
  double d;
  double a;
  double b;
  double y;
  _TUIStyledBoxStyler *v54;
  objc_super v55;
  _OWORD v56[3];
  CGAffineTransform v57;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v60;

  v10 = a4;
  v11 = a6;
  if (-[TUIStyledBoxLayout _needsRenderModel](self, "_needsRenderModel")
    && !-[TUIStyledBoxLayout _needsSubviewsRenderModelWithContext:](self, "_needsSubviewsRenderModelWithContext:", v10))
  {
    v12 = [_TUIStyledBoxStyler alloc];
    objc_msgSend(v10, "contentsScale");
    v54 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v12, "initWithLayout:contentsScale:", self);
    v13 = -[_TUIStyledLayerConfig initWithStyler:]([_TUIStyledLayerConfig alloc], "initWithStyler:", v54);
    v14 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v13, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v10);
    -[TUIRenderModelLayer setSize:](v14, "setSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tui_identifierByAppendingString:", CFSTR("background")));
    -[TUIRenderModelLayer setIdentifier:](v14, "setIdentifier:", v17);

    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "convertRenderModel:toKind:", v14, 4));

      y = CGPointZero.y;
      a = a5->a;
      b = a5->b;
      tx = a5->tx;
      c = a5->c;
      ty = a5->ty;
      d = a5->d;
      objc_msgSend(v18, "size");
      v20 = v19;
      objc_msgSend(v18, "size");
      v22 = v21;
      v24 = a5->a;
      v23 = a5->b;
      v25 = a5->c;
      v26 = a5->d;
      v27 = a5->tx;
      v28 = a5->ty;
      objc_msgSend(v10, "contentsScale");
      v29 = v20 * -0.5;
      v30 = v27 + v22 * -0.5 * v25 + v24 * (v20 * -0.5);
      v31 = v28 + v22 * -0.5 * v26 + v23 * v29;
      v33 = tx + y * c + a * CGPointZero.x + TUIPointRoundedForScale(v30, v31, v32) - v30;
      v35 = ty + y * d + b * CGPointZero.x + v34 - v31;
      memset(&v60, 0, sizeof(v60));
      v36 = *(_OWORD *)&a5->c;
      *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
      *(_OWORD *)&t1.c = v36;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
      CGAffineTransformMakeTranslation(&t2, -v33, -v35);
      CGAffineTransformConcat(&v60, &t1, &t2);
      v37 = v60.tx;
      objc_msgSend(v10, "contentsScale");
      v60.tx = TUIFloatRoundedForScale(v37, v38);
      v39 = v60.ty;
      objc_msgSend(v10, "contentsScale");
      v60.ty = TUIFloatRoundedForScale(v39, v40);
      v41 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v18);
      -[TUIRenderModelTransform setCenter:](v41, "setCenter:", v33, v35);
      v57 = v60;
      -[TUIRenderModelTransform setTransform:](v41, "setTransform:", &v57);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentLiveTransform"));
      -[TUIRenderModelTransform setLiveTransform:](v41, "setLiveTransform:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      objc_msgSend(v43, "renderOutsets");
      -[TUIRenderModelTransform setOutsets:](v41, "setOutsets:");

      -[TUIRenderModelTransform setZIndex:](v41, "setZIndex:", (char *)-[TUILayout computeZIndexWithDefault:](self, "computeZIndexWithDefault:", -999) - 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefIdWithContext:](self, "computedRefIdWithContext:", v10));
      -[TUIRenderModelTransform setRefId:](v41, "setRefId:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefInstanceWithContext:](self, "computedRefInstanceWithContext:", v10));
      -[TUIRenderModelTransform setRefInstance:](v41, "setRefInstance:", v45);

      objc_msgSend(v11, "addObject:", v41);
    }

  }
  v46 = *(_OWORD *)&a5->c;
  v56[0] = *(_OWORD *)&a5->a;
  v56[1] = v46;
  v56[2] = *(_OWORD *)&a5->tx;
  v55.receiver = self;
  v55.super_class = (Class)TUIStyledBoxLayout;
  -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v55, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", a3, v10, v56, v11);

}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  NSMutableArray *v7;
  _TUIStyledBoxStyler *v8;
  _TUIStyledBoxStyler *v9;
  void *v10;
  void *v11;
  TUIRenderModelLayer *v12;
  double v13;
  double v14;
  void *v15;
  _TUIStyledBoxStyler *v16;
  _TUIStyledBoxStyler *v17;
  _TUIStyledLayerConfig *v18;
  void *v19;
  void *v20;
  objc_super v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v6 = a4;
  if (!-[TUIStyledBoxLayout _needsRenderModel](self, "_needsRenderModel"))
    goto LABEL_8;
  if (a3 < 4)
  {
    if (a3 == 3)
    {
      v7 = objc_opt_new(NSMutableArray);
      -[TUILayout computedNaturalSize](self, "computedNaturalSize");
      memset(&v24, 0, sizeof(v24));
      CGAffineTransformMakeTranslation(&v24, v13 * 0.5, v14 * 0.5);
      v23 = v24;
      v22.receiver = self;
      v22.super_class = (Class)TUIStyledBoxLayout;
      -[TUILayout appendChildRenderModelCompatibleWithKind:context:transform:toModels:](&v22, "appendChildRenderModelCompatibleWithKind:context:transform:toModels:", 3, v6, &v23, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelConvertModels:toKind:", v7, 3));
      v16 = [_TUIStyledBoxStyler alloc];
      objc_msgSend(v6, "contentsScale");
      v17 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v16, "initWithLayout:contentsScale:", self);
      v18 = -[_TUIStyledLayerConfig initWithStyler:]([_TUIStyledLayerConfig alloc], "initWithStyler:", v17);
      v12 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v15, v18, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
      -[TUIRenderModelLayer setSize:](v12, "setSize:");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      -[TUIRenderModelLayer setIdentifier:](v12, "setIdentifier:", v20);

      goto LABEL_7;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!-[TUIStyledBoxLayout _needsSubviewsRenderModelWithContext:](self, "_needsSubviewsRenderModelWithContext:", v6))
    goto LABEL_8;
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelForContainerLayout:kind:", self, 6));
  v8 = [_TUIStyledBoxStyler alloc];
  objc_msgSend(v6, "contentsScale");
  v9 = -[_TUIStyledBoxStyler initWithLayout:contentsScale:](v8, "initWithLayout:contentsScale:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v12 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(+[TUIContainerView renderModelWithSubviewsModel:style:identifier:](TUIContainerView, "renderModelWithSubviewsModel:style:identifier:", v7, v9, v11));

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v6);
  -[TUIRenderModelLayer setSize:](v12, "setSize:");
LABEL_7:

LABEL_9:
  return v12;
}

- (CGRect)computedErasableBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  if (objc_msgSend(v3, "clipsToBounds"))
  {
    -[TUILayout computedErasableBoundsPrimitive](self, "computedErasableBoundsPrimitive");
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)TUIStyledBoxLayout;
    -[TUILayout computedErasableBounds](&v28, "computedErasableBounds");
  }
  x = v4;
  y = v5;
  width = v6;
  height = v7;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v12, "shadowOpacity");
  v14 = v13;

  if (v14 != 0.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v15, "shadowRadius");
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    objc_msgSend(v18, "shadowOffset");
    v20 = v19;
    v22 = v21;
    v23 = v17 + v17;

    v32.origin.x = x - (v23 - v20);
    v32.origin.y = y - (v23 - v22);
    v32.size.width = width - (-(v23 + v20) - (v23 - v20));
    v32.size.height = height - (-(v23 + v22) - (v23 - v22));
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectUnion(v29, v32);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (TUILayout)contentChild
{
  TUILayout **p_contentChild;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  p_contentChild = &self->_contentChild;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentChild);

  if (!WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "box"));
          v11 = objc_msgSend(v10, "role") == 0;

          if (v11)
          {
            objc_storeWeak((id *)p_contentChild, v9);
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return (TUILayout *)objc_loadWeakRetained((id *)p_contentChild);
}

- (id)guideProviderForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guideProviderForLayout:", v4));

  return v6;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6;
  TUIStyledBoxLayout *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (TUIStyledBoxLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAncestor"));
  if (v7 == self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "box"));
    if (objc_msgSend(v9, "role"))
    {
      v8 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
      v8 = objc_msgSend(v10, "shouldUseDefaultGuideForLayout:edge:", self, a4);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)effectiveGuideTop
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideTop"));

  return v3;
}

- (id)effectiveGuideBottom
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideBottom"));

  return v3;
}

- (id)effectiveGuideLeading
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideLeading"));

  return v3;
}

- (id)effectiveGuideTrailing
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideTrailing"));

  return v3;
}

- (BOOL)groupedContainingIsGrouped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = objc_msgSend(v2, "grouped");

  return v3;
}

- (id)groupedContainingLayouts
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = objc_claimAutoreleasedReturnValue(-[TUIStyledBoxLayout contentChild](self, "contentChild"));
  v3 = (void *)v2;
  if (v2)
  {
    v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)groupedContainingValidateWithSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
  -[TUIStyledBoxLayout layoutNonContentChildrenWithSize:](self, "layoutNonContentChildrenWithSize:", width, height);
}

- (UIEdgeInsets)groupedContainingInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v2, "insets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (void)setContentChild:(id)a3
{
  objc_storeWeak((id *)&self->_contentChild, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentChild);
}

@end
