@implementation TSDMaskLayout

- (TSDMaskLayout)initWithInfo:(id)a3
{
  TSDMaskLayout *v3;
  TSDMaskLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDMaskLayout;
  v3 = -[TSDLayout initWithInfo:](&v6, sel_initWithInfo_, a3);
  v4 = v3;
  if (v3)
  {
    if (-[TSDMaskLayout maskInfo](v3, "maskInfo"))
    {
      *(_BYTE *)&v4->mMaskInvalidFlags |= 3u;
      v4->mPathScale = 1.0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->mCachedPath);
  CGPathRelease(self->mCachedPathNoScale);

  self->mPathSourceWithProvidedSize = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (id)dependentLayouts
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", -[TSDAbstractLayout parent](self, "parent"));
}

- (id)computeLayoutGeometry
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  TSDPathSource *mPathSourceWithProvidedSize;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  TSDLayoutGeometry *v31;
  TSDLayoutGeometry *v32;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v3 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "layoutGeometryForLayout:", self)) != 0)
  {
    v6 = (void *)v5;
    mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
    if (!mPathSourceWithProvidedSize)
    {
      self->mPathSourceWithProvidedSize = (TSDPathSource *)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "copy");
      *(_BYTE *)&self->mMaskInvalidFlags |= 3u;
      mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
    }
    -[TSDPathSource naturalSize](mPathSourceWithProvidedSize, "naturalSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "size");
    if (v9 != v13 || v11 != v12)
    {
      objc_msgSend(v6, "size");
      -[TSDPathSource setNaturalSize:](self->mPathSourceWithProvidedSize, "setNaturalSize:");
      *(_BYTE *)&self->mMaskInvalidFlags |= 3u;
    }
    -[TSDMaskLayout p_cachedTightPathBoundsNoScale](self, "p_cachedTightPathBoundsNoScale");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = -[TSDLayout computeInfoGeometryFromLayoutGeometry:](self, "computeInfoGeometryFromLayoutGeometry:", v6);
  }
  else
  {
    -[TSDMaskLayout p_cachedTightPathBoundsNoScale](self, "p_cachedTightPathBoundsNoScale");
    v16 = v24;
    v18 = v25;
    v20 = v26;
    v22 = v27;
    v23 = (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  }
  v28 = v23;
  objc_msgSend(v23, "position");
  v30 = v29;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  objc_msgSend(v28, "center");
  if (v28)
  {
    objc_msgSend(v28, "transformBasedOnPoint:centeredAtPoint:", TSDAddPoints(v16, v18, v30));
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
  }
  v31 = [TSDLayoutGeometry alloc];
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  v32 = -[TSDLayoutGeometry initWithSize:transform:](v31, "initWithSize:transform:", v34, v20, v22);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(v4, "adjustLayoutGeometry:forLayout:", v32, self);
  return v32;
}

- (CGAffineTransform)affineTransformForTightPathBounds
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  CGAffineTransform *result;

  -[TSDMaskLayout p_cachedTightPathBounds](self, "p_cachedTightPathBounds");
  v6 = v5;
  v8 = v7;
  v9 = -[TSDMaskLayout infoGeometry](self, "infoGeometry");
  objc_msgSend(v9, "position");
  v11 = v10;
  result = (CGAffineTransform *)objc_msgSend(v9, "center");
  if (v9)
    return (CGAffineTransform *)objc_msgSend(v9, "transformBasedOnPoint:centeredAtPoint:", TSDAddPoints(v6, v8, v11));
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)processChangedProperty:(int)a3
{
  TSDImageLayout *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDMaskLayout;
  -[TSDLayout processChangedProperty:](&v8, sel_processChangedProperty_);
  if (a3 == 526)
  {
    -[TSDMaskLayout invalidatePath](self, "invalidatePath");
    -[TSDLayout invalidateFrame](self, "invalidateFrame");

    self->mPathSourceWithProvidedSize = 0;
    v5 = -[TSDMaskLayout imageLayout](self, "imageLayout");
  }
  else
  {
    if ((a3 & 0xFFFFFFFE) != 0x200)
    {
      -[TSDMaskLayout imageLayout](self, "imageLayout");
      return;
    }
    objc_opt_class();
    -[TSDAbstractLayout parent](self, "parent");
    objc_msgSend((id)TSUDynamicCast(), "invalidateExteriorWrap");
    v5 = -[TSDMaskLayout imageLayout](self, "imageLayout");
    if (-[TSDInfo isInlineWithText](-[TSDLayout info](v5, "info"), "isInlineWithText"))
    {
      v6 = -[TSDAbstractLayout parent](v5, "parent");
      if (v6)
      {
        v7 = (void *)v6;
        while ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v7 = (void *)objc_msgSend(v7, "parent");
          if (!v7)
            goto LABEL_3;
        }
        objc_msgSend(v7, "wrappableChildInvalidated:", v5);
      }
    }
  }
