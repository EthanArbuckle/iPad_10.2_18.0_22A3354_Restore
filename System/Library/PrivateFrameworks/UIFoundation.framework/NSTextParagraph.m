@implementation NSTextParagraph

- (void)setParagraphContentRange:(id)a3
{
  NSTextRange *paragraphContentRange;

  objc_sync_enter(self);
  paragraphContentRange = self->_paragraphContentRange;
  if (paragraphContentRange != a3)
  {

    self->_paragraphContentRange = (NSTextRange *)a3;
  }
  objc_sync_exit(self);
}

- (void)setIsEndOfParagraph:(BOOL)a3
{
  self->_isEndOfParagraph = a3;
}

- (void)setIsBeginningOfParagraph:(BOOL)a3
{
  self->_isBeginningOfParagraph = a3;
}

- (void)_setContainsTextAttachments:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;

  v3 = a3;
  objc_sync_enter(self);
  if (v3)
    v5 = 2;
  else
    v5 = 1;
  self->_containsTextAttachments = v5;
  objc_sync_exit(self);
}

- (NSTextParagraph)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSTextParagraph *v7;

  length = a4.length;
  location = a4.location;
  v7 = -[NSTextParagraph initWithAttributedString:](self, "initWithAttributedString:", 0);
  if (v7)
  {
    v7->_attributedString = (NSAttributedString *)a3;
    v7->_range.location = location;
    v7->_range.length = length;
  }
  return v7;
}

- (int64_t)_resolvedBaseWritingDirectionWithFallbackDirection:(int64_t)a3
{
  int64_t result;
  int64_t fallbackBaseDirection;
  uint64_t v8;
  NSAttributedString *attributedString;
  NSUInteger location;
  uint64_t length;
  NSDictionary *attributes;
  NSParagraphStyle *v13;
  unsigned __int8 *v14;
  void *v15;

  result = self->_resolvedBaseDirection;
  fallbackBaseDirection = self->_fallbackBaseDirection;
  if ((fallbackBaseDirection == a3 || fallbackBaseDirection == -1) && result != -1)
    return result;
  v8 = a3;
  attributedString = self->_attributedString;
  if (!attributedString)
    attributedString = -[NSTextParagraph attributedString](self, "attributedString");
  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    length = -[NSAttributedString length](attributedString, "length");
    location = 0;
  }
  else
  {
    length = self->_range.length;
  }
  attributes = self->_attributes;
  if (attributes)
  {
LABEL_15:
    v13 = -[NSDictionary objectForKeyedSubscript:](attributes, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
    if (v13)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (!-[NSAttributedString length](attributedString, "length"))
  {
    attributes = self->_attributes;
    goto LABEL_15;
  }
  v13 = -[NSAttributedString attribute:atIndex:effectiveRange:](attributedString, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), location, 0);
  if (!v13)
LABEL_16:
    v13 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
LABEL_17:
  result = -[NSParagraphStyle baseWritingDirection](v13, "baseWritingDirection");
  self->_resolvedBaseDirection = result;
  if (result == -1)
  {
    if (length)
    {
      v14 = (unsigned __int8 *)NSZoneMalloc(0, length);
      v15 = NSZoneMalloc(0, length);
      memset(v14, v8, length);
      CFAttributedStringGetBidiLevelsAndResolvedDirections();
      if (v14)
      {
        v8 = *v14;
        NSZoneFree(0, v14);
        NSZoneFree(0, v15);
      }
      else
      {
        v8 = -1;
      }
    }
    self->_resolvedBaseDirection = v8;
    return v8;
  }
  else
  {
    self->_fallbackBaseDirection = -1;
  }
  return result;
}

- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  NSUInteger v8;
  __int128 v9;
  _NSRange result;

  v9 = xmmword_18D6CBB80;
  if (a3
    && ((v4 = a4,
         -[NSTextRange containsLocation:](-[NSTextElement elementRange](self, "elementRange"), "containsLocation:", a3))
     || v4
     && objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", a3)))
  {
    -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](self, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextElement textContentManager](self, "textContentManager", v9), "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"), a3), 0, &v9);
    v8 = *((_QWORD *)&v9 + 1);
    v7 = v9;
  }
  else
  {
    v8 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v11;
  void *v12;
  id v13;
  NSRange v14;

  p_range = &self->_range;
  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    length = -[NSAttributedString length](-[NSTextParagraph attributedString](self, "attributedString", a3, a4), "length");
    v11 = 0;
  }
  else
  {
    length = self->_range.length;
    v11 = self->_range.location;
  }
  if (length < a3)
    return 0;
  v13 = -[NSTextContentManager locationFromLocation:withOffset:](-[NSTextElement textContentManager](self, "textContentManager"), "locationFromLocation:withOffset:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"), a3);
  v12 = v13;
  if (a5 && v13)
  {
    if (length <= a3)
    {
      v14.length = 0;
      v14.location = v11 + a3;
    }
    else
    {
      v14.location = -[NSString rangeOfComposedCharacterSequenceAtIndex:](-[NSAttributedString string](self->_attributedString, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v11 + a3);
      if (location != 0x7FFFFFFFFFFFFFFFLL)
        v14 = NSIntersectionRange(v14, *p_range);
    }
    a5->location = v14.location - v11;
    a5->length = v14.length;
  }
  return v12;
}

