@implementation PUStackView

- (PUStackView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  void *v5;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUStackView;
  v3 = -[PUStackView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCount:", 9);
    v5 = (void *)*((_QWORD *)v3 + 121);
    *((_QWORD *)v3 + 121) = v4;

    *((_QWORD *)v3 + 117) = 0x3FF0000000000000;
    v3[867] = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v3 + 1048) = _Q0;
    objc_msgSend(v3, "_updateBackgroundView");
    objc_msgSend(v3, "_updateNumberOfViews");
  }
  return (PUStackView *)v3;
}

- (void)layoutSubviews
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  UIImageView *combinedPhotoDecorationImageView;
  _QWORD v9[6];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUStackView;
  -[PUStackView layoutSubviews](&v10, sel_layoutSubviews);
  -[PUStackView _backgroundView](self, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUStackView _getStackFrame](self, "_getStackFrame");
    objc_msgSend(v3, "setFrame:");
  }
  v4 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
  v5 = v4;
  if (self->_needsDynamicLayout)
  {
    self->_needsDynamicLayout = 0;
    if (v4)
      -[PUStackView _updateDynamicLayout](self, "_updateDynamicLayout");
  }
  -[PUStackView _photoViews](self, "_photoViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__PUStackView_layoutSubviews__block_invoke;
  v9[3] = &unk_1E58A8180;
  v9[4] = self;
  v9[5] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (self->_combinedPhotoDecorationImageView)
  {
    -[PUStackView _combinedPhotoDecorationsImage](self, "_combinedPhotoDecorationsImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_combinedPhotoDecorationImageView, "setImage:", v7);
    combinedPhotoDecorationImageView = self->_combinedPhotoDecorationImageView;
    -[PUStackView bounds](self, "bounds");
    -[UIImageView setFrame:](combinedPhotoDecorationImageView, "setFrame:");

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUStackView;
  v4 = a3;
  -[PUStackView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PUStackView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PUStackView _updateBackgroundView](self, "_updateBackgroundView");
    -[PUStackView _updateNumberOfViews](self, "_updateNumberOfViews");
    -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
    -[PUStackView _setNeedsDynamicLayout](self, "_setNeedsDynamicLayout");
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPhotoDecoration:(id)a3
{
  PUPhotoDecoration *v5;
  PUPhotoDecoration *v6;

  v5 = (PUPhotoDecoration *)a3;
  if (self->_photoDecoration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_photoDecoration, a3);
    -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
    -[PUStackView _setNeedsDynamicLayout](self, "_setNeedsDynamicLayout");
    v5 = v6;
  }

}

- (void)setCombinesPhotoDecorations:(BOOL)a3
{
  UIImageView *combinedPhotoDecorationImageView;
  UIImageView *v5;
  UIImageView *v6;
  UIImageView *v7;

  if (self->_combinesPhotoDecorations != a3)
  {
    self->_combinesPhotoDecorations = a3;
    combinedPhotoDecorationImageView = self->_combinedPhotoDecorationImageView;
    if (a3)
    {
      if (!combinedPhotoDecorationImageView)
      {
        v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v6 = self->_combinedPhotoDecorationImageView;
        self->_combinedPhotoDecorationImageView = v5;

        -[PUStackView addSubview:](self, "addSubview:", self->_combinedPhotoDecorationImageView);
      }
    }
    else if (combinedPhotoDecorationImageView)
    {
      -[UIImageView removeFromSuperview](combinedPhotoDecorationImageView, "removeFromSuperview");
      v7 = self->_combinedPhotoDecorationImageView;
      self->_combinedPhotoDecorationImageView = 0;

    }
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStackSize:(CGSize)a3
{
  if (a3.width != self->_stackSize.width || a3.height != self->_stackSize.height)
  {
    self->_stackSize = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStackPerspectiveInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_stackPerspectiveInsets.left
    || a3.top != self->_stackPerspectiveInsets.top
    || a3.right != self->_stackPerspectiveInsets.right
    || a3.bottom != self->_stackPerspectiveInsets.bottom)
  {
    self->_stackPerspectiveInsets = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStackOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_stackOffset.horizontal || a3.vertical != self->_stackOffset.vertical)
  {
    self->_stackOffset = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStackPerspectiveOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_stackPerspectiveOffset.horizontal
    || a3.vertical != self->_stackPerspectiveOffset.vertical)
  {
    self->_stackPerspectiveOffset = a3;
    -[PUStackView _setNeedsDynamicLayout](self, "_setNeedsDynamicLayout");
  }
}

- (void)setStackPerspectiveFactor:(CGPoint)a3
{
  double v3;
  double v4;

  v3 = fmax(a3.x, 0.0);
  if (v3 > 1.0)
    v3 = 1.0;
  v4 = fmax(a3.y, 0.0);
  if (v4 > 1.0)
    v4 = 1.0;
  if (v3 != self->_stackPerspectiveFactor.x || v4 != self->_stackPerspectiveFactor.y)
  {
    self->_stackPerspectiveFactor.x = v3;
    self->_stackPerspectiveFactor.y = v4;
    -[PUStackView _setNeedsDynamicLayout](self, "_setNeedsDynamicLayout");
  }
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
  }
}

- (void)setPosterSquareCornerRadius:(double)a3
{
  if (self->_posterSquareCornerRadius != a3)
  {
    self->_posterSquareCornerRadius = a3;
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
  }
}

- (void)setPosterSubitemCornerRadius:(double)a3
{
  if (self->_posterSubitemCornerRadius != a3)
  {
    self->_posterSubitemCornerRadius = a3;
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
  }
}

- (void)setGridBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_gridBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gridBackgroundColor, a3);
    if (self->_style == 3)
      -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
    else
      -[PUStackView _updateBackgroundView](self, "_updateBackgroundView");
    v5 = v6;
  }

}

