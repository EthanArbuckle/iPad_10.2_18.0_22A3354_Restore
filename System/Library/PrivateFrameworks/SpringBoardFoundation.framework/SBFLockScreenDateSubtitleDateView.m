@implementation SBFLockScreenDateSubtitleDateView

- (void)setUseCompactDateFormat:(BOOL)a3
{
  if (self->_useCompactDateFormat != a3)
  {
    self->_useCompactDateFormat = a3;
    -[SBFLockScreenDateSubtitleDateView _updateDateLabelForCompact](self, "_updateDateLabelForCompact");
  }
}

- (void)_updateDateLabelForCompact
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  NSString *v7;
  int v8;
  char v9;
  NSComparisonResult v10;
  NSComparisonResult v11;
  BOOL v12;
  int v13;
  char v14;
  _BOOL4 v15;
  int v16;
  char v17;
  double v18;
  UIContentSizeCategory *v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  __CFString *v26;

  if (!self->_date)
  {
    v26 = &stru_1E2010FC0;
    -[SBFLockScreenDateSubtitleView setString:](self, "setString:", &stru_1E2010FC0);
    goto LABEL_38;
  }
  v3 = (void *)0x1E0CEA000;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = __sb__runningInSpringBoard();
  v9 = v8;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v10 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]);

      if (v10 == NSOrderedAscending)
        goto LABEL_32;
LABEL_10:
      v12 = 0;
      goto LABEL_33;
    }
LABEL_11:
    v13 = __sb__runningInSpringBoard();
    v14 = v13;
    if (v13)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v15 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E0CEB400]) == NSOrderedAscending;
        if ((v9 & 1) == 0)
        {
LABEL_31:

          if (!v15)
            goto LABEL_10;
          goto LABEL_32;
        }
LABEL_27:

        if (v15)
          goto LABEL_32;
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom"))
      {
        v15 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E0CEB400]) == NSOrderedAscending;
        goto LABEL_30;
      }
    }
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v18 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
      v19 = (UIContentSizeCategory *)MEMORY[0x1E0CEB3F8];
    else
      v19 = (UIContentSizeCategory *)MEMORY[0x1E0CEB400];
    v15 = UIContentSizeCategoryCompareToCategory(v7, *v19) == NSOrderedAscending;
    if ((v17 & 1) != 0)
    {
      if ((v14 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

      if ((v14 & 1) != 0)
      {
LABEL_26:
        if ((v9 & 1) == 0)
          goto LABEL_31;
        goto LABEL_27;
      }
    }
LABEL_30:

    if ((v9 & 1) == 0)
      goto LABEL_31;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)v5, "userInterfaceIdiom"))
    goto LABEL_11;
  v11 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]);

  if (v11 != NSOrderedAscending)
    goto LABEL_10;
LABEL_32:
  v12 = !self->_useCompactDateFormat;
LABEL_33:
  v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v20, "setTimeZone:", self->_timeZone);
  if (v6 == 1 || v12)
  {
    objc_msgSend(v20, "setFormattingContext:", 2);
    v21 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("EEEEMMMMd");
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("EEEMMMd");
  }
  objc_msgSend(v21, "dateFormatFromTemplate:options:locale:", v23, 0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDateFormat:", v24);

  objc_msgSend(v20, "stringFromDate:", self->_date);
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[SBFLockScreenDateSubtitleView setString:](self, "setString:", v26);
LABEL_38:
  -[SBFLockScreenAlternateDateLabel setDate:](self->_alternateDateLabel, "setDate:", self->_date);

}

- (void)_setDate:(id)a3 inTimeZone:(id)a4
{
  NSDate *v6;
  id v7;
  NSDate *date;

  v6 = (NSDate *)a3;
  objc_storeStrong((id *)&self->_timeZone, a4);
  v7 = a4;
  date = self->_date;
  self->_date = v6;

  -[SBFLockScreenDateSubtitleDateView _updateDateLabelForCompact](self, "_updateDateLabelForCompact");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  SBFLockScreenAlternateDateLabel *alternateDateLabel;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView sizeThatFits:](&v17, sel_sizeThatFits_);
  v7 = v6;
  v9 = v8;
  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    -[SBFLockScreenAlternateDateLabel sizeThatFits:](alternateDateLabel, "sizeThatFits:", width, height);
    v12 = v11;
    v7 = fmax(v7, v13);
    -[SBFLockScreenDateSubtitleDateView _lunarDateLabelYOffsetFromDateLabel](self, "_lunarDateLabelYOffsetFromDateLabel");
    v9 = v9 + v12 + v14 - v9;
  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (SBFLockScreenDateSubtitleDateView)initWithDate:(id)a3
{
  id v5;
  SBFLockScreenDateSubtitleDateView *v6;
  SBFLockScreenDateSubtitleDateView *v7;
  NSTimeZone *timeZone;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  v6 = -[SBFLockScreenDateSubtitleView initWithString:accessoryView:](&v12, sel_initWithString_accessoryView_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    timeZone = v7->_timeZone;
    v7->_timeZone = 0;

    -[SBFLockScreenDateSubtitleDateView _setupAlternateDateLabel](v7, "_setupAlternateDateLabel");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__overlayCalendarDidChange, *MEMORY[0x1E0CAA1E8], 0);

    objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetFormattersIfNecessary");

  }
  return v7;
}