- (void)setElementRange:(id)a3
{
  NSUInteger v5;
  objc_super v6;

  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)NSTextParagraph;
  -[NSTextElement setElementRange:](&v6, sel_setElementRange_, a3);
  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_range.location = -[NSTextRange range](-[NSTextElement elementRange](self, "elementRange"), "range");
    self->_range.length = v5;
  }
  objc_sync_exit(self);
}

- (NSTextParagraph)initWithAttributedString:(NSAttributedString *)attributedString
{
  NSTextParagraph *v4;
  NSTextParagraph *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextParagraph;
  v4 = -[NSTextElement initWithTextContentManager:](&v7, sel_initWithTextContentManager_, 0);
  v5 = v4;
  if (v4)
  {
    -[NSTextElement setCoalescingType:](v4, "setCoalescingType:", 3);
    -[NSTextParagraph setAttributedString:](v5, "setAttributedString:", attributedString);
    v5->_range = (_NSRange)xmmword_18D6CBB80;
    v5->_resolvedBaseDirection = -1;
    v5->_fallbackBaseDirection = 0;
    v5->_isEndOfParagraph = 1;
    v5->_isBeginningOfParagraph = 1;
  }
  return v5;
}

- (void)setAttributedString:(id)a3
{
  if (self->_attributedString != a3)
  {
    objc_sync_enter(self);

    self->_attributedString = (NSAttributedString *)objc_msgSend(a3, "copy");
    self->_range = (_NSRange)xmmword_18D6CBB80;
    objc_sync_exit(self);
  }
}

- (NSTextParagraph)initWithString:(id)a3 attributes:(id)a4
{
  void *v6;
  NSTextParagraph *v7;
  NSTextParagraph *v8;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", a3, a4);
  v7 = -[NSTextParagraph initWithAttributedString:](self, "initWithAttributedString:", v6);
  v8 = v7;
  if (v7)
    -[NSTextParagraph setAttributes:](v7, "setAttributes:", a4);

  return v8;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSAttributedString)attributedString
{
  _NSRange *p_range;
  NSUInteger location;
  NSAttributedString *attributedString;

  p_range = &self->_range;
  location = self->_range.location;
  attributedString = self->_attributedString;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return attributedString;
  else
    return -[NSAttributedString attributedSubstringFromRange:](attributedString, "attributedSubstringFromRange:", location, p_range->length);
}

