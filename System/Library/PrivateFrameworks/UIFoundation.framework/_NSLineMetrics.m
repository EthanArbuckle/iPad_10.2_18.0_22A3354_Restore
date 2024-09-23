@implementation _NSLineMetrics

- (__CFLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(__CFLocale *)a3
{
  __CFLocale *locale;

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
  }
  self->_hasShaping = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_calculatePositions:(double *)a3 hasAdvanceAdjustment:(BOOL *)a4 withCapacity:(unint64_t)a5 forAttributedString:(id)a6 range:(_NSRange)a7 line:(__CTLine *)a8
{
  NSUInteger length;
  NSUInteger location;
  __CTLine *v13;
  CFIndex v14;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  __CFArray *runsBuf;
  __CFArray *MutableCopy;
  const __CFAllocator *v19;
  const __CFArray *v20;
  CFIndex v21;
  double v22;
  const __CTRun *ValueAtIndex;
  CFIndex GlyphCount;
  CGSize *advancesBuf;
  int64_t *stringIndicesBuf;
  uint64_t j;
  int64_t v28;
  double width;
  double v30;
  CFIndex v31;
  double *i;
  int64_t v33;
  double v34;
  double v35;
  __CTLine *v36;
  id v37;
  CFIndex v38;
  _NSLineMetrics *v39;
  uint64_t __pattern8;
  CFRange v42;
  CFRange v43;
  CFRange v44;

  length = a7.length;
  location = a7.location;
  v37 = a6;
  if (length + 1 > a5)
    -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:].cold.1();
  if (self->_isInCalculatePositions)
    -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:].cold.2();
  self->_isInCalculatePositions = 1;
  __pattern8 = 0x7FF8000000000000;
  memset_pattern8(a3, &__pattern8, 8 * a5);
  v13 = a8;
  if (!a8)
    v13 = CTLineCreateWithAttributedString((CFAttributedStringRef)objc_msgSend(v37, "attributedSubstringFromRange:", location, length));
  v14 = CTLineGetStringRange(v13).location;
  GlyphRuns = CTLineGetGlyphRuns(v13);
  Count = CFArrayGetCount(GlyphRuns);
  runsBuf = self->_runsBuf;
  if (runsBuf)
  {
    CFArrayRemoveAllValues(runsBuf);
    v44.location = 0;
    v44.length = Count;
    CFArrayAppendArray(self->_runsBuf, GlyphRuns, v44);
    MutableCopy = self->_runsBuf;
  }
  else
  {
    v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v20 = CTLineGetGlyphRuns(v13);
    MutableCopy = CFArrayCreateMutableCopy(v19, 0, v20);
    self->_runsBuf = MutableCopy;
  }
  v36 = v13;
  _CFArraySortValuesWithBlock(MutableCopy, 0, Count, &__block_literal_global_6);
  if (Count)
  {
    v21 = 0;
    v22 = 0.0;
    v38 = Count;
    v39 = self;
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(self->_runsBuf, v21);
      GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
      -[_NSLineMetrics _ensureGlyphCapacity:](self, "_ensureGlyphCapacity:", GlyphCount);
      advancesBuf = self->_advancesBuf;
      stringIndicesBuf = self->_stringIndicesBuf;
      v42.location = 0;
      v42.length = GlyphCount;
      CTRunGetBaseAdvancesAndOrigins(ValueAtIndex, v42, advancesBuf, 0);
      v43.location = 0;
      v43.length = GlyphCount;
      CTRunGetStringIndices(ValueAtIndex, v43, stringIndicesBuf);
      CTRunGetPropertiesPtr();
      if ((CTRunGetStatus(ValueAtIndex) & 1) != 0)
      {
        if (GlyphCount)
        {
          v31 = GlyphCount - 1;
          for (i = &advancesBuf[GlyphCount - 1].width; ; i -= 2)
          {
            v33 = stringIndicesBuf[v31] - v14;
            if (!v31)
              break;
            v34 = *i;
            v22 = v22 + v34;
            --v31;
          }
          CTRunGetInitialBaseAdvance();
          if (v35 != 0.0)
          {
            v22 = v22 + v35;
            if (a4)
              a4[v33] = 1;
          }
          v22 = v22 + *i;
        }
      }
      else if (GlyphCount)
      {
        for (j = 0; j != GlyphCount; ++j)
        {
          v28 = stringIndicesBuf[j] - v14;
          if (!j)
          {
            CTRunGetInitialBaseAdvance();
            if (v30 != 0.0)
            {
              v22 = v22 + v30;
              if (a4)
                a4[v28] = 1;
            }
          }
          width = advancesBuf->width;
          ++advancesBuf;
          v22 = v22 + width;
        }
      }
      ++v21;
      self = v39;
    }
    while (v21 != v38);
  }
  else
  {
    v22 = 0.0;
  }
  for (a3[length] = v22; length; --length)
    ;
  CFArrayRemoveAllValues(self->_runsBuf);
  if (!a8)
    CFRelease(v36);
  self->_isInCalculatePositions = 0;

}

