@implementation UIFont

+ (CGFloat)labelFontSize
{
  return *(double *)&__UILabelFontSize;
}

- (BOOL)_getLatin1Glyphs:(const unsigned __int16 *)a3 advanceWidths:(const double *)a4
{
  return CTFontGetLatin1GlyphsAndAdvanceWidths();
}

- (double)_totalAdvancementForNativeGlyphs:(const unsigned __int16 *)a3 count:(int64_t)a4
{
  double result;

  CTFontGetTransformedAdvancesForGlyphsAndStyle();
  return result;
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)objc_msgSend(a1, "systemFontOfSize:traits:", 0, fontSize);
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", a3, a4, 0);
}

- (id)_fontAdjustedForCurrentContentSizeCategory
{
  return -[UIFont _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:](self, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", 0);
}

- (CGFloat)lineHeight
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 16);
}

- (CGFloat)ascender
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 8);
}

- (unint64_t)renderingMode
{
  return 1;
}

+ (UIFont)fontWithName:(id)a3 size:(double)a4 traits:(int)a5
{
  return (UIFont *)UINewFont((uint64_t)a3, *(uint64_t *)&a5, 0, 0, 0, 0, a4, 0.0);
}

+ (UIFont)fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
  return (UIFont *)objc_msgSend(a1, "fontWithName:size:traits:", fontName, 0, fontSize);
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight width:(UIFontWidth)width
{
  uint64_t v7;

  if (width == 0.0)
    v7 = 0;
  else
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  return (UIFont *)UINewFont(0, 0, (uint64_t)CFSTR("NSCTFontUIFontDesignDefault"), v7, 1, 0, fontSize, weight);
}

+ (UIFont)systemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  return (UIFont *)UINewFont(0, 0, (uint64_t)CFSTR("NSCTFontUIFontDesignDefault"), 0, 1, 0, fontSize, weight);
}

- (UIFont)fontWithSize:(CGFloat)fontSize
{
  _BOOL4 v6;
  void *v7;

  if (dyld_program_sdk_at_least())
    return (UIFont *)objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", -[UIFont fontDescriptor](self, "fontDescriptor"), fontSize);
  v6 = -[UIFont __isSystemFont](self, "__isSystemFont");
  v7 = (void *)objc_opt_class();
  if (v6)
    return (UIFont *)objc_msgSend(v7, "systemFontOfSize:traits:", -[UIFont traits](self, "traits"), fontSize);
  else
    return (UIFont *)objc_msgSend(v7, "fontWithName:size:traits:", -[UIFont fontName](self, "fontName"), -[UIFont traits](self, "traits"), fontSize);
}

- (UIFont)initWithCoder:(id)a3
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIFont *v10;
  UIFont *result;
  UIFontDescriptor *v12;
  CFTypeID v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UIFontPointSize"));
  v6 = v5;
  v7 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIFontTraits"));
  v8 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("UIIBFontMetricsScaledFont"));
  v9 = objc_opt_class();
  v28.receiver = self;
  v28.super_class = (Class)UIFont;

  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIIBTextStyle")))
  {
    v10 = +[UIFont ib_preferredFontForTextStyle:](UIFont, "ib_preferredFontForTextStyle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIIBTextStyle")));
    return v10;
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIFontDescriptor")))
  {
    result = (UIFont *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIFontDescriptor"));
    if (result)
    {
      v12 = (UIFontDescriptor *)result;
      v13 = CFGetTypeID(result);
      if (v13 != CTFontDescriptorGetTypeID())
      {
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[%@ initWithCoder]: decoded an object %@ as CTFontDescriptor."), v9, v12);
        v19 = *MEMORY[0x1E0C9AFB8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30[0] = v18;
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v19, 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1)));
        return 0;
      }
      v14 = -[UIFontDescriptor objectForKey:](v12, "objectForKey:", CFSTR("NSCTFontUIUsageAttribute"));
      if (v14)
      {
        v15 = v14;
        if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CA82A0]) & 1) != 0
          || objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CA82A8]))
        {
          v16 = objc_msgSend(-[NSDictionary objectForKey:](-[UIFontDescriptor fontAttributes](v12, "fontAttributes"), "objectForKey:", CFSTR("NSCTFontTraitsAttribute")), "objectForKey:", CFSTR("NSCTFontProportionTrait"));
          if (v6 != 0.0)
          {
            v10 = +[UIFont _systemFontOfSize:width:traits:](UIFont, "_systemFontOfSize:width:traits:", v16, v7, v6);
            return v10;
          }
LABEL_15:
          v10 = +[UIFont _sharedZeroPointFont](UIFont, "_sharedZeroPointFont", v16);
          return v10;
        }
        v20 = -[NSDictionary objectForKey:](-[UIFontDescriptor fontAttributes](v12, "fontAttributes"), "objectForKey:", CFSTR("NSFontSizeAttribute"));
        if (v20)
        {
          objc_msgSend(v20, "doubleValue");
          v6 = v21;
        }
        if (v6 == 0.0)
          v12 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", v15);
      }
      v22 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIFontTextStyleForScaling"));
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UIFontPointSizeForScaling"));
      v24 = v23;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UIFontMaximumPointSizeAfterScaling"));
      v26 = v25;
      if ((_DWORD)v8)
      {
        +[UIFont _pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:](UIFont, "_pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:", v22, 0, v24, v25);
        v6 = v27;
      }
      v10 = +[UIFont _fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:](UIFont, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v12, v22, v8, -1, v6, v24, v26);
      return v10;
    }
  }
  else
  {
    if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("UISystemFont")))
    {
      if (v6 != 0.0)
      {
        v10 = +[UIFont systemFontOfSize:traits:](UIFont, "systemFontOfSize:traits:", v7, v6);
        return v10;
      }
      goto LABEL_15;
    }
    v17 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIFontName"));
    result = (UIFont *)objc_msgSend(v17, "length");
    if (result)
    {
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIFontTraits")))
        v10 = +[UIFont fontWithName:size:traits:](UIFont, "fontWithName:size:traits:", v17, v7, v6);
      else
        v10 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", v17, v6);
      return v10;
    }
  }
  return result;
}

