@implementation TSDConnectionLineAbstractLayout

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  if (self->mConnectedFrom)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 53, CFSTR("expected nil value for '%s'"), "mConnectedFrom");
  }
  if (self->mConnectedTo)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout dealloc]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 54, CFSTR("expected nil value for '%s'"), "mConnectedTo");
  }

  v7.receiver = self;
  v7.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDShapeLayout dealloc](&v7, sel_dealloc);
}

- (double)outsetFrom
{
  double result;

  if (self->mUseDynamicOutsets)
    return self->mDynamicOutsetFrom;
  objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "outsetFrom");
  return result;
}

- (double)outsetTo
{
  double result;

  if (self->mUseDynamicOutsets)
    return self->mDynamicOutsetTo;
  objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "outsetTo");
  return result;
}

- (void)setConnectedFrom:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 == self)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout setConnectedFrom:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 85, CFSTR("trying to connect a c-line to itself"));
  }
  self->mConnectedFrom = (TSDLayout *)a3;
}

- (void)setConnectedTo:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 == self)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout setConnectedTo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 91, CFSTR("trying to connect a c-line to itself"));
  }
  self->mConnectedTo = (TSDLayout *)a3;
}

- (BOOL)shouldValidate
{
  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return self->mValidConnections;
}

- (id)reliedOnLayouts
{
  void *v3;
  void *v4;

  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = v3;
  if (self->mConnectedFrom)
    objc_msgSend(v3, "addObject:");
  if (self->mConnectedTo)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)additionalLayoutsForRepCreation
{
  return (id)objc_msgSend(-[TSDConnectionLineAbstractLayout reliedOnLayouts](self, "reliedOnLayouts"), "allObjects");
}

- (BOOL)supportsResize
{
  return 0;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsFlipping
{
  return !-[TSDConnectionLineAbstractLayout connectedFrom](self, "connectedFrom")
      && -[TSDConnectionLineAbstractLayout connectedTo](self, "connectedTo") == 0;
}

- (void)updateRepPath
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self), "processChangedProperty:", 526);
}

- (void)parentDidChange
{
  objc_super v3;

  if (!-[TSDAbstractLayout parent](self, "parent"))
    -[TSDConnectionLineAbstractLayout removeConnections](self, "removeConnections");
  -[TSDConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDDrawableLayout parentDidChange](&v3, sel_parentDidChange);
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if ((a3 - 539) > 1)
  {
    if (a3 == 526)
    {
      v5 = objc_opt_class();
      if (v5 != -[TSDInfo layoutClass](-[TSDLayout info](self, "info"), "layoutClass"))
        objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateLayoutForRecreation:", self);
    }
  }
  else
  {
    -[TSDConnectionLineAbstractLayout invalidateConnections](self, "invalidateConnections");
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDShapeLayout processChangedProperty:](&v6, sel_processChangedProperty_, v3);
}

- (void)connectedLayoutInvalidated:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSDConnectionLineAbstractLayout *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (-[TSDLayout layoutState](self, "layoutState") != 2
    || !-[TSDLayout isBeingTransformed](self, "isBeingTransformed"))
  {
    if (a3)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      obj = +[TSDLayoutController allInteractiveLayoutControllers](TSDLayoutController, "allInteractiveLayoutControllers");
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v22;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v22 != v7)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
            v17 = 0u;
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            v10 = (void *)objc_msgSend(v9, "layoutsForInfo:", -[TSDLayout info](self, "info"));
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v18;
              do
              {
                v14 = 0;
                do
                {
                  if (*(_QWORD *)v18 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(TSDConnectionLineAbstractLayout **)(*((_QWORD *)&v17 + 1) + 8 * v14);
                  if (v15 != self)
                  {
                    if (-[TSDConnectionLineAbstractLayout isMemberOfClass:](v15, "isMemberOfClass:", objc_opt_class()))-[TSDConnectionLineAbstractLayout invalidateConnections](v15, "invalidateConnections");
                  }
                  ++v14;
                }
                while (v12 != v14);
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              }
              while (v12);
            }
            ++v8;
          }
          while (v8 != v6);
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v6);
      }
    }
    -[TSDConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
    -[TSDShapeLayout invalidateFrame](self, "invalidateFrame");
    *(_WORD *)&self->super.mShapeInvalidFlags |= 0x20u;
    -[TSDDrawableLayout invalidate](self, "invalidate");
    -[TSDConnectionLineAbstractLayout updateRepPath](self, "updateRepPath");
    -[TSDDrawableLayout i_invalidateWrap](self, "i_invalidateWrap");
  }
}

