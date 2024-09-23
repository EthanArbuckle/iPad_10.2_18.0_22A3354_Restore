@implementation SBLockScreenTimerDialView

- (SBLockScreenTimerDialView)initWithSymbolFont:(id)a3
{
  id v5;
  SBLockScreenTimerDialView *v6;
  SBLockScreenTimerDialView *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenTimerDialView;
  v6 = -[SBLockScreenTimerDialView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_font, a3);
    objc_msgSend(MEMORY[0x24BDF70F0], "sharedInstanceForStyle:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenTimerDialView setLegibilitySettings:](v7, "setLegibilitySettings:", v8);

  }
  return v7;
}

- (id)_newDialViewConfiguredForSettingsAndFont
{
  _UILegibilitySettings *v3;
  void *v4;
  UIFont *font;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;

  v3 = self->_legibilitySettings;
  -[_UILegibilitySettings primaryColor](v3, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  font = self->_font;
  if (font)
    -[UIFont pointSize](font, "pointSize");
  else
    objc_msgSend(MEMORY[0x24BDF6A70], "defaultFontSize");
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("timer"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v4, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BEB0F68]);
  objc_msgSend(v8, "size");
  v12 = (void *)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, v10, v11);
  objc_msgSend(v12, "updateForChangedSettings:options:image:strength:", v3, 2, v8, self->_strength);
  objc_msgSend(v12, "setTintColor:", v4);

  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBUILegibilityView frame](self->_dialView, "frame", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setFont:(id)a3
{
  SBUILegibilityView *v5;
  SBUILegibilityView *dialView;
  id v7;

  v7 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[SBUILegibilityView removeFromSuperview](self->_dialView, "removeFromSuperview");
    v5 = -[SBLockScreenTimerDialView _newDialViewConfiguredForSettingsAndFont](self, "_newDialViewConfiguredForSettingsAndFont");
    dialView = self->_dialView;
    self->_dialView = v5;

    -[SBLockScreenTimerDialView addSubview:](self, "addSubview:", self->_dialView);
  }

}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  -[SBUILegibilityView setStrength:](self->_dialView, "setStrength:");
}

- (void)setLegibilitySettings:(id)a3
{
  SBUILegibilityView *v5;
  SBUILegibilityView *dialView;
  id v7;

  v7 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUILegibilityView removeFromSuperview](self->_dialView, "removeFromSuperview");
    v5 = -[SBLockScreenTimerDialView _newDialViewConfiguredForSettingsAndFont](self, "_newDialViewConfiguredForSettingsAndFont");
    dialView = self->_dialView;
    self->_dialView = v5;

    -[SBLockScreenTimerDialView addSubview:](self, "addSubview:", self->_dialView);
  }

}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
