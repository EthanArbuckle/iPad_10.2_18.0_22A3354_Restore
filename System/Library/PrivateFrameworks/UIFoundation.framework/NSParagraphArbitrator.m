@implementation NSParagraphArbitrator

- (id)_preferredLanguageForCharacterAtIndex:(unint64_t)a3
{
  NSAttributedString *v5;
  id result;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;
  void *v10;
  id v11;

  if (_preferredLanguageForCharacterAtIndex__once != -1)
    dispatch_once(&_preferredLanguageForCharacterAtIndex__once, &__block_literal_global_87);
  v5 = -[NSParagraphArbitrator attributedString](self, "attributedString");
  result = -[NSAttributedString attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", NSLanguageAttributeName, a3, 0);
  if (!result)
  {
    v7 = -[NSAttributedString attributesAtIndex:effectiveRange:](-[NSParagraphArbitrator attributedString](self, "attributedString"), "attributesAtIndex:effectiveRange:", a3, 0);
    if (v7)
    {
      v8 = v7;
      v9 = -[NSDictionary objectForKey:](v7, "objectForKey:", CFSTR("NSFont"));
      if (objc_msgSend(-[NSDictionary objectForKey:](v8, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))v9 = (id)objc_msgSend(v9, "verticalFont");
      if (v9)
        goto LABEL_9;
    }
    result = (id)NSDefaultFont();
    v9 = result;
    if (result)
    {
LABEL_9:
      v10 = (void *)objc_msgSend(v9, "fontDescriptor");
      result = (id)objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CA8248]);
      if (result)
      {
        v11 = result;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          result = v11;
        else
          result = 0;
      }
    }
  }
  if (!result)
    return (id)_preferredLanguageForCharacterAtIndex__globalPreferredLanguage;
  return result;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- ($F08F7EC4C389A89376F473094BC6C9F8)lineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger length;
  NSUInteger location;
  $F08F7EC4C389A89376F473094BC6C9F8 *result;

  length = a6.length;
  location = a6.location;
  result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator _shouldUseOptimalLayout](self, "_shouldUseOptimalLayout");
  if ((_DWORD)result)
  {
    if (self)
      return -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:](self, "_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:", a4, location, length, a5);
  }
  else if (self)
  {
    return -[NSParagraphArbitrator _firstFitLineBreakContextBeforeIndex:lineFragmentWidth:range:](self, "_firstFitLineBreakContextBeforeIndex:lineFragmentWidth:range:", a4, location, length, a5);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  return result;
}