LABEL_3:
  if (objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "repForLayout:", v5), "processChangedProperty:", 529);
  }
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  -[TSDLayout invalidate](&v3, sel_invalidate);
  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  objc_msgSend((id)TSUDynamicCast(), "invalidateFrame");
}

- (void)invalidatePath
{
  CGPoint v3;
  CGSize v4;

  *(_BYTE *)&self->mMaskInvalidFlags |= 1u;
  CGPathRelease(self->mCachedPath);
  self->mCachedPath = 0;
  CGPathRelease(self->mCachedPathNoScale);
  self->mCachedPathNoScale = 0;
  *(_BYTE *)&self->mMaskInvalidFlags |= 2u;
  v3 = (CGPoint)*MEMORY[0x24BDBF090];
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mCachedTightPathBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mCachedTightPathBounds.size = v4;
  self->mCachedTightPathBoundsNoScale.origin = v3;
  self->mCachedTightPathBoundsNoScale.size = v4;
  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  objc_msgSend((id)TSUDynamicCast(), "invalidateExteriorWrap");
}

- (CGRect)alignmentFrame
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  TSDImageLayout *v10;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  double v15;
  double x;
  double v17;
  double y;
  void *v19;
  void *v20;
  CGPath *Mutable;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  if (-[TSDImageLayout isResizingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isResizingInMaskEditMode"))
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
    v3 = TSDRectWithSize();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v10 = -[TSDMaskLayout imageLayout](self, "imageLayout");
    if (v10)
      -[TSDImageLayout layoutToMaskTransform](v10, "layoutToMaskTransform");
    else
      memset(&v30, 0, sizeof(v30));
    v32.origin.x = v3;
    v32.origin.y = v5;
    v32.size.width = v7;
    v32.size.height = v9;
    v33 = CGRectApplyAffineTransform(v32, &v30);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
  }
  else
  {
    -[TSDAbstractLayout frameInParent](self, "frameInParent");
    width = v11;
    height = v13;
    -[TSDAbstractLayout frame](-[TSDAbstractLayout parent](self, "parent"), "frame");
    x = v15;
    y = v17;
    v19 = (void *)objc_msgSend(-[TSDImageLayout imageInfo](-[TSDMaskLayout imageLayout](self, "imageLayout"), "imageInfo"), "stroke");
    if (v19)
    {
      v20 = v19;
      if (objc_msgSend(v19, "shouldRender"))
      {
        Mutable = CGPathCreateMutable();
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        CGPathAddRect(Mutable, 0, v31);
        TSDPathBoundsIncludingStroke(Mutable, v20);
        v23 = v22;
        CGPathRelease(Mutable);
        v24 = TSDSubtractPoints(x, y, v23);
        x = TSDAddPoints(x, y, v24);
        y = v25;
      }
    }
  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  TSDImageLayout *v5;
  TSDImageLayout *v6;
  objc_super v8;
  CGAffineTransform t2;
  CGAffineTransform t1;

  if (-[TSDImageLayout isResizingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isResizingInMaskEditMode"))
  {
    v5 = -[TSDMaskLayout imageLayout](self, "imageLayout");
    if (v5)
    {
      v6 = v5;
      -[TSDImageLayout layoutToMaskTransform](v5, "layoutToMaskTransform");
      -[TSDLayout originalTransformForProvidingGuides](v6, "originalTransformForProvidingGuides");
    }
    else
    {
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
    }
    return CGAffineTransformConcat(retstr, &t1, &t2);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDMaskLayout;
    return (CGAffineTransform *)-[CGAffineTransform originalTransformForProvidingGuides](&v8, sel_originalTransformForProvidingGuides);
  }
}

- (BOOL)shouldSnapWhileResizing
{
  _BOOL4 v3;
  TSDAbstractLayout *v4;
  objc_super v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDMaskLayout;
  v3 = -[TSDAbstractLayout shouldSnapWhileResizing](&v7, sel_shouldSnapWhileResizing);
  if (v3)
  {
    v4 = -[TSDAbstractLayout parent](self, "parent");
    if (v4)
      -[TSDAbstractLayout transformInRoot](v4, "transformInRoot");
    else
      memset(v6, 0, sizeof(v6));
    LOBYTE(v3) = TSDIsTransformAxisAligned((double *)v6);
  }
  return v3;
}

- (CGRect)alignmentFrameForProvidingGuidesInRoot
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDImageLayout alignmentFrameForProvidingGuidesInRoot](-[TSDMaskLayout imageLayout](self, "imageLayout"), "alignmentFrameForProvidingGuidesInRoot");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)beginDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  -[TSDLayout beginDynamicOperation](&v3, sel_beginDynamicOperation);
  -[TSDMaskLayout p_createDynamicCopies](self, "p_createDynamicCopies");
}

