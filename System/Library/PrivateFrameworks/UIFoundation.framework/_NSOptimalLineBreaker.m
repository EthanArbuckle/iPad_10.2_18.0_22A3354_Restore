@implementation _NSOptimalLineBreaker

- (void)dealloc
{
  $102BB1629D0471A0919C413AE880609B *lineBreaks;
  __CFArray *lines;
  $554B148941027912B77C686939519A4B *lineInfos;
  __CFStringTokenizer *wordTokenizer;
  __CFStringTokenizer *wordBoundaryTokenizer;
  __CFStringTokenizer *lineBreakTokenizer;
  $102BB1629D0471A0919C413AE880609B *chosenLineBreaks;
  __CFLocale *locale;
  __CTLine *paragraphLine;
  objc_super v12;

  lineBreaks = self->_lineBreaks;
  if (lineBreaks)
    free(lineBreaks);
  lines = self->_lines;
  if (lines)
    CFRelease(lines);
  lineInfos = self->_lineInfos;
  if (lineInfos)
    free(lineInfos);
  wordTokenizer = self->_wordTokenizer;
  if (wordTokenizer)
    CFRelease(wordTokenizer);
  wordBoundaryTokenizer = self->_wordBoundaryTokenizer;
  if (wordBoundaryTokenizer)
    CFRelease(wordBoundaryTokenizer);
  lineBreakTokenizer = self->_lineBreakTokenizer;
  if (lineBreakTokenizer)
    CFRelease(lineBreakTokenizer);
  chosenLineBreaks = self->_chosenLineBreaks;
  if (chosenLineBreaks)
    free(chosenLineBreaks);
  locale = self->_locale;
  if (locale)
    CFRelease(locale);
  paragraphLine = self->_paragraphLine;
  if (paragraphLine)
    CFRelease(paragraphLine);
  v12.receiver = self;
  v12.super_class = (Class)_NSOptimalLineBreaker;
  -[_NSOptimalLineBreaker dealloc](&v12, sel_dealloc);
}

- (int64x2_t)_resetOptions
{
  void *v7;
  int64x2_t result;

  if (a1)
  {
    *(_WORD *)(a1 + 369) = 1;
    *(_QWORD *)(a1 + 392) = 0xBFF0000000000000;
    *(_QWORD *)(a1 + 400) = 0x7FFFFFFFFFFFFFFFLL;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(a1 + 232) = _Q0;
    *(_QWORD *)(a1 + 408) = 0;
    v7 = *(void **)(a1 + 424);
    *(_QWORD *)(a1 + 424) = CFSTR("Optimal");

    *(_WORD *)(a1 + 372) = 0;
    *(_BYTE *)(a1 + 208) = 0;
    *(_QWORD *)(a1 + 16) = 0x4059000000000000;
    *(_OWORD *)(a1 + 216) = xmmword_18D6CBCF0;
    *(int64x2_t *)(a1 + 248) = vdupq_n_s64(0x40A7700000000000uLL);
    *(_QWORD *)(a1 + 264) = 0x416312D000000000;
    *(_QWORD *)(a1 + 272) = 5;
    *(_QWORD *)(a1 + 280) = 0x4008000000000000;
    *(_OWORD *)(a1 + 288) = xmmword_18D6CBD00;
    *(_OWORD *)(a1 + 304) = xmmword_18D6CBD10;
    result = vdupq_n_s64(0x3F947AE147AE147BuLL);
    *(int64x2_t *)(a1 + 320) = result;
    *(_QWORD *)(a1 + 336) = 0;
    *(_QWORD *)(a1 + 344) = 0;
    *(_QWORD *)(a1 + 380) = 0x200000003;
    *(_BYTE *)(a1 + 375) = 1;
    *(_BYTE *)(a1 + 377) = 0;
  }
  return result;
}

- (_NSOptimalLineBreaker)init
{
  _NSOptimalLineBreaker *v2;
  _NSOptimalLineBreaker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NSOptimalLineBreaker;
  v2 = -[_NSOptimalLineBreaker init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_NSOptimalLineBreaker _resetOptions]((uint64_t)v2);
    v3->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
  return v3;
}

