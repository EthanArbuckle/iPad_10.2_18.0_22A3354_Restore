@implementation PHLocalVideoDisabledOverlayView

- (PHLocalVideoDisabledOverlayView)initWithFrame:(CGRect)a3
{
  PHLocalVideoDisabledOverlayView *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHLocalVideoDisabledOverlayView;
  v3 = -[PHLocalVideoDisabledOverlayView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)_UIBackdropView);
    -[PHLocalVideoDisabledOverlayView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:privateStyle:", 2030);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    -[PHLocalVideoDisabledOverlayView addSubview:](v3, "addSubview:", v5);

  }
  return v3;
}

@end
