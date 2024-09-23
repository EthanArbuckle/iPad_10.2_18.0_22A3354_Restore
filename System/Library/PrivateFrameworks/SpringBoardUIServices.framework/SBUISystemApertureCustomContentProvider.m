@implementation SBUISystemApertureCustomContentProvider

- (SBUISystemApertureCustomContentProvider)initWithView:(id)a3
{
  id v6;
  SBUISystemApertureCustomContentProvider *v7;
  SBUISystemApertureCustomContentProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureCustomContentProvider.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customView"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBUISystemApertureCustomContentProvider;
  v7 = -[SBUISystemApertureCustomContentProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_providedView, a3);

  return v8;
}

- (UIColor)contentColor
{
  return -[UIView tintColor](self->_providedView, "tintColor");
}

- (void)setContentColor:(id)a3
{
  -[UIView setTintColor:](self->_providedView, "setTintColor:", a3);
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  return (SBUISystemApertureContentViewContaining *)objc_loadWeakRetained((id *)&self->_contentContainer);
}

- (void)setContentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_contentContainer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
}

@end