- (BOOL)_shouldUseOptimalLayout
{
  unint64_t usesOptimalLayout;
  NSString *v4;
  NSParagraphStyle *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 textContainerIsSimple;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (_shouldUseOptimalLayout_once != -1)
    dispatch_once(&_shouldUseOptimalLayout_once, &__block_literal_global_89_0);
  usesOptimalLayout = self->_usesOptimalLayout;
  if (usesOptimalLayout == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = -[NSAttributedString string](-[NSParagraphArbitrator attributedString](self, "attributedString"), "string");
    v5 = -[NSAttributedString attribute:atIndex:effectiveRange:](-[NSParagraphArbitrator attributedString](self, "attributedString"), "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), -[NSParagraphArbitrator paragraphRange](self, "paragraphRange"), 0);
    if (!v5)
      v5 = -[NSParagraphArbitrator defaultParagraphStyle](self, "defaultParagraphStyle");
    v6 = -[NSParagraphArbitrator _lineBreakStyle](self, "_lineBreakStyle");
    if ((-[NSParagraphArbitrator lineBreakStrategy](self, "lineBreakStrategy") & 4) != 0)
      goto LABEL_9;
    if ((-[NSParagraphArbitrator lineBreakStrategy](self, "lineBreakStrategy") & 8) != 0)
    {
      v7 = 1;
    }
    else
    {
      if ((__NSLineBreakStrategyStandardActualOptions(-[NSParagraphStyle alignment](v5, "alignment") == NSTextAlignmentJustified) & 8) == 0)
      {
LABEL_9:
        v7 = 0;
        goto LABEL_12;
      }
      v7 = (-[NSParagraphArbitrator lineBreakStrategy](self, "lineBreakStrategy") & 3) == 0;
    }
LABEL_12:
    if (!-[NSParagraphArbitrator breaksLinesForInteractiveText](self, "breaksLinesForInteractiveText")
      && (v6 != 1 || -[NSParagraphStyle spansAllLines](v5, "spansAllLines")))
    {
      v7 = 1;
    }
    textContainerIsSimple = self->_textContainerIsSimple;
    if (self->_textContainerIsSimple)
    {
      if (self->_textContainerWidth <= 0.001 || -[NSString length](v4, "length") > 0x2000)
      {
        textContainerIsSimple = 0;
      }
      else
      {
        v9 = _shouldUseOptimalLayout_forbiddenCharacterSet;
        v10 = -[NSParagraphArbitrator paragraphRange](self, "paragraphRange");
        textContainerIsSimple = -[NSString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", v9, 0, v10, v11) == 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    usesOptimalLayout = v7 & textContainerIsSimple;
    self->_usesOptimalLayout = usesOptimalLayout;
  }
  return usesOptimalLayout != 0;
}

- (unint64_t)adjustedLineBreakIndexForProposedIndex:(unint64_t)a3
{
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = -[NSAttributedString string](-[NSParagraphArbitrator attributedString](self, "attributedString"), "string");
  v5 = -[NSString length](v4, "length");
  if (adjustedLineBreakIndexForProposedIndex__onceToken != -1)
    dispatch_once(&adjustedLineBreakIndexForProposedIndex__onceToken, &__block_literal_global_109);
  while (1)
  {
    v6 = -[NSString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", adjustedLineBreakIndexForProposedIndex__whitespaceNoTab, 8, a3, v5 - a3);
    if (!v7)
      break;
    a3 = v6 + v7;
  }
  v8 = a3 + 1;
  if (a3 + 1 < -[NSString length](v4, "length")
    && (-[NSString characterAtIndex:](v4, "characterAtIndex:", a3 + 1) & 0xFC00) == 0xDC00)
  {
    return a3 + 2;
  }
  return v8;
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_firstFitLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger location;
  unint64_t v8;
  NSParagraphArbitrator *v9;
  NSAttributedString *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  uint64_t v20;
  $F08F7EC4C389A89376F473094BC6C9F8 *result;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _BOOL4 v28;
  double v30;
  uint64_t i;
  _BOOL4 v32;
  _BOOL4 v33;
  BOOL v34;
  $F08F7EC4C389A89376F473094BC6C9F8 *v35;
  uint64_t v36;
  $F08F7EC4C389A89376F473094BC6C9F8 *v37;
  _BOOL4 v39;
  _BOOL4 v40;
  CFStringTokenizerTokenType v41;
  unint64_t v42;
  _BOOL4 v43;
  uint64_t v44;
  __CFStringTokenizer *v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  __CFStringTokenizer *v49;
  const __CFString *v50;
  CFRange CurrentTokenRange;
  __CFStringTokenizer *v52;
  CFIndex v53;
  CFRange v54;
  CFIndex v55;
  unint64_t v56;
  CFIndex v57;
  uint64_t v58;
  uint64_t v59;
  $F08F7EC4C389A89376F473094BC6C9F8 *v60;
  unint64_t v61;
  uint64_t v62;
  NSString *v63;
  uint64_t v64;
  BOOL v65;
  BOOL v66;
  CFIndex v67;
  CFIndex length;
  CFRange v69;
  unint64_t v70;
  uint64_t v71;
  CFIndex v72;
  NSString *v73;
  uint64_t v74;
  CFRange v75;
  NSUInteger v76;
  NSString *v77;
  uint64_t v78;
  uint64_t (*v79)($F08F7EC4C389A89376F473094BC6C9F8 *, _QWORD *);
  unint64_t v80;
  CFIndex v81;
  unint64_t v82;
  CFIndex v83;
  NSString *v84;
  _BOOL4 v85;
  CFStringTokenizerRef tokenizer;
  __CFStringTokenizer *tokenizera;
  CFIndex v89;
  CFStringTokenizerTokenType Token;
  uint64_t v91;
  NSAttributedString *v93;
  unint64_t v94;
  BOOL v95;
  uint64_t v96;
  _BOOL4 v97;
  unsigned __int8 v98;
  _BOOL4 v99;
  uint64_t v100;
  NSParagraphArbitrator *v101;
  __CFString *theString;
  NSAttributedString *v103;
  unint64_t v104;
  _QWORD v105[2];
  char v106;
  CFRange v107;

  location = a6.location;
  v8 = a4;
  v9 = self;
  *(_QWORD *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var0 = xmmword_18D6CBEF0;
  v10 = -[NSParagraphArbitrator attributedString](self, "attributedString", a4, a6.location, a6.length);
  theString = -[NSAttributedString string](v10, "string");
  v104 = v8 - location;
  v96 = -[NSParagraphArbitrator paragraphRange](v9, "paragraphRange");
  v12 = v11;
  -[NSParagraphArbitrator hyphenationFactor](v9, "hyphenationFactor");
  v14 = v13;
  v95 = -[NSParagraphArbitrator _hyphenatesAsLastResort](v9, "_hyphenatesAsLastResort");
  v98 = -[NSParagraphArbitrator lineBreakStrategy](v9, "lineBreakStrategy");
  v103 = v10;
  v97 = -[NSParagraphArbitrator _attributedStringOverridesLineBreakBeforeIndex:](v9, "_attributedStringOverridesLineBreakBeforeIndex:", v10);
  v15 = -[NSParagraphArbitrator lineWidth](v9, "lineWidth");
  if (_firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__once != -1)
    dispatch_once(&_firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__once, &__block_literal_global_30);
  v99 = -[NSParagraphArbitrator prepareBreakIteratorForCharacterAtIndex:](v9, "prepareBreakIteratorForCharacterAtIndex:", v8);
  v16 = 0;
  v94 = v96 + v12;
  v100 = 0x7FFFFFFFFFFFFFFFLL;
  v101 = v9;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v19 = 0.0;
    if (v16 == 1 && (-[NSParagraphArbitrator previousLineRange](v9, "previousLineRange"), !v20))
    {
      -[NSParagraphArbitrator raggednessWithCharIndexAsLineBreak:inRange:](v9, "raggednessWithCharIndexAsLineBreak:inRange:", v18, location, v104);
      v19 = v22;
      if (v8)
      {
LABEL_7:
        v18 = v8 - 1;
        result = ($F08F7EC4C389A89376F473094BC6C9F8 *)CFStringGetCharacterAtIndex(theString, v8 - 1);
        if ((_DWORD)result == 9)
          goto LABEL_20;
      }
    }
    else if (v8)
    {
      goto LABEL_7;
    }
    if (v99)
    {
      if (!v9->_breaker)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a3, v9, CFSTR("NSParagraphArbitrator.m"), 653, CFSTR("_breaker should have been set by -prepareBreakIterator"));
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)ubrk_preceding();
      v18 = (_DWORD)result == -1 ? 0x7FFFFFFFFFFFFFFFLL : (int)result;
    }
    else
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)(v97
                                                   ? -[NSAttributedString lineBreakBeforeIndex:withinRange:](v103, "lineBreakBeforeIndex:withinRange:", v8, location, v104): -[NSAttributedString _lineBreakBeforeIndex:withinRange:lineBreakStrategy:](v103, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", v8, location, v104, -[NSParagraphArbitrator lineBreakStrategy](v9, "lineBreakStrategy")));
      v18 = (unint64_t)result;
    }
LABEL_20:
    if (v16 == 1)
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator raggednessWithCharIndexAsLineBreak:inRange:](v9, "raggednessWithCharIndexAsLineBreak:inRange:", v18, location, v104);
      if (v23 < 0.6
        || (v24 = v23,
            result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator previousLineRange](v9, "previousLineRange"), !v25)&& vabdd_f64(1.0, v24) > vabdd_f64(1.0, v19))
      {
        v18 = v8;
      }
    }
    if (!v18 || v18 == 0x7FFFFFFFFFFFFFFFLL || v18 <= location || v18 >= v8)
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v16
      && v18 == 0x7FFFFFFFFFFFFFFFLL
      && ((result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", _firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__lastResortCharacterSet, 4, location, v104), result == ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL)|| (v18 = (unint64_t)result + v26, (unint64_t)result + v26 >= v8)))
    {
      v18 = location;
    }
    else
    {
      v27 = v100;
      if (v16 != 1)
        v27 = location;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        v18 = v27;
    }
    if (v18 <= location)
    {
      v28 = 0;
      if (!v15)
        goto LABEL_51;
    }
    else
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[__CFString characterAtIndex:](theString, "characterAtIndex:", v18 - 1);
      v28 = (_DWORD)result == 173;
      if ((_DWORD)result == 173)
        v17 = v18 - 1;
      if (!v15)
      {
LABEL_51:
        if (!v15)
          goto LABEL_85;
        goto LABEL_57;
      }
    }
    if (v28)
      goto LABEL_51;
    if (v14 <= 0.0)
    {
      if (v18 != location || !v95)
        goto LABEL_85;
    }
    else if (v18 != location
           && (*(double (**)(uint64_t, NSUInteger, unint64_t, _QWORD))(v15 + 16))(v15, location, v18 - location, 0)/ a5 >= v14)
    {
      goto LABEL_85;
    }
LABEL_57:
    v30 = (double)v8;
    for (i = 3; i; --i)
    {
      result = -[NSAttributedString lineBreakByHyphenatingBeforeIndex:withinRange:](v103, "lineBreakByHyphenatingBeforeIndex:withinRange:", (unint64_t)v30, location, v104);
      v32 = result != ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL;
      v33 = v17 < (unint64_t)result;
      v34 = !v32 || !v33;
      v35 = v32 && v33 ? result : ($F08F7EC4C389A89376F473094BC6C9F8 *)(v17 + 1);
      v36 = v34 ? 0x7FFFFFFFFFFFFFFFLL : v17;
      v37 = v17 == 0x7FFFFFFFFFFFFFFFLL ? result : v35;
      v17 = v17 == 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v36;
      if (v37 == ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL)
        break;
      if ((unint64_t)v37 > location && (unint64_t)v37 < v8)
      {
        if ((*(double (**)(uint64_t, NSUInteger, char *, uint64_t))(v15 + 16))(v15, location, (char *)v37 - location, 1) <= a5)
        {
          if ((v98 & (v16 == 0)) != 0)
            v16 = 0;
          LOBYTE(v41) = 1;
          goto LABEL_111;
        }
        v39 = v17 == 0x7FFFFFFFFFFFFFFFLL && v28;
        if (v39 && v14 == 0.0)
        {
          v17 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
        v30 = v30 + -1.0;
      }
    }
LABEL_85:
    v40 = v17 == 0x7FFFFFFFFFFFFFFFLL && v28;
    if (!v40 || v14 != 0.0)
      break;
    v8 = v18 - (v18 == v8);
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = v101;
LABEL_159:
    if (v8 <= location)
    {
      LOBYTE(v41) = 0;
      goto LABEL_163;
    }
  }
  LOBYTE(v41) = 0;
  v9 = v101;
  if ((v98 & 1) == 0)
    goto LABEL_155;
  if (v16)
    goto LABEL_155;
  LOBYTE(v41) = 0;
  if (location != v96 || v18 >= v8)
    goto LABEL_155;
  v42 = v94 - v18;
  if (v94 - v18 > 0xA)
    goto LABEL_153;
  v43 = -[NSParagraphArbitrator prepareTokenizerForPreferredLanguage:](v101, "prepareTokenizerForPreferredLanguage:", -[NSParagraphArbitrator _preferredLanguageForCharacterAtIndex:](v101, "_preferredLanguageForCharacterAtIndex:", v18));
  v93 = -[NSParagraphArbitrator attributedString](v101, "attributedString");
  v44 = -[NSParagraphArbitrator paragraphRange](v101, "paragraphRange");
  tokenizer = v45;
  v89 = v44;
  if (!v43
    || (v84 = -[NSAttributedString string](v93, "string"),
        -[NSString rangeOfCharacterFromSet:options:range:](v84, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), 8, v18, v42), v94 <= v18)|| !v46)
  {
    v58 = objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    if (v94 <= v18)
      goto LABEL_153;
    v91 = v58;
    -[NSString rangeOfCharacterFromSet:options:range:](-[NSAttributedString string](v93, "string"), "rangeOfCharacterFromSet:options:range:", v58, 8, v18, v42);
    if (!v59)
      goto LABEL_153;
    result = -[NSAttributedString nextWordFromIndex:forward:](v93, "nextWordFromIndex:forward:", v18, 1);
    v60 = result;
    if (v94 > (unint64_t)result)
    {
      v61 = v94 - (_QWORD)result;
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:](-[NSAttributedString string](v93, "string"), "rangeOfCharacterFromSet:options:range:", v91, 0, result, v61);
      if (!v62)
        v60 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v94;
    }
    v16 = 0;
    if (v60 != ($F08F7EC4C389A89376F473094BC6C9F8 *)v94)
    {
      LOBYTE(v41) = 0;
LABEL_155:
      v37 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v18;
      goto LABEL_156;
    }
LABEL_144:
    if (v43)
      v76 = v16;
    else
      v76 = v18 - (v18 == v8);
    if (v76 > location)
    {
      if (v43)
        v8 = v16 + 1;
      else
        v8 = v18 - (v18 == v8);
      v16 = 1;
      v100 = v18;
      goto LABEL_159;
    }
    goto LABEL_153;
  }
  v47 = v43;
  v48 = -[NSParagraphArbitrator tokenizer](v101, "tokenizer");
  if (!v48)
  {
LABEL_153:
    LOBYTE(v41) = 0;
    goto LABEL_154;
  }
  v49 = (__CFStringTokenizer *)v48;
  v85 = v47;
  v50 = -[NSAttributedString string](v93, "string");
  v107.length = (CFIndex)tokenizer;
  v107.location = v89;
  CFStringTokenizerSetString(v49, v50, v107);
  CFStringTokenizerGoToTokenAtIndex(v49, v18);
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v49);
  v52 = v49;
  v53 = CurrentTokenRange.location + CurrentTokenRange.length;
  tokenizera = v52;
  Token = CFStringTokenizerAdvanceToNextToken(v52);
  v54 = CFStringTokenizerGetCurrentTokenRange(v52);
  if (v54.location == -1)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v54.location;
  v81 = v55;
  v56 = v55 + v54.length;
  result = -[NSAttributedString length](v93, "length");
  v57 = CurrentTokenRange.location;
  if (CurrentTokenRange.location >= v18)
  {
    v16 = 0;
    LOBYTE(v41) = 0;
    if (CurrentTokenRange.location != v18 || !Token || v56 > (unint64_t)result)
      goto LABEL_141;
    v63 = -[NSAttributedString string](v93, "string");
    -[NSString rangeOfCharacterFromSet:options:range:](v63, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), 12, v81, v54.length);
    v9 = v101;
    if (v64)
    {
      v65 = CurrentTokenRange.length == 1 && v53 == v94;
      v66 = !v65;
      if (v54.location + v54.length == v94 || !v66)
      {
        v41 = CFStringTokenizerGoToTokenAtIndex(tokenizera, v18 - 1);
        v69 = CFStringTokenizerGetCurrentTokenRange(tokenizera);
        length = v69.length;
        v67 = v69.location;
        if (!v41)
        {
LABEL_154:
          v16 = 0;
          goto LABEL_155;
        }
        v70 = 0;
        while (1)
        {
          v82 = v70;
          v83 = v67;
          v71 = v67 == -1 ? 0x7FFFFFFFFFFFFFFFLL : v67;
          v72 = length;
          if (v71 + length > -[NSAttributedString length](v93, "length"))
            break;
          v73 = -[NSAttributedString string](v93, "string");
          result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:](v73, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet"), 0, v71, v72);
          if (v74)
          {
            v43 = v85;
            v57 = v83;
            goto LABEL_143;
          }
          v41 = CFStringTokenizerGoToTokenAtIndex(tokenizera, v83 - 1);
          v75 = CFStringTokenizerGetCurrentTokenRange(tokenizera);
          length = v75.length;
          v67 = v75.location;
          if (v82 > 1)
            goto LABEL_153;
          v70 = v82 + 1;
          if (!v41)
            goto LABEL_154;
        }
      }
    }
    goto LABEL_153;
  }
  if (v53 == v94)
  {
    v9 = v101;
    v43 = v47;
LABEL_143:
    v16 = v57 & ~(v57 >> 63);
    goto LABEL_144;
  }
  v43 = v47;
  if (Token && v56 <= (unint64_t)result)
  {
    v77 = -[NSAttributedString string](v93, "string");
    result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:](v77, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet"), 12, v81, v54.length);
    v57 = CurrentTokenRange.location;
    v9 = v101;
    if (!v78)
      goto LABEL_153;
    goto LABEL_143;
  }
  LOBYTE(v41) = 0;
  v16 = 0;