- (void)_overlayCalendarDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBFLockScreenDateSubtitleDateView__overlayCalendarDidChange__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __62__SBFLockScreenDateSubtitleDateView__overlayCalendarDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupAlternateDateLabel");
}

- (void)_setupAlternateDateLabel
{
  SBFLockScreenAlternateDateLabel *alternateDateLabel;
  SBFLockScreenAlternateDateLabel *v4;
  SBFLockScreenAlternateDateLabel *v5;
  void *v6;
  double v7;
  void *v8;
  SBFLockScreenAlternateDateLabel *v9;
  SBFLockScreenAlternateDateLabel *v10;
  SBFLockScreenAlternateDateLabel *v11;
  void *v12;

  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    -[SBFLockScreenAlternateDateLabel removeFromSuperview](alternateDateLabel, "removeFromSuperview");
    v4 = self->_alternateDateLabel;
    self->_alternateDateLabel = 0;

  }
  if (+[SBFLockScreenAlternateDateLabel showAlternateDate](SBFLockScreenAlternateDateLabel, "showAlternateDate"))
  {
    v5 = [SBFLockScreenAlternateDateLabel alloc];
    -[SBFLockScreenDateSubtitleView legibilitySettings](self, "legibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CEC0C8];
    +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFont](SBFLockScreenDateSubtitleDateView, "dateTimeLunarDateFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBFLockScreenAlternateDateLabel initWithSettings:strength:font:](v5, "initWithSettings:strength:font:", v6, v8, v7);
    v10 = self->_alternateDateLabel;
    self->_alternateDateLabel = v9;

    -[SBFLockScreenAlternateDateLabel setDate:](self->_alternateDateLabel, "setDate:", self->_date);
    v11 = self->_alternateDateLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenAlternateDateLabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SBFLockScreenDateSubtitleDateView addSubview:](self, "addSubview:", self->_alternateDateLabel);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView dealloc](&v4, sel_dealloc);
}

- (void)setDate:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "systemTimeZone");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFLockScreenDateSubtitleDateView _setDate:inTimeZone:](self, "_setDate:inTimeZone:", v5, v6);

}

- (void)setAlignmentPercent:(double)a3
{
  if (self->_alignmentPercent != a3)
  {
    self->_alignmentPercent = a3;
    -[SBFLockScreenDateSubtitleDateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[SBFLockScreenDateSubtitleView legibilitySettings](self, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", v4);

  if ((v6 & 1) == 0)
  {
    -[SBFLockScreenAlternateDateLabel setLegibilitySettings:](self->_alternateDateLabel, "setLegibilitySettings:", v4);
    v7.receiver = self;
    v7.super_class = (Class)SBFLockScreenDateSubtitleDateView;
    -[SBFLockScreenDateSubtitleView setLegibilitySettings:](&v7, sel_setLegibilitySettings_, v4);
  }

}

- (void)setStrength:(double)a3
{
  objc_super v5;

  -[SBFLockScreenAlternateDateLabel setStrength:](self->_alternateDateLabel, "setStrength:");
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView setStrength:](&v5, sel_setStrength_, a3);
}

+ (id)dateTimeLunarDateFont
{
  uint64_t v2;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  _QWORD *v12;
  int v13;
  double v14;
  uint64_t v15;
  void *v16;

  if (dateTimeLunarDateFont_onceToken != -1)
    dispatch_once(&dateTimeLunarDateFont_onceToken, &__block_literal_global_4);
  if (dateTimeLunarDateFont_dateTimeLunarDateFont)
    return (id)dateTimeLunarDateFont_dateTimeLunarDateFont;
  v4 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = 16.0;
  else
    v7 = 15.0;
  v8 = __sb__runningInSpringBoard();
  if ((_DWORD)v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      goto LABEL_24;
    }
  }
  v11 = v8 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      v12 = (_QWORD *)MEMORY[0x1E0CEB3E0];
      goto LABEL_25;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v8, "userInterfaceIdiom"))
    {
      v10 = 0;
      v12 = (_QWORD *)MEMORY[0x1E0CEB3E0];
      v9 = 1;
      goto LABEL_25;
    }
  }
  v9 = v2 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v10 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v14 < *(double *)(MEMORY[0x1E0DAB260] + 40))
  {
    v12 = (_QWORD *)MEMORY[0x1E0CEB3E0];
    goto LABEL_25;
  }
