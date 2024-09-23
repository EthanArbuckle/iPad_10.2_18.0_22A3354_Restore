@implementation TSWPParagraphStyle

+ (int)defaultIntValueForProperty:(int)a3
{
  int result;
  int v4;

  result = 0x80000000;
  if (a3 > 55)
  {
    switch(a3)
    {
      case 'Y':
      case 'Z':
      case '[':
      case 'f':
      case 'k':
      case 'n':
      case 'q':
LABEL_5:
        result = 0;
        break;
      case '\\':
      case ']':
LABEL_6:
        result = 1;
        break;
      case '^':
      case '_':
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'g':
      case 'h':
      case 'i':
      case 'l':
      case 'm':
      case 'o':
      case 'p':
        return result;
      case 'j':
LABEL_13:
        result = -1;
        break;
      default:
        if (a3 == 86)
          v4 = 4;
        else
          v4 = 0x80000000;
        if (a3 == 56)
          result = 0;
        else
          result = v4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 19:
      case 20:
      case 21:
      case 22:
      case 25:
      case 26:
      case 29:
      case 36:
        goto LABEL_5;
      case 23:
      case 24:
      case 27:
      case 28:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
        return result;
      default:
        switch(a3)
        {
          case ')':
            goto LABEL_6;
          case ',':
            goto LABEL_13;
          case '0':
          case '1':
          case '3':
            goto LABEL_5;
          default:
            return result;
        }
    }
  }
  return result;
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result;
  float v4;
  BOOL v5;

  result = INFINITY;
  if (a3 <= 49)
  {
    switch(a3)
    {
      case 23:
      case 31:
      case 33:
      case 34:
      case 35:
LABEL_5:
        result = 0.0;
        break;
      case 24:
      case 25:
      case 26:
      case 28:
      case 29:
      case 30:
      case 32:
        return result;
      case 27:
        result = 1.0;
        break;
      default:
        v5 = a3 == 17;
        v4 = 12.0;
LABEL_10:
        if (v5)
          result = v4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'P':
      case 'Q':
      case 'R':
      case 'W':
      case 'X':
        goto LABEL_5;
      case 'S':
        result = 36.0;
        break;
      case 'T':
      case 'U':
      case 'V':
        return result;
      default:
        v4 = -1000.0;
        if (a3 == 104)
          result = 1.0;
        v5 = a3 == 50;
        goto LABEL_10;
    }
  }
  return result;
}

- (void)setInitialListStyle:(id)a3
{
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[TSSStyle setValue:forProperty:](self, "setValue:forProperty:", a3, 108);
}

- (__CFDictionary)p_newCoreTextCharacterStyle:(id)a3 allowLigatures:(BOOL)a4 scalePercent:(unint64_t)a5
{
  _BOOL4 v6;
  __CFDictionary *Mutable;
  const __CTFont *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  CGFloat v20;
  CTFontRef CopyWithAttributes;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  double v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  uint64_t v32;
  const void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  const void *v40;
  double v41;
  double v42;
  int v43;
  double v44;
  void *v45;
  _QWORD v47[3];

  v6 = a4;
  v47[2] = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4F20], self->_coreTextParagraphStyle);
  v47[0] = a3;
  v47[1] = self;
  v10 = TSWPCreateFontForStylesWithScale((uint64_t)v47, 2uLL, a5);
  if (!v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 670, CFSTR("Bad font"));
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4C28], v10);
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 35);
  if (v13 == 0.0)
  {
    if (v6)
    {
      v15 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 41, 0);
      if ((_DWORD)v15 == 1)
        goto LABEL_11;
      goto LABEL_9;
    }
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v13 * CTFontGetSize(v10));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4F08], v14);

  }
  v15 = 0;
LABEL_9:
  v16 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
  if (v16)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4F18], v16);
