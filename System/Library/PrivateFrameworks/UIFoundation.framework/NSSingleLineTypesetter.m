@implementation NSSingleLineTypesetter

+ (BOOL)_validateAttributes:(id)a3 measuringOnly:(BOOL)a4
{
  BOOL v4;
  CFIndex Count;
  CFIndex v7;
  const void **v8;
  const void **v9;
  const void *v10;
  _OWORD v12[20];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
    return 1;
  memset(v12, 0, sizeof(v12));
  Count = CFDictionaryGetCount((CFDictionaryRef)a3);
  if (Count > 40)
    return 0;
  v7 = Count;
  v8 = (const void **)v12;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)a3, (const void **)v12, 0);
  v9 = (const void **)v12 + v7;
  do
  {
    v4 = v8 >= v9;
    if (v8 >= v9)
      break;
    v10 = *v8++;
  }
  while (!CFSetContainsValue((CFSetRef)__NSUnrecognizedAttributes, v10));
  return v4;
}

- (id)attributedString
{
  return self->super.attributedString;
}

- (id)substituteFontForFont:(id)a3
{
  if ((*(_BYTE *)&self->_slFlags & 1) != 0)
    return (id)objc_msgSend(a3, "screenFontWithRenderingMode:", 0);
  else
    return a3;
}

- (void)getLineFragmentRect:(CGRect *)a3 usedRect:(CGRect *)a4 remainingRect:(CGRect *)a5 forStartingGlyphAtIndex:(unint64_t)a6 proposedRect:(CGRect)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 paragraphSpacingAfter:(double)a10
{
  double lineWidth;
  CGSize v12;

  lineWidth = self->_lineWidth;
  if (lineWidth < a7.size.width && lineWidth > 0.0)
    a7.size.width = self->_lineWidth;
  if (a3)
  {
    a3->origin.x = a7.origin.x;
    a3->origin.y = a7.origin.y;
    a3->size.width = a7.size.width;
    a3->size.height = a8 + a9 + a10 + a7.size.height;
  }
  if (a4)
  {
    a4->origin.x = a7.origin.x;
    a4->origin.y = a7.origin.y + a9;
    a4->size.width = a7.size.width;
    a4->size.height = a9 + a10 + a7.size.height;
  }
  if (a5)
  {
    v12 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
    a5->origin = (CGPoint)*MEMORY[0x1E0CB3438];
    a5->size = v12;
  }
}

+ (void)performWithSingleLineTypesetterContext:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  os_unfair_lock_lock_with_options();
  v5 = __NSSingleLineTypesetterCacheNextIndex;
  if (__NSSingleLineTypesetterCacheNextIndex)
  {
    --__NSSingleLineTypesetterCacheNextIndex;
    v8 = (id)__NSSingleLineTypesetterCache[v5 - 1];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSSingleLineTypesetterLock);
    v6 = (uint64_t)v8;
    if (v8)
      goto LABEL_6;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSSingleLineTypesetterLock);
  }
  v6 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
LABEL_6:
  v9 = (id)v6;
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_lock_with_options();
  v7 = __NSSingleLineTypesetterCacheNextIndex;
  if (__NSSingleLineTypesetterCacheNextIndex > 4)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSSingleLineTypesetterLock);

  }
  else
  {
    ++__NSSingleLineTypesetterCacheNextIndex;
    __NSSingleLineTypesetterCache[v7] = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSSingleLineTypesetterLock);
  }
}

- (NSSingleLineTypesetter)init
{
  NSSingleLineTypesetter *v2;
  NSSingleLineTypesetter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSingleLineTypesetter;
  v2 = -[NSATSTypesetter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSTypesetter setUsesFontLeading:](v2, "setUsesFontLeading:", 0);
    -[NSATSTypesetter _setBaselineRenderingMode:](v3, "_setBaselineRenderingMode:", 1);
    -[NSTypesetter _setForceOriginalFontBaseline:](v3, "_setForceOriginalFontBaseline:", 1);
  }
  return v3;
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v17;
  NSUInteger v18;
  id result;
  _QWORD *v20;
  int v21;
  int v22;
  int v23;
  _QWORD *v24;
  int64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  __int128 v28;
  id v29;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  length = a3.length;
  location = a3.location;
  v29 = 0;
  v28 = *MEMORY[0x1E0CB3430];
  v17 = -[NSAttributedString length](self->super.attributedString, "length");
  if (length || (v18 = v17, result = 0, location <= v18))
  {
    self->_lineWidth = a9;
    self->_slFlags = ($0C8DD4A126019293B142AD28B7DE2D96)(*(_DWORD *)&self->_slFlags & 0xFFFFFFFE | v11);
    -[NSTypesetter setTypesetterBehavior:](self, "setTypesetterBehavior:", a4);
    -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](self, "setParagraphGlyphRange:separatorGlyphRange:", location, length, location + length, 0);
    -[NSATSTypesetter beginParagraph](self, "beginParagraph");
    v26 = location;
    v27 = location;
    v20 = self->super._private;
    if (!v20)
    {
      v20 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSSingleLineTypesetter zone](self, "zone", v26, v27)), self);
      self->super._private = v20;
    }
    if (v10)
      v21 = 0x8000;
    else
      v21 = 0;
    *(_DWORD *)(v20[5] + 216) = *(_DWORD *)(v20[5] + 216) & 0xFFFF7FFF | v21;
    if (a8)
      v22 = 4;
    else
      v22 = 0;
    if (v9)
      v23 = 2;
    else
      v23 = 0;
    self->_slFlags = ($0C8DD4A126019293B142AD28B7DE2D96)(v22 | v23 | *(_DWORD *)&self->_slFlags & 0xFFFFFFF9);
    -[NSATSTypesetter _layoutLineFragmentStartingWithGlyphAtIndex:characterIndex:atPoint:renderingContext:](self, "_layoutLineFragmentStartingWithGlyphAtIndex:characterIndex:atPoint:renderingContext:", &v27, &v26, &v28, &v29);
    v24 = self->super._private;
    if (!v24)
    {
      v24 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", -[NSSingleLineTypesetter zone](self, "zone")), self);
      self->super._private = v24;
    }
    objc_msgSend(v29, "setResolvedTextAlignment:", ((unint64_t)*(unsigned int *)(v24[5] + 216) >> 7) & 0xF, v26, v27);
    v25 = -[NSATSTypesetter _baseWritingDirection](self, "_baseWritingDirection");
    objc_msgSend(v29, "setResolvedBaseWritingDirection:", v25);
    -[NSATSTypesetter endParagraph](self, "endParagraph");
    -[NSATSTypesetter _flushCachedObjects](self, "_flushCachedObjects");

    self->_textStorage = 0;
    return v29;
  }
  return result;
}