+ (UIFont)fontWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize
{
  return (UIFont *)objc_msgSend(a1, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", descriptor, 0, 0, -1, pointSize, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(id)a5 symbolicTraits:(unsigned int)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10
{
  uint64_t v14;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;

  v14 = *(_QWORD *)&a6;
  if (a8)
    v19 = objc_msgSend(a8, "legibilityWeight");
  else
    v19 = -1;
  v20 = (void *)__UIFontDescriptorWithTextStyle((uint64_t)a3, objc_msgSend(a8, "preferredContentSizeCategory"), 0, v14, (uint64_t)a4, (uint64_t)a5, v19);
  if (a7)
  {
    if ((objc_msgSend(a7, "isEqualToString:", getUIContentSizeCategoryUnspecified[0]()) & 1) == 0)
    {
      v21 = (void *)__UIFontDescriptorWithTextStyle((uint64_t)a3, (uint64_t)a7, 0, 0, 0, 0, v19);
      objc_msgSend(v21, "pointSize");
      v23 = v22;
      objc_msgSend(v20, "pointSize");
      if (v23 < v24)
      {
        objc_msgSend(v21, "pointSize");
        v20 = (void *)objc_msgSend(v20, "fontDescriptorWithSize:");
      }
    }
  }
  return (id)objc_msgSend(a1, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v20, 0, 0, v19, a9, a10, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4 compatibleWithTraitCollection:(id)a5
{
  if (!a4 || (id)getUIContentSizeCategoryUnspecified[0]() == a4)
    return (id)objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:", a3, a5);
  CTFontDescriptorGetTextStyleSize();
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", a3, a5);
}

+ (id)systemFontOfSize:(double)a3 traits:(int)a4
{
  return UINewFont(0, *(uint64_t *)&a4, 0, 0, 1, 0, a3, 0.0);
}

+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6 roundSize:(BOOL)a7
{
  _BOOL4 v7;
  double result;
  double v10;
  double v11;

  v7 = a7;
  -[UIFont _scaledValueForValue:](+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", a4, a6), "_scaledValueForValue:", a3);
  v10 = round(result);
  if (v7)
    result = v10;
  if (result >= a5)
    v11 = a5;
  else
    v11 = result;
  if (a5 > 0.0)
    return v11;
  return result;
}

+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  return (UIFont *)__UIFontForTextStyle((const __CTFont *)style, (uint64_t)-[UITraitCollection preferredContentSizeCategory](traitCollection, "preferredContentSizeCategory"), -[UITraitCollection legibilityWeight](traitCollection, "legibilityWeight"), 0, 0);
}

- (double)_scaledValueForValue:(double)a3 useLanguageAwareScaling:(BOOL)a4
{
  _BOOL4 v4;
  const __CTFont *v7;
  const __CTFont *v8;
  int HasExuberatedLineHeight;
  uint64_t *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v17;

  v4 = a4;
  v7 = -[UIFont _textStyle](self, "_textStyle");
  if (v7)
  {
    v8 = v7;
    if (_scaledValueForValue_useLanguageAwareScaling__onceToken != -1)
      dispatch_once(&_scaledValueForValue_useLanguageAwareScaling__onceToken, &__block_literal_global_76);
    os_unfair_lock_lock_with_options();
    v17 = 0.0;
    HasExuberatedLineHeight = CTFontHasExuberatedLineHeight();
    v10 = &_scaledValueForValue_useLanguageAwareScaling____textStyleLanguageAwareBodyLeadingCache;
    if ((v4 & HasExuberatedLineHeight) == 0)
      v10 = &_scaledValueForValue_useLanguageAwareScaling____textStyleBodyLeadingCache;
    v11 = (id)*v10;
    v12 = (void *)objc_msgSend((id)*v10, "objectForKey:", v8);
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      v17 = v13;
    }
    else
    {
      if (-[UIFont _isTextStyleFont](self, "_isTextStyleFont") && v4 | HasExuberatedLineHeight ^ 1)
      {
        CTFontDescriptorGetTextStyleSize();
        v14 = 0.0;
      }
      else
      {
        -[__CTFont _bodyLeading](__UIFontForTextStyle(v8, 0, -1, 1, 0), "_bodyLeading");
        v17 = v14;
      }
      objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14), v8);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__UIFontTextStyleBodyLeadingCacheLock);
    if (v17 != 0.0)
    {
      -[UIFont _bodyLeading](self, "_bodyLeading", v17);
      return v15 * a3 / v17;
    }
  }
  return a3;
}

- (double)_bodyLeading
{
  double v3;

  -[UIFont lineHeight](self, "lineHeight");
  return v3 + CTFontGetLeading((CTFontRef)self);
}

+ (id)_preferredFontForTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5
{
  UIFontDescriptor *v7;
  double v8;
  double v9;
  uint64_t v10;

  if (a4 <= 0.0)
    return +[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", a3, a5);
  v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", a3, a5);
  -[UIFontDescriptor pointSize](v7, "pointSize");
  if (v8 >= a4)
    v9 = a4;
  else
    v9 = v8;
  if (a5)
    v10 = objc_msgSend(a5, "legibilityWeight");
  else
    v10 = -1;
  return +[UIFont _fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:](UIFont, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v7, 0, 0, v10, v9, 0.0, a4);
}

- (id)_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:(id)a3
{
  UIFontDescriptor *v5;
  uint64_t v6;
  NSString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t ContentSizeCategoryIndex;
  id v20;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v5 = -[UIFont fontDescriptor](self, "fontDescriptor");
  if (a3)
    v6 = objc_msgSend(a3, "legibilityWeight");
  else
    v6 = -1;
  v7 = -[UIFont textStyleForScaling](self, "textStyleForScaling");
  if (!v7)
  {
    if (!-[UIFont _isTextStyleFont](self, "_isTextStyleFont"))
    {
LABEL_13:
      v12 = 0;
LABEL_16:
      v7 = 0;
      goto LABEL_18;
    }
LABEL_10:
    -[UIFont _textStyle](self, "_textStyle");
    v14 = *MEMORY[0x1E0CA83E0];
    -[UIFontDescriptor objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CA83E0]);
    CTFontDescriptorGetTextStyleSize();
    v16 = v15;
    -[UIFont pointSize](self, "pointSize");
    if (v17 == v16)
    {
      v18 = -[UIFontDescriptor objectForKey:](v5, "objectForKey:", CFSTR("NSCTFontOpticalSizeAttribute"));
      if (!v7 && v18)
        goto LABEL_13;
    }
    else if (!v7)
    {
      goto LABEL_17;
    }
    v12 = -[UIFont isIBTextStyleFont](self, "isIBTextStyleFont");
    +[UIFont _normalizedContentSizeCategory:default:](UIFont, "_normalizedContentSizeCategory:default:", objc_msgSend(a3, "preferredContentSizeCategory"), 0);
    ContentSizeCategoryIndex = CTFontDescriptorGetContentSizeCategoryIndex();
    if (CTFontDescriptorGetContentSizeCategoryIndex() != (_DWORD)ContentSizeCategoryIndex)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ContentSizeCategoryIndex);
      CTFontDescriptorGetTextStyleSize();
      v23 = v22;
      v24 = (void *)-[NSDictionary mutableCopy](-[UIFontDescriptor fontAttributes](v5, "fontAttributes"), "mutableCopy");
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ContentSizeCategoryIndex), v14);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23), CFSTR("NSFontSizeAttribute"));
      objc_msgSend(v24, "removeObjectForKey:", *MEMORY[0x1E0CA8368]);
      v5 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v24);

      -[UIFont pointSizeForScaling](self, "pointSizeForScaling");
      v9 = v25;
      -[UIFont maximumPointSizeAfterScaling](self, "maximumPointSizeAfterScaling");
      v11 = v26;
      v7 = 0;