- (void)setGridMargin:(double)a3
{
  if (self->_gridMargin != a3)
  {
    self->_gridMargin = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGridItemSpacing:(double)a3
{
  if (self->_gridItemSpacing != a3)
  {
    self->_gridItemSpacing = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfVisibleItems:(int64_t)a3
{
  if (self->_numberOfVisibleItems != a3)
  {
    self->_numberOfVisibleItems = a3;
    -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
    -[PUStackView _setNeedsDynamicLayout](self, "_setNeedsDynamicLayout");
  }
}

- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4
{
  double height;
  double width;
  id v8;

  height = a3.height;
  width = a3.width;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _imageSizes](self, "_imageSizes");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replacePointerAtIndex:withPointer:", a4, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height));
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;

  v9 = (UIImage *)a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPhotoImage:", v9);
    objc_msgSend(v8, "setFillMode:", self->_emptyPlaceholderImage != v9);

  }
}

- (void)setItemAlpha:(double)a3
{
  if (self->_itemAlpha != a3)
  {
    self->_itemAlpha = a3;
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
  }
}

- (BOOL)isImageHiddenForItemAtIndex:(int64_t)a3
{
  return a3 > 8 || self->_imageHidden[a3];
}

- (void)setImageHidden:(BOOL)a3 forItemAtIndex:(int64_t)a4
{
  if (a4 <= 8 && self->_imageHidden[a4] != a3)
  {
    self->_imageHidden[a4] = a3;
    -[PUStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 forItemAtIndex:(int64_t)a4
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *(_OWORD *)&a3->count;
  v5[0] = *(_OWORD *)&a3->badges;
  v5[1] = v4;
  -[PUStackView setBadgeInfo:style:forItemAtIndex:](self, "setBadgeInfo:style:forItemAtIndex:", v5, 1, a4);
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3 style:(int64_t)a4 forItemAtIndex:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  _OWORD v12[2];

  -[PUStackView _photoViews](self, "_photoViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "contentHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a3->count;
  v12[0] = *(_OWORD *)&a3->badges;
  v12[1] = v11;
  objc_msgSend(v10, "setBadgeInfo:", v12);
  objc_msgSend(v10, "setBadgeStyle:", a4);

}

- (double)cornerRadius
{
  double result;

  if (!-[PUStackView hasRoundedCorners](self, "hasRoundedCorners"))
    return 0.0;
  if (-[PUStackView style](self, "style") == 3)
    -[PUStackView posterSubitemCornerRadius](self, "posterSubitemCornerRadius");
  else
    -[PUStackView posterSquareCornerRadius](self, "posterSquareCornerRadius");
  return result;
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  -[PUStackView setHasRoundedCorners:withCornersBackgroundColor:](self, "setHasRoundedCorners:withCornersBackgroundColor:", a3, 0);
}

- (void)setHasRoundedCorners:(BOOL)a3 withCornersBackgroundColor:(id)a4
{
  _BOOL4 v5;
  UIColor *v7;
  UIColor *v8;

  v5 = a3;
  v7 = (UIColor *)a4;
  if (self->_hasRoundedCorners != v5 || self->_cornersBackgroundColor != v7)
  {
    self->_hasRoundedCorners = v5;
    v8 = v7;
    objc_storeStrong((id *)&self->_cornersBackgroundColor, a4);
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
    v7 = v8;
  }

}

- (void)setCornerOverlaysDisabled:(BOOL)a3
{
  if (self->_cornerOverlaysDisabled != a3)
  {
    self->_cornerOverlaysDisabled = a3;
    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PUStackView _updateHighlight](self, "_updateHighlight");
  }
}

- (CGRect)rectOfStackItemAtIndex:(int64_t)a3 inCoordinateSpace:(id)a4
{
  id v6;
  void *v7;
  void *v8;
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
  CGRect result;

  v6 = a4;
  -[PUStackView _photoViews](self, "_photoViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= (unint64_t)a3)
  {
    v10 = *MEMORY[0x1E0C9D628];
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "convertRect:toCoordinateSpace:", v6);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)topLeftCornerOfFrontStackItem
{
  double v3;
  double v4;
  id v5;
  CGFloat x;
  CGFloat y;
  CGPoint result;
  CGRect v9;
  CGRect v10;

  if (-[PUStackView style](self, "style") == 4)
  {
    -[PUStackView _getStackFrame](self, "_getStackFrame");
  }
  else
  {
    v5 = -[PUStackView newLayoutAttributesForItemAtIndex:relativeToView:](self, "newLayoutAttributesForItemAtIndex:relativeToView:", 0, self);
    objc_msgSend(v5, "frame");
    v10 = CGRectIntegral(v9);
    x = v10.origin.x;
    y = v10.origin.y;

    v3 = x;
    v4 = y;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSArray)stackItemViews
{
  return self->__photoViews;
}

- (BOOL)wouldCoverAllItemsInStackView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  v34 = v4;
  objc_msgSend(v4, "_photoViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PUStackView _photoViews](self, "_photoViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(v7, "copy");
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v12, "frame");
              v21 = v20;
              v23 = v22;
              v25 = v24;
              v27 = v26;
              objc_msgSend(v19, "frame");
              v48.origin.x = v28;
              v48.origin.y = v29;
              v48.size.width = v30;
              v48.size.height = v31;
              v47.origin.x = v21;
              v47.origin.y = v23;
              v47.size.width = v25;
              v47.size.height = v27;
              if (CGRectContainsRect(v47, v48))
                objc_msgSend(v7, "removeObject:", v19);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v16);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v9);
  }

  v32 = objc_msgSend(v7, "count") == 0;
  return v32;
}

- (void)setEmptyPlaceholderImage:(id)a3
{
  UIImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  UIImage *v16;

  v5 = (UIImage *)a3;
  if (self->_emptyPlaceholderImage != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_emptyPlaceholderImage, a3);
    -[UIImage size](v16, "size");
    v7 = v6;
    v9 = v8;
    v10 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
    if (v10 >= 1)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        -[PUStackView setImage:forItemAtIndex:](self, "setImage:forItemAtIndex:", v16, i);
        -[PUStackView setImageSize:forItemAtIndex:](self, "setImageSize:forItemAtIndex:", i, v7, v9);
        -[PUStackView _photoViews](self, "_photoViews");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "contentHelper");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFillMode:", 0);

      }
    }
    -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
    v5 = v16;
  }

}

