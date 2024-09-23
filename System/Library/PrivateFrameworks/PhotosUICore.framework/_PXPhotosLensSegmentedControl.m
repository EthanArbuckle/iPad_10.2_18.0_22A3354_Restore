@implementation _PXPhotosLensSegmentedControl

- (_PXPhotosLensSegmentedControl)initWithFrame:(CGRect)a3
{
  _PXPhotosLensSegmentedControl *v3;
  _PXPhotosLensSegmentedControl *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXPhotosLensSegmentedControl;
  v3 = -[_PXPhotosLensSegmentedControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_PXPhotosLensSegmentedControl setApportionsSegmentWidthsByContent:](v3, "setApportionsSegmentWidthsByContent:", 1);
    -[_PXPhotosLensSegmentedControl setTransparentBackground:](v4, "setTransparentBackground:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXPhotosLensSegmentedControl setSelectedSegmentTintColor:](v4, "setSelectedSegmentTintColor:", v5);

    -[_PXPhotosLensSegmentedControl _setAlwaysEmitValueChanged:](v4, "_setAlwaysEmitValueChanged:", 1);
    -[_PXPhotosLensSegmentedControl _updateAppearanceEffect](v4, "_updateAppearanceEffect");
  }
  return v4;
}

- (void)_updateAppearanceEffect
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3F08];
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectForBlurEffect:vibrancyStyle:", v5, 110);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXPhotosLensSegmentedControl _setSelectedSegmentVibrancyEffect:](self, "_setSelectedSegmentVibrancyEffect:", v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  _PXPhotosLensSegmentedControl *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
LABEL_17:
    v14.receiver = self;
    v14.super_class = (Class)_PXPhotosLensSegmentedControl;
    v12 = -[_PXPhotosLensSegmentedControl gestureRecognizerShouldBegin:](&v14, sel_gestureRecognizerShouldBegin_, v4);
    goto LABEL_18;
  }
  v5 = v4;

  if (!v5)
    goto LABEL_17;
  objc_msgSend(v5, "view");
  v6 = (_PXPhotosLensSegmentedControl *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    goto LABEL_17;
  v7 = self->_locationForCurrentTouch.x - self->_locationForPreviousTouch.x;
  v8 = self->_locationForCurrentTouch.y - self->_locationForPreviousTouch.y;
  v9 = -v8;
  if (v8 >= 0.0)
    v9 = self->_locationForCurrentTouch.y - self->_locationForPreviousTouch.y;
  v10 = -v7;
  if (v7 >= 0.0)
    v10 = self->_locationForCurrentTouch.x - self->_locationForPreviousTouch.x;
  if (v9 <= v10 && (v7 != *MEMORY[0x1E0C9D538] || v8 != *(double *)(MEMORY[0x1E0C9D538] + 8)))
    goto LABEL_17;
  v12 = 1;
LABEL_18:

  return v12;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_locationForPreviousTouch;
  id v7;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  self->_lastTouchRemainedOnSelectedSegment = 1;
  p_locationForPreviousTouch = &self->_locationForPreviousTouch;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", self);
  p_locationForPreviousTouch->x = v10;
  p_locationForPreviousTouch->y = v11;

  self->_locationForCurrentTouch = *p_locationForPreviousTouch;
  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosLensSegmentedControl;
  -[_PXPhotosLensSegmentedControl touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v8, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  CGPoint *p_locationForCurrentTouch;
  id v7;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  p_locationForCurrentTouch = &self->_locationForCurrentTouch;
  self->_locationForPreviousTouch = self->_locationForCurrentTouch;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", self);
  p_locationForCurrentTouch->x = v10;
  p_locationForCurrentTouch->y = v11;

  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosLensSegmentedControl;
  -[_PXPhotosLensSegmentedControl touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, v8, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
  objc_super v20;
  CGPoint v21;
  CGRect v22;

  v6 = a4;
  v7 = a3;
  -[_PXPhotosLensSegmentedControl bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locationInView:", self);
  v21.x = v17;
  v21.y = v18;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v19 = CGRectContainsPoint(v22, v21);

  if (!v19)
    self->_lastTouchRemainedOnSelectedSegment = 0;
  v20.receiver = self;
  v20.super_class = (Class)_PXPhotosLensSegmentedControl;
  -[_PXPhotosLensSegmentedControl touchesEnded:withEvent:](&v20, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_lastTouchRemainedOnSelectedSegment = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosLensSegmentedControl;
  -[_PXPhotosLensSegmentedControl touchesCancelled:withEvent:](&v4, sel_touchesCancelled_withEvent_, a3, a4);
}

- (void)_highlightSegment:(int64_t)a3
{
  objc_super v5;

  if ((a3 & 0x8000000000000000) == 0
    && -[_PXPhotosLensSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex") != a3)
  {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXPhotosLensSegmentedControl;
  -[_PXPhotosLensSegmentedControl _highlightSegment:](&v5, sel__highlightSegment_, a3);
}

- (BOOL)lastTouchRemainedOnSelectedSegment
{
  return self->_lastTouchRemainedOnSelectedSegment;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 18.0;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

@end