LABEL_141:
  v37 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v18;
LABEL_111:
  v9 = v101;
LABEL_156:
  result = -[NSParagraphArbitrator validateLineBreakContext](v9, "validateLineBreakContext");
  if (result)
  {
    v79 = *(uint64_t (**)($F08F7EC4C389A89376F473094BC6C9F8 *, _QWORD *))&result->var2;
    v105[0] = v37;
    v105[1] = v16;
    v106 = v41;
    result = ($F08F7EC4C389A89376F473094BC6C9F8 *)v79(result, v105);
    if ((result & 1) == 0)
    {
      v16 = 0;
      v8 = (unint64_t)v37 - (v37 == ($F08F7EC4C389A89376F473094BC6C9F8 *)v8);
      v18 = (unint64_t)v37;
      goto LABEL_159;
    }
  }
  v18 = (unint64_t)v37;
LABEL_163:
  retstr->var2 = v41;
  v80 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 > location)
    v80 = v18;
  retstr->var0 = v80;
  retstr->var1 = v16;
  if (v18 > location)
  {
    result = -[NSAttributedString length](-[NSParagraphArbitrator attributedString](v9, "attributedString"), "length");
    if (v18 < (unint64_t)result)
      return ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator setPreviousLineRange:](v9, "setPreviousLineRange:", location, v18 - location);
  }
  return result;
}