- (void)removeConnections
{
  TSDLayout *mConnectedFrom;
  TSDLayout *mConnectedTo;

  self->mValidConnections = 0;
  mConnectedFrom = self->mConnectedFrom;
  if (mConnectedFrom)
    -[TSDLayout removeConnectedLayout:](mConnectedFrom, "removeConnectedLayout:", self);
  mConnectedTo = self->mConnectedTo;
  if (mConnectedTo)
    -[TSDLayout removeConnectedLayout:](mConnectedTo, "removeConnectedLayout:", self);
  self->mConnectedFrom = 0;
  self->mConnectedTo = 0;
}

- (void)invalidateConnections
{
  self->mValidConnections = 0;
  -[TSDConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  -[TSDShapeLayout invalidateFrame](self, "invalidateFrame");
  -[TSDDrawableLayout invalidate](self, "invalidate");
}

- (void)validate
{
  objc_super v3;

  if (-[TSDLayout invalidGeometry](self, "invalidGeometry"))
    -[TSDConnectionLineAbstractLayout invalidatePath](self, "invalidatePath");
  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDLayout validate](&v3, sel_validate);
}

- (void)checkConnections
{
  id v3;
  id v4;
  id v5;
  id v6;
  TSDAbstractLayout *v7;
  TSDLayout *v8;
  TSDLayout *v9;
  TSDLayout *mConnectedFrom;
  TSDLayout *mConnectedTo;

  if (!self->mValidConnections)
  {
    v3 = -[TSDLayout layoutController](self, "layoutController");
    v4 = -[TSDConnectionLineAbstractLayout connectionLineInfo](self, "connectionLineInfo");
    v5 = -[TSDConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", objc_msgSend(v4, "connectedFrom"));
    v6 = -[TSDConnectionLineAbstractLayout p_infoForConnectingToInfo:](self, "p_infoForConnectingToInfo:", objc_msgSend(v4, "connectedTo"));
    v7 = -[TSDAbstractLayout parent](self, "parent");
    v8 = (TSDLayout *)objc_msgSend(v3, "layoutForInfo:childOfLayout:", v5, v7);
    v9 = (TSDLayout *)objc_msgSend(v3, "layoutForInfo:childOfLayout:", v6, v7);
    mConnectedFrom = self->mConnectedFrom;
    if (v8 != mConnectedFrom)
    {
      if (mConnectedFrom)
        -[TSDLayout removeConnectedLayout:](mConnectedFrom, "removeConnectedLayout:", self);
      self->mConnectedFrom = v8;
      if (v8)
        -[TSDLayout addConnectedLayout:](v8, "addConnectedLayout:", self);
    }
    mConnectedTo = self->mConnectedTo;
    if (v9 != mConnectedTo)
    {
      if (mConnectedTo)
        -[TSDLayout removeConnectedLayout:](mConnectedTo, "removeConnectedLayout:", self);
      self->mConnectedTo = v9;
      if (v9)
        -[TSDLayout addConnectedLayout:](v9, "addConnectedLayout:", self);
    }
    if ((v5 == 0) != (v8 != 0) && (v6 == 0) != (v9 != 0))
    {
      self->mValidConnections = 1;
      -[TSDConnectionLineAbstractLayout updateRepPath](self, "updateRepPath");
      -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    }
  }
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  return 0;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double v6;
  double v7;
  CGPoint result;

  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)clipPath:(id)a3 onLayout:(id)a4 outset:(double)a5 reversed:(BOOL)a6 isValid:(BOOL *)a7
{
  _BOOL8 v8;
  id v11;
  double v13;
  double v14;
  TSDBezierPath *v15;
  TSDBezierPath *v16;
  TSDPathIntersection *v17;
  TSDBezierPath *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  BOOL v30;
  _BOOL4 v31;
  id v32;
  id v33;
  _BOOL8 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  _BYTE *v47;
  TSDPathIntersection *v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  TSDPathIntersection *v53;
  void *v54;
  uint64_t v55;
  BOOL *v56;
  _BYTE *v57;
  uint64_t v58;
  _OWORD v59[3];
  _QWORD v60[3];

  v8 = a6;
  v11 = a3;
  v60[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "length");
  v14 = v13;
  v15 = (TSDBezierPath *)objc_msgSend(a4, "i_externalWrapPath");
  if (!v15)
    return 0;
  v16 = v15;
  if (-[TSDBezierPath isEmpty](v15, "isEmpty"))
    return 0;
  v56 = a7;
  if (a5 <= 0.0)
  {
    v19 = v16;
  }
  else
  {
    if (self->mCachedFromWrapPath == v16 && self->mCachedFromOutset == a5)
    {
      v21 = 696;
    }
    else
    {
      if (self->mCachedToWrapPath != v16 || self->mCachedToOutset != a5)
      {
        -[TSDBezierPath setLineWidth:](v16, "setLineWidth:", a5 + a5, a7);
        -[TSDBezierPath setLineJoinStyle:](v16, "setLineJoinStyle:", 1);
        -[TSDBezierPath setLineCapStyle:](v16, "setLineCapStyle:", 1);
        v60[0] = v16;
        v60[1] = -[TSDBezierPath outlineStroke](v16, "outlineStroke");
        v19 = +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2));
        if (self->mConnectedFrom == a4)
        {

          self->mCachedFromOutsetWrapPath = v19;
          self->mCachedFromWrapPath = v16;
          v20 = 680;
        }
        else
        {

          self->mCachedToOutsetWrapPath = v19;
          self->mCachedToWrapPath = v16;
          v20 = 688;
        }
        *(double *)((char *)&self->super.super.super.super.super.super.isa + v20) = a5;
        goto LABEL_18;
      }
      v21 = 704;
    }
    v19 = *(TSDBezierPath **)((char *)&self->super.super.super.super.super.super.isa + v21);
  }