- (void)setEmpty:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  if (self->_empty != a3)
  {
    self->_empty = a3;
    if (a3)
    {
      v4 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
      if (v4 >= 1)
      {
        v5 = v4;
        for (i = 0; i != v5; ++i)
          -[PUStackView setImage:forItemAtIndex:](self, "setImage:forItemAtIndex:", 0, i);
      }
      -[PUStackView _rebuildDecorationVariants](self, "_rebuildDecorationVariants");
    }
  }
}

- (id)newLayoutAttributesForItemAtIndex:(int64_t)a3 relativeToView:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGAffineTransform *v15;
  __int128 v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;

  v6 = (void *)MEMORY[0x1E0DC3628];
  v7 = (void *)MEMORY[0x1E0CB36B0];
  v8 = a4;
  objc_msgSend(v7, "indexPathForItem:inSection:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutAttributesForCellWithIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0.0;
  v22 = 0.0;
  v19 = 0u;
  v20 = 0u;
  -[PUStackView _getCenter:bounds:forPhotoViewAtIndex:](self, "_getCenter:bounds:forPhotoViewAtIndex:", &v21, &v19, a3);
  -[PUStackView convertPoint:toView:](self, "convertPoint:toView:", v8, v21, v22);
  v12 = v11;
  v14 = v13;

  v21 = v12;
  v22 = v14;
  objc_msgSend(v10, "setCenter:", v12, v14);
  objc_msgSend(v10, "setSize:", v20);
  v15 = &self->_transforms[a3];
  v16 = *(_OWORD *)&v15->c;
  v18[0] = *(_OWORD *)&v15->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&v15->tx;
  objc_msgSend(v10, "setTransform:", v18);
  objc_msgSend(v10, "setZIndex:", -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems") + ~a3);
  return v10;
}

- (id)newLayoutAttributesForVisbleItemsRelativeToView:(id)a3 maxCount:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  uint64_t i;
  id v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
  if (v8 >= a4)
    v9 = a4;
  else
    v9 = v8;
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      v11 = -[PUStackView newLayoutAttributesForItemAtIndex:relativeToView:](self, "newLayoutAttributesForItemAtIndex:relativeToView:", i, v6);
      objc_msgSend(v7, "addObject:", v11);

    }
  }

  return v7;
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;

  v3 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = 0;
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      -[PUStackView emptyPlaceholderImage](self, "emptyPlaceholderImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUStackView setImage:forItemAtIndex:](self, "setImage:forItemAtIndex:", v8, v5);

      -[PUStackView setImageSize:forItemAtIndex:](self, "setImageSize:forItemAtIndex:", v5, v6, v7);
      -[PUStackView setFeatureSpec:forItemAtIndex:](self, "setFeatureSpec:forItemAtIndex:", 0, v5);
      -[PUStackView setCollectionTileLayoutTemplate:forItemAtIndex:](self, "setCollectionTileLayoutTemplate:forItemAtIndex:", 0, v5);
      -[PUStackView setTitleFontName:forItemAtIndex:](self, "setTitleFontName:forItemAtIndex:", 0, v5);
      -[PUStackView setTitle:forItemAtIndex:](self, "setTitle:forItemAtIndex:", 0, v5);
      -[PUStackView setSubtitle:forItemAtIndex:](self, "setSubtitle:forItemAtIndex:", 0, v5++);
    }
    while (v4 != v5);
  }
}