- (BOOL)isEndOfParagraph
{
  return self->_isEndOfParagraph;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  _NSRange *p_range;
  NSUInteger location;
  NSAttributedString *attributedString;
  int64_t length;
  NSUInteger v13;
  NSDictionary *v14;
  int v15;
  double v16;
  double v17;
  id v18;
  double MaxX;
  uint64_t v20;
  double v21;
  double v22;
  CGSize advances;
  CGGlyph glyphs;
  UniChar characters;
  double v26;
  CGSize result;
  CGRect v28;

  v5 = objc_msgSend(a3, "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v5)
    goto LABEL_28;
  v8 = (void *)v5;
  p_range = &self->_range;
  location = self->_range.location;
  attributedString = self->_attributedString;
  if (!attributedString)
    attributedString = -[NSTextParagraph attributedString](self, "attributedString");
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = self->_range.length;
    if (length > 0)
    {
      v13 = p_range->location;
      goto LABEL_9;
    }
LABEL_10:
    v14 = (NSDictionary *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textSelections"), "firstObject"), "typingAttributes");
    v15 = 0;
    goto LABEL_11;
  }
  length = -[NSAttributedString length](attributedString, "length");
  if (length <= 0)
    goto LABEL_10;
  v13 = 0;
LABEL_9:
  v14 = -[NSAttributedString attributesAtIndex:effectiveRange:](attributedString, "attributesAtIndex:effectiveRange:", v13, 0);
  v15 = 1;
LABEL_11:
  objc_msgSend(v8, "size");
  v17 = v16;
  v26 = 0.0;
  +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", v14, +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior"), objc_msgSend(a3, "usesFontLeading"), 1, 0, 0, objc_msgSend(v8, "layoutOrientation"), &v26, 0, 0);
  if ((objc_msgSend(a3, "allowsFontSubstitutionAffectingVerticalMetrics") & 1) == 0
    && (v18 = -[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("NSOriginalFont"))) != 0
    || (v18 = -[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("NSFont"))) != 0)
  {
    if (!v15)
      goto LABEL_28;
  }
  else
  {
    v18 = (id)NSDefaultFont();
    if (!v15)
      goto LABEL_28;
  }
  if ((CTFontGetSymbolicTraits((CTFontRef)v18) & 0x400) != 0
    || (characters = 109, glyphs = 0, !CTFontGetGlyphsForCharacters((CTFontRef)v18, &characters, &glyphs, 1))
    || (advances.width = 0.0,
        advances.height = 0.0,
        CTFontGetAdvancesForGlyphs((CTFontRef)v18, kCTFontOrientationDefault, &glyphs, &advances, 1),
        MaxX = advances.width * 0.5,
        advances.width * 0.5 <= 0.0))
  {
    objc_msgSend(v18, "boundingRectForFont");
    MaxX = CGRectGetMaxX(v28);
  }
  v20 = 0;
  v6 = MaxX * (double)length;
  if (v17 > 0.0 && v17 < 10000000.0 && v6 >= v17)
  {
    v20 = vcvtpd_s64_f64(v6 / v17);
    v6 = v17;
  }
  if (v20 <= 1)
    v20 = 1;
  v7 = v26 * (double)v20;
LABEL_28:
  v21 = v6;
  v22 = v7;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)setParagraphSeparatorRange:(id)a3
{
  unsigned __int8 v5;
  NSTextRange *paragraphSeparatorRange;
  uint64_t v7;
  NSAttributedString *attributedString;
  NSString *v9;
  NSString *v10;
  NSUInteger location;
  uint64_t v12;
  int v13;
  char v14;

  objc_sync_enter(self);
  if (self->_paragraphSeparatorRange != a3)
  {
    v5 = -[NSTextElement coalescingType](self, "coalescingType");
    paragraphSeparatorRange = self->_paragraphSeparatorRange;

    v7 = v5 & 0xF;
    self->_paragraphSeparatorRange = (NSTextRange *)a3;
    if (!paragraphSeparatorRange)
    {
      if (objc_msgSend(a3, "isEmpty"))
      {
        v7 = v5 & 0xD | 2u;
      }
      else
      {
        attributedString = self->_attributedString;
        if (attributedString)
          v9 = -[NSAttributedString string](attributedString, "string");
        else
          v9 = -[NSAttributedString string](-[NSTextParagraph attributedString](self, "attributedString"), "string");
        v10 = v9;
        location = self->_range.location;
        if (location == 0x7FFFFFFFFFFFFFFFLL)
          v12 = -[NSString length](v9, "length");
        else
          v12 = self->_range.length + location;
        v13 = -[NSString characterAtIndex:](v10, "characterAtIndex:", v12 - 1);
        v14 = v5 | 4;
        if (v13 != 13)
          v14 = v5;
        v7 = v14 & 0xD;
      }
    }
    -[NSTextElement setCoalescingType:](self, "setCoalescingType:", v7);
  }
  objc_sync_exit(self);
}

uint64_t __65__NSTextParagraph_enumerateSubstringsInRange_options_usingBlock___block_invoke(uint64_t a1, int a2, NSRange range1, NSUInteger a4, NSUInteger a5)
{
  NSUInteger length;
  NSUInteger location;
  NSRange v11;
  NSRange v12;
  NSRange v13;

  length = range1.length;
  location = range1.location;
  v13 = *(NSRange *)(a1 + 40);
  v11.location = location;
  v11.length = length;
  NSIntersectionRange(v11, v13);
  v12.location = a4;
  v12.length = a5;
  NSIntersectionRange(v12, *(NSRange *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSMapTable *textElementLocationTable;
  NSEnumerator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];

  textElementLocationTable = self->_textElementLocationTable;
  self->_textElementLocationTable = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSMapTable objectEnumerator](textElementLocationTable, "objectEnumerator");
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setTextElement:", 0);
      }
      while (v6 != v8);
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)NSTextParagraph;
  -[NSTextElement dealloc](&v9, sel_dealloc);
}

- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSTextRange *v9;
  NSTextRange *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];

  v9 = -[NSTextParagraph paragraphContentRange](self, "paragraphContentRange");
  v10 = -[NSTextParagraph paragraphSeparatorRange](self, "paragraphSeparatorRange");
  v11 = -[NSTextRange location](v9, "location");
  v12 = -[NSTextRange endLocation](v10, "endLocation");
  if (objc_msgSend(a3, "compare:", v11) != -1)
  {
    v13 = objc_msgSend(a3, "compare:", v12);
    v14 = (a4 & 0x100) != 0 ? v11 : a3;
    v15 = (a4 & 0x100) != 0 ? a3 : v12;
    if (v13 == -1)
    {
      v11 = v14;
      v12 = v15;
    }
  }
  v16 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](self, "rangeForLocation:allowsTrailingEdge:", v11, 0);
  v17 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](self, "rangeForLocation:allowsTrailingEdge:", v12, 1);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__NSTextParagraph_enumerateSubstringsFromLocation_options_usingBlock___block_invoke;
    v18[3] = &unk_1E2604990;
    v18[4] = self;
    v18[5] = a5;
    -[NSTextParagraph enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", v16, v17 - v16, a4, v18);
  }
}

- (NSTextRange)paragraphContentRange
{
  NSTextRange *v3;

  objc_sync_enter(self);
  v3 = self->_paragraphContentRange;
  objc_sync_exit(self);
  return v3;
}

- (NSTextRange)paragraphSeparatorRange
{
  NSTextRange *v3;

  objc_sync_enter(self);
  v3 = self->_paragraphSeparatorRange;
  objc_sync_exit(self);
  return v3;
}

- (void)enumerateSubstringsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  NSUInteger v10;

  length = a3.length;
  location = a3.location;
  v9 = -[NSAttributedString string](self->_attributedString, "string");
  v10 = self->_range.location;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](v9, "enumerateSubstringsInRange:options:usingBlock:", MEMORY[0x1E0C809B0], 3221225472, __65__NSTextParagraph_enumerateSubstringsInRange_options_usingBlock___block_invoke, &unk_1E2604968, a5, v10 + location, length, v10);
}

void __70__NSTextParagraph_enumerateSubstringsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSTextRange *v11;
  NSTextRange *v12;
  NSTextRange *v13;

  v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 0, 0), objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3 + a4, 0, 0));
  if (a3 != a5 || (v12 = 0, a4 != a6))
    v12 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a5, 0, 0), objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a5 + a6, 0, 0));
  v13 = v12;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)locationForCharacterIndex:(int64_t)a3 actualRange:(_NSRange *)a4
{
  return -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](self, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3, 1, a4);
}

- (BOOL)isBeginningOfParagraph
{
  return self->_isBeginningOfParagraph;
}

- (id)description
{
  NSAttributedString *attributedString;
  uint64_t v4;

  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL || (attributedString = self->_attributedString) == 0)
    attributedString = -[NSTextParagraph attributedString](self, "attributedString");
  v4 = -[NSAttributedString string](attributedString, "string");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p \"%@\">"), objc_opt_class(), self, v4);
}

+ (id)textParagraphsForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  NSRange v21;

  length = a4.length;
  location = a4.location;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v9 = (void *)objc_msgSend(a3, "string");
  if (location + length > objc_msgSend(a3, "length"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21.location = location;
    v21.length = length;
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSTextElement.m"), 262, CFSTR("Out-of-bounds range specified %@"), NSStringFromRange(v21));
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__NSTextParagraph_textParagraphsForAttributedString_range___block_invoke;
  v14[3] = &unk_1E2604940;
  v14[4] = a3;
  v14[5] = &v15;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", location, length, 513, v14);
  v10 = (void *)v16[5];
  if (v10)
    v11 = v10;
  else
    v11 = (id)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __59__NSTextParagraph_textParagraphsForAttributedString_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSTextParagraph *v7;
  void *v8;
  id v9;
  NSTextParagraph *v10;

  v7 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a5, a6));
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = v7;
  if (!v8)
  {
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = v10;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v9;
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  objc_msgSend(v8, "addObject:", v7);

}

- (NSTextParagraph)initWithTextContentManager:(id)a3
{
  NSTextParagraph *v4;
  NSTextParagraph *v5;

  v4 = -[NSTextParagraph initWithAttributedString:](self, "initWithAttributedString:", 0);
  v5 = v4;
  if (v4)
    -[NSTextElement setTextContentManager:](v4, "setTextContentManager:", a3);
  return v5;
}