- (void)setAllowsHyphenation:(BOOL)a3
{
  if (self->_allowsHyphenation != a3)
  {
    self->_allowsHyphenation = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setHyphenationFactor:(double)a3
{
  if (self->_hyphenationFactor != a3)
  {
    self->_hyphenationFactor = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setMinHyphenationLineCount:(unint64_t)a3
{
  if (self->_minHyphenationLineCount != a3)
  {
    self->_minHyphenationLineCount = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setShouldFillLastLine:(BOOL)a3
{
  if (self->_shouldFillLastLine != a3)
  {
    self->_shouldFillLastLine = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setMinimumLastLineLength:(double)a3
{
  if (self->_minimumLastLineLength != a3)
  {
    self->_minimumLastLineLength = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setLineCountAdjustment:(int64_t)a3
{
  if (self->_lineCountAdjustment != a3)
  {
    self->_lineCountAdjustment = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setLineBreakAlgorithm:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_lineBreakAlgorithm != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineBreakAlgorithm, a3);
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    v5 = v6;
  }

}

- (void)setUsesHangingPunctuation:(BOOL)a3
{
  if (self->_usesHangingPunctuation != a3)
  {
    self->_usesHangingPunctuation = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setUsesStretchClasses:(BOOL)a3
{
  if (self->_usesStretchClasses != a3)
  {
    self->_usesStretchClasses = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setAvoidsRivers:(BOOL)a3
{
  if (self->_avoidsRivers != a3)
  {
    self->_avoidsRivers = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setCompressesLeftAlignedText:(BOOL)a3
{
  if (self->_compressesLeftAlignedText != a3)
  {
    self->_compressesLeftAlignedText = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setExpandsGlyphs:(BOOL)a3
{
  if (self->_expandsGlyphs != a3)
  {
    self->_expandsGlyphs = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
  }
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  if (self->_lineBreakStrategy != a3)
  {
    self->_lineBreakStrategy = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setKoreanLineBreakBehavior:(int)a3
{
  if (self->_koreanLineBreakBehavior != a3)
  {
    self->_koreanLineBreakBehavior = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setPrepositionLineBreakBehavior:(int)a3
{
  if (self->_prepositionLineBreakBehavior != a3)
  {
    self->_prepositionLineBreakBehavior = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setBreaksWithinCJWords:(BOOL)a3
{
  if (self->_breaksWithinCJWords != a3)
  {
    self->_breaksWithinCJWords = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setUsesCFStringTokenizerForLineBreaks:(BOOL)a3
{
  if (self->_usesCFStringTokenizerForLineBreaks != a3)
  {
    self->_usesCFStringTokenizerForLineBreaks = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setHyphenatesBetweenMorphemesFreely:(BOOL)a3
{
  if (self->_hyphenatesBetweenMorphemesFreely != a3)
  {
    self->_hyphenatesBetweenMorphemesFreely = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setHyphenatesAsLastResort:(BOOL)a3
{
  if (self->_hyphenatesAsLastResort != a3)
  {
    self->_hyphenatesAsLastResort = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
  }
}

- (void)setAttributedString:(id)a3
{
  id v4;

  v4 = a3;
  -[_NSOptimalLineBreaker setAttributedString:paragraphRange:](self, "setAttributedString:paragraphRange:", v4, 0, objc_msgSend(v4, "length"));

}

- (void)setParagraphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  -[_NSOptimalLineBreaker attributedString](self, "attributedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_NSOptimalLineBreaker setAttributedString:paragraphRange:](self, "setAttributedString:paragraphRange:", v6, location, length);

}

- (void)setAttributedString:(id)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  BOOL v9;
  NSParagraphStyle *paragraphStyle;
  id v11;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    -[_NSOptimalLineBreaker setAttributedString:paragraphRange:].cold.1();
  v11 = v8;
  if (location + length > objc_msgSend(v8, "length"))
    -[_NSOptimalLineBreaker setAttributedString:paragraphRange:].cold.2();
  v9 = location == self->_paragraphRange.location && length == self->_paragraphRange.length;
  if (!v9 || (objc_msgSend(v11, "isEqualToAttributedString:", self->_attributedString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedString, a3);
    self->_paragraphRange.location = location;
    self->_paragraphRange.length = length;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
    self->_lineMetricsValid = 0;
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;

    self->_lineBreakTokenizerValid = 0;
  }

}

- (void)setTextContainerWidth:(double)a3
{
  NSParagraphStyle *paragraphStyle;

  if (self->_textContainerWidth != a3)
  {
    self->_textContainerWidth = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;

  }
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
    self->_lineMetricsValid = 0;
  }
}

- (__CFLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(__CFLocale *)a3
{
  __CFLocale *locale;
  __CFStringTokenizer *wordTokenizer;
  __CFStringTokenizer *wordBoundaryTokenizer;
  __CFStringTokenizer *lineBreakTokenizer;

  locale = self->_locale;
  if (locale != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      locale = self->_locale;
    }
    if (locale)
      CFRelease(locale);
    self->_locale = a3;
    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18D6CBB80;
    wordTokenizer = self->_wordTokenizer;
    if (wordTokenizer)
    {
      CFRelease(wordTokenizer);
      self->_wordTokenizer = 0;
    }
    wordBoundaryTokenizer = self->_wordBoundaryTokenizer;
    if (wordBoundaryTokenizer)
    {
      CFRelease(wordBoundaryTokenizer);
      self->_wordBoundaryTokenizer = 0;
    }
    lineBreakTokenizer = self->_lineBreakTokenizer;
    if (lineBreakTokenizer)
    {
      CFRelease(lineBreakTokenizer);
      self->_lineBreakTokenizer = 0;
      self->_lineBreakTokenizerValid = 0;
    }
  }
}

- (NSParagraphStyle)defaultParagraphStyle
{
  NSParagraphStyle *defaultParagraphStyle;

  defaultParagraphStyle = self->_defaultParagraphStyle;
  if (defaultParagraphStyle)
    return defaultParagraphStyle;
  +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  return (NSParagraphStyle *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDefaultParagraphStyle:(id)a3
{
  NSParagraphStyle *v4;
  NSParagraphStyle *defaultParagraphStyle;
  NSParagraphStyle *paragraphStyle;

  if (self->_defaultParagraphStyle != a3)
  {
    v4 = (NSParagraphStyle *)objc_msgSend(a3, "copy");
    defaultParagraphStyle = self->_defaultParagraphStyle;
    self->_defaultParagraphStyle = v4;

    -[_NSOptimalLineBreaker invalidateWrapping](self, "invalidateWrapping");
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;

  }
}

- (void)setOptions:(id)a3
{
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  float v25;
  void *v26;
  float v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("tolerance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "floatValue");
      self->_tolerance = v5;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("justifiedHyphenPenalty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "floatValue");
      self->_justifiedHyphenPenalty = v7;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("nonJustifiedHyphenPenalty"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v8, "floatValue");
      self->_nonJustifiedHyphenPenalty = v9;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("twoHyphenPenalty"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v10, "floatValue");
      self->_twoHyphenPenalty = v11;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("stretchClassMismatchPenalty"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "floatValue");
      self->_stretchClassMismatchPenalty = v13;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("riverPenalty"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v14, "floatValue");
      self->_riverPenalty = v15;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("expansionPower"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v16, "floatValue");
      self->_expansionPower = v17;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("expansionWeight"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v18, "floatValue");
      self->_expansionWeight = v19;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("maxContract"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v20, "floatValue");
      self->_maxContract = v21;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("maxExpand"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v22, "floatValue");
      self->_maxExpand = v23;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("nonJustifiedStretchFactor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v24, "floatValue");
      self->_nonJustifiedStretchFactor = v25;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("maxGlyphContract"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v26, "floatValue");
      self->_maxGlyphContract = v27;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("maxGlyphExpand"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v28, "floatValue");
      self->_maxGlyphExpand = v29;
    }
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("minPreHyphenLength"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      self->_minPreHyphenLength = objc_msgSend(v30, "integerValue");
  }

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("minPostHyphenLength"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      self->_minPostHyphenLength = objc_msgSend(v31, "integerValue");
  }

}

- (id)_lineMetrics
{
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _NSLineMetrics *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a1)
  {
    v1 = a1;
    if (!*((_BYTE *)a1 + 368))
    {
      v2 = a1[45];
      if (v2)
      {
        objc_msgSend(a1, "attributedString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v1, "paragraphRange");
        objc_msgSend(v2, "setAttributedString:range:line:", v3, v4, v5, objc_msgSend(v1, "paragraphLine"));
      }
      else
      {
        v6 = [_NSLineMetrics alloc];
        objc_msgSend(v1, "attributedString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v1, "paragraphRange");
        v9 = -[_NSLineMetrics initWithAttributedString:range:line:](v6, "initWithAttributedString:range:line:", v3, v7, v8, objc_msgSend(v1, "paragraphLine"));
        v10 = v1[45];
        v1[45] = (id)v9;

      }
      objc_msgSend(v1[45], "setLocale:", v1[17]);
      *((_BYTE *)v1 + 368) = 1;
    }
    a1 = (id *)v1[45];
  }
  return a1;
}

- (_QWORD)_computeParagraphStyleValues
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;

  if (result)
  {
    v1 = result;
    if (!result[18])
    {
      objc_msgSend(result, "attributedString");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "length");

      if (v3)
      {
        v4 = objc_msgSend(v1, "paragraphRange");
        objc_msgSend(v1, "attributedString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v4 == objc_msgSend(v5, "length");

        objc_msgSend(v1, "attributedString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v4 - v6, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v1[18];
        v1[18] = v8;

      }
      v10 = (void *)v1[18];
      if (!v10)
      {
        objc_msgSend(v1, "defaultParagraphStyle");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v1[18];
        v1[18] = v11;

        v10 = (void *)v1[18];
      }
      v1[19] = objc_msgSend(v10, "alignment");
      v13 = 0.0;
      v14 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v1[18], objc_msgSend((id)v1[18], "baseWritingDirection"), 1, &v14, &v13, *((double *)v1 + 56));
      *((double *)v1 + 20) = v13 - v14;
      result = (_QWORD *)+[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v1[18], objc_msgSend((id)v1[18], "baseWritingDirection"), 0, &v14, &v13, *((double *)v1 + 56));
      *((double *)v1 + 21) = v13 - v14;
    }
  }
  return result;
}

- (_QWORD)_paragraphStyle
{
  _QWORD *v1;

  if (a1)
  {
    v1 = a1;
    -[_NSOptimalLineBreaker _computeParagraphStyleValues](a1);
    a1 = (id)v1[18];
  }
  return a1;
}

- (id)_getNaturalWidth:(double *)a3 expand:(double *)a4 contract:(uint64_t)a5 fromBreak:(uint64_t)a6 toBreak:
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26;

  if (!result)
    return result;
  v11 = (uint64_t)result;
  v12 = *(_QWORD *)(a5 + 8) + *(_QWORD *)a5;
  v13 = *(_QWORD *)a6 - v12;
  -[_NSOptimalLineBreaker _lineMetrics](result);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthOfSubstringWithRange:", v12, v13);
  v16 = v15;

  if (v16 - *(double *)(a5 + 40) - *(double *)(a6 + 32) + *(double *)(a6 + 24) >= 0.0)
    v17 = v16 - *(double *)(a5 + 40) - *(double *)(a6 + 32) + *(double *)(a6 + 24);
  else
    v17 = 0.0;
  v18 = *(double *)(a5 + 56);
  if (*(double *)(a6 + 56) - *(double *)(a6 + 16) - v18 >= 0.0)
    v19 = *(double *)(a6 + 56) - *(double *)(a6 + 16) - v18;
  else
    v19 = 0.0;
  v21 = fabs(v19) < 0.001 && v13 > 1;
  if (v21)
    v19 = v17 / (double)v13 * (double)(v13 - 1) * 0.2;
  result = (id *)-[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)v11);
  if (*(_QWORD *)(v11 + 152) == 3)
  {
    v22 = v19 * *(double *)(v11 + 304);
    v23 = 0.0;
    if (v21)
      goto LABEL_26;
  }
  else
  {
    v24 = *(double *)(v11 + 312);
    -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](v11, *(_QWORD *)(v11 + 464));
    v25 = v24 * *(double *)(v11 + 120);
    result = (id *)-[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)v11);
    v22 = v25 + v25;
    if (*(_QWORD *)(v11 + 152) != 1)
      v22 = v25;
    if (*(_BYTE *)(v11 + 374))
      v26 = v21;
    else
      v26 = 1;
    v23 = 0.0;
    if ((v26 & 1) != 0)
      goto LABEL_26;
  }
  v23 = v19 * *(double *)(v11 + 296);
LABEL_26:
  if (a2)
    *a2 = v17;
  if (a3)
    *a3 = v22;
  if (a4)
    *a4 = v23;
  return result;
}

- (double)_naturalWidthFromBreak:(id *)a3 toBreak:(id *)a4
{
  double v5;

  v5 = 0.0;
  -[_NSOptimalLineBreaker _getNaturalWidth:expand:contract:fromBreak:toBreak:]((id *)&self->super.isa, &v5, 0, 0, (uint64_t)a3, (uint64_t)a4);
  return v5;
}

- (void)_getMinWidth:(double *)a3 maxWidth:(uint64_t)a4 whenJustifyingLineFromBreak:(uint64_t)a5 toBreak:
{
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;

  if (!a1)
    return;
  v9 = *(_WORD *)(a4 + 48);
  if (a5)
  {
    v10 = *(_WORD *)(a5 + 48);
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
    v11 = 160;
    if ((v9 & 1) == 0)
      v11 = 168;
    v12 = *(double *)(a1 + v11);
    if ((v10 & 1) != 0 && !*(_BYTE *)(a1 + 370))
    {
      v13 = *(double *)(a1 + 408);
      if (v13 <= 0.0)
      {
        v14 = 0.0;
        if ((*(_BYTE *)(a1 + 432) & 1) != 0)
        {
          -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(_QWORD *)a4);
          if (*(double *)(a1 + 128) * (double)*(unint64_t *)(a1 + 272) >= *(double *)(a1 + 448))
            v16 = *(double *)(a1 + 448);
          else
            v16 = *(double *)(a1 + 128) * (double)*(unint64_t *)(a1 + 272);
          -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(_QWORD *)a4);
          v14 = v16 + *(double *)(a1 + 128) * 3.0;
        }
      }
      else
      {
        -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(_QWORD *)a4);
        v14 = *(double *)(a1 + 128) * 3.0 + v13 * v12;
      }
      goto LABEL_13;
    }
  }
  else
  {
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
    v15 = 160;
    if ((v9 & 1) == 0)
      v15 = 168;
    v12 = *(double *)(a1 + v15);
  }
  v14 = v12;
LABEL_13:
  if (a2)
  {
    if (v14 >= v12)
      v14 = v12;
    *a2 = v14;
  }
  if (a3)
    *a3 = v12;
}

- (double)_expansionRatioFromBreak:(uint64_t)a3 toBreak:
{
  double v6;
  double v7;
  double result;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (!a1)
    return 0.0;
  if (!*(_BYTE *)(a1 + 8))
    -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:].cold.1();
  v14 = 0.0;
  v15 = 0.0;
  v13 = 0.0;
  -[_NSOptimalLineBreaker _getNaturalWidth:expand:contract:fromBreak:toBreak:]((id *)a1, &v15, &v14, &v13, a2, a3);
  v11 = 0.0;
  v12 = 0.0;
  -[_NSOptimalLineBreaker _getMinWidth:maxWidth:whenJustifyingLineFromBreak:toBreak:](a1, &v12, &v11, a2, a3);
  if (*(_BYTE *)(a1 + 208)
    && (-[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1), *(_QWORD *)(a1 + 152) == 3))
  {
    v6 = v15 * (1.0 - *(double *)(a1 + 320));
    v7 = v15 * (*(double *)(a1 + 328) + 1.0);
  }
  else
  {
    v6 = v15;
    v7 = v15;
  }
  if (v7 >= v12)
  {
    result = 0.0;
    if (v6 > v11)
    {
      v9 = v6 - v11;
      if (v13 <= 0.0)
      {
        v10 = v9 > 0.001;
        result = -INFINITY;
        if (!v10)
          return 0.0;
      }
      else
      {
        return -v9 / v13;
      }
    }
  }
  else if (v14 <= 0.0)
  {
    return INFINITY;
  }
  else
  {
    return (v12 - v7) / v14;
  }
  return result;
}

- (void)_estimatedExpansionRatioForLineWithNaturalWidth:(uint64_t)a1
{
  uint64_t v3;

  if (a1)
  {
    if (a2 <= 0.0 || *(double *)(a1 + 448) < a2)
      -[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:].cold.1();
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
    v3 = *(_QWORD *)(a1 + 152);
    if (v3 != 3)
      -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(_QWORD *)(a1 + 464));
  }
}

- (long)_breakPenaltyForHyphenationFactor:(uint64_t)a1
{
  long double result;
  double v5;
  double v6;

  result = 0.0;
  if (a1)
  {
    if (a2 == 0.0)
    {
      return INFINITY;
    }
    else if (a2 != 1.0)
    {
      -[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:](a1, *(double *)(a1 + 448) * a2);
      v6 = *(double *)(a1 + 288);
      return v6 * pow(fabs(v5), *(long double *)(a1 + 280)) + 0.5;
    }
  }
  return result;
}

- (double)_softHyphenPenaltyForBreak:(uint64_t)a1
{
  double v2;
  __int16 v4;
  double v6;
  _QWORD *v7;

  v2 = 0.0;
  if (a1)
  {
    v4 = *(_WORD *)(a2 + 48);
    if ((v4 & 1) != 0)
      -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:].cold.2();
    if ((v4 & 2) == 0)
      -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:].cold.1();
    v6 = *(double *)(a1 + 392);
    if (v6 >= 0.0)
    {
      v7 = (_QWORD *)(a1 + 232);
      if (*(double *)(a1 + 232) < 0.0)
        *(long double *)(a1 + 232) = -[_NSOptimalLineBreaker _breakPenaltyForHyphenationFactor:](a1, v6);
    }
    else
    {
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
      if (*(_QWORD *)(a1 + 152) == 3)
        v7 = (_QWORD *)(a1 + 216);
      else
        v7 = (_QWORD *)(a1 + 224);
    }
    if ((*(_WORD *)(a2 + 48) & 0x80) == 0 && *(_QWORD *)(a2 + 8) != 1)
      return *(double *)v7;
  }
  return v2;
}

- (long)_implicitNBSPPenaltyForBreak:(uint64_t)a1
{
  __int16 v2;
  double v4;
  long double result;
  double v6;

  if (!a1)
    return 0.0;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 1) != 0)
    -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:].cold.2();
  if ((v2 & 0x40) == 0)
    -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:].cold.1();
  v4 = *(double *)(a1 + 392);
  if (v4 >= 0.0)
  {
    result = *(double *)(a1 + 240);
    if (result < 0.0)
    {
      v6 = 0.5;
      if (v4 >= 0.5)
        v6 = *(double *)(a1 + 392);
      result = -[_NSOptimalLineBreaker _breakPenaltyForHyphenationFactor:](a1, v6);
      *(long double *)(a1 + 240) = result;
    }
  }
  else
  {
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
    if (*(_QWORD *)(a1 + 152) == 3)
      return *(double *)(a1 + 216);
    else
      return *(double *)(a1 + 224);
  }
  return result;
}

- (double)_demeritFromBreak:(uint64_t)a3 toBreak:
{
  double v6;
  double result;

  if (!a1)
    return 0.0;
  v6 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, a2, a3);
  -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:](a1, a2, a3, v6);
  return result;
}

- (void)_demeritFromBreak:(uint64_t)a3 toBreak:(double)a4 usingExpansionRatio:
{
  double v6;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
      -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:].cold.1();
    v6 = fabs(a4);
    if (v6 != INFINITY
      && ((*(_WORD *)(a3 + 48) & 1) == 0
       || -[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:](a1, a2, a3)))
    {
      if (a4 >= -1.0)
        pow(v6, *(long double *)(a1 + 280));
      -[_NSOptimalLineBreaker _breakPenaltyForBreak:](a1, a3);
    }
  }
}

- (double)_breakPenaltyForBreak:(uint64_t)a1
{
  __int16 v2;

  if (!a1)
    return 0.0;
  v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 0x11) != 0)
    return 0.0;
  if ((v2 & 2) != 0)
    return -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:](a1, a2);
  if ((v2 & 0x40) == 0)
    return 0.0;
  return -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:](a1, a2);
}

- (BOOL)_breakRange:(uint64_t)a3 fallsWithinTokenWithTokenizer:(CFStringTokenizerRef)tokenizer
{
  uint64_t v5;
  unint64_t v6;
  CFIndex location;
  CFRange CurrentTokenRange;
  _BOOL8 v11;

  if (!a1)
    return 0;
  v5 = *(_QWORD *)(a1 + 464);
  if (a2 == v5)
    return 0;
  v6 = a2 + a3;
  if (a2 + a3 == *(_QWORD *)(a1 + 472) + v5)
    return 0;
  location = CFStringTokenizerGetCurrentTokenRange(tokenizer).location;
  if (!CFStringTokenizerGoToTokenAtIndex(tokenizer, a2))
    return 0;
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
  v11 = CurrentTokenRange.location < a2 && v6 < CurrentTokenRange.location + CurrentTokenRange.length;
  if (location != -1)
    CFStringTokenizerGoToTokenAtIndex(tokenizer, location);
  return v11;
}

- (uint64_t)_shouldAllowLastLineFromBreak:(uint64_t)a3 toBreak:
{
  _BOOL8 v3;
  const __CFLocale *v4;
  void *v6;
  void *v7;
  __CFStringTokenizer *v8;

  v3 = a1;
  if (a1)
  {
    if ((*(_WORD *)(a3 + 48) & 1) == 0)
      -[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:].cold.1();
    if ((*(_BYTE *)(a1 + 432) & 1) != 0 && *(_BYTE *)(a1 + 375))
    {
      v4 = *(const __CFLocale **)(a1 + 136);
      if (v4)
      {
        v6 = (id)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
        v7 = v6;
        if (v6
          && ((objc_msgSend(v6, "isEqualToString:", CFSTR("zh")) & 1) != 0
           || objc_msgSend(v7, "isEqualToString:", CFSTR("ja"))))
        {
          v8 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](v3);
          v3 = !-[_NSOptimalLineBreaker _breakRange:fallsWithinTokenWithTokenizer:](v3, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), v8);
LABEL_13:

          return v3;
        }
      }
      else
      {
        v7 = 0;
      }
      v3 = 1;
      goto LABEL_13;
    }
    return 1;
  }
  return v3;
}

- (uint64_t)_lineBreakTokenizer
{
  uint64_t v1;
  __CFString *v2;
  CFRange v3;
  __CFStringTokenizer *v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 440), "string");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(v1 + 88))
    {
      v3 = *(CFRange *)(v1 + 464);
      v4 = *(__CFStringTokenizer **)(v1 + 80);
      if (v4)
        CFStringTokenizerSetString(v4, v2, v3);
      else
        *(_QWORD *)(v1 + 80) = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, v3, 3uLL, *(CFLocaleRef *)(v1 + 136));
      *(_BYTE *)(v1 + 88) = 1;
    }
    return *(_QWORD *)(v1 + 80);
  }
  return result;
}

- (double)_minimumDemeritForLineEndingAtBreak:(double)a3 withExpansionRatio:
{
  double v5;
  double v6;
  long double v7;
  double v8;

  if (!a1)
    return 0.0;
  v5 = -[_NSOptimalLineBreaker _breakPenaltyForBreak:](a1, a2);
  if (a3 >= -1.0)
  {
    v7 = fabs(a3);
    v8 = *(double *)(a1 + 288);
    v6 = v8 * pow(v7, *(long double *)(a1 + 280)) + 0.5 + 1.0;
  }
  else
  {
    v6 = INFINITY;
  }
  return (v5 + v6) * (v5 + v6);
}

- (void)_computeFontMetricsAtIndex:(uint64_t)a1
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CTLine *v13;
  double width;
  CGSize v15;
  CGGlyph glyphs;
  UniChar characters;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 104);
    v5 = a1 + 104;
    v7 = a2 >= v4;
    v6 = a2 - v4;
    v7 = !v7 || v6 >= *(_QWORD *)(a1 + 112);
    if (v7)
    {
      objc_msgSend((id)a1, "attributedString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (a2)
        v10 = a2 - 1;
      else
        v10 = 0;
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        && (NSDefaultFont(), v12 = objc_claimAutoreleasedReturnValue(), v11, (v11 = (void *)v12) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:].cold.1();
      }
      if (!*(_QWORD *)(a1 + 96) || (objc_msgSend(v11, "isEqual:") & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 96), v11);
        v18 = CFSTR("NSFont");
        v19[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v13 = (const __CTLine *)CTLineCreateWithString();
        *(double *)(a1 + 120) = CTLineGetTypographicBounds(v13, 0, 0, 0);
        CFRelease(v13);
        characters = 109;
        glyphs = 0;
        v15.width = 0.0;
        v15.height = 0.0;
        if (CTFontGetGlyphsForCharacters((CTFontRef)v11, &characters, &glyphs, 1))
        {
          CTFontGetAdvancesForGlyphs((CTFontRef)v11, kCTFontOrientationDefault, &glyphs, &v15, 1);
          if ((CTFontGetSymbolicTraits((CTFontRef)v11) & 0x400) != 0)
            width = v15.width;
          else
            width = v15.width * 0.5;
        }
        else
        {
          *(CGRect *)(&width - 2) = CTFontGetBoundingBox((CTFontRef)v11);
        }
        *(double *)(a1 + 128) = width;
      }

    }
  }
}

