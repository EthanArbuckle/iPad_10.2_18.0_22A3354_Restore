@implementation SBFLockScreenAlternateDateLabel

- (SBFLockScreenAlternateDateLabel)initWithSettings:(id)a3 strength:(double)a4 font:(id)a5
{
  id v7;
  id v8;
  SBFLockScreenAlternateDateLabel *v9;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  SBUILegibilityLabel *label;
  SBUILegibilityLabel *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a3;
  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFLockScreenAlternateDateLabel;
  v9 = -[SBFLockScreenAlternateDateLabel init](&v18, sel_init);
  if (v9)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v10 = (void *)getSBUILegibilityLabelClass_softClass_1;
    v23 = getSBUILegibilityLabelClass_softClass_1;
    if (!getSBUILegibilityLabelClass_softClass_1)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getSBUILegibilityLabelClass_block_invoke_1;
      v19[3] = &unk_1E200E038;
      v19[4] = &v20;
      __getSBUILegibilityLabelClass_block_invoke_1((uint64_t)v19);
      v10 = (void *)v21[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v20, 8);
    v12 = [v11 alloc];
    v13 = objc_msgSend(v12, "initWithSettings:strength:string:font:", v7, 0, v8, *MEMORY[0x1E0CEC0C8]);
    label = v9->_label;
    v9->_label = (SBUILegibilityLabel *)v13;

    v15 = v9->_label;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[SBFLockScreenAlternateDateLabel addSubview:](v9, "addSubview:", v9->_label);
  }

  return v9;
}

- (void)layoutSubviews
{
  SBUILegibilityLabel *label;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenAlternateDateLabel;
  -[SBFLockScreenAlternateDateLabel layoutSubviews](&v4, sel_layoutSubviews);
  label = self->_label;
  -[SBFLockScreenAlternateDateLabel bounds](self, "bounds");
  -[SBUILegibilityLabel setFrame:](label, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)showAlternateDate
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_lunarCalendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setDate:(id)a3
{
  NSDate *v5;
  SBUILegibilityLabel *label;
  void *v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    label = self->_label;
    -[SBFLockScreenAlternateDateLabel _alternateDateString](self, "_alternateDateString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setString:](label, "setString:", v7);

    v5 = v8;
  }

}

- (void)setFont:(id)a3
{
  -[SBUILegibilityLabel setFont:](self->_label, "setFont:", a3);
}

- (UIFont)font
{
  return (UIFont *)-[SBUILegibilityLabel font](self->_label, "font");
}

- (void)setLegibilitySettings:(id)a3
{
  -[SBUILegibilityLabel setLegibilitySettings:](self->_label, "setLegibilitySettings:", a3);
}

- (void)setStrength:(double)a3
{
  -[SBUILegibilityLabel setStrength:](self->_label, "setStrength:", a3);
}

- (UIEdgeInsets)characterOverflowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SBUILegibilityLabel characterOverflowInsets](self->_label, "characterOverflowInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)_lunarCalendarIdentifier
{
  if (_lunarCalendarIdentifier_onceToken != -1)
    dispatch_once(&_lunarCalendarIdentifier_onceToken, &__block_literal_global_35);
  return (id)_lunarCalendarIdentifier_lunarCalendarIdentifier;
}

void __59__SBFLockScreenAlternateDateLabel__lunarCalendarIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CAA208], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "overlayCalendarID");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_lunarCalendarIdentifier_lunarCalendarIdentifier;
  _lunarCalendarIdentifier_lunarCalendarIdentifier = v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CAA1E8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_7_0);

}

void __59__SBFLockScreenAlternateDateLabel__lunarCalendarIdentifier__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CAA208], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayCalendarID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_lunarCalendarIdentifier_lunarCalendarIdentifier;
  _lunarCalendarIdentifier_lunarCalendarIdentifier = v0;

}

- (id)_alternateDateString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "_lunarCalendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v2);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D3EFB0], "localeForCalendarID:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)objc_opt_new();
        objc_msgSend(v5, "setCalendar:", v3);
        objc_msgSend(v5, "setLocale:", v4);
        objc_msgSend(v5, "setDateStyle:", 2);
        objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("UMMMd"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromDate:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_strength;
}

- (NSDate)date
{
  return self->_date;
}

- (SBUILegibilityLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