LABEL_11:
  objc_opt_class();
  TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 18, 0);
  v17 = (void *)TSUDynamicCast();
  if (v17)
  {
    v18 = (const void *)objc_msgSend(v17, "CGColor");
    if (v18)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4EE0], v18);
  }
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 33);
  CFDictionaryAddValue(Mutable, CFSTR("TSWPBaselineShift"), (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"));
  v19 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 36, 0);
  CFDictionaryAddValue(Mutable, CFSTR("TSWPSuperscript"), (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v19));
  if ((_DWORD)v19)
  {
    TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 17);
    CopyWithAttributes = CTFontCreateCopyWithAttributes(v10, v20, 0, 0);
    CFDictionaryAddValue(Mutable, CFSTR("TSWPUnadjustedFont"), CopyWithAttributes);
    CFRelease(CopyWithAttributes);
  }
  v22 = (void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 40, 0);
  if (objc_msgSend(v22, "isEnabled"))
    CFDictionaryAddValue(Mutable, CFSTR("TSWPShadow"), v22);
  LODWORD(v23) = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 22, 0);
  if (v23 >= 4)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]");
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 732, CFSTR("bad underline value"));
  }
  if (v23 >= 3)
    v23 = 3;
  else
    v23 = v23;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v23);
  CFDictionaryAddValue(Mutable, CFSTR("TSWPUnderline"), v26);

  v27 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 24, 0);
  if (v27)
    CFDictionaryAddValue(Mutable, CFSTR("TSWPUnderlineColor"), v27);
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 23);
  if (v28 != 0.0)
  {
    *(float *)&v28 = v28;
    CFDictionaryAddValue(Mutable, CFSTR("TSWPUnderlineWidthAttribute"), (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28));
  }
  v29 = TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 45, 1);
  if (v29)
  {
    v30 = (const void *)v29;
    {
      v31 = String(45);
      CFDictionaryAddValue(Mutable, v31, v30);
    }
  }
  v32 = TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 47, 1);
  if (v32)
  {
    v33 = (const void *)v32;
    {
      v34 = String(47);
      CFDictionaryAddValue(Mutable, v34, v33);
    }
  }
  LODWORD(v35) = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 26, 0);
  if (v35 >= 3)
  {
    v36 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:]");
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 767, CFSTR("bad strikethru value"));
  }
  if (v35 >= 2)
    v35 = 2;
  else
    v35 = v35;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v35);
  CFDictionaryAddValue(Mutable, CFSTR("TSWPStrikethrough"), v38);

  v39 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 28, 0);
  if (v39)
    CFDictionaryAddValue(Mutable, CFSTR("TSWPStrikethroughColor"), v39);
  v40 = (const void *)TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 37, 1);
  if (v40)
    CFDictionaryAddValue(Mutable, CFSTR("TSWPTextBackgroundColor"), v40);
  TSWPResolveFloatPropertyForStyles((uint64_t)a3, (uint64_t)self, 31);
  if (v41 > 0.0)
  {
    v42 = v41;
    v43 = TSWPResolveIntPropertyForStyles((uint64_t)a3, (uint64_t)self, 49, 0);
    v44 = -v42;
    if (!v43)
      v44 = v42;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4F38], (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v44));
  }
  objc_opt_class();
  TSWPResolvePropertyForStyles((uint64_t)a3, (uint64_t)self, 32, 0);
  v45 = (void *)TSUDynamicCast();
  if (v45)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC4F30], (const void *)objc_msgSend(v45, "CGColor"));
  CFRelease(v10);
  return Mutable;
}

- (__CTFont)findCachedFontForCharacterStyle:(id)a3 scalePercent:(unint64_t)a4
{
  __CTFont *result;

  result = -[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:](self, "getTypesetterAttributes:scalePercent:isRightToLeft:", a3, a4, 0);
  if (result)
    return (__CTFont *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x24BDC4C28]);
  return result;
}

