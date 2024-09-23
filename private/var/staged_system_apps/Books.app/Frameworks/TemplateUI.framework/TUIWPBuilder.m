@implementation TUIWPBuilder

- (TUIWPBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 alignment:(int64_t)a6 writingDirection:(int64_t)a7 language:(id)a8 shouldHyphenate:(BOOL)a9 service:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  TUIWPBuilder *v20;
  TUIWPBuilder *v21;
  NSString *v22;
  NSString *language;
  TUIWPStorage *v24;
  void *v25;
  void *v26;
  TUIWPStorage *v27;
  TUIWPStorage *wpStorage;
  void *v29;
  uint64_t v30;
  TSWPCharacterStyle *characterStyle;
  objc_super v34;

  v16 = a3;
  v17 = a5;
  v18 = a8;
  v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)TUIWPBuilder;
  v20 = -[TUIWPBuilder init](&v34, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_fontSpec, a3);
    objc_storeStrong((id *)&v21->_color, a5);
    v21->_alignment = a6;
    v21->_writingDirection = a7;
    v22 = (NSString *)objc_msgSend(v18, "copy");
    language = v21->_language;
    v21->_language = v22;

    v21->_shouldHyphenate = a9;
    v24 = [TUIWPStorage alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "context"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stylesheet"));
    v27 = -[TUIWPStorage initWithContext:string:stylesheet:kind:](v24, "initWithContext:string:stylesheet:kind:", v25, &stru_243BF0, v26, 3);
    wpStorage = v21->_wpStorage;
    v21->_wpStorage = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](v21->_wpStorage, "stylesheet"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "defaultCharacterStyle"));
    characterStyle = v21->_characterStyle;
    v21->_characterStyle = (TSWPCharacterStyle *)v30;

    v21->_usedDynamicColor = 0;
    -[TUIWPBuilder _applyParagraphStyleWithStyle:color:fontSpec:](v21, "_applyParagraphStyleWithStyle:color:fontSpec:", a4, v17, v16);
  }

  return v21;
}

- (void)_applyParagraphStyleWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5
{
  id v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  unint64_t alignment;
  void *v14;
  void *v15;
  void *v16;
  TUIWPStorage *wpStorage;
  id v18;
  uint64_t v19;
  id v20;

  v20 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
  -[TUIWPBuilder _configurePropertyMap:withFontSpec:style:color:](self, "_configurePropertyMap:withFontSpec:style:color:", v9, v8, a3, v20);
  objc_msgSend(v8, "leading");
  if (v10 != 0.0)
  {
    v11 = objc_alloc((Class)TSWPLineSpacing);
    objc_msgSend(v8, "leading");
    v12 = objc_msgSend(v11, "initWithMode:amount:", 2);
    objc_msgSend(v9, "setObject:forProperty:", v12, 85);

  }
  objc_msgSend(v9, "setBoolValue:forProperty:", (a3 >> 2) & 1, 51);
  alignment = self->_alignment;
  if (alignment < 5)
    objc_msgSend(v9, "setIntValue:forProperty:", dword_22EFEC[alignment], 86);
  if ((unint64_t)(self->_writingDirection + 1) <= 2)
    objc_msgSend(v9, "setIntValue:forProperty:", LODWORD(self->_writingDirection), 44);
  objc_msgSend(v9, "setBoolValue:forProperty:", self->_shouldHyphenate, 93);
  objc_msgSend(v9, "setObject:forProperty:", self->_language, 39);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_wpStorage, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "variationOfStyle:propertyMap:", v14, v9));

  wpStorage = self->_wpStorage;
  v18 = -[TUIWPStorage range](wpStorage, "range");
  -[TUIWPStorage setParagraphStyle:forCharRange:undoTransaction:](wpStorage, "setParagraphStyle:forCharRange:undoTransaction:", v16, v18, v19, 0);

}