LABEL_24:
      v13 = 0.0;
      return +[UIFont _fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:](UIFont, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v5, v7, v12, v6, v13, v9, v11);
    }
    goto LABEL_16;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && -[UIFont _isTextStyleFont](self, "_isTextStyleFont"))
    goto LABEL_10;
  if (!objc_msgSend((id)objc_opt_class(), "_isSupportedDynamicFontTextStyle:", v7))
  {
LABEL_17:
    v12 = 0;
LABEL_18:
    if (v6 == -1)
      return self;
    if (!-[UIFont __isSystemFont](self, "__isSystemFont"))
      return self;
    v20 = -[UIFontDescriptor objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0CA8368]);
    if ((objc_msgSend(v20, "isEqual:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v6)) & 1) != 0)
      return self;
    -[UIFont pointSizeForScaling](self, "pointSizeForScaling");
    v9 = v27;
    -[UIFont maximumPointSizeAfterScaling](self, "maximumPointSizeAfterScaling");
    v11 = v28;
    goto LABEL_24;
  }
  -[UIFont pointSizeForScaling](self, "pointSizeForScaling");
  v9 = v8;
  -[UIFont maximumPointSizeAfterScaling](self, "maximumPointSizeAfterScaling");
  v11 = v10;
  v12 = -[UIFont isIBFontMetricsScaledFont](self, "isIBFontMetricsScaledFont");
  objc_msgSend((id)objc_opt_class(), "_pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:", v7, a3, v9, v11);
  return +[UIFont _fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:](UIFont, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v5, v7, v12, v6, v13, v9, v11);
}

- (UIFontDescriptor)fontDescriptor
{
  return (UIFontDescriptor *)CTFontCopyFontDescriptor((CTFontRef)self);
}

- (NSString)textStyleForScaling
{
  return *(NSString **)(__CTFontGetExtraData((const __CTFont *)self) + 32);
}

- (BOOL)isIBTextStyleFont
{
  return (*(_BYTE *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 2) != 0
      && *(_QWORD *)(__CTFontGetExtraData((const __CTFont *)self) + 32) == 0;
}

- (BOOL)__isSystemFont
{
  return *(_BYTE *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 1;
}

+ (id)_fontWithDescriptor:(id)a3 size:(double)a4 textStyleForScaling:(id)a5 pointSizeForScaling:(double)a6 maximumPointSizeAfterScaling:(double)a7 forIB:(BOOL)a8 legibilityWeight:(int64_t)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  _BOOL8 v18;
  const __CTFont *v19;
  uint64_t v20;
  void *v21;
  const __CTFont *v22;
  uint64_t v23;
  uint64_t ExtraData;
  char v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = a8;
  v15 = a3;
  if (a8)
  {
    v16 = 0;
LABEL_9:
    if (a9 != -1)
    {
      v20 = *MEMORY[0x1E0CA8368];
      v21 = (void *)objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CA8368]);
      if (!v21 || objc_msgSend(v21, "unsignedIntegerValue") != a9)
      {
        v27 = v20;
        v28[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a9);
        v15 = (id)objc_msgSend(v15, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
        if (!v15)
        {
          v26 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *__UIUncachedFontWithDescriptor(UIFontDescriptor *, CGFloat)"), CFSTR("UIFont.m"), 183, CFSTR("descriptor must not be nil!"));
          v15 = 0;
        }
      }
    }
    v22 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)v15, a4, 0);
    v19 = v22;
    if (!v10 && v22)
      objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "setObject:forKey:", v22, v16);
    goto LABEL_17;
  }
  if (a9 == -1)
    v18 = _AXSEnhanceTextLegibilityEnabled() != 0;
  else
    v18 = a9 == 1;
  v16 = +[_UIFontCacheKey newFontCacheKeyWithFontDescriptor:pointSize:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:textLegibility:](_UIFontCacheKey, "newFontCacheKeyWithFontDescriptor:pointSize:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:textLegibility:", v15, a5, v18, a4, a6, a7);
  v19 = (const __CTFont *)objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "retainedObjectForKey:", v16);
  if (!v19)
    goto LABEL_9;
LABEL_17:

  v23 = objc_msgSend(a5, "copy");
  *(_QWORD *)(__CTFontGetExtraData(v19) + 32) = v23;
  *(double *)(__CTFontGetExtraData(v19) + 40) = a6;
  *(double *)(__CTFontGetExtraData(v19) + 48) = a7;
  ExtraData = __CTFontGetExtraData(v19);
  if (v10)
    v25 = 2;
  else
    v25 = 0;
  *(_BYTE *)(ExtraData + 24) = *(_BYTE *)(ExtraData + 24) & 0xFD | v25;
  return v19;
}

+ (id)_sharedFontCache
{
  if (_sharedFontCache_onceToken != -1)
    dispatch_once(&_sharedFontCache_onceToken, &__block_literal_global_6);
  return (id)_sharedFontCache___sharedFontCache;
}

+ (BOOL)_isSupportedDynamicFontTextStyle:(id)a3
{
  if (dyld_program_sdk_at_least())
    return CTFontDescriptorCanCreateWithTextStyle();
  else
    return objc_msgSend((id)objc_msgSend(a1, "_supportedDynamicFontStyles"), "containsObject:", a3);
}

- (double)_scaledValueForValue:(double)a3
{
  double result;

  -[UIFont _scaledValueForValue:useLanguageAwareScaling:](self, "_scaledValueForValue:useLanguageAwareScaling:", 0, a3);
  return result;
}

+ (id)_preferredFontForTextStyle:(id)a3 weight:(double)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4), 0, 0, 0, 0.0, 0.0);
}

