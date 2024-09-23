@implementation VTUIProximityContainerView

- (VTUIProximityContainerView)initWithFrame:(CGRect)a3
{
  VTUIProximityContainerView *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityContainerView;
  v3 = -[VTUIProximityContainerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxContainerCornerRadius");
    v6 = v5;

    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsSideButtonActivation");

    if (v8)
    {
      -[VTUIProximityContainerView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", v6);
    }
    else
    {
      -[VTUIProximityContainerView layer](v3, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCornerRadius:", v6);

    }
  }
  -[VTUIProximityContainerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v3;
}

@end
