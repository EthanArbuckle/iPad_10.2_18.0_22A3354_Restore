@implementation BEContentCleanupJSOptions

- (BEContentCleanupJSOptions)init
{
  uint64_t v3;
  uint64_t v4;

  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  LOBYTE(v3) = 0;
  return -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:](self, "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 0, 0, &stru_38FF08, &stru_38FF08, &stru_38FF08, 0, v3, 0, 0, v4, 0);
}

- (BEContentCleanupJSOptions)initWithMode:(unint64_t)a3 useNewTextStyling:(BOOL)a4 fontFamily:(id)a5 language:(id)a6 respectImageSizeClass:(id)a7 respectImageSizeClassIsPrefix:(BOOL)a8 hasBuiltInFonts:(BOOL)a9 justification:(unint64_t)a10 fontWeight:(unint64_t)a11 overrideLineHeight:(BOOL)a12 overrideLetterSpacing:(BOOL)a13 overrideWordSpacing:(BOOL)a14 readingMode:(unint64_t)a15
{
  id v21;
  id v22;
  id v23;
  BEContentCleanupJSOptions *v24;
  BEContentCleanupJSOptions *v25;
  NSString *v26;
  NSString *fontFamily;
  NSString *v28;
  NSString *language;
  NSString *v30;
  NSString *respectImageSizeClass;
  objc_super v33;

  v21 = a5;
  v22 = a6;
  v23 = a7;
  v33.receiver = self;
  v33.super_class = (Class)BEContentCleanupJSOptions;
  v24 = -[BEContentCleanupJSOptions init](&v33, "init");
  v25 = v24;
  if (v24)
  {
    v24->_mode = a3;
    v24->_useNewTextStyling = a4;
    v26 = (NSString *)objc_msgSend(v21, "copy");
    fontFamily = v25->_fontFamily;
    v25->_fontFamily = v26;

    v28 = (NSString *)objc_msgSend(v22, "copy");
    language = v25->_language;
    v25->_language = v28;

    v30 = (NSString *)objc_msgSend(v23, "copy");
    respectImageSizeClass = v25->_respectImageSizeClass;
    v25->_respectImageSizeClass = v30;

    v25->_respectImageSizeClassIsPrefix = a8;
    v25->_hasBuiltInFonts = a9;
    v25->_justification = a10;
    v25->_fontWeight = a11;
    v25->_overrideLineHeight = a12;
    v25->_overrideLetterSpacing = a13;
    v25->_overrideWordSpacing = a14;
    v25->_readingMode = a15;
  }

  return v25;
}

+ (id)fixedLayoutOptionsWithLanguage:(id)a3
{
  id v3;
  BEContentCleanupJSOptions *v4;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  LOBYTE(v6) = 0;
  v4 = -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:]([BEContentCleanupJSOptions alloc], "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 3, 0, 0, v3, 0, 0, v6, 0, 0, v7, 0);

  return v4;
}

+ (id)expandedContentOptions
{
  uint64_t v3;
  uint64_t v4;

  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  LOBYTE(v3) = 0;
  return -[BEContentCleanupJSOptions initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:]([BEContentCleanupJSOptions alloc], "initWithMode:useNewTextStyling:fontFamily:language:respectImageSizeClass:respectImageSizeClassIsPrefix:hasBuiltInFonts:justification:fontWeight:overrideLineHeight:overrideLetterSpacing:overrideWordSpacing:readingMode:", 1, 0, 0, 0, 0, 0, v3, 0, 0, v4, 0);
}

- (BOOL)overrideFontFamily
{
  return -[NSString length](self->_fontFamily, "length") != 0;
}

- (BOOL)overrideTextAlign
{
  return self->_justification != 0;
}

- (BOOL)overrideFontWeight
{
  return self->_fontWeight != 0;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t justification;
  void *v18;
  unint64_t fontWeight;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_useNewTextStyling));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("useNewTextStyling"));

  if (self->_useNewTextStyling)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideFontFamily](self, "overrideFontFamily")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("overrideFontFamily"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions hasBuiltInFonts](self, "hasBuiltInFonts")));
    v7 = CFSTR("hasBuiltInFonts");
    v8 = v3;
    v9 = v6;
LABEL_5:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

    goto LABEL_6;
  }
  if (-[BEContentCleanupJSOptions overrideFontFamily](self, "overrideFontFamily"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString be_sanitizedFontFamilyName](self->_fontFamily, "be_sanitizedFontFamilyName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iBooks_%@"), v10));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("fontFamily"));
    v9 = &__kCFBooleanTrue;
    v7 = CFSTR("customFontFamily");
    v8 = v3;
    goto LABEL_5;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("customFontFamily"));
