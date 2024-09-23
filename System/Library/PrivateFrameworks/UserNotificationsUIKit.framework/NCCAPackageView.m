@implementation NCCAPackageView

- (NCCAPackageView)initWithPackageNamed:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  NCCAPackageView *v8;
  NCCAPackageView *v9;
  UIView *v10;
  UIView *packageContentView;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCCAPackageView;
  v8 = -[NCCAPackageView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_scale = 1.0;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    packageContentView = v9->_packageContentView;
    v9->_packageContentView = v10;

    -[NCCAPackageView addSubview:](v9, "addSubview:", v9->_packageContentView);
    -[NCCAPackageView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    -[NCCAPackageView _setupPackageNamed:inBundle:](v9, "_setupPackageNamed:inBundle:", v6, v7);
  }

  return v9;
}

- (void)setStateName:(id)a3
{
  double v4;
  id v5;

  -[CALayer stateWithName:](self->_packageLayer, "stateWithName:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v5, self->_packageLayer, v4);

}

- (void)removeAllStateChanges
{
  id v2;

  v2 = (id)-[CAStateController removeAllStateChanges](self->_stateController, "removeAllStateChanges");
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[NCCAPackageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  UIView *packageContentView;
  UIView *v4;
  CGAffineTransform v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCCAPackageView;
  -[NCCAPackageView layoutSubviews](&v6, sel_layoutSubviews);
  packageContentView = self->_packageContentView;
  -[NCCAPackageView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](packageContentView, "setCenter:");
  v4 = self->_packageContentView;
  CGAffineTransformMakeScale(&v5, self->_scale, self->_scale);
  -[UIView setTransform:](v4, "setTransform:", &v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double scale;
  double v5;
  double v6;
  CGSize result;
  CGRect v8;

  width = a3.width;
  scale = self->_scale;
  -[CALayer bounds](self->_packageLayer, "bounds", a3.width, a3.height);
  v5 = scale * CGRectGetHeight(v8);
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_setupPackageNamed:(id)a3 inBundle:(id)a4
{
  void *v5;
  uint64_t v6;
  CAPackage *v7;
  id v8;
  CAPackage *package;
  NSObject *v10;
  CALayer *v11;
  void *v12;
  UIView *packageContentView;
  CALayer *packageLayer;
  CALayer *v15;
  CAStateController *v16;
  CAStateController *stateController;
  CGAffineTransform v18;
  id v19;

  objc_msgSend(a4, "URLForResource:withExtension:", a3, CFSTR("ca"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD3078];
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v5, v6, 0, &v19);
  v7 = (CAPackage *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  package = self->_package;
  self->_package = v7;

  if (v8)
  {
    v10 = *MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
      -[NCCAPackageView _setupPackageNamed:inBundle:].cold.1((uint64_t)v5, (uint64_t)v8, v10);
  }
  -[CALayer removeFromSuperlayer](self->_packageLayer, "removeFromSuperlayer");
  -[CAPackage rootLayer](self->_package, "rootLayer");
  v11 = (CALayer *)objc_claimAutoreleasedReturnValue();
  -[CALayer setGeometryFlipped:](v11, "setGeometryFlipped:", -[CAPackage isGeometryFlipped](self->_package, "isGeometryFlipped"));
  if (-[NCCAPackageView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    CGAffineTransformMakeScale(&v18, -1.0, 1.0);
    -[CALayer setAffineTransform:](v11, "setAffineTransform:", &v18);
  }
  -[UIView layer](self->_packageContentView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v11);

  packageContentView = self->_packageContentView;
  -[CALayer bounds](v11, "bounds");
  -[UIView setBounds:](packageContentView, "setBounds:");
  packageLayer = self->_packageLayer;
  self->_packageLayer = v11;
  v15 = v11;

  v16 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v15);
  stateController = self->_stateController;
  self->_stateController = v16;

  -[NCCAPackageView setNeedsLayout](self, "setNeedsLayout");
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_packageContentView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

- (void)_setupPackageNamed:(os_log_t)log inBundle:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "Cannot load CAPackage from %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