- (void)resizeWithTransform:(CGAffineTransform *)a3 asChild:(BOOL)a4
{
  void *v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform t2;
  CGAffineTransform v25;
  CGAffineTransform t1;
  CGAffineTransform v27;

  if (-[TSDImageLayout isResizingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout", a3, a4), "isResizingInMaskEditMode")|| -[TSDImageLayout isRotatingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isRotatingInMaskEditMode"))
  {
    memset(&v27, 0, sizeof(v27));
    v6 = (void *)objc_msgSend(-[TSDImageLayout imageInfo](-[TSDMaskLayout imageLayout](self, "imageLayout"), "imageInfo"), "geometry");
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    t1 = v27;
    v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v25, &t1, &t2);
    t1 = v27;
    CGAffineTransformInvert(&v23, &t1);
    CGAffineTransformConcat(&t1, &v25, &v23);
    v8 = *(_OWORD *)&t1.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&a3->c = v8;
    *(_OWORD *)&a3->tx = *(_OWORD *)&t1.tx;
    memset(&t1, 0, sizeof(t1));
    v9 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
    if (v9)
      objc_msgSend(v9, "fullTransform");
    else
      memset(&v22, 0, sizeof(v22));
    v10 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v10;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t1, &v22, &t2);
    t2 = t1;
    v11 = +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", &t2);
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    v12 = -[TSDImageLayout originalImageGeometry](-[TSDMaskLayout imageLayout](self, "imageLayout"), "originalImageGeometry");
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    memset(&t1, 0, sizeof(t1));
    t2 = v27;
    v13 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v20.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v20.c = v13;
    *(_OWORD *)&v20.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v21, &t2, &v20);
    TSDTransformNormalizeScale((uint64_t)&v21, &t1);
    v14 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v14;
    v16 = *(_OWORD *)&a3->a;
    v15 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    v20 = v27;
    *(_OWORD *)&v19.a = v16;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&t2, &v20, &v19);
    v20 = t1;
    CGAffineTransformInvert(&v18, &v20);
    v19 = t2;
    CGAffineTransformConcat(&v20, &v19, &v18);
    t2 = v20;
    v17 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
    v20 = t2;
    v11 = (id)objc_msgSend(v17, "geometryByAppendingTransform:", &v20);
  }
  -[TSDMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v11);
}

- (void)takeScaledMaskGeometry:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!self->mScalingInMaskMode)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout takeScaledMaskGeometry:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 293, CFSTR("wrong mode"));
  }
  -[TSDMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", a3);
}