LABEL_6:
  if (-[NSString length](self->_language, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_language, CFSTR("language"));
  if (-[NSString length](self->_respectImageSizeClass, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_respectImageSizeClass, CFSTR("respectImageSizeClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_respectImageSizeClassIsPrefix));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("respectImageSizeClassIsPrefix"));

  if (!self->_useNewTextStyling)
  {
    justification = self->_justification;
    if (justification == 1)
    {
      v18 = &__kCFBooleanTrue;
    }
    else
    {
      if (justification != 2)
        goto LABEL_18;
      v18 = &__kCFBooleanFalse;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("justification"));
LABEL_18:
    fontWeight = self->_fontWeight;
    if (fontWeight == 2)
    {
      v20 = &__kCFBooleanTrue;
    }
    else
    {
      if (fontWeight != 1)
        goto LABEL_23;
      v20 = &__kCFBooleanFalse;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("boldWeight"));
    goto LABEL_23;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideTextAlign](self, "overrideTextAlign")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("overrideTextAlign"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideFontWeight](self, "overrideFontWeight")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("overrideFontWeight"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideLineHeight](self, "overrideLineHeight")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("overrideLineHeight"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideLetterSpacing](self, "overrideLetterSpacing")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("overrideLetterSpacing"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEContentCleanupJSOptions overrideWordSpacing](self, "overrideWordSpacing")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("overrideWordSpacing"));

LABEL_23:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_mode));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("mode"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingMode));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("readingMode"));

  return v3;
}

- (NSString)jsonRepresentation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions _dictionaryRepresentation](self, "_dictionaryRepresentation"));
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2, 0, &v6));

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return (NSString *)v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  __CFString *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  __CFString *v32;
  id v33;
  void *v34;
  void *v35;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = -[BEContentCleanupJSOptions mode](self, "mode");
  if (v6 - 1 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_377FA0[v6 - 1];
  v26 = v7;
  v8 = CFSTR("NO");
  if (-[BEContentCleanupJSOptions useNewTextStyling](self, "useNewTextStyling"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v30 = v9;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions fontFamily](self, "fontFamily"));
  v33 = objc_msgSend(v34, "length");
  if (v33)
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions fontFamily](self, "fontFamily"));
  else
    v10 = CFSTR("original");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions language](self, "language"));
  v29 = objc_msgSend(v31, "length");
  if (v29)
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions language](self, "language"));
  else
    v11 = CFSTR("{unset}");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions respectImageSizeClass](self, "respectImageSizeClass"));
  v13 = objc_msgSend(v12, "length");
  v35 = (void *)v5;
  v32 = (__CFString *)v10;
  v28 = (__CFString *)v11;
  if (v13)
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions respectImageSizeClass](self, "respectImageSizeClass"));
  else
    v27 = CFSTR("{unset}");
  v14 = CFSTR("NO");
  if (-[BEContentCleanupJSOptions respectImageSizeClassIsPrefix](self, "respectImageSizeClassIsPrefix"))
    v8 = CFSTR("YES");
  v15 = -[BEContentCleanupJSOptions justification](self, "justification");
  v16 = CFSTR("full-justify");
  if (v15 != 1)
    v16 = CFSTR("unset");
  if (v15 == 2)
    v16 = CFSTR("no-justify");
  v17 = v16;
  v18 = -[BEContentCleanupJSOptions fontWeight](self, "fontWeight");
  v19 = CFSTR("light");
  if (v18 != 1)
    v19 = CFSTR("unset");
  if (v18 == 2)
    v19 = CFSTR("heavy");
  v20 = v19;
  if (-[BEContentCleanupJSOptions overrideLineHeight](self, "overrideLineHeight"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (-[BEContentCleanupJSOptions overrideLetterSpacing](self, "overrideLetterSpacing"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (-[BEContentCleanupJSOptions overrideWordSpacing](self, "overrideWordSpacing"))
    v14 = CFSTR("YES");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BEContentCleanupJSOptions readingMode](self, "readingMode")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p mode=%@ useNewTextStyling=%@ fontFamily=%@ language=%@respectImageSizeClass=%@ respectImageSizeClassIsPrefix=%@ justification=%@ fontWeight=%@ overrideLineHeight=%@ overrideLetterSpacing=%@ overrideWordSpacing=%@ readingMode=%@>"), v35, self, v26, v30, v32, v28, v27, v8, v17, v20, v21, v22, v14, v23));

  if (v13)
  if (v29)

  if (v33)
  return v24;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)useNewTextStyling
{
  return self->_useNewTextStyling;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (BOOL)hasBuiltInFonts
{
  return self->_hasBuiltInFonts;
}

- (unint64_t)justification
{
  return self->_justification;
}

- (unint64_t)fontWeight
{
  return self->_fontWeight;
}

- (BOOL)overrideLineHeight
{
  return self->_overrideLineHeight;
}

- (BOOL)overrideLetterSpacing
{
  return self->_overrideLetterSpacing;
}

- (BOOL)overrideWordSpacing
{
  return self->_overrideWordSpacing;
}

- (unint64_t)readingMode
{
  return self->_readingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

@end