- (void)_enumerateHyphenationPointsWithBlock:(uint64_t)a1
{
  void (**v3)(id, unint64_t, _BOOL8);
  const void *v4;
  const __CFLocale *v5;
  const __CFLocale *v6;
  void *Value;
  void *v8;
  __CFString *v9;
  CFIndex v10;
  CFIndex v11;
  __CFStringTokenizer *v12;
  CFRange v13;
  __CFStringTokenizer *v14;
  CFRange CurrentTokenRange;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t AllPossibleHyphenationLocations;
  CFIndex CurrentSubTokens;
  uint64_t i;
  unint64_t v24;
  CFRange *p_ranges;
  CFIndex v27;
  CFIndex location;
  _BOOL8 v29;
  const __CFLocale *v31;
  void (**v32)(id, unint64_t, _BOOL8);
  const __CFLocale *v33;
  int v34;
  _BOOL4 v35;
  CFRange ranges;
  _QWORD v37[34];

  v37[32] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(const void **)(a1 + 136);
    v5 = v4 ? (const __CFLocale *)CFRetain(v4) : CFLocaleCopyCurrent();
    v6 = v5;
    if (v5)
    {
      v35 = -[_NSOptimalLineBreaker _attributedStringOverridesMethodWithSelector:]((void *)a1, (uint64_t)sel_lineBreakByHyphenatingBeforeIndex_withinRange_);
      if (v35 || CFStringIsHyphenationAvailableForLocale(v6))
      {
        if (*(_BYTE *)(a1 + 377) && (Value = (void *)CFLocaleGetValue(v6, (CFLocaleKey)*MEMORY[0x1E0C9B088])) != 0)
          v34 = objc_msgSend(Value, "isEqualToString:", CFSTR("de"));
        else
          v34 = 0;
        objc_msgSend((id)a1, "attributedString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "string");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend((id)a1, "paragraphRange");
        objc_msgSend((id)a1, "paragraphRange");
        v13.length = v11;
        v12 = *(__CFStringTokenizer **)(a1 + 64);
        v33 = v6;
        v13.location = v10;
        if (v12)
        {
          CFStringTokenizerSetString(v12, v9, v13);
          v14 = *(__CFStringTokenizer **)(a1 + 64);
        }
        else
        {
          v14 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, v13, 0, v6);
          *(_QWORD *)(a1 + 64) = v14;
        }
        if (CFStringTokenizerAdvanceToNextToken(v14))
        {
          v32 = v3;
          while (1)
          {
            CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)(a1 + 64));
            v16 = CurrentTokenRange.location + CurrentTokenRange.length;
            if (v35)
              break;
            AllPossibleHyphenationLocations = _CFHyphenationGetAllPossibleHyphenationLocations();
            if (AllPossibleHyphenationLocations >= 32)
              v17 = 32;
            else
              v17 = AllPossibleHyphenationLocations;
            if (AllPossibleHyphenationLocations != -1 && v17)
              goto LABEL_31;
LABEL_54:
            if (!CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(a1 + 64)))
              goto LABEL_55;
          }
          v17 = 0;
          v18 = CurrentTokenRange.location + CurrentTokenRange.length;
          while (1)
          {
            objc_msgSend((id)a1, "attributedString", v32);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "lineBreakByHyphenatingBeforeIndex:withinRange:", v18, CurrentTokenRange.location, CurrentTokenRange.length);

            if (v20 == 0x7FFFFFFFFFFFFFFFLL || CurrentTokenRange.location >= v20 || v20 >= v18)
              break;
            v37[v17] = v20;
            v18 = v20;
            if (++v17 == 32)
            {
              v3 = v32;
              goto LABEL_31;
            }
          }
          v3 = v32;
          if (!v17)
            goto LABEL_54;
LABEL_31:
          if (v34)
            CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens(*(CFStringTokenizerRef *)(a1 + 64), &ranges, 32, 0);
          else
            CurrentSubTokens = 0;
          if (v17 >= 1)
          {
            for (i = 0; i != v17; ++i)
            {
              v24 = v37[i];
              if (v24 <= CurrentTokenRange.location || v16 <= v24)
                -[_NSOptimalLineBreaker _enumerateHyphenationPointsWithBlock:].cold.1();
              if (v24 - CurrentTokenRange.location >= *(_QWORD *)(a1 + 336) && v16 - v24 >= *(_QWORD *)(a1 + 344))
              {
                if (CurrentSubTokens < 2)
                {
                  v29 = 0;
                }
                else
                {
                  p_ranges = &ranges;
                  v27 = CurrentSubTokens - 1;
                  do
                  {
                    location = p_ranges->location;
                    ++p_ranges;
                    v29 = location == v24;
                  }
                  while (location != v24 && v27-- != 0);
                }
                v3[2](v3, v24, v29);
              }
            }
          }
          goto LABEL_54;
        }
LABEL_55:
        v31 = v33;
      }
      else
      {
        v31 = v6;
      }
      CFRelease(v31);
    }
  }

}

- (BOOL)_attributedStringOverridesMethodWithSelector:(void *)a1
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  objc_msgSend(a1, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 != objc_msgSend(v5, "methodForSelector:", a2);

  return v6;
}

- (uint64_t)_localeHasDictionaryBasedLineBreaks
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v1 = a1;
  if (a1)
  {
    v2 = *(void **)(a1 + 136);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    objc_msgSend(v3, "languageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("zh")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("ja")))
    {
      v6 = *(_BYTE *)(v1 + 375) == 0;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("ko")))
      {
        v1 = 0;
LABEL_11:

        return v1;
      }
      v6 = *(_DWORD *)(v1 + 380) == 2;
    }
    v1 = v6;
    goto LABEL_11;
  }
  return v1;
}

- (uint64_t)_shouldAvoidBreakingAfterWord:(uint64_t)a1
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  if (!a1)
    goto LABEL_5;
  if (_shouldAvoidBreakingAfterWord__once != -1)
    dispatch_once(&_shouldAvoidBreakingAfterWord__once, &__block_literal_global_1);
  v4 = objc_msgSend(v3, "length");
  if (v4 <= _shouldAvoidBreakingAfterWord__maxShortWordLength)
  {
    v6 = *(void **)(a1 + 136);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(v7, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_shouldAvoidBreakingAfterWord__wordSets, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "lowercaseString");
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v10, "containsObject:", v11);
      v3 = (id)v11;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_rangeOfLineBreakEndingAtIndex:(_WORD *)a3 flags:(unint64_t)a4 inRange:(uint64_t)a5 inlineBuffer:(uint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char IsNormalWhitespace;
  BOOL v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  __int16 v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _WORD *v58;
  unint64_t v59;
  CFRange v60;
  CFRange v61;
  CFRange v62;
  CFRange v63;
  CFRange v64;

  if (!a1)
    return 0;
  v11 = objc_msgSend(a1, "paragraphRange");
  v12 = ~v11;
  v13 = ~v11 + a2;
  if (v13 < 0 || (v14 = *(_QWORD *)(a6 + 160), v14 <= v13))
  {
    v16 = 0;
  }
  else
  {
    v15 = *(_QWORD *)(a6 + 136);
    if (v15)
    {
      v16 = *(_WORD *)(v15 + 2 * (*(_QWORD *)(a6 + 152) + v13));
    }
    else
    {
      v25 = *(_QWORD *)(a6 + 144);
      if (v25)
      {
        v16 = *(char *)(v25 + *(_QWORD *)(a6 + 152) + v13);
      }
      else
      {
        if (*(_QWORD *)(a6 + 176) <= v13 || (v29 = *(_QWORD *)(a6 + 168), v29 > v13))
        {
          v30 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v30 = 0;
          if (v30 + 64 < v14)
            v14 = v30 + 64;
          *(_QWORD *)(a6 + 168) = v30;
          *(_QWORD *)(a6 + 176) = v14;
          v60.location = *(_QWORD *)(a6 + 152) + v30;
          v60.length = v14 - v30;
          CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v60, (UniChar *)a6);
          v29 = *(_QWORD *)(a6 + 168);
        }
        v16 = *(_WORD *)(a6 + 2 * (v13 - v29));
      }
    }
  }
  if (a2)
  {
    v59 = a2;
    if (v16 != 10)
    {
      if (v16 == 13)
      {
        v17 = (__PAIR128__(a2, a4) - a2) >> 64;
        if (v17 <= a4)
          goto LABEL_61;
        v18 = v17 + v12;
        if (v18 < 0)
          goto LABEL_61;
        goto LABEL_12;
      }
      if (!charIsNormalWhitespace(v16))
      {
        if (v16 != 173)
        {
          v17 = a2;
          LOWORD(a2) = 0;
          goto LABEL_95;
        }
        v17 = (__PAIR128__(a2, a4) - a2) >> 64;
        if (v17 > a4)
        {
          v26 = v17 + v12;
          if (v26 < 0 || (v27 = *(_QWORD *)(a6 + 160), v27 <= v26))
          {
            v16 = 0;
          }
          else
          {
            v28 = *(_QWORD *)(a6 + 136);
            if (v28)
            {
              v16 = *(_WORD *)(v28 + 2 * (*(_QWORD *)(a6 + 152) + v26));
            }
            else
            {
              v55 = *(_QWORD *)(a6 + 144);
              if (v55)
              {
                v16 = *(char *)(v55 + *(_QWORD *)(a6 + 152) + v26);
              }
              else
              {
                if (*(_QWORD *)(a6 + 176) <= v26 || (v56 = *(_QWORD *)(a6 + 168), v56 > v26))
                {
                  v57 = v26 - 4;
                  if ((unint64_t)v26 < 4)
                    v57 = 0;
                  if (v57 + 64 < v27)
                    v27 = v57 + 64;
                  *(_QWORD *)(a6 + 168) = v57;
                  *(_QWORD *)(a6 + 176) = v27;
                  v64.location = *(_QWORD *)(a6 + 152) + v57;
                  v64.length = v27 - v57;
                  CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v64, (UniChar *)a6);
                  v56 = *(_QWORD *)(a6 + 168);
                }
                v16 = *(_WORD *)(a6 + 2 * (v26 - v56));
              }
            }
          }
          LOWORD(a2) = 10;
          goto LABEL_95;
        }
        v16 = 0;
        LOWORD(a2) = 10;
LABEL_91:
        a4 = v17;
        goto LABEL_92;
      }
      if (v16 != 10)
      {
        v17 = a2;
        LOWORD(a2) = 0;
        goto LABEL_63;
      }
    }
    v21 = (__PAIR128__(a2, a4) - a2) >> 64;
    if (v21 <= a4 || (v22 = v21 + v12, v22 < 0) || (v23 = *(_QWORD *)(a6 + 160), v23 <= v22))
    {
      v16 = 0;
    }
    else
    {
      v24 = *(_QWORD *)(a6 + 136);
      if (v24)
      {
        v16 = *(_WORD *)(v24 + 2 * (*(_QWORD *)(a6 + 152) + v22));
      }
      else
      {
        v31 = *(_QWORD *)(a6 + 144);
        if (v31)
        {
          v16 = *(char *)(v31 + *(_QWORD *)(a6 + 152) + v22);
        }
        else
        {
          if (*(_QWORD *)(a6 + 176) <= v22 || (v33 = *(_QWORD *)(a6 + 168), v33 > v22))
          {
            v34 = v22 - 4;
            if ((unint64_t)v22 < 4)
              v34 = 0;
            if (v34 + 64 < v23)
              v23 = v34 + 64;
            *(_QWORD *)(a6 + 168) = v34;
            *(_QWORD *)(a6 + 176) = v23;
            v61.location = *(_QWORD *)(a6 + 152) + v34;
            v61.length = v23 - v34;
            CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v61, (UniChar *)a6);
            v33 = *(_QWORD *)(a6 + 168);
          }
          v16 = *(_WORD *)(a6 + 2 * (v22 - v33));
        }
      }
      if (v16 == 13)
      {
        v17 = v21 - 1;
        if (v21 - 1 <= a4)
          goto LABEL_61;
        v18 = v21 - v11 - 2;
        if (v18 < 0)
          goto LABEL_61;
LABEL_12:
        v19 = *(_QWORD *)(a6 + 160);
        if (v19 > v18)
        {
          v20 = *(_QWORD *)(a6 + 136);
          if (v20)
          {
            v16 = *(_WORD *)(v20 + 2 * (*(_QWORD *)(a6 + 152) + v18));
          }
          else
          {
            v32 = *(_QWORD *)(a6 + 144);
            if (v32)
            {
              v16 = *(char *)(v32 + *(_QWORD *)(a6 + 152) + v18);
            }
            else
            {
              if (*(_QWORD *)(a6 + 176) <= v18 || (v53 = *(_QWORD *)(a6 + 168), v53 > v18))
              {
                v54 = v18 - 4;
                if ((unint64_t)v18 < 4)
                  v54 = 0;
                if (v54 + 64 < v19)
                  v19 = v54 + 64;
                *(_QWORD *)(a6 + 168) = v54;
                *(_QWORD *)(a6 + 176) = v19;
                v63.location = *(_QWORD *)(a6 + 152) + v54;
                v63.length = v19 - v54;
                CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v63, (UniChar *)a6);
                v53 = *(_QWORD *)(a6 + 168);
              }
              v16 = *(_WORD *)(a6 + 2 * (v18 - v53));
            }
          }
          goto LABEL_62;
        }