- (__CFDictionary)getTypesetterAttributes:(id)a3 scalePercent:(unint64_t)a4 isRightToLeft:(BOOL)a5
{
  _BOOL4 v5;
  __CFDictionary *styleCache;
  void *v10;
  uint64_t v11;
  __CFDictionary *scalePercentStyleCaches;
  const void *v13;
  __CFDictionary *Value;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  __CTParagraphStyle *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;

  v5 = a5;
  objc_sync_enter(self);
  if (!self->_coreTextParagraphStyle)
    self->_coreTextParagraphStyle = -[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:](self, "p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:", 0, 0, -[TSWPParagraphStyle p_lineBoundsOptions](self, "p_lineBoundsOptions"));
  if (a4 == 100)
  {
    styleCache = self->_styleCache;
    if (!styleCache)
    {
      styleCache = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x24BDBD6B0]);
      self->_styleCache = styleCache;
    }
  }
  else
  {
    if (a4 - 20 >= 0xB5)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 428, CFSTR("Bad scalePercent"));
    }
    scalePercentStyleCaches = self->_scalePercentStyleCaches;
    if (!scalePercentStyleCaches)
    {
      scalePercentStyleCaches = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x24BDBD6B0]);
      self->_scalePercentStyleCaches = scalePercentStyleCaches;
    }
    styleCache = (__CFDictionary *)CFDictionaryGetValue(scalePercentStyleCaches, (const void *)a4);
    if (!styleCache)
    {
      styleCache = CFDictionaryCreateMutable(0, 0, &-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]::keyCallBacks, MEMORY[0x24BDBD6B0]);
      CFDictionaryAddValue(self->_scalePercentStyleCaches, (const void *)a4, styleCache);
      CFRelease(styleCache);
    }
  }
  if (a3)
    v13 = a3;
  else
    v13 = self;
  Value = (__CFDictionary *)CFDictionaryGetValue(styleCache, v13);
  if (!Value)
  {
    objc_opt_class();
    -[TSPObjectContext documentObject](-[TSPObject context](self, "context"), "documentObject");
    v15 = (void *)TSUDynamicCast();
    if (v15)
      v16 = objc_msgSend(v15, "useLigatures");
    else
      v16 = 1;
    Value = -[TSWPParagraphStyle p_newCoreTextCharacterStyle:allowLigatures:scalePercent:](self, "p_newCoreTextCharacterStyle:allowLigatures:scalePercent:", a3, v16, a4);
    CFDictionaryAddValue(styleCache, v13, Value);
    CFRelease(Value);
  }
  v17 = -[TSWPParagraphStyle p_lineBoundsOptions](self, "p_lineBoundsOptions");
  v18 = v17;
  if (v5 || v17)
  {
    v19 = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 44);
    if (v5)
      v20 = 1;
    else
      v20 = -1;
    if (v19 == -1)
      v21 = v20;
    else
      v21 = v19;
    v22 = -[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:](self, "p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:", 0, v21, v18);
    Value = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, Value);
    CFDictionaryReplaceValue(Value, (const void *)*MEMORY[0x24BDC4F20], v22);
    CFRelease(v22);
    CFAutorelease(Value);
  }
  objc_sync_exit(self);
  if (!Value)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle getTypesetterAttributes:scalePercent:isRightToLeft:]");
    v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm");
    v26 = CFSTR("NO");
    if (v5)
      v26 = CFSTR("YES");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 485, CFSTR("Failed to get attributes isRTL: %@\ncharacter style: %@\n paragraph style: %@"), v26, a3, self);
  }
  return Value;
}

- (unint64_t)p_lineBoundsOptions
{
  return 4 * (-[TSSStyle intValueForProperty:](self, "intValueForProperty:", 110) != 0);
}

+ (id)defaultPropertyMap
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPParagraphStyle;
  return (id)objc_msgSend(objc_msgSendSuper2(&v3, sel_defaultPropertyMap), "propertyMapByRemovingValuesForProperties:", objc_msgSend(a1, "deprecatedProperties"));
}

+ (id)deprecatedProperties
{
  if (+[TSWPParagraphStyle deprecatedProperties]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle deprecatedProperties]::onceToken, &__block_literal_global_4_1);
  return (id)+[TSWPParagraphStyle deprecatedProperties]::s_deprecatedProperties;
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__TSWPParagraphStyle_properties__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPParagraphStyle properties]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle properties]::onceToken, block);
  return (id)+[TSWPParagraphStyle properties]::s_properties;
}

