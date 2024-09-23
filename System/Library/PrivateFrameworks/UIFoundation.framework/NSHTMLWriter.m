@implementation NSHTMLWriter

- (Class)_webArchiveClass
{
  Class result;

  result = (Class)_webArchiveClass__webArchiveClass_732;
  if (!_webArchiveClass__webArchiveClass_732)
  {
    result = objc_lookUpClass("WebArchive");
    _webArchiveClass__webArchiveClass_732 = (uint64_t)result;
    if (!result)
    {
      __NSLoadWebKit();
      result = objc_lookUpClass("WebArchive");
      _webArchiveClass__webArchiveClass_732 = (uint64_t)result;
      if (!result)
      {
        NSLog((NSString *)CFSTR("Could not dynamically load the WebKit framework."));
        return (Class)_webArchiveClass__webArchiveClass_732;
      }
    }
  }
  return result;
}

- (NSHTMLWriter)initWithAttributedString:(id)a3
{
  NSHTMLWriter *v4;
  NSHTMLWriter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSHTMLWriter;
  v4 = -[NSHTMLWriter init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_attrStr = (NSAttributedString *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTMLWriter;
  -[NSHTMLWriter dealloc](&v3, sel_dealloc);
}

- (void)setDocumentAttributes:(id)a3
{
  NSDictionary *documentAttrs;

  documentAttrs = self->_documentAttrs;
  if (documentAttrs != a3)
  {

    self->_documentAttrs = (NSDictionary *)a3;
  }
}

- (id)_prefix
{
  int64_t level;

  level = self->_level;
  if (level < 1)
    return &stru_1E260C7D0;
  else
    return (id)objc_msgSend(&stru_1E260C7D0, "stringByPaddingToLength:withString:startingAtIndex:", self->_prefixSpaces * level, CFSTR(" "), 0);
}

- (id)_prefixUp
{
  int64_t level;
  id result;

  level = self->_level;
  if (level < 1)
  {
    result = &stru_1E260C7D0;
  }
  else
  {
    result = (id)objc_msgSend(&stru_1E260C7D0, "stringByPaddingToLength:withString:startingAtIndex:", self->_prefixSpaces * level, CFSTR(" "), 0);
    level = self->_level;
  }
  self->_level = level + 1;
  return result;
}

- (id)_prefixDown
{
  int64_t level;

  level = self->_level;
  self->_level = level - 1;
  if (level < 2)
    return &stru_1E260C7D0;
  else
    return (id)objc_msgSend(&stru_1E260C7D0, "stringByPaddingToLength:withString:startingAtIndex:", self->_prefixSpaces * (level - 1), CFSTR(" "), 0);
}

+ (id)fontNameForFont:(id)a3
{
  return (id)_fontNameForFont((UIFont *)a3);
}

- (id)_textAttributesForHighlightColor:(id)a3
{
  id v4;
  SEL v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  id v13;
  const __CFString *v14;
  SEL v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!a3 || objc_msgSend(a3, "isEqual:", CFSTR("NSTextHighlightColorSchemeDefault")))
  {
    if (_NSTextScalingTypeForCurrentEnvironment() == 1)
      v4 = +[NSTextLayoutManager textHighlightAttributes_iOS](NSTextLayoutManager, "textHighlightAttributes_iOS");
    else
      v4 = (id)+[NSTextLayoutManager textHighlightAttributes_macOS](NSTextLayoutManager, "textHighlightAttributes_macOS");
    v5 = (SEL)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSColor"));
    if (v5)
      goto LABEL_7;
    return (id)MEMORY[0x1E0C9AA70];
  }
  v7 = (void *)objc_opt_class();
  objc_sync_enter(v7);
  v5 = (SEL)objc_msgSend((id)_textAttributesForHighlightColor__colorSchemeTable, "objectForKeyedSubscript:", a3);
  if (!v5)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSTextHighlightColorSchemePurple")))
    {
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "systemPurpleColor");
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSTextHighlightColorSchemePink")))
    {
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "systemPinkColor");
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeOrange")))
    {
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "systemOrangeColor");
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeMint")))
    {
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "systemMintColor");
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeBlue")))
    {
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "systemBlueColor");
LABEL_29:
      v5 = (SEL)v8;
      if (v8)
      {
        v13 = (id)_textAttributesForHighlightColor__colorSchemeTable;
        if (!_textAttributesForHighlightColor__colorSchemeTable)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          _textAttributesForHighlightColor__colorSchemeTable = (uint64_t)v13;
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, a3);
      }
      goto LABEL_33;
    }
    v11 = objc_msgSend(a3, "rangeOfString:options:", CFSTR("NSTextHighlightColorScheme"), 8);
    v12 = (NSString *)a3;
    if (v10)
      v12 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("system%@Color"), objc_msgSend(a3, "substringFromIndex:", v11 + v10));
    v5 = NSSelectorFromString(v12);
    if (v5)
    {
      getNSColorClass_4[0]();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_33;
      }
      v8 = objc_msgSend((Class)getNSColorClass_4[0](), "performSelector:", v5);
      goto LABEL_29;
    }
  }
LABEL_33:
  objc_sync_exit(v7);
  if (!v5)
    return (id)MEMORY[0x1E0C9AA70];
LABEL_7:
  if (_NSTextScalingTypeForCurrentEnvironment() == 1)
    v6 = +[NSTextLayoutManager textHighlightBackgroundColorForForegroundColor_iOS:](NSTextLayoutManager, "textHighlightBackgroundColorForForegroundColor_iOS:", v5);
  else
    v6 = (id)+[NSTextLayoutManager textHighlightBackgroundColorForForegroundColor_macOS:](NSTextLayoutManager, "textHighlightBackgroundColorForForegroundColor_macOS:", v5);
  if (v6)
  {
    v16[0] = CFSTR("NSColor");
    v16[1] = CFSTR("NSBackgroundColor");
    v17[0] = v5;
    v17[1] = v6;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  }
  else
  {
    v14 = CFSTR("NSColor");
    v15 = v5;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  }
}

- (unint64_t)_spanClassForAttributes:(id)a3 inParagraphClass:(unint64_t)a4 spanClass:(unint64_t)a5 flags:(unint64_t *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSHTMLWriter *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIFont *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  double v30;
  double v31;
  __CFString *v32;
  unint64_t v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  unsigned int v37;
  BOOL v38;
  const __CFString *v39;
  double v40;
  const __CFString *v41;
  double v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unsigned int excludedElements2;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  float v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  const __CFString *v71;
  const __CFString *v72;
  uint64_t v73;
  NSMutableArray *charStyleArrays;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  double v81;
  uint64_t v82;
  void *v83;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  const __CFString *v94;
  id v96;
  NSHTMLWriter *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105[2];

  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v96 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v93 = objc_msgSend(a3, "objectForKey:", CFSTR("NSFont"));
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSColor"));
  v10 = objc_msgSend(a3, "objectForKey:", CFSTR("NSBackgroundColor"));
  v99 = objc_msgSend(a3, "objectForKey:", CFSTR("NSStrokeColor"));
  v11 = objc_msgSend(a3, "objectForKey:", CFSTR("NSTextHighlightColorScheme"));
  v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("NSTextHighlightStyle")), "isEqual:", CFSTR("NSTextHighlightStyleDefault"));
  v87 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderline"));
  v86 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSStrikethrough"));
  v88 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSSuperScript"));
  v83 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSBaselineOffset"));
  v89 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSKern"));
  v98 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSStrokeWidth"));
  v90 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSLigature"));
  v92 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSShadow"));
  v97 = self;
  v91 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSWritingDirection"));
  if (v12)
  {
    v13 = -[NSHTMLWriter _textAttributesForHighlightColor:](self, "_textAttributesForHighlightColor:", v11);
    v14 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSColor"));
    v15 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
    if (v14)
      v9 = (void *)v14;
    if (v15)
      v16 = (void *)v15;
    else
      v16 = (void *)v10;
  }
  else
  {
    v16 = (void *)v10;
  }
  v17 = v99;
  if (v98)
  {
    if (!v99)
      v17 = (uint64_t)v9;
    v18 = self;
    if (!v17)
      v17 = objc_msgSend((Class)getNSColorClass_4[0](), "blackColor");
  }
  else
  {
    v18 = self;
  }
  v100 = (void *)v17;
  if (a5)
  {
    v19 = (void *)-[NSMutableArray objectAtIndex:](v18->_charStyleArrays, "objectAtIndex:", a5 - 1);
    v20 = objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", 2), "unsignedIntegerValue");
    v21 = objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", 3), "unsignedIntegerValue");
    v22 = objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", 4), "unsignedIntegerValue");
    if (a4)
      goto LABEL_16;
  }
  else
  {
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
    {
LABEL_16:
      v23 = (void *)-[NSMutableArray objectAtIndex:](v18->_paraStyleArrays, "objectAtIndex:", a4 - 1);
      v24 = v23;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v20 = objc_msgSend((id)objc_msgSend(v23, "objectAtIndex:", 2), "unsignedIntegerValue");
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        v21 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "unsignedIntegerValue");
      v25 = v22;
      v38 = v22 == 0x7FFFFFFFFFFFFFFFLL;
      v26 = (UIFont *)v93;
      if (v38)
        v25 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "unsignedIntegerValue");
      if (v93)
        goto LABEL_29;
      goto LABEL_27;
    }
  }
  v25 = v22;
  v26 = (UIFont *)v93;
  if (v93)
    goto LABEL_29;
LABEL_27:
  if ((*(_BYTE *)&v18->_flags & 2) != 0)
  {
    v26 = 0;
    goto LABEL_36;
  }
  v26 = (UIFont *)NSDefaultFont();
  if (!v26)
  {
LABEL_36:
    v27 = &stru_1E260C7D0;
    goto LABEL_37;
  }
LABEL_29:
  v27 = (const __CFString *)-[NSMutableDictionary objectForKey:](v18->_fontNames, "objectForKey:", v26);
  if (!v27)
  {
    v27 = (const __CFString *)_fontNameForFont(v26);
    if (v27)
      -[NSMutableDictionary setObject:forKey:](v18->_fontNames, "setObject:forKey:", v27, v26);
  }
  v28 = (void *)-[NSMutableDictionary objectForKey:](v18->_fontDescriptions, "objectForKey:", v26);
  if (!v28)
  {
    v28 = (void *)objc_msgSend(-[UIFont htmlMarkupDescription](v26, "htmlMarkupDescription"), "mutableCopy");
    objc_msgSend(v28, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("'"), 0, 0, objc_msgSend(v28, "length"));
    -[NSMutableDictionary setObject:forKey:](v18->_fontDescriptions, "setObject:forKey:", v28, v26);

  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@; "), v28);
LABEL_37:
  v29 = &stru_1E260C7D0;
  if (v27)
    v29 = v27;
  v94 = v29;
  if (v98)
  {
    objc_msgSend(v98, "doubleValue");
    if (v30 != 0.0)
    {
      objc_msgSend(v98, "doubleValue");
      if (v31 > 0.0)
        v9 = (void *)objc_msgSend((Class)getNSColorClass_4[0](), "clearColor");
    }
  }
  if (v87)
  {
    v32 = &stru_1E260C7D0;
    if (objc_msgSend(v87, "unsignedIntegerValue"))
    {
      v38 = (v18->_excludedElements2 & 0x4000000) == 0;
      v33 = v38;
      if (!v38)
        v32 = CFSTR("underline ");
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
    v32 = &stru_1E260C7D0;
  }
  if (v86)
  {
    v34 = &stru_1E260C7D0;
    if (objc_msgSend(v86, "integerValue"))
    {
      if ((v97->_excludedElements2 & 0x2400) == 0x2400)
        v34 = CFSTR("line-through ");
      else
        v33 |= 2uLL;
    }
  }
  else
  {
    v34 = &stru_1E260C7D0;
  }
  if (-[__CFString length](v32, "length") || -[__CFString length](v34, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR("text-decoration: %@%@; "), v32, v34);
  v35 = &stru_1E260C7D0;
  if (v88)
  {
    v36 = objc_msgSend(v88, "integerValue");
    if (v36 < 1)
    {
      if ((v36 & 0x8000000000000000) == 0)
        goto LABEL_68;
      excludedElements2 = v97->_excludedElements2;
      v38 = (excludedElements2 & 0x10000) == 0;
      if ((excludedElements2 & 0x10000) == 0)
        v33 |= 0x20uLL;
      v39 = CFSTR("sub");
    }
    else
    {
      v37 = v97->_excludedElements2;
      v38 = (v37 & 0x20000) == 0;
      if ((v37 & 0x20000) == 0)
        v33 |= 0x10uLL;
      v39 = CFSTR("super");
    }
    if (!v38)
      v35 = (__CFString *)v39;
  }
LABEL_68:
  if (-[__CFString length](v35, "length"))
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("vertical-align: %@; "), v35);
  }
  else if (v83)
  {
    objc_msgSend(v83, "doubleValue");
    if (v42 != 0.0)
    {
      objc_msgSend(v83, "doubleValue");
      objc_msgSend(v8, "appendFormat:", CFSTR("vertical-align: %.1fpx; "), v43);
    }
  }
  if (v89)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v89, "doubleValue");
      if (fabs(v40) >= 2.22044605e-16)
      {
        v81 = v40;
        v41 = CFSTR("letter-spacing: %.1fpx; ");
      }
      else
      {
        v41 = CFSTR("font-kerning: none; ");
      }
      objc_msgSend(v8, "appendFormat:", v41, *(_QWORD *)&v81);
    }
  }
  if (v90)
  {
    v44 = objc_msgSend(v90, "intValue");
    if (v44 <= 2)
      objc_msgSend(v8, "appendFormat:", off_1E260C098[v44]);
  }
  if (v9)
    v45 = _colorValForColor_0(v9);
  else
    v45 = 0x7FFFFFFFFFFFFFFFLL;
  v46 = v16;
  if (v45 != v20)
  {
    if ((_BYTE)v45 == 0xFF)
    {
      if (v45 == 0x7FFFFFFFFFFFFFFFLL)
        v47 = 0;
      else
        v47 = v45 >> 8;
      objc_msgSend(v8, "appendFormat:", CFSTR("color: #%.6x; "), v47);
      LODWORD(v48) = v45 >> 8;
    }
    else
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("color: %@; "), _rgbaString(v45));
      LODWORD(v48) = v45 >> 8;
    }
    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
      v48 = 0;
    else
      v48 = v48;
    objc_msgSend(v96, "appendFormat:", CFSTR(" color=\"#%.6x\"), v48);
    v46 = v16;
  }
  if (!v46)
  {
    v38 = v21 == 0x7FFFFFFFFFFFFFFFLL;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v50 = v96;
    if (v38)
      goto LABEL_108;
    goto LABEL_102;
  }
  v49 = _colorValForColor_0(v46);
  v50 = v96;
  if (v49 == v21)
    goto LABEL_108;
  v51 = v49;
  if (v49 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_102:
    objc_msgSend(v8, "appendString:", CFSTR("background-color: transparent; "));
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_108;
  }
  if ((_BYTE)v49 == 0xFF)
    objc_msgSend(v8, "appendFormat:", CFSTR("background-color: #%.6x; "), v49 >> 8);
  else
    objc_msgSend(v8, "appendFormat:", CFSTR("background-color: %@; "), _rgbaString(v49));
  v21 = v51;
LABEL_108:
  if (v100)
    v53 = _colorValForColor_0(v100);
  else
    v53 = 0x7FFFFFFFFFFFFFFFLL;
  if (v53 != v25)
  {
    -[UIFont pointSize](v26, "pointSize");
    v55 = v54 * 0.01;
    objc_msgSend(v98, "doubleValue");
    *(float *)&v56 = v55 * v56;
    v57 = fabsf(*(float *)&v56);
    if ((_BYTE)v53 == 0xFF)
    {
      LODWORD(v58) = v53 >> 8;
      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
        v58 = 0;
      else
        v58 = v58;
      objc_msgSend(v8, "appendFormat:", CFSTR("-webkit-text-stroke: %.3gpx #%.6x; "), v57, v58);
    }
    else
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("-webkit-text-stroke: %.3gpx %@; "), v57, _rgbaString(v53));
    }
  }
  if (v92)
  {
    objc_msgSend(v92, "shadowOffset");
    v60 = v59;
    v62 = v61;
    objc_msgSend(v92, "shadowBlurRadius");
    v64 = v63;
    v65 = objc_msgSend(v92, "shadowColor");
    if (!v65)
    {
      v68 = 2863311360;
LABEL_128:
      objc_msgSend(v8, "appendFormat:", CFSTR("text-shadow: %.1fpx %.1fpx %.1fpx %@; "),
        v60,
        v62,
        v64,
        _rgbaString(v68));
      goto LABEL_131;
    }
    v66 = (void *)v65;
    getUIColorClass_0[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v104 = 0.0;
      v105[0] = 0.0;
      v102 = 0.0;
      v103 = 0.0;
      v101 = 0.0;
      if (objc_msgSend(v66, "getRed:green:blue:alpha:", v105, &v104, &v103, &v102))
      {
        v67 = (vcvtmd_s64_f64((1.0 - (1.0 - v105[0]) * v102) * 255.0 + 0.5) << 24) | (vcvtmd_s64_f64((1.0 - (1.0 - v104) * v102)* 255.0+ 0.5) << 16) | (vcvtmd_s64_f64((1.0 - (1.0 - v103) * v102) * 255.0 + 0.5) << 8) | vcvtmd_s64_f64(v102 * 255.0 + 0.5);
        goto LABEL_126;
      }
      if ((objc_msgSend(v66, "getWhite:alpha:", &v101, &v102) & 1) != 0)
      {
        v67 = (16843008 * vcvtmd_s64_f64((1.0 - (1.0 - v101) * v102) * 255.0 + 0.5)) | vcvtmd_s64_f64(v102 * 255.0 + 0.5);
LABEL_126:
        v68 = (int)v67;
        if ((_BYTE)v67 == 0xFF)
        {
          v69 = v67 >> 8;
LABEL_130:
          objc_msgSend(v8, "appendFormat:", CFSTR("text-shadow: %.1fpx %.1fpx %.1fpx #%.6x; "), v60, v62, v64, v69);
          goto LABEL_131;
        }
        goto LABEL_128;
      }
    }
    v69 = 0;
    goto LABEL_130;
  }
