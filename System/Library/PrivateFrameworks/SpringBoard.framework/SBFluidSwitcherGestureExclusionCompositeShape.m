@implementation SBFluidSwitcherGestureExclusionCompositeShape

+ (id)exclusionCompositeShapeWithRects:(id)a3 allowHorizontalSwipes:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SBFluidSwitcherGestureExclusionCompositeShape *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(SBFluidSwitcherGestureExclusionCompositeShape);
  -[SBFluidSwitcherGestureExclusionCompositeShape setRects:](v6, "setRects:", v5);

  -[SBFluidSwitcherGestureExclusionCompositeShape setAllowHorizontalSwipesInsideShapes:](v6, "setAllowHorizontalSwipesInsideShapes:", v4);
  return v6;
}

- (id)debugView
{
  _SBFluidSwitcherGestureExclusionCompositeShapeDebugView *v3;
  void *v4;

  v3 = objc_alloc_init(_SBFluidSwitcherGestureExclusionCompositeShapeDebugView);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBFluidSwitcherGestureExclusionCompositeShapeDebugView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[_SBFluidSwitcherGestureExclusionCompositeShapeDebugView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
  -[_SBFluidSwitcherGestureExclusionCompositeShapeDebugView setCompositeShape:](v3, "setCompositeShape:", self);
  return v3;
}

- (BOOL)shouldBeginGestureAtStartingPoint:(CGPoint)a3 velocity:(CGPoint)a4 bounds:(CGRect)a5
{
  double y;
  double x;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  BOOL v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  CGFloat v20;
  CGFloat v21;
  CGFloat width;
  CGFloat height;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x1E0C80C00];
  if (fabs(a4.x) > fabs(a4.y) && self->_allowHorizontalSwipesInsideShapes)
    return 1;
  if (BSFloatEqualToFloat())
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = self->_rects;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "CGRectValue");
          if (v13 < self->_topEdgeY)
            self->_topEdgeY = v13;
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v10);
    }

  }
  if (y < self->_topEdgeY)
    return 1;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_rects;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "CGRectValue", (_QWORD)v25);
        v20 = v36.origin.x;
        v21 = v36.origin.y;
        width = v36.size.width;
        height = v36.size.height;
        if (x > CGRectGetMinX(v36))
        {
          v37.origin.x = v20;
          v37.origin.y = v21;
          v37.size.width = width;
          v37.size.height = height;
          if (x < CGRectGetMaxX(v37))
          {
            v14 = 0;
            goto LABEL_27;
          }
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_27:

  return v14;
}

- (NSArray)rects
{
  return self->_rects;
}

- (void)setRects:(id)a3
{
  objc_storeStrong((id *)&self->_rects, a3);
}

- (BOOL)allowHorizontalSwipesInsideShapes
{
  return self->_allowHorizontalSwipesInsideShapes;
}

- (void)setAllowHorizontalSwipesInsideShapes:(BOOL)a3
{
  self->_allowHorizontalSwipesInsideShapes = a3;
}

- (double)topEdgeY
{
  return self->_topEdgeY;
}

- (void)setTopEdgeY:(double)a3
{
  self->_topEdgeY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rects, 0);
}

@end
