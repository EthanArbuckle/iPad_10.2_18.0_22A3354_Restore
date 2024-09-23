@implementation PUCropOverlayView

- (PUCropOverlayView)initWithFrame:(CGRect)a3
{
  PUCropOverlayView *v3;
  PUCropOverlayView *v4;
  void *v5;
  uint64_t v6;
  PUCropMaskView *topMask;
  uint64_t v8;
  PUCropMaskView *leftMask;
  uint64_t v10;
  PUCropMaskView *rightMask;
  uint64_t v12;
  PUCropMaskView *bottomMask;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PUCropOverlayView;
  v3 = -[PUCropOverlayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUCropOverlayView cropWindowView](v3, "cropWindowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropOverlayView _createMaskView](v4, "_createMaskView");
    v6 = objc_claimAutoreleasedReturnValue();
    topMask = v4->_topMask;
    v4->_topMask = (PUCropMaskView *)v6;

    -[PUCropOverlayView _createMaskView](v4, "_createMaskView");
    v8 = objc_claimAutoreleasedReturnValue();
    leftMask = v4->_leftMask;
    v4->_leftMask = (PUCropMaskView *)v8;

    -[PUCropOverlayView _createMaskView](v4, "_createMaskView");
    v10 = objc_claimAutoreleasedReturnValue();
    rightMask = v4->_rightMask;
    v4->_rightMask = (PUCropMaskView *)v10;

    -[PUCropOverlayView _createMaskView](v4, "_createMaskView");
    v12 = objc_claimAutoreleasedReturnValue();
    bottomMask = v4->_bottomMask;
    v4->_bottomMask = (PUCropMaskView *)v12;

    v27[0] = v4->_topMask;
    v27[1] = v4->_leftMask;
    v27[2] = v4->_rightMask;
    v27[3] = v4->_bottomMask;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCropOverlayView setMaskViews:](v4, "setMaskViews:", v14);

    -[PUCropOverlayView addSubview:](v4, "addSubview:", v5);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PUCropOverlayView maskViews](v4, "maskViews", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[PUCropOverlayView addSubview:](v4, "addSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v17);
    }

    -[PUCropOverlayView setOpaque:](v4, "setOpaque:", 0);
    v4->_maskedContentVisible = 1;

  }
  return v4;
}

- (void)setMaskedContentVisible:(BOOL)a3
{
  -[PUCropOverlayView setMaskedContentVisible:animated:](self, "setMaskedContentVisible:animated:", a3, 0);
}

- (void)setMaskedContentVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_maskedContentVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_maskedContentVisible = a3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PUCropOverlayView maskViews](self, "maskViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      v10 = (double)!v5;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v4)
          {
            v15[0] = v11;
            v15[1] = 3221225472;
            v15[2] = __54__PUCropOverlayView_setMaskedContentVisible_animated___block_invoke;
            v15[3] = &unk_1E58AACF0;
            v15[4] = v13;
            *(double *)&v15[5] = v10;
            objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v15, 0);
          }
          else
          {
            objc_msgSend(v13, "opaqueView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setAlpha:", v10);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_cropRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    p_cropRect->origin.x = x;
    p_cropRect->origin.y = y;
    p_cropRect->size.width = width;
    p_cropRect->size.height = height;
    -[PUCropOverlayView _updateCropRectInLocalCoordinateSpace](self, "_updateCropRectInLocalCoordinateSpace");
    -[PUCropOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateCropRectInLocalCoordinateSpace
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  -[PUCropOverlayView superview](self, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropOverlayView cropRect](self, "cropRect");
  objc_msgSend(v7, "convertRect:toView:", self);
  -[PUCropOverlayView setCropRectInLocalCoordinateSpace:](self, "setCropRectInLocalCoordinateSpace:", PURoundRectToPixel(v3, v4, v5, v6));

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v17;
  double v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v20.receiver = self;
  v20.super_class = (Class)PUCropOverlayView;
  -[PUCropOverlayView layoutSubviews](&v20, sel_layoutSubviews);
  -[PUCropOverlayView cropRectInLocalCoordinateSpace](self, "cropRectInLocalCoordinateSpace");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUCropOverlayView cropWindowView](self, "cropWindowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUCropOverlayView cropWindowView](self, "cropWindowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  MinX = CGRectGetMinX(v21);
  objc_msgSend(v12, "frame");
  MinY = CGRectGetMinY(v22);
  objc_msgSend(v12, "frame");
  MaxX = CGRectGetMaxX(v23);
  objc_msgSend(v12, "frame");
  MaxY = CGRectGetMaxY(v24);
  -[PUCropOverlayView frame](self, "frame");
  -[PUCropMaskView setFrame:](self->_topMask, "setFrame:", 0.0, 0.0);
  -[PUCropOverlayView frame](self, "frame");
  v18 = v17;
  -[PUCropOverlayView bounds](self, "bounds");
  -[PUCropMaskView setFrame:](self->_bottomMask, "setFrame:", 0.0, MaxY, v18, CGRectGetMaxY(v25) - MaxY);
  objc_msgSend(v12, "frame");
  -[PUCropMaskView setFrame:](self->_leftMask, "setFrame:", 0.0, MinY, MinX);
  -[PUCropOverlayView bounds](self, "bounds");
  v19 = CGRectGetMaxX(v26) - MaxX;
  objc_msgSend(v12, "frame");
  -[PUCropMaskView setFrame:](self->_rightMask, "setFrame:", MaxX, MinY, v19);

}

- (void)setCropGridVisible:(BOOL)a3
{
  -[PUCropOverlayView setCropGridVisible:animated:](self, "setCropGridVisible:animated:", a3, 0);
}

- (void)setStraightenGridVisible:(BOOL)a3
{
  -[PUCropOverlayView setStraightenGridVisible:animated:](self, "setStraightenGridVisible:animated:", a3, 0);
}

- (void)setCropGridVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[PUCropOverlayView oneThirdCropLines](self, "oneThirdCropLines");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropOverlayView _setGridViews:visible:iVarVisibilePtr:animated:](self, "_setGridViews:visible:iVarVisibilePtr:animated:", v7, v5, &self->_cropGridVisible, v4);

}