- (void)_updateNumberOfViews
{
  uint64_t v3;
  int64_t v4;
  NSArray *v5;
  int64_t numberOfViews;
  int64_t v7;
  PUPhotoView *v8;
  PUPhotoView *v9;
  void *v10;
  void *v11;
  CGAffineTransform *v12;
  NSArray *photoViews;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfVisibleItemsForStyle:", -[PUStackView style](self, "style"));
  if (v3 != self->__numberOfViews)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->__photoViews);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    numberOfViews = self->__numberOfViews;
    if (numberOfViews < v4)
    {
      v7 = numberOfViews;
      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v16 = *MEMORY[0x1E0C9BAA8];
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      do
      {
        v8 = [PUPhotoView alloc];
        -[PUStackView bounds](self, "bounds");
        v9 = -[PUPhotoView initWithFrame:](v8, "initWithFrame:");
        -[PUPhotoView layer](v9, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

        -[PUPhotoView contentHelper](v9, "contentHelper");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFillMode:", 1);

        -[PUStackView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);
        -[NSArray addObject:](v5, "addObject:", v9);
        v12 = &self->_transforms[v7];
        *(_OWORD *)&v12->a = v16;
        *(_OWORD *)&v12->c = v15;
        *(_OWORD *)&v12->tx = v14;
        self->_imageHidden[numberOfViews] = 0;

        ++numberOfViews;
        ++v7;
      }
      while (v4 != numberOfViews);
    }
    self->__numberOfViews = v4;
    photoViews = self->__photoViews;
    self->__photoViews = v5;

    -[PUStackView _updatePhotoViews](self, "_updatePhotoViews");
    -[PUStackView _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
  }
}

- (void)_updateBackgroundView
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = -[PUStackView style](self, "style");
  -[PUStackView _backgroundView](self, "_backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 4)
  {
    v7 = v4;
    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PUStackView bounds](self, "bounds");
      v7 = (id)objc_msgSend(v5, "initWithFrame:");
      -[PUStackView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
      -[PUStackView _setBackgroundView:](self, "_setBackgroundView:", v7);
      -[PUStackView _updateSubviewsOrdering](self, "_updateSubviewsOrdering");
    }
    -[PUStackView gridBackgroundColor](self, "gridBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
  else
  {
    if (!v4)
      return;
    v7 = v4;
    objc_msgSend(v4, "removeFromSuperview");
    -[PUStackView _setBackgroundView:](self, "_setBackgroundView:", 0);
  }

}

- (void)_updateHighlight
{
  _BOOL4 v3;
  unint64_t v4;
  unsigned int v5;
  char v6;
  id v7;
  _QWORD v8[4];
  char v9;

  v3 = -[PUStackView isHighlighted](self, "isHighlighted");
  v4 = -[PUStackView style](self, "style");
  v5 = (0x68u >> v4) & 1;
  if (v4 > 6)
    LOBYTE(v5) = 0;
  if (v3)
    v6 = v5;
  else
    v6 = 0;
  -[PUStackView _photoViews](self, "_photoViews");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__PUStackView__updateHighlight__block_invoke;
  v8[3] = &__block_descriptor_33_e28_v32__0__PUPhotoView_8Q16_B24l;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)_updateSubviewsOrdering
{
  void *v3;
  void *v4;

  -[PUStackView _backgroundView](self, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PUStackView sendSubviewToBack:](self, "sendSubviewToBack:", v3);
    v3 = v4;
  }

}

