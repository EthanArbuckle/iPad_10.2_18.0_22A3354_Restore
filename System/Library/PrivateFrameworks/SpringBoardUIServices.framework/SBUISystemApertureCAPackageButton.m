@implementation SBUISystemApertureCAPackageButton

- (SBUISystemApertureCAPackageButton)initWithPackageProvider:(id)a3 state:(id)a4 primaryAction:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SBUISystemApertureCAPackageButton *v15;
  SBUISystemApertureCAPackageButton *v16;
  SBUISystemApertureCAPackageButton *result;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = v12;
    objc_msgSend(v10, "providedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v19.receiver = self;
    v19.super_class = (Class)SBUISystemApertureCAPackageButton;
    v15 = -[SBUISystemApertureCAPackageButton initWithFrame:primaryAction:](&v19, sel_initWithFrame_primaryAction_, v13);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_packageProvider, a3);
      objc_storeStrong((id *)&v16->_state, a4);
      objc_msgSend(v14, "setUserInteractionEnabled:", 0);
      -[SBUISystemApertureCAPackageButton addSubview:](v16, "addSubview:", v14);
      if (v11)
        -[SBUISystemApertureCAPackageButton _updateStateAnimated:](v16, "_updateStateAnimated:", 0);
    }

    return v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("packageProvider != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBUISystemApertureCAPackageButton initWithPackageProvider:state:primaryAction:].cold.1(a2, (uint64_t)self, (uint64_t)v18);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (SBUISystemApertureCAPackageButton *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_storeStrong((id *)&self->_state, a3);
  return -[SBUISystemApertureCAPackageButton _updateStateAnimated:](self, "_updateStateAnimated:", v4);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureCAPackageButton;
  v5 = -[SBUISystemApertureCAPackageButton isHighlighted](&v7, sel_isHighlighted);
  v6.receiver = self;
  v6.super_class = (Class)SBUISystemApertureCAPackageButton;
  -[SBUISystemApertureCAPackageButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[SBUISystemApertureCAPackageButton _updateStateAnimated:](self, "_updateStateAnimated:", 1);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureCAPackageButton;
  -[SBUISystemApertureCAPackageButton layoutSubviews](&v12, sel_layoutSubviews);
  -[SBUISystemApertureCAPackageButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUISystemApertureCustomContentProvider providedView](self->_packageProvider, "providedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBUISystemApertureCustomContentProvider providedView](self->_packageProvider, "providedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBUISystemApertureCustomContentProvider providedView](self->_packageProvider, "providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_updateStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  uint64_t v6;
  BOOL v7;

  v3 = a3;
  v5 = self->_state;
  if (-[SBUISystemApertureCAPackageButton isHighlighted](self, "isHighlighted"))
  {
    -[NSString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("-pressed"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (NSString *)v6;
  }
  v7 = -[SBUISystemApertureCAPackageContentProvider setState:animated:](self->_packageProvider, "setState:animated:", v5, v3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_packageProvider, 0);
}

- (void)initWithPackageProvider:(const char *)a1 state:(uint64_t)a2 primaryAction:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBUISystemApertureCAPackageButton.m");
  v16 = 1024;
  v17 = 25;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A471F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