- (_NSRange)paragraphRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_paragraphRange.length;
  location = self->_paragraphRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPreviousLineRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_previousLineRange, &v3, 16, 1, 0);
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (int)_lineBreakStyleForLastResortHyphenation:(BOOL)a3
{
  NSDictionary *v5;
  NSDictionary *v6;
  id v7;
  int v8;
  id v9;

  if (_lineBreakStyleForLastResortHyphenation__once != -1)
    dispatch_once(&_lineBreakStyleForLastResortHyphenation__once, &__block_literal_global_108);
  if (self->_lineBreakStyle)
  {
LABEL_12:
    if (a3)
      return self->_lineBreakStyle;
    goto LABEL_16;
  }
  if (_lineBreakStyleForLastResortHyphenation__enabled)
  {
    v5 = -[NSAttributedString attributesAtIndex:effectiveRange:](-[NSParagraphArbitrator attributedString](self, "attributedString"), "attributesAtIndex:effectiveRange:", -[NSParagraphArbitrator paragraphRange](self, "paragraphRange"), 0);
    if (!v5)
      goto LABEL_9;
    v6 = v5;
    v7 = -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))v7 = (id)objc_msgSend(v7, "verticalFont");
    if (!v7)
LABEL_9:
      v7 = (id)NSDefaultFont();
    v8 = objc_msgSend((id)objc_opt_class(), "_lineBreakStyleForFont:", v7);
    self->_lineBreakStyle = v8;
    if (v8 != 1)
    {
      v9 = __NSCreateNormalizedLanguage((CFStringRef)-[NSParagraphArbitrator _preferredLanguageForCharacterAtIndex:](self, "_preferredLanguageForCharacterAtIndex:", -[NSParagraphArbitrator paragraphRange](self, "paragraphRange")));
      self->_languageSupportsLineBreakStyle = +[NSParagraphArbitrator _languageCategoryForLanguageCode:](NSParagraphArbitrator, "_languageCategoryForLanguageCode:", v9) != 0;

      goto LABEL_12;
    }
  }
  else
  {
    self->_lineBreakStyle = 1;
  }
  self->_languageSupportsLineBreakStyle = 0;
  if (a3)
    return self->_lineBreakStyle;
