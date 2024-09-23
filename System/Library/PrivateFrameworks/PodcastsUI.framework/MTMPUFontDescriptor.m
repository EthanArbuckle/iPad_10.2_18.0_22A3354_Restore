@implementation MTMPUFontDescriptor

+ (id)fontDescriptorWithTextStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "fontDescriptorWithTextStyle:leadingAdjustment:weight:", a3, 0, 0);
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 weight:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fontDescriptorWithTextStyle:leadingAdjustment:weight:", a3, 0, a4);
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fontDescriptorWithTextStyle:leadingAdjustment:weight:", a3, a4, 0);
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5
{
  return (id)objc_msgSend(a1, "fontDescriptorWithTextStyle:leadingAdjustment:weight:defaultPointSizeAdjustment:", a3, a4, a5, 0.0);
}

+ (id)fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 defaultPointSizeAdjustment:(double)a6
{
  return (id)objc_msgSend(a1, "_fontDescriptorWithTextStyle:leadingAdjustment:weight:systemFontSize:defaultPointSizeAdjustment:", a3, a4, a5, 0.0, a6);
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3
{
  return (id)objc_msgSend(a1, "fontDescriptorWithSystemFontSize:leadingAdjustment:weight:", 0, 0, a3);
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 weight:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fontDescriptorWithSystemFontSize:leadingAdjustment:weight:", 0, a4, a3);
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fontDescriptorWithSystemFontSize:leadingAdjustment:weight:", a4, 0, a3);
}

+ (id)fontDescriptorWithSystemFontSize:(double)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5
{
  return (id)objc_msgSend(a1, "_fontDescriptorWithTextStyle:leadingAdjustment:weight:systemFontSize:defaultPointSizeAdjustment:", 1000, a4, a5, a3, 0.0);
}

+ (id)_fontDescriptorWithTextStyle:(int64_t)a3 leadingAdjustment:(int64_t)a4 weight:(int64_t)a5 systemFontSize:(double)a6 defaultPointSizeAdjustment:(double)a7
{
  double *v13;
  void *v14;
  _QWORD v16[9];

  if ((id)objc_opt_class() == a1)
  {
    +[MTMPUFontDescriptorCache sharedFontDescriptorCache](MTMPUFontDescriptorCache, "sharedFontDescriptorCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __119__MTMPUFontDescriptor__fontDescriptorWithTextStyle_leadingAdjustment_weight_systemFontSize_defaultPointSizeAdjustment___block_invoke;
    v16[3] = &__block_descriptor_72_e36_v16__0__MTMPUMutableFontDescriptor_8l;
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = a5;
    *(double *)&v16[7] = a6;
    *(double *)&v16[8] = a7;
    objc_msgSend(v14, "cachedImmutableFontDescriptorForConfigurationBlock:", v16);
    v13 = (double *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (double *)objc_alloc_init((Class)a1);
    *((_QWORD *)v13 + 4) = a3;
    *((_QWORD *)v13 + 2) = a4;
    *((_QWORD *)v13 + 6) = a5;
    v13[3] = a6;
    v13[1] = a7;
  }
  return v13;
}

void __119__MTMPUFontDescriptor__fontDescriptorWithTextStyle_leadingAdjustment_weight_systemFontSize_defaultPointSizeAdjustment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTextStyle:", v3);
  objc_msgSend(v4, "setLeadingAdjustment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setWeight:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setSystemFontSize:", *(double *)(a1 + 56));
  objc_msgSend(v4, "setDefaultPointSizeAdjustment:", *(double *)(a1 + 64));

}

- (MTMPUFontDescriptor)init
{
  MTMPUFontDescriptor *v2;
  MTMPUFontDescriptor *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTMPUFontDescriptor;
  v2 = -[MTMPUFontDescriptor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MTMPUFontDescriptor _resetToDefaultValues](v2, "_resetToDefaultValues");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "invalidationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleFontDescriptorDidInvalidateCachedFontsAndMetricsNotification_, CFSTR("_MPUFontDescriptorDidInvalidateCachedFontsAndMetricsNotification"), v5);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "invalidationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_MPUFontDescriptorDidInvalidateCachedFontsAndMetricsNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)MTMPUFontDescriptor;
  -[MTMPUFontDescriptor dealloc](&v5, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t leadingAdjustment;
  const __CFString *v10;
  char v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v12 = 0;
  _MTMPUFontTextStyleGetDescriptionAndCustomStyleStatus(self->_textStyle, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("; textStyle = %@"), v7);
  if (v12)
    objc_msgSend(v6, "appendFormat:", CFSTR("; isCustomTextStyle = YES"));
  v8 = self->_weight - 1;
  if (v8 <= 7)
    objc_msgSend(v6, "appendFormat:", CFSTR("; weight = %@"), off_1EA0C5CF8[v8]);
  leadingAdjustment = self->_leadingAdjustment;
  if (leadingAdjustment == 1)
  {
    v10 = CFSTR("shorter");
  }
  else
  {
    if (leadingAdjustment != 2)
      goto LABEL_10;
    v10 = CFSTR("taller");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; leadingAdjustment = %@"), v10);
LABEL_10:
  if (!MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, 0.0))
    objc_msgSend(v6, "appendFormat:", CFSTR("; defaultPointSizeAdjustment = %f"),
      *(_QWORD *)&self->_defaultPointSizeAdjustment);
  if (self->_usesItalic)
    objc_msgSend(v6, "appendString:", CFSTR("; usesItalic = YES"));
  if (self->_usesCondensedMetrics)
    objc_msgSend(v6, "appendString:", CFSTR("; usesCondensedMetrics = YES"));
  if (self->_wantsMonospaceNumbers)
    objc_msgSend(v6, "appendString:", CFSTR("; wantsMonospaceNumbers = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)((double)(unint64_t)((double)(self->_textStyle
                                                              + 100 * self->_weight
                                                              + 1000 * self->_leadingAdjustment
                                                              + 100000 * self->_wantsMonospaceNumbers
                                                              + 10000
                                                              * (unint64_t)(self->_usesCondensedMetrics
                                                                                 + self->_usesItalic))
                                                     + self->_systemFontSize * 100.0)
                          + self->_defaultPointSizeAdjustment * 100000.0);
}

- (BOOL)isEqual:(id)a3
{
  MTMPUFontDescriptor *v4;
  MTMPUFontDescriptor *v5;
  double *v6;
  BOOL v7;

  v4 = (MTMPUFontDescriptor *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (double *)v5;
      v7 = self->_textStyle == v5->_textStyle
        && self->_weight == v5->_weight
        && self->_leadingAdjustment == v5->_leadingAdjustment
        && self->_usesItalic == v5->_usesItalic
        && self->_usesCondensedMetrics == v5->_usesCondensedMetrics
        && self->_wantsMonospaceNumbers == v5->_wantsMonospaceNumbers
        && MTMPUFloatEqualToFloat(self->_systemFontSize, v5->_systemFontSize)
        && MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, v6[1]);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)typeSafeCopy
{
  return (id)-[MTMPUFontDescriptor copy](self, "copy");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MTMPUMutableFontDescriptor *v4;
  MTMPUMutableFontDescriptor *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = objc_alloc_init(MTMPUMutableFontDescriptor);
  v5 = v4;
  if (v4)
  {
    v4->super._textStyle = self->_textStyle;
    v4->super._weight = self->_weight;
    v4->super._leadingAdjustment = self->_leadingAdjustment;
    v4->super._usesItalic = self->_usesItalic;
    v4->super._usesCondensedMetrics = self->_usesCondensedMetrics;
    v4->super._wantsMonospaceNumbers = self->_wantsMonospaceNumbers;
    v4->super._systemFontSize = self->_systemFontSize;
    v4->super._defaultPointSizeAdjustment = self->_defaultPointSizeAdjustment;
    objc_storeStrong((id *)&v4->super._preferredFont, self->_preferredFont);
    *(_OWORD *)&v5->super._preferredFontMetrics.ascender = *(_OWORD *)&self->_preferredFontMetrics.ascender;
    v6 = *(_OWORD *)&self->_preferredFontMetrics.bodyLeading;
    v7 = *(_OWORD *)&self->_preferredFontMetrics.capHeight;
    v8 = *(_OWORD *)&self->_preferredFontMetrics.lineHeight;
    *(_OWORD *)&v5->super._preferredFontMetrics.descender = *(_OWORD *)&self->_preferredFontMetrics.descender;
    *(_OWORD *)&v5->super._preferredFontMetrics.lineHeight = v8;
    *(_OWORD *)&v5->super._preferredFontMetrics.bodyLeading = v6;
    *(_OWORD *)&v5->super._preferredFontMetrics.capHeight = v7;
    objc_storeStrong((id *)&v5->super._defaultFont, self->_defaultFont);
    *(_OWORD *)&v5->super._defaultFontMetrics.ascender = *(_OWORD *)&self->_defaultFontMetrics.ascender;
    v9 = *(_OWORD *)&self->_defaultFontMetrics.bodyLeading;
    v10 = *(_OWORD *)&self->_defaultFontMetrics.capHeight;
    v11 = *(_OWORD *)&self->_defaultFontMetrics.descender;
    *(_OWORD *)&v5->super._defaultFontMetrics.lineHeight = *(_OWORD *)&self->_defaultFontMetrics.lineHeight;
    *(_OWORD *)&v5->super._defaultFontMetrics.descender = v11;
    *(_OWORD *)&v5->super._defaultFontMetrics.capHeight = v10;
    *(_OWORD *)&v5->super._defaultFontMetrics.bodyLeading = v9;
  }
  return v5;
}

- (UIFont)preferredFont
{
  UIFont *preferredFont;
  UIFont *v4;
  UIFont *v5;
  _QWORD v7[5];

  preferredFont = self->_preferredFont;
  if (!preferredFont)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__MTMPUFontDescriptor_preferredFont__block_invoke;
    v7[3] = &unk_1EA0C5C60;
    v7[4] = self;
    -[MTMPUFontDescriptor _fontWithBaseNativeFontDescriptorProvider:](self, "_fontWithBaseNativeFontDescriptorProvider:", v7);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_preferredFont;
    self->_preferredFont = v4;

    preferredFont = self->_preferredFont;
  }
  return preferredFont;
}

