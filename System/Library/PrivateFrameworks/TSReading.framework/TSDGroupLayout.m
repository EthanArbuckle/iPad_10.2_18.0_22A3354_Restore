@implementation TSDGroupLayout

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (id)visibleGeometries
{
  void *v3;
  TSDLayoutGeometry *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v4 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v4)
  {
    -[TSDLayoutGeometry transform](v4, "transform");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = -[TSDAbstractLayout children](self, "children");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "visibleGeometries");
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
              v17[0] = v26;
              v17[1] = v27;
              v17[2] = v28;
              objc_msgSend(v3, "addObject:", objc_msgSend(v15, "geometryByTransformingBy:", v17));
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
          }
          while (v12);
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }
  return v3;
}

- (id)layoutGeometryFromInfo
{
  id result;

  result = self->mDynamicLayoutGeometry;
  if (!result)
    return -[TSDLayoutGeometry initWithInfoGeometry:]([TSDLayoutGeometry alloc], "initWithInfoGeometry:", -[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"));
  return result;
}

- (id)reliedOnLayouts
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", -[TSDAbstractLayout children](self, "children"));
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = self;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
}

- (id)computeLayoutGeometry
{
  id v3;
  id v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  v4 = (id)objc_msgSend(v3, "layoutGeometryForLayout:", self);
  if (!v4)
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = -[TSDAbstractLayout children](self, "children", 0);
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "pureGeometry"), "frame");
          v23.origin.x = x;
          v23.origin.y = y;
          v23.size.width = width;
          v23.size.height = height;
          v22 = CGRectUnion(v21, v23);
          x = v22.origin.x;
          y = v22.origin.y;
          width = v22.size.width;
          height = v22.size.height;
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }
    self->mBoundsForStandardKnobs.origin.x = x;
    self->mBoundsForStandardKnobs.origin.y = y;
    self->mBoundsForStandardKnobs.size.width = width;
    self->mBoundsForStandardKnobs.size.height = height;
    v4 = -[TSDGroupLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo");
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend(v3, "adjustLayoutGeometry:forLayout:", v4, self);
  }
  return v4;
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  if (a3 == 514)
    objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateChildrenOfLayout:", self);
  v5.receiver = self;
  v5.super_class = (Class)TSDGroupLayout;
  -[TSDLayout processChangedProperty:](&v5, sel_processChangedProperty_, v3);
}

- (CGRect)boundsForStandardKnobs
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBoundsForStandardKnobs.origin.x;
  y = self->mBoundsForStandardKnobs.origin.y;
  width = self->mBoundsForStandardKnobs.size.width;
  height = self->mBoundsForStandardKnobs.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)alignmentFrame
{
  CGAffineTransform v3;

  if (self)
    -[TSDAbstractLayout transform](self, "transform");
  else
    memset(&v3, 0, sizeof(v3));
  return CGRectApplyAffineTransform(self->mBoundsForStandardKnobs, &v3);
}

- (void)beginDynamicOperation
{
  objc_super v3;

  -[TSDGroupLayout p_createDynamicCopies](self, "p_createDynamicCopies");
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  -[TSDLayout beginDynamicOperation](&v3, sel_beginDynamicOperation);
}

- (id)computeInfoGeometryDuringResize
{
  return -[TSDLayoutGeometry infoGeometry](-[TSDAbstractLayout geometry](self, "geometry"), "infoGeometry");
}

- (void)takeRotationFromTracker:(id)a3
{
  TSDLayoutGeometry *v5;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDGroupLayout;
  -[TSDLayout takeRotationFromTracker:](&v10, sel_takeRotationFromTracker_);
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  if (a3)
    objc_msgSend(a3, "rotateTransform");
  v5 = -[TSDLayout originalGeometry](self, "originalGeometry");
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  -[TSDGroupLayout setDynamicGeometry:](self, "setDynamicGeometry:", -[TSDLayoutGeometry geometryByTransformingBy:](v5, "geometryByTransformingBy:", v6));
  -[TSDLayout invalidatePosition](self, "invalidatePosition");
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)resizeMayChangeAspectRatio
{
  return 0;
}

