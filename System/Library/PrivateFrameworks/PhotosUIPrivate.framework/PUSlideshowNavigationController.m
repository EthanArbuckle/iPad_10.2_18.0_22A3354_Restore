@implementation PUSlideshowNavigationController

- (PUSlideshowNavigationController)initWithRootViewController:(id)a3
{
  PUSlideshowNavigationController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUSlideshowNavigationController;
  v3 = -[PUSlideshowNavigationController initWithRootViewController:](&v10, sel_initWithRootViewController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowNavigationController navigationBar](v3, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);
    objc_msgSend(v5, "standardAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScrollEdgeAppearance:", v6);

    -[PUSlideshowNavigationController toolbar](v3, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v4);
    -[PUSlideshowNavigationController setToolbarHidden:](v3, "setToolbarHidden:", 0);
    objc_msgSend(v7, "standardAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScrollEdgeAppearance:", v8);

    -[PUSlideshowNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 0);
  }
  return v3;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PUSlideshowNavigationController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end