uint64_t __36__MTMPUFontDescriptor_preferredFont__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preferredFontDescriptorForTextStyle:", a2);
}

- (double)preferredFontAscender
{
  void *v3;
  double v4;

  if (!self->_preferredFontMetrics.isAscenderInitialized)
  {
    -[MTMPUFontDescriptor preferredFont](self, "preferredFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ascender");
    self->_preferredFontMetrics.ascender = v4;

    self->_preferredFontMetrics.isAscenderInitialized = 1;
  }
  return self->_preferredFontMetrics.ascender;
}

- (double)preferredFontBodyLeading
{
  void *v3;
  double v4;

  if (!self->_preferredFontMetrics.isBodyLeadingInitialized)
  {
    -[MTMPUFontDescriptor preferredFont](self, "preferredFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_bodyLeading");
    self->_preferredFontMetrics.bodyLeading = v4;

    self->_preferredFontMetrics.isBodyLeadingInitialized = 1;
  }
  return self->_preferredFontMetrics.bodyLeading;
}

- (double)preferredFontLineHeight
{
  void *v3;
  double v4;

  if (!self->_preferredFontMetrics.isLineHeightInitialized)
  {
    -[MTMPUFontDescriptor preferredFont](self, "preferredFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineHeight");
    self->_preferredFontMetrics.lineHeight = v4;

    self->_preferredFontMetrics.isLineHeightInitialized = 1;
  }
  return self->_preferredFontMetrics.lineHeight;
}