- (void)_calculatePositions
{
  size_t v3;
  BOOL *v4;

  v3 = self->_lineRange.length + 1;
  self->_positions = (double *)malloc_type_realloc(self->_positions, 8 * v3, 0x100004000313F17uLL);
  v4 = (BOOL *)malloc_type_realloc(self->_hasAdvanceAdjustment, v3, 0x100004077774924uLL);
  self->_hasAdvanceAdjustment = v4;
  bzero(v4, v3);
  -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:](self, "_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:", self->_positions, self->_hasAdvanceAdjustment, v3, self->_attributedString, self->_lineRange.location, self->_lineRange.length, self->_line);
}

- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  return -[_NSLineMetrics initWithAttributedString:range:line:](self, "initWithAttributedString:range:line:", a3, a4.location, a4.length, 0);
}

- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _NSLineMetrics *v10;
  _NSLineMetrics *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_NSLineMetrics;
  v10 = -[_NSLineMetrics init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[_NSLineMetrics setAttributedString:range:line:](v10, "setAttributedString:range:line:", v9, location, length, a5);

  return v11;
}

- (void)setAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5
{
  NSUInteger length;
  NSUInteger location;
  __CTLine *line;
  const __CFAttributedString *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  objc_storeStrong((id *)&self->_attributedString, a3);
  self->_lineRange.location = location;
  self->_lineRange.length = length;
  line = self->_line;
  if (line)
  {
    CFRelease(line);
    self->_line = 0;
  }
  if (a5)
  {
    self->_line = (__CTLine *)CFRetain(a5);
  }
  else
  {
    objc_msgSend(v12, "attributedSubstringFromRange:", location, length);
    v11 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    self->_line = CTLineCreateWithAttributedString(v11);

  }
  -[_NSLineMetrics _calculatePositions](self, "_calculatePositions");
  self->_terminalAdvancesValid = 0;
  self->_hasShaping = 0x7FFFFFFFFFFFFFFFLL;

}

- (void)dealloc
{
  __CTLine *line;
  double *positions;
  BOOL *hasAdvanceAdjustment;
  __CFArray *runsBuf;
  CGSize *advancesBuf;
  int64_t *stringIndicesBuf;
  double *initialAdvances;
  double *finalAdvances;
  __CFLocale *locale;
  objc_super v12;

  line = self->_line;
  if (line)
    CFRelease(line);
  positions = self->_positions;
  if (positions)
    free(positions);
  hasAdvanceAdjustment = self->_hasAdvanceAdjustment;
  if (hasAdvanceAdjustment)
    free(hasAdvanceAdjustment);
  runsBuf = self->_runsBuf;
  if (runsBuf)
    CFRelease(runsBuf);
  advancesBuf = self->_advancesBuf;
  if (advancesBuf)
    free(advancesBuf);
  stringIndicesBuf = self->_stringIndicesBuf;
  if (stringIndicesBuf)
    free(stringIndicesBuf);
  initialAdvances = self->_initialAdvances;
  if (initialAdvances)
    free(initialAdvances);
  finalAdvances = self->_finalAdvances;
  if (finalAdvances)
    free(finalAdvances);
  locale = self->_locale;
  if (locale)
    CFRelease(locale);
  v12.receiver = self;
  v12.super_class = (Class)_NSLineMetrics;
  -[_NSLineMetrics dealloc](&v12, sel_dealloc);
}

- (void)_ensureGlyphCapacity:(unint64_t)a3
{
  unint64_t glyphCapacity;
  unint64_t v5;
  unint64_t v6;

  glyphCapacity = self->_glyphCapacity;
  if (glyphCapacity)
    v5 = self->_glyphCapacity;
  else
    v5 = 16;
  do
  {
    v6 = v5;
    v5 *= 2;
  }
  while (v6 < a3);
  if (v6 > glyphCapacity)
  {
    self->_glyphCapacity = v6;
    self->_advancesBuf = (CGSize *)malloc_type_realloc(self->_advancesBuf, 16 * v6, 0x1000040451B5BE8uLL);
    self->_stringIndicesBuf = (int64_t *)malloc_type_realloc(self->_stringIndicesBuf, 8 * self->_glyphCapacity, 0x100004000313F17uLL);
  }
}

