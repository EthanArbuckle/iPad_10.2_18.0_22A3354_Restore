@implementation CACOverlayContainerView

+ (id)badgeViewContainerWithFrame:(CGRect)a3 usingContrast:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  CACAdaptiveBackdropView *v8;
  CACAdaptiveBackdropView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v8 = (CACAdaptiveBackdropView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[CACAdaptiveBackdropView initWithFrame:]([CACAdaptiveBackdropView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  v9 = v8;
  -[CACAdaptiveBackdropView layer](v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCaptureOnly:", 1);

  -[CACAdaptiveBackdropView layer](v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCreatesCompositingGroup:", 1);

  -[CACAdaptiveBackdropView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", x, y, width, height);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCreatesCompositingGroup:", 1);

  objc_msgSend(v12, "addSubview:", v9);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  return v12;
}

@end