LABEL_61:
        v16 = 0;
LABEL_62:
        LOWORD(a2) = 1;
LABEL_63:
        if (v17 > a4)
        {
          IsNormalWhitespace = charIsNormalWhitespace(v16);
          v36 = v16 == 160;
          if ((IsNormalWhitespace & 1) != 0 || v16 == 160)
          {
            v58 = a3;
            while (1)
            {
              v37 = v17;
              if (v36)
              {
                v38 = (void *)a1[22];
                if (!v38)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v39 = objc_claimAutoreleasedReturnValue();
                  v40 = (void *)a1[22];
                  a1[22] = v39;

                  v38 = (void *)a1[22];
                }
                --v17;
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v37 - 1, 1, v58);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v41);

              }
              else
              {
                --v17;
              }
              if (v17 <= a4)
                break;
              v42 = v37 - v11 - 2;
              if (v42 < 0 || (v43 = *(_QWORD *)(a6 + 160), v43 <= v42))
              {
                v16 = 0;
              }
              else
              {
                v44 = *(_QWORD *)(a6 + 136);
                if (v44)
                {
                  v16 = *(_WORD *)(v44 + 2 * (*(_QWORD *)(a6 + 152) + v42));
                }
                else
                {
                  v46 = *(_QWORD *)(a6 + 144);
                  if (v46)
                  {
                    v16 = *(char *)(v46 + *(_QWORD *)(a6 + 152) + v42);
                  }
                  else
                  {
                    if (*(_QWORD *)(a6 + 176) <= v42 || (v47 = *(_QWORD *)(a6 + 168), v47 > v42))
                    {
                      v48 = v42 - 4;
                      if ((unint64_t)v42 < 4)
                        v48 = 0;
                      if (v48 + 64 < v43)
                        v43 = v48 + 64;
                      *(_QWORD *)(a6 + 168) = v48;
                      *(_QWORD *)(a6 + 176) = v43;
                      v62.location = *(_QWORD *)(a6 + 152) + v48;
                      v62.length = v43 - v48;
                      CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v62, (UniChar *)a6);
                      v47 = *(_QWORD *)(a6 + 168);
                    }
                    v16 = *(_WORD *)(a6 + 2 * (v42 - v47));
                  }
                }
              }
              v45 = charIsNormalWhitespace(v16);
              v36 = v16 == 160;
              if ((v45 & 1) == 0 && v16 != 160)
              {
                a3 = v58;
                goto LABEL_95;
              }
            }
            v16 = 0;
            a3 = v58;
LABEL_92:
            v49 = v59 - a4;
            if (!a4)
              goto LABEL_107;
LABEL_96:
            if (v16 - 8208 <= 4 && v16 != 8210 || v16 == 173 || v16 == 45)
            {
              if (v16 == 45 && v49 == 0)
                v51 = 264;
              else
                v51 = 8;
              LOWORD(a2) = v51 | a2;
            }
            goto LABEL_107;
          }
LABEL_95:
          v49 = v59 - v17;
          a4 = v17;
          goto LABEL_96;
        }
        goto LABEL_91;
      }
    }
    LOWORD(a2) = 1;
    v17 = v21;
    goto LABEL_63;
  }
  a4 = 0;
LABEL_107:
  *a3 = a2;
  return a4;
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:(uint64_t)a1
{
  void (**v3)(id, unint64_t, uint64_t);
  void *v4;
  __CFString *v5;
  unint64_t v6;
  CFIndex v7;
  CFIndex v8;
  const char *CStringPtr;
  void *v10;
  const __CFLocale *Value;
  int v12;
  CFIndex v13;
  unint64_t v14;
  UText *v15;
  __CFStringTokenizer *v16;
  CFRange v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v24;
  unint64_t v25;
  __CFStringTokenizer *v26;
  __CFStringTokenizer *v27;
  int location;
  int v29;
  uint64_t v30;
  uint64_t v31;
  const UniChar *v32;
  unint64_t v33;
  UniChar v34;
  int v35;
  int64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  int64_t v45;
  int64_t v46;
  const UniChar *v47;
  unint64_t v48;
  UniChar v49;
  _BOOL4 v50;
  char v51;
  int v52;
  void *v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _BOOL4 v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  int v68;
  BOOL v69;
  BOOL v70;
  void *v71;
  int v72;
  int64_t v73;
  int64_t v74;
  BOOL v75;
  void *v76;
  uint64_t v77;
  void *v78;
  CFIndex v79;
  void *v80;
  char v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  char v86;
  const __CFLocale *v87;
  _QWORD v88[5];
  _QWORD v89[5];
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  const char *v93;
  __int128 v94;
  __int16 v95;
  _OWORD buffer[8];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v99;
  unint64_t v100;
  int64_t v101;
  int64_t v102;
  int64_t v103;
  CFRange v104;
  CFRange v105;

  v3 = a2;
  if (!a1)
    goto LABEL_31;
  objc_msgSend((id)a1, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)a1, "paragraphRange");
  v8 = v7;
  memset(buffer, 0, sizeof(buffer));
  theString = v5;
  v100 = v6;
  v101 = v7;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v102 = 0;
  v103 = 0;
  v99 = CStringPtr;
  objc_msgSend(*(id *)(a1 + 136), "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Value = *(const __CFLocale **)(a1 + 136);
  if (Value)
    Value = (const __CFLocale *)CFLocaleGetValue(Value, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
  v87 = Value;
  v86 = -[__CFLocale isEqualToString:](v87, "isEqualToString:", CFSTR("ko"));
  if (*(_BYTE *)(a1 + 376) && -[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1))
  {
    -[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1);
    v85 = 0;
    v83 = 1;
    v12 = 1;
  }
  else
  {
    v13 = v8;
    v14 = _NSCopyBreakIterator(v10, 0, 0, 2u);
    v15 = (UText *)CFStringOpenUText();
    LODWORD(v90) = 0;
    v85 = v14;
    ubrk_setUText();
    utext_close(v15);
    if (-[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1))
    {
      v16 = *(__CFStringTokenizer **)(a1 + 72);
      v8 = v13;
      v17.location = v6;
      v17.length = v13;
      if (v16)
      {
        CFStringTokenizerSetString(v16, v5, v17);
        v83 = 0;
        v12 = 0;
      }
      else
      {
        v83 = 0;
        v12 = 0;
        *(_QWORD *)(a1 + 72) = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, v17, 4uLL, *(CFLocaleRef *)(a1 + 136));
      }
    }
    else
    {
      v12 = 0;
      v83 = 1;
      v8 = v13;
    }
  }
  v18 = *(void **)(a1 + 176);
  if (v18)
    objc_msgSend(v18, "removeAllObjects");
  if (!-[_NSOptimalLineBreaker _attributedStringOverridesMethodWithSelector:]((void *)a1, (uint64_t)sel_lineBreakBeforeIndex_withinRange_))
  {
    v82 = 0;
    v79 = v8;
    v25 = v6 + v8;
    v81 = 1;
    v84 = v6;
    v80 = v10;
    while (1)
    {
      do
      {
        while (!v12)
        {
          if ((v81 & 1) != 0)
            v35 = ubrk_following();
          else
            v35 = ubrk_next();
          if (v35 == -1)
            goto LABEL_29;
          v81 = 0;
          if (v25 >= v35)
            v29 = v35;
          else
            v29 = v25;
LABEL_63:
          v95 = 0;
          v38 = v82 + v84;
          v39 = -[_NSOptimalLineBreaker _rangeOfLineBreakEndingAtIndex:flags:inRange:inlineBuffer:]((_QWORD *)a1, v29, &v95, v82 + v84, v25 - (v82 + v84), (uint64_t)buffer);
          v41 = v39;
          v42 = v40;
          v43 = v83;
          if (v40)
            v43 = 1;
          if ((v43 & 1) == 0)
          {
            v50 = -[_NSOptimalLineBreaker _breakRange:fallsWithinTokenWithTokenizer:](a1, v39, v40, *(CFStringTokenizerRef *)(a1 + 72));
            v51 = v86;
            if (v42)
              v51 = 0;
            if (v50 || (v51 & 1) == 0)
            {
              if (v50)
                goto LABEL_115;
              goto LABEL_87;
            }
LABEL_80:
            v52 = *(_DWORD *)(a1 + 380);
            if (!v52)
              goto LABEL_115;
            if (v52 == 1)
            {
              objc_msgSend((id)a1, "attributedString");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "length");

              if (v41 < v54)
              {
                objc_msgSend((id)a1, "attributedString");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "doubleClickAtIndex:inRange:", v41, v6, v79);
                v77 = v57;

                if (v56 + 1 == v41 || v41 + 1 == v56 + v77)
                  goto LABEL_115;
              }
            }
            v95 |= 0x20u;
            goto LABEL_87;
          }
          v44 = v86 ^ 1;
          if (v40)
            v44 = 1;
          if ((v44 & 1) == 0)
            goto LABEL_80;
          if (v40 != 1)
            goto LABEL_87;
          if (*(_DWORD *)(a1 + 384) == 2)
            goto LABEL_87;
          v45 = v39 - v6;
          if ((uint64_t)(v39 - v6) < 0)
            goto LABEL_87;
          v46 = v101;
          if (v101 <= v45)
            goto LABEL_87;
          v47 = CharactersPtr;
          if (CharactersPtr)
          {
            v48 = v100 + v45;
LABEL_75:
            v49 = v47[v48];
            goto LABEL_118;
          }
          if (!v99)
          {
            if (v103 <= v45 || (v73 = v102, v102 > v45))
            {
              v74 = v45 - 4;
              if ((unint64_t)v45 < 4)
                v74 = 0;
              if (v74 + 64 < v101)
                v46 = v74 + 64;
              v102 = v74;
              v103 = v46;
              v105.location = v100 + v74;
              v105.length = v46 - v74;
              CFStringGetCharacters(theString, v105, (UniChar *)buffer);
              v73 = v102;
            }
            v48 = v45 - v73;
            v47 = (const UniChar *)buffer;
            goto LABEL_75;
          }
          v49 = v99[v100 + v45];
LABEL_118:
          v70 = v49 != 32 || v84 == 0x7FFFFFFFFFFFFFFFLL;
          if (!v70 && v41 - v38 <= 2)
          {
            objc_msgSend((id)a1, "attributedString");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "string");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "substringWithRange:", v38, v41 - v38);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[_NSOptimalLineBreaker _shouldAvoidBreakingAfterWord:](a1, v71))
            {
              v72 = *(_DWORD *)(a1 + 384);
              if (v72 != 1)
              {
                if (v72)
                  -[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:].cold.2();

                goto LABEL_115;
              }
              v95 |= 0x40u;
            }

          }