- (void)_ensureTerminalAdvancesCapacity:(unint64_t)a3
{
  unint64_t terminalAdvancesCapacity;
  unint64_t v5;
  unint64_t v6;

  terminalAdvancesCapacity = self->_terminalAdvancesCapacity;
  if (terminalAdvancesCapacity)
    v5 = self->_terminalAdvancesCapacity;
  else
    v5 = 16;
  do
  {
    v6 = v5;
    v5 *= 2;
  }
  while (v6 < a3);
  if (v6 > terminalAdvancesCapacity)
  {
    self->_terminalAdvancesCapacity = v6;
    self->_initialAdvances = (double *)malloc_type_realloc(self->_initialAdvances, 8 * v6, 0x100004000313F17uLL);
    self->_finalAdvances = (double *)malloc_type_realloc(self->_finalAdvances, 8 * self->_terminalAdvancesCapacity, 0x100004000313F17uLL);
  }
}

- (BOOL)_hasShaping
{
  unint64_t hasShaping;
  __CFLocale *locale;
  void *v5;
  _QWORD v7[5];

  if (_hasShaping_once != -1)
    dispatch_once(&_hasShaping_once, &__block_literal_global_9);
  hasShaping = self->_hasShaping;
  if (hasShaping == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_hasShaping = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29___NSLineMetrics__hasShaping__block_invoke_2;
    v7[3] = &unk_1E2604348;
    v7[4] = self;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](self->_attributedString, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSParagraphStyle"), self->_lineRange.location, self->_lineRange.length, 0x100000, v7);
    hasShaping = self->_hasShaping;
    if (!hasShaping)
    {
      locale = self->_locale;
      if (locale)
      {
        v5 = (id)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
        if (v5 && objc_msgSend((id)_hasShaping_cjShapingLanguages, "containsObject:", v5))
          self->_hasShaping = 1;
      }
      else
      {
        v5 = 0;
      }

      hasShaping = self->_hasShaping;
    }
  }
  return hasShaping != 0;
}

