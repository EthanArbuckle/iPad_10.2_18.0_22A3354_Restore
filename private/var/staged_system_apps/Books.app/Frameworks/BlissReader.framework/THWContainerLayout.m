@implementation THWContainerLayout

- (void)dealloc
{
  objc_super v3;

  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (id)childrenForLayout
{
  id v3;
  id result;
  BOOL v5;

  v3 = -[THWContainerLayout childInfosForLayout](self, "childInfosForLayout");
  result = -[THWContainerLayout additionalLayouts](self, "additionalLayouts");
  if (v3 && result)
    return objc_msgSend(v3, "arrayByAddingObjectsFromArray:", result);
  if (result)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (!v5)
    return v3;
  return result;
}

- (void)updateChildrenFromInfo
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  uint64_t v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = -[THWContainerLayout childrenForLayout](self, "childrenForLayout");
  v4 = -[THWContainerLayout children](self, "children");
  if (v4 && (v5 = objc_msgSend(v3, "count"), v5 == objc_msgSend(v4, "count")))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v3);
          v10 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(TSDLayout);
          *(_QWORD *)&v12 = TSUDynamicCast(v11, v10).n128_u64[0];
          v14 = v13;
          v15 = objc_msgSend(v4, "objectAtIndex:", 0, v12);
          if (v14)
          {
            if (v15 != v14)
              goto LABEL_15;
          }
          else if (objc_msgSend(v15, "info") != v10)
          {
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v7);
    }
  }
  else
  {
LABEL_15:
    v27 = v4;
    v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    v17 = -[THWContainerLayout layoutController](self, "layoutController");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v3);
          v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          v23 = objc_opt_class(TSDLayout);
          TSUDynamicCast(v23, v22);
          v25 = v24;
          if (!v25)
          {
            v26 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, v22);
            v25 = objc_msgSend(v17, "layoutForInfo:childOfLayout:", v26, self);
            if (!v25)
            {
              v25 = objc_msgSend(objc_alloc((Class)objc_msgSend(v26, "layoutClass")), "initWithInfo:", v26);
              -[THWContainerLayout childLayoutCreated:](self, "childLayoutCreated:", v25);
              if (!v25)
                continue;
            }
          }
          objc_msgSend(v16, "addObject:", v25);

        }
        v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }
    -[THWContainerLayout setChildren:](self, "setChildren:", v16);

    -[THWContainerLayout invalidate](self, "invalidate");
    v4 = v27;
  }

  objc_msgSend(-[THWContainerLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
}

- (id)additionalLayouts
{
  return +[NSArray array](NSArray, "array");
}

- (id)i_exteriorTextWrap
{
  return objc_msgSend(objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetInfo, -[THWContainerLayout info](self, "info")), "adornmentInfo"), "exteriorTextWrap");
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
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[THWContainerLayout frameInRoot](self, "frameInRoot");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  if (v11)
  {
    objc_msgSend(v11, "margin");
    if (v12 > 0.0)
    {
      v13 = -v12;
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectInset(v18, v13, v13);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)i_computeWrapPath
{
  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize(objc_msgSend(-[THWContainerLayout geometry](self, "geometry"), "size")));
}

- (id)i_wrapPath
{
  id result;

  result = self->mCachedWrapPath;
  if (!result)
  {
    result = -[THWContainerLayout i_computeWrapPath](self, "i_computeWrapPath");
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
    result = +[TSDBezierPath exteriorOfBezierPath:](TSDBezierPath, "exteriorOfBezierPath:", -[THWContainerLayout i_wrapPath](self, "i_wrapPath"));
    self->mCachedExternalWrapPath = (TSDBezierPath *)result;
  }
  return result;
}

- (id)wrapPolygon
{
  id result;
  TSDBezierPath *v4;
  id v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  TSDWrapPolygon *v10;
  _BYTE v11[48];

  result = self->mCachedWrapPolygon;
  if (!result)
  {
    v4 = -[THWContainerLayout i_wrapPath](self, "i_wrapPath");
    v5 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
    if (v5 && (v6 = v5, objc_msgSend(v5, "margin"), v7 > 0.0))
    {
      if ((uint64_t)-[TSDBezierPath elementCount](v4, "elementCount") >= 1001)
        v4 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize(objc_msgSend(-[THWContainerLayout geometry](self, "geometry"), "size")));
      objc_msgSend(v6, "margin");
      v8 = -[TSDBezierPath bezierPathByOffsettingPath:joinStyle:withThreshold:](v4, "bezierPathByOffsettingPath:joinStyle:withThreshold:", 1);
    }
    else
    {
      v8 = -[TSDBezierPath copy](v4, "copy");
    }
    v9 = v8;
    -[THWContainerLayout transformInRoot](self, "transformInRoot");
    objc_msgSend(v9, "transformUsingAffineTransform:", v11);
    v10 = (TSDWrapPolygon *)objc_msgSend(objc_alloc((Class)TSDWrapPolygon), "initWithPath:", v9);
    self->mCachedWrapPolygon = v10;
    -[TSDWrapPolygon setIntersectsSelf:](v10, "setIntersectsSelf:", 0);
    result = self->mCachedWrapPolygon;
    if (!result)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWContainerLayout wrapPolygon]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWContainerLayout.m"), 232, CFSTR("invalid nil value for '%s'"), "mCachedWrapPolygon");
      return self->mCachedWrapPolygon;
    }
  }
  return result;
}