- (CGSize)minimumSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double width;
  double height;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGSize result;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v36 = *MEMORY[0x24BDAC8D0];
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  v28 = v3;
  v5 = v4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = (void *)-[TSDInfo childInfos](-[TSDLayout info](self, "info"), "childInfos");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v13 = (void *)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), self);
        objc_msgSend((id)objc_msgSend(v13, "geometry"), "size");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v13, "minimumSize");
        v19 = v18;
        v21 = v20;
        v22 = (void *)objc_msgSend(v13, "geometry");
        if (v22)
          objc_msgSend(v22, "transform");
        else
          memset(&v30, 0, sizeof(v30));
        v38.origin.x = 0.0;
        v38.origin.y = 0.0;
        v38.size.width = v15;
        v38.size.height = v17;
        v39 = CGRectApplyAffineTransform(v38, &v30);
        width = v39.size.width;
        height = v39.size.height;
        v25 = (void *)objc_msgSend(v13, "geometry", v39.origin.x, v39.origin.y);
        if (v25)
          objc_msgSend(v25, "transform");
        else
          memset(&v29, 0, sizeof(v29));
        v40.origin.x = 0.0;
        v40.origin.y = 0.0;
        v40.size.width = v19;
        v40.size.height = v21;
        v41 = CGRectApplyAffineTransform(v40, &v29);
        if (width > 1.0)
          v11 = fmax(v11, v41.size.width / width);
        if (height > 1.0)
          v10 = fmax(v10, v41.size.height / height);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  v26 = v28 * v11;
  v27 = v5 * v10;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)endDynamicOperation
{
  objc_super v3;

  -[TSDGroupLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  -[TSDLayout endDynamicOperation](&v3, sel_endDynamicOperation);
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDGroupLayout;
  -[TSDLayout invalidate](&v3, sel_invalidate);
  -[TSDGroupLayout p_invalidateParentForWrap](self, "p_invalidateParentForWrap");

  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
    *(_BYTE *)&self->super.super.mInvalidFlags |= 3u;
}

- (void)invalidateExteriorWrap
{
  -[TSDGroupLayout p_invalidateDescendentWrapPaths](self, "p_invalidateDescendentWrapPaths");

  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDGroupLayout;
  -[TSDLayout dragBy:](&v4, sel_dragBy_, a3.x, a3.y);
  -[TSDGroupLayout p_invalidateParentForWrap](self, "p_invalidateParentForWrap");
}

- (void)setGeometry:(id)a3
{
  TSDLayoutGeometry *v5;
  objc_super v6;

  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (!v5 || !-[TSDLayoutGeometry isEqual:](v5, "isEqual:", a3))
    -[TSDGroupLayout p_invalidateDescendentWrapPaths](self, "p_invalidateDescendentWrapPaths");
  v6.receiver = self;
  v6.super_class = (Class)TSDGroupLayout;
  -[TSDAbstractLayout setGeometry:](&v6, sel_setGeometry_, a3);
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (BOOL)allowsConnections
{
  return 1;
}

- (BOOL)supportsParentRotation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[TSDAbstractLayout children](self, "children", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "supportsParentRotation");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)supportsRotation
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[TSDAbstractLayout children](self, "children", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "supportsParentRotation");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)canFlip
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[TSDAbstractLayout children](self, "children", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "canFlip");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)p_childWrapPathsFrom:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        v11 = (void *)TSUDynamicCast();
        if (v11)
        {
          v12 = v11;
          v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "i_wrapPath"), "copy");
          objc_msgSend(v12, "transform");
          objc_msgSend(v13, "transformUsingAffineTransform:", &v15);
          objc_msgSend(v5, "addObject:", v13);

        }
        else if (objc_msgSend(v10, "conformsToProtocol:", &unk_254F89860))
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[TSDGroupLayout p_childWrapPathsFrom:](self, "p_childWrapPathsFrom:", objc_msgSend(v10, "descendentWrappables")));
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)i_computeWrapPath
{
  return +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", -[TSDGroupLayout p_childWrapPathsFrom:](self, "p_childWrapPathsFrom:", -[TSDAbstractLayout children](self, "children")));
}

