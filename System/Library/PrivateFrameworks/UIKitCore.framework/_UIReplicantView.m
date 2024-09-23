@implementation _UIReplicantView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIReplicantView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  objc_super v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6.receiver = self;
  v6.super_class = (Class)_UIReplicantView;
  return -[UIView initWithFrame:](&v6, sel_initWithFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (_UIReplicantView)initWithSurface:(const _UIRenderingSurface *)a3
{
  _UIReplicantView *v4;
  double var1;
  _UISlotId *v6;
  void *v7;

  v4 = -[_UIReplicantView initWithFrame:](self, "initWithFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  if (v4)
  {
    var1 = a3->var1;
    v6 = -[_UISlotId initWithSize:]([_UISlotId alloc], "initWithSize:", a3->var0.size.width * var1, a3->var0.size.height * var1);
    -[_UIReplicantView _layer](v4, "_layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setSlotId:", v6);

    -[UIView setContentScaleFactor:](v4, "setContentScaleFactor:", a3->var1);
  }
  return v4;
}

- (id)initAsCopyOf:(id)a3
{
  id v4;
  _UIReplicantView *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v5 = -[_UIReplicantView initWithFrame:](self, "initWithFrame:");
  if (v5)
  {
    objc_msgSend(v4, "_layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_slotId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIReplicantView _layer](v5, "_layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setSlotId:", v7);

    objc_msgSend(v4, "contentScaleFactor");
    -[UIView setContentScaleFactor:](v5, "setContentScaleFactor:");
    -[UIView setAccessibilityIgnoresInvertColors:](v5, "setAccessibilityIgnoresInvertColors:", objc_msgSend(v4, "accessibilityIgnoresInvertColors"));
  }

  return v5;
}

- (_UIReplicantLayer)_layer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIReplicantView;
  -[UIView layer](&v3, sel_layer);
  return (_UIReplicantLayer *)(id)objc_claimAutoreleasedReturnValue();
}

@end