+ (id)defaultValueForProperty:(int)a3
{
  id result;
  objc_super v5;

  if (a3 > 83)
  {
    switch(a3)
    {
      case 'b':
      case 'c':
      case 'g':
      case 'l':
      case 'm':
      case 'o':
      case 'p':
      case 'r':
LABEL_5:
        break;
      case 'd':
      case 'f':
      case 'h':
      case 'j':
      case 'k':
      case 'n':
      case 'q':
        goto LABEL_13;
      case 'e':
        result = (id)objc_msgSend(a1, "p_normalDecimalSeparator");
        break;
      case 'i':
        result = +[TSWPRuleOffset ruleOffset](TSWPRuleOffset, "ruleOffset");
        break;
      default:
        if (a3 == 84)
        {
          result = +[TSWPTabs tabs](TSWPTabs, "tabs");
        }
        else if (a3 == 85)
        {
          result = +[TSWPLineSpacing lineSpacing](TSWPLineSpacing, "lineSpacing");
        }
        else
        {
LABEL_13:
          v5.receiver = a1;
          v5.super_class = (Class)&OBJC_METACLASS___TSWPParagraphStyle;
          result = objc_msgSendSuper2(&v5, sel_defaultValueForProperty_);
        }
        break;
    }
  }
  else
  {
    result = CFSTR("Helvetica");
    switch(a3)
    {
      case 16:
        return result;
      case 18:
      case 32:
        break;
      case 24:
      case 28:
      case 37:
      case 38:
      case 39:
      case 40:
      case 43:
      case 45:
      case 46:
      case 47:
      case 53:
      case 54:
      case 55:
        goto LABEL_5;
      default:
        goto LABEL_13;
    }
  }
  return result;
}

+ (id)p_normalDecimalSeparator
{
  void *v2;
  id result;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  result = (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB00]);
  if (!result)
    return CFSTR(".");
  return result;
}

id __32__TSWPParagraphStyle_properties__block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "paragraphProperties"), "propertySetByAddingPropertiesFromSet:", +[TSWPCharacterStyle properties](TSWPCharacterStyle, "properties"));
  +[TSWPParagraphStyle properties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)paragraphProperties
{
  if (+[TSWPParagraphStyle paragraphProperties]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle paragraphProperties]::onceToken, &__block_literal_global_60);
  return (id)+[TSWPParagraphStyle paragraphProperties]::s_paragraphProperties;
}

TSSPropertySet *__41__TSWPParagraphStyle_paragraphProperties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 86, 101, 83, 98, 80, 99, 93, 108, 89, 90, 81, 85, 106, 107, 91, 102, 105,
             104,
             82,
             88,
             87,
             103,
             84,
             92,
             109,
             110,
             111,
             51,
             112,
             113,
             114,
             0);
  +[TSWPParagraphStyle paragraphProperties]::s_paragraphProperties = (uint64_t)result;
  return result;
}

TSSPropertySet *__42__TSWPParagraphStyle_deprecatedProperties__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 113, 114, 112, 0);
  +[TSWPParagraphStyle deprecatedProperties]::s_deprecatedProperties = (uint64_t)result;
  return result;
}