- (double)_initialAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  NSUInteger location;
  NSUInteger v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  double result;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;

  if (_initialAdvanceForCharacterAtIndex_range__once != -1)
    dispatch_once(&_initialAdvanceForCharacterAtIndex_range__once, &__block_literal_global_14);
  location = self->_lineRange.location;
  v9 = a3 >= location;
  v8 = a3 - location;
  v9 = !v9 || v8 >= self->_lineRange.length;
  if (v9)
    -[_NSLineMetrics _initialAdvanceForCharacterAtIndex:range:].cold.1();
  -[NSAttributedString string](self->_attributedString, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterAtIndex:", a3);

  LODWORD(v10) = self->_hasAdvanceAdjustment[a3 - self->_lineRange.location];
  v12 = objc_msgSend((id)_initialAdvanceForCharacterAtIndex_range__openingMarkCharacterSet, "characterIsMember:", v11);
  if ((_DWORD)v10)
    v13 = 0;
  else
    v13 = v12 == 0;
  if (v13 || a3 + 1 == self->_lineRange.length + self->_lineRange.location)
    return NAN;
  -[NSAttributedString string](self->_attributedString, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rangeOfComposedCharacterSequenceAtIndex:", a3);
  v18 = v17;

  result = NAN;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = self->_lineRange.location;
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 <= v16)
    {
      if (v16 + v18 >= self->_lineRange.length + v19)
        return NAN;
      a4->location = v16;
      a4->length = v18;
      if (self->_terminalAdvancesValid)
      {
        return self->_initialAdvances[v16 - self->_lineRange.location];
      }
      else
      {
        -[NSAttributedString string](self->_attributedString, "string", NAN);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "rangeOfComposedCharacterSequenceAtIndex:", v16 + v18);
        v23 = v22;

        result = NAN;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = self->_lineRange.location;
          if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 <= v21)
          {
            result = NAN;
            if (v16 + v18 <= v21 && v21 + v23 <= self->_lineRange.length + v24)
            {
              -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:](self, "_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:", v16, v18, v21, v23, NAN);
              return self->_initialAdvances[v16 - self->_lineRange.location];
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)_finalAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  NSUInteger location;
  NSUInteger v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  NSUInteger v14;
  double result;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;

  if (_finalAdvanceForCharacterAtIndex_range__once != -1)
    dispatch_once(&_finalAdvanceForCharacterAtIndex_range__once, &__block_literal_global_19);
  location = self->_lineRange.location;
  v9 = a3 >= location;
  v8 = a3 - location;
  v9 = !v9 || v8 >= self->_lineRange.length;
  if (v9)
    -[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:].cold.2();
  -[NSAttributedString string](self->_attributedString, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterAtIndex:", a3);

  LODWORD(v10) = self->_hasAdvanceAdjustment[a3 - self->_lineRange.location];
  v12 = objc_msgSend((id)_finalAdvanceForCharacterAtIndex_range__closingMarkCharacterSet, "characterIsMember:", v11);
  if ((_DWORD)v10)
    v13 = 0;
  else
    v13 = v12 == 0;
  if (v13)
    return NAN;
  v14 = self->_lineRange.location;
  if (a3 < v14 || a3 - v14 >= self->_lineRange.length)
    -[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:].cold.1();
  if (a3 == v14)
    return NAN;
  -[NSAttributedString string](self->_attributedString, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", a3);
  v19 = v18;

  result = NAN;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = self->_lineRange.location;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 <= v17)
    {
      result = NAN;
      if (v17 != v20 && v17 + v19 <= self->_lineRange.length + v20)
      {
        a4->location = v17;
        a4->length = v19;
        if (self->_terminalAdvancesValid)
        {
          return self->_finalAdvances[v17 - self->_lineRange.location];
        }
        else
        {
          -[NSAttributedString string](self->_attributedString, "string", NAN);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "rangeOfComposedCharacterSequenceAtIndex:", v17 - 1);
          v24 = v23;

          result = NAN;
          if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v25 = self->_lineRange.location;
            if (v25 != 0x7FFFFFFFFFFFFFFFLL && v25 <= v22)
            {
              result = NAN;
              if (v22 + v24 <= self->_lineRange.length + v25 && v22 + v24 <= v17)
              {
                -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:](self, "_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:", v22, v24, v17, v19, NAN);
                return self->_finalAdvances[v17 - self->_lineRange.location];
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)_getInitialAdvanceForComposedCharacterInRange:(_NSRange)a3 andFinalAdvanceForComposedCharacterInRange:(_NSRange)a4
{
  NSUInteger location;
  BOOL v6;
  NSUInteger v7;
  NSUInteger v8;
  double *initialAdvances;
  NSUInteger length;
  double *finalAdvances;
  NSUInteger v14;
  _QWORD __pattern8[33];

  __pattern8[32] = *MEMORY[0x1E0C80C00];
  location = self->_lineRange.location;
  v6 = a3.location == 0x7FFFFFFFFFFFFFFFLL || location == 0x7FFFFFFFFFFFFFFFLL || location > a3.location;
  v7 = a3.location + a3.length;
  v8 = self->_lineRange.length + location;
  if (v6 || v7 > v8)
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:].cold.1();
  if (a4.location == 0x7FFFFFFFFFFFFFFFLL || location > a4.location || a4.location + a4.length > v8)
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:].cold.2();
  if (v7 > a4.location)
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:].cold.3();
  -[_NSLineMetrics _ensureTerminalAdvancesCapacity:](self, "_ensureTerminalAdvancesCapacity:");
  if (!self->_terminalAdvancesValid)
  {
    initialAdvances = self->_initialAdvances;
    length = self->_lineRange.length;
    __pattern8[0] = 0x7FF8000000000000;
    memset_pattern8(initialAdvances, __pattern8, 8 * length);
    finalAdvances = self->_finalAdvances;
    v14 = self->_lineRange.length;
    __pattern8[0] = 0x7FF8000000000000;
    memset_pattern8(finalAdvances, __pattern8, 8 * v14);
    self->_terminalAdvancesValid = 1;
  }
}

- (double)widthOfSubstringWithRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  double v7;
  double v8;
  double v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
    -[_NSLineMetrics widthOfSubstringWithRange:].cold.1();
  location = a3.location;
  v5 = self->_lineRange.location;
  if (a3.location < v5)
    -[_NSLineMetrics widthOfSubstringWithRange:].cold.2();
  v6 = a3.location + a3.length;
  if (a3.location + a3.length > self->_lineRange.length + v5)
    -[_NSLineMetrics widthOfSubstringWithRange:].cold.3();
  if (!a3.length)
    return 0.0;
  v7 = self->_positions[v6 - v5] - self->_positions[a3.location - v5];
  if (a3.length != 1 && -[_NSLineMetrics _hasShaping](self, "_hasShaping"))
  {
    v13 = 0;
    v14 = 0;
    v11 = 0;
    v12 = 0;
    -[_NSLineMetrics _initialAdvanceForCharacterAtIndex:range:](self, "_initialAdvanceForCharacterAtIndex:range:", location, &v13);
    if (v13 == location)
      v7 = v7
         + v8
         - (self->_positions[v14 + location - self->_lineRange.location]
          - self->_positions[location - self->_lineRange.location]);
    -[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:](self, "_finalAdvanceForCharacterAtIndex:range:", v6 - 1, &v11);
    if (v12 + v11 == v6)
      return v7
           + v9
           - (self->_positions[v6 - self->_lineRange.location]
            - self->_positions[v11 - self->_lineRange.location]);
  }
  return v7;
}