LABEL_18:
  v22 = (id)-[TSDBezierPath copy](v19, "copy", v56);
  v23 = (void *)objc_msgSend(a4, "geometry");
  if (v23)
    objc_msgSend(v23, "transform");
  else
    memset(v59, 0, sizeof(v59));
  objc_msgSend(v22, "transformUsingAffineTransform:", v59);
  v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(v11, "addIntersectionsWithPath:to:allIntersections:reversed:", v22, v24, 1, 0);
  if (!objc_msgSend(v24, "count"))
    goto LABEL_49;
  objc_msgSend(v24, "sortUsingSelector:", sel_compareSegmentAndT_);
  v25 = objc_msgSend(v24, "count");
  if (v25 < 0)
  {
    v54 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v55 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:]");
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 344, CFSTR("Out-of-bounds type assignment was clamped to max"));
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8)
    v26 = v25 - 1;
  else
    v26 = 0;
  v27 = -1;
  if (!v8)
    v27 = 1;
  v58 = v27;
  if (v26 >= v25 || v26 < 0)
  {
LABEL_49:
    v47 = v57;
    *v57 = 1;
    goto LABEL_50;
  }
  v28 = 1.0 / v14;
  v29 = 1.0 - 1.0 / v14;
  while (1)
  {
    v17 = (TSDPathIntersection *)objc_msgSend(v24, "objectAtIndex:", v26);
    v26 += v58;
    v30 = v26 >= v25 || v26 < 0;
    v31 = !v30;
    if (v31)
    {
      v32 = v11;
      v33 = v22;
      v34 = v8;
      v35 = (void *)objc_msgSend(v24, "objectAtIndex:", v26);
      v36 = objc_msgSend(v35, "segment");
      v37 = v35;
      v8 = v34;
      v22 = v33;
      v11 = v32;
      objc_msgSend(v37, "t");
      v39 = v38;
    }
    else if (v8)
    {
      v36 = 0;
      v39 = 0.0;
    }
    else
    {
      v36 = objc_msgSend(v11, "elementCount") - 1;
      v39 = 1.0;
    }
    v40 = (double)(-[TSDPathIntersection segment](v17, "segment") + v36) * 0.5;
    v41 = ceil(v40);
    v42 = floor(v40);
    if (v8)
      v42 = v41;
    v43 = (uint64_t)v42;
    -[TSDPathIntersection t](v17, "t");
    objc_msgSend(v11, "pointAt:fromElement:", v43, (v39 + v44) * 0.5);
    if ((objc_msgSend(v22, "containsPoint:") & 1) == 0)
    {
      -[TSDPathIntersection t](v17, "t");
      if (v45 > v28)
      {
        -[TSDPathIntersection t](v17, "t");
        if (v46 < v29)
          break;
      }
    }
    if (!v31)
      goto LABEL_49;
  }
  v47 = v57;
  *v57 = 1;
  if (!v17)
  {
LABEL_50:
    if (v8)
    {
      objc_msgSend(v11, "pointAt:fromElement:", objc_msgSend(v11, "elementCount") - 1, 0.99);
      if (objc_msgSend(v22, "containsPoint:"))
      {
        v48 = [TSDPathIntersection alloc];
        v49 = *MEMORY[0x24BDBEFB0];
        v50 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        v51 = 0.0;
        v52 = 0;
LABEL_55:
        v17 = -[TSDPathIntersection initWithSegment:atT:atPoint:](v48, "initWithSegment:atT:atPoint:", v52, v51, v49, v50);
        *v47 = 0;
        return v17;
      }
    }
    else
    {
      objc_msgSend(v11, "pointAt:fromElement:", 1, 0.01);
      if (objc_msgSend(v22, "containsPoint:"))
      {
        v53 = [TSDPathIntersection alloc];
        v52 = objc_msgSend(v11, "elementCount") - 1;
        v49 = *MEMORY[0x24BDBEFB0];
        v50 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        v51 = 1.0;
        v48 = v53;
        goto LABEL_55;
      }
    }
    return 0;
  }
  return v17;
}

