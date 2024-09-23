@implementation _UIFocusScrollBoundaryMetrics

- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 scrollView:(id)a4
{
  return -[_UIFocusScrollBoundaryMetrics initWithFocusItem:owningEnvironment:scrollableContainer:](self, "initWithFocusItem:owningEnvironment:scrollableContainer:", a3, a4, a4);
}

- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 owningEnvironment:(id)a4 scrollableContainer:(id)a5
{
  id v10;
  id v11;
  id v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v23;
  char CanScrollY;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_UIFocusScrollBoundaryMetrics;
  v13 = -[_UIFocusScrollBoundaryMetrics init](&v31, sel_init);
  if (!v13)
    goto LABEL_12;
  if (v10)
  {
    if (v11)
      goto LABEL_4;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIFocusScrollBoundaryMetrics.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("owningEnvironment"));

    if (v12)
      goto LABEL_5;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIFocusScrollBoundaryMetrics.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scrollableContainer"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("_UIFocusScrollBoundaryMetrics.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusItem"));

  if (!v11)
    goto LABEL_14;
LABEL_4:
  if (!v12)
    goto LABEL_15;
LABEL_5:
  *(_DWORD *)(v13 + 10) = 16843009;
  objc_storeStrong((id *)v13 + 2, a3);
  objc_storeStrong((id *)v13 + 3, a4);
  objc_storeStrong((id *)v13 + 4, a5);
  objc_msgSend(v12, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *((double *)v13 + 11) = _UIFocusItemFrameInCoordinateSpace(v10, v14);
  *((_QWORD *)v13 + 12) = v15;
  *((_QWORD *)v13 + 13) = v16;
  *((_QWORD *)v13 + 14) = v17;

  __asm { FMOV            V2.2D, #0.5 }
  *(float64x2_t *)(v13 + 40) = vaddq_f64(*(float64x2_t *)(v13 + 88), vmulq_f64(*(float64x2_t *)(v13 + 104), _Q2));
  if (objc_msgSend(v12, "__isKindOfUICollectionView"))
  {
    v23 = v12;
    if ((objc_msgSend(v23, "_canDeriveVisibleBoundsFromContainingScrollView") & 1) != 0)
    {
      CanScrollY = 1;
      v13[8] = 1;
    }
    else
    {
      v13[8] = _UIFocusItemScrollableContainerCanScrollX(v23);
      CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v23);
    }
    v13[9] = CanScrollY;

  }
  else
  {
    v13[8] = _UIFocusItemScrollableContainerCanScrollX(v12);
    v13[9] = _UIFocusItemScrollableContainerCanScrollY(v12);
  }
  *((double *)v13 + 7) = _UIFocusItemScrollableContainerMinimumContentOffset(v12);
  *((_QWORD *)v13 + 8) = v25;
  *((double *)v13 + 9) = _UIFocusItemScrollableContainerMaximumContentOffset(v12);
  *((_QWORD *)v13 + 10) = v26;
  objc_msgSend(v13, "_checkScrollableBounds");
LABEL_12:

  return (_UIFocusScrollBoundaryMetrics *)v13;
}

- (BOOL)_checkScrollableBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double x;
  double y;
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
  double v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  double v58;
  double v59;

  -[UIFocusItemScrollableContainer visibleSize](self->_scrollableContainer, "visibleSize");
  v4 = v3;
  v6 = v5;
  x = self->_minContentOffset.x;
  y = self->_minContentOffset.y;
  v9 = self->_maxContentOffset.x;
  v10 = self->_maxContentOffset.y;
  _UIIntervalFromCGRect(1, x, y, v3, v5);
  v58 = v11;
  v13 = v12;
  _UIIntervalFromCGRect(1, v9, v10, v4, v6);
  v59 = v14;
  v16 = v15;
  _UIIntervalFromCGRect(2, x, y, v4, v6);
  v18 = v17;
  v20 = v19;
  _UIIntervalFromCGRect(2, v9, v10, v4, v6);
  v22 = v21;
  v24 = v23;
  _UIIntervalFromCGRect(1, self->_localFocusedRect.origin.x, self->_localFocusedRect.origin.y, self->_localFocusedRect.size.width, self->_localFocusedRect.size.height);
  v26 = v25;
  v28 = v27;
  _UIIntervalFromCGRect(2, self->_localFocusedRect.origin.x, self->_localFocusedRect.origin.y, self->_localFocusedRect.size.width, self->_localFocusedRect.size.height);
  v31 = -0.0;
  if (v13 >= 0.0)
    v32 = -0.0;
  else
    v32 = v13;
  v33 = v58 + v32;
  if (v28 < 0.0)
    v31 = v28;
  v34 = v26 + v31;
  v35 = -v13;
  if (v13 >= 0.0)
    v35 = v13;
  v36 = v35 + v33;
  v37 = -v28;
  if (v28 >= 0.0)
    v38 = v28;
  else
    v38 = -v28;
  v39 = v36 >= v38 + v34;
  if (v33 > v34)
    v39 = 0;
  if (!self->_isMinX)
    v39 = 0;
  self->_isMinX = v39;
  v40 = -0.0;
  if (v16 < 0.0)
    v40 = v16;
  v41 = v59 + v40;
  v42 = -v16;
  if (v16 >= 0.0)
    v42 = v16;
  v43 = v42 + v41;
  if (v28 >= 0.0)
    v37 = v28;
  v44 = v43 >= v37 + v34;
  if (v41 > v34)
    v44 = 0;
  if (!self->_isMaxX)
    v44 = 0;
  self->_isMaxX = v44;
  v45 = -0.0;
  if (v20 >= 0.0)
    v46 = -0.0;
  else
    v46 = v20;
  v47 = v18 + v46;
  if (v30 < 0.0)
    v45 = v30;
  v48 = v29 + v45;
  v49 = -v20;
  if (v20 >= 0.0)
    v49 = v20;
  if (v30 >= 0.0)
    v50 = v30;
  else
    v50 = -v30;
  v51 = v49 + v47 >= v50 + v48;
  if (v47 > v48)
    v51 = 0;
  if (!self->_isMinY)
    v51 = 0;
  self->_isMinY = v51;
  v52 = -0.0;
  if (v24 < 0.0)
    v52 = v24;
  v53 = v22 + v52;
  if (v53 <= v48)
  {
    v55 = -v24;
    if (v24 >= 0.0)
      v55 = v24;
    v56 = v55 + v53;
    if (v30 < 0.0)
      v30 = -v30;
    v54 = v56 >= v30 + v48;
  }
  else
  {
    v54 = 0;
  }
  if (!self->_isMaxY)
    v54 = 0;
  self->_isMaxY = v54;
  return -[_UIFocusScrollBoundaryMetrics hasDisprovedAllRelevantAssumptions](self, "hasDisprovedAllRelevantAssumptions");
}

