@implementation _UIMorphingPlatterBackgroundCaptureView

- (_UIMorphingPlatterBackgroundCaptureView)initWithFrame:(CGRect)a3
{
  _UIMorphingPlatterBackgroundCaptureView *v3;
  _UIMorphingPlatterBackgroundCaptureView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIMorphingPlatterBackgroundCaptureView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroupName:", CFSTR("_UIMorphingPlatterView.backgroundCapture"));

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
