@implementation TUIFontSpec

+ (BOOL)determineUseFontFallbackFromLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;

  v3 = a3;
  v4 = v3;
  if (qword_2CBA30 == -1)
  {
    if (!v3)
    {
LABEL_6:
      LOBYTE(v7) = 1;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_2CBA30, &stru_242FE8);
    if (!v4)
      goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSLocaleLanguageCode));

  if (!v6)
    goto LABEL_6;
  v7 = objc_msgSend((id)qword_2CBA28, "containsObject:", v6) ^ 1;

LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("TUIForceFallbackFont"));

  return v9 | v7;
}

+ (double)_weightFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;

  v3 = qword_2CBA40;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_2CBA40, &stru_243008);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CBA38, "objectForKeyedSubscript:", v5))) != 0)
  {
    v7 = v6;
    objc_msgSend(v6, "floatValue");
    v9 = v8;

  }
  else
  {
    v9 = UIFontWeightRegular;
  }

  return v9;
}

+ (TUIFontSpec)fontSpecWithPostscriptName:(id)a3 size:(double)a4
{
  id v6;
  TUIFontSpec *v7;
  _BOOL4 v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  id *v15;
  void *v16;
  double v17;
  UIFontWeight v18;
  NSString *v19;
  NSString *v20;
  NSString *postscriptName;
  uint64_t v22;
  NSString *fontDesignTrait;
  NSString *v24;
  uint64_t v26;

  v6 = a3;
  v7 = objc_alloc_init(TUIFontSpec);
  v26 = 0x7FF8000000000000;
  v8 = sub_15F7C4();
  v9 = sub_15F4DC(v6, &v26, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v6;
  v13 = v12;

  v14 = CFSTR("System-");
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR("System-")) & 1) != 0)
  {
    v15 = (id *)&kCTFontUIFontDesignDefault;
  }
  else
  {
    v14 = CFSTR("SystemSerif-");
    if ((objc_msgSend(v13, "hasPrefix:", CFSTR("SystemSerif-")) & 1) != 0)
    {
      v15 = (id *)&kCTFontUIFontDesignSerif;
    }
    else
    {
      v14 = CFSTR("SystemRounded-");
      if (!objc_msgSend(v13, "hasPrefix:", CFSTR("SystemRounded-")))
      {
        v19 = 0;
        v18 = UIFontWeightRegular;
        goto LABEL_11;
      }
      v15 = (id *)&kCTFontUIFontDesignRounded;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", -[__CFString length](v14, "length")));
  objc_msgSend(a1, "_weightFromString:", v16);
  v18 = v17;

  v19 = (NSString *)*v15;
  v13 = 0;
LABEL_11:
  v20 = (NSString *)objc_msgSend(v13, "copy");
  postscriptName = v7->_postscriptName;
  v7->_postscriptName = v20;

  v7->_pointSize = a4;
  v22 = v26;
  v7->_leading = 0.0;
  v7->_weight = v18;
  *(_QWORD *)&v7->_tracking = v22;
  fontDesignTrait = v7->_fontDesignTrait;
  v7->_fontDesignTrait = v19;
  v24 = v19;

  *(_BYTE *)&v7->_specified |= 3u;
  return v7;
}

- (TUIFontSpec)init
{
  TUIFontSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIFontSpec;
  result = -[TUIFontSpec init](&v3, "init");
  if (result)
  {
    result->_weight = UIFontWeightRegular;
    result->_tracking = NAN;
    *(_OWORD *)&result->_scale = xmmword_22FC80;
    *(_BYTE *)&result->_specified = 0;
  }
  return result;
}

- (TUIFontSpec)initWithOther:(id)a3
{
  id *v4;
  TUIFontSpec *v5;
  TUIFontSpec *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIFontSpec;
  v5 = -[TUIFontSpec init](&v8, "init");
  v6 = v5;
  if (v4 && v5)
  {
    objc_storeStrong((id *)&v5->_postscriptName, v4[10]);
    *(_QWORD *)&v6->_pointSize = v4[8];
    *(_QWORD *)&v6->_tracking = v4[16];
    *(_QWORD *)&v6->_leading = v4[6];
    *(_QWORD *)&v6->_additionalLeading = v4[7];
    v6->_caps = (unint64_t)v4[14];
    *(_QWORD *)&v6->_weight = v4[15];
    *((_BYTE *)&v6->_specified + 1) = *((_BYTE *)v4 + 73);
    objc_storeStrong((id *)&v6->_foregroundColor, v4[17]);
    objc_storeStrong((id *)&v6->_fontDesignTrait, v4[11]);
    objc_storeStrong((id *)&v6->_fontFamilyName, v4[12]);
    objc_storeStrong((id *)&v6->_textStyle, v4[13]);
    *(_QWORD *)&v6->_maxPointSize = v4[4];
    objc_storeStrong((id *)&v6->_maxContentSize, v4[2]);
    *(_QWORD *)&v6->_minPointSize = v4[3];
    objc_storeStrong((id *)&v6->_minContentSize, v4[1]);
    *(_QWORD *)&v6->_scale = v4[5];
    *(_BYTE *)&v6->_specified = *((_BYTE *)v4 + 72);
  }

  return v6;
}

- (TUIFontSpec)fontSpecWithScale:(double)a3
{
  TUIFontSpec *v3;
  TUIFontSpec *v4;

  v3 = self;
  if (a3 != 1.0 && a3 != 0.0)
  {
    v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", v3);

    v4->_pointSize = v4->_pointSize * a3;
    *(float64x2_t *)&v4->_scale = vmulq_n_f64(*(float64x2_t *)&v4->_scale, a3);
    v3 = v4;
  }
  return v3;
}

- (id)mappedSpecIfNeededWithEnvironment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "useFontFallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec _mappedSpec:traitCollection:](self, "_mappedSpec:traitCollection:", v5, v6));
  return v7;
}

- (id)mappedSpecIfNeededWithTraitCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[TUIFontSpec _mappedSpec:traitCollection:](self, "_mappedSpec:traitCollection:", sub_15F7C4(), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)_mappedSpec:(BOOL)a3 traitCollection:(id)a4
{
  _BOOL4 v4;
  id v6;
  TUIFontSpec *v7;
  __CFString *v8;
  void *v9;
  TUIFontSpec *v10;
  NSString *postscriptName;
  void *v12;
  void *v13;
  double v14;
  id *v15;
  NSString *v16;
  void *v17;
  void *v18;
  double v19;
  NSString *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double tracking;

  v4 = a3;
  v6 = a4;
  v7 = self;
  tracking = v7->_tracking;
  v8 = sub_15F4DC(v7->_postscriptName, &tracking, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", v7);

    if (objc_msgSend(v9, "hasPrefix:", CFSTR("System-")))
    {
      postscriptName = v10->_postscriptName;
      v10->_postscriptName = 0;

      v12 = (void *)objc_opt_class(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("System-"), "length")));
      objc_msgSend(v12, "_weightFromString:", v13);
      v10->_weight = v14;

      v15 = (id *)&UIFontSystemFontDesignDefault;
    }
    else if (objc_msgSend(v9, "hasPrefix:", CFSTR("SystemSerif-")))
    {
      v16 = v10->_postscriptName;
      v10->_postscriptName = 0;

      v17 = (void *)objc_opt_class(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("SystemSerif-"), "length")));
      objc_msgSend(v17, "_weightFromString:", v18);
      v10->_weight = v19;

      v15 = (id *)&UIFontSystemFontDesignSerif;
    }
    else
    {
      if (!objc_msgSend(v9, "hasPrefix:", CFSTR("SystemRounded-")))
      {
        objc_storeStrong((id *)&v10->_postscriptName, v9);
        goto LABEL_13;
      }
      v20 = v10->_postscriptName;
      v10->_postscriptName = 0;

      v21 = (void *)objc_opt_class(v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("SystemRounded-"), "length")));
      objc_msgSend(v21, "_weightFromString:", v22);
      v10->_weight = v23;

      v15 = (id *)&UIFontSystemFontDesignRounded;
    }
    objc_storeStrong((id *)&v10->_fontDesignTrait, *v15);
    *(_BYTE *)&v10->_specified |= 1u;