- (id)_fontScaledLikeTextStyle:(id)a3 maximumPointSize:(double)a4 compatibleWithTraitCollection:(id)a5 forIB:(BOOL)a6
{
  _BOOL8 v6;
  double v11;
  UIFontDescriptor *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v6 = a6;
  if ((dyld_program_sdk_at_least() & 1) == 0 && -[UIFont _isTextStyleFont](self, "_isTextStyleFont"))
  {
    -[UIFont maximumPointSizeAfterScaling](self, "maximumPointSizeAfterScaling");
    if (v11 <= 0.0)
      return (id)objc_msgSend((id)objc_opt_class(), "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", -[UIFont _textStyle](self, "_textStyle"), a5, a4);
    goto LABEL_6;
  }
  if (-[UIFont textStyleForScaling](self, "textStyleForScaling"))
  {
LABEL_6:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("A scaled font returned by UIFontMetrics should not be used to create another scaled font."), 0), "raise");
    return 0;
  }
  v13 = -[UIFont fontDescriptor](self, "fontDescriptor");
  v14 = (void *)objc_opt_class();
  -[UIFont pointSize](self, "pointSize");
  objc_msgSend(v14, "_pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:", a3, a5);
  v16 = v15;
  -[UIFont pointSize](self, "pointSize");
  v18 = v17;
  if (a5)
    v19 = objc_msgSend(a5, "legibilityWeight");
  else
    v19 = -1;
  return +[UIFont _fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:](UIFont, "_fontWithDescriptor:size:textStyleForScaling:pointSizeForScaling:maximumPointSizeAfterScaling:forIB:legibilityWeight:", v13, a3, v6, v19, v16, v18, a4);
}

+ (double)_pointSize:(double)a3 scaledLikeTextStyle:(id)a4 maximumPointSize:(double)a5 compatibleWithTraitCollection:(id)a6
{
  double result;

  objc_msgSend(a1, "_pointSize:scaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:roundSize:", a4, a6, 1, a3, a5);
  return result;
}

- (double)pointSizeForScaling
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 40);
}

- (double)maximumPointSizeAfterScaling
{
  return *(double *)(__CTFontGetExtraData((const __CTFont *)self) + 48);
}

- (BOOL)isIBFontMetricsScaledFont
{
  return (*(_BYTE *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 2) != 0
      && *(_QWORD *)(__CTFontGetExtraData((const __CTFont *)self) + 32) != 0;
}

+ (id)_sharedZeroPointFont
{
  if (_sharedZeroPointFont_once != -1)
    dispatch_once(&_sharedZeroPointFont_once, &__block_literal_global_5);
  return (id)_sharedZeroPointFont___zeroPointCTFont;
}

- (CGFloat)descender
{
  return -CTFontGetDescent((CTFontRef)self);
}

- (id)coveredCharacterSet
{
  CFCharacterSetRef v2;

  v2 = CTFontCopyCharacterSet((CTFontRef)self);
  return (id)(id)CFMakeCollectable(v2);
}

- (BOOL)_hasColorGlyphs
{
  return (-[UIFontDescriptor symbolicTraits](-[UIFont fontDescriptor](self, "fontDescriptor"), "symbolicTraits") >> 13) & 1;
}

- (id)bestMatchingFontForCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4 attributes:(id)a5 actualCoveredLength:(unint64_t *)a6
{
  UIFont *v7;
  double v8;
  UIFont *v9;
  UIFont *v10;

  v7 = self;
  v8 = MEMORY[0x18D790ECC](self, a2, 0.0);
  objc_msgSend(a5, "objectForKey:", NSLanguageAttributeName);
  v9 = (UIFont *)CTFontCreateForCharactersWithLanguage();
  MEMORY[0x18D790ECC](v8);
  if (v9 == v7)
  {
    CFRelease(v7);
  }
  else
  {
    v10 = v9;
    return v9;
  }
  return v7;
}

+ (double)_readableWidth
{
  double result;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;

  result = *(double *)&_readableWidth_cachedReadableWidth;
  if (*(double *)&_readableWidth_cachedReadableWidth == 0.0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __24__UIFont__readableWidth__block_invoke;
    v7 = &unk_1E2605A40;
    v8 = a1;
    v9 = a2;
    if (_readableWidth_onceToken != -1)
      dispatch_once(&_readableWidth_onceToken, &v4);
    objc_msgSend((id)objc_msgSend(a1, "preferredFontForTextStyle:", *MEMORY[0x1E0CA8620], v4, v5, v6, v7, v8, v9), "readableWidth");
    _readableWidth_cachedReadableWidth = *(_QWORD *)&result;
  }
  return result;
}

+ (UIFont)preferredFontForTextStyle:(UIFontTextStyle)style
{
  return (UIFont *)__UIFontForTextStyle((const __CTFont *)style, 0, -1, 0, 0);
}

- (double)readableWidth
{
  id AssociatedObject;
  double result;
  uint64_t v5;
  id v6;
  const __CTLine *v7;
  const __CTLine *v8;
  double TypographicBounds;
  const __CFString *v10;
  UIFont *v11;
  _BYTE __b[92];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  AssociatedObject = objc_getAssociatedObject(self, &readableWidth_readableWidthKey);
  if (AssociatedObject)
  {
    objc_msgSend(AssociatedObject, "doubleValue");
  }
  else
  {
    memset_pattern16(__b, aMmmmmmmm, 0x5CuLL);
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", __b, 46);
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v10 = CFSTR("NSFont");
    v11 = self;
    v7 = CTLineCreateWithAttributedString((CFAttributedStringRef)(id)objc_msgSend(v6, "initWithString:attributes:", v5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
    if (!v7)
      return 0.0;
    v8 = v7;
    TypographicBounds = CTLineGetTypographicBounds(v7, 0, 0, 0);
    CFRelease(v8);
    if (TypographicBounds > 0.0)
      objc_setAssociatedObject(self, &readableWidth_readableWidthKey, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", TypographicBounds), (void *)3);
    return TypographicBounds;
  }
  return result;
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:weight:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a4, a5, 0, a6, a7, 0.0, 0.0);
}

+ (UIFont)boldSystemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)objc_msgSend(a1, "systemFontOfSize:traits:", 2, fontSize);
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, 0, 0, *(_QWORD *)&a4, 0, 0, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", a3, 0, a4, 0, 0);
}

+ (CGFloat)systemFontSize
{
  return *(double *)&__UISystemFontSize;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGFloat)leading
{
  CGFloat result;

  if (dyld_program_sdk_at_least())
    -[UIFont _leading](self, "_leading");
  else
    -[UIFont lineHeight](self, "lineHeight");
  return result;
}

+ (UIFont)monospacedDigitSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  return (UIFont *)UINewFont(0, 0, (uint64_t)CFSTR("NSCTFontUIFontDesignDefault"), 0, 1, 1, fontSize, weight);
}

_UICache *__26__UIFont__sharedFontCache__block_invoke()
{
  _UICache *result;

  result = objc_alloc_init(_UICache);
  _sharedFontCache___sharedFontCache = (uint64_t)result;
  return result;
}

id __55__UIFont__scaledValueForValue_useLanguageAwareScaling___block_invoke()
{
  id result;

  _scaledValueForValue_useLanguageAwareScaling____textStyleBodyLeadingCache = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  _scaledValueForValue_useLanguageAwareScaling____textStyleLanguageAwareBodyLeadingCache = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  result = (id)+[UIFont _normalizedContentSizeCategory:default:](UIFont, "_normalizedContentSizeCategory:default:", 0, 1);
  _scaledValueForValue_useLanguageAwareScaling____defaultContentSizeCategory = (uint64_t)result;
  return result;
}