LABEL_131:
  if (v91 && objc_msgSend(v91, "count"))
  {
    v70 = objc_msgSend((id)objc_msgSend(v91, "objectAtIndex:", 0), "unsignedIntegerValue");
    v71 = CFSTR("rtl");
    if ((v70 & 1) == 0)
      v71 = CFSTR("ltr");
    v72 = CFSTR("bidi-override");
    if ((v70 & 2) == 0)
      v72 = CFSTR("embed");
    objc_msgSend(v8, "appendFormat:", CFSTR("direction: %@; unicode-bidi: %@; "), v71, v72);
  }
  if (objc_msgSend(v8, "length"))
  {
    while ((objc_msgSend(v8, "hasSuffix:", CFSTR(" ")) & 1) != 0
         || objc_msgSend(v8, "hasSuffix:", CFSTR(";")))
      objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
    v73 = -[NSMutableOrderedSet indexOfObject:](v97->_charStyleStrings, "indexOfObject:", v8);
    if (v73 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v73 = -[NSMutableOrderedSet count](v97->_charStyleStrings, "count");
      -[NSMutableOrderedSet addObject:](v97->_charStyleStrings, "addObject:", v8);
      -[NSMutableArray addObject:](v97->_fontStrings, "addObject:", v50);
      charStyleArrays = v97->_charStyleArrays;
      v75 = (void *)MEMORY[0x1E0C99D20];
      v76 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 12.0);
      v77 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
      v78 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
      v82 = v76;
      v50 = v96;
      -[NSMutableArray addObject:](charStyleArrays, "addObject:", objc_msgSend(v75, "arrayWithObjects:", v94, v82, v77, v78, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53), 0));
    }
    v79 = v73 + 1;
  }
  else
  {
    v79 = 0;
  }

  if (a6)
    *a6 = v33;
  return v79;
}

- (id)_defaultValueForAttribute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int v8;
  NSAttributedString *attrStr;
  int v10;
  UIFont *v11;
  NSUInteger v12;
  CFMutableDictionaryRef Mutable;
  char *v14;
  UIFont *v15;
  UIFont *v16;
  int v17;
  NSHTMLWriter *v18;
  id v19;
  int v20;
  int v21;
  UIFont *v22;
  uint64_t v23;
  uint64_t v24;
  char *Value;
  char *v26;
  int v28;
  NSUInteger v29;
  NSUInteger v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;

  length = a4.length;
  location = a4.location;
  v36 = 0;
  v37 = 0;
  v8 = objc_msgSend(CFSTR("NSFont"), "isEqualToString:");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSBackgroundColor")))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    attrStr = self->_attrStr;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __48__NSHTMLWriter__defaultValueForAttribute_range___block_invoke;
    v31[3] = &unk_1E2604428;
    v31[4] = &v32;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](attrStr, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSBackgroundColor"), location, length, 0, v31);
    v10 = *((unsigned __int8 *)v33 + 24);
    _Block_object_dispose(&v32, 8);
    if (v10)
      return 0;
  }
  v11 = 0;
  if (location)
    v12 = (__PAIR128__(location, length) - 1) >> 64;
  else
    v12 = 0;
  v30 = location + length;
  if (v12 < location + length)
  {
    v11 = 0;
    Mutable = 0;
    v14 = 0;
    v29 = length;
    v28 = v8;
    while (1)
    {
      v15 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attrStr, "attribute:atIndex:longestEffectiveRange:inRange:", a3);
      v16 = v15;
      if (length <= 2 * v37)
      {
        v11 = v15;
        if (Mutable)
        {
LABEL_28:
          CFRelease(Mutable);
          return v11;
        }
        return v11;
      }
      v17 = v15 ? v8 : 0;
      if (v17 == 1)
        break;
LABEL_22:
      if (!Mutable)
        Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
      Value = (char *)CFDictionaryGetValue(Mutable, v16);
      v26 = &Value[v37];
      CFDictionarySetValue(Mutable, v16, &Value[v37]);
      if (v26 > v14)
      {
        v14 = v26;
        v11 = v16;
      }
      if (v37 + v36 >= v30)
      {
        if (!Mutable)
          return v11;
        goto LABEL_28;
      }
    }
    v18 = self;
    v19 = a3;
    v20 = -[UIFont traits](v15, "traits");
    v21 = v20;
    if ((v20 & 2) != 0)
    {
      v23 = -[UIFont familyName](v16, "familyName");
      -[UIFont pointSize](v16, "pointSize");
      v22 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v23, v21 & 0xFFFFFFFD);
      if ((v21 & 1) == 0)
      {
LABEL_19:
        a3 = v19;
        if (v22)
          v16 = v22;
        self = v18;
        length = v29;
        v8 = v28;
        goto LABEL_22;
      }
    }
    else
    {
      v22 = v16;
      if ((v20 & 1) == 0)
        goto LABEL_19;
    }
    v24 = -[UIFont familyName](v22, "familyName");
    -[UIFont pointSize](v22, "pointSize");
    v22 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v24, v21 & 0xFFFFFFFE);
    goto LABEL_19;
  }
  return v11;
}

uint64_t __48__NSHTMLWriter__defaultValueForAttribute_range___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (!a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (unint64_t)_paragraphClassforParagraphStyle:(id)a3 presentationIntent:(id)a4 range:(_NSRange)a5 isEmpty:(BOOL)a6 isCompletelyEmpty:(BOOL)a7 headerString:(id *)a8 alignmentString:(id *)a9 directionString:(id *)a10
{
  NSUInteger length;
  NSUInteger location;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  unsigned int excludedElements2;
  const __CFString *v38;
  int v39;
  double v40;
  uint64_t v41;
  const __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  double v47;
  double v48;
  UIFont *v49;
  UIFont *v50;
  double v51;
  const __CFString *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  id *v77;
  uint64_t v79;
  NSMutableArray *paraStyleArrays;
  uint64_t v81;
  const __CFString *v82;
  __CFString *v83;
  _BOOL4 v84;
  NSHTMLWriter *v85;

  v84 = a6;
  length = a5.length;
  location = a5.location;
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a3, "headIndent");
  v18 = v17;
  objc_msgSend(a3, "firstLineHeadIndent");
  v20 = v19;
  objc_msgSend(a3, "tailIndent");
  v22 = v21;
  objc_msgSend(a3, "paragraphSpacingBefore");
  v24 = v23;
  objc_msgSend(a3, "paragraphSpacing");
  v26 = v25;
  objc_msgSend(a3, "minimumLineHeight");
  v28 = v27;
  objc_msgSend(a3, "hyphenationFactor");
  v30 = v29;
  v31 = objc_msgSend(a3, "alignment");
  v32 = objc_msgSend(a3, "baseWritingDirection");
  v33 = objc_msgSend(a3, "headerLevel");
  v34 = (void *)objc_msgSend(a3, "textLists");
  if (objc_msgSend(v34, "count"))
  {
    v35 = (void *)objc_msgSend(v34, "lastObject");
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v35 = 0;
  if (a4)
LABEL_3:
    LODWORD(a4) = objc_msgSend(a4, "intentKind") == 6;
LABEL_4:
  if (!v35)
    goto LABEL_13;
  v36 = objc_msgSend(v35, "isOrdered");
  excludedElements2 = self->_excludedElements2;
  if (v36)
  {
    if ((excludedElements2 & 0x40) != 0)
      goto LABEL_13;
  }
  else if ((excludedElements2 & 0x8000000) != 0)
  {
    goto LABEL_13;
  }
  if ((excludedElements2 & 4) == 0)
  {
    v38 = CFSTR("li");
    v20 = 0.0;
    v18 = 0.0;
    goto LABEL_35;
  }
LABEL_13:
  if (v33 < 1)
  {
LABEL_25:
    v38 = 0;
LABEL_26:
    if (v38)
      v39 = 0;
    else
      v39 = (int)a4;
    if (v39 == 1)
    {
      if ((self->_excludedElements1 & 0x200) == 0)
      {
        v38 = CFSTR("blockquote");
        goto LABEL_35;
      }
    }
    else if (v38)
    {
      goto LABEL_35;
    }
    if ((self->_excludedElements2 & 0x80) != 0)
    {
      v38 = 0;
      v46 = 0x7FFFFFFFFFFFFFFFLL;
      v48 = 12.0;
      v43 = &stru_1E260C7D0;
      v82 = &stru_1E260C7D0;
      v83 = &stru_1E260C7D0;
      v65 = 0x7FFFFFFFFFFFFFFFLL;
      v81 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_90;
    }
    v38 = CFSTR("p");
  }
  else
  {
    switch(v33)
    {
      case 1:
        if ((self->_excludedElements1 & 0x800000) != 0)
          goto LABEL_25;
        v38 = CFSTR("h1");
        break;
      case 2:
        if ((self->_excludedElements1 & 0x1000000) != 0)
          goto LABEL_25;
        v38 = CFSTR("h2");
        break;
      case 3:
        if ((self->_excludedElements1 & 0x2000000) != 0)
          goto LABEL_25;
        v38 = CFSTR("h3");
        break;
      case 4:
        if ((self->_excludedElements1 & 0x4000000) != 0)
          goto LABEL_25;
        v38 = CFSTR("h4");
        break;
      case 5:
        if ((self->_excludedElements1 & 0x8000000) != 0)
          goto LABEL_25;
        v38 = CFSTR("h5");
        break;
      case 6:
        if ((self->_excludedElements1 & 0x10000000) != 0)
          v38 = 0;
        else
          v38 = CFSTR("h6");
        goto LABEL_26;
      default:
        goto LABEL_25;
    }
  }
LABEL_35:
  v40 = -v22;
  if (v22 >= 0.0)
    v40 = 0.0;
  objc_msgSend(v16, "appendFormat:", CFSTR("margin: %.1fpx %.1fpx %.1fpx %.1fpx; "),
    v24,
    *(_QWORD *)&v40,
    v26,
    *(_QWORD *)&v18);
  if (v32 == -1)
    v32 = _NSStringImputedBaseWritingDirectionAtIndex((const __CFString *)-[NSAttributedString string](self->_attrStr, "string"), location, location, length);
  v41 = v31 - 1;
  if ((unint64_t)(v31 - 1) < 3)
  {
    v42 = off_1E260C0B0[v41];
    v43 = off_1E260C0C8[v41];
LABEL_44:
    objc_msgSend(v16, "appendString:", v42);
    goto LABEL_45;
  }
  if (!v31)
  {
    v43 = &stru_1E260C7D0;
    if (v32 != 1)
      goto LABEL_45;
    v43 = CFSTR(" align=\"left\");
    v42 = CFSTR("text-align: left; ");
    goto LABEL_44;
  }
  v43 = &stru_1E260C7D0;
LABEL_45:
  v44 = &stru_1E260C7D0;
  if (v30 > 0.0)
    objc_msgSend(v16, "appendString:", CFSTR("-webkit-hyphens: auto; "));
  v45 = CFSTR(" dir=\"rtl\");
  if (v32 != 1)
    v45 = &stru_1E260C7D0;
  v83 = (__CFString *)v45;
  if (v20 != v18)
    objc_msgSend(v16, "appendFormat:", CFSTR("text-indent: %.1fpx; "), v20 - v18);
  if (v28 > 0.0)
    objc_msgSend(v16, "appendFormat:", CFSTR("line-height: %.1fpx; "), *(_QWORD *)&v28);
  if (length >= 0x400)
    length = 1024;
  if ((self->_excludedElements1 & 0x400000) == 0 && !a7)
  {
    v46 = 0x7FFFFFFFFFFFFFFFLL;
    v47 = 14.0;
    v48 = 12.0;
    v82 = &stru_1E260C7D0;
LABEL_79:
    v81 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_80;
  }
  v49 = -[NSHTMLWriter _defaultValueForAttribute:range:](self, "_defaultValueForAttribute:range:", CFSTR("NSFont"), location, length);
  if (v49)
  {
    v50 = v49;
    -[UIFont pointSize](v49, "pointSize");
    v48 = v51;
    v52 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_fontNames, "objectForKey:", v50);
    if (!v52)
    {
      v52 = (const __CFString *)_fontNameForFont(v50);
      if (v52)
        -[NSMutableDictionary setObject:forKey:](self->_fontNames, "setObject:forKey:", v52, v50);
    }
    +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior");
    -[UIFont _defaultLineHeightForUILayout](v50, "_defaultLineHeightForUILayout");
    v54 = v53;
    -[UIFont _leading](v50, "_leading");
    v47 = v54 + v55;
  }
  else
  {
    v47 = 14.0;
    v52 = &stru_1E260C7D0;
    v48 = 12.0;
  }
  if (v52)
    v44 = (__CFString *)v52;
  if (v48 <= 0.0)
    v48 = 12.0;
  if (-[__CFString length](v44, "length"))
  {
    v56 = _escapedStringForString(v44, 1);
    objc_msgSend(v56, "rangeOfCharacterFromSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), "invertedSet"));
    if (v57)
      v56 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v56);
    objc_msgSend(v16, "appendFormat:", CFSTR("font: %.1fpx %@; "), *(_QWORD *)&v48, v56);
  }
  v82 = v44;
  v58 = -[NSHTMLWriter _defaultValueForAttribute:range:](self, "_defaultValueForAttribute:range:", CFSTR("NSColor"), location, length);
  v46 = 0x7FFFFFFFFFFFFFFFLL;
  if (v58)
  {
    v59 = _colorValForColor_0(v58);
    if (v59 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v60 = v59;
      v61 = ~(_BYTE)v59;
      objc_msgSend(v16, "appendFormat:", CFSTR("color: #%.6x; "), v59 >> 8);
      if (v61)
        objc_msgSend(v16, "appendFormat:", CFSTR("color: %@; "), _rgbaString(v60));
      v46 = v60;
    }
  }
  v62 = -[NSHTMLWriter _defaultValueForAttribute:range:](self, "_defaultValueForAttribute:range:", CFSTR("NSStrokeColor"), location, length);
  if (!v62)
    goto LABEL_79;
  v63 = _colorValForColor_0(v62);
  if (v63 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_79;
  v81 = v63;
  if ((_BYTE)v63 == 0xFF)
    objc_msgSend(v16, "appendFormat:", CFSTR("-webkit-text-stroke: #%.6x; "), v63 >> 8);
  else
    objc_msgSend(v16, "appendFormat:", CFSTR("-webkit-text-stroke: %@; "), _rgbaString(v63));
LABEL_80:
  v64 = -[NSHTMLWriter _defaultValueForAttribute:range:](self, "_defaultValueForAttribute:range:", CFSTR("NSBackgroundColor"), location, length);
  v65 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v64)
  {
    if (!v84)
      goto LABEL_90;
    goto LABEL_88;
  }
  v66 = _colorValForColor_0(v64);
  if (v66 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v67 = v66;
    v68 = ~(_BYTE)v66;
    objc_msgSend(v16, "appendFormat:", CFSTR("background-color: #%.6x; "), v66 >> 8);
    if (v68)
      objc_msgSend(v16, "appendFormat:", CFSTR("background-color: %@; "), _rgbaString(v67));
    v65 = v67;
  }
  if (v84)
LABEL_88:
    objc_msgSend(v16, "appendFormat:", CFSTR("min-height: %.1fpx; "), *(_QWORD *)&v47);
LABEL_90:
  if (objc_msgSend(v16, "length"))
  {
    while ((objc_msgSend(v16, "hasSuffix:", CFSTR(" ")) & 1) != 0
         || objc_msgSend(v16, "hasSuffix:", CFSTR(";")))
      objc_msgSend(v16, "deleteCharactersInRange:", objc_msgSend(v16, "length") - 1, 1);
    v69 = -[NSMutableArray indexOfObject:](self->_paraStyleStrings, "indexOfObject:", v16);
    if (v69 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v69 = -[NSMutableArray count](self->_paraStyleStrings, "count");
      -[NSMutableArray addObject:](self->_paraStyleStrings, "addObject:", v16);
      paraStyleArrays = self->_paraStyleArrays;
      v85 = self;
      v70 = v38;
      v71 = (void *)MEMORY[0x1E0C99D20];
      v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
      v73 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
      v74 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v65);
      v79 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v81);
      v75 = v71;
      v38 = v70;
      self = v85;
      -[NSMutableArray addObject:](paraStyleArrays, "addObject:", objc_msgSend(v75, "arrayWithObjects:", v82, v72, v73, v74, v79, 0));
    }
    v76 = v69 + 1;
    if (objc_msgSend(CFSTR("p"), "isEqualToString:", v38))
      -[NSMutableIndexSet addIndex:](self->_paraStyleIndexes, "addIndex:", v76);
    v77 = a8;
    if (objc_msgSend(CFSTR("li"), "isEqualToString:", v38))
      -[NSMutableIndexSet addIndex:](self->_listItemStyleIndexes, "addIndex:", v76);
  }
  else
  {
    v76 = 0;
    v77 = a8;
  }

  if (v77)
    *v77 = (id)v38;
  if (a9)
    *a9 = v43;
  if (a10)
    *a10 = v83;
  return v76;
}