- (void)_createCharacterStyleWithParentStyle:(id)a3 style:(unint64_t)a4 color:(id)a5 fontSpec:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  TSWPCharacterStyle *v14;
  TSWPCharacterStyle *characterStyle;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
  -[TUIWPBuilder _configurePropertyMap:withFontSpec:style:color:](self, "_configurePropertyMap:withFontSpec:style:color:", v12, v11, a4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
  v14 = (TSWPCharacterStyle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "variationOfStyle:propertyMap:", v16, v12));
  characterStyle = self->_characterStyle;
  self->_characterStyle = v14;

}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id v9;
  _BYTE *v10;
  _BYTE *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = objc_alloc((Class)TSWPHyperlinkField);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage context](self->_wpStorage, "context"));
  v9 = objc_msgSend(v7, "initWithContext:url:", v8, v12);

  v10 = -[TUIWPStorage length](self->_wpStorage, "length");
  v6[2](v6);
  v11 = -[TUIWPStorage length](self->_wpStorage, "length");
  if (v11 > v10)
    -[TUIWPStorage addSmartField:toRange:dolcContext:undoTransaction:](self->_wpStorage, "addSmartField:toRange:dolcContext:undoTransaction:", v9, v10, v11 - v10, 0, 0);

}

- (void)appendString:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;
  id v6;

  v6 = a3;
  v4 = -[TUIWPStorage length](self->_wpStorage, "length");
  -[TUIWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self->_wpStorage, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", -[TUIWPStorage length](self->_wpStorage, "length"), 0, v6, 0, 0);
  v5 = -[TUIWPStorage length](self->_wpStorage, "length");
  if (v5 > v4)
    -[TUIWPStorage setCharacterStyle:range:undoTransaction:](self->_wpStorage, "setCharacterStyle:range:undoTransaction:", self->_characterStyle, v4, v5 - v4, 0);

}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  id v10;
  TSWPCharacterStyle *v11;
  UIColor *v12;
  TUIFontSpec *v13;
  void (**v14)(_QWORD);
  TSWPCharacterStyle *characterStyle;
  TSWPCharacterStyle *v16;
  UIColor *color;
  UIColor *v18;
  TUIFontSpec *fontSpec;
  void (**v21)(_QWORD);
  id v22;

  v22 = a4;
  v10 = a5;
  v21 = (void (**)(_QWORD))a6;
  v11 = self->_characterStyle;
  v12 = self->_color;
  v13 = self->_fontSpec;
  if (v10)
  {
    objc_storeStrong((id *)&self->_fontSpec, a5);
    goto LABEL_4;
  }
  if (a3)
  {
LABEL_4:
    v14 = v21;
    if (!v22)
    {
LABEL_6:
      -[TUIWPBuilder _createCharacterStyleWithParentStyle:style:color:fontSpec:](self, "_createCharacterStyleWithParentStyle:style:color:fontSpec:", v11, a3, v22, v10);
      goto LABEL_7;
    }
LABEL_5:
    objc_storeStrong((id *)&self->_color, a4);
    goto LABEL_6;
  }
  v14 = v21;
  if (v22 && (-[UIColor isEqual:](self->_color, "isEqual:", v22) & 1) == 0)
    goto LABEL_5;
LABEL_7:
  v14[2](v14);
  characterStyle = self->_characterStyle;
  self->_characterStyle = v11;
  v16 = v11;

  color = self->_color;
  self->_color = v12;
  v18 = v12;

  fontSpec = self->_fontSpec;
  self->_fontSpec = v13;

}

- (_NSRange)appendWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  _BYTE *v5;
  char *v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[TUIWPStorage length](self->_wpStorage, "length");
  if (v4)
    v4[2](v4);
  v6 = (char *)((_BYTE *)-[TUIWPStorage length](self->_wpStorage, "length") - v5);

  v7 = (NSUInteger)v5;
  v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  id v4;
  void *v5;
  TUIWPStorage *v6;

  v4 = a3;
  v5 = v4;
  if (self->_usedDynamicColor)
    objc_msgSend(v4, "usedDynamicColor");
  v6 = self->_wpStorage;

  return v6;
}