uint64_t __24__UIFont__readableWidth__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__UIFont__readableWidth__block_invoke_2;
  v4[3] = &unk_1E260BFD0;
  v5 = *(_OWORD *)(a1 + 32);
  v1 = getUIContentSizeCategoryDidChangeNotification[0]();
  __24__UIFont__readableWidth__block_invoke_2((uint64_t)v4, v1);
  v2 = getUIApplicationDidEnterBackgroundNotification[0]();
  return __24__UIFont__readableWidth__block_invoke_2((uint64_t)v4, v2);
}

uint64_t __24__UIFont__readableWidth__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("UIFont.m"), 807, CFSTR("Notification name symbol not found"));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", a2, 0, 0, &__block_literal_global_74);
}

+ (CGFloat)smallSystemFontSize
{
  return *(double *)&__UISmallSystemFontSize;
}

+ (id)defaultFontForTextStyle:(id)a3
{
  return __UIFontForTextStyle((const __CTFont *)a3, 0, -1, 1, 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)classFallbacksForKeyedArchiver
{
  return &unk_1E2631810;
}

+ (id)_lightSystemFontOfSize:(double)a3
{
  return UINewFont(0, 8, 0, 0, 1, 0, a3, 0.0);
}

- (NSString)familyName
{
  return (NSString *)(id)CTFontCopyFamilyName((CTFontRef)self);
}

- (void)applyToGraphicsContext:(id)a3
{
  CGContext *v4;
  CGFont *v5;
  CGFont *v6;
  CGFloat v7;
  CGAffineTransform v8;

  v4 = (CGContext *)objc_msgSend(a3, "CGContext");
  if (self)
    -[UIFont _textMatrixTransformForContext:](self, "_textMatrixTransformForContext:", 0);
  else
    memset(&v8, 0, sizeof(v8));
  CGContextSetTextMatrix(v4, &v8);
  v5 = CTFontCopyGraphicsFont((CTFontRef)self, 0);
  if (v5)
  {
    v6 = v5;
    CGContextSetFont(v4, v5);
    CFRelease(v6);
    -[UIFont pointSize](self, "pointSize");
    CGContextSetFontSize(v4, v7);
    CGContextSetFontRenderingStyle();
  }
  else
  {
    NSLog((NSString *)CFSTR("%s: CTFontCopyGraphicsFont returned NULL for font %p"), "-[UIFont(UIFont_AttributedStringDrawing) applyToGraphicsContext:]", self);
  }
}

- (CGAffineTransform)_textMatrixTransformForContext:(SEL)a3
{
  CGAffineTransform *result;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform v11;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CTFontGetMatrix(retstr, (CTFontRef)self);
  retstr->b = -retstr->b;
  retstr->d = -retstr->d;
  result = (CGAffineTransform *)-[UIFont isVertical](self, "isVertical");
  if ((_DWORD)result)
  {
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v11, &v9, &t2);
    v8 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  }
  return result;
}

- (void)getAdvancements:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
  CTFontGetUnsummedAdvancesForGlyphsAndStyle();
}

- (id)_kernOverride
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v6;
  UIFontDescriptor *v7;
  uint64_t v8;
  double v9;

  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont fontName](self, "fontName"), CFSTR("UIFontName"));
  v6 = -[UIFont isIBTextStyleFont](self, "isIBTextStyleFont");
  v7 = -[UIFont fontDescriptor](self, "fontDescriptor");
  if (v6)
  {
    v8 = -[UIFontDescriptor objectForKey:](v7, "objectForKey:", CFSTR("NSCTFontUIUsageAttribute"));
    if (!v8)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFont.m"), 1255, CFSTR("Expecting a text style, got nil!"));
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("UIIBTextStyle"));
    v9 = 0.0;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("UIFontDescriptor"));
    -[UIFont pointSize](self, "pointSize");
  }
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UIFontPointSize"), v9);
  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont textStyleForScaling](self, "textStyleForScaling"), CFSTR("UIFontTextStyleForScaling"));
  -[UIFont pointSizeForScaling](self, "pointSizeForScaling");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UIFontPointSizeForScaling"));
  -[UIFont maximumPointSizeAfterScaling](self, "maximumPointSizeAfterScaling");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UIFontMaximumPointSizeAfterScaling"));
  if (-[UIFont isIBFontMetricsScaledFont](self, "isIBFontMetricsScaledFont"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UIIBFontMetricsScaledFont"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[UIFont traits](self, "traits"), CFSTR("UIFontTraits"));
  objc_msgSend(a3, "encodeBool:forKey:", -[UIFont __isSystemFont](self, "__isSystemFont"), CFSTR("UISystemFont"));
  objc_msgSend(a3, "encodeObject:forKey:", -[UIFont fontName](self, "fontName"), CFSTR("NSName"));
  -[UIFont pointSize](self, "pointSize");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSSize"));
}

- (NSString)fontName
{
  CFStringRef v2;

  v2 = CTFontCopyPostScriptName((CTFontRef)self);
  return (NSString *)(id)CFMakeCollectable(v2);
}

- (int)traits
{
  int UIFontType;
  int result;

  UIFontType = CTFontGetUIFontType();
  result = 1;
  if (UIFontType > 133)
  {
    if ((UIFontType - 135) >= 4)
    {
      if (UIFontType == 134)
        return result;
      if (UIFontType == 140)
        return 4;
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
    }
    return 3;
  }
  if (UIFontType <= 101)
  {
    if (UIFontType == 3)
      return 2;
    if (UIFontType == 27)
      return result;
    if (UIFontType != 52)
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
    return 3;
  }
  switch(UIFontType)
  {
    case 'f':
      return 4;
    case 'g':
      result = 8;
      break;
    case 'h':
      result = 16;
      break;
    case 'j':
    case 'k':
    case 'l':
    case 'm':
      return 2;
    default:
      return CTFontGetSymbolicTraits((CTFontRef)self) & 3;
  }
  return result;
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5
{
  return UINewFont(0, 0, (uint64_t)a5, 0, 1, 0, a3, a4);
}

- (UIFont)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIFont;
  return -[UIFont init](&v3, sel_init);
}

- (void)getBoundingRects:(CGRect *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
  CTFontGetBoundingRectsForGlyphs((CTFontRef)self, kCTFontOrientationDefault, a4, a3, a5);
}

- (BOOL)isSystemFont
{
  return *(_BYTE *)(__CTFontGetExtraData((const __CTFont *)self) + 24) & 1;
}

- (id)_fontScaledByScaleFactor:(double)a3
{
  double v5;

  -[UIFont pointSize](self, "pointSize");
  return +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", -[UIFont fontDescriptor](self, "fontDescriptor"), round(v5 * a3 * 4.0) * 0.25);
}

void __30__UIFont__sharedZeroPointFont__block_invoke()
{
  MEMORY[0x18D790ECC](0.0);
  _sharedZeroPointFont___zeroPointCTFont = (uint64_t)CTFontCreateWithNameAndOptions(CFSTR("Helvetica"), 0.0, 0, 4uLL);
  JUMPOUT(0x18D790ECCLL);
}

+ (NSArray)fontNamesForFamilyName:(NSString *)familyName
{
  const __CTFontDescriptor *v3;
  CFArrayRef MatchingFontDescriptors;
  const void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!familyName)
    return 0;
  v7 = *MEMORY[0x1E0CA8300];
  v8[0] = familyName;
  v3 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v3, 0);
  CFRelease(v3);
  if (!MatchingFontDescriptors)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v5 = (const void *)CTFontDescriptorsCopyAttribute();
  CFRelease(MatchingFontDescriptors);
  return (NSArray *)(id)CFMakeCollectable(v5);
}