- (void)_writeDocumentProperty:(id)a3 value:(id)a4 toString:(id)a5
{
  id v9;
  void *v10;
  const __CFString *v11;

  if (a3 && a4)
  {
    v9 = -[NSHTMLWriter _prefix](self, "_prefix");
    v10 = _escapedStringForString(a4, 1);
    if ((self->_excludedElements2 & 0x10000000) != 0)
      v11 = &stru_1E260C7D0;
    else
      v11 = CFSTR(" /");
    objc_msgSend(a5, "appendFormat:", CFSTR("%@<meta name=\"%@\" content=\"%@\"%@>\n"), v9, a3, v10, v11);
  }
}

- (void)_writeDocumentPropertiesToString:(id)a3
{
  unsigned int excludedElements2;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  excludedElements2 = self->_excludedElements2;
  if ((excludedElements2 & 0x800000) == 0)
  {
    objc_msgSend(a3, "appendFormat:", CFSTR("%@<title>%@</title>\n"), -[NSHTMLWriter _prefix](self, "_prefix"), _escapedStringForString(-[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSTitleDocumentAttribute")), 0));
    excludedElements2 = self->_excludedElements2;
  }
  if ((excludedElements2 & 0x10) == 0)
  {
    v6 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSKeywordsDocumentAttribute"));
    v7 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSCreationTimeDocumentAttribute"));
    v8 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSModificationTimeDocumentAttribute"));
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
        v6 = (id)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      else
        v6 = 0;
    }
    v9 = objc_alloc(MEMORY[0x1E0C99D48]);
    v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v11 = v10;
    if (v7)
    {
      v12 = (void *)objc_msgSend(v10, "components:fromDate:", 252, v7);
      v7 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04d-%02d-%02dT%02d:%02d:%02dZ"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), (__int16)objc_msgSend(v12, "second"));
      if (!v8)
      {
LABEL_12:

        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Author"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSAuthorDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("LastAuthor"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSEditorDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Company"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSCompanyDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Copyright"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSCopyrightDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Subject"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSSubjectDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Description"), -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NSCommentDocumentAttribute")), a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Keywords"), v6, a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("CreationTime"), v7, a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("ModificationTime"), v8, a3);
        -[NSHTMLWriter _writeDocumentProperty:value:toString:](self, "_writeDocumentProperty:value:toString:", CFSTR("Generator"), CFSTR("Cocoa HTML Writer"), a3);
        return;
      }
    }
    else
    {
      v12 = 0;
      if (!v8)
        goto LABEL_12;
    }
    objc_msgSend(v11, "components:fromDate:", 252, v8);
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04d-%02d-%02dT%02d:%02d:%02dZ"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), (__int16)objc_msgSend(v12, "second"));
    goto LABEL_12;
  }
}

- (void)_closeFlags:(unint64_t)a3 openFlags:(unint64_t)a4 inString:(id)a5
{
  int v6;
  int v7;
  char v9;
  int v10;
  BOOL v11;
  const __CFString *v12;
  const __CFString *v13;
  char v14;

  v6 = a4;
  v7 = a3;
  v9 = a4 ^ a3;
  if (((a4 ^ a3) & 1) != 0)
  {
    v11 = 0;
    v10 = 63;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  else if (((a4 ^ a3) & 2) != 0)
  {
    v11 = 0;
    v10 = 62;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  else if (((a4 ^ a3) & 4) != 0)
  {
    v11 = 0;
    v10 = 60;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  else if (((a4 ^ a3) & 8) != 0)
  {
    v11 = 0;
    v10 = 56;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  else if (((a4 ^ a3) & 0x10) != 0)
  {
    v11 = 0;
    v10 = 48;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  else
  {
    v10 = v9 & 0x20;
    v11 = (v9 & 0x20) == 0;
    if ((a3 & 0x20) == 0)
      goto LABEL_19;
  }
  if (!v11)
    objc_msgSend(a5, "appendString:", CFSTR("</sub>"));
LABEL_19:
  if ((v7 & v10 & 0x10) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("</sup>"));
  if ((v7 & v10 & 8) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("</i>"));
  if ((v7 & v10 & 4) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("</b>"));
  if ((v7 & v10 & 2) != 0)
  {
    if ((self->_excludedElements2 & 0x400) != 0)
      v12 = CFSTR("</strike>");
    else
      v12 = CFSTR("</s>");
    objc_msgSend(a5, "appendString:", v12);
  }
  if ((v7 & v10 & 1) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("</u>"));
  if ((v6 & v10 & 1) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("<u>"));
  if ((v6 & v10 & 2) != 0)
  {
    if ((self->_excludedElements2 & 0x400) != 0)
      v13 = CFSTR("<strike>");
    else
      v13 = CFSTR("<s>");
    objc_msgSend(a5, "appendString:", v13);
  }
  if ((v6 & v10 & 4) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("<b>"));
  if ((v6 & v10 & 8) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("<i>"));
  if ((v6 & v10 & 0x10) != 0)
    objc_msgSend(a5, "appendString:", CFSTR("<sup>"));
  v14 = (v6 & 0x20) == 0 || v11;
  if ((v14 & 1) == 0)
    objc_msgSend(a5, "appendString:", CFSTR("<sub>"));
}

- (unint64_t)_blockClassForBlock:(id)a3
{
  id v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  NSMutableArray *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSMutableArray *blockStyleStrings;
  uint64_t v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;

  blockStyleStrings = self->_blockStyleStrings;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a3, "valueForDimension:", 0);
  v6 = v5;
  objc_msgSend(a3, "valueForDimension:", 1);
  v8 = v7;
  objc_msgSend(a3, "valueForDimension:", 2);
  v10 = v9;
  objc_msgSend(a3, "valueForDimension:", 4);
  v12 = v11;
  objc_msgSend(a3, "valueForDimension:", 5);
  v14 = v13;
  objc_msgSend(a3, "valueForDimension:", 6);
  v16 = v15;
  v17 = objc_msgSend(a3, "valueTypeForDimension:", 0);
  v18 = objc_msgSend(a3, "valueTypeForDimension:", 1);
  v64 = objc_msgSend(a3, "valueTypeForDimension:", 2);
  v65 = objc_msgSend(a3, "valueTypeForDimension:", 4);
  v66 = objc_msgSend(a3, "valueTypeForDimension:", 5);
  v68 = objc_msgSend(a3, "valueTypeForDimension:", 6);
  v19 = _colorValForColor_0((void *)objc_msgSend(a3, "backgroundColor"));
  objc_msgSend(a3, "widthForLayer:edge:", 1, 1);
  v88 = v20;
  objc_msgSend(a3, "widthForLayer:edge:", 1, 2);
  v87 = v21;
  objc_msgSend(a3, "widthForLayer:edge:", 1, 3);
  v85 = v22;
  objc_msgSend(a3, "widthForLayer:edge:", 1, 0);
  v24 = v23;
  v75 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 1, 1);
  v74 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 1, 2);
  v73 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 1, 3);
  v71 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 1, 0);
  objc_msgSend(a3, "widthForLayer:edge:", 0, 1);
  v86 = v25;
  objc_msgSend(a3, "widthForLayer:edge:", 0, 2);
  v84 = v26;
  objc_msgSend(a3, "widthForLayer:edge:", 0, 3);
  v83 = v27;
  objc_msgSend(a3, "widthForLayer:edge:", 0, 0);
  v29 = v28;
  v72 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 0, 1);
  v70 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 0, 2);
  v69 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 0, 3);
  v67 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", 0, 0);
  v30 = (void *)objc_msgSend(a3, "borderColorForEdge:", 1);
  v31 = (void *)objc_msgSend(a3, "borderColorForEdge:", 2);
  v32 = (void *)objc_msgSend(a3, "borderColorForEdge:", 3);
  v33 = (void *)objc_msgSend(a3, "borderColorForEdge:", 0);
  v34 = _colorValForColor_0(v30);
  v35 = _colorValForColor_0(v31);
  v81 = _colorValForColor_0(v32);
  v36 = _colorValForColor_0(v33);
  objc_msgSend(a3, "widthForLayer:edge:", -1, 1);
  v92 = v37;
  objc_msgSend(a3, "widthForLayer:edge:", -1, 2);
  v91 = v38;
  objc_msgSend(a3, "widthForLayer:edge:", -1, 3);
  v90 = v39;
  objc_msgSend(a3, "widthForLayer:edge:", -1, 0);
  v89 = v40;
  v79 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", -1, 1);
  v78 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", -1, 2);
  v77 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", -1, 3);
  v76 = objc_msgSend(a3, "widthValueTypeForLayer:edge:", -1, 0);
  if (v6 > 0.0)
  {
    if (v17 == 1)
      v41 = CFSTR("%");
    else
      v41 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("width: %.1f%@; "), *(_QWORD *)&v6, v41);
  }
  if (v8 > 0.0)
  {
    if (v18 == 1)
      v42 = CFSTR("%");
    else
      v42 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("min-width: %.1f%@; "), *(_QWORD *)&v8, v42);
  }
  if (v10 > 0.0)
  {
    if (v64 == 1)
      v43 = CFSTR("%");
    else
      v43 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("max-width: %.1f%@; "), *(_QWORD *)&v10, v43);
  }
  if (v12 > 0.0)
  {
    if (v65 == 1)
      v44 = CFSTR("%");
    else
      v44 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("height: %.1f%@; "), *(_QWORD *)&v12, v44);
  }
  if (v14 > 0.0)
  {
    if (v66 == 1)
      v45 = CFSTR("%");
    else
      v45 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("min-height: %.1f%@; "), *(_QWORD *)&v14, v45);
  }
  if (v16 > 0.0)
  {
    if (v68 == 1)
      v46 = CFSTR("%");
    else
      v46 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("max-height: %.1f%@; "), *(_QWORD *)&v16, v46);
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("background-color: #%.6x; "), v19 >> 8);
    if ((_BYTE)v19 != 0xFF)
      objc_msgSend(v4, "appendFormat:", CFSTR("background-color: %@; "), _rgbaString(v19));
  }
  if (v24 > 0.0 || v88 > 0.0 || v87 > 0.0 || v85 > 0.0)
  {
    if (v75 == 1)
      v47 = CFSTR("%");
    else
      v47 = CFSTR("px");
    if (v74 == 1)
      v48 = CFSTR("%");
    else
      v48 = CFSTR("px");
    if (v73 == 1)
      v49 = CFSTR("%");
    else
      v49 = CFSTR("px");
    if (v71 == 1)
      v50 = CFSTR("%");
    else
      v50 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("margin: %.1f%@ %.1f%@ %.1f%@ %.1f%@; "),
      *(_QWORD *)&v88,
      v47,
      *(_QWORD *)&v87,
      v48,
      *(_QWORD *)&v85,
      v49,
      *(_QWORD *)&v24,
      v50);
  }
  if (v29 > 0.0 || v86 > 0.0 || v84 > 0.0 || v83 > 0.0)
  {
    v51 = v72 == 1 ? CFSTR("%") : CFSTR("px");
    v52 = v70 == 1 ? CFSTR("%") : CFSTR("px");
    v53 = v69 == 1 ? CFSTR("%") : CFSTR("px");
    v54 = v67 == 1 ? CFSTR("%") : CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("border-style: solid; border-width: %.1f%@ %.1f%@ %.1f%@ %.1f%@; "),
      *(_QWORD *)&v86,
      v51,
      *(_QWORD *)&v84,
      v52,
      *(_QWORD *)&v83,
      v53,
      *(_QWORD *)&v29,
      v54);
    if (v36 != 0x7FFFFFFFFFFFFFFFLL
      || v34 != 0x7FFFFFFFFFFFFFFFLL
      || v35 != 0x7FFFFFFFFFFFFFFFLL
      || v81 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("border-color:"));
      if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v4, "appendFormat:", CFSTR(" #%.6x"), v34 >> 8);
      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v4, "appendFormat:", CFSTR(" #%.6x"), v35 >> 8);
      if (v81 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4, "appendString:", CFSTR(" transparent"));
      else
        objc_msgSend(v4, "appendFormat:", CFSTR(" #%.6x"), v81 >> 8);
      if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v4, "appendString:", CFSTR(" transparent; "));
      else
        objc_msgSend(v4, "appendFormat:", CFSTR(" #%.6x; "), v36 >> 8);
    }
  }
  if (v89 > 0.0 || v92 > 0.0 || v91 > 0.0 || v90 > 0.0)
  {
    if (v79 == 1)
      v55 = CFSTR("%");
    else
      v55 = CFSTR("px");
    if (v78 == 1)
      v56 = CFSTR("%");
    else
      v56 = CFSTR("px");
    if (v77 == 1)
      v57 = CFSTR("%");
    else
      v57 = CFSTR("px");
    if (v76 == 1)
      v58 = CFSTR("%");
    else
      v58 = CFSTR("px");
    objc_msgSend(v4, "appendFormat:", CFSTR("padding: %.1f%@ %.1f%@ %.1f%@ %.1f%@; "),
      *(_QWORD *)&v92,
      v55,
      *(_QWORD *)&v91,
      v56,
      *(_QWORD *)&v90,
      v57,
      *(_QWORD *)&v89,
      v58);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "collapsesBorders"))
      objc_msgSend(v4, "appendString:", CFSTR("border-collapse: collapse; "));
    if (objc_msgSend(a3, "hidesEmptyCells"))
      objc_msgSend(v4, "appendString:", CFSTR("empty-cells: hide; "));
    if (objc_msgSend(a3, "layoutAlgorithm") == 1)
      objc_msgSend(v4, "appendString:", CFSTR("table-layout: fixed; "));
  }
  if (!objc_msgSend(v4, "length"))
  {
    v60 = 0;
    goto LABEL_122;
  }
  while ((objc_msgSend(v4, "hasSuffix:", CFSTR(" ")) & 1) != 0
       || objc_msgSend(v4, "hasSuffix:", CFSTR(";")))
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if ((self->_excludedElements2 & 0x1140000) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = 120;
    }
    else
    {
      objc_opt_class();
      v59 = blockStyleStrings;
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_119;
      v61 = 128;
    }
    v59 = *(NSMutableArray **)((char *)&self->super.isa + v61);
    goto LABEL_119;
  }
  v59 = blockStyleStrings;
LABEL_119:
  v62 = -[NSMutableArray indexOfObject:](v59, "indexOfObject:", v4);
  if (v62 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v62 = -[NSMutableArray count](v59, "count");
    -[NSMutableArray addObject:](v59, "addObject:", v4);
  }
  v60 = v62 + 1;
LABEL_122:

  return v60;
}