LABEL_87:
          if ((v95 & 0x100) == 0)
            goto LABEL_114;
          if (*(_QWORD *)(a1 + 336))
          {
            if (v42)
              goto LABEL_139;
            if (v41 - 1 >= *(_QWORD *)(a1 + 464) + 1)
            {
              v90 = 0;
              v91 = &v90;
              v92 = 0x3010000000;
              v93 = "";
              v94 = xmmword_18D6CBB80;
              objc_msgSend(*(id *)(a1 + 440), "string");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = *(_QWORD *)(a1 + 464);
              v89[0] = MEMORY[0x1E0C809B0];
              v89[1] = 3221225472;
              v89[2] = __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke;
              v89[3] = &unk_1E26031E8;
              v89[4] = &v90;
              objc_msgSend(v59, "enumerateSubstringsInRange:options:usingBlock:", v60, v41 - 1 - v60, 771, v89);

              v61 = v91[4];
              if (v61 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)v91[5] >= *(_QWORD *)(a1 + 336))
              {
                v58 = 1;
              }
              else if (*(_QWORD *)(a1 + 464) >= v61)
              {
                v58 = 0;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 440), "string");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v62, "characterAtIndex:", v91[4] - 1) == 45;

              }
              _Block_object_dispose(&v90, 8);
            }
            else
            {
              v58 = 1;
            }
            if (!*(_QWORD *)(a1 + 344))
            {
LABEL_111:
              if (v58)
                goto LABEL_114;
              goto LABEL_115;
            }
          }
          else
          {
            if (!*(_QWORD *)(a1 + 344))
              goto LABEL_114;
            if (v42)
LABEL_139:
              -[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:].cold.1();
            v58 = 1;
          }
          if (v41 >= *(_QWORD *)(a1 + 472) + *(_QWORD *)(a1 + 464))
            goto LABEL_111;
          v75 = v58;
          v90 = 0;
          v91 = &v90;
          v92 = 0x3010000000;
          v93 = "";
          v94 = xmmword_18D6CBB80;
          objc_msgSend(*(id *)(a1 + 440), "string");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = *(_QWORD *)(a1 + 464) - v41 + *(_QWORD *)(a1 + 472);
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke_2;
          v88[3] = &unk_1E26031E8;
          v88[4] = &v90;
          objc_msgSend(v63, "enumerateSubstringsInRange:options:usingBlock:", v41, v64, 515, v88);

          v65 = v91[4];
          if (v65 == 0x7FFFFFFFFFFFFFFFLL || (v66 = v91[5], v66 >= *(_QWORD *)(a1 + 344)))
          {
            _Block_object_dispose(&v90, 8);
            if (!v58)
              goto LABEL_115;
LABEL_114:
            v3[2](v3, v41, v42);
            v84 = v41;
            v82 = v42;
            goto LABEL_115;
          }
          if (v66 + v65 >= *(_QWORD *)(a1 + 472) + *(_QWORD *)(a1 + 464))
          {
            _Block_object_dispose(&v90, 8);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 440), "string");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "characterAtIndex:", v91[5] + v91[4]);

            v69 = v68 == 45 && v75;
            _Block_object_dispose(&v90, 8);
            if (v69)
              goto LABEL_114;
          }
LABEL_115:
          v10 = v80;
        }
        v26 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](a1);
        if (!CFStringTokenizerAdvanceToNextToken(v26))
          goto LABEL_30;
        v27 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](a1);
        location = CFStringTokenizerGetCurrentTokenRange(v27).location;
      }
      while (location == v6);
      v29 = location;
      if (location <= v6 || location >= v25)
        goto LABEL_63;
      v30 = location - v6;
      if (v30 < 0 || (v31 = v101, v101 <= v30))
      {
        v34 = 0;
      }
      else
      {
        v32 = CharactersPtr;
        if (CharactersPtr)
        {
          v33 = v100 + v30;
        }
        else
        {
          if (v99)
          {
            v34 = v99[v100 + v30];
            goto LABEL_44;
          }
          if (v103 <= v30 || (v36 = v102, v102 > v30))
          {
            v37 = v30 - 4;
            if ((unint64_t)v30 < 4)
              v37 = 0;
            if (v37 + 64 < v101)
              v31 = v37 + 64;
            v102 = v37;
            v103 = v31;
            v104.location = v100 + v37;
            v104.length = v31 - v37;
            CFStringGetCharacters(theString, v104, (UniChar *)buffer);
            v36 = v102;
          }
          v33 = v30 - v36;
          v32 = (const UniChar *)buffer;
        }
        v34 = v32[v33];
      }
LABEL_44:
      if ((charIsNormalWhitespace(v34) & 1) == 0)
        goto LABEL_63;
    }
  }
  v19 = v6 + v8;
  if (v6 + v8 > v6)
  {
    v20 = v6 + v8;
    do
    {
      v21 = objc_msgSend(v4, "lineBreakBeforeIndex:withinRange:", v20, v6, v20 - v6);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL || v21 <= v6 || v21 > v19)
        break;
      LOWORD(v90) = 0;
      v20 = -[_NSOptimalLineBreaker _rangeOfLineBreakEndingAtIndex:flags:inRange:inlineBuffer:]((_QWORD *)a1, v21, &v90, v6, v21 - v6, (uint64_t)buffer);
      ((void (*)(void (**)(id, unint64_t, uint64_t), unint64_t, uint64_t, _QWORD))v3[2])(v3, v20, v24, (unsigned __int16)v90);
    }
    while (v20 > v6);
  }
  if ((v12 & 1) == 0)
LABEL_29:
    _NSDisposeBreakIterator(v85, v10, 2u);
LABEL_30:

LABEL_31:
}

- (void)_enumerateNonBreakingSpacesWithBlock:(id *)a1
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = a2;
  if (a1)
  {
    if (_enumerateNonBreakingSpacesWithBlock__once != -1)
      dispatch_once(&_enumerateNonBreakingSpacesWithBlock__once, &__block_literal_global_97);
    objc_msgSend(a1, "attributedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(a1, "paragraphRange");
    v7 = v5 + v6;
    if (v5 < v5 + v6)
    {
      v8 = v5;
      do
      {
        v9 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", _enumerateNonBreakingSpacesWithBlock__nbspCharacterSet, 0, v8, v7 - v8);
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v11 = v9;
        v12 = v10;
        if (objc_msgSend(a1[22], "count"))
        {
          v13 = a1[22];
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v13) = objc_msgSend(v13, "containsObject:", v14);

          if ((v13 & 1) != 0)
            continue;
        }
        v15[2](v15, v11, v12);
        v8 = v11 + v12;
      }
      while (v11 + v12 < v7);
    }

  }
}

- (void)_addLineBreakWithRange:(uint64_t)a3 flags:(__int16)a4
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    if (objc_msgSend(a1, "paragraphRange") > a2)
      -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:].cold.1();
    v8 = objc_msgSend(a1, "paragraphRange");
    if (a2 + a3 > v8 + v9)
      -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:].cold.2();
    v10 = (void *)a1[3];
    if (v10)
    {
      v11 = a1[4];
      if (v11 == a1[5])
      {
        v12 = 2 * v11;
        a1[5] = 2 * v11;
        if ((unint64_t)(2 * v11) <= 1)
          v12 = 1;
        v13 = (char *)malloc_type_realloc(v10, v12 << 6, 0x1000040A976A909uLL);
        a1[3] = v13;
        bzero(&v13[64 * v11], (a1[5] - v11) << 6);
        v11 = a1[4];
      }
    }
    else
    {
      objc_msgSend(a1, "attributedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") / 5uLL;

      v16 = 8;
      if (v15 > 8)
        v16 = v15;
      a1[5] = v16;
      v17 = malloc_type_malloc(v16 << 6, 0x1000040A976A909uLL);
      a1[3] = v17;
      bzero(v17, a1[5] << 6);
      v11 = 0;
    }
    v18 = a1[3];
    a1[4] = v11 + 1;
    v19 = v18 + (v11 << 6);
    *(_QWORD *)v19 = a2;
    *(_QWORD *)(v19 + 8) = a3;
    *(_WORD *)(v19 + 48) = a4;
  }
}

- (void)_computeLineBreakGeometry
{
  __assert_rtn("-[_NSOptimalLineBreaker _computeLineBreakGeometry]", "NSOptimalLineBreaker.m", 1610, "lb->flags & _NSLineBreakFollowsHyphen");
}

- (void)_calculateLineBreaks
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateLineBreaks]", "NSOptimalLineBreaker.m", 1695, "NSMaxRange(_lineBreaks[i].range) <= _lineBreaks[i + 1].range.location");
}

- (NSString)debugString
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger location;
  uint64_t v7;
  unint64_t v8;
  $102BB1629D0471A0919C413AE880609B *lineBreaks;
  NSUInteger v10;
  NSUInteger length;
  void *v12;
  unsigned __int16 var5;
  void *v14;
  void *v15;
  const __CFString *v16;
  NSUInteger v17;
  void *v18;

  -[_NSOptimalLineBreaker attributedString](self, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  location = self->_paragraphRange.location;
  if (self->_lineBreakCount)
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      lineBreaks = self->_lineBreaks;
      v10 = lineBreaks[v7].var0.location;
      length = v10 - location;
      if (v10 > location)
      {
        objc_msgSend(v4, "substringWithRange:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

      }
      var5 = lineBreaks[v7].var5;
      if ((var5 & 2) != 0)
        break;
      length = lineBreaks[v7].var0.length;
      if (!length)
      {
        v15 = v5;
        v16 = CFSTR("¦");
LABEL_12:
        objc_msgSend(v15, "appendString:", v16, length);
        goto LABEL_13;
      }
      objc_msgSend(v4, "substringWithRange:", lineBreaks[v7].var0.location);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("[%@]"), v14);

LABEL_13:
      location = lineBreaks[v7].var0.length + lineBreaks[v7].var0.location;
      ++v8;
      ++v7;
      if (v8 >= self->_lineBreakCount)
      {
        v17 = self->_paragraphRange.location;
        goto LABEL_16;
      }
    }
    v15 = v5;
    if ((var5 & 0x80) != 0)
      v16 = CFSTR("^");
    else
      v16 = CFSTR("'");
    goto LABEL_12;
  }
  v17 = self->_paragraphRange.location;
LABEL_16:
  if (self->_paragraphRange.length + v17 > location)
  {
    objc_msgSend(v4, "substringWithRange:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v18);

  }
  return (NSString *)v5;
}

