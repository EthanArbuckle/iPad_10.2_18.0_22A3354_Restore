@implementation SBUIFaceIDCoachingView

- (SBUIFaceIDCoachingView)init
{
  SBUIFaceIDCoachingView *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *currentSizeCategory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUIFaceIDCoachingView;
  v2 = -[SBUIFaceIDCoachingView init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryChanged, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    currentSizeCategory = v2->_currentSizeCategory;
    v2->_currentSizeCategory = (NSString *)v5;

  }
  return v2;
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
  double x;
  double y;
  double width;
  double height;
  id v16;
  CGRect v17;
  CGRect v18;

  -[SBUIFaceIDCoachingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUIFaceIDCoachingView _label](self, "_label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v18 = CGRectInset(v17, -100.0, -100.0);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  -[SBUIFaceIDCoachingView _label](self, "_label");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVisibleRect:", x, y, width, height);

}

- (double)stringWidth
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[SBUIFaceIDCoachingView _label](self, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[SBUIFaceIDCoachingView _label](self, "_label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBUICoachingTextForSBUIFaceIDCoachingCondition(self->_coachingCondition);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredWidthForText:", v5);
  v7 = v6;

  return v7;
}

- (void)setCoachingCondition:(unint64_t)a3
{
  -[SBUIFaceIDCoachingView setCoachingCondition:animated:delay:](self, "setCoachingCondition:animated:delay:", a3, 1, 0.0);
}

- (void)setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5
{
  _BOOL4 v6;
  NSString *v8;
  NSString *labelText;
  dispatch_time_t v10;
  _QWORD v11[5];
  BOOL v12;

  if (self->_coachingCondition != a3)
  {
    v6 = a4;
    self->_coachingCondition = a3;
    SBUICoachingTextForSBUIFaceIDCoachingCondition(a3);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    labelText = self->_labelText;
    self->_labelText = v8;

    -[SBUIFaceIDCoachingView _resizeLabelToFirstSizeCategoryThatFits](self, "_resizeLabelToFirstSizeCategoryThatFits");
    if (v6)
    {
      v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke;
      v11[3] = &unk_1E4C3E430;
      v11[4] = self;
      v12 = v6;
      dispatch_after(v10, MEMORY[0x1E0C80D38], v11);
    }
    else
    {
      -[SBUIFaceIDCoachingView _updateLabelTextForCurrentCoachingConditionAnimated:](self, "_updateLabelTextForCurrentCoachingConditionAnimated:", 0);
    }
  }
}

uint64_t __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke_2;
  v2[3] = &unk_1E4C3E430;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 10.0);
}

uint64_t __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLabelTextForCurrentCoachingConditionAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  _UILegibilitySettings **p_legibilitySettings;
  void *v7;
  UIMorphingLabel *label;
  void *v9;
  NSObject *v10;

  v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[_UILegibilitySettings primaryColor](*p_legibilitySettings, "primaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      label = self->_label;
      -[_UILegibilitySettings primaryColor](*p_legibilitySettings, "primaryColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMorphingLabel setTextColor:](label, "setTextColor:", v9);

    }
    else
    {
      SBLogLockScreenBiometricFaceIDCoaching();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SBUIFaceIDCoachingView setLegibilitySettings:].cold.1((id *)p_legibilitySettings, v10);

    }
  }

}

- (void)_updateLabelTextForCurrentCoachingConditionAnimated:(BOOL)a3
{
  id v4;

  -[SBUIFaceIDCoachingView _label](self, "_label", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", self->_labelText);

}

- (UIMorphingLabel)_label
{
  UIMorphingLabel *label;
  id v4;
  UIMorphingLabel *v5;
  UIMorphingLabel *v6;
  UIMorphingLabel *v7;
  void *v8;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA770]);
    v5 = (UIMorphingLabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_label;
    self->_label = v5;

    -[UIMorphingLabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v7 = self->_label;
    SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)self->_currentSizeCategory);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMorphingLabel setFont:](v7, "setFont:", v8);

    -[UIMorphingLabel setEnableAnimation:](self->_label, "setEnableAnimation:", 1);
    -[UIMorphingLabel setSuppressLayoutSubviews:](self->_label, "setSuppressLayoutSubviews:", 0);
    -[UIMorphingLabel setInitialScale:](self->_label, "setInitialScale:", 0.8);
    -[UIMorphingLabel setRippleDuration:](self->_label, "setRippleDuration:", 0.4);
    -[UIMorphingLabel setGlyphScaleAnimationSpeed:](self->_label, "setGlyphScaleAnimationSpeed:", 10.0);
    -[SBUIFaceIDCoachingView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (void)_resizeLabelToFirstSizeCategoryThatFits
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  BOOL IsEqualToCategory;
  _BOOL4 v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *currentSizeCategory;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUIFaceIDCoachingView _label](self, "_label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[SBUIFaceIDCoachingView _label](self, "_label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "canFitText:", self->_labelText);

  if ((v6 & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x1E0CEB410];
    v9 = (void *)*MEMORY[0x1E0CEB3F8];
    while (1)
    {
      UIContentSizeCategoryOneSmallerThanSizeCategory(v4);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsEqualToCategory = UIContentSizeCategoryIsEqualToCategory(v10, (NSString *)v4);
      v12 = UIContentSizeCategoryIsInRange(v10, v8, v9);
      if (IsEqualToCategory || !v12)
        break;
      v13 = v10;

      -[SBUIFaceIDCoachingView _label](self, "_label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setFont:", v15);
      -[SBUIFaceIDCoachingView _label](self, "_label");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v16, "canFitText:", self->_labelText);

      v4 = v13;
      if ((_DWORD)v15)
        goto LABEL_9;
    }

  }
  v13 = (NSString *)v4;
LABEL_9:
  currentSizeCategory = self->_currentSizeCategory;
  self->_currentSizeCategory = v13;

}

- (unint64_t)coachingCondition
{
  return self->_coachingCondition;
}

- (NSString)currentSizeCategory
{
  return self->_currentSizeCategory;
}

- (void)setCurrentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_currentSizeCategory, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)allowsAlongsideCoaching
{
  return self->_allowsAlongsideCoaching;
}

- (void)setAllowsAlongsideCoaching:(BOOL)a3
{
  self->_allowsAlongsideCoaching = a3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_labelText, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_currentSizeCategory, 0);
}

- (void)setLegibilitySettings:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "sb_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1A471F000, a2, OS_LOG_TYPE_FAULT, "[Legibility] Missing primary color for legibility settings: %@, color: %@", (uint8_t *)&v6, 0x16u);

}

@end