- (double)preferredFontCapHeight
{
  void *v3;
  double v4;

  if (!self->_preferredFontMetrics.isCapHeightInitialized)
  {
    -[MTMPUFontDescriptor preferredFont](self, "preferredFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capHeight");
    self->_preferredFontMetrics.capHeight = v4;

    self->_preferredFontMetrics.isCapHeightInitialized = 1;
  }
  return self->_preferredFontMetrics.capHeight;
}

- (double)preferredFontDescender
{
  void *v3;
  double v4;

  if (!self->_preferredFontMetrics.isDescenderInitialized)
  {
    -[MTMPUFontDescriptor preferredFont](self, "preferredFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "descender");
    self->_preferredFontMetrics.descender = v4;

    self->_preferredFontMetrics.isDescenderInitialized = 1;
  }
  return self->_preferredFontMetrics.descender;
}

- (UIFont)defaultFont
{
  UIFont *defaultFont;
  UIFont *v4;
  UIFont *v5;
  _QWORD v7[5];

  defaultFont = self->_defaultFont;
  if (!defaultFont)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__MTMPUFontDescriptor_defaultFont__block_invoke;
    v7[3] = &unk_1EA0C5C60;
    v7[4] = self;
    -[MTMPUFontDescriptor _fontWithBaseNativeFontDescriptorProvider:](self, "_fontWithBaseNativeFontDescriptorProvider:", v7);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultFont;
    self->_defaultFont = v4;

    defaultFont = self->_defaultFont;
  }
  return defaultFont;
}

