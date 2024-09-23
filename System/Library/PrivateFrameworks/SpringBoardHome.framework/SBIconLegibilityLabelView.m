@implementation SBIconLegibilityLabelView

- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  -[SBIconLegibilityLabelView imageParameters](self, "imageParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 != 0) == (v7 != 0)
    && objc_msgSend(v7, "isEqual:", v6)
    && (-[SBUILegibilityView image](self, "image"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[SBUILegibilityView image](self, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    -[SBIconLegibilityLabelView iconView](self, "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "labelImageWithParameters:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SBIconLabelImage imageWithParameters:](SBIconLabelImage, "imageWithParameters:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconLegibilityLabelView setImageParameters:](self, "setImageParameters:", v6);

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v6, "containsEmoji"))
  {
    v12 = objc_msgSend(v24, "style") == 2;
    v13 = v24;
    v14 = !v12;
    v15 = 2 * v14;
  }
  else
  {
    v15 = 2;
    v13 = v24;
  }
  +[SBIconLabelImage legibilityStrengthForLegibilityStyle:](SBIconLabelImage, "legibilityStrengthForLegibilityStyle:", objc_msgSend(v13, "style"));
  v17 = v16;
  SBLogLegibility();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    -[SBUILegibilityView userInfo](self, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = CFSTR("(Undefined)");
    objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("underlyingText"));

  }
  -[SBUILegibilityView updateForChangedSettings:options:image:strength:](self, "updateForChangedSettings:options:image:strength:", v24, v15, v10, v17);

}

- (SBIconLabelImageParameters)imageParameters
{
  return self->_imageParameters;
}

- (void)setImageParameters:(id)a3
{
  objc_storeStrong((id *)&self->_imageParameters, a3);
}

- (SBIconView)iconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (SBIconLegibilityLabelView)initWithSettings:(id)a3 legibilityEngine:(id)a4
{
  id v5;
  SBIconLegibilityLabelView *v6;
  SBIconLegibilityLabelView *v7;

  v5 = a4;
  v6 = -[SBIconLegibilityLabelView init](self, "init");
  v7 = v6;
  if (v6)
    -[SBUILegibilityView setLegibilityEngine:](v6, "setLegibilityEngine:", v5);

  return v7;
}

- (SBIconLegibilityLabelView)initWithSettings:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBIconLegibilityLabelView *v7;

  v4 = (void *)MEMORY[0x1E0DAC5D0];
  v5 = a3;
  objc_msgSend(v4, "defaultEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconLegibilityLabelView initWithSettings:legibilityEngine:](self, "initWithSettings:legibilityEngine:", v5, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageParameters, 0);
  objc_destroyWeak((id *)&self->_iconView);
}

@end