LABEL_13:
    v10->_tracking = tracking;
    goto LABEL_14;
  }
  if (v4 && -[NSString isEqualToString:](v7->_fontDesignTrait, "isEqualToString:", UIFontSystemFontDesignSerif))
  {
    v10 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", v7);

    objc_storeStrong((id *)&v10->_fontDesignTrait, UIFontSystemFontDesignDefault);
  }
  else
  {
    v10 = v7;
  }
LABEL_14:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec _resolvedFontSpecWithTraitCollection:](v10, "_resolvedFontSpecWithTraitCollection:", v6));

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_postscriptName, "hash") ^ (unint64_t)self->_pointSize ^ (unint64_t)self->_tracking ^ (unint64_t)self->_leading ^ (unint64_t)self->_additionalLeading ^ self->_caps ^ (unint64_t)self->_weight;
  v4 = *((unsigned __int8 *)&self->_specified + 1);
  v5 = v4 ^ (unint64_t)-[UIColor hash](self->_foregroundColor, "hash");
  v6 = v5 ^ -[NSString hash](self->_fontFamilyName, "hash");
  v7 = v6 ^ -[NSString hash](self->_maxContentSize, "hash");
  v8 = v7 ^ -[NSString hash](self->_fontDesignTrait, "hash");
  return v3 ^ v8 ^ -[NSString hash](self->_textStyle, "hash") ^ (unint64_t)self->_minPointSize ^ (unint64_t)self->_maxPointSize ^ (unint64_t)(self->_scale * 1000.0);
}

- (double)pointSize
{
  return self->_pointSize;
}

- (double)leading
{
  return self->_leading;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TUIFontSpec *v7;
  TUIFontSpec *v8;
  NSString *postscriptName;
  UIColor *foregroundColor;
  NSString *textStyle;
  NSString *minContentSize;
  NSString *maxContentSize;
  NSString *fontFamilyName;
  NSString *fontDesignTrait;
  unsigned __int8 v16;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7 == self)
    goto LABEL_32;
  if (!v7
    || self->_specified != v7->_specified
    || (postscriptName = self->_postscriptName, postscriptName != v8->_postscriptName)
    && !-[NSString isEqualToString:](postscriptName, "isEqualToString:")
    || self->_pointSize != v8->_pointSize
    || !TUICGFloatIsEqualFloatOrBothNaN(self->_tracking, v8->_tracking)
    || !TUICGFloatIsEqualFloatOrBothNaN(self->_leading, v8->_leading)
    || self->_additionalLeading != v8->_additionalLeading
    || self->_caps != v8->_caps
    || self->_weight != v8->_weight
    || *((unsigned __int8 *)&self->_specified + 1) != *((unsigned __int8 *)&v8->_specified + 1)
    || (foregroundColor = self->_foregroundColor, foregroundColor != v8->_foregroundColor)
    && !-[UIColor isEqual:](foregroundColor, "isEqual:")
    || self->_scale != v8->_scale
    || self->_minPointSize != v8->_minPointSize
    || self->_maxPointSize != v8->_maxPointSize
    || (textStyle = self->_textStyle, textStyle != v8->_textStyle)
    && !-[NSString isEqualToString:](textStyle, "isEqualToString:")
    || (minContentSize = self->_minContentSize, minContentSize != v8->_minContentSize)
    && !-[NSString isEqualToString:](minContentSize, "isEqualToString:")
    || (maxContentSize = self->_maxContentSize, maxContentSize != v8->_maxContentSize)
    && !-[NSString isEqualToString:](maxContentSize, "isEqualToString:")
    || (fontFamilyName = self->_fontFamilyName, fontFamilyName != v8->_fontFamilyName)
    && !-[NSString isEqualToString:](fontFamilyName, "isEqualToString:"))
  {
    v16 = 0;
    goto LABEL_33;
  }
  fontDesignTrait = self->_fontDesignTrait;
  if (fontDesignTrait == v8->_fontDesignTrait)
  {
LABEL_32:
    v16 = 1;
    goto LABEL_33;
  }
  v16 = -[NSString isEqualToString:](fontDesignTrait, "isEqualToString:");
