@implementation PXCollageView

- (PXCollageView)initWithFrame:(CGRect)a3
{
  PXCollageView *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  PXLayoutPerformerOutput *v12;
  PXLayoutPerformerOutput *layoutOutput;
  NSPointerArray *v14;
  uint64_t v15;
  NSArray *imageViews;
  NSPointerArray *imageSizes;
  NSPointerArray *v18;
  uint64_t v19;
  UIColor *cornerBackgroundColor;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PXCollageView;
  v3 = -[PXCollageView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = 3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v6, v7, v8, v9);
      objc_msgSend(v10, "setContentMode:", 2);
      objc_msgSend(v10, "setClipsToBounds:", 1);
      objc_msgSend(v10, "setAccessibilityIgnoresInvertColors:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      -[PXCollageView addSubview:](v3, "addSubview:", v10);
      objc_msgSend(v5, "addObject:", v10);

      --v4;
    }
    while (v4);
    v12 = -[PXLayoutPerformerOutput initWithCapacity:]([PXLayoutPerformerOutput alloc], "initWithCapacity:", 3);
    layoutOutput = v3->_layoutOutput;
    v3->_layoutOutput = v12;

    objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
    v14 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    -[NSPointerArray setCount:](v14, "setCount:", 3);
    v15 = objc_msgSend(v5, "copy");
    imageViews = v3->__imageViews;
    v3->__imageViews = (NSArray *)v15;

    imageSizes = v3->__imageSizes;
    v3->__imageSizes = v14;
    v18 = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = objc_claimAutoreleasedReturnValue();
    cornerBackgroundColor = v3->_cornerBackgroundColor;
    v3->_cornerBackgroundColor = (UIColor *)v19;

    -[PXCollageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PXCollageView _updateRoundedCornerOverlayView](v3, "_updateRoundedCornerOverlayView");

  }
  return v3;
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
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  BOOL v33;
  _OWORD v34[2];
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PXCollageView;
  -[PXCollageView layoutSubviews](&v35, sel_layoutSubviews);
  -[PXCollageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXCollageView numberOfItems](self, "numberOfItems");
  if (v11 >= 3)
    v12 = 3;
  else
    v12 = v11;
  -[PXCollageView imageSizeForItemAtIndex:](self, "imageSizeForItemAtIndex:", 0);
  v15 = v14 > v13;
  PXLayoutPerformerAttributesFromUIView(self, (uint64_t)v34);
  -[PXCollageView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[PXCollageView layoutOutput](self, "layoutOutput");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __31__PXCollageView_layoutSubviews__block_invoke;
  v32[3] = &unk_1E5126060;
  v33 = v15;
  v32[4] = self;
  v32[5] = v12;
  v29[0] = v17;
  v29[1] = v19;
  v29[2] = v21;
  v29[3] = v23;
  v29[4] = 0;
  v30 = v34[0];
  v31 = v34[1];
  +[PXCollageLayoutPerformer performLayoutWithLayoutInput:layoutOutput:usingBlock:](PXCollageLayoutPerformer, "performLayoutWithLayoutInput:layoutOutput:usingBlock:", v29, v24, v32);
  -[PXCollageView _imageViews](self, "_imageViews");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PXApplyLayoutOutputToParticipants(v24, v25);
  if (objc_msgSend(v25, "count"))
  {
    v26 = 0;
    do
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", (uint64_t)v26 >= v12);

      ++v26;
    }
    while (v26 < objc_msgSend(v25, "count"));
  }
  -[PXCollageView _roundedCornerOverlayView](self, "_roundedCornerOverlayView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v4, v6, v8, v10);

}