- (void)_calculateFirstFitWrapping
{
  unint64_t v2;
  __int16 v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _OWORD *v21;
  uint64_t v22;
  void *v23;
  __int128 *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;

  if (a1 && !*(_BYTE *)(a1 + 9))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", &unk_1E2631720);
      if (*(_QWORD *)(a1 + 32) != 1)
      {
        v2 = 0;
        do
        {
          v3 = *(_WORD *)(*(_QWORD *)(a1 + 24) + (v2 << 6) + 48);
          objc_msgSend((id)a1, "textContainerWidth");
          v5 = v4;
          v6 = *(_QWORD *)(a1 + 24);
          if ((v3 & 1) != 0)
            v5 = v4 - *(double *)(v6 + (v2 << 6) + 16);
          v7 = v2 + 1;
          v8 = (v2 << 6) + 112;
          v9 = (v2 << 6) + 64;
          do
          {
            v10 = v7;
            v11 = v8;
            v12 = v9;
            if (v7 >= *(_QWORD *)(a1 + 32) - 1)
              break;
            objc_msgSend((id)a1, "_naturalWidthFromBreak:toBreak:", v6 + (v2 << 6), v6 + v8 + 16);
            v6 = *(_QWORD *)(a1 + 24);
            if (v13 > v5)
              break;
            v8 = v11 + 64;
            v7 = v10 + 1;
            v9 = v12 + 64;
          }
          while ((*(_WORD *)(v6 + v11) & 1) == 0);
          if ((*(_WORD *)(v6 + v11) & 2) != 0 && v10 > v2)
          {
            v14 = v6 + v12;
            v15 = v10;
            while ((*(_WORD *)(v14 + 48) & 2) != 0)
            {
              --v15;
              v14 -= 64;
              if (v15 <= v2)
                goto LABEL_21;
            }
            objc_msgSend((id)a1, "_naturalWidthFromBreak:toBreak:", v6 + (v2 << 6));
            if (v16 > v5 * 0.9)
              v10 = v15;
          }
LABEL_21:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v17);

          v2 = v10;
        }
        while (v10 < *(_QWORD *)(a1 + 32) - 1);
      }
      v18 = objc_msgSend(v28, "count");
      *(_QWORD *)(a1 + 200) = v18;
      *(_QWORD *)(a1 + 192) = malloc_type_realloc(*(void **)(a1 + 192), v18 << 6, 0x1000040A976A909uLL);
      if (*(_QWORD *)(a1 + 200))
      {
        v19 = 0;
        v20 = 0;
        do
        {
          v21 = (_OWORD *)(*(_QWORD *)(a1 + 192) + v19);
          v22 = *(_QWORD *)(a1 + 24);
          objc_msgSend(v28, "objectAtIndexedSubscript:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (__int128 *)(v22 + (objc_msgSend(v23, "unsignedIntegerValue") << 6));
          v25 = v24[3];
          v27 = *v24;
          v26 = v24[1];
          v21[2] = v24[2];
          v21[3] = v25;
          *v21 = v27;
          v21[1] = v26;

          ++v20;
          v19 += 64;
        }
        while (v20 < *(_QWORD *)(a1 + 200));
      }
      *(_BYTE *)(a1 + 9) = 1;

    }
    else
    {
      *(_QWORD *)(a1 + 200) = 0;
      *(_BYTE *)(a1 + 9) = 1;
    }
  }
}

- (uint64_t)_equivalenceClassForNode:(uint64_t)a1
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___NSOptimalLineBreaker__equivalenceClassForNode___block_invoke;
  v4[3] = &unk_1E26032E8;
  v4[4] = &v5;
  -[_NSOptimalLineBreaker _enumerateEquivalenceClassComponentsForNode:withBlock:](a1, a2, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerateEquivalenceClassComponentsForNode:(void *)a3 withBlock:
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v5 = a3;
  if (a1)
  {
    v7 = v5;
    v5[2](v5, a2[6]);
    v7[2](v7, a2[7]);
    if (*(_QWORD *)(a1 + 416))
      v7[2](v7, a2[2]);
    if (*(_BYTE *)(a1 + 372))
      v7[2](v7, *((unsigned __int8 *)a2 + 33));
    v5 = v7;
    if (*(_BYTE *)(a1 + 373))
    {
      if (*a2)
        v6 = *(_QWORD *)(*a2 + 56) + *(_QWORD *)(*a2 + 48);
      else
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      v7[2](v7, v6);
      v7[2](v7, a2[5]);
      v5 = v7;
    }
  }

}

- (uint64_t)_createNodeWithParent:(__int128 *)a3 lineBreak:(char)a4 expansionRatio:(double)a5 mustSucceed:
{
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  if (!a1)
    return 0;
  v8 = 1;
  v9 = 3;
  if (a5 < 1.0)
    v9 = 2;
  if (a5 >= 0.5)
    v8 = v9;
  if (a5 < -0.5)
    v8 = 0;
  if (*(_BYTE *)(a1 + 372))
    v10 = v8;
  else
    v10 = 1;
  v11 = 0.0;
  if ((a4 & 1) == 0)
  {
    -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:](a1, a2 + 48, (uint64_t)a3, a5);
    v11 = v12;
    if (*(_BYTE *)(a1 + 372))
    {
      if (*(_QWORD *)a2)
      {
        v13 = v10 - *(unsigned __int8 *)(a2 + 33);
        if (v13 < 0)
          v13 = *(unsigned __int8 *)(a2 + 33) - v10;
        if (v13 >= 2)
          v11 = v12 + *(double *)(a1 + 256);
      }
    }
  }
  v14 = 0;
  if (fabs(v11) != INFINITY)
  {
    v14 = objc_msgSend(*(id *)(a1 + 184), "allocNode");
    *(_QWORD *)v14 = objc_msgSend(*(id *)(a1 + 184), "retainNode:", a2);
    *(_BYTE *)(v14 + 33) = v10;
    *(_QWORD *)(v14 + 16) = *(_QWORD *)(a2 + 16) + 1;
    v15 = a3[3];
    v17 = *a3;
    v16 = a3[1];
    *(_OWORD *)(v14 + 80) = a3[2];
    *(_OWORD *)(v14 + 96) = v15;
    *(_OWORD *)(v14 + 48) = v17;
    *(_OWORD *)(v14 + 64) = v16;
    *(_QWORD *)(v14 + 40) = 0;
    *(double *)(v14 + 24) = v11 + *(double *)(a2 + 24);
  }
  return v14;
}

