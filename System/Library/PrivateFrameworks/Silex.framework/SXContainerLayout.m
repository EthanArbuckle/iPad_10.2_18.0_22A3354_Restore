@implementation SXContainerLayout

- (void)dealloc
{
  TSDWrapPolygon *mCachedWrapPolygon;
  TSDBezierPath *mCachedWrapPath;
  TSDBezierPath *mCachedExternalWrapPath;
  objc_super v6;

  mCachedWrapPolygon = self->mCachedWrapPolygon;
  self->mCachedWrapPolygon = 0;

  mCachedWrapPath = self->mCachedWrapPath;
  self->mCachedWrapPath = 0;

  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  self->mCachedExternalWrapPath = 0;

  v6.receiver = self;
  v6.super_class = (Class)SXContainerLayout;
  -[TSDLayout dealloc](&v6, sel_dealloc);
}

- (id)childrenForLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[TSDContainerLayout childInfosForLayout](self, "childInfosForLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXContainerLayout additionalLayouts](self, "additionalLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v5;
  if (v5 && v4)
  {
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
    if (!v5)
    {
      v7 = 0;
      if (v4)
        v7 = v4;
    }
  }

  return v7;
}

- (void)updateChildrenFromInfo
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[SXContainerLayout childrenForLayout](self, "childrenForLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDAbstractLayout children](self, "children");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_17;
  v4 = objc_msgSend(v3, "count");
  if (v4 != objc_msgSend(v26, "count"))
    goto LABEL_17;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        TSUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          if (v12 != v11)
          {

LABEL_16:
LABEL_17:
            v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
            -[TSDLayout layoutController](self, "layoutController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v25 = v3;
            v16 = v3;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (!v17)
              goto LABEL_29;
            v18 = v17;
            v19 = *(_QWORD *)v28;
            while (2)
            {
              v20 = 0;
LABEL_20:
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              objc_opt_class();
              TSUDynamicCast();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                goto LABEL_26;
              TSUProtocolCast();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "layoutForInfo:childOfLayout:", v22, self);
              v23 = objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                v21 = (void *)v23;

                goto LABEL_26;
              }
              v21 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v22, "layoutClass")), "initWithInfo:", v22);
              -[SXContainerLayout childLayoutCreated:](self, "childLayoutCreated:", v21);

              if (v21)
              {
LABEL_26:
                objc_msgSend(v5, "addObject:", v21, v25);

              }
              if (v18 == ++v20)
              {
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (!v18)
                {
LABEL_29:

                  -[TSDAbstractLayout setChildren:](self, "setChildren:", v5);
                  -[SXContainerLayout invalidate](self, "invalidate");

                  v3 = v25;
                  goto LABEL_30;
                }
                continue;
              }
              goto LABEL_20;
            }
          }

        }
        else
        {
          objc_msgSend(v12, "info");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 != v10)
            goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }
LABEL_30:

  -[TSDAbstractLayout children](self, "children");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "makeObjectsPerformSelector:", sel_updateChildrenFromInfo);

}

- (id)additionalLayouts
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (id)i_exteriorTextWrap
{
  return 0;
}

- (CGRect)boundsInfluencingExteriorWrap
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[TSDAbstractLayout frameInRoot](self, "frameInRoot");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "margin");
    if (v13 > 0.0)
    {
      v14 = -v13;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v20 = CGRectInset(v19, v14, v14);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
    }
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)i_computeWrapPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEB3A68];
  -[TSDAbstractLayout geometry](self, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  TSDRectWithSize();
  objc_msgSend(v2, "bezierPathWithRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)i_wrapPath
{
  TSDBezierPath *mCachedWrapPath;
  TSDBezierPath *v4;
  TSDBezierPath *v5;

  mCachedWrapPath = self->mCachedWrapPath;
  if (!mCachedWrapPath)
  {
    -[SXContainerLayout i_computeWrapPath](self, "i_computeWrapPath");
    v4 = (TSDBezierPath *)objc_claimAutoreleasedReturnValue();
    v5 = self->mCachedWrapPath;
    self->mCachedWrapPath = v4;

    mCachedWrapPath = self->mCachedWrapPath;
  }
  return mCachedWrapPath;
}

- (id)i_externalWrapPath
{
  TSDBezierPath *mCachedExternalWrapPath;
  void *v4;
  void *v5;
  TSDBezierPath *v6;
  TSDBezierPath *v7;

  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  if (!mCachedExternalWrapPath)
  {
    v4 = (void *)MEMORY[0x24BEB3A68];
    -[SXContainerLayout i_wrapPath](self, "i_wrapPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exteriorOfBezierPath:", v5);
    v6 = (TSDBezierPath *)objc_claimAutoreleasedReturnValue();
    v7 = self->mCachedExternalWrapPath;
    self->mCachedExternalWrapPath = v6;

    mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  }
  return mCachedExternalWrapPath;
}

- (id)wrapPolygon
{
  TSDWrapPolygon *mCachedWrapPolygon;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TSDWrapPolygon *v13;
  TSDWrapPolygon *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v19[48];

  mCachedWrapPolygon = self->mCachedWrapPolygon;
  if (!mCachedWrapPolygon)
  {
    -[SXContainerLayout i_wrapPath](self, "i_wrapPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "margin"), v7 > 0.0))
    {
      if (objc_msgSend(v4, "elementCount") >= 1001)
      {
        v8 = (void *)MEMORY[0x24BEB3A68];
        -[TSDAbstractLayout geometry](self, "geometry");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "size");
        TSDRectWithSize();
        objc_msgSend(v8, "bezierPathWithRect:");
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v10;
      }
      objc_msgSend(v6, "margin");
      objc_msgSend(v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = objc_msgSend(v4, "copy");
    }
    v12 = (void *)v11;

    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
    objc_msgSend(v12, "transformUsingAffineTransform:", v19);
    v13 = (TSDWrapPolygon *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AC8]), "initWithPath:", v12);
    v14 = self->mCachedWrapPolygon;
    self->mCachedWrapPolygon = v13;

    -[TSDWrapPolygon setIntersectsSelf:](self->mCachedWrapPolygon, "setIntersectsSelf:", 0);
    mCachedWrapPolygon = self->mCachedWrapPolygon;
    if (!mCachedWrapPolygon)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXContainerLayout wrapPolygon]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXContainerLayout.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 225, CFSTR("invalid nil value for '%s'"), "mCachedWrapPolygon");

      mCachedWrapPolygon = self->mCachedWrapPolygon;
    }
  }
  return mCachedWrapPolygon;
}

