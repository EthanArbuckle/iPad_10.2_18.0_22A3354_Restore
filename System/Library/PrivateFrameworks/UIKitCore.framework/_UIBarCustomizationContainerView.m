@implementation _UIBarCustomizationContainerView

- (_UIBarCustomizationContainerView)initWithParentTraitEnvironment:(id)a3
{
  id v4;
  _UIBarCustomizationContainerView *v5;
  _UIBarCustomizationContainerView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIBarCustomizationContainerView;
  v5 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[_UIBarCustomizationContainerView setParentTraitEnvironment:](v6, "setParentTraitEnvironment:", v4);
    +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer](_UIBarCustomizationCustomViewPortalSourceContainer, "sharedContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v7);

  }
  return v6;
}

- (id)traitCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIBarCustomizationContainerView parentTraitEnvironment](self, "parentTraitEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_traitCollectionForChildEnvironment:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 1, 0x1E1A99588);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarCustomizationContainerView;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v6, sel__traitCollectionDidChangeOnSubtreeInternal_, a3);
  -[_UIBarCustomizationContainerView traitChangeHandler](self, "traitChangeHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIBarCustomizationContainerView traitChangeHandler](self, "traitChangeHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _UIBarCustomizationContainerView *))v5)[2](v5, self);

  }
}

- (id)traitChangeHandler
{
  return self->_traitChangeHandler;
}

- (void)setTraitChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (_UITraitEnvironmentInternal)parentTraitEnvironment
{
  return (_UITraitEnvironmentInternal *)objc_loadWeakRetained((id *)&self->_parentTraitEnvironment);
}

- (void)setParentTraitEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_parentTraitEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTraitEnvironment);
  objc_storeStrong(&self->_traitChangeHandler, 0);
}

@end