- (void)setNumberOfItems:(int64_t)a3
{
  if (self->_numberOfItems != a3)
  {
    self->_numberOfItems = a3;
    -[PXCollageView _updateImageViews](self, "_updateImageViews");
    -[PXCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
    -[PXCollageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)imageSizeForItemAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[PXCollageView _imageViews](self, "_imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= a3)
  {
    -[PXCollageView _imageSizes](self, "_imageSizes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointerAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "CGSizeValue");
    v7 = v11;
    v8 = v12;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v13 = v7;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4
{
  double height;
  double width;
  void *v8;
  unint64_t v9;
  id v10;

  height = a3.height;
  width = a3.width;
  -[PXCollageView _imageViews](self, "_imageViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= a4)
  {
    -[PXCollageView _imageSizes](self, "_imageSizes");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replacePointerAtIndex:withPointer:", a4, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height));
    -[PXCollageView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PXCollageView _imageViews](self, "_imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= a4)
  {
    -[PXCollageView _imageViews](self, "_imageViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setImage:", v10);
  }

}

- (void)setCornerRadius:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollageView.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cornerRadius >= 0"));

  }
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
  }
}

- (void)setImageCornerRadius:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollageView.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageCornerRadius >= 0"));

  }
  if (self->_imageCornerRadius != a3)
  {
    self->_imageCornerRadius = a3;
    -[PXCollageView _updateImageViews](self, "_updateImageViews");
    -[PXCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
  }
}

- (void)setCornerBackgroundColor:(id)a3
{
  UIColor *v6;
  void *v7;
  UIColor *v8;

  v6 = (UIColor *)a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollageView.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cornerBackgroundColor"));

    v6 = 0;
  }
  if (self->_cornerBackgroundColor != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)&self->_cornerBackgroundColor, a3);
    -[PXCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
    -[PXCollageView setNeedsDisplay](self, "setNeedsDisplay");
    v6 = v8;
  }

}

- (void)_updateImageViews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (-[PXCollageView numberOfItems](self, "numberOfItems") >= 2)
  {
    -[PXCollageView imageCornerRadius](self, "imageCornerRadius");
    v3 = v4;
  }
  -[PXCollageView _imageViews](self, "_imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_cornerRadius");
    if (v8 != v3)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "_setCornerRadius:", v3, (_QWORD)v14);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)_updateRoundedCornerOverlayView
{
  double v3;
  double v4;
  PXRoundedCornerOverlayView *v5;
  PXRoundedCornerOverlayView *v6;
  PXRoundedCornerOverlayView *v7;
  _QWORD v8[5];

  -[PXCollageView cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[PXCollageView _roundedCornerOverlayView](self, "_roundedCornerOverlayView");
  v5 = (PXRoundedCornerOverlayView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 <= 0.0)
  {
    if (!v5)
      return;
    -[PXRoundedCornerOverlayView removeFromSuperview](v5, "removeFromSuperview");
    -[PXCollageView set_roundedCornerOverlayView:](self, "set_roundedCornerOverlayView:", 0);
  }
  else
  {
    if (!v5)
    {
      v7 = [PXRoundedCornerOverlayView alloc];
      -[PXCollageView bounds](self, "bounds");
      v6 = -[PXRoundedCornerOverlayView initWithFrame:](v7, "initWithFrame:");
      -[PXCollageView addSubview:](self, "addSubview:", v6);
      -[PXCollageView set_roundedCornerOverlayView:](self, "set_roundedCornerOverlayView:", v6);
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__PXCollageView__updateRoundedCornerOverlayView__block_invoke;
    v8[3] = &unk_1E51406D0;
    v8[4] = self;
    -[PXRoundedCornerOverlayView performChanges:](v6, "performChanges:", v8);
  }

}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)cornerBackgroundColor
{
  return self->_cornerBackgroundColor;
}

- (double)imageCornerRadius
{
  return self->_imageCornerRadius;
}

- (PXLayoutPerformerOutput)layoutOutput
{
  return self->_layoutOutput;
}

- (void)setLayoutOutput:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOutput, a3);
}

- (NSArray)_imageViews
{
  return self->__imageViews;
}

- (NSPointerArray)_imageSizes
{
  return self->__imageSizes;
}

- (PXRoundedCornerOverlayView)_roundedCornerOverlayView
{
  return self->__roundedCornerOverlayView;
}

- (void)set_roundedCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->__imageSizes, 0);
  objc_storeStrong((id *)&self->__imageViews, 0);
  objc_storeStrong((id *)&self->_layoutOutput, 0);
  objc_storeStrong((id *)&self->_cornerBackgroundColor, 0);
}

void __48__PXCollageView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "cornerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v4, "setDisplayScale:");

}

void __31__PXCollageView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "spacing");
  objc_msgSend(v4, "setInterItemSpacing:");
  objc_msgSend(v4, "setOuterLayoutRatio:", 0.5);
  objc_msgSend(v4, "setPortraitBias:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setNumberOfVisibleItems:", *(_QWORD *)(a1 + 40));

}

+ (int64_t)maximumNumberOfItems
{
  return 3;
}

@end
