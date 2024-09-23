@implementation _PXAssetLoopUIView

- (void)didMoveToWindow
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PXAssetLoopUIView;
  -[_PXAssetLoopUIView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void (**v8)(void);
  objc_super v9;

  -[_PXAssetLoopUIView alpha](self, "alpha");
  v6 = v5;
  v9.receiver = self;
  v9.super_class = (Class)_PXAssetLoopUIView;
  -[_PXAssetLoopUIView setAlpha:](&v9, sel_setAlpha_, a3);
  if (v6 != a3 && (a3 == 0.0 || v6 == 0.0))
  {
    -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v3 = a3;
  v5 = -[_PXAssetLoopUIView isHidden](self, "isHidden");
  v8.receiver = self;
  v8.super_class = (Class)_PXAssetLoopUIView;
  -[_PXAssetLoopUIView setHidden:](&v8, sel_setHidden_, v3);
  if (v5 != v3)
  {
    -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_PXAssetLoopUIView visibilityChangeHandler](self, "visibilityChangeHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
}

- (id)visibilityChangeHandler
{
  return self->_visibilityChangeHandler;
}

- (void)setVisibilityChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visibilityChangeHandler, 0);
}

@end