- (void)ensureParagraphBoundary
{
  id v3;
  id v4;
  __int128 v5;

  v5 = xmmword_22F000;
  v3 = -[TUIWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_wpStorage, "paragraphStyleAtCharIndex:effectiveRange:", -[TUIWPStorage length](self->_wpStorage, "length"), &v5);
  v4 = (id)v5;
  if (v4 != -[TUIWPStorage length](self->_wpStorage, "length"))
    -[TUIWPStorage insertString:atCharIndex:undoTransaction:](self->_wpStorage, "insertString:atCharIndex:undoTransaction:", CFSTR("\n"), -[TUIWPStorage length](self->_wpStorage, "length"), 0);
}

- (void)_configurePropertyMap:(id)a3 withFontSpec:(id)a4 style:(unint64_t)a5 color:(id)a6
{
  char v7;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;

  v7 = a5;
  v31 = a3;
  v10 = a4;
  v11 = a6;
  if (!v10)
    goto LABEL_17;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec defaultFontSpec](TUIFontSpec, "defaultFontSpec"));
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_17;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "postscriptName"));

  if (!v14)
  {
    if (objc_msgSend(v10, "isWeightSpecified"))
    {
      objc_msgSend(v10, "weight");
      *(float *)&v16 = v16;
      objc_msgSend(v31, "setFloatValue:forProperty:", 50, v16);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDesignTrait"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDesignTrait"));
      objc_msgSend(v31, "setObject:forProperty:", v18, 54);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontFamilyName"));

      if (!v19)
        goto LABEL_12;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v31, "setObject:forProperty:", v20, 54);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontFamilyName"));
      objc_msgSend(v31, "setObject:forProperty:", v18, 55);
    }

LABEL_12:
    if (objc_msgSend(v10, "isMonospacedDigitsSpecified"))
      objc_msgSend(v31, "setBoolValue:forProperty:", objc_msgSend(v10, "monospacedDigits"), 56);
    goto LABEL_14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "postscriptName"));
  objc_msgSend(v31, "setObject:forProperty:", v15, 16);

LABEL_14:
  if (objc_msgSend(v10, "isPointSizeSpecified"))
  {
    objc_msgSend(v10, "pointSize");
    *(float *)&v21 = v21;
    objc_msgSend(v31, "setFloatValue:forProperty:", 17, v21);
  }
  objc_msgSend(v10, "tracking");
  objc_msgSend(v10, "tracking");
  v23 = v22 / 1000.0;
  *(float *)&v23 = v23;
  objc_msgSend(v31, "setFloatValue:forProperty:", 35, v23);
LABEL_17:
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v31, "floatValueForProperty:", 50);
    if (v24 == -1000.0 || v24 == INFINITY)
      -[TSWPCharacterStyle floatValueForProperty:](self->_characterStyle, "floatValueForProperty:", 50);
    if (v24 == -1000.0 || v24 == INFINITY || UIFontWeightRegular >= v24)
    {
      HIDWORD(v25) = HIDWORD(UIFontWeightBold);
      *(float *)&v25 = UIFontWeightBold;
      objc_msgSend(v31, "setFloatValue:forProperty:", 50, v25);
    }
  }
  if ((v7 & 2) != 0)
    objc_msgSend(v31, "setBoolValue:forProperty:", 1, 20);
  if ((v7 & 8) != 0)
    objc_msgSend(v31, "setIntValue:forProperty:", 1, 26);
  if (v11)
  {
    if (self->_usedDynamicColor)
    {
      self->_usedDynamicColor = 1;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resolvedColorWithTraitCollection:", v26));
      self->_usedDynamicColor = v27 != v11;

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TSUColor colorWithPlatformColor:](TSUColor, "colorWithPlatformColor:", v11));
    objc_msgSend(v31, "setObject:forProperty:", v28, 18);

  }
  v29 = objc_msgSend(v10, "caps");
  v30 = 0;
  switch((unint64_t)v29)
  {
    case 1uLL:
      goto LABEL_38;
    case 2uLL:
      v30 = 1;
      goto LABEL_38;
    case 3uLL:
      objc_msgSend(v31, "setIntValue:forProperty:", 2, 21);
      objc_msgSend(v31, "setBoolValue:forProperty:", 1, 48);
      break;
    case 4uLL:
      v30 = 3;
LABEL_38:
      objc_msgSend(v31, "setIntValue:forProperty:", v30, 21);
      break;
    default:
      break;
  }

}