- (id)i_wrapPath
{
  id result;

  result = self->mCachedWrapPath;
  if (!result)
  {
    result = +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", -[TSDGroupLayout p_childWrapPathsFrom:](self, "p_childWrapPathsFrom:", -[TSDAbstractLayout children](self, "children")));
    self->mCachedWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)i_externalWrapPath
{
  id result;

  result = self->mCachedExternalWrapPath;
  if (!result)
  {
    result = +[TSDBezierPath exteriorOfBezierPath:](TSDBezierPath, "exteriorOfBezierPath:", -[TSDGroupLayout i_wrapPath](self, "i_wrapPath"));
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (void)wrappableChildInvalidated
{

  self->mCachedWrapPath = 0;
  self->mCachedExternalWrapPath = 0;
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:](TSDLayout, "descendentWrappablesOfLayout:", self);
}

- (int)wrapContainerMode
{
  return 0;
}

- (void)p_createDynamicCopies
{
  void *v3;
  uint64_t v4;

  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
  {
    if (self->mDynamicLayoutGeometry)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupLayout p_createDynamicCopies]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupLayout.m"), 405, CFSTR("expected nil value for '%s'"), "mDynamicLayoutGeometry");
    }
    self->mDynamicLayoutGeometry = (TSDLayoutGeometry *)-[TSDLayoutGeometry copy](-[TSDAbstractLayout geometry](self, "geometry"), "copy");
  }
}

- (void)setDynamicGeometry:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDGroupLayout;
  -[TSDLayout setDynamicGeometry:](&v5, sel_setDynamicGeometry_);
  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
  {

    self->mDynamicLayoutGeometry = (TSDLayoutGeometry *)objc_msgSend(a3, "copy");
  }
}

- (void)p_destroyDynamicCopies
{
  TSDLayoutGeometry *mDynamicLayoutGeometry;
  void *v4;
  uint64_t v5;

  if ((-[TSDInfo isInlineWithText](-[TSDLayout info](self, "info"), "isInlineWithText") & 1) == 0)
  {
    mDynamicLayoutGeometry = self->mDynamicLayoutGeometry;
    if (!mDynamicLayoutGeometry)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupLayout p_destroyDynamicCopies]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupLayout.m"), 422, CFSTR("invalid nil value for '%s'"), "mDynamicLayoutGeometry");
      mDynamicLayoutGeometry = self->mDynamicLayoutGeometry;
    }

    self->mDynamicLayoutGeometry = 0;
  }
}

- (void)p_invalidateParentForWrap
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[TSDLayout isBeingManipulated](self, "isBeingManipulated"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = -[TSDGroupLayout descendentWrappables](self, "descendentWrappables", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "wrapType"))
          {
            v9 = objc_msgSend(v8, "parent");
            if (v9)
            {
              v10 = (void *)v9;
              while ((objc_opt_respondsToSelector() & 1) == 0)
              {
                v10 = (void *)objc_msgSend(v10, "parent");
                if (!v10)
                  goto LABEL_14;
              }
              objc_msgSend(v10, "wrappableChildInvalidated:", v8);
            }
          }
LABEL_14:
          ;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
  }
}

- (void)p_invalidateDescendentWrapPaths
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TSDGroupLayout descendentWrappables](self, "descendentWrappables", 0, 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        v7 = (void *)TSUDynamicCast();
        if (v7)
          objc_msgSend(v7, "invalidateExteriorWrap");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

@end