LABEL_33:

  return v16;
}

+ (id)attributedStringWith:(id)a3 attributes:(id)a4
{
  return _objc_msgSend(a4, "attributedStringWithText:", a3);
}

- (id)font
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double pointSize;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CFStringRef v19;
  const __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec fontAttributes](self, "fontAttributes"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, self->_pointSize));

    if (!v5)
      goto LABEL_14;
  }
  else
  {
    if (*((_BYTE *)&self->_specified + 1))
    {
      v6 = objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", self->_pointSize, self->_weight));
    }
    else
    {
      pointSize = self->_pointSize;
      if (self->_postscriptName)
        v6 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", pointSize));
      else
        v6 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", pointSize, self->_weight));
    }
    v5 = (void *)v6;
    if (!v6)
      goto LABEL_14;
  }
  if (self->_caps == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptor"));
    v21[0] = kCTFontFeatureTypeIdentifierKey;
    v21[1] = kCTFontFeatureSelectorIdentifierKey;
    v22[0] = &off_2542D0;
    v22[1] = &off_2542D0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    v23[0] = v9;
    v19 = kCTFontOpenTypeFeatureTag;
    v20 = CFSTR("smcp");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v23[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontAttributes"));
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, UIFontDescriptorFeatureSettingsAttribute);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v14, self->_pointSize));
    v16 = v15;
    if (v15)
    {
      v17 = v15;

      v5 = v17;
    }

  }
LABEL_14:

  return v5;
}

- (id)attributesForAttributedString
{
  return -[TUIFontSpec attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:](self, "attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:", 0, 0, 0, NAN);
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4
{
  return -[TUIFontSpec attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:](self, "attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:", a3, a4, 0, NAN);
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5
{
  return -[TUIFontSpec attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:](self, "attributesForAttributedStringCentered:truncated:ignoreLeading:lineSpacing:", a3, a4, a5, NAN);
}

- (id)attributesForAttributedStringCentered:(BOOL)a3 truncated:(BOOL)a4 ignoreLeading:(BOOL)a5 lineSpacing:(double)a6
{
  _BOOL4 v8;
  _BOOL4 v9;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  _TUIFontAttributes *v23;
  _QWORD v25[2];
  _QWORD v26[2];

  v8 = a4;
  v9 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec font](self, "font"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v13 = objc_msgSend(v12, "mutableCopy");

    -[TUIFontSpec leading](self, "leading");
    if (!a5)
    {
      v15 = v14;
      if (v14 != 0.0)
      {
        objc_msgSend(v13, "setMinimumLineHeight:", v14);
        objc_msgSend(v13, "setMaximumLineHeight:", v15);
      }
    }
    if (v9)
      objc_msgSend(v13, "setAlignment:", 1);
    if (v8)
      objc_msgSend(v13, "setLineBreakMode:", 4);
    objc_msgSend(v13, "setLineSpacing:", a6);
    v26[0] = v11;
    v25[0] = NSFontAttributeName;
    v25[1] = NSParagraphStyleAttributeName;
    v16 = objc_msgSend(v13, "copy");
    v26[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec foregroundColor](self, "foregroundColor"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFontSpec foregroundColor](self, "foregroundColor"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, NSForegroundColorAttributeName);

    }
    v21 = self->_tracking * self->_pointSize / 1000.0;
    *(float *)&v21 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, NSKernAttributeName);

  }
  else
  {
    v18 = 0;
  }
  v23 = -[_TUIFontAttributes initWithAttributes:caps:]([_TUIFontAttributes alloc], "initWithAttributes:caps:", v18, self->_caps);

  return v23;
}