- (uint64_t)_bestNodeInNodeList:(uint64_t)a3 withLineCount:
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59___NSOptimalLineBreaker__bestNodeInNodeList_withLineCount___block_invoke;
    v9[3] = &unk_1E2603310;
    v9[4] = a1;
    v9[5] = &v10;
    v9[6] = a3;
    objc_msgSend(v5, "enumerateValuesWithBlock:", v9);
    v7 = v11[3];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_node:(double *)a3 isBetterThanNode:
{
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (result)
  {
    if (!a2)
      -[_NSOptimalLineBreaker _node:isBetterThanNode:].cold.1();
    if (a3)
    {
      if (*((_QWORD *)a2 + 6) != *((_QWORD *)a3 + 6) || *((_QWORD *)a2 + 7) != *((_QWORD *)a3 + 7))
        -[_NSOptimalLineBreaker _node:isBetterThanNode:].cold.2();
      v4 = a3[3];
      v5 = a2[3];
      if (vabdd_f64(v4, v5) >= 0.000001)
      {
        return v5 < v4;
      }
      else
      {
        while (1)
        {
          a2 = *(double **)a2;
          if (!a2)
            return 0;
          a3 = *(double **)a3;
          if (!a3)
            return 0;
          v6 = *((_QWORD *)a2 + 6);
          v7 = *((_QWORD *)a3 + 6);
          v8 = v7 < v6;
          if (v6 < v7)
            v8 = -1;
          if (!v8)
          {
            v9 = *((_QWORD *)a2 + 7) + v6;
            v10 = *((_QWORD *)a3 + 7) + v7;
            v8 = v10 < v9;
            if (v9 < v10)
              break;
          }
          if (v8)
            return v8 == 1;
        }
        v8 = -1;
        return v8 == 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_bestNode:(uint64_t)a3 dominatesNode:
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    if (!a2 || !a3)
      -[_NSOptimalLineBreaker _bestNode:dominatesNode:].cold.1();
    if (a3 != a2)
    {
      if (*(_QWORD *)(a2 + 48) != *(_QWORD *)(a3 + 48) || *(_QWORD *)(a2 + 56) != *(_QWORD *)(a3 + 56))
        -[_NSOptimalLineBreaker _bestNode:dominatesNode:].cold.3();
      v5 = result;
      if ((-[_NSOptimalLineBreaker _node:isBetterThanNode:](result, (double *)a2, (double *)a3) & 1) == 0)
        -[_NSOptimalLineBreaker _bestNode:dominatesNode:].cold.2();
      v6 = *(_QWORD *)(v5 + 416);
      if (*(_BYTE *)(v5 + 372))
      {
        if (!v6 && *(double *)(a3 + 24) >= *(double *)(a2 + 24) + *(double *)(v5 + 256))
          return 1;
      }
      else if (!*(_BYTE *)(v5 + 373))
      {
        v7 = *(_QWORD *)(a3 + 16);
        v8 = *(_QWORD *)(a2 + 16);
        if (v6 < 0)
        {
          if (v7 - v6 < v8)
            return 1;
        }
        else if (v7 > v8 + v6 || !v6 && v7 < v8)
        {
          return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

- (unint64_t)_indexOfLastResortHyphenInRange:(CFIndex)a3 maxWidth:(double)a4
{
  const void *v8;
  const __CFLocale *v9;
  const __CFLocale *v10;
  unint64_t v11;
  __CFString *v12;
  unint64_t HyphenationLocationBeforeIndex;
  BOOL v14;
  double v16;
  double v17;
  CFRange v19;

  if (!a1)
    return 0;
  v8 = *(const void **)(a1 + 136);
  if (v8)
    v9 = (const __CFLocale *)CFRetain(v8);
  else
    v9 = CFLocaleCopyCurrent();
  v10 = v9;
  if (CFStringIsHyphenationAvailableForLocale(v9))
  {
    if (a2 + a3 < *(_QWORD *)(a1 + 472) + *(_QWORD *)(a1 + 464))
      ++a3;
    v11 = a3 + a2;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 440), "string");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19.location = a2;
      v19.length = a3;
      HyphenationLocationBeforeIndex = CFStringGetHyphenationLocationBeforeIndex(v12, v11, v19, 0, v10, 0);

      v14 = HyphenationLocationBeforeIndex != -1 && HyphenationLocationBeforeIndex > a2;
      if (!v14 || HyphenationLocationBeforeIndex >= v11)
        break;
      objc_msgSend(*(id *)(a1 + 360), "widthOfSubstringWithRange:", a2, HyphenationLocationBeforeIndex - a2);
      v17 = v16;
      -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, HyphenationLocationBeforeIndex);
      v11 = HyphenationLocationBeforeIndex;
      if (v17 + *(double *)(a1 + 120) <= a4)
        goto LABEL_19;
    }
  }
  HyphenationLocationBeforeIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
  CFRelease(v10);
  return HyphenationLocationBeforeIndex;
}

- (uint64_t)_mustExceedLineCount:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  if (result)
  {
    v2 = result;
    if (!*(_BYTE *)(result + 8) || (v3 = *(_QWORD *)(result + 32)) == 0)
      -[_NSOptimalLineBreaker _mustExceedLineCount:].cold.1();
    if (a2)
    {
      if (a2 == 0x7FFFFFFFFFFFFFFFLL)
        -[_NSOptimalLineBreaker _mustExceedLineCount:].cold.2();
      v5 = *(_QWORD *)(result + 24);
      v6 = v5 + (v3 << 6);
      objc_msgSend((id)result, "_naturalWidthFromBreak:toBreak:", v5, v6 - 64);
      v8 = v7 - (*(double *)(v6 - 8) - *(double *)(v6 - 48) - *(double *)(v5 + 56));
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)v2);
      v9 = *(double *)(v2 + 160);
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)v2);
      return v8 > v9 + (double)(unint64_t)(a2 - 1) * *(double *)(v2 + 168);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hasArtificialBreak
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 *v3;
  uint64_t v4;
  unsigned int v5;

  if (result)
  {
    if (!*(_BYTE *)(result + 9))
      -[_NSOptimalLineBreaker _hasArtificialBreak].cold.1();
    v1 = *(_QWORD *)(result + 200);
    if (v1)
    {
      v2 = v1 - 1;
      v3 = (unsigned __int16 *)(*(_QWORD *)(result + 192) + 48);
      do
      {
        v4 = v2;
        v5 = *v3;
        v3 += 32;
        result = (v5 >> 4) & 1;
        if ((v5 & 0x10) != 0)
          break;
        --v2;
      }
      while (v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_calculateOptimalWrapping
{
  uint64_t v2;

  if (a1 && !*(_BYTE *)(a1 + 9))
  {
    if (*(_BYTE *)(a1 + 369))
    {
      v2 = *(_QWORD *)(a1 + 400);
      if (v2 != 0x7FFFFFFFFFFFFFFFLL && (-[_NSOptimalLineBreaker _mustExceedLineCount:](a1, v2 - 1) & 1) == 0)
      {
        -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:](a1, &__block_literal_global_130);
        if ((unint64_t)objc_msgSend((id)a1, "lineCount") < *(_QWORD *)(a1 + 400)
          && !-[_NSOptimalLineBreaker _hasArtificialBreak](a1))
        {
          return;
        }
        objc_msgSend((id)a1, "invalidateWrapping");
      }
    }
    -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:](a1, 0);
  }
}

- (void)_calculateOptimalWrappingWithLineBreakFilter:(uint64_t)a1
{
  uint64_t (**v3)(void);
  _NSLineBreakerQueue *v4;
  void *v5;
  _NSLineBreakerNodePool *v6;
  void *v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t i;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  unsigned __int8 v27;
  char v28;
  char v29;
  double v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  double *firstNode;
  const __CFDictionary *dict;
  uint64_t *v37;
  double *v38;
  uint64_t j;
  _NSLineBreakerQueue *v40;
  __CFDictionary *v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  double v51;
  unint64_t v52;
  BOOL v53;
  int v54;
  unint64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  double v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  int v76;
  const char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t *p_firstClass;
  char v82;
  uint64_t (**v83)(void);
  _NSLineBreakerNodeDictionary *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  _NSLineBreakerQueue *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v3 = a2;
  if (a1 && !*(_BYTE *)(a1 + 9))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v83 = v3;
      v4 = objc_alloc_init(_NSLineBreakerQueue);
      v84 = objc_alloc_init(_NSLineBreakerNodeDictionary);
      v5 = *(void **)(a1 + 184);
      if (!v5)
      {
        v6 = objc_alloc_init(_NSLineBreakerNodePool);
        v7 = *(void **)(a1 + 184);
        *(_QWORD *)(a1 + 184) = v6;

        v5 = *(void **)(a1 + 184);
      }
      objc_msgSend(v5, "reset");
      v8 = objc_msgSend(*(id *)(a1 + 184), "allocNode");
      *(_QWORD *)v8 = 0;
      *(_BYTE *)(v8 + 33) = 1;
      *(_QWORD *)(v8 + 16) = 0;
      *(_QWORD *)(v8 + 24) = 0;
      *(_QWORD *)(v8 + 40) = 0;
      v9 = *(_OWORD **)(a1 + 24);
      v11 = v9[2];
      v10 = v9[3];
      v12 = v9[1];
      *(_OWORD *)(v8 + 48) = *v9;
      *(_OWORD *)(v8 + 64) = v12;
      *(_OWORD *)(v8 + 80) = v11;
      *(_OWORD *)(v8 + 96) = v10;
      -[_NSLineBreakerQueue appendValue:](v4, "appendValue:", v8);
      v13 = objc_msgSend(*(id *)(a1 + 184), "retainNode:", v8);
      v99 = 0u;
      v100 = 0u;
      v97 = xmmword_18D6CBB80;
      v98 = 0u;
      if (*(_BYTE *)(a1 + 372))
        v14 = *(double *)(a1 + 256) + 0.0;
      else
        v14 = 0.0;
      v80 = v13;
      if (*(_BYTE *)(a1 + 373))
        v14 = v14 + *(double *)(a1 + 264) * 32.0;
      if (*(_QWORD *)(a1 + 32) >= 2uLL)
      {
        p_firstClass = &v84->_firstClass;
        v78 = (char *)&v86 + 8;
        v15 = 1;
        do
        {
          v16 = 0;
          v85 = *(_QWORD *)(a1 + 24) + (v15 << 6);
          v17 = *(_WORD *)(v85 + 48);
          v93 = 0;
          v94 = &v93;
          v95 = 0x2020000000;
          v96 = 0;
          v18 = INFINITY;
          while (v16 < -[_NSLineBreakerQueue count](v4, "count", v78))
          {
            v19 = -[_NSLineBreakerQueue valueAtIndex:](v4, "valueAtIndex:", v16);
            if (v18 >= *(double *)(v19 + 24))
              v18 = *(double *)(v19 + 24);
            ++v16;
          }
          v79 = v15;
          v20 = 0;
          v21 = 0;
          for (i = 0; i < -[_NSLineBreakerQueue count](v4, "count"); ++i)
          {
            v23 = -[_NSLineBreakerQueue valueAtIndex:](v4, "valueAtIndex:", i);
            v24 = v23;
            if (*(_BYTE *)(v23 + 32))
              __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2226, "!parent->isFree");
            v25 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, v23 + 48, v85);
            v26 = v25;
            v27 = (v25 < -1.0) | v17;
            v20 += v27 & ~v21 & 1;
            if ((v17 & 4) == 0)
            {
              if (v83)
              {
                v28 = v83[2]();
                if (v26 >= -1.0)
                  v29 = v28;
                else
                  v29 = 0;
                if ((v29 & 1) == 0)
                  goto LABEL_55;
              }
              else if (v25 < -1.0)
              {
                goto LABEL_55;
              }
              if (v26 > 0.0)
              {
                if (v26 > *(double *)(a1 + 16))
                  break;
                v30 = -[_NSOptimalLineBreaker _minimumDemeritForLineEndingAtBreak:withExpansionRatio:](a1, v85, v26);
                v31 = v94[3];
                if (v31)
                {
                  if (v18 + v30 > v14 + *(double *)(v31 + 24) + 0.000001)
                    break;
                }
              }
              v32 = (_QWORD *)-[_NSOptimalLineBreaker _createNodeWithParent:lineBreak:expansionRatio:mustSucceed:](a1, v24, (__int128 *)v85, 0, v26);
              if (v32)
              {
                v33 = -[_NSOptimalLineBreaker _equivalenceClassForNode:](a1, v32);
                v34 = (void *)v33;
                if (v84)
                {
                  if (*p_firstClass == v33)
                  {
                    firstNode = (double *)v84->_firstNode;
                    if (!firstNode)
                    {
LABEL_46:
                      v82 = 1;
                      goto LABEL_47;
                    }
LABEL_41:
                    if ((void *)-[_NSOptimalLineBreaker _equivalenceClassForNode:](a1, firstNode) != v34)
                    {
                      v76 = 2268;
                      v77 = "!existing || [self _equivalenceClassForNode:existing] == nodeClass";
                      goto LABEL_116;
                    }
                    if (-[_NSOptimalLineBreaker _node:isBetterThanNode:](a1, (double *)v32, firstNode))
                    {
                      v82 = 0;
LABEL_47:
                      -[_NSLineBreakerNodeDictionary setNode:forClass:](v84, v32, v34);
                      v37 = v94;
                      v38 = (double *)v94[3];
                      if (!v38 || v38 == firstNode)
                      {
LABEL_51:
                        v37[3] = (uint64_t)v32;
                      }
                      else if (-[_NSOptimalLineBreaker _node:isBetterThanNode:](a1, (double *)v32, v38))
                      {
                        v37 = v94;
                        goto LABEL_51;
                      }
                      if ((v82 & 1) != 0)
                        goto LABEL_55;
                      if ((double *)v94[3] == firstNode)
                      {
                        v76 = 2276;
                        v77 = "bestNode != existing";
LABEL_116:
                        __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", v76, v77);
                      }
                    }
                    else
                    {
                      firstNode = (double *)v32;
                    }
                    objc_msgSend(*(id *)(a1 + 184), "releaseNode:", firstNode);
                    goto LABEL_55;
                  }
                  dict = v84->_dict;
                  if (dict)
                  {
                    firstNode = (double *)CFDictionaryGetValue(dict, v34);
                    if (!firstNode)
                      goto LABEL_46;
                    goto LABEL_41;
                  }
                }
                firstNode = 0;
                goto LABEL_46;
              }
            }
LABEL_55:
            v21 |= v27 ^ 1;
          }
          if ((v17 & 1) != 0)
            v20 = -[_NSLineBreakerQueue count](v4, "count");
          if (v20)
          {
            for (j = 0; j != v20; ++j)
              objc_msgSend(*(id *)(a1 + 184), "releaseNode:", -[_NSLineBreakerQueue valueAtIndex:](v4, "valueAtIndex:", j));
          }
          -[_NSLineBreakerQueue removeValuesBeforeIndex:](v4, "removeValuesBeforeIndex:", v20);
          v90[0] = MEMORY[0x1E0C809B0];
          v90[1] = 3221225472;
          v90[2] = __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke;
          v90[3] = &unk_1E2603378;
          v90[4] = a1;
          v92 = &v93;
          v40 = v4;
          v91 = v40;
          -[_NSLineBreakerNodeDictionary enumerateClassesAndNodesUsingBlock:](v84, v90);
          if (v84)
          {
            *p_firstClass = 0;
            v84->_firstNode = 0;
            v41 = v84->_dict;
            if (v41)
              CFDictionaryRemoveAllValues(v41);
          }
          if (v94[3])
          {
            objc_msgSend(*(id *)(a1 + 184), "releaseNode:", v80);
            v80 = objc_msgSend(*(id *)(a1 + 184), "retainNode:", v94[3]);
          }
          if (-[_NSLineBreakerQueue count](v40, "count"))
            goto LABEL_92;
          v42 = v80;
          if (!v80)
            __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2314, "lastResortNode");
          v43 = *(_WORD *)(v80 + 96);
          -[_NSOptimalLineBreaker _computeParagraphStyleValues]((_QWORD *)a1);
          v44 = 160;
          if ((v43 & 1) == 0)
            v44 = 168;
          v45 = *(double *)(a1 + v44);
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          if ((_QWORD)v97 == 0x7FFFFFFFFFFFFFFFLL
            || *(_QWORD *)(v80 + 56) + *(_QWORD *)(v80 + 48) >= (unint64_t)v97
            || (v46 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, v80 + 48, (uint64_t)&v97),
                v42 = v80,
                v46 < -1.0)
            || v46 > *(double *)(a1 + 16))
          {
            v47 = *(_QWORD *)(v42 + 48);
            v48 = *(_QWORD *)(v42 + 56);
            -[_NSOptimalLineBreaker _lineMetrics]((id *)a1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v48 + v47;
            v51 = v45 + 0.001;
            v52 = objc_msgSend(v49, "suggestedLineBreakAfterIndex:withWidth:", v48 + v47, v51);

            v53 = v52 != 0x7FFFFFFFFFFFFFFFLL && v52 > v50;
            if (v53 && v52 < *(_QWORD *)v85)
            {
              v54 = *(unsigned __int8 *)(a1 + 378);
              if (*(_BYTE *)(a1 + 378))
              {
                v55 = -[_NSOptimalLineBreaker _indexOfLastResortHyphenInRange:maxWidth:](a1, v50, v52 - v50, v51);
                v54 = v55 != 0x7FFFFFFFFFFFFFFFLL;
                if (v55 != 0x7FFFFFFFFFFFFFFFLL)
                  v52 = v55;
              }
              v56 = 0;
              *(_QWORD *)&v86 = v52;
              *(_OWORD *)v78 = 0u;
              *((_OWORD *)v78 + 1) = 0u;
              *((_QWORD *)v78 + 4) = 0;
              *((_QWORD *)&v89 + 1) = *(_QWORD *)(v80 + 104);
              LOWORD(v89) = 0;
              if (v54)
              {
                -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, v52);
                v56 = 0;
                *((_QWORD *)&v87 + 1) = *(_QWORD *)(a1 + 120);
                LOWORD(v89) = v89 | 0xA;
              }
            }
            else
            {
              v57 = *(_OWORD *)v85;
              v58 = *(_OWORD *)(v85 + 16);
              v59 = *(_OWORD *)(v85 + 48);
              v88 = *(_OWORD *)(v85 + 32);
              v89 = v59;
              v86 = v57;
              v87 = v58;
              v56 = 1;
            }
          }
          else
          {
            v56 = 0;
            v86 = v97;
            v87 = v98;
            v88 = v99;
            v89 = v100;
          }
          LOWORD(v89) = v89 | 0x10;
          v60 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, v80 + 48, (uint64_t)&v86);
          if (v60 < -1.0)
            v60 = -1.0;
          if (v60 >= *(double *)(a1 + 16))
            v60 = *(double *)(a1 + 16);
          v61 = -[_NSOptimalLineBreaker _createNodeWithParent:lineBreak:expansionRatio:mustSucceed:](a1, v80, &v86, 1, v60);
          if (!v61)
            __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2369, "forceBreakNode");
          -[_NSLineBreakerQueue appendValue:](v40, "appendValue:", v61);
          objc_msgSend(*(id *)(a1 + 184), "releaseNode:", v80);
          v80 = objc_msgSend(*(id *)(a1 + 184), "retainNode:", v61);
          if ((v56 & 1) != 0)
          {
LABEL_92:
            if ((v17 & 4) != 0)
            {
              v62 = *(_OWORD *)v85;
              v63 = *(_OWORD *)(v85 + 16);
              v64 = *(_OWORD *)(v85 + 48);
              v99 = *(_OWORD *)(v85 + 32);
              v100 = v64;
              v97 = v62;
              v98 = v63;
            }
            v65 = v79;
          }
          else
          {
            v65 = v79 - 1;
          }

          _Block_object_dispose(&v93, 8);
          v15 = v65 + 1;
        }
        while (v15 < *(_QWORD *)(a1 + 32));
      }
      v66 = -[_NSOptimalLineBreaker _bestNodeInNodeList:withLineCount:](a1, v4, 0x7FFFFFFFFFFFFFFFLL);
      v67 = *(_QWORD *)(v66 + 16);
      v68 = *(_QWORD *)(a1 + 416);
      if (v68)
      {
        while (1)
        {
          v69 = -[_NSOptimalLineBreaker _bestNodeInNodeList:withLineCount:](a1, v4, v68 + v67);
          if (v69)
            break;
          if (v68 < 0)
            ++v68;
          else
            --v68;
          if (!v68)
            goto LABEL_107;
        }
        v66 = v69;
LABEL_107:
        v67 = *(_QWORD *)(v66 + 16);
      }
      v70 = v67 + 1;
      *(_QWORD *)(a1 + 200) = v67 + 1;
      *(_QWORD *)(a1 + 192) = malloc_type_realloc(*(void **)(a1 + 192), (v67 + 1) << 6, 0x1000040A976A909uLL);
      v71 = v67 << 6;
      do
      {
        --v70;
        v72 = (_OWORD *)(*(_QWORD *)(a1 + 192) + v71);
        v73 = *(_OWORD *)(v66 + 48);
        v74 = *(_OWORD *)(v66 + 64);
        v75 = *(_OWORD *)(v66 + 96);
        v72[2] = *(_OWORD *)(v66 + 80);
        v72[3] = v75;
        *v72 = v73;
        v72[1] = v74;
        v66 = *(_QWORD *)v66;
        v71 -= 64;
      }
      while (v66);
      if (v70)
        -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:].cold.1();
      *(_BYTE *)(a1 + 9) = 1;

      v3 = v83;
    }
    else
    {
      *(_QWORD *)(a1 + 200) = 0;
      *(_BYTE *)(a1 + 9) = 1;
    }
  }

}