- (void)_updatePhotoViews
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;

  if (-[PUStackView style](self, "style") == 5
    || -[PUStackView style](self, "style") == 3
    || !-[PUStackView style](self, "style"))
  {
    -[PUStackView gridBackgroundColor](self, "gridBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PUStackView cornerRadius](self, "cornerRadius");
  v6 = v5;
  -[PUStackView cornersBackgroundColor](self, "cornersBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUStackView itemAlpha](self, "itemAlpha");
  v9 = v8;
  v10 = -[PUStackView combinesPhotoDecorations](self, "combinesPhotoDecorations");
  v11 = -[PUStackView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0;
  -[PUStackView _photoViews](self, "_photoViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __32__PUStackView__updatePhotoViews__block_invoke;
  v15[3] = &unk_1E58A81C8;
  v21 = v11;
  v22 = v10;
  v15[4] = self;
  v16 = v7;
  v17 = v4;
  v18 = a2;
  v19 = v6;
  v20 = v9;
  v13 = v4;
  v14 = v7;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

}

- (void)_rebuildDecorationVariants
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUStackView photoDecoration](self, "photoDecoration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
  if (-[PUStackView style](self, "style") == 4 || -[PUStackView style](self, "style") == 3)
  {
    v4 = 0;
  }
  else
  {
    -[PUStackView emptyPlaceholderImage](self, "emptyPlaceholderImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v11, "photoDecorationVariantsWithIncreasingBorderBrightness:", v3);
    else
      objc_msgSend(v11, "photoDecorationVariantsWithIncreasingAlpha:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUStackView _setPhotoDecorationVariants:](self, "_setPhotoDecorationVariants:", v4);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if (v4)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      -[PUStackView _photoViews](self, "_photoViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "contentHelper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPhotoDecoration:", v7);

    }
  }

}

- (CGRect)_getStackFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[PUStackView stackOffset](self, "stackOffset");
  v4 = v3;
  v6 = v5;
  -[PUStackView bounds](self, "bounds");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v11 = v4 + CGRectGetMidX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = v6 + CGRectGetMidY(v20);
  -[PUStackView stackSize](self, "stackSize");
  if (v13 >= width)
    v15 = width;
  else
    v15 = v13;
  if (v14 >= height)
    v16 = height;
  else
    v16 = v14;
  v17 = v11 - v15 * 0.5;
  v18 = v12 - v16 * 0.5;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_getCenter:(CGPoint *)a3 bounds:(CGRect *)a4 forPhotoViewAtIndex:(int64_t)a5
{
  double v10;
  double v11;
  double v12;
  double y;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double *v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  int64_t v36;
  int64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat width;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  CGFloat MinX;
  double v71;
  CGFloat v72;
  void *v73;
  CGFloat height;
  double v75;
  double v76;
  CGFloat rect;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  -[PUStackView _getStackFrame](self, "_getStackFrame");
  v11 = v10;
  y = v12;
  v15 = v14;
  v17 = v16;
  -[PUStackView stackPerspectiveInsets](self, "stackPerspectiveInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = -[PUStackView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v27 = -[PUStackView style](self, "style");
  switch(v27)
  {
    case 1uLL:
      -[PUStackView _imageSizes](self, "_imageSizes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pointerAtIndex:", a5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "CGSizeValue");
      v11 = PURectWithSizeThatFitsInRect(v40, v41, v11, y, v15, v17);
      y = v42;
      v15 = v43;
      v17 = v44;

      goto LABEL_16;
    case 2uLL:
      v11 = PURectWithSizeThatFitsInRect(1.0, 0.850000024, v11, y, v15, v17);
      y = v45;
      v15 = v46;
      v17 = v47;
      goto LABEL_16;
    case 3uLL:
    case 4uLL:
      v28 = v27;
      v29 = (double *)MEMORY[0x1E0DC49E8];
      -[PUStackView gridMargin](self, "gridMargin");
      v31 = v30;
      -[PUStackView gridItemSpacing](self, "gridItemSpacing");
      v33 = v32;
      v78.origin.x = v11;
      v78.origin.y = y;
      v78.size.width = v15;
      v78.size.height = v17;
      v79 = CGRectInset(v78, v31, v31);
      v34 = 2;
      if (v28 != 3)
        v34 = 3;
      v35 = v33 * (double)(v34 - 1);
      v15 = (v79.size.width - v35) / (double)v34;
      v17 = (v79.size.height - v35) / (double)v34;
      v36 = a5 / v34;
      v37 = a5 % v34;
      if (v26)
        v11 = CGRectGetMaxX(v79) - v15 * (double)(v37 + 1) - v33 * (double)v37;
      else
        v11 = (v33 + v15) * (double)v37 + CGRectGetMinX(v79);
      v23 = v29[2];
      v25 = v29[3];
      v58 = v33 + v17;
      v21 = v29[1];
      y = v31 + (double)v36 * v58;
      v19 = *v29;
      goto LABEL_16;
    case 6uLL:
      v48 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
      if (v48 < objc_msgSend((id)objc_opt_class(), "maximumNumberOfVisibleItemsForStyle:", 6))
        goto LABEL_16;
      v75 = v19;
      v76 = v21;
      -[PUStackView gridMargin](self, "gridMargin");
      v50 = v49;
      -[PUStackView gridItemSpacing](self, "gridItemSpacing");
      v52 = v51;
      v80.origin.x = v11;
      v80.origin.y = y;
      v80.size.width = v15;
      v80.size.height = v17;
      v81 = CGRectInset(v80, v50, v50);
      y = v81.origin.y;
      width = v81.size.width;
      v17 = (v81.size.height - v52) * 0.5;
      v15 = (v81.size.width - v52) / 3.0;
      rect = v81.origin.x;
      height = v81.size.height;
      v11 = CGRectGetMaxX(v81) - v15;
      if (a5 == 2)
      {
        v21 = v76;
        v65 = rect;
        v66 = height;
        if (v26)
        {
          v67 = rect;
          v68 = y;
          v69 = width;
          MinX = CGRectGetMinX(*(CGRect *)(&v66 - 3));
          v66 = height;
          v11 = MinX;
          v65 = rect;
        }
        v71 = y;
        v72 = width;
        y = CGRectGetMaxY(*(CGRect *)&v65) - v17;
      }
      else
      {
        v21 = v76;
        if (a5 == 1)
        {
          if (!v26)
            goto LABEL_27;
          v82.origin.x = rect;
          v82.origin.y = y;
          v82.size.width = width;
          v82.size.height = height;
          v54 = CGRectGetMinX(v82);
        }
        else
        {
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUStackView.m"), 730, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
          v15 = v15 + v15;
          v17 = height;
          v54 = rect;
          if (v26)
          {
            v55 = y;
            v56 = width;
            v57 = height;
            v11 = CGRectGetMaxX(*(CGRect *)&v54) - v15;
            goto LABEL_27;
          }
        }
        v11 = v54;
      }
LABEL_27:
      v19 = v75;
LABEL_16:
      PURoundRectToPixel(v11 + v21 * (double)a5, y + v19 * (double)a5, v15 - (v21 * (double)a5 + v25 * (double)a5), v17 - (v19 * (double)a5 + v23 * (double)a5));
      v60 = v59;
      v62 = v61;
      if (a3)
      {
        UIRectGetCenter();
        a3->x = v63;
        a3->y = v64;
      }
      if (a4)
      {
        a4->origin.x = 0.0;
        a4->origin.y = 0.0;
        a4->size.width = v60;
        a4->size.height = v62;
      }
      return;
    default:
      goto LABEL_16;
  }
}

- (id)_combinedPhotoDecorationsImage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  CGContext *CurrentContext;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int *v26;
  PUStackView *v27;
  _OWORD *v28;
  __int128 v29;
  CGFloat x;
  CGFloat y;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double width;
  double height;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  CGColor *v58;
  double v59;
  id v60;
  CGColor *v61;
  double v62;
  CGFloat v63;
  void *v64;
  void *v65;
  double v67;
  uint64_t v68;
  int64_t v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[2];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;
  CGSize v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  v84 = *MEMORY[0x1E0C80C00];
  if (_combinedPhotoDecorationsImage_onceToken[0] != -1)
    dispatch_once(_combinedPhotoDecorationsImage_onceToken, &__block_literal_global_89449);
  -[PUStackView _photoDecorationVariants](self, "_photoDecorationVariants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v80;
    v7 = 1319;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v80 != v6)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "hash") ^ (1319 * v7);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1319;
  }
  v9 = (void *)_combinedPhotoDecorationsImage__imageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && v3)
  {
    -[PUStackView bounds](self, "bounds");
    v72 = v13;
    v73 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = v19;

    v70 = v17;
    v71 = v15;
    v85.width = v15;
    v85.height = v17;
    UIGraphicsBeginImageContextWithOptions(v85, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(CurrentContext, 0);
    v22 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
    v23 = -[PUStackView _numberOfViews](self, "_numberOfViews");
    if (v23 >= 1)
    {
      v24 = v23;
      v25 = 0;
      v26 = &OBJC_IVAR___PUScrubberView__currentDragBeganOnContent;
      v27 = self;
      v67 = 1.0 / v20;
      v68 = v23;
      v69 = v22;
      do
      {
        v78[0] = 0;
        v78[1] = 0;
        v76 = 0u;
        v77 = 0u;
        -[PUStackView _getCenter:bounds:forPhotoViewAtIndex:](self, "_getCenter:bounds:forPhotoViewAtIndex:", v78, &v76, v25);
        v28 = (_OWORD *)((char *)v27 + v26[305]);
        v29 = v28[1];
        *(_OWORD *)&v75.a = *v28;
        *(_OWORD *)&v75.c = v29;
        *(_OWORD *)&v75.tx = v28[2];
        UIRectCenteredAboutPoint();
        v74 = v75;
        v87 = CGRectApplyAffineTransform(v86, &v74);
        if (v25 < v22)
        {
          x = v87.origin.x;
          y = v87.origin.y;
          if (!-[PUStackView isImageHiddenForItemAtIndex:](self, "isImageHiddenForItemAtIndex:", v25))
          {
            -[PUStackView _photoViews](self, "_photoViews");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectAtIndex:", v25);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "contentHelper");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "imageContentFrameForBounds:", v76, v77);
            v36 = v35;
            v38 = v37;
            v40 = v39;
            v42 = v41;

            v88.origin.x = v36;
            v88.origin.y = v38;
            v88.size.width = v40;
            v88.size.height = v42;
            v89 = CGRectOffset(v88, x, y);
            v43 = v89.origin.x;
            v44 = v89.origin.y;
            width = v89.size.width;
            height = v89.size.height;
            objc_msgSend(v33, "contentHelper");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "photoDecorationBorderViewFrameForImageContentFrame:", v43, v44, width, height);
            v49 = v48;
            v51 = v50;
            v53 = v52;
            v55 = v54;

            objc_msgSend(v3, "objectAtIndex:", v25);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "foregroundColor");
            v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v58 = (CGColor *)objc_msgSend(v57, "CGColor");

            if (v58 && CGColorGetAlpha(v58) > 0.0)
            {
              CGContextSetFillColorWithColor(CurrentContext, v58);
              v90.origin.x = v43;
              v90.origin.y = v44;
              v90.size.width = width;
              v90.size.height = height;
              CGContextFillRect(CurrentContext, v90);
            }
            v59 = v53 - v67;
            objc_msgSend(v56, "borderColor");
            v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v61 = (CGColor *)objc_msgSend(v60, "CGColor");

            if (v61 && CGColorGetAlpha(v61) > 0.0)
            {
              objc_msgSend(v56, "borderWidth");
              v63 = v62;
              CGContextSetStrokeColorWithColor(CurrentContext, v61);
              CGContextSetLineWidth(CurrentContext, v63);
              v91.origin.x = v49;
              v91.origin.y = v67 + v51;
              v91.size.width = v59;
              v91.size.height = v55 - v67;
              CGContextStrokeRect(CurrentContext, v91);
            }
            v92.origin.y = v72;
            v92.origin.x = v73;
            v92.size.height = v70;
            v92.size.width = v71;
            CGContextAddRect(CurrentContext, v92);
            v93.origin.x = v49;
            v93.origin.y = v67 + v51;
            v93.size.width = v59;
            v93.size.height = v55 - v67;
            CGContextAddRect(CurrentContext, v93);
            CGContextEOClip(CurrentContext);

            v24 = v68;
            v22 = v69;
            v26 = &OBJC_IVAR___PUScrubberView__currentDragBeganOnContent;
          }
        }
        ++v25;
        v27 = (PUStackView *)((char *)v27 + 48);
      }
      while (v24 != v25);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v64 = (void *)_combinedPhotoDecorationsImage__imageCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKey:", v11, v65);

  }
  return v11;
}