- (void)updateConnectedPath
{
  TSDLayout *mConnectedFrom;
  TSDAbstractLayout *v4;
  TSDLayout *v5;
  TSDLayout *mConnectedTo;
  TSDAbstractLayout *v7;
  TSDLayout *v8;
  id v9;
  TSDInfoGeometry *mResizeInfoGeometry;
  double *v11;
  TSDInfoGeometry *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double x;
  double y;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  TSDBezierPath *v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  TSDInfoGeometry *mConnectedInfoGeometry;
  TSDInfoGeometry *v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  double v59;
  double v60;
  CGPoint v61;
  double v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  mConnectedFrom = self->mConnectedFrom;
  if (mConnectedFrom
    && (v4 = -[TSDAbstractLayout parent](mConnectedFrom, "parent"), v4 == -[TSDAbstractLayout parent](self, "parent")))
  {
    v5 = self->mConnectedFrom;
  }
  else
  {
    v5 = 0;
  }
  mConnectedTo = self->mConnectedTo;
  if (mConnectedTo
    && (v7 = -[TSDAbstractLayout parent](mConnectedTo, "parent"), v7 == -[TSDAbstractLayout parent](self, "parent")))
  {
    v8 = self->mConnectedTo;
  }
  else
  {
    v8 = 0;
  }
  objc_opt_class();
  if (!self->super.mResizePathSource)
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  v9 = (id)TSUDynamicCast();
  mResizeInfoGeometry = self->super.mResizeInfoGeometry;
  if (!mResizeInfoGeometry)
    mResizeInfoGeometry = (TSDInfoGeometry *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  v11 = (double *)MEMORY[0x24BDBEFB0];
  v58 = *MEMORY[0x24BDBEFB0];
  v57 = v58;
  objc_msgSend((id)objc_msgSend(v9, "bezierPath"), "getStartPoint:andEndPoint:", &v58, &v57);
  if (!-[TSDConnectionLineAbstractLayout canEndpointsCoincide](self, "canEndpointsCoincide")
    && TSDNearlyEqualPoints(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v58, *((double *)&v58 + 1)))
  {
    v9 = +[TSDConnectionLinePathSource pathSourceOfLength:](TSDConnectionLinePathSource, "pathSourceOfLength:", 100.0);
    objc_msgSend((id)objc_msgSend(v9, "bezierPath"), "getStartPoint:andEndPoint:", &v58, &v57);
    v12 = [TSDInfoGeometry alloc];
    -[TSDInfoGeometry position](mResizeInfoGeometry, "position");
    mResizeInfoGeometry = -[TSDInfoGeometry initWithPosition:size:](v12, "initWithPosition:size:");
    if (TSDNearlyEqualPoints(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v58, *((double *)&v58 + 1)))
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDConnectionLineAbstractLayout updateConnectedPath]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDConnectionLineAbstractLayout.m"), 435, CFSTR("head and tail should no longer be equal"));
    }
  }
  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  if (mResizeInfoGeometry)
  {
    -[TSDInfoGeometry transform](mResizeInfoGeometry, "transform");
    v15 = *((double *)&v54 + 1);
    v16 = *(double *)&v54;
    v17 = *((double *)&v55 + 1);
    v18 = *(double *)&v55;
    v19 = *((double *)&v56 + 1);
    v20 = *(double *)&v56;
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
  }
  v21 = v20 + *((double *)&v58 + 1) * v18 + v16 * *(double *)&v58;
  v22 = v19 + *((double *)&v58 + 1) * v17 + v15 * *(double *)&v58;
  *(double *)&v58 = v21;
  *((double *)&v58 + 1) = v22;
  v23 = v20 + v18 * *((double *)&v57 + 1) + v16 * *(double *)&v57;
  v24 = v19 + v17 * *((double *)&v57 + 1) + v15 * *(double *)&v57;
  *(double *)&v57 = v23;
  *((double *)&v57 + 1) = v24;
  x = v21;
  y = v22;
  if (v5)
  {
    -[TSDLayout centerForConnecting](v5, "centerForConnecting");
    x = v27;
    y = v28;
  }
  if (v8)
  {
    -[TSDLayout centerForConnecting](v8, "centerForConnecting");
    v30 = v29;
    v32 = v31;
  }
  else
  {
    v32 = *((double *)&v57 + 1);
    v30 = *(double *)&v57;
  }
  if (self->mUseResizePoints[0])
  {
    x = self->mResizeControlPoints[0].x;
    y = self->mResizeControlPoints[0].y;
  }
  if (self->mUseResizePoints[2])
  {
    v30 = self->mResizeControlPoints[2].x;
    v32 = self->mResizeControlPoints[2].y;
  }
  if (!-[TSDConnectionLineAbstractLayout canEndpointsCoincide](self, "canEndpointsCoincide")
    && TSDNearlyEqualPoints(x, y, v30, v32)
    || (TSDPointHasNaNComponents() & 1) != 0
    || TSDPointHasNaNComponents())
  {
    self->mValidLine = 0;
    self->mVisibleLine = 0;

    self->mConnectedInfoGeometry = mResizeInfoGeometry;
    self->mConnectedPathSource = (TSDConnectionLinePathSource *)objc_msgSend(v9, "copy");

    v33 = (TSDBezierPath *)+[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    self->mClippedBezierPath = v33;
    v34 = *v11;
    v35 = v11[1];
    -[TSDBezierPath moveToPoint:](v33, "moveToPoint:", *v11, v35);
    -[TSDBezierPath lineToPoint:](self->mClippedBezierPath, "lineToPoint:", v34, v35);
  }
  else
  {
    self->mValidLine = 1;
    v59 = x;
    v60 = y;
    if (self->mUseResizePoints[1])
    {
      v61 = self->mResizeControlPoints[1];
    }
    else
    {
      -[TSDConnectionLineAbstractLayout controlPointForPointA:pointB:andOriginalA:originalB:](self, "controlPointForPointA:pointB:andOriginalA:originalB:", x, y, v30, v32, v21, v22, v23, v24);
      v61.x = v36;
      v61.y = v37;
    }
    v62 = v30;
    v63 = v32;
    v38 = -[TSDConnectionLineAbstractLayout createConnectedPathFrom:to:withControlPoints:](self, "createConnectedPathFrom:to:withControlPoints:", v5, v8, &v59);
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;

    self->mConnectedInfoGeometry = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v40, v42, v44, v46);
    v47 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    objc_msgSend(v47, "moveToPoint:", v59, v60);
    objc_msgSend(v47, "lineToPoint:", v61);
    objc_msgSend(v47, "lineToPoint:", v62, v63);
    mConnectedInfoGeometry = self->mConnectedInfoGeometry;
    if (mConnectedInfoGeometry)
      -[TSDInfoGeometry transform](mConnectedInfoGeometry, "transform");
    else
      memset(&v52, 0, sizeof(v52));
    CGAffineTransformInvert(&v53, &v52);
    objc_msgSend(v47, "transformUsingAffineTransform:", &v53);

    self->mConnectedPathSource = -[TSDConnectionLinePathSource initWithBezierPath:]([TSDConnectionLinePathSource alloc], "initWithBezierPath:", v47);
    -[TSDConnectionLinePathSource setType:](self->mConnectedPathSource, "setType:", objc_msgSend(v9, "type"));
    objc_msgSend(v9, "outsetFrom");
    -[TSDConnectionLinePathSource setOutsetFrom:](self->mConnectedPathSource, "setOutsetFrom:");
    objc_msgSend(v9, "outsetTo");
    -[TSDConnectionLinePathSource setOutsetTo:](self->mConnectedPathSource, "setOutsetTo:");
    v49 = self->mConnectedInfoGeometry;
    if (v49)
      -[TSDInfoGeometry transform](v49, "transform");
    else
      memset(&v50, 0, sizeof(v50));
    CGAffineTransformInvert(&v51, &v50);
    objc_msgSend(v38, "transformUsingAffineTransform:", &v51);

    self->mClippedBezierPath = (TSDBezierPath *)v38;
  }
}

