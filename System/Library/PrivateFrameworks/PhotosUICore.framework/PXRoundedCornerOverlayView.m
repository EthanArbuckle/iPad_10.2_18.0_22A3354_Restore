@implementation PXRoundedCornerOverlayView

- (PXRoundedCornerOverlayView)initWithFrame:(CGRect)a3
{
  PXRoundedCornerOverlayView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXRoundedCornerOverlayView;
  result = -[PXRoundedCornerOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_cornersToRound = -1;
    result->_continuousCorners = 1;
  }
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXRoundedCornerOverlayView _invalidateImage](self, "_invalidateImage");
  }
}

- (void)setCornersToRound:(unint64_t)a3
{
  if (self->_cornersToRound != a3)
  {
    self->_cornersToRound = a3;
    -[PXRoundedCornerOverlayView _invalidateImage](self, "_invalidateImage");
  }
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    -[PXRoundedCornerOverlayView _invalidateImage](self, "_invalidateImage");
  }
}

- (void)setOverlayColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_overlayColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_overlayColor, a3);
    -[PXRoundedCornerOverlayView _invalidateImage](self, "_invalidateImage");
    v5 = v6;
  }

}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXRoundedCornerOverlayView _invalidateImage](self, "_invalidateImage");
  }
}

- (PXFocusInfo)focusInfo
{
  id *v3;
  id v4;
  void *v5;

  if (self->_continuousCorners)
    v3 = (id *)MEMORY[0x1E0CD2A68];
  else
    v3 = (id *)MEMORY[0x1E0CD2A60];
  v4 = *v3;
  -[PXRoundedCornerOverlayView cornerRadius](self, "cornerRadius");
  +[PXFocusInfo focusInfoWithView:cornerRadius:cornerCurve:](PXFocusInfo, "focusInfoWithView:cornerRadius:cornerCurve:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFocusInfo *)v5;
}

- (void)performChanges:(id)a3
{
  void (**v4)(id, void *);
  _BOOL4 isPerformingChanges;
  void *v6;
  void (**v7)(id, void *);

  v4 = (void (**)(id, void *))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v7 = v4;
  if (v4)
  {
    -[PXRoundedCornerOverlayView mutableChangeObject](self, "mutableChangeObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXRoundedCornerOverlayView _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXRoundedCornerOverlayView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXRoundedCornerOverlayView _updateImageIfNeeded](self, "_updateImageIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXRoundedCornerOverlayView _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRoundedCornerOverlayView.m"), 122, CFSTR("update still needed after update pass"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.image;
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRoundedCornerOverlayView.m"), 132, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidateImage
{
  self->_needsUpdateFlags.image = 1;
  -[PXRoundedCornerOverlayView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateImageIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;

  if (self->_needsUpdateFlags.image)
  {
    self->_needsUpdateFlags.image = 0;
    -[PXRoundedCornerOverlayView displayScale](self, "displayScale");
    v4 = v3;
    -[PXRoundedCornerOverlayView cornerRadius](self, "cornerRadius");
    v6 = v5;
    v7 = -[PXRoundedCornerOverlayView continuousCorners](self, "continuousCorners");
    -[PXRoundedCornerOverlayView overlayColor](self, "overlayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXRoundedCornerOverlayView cornersToRound](self, "cornersToRound");
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%.2f-%.2f-%@-%lu"), v12, v4, v6, objc_msgSend(v13, "CGColor"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3870];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__PXRoundedCornerOverlayView__updateImageIfNeeded__block_invoke;
    v18[3] = &unk_1E511CE78;
    v23 = v7;
    v20 = v6;
    v21 = v4;
    v19 = v13;
    v22 = v9;
    v16 = v13;
    objc_msgSend(v15, "_cachedImageForKey:fromBlock:", v14, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRoundedCornerOverlayView setImage:](self, "setImage:", v17);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXRoundedCornerOverlayView;
  -[PXRoundedCornerOverlayView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PXRoundedCornerOverlayView image](self, "image");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PXRoundedCornerOverlayView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

    if (v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__PXRoundedCornerOverlayView_traitCollectionDidChange___block_invoke;
      v9[3] = &unk_1E51406D0;
      v9[4] = self;
      -[PXRoundedCornerOverlayView performChanges:](self, "performChanges:", v9);
    }
  }

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayColor, 0);
}

uint64_t __55__PXRoundedCornerOverlayView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateImage");
}

id __50__PXRoundedCornerOverlayView__updateImageIfNeeded__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v11;
  CGRect v12;

  PXFloatCeilingToPixel();
  v3 = ceil(v2);
  v4 = v3 + v3;
  v5 = floor(v4) - v4 + 1.0;
  v6 = v4 + v5;
  v11.width = v6;
  v11.height = v6;
  UIGraphicsBeginImageContextWithOptions(v11, 0, *(CGFloat *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v6;
  v12.size.height = v6;
  UIRectFill(v12);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", *(_QWORD *)(a1 + 56), 0.0, 0.0, v6, v6, *(double *)(a1 + 40), *(double *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fillWithBlendMode:alpha:", 16, 1.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v8, "resizableImageWithCapInsets:", (v6 - v5) * 0.5, (v6 - v5) * 0.5, (v6 - v5) * 0.5, (v6 - v5) * 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