- (__CTParagraphStyle)p_createCoreTextParagraphStyleWithCharacterStyle:(id)a3 writingDirection:(int)a4 lineBoundsOptions:(unint64_t)a5
{
  uint64_t v5;
  int v7;
  int v8;
  float v9;
  double v10;
  id v11;
  unint64_t v12;
  CFMutableArrayRef Mutable;
  float v14;
  float v15;
  float v16;
  _BOOL4 v17;
  double v18;
  CFIndex v19;
  _BYTE *v20;
  double v21;
  unsigned int v22;
  CFIndex v23;
  void *v24;
  int v25;
  double v26;
  long double v27;
  const __CFDictionary *v28;
  long double v30;
  CTTextTabRef v31;
  BOOL v32;
  CTTextTabRef v34;
  CFIndex Count;
  const __CTTextTab *ValueAtIndex;
  double Location;
  double v38;
  CTTextTabRef v39;
  __CTParagraphStyle *v40;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  TSWPParagraphStyle *v48;
  void *keys;
  CFTypeRef cf;
  double v51;
  char v52;
  unint64_t v53;
  CTParagraphStyleSetting values;
  int v55;
  uint64_t v56;
  char *v57;
  int v58;
  uint64_t v59;
  double *v60;
  int v61;
  uint64_t v62;
  CFTypeRef *p_cf;
  int v64;
  uint64_t v65;
  unint64_t *v66;
  uint64_t v67;

  v5 = *(_QWORD *)&a4;
  v67 = *MEMORY[0x24BDAC8D0];
  v53 = a5;
  v7 = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 86);
  if (v7 >= 256)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:]");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 540, CFSTR("Out-of-bounds type assignment was clamped to max"));
    v46 = -1;
  }
  else if (v7 < 0)
  {
    v44 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v45 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPParagraphStyle p_createCoreTextParagraphStyleWithCharacterStyle:writingDirection:lineBoundsOptions:]");
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPParagraphStyle.mm"), 540, CFSTR("Out-of-bounds type assignment was clamped to min"));
    v46 = 0;
  }
  else
  {
    v46 = v7;
  }
  v8 = -[TSWPParagraphStyle p_coreTextWritingDirectionFromWPWritingDirection:](self, "p_coreTextWritingDirectionFromWPWritingDirection:", v5);
  v52 = v8;
  -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 83);
  v10 = v9;
  v51 = v9;
  v11 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 84);
  v12 = objc_msgSend(v11, "count");
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  cf = Mutable;
  -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 81);
  v15 = v14;
  if (v14 <= 0.0)
  {
    v17 = 0;
  }
  else
  {
    -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 80);
    v17 = v16 < v15;
  }
  v18 = v15;
  if (!v12)
  {
    v23 = 0;
    if (!v17)
      goto LABEL_35;
    goto LABEL_34;
  }
  v48 = self;
  v19 = 0;
  v47 = (void *)*MEMORY[0x24BDC4F48];
  if (v8 == 1)
    v20 = &unk_217C2ABB8;
  else
    v20 = &unk_217C2ABB4;
  v21 = 0.0;
  v22 = 1;
  v23 = v12;
  do
  {
    v24 = (void *)objc_msgSend(v11, "tabAtIndex:", v19);
    v25 = objc_msgSend(v24, "alignment");
    objc_msgSend(v24, "position");
    if (v26 >= v21)
      v27 = v26;
    else
      v27 = v21;
    if (v25 == 3)
    {
      *(_QWORD *)&values.spec = 0;
      *(_QWORD *)&values.spec = CFCharacterSetCreateWithCharactersInString(0, (CFStringRef)-[TSSStyle valueForProperty:](v48, "valueForProperty:", 101));
      keys = v47;
      v28 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFRelease(*(CFTypeRef *)&values.spec);
    }
    else
    {
      v28 = 0;
    }
    if (v27 == v18 && v17)
    {
      v30 = nextafter(v27, v21);
      if (v21 >= v30)
        v30 = nextafter(v27, INFINITY);
    }
    else
    {
      v30 = v27;
    }
    v31 = CTTextTabCreate((CTTextAlignment)v20[v25], v30, v28);
    if (v28)
      CFRelease(v28);
    CFArrayAppendValue(Mutable, v31);
    CFRelease(v31);
    v32 = v23 == v12 && v17;
    if (v32 && v30 > v18)
      v23 = v19;
    v21 = nextafter(v30, INFINITY);
    v19 = v22;
  }
  while (v12 > v22++);
  if (v17)
  {
LABEL_34:
    v34 = CTTextTabCreate(kCTTextAlignmentLeft, v18, 0);
    CFArrayInsertValueAtIndex(Mutable, v23, v34);
    CFRelease(v34);
  }
LABEL_35:
  Count = CFArrayGetCount(Mutable);
  if (Count)
  {
    ValueAtIndex = (const __CTTextTab *)CFArrayGetValueAtIndex(Mutable, Count - 1);
    Location = CTTextTabGetLocation(ValueAtIndex);
    v38 = (floor(Location / v10) + 1.0) * v10;
    if (v38 - Location < v10)
    {
      v39 = CTTextTabCreate(kCTTextAlignmentLeft, v38, 0);
      CFArrayAppendValue(Mutable, v39);
      CFRelease(v39);
    }
  }
  LOBYTE(keys) = v46;
  values.spec = kCTParagraphStyleSpecifierAlignment;
  values.valueSize = 1;
  values.value = &keys;
  v55 = 13;
  v56 = 1;
  v57 = &v52;
  v58 = 5;
  v59 = 8;
  v60 = &v51;
  v61 = 4;
  v62 = 8;
  p_cf = &cf;
  v64 = 17;
  v65 = 8;
  v66 = &v53;
  v40 = CTParagraphStyleCreate(&values, 5uLL);
  CFRelease(cf);
  return v40;
}