- (void)endDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMaskLayout;
  -[TSDLayout endDynamicOperation](&v3, sel_endDynamicOperation);
  -[TSDMaskLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  CGAffineTransform *result;
  __int128 v7;
  _OWORD v8[3];

  result = -[TSDMaskLayout imageLayout](self, "imageLayout");
  if (result)
  {
    v7 = *(_OWORD *)&a4->c;
    v8[0] = *(_OWORD *)&a4->a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a4->tx;
    return (CGAffineTransform *)-[CGAffineTransform layoutTransformInInfoSpace:](result, "layoutTransformInInfoSpace:", v8);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  TSDImageLayout *v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  y = a3.y;
  x = a3.x;
  if (!-[TSDImageLayout isDraggingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isDraggingInMaskEditMode"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout dragBy:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 319, CFSTR("should be called only when dragging in mask mode"));
  }
  v8 = -[TSDMaskLayout imageLayout](self, "imageLayout");
  v9 = -[TSDImageLayout imageGeometry](v8, "imageGeometry");
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(&v17, 0, sizeof(v17));
  CGAffineTransformInvert(&v18, &v17);
  v10 = TSDDeltaApplyAffineTransform((float64x2_t *)&v18, x, y);
  v11 = (void *)-[TSDInfoGeometry mutableCopy](self->mDynamicInfoGeometry, "mutableCopy");
  if (-[TSDImageLayout maskEditModeForDragging](v8, "maskEditModeForDragging") == 3)
  {
    objc_msgSend(v11, "position");
    v14 = TSDSubtractPoints(v12, v13, v10);
LABEL_10:
    objc_msgSend(v11, "setPosition:", v14, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
    goto LABEL_11;
  }
  if (-[TSDImageLayout maskEditModeForDragging](v8, "maskEditModeForDragging") == 2)
  {
    objc_msgSend(v11, "position");
    v14 = TSDAddPoints(v15, v16, v10);
    goto LABEL_10;
  }
LABEL_11:
  -[TSDMaskLayout p_setDynamicInfoGeometry:](self, "p_setDynamicInfoGeometry:", v11, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);

}

- (void)maskModeScaleDidBegin
{
  self->mScalingInMaskMode = 1;
}

- (void)maskModeScaleDidEnd
{
  self->mScalingInMaskMode = 0;
}

- (BOOL)shouldDisplayGuides
{
  objc_super v4;

  if (-[TSDImageLayout isResizingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isResizingInMaskEditMode")|| self->mScalingInMaskMode)
  {
    return 0;
  }
  if (-[TSDImageLayout isDraggingInMaskEditMode](-[TSDMaskLayout imageLayout](self, "imageLayout"), "isDraggingInMaskEditMode"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDMaskLayout;
  return -[TSDLayout shouldDisplayGuides](&v4, sel_shouldDisplayGuides);
}

- (id)maskInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

- (id)pathSource
{
  TSDPathSource *mPathSourceWithProvidedSize;

  mPathSourceWithProvidedSize = self->mPathSourceWithProvidedSize;
  if (mPathSourceWithProvidedSize)
    return mPathSourceWithProvidedSize;
  mPathSourceWithProvidedSize = self->mDynamicPathSource;
  if (mPathSourceWithProvidedSize)
    return mPathSourceWithProvidedSize;
  else
    return (id)objc_msgSend(-[TSDMaskLayout maskInfo](self, "maskInfo"), "pathSource");
}

- (void)setPathScale:(double)a3
{
  if (self->mPathScale != a3)
  {
    self->mPathScale = a3;
    -[TSDMaskLayout invalidatePath](self, "invalidatePath");
    -[TSDAbstractLayout setGeometry:](self, "setGeometry:", -[TSDAbstractLayout geometry](self, "geometry"));
  }
}

- (void)dynamicMovePathKnobDidBegin
{
  self->mDynamicPathSource = (TSDPathSource *)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "copy");
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y;
  double x;
  TSDPathSource *mDynamicPathSource;
  uint64_t v8;
  double v9;

  y = a3.y;
  x = a3.x;
  mDynamicPathSource = self->mDynamicPathSource;
  v8 = objc_msgSend((id)objc_msgSend(a4, "knob"), "tag");
  -[TSDMaskLayout pathBounds](self, "pathBounds");
  -[TSDPathSource setControlKnobPosition:toPoint:](mDynamicPathSource, "setControlKnobPosition:toPoint:", v8, TSDAddPoints(x, y, v9));
  -[TSDMaskLayout invalidatePath](self, "invalidatePath");
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
}

- (BOOL)hasSmartPath
{
  -[TSDMaskLayout pathSource](self, "pathSource");
  objc_opt_class();
  return TSUClassAndProtocolCast() != 0;
}

- (unint64_t)numberOfControlKnobs
{
  -[TSDMaskLayout pathSource](self, "pathSource");
  objc_opt_class();
  return objc_msgSend((id)TSUClassAndProtocolCast(), "numberOfControlKnobs");
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  double v9;

  y = a4.y;
  x = a4.x;
  -[TSDMaskLayout pathSource](self, "pathSource");
  objc_opt_class();
  v8 = (void *)TSUClassAndProtocolCast();
  -[TSDMaskLayout pathBounds](self, "pathBounds", &unk_254F765B8);
  objc_msgSend(v8, "setControlKnobPosition:toPoint:", a3, TSDAddPoints(x, y, v9));
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[TSDMaskLayout pathSource](self, "pathSource");
  objc_opt_class();
  objc_msgSend((id)TSUClassAndProtocolCast(), "getControlKnobPosition:", a3, &unk_254F765B8);
  v6 = v5;
  v8 = v7;
  -[TSDMaskLayout pathBounds](self, "pathBounds");
  v10 = TSDSubtractPoints(v6, v8, v9);
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)infoGeometry
{
  if (self->mDynamicInfoGeometry)
    return self->mDynamicInfoGeometry;
  else
    return (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
}

- (void)p_calculateCachedPathIfNecessary
{
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGAffineTransform v6;

  if ((*(_BYTE *)&self->mMaskInvalidFlags & 1) != 0)
  {
    -[TSDMaskLayout pathScale](self, "pathScale", 0, 0, 0, 0, 0, 0);
    v4 = v3;
    -[TSDMaskLayout pathScale](self, "pathScale");
    CGAffineTransformMakeScale(&v6, v4, v5);
    self->mCachedPathNoScale = CGPathCreateMutableCopy((CGPathRef)objc_msgSend((id)objc_msgSend(-[TSDMaskLayout pathSource](self, "pathSource"), "bezierPath"), "CGPath"));
    self->mCachedPath = (CGPath *)MEMORY[0x219A1465C]();
    *(_BYTE *)&self->mMaskInvalidFlags &= ~1u;
  }
}

- (CGPath)p_cachedPath
{
  -[TSDMaskLayout p_calculateCachedPathIfNecessary](self, "p_calculateCachedPathIfNecessary");
  return self->mCachedPath;
}

- (CGPath)p_cachedPathNoScale
{
  -[TSDMaskLayout p_calculateCachedPathIfNecessary](self, "p_calculateCachedPathIfNecessary");
  return self->mCachedPathNoScale;
}

- (void)p_calculateTightPathBoundsIfNecessary
{
  if ((*(_BYTE *)&self->mMaskInvalidFlags & 2) != 0)
  {
    self->mCachedTightPathBounds = CGPathGetPathBoundingBox(-[TSDMaskLayout p_cachedPath](self, "p_cachedPath"));
    self->mCachedTightPathBoundsNoScale = CGPathGetPathBoundingBox(-[TSDMaskLayout p_cachedPathNoScale](self, "p_cachedPathNoScale"));
    *(_BYTE *)&self->mMaskInvalidFlags &= ~2u;
  }
}

- (CGRect)p_cachedTightPathBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[TSDMaskLayout p_calculateTightPathBoundsIfNecessary](self, "p_calculateTightPathBoundsIfNecessary");
  x = self->mCachedTightPathBounds.origin.x;
  y = self->mCachedTightPathBounds.origin.y;
  width = self->mCachedTightPathBounds.size.width;
  height = self->mCachedTightPathBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)p_cachedTightPathBoundsNoScale
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[TSDMaskLayout p_calculateTightPathBoundsIfNecessary](self, "p_calculateTightPathBoundsIfNecessary");
  x = self->mCachedTightPathBoundsNoScale.origin.x;
  y = self->mCachedTightPathBoundsNoScale.origin.y;
  width = self->mCachedTightPathBoundsNoScale.size.width;
  height = self->mCachedTightPathBoundsNoScale.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)p_createDynamicCopies
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (self->mDynamicInfoGeometry)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout p_createDynamicCopies]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 502, CFSTR("expected nil value for '%s'"), "mDynamicInfoGeometry");
  }
  if (self->mDynamicPathSource)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout p_createDynamicCopies]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 503, CFSTR("expected nil value for '%s'"), "mDynamicPathSource");
  }
  v7 = -[TSDMaskLayout maskInfo](self, "maskInfo");
  self->mDynamicInfoGeometry = (TSDInfoGeometry *)objc_msgSend((id)objc_msgSend(v7, "geometry"), "copy");
  self->mDynamicPathSource = (TSDPathSource *)objc_msgSend((id)objc_msgSend(v7, "pathSource"), "copy");
}