uint64_t __34__MTMPUFontDescriptor_defaultFont__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defaultFontDescriptorForTextStyle:", a2);
}

- (double)defaultFontAscender
{
  void *v3;
  double v4;

  if (!self->_defaultFontMetrics.isAscenderInitialized)
  {
    -[MTMPUFontDescriptor defaultFont](self, "defaultFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ascender");
    self->_defaultFontMetrics.ascender = v4;

    self->_defaultFontMetrics.isAscenderInitialized = 1;
  }
  return self->_defaultFontMetrics.ascender;
}

- (double)defaultFontBodyLeading
{
  void *v3;
  double v4;

  if (!self->_defaultFontMetrics.isBodyLeadingInitialized)
  {
    -[MTMPUFontDescriptor defaultFont](self, "defaultFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_bodyLeading");
    self->_defaultFontMetrics.bodyLeading = v4;

    self->_defaultFontMetrics.isBodyLeadingInitialized = 1;
  }
  return self->_defaultFontMetrics.bodyLeading;
}

- (double)defaultFontCapHeight
{
  void *v3;
  double v4;

  if (!self->_defaultFontMetrics.isCapHeightInitialized)
  {
    -[MTMPUFontDescriptor defaultFont](self, "defaultFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "capHeight");
    self->_defaultFontMetrics.capHeight = v4;

    self->_defaultFontMetrics.isCapHeightInitialized = 1;
  }
  return self->_defaultFontMetrics.capHeight;
}

- (double)defaultFontDescender
{
  void *v3;
  double v4;

  if (!self->_defaultFontMetrics.isDescenderInitialized)
  {
    -[MTMPUFontDescriptor defaultFont](self, "defaultFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "descender");
    self->_defaultFontMetrics.descender = v4;

    self->_defaultFontMetrics.isDescenderInitialized = 1;
  }
  return self->_defaultFontMetrics.descender;
}

- (double)defaultFontLineHeight
{
  void *v3;
  double v4;

  if (!self->_defaultFontMetrics.isLineHeightInitialized)
  {
    -[MTMPUFontDescriptor defaultFont](self, "defaultFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineHeight");
    self->_defaultFontMetrics.lineHeight = v4;

    self->_defaultFontMetrics.isLineHeightInitialized = 1;
  }
  return self->_defaultFontMetrics.bodyLeading;
}

- (double)scaledValueForValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[MTMPUFontDescriptor preferredFontBodyLeading](self, "preferredFontBodyLeading");
  v6 = v5;
  -[MTMPUFontDescriptor defaultFontBodyLeading](self, "defaultFontBodyLeading");
  v8 = v7;
  if (!MTMPUFloatEqualToFloat(v7, 0.0))
    return v6 / v8 * a3;
  return a3;
}

+ (id)invalidationHandler
{
  return +[MTMPUFontDescriptorCache sharedFontDescriptorCache](MTMPUFontDescriptorCache, "sharedFontDescriptorCache");
}

+ (id)_adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:(id)a3 forCustomTextStyle:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4 == 18)
  {
    v16 = *MEMORY[0x1E0DC1390];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC1390]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    v22 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v19 * 1.88235294));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v23;
    v15 = &v22;
    goto LABEL_5;
  }
  v7 = v5;
  if (a4 == 17)
  {
    v8 = *MEMORY[0x1E0DC1390];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC1390]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v24 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v11 * 0.933333333));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (void **)v25;
    v15 = &v24;
