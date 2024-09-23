@implementation _UIBarButtonSpringLoadedBlinkingEffect

- (void)_prepareLayer:(id)a3 forView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "visualProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointerShapeInContainer:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "rect");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v9, "cornerCurve");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", v10);

    objc_msgSend(v9, "cornerRadius");
    objc_msgSend(v6, "setCornerRadius:");

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIBarButtonSpringLoadedBlinkingEffect;
    -[_UISpringLoadedBlinkingEffect _prepareLayer:forView:](&v11, sel__prepareLayer_forView_, v6, v7);
  }

}

@end
