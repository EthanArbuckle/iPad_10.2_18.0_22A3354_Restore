@implementation PLImageScrollView

- (PLImageScrollView)initWithFrame:(CGRect)a3
{
  PLImageScrollView *v3;
  PLImageScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLImageScrollView;
  v3 = -[PLImageScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLImageScrollView setScrollsToTop:](v3, "setScrollsToTop:", 0);
    -[PLImageScrollView setDecelerationRate:](v4, "setDecelerationRate:", *MEMORY[0x1E0CEBBA0]);
    -[PLImageScrollView setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    v4->_adjustZoomScaleAfterRotation = 0;
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLImageScrollView;
  -[PLImageScrollView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)willAnimateRotationToInterfaceOrientation:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  -[PLImageScrollView zoomScale](self, "zoomScale");
  v6 = v5;
  -[PLImageScrollView contentOffset](self, "contentOffset");
  v8 = v7;
  v10 = v9;
  v11.receiver = self;
  v11.super_class = (Class)PLImageScrollView;
  -[PLImageScrollView willAnimateRotationToInterfaceOrientation:](&v11, sel_willAnimateRotationToInterfaceOrientation_, a3);
  if (-[PLImageScrollView adjustZoomScaleAfterRotation](self, "adjustZoomScaleAfterRotation"))
  {
    -[PLImageScrollView setZoomScale:](self, "setZoomScale:", v6);
    -[PLImageScrollView setContentOffset:](self, "setContentOffset:", v8, v10);
  }
}

- (BOOL)adjustZoomScaleAfterRotation
{
  return self->_adjustZoomScaleAfterRotation;
}

- (void)setAdjustZoomScaleAfterRotation:(BOOL)a3
{
  self->_adjustZoomScaleAfterRotation = a3;
}

@end