- (BOOL)isHTMLWrap
{
  void *v2;
  void *v3;
  char v4;

  -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isHTMLWrap");
  else
    v4 = 0;

  return v4;
}

- (int)wrapType
{
  void *v2;
  void *v3;
  int v4;

  -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "type");
  else
    v4 = 0;

  return v4;
}

- (int)wrapDirection
{
  void *v2;
  void *v3;
  int v4;

  -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "direction");
  else
    v4 = 2;

  return v4;
}

- (int)wrapFitType
{
  void *v2;
  void *v3;
  int v4;

  -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "fitType");
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXContainerLayout;
  -[TSDLayout invalidate](&v3, sel_invalidate);
  -[SXContainerLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)invalidateExteriorWrap
{
  TSDWrapPolygon *mCachedWrapPolygon;
  TSDBezierPath *mCachedWrapPath;
  TSDBezierPath *mCachedExternalWrapPath;

  mCachedWrapPolygon = self->mCachedWrapPolygon;
  self->mCachedWrapPolygon = 0;

  mCachedWrapPath = self->mCachedWrapPath;
  self->mCachedWrapPath = 0;

  mCachedExternalWrapPath = self->mCachedExternalWrapPath;
  self->mCachedExternalWrapPath = 0;

}

- (void)dragBy:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXContainerLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  -[SXContainerLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)setGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  TSDWrapPolygon *mCachedWrapPolygon;
  CGFloat v9;
  CGFloat v10;
  objc_super v11;
  CGAffineTransform v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  -[TSDAbstractLayout geometry](self, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (!self->mCachedWrapPolygon)
      goto LABEL_11;
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) != 0 || !self->mCachedWrapPolygon)
    goto LABEL_11;
  if ((objc_msgSend(v6, "differsInMoreThanTranslationFrom:", v4) & 1) != 0)
  {
LABEL_8:
    -[SXContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    goto LABEL_11;
  }
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  objc_msgSend(v6, "transform", *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8), v7, *MEMORY[0x24BDBEFB0], *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8));
  TSDSubtractPoints();
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v12, v9, v10);
  -[TSDWrapPolygon transformUsingAffineTransform:](mCachedWrapPolygon, "transformUsingAffineTransform:", &v12);
LABEL_11:
  v11.receiver = self;
  v11.super_class = (Class)SXContainerLayout;
  -[TSDAbstractLayout setGeometry:](&v11, sel_setGeometry_, v4);

}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXContainerLayout;
  -[TSDLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 521)
    -[SXContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)parentDidChange
{
  objc_super v3;

  -[SXContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  v3.receiver = self;
  v3.super_class = (Class)SXContainerLayout;
  -[TSDLayout parentDidChange](&v3, sel_parentDidChange);
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[TSDAbstractLayout parent](self, "parent");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v5 = (id)v3;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        break;
      objc_msgSend(v5, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (!v4)
        return;
    }
    objc_msgSend(v5, "wrappableChildInvalidated:", self);

  }
}

- (void)invalidateParentForWrap
{
  if (-[TSDLayout isBeingManipulated](self, "isBeingManipulated"))
    -[SXContainerLayout i_invalidateWrap](self, "i_invalidateWrap");
}

- (BOOL)supportsInspectorPositioning
{
  void *v2;
  void *v4;
  int v5;
  int v6;
  void *v7;

  -[TSDLayout info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnchoredToText");
  if (v5)
  {
    -[SXContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isHTMLWrap") & 1) != 0)
    {
      LOBYTE(v6) = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[TSDLayout info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isInlineWithText") ^ 1;

  if (v5)
    goto LABEL_5;
LABEL_6:

  return v6;
}

- (NSMutableArray)oldchildLayouts
{
  return self->_oldchildLayouts;
}

- (void)setOldchildLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_oldchildLayouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldchildLayouts, 0);
  objc_storeStrong((id *)&self->mCachedExternalWrapPath, 0);
  objc_storeStrong((id *)&self->mCachedWrapPath, 0);
  objc_storeStrong((id *)&self->mCachedWrapPolygon, 0);
}

@end
