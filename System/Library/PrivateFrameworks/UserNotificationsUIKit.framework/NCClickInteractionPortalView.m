@implementation NCClickInteractionPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (NCClickInteractionPortalView)initWithSourceView:(id)a3
{
  id v4;
  NCClickInteractionPortalView *v5;
  NCClickInteractionPortalView *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v11.receiver = self;
  v11.super_class = (Class)NCClickInteractionPortalView;
  v5 = -[NCClickInteractionPortalView initWithFrame:](&v11, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    -[NCClickInteractionPortalView _portalLayer](v5, "_portalLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceLayer:", v8);

    -[NCClickInteractionPortalView _portalLayer](v6, "_portalLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesSourceLayer:", 1);

  }
  return v6;
}

@end