- (BOOL)consumeOtherMetrics:(id)a3
{
  _UIFocusScrollBoundaryMetrics *v5;
  _UIFocusScrollBoundaryMetrics *v6;
  BOOL v7;
  void *v9;

  v5 = (_UIFocusScrollBoundaryMetrics *)a3;
  v6 = v5;
  if (v5)
  {
    if (v5 != self)
    {
      -[_UIFocusScrollBoundaryMetrics setIsMinX:](self, "setIsMinX:", -[_UIFocusScrollBoundaryMetrics isMinX](v5, "isMinX") & -[_UIFocusScrollBoundaryMetrics isMinX](self, "isMinX"));
      -[_UIFocusScrollBoundaryMetrics setIsMaxX:](self, "setIsMaxX:", -[_UIFocusScrollBoundaryMetrics isMaxX](v6, "isMaxX") & -[_UIFocusScrollBoundaryMetrics isMaxX](self, "isMaxX"));
      -[_UIFocusScrollBoundaryMetrics setIsMinY:](self, "setIsMinY:", -[_UIFocusScrollBoundaryMetrics isMinY](v6, "isMinY") & -[_UIFocusScrollBoundaryMetrics isMinY](self, "isMinY"));
      -[_UIFocusScrollBoundaryMetrics setIsMaxY:](self, "setIsMaxY:", -[_UIFocusScrollBoundaryMetrics isMaxY](v6, "isMaxY") & -[_UIFocusScrollBoundaryMetrics isMaxY](self, "isMaxY"));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusScrollBoundaryMetrics.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherMetrics != nil"));

  }
  v7 = -[_UIFocusScrollBoundaryMetrics hasDisprovedAllRelevantAssumptions](self, "hasDisprovedAllRelevantAssumptions");

  return v7;
}

- (BOOL)checkOtherRect:(CGRect)a3
{
  double v3;
  double v4;
  double x;
  double v6;
  double y;

  v3 = a3.origin.x + a3.size.width * 0.5;
  v4 = a3.size.height * 0.5;
  x = self->_localFocusedCenter.x;
  if (v3 < x)
    self->_isMinX = 0;
  v6 = a3.origin.y + v4;
  if (v3 > x)
    self->_isMaxX = 0;
  y = self->_localFocusedCenter.y;
  if (v6 < y)
    self->_isMinY = 0;
  if (v6 > y)
    self->_isMaxY = 0;
  return -[_UIFocusScrollBoundaryMetrics hasDisprovedAllRelevantAssumptions](self, "hasDisprovedAllRelevantAssumptions");
}

- (BOOL)checkOtherFocusItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusScrollBoundaryMetrics.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherItem != nil"));

    goto LABEL_5;
  }
  -[_UIFocusScrollBoundaryMetrics focusItem](self, "focusItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
LABEL_5:
    v9 = -[_UIFocusScrollBoundaryMetrics hasDisprovedAllRelevantAssumptions](self, "hasDisprovedAllRelevantAssumptions");
    goto LABEL_6;
  }
  -[_UIFocusScrollBoundaryMetrics scrollableContainer](self, "scrollableContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_UIFocusScrollBoundaryMetrics checkOtherRect:](self, "checkOtherRect:", _UIFocusItemFrameInCoordinateSpace(v5, v8));
LABEL_6:

  return v9;
}