- (void)configureDropCapWithCount:(unint64_t)a3 lines:(unint64_t)a4 raised:(unint64_t)a5 style:(unint64_t)a6 color:(id)a7 fontSpec:(id)a8 backgroundColor:(id)a9 padding:(double)a10
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;

  v17 = a7;
  v18 = a8;
  v19 = a9;
  v29 = xmmword_22F000;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_wpStorage, "paragraphStyleAtCharIndex:effectiveRange:", -[TUIWPStorage length](self->_wpStorage, "length"), &v29));
  if (a3)
  {
    v28 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPDropCapSpacing dropCapSpacingWithLineCount:elevatedLineCount:](TSWPDropCapSpacing, "dropCapSpacingWithLineCount:elevatedLineCount:", a4, a5));
    objc_msgSend(v21, "setPadding:", a10);
    objc_msgSend(v21, "setFollowingLineCount:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
    -[TUIWPBuilder _configurePropertyMap:withFontSpec:style:color:](self, "_configurePropertyMap:withFontSpec:style:color:", v22, v18, a6, v17);
    if (v19)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[TSUColor colorWithPlatformColor:](TSUColor, "colorWithPlatformColor:", v19));
      objc_msgSend(v22, "setObject:forProperty:", v23, 38);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPDropCap dropCapWithCharCount:characterStyleOverridePropertyMap:spacing:](TSWPDropCap, "dropCapWithCharCount:characterStyleOverridePropertyMap:spacing:", a3, v22, v21));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
    objc_msgSend(v25, "setObject:forProperty:", v24, 109);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "variationOfStyle:propertyMap:", v20, v25));

    -[TUIWPStorage setParagraphStyle:forCharRange:undoTransaction:](self->_wpStorage, "setParagraphStyle:forCharRange:undoTransaction:", v27, v29, 0);
    v17 = v28;
  }

}

- (void)configureLineStylingForLines:(int64_t)a3 relativeToDropCapLines:(BOOL)a4 style:(unint64_t)a5 color:(id)a6 fontSpec:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;

  v9 = a4;
  v12 = a6;
  v13 = a7;
  if (a3 >= 1)
  {
    v21 = xmmword_22F000;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_wpStorage, "paragraphStyleAtCharIndex:effectiveRange:", -[TUIWPStorage length](self->_wpStorage, "length"), &v21));
    if (v9)
      v15 = 2;
    else
      v15 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
    -[TUIWPBuilder _configurePropertyMap:withFontSpec:style:color:](self, "_configurePropertyMap:withFontSpec:style:color:", v16, v13, a5, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPLineStyling lineStylingWithLineCount:options:additionalCharacterStylePropertyMap:overrideCharacterStylePropertyMap:](TSWPLineStyling, "lineStylingWithLineCount:options:additionalCharacterStylePropertyMap:overrideCharacterStylePropertyMap:", a3, v15, 0, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
    objc_msgSend(v18, "setObject:forProperty:", v17, 111);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "variationOfStyle:propertyMap:", v14, v18));

    -[TUIWPStorage setParagraphStyle:forCharRange:undoTransaction:](self->_wpStorage, "setParagraphStyle:forCharRange:undoTransaction:", v20, v21, 0);
  }

}

