@implementation SBUISystemApertureButton

- (SBUISystemApertureButton)initWithFrame:(CGRect)a3
{
  SBUISystemApertureButton *v3;
  SBUISystemApertureButton *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBUISystemApertureButton;
  v3 = -[SBUISystemApertureButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBUISystemApertureButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
    objc_initWeak(&location, v4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SBUISystemApertureButton_initWithFrame___block_invoke;
    v7[3] = &unk_1E4C3F2C0;
    objc_copyWeak(&v8, &location);
    -[SBUISystemApertureButton setConfigurationUpdateHandler:](v4, "setConfigurationUpdateHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __42__SBUISystemApertureButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sbui_updateConfiguration");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  BOOL v13;
  objc_super v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBUISystemApertureButton;
  v5 = -[SBUISystemApertureButton isHighlighted](&v15, sel_isHighlighted);
  v14.receiver = self;
  v14.super_class = (Class)SBUISystemApertureButton;
  -[SBUISystemApertureButton setHighlighted:](&v14, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[SBUISystemApertureButton bounds](self, "bounds");
    v7 = v6;
    -[SBUISystemApertureButton bounds](self, "bounds");
    if (v7 >= v8)
      v9 = v7;
    else
      v9 = v8;
    v10 = fmax((v9 + -6.0) / v9, 0.9);
    v11 = 0.37;
    v12[1] = 3221225472;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __43__SBUISystemApertureButton_setHighlighted___block_invoke;
    v12[3] = &unk_1E4C3F2E8;
    v12[4] = self;
    if (v3)
      v11 = 0.26;
    v13 = v3;
    *(double *)&v12[5] = v10;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 2, v12, 0, v11, 0.0, 0.0, 0.0);
  }
}

uint64_t __43__SBUISystemApertureButton_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  __int128 v5;
  CGAffineTransform v7;

  v2 = *(void **)(a1 + 32);
  v3 = 0.7;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    CGAffineTransformMakeScale(&v7, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  return objc_msgSend(v4, "setTransform:", &v7);
}

@end