+ (id)defaultFontSpec
{
  return objc_alloc_init(TUIFontSpec);
}

- (TUIFontSpec)fontSpecWithFamily:(id)a3
{
  NSString *v4;
  TUIFontSpec *v5;
  NSString *postscriptName;
  NSString *fontFamilyName;
  NSString *v8;
  NSString *fontDesignTrait;

  v4 = (NSString *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  postscriptName = v5->_postscriptName;
  v5->_postscriptName = 0;

  fontFamilyName = v5->_fontFamilyName;
  v5->_fontFamilyName = v4;
  v8 = v4;

  fontDesignTrait = v5->_fontDesignTrait;
  v5->_fontDesignTrait = 0;

  return v5;
}

- (TUIFontSpec)fontSpecWithDesign:(id)a3
{
  NSString *v4;
  TUIFontSpec *v5;
  NSString *postscriptName;
  NSString *fontFamilyName;
  NSString *fontDesignTrait;

  v4 = (NSString *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  postscriptName = v5->_postscriptName;
  v5->_postscriptName = 0;

  fontFamilyName = v5->_fontFamilyName;
  v5->_fontFamilyName = 0;

  fontDesignTrait = v5->_fontDesignTrait;
  v5->_fontDesignTrait = v4;

  return v5;
}

- (TUIFontSpec)fontSpecWithPointSize:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_pointSize = a3;
  *(_BYTE *)&v4->_specified |= 2u;
  return v4;
}

- (TUIFontSpec)fontSpecWithTextStyle:(id)a3
{
  NSString *v4;
  TUIFontSpec *v5;
  NSString *textStyle;

  v4 = (NSString *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  textStyle = v5->_textStyle;
  v5->_textStyle = v4;

  *(_BYTE *)&v5->_specified |= 2u;
  return v5;
}

- (TUIFontSpec)fontSpecWithMinContentSize:(id)a3
{
  NSString *v4;
  TUIFontSpec *v5;
  NSString *minContentSize;

  v4 = (NSString *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  minContentSize = v5->_minContentSize;
  v5->_minContentSize = v4;

  *(_BYTE *)&v5->_specified |= 2u;
  return v5;
}

- (TUIFontSpec)fontSpecWithMinPointSize:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_minPointSize = a3;
  *(_BYTE *)&v4->_specified |= 2u;
  return v4;
}

- (TUIFontSpec)fontSpecWithMaxContentSize:(id)a3
{
  NSString *v4;
  TUIFontSpec *v5;
  NSString *maxContentSize;

  v4 = (NSString *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  maxContentSize = v5->_maxContentSize;
  v5->_maxContentSize = v4;

  *(_BYTE *)&v5->_specified |= 2u;
  return v5;
}

- (TUIFontSpec)fontSpecWithMaxPointSize:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_maxPointSize = a3;
  *(_BYTE *)&v4->_specified |= 2u;
  return v4;
}

- (TUIFontSpec)fontSpecWithLeading:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_leading = a3;
  return v4;
}

- (TUIFontSpec)fontSpecWithAdditionalLeading:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_additionalLeading = a3;
  return v4;
}

- (TUIFontSpec)fontSpecWithWeight:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_weight = a3;
  *(_BYTE *)&v4->_specified |= 1u;
  return v4;
}

- (TUIFontSpec)fontSpecWithCaps:(unint64_t)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_caps = a3;
  return v4;
}

- (TUIFontSpec)fontSpecWithColor:(id)a3
{
  UIColor *v4;
  TUIFontSpec *v5;
  UIColor *foregroundColor;

  v4 = (UIColor *)a3;
  v5 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  foregroundColor = v5->_foregroundColor;
  v5->_foregroundColor = v4;

  return v5;
}

- (TUIFontSpec)fontSpecWithTracking:(double)a3
{
  TUIFontSpec *v4;

  v4 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
  v4->_tracking = a3;
  return v4;
}