- (double)widthOfSubstringToIndex:(unint64_t)a3
{
  NSUInteger location;
  double result;

  location = self->_lineRange.location;
  if (a3 < location || self->_lineRange.length + location < a3)
    -[_NSLineMetrics widthOfSubstringToIndex:].cold.1();
  -[_NSLineMetrics widthOfSubstringWithRange:](self, "widthOfSubstringWithRange:");
  return result;
}

- (unint64_t)suggestedLineBreakAfterIndex:(unint64_t)a3 withWidth:(double)a4
{
  NSUInteger location;
  uint64_t v6;

  location = self->_lineRange.location;
  if (location > a3 || self->_lineRange.length + location < a3)
    -[_NSLineMetrics suggestedLineBreakAfterIndex:withWidth:].cold.1();
  CTLineGetStringRange(self->_line);
  v6 = CTLineSuggestClusterBreakWithOffset();
  if (v6 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v6 + a3;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)lineRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_lineRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (__CTLine)line
{
  return self->_line;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (void)_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:]", "NSLineMetrics.m", 87, "range.length + 1 <= capacity && \"positions buffer isn't big enough for requested line range\");
}

- (void)_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:.cold.2()
{
  __assert_rtn("-[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:]", "NSLineMetrics.m", 88, "!_isInCalculatePositions && \"_calculatePositions:forAttributedString:range:line: is not reentrant\");
}

- (void)_initialAdvanceForCharacterAtIndex:range:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics _initialAdvanceForCharacterAtIndex:range:]", "NSLineMetrics.m", 317, "NSLocationInRange(index, _lineRange)");
}

- (void)_finalAdvanceForCharacterAtIndex:range:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:]", "NSLineMetrics.m", 368, "NSLocationInRange(index, _lineRange)");
}

- (void)_finalAdvanceForCharacterAtIndex:range:.cold.2()
{
  __assert_rtn("-[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:]", "NSLineMetrics.m", 360, "NSLocationInRange(index, _lineRange)");
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]", "NSLineMetrics.m", 390, "isSubrange(c0, _lineRange)");
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.2()
{
  __assert_rtn("-[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]", "NSLineMetrics.m", 391, "isSubrange(c1, _lineRange)");
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.3()
{
  __assert_rtn("-[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]", "NSLineMetrics.m", 392, "NSMaxRange(c0) <= c1.location");
}

- (void)widthOfSubstringWithRange:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 417, "range.location != NSNotFound");
}

- (void)widthOfSubstringWithRange:.cold.2()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 418, "_lineRange.location <= range.location");
}

- (void)widthOfSubstringWithRange:.cold.3()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 419, "NSMaxRange(range) <= NSMaxRange(_lineRange)");
}

- (void)widthOfSubstringWithRange:.cold.4()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 421, "!isnan(_positions[range.location - _lineRange.location])");
}

- (void)widthOfSubstringWithRange:.cold.5()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 420, "!isnan(_positions[NSMaxRange(range) - _lineRange.location])");
}

- (void)widthOfSubstringToIndex:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringToIndex:]", "NSLineMetrics.m", 463, "_lineRange.location <= index && index <= NSMaxRange(_lineRange)");
}

- (void)suggestedLineBreakAfterIndex:withWidth:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics suggestedLineBreakAfterIndex:withWidth:]", "NSLineMetrics.m", 468, "_lineRange.location <= index && index <= NSMaxRange(_lineRange)");
}

@end