- (BOOL)isInvisible
{
  return !self->mValidConnections || !self->mVisibleLine;
}

- (BOOL)canEndpointsCoincide
{
  return 0;
}

- (BOOL)canFlip
{
  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return !self->mConnectedFrom && self->mConnectedTo == 0;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (int)wrapType
{
  objc_super v4;

  if (-[TSDConnectionLineAbstractLayout isInvisible](self, "isInvisible"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineAbstractLayout;
  return -[TSDDrawableLayout wrapType](&v4, sel_wrapType);
}

- (TSDConnectionLinePathSource)connectedPathSource
{
  TSDConnectionLinePathSource *result;

  result = self->mConnectedPathSource;
  if (!result || !self->mValidConnections)
  {
    -[TSDConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    return self->mConnectedPathSource;
  }
  return result;
}

- (id)pathSource
{
  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return -[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource");
}

- (id)layoutInfoGeometry
{
  TSDInfoGeometry *mConnectedInfoGeometry;

  mConnectedInfoGeometry = self->mConnectedInfoGeometry;
  if (!mConnectedInfoGeometry || !self->mValidConnections)
  {
    -[TSDConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    mConnectedInfoGeometry = self->mConnectedInfoGeometry;
  }
  return mConnectedInfoGeometry;
}

- (CGRect)boundsForStandardKnobs
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGRect v15;

  objc_msgSend(-[TSDConnectionLineAbstractLayout path](self, "path"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  v12 = -v11;
  v14 = -v13;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectOffset(v15, v12, v14);
}

- (void)invalidatePosition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDLayout invalidatePosition](&v3, sel_invalidatePosition);

  self->mConnectedInfoGeometry = 0;
}

- (void)invalidatePath
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDShapeLayout invalidatePath](&v3, sel_invalidatePath);
  -[TSDDrawableLayout invalidate](self, "invalidate");
  -[TSDConnectionLineAbstractLayout invalidatePosition](self, "invalidatePosition");

  self->mConnectedPathSource = 0;
  self->mClippedBezierPath = 0;
}

- (BOOL)pathIsLineSegment
{
  return 1;
}

- (BOOL)pathIsOpen
{
  return 1;
}

- (id)path
{
  id result;

  result = self->mClippedBezierPath;
  if (!result || !self->mValidConnections)
  {
    -[TSDConnectionLineAbstractLayout updateConnectedPath](self, "updateConnectedPath");
    return self->mClippedBezierPath;
  }
  return result;
}

- (CGPoint)unclippedHeadPoint
{
  double v3;
  double v4;
  uint64_t v5;
  objc_super v6;
  double v7;
  double v8;
  CGPoint result;

  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  if (self->mConnectedTo)
  {
    v7 = 0.0;
    v8 = 0.0;
    objc_msgSend(-[TSDConnectionLinePathSource bezierPath](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0), "bezierPath"), "getStartPoint:andEndPoint:", &v5, &v7);
    v3 = v7;
    v4 = v8;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDConnectionLineAbstractLayout;
    -[TSDShapeLayout unclippedHeadPoint](&v6, sel_unclippedHeadPoint);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)unclippedTailPoint
{
  double v3;
  double v4;
  uint64_t v5;
  objc_super v6;
  double v7;
  double v8;
  CGPoint result;

  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  if (self->mConnectedFrom)
  {
    v7 = 0.0;
    v8 = 0.0;
    objc_msgSend(-[TSDConnectionLinePathSource bezierPath](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", 0, 0), "bezierPath"), "getStartPoint:andEndPoint:", &v7, &v5);
    v3 = v7;
    v4 = v8;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDConnectionLineAbstractLayout;
    -[TSDShapeLayout unclippedTailPoint](&v6, sel_unclippedTailPoint);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)shouldDisplayGuides
{
  -[TSDConnectionLineAbstractLayout checkConnections](self, "checkConnections");
  return !self->mConnectedFrom && self->mConnectedTo == 0;
}

- (void)beginDynamicOperation
{
  CGPoint *p_mLooseEndPosition;
  CGFloat v4;
  CGFloat v5;
  id v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDShapeLayout beginDynamicOperation](&v13, sel_beginDynamicOperation);
  self->mOriginalPathSource = (TSDConnectionLinePathSource *)objc_msgSend(-[TSDConnectionLineAbstractLayout pathSource](self, "pathSource"), "copy");

  self->super.mResizePathSource = 0;
  self->super.mResizePathSource = (TSDPathSource *)objc_msgSend(-[TSDConnectionLineAbstractLayout pathSource](self, "pathSource"), "copy");

  self->super.mInitialInfoGeometry = (TSDInfoGeometry *)-[TSDConnectionLineAbstractLayout layoutInfoGeometry](self, "layoutInfoGeometry");
  self->mOldConnectedFrom = self->mConnectedFrom;
  self->mOldConnectedTo = self->mConnectedTo;
  self->mAcumulatedDrag = (CGPoint)*MEMORY[0x24BDBEFB0];
  p_mLooseEndPosition = &self->mLooseEndPosition;
  if (self->mConnectedTo)
    -[TSDConnectionLineAbstractLayout unclippedTailPoint](self, "unclippedTailPoint");
  else
    -[TSDConnectionLineAbstractLayout unclippedHeadPoint](self, "unclippedHeadPoint");
  p_mLooseEndPosition->x = v4;
  self->mLooseEndPosition.y = v5;
  v6 = -[TSDLayout pureGeometry](self, "pureGeometry");
  if (v6)
  {
    objc_msgSend(v6, "transform");
    v7 = v10;
    v8 = v11;
    v9 = v12;
  }
  else
  {
    v9 = 0uLL;
    v7 = 0uLL;
    v8 = 0uLL;
  }
  *(float64x2_t *)p_mLooseEndPosition = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, self->mLooseEndPosition.y), v7, p_mLooseEndPosition->x));
  *(_WORD *)self->mUseResizePoints = 0;
  self->mUseResizePoints[2] = 0;
}

- (void)endDynamicOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDShapeLayout endDynamicOperation](&v3, sel_endDynamicOperation);

  self->mOriginalPathSource = 0;
  self->mOldConnectedFrom = 0;

  self->mOldConnectedTo = 0;
  *(_WORD *)self->mUseResizePoints = 0;
  self->mUseResizePoints[2] = 0;
}