- (void)_openBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  _BOOL4 v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  unint64_t v22;
  double v23;
  const __CFString *v24;
  double v25;
  const __CFString *v26;
  unsigned int excludedElements2;
  unsigned int excludedElements1;
  unsigned int v29;
  id v30;
  unsigned int v31;
  id v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  id v36;
  id v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  _BOOL4 v42;
  const __CFString *v43;

  v7 = (void *)objc_msgSend(a3, "textBlocks");
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; v9 != i; ++i)
    {
      v11 = (void *)objc_msgSend(v7, "objectAtIndex:", i);
      if (-[NSAttributedString rangeOfTextBlock:atIndex:](self->_attrStr, "rangeOfTextBlock:atIndex:", v11, a4) == a4)
      {
        v12 = -[NSHTMLWriter _blockClassForBlock:](self, "_blockClassForBlock:", v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)objc_msgSend(v11, "table");
          v42 = -[NSAttributedString _atStartOfTextTableRow:atIndex:](self->_attrStr, "_atStartOfTextTableRow:atIndex:", v13, a4);
          v14 = -[NSAttributedString _atStartOfTextTable:atIndex:](self->_attrStr, "_atStartOfTextTable:atIndex:", v13, a4);
          objc_msgSend(v11, "verticalAlignment");
          v18 = objc_msgSend(v11, "rowSpan");
          v19 = objc_msgSend(v11, "columnSpan");
          v20 = &stru_1E260C7D0;
          if (v18 >= 2)
            v20 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" rowspan=\"%d\"), v18);
          v43 = v20;
          v21 = &stru_1E260C7D0;
          if (v19 >= 2)
            v21 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" colspan=\"%d\"), v19);
          if (v14)
          {
            v22 = -[NSHTMLWriter _blockClassForBlock:](self, "_blockClassForBlock:", v13);
            objc_msgSend(v13, "contentWidth");
            v24 = &stru_1E260C7D0;
            if (v23 > 0.0)
            {
              v25 = v23;
              if (objc_msgSend(v13, "contentWidthValueType") == 1)
                v26 = CFSTR(" width=\"%.1f%%\");
              else
                v26 = CFSTR(" width=\"%.1f\");
              v24 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v26, *(_QWORD *)&v25);
            }
            excludedElements2 = self->_excludedElements2;
            if ((excludedElements2 & 0x1140000) != 0)
            {
              excludedElements1 = self->_excludedElements1;
              if ((excludedElements1 & 0x40000) == 0)
              {
                if (!v22 || (excludedElements2 & 0x1000) != 0)
                {
                  objc_msgSend(a5, "appendFormat:", CFSTR("%@<div>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v40);
                }
                else
                {
                  v29 = excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
                  v30 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
                  if (v29)
                    objc_msgSend(a5, "appendFormat:", CFSTR("%@<div style=\"%@\">\n"), v30, -[NSMutableArray objectAtIndex:](self->_blockStyleStrings, "objectAtIndex:", v22 - 1));
                  else
                    objc_msgSend(a5, "appendFormat:", CFSTR("%@<div class=\"d%lu\">\n"), v30, v22);
                }
              }
            }
            else
            {
              if (!v22 || (excludedElements2 & 0x1000) != 0)
              {
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<table%@ cellspacing=\"0\" cellpadding=\"0\">\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v24, v41);
              }
              else
              {
                v31 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
                v32 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
                if (v31)
                  objc_msgSend(a5, "appendFormat:", CFSTR("%@<table%@ cellspacing=\"0\" cellpadding=\"0\" style=\"%@\">\n"), v32, v24, -[NSMutableArray objectAtIndex:](self->_tableStyleStrings, "objectAtIndex:", v22 - 1));
                else
                  objc_msgSend(a5, "appendFormat:", CFSTR("%@<table%@ cellspacing=\"0\" cellpadding=\"0\" class=\"t%lu\">\n"), v32, v24, v22);
              }
              if ((self->_excludedElements2 & 0x80000) == 0)
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<tbody>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v40);
            }
          }
          v33 = self->_excludedElements2;
          if ((v33 & 0x1140000) == 0)
          {
            if (v42)
              objc_msgSend(a5, "appendFormat:", CFSTR("%@<tr>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"));
            if (!v12 || (self->_excludedElements2 & 0x1000) != 0)
            {
              v41 = v21;
              v40 = (uint64_t)v43;
              objc_msgSend(a5, "appendFormat:", CFSTR("%@<td%@%@ valign=\"%@\">\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"));
            }
            else
            {
              v38 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              v39 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
              if (v38)
              {
                -[NSMutableArray objectAtIndex:](self->_tableCellStyleStrings, "objectAtIndex:", v12 - 1);
                v40 = (uint64_t)v43;
                v41 = v21;
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<td%@%@ valign=\"%@\" style=\"%@\">\n"), v39);
              }
              else
              {
                v40 = (uint64_t)v43;
                v41 = v21;
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<td%@%@ valign=\"%@\" class=\"td%lu\">\n"), v39);
              }
            }
            continue;
          }
          v34 = self->_excludedElements1;
          if ((v34 & 0x40000) == 0)
          {
            if (v12 && (v33 & 0x1000) == 0)
            {
              v17 = v34 & 0x20000000;
              v16 = self->_excludedElements2 & 0x8000;
LABEL_41:
              v35 = v17 | v16;
              v36 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
              v37 = v36;
              if (v35)
              {
                v40 = -[NSMutableArray objectAtIndex:](self->_blockStyleStrings, "objectAtIndex:", v12 - 1);
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<div style=\"%@\">\n"), v37);
              }
              else
              {
                v40 = v12;
                objc_msgSend(a5, "appendFormat:", CFSTR("%@<div class=\"d%lu\">\n"), v36);
              }
              continue;
            }
LABEL_43:
            objc_msgSend(a5, "appendFormat:", CFSTR("%@<div>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"));
          }
        }
        else
        {
          v15 = self->_excludedElements1;
          if ((v15 & 0x40000) == 0)
          {
            if (v12 && (self->_excludedElements2 & 0x1000) == 0)
            {
              v16 = v15 & 0x20000000;
              v17 = self->_excludedElements2 & 0x8000;
              goto LABEL_41;
            }
            goto LABEL_43;
          }
        }
      }
    }
  }
}

- (BOOL)_closeBlocksForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  unsigned int excludedElements2;
  const __CFString *v20;

  v8 = (void *)objc_msgSend(a3, "textBlocks");
  v9 = objc_msgSend(v8, "count");
  v10 = 0;
  if (v9)
  {
    v11 = v9 - 1;
    v12 = CFSTR("%@</div>\n");
    while (1)
    {
      v13 = (void *)objc_msgSend(v8, "objectAtIndex:", v11);
      v14 = -[NSAttributedString rangeOfTextBlock:atIndex:](self->_attrStr, "rangeOfTextBlock:atIndex:", v13, a4);
      if (v14 + v15 != a4 + 1)
        goto LABEL_17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_15:
      v20 = CFSTR("%@</div>\n");
      if ((self->_excludedElements1 & 0x40000) == 0)
        goto LABEL_16;
LABEL_17:
      if (--v11 == -1)
        return v10;
    }
    v16 = objc_msgSend(v13, "table");
    v17 = -[NSAttributedString _atEndOfTextTableRow:atIndex:](self->_attrStr, "_atEndOfTextTableRow:atIndex:", v16, a4);
    v18 = -[NSAttributedString _atEndOfTextTable:atIndex:](self->_attrStr, "_atEndOfTextTable:atIndex:", v16, a4);
    if ((self->_excludedElements2 & 0x1140000) != 0)
    {
      if ((self->_excludedElements1 & 0x40000) != 0)
      {
        if (v17)
          goto LABEL_8;
        goto LABEL_12;
      }
    }
    else
    {
      v12 = CFSTR("%@</td>\n");
    }
    objc_msgSend(a5, "appendFormat:", v12, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
    v10 = 1;
    if (v17)
    {
LABEL_8:
      v12 = CFSTR("%@</div>\n");
      if ((self->_excludedElements2 & 0x1140000) == 0)
      {
        objc_msgSend(a5, "appendFormat:", CFSTR("%@</tr>\n"), -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
        v10 = 1;
      }
      goto LABEL_13;
    }
LABEL_12:
    v12 = CFSTR("%@</div>\n");
LABEL_13:
    if (!v18)
      goto LABEL_17;
    excludedElements2 = self->_excludedElements2;
    if ((excludedElements2 & 0x1140000) == 0)
    {
      v20 = CFSTR("%@</table>\n");
      if ((excludedElements2 & 0x80000) == 0)
        objc_msgSend(a5, "appendFormat:", CFSTR("%@</tbody>\n"), -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
LABEL_16:
      objc_msgSend(a5, "appendFormat:", v20, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
      v10 = 1;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  return v10;
}

- (unint64_t)_listClassForList:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v5 = objc_msgSend(a3, "isOrdered");
  v6 = 152;
  if (v5)
    v6 = 144;
  v7 = *(Class *)((char *)&self->super.isa + v6);
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9 = (void *)objc_msgSend(a3, "_markerSpecifierAsCSSValue");
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR("list-style-type: %@; "), v9);
  if (objc_msgSend(v8, "length"))
  {
    while ((objc_msgSend(v8, "hasSuffix:", CFSTR(" ")) & 1) != 0
         || objc_msgSend(v8, "hasSuffix:", CFSTR(";")))
      objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
    v10 = objc_msgSend(v7, "indexOfObject:", v8);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = objc_msgSend(v7, "count");
      objc_msgSend(v7, "addObject:", v8);
    }
    v11 = v10 + 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_openListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5 isStrict:(BOOL)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  unsigned int excludedElements2;
  unsigned int v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v10 = (void *)objc_msgSend(a3, "textLists");
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v26 = a5;
    do
    {
      v14 = (void *)objc_msgSend(v10, "objectAtIndex:", v13);
      if (-[NSAttributedString rangeOfTextList:atIndex:](self->_attrStr, "rangeOfTextList:atIndex:", v14, a4) == a4)
      {
        v15 = -[NSHTMLWriter _listClassForList:](self, "_listClassForList:", v14);
        if (objc_msgSend(v14, "isOrdered"))
        {
          v16 = objc_msgSend(v14, "startingItemNumber");
          v17 = &stru_1E260C7D0;
          if (!a6 && v16 != 1)
            v17 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" start=\"%ld\"), v16);
          excludedElements2 = self->_excludedElements2;
          if ((excludedElements2 & 0x40) == 0)
          {
            if (!v15 || (excludedElements2 & 0x1000) != 0)
            {
              objc_msgSend(a5, "appendFormat:", CFSTR("%@<ol%@>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v17);
            }
            else
            {
              v19 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              v20 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
              if (v19)
              {
                a5 = v26;
                objc_msgSend(v26, "appendFormat:", CFSTR("%@<ol style=\"%@\"%@>\n"), v20, -[NSMutableArray objectAtIndex:](self->_olistStyleStrings, "objectAtIndex:", v15 - 1), v17);
              }
              else
              {
                a5 = v26;
                objc_msgSend(v26, "appendFormat:", CFSTR("%@<ol class=\"ol%lu\"%@>\n"), v20, v15, v17);
              }
            }
          }
        }
        else
        {
          v21 = self->_excludedElements2;
          if ((v21 & 0x8000000) == 0)
          {
            if (!v15 || (v21 & 0x1000) != 0)
            {
              objc_msgSend(a5, "appendFormat:", CFSTR("%@<ul>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"), v24);
            }
            else
            {
              v22 = self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000;
              v23 = -[NSHTMLWriter _prefixUp](self, "_prefixUp");
              if (v22)
              {
                a5 = v26;
                objc_msgSend(v26, "appendFormat:", CFSTR("%@<ul style=\"%@\">\n"), v23, -[NSMutableArray objectAtIndex:](self->_ulistStyleStrings, "objectAtIndex:", v15 - 1), v25);
              }
              else
              {
                a5 = v26;
                objc_msgSend(v26, "appendFormat:", CFSTR("%@<ul class=\"ul%lu\">\n"), v23, v15, v25);
              }
            }
          }
        }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (BOOL)_closeListsForParagraphStyle:(id)a3 atIndex:(unint64_t)a4 inString:(id)a5
{
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int excludedElements2;
  const __CFString *v17;

  v8 = (void *)objc_msgSend(a3, "textLists");
  v9 = objc_msgSend(v8, "count");
  v10 = 0;
  if (v9)
  {
    for (i = v9 - 1; i != -1; --i)
    {
      v12 = (void *)objc_msgSend(v8, "objectAtIndex:", i);
      v13 = -[NSAttributedString rangeOfTextList:atIndex:](self->_attrStr, "rangeOfTextList:atIndex:", v12, a4);
      if (v13 + v14 == a4 + 1)
      {
        v15 = objc_msgSend(v12, "isOrdered");
        excludedElements2 = self->_excludedElements2;
        if (v15)
        {
          v17 = CFSTR("%@</ol>\n");
          if ((excludedElements2 & 0x40) != 0)
            continue;
LABEL_8:
          objc_msgSend(a5, "appendFormat:", v17, -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
          v10 = 1;
          continue;
        }
        v17 = CFSTR("%@</ul>\n");
        if ((excludedElements2 & 0x8000000) == 0)
          goto LABEL_8;
      }
    }
  }
  return v10;
}

- (void)_addImageElementForResource:(id)a3 description:(id)a4 inString:(id)a5
{
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString");
  v9 = _escapedStringForString(a4, 1);
  if ((self->_excludedElements2 & 0x10000000) != 0)
    v10 = &stru_1E260C7D0;
  else
    v10 = CFSTR(" /");
  objc_msgSend(a5, "appendFormat:", CFSTR("<img src=\"%@\" alt=\"%@\"%@>"), v8, v9, v10);
}

- (void)_addObjectElementForResource:(id)a3 description:(id)a4 inString:(id)a5
{
  objc_msgSend(a5, "appendFormat:", CFSTR("<object data=\"%@\">%@</object>"), objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString"), _escapedStringForString(a4, 1));
}

- (void)_addSourceElementForResource:(id)a3 MIMEType:(id)a4 inString:(id)a5
{
  uint64_t v8;
  const __CFString *v9;

  v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString");
  if ((self->_excludedElements2 & 0x10000000) != 0)
    v9 = &stru_1E260C7D0;
  else
    v9 = CFSTR(" /");
  objc_msgSend(a5, "appendFormat:", CFSTR("<source srcset=\"%@\" type=\"%@\"%@>"), v8, a4, v9);
}

- (id)_resourceForFileWrapper:(id)a3 filename:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSSubstituteWebResource *v16;
  void *v17;
  NSURL *outputBaseURL;
  void *v20;
  uint64_t v21;
  id resourceHandler;
  uint64_t v23;
  const __CFString *v24;
  NSSubstituteWebResource *v25;
  NSSubstituteWebResource *v26;
  uint64_t v27;
  const __CFString *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id *v36;
  void *v37;

  if (!objc_msgSend(a3, "isRegularFile"))
    return 0;
  v7 = objc_msgSend(a3, "preferredFilename");
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v36 = a4;
  v37 = (void *)objc_msgSend(a3, "regularFileContents");
  v9 = (void *)objc_msgSend(v8, "pathExtension");
  v10 = objc_msgSend(v8, "stringByDeletingPathExtension");
  v11 = -[NSDictionary objectForKey:](-[NSFileWrapper fileWrappers](self->_fileWrapper, "fileWrappers"), "objectForKey:", v8);
  v12 = v8;
  if (v11)
  {
    v13 = v11;
    v14 = 1;
    v12 = v8;
    while (!objc_msgSend(v13, "isRegularFile")
         || (objc_msgSend(v37, "isEqual:", objc_msgSend(v13, "regularFileContents")) & 1) == 0)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%lu"), v10, v14);
      v12 = v15;
      if (v9)
        v12 = (void *)objc_msgSend(v15, "stringByAppendingPathExtension:", v9);
      v13 = -[NSDictionary objectForKey:](-[NSFileWrapper fileWrappers](self->_fileWrapper, "fileWrappers"), "objectForKey:", v12);
      ++v14;
      if (!v13)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    if (objc_msgSend(v12, "isEqualToString:", v8))
    {
      -[NSFileWrapper addFileWrapper:](self->_fileWrapper, "addFileWrapper:", a3);
    }
    else
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", v37);
      objc_msgSend(v17, "setPreferredFilename:", v12);
      -[NSFileWrapper addFileWrapper:](self->_fileWrapper, "addFileWrapper:", v17);

    }
  }
  v16 = (NSSubstituteWebResource *)-[NSMutableDictionary objectForKey:](self->_subresources, "objectForKey:", v12);
  if (!v16)
  {
    outputBaseURL = self->_outputBaseURL;
    v20 = (void *)MEMORY[0x1E0C99E98];
    v21 = outputBaseURL
        ? objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), -[NSURL absoluteString](outputBaseURL, "absoluteString"), objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 4)): objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file:///%@"), objc_msgSend(v12, "stringByAddingPercentEscapesUsingEncoding:", 4), v35);
    v16 = (NSSubstituteWebResource *)objc_msgSend(v20, "URLWithString:", v21);
    if (v16)
    {
      if (self->_resourceHandler && (objc_opt_respondsToSelector() & 1) != 0)
      {
        resourceHandler = self->_resourceHandler;
        v23 = objc_msgSend(v9, "lowercaseString");
        if ((objc_msgSend(CFSTR("tiff"), "isEqualToString:", v23) & 1) != 0
          || (objc_msgSend(CFSTR("tif"), "isEqualToString:", v23) & 1) != 0)
        {
          v24 = CFSTR("image/tiff");
        }
        else if ((objc_msgSend(CFSTR("jpeg"), "isEqualToString:", v23) & 1) != 0
               || (objc_msgSend(CFSTR("jpg"), "isEqualToString:", v23) & 1) != 0)
        {
          v24 = CFSTR("image/jpeg");
        }
        else if ((objc_msgSend(CFSTR("gif"), "isEqualToString:", v23) & 1) != 0)
        {
          v24 = CFSTR("image/gif");
        }
        else if ((objc_msgSend(CFSTR("png"), "isEqualToString:", v23) & 1) != 0)
        {
          v24 = CFSTR("image/png");
        }
        else
        {
          v32 = objc_msgSend(CFSTR("pdf"), "isEqualToString:", v23);
          if (v32)
            v24 = CFSTR("application/pdf");
          else
            v24 = CFSTR("application/octet-stream");
          if ((v32 & 1) == 0 && v9)
          {
            if (objc_msgSend(v9, "length")
              && (v33 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v9)) != 0
              && (v34 = v33, objc_msgSend(v33, "preferredMIMEType")))
            {
              v24 = (const __CFString *)objc_msgSend(v34, "preferredMIMEType");
            }
            else
            {
              v24 = CFSTR("application/octet-stream");
            }
          }
        }
        v25 = (NSSubstituteWebResource *)objc_msgSend(resourceHandler, "resourceForData:URL:MIMEType:textEncodingName:frameName:", v37, v16, v24, 0, 0);
      }
      else
      {
        v26 = [NSSubstituteWebResource alloc];
        v27 = objc_msgSend(v9, "lowercaseString");
        if ((objc_msgSend(CFSTR("tiff"), "isEqualToString:", v27) & 1) != 0
          || (objc_msgSend(CFSTR("tif"), "isEqualToString:", v27) & 1) != 0)
        {
          v28 = CFSTR("image/tiff");
        }
        else if ((objc_msgSend(CFSTR("jpeg"), "isEqualToString:", v27) & 1) != 0
               || (objc_msgSend(CFSTR("jpg"), "isEqualToString:", v27) & 1) != 0)
        {
          v28 = CFSTR("image/jpeg");
        }
        else if ((objc_msgSend(CFSTR("gif"), "isEqualToString:", v27) & 1) != 0)
        {
          v28 = CFSTR("image/gif");
        }
        else if ((objc_msgSend(CFSTR("png"), "isEqualToString:", v27) & 1) != 0)
        {
          v28 = CFSTR("image/png");
        }
        else
        {
          v29 = objc_msgSend(CFSTR("pdf"), "isEqualToString:", v27);
          if (v29)
            v28 = CFSTR("application/pdf");
          else
            v28 = CFSTR("application/octet-stream");
          if ((v29 & 1) == 0 && v9)
          {
            if (objc_msgSend(v9, "length")
              && (v30 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v9)) != 0
              && (v31 = v30, objc_msgSend(v30, "preferredMIMEType")))
            {
              v28 = (const __CFString *)objc_msgSend(v31, "preferredMIMEType");
            }
            else
            {
              v28 = CFSTR("application/octet-stream");
            }
          }
        }
        v25 = -[NSSubstituteWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](v26, "initWithData:URL:MIMEType:textEncodingName:frameName:", v37, v16, v28, 0, 0);
      }
      v16 = v25;
      if (v25)
        -[NSMutableDictionary setObject:forKey:](self->_subresources, "setObject:forKey:", v25, v12);
    }
  }
  if (v36)
    *v36 = v12;
  return v16;
}

- (void)_appendAttachment:(id)a3 atIndex:(unint64_t)a4 toString:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int excludedElements2;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  if (self->_resourceHandler && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(self->_resourceHandler, "htmlStringForAttachment:atIndex:", a3, a4);
    if (v9)
      objc_msgSend(a5, "appendString:", v9);
  }
  else if ((~self->_excludedElements2 & 0x22) != 0)
  {
    v10 = (void *)objc_msgSend(a3, "fileWrapper", a3, a4);
    v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "preferredFilename"), "pathExtension");
    v19 = 0;
    v12 = -[NSHTMLWriter _resourceForFileWrapper:filename:](self, "_resourceForFileWrapper:filename:", v10, &v19);
    if (v12)
    {
      v13 = v12;
      excludedElements2 = self->_excludedElements2;
      if ((excludedElements2 & 2) == 0)
      {
        if (v11
          && ((v15 = objc_msgSend(v11, "lowercaseString"),
               (objc_msgSend(CFSTR("tiff"), "isEqualToString:", v15) & 1) == 0)
           && (objc_msgSend(CFSTR("tif"), "isEqualToString:", v15) & 1) == 0
            ? ((objc_msgSend(CFSTR("jpeg"), "isEqualToString:", v15) & 1) == 0
            && (objc_msgSend(CFSTR("jpg"), "isEqualToString:", v15) & 1) == 0
             ? ((objc_msgSend(CFSTR("gif"), "isEqualToString:", v15) & 1) == 0
              ? ((objc_msgSend(CFSTR("png"), "isEqualToString:", v15) & 1) == 0
               ? ((objc_msgSend(CFSTR("pdf"), "isEqualToString:", v15) & 1) == 0
                ? (!objc_msgSend(v11, "length")
                || (v17 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v11)) == 0
                || (v18 = v17, !objc_msgSend(v17, "preferredMIMEType"))
                 ? (v16 = CFSTR("application/octet-stream"))
                 : (v16 = (__CFString *)objc_msgSend(v18, "preferredMIMEType")))
                : (v16 = CFSTR("application/pdf")))
               : (v16 = CFSTR("image/png")))
              : (v16 = CFSTR("image/gif")))
             : (v16 = CFSTR("image/jpeg")))
            : (v16 = CFSTR("image/tiff")),
              (-[__CFString hasPrefix:](v16, "hasPrefix:", CFSTR("image")) & 1) != 0)
          || (objc_msgSend((id)objc_msgSend(v13, "MIMEType"), "hasPrefix:", CFSTR("image")) & 1) != 0)
        {
          -[NSHTMLWriter _addImageElementForResource:description:inString:](self, "_addImageElementForResource:description:inString:", v13, v19, a5);
          return;
        }
        excludedElements2 = self->_excludedElements2;
      }
      if ((excludedElements2 & 0x20) == 0)
        -[NSHTMLWriter _addObjectElementForResource:description:inString:](self, "_addObjectElementForResource:description:inString:", v13, v19, a5);
    }
  }
}