+ (id)_systemFontOfSize:(double)a3 width:(id)a4 traits:(int)a5
{
  return UINewFont(0, *(uint64_t *)&a5, 0, (uint64_t)a4, 1, 0, a3, 0.0);
}

+ (void)_evictAllItemsFromFontAndFontDescriptorCaches
{
  objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "removeAllObjects");
  NSLog((NSString *)CFSTR("Font cache cleared"));
}

+ (UIFont)fontWithMarkupDescription:(id)a3
{
  return -[UIFont initWithMarkupDescription:]([UIFont alloc], "initWithMarkupDescription:", a3);
}

+ (NSArray)familyNames
{
  CFArrayRef v2;

  v2 = CTFontManagerCopyAvailableFontFamilyNames();
  return (NSArray *)(id)CFMakeCollectable(v2);
}

+ (id)_systemFontsOfSize:(double)a3 traits:(int)a4
{
  uint64_t v4;
  void *v6;
  UIFont *v7;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = +[UIFont fontWithName:size:traits:](UIFont, "fontWithName:size:traits:", CFSTR("Helvetica"), v4, a3);
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  return v6;
}

- (id)_alternateSystemFonts
{
  void *v3;
  void *v4;
  double v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (-[UIFont __isSystemFont](self, "__isSystemFont"))
  {
    v4 = (void *)objc_opt_class();
    -[UIFont pointSize](self, "pointSize");
    v3 = (void *)objc_msgSend(v4, "_systemFontsOfSize:traits:", -[UIFont traits](self, "traits"), v5);
    if (objc_msgSend(v3, "containsObject:", self))
      objc_msgSend(v3, "removeObject:", self);
  }
  return v3;
}

+ (id)preferredFontForUsage:(id)a3
{
  return __UIFontForTextStyle((const __CTFont *)a3, 0, -1, 0, 0);
}

+ (id)preferredFontForUsage:(id)a3 contentSizeCategoryName:(id)a4
{
  return __UIFontForTextStyle((const __CTFont *)a3, (uint64_t)a4, -1, 0, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 variant:(int64_t)a4 maximumContentSizeCategory:(id)a5
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", a3, 0, a4, a5, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", a3, a4, a5, 0, 0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 compatibleWithTraitCollection:(id)a6
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:maximumContentSizeCategory:compatibleWithTraitCollection:", a3, a4, a5, 0, a6);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(double)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:variant:weight:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a4, a5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6), a7, a8, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 variant:(int64_t)a5 weight:(id)a6 maximumContentSizeCategory:(id)a7 compatibleWithTraitCollection:(id)a8 pointSize:(double)a9 pointSizeForScaling:(double)a10
{
  int v10;

  v10 = ((_DWORD)a5 << 7) & 0x10000;
  if ((a5 & 0x100) != 0)
    v10 = 0x8000;
  if (!a4)
    a4 = (id)((unint64_t)CFSTR("NSCTFontUIFontDesignRounded") & (a5 << 47 >> 63));
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a4, a6, v10 | (a5 >> 9) & 2, a7, a8, a9, a10);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5), 0, 0, 0, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 weight:(double)a5
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5), *(_QWORD *)&a4, 0, 0, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6), *(_QWORD *)&a4, 0, 0, 0.0, 0.0);
}

+ (id)_preferredFontForTextStyle:(id)a3 design:(id)a4 weight:(double)a5 maximumContentSizeCategory:(id)a6 compatibleWithTraitCollection:(id)a7
{
  return (id)objc_msgSend(a1, "_preferredFontForTextStyle:design:weight:symbolicTraits:maximumContentSizeCategory:compatibleWithTraitCollection:pointSize:pointSizeForScaling:", a3, a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5), 0, a6, a7, 0.0, 0.0);
}

+ (id)_supportedDynamicFontStyles
{
  if (_supportedDynamicFontStyles_onceToken != -1)
    dispatch_once(&_supportedDynamicFontStyles_onceToken, &__block_literal_global_15);
  return (id)_supportedDynamicFontStyles__fontStyles;
}

uint64_t __37__UIFont__supportedDynamicFontStyles__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("UICTFontTextStyleHeadline"), CFSTR("UICTFontTextStyleBody"), CFSTR("UICTFontTextStyleSubhead"), CFSTR("UICTFontTextStyleFootnote"), CFSTR("UICTFontTextStyleCaption1"), CFSTR("UICTFontTextStyleCaption2"), CFSTR("UICTFontTextStyleTitle1"), CFSTR("UICTFontTextStyleTitle2"), CFSTR("UICTFontTextStyleTitle3"), CFSTR("UICTFontTextStyleTitle4"), CFSTR("UICTFontTextStyleTitle5"), CFSTR("UICTFontTextStyleSubtitle"), CFSTR("UICTFontTextStyleSubtitle1"), CFSTR("UICTFontTextStyleSubtitle2"), CFSTR("UICTFontTextStyleSubtitle3"), CFSTR("UICTFontTextStyleCallout"), CFSTR("UICTFontTextStyleFootnote"),
             CFSTR("UICTFontTextStyleFootnote2"),
             CFSTR("UICTFontTextStyleHeadline1"),
             CFSTR("UICTFontTextStyleHeadline2"),
             CFSTR("UICTFontTextStyleHeadline3"),
             CFSTR("UICTFontTextStyleSubhead1"),
             CFSTR("UICTFontTextStyleSubhead2"),
             0);
  _supportedDynamicFontStyles__fontStyles = result;
  return result;
}

void __24__UIFont__readableWidth__block_invoke_3()
{
  _readableWidth_cachedReadableWidth = 0;
}