LABEL_16:
  if (self->_languageSupportsLineBreakStyle)
    return self->_lineBreakStyle;
  return 1;
}

- (id)lineWidth
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)validateLineBreakContext
{
  return objc_getProperty(self, a2, 128, 1);
}

- (BOOL)prepareBreakIteratorForCharacterAtIndex:(unint64_t)a3
{
  NSAttributedString *v5;
  unint64_t v6;
  NSString *v7;
  NSString *breakerLanguage;
  NSString *v9;
  NSString *v10;
  UText *v11;

  v5 = -[NSParagraphArbitrator attributedString](self, "attributedString");
  v6 = -[NSAttributedString length](v5, "length");
  if (v6 > 0x200)
    return 0;
  v7 = -[NSParagraphArbitrator _preferredLanguageForCharacterAtIndex:](self, "_preferredLanguageForCharacterAtIndex:", a3 - (v6 == a3));
  if (!self->_breaker
    || (breakerLanguage = self->_breakerLanguage, breakerLanguage != v7)
    && (-[NSString isEqual:](breakerLanguage, "isEqual:", v7) & 1) == 0)
  {
    -[NSParagraphArbitrator resetBreaker](self, "resetBreaker");
    -[NSParagraphArbitrator lineBreakStrategy](self, "lineBreakStrategy");
    self->_breaker = (UBreakIterator *)_NSCopyBreakIterator(v7, 0, 0, 0);

    self->_breakerLanguage = v7;
  }
  v9 = -[NSAttributedString string](v5, "string");
  if (!self->_breaker)
    return 0;
  v10 = v9;
  if (self->_breakerString == v9)
    return 1;
  v11 = (UText *)CFStringOpenUText();
  ubrk_setUText();
  utext_close(v11);

  self->_breakerString = v10;
  return self->_breaker != 0;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (BOOL)_attributedStringOverridesLineBreakBeforeIndex:(id)a3
{
  objc_class *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NSParagraphArbitrator__attributedStringOverridesLineBreakBeforeIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = sel_lineBreakBeforeIndex_withinRange_;
  if (_attributedStringOverridesLineBreakBeforeIndex__onceToken != -1)
    dispatch_once(&_attributedStringOverridesLineBreakBeforeIndex__onceToken, block);
  v3 = (objc_class *)objc_opt_class();
  return class_getMethodImplementation(v3, sel_lineBreakBeforeIndex_withinRange_) != (IMP)_attributedStringOverridesLineBreakBeforeIndex__defaultImp;
}

+ (id)paragraphArbitratorWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSParagraphArbitratorKey"));
    if (objc_msgSend(v9, "attributedString"))
    {
      v8 = 0;
    }
    else if (v9)
    {
      goto LABEL_8;
    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E260C7D0);
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:range:", v10, 0x7FFFFFFFFFFFFFFFLL, 0);

  if (v8)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("NSParagraphArbitratorKey"));
  v11 = v9;
LABEL_8:
  if (objc_msgSend(a3, "length"))
    v12 = a3;
  else
    v12 = 0;
  objc_msgSend(v9, "setAttributedString:", v12);
  objc_msgSend(v9, "setParagraphRange:", location, length);
  objc_msgSend(v9, "setHyphenationFactor:", 0.0);
  objc_msgSend(v9, "setLineBreakStrategy:", 0);
  objc_msgSend(v9, "setTypesetterBehavior:", +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior"));
  objc_msgSend(v9, "setLineWidth:", 0);
  objc_msgSend(v9, "setTextContainerIsSimple:", 0);
  objc_msgSend(v9, "setTextContainerWidth:", 0.0);
  objc_msgSend(v9, "setDefaultParagraphStyle:", 0);
  objc_msgSend(v9, "setBreaksLinesForInteractiveText:", 0);
  objc_msgSend(v9, "resetBreaker");
  return v9;
}