- (TUIFontSpec)fontSpecWithMonospacedDigits:(BOOL)a3
{
  TUIFontSpec *v3;

  if (*((_BYTE *)&self->_specified + 1) == a3)
  {
    v3 = self;
  }
  else
  {
    v3 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", self);
    *((_BYTE *)&v3->_specified + 1) = a3;
    *(_BYTE *)&v3->_specified |= 4u;
  }
  return v3;
}

- (NSDictionary)fontAttributes
{
  NSMutableDictionary *v4;
  NSString **p_fontDesignTrait;
  NSMutableDictionary *v6;
  void *v7;
  NSString *fontDesignTrait;
  CFStringRef v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  void *v15;

  if (self->_postscriptName)
    return (NSDictionary *)0;
  v4 = objc_opt_new(NSMutableDictionary);
  if ((*(_BYTE *)&self->_specified & 1) == 0)
  {
    p_fontDesignTrait = &self->_fontDesignTrait;
    if (!self->_fontDesignTrait)
    {
      v6 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v6 = objc_opt_new(NSMutableDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_weight));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, kCTFontWeightTrait);

  p_fontDesignTrait = &self->_fontDesignTrait;
  fontDesignTrait = self->_fontDesignTrait;
  if (fontDesignTrait)
  {
    if (v6)
    {
LABEL_9:
      v9 = (CFStringRef)kCTFontUIFontDesignTrait;
      v10 = v6;
LABEL_12:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", fontDesignTrait, v9);
      goto LABEL_13;
    }
LABEL_8:
    v6 = objc_opt_new(NSMutableDictionary);
    fontDesignTrait = *p_fontDesignTrait;
    goto LABEL_9;
  }
LABEL_10:
  fontDesignTrait = self->_fontFamilyName;
  if (fontDesignTrait)
  {
    v9 = kCTFontFamilyNameAttribute;
    v10 = v4;
    goto LABEL_12;
  }
LABEL_13:
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, kCTFontTraitsAttribute);
  if (*((_BYTE *)&self->_specified + 1))
  {
    if ((*(_BYTE *)&self->_specified & 4) != 0)
    {
      v13[0] = UIFontFeatureTypeIdentifierKey;
      v13[1] = UIFontFeatureSelectorIdentifierKey;
      v14[0] = &off_2542E8;
      v14[1] = &off_254300;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
      v15 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, UIFontDescriptorFeatureSettingsAttribute);

    }
  }

  return (NSDictionary *)v4;
}

