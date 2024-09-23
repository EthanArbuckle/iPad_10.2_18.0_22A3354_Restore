@implementation _UIMTCaptureView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)_backdropLayer
{
  return self->super._layer;
}

- (_UIMTCaptureView)initWithFrame:(CGRect)a3
{
  _UIMTCaptureView *v3;
  _UIMTCaptureView *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIMTCaptureView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIMTCaptureView _backdropLayer](v3, "_backdropLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaptureOnly:", 1);
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%p: %@>"), v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroupName:", v9);

  }
  return v4;
}

- (id)mt_captureGroupName
{
  void *v2;
  void *v3;

  -[_UIMTCaptureView _backdropLayer](self, "_backdropLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_hasBackgroundMaterial
{
  return 1;
}

@end