- (void)_setNeedsDynamicLayout
{
  self->_needsDynamicLayout = 1;
  -[PUStackView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDynamicLayout
{
  uint64_t v3;
  CGAffineTransform *transforms;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
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
  uint64_t v19;
  CGAffineTransform *v20;
  __int128 v21;
  CGAffineTransform v22;

  v3 = -[PUStackView numberOfVisibleItems](self, "numberOfVisibleItems");
  if (-[PUStackView style](self, "style") == 4 || -[PUStackView style](self, "style") == 3)
  {
    if (v3 >= 1)
    {
      transforms = self->_transforms;
      v5 = *MEMORY[0x1E0C9BAA8];
      v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      do
      {
        *(_OWORD *)&transforms->a = v5;
        *(_OWORD *)&transforms->c = v6;
        *(_OWORD *)&transforms->tx = v7;
        ++transforms;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    -[PUStackView stackPerspectiveOffset](self, "stackPerspectiveOffset");
    v9 = v8;
    v11 = v10;
    -[PUStackView stackPerspectiveFactor](self, "stackPerspectiveFactor");
    if (v12 >= 0.0)
    {
      v14 = v13;
      if (v13 >= 0.0)
      {
        v15 = v12;
        -[PUStackView stackPerspectiveInsets](self, "stackPerspectiveInsets");
        v17 = -v16;
        v18 = 0.0;
        if (v14 > 0.25)
        {
          v18 = 1.0;
          if (v14 < 1.0)
            v18 = (v14 + -0.25) / 0.75;
        }
        v9 = v9 * v15 + (1.0 - v15) * v9;
        v11 = v11 * v18 + (1.0 - v18) * v17;
      }
    }
    if (v3 >= 1)
    {
      v19 = 0;
      v20 = self->_transforms;
      do
      {
        memset(&v22, 0, sizeof(v22));
        CGAffineTransformMakeTranslation(&v22, v9 * (double)v19, v11 * (double)v19);
        v21 = *(_OWORD *)&v22.c;
        *(_OWORD *)&v20->a = *(_OWORD *)&v22.a;
        *(_OWORD *)&v20->c = v21;
        *(_OWORD *)&v20->tx = *(_OWORD *)&v22.tx;
        ++v19;
        ++v20;
      }
      while (v3 != v19);
    }
  }
}

- (void)setFeatureSpec:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFeatureSpec:", v9);

  }
}

- (void)setCollectionTileLayoutTemplate:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCollectionTileLayoutTemplate:", v9);

  }
}

