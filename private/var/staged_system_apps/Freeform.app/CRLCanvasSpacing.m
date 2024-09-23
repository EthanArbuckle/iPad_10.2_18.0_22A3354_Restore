@implementation CRLCanvasSpacing

- (_QWORD)initWithGuideType:(CGFloat)a3 withSpacingRect:(CGFloat)a4 forFrame:(CGFloat)a5 andFrame:(double)a6
{
  _QWORD *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_super v37;
  CGRect v38;

  v37.receiver = a1;
  v37.super_class = (Class)CRLCanvasSpacing;
  v29 = objc_msgSendSuper2(&v37, "init");
  if (v29)
  {
    v30 = objc_alloc_init((Class)NSMutableSet);
    v31 = (void *)v29[1];
    v29[1] = v30;

    v32 = objc_alloc_init((Class)NSMutableSet);
    v33 = (void *)v29[2];
    v29[2] = v32;

    if (a11 == 1)
      v34 = objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry standardAxesGeometry](CRLSwappableAxesGeometry, "standardAxesGeometry"));
    else
      v34 = objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry swappedAxesGeometry](CRLSwappableAxesGeometry, "swappedAxesGeometry"));
    v35 = (void *)v29[5];
    v29[5] = v34;

    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    if (!CGRectIsNull(v38))
      objc_msgSend(v29, "addSpacingRect:forFrame:andFrame:", a2, a3, a4, a5, a6, a7, a8, a9, a17, a18, a19, a20);
  }
  return v29;
}

- (int)integerOffset
{
  double v3;

  if (!-[NSMutableSet count](self->mSpacingRects, "count"))
    return 1;
  -[CRLCanvasSpacing exactOffset](self, "exactOffset");
  return (int)sub_1003C65A0(v3);
}

- (double)exactOffset
{
  CRLSwappableAxesGeometry *mHorizontalGeom;
  void *v3;
  void *v4;
  double v5;
  double v6;

  mHorizontalGeom = self->mHorizontalGeom;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->mSpacingRects, "anyObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "first"));
  objc_msgSend(v4, "CGRectValue");
  -[CRLSwappableAxesGeometry rectWidth:](mHorizontalGeom, "rectWidth:");
  v6 = v5;

  return v6;
}

- (int64_t)guideType
{
  return -[CRLSwappableAxesGeometry horizontalOrientation](self->mHorizontalGeom, "horizontalOrientation") == 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  int64_t v6;
  int v7;

  v4 = a3;
  v5 = -[CRLCanvasSpacing integerOffset](self, "integerOffset");
  if (v5 <= (int)objc_msgSend(v4, "integerOffset"))
  {
    v7 = -[CRLCanvasSpacing integerOffset](self, "integerOffset");
    if (v7 >= (int)objc_msgSend(v4, "integerOffset"))
      v6 = 0;
    else
      v6 = -1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)addSpacingRect:(double)a3 forFrame:(double)a4 andFrame:(double)a5
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CRLMutablePair *v34;

  v34 = objc_alloc_init(CRLMutablePair);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a2, a3, a4, a5));
  -[CRLMutablePair setFirst:](v34, "setFirst:", v29);

  -[CRLMutablePair setSecond:](v34, "setSecond:", 0);
  objc_msgSend(*(id *)(a1 + 8), "addObject:", v34);
  v30 = *(void **)(a1 + 16);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a6, a7, a8, a9));
  objc_msgSend(v30, "addObject:", v31);

  v32 = *(void **)(a1 + 16);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", a10, a11, a12, a13));
  objc_msgSend(v32, "addObject:", v33);

}