LABEL_24:
  v12 = (_QWORD *)MEMORY[0x1E0CEB3D8];
LABEL_25:
  objc_msgSend(a1, "scaledFontSize:withMaximumFontSizeCategory:", *v12, v7);
  objc_msgSend(v4, "systemFontOfSize:");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)dateTimeLunarDateFont_dateTimeLunarDateFont;
  dateTimeLunarDateFont_dateTimeLunarDateFont = v15;

  if (v10)
  {

    if (!v9)
      goto LABEL_27;
LABEL_31:

    if (!v11)
      return (id)dateTimeLunarDateFont_dateTimeLunarDateFont;
    goto LABEL_28;
  }
  if (v9)
    goto LABEL_31;
LABEL_27:
  if (v11)
LABEL_28:

  return (id)dateTimeLunarDateFont_dateTimeLunarDateFont;
}

void __58__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_16);

}

void __58__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)dateTimeLunarDateFont_dateTimeLunarDateFont;
  dateTimeLunarDateFont_dateTimeLunarDateFont = 0;

}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)dateTimeLunarDateFontMetrics
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (dateTimeLunarDateFontMetrics_onceToken != -1)
    dispatch_once(&dateTimeLunarDateFontMetrics_onceToken, &__block_literal_global_20);
  v3 = *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics;
  if (*(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics == 0.0)
  {
    objc_msgSend(a1, "dateTimeLunarDateFont", *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ascender");
    v6 = v5;
    objc_msgSend(v4, "descender");
    v8 = v7;
    objc_msgSend(v4, "_bodyLeading");
    v10 = v9;
    objc_msgSend(v4, "capHeight");
    *(_QWORD *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = v6;
    *((_QWORD *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics + 1) = v8;
    qword_1EDF81C10 = v10;
    qword_1EDF81C18 = v11;

    v3 = *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics;
  }
  v12 = *((double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics + 1);
  v13 = *(double *)&qword_1EDF81C10;
  v14 = *(double *)&qword_1EDF81C18;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v3;
  return result;
}

void __65__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFontMetrics__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EDF81C10 = unk_18AC17988;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_21);

}

double __65__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFontMetrics__block_invoke_2()
{
  double result;

  result = *(double *)&SBFFontMetricsZero;
  dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EDF81C10 = unk_18AC17988;
  return result;
}

+ (double)subtitleLabelToLunarDateLabelBaselineDifferenceY
{
  void *v2;
  double result;
  void *v4;
  uint64_t v5;
  double v6;
  int v7;
  char v8;
  int v9;
  char v10;
  double v11;
  double v12;

  if (subtitleLabelToLunarDateLabelBaselineDifferenceY_onceToken != -1)
    dispatch_once(&subtitleLabelToLunarDateLabelBaselineDifferenceY_onceToken, &__block_literal_global_22);
  result = *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY;
  if (*(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = 6.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_19:
      +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFontMetrics](SBFLockScreenDateSubtitleDateView, "dateTimeLunarDateFontMetrics");
      result = v6 + v12;
      *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY = v6 + v12;
      return result;
    }
    v7 = __sb__runningInSpringBoard();
    v8 = v7;
    if (v7)
    {
      v6 = 7.0;
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 7.0;
      if (objc_msgSend((id)v5, "userInterfaceIdiom") != 1)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    v9 = __sb__runningInSpringBoard();
    v10 = v9;
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v11 < *(double *)(MEMORY[0x1E0DAB260] + 264))
      v6 = 7.0;
    else
      v6 = 11.0;
    if ((v10 & 1) == 0)

    if ((v8 & 1) != 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  return result;
}

void __85__SBFLockScreenDateSubtitleDateView_subtitleLabelToLunarDateLabelBaselineDifferenceY__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_23);

}

void __85__SBFLockScreenDateSubtitleDateView_subtitleLabelToLunarDateLabelBaselineDifferenceY__block_invoke_2()
{
  subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY = 0;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  NSString *v5;
  NSString *v6;
  NSComparisonResult v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = (NSString *)a4;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  v8 = (void *)MEMORY[0x1E0CEA5E8];
  v9 = *MEMORY[0x1E0CEB538];
  if (v7 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "_scaledValueForValue:", a3);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v14 = v13;

  return v14;
}

- (void)layoutSubviews
{
  SBFLockScreenAlternateDateLabel *alternateDateLabel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView layoutSubviews](&v4, sel_layoutSubviews);
  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    -[SBFLockScreenDateSubtitleDateView alternateDateLabelFrame](self, "alternateDateLabelFrame");
    -[SBFLockScreenAlternateDateLabel setFrame:](alternateDateLabel, "setFrame:");
  }
}

