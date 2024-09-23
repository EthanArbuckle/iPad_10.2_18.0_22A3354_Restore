@implementation _UIPlatterSoftShadowView

- (_UIPlatterSoftShadowView)initWithFrame:(CGRect)a3 shadowPath:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIPlatterSoftShadowView *v10;
  _UIPlatterSoftShadowView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIPlatterSoftShadowView;
  v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[_UIPlatterSoftShadowView setShadowPath:](v10, "setShadowPath:", v9);
    -[_UIPlatterSoftShadowView _updateForShadowPath](v11, "_updateForShadowPath");
  }

  return v11;
}

- (void)setNeedsPunchOut:(BOOL)a3
{
  if (self->_needsPunchOut != a3)
  {
    self->_needsPunchOut = a3;
    -[_UIPlatterShadowView setPunchOut:](self->_rimShadowView, "setPunchOut:");
    -[_UIPlatterShadowView setPunchOut:](self->_diffuseShadowView, "setPunchOut:", self->_needsPunchOut);
  }
}

- (void)setShadowPath:(id)a3
{
  UIBezierPath *v4;
  UIBezierPath *shadowPath;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_shadowPath) & 1) == 0)
  {
    v4 = (UIBezierPath *)objc_msgSend(v6, "copy");
    shadowPath = self->_shadowPath;
    self->_shadowPath = v4;

    -[_UIPlatterSoftShadowView _updateForShadowPath](self, "_updateForShadowPath");
  }

}

- (void)_updateForShadowPath
{
  _UIPlatterShadowView *rimShadowView;
  _UIPlatterShadowView *diffuseShadowView;
  void *v5;
  _UIPlatterShadowView *v6;
  void *v7;
  _UIPlatterShadowView *v8;
  _UIPlatterShadowView *v9;
  _UIPlatterShadowView *v10;
  void *v11;
  _UIPlatterShadowView *v12;
  _UIPlatterShadowView *v13;

  -[UIView removeFromSuperview](self->_rimShadowView, "removeFromSuperview");
  rimShadowView = self->_rimShadowView;
  self->_rimShadowView = 0;

  -[UIView removeFromSuperview](self->_diffuseShadowView, "removeFromSuperview");
  diffuseShadowView = self->_diffuseShadowView;
  self->_diffuseShadowView = 0;

  -[_UIPlatterSoftShadowView shadowPath](self, "shadowPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [_UIPlatterShadowView alloc];
    -[_UIPlatterSoftShadowView shadowPath](self, "shadowPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIPlatterShadowView initWithShadowPath:](v6, "initWithShadowPath:", v7);
    v9 = self->_rimShadowView;
    self->_rimShadowView = v8;

    -[_UIPlatterShadowView setShadowOpacity:](self->_rimShadowView, "setShadowOpacity:", 0.2);
    -[_UIPlatterShadowView setShadowOffset:](self->_rimShadowView, "setShadowOffset:", 0.0, 1.0);
    -[_UIPlatterShadowView setShadowRadius:](self->_rimShadowView, "setShadowRadius:", 3.0);
    -[UIView addSubview:](self, "addSubview:", self->_rimShadowView);
    v10 = [_UIPlatterShadowView alloc];
    -[_UIPlatterSoftShadowView shadowPath](self, "shadowPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIPlatterShadowView initWithShadowPath:](v10, "initWithShadowPath:", v11);
    v13 = self->_diffuseShadowView;
    self->_diffuseShadowView = v12;

    -[_UIPlatterShadowView setShadowOpacity:](self->_diffuseShadowView, "setShadowOpacity:", 0.2);
    -[_UIPlatterShadowView setShadowOffset:](self->_diffuseShadowView, "setShadowOffset:", 0.0, 0.0);
    -[_UIPlatterShadowView setShadowRadius:](self->_diffuseShadowView, "setShadowRadius:", 20.0);
    -[UIView addSubview:](self, "addSubview:", self->_diffuseShadowView);
  }
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (BOOL)needsPunchOut
{
  return self->_needsPunchOut;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIPlatterShadowView)diffuseShadowView
{
  return self->_diffuseShadowView;
}

- (_UIPlatterShadowView)rimShadowView
{
  return self->_rimShadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
}

@end