- (void)setStraightenGridVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[PUCropOverlayView oneNinthCropLines](self, "oneNinthCropLines");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropOverlayView _setGridViews:visible:iVarVisibilePtr:animated:](self, "_setGridViews:visible:iVarVisibilePtr:animated:", v7, v5, &self->_straightenGridVisible, v4);

}

- (void)_setGridViews:(id)a3 visible:(BOOL)a4 iVarVisibilePtr:(BOOL *)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  double v19;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (*a5 != v8)
  {
    *a5 = v8;
    if (v8)
      v11 = 1.0;
    else
      v11 = 0.0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __68__PUCropOverlayView__setGridViews_visible_iVarVisibilePtr_animated___block_invoke;
    v17 = &unk_1E58AACF0;
    v18 = v9;
    v19 = v11;
    v12 = _Block_copy(&v14);
    v13 = v12;
    if (v6)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v12, 0, v14, v15, v16, v17);
    else
      (*((void (**)(void *))v12 + 2))(v12);

  }
}

- (UIView)cropWindowView
{
  UIView *cropWindowView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  cropWindowView = self->_cropWindowView;
  if (!cropWindowView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_cropWindowView;
    self->_cropWindowView = v4;

    -[UIView setFrame:](self->_cropWindowView, "setFrame:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    v6 = self->_cropWindowView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    cropWindowView = self->_cropWindowView;
  }
  return cropWindowView;
}

- (NSArray)oneThirdCropLines
{
  NSArray *oneThirdCropLines;
  NSArray *v4;
  NSArray *v5;

  oneThirdCropLines = self->_oneThirdCropLines;
  if (!oneThirdCropLines)
  {
    -[PUCropOverlayView _addLinesSpacedForCount:drawFirstAndLast:visible:](self, "_addLinesSpacedForCount:drawFirstAndLast:visible:", 3, 0, -[PUCropOverlayView isCropGridVisible](self, "isCropGridVisible"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_oneThirdCropLines;
    self->_oneThirdCropLines = v4;

    oneThirdCropLines = self->_oneThirdCropLines;
  }
  return oneThirdCropLines;
}

- (NSArray)oneNinthCropLines
{
  NSArray *oneNinthCropLines;
  NSArray *v4;
  NSArray *v5;

  oneNinthCropLines = self->_oneNinthCropLines;
  if (!oneNinthCropLines)
  {
    -[PUCropOverlayView _addLinesSpacedForCount:drawFirstAndLast:visible:](self, "_addLinesSpacedForCount:drawFirstAndLast:visible:", 9, 0, -[PUCropOverlayView isStraightenGridVisible](self, "isStraightenGridVisible"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_oneNinthCropLines;
    self->_oneNinthCropLines = v4;

    oneNinthCropLines = self->_oneNinthCropLines;
  }
  return oneNinthCropLines;
}

- (unint64_t)_subviewIndexForLineForCount:(unint64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (a3 > 4)
    return 0;
  -[PUCropOverlayView cropWindowView](self, "cropWindowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)_addLinesSpacedForCount:(unint64_t)a3 drawFirstAndLast:(BOOL)a4 visible:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v9;
  void *v10;
  _BOOL8 v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (a4)
    v9 = a3 + 1;
  else
    v9 = a3 - 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[PUCropOverlayView _subviewIndexForLineForCount:](self, "_subviewIndexForLineForCount:", v7);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = objc_msgSend(&unk_1E59B9E98, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v25)
  {
    v11 = !v6;
    v12 = (double)v5;
    v24 = *(_QWORD *)v29;
    v13 = (double)v7;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(&unk_1E59B9E98);
        if (v9)
        {
          v14 = 0;
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          do
          {
            -[PUCropOverlayView _createLineViewForCount:](self, "_createLineViewForCount:", v7, v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUCropOverlayView cropWindowView](self, "cropWindowView");
            v17 = v9;
            v18 = v7;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "insertSubview:atIndex:", v16, v27);

            objc_msgSend(v16, "setAlpha:", v12);
            -[PUCropOverlayView _createConstraintsForLine:centerMultiplier:vertical:](self, "_createConstraintsForLine:centerMultiplier:vertical:", v16, objc_msgSend(v15, "BOOLValue"), (double)(v11 + v14) / v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUCropOverlayView cropWindowView](self, "cropWindowView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addConstraints:", v20);

            objc_msgSend(v10, "addObject:", v16);
            v7 = v18;
            v9 = v17;

            ++v14;
          }
          while (v14 < v17);
        }
      }
      v25 = objc_msgSend(&unk_1E59B9E98, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v25);
  }
  v22 = (void *)objc_msgSend(v10, "copy", v24);

  return v22;
}

- (id)_createConstraintsForLine:(id)a3 centerMultiplier:(double)a4 vertical:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  const __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v33;
  _QWORD v34[2];

  v5 = a5;
  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _NSDictionaryOfVariableBindings(CFSTR("lineView"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  if (v5)
    v12 = CFSTR("V:|[lineView]|");
  else
    v12 = CFSTR("V:[lineView(lineSize)]");
  if (v5)
    v13 = CFSTR("H:[lineView(lineSize)]");
  else
    v13 = CFSTR("H:|[lineView]|");
  v14 = 9;
  if (!v5)
    v14 = 10;
  v15 = 4;
  if (v5)
    v15 = 2;
  v16 = 3;
  if (v5)
    v16 = 1;
  if (a4 == 0.0)
    v14 = v16;
  else
    v16 = v15;
  if (a4 == 1.0)
    v17 = v15;
  else
    v17 = v14;
  if (a4 == 1.0)
    v18 = v15;
  else
    v18 = v16;
  v19 = 1.0 / v11;
  if (a4 == 1.0 || a4 == 0.0)
    v21 = 1.0;
  else
    v21 = v19;

  v33 = CFSTR("lineSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB3718];
  v25 = v13;
  objc_msgSend(v24, "constraintsWithVisualFormat:options:metrics:views:", v12, 0, v23, v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v26);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v25, 0x10000, v23, v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v27);
  v28 = (void *)MEMORY[0x1E0CB3718];
  -[PUCropOverlayView cropWindowView](self, "cropWindowView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, v17, 0, v29, v18, a4, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v30);
  return v9;
}

- (id)_createLineViewForCount:(unint64_t)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v5 = 0.5;
  if (a3 < 5)
    v5 = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v4;
}

- (id)_createMaskView
{
  return objc_alloc_init(PUCropMaskView);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isCropGridVisible
{
  return self->_cropGridVisible;
}

- (BOOL)isStraightenGridVisible
{
  return self->_straightenGridVisible;
}

- (BOOL)isMaskedContentVisible
{
  return self->_maskedContentVisible;
}

- (void)setCropWindowView:(id)a3
{
  objc_storeStrong((id *)&self->_cropWindowView, a3);
}

- (void)setOneThirdCropLines:(id)a3
{
  objc_storeStrong((id *)&self->_oneThirdCropLines, a3);
}

- (void)setOneNinthCropLines:(id)a3
{
  objc_storeStrong((id *)&self->_oneNinthCropLines, a3);
}

- (NSArray)maskViews
{
  return self->_maskViews;
}

- (void)setMaskViews:(id)a3
{
  objc_storeStrong((id *)&self->_maskViews, a3);
}

- (CGRect)cropRectInLocalCoordinateSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRectInLocalCoordinateSpace.origin.x;
  y = self->_cropRectInLocalCoordinateSpace.origin.y;
  width = self->_cropRectInLocalCoordinateSpace.size.width;
  height = self->_cropRectInLocalCoordinateSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRectInLocalCoordinateSpace:(CGRect)a3
{
  self->_cropRectInLocalCoordinateSpace = a3;
}

- (PUCropMaskView)topMask
{
  return self->_topMask;
}

- (void)setTopMask:(id)a3
{
  objc_storeStrong((id *)&self->_topMask, a3);
}

- (PUCropMaskView)bottomMask
{
  return self->_bottomMask;
}

- (void)setBottomMask:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMask, a3);
}

- (PUCropMaskView)leftMask
{
  return self->_leftMask;
}

- (void)setLeftMask:(id)a3
{
  objc_storeStrong((id *)&self->_leftMask, a3);
}

- (PUCropMaskView)rightMask
{
  return self->_rightMask;
}

- (void)setRightMask:(id)a3
{
  objc_storeStrong((id *)&self->_rightMask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightMask, 0);
  objc_storeStrong((id *)&self->_leftMask, 0);
  objc_storeStrong((id *)&self->_bottomMask, 0);
  objc_storeStrong((id *)&self->_topMask, 0);
  objc_storeStrong((id *)&self->_maskViews, 0);
  objc_storeStrong((id *)&self->_oneNinthCropLines, 0);
  objc_storeStrong((id *)&self->_oneThirdCropLines, 0);
  objc_storeStrong((id *)&self->_cropWindowView, 0);
}

void __68__PUCropOverlayView__setGridViews_visible_iVarVisibilePtr_animated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __54__PUCropOverlayView_setMaskedContentVisible_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "opaqueView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

@end