+ (id)ib_preferredFontForTextStyle:(id)a3
{
  const __CTFontDescriptor *v4;
  const __CTFont *v5;
  uint64_t ExtraData;

  if (!a3)
    return 0;
  +[UIFont _sharedFontCache](UIFont, "_sharedFontCache");
  v4 = (const __CTFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, 0, 0, -1);
  if (v4)
    v5 = CTFontCreateWithFontDescriptor(v4, 0.0, 0);
  else
    v5 = 0;
  ExtraData = __CTFontGetExtraData(v5);
  *(_BYTE *)(ExtraData + 24) |= 2u;
  return v5;
}

- (UIFont)initWithName:(id)a3 size:(double)a4
{
  UIFont *v5;

  if (!a3)
    return 0;
  v5 = (UIFont *)(id)objc_msgSend((id)objc_opt_class(), "fontWithName:size:traits:", a3, 0, a4);

  return v5;
}

- (UIFont)initWithFamilyName:(id)a3 traits:(int)a4 size:(double)a5
{
  UIFont *v6;

  if (!a3)
    return 0;
  v6 = (UIFont *)(id)objc_msgSend((id)objc_opt_class(), "fontWithName:size:traits:", a3, *(_QWORD *)&a4, a5);

  return v6;
}

- (UIFont)initWithMarkupDescription:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CTFont *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  const __CTFont *v16;
  UIFont *v17;
  UIFont *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = (const __CTFont *)CFSTR("Helvetica");
    v9 = *(_QWORD *)v22;
    v10 = 12.0;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v4);
      v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "componentsSeparatedByString:", CFSTR(":"), v19);
      if (objc_msgSend(v12, "count") != 2)
        break;
      v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "stringByStrippingLeadingAndTrailingWhitespaceAndQuotes");
      v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 1), "stringByStrippingLeadingAndTrailingWhitespaceAndQuotes");
      if (objc_msgSend(v13, "compare:options:", CFSTR("font-family"), 1))
      {
        if (objc_msgSend(v13, "compare:options:", CFSTR("font-weight"), 1))
        {
          if (objc_msgSend(v13, "compare:options:", CFSTR("font-style"), 1))
          {
            if (!objc_msgSend(v13, "compare:options:", CFSTR("font-size"), 1))
            {
              objc_msgSend(v14, "floatValue");
              v10 = v15;
            }
          }
          else
          {
            v7 = v7 | (objc_msgSend(v14, "compare:options:", CFSTR("italic"), 1) == 0);
          }
        }
        else if (objc_msgSend(v14, "compare:options:", CFSTR("bold"), 1))
        {
          v7 = v7;
        }
        else
        {
          v7 = v7 | 2;
        }
      }
      else
      {
        v8 = (const __CTFont *)v14;
      }
      if (v6 == ++v11)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
    v8 = (const __CTFont *)CFSTR("Helvetica");
    v10 = 12.0;
  }
  if (objc_msgSend((id)objc_opt_class(), "_isSupportedDynamicFontTextStyle:", v8))
  {

    v16 = __UIFontForTextStyle(v8, 0, -1, 0, 0);
  }
  else if (-[__CTFont isEqualToString:](v8, "isEqualToString:", CFSTR("system-ui")))
  {

    v16 = UINewFont(0, v7, 0, 0, 1, 0, v10, 0.0);
  }
  else
  {
    v16 = -[UIFont initWithFamilyName:traits:size:](v19, "initWithFamilyName:traits:size:", v8, v7, v10);
  }
  v17 = (UIFont *)v16;

  return v17;
}

- (id)familyNameForCSSFontFamilyValueForWebKit:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  NSString *v6;
  NSArray *v8;
  id v9;

  v3 = a3;
  v5 = -[UIFont _textStyle](self, "_textStyle");
  if (v5)
  {
    v6 = v5;
    if (-[UIFont _isTextStyleFont](self, "_isTextStyleFont"))
      return v6;
  }
  v6 = -[UIFont fontName](self, "fontName");
  if (-[NSString hasPrefix:](v6, "hasPrefix:", CFSTR(".")))
  {
    if (v3)
      return CFSTR("system-ui");
    return v6;
  }
  v8 = -[NSString componentsSeparatedByString:](v6, "componentsSeparatedByString:", CFSTR("-"));
  if (-[NSArray count](v8, "count") > 1)
  {
    v9 = -[NSArray lastObject](v8, "lastObject");
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Bold")) & 1) == 0
      && !objc_msgSend(v9, "isEqualToString:", CFSTR("Italic")))
    {
      return v6;
    }
  }
  return -[UIFont familyName](self, "familyName");
}

- (id)markupDescriptionForWebKit:(BOOL)a3 pointSize:(float)a4 sizeUnit:(id)a5
{
  _BOOL8 v7;
  char v9;
  void *v10;
  id v11;
  const __CFString *v12;
  const __CFString *v13;

  v7 = a3;
  v9 = -[UIFont traits](self, "traits");
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = -[UIFont familyNameForCSSFontFamilyValueForWebKit:](self, "familyNameForCSSFontFamilyValueForWebKit:", v7);
  v12 = CFSTR("bold");
  v13 = CFSTR("normal");
  if ((v9 & 2) == 0)
    v12 = CFSTR("normal");
  if ((v9 & 1) != 0)
    v13 = CFSTR("italic");
  return (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("font-family: \"%@\"; font-weight: %@; font-style: %@; font-size: %.2f%@"),
               v11,
               v12,
               v13,
               a4,
               a5);
}

- (id)markupDescription
{
  double v3;

  -[UIFont pointSize](self, "pointSize");
  *(float *)&v3 = v3;
  return -[UIFont markupDescriptionForWebKit:pointSize:sizeUnit:](self, "markupDescriptionForWebKit:pointSize:sizeUnit:", 1, CFSTR("pt"), v3);
}

- (id)htmlMarkupDescription
{
  double v3;

  if ((dyld_program_sdk_at_least() & 1) == 0)
    return -[UIFont markupDescription](self, "markupDescription");
  -[UIFont pointSize](self, "pointSize");
  *(float *)&v3 = v3;
  return -[UIFont markupDescriptionForWebKit:pointSize:sizeUnit:](self, "markupDescriptionForWebKit:pointSize:sizeUnit:", 0, CFSTR("px"), v3);
}

+ (id)_opticalSystemFontOfSize:(double)a3
{
  return UINewFont(0, 0, 0, 0, 1, 0, a3, 0.0);
}

+ (id)_opticalBoldSystemFontOfSize:(double)a3
{
  return UINewFont(0, 2, 0, 0, 1, 0, a3, 0.0);
}

+ (UIFont)italicSystemFontOfSize:(CGFloat)fontSize
{
  return (UIFont *)objc_msgSend(a1, "systemFontOfSize:traits:", 1, fontSize);
}

+ (id)_thinSystemFontOfSize:(double)a3
{
  return UINewFont(0, 4, 0, 0, 1, 0, a3, 0.0);
}