- (void)setTitleFontName:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleFontName:", v9);

  }
}

- (void)setTitle:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

  }
}

- (void)setSubtitle:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUStackView _numberOfViews](self, "_numberOfViews") > a4)
  {
    -[PUStackView _photoViews](self, "_photoViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubtitle:", v9);

  }
}

- (unint64_t)style
{
  return self->_style;
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (BOOL)combinesPhotoDecorations
{
  return self->_combinesPhotoDecorations;
}

- (CGSize)stackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_stackSize.width;
  height = self->_stackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIOffset)stackOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackOffset.horizontal;
  vertical = self->_stackOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIEdgeInsets)stackPerspectiveInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_stackPerspectiveInsets.top;
  left = self->_stackPerspectiveInsets.left;
  bottom = self->_stackPerspectiveInsets.bottom;
  right = self->_stackPerspectiveInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIOffset)stackPerspectiveOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackPerspectiveOffset.horizontal;
  vertical = self->_stackPerspectiveOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (CGPoint)stackPerspectiveFactor
{
  double x;
  double y;
  CGPoint result;

  x = self->_stackPerspectiveFactor.x;
  y = self->_stackPerspectiveFactor.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIColor)gridBackgroundColor
{
  return self->_gridBackgroundColor;
}

