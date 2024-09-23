@implementation SBUISystemApertureStackedContentProvider

- (SBUISystemApertureStackedContentProvider)initWithContentViewProviders:(id)a3
{
  id v5;
  SBUISystemApertureStackedContentProvider *v6;
  void *v7;
  _SBUISystemApertureStackView *v8;
  UIView *providedView;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureStackedContentProvider.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentViewProviders"));

  }
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureStackedContentProvider;
  v6 = -[SBUISystemApertureStackedContentProvider init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_SBUISystemApertureStackView initWithArrangedSubviews:]([_SBUISystemApertureStackView alloc], "initWithArrangedSubviews:", v7);
    -[_SBUISystemApertureStackView setDistribution:](v8, "setDistribution:", 1);
    -[_SBUISystemApertureStackView setAlignment:](v8, "setAlignment:", 0);
    -[_SBUISystemApertureStackView setAxis:](v8, "setAxis:", 0);
    -[_SBUISystemApertureStackView setSpacing:](v8, "setSpacing:", SBUISystemApertureInterItemSpacing());
    providedView = v6->_providedView;
    v6->_providedView = &v8->super.super;

  }
  return v6;
}

uint64_t __73__SBUISystemApertureStackedContentProvider_initWithContentViewProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "providedView");
}

- (int64_t)contentDistribution
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "distribution");

  return v3;
}

- (void)setContentDistribution:(int64_t)a3
{
  id v4;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistribution:", a3);

}

- (int64_t)contentAxis
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "axis");

  return v3;
}

- (void)setContentAxis:(int64_t)a3
{
  id v4;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAxis:", a3);

}

- (double)contentSpacing
{
  void *v2;
  double v3;
  double v4;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spacing");
  v4 = v3;

  return v4;
}

- (void)setContentSpacing:(double)a3
{
  id v4;

  -[SBUISystemApertureStackedContentProvider _providedView](self, "_providedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpacing:", a3);

}

- (id)_providedView
{
  return self->_providedView;
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