- (void)setTextContainerWidth:(double)a3
{
  if (self->_textContainerWidth != a3)
  {
    self->_textContainerWidth = a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setTextContainerIsSimple:(BOOL)a3
{
  self->_textContainerIsSimple = a3;
}

- (void)setDefaultParagraphStyle:(id)a3
{
  NSParagraphStyle *defaultParagraphStyle;

  defaultParagraphStyle = self->_defaultParagraphStyle;
  if (defaultParagraphStyle != a3)
  {

    self->_defaultParagraphStyle = (NSParagraphStyle *)objc_msgSend(a3, "copy");
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (void)resetBreaker
{
  UBreakIterator *breaker;

  breaker = self->_breaker;
  if (breaker)
  {
    _NSDisposeBreakIterator((unint64_t)breaker, 0, 0);
    self->_breaker = 0;

    self->_breakerString = 0;
    self->_breakerLanguage = 0;
  }
}

- (void)reset
{
  -[NSParagraphArbitrator setAttributedString:](self, "setAttributedString:", 0);
  -[NSParagraphArbitrator setParagraphRange:](self, "setParagraphRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[NSParagraphArbitrator setParagraphLine:](self, "setParagraphLine:", 0);
  -[NSParagraphArbitrator setLineWidth:](self, "setLineWidth:", 0);
  -[NSParagraphArbitrator setValidateLineBreakContext:](self, "setValidateLineBreakContext:", 0);
  -[NSParagraphArbitrator setLineBreakStrategy:](self, "setLineBreakStrategy:", 0);
  -[NSParagraphArbitrator setTypesetterBehavior:](self, "setTypesetterBehavior:", +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior"));
  -[NSParagraphArbitrator setHyphenationFactor:](self, "setHyphenationFactor:", 0.0);
  -[NSParagraphArbitrator setPreviousLineRange:](self, "setPreviousLineRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[NSParagraphArbitrator setPreferredLanguage:](self, "setPreferredLanguage:", 0);
}

- (void)setParagraphRange:(_NSRange)a3
{
  if (a3.location != self->_paragraphRange.location || a3.length != self->_paragraphRange.length)
  {
    self->_paragraphRange = a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setAttributedString:(id)a3
{
  NSAttributedString *attributedString;

  attributedString = self->_attributedString;
  if (attributedString != a3)
  {

    self->_attributedString = (NSAttributedString *)a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setTypesetterBehavior:(int64_t)a3
{
  self->_typesetterBehavior = a3;
}

- (void)setLineWidth:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  self->_lineBreakStrategy = a3;
}

- (void)setHyphenationFactor:(double)a3
{
  self->_hyphenationFactor = a3;
}

- (void)setValidateLineBreakContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setParagraphLine:(__CTLine *)a3
{
  __CTLine *paragraphLine;

  paragraphLine = self->_paragraphLine;
  if (paragraphLine != a3)
  {
    if (paragraphLine)
      CFRelease(paragraphLine);
    if (a3)
      CFRetain(a3);
    self->_paragraphLine = a3;
    self->_needsOptimalLayout = 1;
  }
}

+ (BOOL)_hyphenatesAsLastResort
{
  if (_hyphenatesAsLastResort_once != -1)
    dispatch_once(&_hyphenatesAsLastResort_once, &__block_literal_global_12);
  return _hyphenatesAsLastResort_result;
}

+ (int)_lineBreakStyleForFont:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  int v10;

  if (_lineBreakStyleForFont__once != -1)
    dispatch_once(&_lineBreakStyleForFont__once, &__block_literal_global_56);
  v4 = (void *)objc_msgSend(a3, "fontDescriptor");
  v5 = objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA8260]);
  if (!v5)
    return 1;
  v6 = (void *)v5;
  v7 = (void *)_lineBreakStyleForFont__cache;
  objc_sync_enter((id)_lineBreakStyleForFont__cache);
  v8 = (char *)objc_msgSend((id)_lineBreakStyleForFont__cache, "objectForKeyedSubscript:", v6);
  if (!v8)
  {
    while (objc_msgSend(v6, "rangeOfString:", *(__CFString **)((char *)&_lineBreakStyleForFont__pairs + (_QWORD)v8)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 += 16;
      if (v8 == (char *)128)
      {
        v9 = 0;
        goto LABEL_10;
      }
    }
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&_lineBreakStyleForFont__pairs + (_QWORD)v8 + 8));
LABEL_10:
    if (v9)
      v8 = (char *)v9;
    else
      v8 = (char *)&unk_1E2631750;
    objc_msgSend((id)_lineBreakStyleForFont__cache, "setObject:forKeyedSubscript:", v8, v6);
  }
  v10 = objc_msgSend(v8, "unsignedIntegerValue");
  objc_sync_exit(v7);
  return v10;
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

- (int)_lineBreakStyle
{
  return -[NSParagraphArbitrator _lineBreakStyleForLastResortHyphenation:](self, "_lineBreakStyleForLastResortHyphenation:", 0);
}

- (_NSRange)previousLineRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_previousLineRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSParagraphStyle)defaultParagraphStyle
{
  NSParagraphStyle *result;

  result = self->_defaultParagraphStyle;
  if (!result)
    return +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  return result;
}

- (double)raggednessWithCharIndexAsLineBreak:(unint64_t)a3 inRange:(_NSRange)a4
{
  NSUInteger location;
  unint64_t v5;
  double (**v7)(id, unint64_t, unint64_t, _QWORD);
  double (**v8)(id, unint64_t, unint64_t, _QWORD);
  double v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;

  location = a4.location;
  v5 = a3;
  v7 = -[NSParagraphArbitrator lineWidth](self, "lineWidth", a3, a4.location, a4.length);
  if (v7
    && ((v8 = v7,
         v9 = v7[2](v7, location, v5 - location, 0),
         -[NSParagraphArbitrator previousLineRange](self, "previousLineRange"),
         !v10)
      ? (v13 = -[NSParagraphArbitrator paragraphRange](self, "paragraphRange"), v12 = v14 - v5 + v13)
      : (v5 = -[NSParagraphArbitrator previousLineRange](self, "previousLineRange"), v12 = v11),
        v15 = v8[2](v8, v5, v12, 0),
        v15 > 0.0))
  {
    return v9 / v15;
  }
  else
  {
    return 0.0;
  }
}

- (BOOL)prepareTokenizerForPreferredLanguage:(id)a3
{
  int v5;
  CFLocaleRef v6;
  const __CFLocale *v7;
  __CFStringTokenizer *v8;
  CFRange v10;

  if (a3)
  {
    v5 = __NSShouldUseTokenizerForPushOut((const __CFString *)a3);
    if (!v5)
      return v5;
  }
  else
  {
    if (prepareTokenizerForPreferredLanguage__onceToken != -1)
      dispatch_once(&prepareTokenizerForPreferredLanguage__onceToken, &__block_literal_global_28_0);
    if (!prepareTokenizerForPreferredLanguage__shouldUseTokenizerForSystemLanguage)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
  }
  if (!self->_tokenizer)
  {
    v7 = __NSCreateLocaleForPreferredLanguage((CFStringRef)a3);
    v10.location = 0;
    v10.length = 0;
    v8 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v10, 4uLL, v7);
    if (v7)
      CFRelease(v7);
    self->_tokenizer = v8;
    goto LABEL_14;
  }
  if (!-[NSString isEqualToString:](-[NSParagraphArbitrator preferredLanguage](self, "preferredLanguage"), "isEqualToString:", a3))
  {
    v6 = __NSCreateLocaleForPreferredLanguage((CFStringRef)a3);
    _CFStringTokenizerSetLocale();
    if (v6)
      CFRelease(v6);
LABEL_14:
    -[NSParagraphArbitrator setPreferredLanguage:](self, "setPreferredLanguage:", a3);
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (NSParagraphArbitrator)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSParagraphArbitrator *v7;
  NSParagraphArbitrator *v8;
  id v9;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)NSParagraphArbitrator;
  v7 = -[NSParagraphArbitrator init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NSParagraphArbitrator reset](v7, "reset");
    if (objc_msgSend(a3, "length"))
      v9 = a3;
    else
      v9 = 0;
    -[NSParagraphArbitrator setAttributedString:](v8, "setAttributedString:", v9);
    -[NSParagraphArbitrator setParagraphRange:](v8, "setParagraphRange:", location, length);
    v8->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (void)setPreferredLanguage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

uint64_t __64__NSParagraphArbitrator_adjustedLineBreakIndexForProposedIndex___block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
  objc_msgSend(v0, "removeCharactersInRange:", 9, 1);
  result = objc_msgSend(v0, "copy");
  adjustedLineBreakIndexForProposedIndex__whitespaceNoTab = result;
  return result;
}

id __86__NSParagraphArbitrator__firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 160, 1);
  _firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__lastResortCharacterSet = (uint64_t)result;
  return result;
}

id __48__NSParagraphArbitrator__shouldUseOptimalLayout__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\t"));
  _shouldUseOptimalLayout_forbiddenCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __63__NSParagraphArbitrator__preferredLanguageForCharacterAtIndex___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"), "firstObject"), "copy");
  _preferredLanguageForCharacterAtIndex__globalPreferredLanguage = result;
  return result;
}

uint64_t __35__NSParagraphArbitrator_initialize__block_invoke()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "registerDefaults:", &unk_1E26316D0);
}