- (CGRect)subtitleLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int ShouldRoundFramesForAlignmentPercent;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView subtitleLabelFrame](&v18, sel_subtitleLabelFrame);
  v6 = v5;
  v8 = v7;
  if (self->_alternateDateLabel)
  {
    -[SBFLockScreenDateSubtitleDateView bounds](self, "bounds");
    v10 = (self->_alignmentPercent + 1.0) * (v9 - v6) * 0.5;
    ShouldRoundFramesForAlignmentPercent = _SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent();
    v4 = 0.0;
    if (ShouldRoundFramesForAlignmentPercent)
    {
      SBFMainScreenScale();
      BSRectRoundForScale();
      v10 = v12;
      v6 = v13;
      v8 = v14;
    }
  }
  else
  {
    v10 = v3;
  }
  v15 = v10;
  v16 = v6;
  v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v4;
  result.origin.x = v15;
  return result;
}

- (CGRect)alternateDateLabelFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[SBFLockScreenAlternateDateLabel sizeToFit](self->_alternateDateLabel, "sizeToFit");
  -[SBFLockScreenDateSubtitleDateView bounds](self, "bounds");
  v4 = v3;
  -[SBFLockScreenAlternateDateLabel frame](self->_alternateDateLabel, "frame");
  v6 = v5;
  v8 = v7;
  v9 = (self->_alignmentPercent + 1.0) * (v4 - v5) * 0.5;
  -[SBFLockScreenDateSubtitleDateView subtitleLabelFrame](self, "subtitleLabelFrame");
  v11 = v10;
  -[SBFLockScreenDateSubtitleDateView _lunarDateLabelYOffsetFromDateLabel](self, "_lunarDateLabelYOffsetFromDateLabel");
  v13 = v12 + v11;
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    v9 = v14;
    v13 = v15;
    v6 = v16;
    v8 = v17;
  }
  v18 = v9;
  v19 = v13;
  v20 = v6;
  v21 = v8;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_lunarDateLabelYOffsetFromDateLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  +[SBFLockScreenDateSubtitleDateView subtitleLabelToLunarDateLabelBaselineDifferenceY](SBFLockScreenDateSubtitleDateView, "subtitleLabelToLunarDateLabelBaselineDifferenceY");
  v4 = v3;
  +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFontMetrics](SBFLockScreenDateSubtitleDateView, "dateTimeLunarDateFontMetrics");
  v6 = v4 - v5;
  +[SBFLockScreenDateSubtitleView labelFontMetrics](SBFLockScreenDateSubtitleView, "labelFontMetrics");
  v8 = v6 + v7;
  -[SBFLockScreenDateSubtitleView subtitleLabelCharacterOverflowInsets](self, "subtitleLabelCharacterOverflowInsets");
  v10 = v8 - v9;
  -[SBFLockScreenAlternateDateLabel characterOverflowInsets](self->_alternateDateLabel, "characterOverflowInsets");
  return v10 - v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleDateView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SBFLockScreenDateSubtitleDateView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__SBFLockScreenDateSubtitleDateView_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E200E188;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __62__SBFLockScreenDateSubtitleDateView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFont](SBFLockScreenDateSubtitleDateView, "dateTimeLunarDateFont");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFont:", v2);

}

- (NSDate)date
{
  return self->_date;
}

- (SBFLockScreenAlternateDateLabel)alternateDateLabel
{
  return self->_alternateDateLabel;
}

- (void)setAlternateDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_alternateDateLabel, a3);
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (BOOL)useCompactDateFormat
{
  return self->_useCompactDateFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDateLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