- (BOOL)synchronizesAlignmentToDirection
{
  return (*(_BYTE *)&self->_slFlags >> 1) & 1;
}

- (BOOL)_mirrorsTextAlignment
{
  return (*(_BYTE *)&self->_slFlags >> 2) & 1;
}

- (BOOL)_usesScreenFonts
{
  return *(_DWORD *)&self->_slFlags & 1;
}

- (id)_textStorageForAttachmentProtocol
{
  return self->_textStorage;
}

- (_NSRange)characterRangeForGlyphRange:(_NSRange)a3 actualGlyphRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  uint64_t v12;

  length = a3.length;
  location = a3.location;
  self->_currentBufferRange = a3;
  self->_glyphs = a4;
  self->_props = a5;
  self->_charIndexes = a6;
  if (a7)
    bzero(a7, a3.length);
  objc_msgSend(+[NSGlyphGenerator defaultGlyphGenerator](NSGlyphGenerator, "defaultGlyphGenerator", location, location), "generateGlyphsForGlyphStorage:desiredNumberOfCharacters:glyphIndex:characterIndex:", self, length, &v12, &v11);
  self->_glyphs = 0;
  self->_props = 0;
  self->_charIndexes = 0;
  return length;
}

- (void)setGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger v11;
  unsigned __int16 *glyphs;
  int64_t *props;
  unint64_t *charIndexes;

  length = a7.length;
  v11 = a7.location - self->_currentBufferRange.location;
  if (a3)
  {
    glyphs = self->_glyphs;
    if (glyphs)
      memcpy(&glyphs[v11], a3, 2 * a7.length);
  }
  if (a4)
  {
    props = self->_props;
    if (props)
      memcpy(&props[v11], a4, 8 * length);
  }
  if (a5)
  {
    charIndexes = self->_charIndexes;
    if (charIndexes)
      memcpy(&charIndexes[v11], a5, 8 * length);
  }
}

- (unint64_t)layoutOptions
{
  return 0;
}

+ (void)initialize
{
  uint64_t v2;
  const void *v3[10];

  v3[9] = *(const void **)MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3[0] = CFSTR("NSBackgroundColor");
    v3[1] = CFSTR("NSLink");
    v3[2] = CFSTR("NSTextAlternativesDisplayStyle");
    v3[3] = CFSTR("NSSpellingState");
    v3[4] = CFSTR("NSUnderlineColor");
    v3[5] = CFSTR("NSUnderline");
    v3[6] = CFSTR("NSStrikethrough");
    v3[7] = CFSTR("NSStrikethroughColor");
    v3[8] = NSMarkedClauseSegmentAttributeName;
    __NSUnrecognizedAttributes = (uint64_t)CFSetCreate(0, v3, 9, MEMORY[0x1E0C9B3B0]);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSingleLineTypesetter;
  -[NSATSTypesetter dealloc](&v3, sel_dealloc);
}

- (BOOL)_allowsEllipsisGlyphSubstitution
{
  return 1;
}

- (id)_textContainerForAttachmentProtocol
{
  __NSImmutableTextStorage *textStorage;
  __NSImmutableTextStorage *v4;
  NSLayoutManager *v5;

  textStorage = self->_textStorage;
  if (!textStorage)
  {
    v4 = -[__NSImmutableTextStorage initWithAttributedString:]([__NSImmutableTextStorage alloc], "initWithAttributedString:", -[NSSingleLineTypesetter attributedString](self, "attributedString"));
    self->_textStorage = v4;
    v5 = -[__NSImmutableTextStorage layoutManager](v4, "layoutManager");
    -[NSLayoutManager setApplicationFrameworkContext:](v5, "setApplicationFrameworkContext:", -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext"));
    -[NSLayoutManager setUsesFontLeading:](v5, "setUsesFontLeading:", -[NSTypesetter usesFontLeading](self, "usesFontLeading"));
    -[NSTextContainer setSize:](-[__NSImmutableTextStorage textContainer](self->_textStorage, "textContainer"), "setSize:", self->_lineWidth, 0.0);
    textStorage = self->_textStorage;
  }
  return -[__NSImmutableTextStorage textContainer](textStorage, "textContainer");
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 maximumWidth:(double)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[NSSingleLineTypesetter createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:](self, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", a3.location, a3.length, a4, a5, a6, 0, a7, v8);
}

- (_NSRange)glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
