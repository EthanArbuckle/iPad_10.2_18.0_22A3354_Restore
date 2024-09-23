@implementation _PXCuratedLibraryZoomLevelSegmentedControl

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  _BOOL4 v4;
  double result;

  v4 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3, *(_QWORD *)&a4);
  result = 16.0;
  if (v4)
    return 18.0;
  return result;
}

- (_PXCuratedLibraryZoomLevelSegmentedControl)initWithFrame:(CGRect)a3
{
  _PXCuratedLibraryZoomLevelSegmentedControl *v3;
  _PXCuratedLibraryZoomLevelSegmentedControl *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  v3 = -[_PXCuratedLibraryZoomLevelSegmentedControl initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_PXCuratedLibraryZoomLevelSegmentedControl setApportionsSegmentWidthsByContent:](v3, "setApportionsSegmentWidthsByContent:", 1);
    -[_PXCuratedLibraryZoomLevelSegmentedControl setTransparentBackground:](v4, "setTransparentBackground:", 1);
    v5 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectForBlurEffect:vibrancyStyle:", v6, 110);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXCuratedLibraryZoomLevelSegmentedControl _setSelectedSegmentVibrancyEffect:](v4, "_setSelectedSegmentVibrancyEffect:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.45);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXCuratedLibraryZoomLevelSegmentedControl setSelectedSegmentTintColor:](v4, "setSelectedSegmentTintColor:", v8);

    -[_PXCuratedLibraryZoomLevelSegmentedControl _setAlwaysEmitValueChanged:](v4, "_setAlwaysEmitValueChanged:", 1);
    -[_PXCuratedLibraryZoomLevelSegmentedControl setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_lastTouchRemainedOnSelectedSegment = 1;
  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  -[_PXCuratedLibraryZoomLevelSegmentedControl touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
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
  -[_PXCuratedLibraryZoomLevelSegmentedControl bounds](self, "bounds");
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
  v20.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  -[_PXCuratedLibraryZoomLevelSegmentedControl touchesEnded:withEvent:](&v20, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_lastTouchRemainedOnSelectedSegment = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  -[_PXCuratedLibraryZoomLevelSegmentedControl touchesCancelled:withEvent:](&v4, sel_touchesCancelled_withEvent_, a3, a4);
}

- (void)_highlightSegment:(int64_t)a3
{
  objc_super v5;

  if ((a3 & 0x8000000000000000) == 0
    && -[_PXCuratedLibraryZoomLevelSegmentedControl selectedSegmentIndex](self, "selectedSegmentIndex") != a3)
  {
    self->_lastTouchRemainedOnSelectedSegment = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PXCuratedLibraryZoomLevelSegmentedControl;
  -[_PXCuratedLibraryZoomLevelSegmentedControl _highlightSegment:](&v5, sel__highlightSegment_, a3);
}

- (BOOL)lastTouchRemainedOnSelectedSegment
{
  return self->_lastTouchRemainedOnSelectedSegment;
}

@end