- (NSTextParagraph)init
{
  return -[NSTextParagraph initWithAttributedString:](self, "initWithAttributedString:", 0);
}

- (id)_textElementLocationForCharacterIndex:(unint64_t)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[NSMapTable objectForKey:](self->_textElementLocationTable, "objectForKey:", a3 + 1);
  objc_sync_exit(self);
  return v5;
}

- (void)_setElementTextLocation:(id)a3 forCharacterIndex:(unint64_t)a4
{
  NSMapTable *textElementLocationTable;

  objc_sync_enter(self);
  textElementLocationTable = self->_textElementLocationTable;
  if (!textElementLocationTable)
  {
    textElementLocationTable = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 512, 0);
    self->_textElementLocationTable = textElementLocationTable;
  }
  -[NSMapTable setObject:forKey:](textElementLocationTable, "setObject:forKey:", a3, a4 + 1);
  objc_sync_exit(self);
}

- (void)synchronizeDocumentRange
{
  NSUInteger v3;
  NSMapTable *textElementLocationTable;
  NSEnumerator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_range.location = -[NSTextRange range](-[NSTextElement elementRange](self, "elementRange"), "range");
    self->_range.length = v3;
  }
  textElementLocationTable = self->_textElementLocationTable;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[NSMapTable objectEnumerator](textElementLocationTable, "objectEnumerator", 0);
  v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "updateBaseLocation");
      }
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  objc_sync_exit(self);
}

- (NSTextParagraph)initWithTextAttachment:(id)a3 attributes:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableParagraphStyle *v13;
  NSMutableParagraphStyle *v14;
  void *v15;
  NSTextParagraph *v16;

  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  if (objc_msgSend(a3, "embeddingType") == 1)
  {
    v8 = objc_msgSend(a3, "standaloneAlignment");
    if (v8 != 3)
    {
      v9 = v8;
      v10 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
      if (v9 == 1)
        v11 = 1;
      else
        v11 = 2 * (v9 == 2);
      if (v10)
      {
        v12 = v10;
        if (objc_msgSend(v10, "alignment") == v11)
          goto LABEL_12;
        v13 = (NSMutableParagraphStyle *)objc_msgSend(v12, "mutableCopy");
      }
      else
      {
        if (-[NSParagraphStyle alignment](+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"), "alignment") == v11)goto LABEL_12;
        v13 = objc_alloc_init(NSMutableParagraphStyle);
      }
      v14 = v13;
      -[NSMutableParagraphStyle setAlignment:](v13, "setAlignment:", v11);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("NSParagraphStyle"));

    }
  }
LABEL_12:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttachment:attributes:", a3, v7);
  v16 = -[NSTextParagraph initWithAttributedString:](self, "initWithAttributedString:", v15);
  if (objc_msgSend(a3, "embeddingType") == 1)
    -[NSTextElement setCoalescingType:](v16, "setCoalescingType:", 0);

  return v16;
}

- (BOOL)_containsTextAttachments
{
  int containsTextAttachments;
  NSAttributedString *attributedString;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  BOOL v8;
  NSUInteger v10;
  uint64_t v11;

  objc_sync_enter(self);
  containsTextAttachments = self->_containsTextAttachments;
  if (!self->_containsTextAttachments)
  {
    attributedString = self->_attributedString;
    if (!attributedString)
      attributedString = -[NSTextParagraph attributedString](self, "attributedString");
    location = self->_range.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      length = -[NSAttributedString length](attributedString, "length");
      location = 0;
    }
    else
    {
      length = self->_range.length;
    }
    v10 = location;
    v11 = 0;
    v7 = length + location;
    if (location < length + location)
    {
      while (!-[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](attributedString, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), location, &v10, location, v7 - location))
      {
        location = v11 + v10;
        v10 = location;
        if (location >= v7)
          goto LABEL_12;
      }
      self->_containsTextAttachments = 2;
    }
LABEL_12:
    containsTextAttachments = self->_containsTextAttachments;
  }
  v8 = containsTextAttachments != 1;
  objc_sync_exit(self);
  return v8;
}

- (id)paragraphRange
{
  NSTextRange *paragraphContentRange;
  NSTextRange *v4;
  NSTextRange *v5;

  objc_sync_enter(self);
  paragraphContentRange = self->_paragraphContentRange;
  if (self->_paragraphSeparatorRange)
    v4 = -[NSTextRange textRangeByFormingUnionWithTextRange:](paragraphContentRange, "textRangeByFormingUnionWithTextRange:");
  else
    v4 = paragraphContentRange;
  v5 = v4;
  objc_sync_exit(self);
  return v5;
}

@end