- (char)p_coreTextWritingDirectionFromWPWritingDirection:(int)a3
{
  return -1;
}

+ (void)initialize
{
  {
  }
}

+ (id)nonEmphasisParagraphProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__TSWPParagraphStyle_nonEmphasisParagraphProperties__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPParagraphStyle nonEmphasisParagraphProperties]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle nonEmphasisParagraphProperties]::onceToken, block);
  return (id)+[TSWPParagraphStyle nonEmphasisParagraphProperties]::s_nonEmphasisParagraphProperties;
}

id __52__TSWPParagraphStyle_nonEmphasisParagraphProperties__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "properties"), "propertySetByRemovingPropertiesFromSet:", +[TSWPCharacterStyle emphasisProperties](TSWPCharacterStyle, "emphasisProperties"));
  +[TSWPParagraphStyle nonEmphasisParagraphProperties]::s_nonEmphasisParagraphProperties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TSWPParagraphStyle_propertiesAllowingNSNull__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[TSWPParagraphStyle propertiesAllowingNSNull]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle propertiesAllowingNSNull]::onceToken, block);
  return (id)+[TSWPParagraphStyle propertiesAllowingNSNull]::s_nullProperties;
}

id __46__TSWPParagraphStyle_propertiesAllowingNSNull__block_invoke()
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "paragraphPropertiesAllowingNSNull"), "propertySetByAddingPropertiesFromSet:", +[TSWPCharacterStyle propertiesAllowingNSNull](TSWPCharacterStyle, "propertiesAllowingNSNull"));
  +[TSWPParagraphStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (id)paragraphPropertiesAllowingNSNull
{
  if (+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::onceToken != -1)
    dispatch_once(&+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::onceToken, &__block_literal_global_5_0);
  return (id)+[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::s_nullParagraphProperties;
}

TSSPropertySet *__55__TSWPParagraphStyle_paragraphPropertiesAllowingNSNull__block_invoke()
{
  TSSPropertySet *result;

  result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 101, 98, 99, 85, 105, 103, 84, 108, 112, 114, 0);
  +[TSWPParagraphStyle paragraphPropertiesAllowingNSNull]::s_nullParagraphProperties = (uint64_t)result;
  return result;
}

+ (id)defaultStyleWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, 0, 0);
}

- (void)dealloc
{
  __CFDictionary *scalePercentStyleCaches;
  __CFDictionary *styleCache;
  void *coreTextParagraphStyle;
  objc_super v6;

  scalePercentStyleCaches = self->_scalePercentStyleCaches;
  if (scalePercentStyleCaches)
    CFRelease(scalePercentStyleCaches);
  styleCache = self->_styleCache;
  if (styleCache)
    CFRelease(styleCache);
  coreTextParagraphStyle = self->_coreTextParagraphStyle;
  if (coreTextParagraphStyle)
    CFRelease(coreTextParagraphStyle);
  v6.receiver = self;
  v6.super_class = (Class)TSWPParagraphStyle;
  -[TSSStyle dealloc](&v6, sel_dealloc);
}

- (id)fullPropertyMap
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPParagraphStyle;
  v2 = -[TSSStyle fullPropertyMap](&v4, sel_fullPropertyMap);
  objc_msgSend(v2, "removeValuesForProperties:", objc_msgSend((id)objc_opt_class(), "deprecatedProperties"));
  return v2;
}

- (void)setOverridePropertyMap:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  -[TSWPParagraphStyle clearStyleCaches](self, "clearStyleCaches");
  v5 = -[TSSStylesheet rootAncestor](-[TSSStyle stylesheet](self, "stylesheet"), "rootAncestor");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend((id)objc_msgSend(v6, "childrenOfStyle:", self), "enumerateObjectsUsingBlock:", &__block_literal_global_21);
      v6 = (void *)objc_msgSend(v6, "child");
    }
    while (v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)TSWPParagraphStyle;
  -[TSSStyle setOverridePropertyMap:](&v7, sel_setOverridePropertyMap_, a3);
}

uint64_t __45__TSWPParagraphStyle_setOverridePropertyMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearStyleCaches");
}