- (void)p_setDynamicInfoGeometry:(id)a3
{
  TSDPathSource *v5;

  self->mDynamicInfoGeometry = (TSDInfoGeometry *)a3;
  v5 = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDMaskLayout maskInfo](self, "maskInfo"), "pathSource"), "copy");
  self->mDynamicPathSource = v5;
  -[TSDInfoGeometry size](self->mDynamicInfoGeometry, "size");
  -[TSDPathSource scaleToNaturalSize:](v5, "scaleToNaturalSize:");
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
  -[TSDMaskLayout invalidatePath](self, "invalidatePath");
}

- (void)p_destroyDynamicCopies
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (!self->mDynamicInfoGeometry)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout p_destroyDynamicCopies]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 527, CFSTR("invalid nil value for '%s'"), "mDynamicInfoGeometry");
  }
  if (!self->mDynamicPathSource)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskLayout p_destroyDynamicCopies]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskLayout.m"), 528, CFSTR("invalid nil value for '%s'"), "mDynamicPathSource");
  }

  self->mDynamicInfoGeometry = 0;
  self->mDynamicPathSource = 0;
  -[TSDLayout invalidateFrame](self, "invalidateFrame");
  -[TSDMaskLayout invalidatePath](self, "invalidatePath");
}

- (double)pathScale
{
  return self->mPathScale;
}

@end