- (void)_createLines
{
  __assert_rtn("-[_NSOptimalLineBreaker _createLines]", "NSOptimalLineBreaker.m", 2477, "line");
}

- (void)layout
{
  -[_NSOptimalLineBreaker _calculateLineBreaks]((uint64_t)self);
  if (-[NSString isEqualToString:](self->_lineBreakAlgorithm, "isEqualToString:", CFSTR("Optimal")))
  {
    -[_NSOptimalLineBreaker _calculateOptimalWrapping]((uint64_t)self);
  }
  else if (-[NSString isEqualToString:](self->_lineBreakAlgorithm, "isEqualToString:", CFSTR("First Fit")))
  {
    -[_NSOptimalLineBreaker _calculateFirstFitWrapping]((uint64_t)self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("unrecognized line break algorithm '%@'"), self->_lineBreakAlgorithm);
  }
}

- (void)invalidateWrapping
{
  *(_WORD *)&self->_wrappingValid = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_hyphenationFactorHyphenPenalty = _Q0;
}

- (unint64_t)lineCount
{
  unint64_t chosenLineBreakCount;
  BOOL v3;
  unint64_t v4;

  chosenLineBreakCount = self->_chosenLineBreakCount;
  v3 = chosenLineBreakCount != 0;
  v4 = chosenLineBreakCount - 1;
  if (v3)
    return v4;
  else
    return 0;
}

- ($102BB1629D0471A0919C413AE880609B)lineBreakAtIndex:(SEL)a3
{
  NSUInteger v4;
  __int128 v5;
  __int128 v6;

  if (self[3].var0.length <= a4)
    -[_NSOptimalLineBreaker lineBreakAtIndex:].cold.1();
  v4 = self[3].var0.location + (a4 << 6);
  v5 = *(_OWORD *)(v4 + 16);
  retstr->var0 = *(_NSRange *)v4;
  *(_OWORD *)&retstr->var1 = v5;
  v6 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->var3 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->var5 = v6;
  return self;
}

- ($554B148941027912B77C686939519A4B)lineInfoAtIndex:(SEL)a3
{
  $554B148941027912B77C686939519A4B *result;
  $554B148941027912B77C686939519A4B *v8;
  __int128 v9;
  CGSize size;

  -[_NSOptimalLineBreaker _createLines]((uint64_t)self);
  v8 = &self->_lineInfos[a4];
  v9 = *(_OWORD *)&v8->var2;
  retstr->var1 = v8->var1;
  *(_OWORD *)&retstr->var2 = v9;
  retstr->var4 = v8->var4;
  size = v8->var0.size;
  retstr->var0.origin = v8->var0.origin;
  retstr->var0.size = size;
  return result;
}

- (__CTLine)lineAtIndex:(unint64_t)a3 lineInfo:(id *)a4
{
  $554B148941027912B77C686939519A4B *v7;
  CGSize size;
  _NSRange var1;
  __int128 v10;

  -[_NSOptimalLineBreaker _createLines]((uint64_t)self);
  if (a4)
  {
    v7 = &self->_lineInfos[a3];
    a4->var0.origin = v7->var0.origin;
    size = v7->var0.size;
    var1 = v7->var1;
    v10 = *(_OWORD *)&v7->var2;
    a4->var4 = v7->var4;
    a4->var1 = var1;
    *(_OWORD *)&a4->var2 = v10;
    a4->var0.size = size;
  }
  return (__CTLine *)CFArrayGetValueAtIndex(self->_lines, a3);
}

- (unint64_t)_indexOfLineBreakAtCharacterIndex:(unint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v2 = (_QWORD *)result;
    result = *(_QWORD *)(result + 32);
    if (!result)
      -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:].cold.1();
    v3 = v2[58];
    if (v3 > a2 || v2[59] + v3 < a2)
      -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:].cold.2();
    if (v3 == a2)
    {
      return 0;
    }
    else if (result < 2)
    {
      return 1;
    }
    else
    {
      v4 = 0;
      v5 = v2[3];
      do
      {
        if (*(_QWORD *)(v5 + ((v4 + ((result - v4) >> 1)) << 6)) >= a2)
          result = v4 + ((result - v4) >> 1);
        else
          v4 += (result - v4) >> 1;
      }
      while (v4 + 1 < result);
    }
  }
  return result;
}

- (void)enumerateLineBreaksInRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void (**v7)(_QWORD);
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t i;

  length = a3.length;
  location = a3.location;
  v7 = (void (**)(_QWORD))a4;
  v8 = -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]((unint64_t)self, location);
  v9 = location + length;
  v10 = v8 - 1;
  for (i = v8 << 6;
        ++v10 < self->_lineBreakCount
     && *(NSUInteger *)((char *)&self->_lineBreaks->var0.length + i)
      + *(NSUInteger *)((char *)&self->_lineBreaks->var0.location + i) <= v9;
        i += 64)
  {
    v7[2](v7);
  }

}

- (BOOL)allowsHyphenation
{
  return self->_allowsHyphenation;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (unint64_t)minHyphenationLineCount
{
  return self->_minHyphenationLineCount;
}

- (BOOL)shouldFillLastLine
{
  return self->_shouldFillLastLine;
}

- (double)minimumLastLineLength
{
  return self->_minimumLastLineLength;
}

- (int64_t)lineCountAdjustment
{
  return self->_lineCountAdjustment;
}

- (NSString)lineBreakAlgorithm
{
  return self->_lineBreakAlgorithm;
}

- (BOOL)usesHangingPunctuation
{
  return self->_usesHangingPunctuation;
}

- (BOOL)usesStretchClasses
{
  return self->_usesStretchClasses;
}

- (BOOL)avoidsRivers
{
  return self->_avoidsRivers;
}

- (BOOL)compressesLeftAlignedText
{
  return self->_compressesLeftAlignedText;
}

- (BOOL)expandsGlyphs
{
  return self->_expandsGlyphs;
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (int)koreanLineBreakBehavior
{
  return self->_koreanLineBreakBehavior;
}

- (int)prepositionLineBreakBehavior
{
  return self->_prepositionLineBreakBehavior;
}

- (BOOL)breaksWithinCJWords
{
  return self->_breaksWithinCJWords;
}

- (BOOL)usesCFStringTokenizerForLineBreaks
{
  return self->_usesCFStringTokenizerForLineBreaks;
}

- (BOOL)hyphenatesBetweenMorphemesFreely
{
  return self->_hyphenatesBetweenMorphemesFreely;
}

- (BOOL)hyphenatesAsLastResort
{
  return self->_hyphenatesAsLastResort;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
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

- (__CTLine)paragraphLine
{
  return self->_paragraphLine;
}

- (unint64_t)minPreHyphenLength
{
  return self->_minPreHyphenLength;
}

- (void)setMinPreHyphenLength:(unint64_t)a3
{
  self->_minPreHyphenLength = a3;
}

- (unint64_t)minPostHyphenLength
{
  return self->_minPostHyphenLength;
}

- (void)setMinPostHyphenLength:(unint64_t)a3
{
  self->_minPostHyphenLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_lineBreakAlgorithm, 0);
  objc_storeStrong((id *)&self->_lineMetrics, 0);
  objc_storeStrong((id *)&self->_defaultParagraphStyle, 0);
  objc_storeStrong((id *)&self->_nodePool, 0);
  objc_storeStrong((id *)&self->_consumedNBSPRanges, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
  objc_storeStrong((id *)&self->_cachedHyphenFont, 0);
}

- (void)setAttributedString:paragraphRange:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker setAttributedString:paragraphRange:]", "NSOptimalLineBreaker.m", 375, "range.location != NSNotFound");
}

- (void)setAttributedString:paragraphRange:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker setAttributedString:paragraphRange:]", "NSOptimalLineBreaker.m", 376, "NSMaxRange(range) <= attributedString.length");
}

- (void)_expansionRatioFromBreak:toBreak:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:]", "NSOptimalLineBreaker.m", 630, "_lineBreaksValid");
}

- (void)_estimatedExpansionRatioForLineWithNaturalWidth:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:]", "NSOptimalLineBreaker.m", 671, "0 < naturalWidth && naturalWidth <= _textContainerWidth");
}

- (void)_softHyphenPenaltyForBreak:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:]", "NSOptimalLineBreaker.m", 708, "lineBreak->flags & _NSLineBreakIsSoftHyphen");
}

- (void)_softHyphenPenaltyForBreak:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:]", "NSOptimalLineBreaker.m", 707, "!(lineBreak->flags & _NSLineBreakIsParagraphBoundary)");
}

- (void)_implicitNBSPPenaltyForBreak:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:]", "NSOptimalLineBreaker.m", 731, "lineBreak->flags & _NSLineBreakIsImplicitNBSP");
}

- (void)_implicitNBSPPenaltyForBreak:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:]", "NSOptimalLineBreaker.m", 730, "!(lineBreak->flags & _NSLineBreakIsParagraphBoundary)");
}

- (void)_demeritFromBreak:toBreak:usingExpansionRatio:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:]", "NSOptimalLineBreaker.m", 822, "_lineBreaksValid");
}

- (void)_shouldAllowLastLineFromBreak:toBreak:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:]", "NSOptimalLineBreaker.m", 809, "(end->flags & _NSLineBreakIsParagraphBoundary) != 0 && \"_shouldAllowLastLineFromBreak:toBreak: is only meaningful for last line\");
}

- (void)_computeFontMetricsAtIndex:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _computeFontMetricsAtIndex:]", "NSOptimalLineBreaker.m", 872, "font && [font isKindOfClass:__NSFontClassName__.class]");
}

- (void)_enumerateHyphenationPointsWithBlock:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _enumerateHyphenationPointsWithBlock:]", "NSOptimalLineBreaker.m", 1020, "wordRange.location < hyphenIndex && hyphenIndex < wordRange.location + wordRange.length");
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]", "NSOptimalLineBreaker.m", 1320, "breakRange.length == 0");
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]", "NSOptimalLineBreaker.m", 1311, "_prepositionLineBreakBehavior == _NSOptimalLineBreakerBreaksAfterPrepositionNever");
}

- (void)_addLineBreakWithRange:flags:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]", "NSOptimalLineBreaker.m", 1395, "self.paragraphRange.location <= range.location");
}

- (void)_addLineBreakWithRange:flags:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]", "NSOptimalLineBreaker.m", 1396, "NSMaxRange(range) <= NSMaxRange(self.paragraphRange)");
}

- (void)_node:isBetterThanNode:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _node:isBetterThanNode:]", "NSOptimalLineBreaker.m", 1943, "node1");
}

- (void)_node:isBetterThanNode:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _node:isBetterThanNode:]", "NSOptimalLineBreaker.m", 1947, "NSEqualRanges(node1->lineBreak.range, node2->lineBreak.range)");
}

- (void)_bestNode:dominatesNode:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _bestNode:dominatesNode:]", "NSOptimalLineBreaker.m", 1978, "bestNode && node");
}

- (void)_bestNode:dominatesNode:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _bestNode:dominatesNode:]", "NSOptimalLineBreaker.m", 1983, "[self _node:bestNode isBetterThanNode:node]");
}

- (void)_bestNode:dominatesNode:.cold.3()
{
  __assert_rtn("-[_NSOptimalLineBreaker _bestNode:dominatesNode:]", "NSOptimalLineBreaker.m", 1982, "NSEqualRanges(bestNode->lineBreak.range, node->lineBreak.range)");
}

- (void)_mustExceedLineCount:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _mustExceedLineCount:]", "NSOptimalLineBreaker.m", 2072, "_lineBreaksValid && _lineBreakCount > 0");
}

- (void)_mustExceedLineCount:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _mustExceedLineCount:]", "NSOptimalLineBreaker.m", 2073, "lineCount != NSNotFound");
}

- (void)_hasArtificialBreak
{
  __assert_rtn("-[_NSOptimalLineBreaker _hasArtificialBreak]", "NSOptimalLineBreaker.m", 2087, "_wrappingValid");
}

- (void)_calculateOptimalWrappingWithLineBreakFilter:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2418, "n == 0");
}

- (void)lineBreakAtIndex:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker lineBreakAtIndex:]", "NSOptimalLineBreaker.m", 2594, "i < _chosenLineBreakCount");
}

- (void)_indexOfLineBreakAtCharacterIndex:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]", "NSOptimalLineBreaker.m", 2613, "_lineBreakCount > 0");
}

- (void)_indexOfLineBreakAtCharacterIndex:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]", "NSOptimalLineBreaker.m", 2614, "_paragraphRange.location <= i && i <= NSMaxRange(_paragraphRange)");
}

@end