- (void)_appendImageGlyph:(id)a3 withAttributes:(id)a4 toString:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int excludedElements2;
  void *v15;

  if ((~self->_excludedElements2 & 0x22) != 0)
  {
    v8 = objc_msgSend(a3, "_configuredFileWrapperForAttributes:", 0, a4);
    v9 = objc_msgSend(a3, "_fallbackFileWrapper");
    v15 = 0;
    if ((self->_excludedElements3 & 3) != 0)
    {
      v10 = -[NSHTMLWriter _resourceForFileWrapper:filename:](self, "_resourceForFileWrapper:filename:", v9, &v15);
      if (!v10)
        return;
      goto LABEL_11;
    }
    v10 = -[NSHTMLWriter _resourceForFileWrapper:filename:](self, "_resourceForFileWrapper:filename:", v8, &v15);
    v11 = -[NSHTMLWriter _resourceForFileWrapper:filename:](self, "_resourceForFileWrapper:filename:", v9, 0);
    if (!v10 || (v12 = v11) == 0)
    {
      if (!v10)
        return;
LABEL_11:
      excludedElements2 = self->_excludedElements2;
      if ((excludedElements2 & 2) != 0)
      {
        if ((excludedElements2 & 0x20) == 0)
          -[NSHTMLWriter _addObjectElementForResource:description:inString:](self, "_addObjectElementForResource:description:inString:", v10, v15, a5);
      }
      else
      {
        -[NSHTMLWriter _addImageElementForResource:description:inString:](self, "_addImageElementForResource:description:inString:", v10, v15, a5);
      }
      return;
    }
    v13 = (void *)objc_msgSend(a3, "contentDescription");
    if (!objc_msgSend(v13, "length"))
      v13 = v15;
    objc_msgSend(a5, "appendString:", CFSTR("<picture>"));
    -[NSHTMLWriter _addSourceElementForResource:MIMEType:inString:](self, "_addSourceElementForResource:MIMEType:inString:", v10, CFSTR("image/x-apple-adaptive-glyph"), a5);
    -[NSHTMLWriter _addImageElementForResource:description:inString:](self, "_addImageElementForResource:description:inString:", v12, v13, a5);
    objc_msgSend(a5, "appendString:", CFSTR("</picture>"));
  }
}

- (BOOL)_isStrictByParsingExcludedElements
{
  NSHTMLWriter *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  unsigned int *p_excludedElements3;
  NSHTMLWriter *v16;
  unsigned int *p_excludedElements2;
  unsigned int *p_excludedElements1;
  unint64_t v19;
  char v20;
  unsigned int *v21;
  char v22;
  unsigned int *v23;
  NSHTMLWriter *v25;
  unsigned int *v26;

  v2 = self;
  v3 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("ExcludedElements"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("APPLET"), CFSTR("BASEFONT"), CFSTR("CENTER"), CFSTR("DIR"), CFSTR("FONT"), CFSTR("ISINDEX"), CFSTR("MENU"), CFSTR("S"), CFSTR("STRIKE"), CFSTR("U"), 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("A"), CFSTR("ABBR"), CFSTR("ACRONYM"), CFSTR("ADDRESS"), CFSTR("B"), CFSTR("BASE"), CFSTR("BASEFONT"), CFSTR("BDO"), CFSTR("BIG"), CFSTR("BLOCKQUOTE"), CFSTR("BODY"), CFSTR("BR"), CFSTR("CAPTION"), CFSTR("CITE"), CFSTR("COL"), CFSTR("COLGROUP"), CFSTR("DD"),
                 CFSTR("DFN"),
                 CFSTR("DIV"),
                 CFSTR("DL"),
                 CFSTR("DOCTYPE"),
                 CFSTR("EM"),
                 CFSTR("FONT"),
                 CFSTR("H1"),
                 CFSTR("H2"),
                 CFSTR("H3"),
                 CFSTR("H4"),
                 CFSTR("H5"),
                 CFSTR("H6"),
                 CFSTR("HEAD"),
                 CFSTR("HR"),
                 CFSTR("HTML"),
                 CFSTR("I"),
                 CFSTR("IMG"),
                 CFSTR("LI"),
                 CFSTR("LINK"),
                 CFSTR("META"),
                 CFSTR("OBJECT"),
                 CFSTR("OL"),
                 CFSTR("P"),
                 CFSTR("PRE"),
                 CFSTR("Q"),
                 CFSTR("S"),
                 CFSTR("SMALL"),
                 CFSTR("SPAN"),
                 CFSTR("STRIKE"),
                 CFSTR("STRONG"),
                 CFSTR("STYLE"),
                 CFSTR("SUB"),
                 CFSTR("SUP"),
                 CFSTR("TABLE"),
                 CFSTR("TBODY"),
                 CFSTR("TD"),
                 CFSTR("TFOOT"),
                 CFSTR("THEAD"),
                 CFSTR("TITLE"),
                 CFSTR("TR"),
                 CFSTR("TT"),
                 CFSTR("U"),
                 CFSTR("UL"),
                 CFSTR("XML"));
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(v5, "count");
  if (!v3)
  {
    v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSHTMLExcludedElements"));
    if (!v3)
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("APPLET"), CFSTR("BASEFONT"), CFSTR("CENTER"), CFSTR("DIR"), CFSTR("FONT"), CFSTR("ISINDEX"), CFSTR("MENU"), CFSTR("S"), CFSTR("STRIKE"), CFSTR("U"), CFSTR("XML"), 0);
  }
  v8 = objc_msgSend(v3, "count");
  v9 = v8;
  if (v6)
  {
    v10 = 0;
    while (v9)
    {
      for (i = 0; i < v9; ++i)
      {
        v12 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v10), "compare:options:", objc_msgSend(v3, "objectAtIndex:", i), 1);
        v13 = v12 == 0;
        if (!v12)
          break;
      }
      if (!v12 && ++v10 < v6)
        continue;
      goto LABEL_14;
    }
    v13 = 0;
  }
  else
  {
    v13 = 1;
    if (v8)
    {
LABEL_14:
      v14 = 0;
      p_excludedElements3 = &v2->_excludedElements3;
      v16 = v2;
      p_excludedElements2 = &v2->_excludedElements2;
      v25 = v16;
      v26 = p_excludedElements3;
      p_excludedElements1 = &v16->_excludedElements1;
      do
      {
        if (v7)
        {
          v19 = 0;
          while (objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v19), "compare:options:", objc_msgSend(v3, "objectAtIndex:", v14), 1))
          {
            if (++v19 >= v7)
              goto LABEL_30;
          }
          v20 = v19 - 64;
          if (v19 > 0x3F)
          {
            v21 = v26;
          }
          else
          {
            v20 = v19 - 32;
            v21 = p_excludedElements2;
          }
          if (v19 <= 0x1F)
            v22 = v19;
          else
            v22 = v20;
          if (v19 <= 0x1F)
            v23 = p_excludedElements1;
          else
            v23 = v21;
          *v23 |= 1 << v22;
        }
LABEL_30:
        ++v14;
      }
      while (v14 != v9);
      v2 = v25;
    }
  }
  return (v2->_excludedElements2 & 0x80) == 0 && v13;
}

- (void)_prepareString:(id)a3 forConversionToEncoding:(unint64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  CFIndex v9;
  const __CFString *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  CFRange range;
  _QWORD v22[2];
  uint64_t v23;

  v6 = objc_msgSend(a3, "length");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v22[1] = 0;
    v23 = 0;
    range.length = 0;
    v22[0] = 0;
    range.location = 0;
    v10 = (const __CFString *)*MEMORY[0x1E0C9B368];
    v11 = v6;
    v12 = 0;
    do
    {
      if (16 * v11 <= v11)
        v13 = v11;
      else
        v13 = 16 * v11;
      if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, v13, &v23, a4, 0, v9, v11, v22, range.location, range.length))v14 = v23 == 0;
      else
        v14 = 1;
      if (!v14)
      {
        v12 = v8;
        if (v22[0] > v8)
        {
          v15 = objc_msgSend(a3, "rangeOfComposedCharacterSequenceAtIndex:", v22[0] - 1);
          if ((unint64_t)(v15 + v16) <= v22[0])
            v12 = v22[0];
          else
            v12 = v15;
        }
      }
      v11 = v7 - v12;
      if (v7 <= v12)
        break;
      if (v12 <= v8)
      {
        v17 = objc_msgSend(a3, "rangeOfComposedCharacterSequenceAtIndex:", v8);
        v19 = v17 + v18;
        range.location = v9;
        range.length = v17 + v18 - v8;
        if (CFStringTransform((CFMutableStringRef)a3, &range, v10, 0))
          v12 = range.length + range.location;
        else
          v12 = v19;
        v20 = objc_msgSend(a3, "length");
        v11 = v20 - v12;
        if (v20 <= v12)
          return;
        v7 = v20;
        if (v12 <= v8)
        {
          v12 = v8 + 1;
          if (v20 <= v8 + 1)
            return;
          v11 = v20 + ~v8;
        }
      }
      v8 = v12;
      v9 = v12;
    }
    while (v11);
  }
}

- (id)markElementFor:(id)a3 spanClass:(unint64_t)a4 paraClass:(unint64_t)a5
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("NSTextHighlightStyleDefault"), a4, a5))
    return CFSTR("<mark style=\"background-color: rgba(0, 0, 0, 0.0)\">");
  else
    return CFSTR("<mark>");
}

- (void)_generateHTML
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  id v20;
  void *v21;
  NSString *v22;
  unint64_t v23;
  CFStringEncoding v24;
  uint64_t characterEncoding;
  uint64_t v26;
  NSString *textEncodingName;
  CFStringEncoding v28;
  NSString *v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  unint64_t v34;
  int v35;
  BOOL v36;
  int v37;
  id v38;
  void *v39;
  int v40;
  int v41;
  BOOL v42;
  unint64_t v43;
  id v44;
  int v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  NSMutableString *v52;
  uint64_t v53;
  NSMutableString *v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  const __CFString *v58;
  char v59;
  unint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL8 v64;
  char v65;
  unint64_t v66;
  unint64_t i;
  unsigned int v68;
  unint64_t v69;
  unsigned int excludedElements1;
  unsigned int excludedElements2;
  NSMutableString *v72;
  id v73;
  int v74;
  char v75;
  char v76;
  char v77;
  NSMutableString *v78;
  id v79;
  NSMutableString *v80;
  unint64_t v81;
  NSMutableString *bodyStr;
  id v83;
  unsigned int v84;
  unsigned int v85;
  uint64_t v86;
  NSMutableString *v87;
  id v88;
  unsigned int v89;
  unsigned int v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  const __CFString *v94;
  const __CFString *v95;
  id v96;
  char v97;
  unint64_t v98;
  char v99;
  const __CFString *v100;
  const __CFString *v101;
  uint64_t v102;
  unint64_t v103;
  BOOL v104;
  unint64_t v105;
  int v106;
  unint64_t v107;
  NSMutableString *v108;
  const __CFString *v109;
  id v110;
  id v111;
  const __CFString *v112;
  $2D985FE1209761417A79CA1E24509E35 flags;
  uint64_t v114;
  unsigned int v115;
  char v116;
  BOOL v117;
  char v118;
  unint64_t v119;
  int v120;
  int v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  _BOOL4 v125;
  _BOOL4 v126;
  const __CFString *v127;
  int v128;
  _BOOL4 v129;
  unint64_t v130;
  void *v131;
  unint64_t v132;
  void *v133;
  unint64_t v134;
  const __CFString *v135;
  const __CFString *v136;
  const __CFString *v137;
  uint64_t v138;
  uint64_t v139;
  const __CFString *v140;
  _BOOL4 v141;
  int v142;
  _BOOL4 v143;
  int v144;
  uint64_t v145;
  char v146;
  uint64_t v147;
  const __CFString *v148;
  const __CFString *v149;
  const __CFString *v150;
  NSMutableString *v151;
  const __CFString *v152;
  unsigned int v153;
  unsigned int v154;
  void *v155;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  id v162;
  const __CFString *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t j;
  uint64_t v178;
  uint64_t v179;
  uint64_t k;
  uint64_t v181;
  uint64_t v182;
  uint64_t m;
  uint64_t v184;
  uint64_t v185;
  uint64_t n;
  uint64_t v187;
  uint64_t v188;
  uint64_t ii;
  unsigned int v190;
  unsigned int v191;
  NSData *v192;
  NSData *htmlData;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  __CFString *v198;
  uint64_t v199;
  _BOOL4 v200;
  char v201;
  unint64_t v202;
  void *v203;
  unint64_t v204;
  unint64_t v205;
  BOOL v206;
  void *v207;
  NSParagraphStyle *v208;
  NSDictionary *v209;
  uint64_t v210;
  char v211;
  unint64_t v212;
  NSMutableString *v213;
  unint64_t v214;
  void *v215;
  id v216;
  void *v217;
  char v218;
  uint64_t v219;
  uint64_t v220;
  id v221;
  NSString *v222;
  CFRange range;
  uint64_t v224;
  const __CFString *v225;
  const __CFString *v226;
  uint64_t v227;
  _OWORD v228[2];

  v222 = -[NSAttributedString string](self->_attrStr, "string");
  v220 = -[NSString length](v222, "length");
  v198 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v221 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("CharacterEncoding"));
  v4 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("PrefixSpaces"));
  v5 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("InterchangeNewline"));
  v6 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("NoDefaultFonts"));
  v7 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("TabsToSpaces"));
  v8 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("CoalesceTabSpans"));
  v196 = _colorValForColor_0(-[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("BackgroundColor")));
  v228[0] = xmmword_18D6CBB80;
  v226 = 0;
  v227 = 0;
  v224 = 0;
  v225 = 0;
  v200 = -[NSHTMLWriter _isStrictByParsingExcludedElements](self, "_isStrictByParsingExcludedElements");
  self->_bodyStr = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v9 = objc_alloc(MEMORY[0x1E0CB3650]);
  self->_fileWrapper = (NSFileWrapper *)objc_msgSend(v9, "initDirectoryWithFileWrappers:", MEMORY[0x1E0C9AA70]);
  self->_subresources = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_paraStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_paraStyleArrays = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_paraStyleIndexes = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  self->_listItemStyleIndexes = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  self->_charStyleStrings = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  self->_fontDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_charStyleArrays = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_fontStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_tableStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_tableCellStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_blockStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_olistStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_ulistStyleStrings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_fontNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_level = 0;
  if (v4)
    v10 = objc_msgSend(v4, "integerValue");
  else
    v10 = objc_msgSend(v3, "integerForKey:", CFSTR("NSHTMLPrefixSpaces"));
  self->_prefixSpaces = v10;
  v11 = v220;
  if ((v10 & 0x8000000000000000) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (v10 < 0x11)
      goto LABEL_9;
    v12 = 16;
  }
  self->_prefixSpaces = v12;
