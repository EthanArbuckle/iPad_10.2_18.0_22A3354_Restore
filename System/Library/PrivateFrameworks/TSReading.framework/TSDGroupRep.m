@implementation TSDGroupRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isDraggable
{
  return 1;
}

- (CGRect)clipRect
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSMutableArray *mChildReps;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v31 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  mChildReps = self->super.mChildReps;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(mChildReps);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "clipRect", *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v20 = (void *)objc_msgSend((id)objc_msgSend(v11, "layout"), "geometry");
        if (v20)
          objc_msgSend(v20, "transform");
        else
          memset(&v25, 0, sizeof(v25));
        v32.origin.x = v13;
        v32.origin.y = v15;
        v32.size.width = v17;
        v32.size.height = v19;
        v36 = CGRectApplyAffineTransform(v32, &v25);
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        v34 = CGRectUnion(v33, v36);
        x = v34.origin.x;
        y = v34.origin.y;
        width = v34.size.width;
        height = v34.size.height;
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  TSDLayoutGeometry *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;

  v5 = -[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry");
  if (v5)
    -[TSDLayoutGeometry transform](v5, "transform");
  else
    memset(&v14, 0, sizeof(v14));
  CGContextConcatCTM(a3, &v14);
  -[TSDGroupRep clipRect](self, "clipRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (-[TSDRep masksToBounds](self, "masksToBounds"))
  {
    v15.origin.x = v7;
    v15.origin.y = v9;
    v15.size.width = v11;
    v15.size.height = v13;
    CGContextClipToRect(a3, v15);
    CGContextSaveGState(a3);
  }
  else
  {
    CGContextSaveGState(a3);
    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    CGContextClipToRect(a3, v16);
  }
  -[TSDGroupRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
  CGContextRestoreGState(a3);
  -[TSDRep recursivelyDrawChildrenInContext:](self, "recursivelyDrawChildrenInContext:", a3);
}

- (BOOL)shouldShowSelectionHighlight
{
  BOOL result;
  NSMutableArray *mChildReps;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((TSDGroupRep *)-[TSDInteractiveCanvasController topLevelContainerRepForEditing](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "topLevelContainerRepForEditing") == self)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    mChildReps = self->super.mChildReps;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(mChildReps);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isInDynamicOperation") & 1) != 0)
            return 0;
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        result = 1;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDGroupRep;
    return -[TSDRep shouldShowSelectionHighlight](&v9, sel_shouldShowSelectionHighlight);
  }
  return result;
}

- (CGColor)selectionHighlightColor
{
  objc_super v4;

  if ((TSDGroupRep *)-[TSDInteractiveCanvasController topLevelContainerRepForEditing](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "topLevelContainerRepForEditing") == self)
  {
    if (selectionHighlightColor_sOnce_0 != -1)
      dispatch_once(&selectionHighlightColor_sOnce_0, &__block_literal_global_44);
    return (CGColor *)selectionHighlightColor_sTopLevelContainerSelectionHighlightColor;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDGroupRep;
    return -[TSDRep selectionHighlightColor](&v4, sel_selectionHighlightColor);
  }
}

CGColorRef __38__TSDGroupRep_selectionHighlightColor__block_invoke()
{
  CGColorRef result;

  result = CGColorRetain((CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.85, 0.85, 0.85, 1.0), "CGColor"));
  selectionHighlightColor_sTopLevelContainerSelectionHighlightColor = (uint64_t)result;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[TSDLayout pureGeometryInRoot](-[TSDRep layout](self, "layout"), "pureGeometryInRoot"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldShowCommentHighlight
{
  TSDContainerRep *v3;
  TSDGroupRep *v4;
  objc_super v6;

  v3 = -[TSDInteractiveCanvasController topLevelContainerRepForEditing](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "topLevelContainerRepForEditing");
  if (v3)
  {
    v4 = (TSDGroupRep *)v3;
    while (v4 != self)
    {
      objc_opt_class();
      -[TSDRep parentRep](v4, "parentRep");
      v4 = (TSDGroupRep *)TSUDynamicCast();
      if (!v4)
        goto LABEL_5;
    }
    return 0;
  }
  else
  {
LABEL_5:
    v6.receiver = self;
    v6.super_class = (Class)TSDGroupRep;
    return -[TSDRep shouldShowCommentHighlight](&v6, sel_shouldShowCommentHighlight);
  }
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  TSDLayout *v3;
  float64x2_t v4;
  double v5;
  double y;
  double x;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v3 = -[TSDRep layout](self, "layout");
  if (v3)
    -[TSDAbstractLayout transformInRoot](v3, "transformInRoot");
  else
    memset(&v8, 0, sizeof(v8));
  CGAffineTransformInvert(&v9, &v8);
  v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  uint64_t v14;
  float64x2_t v15;
  double y;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v14 = *(_QWORD *)&a3.x;
  y = a3.y;
  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)-[NSMutableArray reverseObjectEnumerator](self->super.mChildReps, "reverseObjectEnumerator");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v15 = (float64x2_t)vdupq_lane_s64(v14, 0);
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "layout", *(_QWORD *)&v15.f64[0]), "geometry");
        if (v9)
        {
          objc_msgSend(v9, "inverseTransform");
          v10 = v17;
          v11 = v18;
          v12 = v19;
        }
        else
        {
          v18 = 0u;
          v19 = 0u;
          v12 = 0uLL;
          v10 = 0uLL;
          v11 = 0uLL;
          v17 = 0u;
        }
        if ((objc_msgSend(v8, "containsPoint:", vaddq_f64(v12, vmlaq_f64(vmulq_n_f64(v11, y), v15, v10))) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  uint64_t v17;
  float64x2_t v18;
  double y;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  height = a4.height;
  width = a4.width;
  v17 = *(_QWORD *)&a3.x;
  y = a3.y;
  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = (void *)-[NSMutableArray reverseObjectEnumerator](self->super.mChildReps, "reverseObjectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v18 = (float64x2_t)vdupq_lane_s64(v17, 0);
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "layout", *(_QWORD *)&v18.f64[0]), "geometry");
        if (v12)
        {
          objc_msgSend(v12, "inverseTransform");
          v13 = v20;
          v14 = v21;
          v15 = v22;
        }
        else
        {
          v21 = 0u;
          v22 = 0u;
          v15 = 0uLL;
          v13 = 0uLL;
          v14 = 0uLL;
          v20 = 0u;
        }
        if ((objc_msgSend(v11, "containsPoint:withSlop:", vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v14, y), v18, v13)), width, height) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->super.mChildReps, "reverseObjectEnumerator", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "intersectsUnscaledRect:", x, y, width, height) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  return v8;
}