+ (id)_ultraLightSystemFontOfSize:(double)a3
{
  return UINewFont(0, 16, 0, 0, 1, 0, a3, 0.0);
}

+ (UIFont)monospacedSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight
{
  return (UIFont *)UINewFont(0, 0, (uint64_t)CFSTR("NSCTFontUIFontDesignMonospaced"), 0, 1, 0, fontSize, weight);
}

+ (void)_setLabelFontSize:(double)a3
{
  __UILabelFontSize = *(_QWORD *)&a3;
}

+ (CGFloat)buttonFontSize
{
  return *(double *)&__UIButtonFontSize;
}

+ (void)_setButtonFontSize:(double)a3
{
  __UIButtonFontSize = *(_QWORD *)&a3;
}

+ (void)_setSmallSystemFontSize:(double)a3
{
  __UISmallSystemFontSize = *(_QWORD *)&a3;
}

+ (void)_setSystemFontSize:(double)a3
{
  __UISystemFontSize = *(_QWORD *)&a3;
}

- (BOOL)_isUIFont
{
  return 1;
}

+ (id)_fontWithName:(id)a3 size:(double)a4
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR(".")))
    return (id)objc_msgSend(a1, "fontWithName:size:traits:", a3, 4096, a4);
  else
    return (id)objc_msgSend(a1, "fontWithName:size:", a3, a4);
}

- (unint64_t)mostCompatibleStringEncoding
{
  CFStringEncoding StringEncoding;

  StringEncoding = CTFontGetStringEncoding((CTFontRef)self);
  if (StringEncoding == 256)
    return 30;
  else
    return CFStringConvertEncodingToNSStringEncoding(StringEncoding);
}

- (BOOL)_isHiraginoFont
{
  return 0;
}

- (double)_baseLineHeightForFont:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  -[UIFont _defaultLineHeightForUILayout](self, "_defaultLineHeightForUILayout");
  v6 = v5;
  v7 = 0.0;
  if (v3)
    -[UIFont _leading](self, "_leading", 0.0);
  return v6 + v7;
}

- (double)_ascenderDeltaForBehavior:(int64_t)a3
{
  return 0.0;
}

- (BOOL)isFixedPitch
{
  return (CTFontGetSymbolicTraits((CTFontRef)self) >> 10) & 1;
}

- (id)description
{
  void *v3;
  id v4;
  double v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)UIFont;
  v4 = -[UIFont description](&v7, sel_description);
  -[UIFont pointSize](self, "pointSize");
  *(float *)&v5 = v5;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, -[UIFont markupDescriptionForWebKit:pointSize:sizeUnit:](self, "markupDescriptionForWebKit:pointSize:sizeUnit:", 0, CFSTR("pt"), v5));
}

- (unsigned)glyphWithName:(id)a3
{
  return CTFontGetGlyphWithName((CTFontRef)self, (CFStringRef)a3);
}

- (void)setInContext:(CGContext *)a3
{
  -[UIFont applyToGraphicsContext:](self, "applyToGraphicsContext:", -[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", a3), "graphicsContextForApplicationFrameworkContext:", 1));
}

- (void)getVerticalOriginTranslations:(CGSize *)a3 forCGGlyphs:(const unsigned __int16 *)a4 count:(unint64_t)a5
{
  CGFontRef v8;
  unsigned int UnitsPerEm;
  CGSize *v10;
  float64x2_t v11;
  float64x2_t v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v8 = CTFontCopyGraphicsFont((CTFontRef)self, 0);
  memset(&v16, 0, sizeof(v16));
  if (self)
    -[UIFont _textMatrixTransformForContext:](self, "_textMatrixTransformForContext:", 0);
  UnitsPerEm = CTFontGetUnitsPerEm((CTFontRef)self);
  CGAffineTransformMakeScale(&t2, 1.0 / (double)UnitsPerEm, 1.0 / (double)UnitsPerEm);
  v13 = v16;
  CGAffineTransformConcat(&v15, &v13, &t2);
  v16 = v15;
  if (CGFontGetGlyphVerticalOffsets())
  {
    if ((uint64_t)a5 >= 1)
    {
      v10 = &a3[a5];
      v11 = *(float64x2_t *)&v16.a;
      v12 = *(float64x2_t *)&v16.c;
      do
      {
        *(float64x2_t *)a3 = vmlaq_n_f64(vmulq_n_f64(v12, a3->height), v11, a3->width);
        ++a3;
      }
      while (a3 < v10);
    }
  }
  else
  {
    bzero(a3, 16 * a5);
  }
  CFRelease(v8);
}

- (CGFont)_backingCGSFont
{
  return CTFontCopyGraphicsFont((CTFontRef)self, 0);
}

- (double)underlinePosition
{
  double UnderlinePosition;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  UnderlinePosition = CTFontGetUnderlinePosition((CTFontRef)self);
  if (-[UIFont isVertical](self, "isVertical"))
  {
    -[UIFont ascender](self, "ascender");
    v5 = v4;
    -[UIFont descender](self, "descender");
    v7 = v6;
    if (v5 > -UnderlinePosition)
    {
      if (v5 >= -v6)
      {
        -[UIFont underlineThickness](self, "underlineThickness");
        return v7 + v8;
      }
      else
      {
        return -v5;
      }
    }
  }
  return UnderlinePosition;
}

- (CGSize)advancementForGlyph:(unsigned __int16)a3
{
  double v3;
  double v4;
  CGSize result;

  if (-[UIFont numberOfGlyphs](self, "numberOfGlyphs") <= a3)
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    CTFontGetTransformedAdvancesForGlyphsAndStyle();
    v4 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)hyphenGlyphForLocale:(id)a3
{
  CGGlyph glyphs;
  UniChar characters;

  characters = 8208;
  glyphs = 0;
  if (!CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1))
  {
    characters = 45;
    if (!CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1))
      return 0;
  }
  return glyphs;
}

- (unint64_t)getCaretPositions:(double *)a3 forGlyph:(unsigned int)a4 maximumLength:(unint64_t)a5
{
  unint64_t v9;

  v9 = -[UIFont numberOfGlyphs](self, "numberOfGlyphs");
  if (a4 && v9 > a4)
    return CTFontGetLigatureCaretPositions((CTFontRef)self, a4, a3, a5);
  else
    return 0;
}

- (unsigned)_defaultGlyphForChar:(unsigned __int16)a3
{
  CGGlyph glyphs;
  UniChar characters;

  characters = a3;
  glyphs = 0;
  if (CTFontGetGlyphsForCharacters((CTFontRef)self, &characters, &glyphs, 1))
    return glyphs;
  else
    return 0;
}

- (id)lastResortFont
{
  -[UIFont pointSize](self, "pointSize");
  return +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("LastResort"));
}

@end