- (void)clearStyleCaches
{
  __CFDictionary *scalePercentStyleCaches;
  __CFDictionary *styleCache;
  void *coreTextParagraphStyle;

  objc_sync_enter(self);
  scalePercentStyleCaches = self->_scalePercentStyleCaches;
  if (scalePercentStyleCaches)
  {
    CFRelease(scalePercentStyleCaches);
    self->_scalePercentStyleCaches = 0;
  }
  styleCache = self->_styleCache;
  if (styleCache)
  {
    CFRelease(styleCache);
    self->_styleCache = 0;
  }
  coreTextParagraphStyle = self->_coreTextParagraphStyle;
  if (coreTextParagraphStyle)
  {
    CFRelease(coreTextParagraphStyle);
    self->_coreTextParagraphStyle = 0;
  }
  objc_sync_exit(self);
}

- (id)followingParagraphStyle
{
  id v3;

  v3 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 99);
  if (v3 == (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return self;
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)contentTag
{
  id result;

  result = -[TSSStyle styleIdentifier](self, "styleIdentifier");
  if (result)
    return (id)String(-[TSSStyle styleIdentifier](self, "styleIdentifier"));
  return result;
}

- (id)initialListStyle
{
  id v2;

  v2 = -[TSSStyle valueForProperty:](self, "valueForProperty:", 108);
  if (objc_msgSend(v2, "isEqual:", objc_msgSend(MEMORY[0x24BDBCEF8], "null")))
    return 0;
  else
    return v2;
}

- (void)localizeForRightToLeft
{
  int v3;
  uint64_t v4;

  v3 = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 86);
  if (!v3)
  {
    v4 = 4;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = 0;
LABEL_5:
    -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", v4, 86);
  }
  -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 0xFFFFFFFFLL, 44);
}

- (void)localizeForBidi:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;

  v3 = a3;
  v5 = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", 86);
  if (v5 == 1)
  {
    if (!v3)
    {
      -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 0xFFFFFFFFLL, 44);
      return;
    }
    -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 0, 86);
    -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 0xFFFFFFFFLL, 44);
LABEL_8:
    -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 81);
    v7 = v6;
    -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", 82);
    v9 = v8;
    LODWORD(v10) = v7;
    -[TSSStyle setFloatValue:forProperty:](self, "setFloatValue:forProperty:", 82, v10);
    LODWORD(v11) = v9;
    -[TSSStyle setFloatValue:forProperty:](self, "setFloatValue:forProperty:", 81, v11);
    return;
  }
  if (!v5)
    -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 4, 86);
  -[TSSStyle setIntValue:forProperty:](self, "setIntValue:forProperty:", 0xFFFFFFFFLL, 44);
  if (v3)
    goto LABEL_8;
}

- (BOOL)transformsFontSizes
{
  return 1;
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tswpMapParagraphStylePropertyMap_;
}

+ (id)presetStyleDescriptor
{
  return CFSTR("paragraphstyle");
}

- (NSString)presetKind
{
  return (NSString *)String;
}

+ (id)styleSummaryForPropertyMap:(id)a3
{
  uint64_t v4;
  float v5;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  v4 = objc_msgSend(a3, "boxedObjectForProperty:", 16);
  objc_msgSend(a3, "floatValueForProperty:", 17);
  v6 = v5;
  if (objc_msgSend(a3, "intValueForProperty:", 19))
    v7 = CFSTR("B");
  else
    v7 = &stru_24D82FEB0;
  if (objc_msgSend(a3, "intValueForProperty:", 20))
    v8 = CFSTR("I");
  else
    v8 = &stru_24D82FEB0;
  if (objc_msgSend(a3, "intValueForProperty:", 22))
    v9 = CFSTR("U");
  else
    v9 = &stru_24D82FEB0;
  v10 = objc_msgSend(a3, "intValueForProperty:", 26);
  v11 = CFSTR("S");
  if (!v10)
    v11 = &stru_24D82FEB0;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%g [%@%@%@%@]"), v4, *(_QWORD *)&v6, v7, v8, v9, v11);
}

- (id)styleSummary
{
  return (id)objc_msgSend((id)objc_opt_class(), "styleSummaryForPropertyMap:", -[TSSStyle propertyMap](self, "propertyMap"));
}

@end