LABEL_9:
  if (v5)
  {
    v13 = objc_msgSend(v5, "integerValue") > 0;
  }
  else
  {
    if (!objc_msgSend(v3, "objectForKey:", CFSTR("NSHTMLInterchangeNewline")))
      goto LABEL_14;
    v13 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSHTMLInterchangeNewline"));
  }
  self->_flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v13);
LABEL_14:
  if (v6)
  {
    v14 = objc_msgSend(v6, "integerValue") > 0;
  }
  else
  {
    if (!objc_msgSend(v3, "objectForKey:", CFSTR("NSHTMLNoDefaultFonts")))
      goto LABEL_22;
    v14 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSHTMLNoDefaultFonts"));
  }
  if (v14)
    v15 = 2;
  else
    v15 = 0;
  self->_flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v15);
LABEL_22:
  if (v7)
  {
    v16 = objc_msgSend(v7, "integerValue") > 0;
  }
  else
  {
    if (!objc_msgSend(v3, "objectForKey:", CFSTR("NSHTMLTabsToSpaces")))
      goto LABEL_30;
    v16 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSHTMLTabsToSpaces"));
  }
  if (v16)
    v17 = 4;
  else
    v17 = 0;
  self->_flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v17);
LABEL_30:
  if (v8)
  {
    v18 = objc_msgSend(v8, "integerValue") > 0;
  }
  else
  {
    if (!objc_msgSend(v3, "objectForKey:", CFSTR("NSHTMLCoalesceTabSpans")))
      goto LABEL_38;
    v18 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSHTMLCoalesceTabSpans"));
  }
  if (v18)
    v19 = 8;
  else
    v19 = 0;
  self->_flags = ($2D985FE1209761417A79CA1E24509E35)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v19);
LABEL_38:
  v20 = objc_allocWithZone(MEMORY[0x1E0CB3650]);
  v21 = (void *)objc_msgSend(v20, "initRegularFileWithContents:", objc_msgSend(MEMORY[0x1E0C99D50], "data"));
  objc_msgSend(v21, "setPreferredFilename:", CFSTR("index.html"));
  -[NSFileWrapper addFileWrapper:](self->_fileWrapper, "addFileWrapper:", v21);
  v22 = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("TextEncodingName"));
  self->_textEncodingName = v22;
  if (!v22)
    self->_textEncodingName = (NSString *)objc_msgSend(v3, "stringForKey:", CFSTR("NSHTMLTextEncodingName"));
  if (v221)
    v23 = objc_msgSend(v221, "unsignedIntegerValue");
  else
    v23 = objc_msgSend(v3, "integerForKey:", CFSTR("NSHTMLCharacterEncoding"));
  self->_characterEncoding = v23;
  v197 = v21;
  if (v23)
  {
    v24 = CFStringConvertNSStringEncodingToEncoding(v23);
    self->_textEncodingName = (NSString *)CFStringConvertEncodingToIANACharSetName(v24);
LABEL_45:
    characterEncoding = self->_characterEncoding;
    goto LABEL_46;
  }
  textEncodingName = self->_textEncodingName;
  if (!textEncodingName)
    goto LABEL_57;
  v28 = CFStringConvertIANACharSetNameToEncoding((CFStringRef)textEncodingName);
  if (v28 == -1)
    goto LABEL_45;
  characterEncoding = CFStringConvertEncodingToNSStringEncoding(v28);
  self->_characterEncoding = characterEncoding;
LABEL_46:
  if (characterEncoding > 2415919359)
  {
    if (characterEncoding > 2550137087)
    {
      if (characterEncoding == 2550137088)
        goto LABEL_63;
      v26 = 2617245952;
    }
    else
    {
      if (characterEncoding == 2415919360)
        goto LABEL_63;
      v26 = 2483028224;
    }
LABEL_62:
    if (characterEncoding != v26)
      goto LABEL_64;
    goto LABEL_63;
  }
  if (characterEncoding > 9)
  {
    if (characterEncoding == 10)
      goto LABEL_63;
    v26 = 2348810496;
    goto LABEL_62;
  }
  if (!characterEncoding)
  {
LABEL_57:
    self->_textEncodingName = (NSString *)CFSTR("UTF-8");
    self->_characterEncoding = 4;
    goto LABEL_63;
  }
  if (characterEncoding == 4)
LABEL_63:
    *(_DWORD *)&self->_flags |= 0x20u;
LABEL_64:
  v29 = self->_textEncodingName;
  self->_outputBaseURL = (NSURL *)-[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("OutputBaseURL"));
  self->_resourceHandler = -[NSDictionary objectForKey:](self->_documentAttrs, "objectForKey:", CFSTR("WebResourceHandler"));
  if (v220)
  {
    v30 = 0;
    v31 = 0;
    v204 = 0;
    v208 = 0;
    v209 = 0;
    v32 = 0;
    v206 = 0;
    v211 = 0;
    v218 = 0;
    LOBYTE(v33) = 0;
    v216 = 0;
    v210 = 0;
    v214 = 0;
    v212 = 0;
    v202 = 0;
    v217 = 0;
    v199 = *MEMORY[0x1E0CB3040];
    v205 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v35 = -[NSString characterAtIndex:](v222, "characterAtIndex:", v30);
      v36 = v30 < *(_QWORD *)&v228[0] || v30 - *(_QWORD *)&v228[0] >= *((_QWORD *)&v228[0] + 1);
      v215 = v32;
      if (!v36)
      {
        v40 = 0;
        goto LABEL_297;
      }
      v224 = 0;
      v209 = -[NSAttributedString attributesAtIndex:effectiveRange:](self->_attrStr, "attributesAtIndex:effectiveRange:", v30, v228);
      if (v30 && (v35 == 10 || v35 == 8233 || v35 == 13))
      {
        v37 = -[NSString characterAtIndex:](v222, "characterAtIndex:", v30 - 1);
        if (v37 != 10 && v37 != 13 && v37 != 8233)
        {
          v209 = -[NSAttributedString attributesAtIndex:effectiveRange:](self->_attrStr, "attributesAtIndex:effectiveRange:", v30 - 1, v228);
          if (v30 < *(_QWORD *)&v228[0] || v30 - *(_QWORD *)&v228[0] >= *((_QWORD *)&v228[0] + 1))
            ++*((_QWORD *)&v228[0] + 1);
        }
      }
      if ((self->_excludedElements1 & 1) == 0)
      {
        v38 = -[NSDictionary objectForKey:](v209, "objectForKey:", CFSTR("NSLink"));
        if (!v38)
          goto LABEL_89;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = v38;
LABEL_87:
          v38 = _escapedStringForString(v39, 1);
          goto LABEL_89;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = (void *)objc_msgSend(v38, "absoluteString");
          goto LABEL_87;
        }
      }
      v38 = 0;
LABEL_89:
      if (v32 == v38)
      {
        v41 = 0;
      }
      else if (v32)
      {
        v41 = objc_msgSend(v32, "isEqualToString:", v38) ^ 1;
      }
      else
      {
        v41 = 1;
      }
      if (v38)
        v42 = v32 == 0;
      else
        v42 = 0;
      if (v42)
        v43 = v212;
      else
        v43 = v214;
      if ((self->_excludedElements2 & 0x1000) != 0)
        v44 = 0;
      else
        v44 = -[NSDictionary objectForKey:](v209, "objectForKey:", CFSTR("NSWritingDirection"));
      if (v216 == v44)
      {
        v45 = 0;
      }
      else if (v216)
      {
        v45 = objc_msgSend(v216, "isEqual:", v44) ^ 1;
      }
      else
      {
        v45 = 1;
      }
      if ((self->_excludedElements3 & 4) != 0)
        v46 = 0;
      else
        v46 = -[NSDictionary objectForKey:](v209, "objectForKey:", CFSTR("NSTextHighlightStyle"));
      v207 = v46;
      v201 = objc_msgSend(v46, "isEqual:", v217);
      v203 = v38;
      if (v30 <= v204)
      {
        v208 = -[NSDictionary objectForKey:](v209, "objectForKey:", CFSTR("NSParagraphStyle"));
        if (!v208)
          v208 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
        v61 = 1;
        v205 = -[NSString paragraphRangeForRange:](v222, "paragraphRangeForRange:", v30, 1);
        v219 = v62;
        v63 = 0;
        if (v35 <= 12)
        {
          if (v35 == 9)
            goto LABEL_164;
          v64 = 0;
          if (v35 != 10)
            goto LABEL_174;
        }
        else if (v35 != 13)
        {
          if (v35 != 8233)
          {
            v64 = 0;
            if (v35 != 32)
              goto LABEL_174;
          }
LABEL_164:
          v61 = v35 == 8233;
        }
        v66 = v205 + v62;
        for (i = v30 + 1; i < v66; ++i)
        {
          v68 = -[NSString characterAtIndex:](v222, "characterAtIndex:", i);
          if ((v68 > 0x20 || ((1 << v68) & 0x100002600) == 0) && v68 != 8233)
          {
            v63 = 0;
            goto LABEL_173;
          }
        }
        v63 = 1;
LABEL_173:
        v64 = v61;
LABEL_174:
        v202 = -[NSHTMLWriter _paragraphClassforParagraphStyle:presentationIntent:range:isEmpty:isCompletelyEmpty:headerString:alignmentString:directionString:](self, "_paragraphClassforParagraphStyle:presentationIntent:range:isEmpty:isCompletelyEmpty:headerString:alignmentString:directionString:", v208, -[NSDictionary objectForKey:](v209, "objectForKey:", v199), v205, v219, v63, v64, &v227, &v226, &v225);
        if ((self->_excludedElements1 & 0x400000) != 0 || !v226)
          v226 = &stru_1E260C7D0;
        v206 = v64;
        v11 = v220;
        if (!v225)
          v225 = &stru_1E260C7D0;
        v69 = -[NSHTMLWriter _spanClassForAttributes:inParagraphClass:spanClass:flags:](self, "_spanClassForAttributes:inParagraphClass:spanClass:flags:", v209, v202, 0, &v224);
        -[NSHTMLWriter _openBlocksForParagraphStyle:atIndex:inString:](self, "_openBlocksForParagraphStyle:atIndex:inString:", v208, v30, self->_bodyStr);
        -[NSHTMLWriter _openListsForParagraphStyle:atIndex:inString:isStrict:](self, "_openListsForParagraphStyle:atIndex:inString:isStrict:", v208, v30, self->_bodyStr, v200);
        if (!v227)
          goto LABEL_230;
        if (!v202)
        {
          bodyStr = self->_bodyStr;
          v83 = -[NSHTMLWriter _prefix](self, "_prefix");
          -[NSMutableString appendFormat:](bodyStr, "appendFormat:", CFSTR("%@<%@%@%@>"), v83, v227, v226, v225);
          if (v69)
            goto LABEL_231;
          goto LABEL_260;
        }
        excludedElements1 = self->_excludedElements1;
        excludedElements2 = self->_excludedElements2;
        if (!(excludedElements1 & 0x20000000 | excludedElements2 & 0x9000))
        {
          if ((objc_msgSend(CFSTR("p"), "isEqualToString:") & 1) != 0)
          {
            v72 = self->_bodyStr;
            v73 = -[NSHTMLWriter _prefix](self, "_prefix");
            -[NSMutableString appendFormat:](v72, "appendFormat:", CFSTR("%@<%@%@%@ class=\"p%lu\">"), v73, v227, v226, v225, v202);
            goto LABEL_229;
          }
          excludedElements1 = self->_excludedElements1;
          excludedElements2 = self->_excludedElements2;
        }
        if (!(excludedElements1 & 0x20000000 | excludedElements2 & 0x9000))
        {
          if ((objc_msgSend(CFSTR("li"), "isEqualToString:", v227) & 1) != 0)
          {
            v87 = self->_bodyStr;
            v88 = -[NSHTMLWriter _prefix](self, "_prefix");
            -[NSMutableString appendFormat:](v87, "appendFormat:", CFSTR("%@<%@%@%@ class=\"li%lu\">"), v88, v227, v226, v225, v202);
LABEL_229:
            v11 = v220;
LABEL_230:
            if (v69)
            {
LABEL_231:
              if ((self->_excludedElements1 & 0x400000) != 0)
              {
                if ((self->_excludedElements2 & 0x1000) == 0)
                {
                  -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("<span"));
                  goto LABEL_235;
                }
              }
              else
              {
                -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<font%@"), -[NSMutableArray objectAtIndex:](self->_fontStrings, "objectAtIndex:", v69 - 1));
LABEL_235:
                v89 = self->_excludedElements1;
                v90 = self->_excludedElements2;
                if (v89 & 0x20000000 | v90 & 0x9000)
                {
                  if ((v90 & 0x1000) != 0)
                    -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR(">"));
                  else
                    -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR(" style=\"%@\">"), -[NSMutableOrderedSet objectAtIndex:](self->_charStyleStrings, "objectAtIndex:", v69 - 1), v194);
                }
                else
                {
                  v42 = (v89 & 0x400000) == 0;
                  v91 = 115;
                  if (v42)
                    v91 = 102;
                  -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR(" class=\"%c%lu\">"), v91, v69);
                }
              }
            }