LABEL_5:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_baseNativeTextStyleForTextStyle:(int64_t)a3
{
  id *v3;
  id v4;

  v3 = (id *)MEMORY[0x1E0DC4A88];
  switch(a3)
  {
    case 0:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      goto LABEL_21;
    case 1:
      v3 = (id *)MEMORY[0x1E0DC4AD0];
      goto LABEL_21;
    case 2:
    case 17:
      v3 = (id *)MEMORY[0x1E0DC4B10];
      goto LABEL_21;
    case 3:
      v3 = (id *)MEMORY[0x1E0DC4AB8];
      goto LABEL_21;
    case 4:
      v3 = (id *)MEMORY[0x1E0DC4A98];
      goto LABEL_21;
    case 5:
      v3 = (id *)MEMORY[0x1E0DC4AA0];
      goto LABEL_21;
    case 6:
      v3 = (id *)MEMORY[0x1E0DC4B48];
      goto LABEL_21;
    case 7:
    case 18:
      v3 = (id *)MEMORY[0x1E0DC4B50];
      goto LABEL_21;
    case 8:
    case 19:
    case 20:
      v3 = (id *)MEMORY[0x1E0DC4B58];
      goto LABEL_21;
    case 9:
      v3 = (id *)MEMORY[0x1E0DC4B60];
      goto LABEL_21;
    case 10:
      v3 = (id *)MEMORY[0x1E0DC4AD8];
      goto LABEL_21;
    case 11:
      v3 = (id *)MEMORY[0x1E0DC4AE0];
      goto LABEL_21;
    case 12:
      v3 = (id *)MEMORY[0x1E0DC4B18];
      goto LABEL_21;
    case 13:
      v3 = (id *)MEMORY[0x1E0DC4B20];
      goto LABEL_21;
    case 14:
      v3 = (id *)MEMORY[0x1E0DC4A90];
      goto LABEL_21;
    case 15:
      v3 = (id *)MEMORY[0x1E0DC4AC0];
      goto LABEL_21;
    case 16:
      v3 = (id *)MEMORY[0x1E0DC4AC8];
      goto LABEL_21;
    default:
      if (a3 == 1000)
LABEL_21:
        v4 = *v3;
      else
        v4 = 0;
      return v4;
  }
}

+ (void)_getNativeFontDescriptorSymbolicTraits:(unsigned int *)a3 nativeTextStyleAttribute:(id *)a4 forWeight:(int64_t)a5 textStyle:(int64_t)a6
{
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  switch(a5)
  {
    case 1:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr)
      {
        v9 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v9, "kCTFontDescriptorTextStyleHeavy");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleHeavySymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 2:
      if (a6 == 19)
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v8 = (id *)getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr;
        v22 = getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr;
        if (!getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr)
        {
          v16 = (void *)CoreTextLibrary_0();
          v8 = (id *)dlsym(v16, "kCTFontDescriptorTextStyleBold");
          v20[3] = (uint64_t)v8;
          getkCTFontDescriptorTextStyleBoldSymbolLoc_ptr = (uint64_t)v8;
        }
        _Block_object_dispose(&v19, 8);
        if (!v8)
          -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
LABEL_36:
        v15 = *v8;
        v14 = 0;
        if (a3)
          goto LABEL_37;
      }
      else
      {
        v15 = 0;
        v14 = 2;
        if (a3)
LABEL_37:
          *a3 = v14;
      }
LABEL_38:
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      return;
    case 3:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr)
      {
        v10 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v10, "kCTFontDescriptorTextStyleSemibold");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleSemiboldSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 4:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr)
      {
        v11 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v11, "kCTFontDescriptorTextStyleMedium");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleMediumSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 5:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0;
      v22 = getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0;
      if (!getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0)
      {
        v12 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v12, "kCTFontDescriptorTextStyleRegular");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleRegularSymbolLoc_ptr_0 = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 6:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleLightSymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleLightSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleLightSymbolLoc_ptr)
      {
        v17 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v17, "kCTFontDescriptorTextStyleLight");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleLightSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 7:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr)
      {
        v18 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v18, "kCTFontDescriptorTextStyleUltraLight");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleUltraLightSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    case 8:
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v8 = (id *)getkCTFontDescriptorTextStyleThinSymbolLoc_ptr;
      v22 = getkCTFontDescriptorTextStyleThinSymbolLoc_ptr;
      if (!getkCTFontDescriptorTextStyleThinSymbolLoc_ptr)
      {
        v13 = (void *)CoreTextLibrary_0();
        v8 = (id *)dlsym(v13, "kCTFontDescriptorTextStyleThin");
        v20[3] = (uint64_t)v8;
        getkCTFontDescriptorTextStyleThinSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v19, 8);
      if (!v8)
        -[UIFont(MTMPUDynamicType) MTMPU_scaledValueForValue:].cold.1();
      goto LABEL_36;
    default:
      v14 = 0;
      v15 = 0;
      if (!a3)
        goto LABEL_38;
      goto LABEL_37;
  }
}