- (double)gridMargin
{
  return self->_gridMargin;
}

- (double)gridItemSpacing
{
  return self->_gridItemSpacing;
}

- (double)posterSquareCornerRadius
{
  return self->_posterSquareCornerRadius;
}

- (double)posterSubitemCornerRadius
{
  return self->_posterSubitemCornerRadius;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (BOOL)cornerOverlaysDisabled
{
  return self->_cornerOverlaysDisabled;
}

- (int64_t)numberOfVisibleItems
{
  return self->_numberOfVisibleItems;
}

- (double)itemAlpha
{
  return self->_itemAlpha;
}

- (UIImage)emptyPlaceholderImage
{
  return self->_emptyPlaceholderImage;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (int64_t)_numberOfViews
{
  return self->__numberOfViews;
}

- (NSArray)_photoViews
{
  return self->__photoViews;
}

- (NSPointerArray)_imageSizes
{
  return self->__imageSizes;
}

- (NSArray)_photoDecorationVariants
{
  return self->__photoDecorationVariants;
}

- (void)_setPhotoDecorationVariants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundView, a3);
}

- (UIColor)cornersBackgroundColor
{
  return self->_cornersBackgroundColor;
}

- (void)setCornersBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cornersBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornersBackgroundColor, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__photoDecorationVariants, 0);
  objc_storeStrong((id *)&self->__imageSizes, 0);
  objc_storeStrong((id *)&self->__photoViews, 0);
  objc_storeStrong((id *)&self->_emptyPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_gridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_combinedPhotoDecorationImageView, 0);
}

void __45__PUStackView__combinedPhotoDecorationsImage__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_combinedPhotoDecorationsImage__imageCache;
  _combinedPhotoDecorationsImage__imageCache = (uint64_t)v0;

}

void __32__PUStackView__updatePhotoViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "style") != 6)
  {
    v8 = -1;
    goto LABEL_14;
  }
  if (a3 == 2)
  {
    v5 = *(_BYTE *)(a1 + 80) == 0;
    v6 = 8;
    v7 = 4;
LABEL_8:
    if (v5)
      v8 = v7;
    else
      v8 = v6;
    goto LABEL_14;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PUStackView.m"), 603, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v5 = *(_BYTE *)(a1 + 80) == 0;
    v6 = 5;
    v7 = 10;
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 80))
    v8 = 2;
  else
    v8 = 1;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0D7B5A0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "disableRoundedOverlays");

  v11 = (objc_msgSend(*(id *)(a1 + 32), "cornerOverlaysDisabled") | v10) ^ 1;
  objc_msgSend(v18, "contentHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAvoidsImageViewIfPossible:", *(unsigned __int8 *)(a1 + 81));

  objc_msgSend(v18, "contentHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAvoidsPhotoDecoration:", *(unsigned __int8 *)(a1 + 81));

  objc_msgSend(v18, "contentHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", v8, v11, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "continuousCorners"), *(double *)(a1 + 64));

  objc_msgSend(v18, "contentHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", *(_QWORD *)(a1 + 48));

  objc_msgSend(v18, "contentHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentAlpha:", *(double *)(a1 + 72));

}

void __31__PUStackView__updateHighlight__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "contentHelper");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", *(unsigned __int8 *)(a1 + 32));

}

void __29__PUStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  __int128 *v6;
  __int128 v7;
  void *v8;
  int v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40) <= a3)
  {
    v9 = 1;
  }
  else
  {
    v16 = 0.0;
    v17 = 0.0;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_getCenter:bounds:forPhotoViewAtIndex:", &v16, &v14, a3);
    objc_msgSend(v5, "setCenter:", v16, v17);
    objc_msgSend(v5, "setBounds:", v14, v15);
    v6 = (__int128 *)(*(_QWORD *)(a1 + 32) + 416 + 48 * a3);
    v7 = v6[1];
    v11 = *v6;
    v12 = v7;
    v13 = v6[2];
    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    objc_msgSend(v8, "setAffineTransform:", v10);

    v9 = 0;
  }
  objc_msgSend(v5, "setHidden:", v9 | *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 856 + a3));

}

+ (int64_t)maximumNumberOfVisibleItemsForStyle:(unint64_t)a3
{
  if (a3 > 6)
    return 0;
  else
    return qword_1AB0F0108[a3];
}

@end
