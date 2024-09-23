@implementation PUCollageView

- (PUCollageView)initWithFrame:(CGRect)a3
{
  PUCollageView *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  NSPointerArray *v11;
  uint64_t v12;
  NSArray *imageViews;
  NSPointerArray *imageSizes;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUCollageView;
  v3 = -[PUCollageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
      -[PUCollageView addSubview:](v3, "addSubview:", v10);
      objc_msgSend(v5, "addObject:", v10);

      --v4;
    }
    while (v4);
    objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
    v11 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    -[NSPointerArray setCount:](v11, "setCount:", 3);
    v3->__numberOfImageViews = 3;
    v12 = objc_msgSend(v5, "copy");
    imageViews = v3->__imageViews;
    v3->__imageViews = (NSArray *)v12;

    imageSizes = v3->__imageSizes;
    v3->__imageSizes = v11;

    -[PUCollageView setCornerRadius:](v3, "setCornerRadius:", 10.0);
    -[PUCollageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PUCollageView _updateRoundedCornerOverlayView](v3, "_updateRoundedCornerOverlayView");

  }
  return v3;
}

- (void)layoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double MinY;
  double v26;
  double v27;
  double MaxY;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int64_t v35;
  double *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double MaxX;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  double v53[3];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v54 = *MEMORY[0x1E0C80C00];
  -[PUCollageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUCollageView collageSize](self, "collageSize");
  v12 = v11;
  v14 = v13;
  v55.origin.x = v4;
  v55.origin.y = v6;
  v55.size.width = v8;
  v55.size.height = v10;
  v15 = CGRectGetMidX(v55) + v12 * -0.5;
  v56.origin.x = v4;
  v56.origin.y = v6;
  v56.size.width = v8;
  v56.size.height = v10;
  v16 = CGRectGetMidY(v56) + v14 * -0.5;
  -[PUCollageView _imageViews](self, "_imageViews");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v17 = -[PUCollageView numberOfItems](self, "numberOfItems");
  v18 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItems");
  if (v17 >= v18)
    v19 = v18;
  else
    v19 = v17;
  v20 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v48 = *MEMORY[0x1E0C9D648];
  v49 = v20;
  v50 = v48;
  v51 = v20;
  v52 = v48;
  *(_OWORD *)v53 = v20;
  v21 = v15;
  *(double *)&v20 = v16;
  v22 = v12;
  v23 = v14;
  MinX = CGRectGetMinX(*(CGRect *)((char *)&v20 - 8));
  v57.origin.x = v15;
  v57.origin.y = v16;
  v57.size.width = v12;
  v57.size.height = v14;
  MinY = CGRectGetMinY(v57);
  v58.origin.x = v15;
  v58.origin.y = v16;
  v58.size.width = v12;
  v58.size.height = v14;
  CGRectGetMidX(v58);
  UIRoundToViewScale();
  v45 = v26;
  v59.origin.x = v15;
  v59.origin.y = v16;
  v59.size.width = v12;
  v59.size.height = v14;
  CGRectGetMidY(v59);
  UIRoundToViewScale();
  v44 = v27;
  v60.origin.x = v15;
  v60.origin.y = v16;
  v60.size.width = v12;
  v60.size.height = v14;
  MaxX = CGRectGetMaxX(v60);
  v61.origin.x = v15;
  v61.origin.y = v16;
  v61.size.width = v12;
  v61.size.height = v14;
  MaxY = CGRectGetMaxY(v61);
  -[PUCollageView spacing](self, "spacing");
  UIRoundToViewScale();
  v30 = v29;
  if (v19 < 3)
  {
    if (v19 == 2)
    {
      -[PUCollageView imageSizeForItemAtIndex:](self, "imageSizeForItemAtIndex:", 0);
      *(double *)&v48 = MinX;
      *((double *)&v48 + 1) = MinY;
      if (v34 <= v33)
      {
        *(double *)&v49 = MaxY - MinX;
        *((double *)&v49 + 1) = v44 - v30 - MinY;
        *(double *)&v50 = MinX;
        *((double *)&v50 + 1) = v44 + v30;
        *(double *)&v51 = MaxX - MinX;
        *((double *)&v51 + 1) = MaxY - (v44 + v30);
      }
      else
      {
        *(double *)&v49 = v45 - v30 - MinX;
        *((double *)&v49 + 1) = MaxY - MinY;
        *(double *)&v50 = v45 + v30;
        *((double *)&v50 + 1) = MinY;
        *(double *)&v51 = MaxX - (v45 + v30);
        *((double *)&v51 + 1) = MaxY - MinY;
      }
    }
    else
    {
      *(double *)&v48 = MinX;
      *((double *)&v48 + 1) = MinY;
      *(double *)&v49 = MaxX - MinX;
      *((double *)&v49 + 1) = MaxY - MinY;
    }
  }
  else
  {
    -[PUCollageView imageSizeForItemAtIndex:](self, "imageSizeForItemAtIndex:", 0);
    *(double *)&v48 = MinX;
    *((double *)&v48 + 1) = MinY;
    if (v32 <= v31)
    {
      *(double *)&v49 = MaxX - MinX;
      *((double *)&v49 + 1) = v44 - v30 - MinY;
      *(double *)&v50 = MinX;
      *((double *)&v50 + 1) = v44 + v30;
      *(double *)&v51 = v45 - v30 - MinX;
      *((double *)&v51 + 1) = MaxY - (v44 + v30);
    }
    else
    {
      *(double *)&v49 = v45 - v30 - MinX;
      *((double *)&v49 + 1) = MaxY - MinY;
      *(double *)&v50 = v45 + v30;
      *((double *)&v50 + 1) = MinY;
      *(double *)&v51 = MaxX - (v45 + v30);
      *((double *)&v51 + 1) = v44 - v30 - MinY;
    }
    *(double *)&v52 = v45 + v30;
    *((double *)&v52 + 1) = v44 + v30;
    v53[0] = MaxX - (v45 + v30);
    v53[1] = MaxY - (v44 + v30);
  }
  if (-[PUCollageView _numberOfImageViews](self, "_numberOfImageViews", *(_QWORD *)&v44) >= 1)
  {
    v35 = 0;
    v36 = (double *)&v49;
    do
    {
      objc_msgSend(v47, "objectAtIndex:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(v36 - 2);
      v39 = *(v36 - 1);
      v40 = *v36;
      v41 = v36[1];
      v36 += 4;
      objc_msgSend(v37, "setFrame:", v38, v39, v40, v41);
      objc_msgSend(v37, "setHidden:", v35 >= v19);

      ++v35;
    }
    while (v35 < -[PUCollageView _numberOfImageViews](self, "_numberOfImageViews"));
  }
  -[PUCollageView _roundedCornerOverlayView](self, "_roundedCornerOverlayView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
    objc_msgSend(v42, "setFrame:", v15, v16, v12, v14);

}

- (void)setCollageSize:(CGSize)a3
{
  if (a3.width != self->_collageSize.width || a3.height != self->_collageSize.height)
  {
    self->_collageSize = a3;
    -[PUCollageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNumberOfItems:(int64_t)a3
{
  if (self->_numberOfItems != a3)
  {
    self->_numberOfItems = a3;
    -[PUCollageView _updateImageViews](self, "_updateImageViews");
    -[PUCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
    -[PUCollageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)imageSizeForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (-[PUCollageView _numberOfImageViews](self, "_numberOfImageViews") <= a3)
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[PUCollageView _imageSizes](self, "_imageSizes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointerAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "CGSizeValue");
    v8 = v7;
    v10 = v9;

  }
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setImageSize:(CGSize)a3 forItemAtIndex:(int64_t)a4
{
  double height;
  double width;
  id v8;

  height = a3.height;
  width = a3.width;
  if (-[PUCollageView _numberOfImageViews](self, "_numberOfImageViews") > a4)
  {
    -[PUCollageView _imageSizes](self, "_imageSizes");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replacePointerAtIndex:withPointer:", a4, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height));
    -[PUCollageView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PUCollageView _numberOfImageViews](self, "_numberOfImageViews") > a4)
  {
    -[PUCollageView _imageViews](self, "_imageViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setImage:", v8);
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PUCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
  }
}

- (void)setSubitemCornerRadius:(double)a3
{
  if (self->_subitemCornerRadius != a3)
  {
    self->_subitemCornerRadius = a3;
    -[PUCollageView _updateImageViews](self, "_updateImageViews");
  }
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  -[PUCollageView setHasRoundedCorners:withCornersBackgroundColor:](self, "setHasRoundedCorners:withCornersBackgroundColor:", a3, 0);
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
    -[PUCollageView _updateImageViews](self, "_updateImageViews");
    -[PUCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
    v7 = v8;
  }

}

- (void)_updateImageViews
{
  double subitemCornerRadius;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  subitemCornerRadius = 0.0;
  if (self->_hasRoundedCorners
    && -[PUCollageView numberOfItems](self, "numberOfItems") >= 2
    && (subitemCornerRadius = self->_subitemCornerRadius, subitemCornerRadius > 0.0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PUCollageView _imageViews](self, "_imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PUCollageView _imageViews](self, "_imageViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cornerRadius");
    v12 = v11;

    if (v12 != subitemCornerRadius)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[PUCollageView _imageViews](self, "_imageViews", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v18, "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setCornerRadius:", subitemCornerRadius);

            objc_msgSend(v18, "layer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v15);
      }

    }
  }
  else
  {

  }
}

- (void)_updateRoundedCornerOverlayView
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (-[PUCollageView hasRoundedCorners](self, "hasRoundedCorners"))
  {
    v3 = -[PUCollageView numberOfItems](self, "numberOfItems");
    -[PUCollageView _roundedCornerOverlayView](self, "_roundedCornerOverlayView");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3 == 1)
    {
      if (!v4)
      {
        v6 = objc_alloc(MEMORY[0x1E0D7B8B8]);
        -[PUCollageView bounds](self, "bounds");
        v5 = (void *)objc_msgSend(v6, "initWithFrame:");
        -[PUCollageView addSubview:](self, "addSubview:", v5);
        -[PUCollageView _setRoundedCornerOverlayView:](self, "_setRoundedCornerOverlayView:", v5);
        -[PUCollageView bringSubviewToFront:](self, "bringSubviewToFront:", v5);
      }
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__PUCollageView__updateRoundedCornerOverlayView__block_invoke;
      v7[3] = &unk_1E58A5A40;
      v7[4] = self;
      objc_msgSend(v5, "performChanges:", v7);
      goto LABEL_9;
    }
  }
  else
  {
    -[PUCollageView _roundedCornerOverlayView](self, "_roundedCornerOverlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v5)
    return;
  objc_msgSend(v5, "removeFromSuperview");
  -[PUCollageView _setRoundedCornerOverlayView:](self, "_setRoundedCornerOverlayView:", 0);
LABEL_9:

}

- (CGSize)collageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_collageSize.width;
  height = self->_collageSize.height;
  result.height = height;
  result.width = width;
  return result;
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

- (double)subitemCornerRadius
{
  return self->_subitemCornerRadius;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (int64_t)_numberOfImageViews
{
  return self->__numberOfImageViews;
}

- (NSArray)_imageViews
{
  return self->__imageViews;
}

- (NSPointerArray)_imageSizes
{
  return self->__imageSizes;
}

- (UIColor)cornersBackgroundColor
{
  return self->_cornersBackgroundColor;
}

- (void)setCornersBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cornersBackgroundColor, a3);
}

- (PXRoundedCornerOverlayView)_roundedCornerOverlayView
{
  return self->__roundedCornerOverlayView;
}

- (void)_setRoundedCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_cornersBackgroundColor, 0);
  objc_storeStrong((id *)&self->__imageSizes, 0);
  objc_storeStrong((id *)&self->__imageViews, 0);
}

void __48__PUCollageView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "cornerRadius");
  objc_msgSend(v5, "setCornerRadius:");
  objc_msgSend(*(id *)(a1 + 32), "cornersBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayColor:", v4);

  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v5, "setDisplayScale:", *(double *)&PUMainScreenScale_screenScale);

}

+ (int64_t)maximumNumberOfItems
{
  return 3;
}

@end