+ (unsigned)_nativeFontDescriptorSymbolicTraitsForLeadingAdjustment:(int64_t)a3
{
  if (a3 == 2)
    return 0x10000;
  else
    return (a3 == 1) << 15;
}

+ (unsigned)_nativeFontDescriptorSymbolicTraitsForUsingItalic:(BOOL)a3 isCondensedMetrics:(BOOL)a4
{
  unsigned int v4;

  if (a4)
    v4 = 64;
  else
    v4 = 0;
  if (a3)
    return 1;
  else
    return v4;
}

+ (id)_fontPointSizeLayoutInterpolatorForTextStyle:(int64_t)a3
{
  MTMPULayoutInterpolator *v3;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  if (a3 == 20)
  {
    v3 = objc_alloc_init(MTMPULayoutInterpolator);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4908]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 17.0, v18);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4930]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 18.0, v19);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 19.0, v20);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 20.0, v21);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4900]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 22.0, v22);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 24.0, v23);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 26.0, v24);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 32.0, v25);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 39.0, v26);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48C8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 46.0, v27);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48C0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 55.0, v28);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48B8]);
    v16 = v29;
    v17 = 63.0;
  }
  else
  {
    if (a3 != 19)
    {
      v3 = 0;
      return v3;
    }
    v3 = objc_alloc_init(MTMPULayoutInterpolator);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4908]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 19.0, v4);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4930]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 20.0, v5);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 21.0, v6);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 22.0, v7);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC4900]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 24.0, v8);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 26.0, v9);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 28.0, v10);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 34.0, v11);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48D0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 41.0, v12);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48C8]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 48.0, v13);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48C0]);
    -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", 57.0, v14);
    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", *MEMORY[0x1E0DC48B8]);
    v16 = v15;
    v17 = 65.0;
  }
  -[MTMPULayoutInterpolator addValue:forReferenceMetric:](v3, "addValue:forReferenceMetric:", v17, v16);
  return v3;
}

+ (double)_layoutInterpolatorReferenceMetricForContentSizeCategory:(id)a3
{
  id v3;
  double v4;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = 1.0;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0)
  {
    v4 = 2.0;
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0)
    {
      v4 = 3.0;
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0)
      {
        v4 = 5.0;
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) == 0)
        {
          v4 = 6.0;
          if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) == 0)
          {
            v4 = 7.0;
            if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) == 0)
            {
              v4 = 8.0;
              if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) == 0)
              {
                v4 = 9.0;
                if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) == 0)
                {
                  v4 = 10.0;
                  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) == 0)
                  {
                    v4 = 11.0;
                    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) == 0)
                    {
                      v4 = 12.0;
                      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48B8]) & 1) == 0)
                      {
                        v4 = 4.0;
                        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
                        {
                          block[0] = MEMORY[0x1E0C809B0];
                          block[1] = 3221225472;
                          block[2] = __80__MTMPUFontDescriptor__layoutInterpolatorReferenceMetricForContentSizeCategory___block_invoke;
                          block[3] = &unk_1EA0C4FB0;
                          v7 = v3;
                          if (_layoutInterpolatorReferenceMetricForContentSizeCategory__sOnceToken != -1)
                            dispatch_once(&_layoutInterpolatorReferenceMetricForContentSizeCategory__sOnceToken, block);

                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

void __80__MTMPUFontDescriptor__layoutInterpolatorReferenceMetricForContentSizeCategory___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("[MPUFontDescriptor] Missing content size category mapping for %@."), *(_QWORD *)(a1 + 32));
}