- (CGPoint)i_accumulatedDrag
{
  double x;
  double y;
  CGPoint result;

  x = self->mAcumulatedDrag.x;
  y = self->mAcumulatedDrag.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)pauseDynamicTransformation
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  CGFloat v12;
  TSDInfoGeometry *mInitialInfoGeometry;
  id v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TSDConnectionLineAbstractLayout;
  -[TSDLayout pauseDynamicTransformation](&v22, sel_pauseDynamicTransformation);
  if (-[TSDLayout layoutState](self, "layoutState") == 2)
  {
    if (self->mConnectedTo)
      -[TSDConnectionLineAbstractLayout unclippedTailPoint](self, "unclippedTailPoint");
    else
      -[TSDConnectionLineAbstractLayout unclippedHeadPoint](self, "unclippedHeadPoint");
    v16 = v3;
    v6 = -[TSDLayout pureGeometry](self, "pureGeometry", v4, v5);
    if (v6)
    {
      objc_msgSend(v6, "transform");
      v7 = v19;
      v8 = v20;
      v9 = v21;
    }
    else
    {
      v9 = 0uLL;
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
      v7 = 0uLL;
      v8 = 0uLL;
    }
    v10 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, v15), v7, v16));
    v11 = TSDSubtractPoints(v10.f64[0], v10.f64[1], self->mLooseEndPosition.x);
    self->mAcumulatedDrag.x = v11;
    self->mAcumulatedDrag.y = v12;
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeTranslation(&v18, v11, v12);
    mInitialInfoGeometry = self->super.mInitialInfoGeometry;
    v17 = v18;
    v14 = -[TSDInfoGeometry geometryByAppendingTransform:](mInitialInfoGeometry, "geometryByAppendingTransform:", &v17);

    self->super.mResizeInfoGeometry = (TSDInfoGeometry *)v14;
  }
}

