@implementation UIFontMetrics

- (CGFloat)scaledValueForValue:(CGFloat)value compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = traitCollection;
  -[UITraitCollection preferredContentSizeCategory](v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_normalizedContentSizeCategory:default:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CTFontDescriptorGetTextStyleSize();
  objc_msgSend((id)objc_opt_class(), "scaledValueForValue:withTextStyle:bodyLeading:compatibleWithTraitCollection:", self->_textStyle, v6, value, 0.0);
  v10 = v9;

  return v10;
}

+ (double)scaledValueForValue:(double)a3 withTextStyle:(id)a4 bodyLeading:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  v9 = a4;
  v10 = a6;
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "displayScale"), v12 != 0.0))
  {
    v15 = v12;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

  }
  if (qword_1ECD7E210 != -1)
    dispatch_once(&qword_1ECD7E210, &__block_literal_global_275);
  objc_msgSend((id)qword_1ECD7E208, "objectForKey:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "doubleValue");
  }
  else
  {
    objc_msgSend(off_1E167A828, "_normalizedContentSizeCategory:default:", CFSTR("_UICTContentSizeCategoryUnspecified"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CTFontDescriptorGetTextStyleSize();
    v20 = (void *)qword_1ECD7E208;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, v9);

    v18 = 0.0;
  }
  if (v18 != 0.0)
    a3 = a3 * a5 / v18;
  UIRoundToScale(a3, v15);
  v23 = v22;

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
}

+ (UIFontMetrics)defaultMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__UIFontMetrics_defaultMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7E200 != -1)
    dispatch_once(&qword_1ECD7E200, block);
  return (UIFontMetrics *)(id)_MergedGlobals_1084;
}

- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize
{
  return -[UIFontMetrics scaledFontForFont:maximumPointSize:compatibleWithTraitCollection:](self, "scaledFontForFont:maximumPointSize:compatibleWithTraitCollection:", font, 0, maximumPointSize);
}

- (UIFont)scaledFontForFont:(UIFont *)font
{
  return -[UIFontMetrics scaledFontForFont:maximumPointSize:](self, "scaledFontForFont:maximumPointSize:", font, 0.0);
}

- (CGFloat)scaledValueForValue:(CGFloat)value
{
  CGFloat result;

  -[UIFontMetrics scaledValueForValue:compatibleWithTraitCollection:](self, "scaledValueForValue:compatibleWithTraitCollection:", 0, value);
  return result;
}

void __31__UIFontMetrics_defaultMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1084;
  _MergedGlobals_1084 = v1;

}

+ (UIFontMetrics)metricsForTextStyle:(UIFontTextStyle)textStyle
{
  NSString *v4;
  void *v5;

  v4 = textStyle;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForTextStyle:", v4);

  return (UIFontMetrics *)v5;
}

- (UIFontMetrics)initForTextStyle:(UIFontTextStyle)textStyle
{
  NSString *v4;
  UIFontMetrics *v5;
  uint64_t v6;
  NSString *v7;
  objc_super v9;

  v4 = textStyle;
  v9.receiver = self;
  v9.super_class = (Class)UIFontMetrics;
  v5 = -[UIFontMetrics init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_textStyle;
    v5->_textStyle = (NSString *)v6;

  }
  return v5;
}

- (UIFont)scaledFontForFont:(UIFont *)font maximumPointSize:(CGFloat)maximumPointSize compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  UIFont *v8;
  UITraitCollection *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = font;
  v9 = traitCollection;
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(sel_scaledFontForFont_maximumPointSize_compatibleWithTraitCollection_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("The font passed to %@ must be non-nil."), v14);

  }
  -[UIFont _fontScaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:forIB:](v8, "_fontScaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:forIB:", self->_textStyle, v9, 0, maximumPointSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v10;
}

void __93__UIFontMetrics_scaledValueForValue_withTextStyle_bodyLeading_compatibleWithTraitCollection___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)off_1E167C048);
  v1 = (void *)qword_1ECD7E208;
  qword_1ECD7E208 = (uint64_t)v0;

}

- (UIFontMetrics)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(sel_initForTextStyle_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Use %@ to instantiate an instance of %@"), v5, v7);

  return 0;
}

- (UIFont)scaledFontForFont:(UIFont *)font compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  return -[UIFontMetrics scaledFontForFont:maximumPointSize:compatibleWithTraitCollection:](self, "scaledFontForFont:maximumPointSize:compatibleWithTraitCollection:", font, traitCollection, 0.0);
}

- (id)ib_scaledFontForFont:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(sel_ib_scaledFontForFont_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("The font passed to %@ must be non-nil."), v9);

  }
  objc_msgSend(v4, "_fontScaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:forIB:", self->_textStyle, 0, 1, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ib_scaledFontForFont:(id)a3 maximumPointSize:(double)a4
{
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(sel_ib_scaledFontForFont_maximumPointSize_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("The font passed to %@ must be non-nil."), v11);

  }
  objc_msgSend(v6, "_fontScaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:forIB:", self->_textStyle, 0, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