- (id)_defaultFontDescriptorForTextStyle:(int64_t)a3
{
  void *v3;
  double systemFontSize;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  switch(a3)
  {
    case 19:
    case 26:
      v3 = (void *)MEMORY[0x1E0DC1350];
      systemFontSize = 22.0;
      goto LABEL_13;
    case 20:
      v3 = (void *)MEMORY[0x1E0DC1350];
      systemFontSize = 20.0;
      goto LABEL_13;
    case 21:
      v3 = (void *)MEMORY[0x1E0DC1350];
      v5 = 0x4044000000000000;
      goto LABEL_12;
    case 22:
      v3 = (void *)MEMORY[0x1E0DC1350];
      v5 = 0x4049000000000000;
      goto LABEL_12;
    case 23:
      v3 = (void *)MEMORY[0x1E0DC1350];
      v5 = 0x404E000000000000;
      goto LABEL_12;
    case 24:
      v3 = (void *)MEMORY[0x1E0DC1350];
      v5 = 0x4040000000000000;
      goto LABEL_12;
    case 25:
      v3 = (void *)MEMORY[0x1E0DC1350];
      systemFontSize = 13.0;
      goto LABEL_13;
    case 27:
      v3 = (void *)MEMORY[0x1E0DC1350];
      v5 = 0x4048000000000000;
LABEL_12:
      systemFontSize = *(double *)&v5;
      goto LABEL_13;
    default:
      if (a3 == 1000)
      {
        systemFontSize = self->_systemFontSize;
        v3 = (void *)MEMORY[0x1E0DC1350];
LABEL_13:
        objc_msgSend(v3, "systemFontOfSize:", systemFontSize);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fontDescriptor");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_baseNativeTextStyleForTextStyle:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:", v6);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v7;

      return v8;
  }
}

- (id)_fontWithBaseNativeFontDescriptorProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  BOOL v23;
  double defaultPointSizeAdjustment;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v41;
  int v42;
  uint64_t v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  (*((void (**)(id, int64_t))a3 + 2))(a3, self->_textStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "_adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:forCustomTextStyle:", v4, self->_textStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v41 = 0;
  objc_msgSend(v5, "_getNativeFontDescriptorSymbolicTraits:nativeTextStyleAttribute:forWeight:textStyle:", &v42, &v41, self->_weight, self->_textStyle);
  v7 = v41;
  v8 = v7;
  if (v7)
  {
    v50 = *MEMORY[0x1E0DC13B8];
    v51[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (self->_wantsMonospaceNumbers)
  {
    v48 = *MEMORY[0x1E0DC1380];
    v10 = *MEMORY[0x1E0DC13D0];
    v45[0] = *MEMORY[0x1E0DC13D8];
    v45[1] = v10;
    v46[0] = &unk_1EA0F65C0;
    v46[1] = &unk_1EA0F65D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v14 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v14, "addEntriesFromDictionary:", v13);

      v9 = v14;
    }
    else
    {
      v9 = v13;
    }

  }
  if (!MTMPUFloatEqualToFloat(self->_defaultPointSizeAdjustment, 0.0))
  {
    -[MTMPUFontDescriptor _defaultFontDescriptorForTextStyle:](self, "_defaultFontDescriptorForTextStyle:", self->_textStyle);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_adjustedNativeFontDescriptorWithBaseNativeFontDescriptor:forCustomTextStyle:", v15, self->_textStyle);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_bodyLeading");
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v6, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_bodyLeading");
    v22 = v21;

    v23 = MTMPUFloatEqualToFloat(v19, 0.0);
    defaultPointSizeAdjustment = self->_defaultPointSizeAdjustment;
    if (!v23)
      defaultPointSizeAdjustment = v22 / v19 * defaultPointSizeAdjustment;
    v25 = round(defaultPointSizeAdjustment);
    objc_msgSend(v6, "pointSize");
    v27 = v26 + v25;
    if (v9)
    {
      v28 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v29, *MEMORY[0x1E0DC1390]);

    }
    else
    {
      v43 = *MEMORY[0x1E0DC1390];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v44 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v9 = v28;
  }
  v30 = objc_msgSend(v5, "_nativeFontDescriptorSymbolicTraitsForLeadingAdjustment:", self->_leadingAdjustment);
  v31 = objc_msgSend(v5, "_nativeFontDescriptorSymbolicTraitsForUsingItalic:isCondensedMetrics:", self->_usesItalic, self->_usesCondensedMetrics);
  v32 = v6;
  v33 = v32;
  v34 = v31 | v30 | v42;
  v35 = v32;
  if (v9)
  {
    objc_msgSend(v32, "fontDescriptorByAddingAttributes:", v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v34)
  {
    objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v35, "symbolicTraits") | v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = v36;

      v35 = v38;
    }

  }
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v35, 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (void)_invalidateCachedFontsAndMetrics
{
  UIFont *preferredFont;
  UIFont *defaultFont;
  MTMPULayoutInterpolator *customFontPointSizeLayoutInterpolator;

  preferredFont = self->_preferredFont;
  self->_preferredFont = 0;

  self->_preferredFontMetrics.isAscenderInitialized = 0;
  self->_preferredFontMetrics.isBodyLeadingInitialized = 0;
  self->_preferredFontMetrics.isCapHeightInitialized = 0;
  self->_preferredFontMetrics.isDescenderInitialized = 0;
  defaultFont = self->_defaultFont;
  self->_defaultFont = 0;

  self->_defaultFontMetrics.isAscenderInitialized = 0;
  self->_defaultFontMetrics.isBodyLeadingInitialized = 0;
  self->_defaultFontMetrics.isCapHeightInitialized = 0;
  self->_defaultFontMetrics.isDescenderInitialized = 0;
  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  self->_customFontPointSizeLayoutInterpolator = 0;

}