- (BOOL)isStraightLine
{
  void *v3;
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
  _BOOL4 v16;
  double v17;
  double v18;
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

  objc_opt_class();
  -[TSDConnectionLineAbstractLayout pathSource](self, "pathSource");
  v3 = (void *)TSUDynamicCast();
  objc_msgSend(v3, "getControlKnobPosition:", 10);
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "getControlKnobPosition:", 12);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "getControlKnobPosition:", 11);
  v13 = v12;
  v15 = v14;
  v16 = TSDNearlyCollinearPoints(v5, v7, v9, v11, v12, v14);
  if (v16)
  {
    v17 = TSDMultiplyPointScalar(v5, v7, 0.25);
    v18 = TSDSubtractPoints(v9, v11, v17);
    v20 = v19;
    v21 = TSDMultiplyPointScalar(v13, v15, 0.25);
    v22 = TSDSubtractPoints(v18, v20, v21);
    v24 = TSDMultiplyPointScalar(v22, v23, 2.0);
    v26 = v25;
    v27 = TSDSubtractPoints(v5, v7, v24);
    v29 = v28;
    v30 = TSDSubtractPoints(v24, v26, v13);
    LOBYTE(v16) = TSDDotPoints(v27, v29, v30, v31) > 0.0;
  }
  return v16;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[TSDConnectionLinePathSource getControlKnobPosition:](-[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource"), "getControlKnobPosition:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)p_infoForConnectingToInfo:(id)a3
{
  void *v4;

  objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "delegate");
  v4 = (void *)TSUProtocolCast();
  if (v4)
    return (id)objc_msgSend(v4, "infoToConnectToForConnectionLineConnectedToInfo:", a3);
  else
    return a3;
}

- (TSDLayout)connectedFrom
{
  return self->mConnectedFrom;
}

- (TSDLayout)connectedTo
{
  return self->mConnectedTo;
}

- (BOOL)validLine
{
  return self->mValidLine;
}

- (BOOL)useDynamicOutsets
{
  return self->mUseDynamicOutsets;
}

- (void)setUseDynamicOutsets:(BOOL)a3
{
  self->mUseDynamicOutsets = a3;
}

- (double)dynamicOutsetFrom
{
  return self->mDynamicOutsetFrom;
}

- (void)setDynamicOutsetFrom:(double)a3
{
  self->mDynamicOutsetFrom = a3;
}

- (double)dynamicOutsetTo
{
  return self->mDynamicOutsetTo;
}

- (void)setDynamicOutsetTo:(double)a3
{
  self->mDynamicOutsetTo = a3;
}

@end