uint64_t __65__NSParagraphArbitrator__lineBreakStyleForLastResortHyphenation___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUsesTextStylesForLineBreaks"));
  _lineBreakStyleForLastResortHyphenation__enabled = result;
  return result;
}

uint64_t __48__NSParagraphArbitrator__hyphenatesAsLastResort__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSHyphenatesAsLastResort"));
  _hyphenatesAsLastResort_result = result;
  return result;
}

+ (void)initialize
{
  if (initialize_once != -1)
    dispatch_once(&initialize_once, &__block_literal_global_11);
}

id __48__NSParagraphArbitrator__lineBreakStyleForFont___block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _lineBreakStyleForFont__cache = (uint64_t)result;
  return result;
}

IMP __72__NSParagraphArbitrator__attributedStringOverridesLineBreakBeforeIndex___block_invoke(uint64_t a1)
{
  objc_class *v2;
  IMP result;

  v2 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v2, *(SEL *)(a1 + 32));
  _attributedStringOverridesLineBreakBeforeIndex__defaultImp = (uint64_t)result;
  return result;
}

- (BOOL)_shouldUseCFStringTokenizerForLineBreaks
{
  if (_shouldUseCFStringTokenizerForLineBreaks_once != -1)
    dispatch_once(&_shouldUseCFStringTokenizerForLineBreaks_once, &__block_literal_global_11);
  return _shouldUseCFStringTokenizerForLineBreaks_result;
}

uint64_t __65__NSParagraphArbitrator__shouldUseCFStringTokenizerForLineBreaks__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUsesCFStringTokenizerForLineBreaks"));
  _shouldUseCFStringTokenizerForLineBreaks_result = result;
  return result;
}

- (__CTLine)paragraphLine
{
  return self->_paragraphLine;
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
}

- (id)optimalLineBreaker
{
  return self->_optimalLineBreaker;
}

- (BOOL)_hyphenatesAsLastResort
{
  NSParagraphStyle *v3;
  uint64_t v4;

  v3 = -[NSAttributedString attribute:atIndex:effectiveRange:](-[NSParagraphArbitrator attributedString](self, "attributedString"), "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), -[NSParagraphArbitrator paragraphRange](self, "paragraphRange"), 0);
  if (!v3)
    v3 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  v4 = -[NSParagraphStyle secondaryLineBreakMode](v3, "secondaryLineBreakMode");
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LODWORD(v4) = +[NSParagraphArbitrator _hyphenatesAsLastResort](NSParagraphArbitrator, "_hyphenatesAsLastResort");
      if ((_DWORD)v4)
        LOBYTE(v4) = -[NSParagraphArbitrator _lineBreakStyleForLastResortHyphenation:](self, "_lineBreakStyleForLastResortHyphenation:", 1) != 1;
    }
  }
  return v4;
}