- (id)_fontPointSizeLayoutInterpolator
{
  MTMPULayoutInterpolator *customFontPointSizeLayoutInterpolator;
  MTMPULayoutInterpolator *v4;
  MTMPULayoutInterpolator *v5;

  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  if (!customFontPointSizeLayoutInterpolator)
  {
    objc_msgSend((id)objc_opt_class(), "_fontPointSizeLayoutInterpolatorForTextStyle:", self->_textStyle);
    v4 = (MTMPULayoutInterpolator *)objc_claimAutoreleasedReturnValue();
    v5 = self->_customFontPointSizeLayoutInterpolator;
    self->_customFontPointSizeLayoutInterpolator = v4;

    customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  }
  return customFontPointSizeLayoutInterpolator;
}

- (id)_preferredFontDescriptorForTextStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 21) < 7)
    goto LABEL_2;
  if ((unint64_t)(a3 - 19) < 2)
  {
    -[MTMPUFontDescriptor _fontPointSizeLayoutInterpolator](self, "_fontPointSizeLayoutInterpolator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "preferredContentSizeCategory");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (id)*MEMORY[0x1E0DC4918];
    }
    v8 = v7;

    objc_msgSend((id)objc_opt_class(), "_layoutInterpolatorReferenceMetricForContentSizeCategory:", v8);
    objc_msgSend(v4, "valueForReferenceMetric:");
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (a3 != 1000)
  {
    objc_msgSend((id)objc_opt_class(), "_baseNativeTextStyleForTextStyle:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    return v3;
  }
LABEL_2:
  -[MTMPUFontDescriptor _defaultFontDescriptorForTextStyle:](self, "_defaultFontDescriptorForTextStyle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (void)_resetToDefaultValues
{
  MTMPULayoutInterpolator *customFontPointSizeLayoutInterpolator;

  self->_weight = 0;
  self->_leadingAdjustment = 0;
  self->_textStyle = 0;
  *(_DWORD *)((char *)&self->_textStyle + 7) = 0;
  customFontPointSizeLayoutInterpolator = self->_customFontPointSizeLayoutInterpolator;
  self->_customFontPointSizeLayoutInterpolator = 0;

  self->_systemFontSize = 0.0;
  self->_defaultPointSizeAdjustment = 0.0;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (double)systemFontSize
{
  return self->_systemFontSize;
}

- (int64_t)weight
{
  return self->_weight;
}

- (double)defaultPointSizeAdjustment
{
  return self->_defaultPointSizeAdjustment;
}

- (int64_t)leadingAdjustment
{
  return self->_leadingAdjustment;
}

- (BOOL)usesItalic
{
  return self->_usesItalic;
}

- (BOOL)usesCondensedMetrics
{
  return self->_usesCondensedMetrics;
}

- (BOOL)wantsMonospaceNumbers
{
  return self->_wantsMonospaceNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFontPointSizeLayoutInterpolator, 0);
  objc_storeStrong((id *)&self->_defaultFont, 0);
  objc_storeStrong((id *)&self->_preferredFont, 0);
}

@end
