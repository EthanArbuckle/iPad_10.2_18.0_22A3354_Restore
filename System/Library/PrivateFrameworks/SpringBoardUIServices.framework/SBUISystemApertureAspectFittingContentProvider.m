@implementation SBUISystemApertureAspectFittingContentProvider

- (SBUISystemApertureAspectFittingContentProvider)initWithView:(id)a3
{
  UIView *v5;
  UIView *customView;
  UIView *v7;
  id *v8;
  SBUISystemApertureAspectFittingContentProvider *v9;
  void *v11;
  objc_super v12;

  v5 = (UIView *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureAspectFittingContentProvider.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customView"));

  }
  customView = self->_customView;
  self->_customView = v5;
  v7 = v5;

  v8 = -[_SBUISystemApertureAspectFittingView initWithContentView:]((id *)[_SBUISystemApertureAspectFittingView alloc], v7);
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  v9 = -[SBUISystemApertureCustomContentProvider initWithView:](&v12, sel_initWithView_, v8);

  return v9;
}

- (void)setContentContainer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  -[SBUISystemApertureCustomContentProvider setContentContainer:](&v7, sel_setContentContainer_, v4);
  -[SBUISystemApertureAspectFittingContentProvider _providedView](self, "_providedView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_storeWeak((id *)(v5 + 424), v4);

}

- (id)contentColor
{
  return -[UIView tintColor](self->_customView, "tintColor");
}

- (void)setContentColor:(id)a3
{
  -[UIView setTintColor:](self->_customView, "setTintColor:", a3);
}

- (CGSize)explicitIntrinsicSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBUISystemApertureAspectFittingContentProvider _providedView](self, "_providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "explicitIntrinsicSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setExplicitIntrinsicSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  id v10;

  height = a3.height;
  width = a3.width;
  -[SBUISystemApertureAspectFittingContentProvider explicitIntrinsicSize](self, "explicitIntrinsicSize");
  if (width != v7 || height != v6)
  {
    -[SBUISystemApertureAspectFittingContentProvider _providedView](self, "_providedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExplicitIntrinsicSize:", width, height);

    -[SBUISystemApertureCustomContentProvider contentContainer](self, "contentContainer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSizeDidInvalidateForContentViewProvider:", self);

  }
}

- (id)_providedView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  -[SBUISystemApertureCustomContentProvider providedView](&v3, sel_providedView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
}

@end