- (BOOL)needsGuideForEdge:(int)a3 ofRect:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  double MinX;
  double v9;
  BOOL (*v10)(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat);
  double MaxX;
  double MinY;
  double MaxY;
  NSMutableSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
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
  CGFloat width;
  CGFloat height;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = 0;
  switch(a3)
  {
    case 0:
      MinX = CGRectGetMinX(a4);
      v9 = MinX - (double)-[CRLCanvasSpacing integerOffset](self, "integerOffset");
      goto LABEL_5;
    case 1:
    case 4:
      return v7;
    case 2:
      MaxX = CGRectGetMaxX(a4);
      v9 = MaxX + (double)-[CRLCanvasSpacing integerOffset](self, "integerOffset");
LABEL_5:
      v10 = sub_1000601E4;
      break;
    case 3:
      MinY = CGRectGetMinY(a4);
      v9 = MinY - (double)-[CRLCanvasSpacing integerOffset](self, "integerOffset");
      goto LABEL_8;
    case 5:
      MaxY = CGRectGetMaxY(a4);
      v9 = MaxY + (double)-[CRLCanvasSpacing integerOffset](self, "integerOffset");
LABEL_8:
      v10 = sub_100060120;
      break;
    default:
      v10 = 0;
      v9 = 0.0;
      break;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->mSpacingRects;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v7 = 0;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "first", *(_QWORD *)&width, *(_QWORD *)&height, (_QWORD)v33));
        objc_msgSend(v19, "CGRectValue");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        -[CRLSwappableAxesGeometry rectMinX:](self->mHorizontalGeom, "rectMinX:", v21, v23, v25, v27);
        if (vabdd_f64(v28, v9) <= 0.01)
        {
          -[CRLSwappableAxesGeometry rectMaxX:](self->mHorizontalGeom, "rectMaxX:", v21, v23, v25, v27);
          if (vabdd_f64(v29, v9) <= 0.01 && !v10(x, y, width, height, v21, v23, v25, v27))
            continue;
        }
        v7 = 1;
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)containsNonIntersectingSpacingRectsWithRect:(CGRect)a3 forEdge:(int)a4
{
  double y;
  double width;
  double height;
  double v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double x;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  x = a3.origin.x;
  y = a3.origin.y;
  width = a3.size.width;
  height = a3.size.height;
  v9 = sub_10005FD50(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->mSpacingRects;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "first"));
        objc_msgSend(v16, "CGRectValue");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v25 = sub_10005FD50(a4, v18, v20, v22, v24);
        v26 = vabdd_f64(v9, v25) >= 1.0 && v9 != v25;
        if (!sub_100060F38(x, y, width, height, v18, v20, v22, v24))
          v13 |= v26;
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (void)needsRedraw
{
  self->mHasBeenDrawn = 0;
}

- (id)spacingRectsRenderableForGuideRect:(CGRect)a3 withICC:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CRLCanvasRenderable *v10;
  CRLCanvasRenderable *mRenderable;
  CRLCanvasRenderable *v12;
  CRLCanvasRenderable *v13;
  NSMutableSet *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CRLCanvasSpacingGuideUILayer *v29;
  CRLCanvasRenderable *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (self->mHasBeenDrawn)
  {
    v10 = 0;
  }
  else
  {
    mRenderable = self->mRenderable;
    if (!mRenderable)
    {
      v12 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
      v13 = self->mRenderable;
      self->mRenderable = v12;

      -[CRLCanvasRenderable setPosition:](self->mRenderable, "setPosition:", CGPointZero.x, CGPointZero.y);
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v14 = self->mSpacingRects;
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "first", (_QWORD)v33));
            objc_msgSend(v20, "CGRectValue");
            v22 = v21;
            v24 = v23;
            v26 = v25;
            v28 = v27;

            if (!sub_100060F38(v22, v24, v26, v28, x, y, width, height))
            {
              v29 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", -[CRLSwappableAxesGeometry horizontalOrientation](self->mHorizontalGeom, "horizontalOrientation"), v9, 1, v22, v24, v26, v28);
              objc_msgSend(v19, "setSecond:", v29);
              v30 = self->mRenderable;
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v29));
              -[CRLCanvasRenderable addSubrenderable:](v30, "addSubrenderable:", v31);

            }
          }
          v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v16);
      }

      mRenderable = self->mRenderable;
    }
    self->mHasBeenDrawn = 1;
    v10 = mRenderable;
  }

  return v10;
}

- (void)updateSpacingUIWithICC:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->mSpacingRects;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "first", (_QWORD)v21));
        objc_msgSend(v11, "CGRectValue");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "second"));
        objc_msgSend(v20, "setFrameFromSpacingRect:icc:", v4, v13, v15, v17, v19);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[CRLCanvasSpacing guideType](self, "guideType"))
    v6 = CFSTR("vertical");
  else
    v6 = CFSTR("horizontal");
  -[CRLCanvasSpacing exactOffset](self, "exactOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: %@ spacing with size %f>"), v5, self, v6, v7));

  return v8;
}

- (NSMutableSet)associatedFrames
{
  return self->mAssociatedFrames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHorizontalGeom, 0);
  objc_storeStrong((id *)&self->mRenderable, 0);
  objc_storeStrong((id *)&self->mAssociatedFrames, 0);
  objc_storeStrong((id *)&self->mSpacingRects, 0);
}

@end