- (BOOL)hasDisprovedAllRelevantAssumptions
{
  if (!self->_isMinX && !self->_isMaxX && (!self->_isMinY && !self->_isMaxY || !self->_shouldSearchY))
    return 1;
  if (self->_shouldSearchX || self->_isMinY)
    return 0;
  return !self->_isMaxY;
}

- (UIFocusItem)focusItem
{
  return self->_focusItem;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (BOOL)shouldSearchX
{
  return self->_shouldSearchX;
}

- (BOOL)shouldSearchY
{
  return self->_shouldSearchY;
}

- (CGRect)localFocusedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_localFocusedRect.origin.x;
  y = self->_localFocusedRect.origin.y;
  width = self->_localFocusedRect.size.width;
  height = self->_localFocusedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)localFocusedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_localFocusedCenter.x;
  y = self->_localFocusedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)minContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_minContentOffset.x;
  y = self->_minContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)maxContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_maxContentOffset.x;
  y = self->_maxContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isMinX
{
  return self->_isMinX;
}

- (void)setIsMinX:(BOOL)a3
{
  self->_isMinX = a3;
}

- (BOOL)isMaxX
{
  return self->_isMaxX;
}

- (void)setIsMaxX:(BOOL)a3
{
  self->_isMaxX = a3;
}

- (BOOL)isMinY
{
  return self->_isMinY;
}

- (void)setIsMinY:(BOOL)a3
{
  self->_isMinY = a3;
}

- (BOOL)isMaxY
{
  return self->_isMaxY;
}

- (void)setIsMaxY:(BOOL)a3
{
  self->_isMaxY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
  objc_storeStrong((id *)&self->_focusItem, 0);
}

@end
