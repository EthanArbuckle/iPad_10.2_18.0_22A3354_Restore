@implementation _TUIGradientContainerLayerConfig

- (_TUIGradientContainerLayerConfig)initWithStyle:(id)a3
{
  id v5;
  _TUIGradientContainerLayerConfig *v6;
  _TUIGradientContainerLayerConfig *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIGradientContainerLayerConfig;
  v6 = -[_TUIGradientContainerLayerConfig init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_style, a3);

  return v7;
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  -[_TUIGradientStyler applyStylingToLayer:](self->_style, "applyStylingToLayer:", a3);
}

- (void)configureLayer:(id)a3
{
  -[_TUIGradientStyler applyStylingToLayer:](self->_style, "applyStylingToLayer:", a3);
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _TUIGradientStyler *style;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = objc_opt_class(_TUIGradientContainerLayerConfig);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    style = self->_style;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "style"));
    v10 = -[_TUIGradientStyler isEqualToStyle:](style, "isEqualToStyle:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (Class)layerClass
{
  void *v3;
  _QWORD *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIGradientStyler blendMode](self->_style, "blendMode"));
  if (objc_msgSend(v3, "isEqualToString:", kCAFilterVariableBlur))
  {

    v4 = CABackdropLayer_ptr;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIGradientStyler blendMode](self->_style, "blendMode"));
    v6 = objc_msgSend(v5, "isEqualToString:", kCAFilterGaussianBlur);

    v4 = CAGradientLayer_ptr;
    if (v6)
      v4 = CABackdropLayer_ptr;
  }
  v7 = objc_opt_class(*v4);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v7);
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (_TUIGradientStyler)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
