@implementation SiriUIHelpButton

+ (SiriUIHelpButton)buttonWithHelpImageMask
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("he"));

  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("helpglyph"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) == 0 && SiriLanguageIsRTL())
  {
    objc_msgSend(v8, "imageWithHorizontallyFlippedOrientation");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(a1, "buttonWithImageMask:style:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (SiriUIHelpButton *)v10;
}

- (void)setEmphasized:(BOOL)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  if (self->_emphasized != a3)
  {
    self->_emphasized = a3;
    if ((-[SiriUIHelpButton isHighlighted](self, "isHighlighted") & 1) == 0)
    {
      v4[4] = self;
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __34__SiriUIHelpButton_setEmphasized___block_invoke;
      v5[3] = &unk_24D7D91F8;
      v5[4] = self;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __34__SiriUIHelpButton_setEmphasized___block_invoke_2;
      v4[3] = &unk_24D7D9270;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v5, v4, 0.6, 0.0);
    }
  }
}

uint64_t __34__SiriUIHelpButton_setEmphasized___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_targetAlpha");
  return objc_msgSend(v1, "setAlpha:");
}

uint64_t __34__SiriUIHelpButton_setEmphasized___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 824) = 0;
  return result;
}

- (void)pulse
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (!self->_animatingEmphasis && (-[SiriUIHelpButton isHighlighted](self, "isHighlighted") & 1) == 0)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __25__SiriUIHelpButton_pulse__block_invoke;
    v4[3] = &unk_24D7D91F8;
    v4[4] = self;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __25__SiriUIHelpButton_pulse__block_invoke_2;
    v3[3] = &unk_24D7D9270;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v4, v3, 0.6, 0.0);
  }
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.4);
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __25__SiriUIHelpButton_pulse__block_invoke_3;
  v2[3] = &unk_24D7D91F8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 2, v2, 0, 0.6, 0.0);
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke_3(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_targetAlpha");
  return objc_msgSend(v1, "setAlpha:");
}

- (double)_targetAlpha
{
  void *v2;
  double v3;
  uint64_t v5;
  uint64_t v6;

  if (self->_emphasized)
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x3FF0000000000000;
  v6 = 0x3FF0000000000000;
  objc_msgSend(v2, "getWhite:alpha:", &v5, &v6);
  v3 = *(double *)&v6;

  return v3;
}

@end