LABEL_260:
            if (v38)
            {
              -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<a href=\"%@\">"), v38);
              v214 = v69;
            }
            if (v207)
              v97 = v201;
            else
              v97 = 1;
            if ((v97 & 1) == 0)
              -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSHTMLWriter markElementFor:spanClass:paraClass:](self, "markElementFor:spanClass:paraClass:", v207, v69, v202));
            if (v44
              && (unint64_t)objc_msgSend(v44, "count") >= 2
              && (self->_excludedElements2 & 0x1000) == 0
              && (unint64_t)objc_msgSend(v44, "count") >= 2)
            {
              v98 = 1;
              do
              {
                v99 = objc_msgSend((id)objc_msgSend(v44, "objectAtIndex:", v98), "unsignedIntegerValue");
                v100 = CFSTR("ltr");
                if ((v99 & 1) != 0)
                  v100 = CFSTR("rtl");
                v101 = CFSTR("bidi-override");
                if ((v99 & 2) == 0)
                  v101 = CFSTR("embed");
                -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<span style=\"direction: %@; unicode-bidi: %@\">"),
                  v100,
                  v101);
                ++v98;
              }
              while (v98 < objc_msgSend(v44, "count"));
            }
            -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", 0, v224, self->_bodyStr);
            v102 = -[NSArray count](-[NSParagraphStyle textLists](v208, "textLists"), "count");
            LOBYTE(v33) = 0;
            if (v35 == 9 && v102)
            {
              v103 = v30;
              while (++v103 < v205 + v219)
              {
                if (-[NSString characterAtIndex:](v222, "characterAtIndex:", v103) == 9)
                {
                  v48 = v69;
                  LOBYTE(v33) = 0;
                  v218 = 0;
                  v211 = 0;
                  v31 = v103 + 1;
                  v40 = 1;
                  v81 = v214;
                  v30 = v103;
                  goto LABEL_285;
                }
              }
              v48 = v69;
              LOBYTE(v33) = 0;
              v218 = 0;
              v211 = 0;
              v40 = 0;
              v81 = v214;
LABEL_285:
              v11 = v220;
            }
            else
            {
              v48 = v69;
              v81 = v214;
              v218 = 0;
              v211 = 0;
              v40 = 0;
            }
            goto LABEL_290;
          }
          excludedElements2 = self->_excludedElements2;
        }
        v213 = self->_bodyStr;
        v96 = -[NSHTMLWriter _prefix](self, "_prefix");
        if ((excludedElements2 & 0x1000) != 0)
          -[NSMutableString appendFormat:](v213, "appendFormat:", CFSTR("%@<%@%@%@>"), v96, v227, v226, v225, v195);
        else
          -[NSMutableString appendFormat:](v213, "appendFormat:", CFSTR("%@<%@%@%@ style=\"%@\">"), v96, v227, v226, v225, -[NSMutableArray objectAtIndex:](self->_paraStyleStrings, "objectAtIndex:", v202 - 1));
        v11 = v220;
        if (v69)
          goto LABEL_231;
        goto LABEL_260;
      }
      if (v38)
        v47 = v43;
      else
        v47 = 0;
      v48 = -[NSHTMLWriter _spanClassForAttributes:inParagraphClass:spanClass:flags:](self, "_spanClassForAttributes:inParagraphClass:spanClass:flags:", v209, v202, v47, &v224);
      v49 = v30 - v31;
      if (v30 > v31)
      {
        v50 = v31;
        v51 = v43;
        v52 = self->_bodyStr;
        v53 = -[NSString substringWithRange:](v222, "substringWithRange:", v50, v49);
        v54 = v52;
        v43 = v51;
        -[NSMutableString appendString:](v54, "appendString:", v53);
      }
      v55 = v212;
      if (v48 == v212)
        v56 = v41;
      else
        v56 = 1;
      if ((v56 | v45) != 1)
      {
        v65 = v201;
        if (v210 != v224)
          v65 = 0;
        if ((v65 & 1) != 0)
        {
          v40 = 0;
          v48 = v212;
          v31 = v30;
          v11 = v220;
        }
        else
        {
          if ((v218 & 1) != 0)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
          v11 = v220;
          if ((v33 & 1) != 0)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
          if ((v211 & 1) != 0)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
          -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", v210, 0, self->_bodyStr);
          if (v217)
            v76 = v201;
          else
            v76 = 1;
          if ((v76 & 1) == 0)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</mark>"));
          if (v207)
            v77 = v201;
          else
            v77 = 1;
          if ((v77 & 1) == 0)
          {
            v78 = self->_bodyStr;
            v79 = -[NSHTMLWriter markElementFor:spanClass:paraClass:](self, "markElementFor:spanClass:paraClass:");
            v80 = v78;
            v55 = v212;
            -[NSMutableString appendString:](v80, "appendString:", v79);
          }
          -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", 0, v224, self->_bodyStr);
          LOBYTE(v33) = 0;
          v218 = 0;
          v211 = 0;
          v40 = 0;
          v48 = v55;
          v31 = v30;
        }
        v81 = v43;
        goto LABEL_290;
      }
      if ((v218 & 1) != 0)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
      if ((v33 & 1) != 0)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
      if ((v211 & 1) != 0)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v49);
      -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", v210, 0, self->_bodyStr);
      v11 = v220;
      if (v216
        && (unint64_t)objc_msgSend(v216, "count") >= 2
        && (self->_excludedElements2 & 0x1000) == 0
        && (unint64_t)objc_msgSend(v216, "count") >= 2)
      {
        v57 = 1;
        do
        {
          -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
          ++v57;
        }
        while (v57 < objc_msgSend(v216, "count"));
      }
      if (v212)
      {
        if (v212 != v43)
        {
          v58 = CFSTR("</font>");
          if ((self->_excludedElements1 & 0x400000) == 0
            || (v58 = CFSTR("</span>"), (self->_excludedElements2 & 0x1000) == 0))
          {
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", v58);
          }
        }
      }
      if (v217)
        v59 = v201;
      else
        v59 = 1;
      if ((v59 & 1) == 0)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</mark>"));
      if (!v215
        || ((v41 ^ 1) & 1) != 0
        || (-[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</a>")), v203)
        || !v43
        || v48 == v43)
      {
        if (v203)
          v74 = v41;
        else
          v74 = 0;
        v60 = v48;
        if (v74 == 1)
          -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<a href=\"%@\">"), v203);
      }
      else if ((self->_excludedElements1 & 0x400000) != 0)
      {
        v60 = v48;
        if ((self->_excludedElements2 & 0x1000) == 0)
          -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
      }
      else
      {
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</font>"));
        v60 = v48;
      }
      if (v207)
        v75 = v201;
      else
        v75 = 1;
      if ((v75 & 1) == 0)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSHTMLWriter markElementFor:spanClass:paraClass:](self, "markElementFor:spanClass:paraClass:", v207, v60, v202));
      if (!v60 || v60 == v43)
        goto LABEL_244;
      if ((self->_excludedElements1 & 0x400000) != 0)
      {
        if ((self->_excludedElements2 & 0x1000) != 0)
          goto LABEL_244;
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("<span"));
      }
      else
      {
        -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<font%@"), -[NSMutableArray objectAtIndex:](self->_fontStrings, "objectAtIndex:", v60 - 1));
      }
      v84 = self->_excludedElements1;
      v85 = self->_excludedElements2;
      if (!(v84 & 0x20000000 | v85 & 0x9000))
      {
        v42 = (v84 & 0x400000) == 0;
        v86 = 115;
        if (v42)
          v86 = 102;
        -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR(" class=\"%c%lu\">"), v86, v60);
        if (!v44)
          goto LABEL_289;
LABEL_245:
        if ((unint64_t)objc_msgSend(v44, "count") >= 2
          && (self->_excludedElements2 & 0x1000) == 0
          && (unint64_t)objc_msgSend(v44, "count") >= 2)
        {
          v92 = 1;
          do
          {
            v93 = objc_msgSend((id)objc_msgSend(v44, "objectAtIndex:", v92), "unsignedIntegerValue");
            v94 = CFSTR("ltr");
            if ((v93 & 1) != 0)
              v94 = CFSTR("rtl");
            v95 = CFSTR("bidi-override");
            if ((v93 & 2) == 0)
              v95 = CFSTR("embed");
            -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<span style=\"direction: %@; unicode-bidi: %@\">"),
              v94,
              v95);
            ++v92;
          }
          while (v92 < objc_msgSend(v44, "count"));
        }
        goto LABEL_289;
      }
      if ((v85 & 0x1000) == 0)
      {
        -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR(" style=\"%@\">"), -[NSMutableOrderedSet objectAtIndex:](self->_charStyleStrings, "objectAtIndex:", v60 - 1));
LABEL_244:
        if (v44)
          goto LABEL_245;
        goto LABEL_289;
      }
      -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR(">"));
      if (v44)
        goto LABEL_245;
LABEL_289:
      -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", 0, v224, self->_bodyStr);
      LOBYTE(v33) = 0;
      v218 = 0;
      v211 = 0;
      v40 = 0;
      v31 = v30;
      v81 = v43;
LABEL_290:
      if (v203)
        v104 = 1;
      else
        v104 = v215 == 0;
      v210 = v224;
      if (v104)
        v105 = v81;
      else
        v105 = 0;
      v214 = v105;

      v215 = (void *)objc_msgSend(v203, "copy");
      v216 = (id)objc_msgSend(v44, "copy");

      v217 = (void *)objc_msgSend(v207, "copy");
      v212 = v48;
LABEL_297:
      if (v35 != 9 && (v218 & 1) != 0)
      {
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
        v218 = 0;
      }
      if ((v33 & 1) == 0)
        goto LABEL_304;
      LODWORD(v33) = 1;
      if (v35 != 9 && v35 != 32)
      {
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
LABEL_304:
        LODWORD(v33) = 0;
      }
      if (v35 != 9 && (v211 & 1) != 0)
      {
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
        v211 = 0;
      }
      if (v35 == 9)
        v106 = v40;
      else
        v106 = 1;
      if (v35 == 32 || !v106)
        goto LABEL_323;
      if ((self->_excludedElements1 & 0x800) != 0)
      {
        if (v35 <= 0x3E && ((1 << v35) & 0x5000004000000000) != 0)
          goto LABEL_323;
      }
      else
      {
        if (v35 <= 132)
        {
          if (v35 <= 0x3E && ((1 << v35) & 0x5000004000000000) != 0)
            goto LABEL_323;
          goto LABEL_345;
        }
        if (v35 == 133 || v35 == 8232)
          goto LABEL_323;
      }
      if (v35 == 65532)
        goto LABEL_323;
LABEL_345:
      if (v35 > 0x1F || v35 <= 0xD && ((1 << v35) & 0x2600) != 0)
        goto LABEL_411;
LABEL_323:
      v34 = v30 - v31;
      if (v30 > v31)
        -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v222, "substringWithRange:", v31, v34));
      v107 = v30 + 1;
      if (v35 == 32)
      {
LABEL_353:
        v114 = -[NSMutableString length](self->_bodyStr, "length");
        if (v30)
          v115 = -[NSString characterAtIndex:](v222, "characterAtIndex:", v30 - 1);
        else
          v115 = 0;
        v116 = 1;
        if (v30 > v205 && (v115 > 0xD || ((1 << v115) & 0x2401) == 0) && v115 - 8232 >= 2 && v115 != 133)
          v116 = 0;
        if (v114)
          v117 = -[NSMutableString characterAtIndex:](self->_bodyStr, "characterAtIndex:", v114 - 1) == 32;
        else
          v117 = 0;
        if (v107 >= v11)
        {
          v118 = 0;
          v121 = 1;
          goto LABEL_375;
        }
        v118 = 0;
        v119 = v30 + 1;
        while (1)
        {
          v120 = -[NSString characterAtIndex:](v222, "characterAtIndex:", v119);
          v121 = 1;
          if (v120 <= 12)
          {
            if (v120 != 9)
            {
              if (v120 != 10)
                goto LABEL_388;
              goto LABEL_375;
            }
            v122 = 4;
          }
          else
          {
            if (v120 != 32)
            {
              if (v120 != 13 && v120 != 8233)
LABEL_388:
                v121 = 0;
LABEL_375:
              if (v35 == 9)
              {
                v123 = self->_excludedElements2;
                if ((v123 & 0x1000) == 0)
                {
                  if (((v33 | ((v123 & 0x20000000) >> 29)) & 1) == 0)
                  {
                    -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("<span class=\"Apple-converted-space\">"));
                    LOBYTE(v33) = 1;
                  }
                  if ((v218 & 1) != 0)
                  {
LABEL_382:
                    v218 = 1;
                  }
                  else
                  {
                    if ((self->_excludedElements2 & 0x40000000) == 0)
                    {
                      -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("<span class=\"Apple-converted-tab\">"));
                      goto LABEL_382;
                    }
                    v218 = 0;
                  }
                }
                v124 = 3;
                goto LABEL_395;
              }
              v124 = 0;
LABEL_395:
              while (2)
              {
                if ((v116 & 1) != 0 || v117 || v121 != ((v118 + (_BYTE)v124) & 1))
                {
                  if ((v33 & 1) == 0)
                  {
                    if ((self->_excludedElements2 & 0x20001000) != 0)
                    {
                      LOBYTE(v33) = 0;
LABEL_404:
                      if ((*(_BYTE *)&self->_flags & 0x20) != 0)
                      {
                        v117 = 0;
                        v127 = CFSTR(" ");
                      }
                      else
                      {
                        v117 = 0;
                        if (self->_characterEncoding == 5)
                          v127 = CFSTR(" ");
                        else
                          v127 = CFSTR("&nbsp;");
                      }
LABEL_409:
                      -[NSMutableString appendString:](self->_bodyStr, "appendString:", v127);
                      v116 = 0;
                      if (--v124 == -1)
                      {
                        v31 = v30 + 1;
                        v11 = v220;
                        goto LABEL_411;
                      }
                      continue;
                    }
                    -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("<span class=\"Apple-converted-space\">"));
                  }
                  LOBYTE(v33) = 1;
                  goto LABEL_404;
                }
                break;
              }
              v117 = 1;
              v127 = CFSTR(" ");
              goto LABEL_409;
            }
            v122 = 1;
          }
          v118 += v122;
          if (v220 == ++v119)
            goto LABEL_375;
        }
      }
      if (v35 <= 61)
      {
        switch(v35)
        {
          case 9:
            flags = self->_flags;
            if ((*(_BYTE *)&flags & 4) != 0)
              goto LABEL_353;
            if ((self->_excludedElements2 & 0x40001000) == 0)
            {
              if ((*(_BYTE *)&flags & 8) != 0)
              {
                if ((v211 & 1) != 0)
                {
                  v151 = self->_bodyStr;
                  v152 = CFSTR("\t");
                }
                else
                {
                  v151 = self->_bodyStr;
                  if (self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000)
                    v152 = CFSTR("<span class=\"Apple-tab-span\" style=\"white-space:pre\">\t");
                  else
                    v152 = CFSTR("<span class=\"Apple-tab-span\">\t");
                }
                -[NSMutableString appendString:](v151, "appendString:", v152, v34);
                v211 = 1;
              }
              else
              {
                if (self->_excludedElements1 & 0x20000000 | self->_excludedElements2 & 0x8000)
                  v150 = CFSTR("<span class=\"Apple-tab-span\" style=\"white-space:pre\">\t</span>");
                else
                  v150 = CFSTR("<span class=\"Apple-tab-span\">\t</span>");
                -[NSMutableString appendString:](self->_bodyStr, "appendString:", v150, v34);
              }
              v125 = 0;
              v126 = 0;
              *(_DWORD *)&self->_flags |= 0x10u;
              goto LABEL_392;
            }
            v108 = self->_bodyStr;
            v109 = CFSTR("\t");
LABEL_390:
            -[NSMutableString appendString:](v108, "appendString:", v109, v34);
            goto LABEL_391;
          case 38:
            v108 = self->_bodyStr;
            v109 = CFSTR("&amp;");
            goto LABEL_390;
          case 60:
            v108 = self->_bodyStr;
            v109 = CFSTR("&lt;");
            goto LABEL_390;
        }
        goto LABEL_344;
      }
      if (v35 > 8231)
      {
        if (v35 != 8232)
        {
          if (v35 == 65532)
          {
            v110 = -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attrStr, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v30, 0);
            if (v110)
              -[NSHTMLWriter _appendAttachment:atIndex:toString:](self, "_appendAttachment:atIndex:toString:", v110, v30, self->_bodyStr);
            v111 = -[NSAttributedString attribute:atIndex:effectiveRange:](self->_attrStr, "attribute:atIndex:effectiveRange:", CFSTR("CTAdaptiveImageProvider"), v30, 0);
            if (v111)
              -[NSHTMLWriter _appendImageGlyph:withAttributes:toString:](self, "_appendImageGlyph:withAttributes:toString:", v111, v209, self->_bodyStr);
LABEL_391:
            v125 = 0;
            v126 = 0;
LABEL_392:
            v31 = v30 + 1;
            goto LABEL_415;
          }
          goto LABEL_344;
        }
      }
      else
      {
        if (v35 == 62)
        {
          v108 = self->_bodyStr;
          v109 = CFSTR("&gt;");
          goto LABEL_390;
        }
        if (v35 != 133)
          goto LABEL_344;
      }
      v112 = &stru_1E260C7D0;
      if ((self->_excludedElements2 & 0x10000000) == 0)
        v112 = CFSTR(" /");
      -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<br%@>\n"), v34, v112);
LABEL_344:
      v31 = v30 + 1;
LABEL_411:
      v126 = v35 == 13;
      v125 = v35 == 8233;
      if (v35 == 10 || v35 == 13)
        goto LABEL_417;
      if (v35 == 8233)
        goto LABEL_416;
      v107 = v30 + 1;
LABEL_415:
      if (v107 == v11)
      {
LABEL_416:
        if (v125)
        {
LABEL_417:
          if ((self->_excludedElements2 & 0x80000000) != 0 || (*(_BYTE *)&self->_flags & 1) == 0)
          {
            v128 = 1;
            goto LABEL_423;
          }
          v129 = v30 + 1 == v11;
          v128 = 1;
        }
        else
        {
          v128 = 0;
LABEL_423:
          v129 = 0;
        }
        if ((v218 & 1) != 0)
          -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v34);
        if ((v33 & 1) != 0)
          -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"), v34);
        if (v35 == 10 || v35 == 8233 || v35 == 13)
        {
          v130 = v30 - v31;
          if (v30 > v31)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v222, "substringWithRange:", v31, v130));
          v33 = v216;
          v131 = v217;
          if (v126)
          {
            v132 = v212;
            if (v30 + 1 < v11 && -[NSString characterAtIndex:](v222, "characterAtIndex:", v30 + 1, v130) == 10)
              ++v30;
            v133 = v215;
LABEL_443:
            -[NSHTMLWriter _closeFlags:openFlags:inString:](self, "_closeFlags:openFlags:inString:", v210, 0, self->_bodyStr);
            if (v33
              && (unint64_t)objc_msgSend(v33, "count") >= 2
              && (self->_excludedElements2 & 0x1000) == 0
              && (unint64_t)objc_msgSend(v33, "count") >= 2)
            {
              v134 = 1;
              do
              {
                -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</span>"));
                ++v134;
              }
              while (v134 < objc_msgSend(v33, "count"));
            }
            if (v131)
            {
              if (v132)
              {
                v135 = CFSTR("</font>");
                if ((self->_excludedElements1 & 0x400000) == 0
                  || (v135 = CFSTR("</span>"), (self->_excludedElements2 & 0x1000) == 0))
                {
                  -[NSMutableString appendString:](self->_bodyStr, "appendString:", v135);
                  v132 = 0;
                }
              }
              -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</mark>"));
            }
            if (v133)
            {
              if (v132)
              {
                if (v132 != v214)
                {
                  v136 = CFSTR("</font>");
                  if ((self->_excludedElements1 & 0x400000) == 0
                    || (v136 = CFSTR("</span>"), (self->_excludedElements2 & 0x1000) == 0))
                  {
                    -[NSMutableString appendString:](self->_bodyStr, "appendString:", v136);
                  }
                }
              }
              -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("</a>"));
              if (!v214)
                goto LABEL_467;
LABEL_464:
              v137 = CFSTR("</font>");
              if ((self->_excludedElements1 & 0x400000) == 0
                || (v137 = CFSTR("</span>"), (self->_excludedElements2 & 0x1000) == 0))
              {
                -[NSMutableString appendString:](self->_bodyStr, "appendString:", v137);
              }
            }
            else if (v132)
            {
              goto LABEL_464;
            }