- (NSParagraphArbitrator)init
{
  return -[NSParagraphArbitrator initWithAttributedString:range:](self, "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  -[NSParagraphArbitrator reset](self, "reset");
  tokenizer = self->_tokenizer;
  if (tokenizer)
  {
    CFRelease(tokenizer);
    self->_tokenizer = 0;
  }

  -[NSParagraphArbitrator setParagraphLine:](self, "setParagraphLine:", 0);
  -[NSParagraphArbitrator resetBreaker](self, "resetBreaker");
  v4.receiver = self;
  v4.super_class = (Class)NSParagraphArbitrator;
  -[NSParagraphArbitrator dealloc](&v4, sel_dealloc);
}

uint64_t __62__NSParagraphArbitrator_prepareTokenizerForPreferredLanguage___block_invoke()
{
  uint64_t result;

  result = __NSShouldUseTokenizerForPushOut((const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"), "firstObject"));
  prepareTokenizerForPreferredLanguage__shouldUseTokenizerForSystemLanguage = result;
  return result;
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_optimalLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _NSOptimalLineBreaker *optimalLineBreaker;

  length = a6.length;
  location = a6.location;
  if (-[NSParagraphArbitrator paragraphRange](self, "paragraphRange", a4, a5) <= a6.location)
  {
    v10 = -[NSParagraphArbitrator paragraphRange](self, "paragraphRange");
    if (location + length <= v10 + v11)
    {
      -[NSParagraphArbitrator _computeOptimalLayout](self, "_computeOptimalLayout");
      *(_QWORD *)&retstr->var2 = 0;
      *(_OWORD *)&retstr->var0 = xmmword_18D6CBEF0;
      if (-[_NSOptimalLineBreaker lineCount](self->_optimalLineBreaker, "lineCount") != -1)
      {
        v12 = 0;
        do
        {
          optimalLineBreaker = self->_optimalLineBreaker;
          if (optimalLineBreaker)
            -[_NSOptimalLineBreaker lineBreakAtIndex:](optimalLineBreaker, "lineBreakAtIndex:", v12);
          ++v12;
        }
        while (v12 < -[_NSOptimalLineBreaker lineCount](self->_optimalLineBreaker, "lineCount", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0)+ 1);
      }
      -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:].cold.2();
    }
  }
  -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:].cold.1();
}

- (NSString)debugString
{
  NSDictionary *v3;
  NSDictionary *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSString *v10;
  NSString *v11;

  v3 = -[NSAttributedString attributesAtIndex:effectiveRange:](-[NSParagraphArbitrator attributedString](self, "attributedString"), "attributesAtIndex:effectiveRange:", -[NSParagraphArbitrator paragraphRange](self, "paragraphRange"), 0);
  if (!v3)
    goto LABEL_5;
  v4 = v3;
  v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("NSFont"));
  if (objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))v5 = (id)objc_msgSend(v5, "verticalFont");
  if (!v5)
LABEL_5:
    v5 = (id)NSDefaultFont();
  v6 = (void *)objc_msgSend(v5, "fontDescriptor");
  v7 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CA8260]);
  if (!v7)
    return (NSString *)CFSTR("ts=nil");
  v8 = v7;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("UICTFontTextStyle")))
    v8 = (void *)objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("UICTFontTextStyle"), "length"));
  v9 = -[NSParagraphArbitrator _lineBreakStyle](self, "_lineBreakStyle");
  v10 = (NSString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("ts=%@"), v8);
  v11 = v10;
  if ((v9 - 2) <= 3)
    -[NSString appendFormat:](v10, "appendFormat:", off_1E2604B60[v9 - 2]);
  return v11;
}

- (void)configureOptimalLineBreaker
{
  __assert_rtn("-[NSParagraphArbitrator configureOptimalLineBreaker]", "NSParagraphArbitrator.m", 961, "[languageCode isEqualToString:@\"zh\"] || [languageCode isEqualToString:@\"ja\"]");
}

- (void)_computeOptimalLayout
{
  if (self->_needsOptimalLayout)
  {
    -[NSParagraphArbitrator configureOptimalLineBreaker](self, "configureOptimalLineBreaker");
    -[_NSOptimalLineBreaker layout](self->_optimalLineBreaker, "layout");
    self->_needsOptimalLayout = 0;
  }
}

+ (int)_languageCategoryForLanguageCode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_languageCategoryForLanguageCode__once != -1)
  {
    dispatch_once(&_languageCategoryForLanguageCode__once, &__block_literal_global_92);
    if (a3)
      goto LABEL_3;
    return 0;
  }
  if (!a3)
    return 0;
LABEL_3:
  v4 = (void *)_languageCategoryForLanguageCode__cache;
  objc_sync_enter((id)_languageCategoryForLanguageCode__cache);
  v5 = (void *)objc_msgSend((id)_languageCategoryForLanguageCode__cache, "objectForKeyedSubscript:", a3);
  if (!v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", a3);
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Latn")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("Cyrl")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("Grek")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("Hebr")))
    {
      if (_languageCategoryForLanguageCode__enabledForAllLanguages
        || (objc_msgSend(a3, "isEqualToString:", CFSTR("de")) & 1) != 0
        || (objc_msgSend(a3, "isEqualToString:", CFSTR("ru")) & 1) != 0
        || objc_msgSend(a3, "isEqualToString:", CFSTR("uk")))
      {
        v5 = &unk_1E2631750;
      }
      else
      {
        v5 = &unk_1E2631768;
      }
    }
    else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("zh")) & 1) != 0
           || (objc_msgSend(a3, "isEqualToString:", CFSTR("ja")) & 1) != 0)
    {
      v5 = &unk_1E2631780;
    }
    else if (objc_msgSend(a3, "isEqualToString:", CFSTR("ko")))
    {
      v5 = &unk_1E2631798;
    }
    else
    {
      v5 = &unk_1E2631768;
    }
    objc_msgSend((id)_languageCategoryForLanguageCode__cache, "setObject:forKeyedSubscript:", v5, a3);
  }
  objc_sync_exit(v4);
  return objc_msgSend(v5, "unsignedIntegerValue");
}

id __58__NSParagraphArbitrator__languageCategoryForLanguageCode___block_invoke()
{
  id result;

  _languageCategoryForLanguageCode__enabledForAllLanguages = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUsesTextStylesForLineBreaksInAllLanguages"));
  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _languageCategoryForLanguageCode__cache = (uint64_t)result;
  return result;
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (int64_t)typesetterBehavior
{
  return self->_typesetterBehavior;
}

- (BOOL)textContainerIsSimple
{
  return self->_textContainerIsSimple;
}

- (NSString)preferredLanguage
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:.cold.1()
{
  __assert_rtn("-[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:]", "NSParagraphArbitrator.m", 796, "self.paragraphRange.location <= range.location && NSMaxRange(range) <= NSMaxRange(self.paragraphRange)");
}

- (void)_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:.cold.2()
{
  __assert_rtn("-[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:]", "NSParagraphArbitrator.m", 809, "NO");
}

@end