- (id)_resolvedFontSpecWithTraitCollection:(id)a3
{
  id v4;
  TUIFontSpec *v5;
  TUIFontSpec *v6;
  NSString *textStyle;
  double minPointSize;
  double maxPointSize;
  void *v10;
  NSString *maxContentSize;
  NSString *v12;
  void *v13;
  void *v14;
  double v15;
  NSString *minContentSize;
  NSString *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double pointSize;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double leading;
  double additionalLeading;
  double v51;
  double v52;
  double v53;
  TUIFontSpec *v54;

  v4 = a3;
  v5 = self;
  v6 = v5;
  textStyle = v5->_textStyle;
  if (textStyle)
  {
    minPointSize = v5->_minPointSize;
    maxPointSize = v5->_maxPointSize;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", textStyle, v4));
    maxContentSize = v6->_maxContentSize;
    if (maxContentSize
      && !-[NSString isEqualToString:](maxContentSize, "isEqualToString:", UIContentSizeCategoryUnspecified))
    {
      v12 = v6->_textStyle;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v6->_maxContentSize));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", v12, v13));

      objc_msgSend(v14, "pointSize");
      if (maxPointSize >= v15 || maxPointSize <= 0.0)
        maxPointSize = v15;

    }
    minContentSize = v6->_minContentSize;
    if (minContentSize
      && !-[NSString isEqualToString:](minContentSize, "isEqualToString:", UIContentSizeCategoryUnspecified))
    {
      v18 = v6->_textStyle;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v6->_minContentSize));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", v18, v19));

      objc_msgSend(v20, "pointSize");
      if (minPointSize >= v21)
        v22 = minPointSize;
      else
        v22 = v21;
      if (minPointSize <= 0.0)
        minPointSize = v21;
      else
        minPointSize = v22;

    }
    if (v6->_pointSize == 0.0)
    {
      objc_msgSend(v10, "pointSize");
      if (maxPointSize < v23 && maxPointSize > 0.0)
        v23 = maxPointSize;
      if (minPointSize >= v23)
        v25 = minPointSize;
      else
        v25 = v23;
      if (minPointSize <= 0.0)
        v26 = v23;
      else
        v26 = v25;
      objc_msgSend(v10, "pointSize");
      if (v26 != v27)
      {
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontWithSize:", v26));

        v10 = (void *)v28;
      }
    }
    v29 = v6->_textStyle;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", v29, v30));

    if (v4)
    {
      objc_msgSend(v4, "displayScale");
      v33 = v32;
    }
    else
    {
      v33 = 1.0;
    }
    if (v6->_pointSize != 0.0)
    {
      objc_msgSend(v31, "pointSize");
      if (v34 != 0.0)
      {
        pointSize = v6->_pointSize;
        objc_msgSend(v10, "pointSize");
        v37 = pointSize * v36;
        objc_msgSend(v31, "pointSize");
        v39 = v37 / v38;
        if (maxPointSize < v39 && maxPointSize > 0.0)
          v39 = maxPointSize;
        if (minPointSize >= v39)
          v41 = minPointSize;
        else
          v41 = v39;
        if (minPointSize > 0.0)
          v39 = v41;
        v42 = round(v33 * v39) / v33;
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fontWithSize:", v6->_pointSize));

        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontWithSize:", v42));
        v31 = (void *)v43;
        v10 = (void *)v44;
      }
    }
    objc_msgSend(v31, "_bodyLeading");
    if (v45 == 0.0)
    {
      v48 = 1.0;
    }
    else
    {
      v46 = v45;
      objc_msgSend(v10, "_bodyLeading");
      v48 = v47 / v46;
    }
    leading = v6->_leading;
    additionalLeading = v6->_additionalLeading;
    if (additionalLeading != 0.0 && leading == 0.0)
    {
      objc_msgSend(v31, "_bodyLeading");
      additionalLeading = v6->_additionalLeading;
    }
    v51 = round(v33 * (v48 * (leading + additionalLeading))) / v33;
    objc_msgSend(v10, "pointSize");
    v53 = v52;
    if (v52 != v6->_pointSize || v51 != v6->_leading || v48 != v6->_scale)
    {
      v54 = -[TUIFontSpec initWithOther:]([TUIFontSpec alloc], "initWithOther:", v6);

      v54->_pointSize = v53;
      v54->_scale = v48;
      v54->_leading = v51;
      *(_BYTE *)&v54->_specified |= 2u;
      v6 = v54;
    }

  }
  return v6;
}

- (BOOL)isWeightSpecified
{
  return *(_BYTE *)&self->_specified & 1;
}

- (BOOL)isPointSizeSpecified
{
  return (*(_BYTE *)&self->_specified >> 1) & 1;
}

- (BOOL)isMonospacedDigitsSpecified
{
  return (*(_BYTE *)&self->_specified >> 2) & 1;
}

- (double)scale
{
  return self->_scale;
}

- (NSString)postscriptName
{
  return self->_postscriptName;
}

- (NSString)fontDesignTrait
{
  return self->_fontDesignTrait;
}

- (NSString)fontFamilyName
{
  return self->_fontFamilyName;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (BOOL)monospacedDigits
{
  return *((_BYTE *)&self->_specified + 1);
}

- (unint64_t)caps
{
  return self->_caps;
}

- (double)weight
{
  return self->_weight;
}

- (double)tracking
{
  return self->_tracking;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_fontFamilyName, 0);
  objc_storeStrong((id *)&self->_fontDesignTrait, 0);
  objc_storeStrong((id *)&self->_postscriptName, 0);
  objc_storeStrong((id *)&self->_maxContentSize, 0);
  objc_storeStrong((id *)&self->_minContentSize, 0);
}

@end