LABEL_467:
            v138 = v227;
            if (v227)
            {
              if (v206)
              {
                v139 = v227;
                if ((self->_excludedElements1 & 0x800) == 0)
                {
                  v140 = &stru_1E260C7D0;
                  if ((self->_excludedElements2 & 0x10000000) == 0)
                    v140 = CFSTR(" /");
                  -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<br%@>"), v140);
                  v139 = v227;
                }
              }
              else
              {
                v139 = v227;
              }
              -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("</%@>"), v139);
            }
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", CFSTR("\n"));
            v141 = -[NSHTMLWriter _closeListsForParagraphStyle:atIndex:inString:](self, "_closeListsForParagraphStyle:atIndex:inString:", v208, v30, self->_bodyStr);
            if (v138)
              v142 = 1;
            else
              v142 = v141;
            v143 = -[NSHTMLWriter _closeBlocksForParagraphStyle:atIndex:inString:](self, "_closeBlocksForParagraphStyle:atIndex:inString:", v208, v30, self->_bodyStr);
            if (((v128 ^ 1 | ((BYTE1(self->_excludedElements1) & 8) >> 3)) & 1) == 0)
            {
              v144 = v143 | v142;
              if (v144 ^ 1 | v129)
              {
                v145 = -[NSMutableString length](self->_bodyStr, "length");
                if (v145)
                  v146 = v144;
                else
                  v146 = 1;
                if ((v146 & 1) == 0)
                {
                  v147 = v145 - 1;
                  if (-[NSMutableString characterAtIndex:](self->_bodyStr, "characterAtIndex:", v145 - 1) == 10)
                    -[NSMutableString deleteCharactersInRange:](self->_bodyStr, "deleteCharactersInRange:", v147, 1);
                }
                v148 = CFSTR(" class=\"Apple-interchange-newline\");
                if (!v129)
                  v148 = &stru_1E260C7D0;
                v149 = CFSTR(" /");
                if ((self->_excludedElements2 & 0x10000000) != 0)
                  v149 = &stru_1E260C7D0;
                -[NSMutableString appendFormat:](self->_bodyStr, "appendFormat:", CFSTR("<br%@%@>\n"), v148, v149);
              }
            }
            v107 = v30 + 1;
            v228[0] = xmmword_18D6CBB80;

            v217 = 0;
            v212 = 0;
            v214 = 0;
            v210 = 0;
            v216 = 0;
            LOBYTE(v33) = 0;
            v218 = 0;
            v211 = 0;
            v206 = 0;
            v32 = 0;
            v204 = v30 + 1;
            v31 = v30 + 1;
            goto LABEL_492;
          }
        }
        else
        {
          if (v30 + 1 == v11 && v11 > v31)
            -[NSMutableString appendString:](self->_bodyStr, "appendString:", -[NSString substringWithRange:](v222, "substringWithRange:", v31, v11 - v31));
          v33 = v216;
          v131 = v217;
        }
        v133 = v215;
        v132 = v212;
        goto LABEL_443;
      }
      v32 = v215;
LABEL_492:
      v30 = v107;
    }
    while (v107 < v11);
  }
  self->_level = 0;
  if ((self->_excludedElements2 & 0x10000000) == 0)
  {
    if (self->_textEncodingName)
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"%@\"?>\n"), self->_textEncodingName);
    else
      -[__CFString appendString:](v198, "appendString:", CFSTR("<?xml version=\"1.0\"?>\n"));
  }
  v153 = self->_excludedElements1;
  if ((v153 & 0x100000) != 0)
  {
    v155 = v197;
    if ((v153 & 0x80000000) != 0)
      goto LABEL_531;
    goto LABEL_528;
  }
  v154 = self->_excludedElements2;
  if ((v154 & 0x10000000) != 0)
  {
    v155 = v197;
    if (!(v154 & 0x800000 | v153 & 0x20000000))
    {
      v158 = CFSTR(" Transitional");
      if (v200)
        v158 = &stru_1E260C7D0;
      v159 = CFSTR("loose");
      if (v200)
        v159 = CFSTR("strict");
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01%@//EN\" \"http://www.w3.org/TR/html4/%@.dtd\">\n"), v158, v159);
    }
  }
  else
  {
    v155 = v197;
    if ((v153 & 0x80000000) == 0 && !(v154 & 0x800000 | v153 & 0x20000400))
    {
      v156 = CFSTR("Transitional");
      if (v200)
        v156 = CFSTR("Strict");
      v157 = CFSTR("transitional");
      if (v200)
        v157 = CFSTR("strict");
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 %@//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-%@.dtd\">\n"), v156, v157);
    }
  }
  v153 = self->_excludedElements1;
  if ((v153 & 0x80000000) == 0)
  {
LABEL_528:
    v160 = &stru_1E260C7D0;
    if ((self->_excludedElements2 & 0x10000000) == 0)
      v160 = CFSTR(" xmlns=\"http://www.w3.org/1999/xhtml\");
    -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<html%@>\n"), v160);
    v153 = self->_excludedElements1;
  }
LABEL_531:
  if ((v153 & 0x20000000) == 0)
  {
    -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@<head>\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"));
    if ((self->_excludedElements2 & 0x10) == 0)
    {
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@<meta http-equiv=\"Content-Type\" content=\"text/html"), -[NSHTMLWriter _prefix](self, "_prefix"));
      if (self->_textEncodingName)
        -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("; charset=%@"), self->_textEncodingName);
      if ((self->_excludedElements2 & 0x10000000) != 0)
        v161 = &stru_1E260C7D0;
      else
        v161 = CFSTR(" /");
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("\"%@>\n"), v161);
      v162 = -[NSHTMLWriter _prefix](self, "_prefix");
      if ((self->_excludedElements2 & 0x10000000) != 0)
        v163 = &stru_1E260C7D0;
      else
        v163 = CFSTR(" /");
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@<meta http-equiv=\"Content-Style-Type\" content=\"text/css\"%@>\n"), v162, v163);
    }
    -[NSHTMLWriter _writeDocumentPropertiesToString:](self, "_writeDocumentPropertiesToString:", v198);
    if ((self->_excludedElements2 & 0x9000) == 0)
    {
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@<style type=\"text/css\">\n"), -[NSHTMLWriter _prefixUp](self, "_prefixUp"));
      if (v196 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v164 = v196 >> 8;
        if ((_DWORD)v164 != 0xFFFFFF)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@body {background-color: #%.6x}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), v164);
      }
      v165 = -[NSMutableArray count](self->_paraStyleStrings, "count");
      if (v165)
      {
        v166 = v165;
        v167 = 0;
        do
        {
          v168 = v167 + 1;
          if (-[NSMutableIndexSet containsIndex:](self->_paraStyleIndexes, "containsIndex:", v167 + 1))
            -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@p.p%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), v167 + 1, -[NSMutableArray objectAtIndex:](self->_paraStyleStrings, "objectAtIndex:", v167));
          ++v167;
        }
        while (v166 != v168);
        v169 = 0;
        do
        {
          v170 = v169 + 1;
          if (-[NSMutableIndexSet containsIndex:](self->_listItemStyleIndexes, "containsIndex:", v169 + 1))-[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@li.li%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), v169 + 1, -[NSMutableArray objectAtIndex:](self->_paraStyleStrings, "objectAtIndex:", v169));
          ++v169;
        }
        while (v166 != v170);
      }
      v171 = -[NSMutableOrderedSet count](self->_charStyleStrings, "count");
      v172 = v171;
      if ((self->_excludedElements1 & 0x400000) != 0)
      {
        if ((self->_excludedElements2 & 0x1000) == 0 && v171)
        {
          v174 = 0;
          do
          {
            -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@span.s%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), v174 + 1, -[NSMutableOrderedSet objectAtIndex:](self->_charStyleStrings, "objectAtIndex:", v174));
            ++v174;
          }
          while (v172 != v174);
        }
      }
      else if (v171)
      {
        v173 = 0;
        do
        {
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@font.f%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), v173 + 1, -[NSMutableOrderedSet objectAtIndex:](self->_charStyleStrings, "objectAtIndex:", v173));
          ++v173;
        }
        while (v172 != v173);
      }
      if ((self->_excludedElements2 & 0x40001000) == 0 && (*(_BYTE *)&self->_flags & 0x10) != 0)
        -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@span.Apple-tab-span {white-space:pre}\n"), -[NSHTMLWriter _prefix](self, "_prefix"));
      v175 = -[NSMutableArray count](self->_tableStyleStrings, "count");
      if (v175)
      {
        v176 = v175;
        for (j = 0; j != v176; ++j)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@table.t%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), j + 1, -[NSMutableArray objectAtIndex:](self->_tableStyleStrings, "objectAtIndex:", j));
      }
      v178 = -[NSMutableArray count](self->_tableCellStyleStrings, "count");
      if (v178)
      {
        v179 = v178;
        for (k = 0; k != v179; ++k)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@td.td%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), k + 1, -[NSMutableArray objectAtIndex:](self->_tableCellStyleStrings, "objectAtIndex:", k));
      }
      v181 = -[NSMutableArray count](self->_blockStyleStrings, "count");
      if (v181)
      {
        v182 = v181;
        for (m = 0; m != v182; ++m)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@div.d%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), m + 1, -[NSMutableArray objectAtIndex:](self->_blockStyleStrings, "objectAtIndex:", m));
      }
      v184 = -[NSMutableArray count](self->_olistStyleStrings, "count");
      if (v184)
      {
        v185 = v184;
        for (n = 0; n != v185; ++n)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@ol.ol%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), n + 1, -[NSMutableArray objectAtIndex:](self->_olistStyleStrings, "objectAtIndex:", n));
      }
      v187 = -[NSMutableArray count](self->_ulistStyleStrings, "count");
      if (v187)
      {
        v188 = v187;
        for (ii = 0; ii != v188; ++ii)
          -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@ul.ul%lu {%@}\n"), -[NSHTMLWriter _prefix](self, "_prefix"), ii + 1, -[NSMutableArray objectAtIndex:](self->_ulistStyleStrings, "objectAtIndex:", ii));
      }
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@</style>\n"), -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
    }
    -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("%@</head>\n"), -[NSHTMLWriter _prefixDown](self, "_prefixDown"));
    v153 = self->_excludedElements1;
  }
  if ((v153 & 0x400) == 0)
  {
    if (v196 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_592;
    if (v196 >> 8 == 0xFFFFFF)
      goto LABEL_592;
    v190 = self->_excludedElements2;
    if (!(v153 & 0x20000000 | v190 & 0x9000))
      goto LABEL_592;
    if ((v190 & 0x1000) == 0)
    {
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<body style=\"background-color: #%.6x\">\n"), v196 >> 8);
      goto LABEL_593;
    }
    if ((v153 & 0x400000) != 0)
LABEL_592:
      -[__CFString appendString:](v198, "appendString:", CFSTR("<body>\n"));
    else
      -[__CFString appendFormat:](v198, "appendFormat:", CFSTR("<body bgcolor=\"#%.6x\">\n"), v196 >> 8);
  }
LABEL_593:
  -[__CFString appendString:](v198, "appendString:", self->_bodyStr);
  if (-[NSMutableString hasSuffix:](self->_bodyStr, "hasSuffix:", CFSTR(">\n")))
    -[NSMutableString deleteCharactersInRange:](self->_bodyStr, "deleteCharactersInRange:", -[NSMutableString length](self->_bodyStr, "length") - 1, 1);
  v191 = self->_excludedElements1;
  if ((v191 & 0x400) == 0)
  {
    -[__CFString appendString:](v198, "appendString:", CFSTR("</body>\n"));
    v191 = self->_excludedElements1;
  }
  if ((v191 & 0x80000000) == 0)
    -[__CFString appendString:](v198, "appendString:", CFSTR("</html>\n"));
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    -[NSHTMLWriter _prepareString:forConversionToEncoding:](self, "_prepareString:forConversionToEncoding:", v198, self->_characterEncoding);
  v192 = (NSData *)(id)-[__CFString dataUsingEncoding:](v198, "dataUsingEncoding:", self->_characterEncoding);
  self->_htmlData = v192;
  if (!v192)
  {
    if (-[__CFString length](v198, "length"))
    {
      range.location = 0;
      range.length = -[__CFString length](v198, "length");
      if (CFStringTransform(v198, &range, (CFStringRef)*MEMORY[0x1E0C9B368], 0))
        self->_htmlData = (NSData *)(id)-[__CFString dataUsingEncoding:](v198, "dataUsingEncoding:", self->_characterEncoding);
    }
  }
  -[NSFileWrapper removeFileWrapper:](self->_fileWrapper, "removeFileWrapper:", v155);

  htmlData = self->_htmlData;
  if (htmlData)
    -[NSFileWrapper addRegularFileWithContents:preferredFilename:](self->_fileWrapper, "addRegularFileWithContents:preferredFilename:", htmlData, CFSTR("index.html"));
}

- (id)HTMLData
{
  if (!self->_fileWrapper)
    -[NSHTMLWriter _generateHTML](self, "_generateHTML");
  return self->_htmlData;
}

- (id)HTMLFileWrapper
{
  NSFileWrapper *fileWrapper;

  fileWrapper = self->_fileWrapper;
  if (!fileWrapper)
  {
    -[NSHTMLWriter _generateHTML](self, "_generateHTML");
    fileWrapper = self->_fileWrapper;
  }
  return fileWrapper;
}

- (id)subresources
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!self->_fileWrapper)
    -[NSHTMLWriter _generateHTML](self, "_generateHTML");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSMutableDictionary allKeys](self->_subresources, "allKeys", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)-[NSMutableDictionary objectForKey:](self->_subresources, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = (void *)objc_msgSend(v9, "webResource");
        if (v9)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)webArchive
{
  objc_class *v3;
  uint64_t v4;
  NSSubstituteWebResource *v5;
  void *v6;

  v3 = -[NSHTMLWriter _webArchiveClass](self, "_webArchiveClass");
  if (self->_fileWrapper || (-[NSHTMLWriter _generateHTML](self, "_generateHTML"), self->_fileWrapper))
  {
    if (self->_outputBaseURL)
      v4 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("index.html"));
    else
      v4 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///index.html"));
    v5 = -[NSSubstituteWebResource initWithData:URL:MIMEType:textEncodingName:frameName:]([NSSubstituteWebResource alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", self->_htmlData, v4, CFSTR("text/html"), self->_textEncodingName, 0);
    v6 = (void *)objc_msgSend([v3 alloc], "initWithMainResource:subresources:subframeArchives:", -[NSSubstituteWebResource webResource](v5, "webResource"), -[NSHTMLWriter subresources](self, "subresources"), 0);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_createWebArchiveData
{
  if (!self->_webArchiveData)
    self->_webArchiveData = (NSData *)(id)objc_msgSend(-[NSHTMLWriter webArchive](self, "webArchive"), "data");
}

- (id)webArchiveData
{
  int v3;
  void *v4;

  if (!self->_webArchiveData)
  {
    v3 = _NSCreateWebArchiveOnAppKitThread;
    if (_NSCreateWebArchiveOnAppKitThread == 254)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      if (objc_msgSend(v4, "objectForKey:", CFSTR("NSCreateWebArchiveOnAppKitThread")))
        v3 = objc_msgSend(v4, "BOOLForKey:", CFSTR("NSCreateWebArchiveOnAppKitThread"));
      else
        v3 = 1;
      _NSCreateWebArchiveOnAppKitThread = v3;
    }
    if (v3 == 1 && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      -[NSHTMLWriter performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__createWebArchiveData, 0, 1);
    else
      -[NSHTMLWriter _createWebArchiveData](self, "_createWebArchiveData");
  }
  return self->_webArchiveData;
}

- (void)readDocumentFragment:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "ownerDocument");
  if (v5)
  {
    v6 = (void *)v5;
    if (!objc_lookUpClass("DOMHTMLDocument")
      || (objc_opt_isKindOfClass() & 1) == 0
      || (v7 = objc_msgSend(v6, "createElement:", CFSTR("div"))) == 0
      || (v8 = (void *)v7, (objc_opt_respondsToSelector() & 1) == 0))
    {
      v9 = objc_msgSend(v6, "createElementNS:qualifiedName:", CFSTR("http://www.w3.org/1999/xhtml"), CFSTR("div"));
      if (!v9)
        return;
      v8 = (void *)v9;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      self->_outputBaseURL = (NSURL *)(id)objc_msgSend(MEMORY[0x1E0C99E98], "_web_uniqueWebDataURL");
      *(_DWORD *)&self->_flags |= 9u;
      if (!self->_fileWrapper)
        -[NSHTMLWriter _generateHTML](self, "_generateHTML");
      objc_msgSend(v8, "setInnerHTML:", self->_bodyStr);
      if (objc_msgSend(v8, "hasChildNodes"))
      {
        do
        {
          v10 = objc_msgSend(v8, "firstChild");
          objc_msgSend(v8, "removeChild:", v10);
          objc_msgSend(a3, "appendChild:", v10);
        }
        while ((objc_msgSend(v8, "hasChildNodes") & 1) != 0);
      }
    }
  }
}

- (id)documentFragmentForDocument:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "createDocumentFragment");
  if (v4)
    -[NSHTMLWriter readDocumentFragment:](self, "readDocumentFragment:", v4);
  return v4;
}

- (id)documentFragmentString
{
  if (!self->_fileWrapper)
    -[NSHTMLWriter _generateHTML](self, "_generateHTML");
  return self->_bodyStr;
}

@end