- (void)processChangedProperty:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDGroupRep;
  -[TSDRep processChangedProperty:](&v4, sel_processChangedProperty_, *(_QWORD *)&a3);
  -[TSDCanvas layoutInvalidated](self->super.super.mCanvas, "layoutInvalidated");
}

- (void)setNeedsDisplay
{
  NSMutableArray *mChildReps;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)TSDGroupRep;
  -[TSDRep setNeedsDisplay](&v12, sel_setNeedsDisplay);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mChildReps = self->super.mChildReps;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mChildReps);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setNeedsDisplay");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }
}

- (id)allRepsContainedInGroup
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TSDContainerRep childReps](self, "childReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allRepsContainedInGroup"));
        else
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TSDContainerRep childReps](self, "childReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "wantsToHandleTapsWhenLocked") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x24BDAC8D0];
  -[TSDGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  v6 = -[TSDRep hitReps:withSlop:](self, "hitReps:withSlop:");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (objc_msgSend(v11, "wantsToHandleTapsOnContainingGroup")
          && (objc_msgSend(v11, "handleSingleTapAtPoint:", x, y) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  id v4;
  void *v5;
  TSDCanvasEditor *v6;
  void *v7;
  TSDCanvasEditor *v8;

  -[TSDGroupRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  v4 = -[TSDContainerRep hitRep:](self, "hitRep:");
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText") & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v6 = -[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor");
      objc_opt_class();
      -[TSDRep info](self, "info");
      -[TSDCanvasEditor setSelection:](v6, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:andContainer:](v6, "canvasSelectionWithInfos:andContainer:", 0, TSUDynamicCast()));
      v7 = (void *)objc_msgSend(v5, "repForSelecting");
      v8 = -[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor");
      objc_opt_class();
      objc_msgSend(v7, "info");
      -[TSDCanvasEditor setSelectionToInfo:](v8, "setSelectionToInfo:", TSUDynamicCast());
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  v6 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "count");
  v7 = 0.0;
  if (v6 == objc_msgSend((id)objc_msgSend(v5, "childReps"), "count"))
  {
    v8 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "count");
    if (v8)
    {
      v9 = 0;
      v10 = 0.0;
      while (1)
      {
        v11 = objc_msgSend((id)objc_msgSend(v4, "childReps"), "objectAtIndex:", v9);
        v12 = objc_msgSend((id)objc_msgSend(v5, "childReps"), "objectAtIndex:", v9);
        v13 = (void *)objc_opt_class();
        if (!objc_msgSend(v13, "isEqual:", objc_opt_class()))
          break;
        objc_msgSend((id)objc_opt_class(), "magicMoveAttributeMatchPercentBetweenOutgoingObject:incomingObject:", v11, v12);
        v10 = v10 + v14;
        if (v8 == ++v9)
          return v10 / (double)v8;
      }
    }
    else
    {
      v10 = 0.0;
      return v10 / (double)v8;
    }
  }
  return v7;
}

@end
