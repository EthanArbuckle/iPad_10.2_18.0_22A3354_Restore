@implementation _UITextSelectionRangeAdjustmentContainerView

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v49.receiver = self;
  v49.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  -[UIView layoutSubviews](&v49, sel_layoutSubviews);
  if (self->_selectionGrabbersHidden)
  {
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

LABEL_10:
    -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 1);
    goto LABEL_15;
  }
  -[_UITextSelectionRangeAdjustmentContainerView startEdge](self, "startEdge");
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v52.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v52.origin.y = v5;
  v52.size.width = v6;
  v52.size.height = v7;
  v8 = CGRectEqualToRect(v50, v52);
  -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v9, "setHidden:", 0);

    if (-[_UITextSelectionRangeAdjustmentContainerView isVertical](self, "isVertical"))
      v11 = 1;
    else
      v11 = 2;
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDirection:", v11);

    v47 = 0u;
    v48 = 0u;
    v45 = 0.0;
    v46 = 0.0;
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextSelectionRangeAdjustmentContainerView startEdge](self, "startEdge");
    objc_msgSend(v13, "preferredFrameForRect:");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[_UITextSelectionRangeAdjustmentContainerView _getBounds:position:fromPreferredFrame:](self, "_getBounds:position:fromPreferredFrame:", &v47, &v45, v15, v17, v19, v21);
    v22 = v47;
    v23 = v48;
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBounds:", v22, v23);

    v25 = v45;
    v26 = v46;
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self, "leadingLollipopView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCenter:", v25, v26);
  }

  -[_UITextSelectionRangeAdjustmentContainerView endEdge](self, "endEdge");
  v53.origin.x = v4;
  v53.origin.y = v5;
  v53.size.width = v6;
  v53.size.height = v7;
  if (CGRectEqualToRect(v51, v53))
    goto LABEL_10;
  -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", 0);

  if (-[_UITextSelectionRangeAdjustmentContainerView isVertical](self, "isVertical"))
    v29 = 4;
  else
    v29 = 8;
  -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDirection:", v29);

  v47 = 0u;
  v48 = 0u;
  v45 = 0.0;
  v46 = 0.0;
  -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionRangeAdjustmentContainerView endEdge](self, "endEdge");
  objc_msgSend(v31, "preferredFrameForRect:");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  -[_UITextSelectionRangeAdjustmentContainerView _getBounds:position:fromPreferredFrame:](self, "_getBounds:position:fromPreferredFrame:", &v47, &v45, v33, v35, v37, v39);
  v40 = v47;
  v41 = v48;
  -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBounds:", v40, v41);

  v43 = v45;
  v44 = v46;
  -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self, "trailingLollipopView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCenter:", v43, v44);
LABEL_15:

}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (v3)
    -[_UITextSelectionRangeAdjustmentContainerView _setPortalsLollipopDotsToContainerWindow:](self, "_setPortalsLollipopDotsToContainerWindow:", 0);
}

- (void)_setPortalsLollipopDotsToContainerWindow:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_selectionGrabbersAreConcreteImpl)
  {
    v3 = a3;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_selectionGrabbers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPortalsDotToContainerWindow:", v3, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (UITextSelectionHandleView)trailingLollipopView
{
  return (UITextSelectionHandleView *)-[NSArray objectAtIndexedSubscript:](self->_selectionGrabbers, "objectAtIndexedSubscript:", 1);
}

- (CGRect)startEdge
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startEdge.origin.x;
  y = self->_startEdge.origin.y;
  width = self->_startEdge.size.width;
  height = self->_startEdge.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UITextSelectionHandleView)leadingLollipopView
{
  return (UITextSelectionHandleView *)-[NSArray objectAtIndexedSubscript:](self->_selectionGrabbers, "objectAtIndexedSubscript:", 0);
}

- (CGRect)endEdge
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endEdge.origin.x;
  y = self->_endEdge.origin.y;
  width = self->_endEdge.size.width;
  height = self->_endEdge.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_UITextSelectionRangeAdjustmentContainerView)initWithFrame:(CGRect)a3
{
  _UITextSelectionRangeAdjustmentContainerView *v3;
  _UITextSelectionRangeAdjustmentContainerView *v4;
  _UITextSelectionLollipopView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UITextSelectionLollipopView *v10;
  _UITextSelectionLollipopView *v11;
  uint64_t v12;
  NSArray *selectionGrabbers;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shapeScale = 1.0;
    v3->_selectionGrabbersAreConcreteImpl = 1;
    v5 = [_UITextSelectionLollipopView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[_UITextSelectionLollipopView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    v26[0] = v10;
    v11 = -[_UITextSelectionLollipopView initWithFrame:]([_UITextSelectionLollipopView alloc], "initWithFrame:", v6, v7, v8, v9);
    v26[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    selectionGrabbers = v4->_selectionGrabbers;
    v4->_selectionGrabbers = (NSArray *)v12;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v4->_selectionGrabbers;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          -[UIView addSubview:](v4, "addSubview:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

  }
  return v4;
}

- (void)setSelectionGrabbersHidden:(BOOL)a3
{
  self->_selectionGrabbersHidden = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectionGrabbers:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_selectionGrabbers, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  self->_selectionGrabbersAreConcreteImpl = v11;
}

- (void)setShapeScale:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_shapeScale = a3;
  if (self->_selectionGrabbersAreConcreteImpl)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_selectionGrabbers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setShapeScale:", a3, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)areSelectionGrabbersConcreteImpl
{
  return self->_selectionGrabbersAreConcreteImpl;
}

- (id)textInputView
{
  void *v2;
  void *v3;

  -[UIView nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_getBounds:(CGRect *)a3 position:(CGPoint *)a4 fromPreferredFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  a3->origin = (CGPoint)*MEMORY[0x1E0C9D648];
  a3->size.width = a5.size.width;
  a3->size.height = a5.size.height;
  -[UIView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorPoint");
  v12 = v11;
  v14 = v13;

  a4->x = x + width * v12;
  a4->y = y + height * v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setStartEdge:(CGRect)a3
{
  self->_startEdge = a3;
}

- (void)setEndEdge:(CGRect)a3
{
  self->_endEdge = a3;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (double)shapeScale
{
  return self->_shapeScale;
}

- (BOOL)portalsLollipopDotsToContainerWindow
{
  return self->_portalsLollipopDotsToContainerWindow;
}

- (void)setPortalsLollipopDotsToContainerWindow:(BOOL)a3
{
  self->_portalsLollipopDotsToContainerWindow = a3;
}

- (BOOL)areSelectionGrabbersHidden
{
  return self->_selectionGrabbersHidden;
}

- (NSArray)selectionGrabbers
{
  return self->_selectionGrabbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionGrabbers, 0);
}

@end