- (void)configureParagraphStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  __int128 v15;

  v4 = a3;
  v15 = xmmword_22F000;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_wpStorage, "paragraphStyleAtCharIndex:effectiveRange:", -[TUIWPStorage length](self->_wpStorage, "length"), &v15));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontSpec"));
  v8 = objc_msgSend(v4, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
  -[TUIWPBuilder _configurePropertyMap:withFontSpec:style:color:](self, "_configurePropertyMap:withFontSpec:style:color:", v6, v7, v8, v9);

  objc_msgSend(v4, "indentFirstLine");
  *(float *)&v10 = v10;
  objc_msgSend(v6, "setFloatValue:forProperty:", 80, v10);
  objc_msgSend(v4, "indentLeading");
  *(float *)&v11 = v11;
  objc_msgSend(v6, "setFloatValue:forProperty:", 81, v11);
  objc_msgSend(v4, "indentTrailing");
  *(float *)&v12 = v12;
  objc_msgSend(v6, "setFloatValue:forProperty:", 82, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "variationOfStyle:propertyMap:", v5, v6));

  -[TUIWPStorage setParagraphStyle:forCharRange:undoTransaction:](self->_wpStorage, "setParagraphStyle:forCharRange:undoTransaction:", v14, v15, 0);
}

- (void)addBox:(id)a3
{
  id v4;
  NSMutableArray *childBoxes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  _TUIWPInlineDrawable *v8;
  void *v9;
  _TUIWPInlineDrawable *v10;
  id v11;
  void *v12;
  id v13;
  _BYTE *v14;
  _BYTE *v15;
  TSWPCharacterStyle *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  childBoxes = self->_childBoxes;
  v23 = v4;
  if (!childBoxes)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_childBoxes;
    self->_childBoxes = v6;

    childBoxes = self->_childBoxes;
    v4 = v23;
  }
  -[NSMutableArray addObject:](childBoxes, "addObject:", v4);
  v8 = [_TUIWPInlineDrawable alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage context](self->_wpStorage, "context"));
  v10 = -[_TUIWPInlineDrawable initWithContext:box:baselineOffset:](v8, "initWithContext:box:baselineOffset:", v9, v23, self->_baselineOffset);

  v11 = objc_alloc((Class)TSWPDrawableAttachment);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage context](self->_wpStorage, "context"));
  v13 = objc_msgSend(v11, "initWithContext:drawable:", v12, v10);

  v14 = -[TUIWPStorage length](self->_wpStorage, "length");
  -[TUIWPStorage insertAttachmentOrFootnote:range:](self->_wpStorage, "insertAttachmentOrFootnote:range:", v13, -[TUIWPStorage length](self->_wpStorage, "length"), 0);
  v15 = -[TUIWPStorage length](self->_wpStorage, "length");
  v16 = self->_characterStyle;
  v17 = (char *)objc_msgSend(v23, "layoutDirection");
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap"));
    v19 = v18;
    if (v17 == (_BYTE *)&dword_0 + 2)
    {
      v20 = 1;
    }
    else
    {
      if (v17 != (_BYTE *)&dword_0 + 1)
      {
LABEL_9:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWPStorage stylesheet](self->_wpStorage, "stylesheet"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "variationOfStyle:propertyMap:", self->_characterStyle, v19));

        v16 = (TSWPCharacterStyle *)v22;
        goto LABEL_10;
      }
      v20 = 0;
    }
    objc_msgSend(v18, "setIntValue:forProperty:", v20, 44);
    goto LABEL_9;
  }
LABEL_10:
  if (v15 > v14)
    -[TUIWPStorage setCharacterStyle:range:undoTransaction:](self->_wpStorage, "setCharacterStyle:range:undoTransaction:", v16, v14, v15 - v14, 0);

}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  objc_msgSend(a3, "updateModelChildren:", self->_childBoxes, a4, a5);
  return self->_childBoxes;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  objc_msgSend(a3, "updateModelChildren:", self->_childBoxes, a4);
}

- (void)finalizeModelsWithParent:(id)a3
{
  objc_msgSend(a3, "updateModelChildren:", self->_childBoxes);
}

- (id)finalizeAnimationGroups
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TUIWPStorage)wpStorage
{
  return self->_wpStorage;
}

- (TSWPCharacterStyle)characterStyle
{
  return self->_characterStyle;
}

- (void)setCharacterStyle:(id)a3
{
  objc_storeStrong((id *)&self->_characterStyle, a3);
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_characterStyle, 0);
  objc_storeStrong((id *)&self->_wpStorage, 0);
  objc_storeStrong((id *)&self->_axActions, 0);
  objc_storeStrong((id *)&self->_childBoxes, 0);
}

@end