- (BOOL)isHTMLWrap
{
  id v2;

  v2 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isHTMLWrap");
  return (char)v2;
}

- (int)wrapType
{
  id v2;

  v2 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "type");
  return (int)v2;
}

- (int)wrapDirection
{
  id v2;

  v2 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  if (v2)
    return objc_msgSend(v2, "direction");
  else
    return 2;
}

- (int)wrapFitType
{
  id v2;

  v2 = -[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap");
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "fitType");
  return (int)v2;
}

- (BOOL)hasAlpha
{
  return 0;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout invalidate](&v3, "invalidate");
  -[THWContainerLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)invalidateExteriorWrap
{

  self->mCachedWrapPolygon = 0;
  self->mCachedWrapPath = 0;

  self->mCachedExternalWrapPath = 0;
}

- (void)dragBy:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout dragBy:](&v4, "dragBy:", a3.x, a3.y);
  -[THWContainerLayout invalidateParentForWrap](self, "invalidateParentForWrap");
}

- (void)setGeometry:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double y;
  __n128 v12;
  float64x2_t v13;
  CGFloat v14;
  TSDWrapPolygon *mCachedWrapPolygon;
  CGFloat v16;
  double v17;
  CGPoint v18;
  __n128 v19;
  objc_super v20;
  CGAffineTransform v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;

  v5 = -[THWContainerLayout geometry](self, "geometry");
  if (!v5)
  {
    if (!self->mCachedWrapPolygon)
      goto LABEL_11;
    goto LABEL_8;
  }
  v6 = v5;
  if ((objc_msgSend(v5, "isEqual:", a3) & 1) != 0 || !self->mCachedWrapPolygon)
    goto LABEL_11;
  if ((objc_msgSend(v6, "differsInMoreThanTranslationFrom:", a3) & 1) != 0)
  {
LABEL_8:
    -[THWContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
    goto LABEL_11;
  }
  if (a3)
  {
    objc_msgSend(a3, "transform");
    v8 = v25;
    v9 = v26;
    v10 = v27;
  }
  else
  {
    v10 = 0uLL;
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
    v8 = 0uLL;
    v9 = 0uLL;
  }
  y = CGPointZero.y;
  v18 = CGPointZero;
  v19 = (__n128)vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, y), v8, CGPointZero.x));
  objc_msgSend(v6, "transform", *(_QWORD *)&y, v7);
  v12 = (__n128)vmlaq_n_f64(vmulq_n_f64(v23, v17), v22, v18.x);
  v13 = vaddq_f64(v24, (float64x2_t)v12);
  v12.n128_u64[0] = v19.n128_u64[1];
  v14 = TSDSubtractPoints(v19, v12, v13.f64[0], v13.f64[1]);
  mCachedWrapPolygon = self->mCachedWrapPolygon;
  CGAffineTransformMakeTranslation(&v21, v14, v16);
  -[TSDWrapPolygon transformUsingAffineTransform:](mCachedWrapPolygon, "transformUsingAffineTransform:", &v21);
LABEL_11:
  v20.receiver = self;
  v20.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout setGeometry:](&v20, "setGeometry:", a3);
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 == 521)
    -[THWContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (void)parentDidChange
{
  objc_super v3;

  -[THWContainerLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
  v3.receiver = self;
  v3.super_class = (Class)THWContainerLayout;
  -[THWContainerLayout parentDidChange](&v3, "parentDidChange");
}

- (BOOL)allowsConnections
{
  return 1;
}

- (void)i_invalidateWrap
{
  id v3;
  id v4;

  v3 = -[THWContainerLayout parent](self, "parent");
  if (v3)
  {
    v4 = v3;
    while ((objc_opt_respondsToSelector(v4, "wrappableChildInvalidated:") & 1) == 0)
    {
      v4 = objc_msgSend(v4, "parent");
      if (!v4)
        return;
    }
    objc_msgSend(v4, "wrappableChildInvalidated:", self);
  }
}

- (void)invalidateParentForWrap
{
  if (-[THWContainerLayout isBeingManipulated](self, "isBeingManipulated"))
    -[THWContainerLayout i_invalidateWrap](self, "i_invalidateWrap");
}

- (BOOL)supportsInspectorPositioning
{
  if (objc_msgSend(-[THWContainerLayout info](self, "info"), "isAnchoredToText")
    && (objc_msgSend(-[THWContainerLayout i_exteriorTextWrap](self, "i_exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(-[THWContainerLayout info](self, "info"), "isInlineWithText") ^ 1;
  }
}

@end
