@implementation NSTextLineFragment

- (NSRange)characterRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  NSRange result;

  objc_copyStruct(v4, &self->_characterRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (CGRect)typographicBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_sync_enter(self);
  x = self->_typographicBounds.origin.x;
  y = self->_typographicBounds.origin.y;
  width = self->_typographicBounds.size.width;
  height = self->_typographicBounds.size.height;
  objc_sync_exit(self);
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)glyphOrigin
{
  CGFloat x;
  CGFloat y;
  double v5;
  double v6;
  CGPoint result;

  objc_sync_enter(self);
  x = self->_glyphOrigin.x;
  y = self->_glyphOrigin.y;
  objc_sync_exit(self);
  v5 = x;
  v6 = y;
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)dealloc
{
  __CTLine *lineRef;
  unsigned __int16 *glyphs;
  CGSize *advances;
  objc_super v6;

  lineRef = self->_lineRef;
  if (lineRef)
    CFRelease(lineRef);
  glyphs = self->_glyphs;
  if (glyphs)
    NSZoneFree(0, glyphs);
  advances = self->_advances;
  if (advances)
    NSZoneFree(0, advances);

  v6.receiver = self;
  v6.super_class = (Class)NSTextLineFragment;
  -[NSTextLineFragment dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textLayoutFragment);
}

- (void)enumerateCaretOffsetsWithTextSelectionDataSource:(id)a3 baseLocation:(id)a4 usingBlock:(id)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  NSTextParagraph *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CFRange StringRange;
  __CTLine *lineRef;
  unint64_t v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  int v26;
  void *v27;
  char v28;
  void *ptr;
  uint64_t v30;
  _QWORD block[11];
  CFRange v32;

  -[NSTextLineFragment typographicBounds](self, "typographicBounds");
  v10 = v9;
  -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
  v12 = v10 + v11;
  v13 = -[NSTextLayoutFragment textParagraph](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
  v14 = (void *)MEMORY[0x18D7917B4]();
  if (self->_lineRef)
  {
    -[NSTextLineFragment typographicBounds](self, "typographicBounds");
    v17 = v15 + v16;
    -[NSTextLineFragment padding](self, "padding");
    v19 = v17 - v18;
    StringRange = CTLineGetStringRange(self->_lineRef);
    lineRef = self->_lineRef;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__NSTextLineFragment_enumerateCaretOffsetsWithTextSelectionDataSource_baseLocation_usingBlock___block_invoke;
    block[3] = &unk_1E2605140;
    *(double *)&block[9] = v12;
    *(double *)&block[10] = v19;
    block[4] = v13;
    block[5] = a3;
    block[6] = a4;
    block[7] = self;
    v32 = StringRange;
    block[8] = a5;
    CTLineEnumerateCaretOffsets(lineRef, block);
  }
  else if (self->_elasticGlyphCount + self->_glyphCount < 1)
  {
    if (self->_characterRange.length
      || (v27 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_textLayoutFragment), "textLayoutManager"), "textContentManager"), "documentRange")) != 0&& objc_msgSend(a4, "isEqual:", objc_msgSend(v27, "endLocation")))
    {
      LOBYTE(v30) = 0;
      (*((void (**)(id, uint64_t, uint64_t, uint64_t *, double))a5 + 2))(a5, objc_msgSend(a3, "locationFromLocation:withOffset:", a4, 0), 1, &v30, v12);
    }
  }
  else
  {
    v22 = 0;
    ptr = 0;
    v30 = 0;
    v28 = 0;
    do
    {
      v23 = self->_elasticGlyphCount + self->_glyphCount;
      if (v22 >= v23)
        break;
      v24 = v12 + self->_advances[v22].width;
      v25 = v22 + 1;
      while (v23 != v25)
      {
        v26 = (__int16)self->_glyphs[v25++];
        if (v26 != -1)
        {
          v23 = v25 - 1;
          break;
        }
      }
      -[NSTextLineFragment _processCaretGlyphRunForTextSelectionProvider:baseLocation:runRange:glyphOffset:positionsCache:positionsCacheSize:stop:usingBlock:](self, "_processCaretGlyphRunForTextSelectionProvider:baseLocation:runRange:glyphOffset:positionsCache:positionsCacheSize:stop:usingBlock:", a3, a4, v22, v23 - v22, &ptr, &v30, v12, &v28, a5);
      v22 = v23;
      v12 = v24;
    }
    while (!v28);
    if (ptr)
      NSZoneFree(0, ptr);
  }
  objc_autoreleasePoolPop(v14);
}

- (void)_processCaretGlyphRunForTextSelectionProvider:(id)a3 baseLocation:(id)a4 runRange:(_NSRange)a5 glyphOffset:(double)a6 positionsCache:(double *)a7 positionsCacheSize:(unint64_t *)a8 stop:(BOOL *)a9 usingBlock:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[12];

  length = a5.length;
  location = a5.location;
  -[NSTextLineFragment typographicBounds](self, "typographicBounds");
  v20 = v18 + v19;
  -[NSTextLineFragment padding](self, "padding");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __152__NSTextLineFragment__processCaretGlyphRunForTextSelectionProvider_baseLocation_runRange_glyphOffset_positionsCache_positionsCacheSize_stop_usingBlock___block_invoke;
  v22[3] = &unk_1E2605118;
  *(double *)&v22[8] = a6;
  *(double *)&v22[9] = v20 - v21;
  v22[4] = a3;
  v22[5] = a4;
  v22[10] = location;
  v22[11] = length;
  v22[6] = a10;
  v22[7] = a9;
  -[NSTextLineFragment _getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:](self, "_getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:", location, length, a7, a8, v22);
}

- (double)padding
{
  return self->_padding;
}

- (void)_getCaretPositionsForCharactersInRange:(_NSRange)a3 positionsCache:(double *)a4 positionsCacheSize:(unint64_t *)a5 block:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  int v12;
  double width;
  uint64_t v14;
  CFIndex LigatureCaretPositions;
  CFIndex v16;
  uint64_t v17;
  NSString *v18;
  NSUInteger v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  char *(*v29)(char *, unint64_t);
  void *v30;
  uint64_t *v31;
  double **v32;
  unint64_t *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE v39[64];
  uint64_t v40;

  length = a3.length;
  location = a3.location;
  v40 = *MEMORY[0x1E0C80C00];
  v12 = self->_glyphs[a3.location];
  if (a3.location && v12 == 0xFFFF)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextLineFragment.m"), 485, CFSTR("attempt to get caret positions for deleted glyph at index %lu"), a3.location);
  width = self->_advances[location].width;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = v39;
  v14 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke;
  v30 = &unk_1E26050C8;
  v31 = &v35;
  v32 = a4;
  v33 = a5;
  v34 = v39;
  if (length < 2)
    goto LABEL_16;
  LigatureCaretPositions = CTFontGetLigatureCaretPositions((CTFontRef)self->_font, v12, 0, 0);
  v16 = LigatureCaretPositions;
  if (LigatureCaretPositions)
  {
    v17 = LigatureCaretPositions + 2;
    v29((char *)v28, LigatureCaretPositions + 2);
    *(_QWORD *)v36[3] = 0;
    CTFontGetLigatureCaretPositions((CTFontRef)self->_font, v12, (CGFloat *)(v36[3] + 8), v16);
    *(double *)(v36[3] + 8 * v16 + 8) = width;
    if (v16 == -2)
    {
LABEL_16:
      v29((char *)v28, 2uLL);
      *(_QWORD *)v36[3] = 0;
      *(double *)(v36[3] + 8) = width;
      v17 = 2;
    }
  }
  else
  {
    v18 = -[NSAttributedString string](-[NSTextLineFragment attributedString](self, "attributedString"), "string");
    v19 = -[NSTextLineFragment characterRange](self, "characterRange") + location;
    if (length == 2 && -[NSString characterAtIndex:](v18, "characterAtIndex:", v19) >> 10 == 54)
      goto LABEL_16;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke_2;
    v23[3] = &unk_1E26050F0;
    v23[4] = objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v23[5] = &v24;
    v23[6] = v19 + length;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](v18, "enumerateSubstringsInRange:options:usingBlock:", v19, -[NSString length](v18, "length") - v19, 5, v23);
    v20 = v25[3];
    if (v20 < 2)
    {
      v17 = 0;
    }
    else
    {
      v17 = v20 + 1;
      v29((char *)v28, v20 + 1);
      v21 = width / (double)v25[3];
      *(_QWORD *)v36[3] = 0;
      for (i = 1; i != v20; ++i)
        *(double *)(v36[3] + 8 * i) = v21 * (double)i;
      *(double *)(v36[3] + 8 * v20) = width;
    }
    _Block_object_dispose(&v24, 8);
    if (!v17)
      goto LABEL_16;
  }
  (*((void (**)(id, uint64_t, uint64_t))a6 + 2))(a6, v36[3], v17);
  _Block_object_dispose(&v35, 8);
}

uint64_t __152__NSTextLineFragment__processCaretGlyphRunForTextSelectionProvider_baseLocation_runRange_glyphOffset_positionsCache_positionsCacheSize_stop_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;

  v3 = a3 - 1;
  if (a3 != 1)
  {
    v4 = result;
    v5 = *(_BYTE **)(result + 56);
    if (!*v5)
    {
      v7 = 0;
      do
      {
        v8 = (double *)(a2 + 8 * v7);
        v9 = *v8;
        v10 = v8[1];
        v11 = *(double *)(v4 + 72);
        if (*(double *)(v4 + 64) + *v8 >= v11)
          v12 = *(double *)(v4 + 72);
        else
          v12 = *(double *)(v4 + 64) + *v8;
        v13 = *(_QWORD *)(v4 + 48);
        v14 = objc_msgSend(*(id *)(v4 + 32), "locationFromLocation:withOffset:", *(_QWORD *)(v4 + 40), v7 + *(_QWORD *)(v4 + 80));
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, double))(v13 + 16))(v13, v14, 1, v5, v12);
        if (!*v5)
        {
          v15 = v10 - v9;
          v16 = fmax(v11 - v12, 0.0);
          if (v10 - v9 + v12 > v11)
            v15 = v16;
          result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _BYTE *, double))(v13 + 16))(v13, v14, 0, v5, v12 + v15);
        }
        if (++v7 >= v3)
          break;
        v5 = *(_BYTE **)(v4 + 56);
      }
      while (!*v5);
    }
  }
  return result;
}

char *__101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke(char *result, unint64_t a2)
{
  char *v2;
  void *v4;
  void **v5;

  v2 = result;
  if (a2 < 9)
  {
    v5 = (void **)(result + 56);
    goto LABEL_6;
  }
  v4 = (void *)**((_QWORD **)result + 5);
  if (!v4 || **((_QWORD **)result + 6) < a2)
  {
    result = (char *)NSZoneRealloc(0, v4, 8 * a2);
    **((_QWORD **)v2 + 5) = result;
    v5 = (void **)*((_QWORD *)v2 + 5);
    **((_QWORD **)v2 + 6) = a2;
LABEL_6:
    v4 = *v5;
  }
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 4) + 8) + 24) = v4;
  return result;
}

- (void)setRenderingAttributesProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (void)setTypographicBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  CGSize v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_sync_enter(self);
  self->_typographicBounds.origin.x = x;
  self->_typographicBounds.origin.y = y;
  v8 = MEMORY[0x1E0C9D628];
  self->_typographicBounds.size.width = width;
  self->_typographicBounds.size.height = height;
  v9 = *(CGSize *)(v8 + 16);
  self->_imageBounds.origin = *(CGPoint *)v8;
  self->_imageBounds.size = v9;
  objc_sync_exit(self);
}

- (void)setTextLayoutFragment:(id)a3
{
  objc_storeWeak((id *)&self->_textLayoutFragment, a3);
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (void)setGlyphOrigin:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  CGSize v7;

  y = a3.y;
  x = a3.x;
  objc_sync_enter(self);
  v6 = MEMORY[0x1E0C9D628];
  self->_glyphOrigin.x = x;
  self->_glyphOrigin.y = y;
  v7 = *(CGSize *)(v6 + 16);
  self->_imageBounds.origin = *(CGPoint *)v6;
  self->_imageBounds.size = v7;
  objc_sync_exit(self);
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  self->_applicationFrameworkContext = a3;
}

- (NSTextLineFragment)initWithAttributedString:(NSAttributedString *)attributedString range:(NSRange)range
{
  NSUInteger length;
  NSUInteger v5;
  NSTextLineFragment *v8;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *(*v12)(uint64_t, uint64_t, _QWORD *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  length = range.length;
  v5 = range.location;
  if (range.location + range.length > -[NSAttributedString length](attributedString, "length"))
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("The range is out side of the attributed string length."));
    self = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSTextLineFragment;
  v8 = -[NSTextLineFragment init](&v16, sel_init);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v8->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
    v8->_attributedString = (NSAttributedString *)-[NSAttributedString copyWithZone:](attributedString, "copyWithZone:", 0);
    v8->_characterRange.location = v5;
    v8->_characterRange.length = length;
    -[NSTextLineFragment setRendersTextCorrectionMarkers:](v8, "setRendersTextCorrectionMarkers:", 1);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __53__NSTextLineFragment_initWithAttributedString_range___block_invoke;
    v13 = &unk_1E2605028;
    objc_copyWeak(&v14, &location);
    -[NSTextLineFragment set_renderingAttributeOverridesProvider:](v8, "set_renderingAttributeOverridesProvider:", &v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  -[NSTextLineFragment invalidateCache](v8, "invalidateCache", v10, v11, v12, v13);
  return v8;
}

- (void)setRendersTextCorrectionMarkers:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (void)invalidateCache
{
  CGSize v2;

  self->_activeRun = 0;
  self->_activeRunIndex = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_imageBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_imageBounds.size = v2;
}

- (void)set_renderingAttributeOverridesProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSTextLineFragment)initWithString:(NSString *)string attributes:(NSDictionary *)attributes range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  NSTextLineFragment *v9;

  length = range.length;
  location = range.location;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", string, attributes);
  v9 = -[NSTextLineFragment initWithAttributedString:range:](self, "initWithAttributedString:range:", v8, location, length);

  -[NSTextLineFragment invalidateCache](v9, "invalidateCache");
  return v9;
}

- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v7;

  if (context)
  {
    y = point.y;
    x = point.x;
    v7 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", context);
    -[NSTextLineFragment drawAtPoint:graphicsContext:](self, "drawAtPoint:graphicsContext:", v7, x, y);

  }
}

- (void)drawAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  double y;
  double x;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __CTLine *lineRef;
  id v14;
  uint64_t (**v15)(id, uint64_t, _QWORD *);
  uint64_t v16;
  int64_t glyphCount;
  int64_t v18;
  objc_class *v19;
  CGContext *v20;
  unsigned __int16 *glyphs;
  CGSize *advances;
  NSDictionary *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CGSize *v45;
  double width;
  double height;
  BOOL v48;
  uint64_t v49;
  NSDictionary *v50;
  uint64_t v51;
  id v52;
  _QWORD v53[10];
  uint64_t v54;
  uint64_t v55;

  if (a4)
  {
    y = a3.y;
    x = a3.x;
    v8 = -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:graphicsContext:](self, "drawMarkedTextBackgroundAtPoint:graphicsContext:");
    -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
    v10 = x + v9;
    v12 = y + v11;
    lineRef = self->_lineRef;
    if (lineRef)
    {
      v14 = -[NSTextLineFragment _renderingAttributeOverridesProvider](self, "_renderingAttributeOverridesProvider");
      _NSCoreTypesetterRenderLine(lineRef, a4, (uint64_t)v14, (const __CFAttributedString *)self->_lineBadge, 0, 0, v10, v12, *MEMORY[0x1E0CB3438], *(CGFloat *)(MEMORY[0x1E0CB3438] + 8), *(CGFloat *)(MEMORY[0x1E0CB3438] + 16), *(CGFloat *)(MEMORY[0x1E0CB3438] + 24));
      if (-[NSTextLayoutFragment textAttachmentLayoutContext](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textAttachmentLayoutContext")|| -[NSArray count](-[NSTextLayoutFragment truncatedRanges](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "truncatedRanges"), "count"))
      {
        -[NSTextLineFragment drawTextAttachmentsAtPoint:graphicsContext:](self, "drawTextAttachmentsAtPoint:graphicsContext:", a4, x, y);
      }
    }
    else if (self->_glyphs)
    {
      v15 = -[NSTextLineFragment _renderingAttributeOverridesProvider](self, "_renderingAttributeOverridesProvider");
      v16 = -[NSTextLineFragment characterRange](self, "characterRange");
      glyphCount = self->_glyphCount;
      v18 = -[NSTextLineFragment applicationFrameworkContext](self, "applicationFrameworkContext");
      v48 = v8;
      if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
      {
        v19 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v18);
      }
      else
      {
        v19 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
      }
      v51 = -[objc_class blackColor](v19, "blackColor");
      v20 = (CGContext *)objc_msgSend(a4, "CGContext");
      glyphs = self->_glyphs;
      advances = self->_advances;
      v23 = -[NSAttributedString attributesAtIndex:effectiveRange:](-[NSTextLineFragment attributedString](self, "attributedString"), "attributesAtIndex:effectiveRange:", v16, 0);
      v24 = -[NSDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("NSFont"));
      v50 = v23;
      v52 = -[NSDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("NSShadow"));
      if (!v24)
        v24 = (id)NSDefaultFont();
      v25 = v16 + glyphCount;
      while (1)
      {
        v54 = 0;
        v55 = 0;
        if (v15)
        {
          v26 = (void *)v15[2](v15, v16, &v54);
          v28 = v54;
          v27 = v55;
        }
        else
        {
          v26 = 0;
          v27 = v25 - v16;
          v54 = v16;
          v55 = v25 - v16;
          v28 = v16;
        }
        if (v27 + v28 > (unint64_t)v25)
        {
          v27 = v25 - v28;
          v55 = v25 - v28;
        }
        v29 = v28 - v16;
        if (v29)
        {
          v27 += v29;
          v54 = v16;
          v55 = v27;
        }
        if (!v27)
          break;
        if (objc_msgSend(v26, "count"))
        {
          v30 = (void *)objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
          if (v30)
          {
            v31 = v30;
            if ((objc_msgSend(v30, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
            {
              -[NSTextLineFragment typographicBounds](self, "typographicBounds");
              v49 = v32;
              v34 = v33;
              v36 = v35;
              v38 = v37;
              -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
              v39 = y;
              v41 = v40;
              -[NSTextLineFragment _setColor:inGraphicsContext:](self, "_setColor:inGraphicsContext:", v31, a4);
              v53[0] = MEMORY[0x1E0C809B0];
              v53[1] = 3221225472;
              v53[2] = __50__NSTextLineFragment_drawAtPoint_graphicsContext___block_invoke;
              v53[3] = &__block_descriptor_80_e26_v40__0__NSRange_QQ_8d24d32l;
              v53[4] = v49;
              v53[5] = v34;
              v53[6] = v36;
              v53[7] = v38;
              v53[8] = v41;
              y = v39;
              v53[9] = v20;
              -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v54, v55, v53);
            }
          }
        }
        if (!objc_msgSend(v26, "count")
          || (v42 = (void *)objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("NSColor"))) == 0
          || (v43 = v42, objc_msgSend(v42, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"))))
        {
          v44 = -[NSDictionary objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", CFSTR("NSColor"));
          if (v44)
            v43 = (void *)v44;
          else
            v43 = (void *)v51;
        }
        CGContextSaveGState(v20);
        CGContextGetFontRenderingStyle();
        objc_msgSend(v24, "applyToGraphicsContext:", a4);
        -[NSTextLineFragment _setColor:inGraphicsContext:](self, "_setColor:inGraphicsContext:", v43, a4);
        CGContextSetCharacterSpacing(v20, 0.0);
        objc_msgSend(v52, "applyToGraphicsContext:", a4);
        CGContextSetTextPosition(v20, v10, v12);
        CTFontDrawGlyphsWithAdvances();
        CGContextSetFontRenderingStyle();
        CGContextRestoreGState(v20);
        v16 = v55 + v54;
        if (v55 + v54 >= v25)
          break;
        if (v55 >= 1)
        {
          v45 = &advances[v55];
          do
          {
            width = advances->width;
            height = advances->height;
            ++advances;
            v10 = v10 + width;
            v12 = v12 + height;
          }
          while (advances < v45);
        }
        glyphs += v55;
      }
      v8 = v48;
    }
    if (!v8)
      -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:", a4, x, y);
    if (-[NSTextLineFragment rendersTextCorrectionMarkers](self, "rendersTextCorrectionMarkers"))
      -[NSTextLineFragment drawTextCorrectionMarkersAtPoint:graphicsContext:](self, "drawTextCorrectionMarkersAtPoint:graphicsContext:", a4, x, y);
  }
}

__CFDictionary *__53__NSTextLineFragment_initWithAttributedString_range___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v4;
  uint64_t v5;
  __CFDictionary *result;

  v4 = (id *)(a1 + 32);
  v5 = objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_defaultRenderingAttributesAtCharacterIndex:effectiveRange:", a2, a3);
  result = (__CFDictionary *)objc_msgSend((id)objc_msgSend(objc_loadWeak(v4), "textLayoutFragment"), "_renderingAttributesForTextAnimationContextComponent:range:attributes:effectiveRange:", 1, *a3, a3[1], v5, a3);
  if (!result)
    return +[NSTextLineFragment _hiddenContentRenderingAttributes](NSTextLineFragment, "_hiddenContentRenderingAttributes");
  return result;
}

- (id)renderingAttributesProvider
{
  return objc_getProperty(self, a2, 248, 1);
}

- (id)_defaultRenderingAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSAttributedString *v7;
  NSTextLayoutFragment *v8;
  int64_t v9;
  objc_class *v10;
  NSRange v11;
  NSTextParagraph *v12;
  NSTextParagraph *v13;
  uint64_t v14;
  uint64_t v15;
  NSTextRange *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSDictionary *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  char v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSDictionary *v40;
  uint64_t v41;
  uint64_t v42;
  NSRange v43;
  NSUInteger location;
  NSUInteger length;
  NSRange v46;
  NSUInteger v47;
  NSRange v48;
  NSUInteger v49;
  id v50;
  int64_t v52;
  _NSRange *v53;
  void *v54;
  NSTextLineFragment *v55;
  uint64_t v56;
  void *v57;
  NSDictionary *v58;
  NSRange v59;
  __int128 range2;
  NSRange v61;
  __int128 v62;
  NSRange v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  uint64_t v67;
  NSRange v68;
  NSRange v69;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = -[NSTextLineFragment attributedString](self, "attributedString");
  range2 = xmmword_18D6CBB80;
  v8 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
  v55 = self;
  v9 = -[NSTextLineFragment applicationFrameworkContext](self, "applicationFrameworkContext");
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v10 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v9);
  }
  else
  {
    v10 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v61 = (NSRange)0;
  v56 = -[objc_class blackColor](v10, "blackColor");
  v58 = -[NSAttributedString attributesAtIndex:effectiveRange:](v7, "attributesAtIndex:effectiveRange:", a3, &v61);
  if (!-[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", CFSTR("NSTextHighlightStyle"))
    || (v59 = v61,
        -[NSAttributedString attribute:atIndex:effectiveRange:](v7, "attribute:atIndex:effectiveRange:", CFSTR("NSTextHighlightStyle"), a3, &v59), v11 = NSIntersectionRange(v59, v61), v59 = v11, !v11.length))
  {
    v17 = 0;
    v13 = 0;
    if (!v8)
      goto LABEL_75;
    goto LABEL_23;
  }
  v12 = -[NSTextLayoutFragment textParagraph](-[NSTextLineFragment textLayoutFragment](v55, "textLayoutFragment"), "textParagraph");
  v13 = v12;
  if (!v12)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_22;
  }
  v63 = (NSRange)xmmword_18D6CBB80;
  v14 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v12, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v11.location, 0, &v63);
  if (v14)
  {
    v15 = v14;
    v62 = xmmword_18D6CBB80;
    v16 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v13, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v11.length + v11.location, 0, &v62);
    if (v16)
    {
      v16 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v15, v16);
      if (v16)
      {
        v17 = (void *)objc_msgSend(-[NSTextLayoutManager textHighlightRenderingAttributesForTextRange:attributes:](-[NSTextLayoutFragment textLayoutManager](v8, "textLayoutManager"), "textHighlightRenderingAttributesForTextRange:attributes:", v16, v58), "objectForKeyedSubscript:", CFSTR("NSColor"));
        if (v17)
        {
          v18 = -[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", CFSTR("NSColor"));
          v19 = v18 ? v18 : v56;
          if ((objc_msgSend(v17, "isEqual:", v19) & 1) == 0)
          {
            v20 = (NSDictionary *)-[NSDictionary mutableCopy](v58, "mutableCopy");
            -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v17, CFSTR("NSColor"));
            v61 = v59;
            v58 = v20;
            v13 = (NSTextParagraph *)v20;
            goto LABEL_22;
          }
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = 0;
LABEL_21:
  v13 = 0;
LABEL_22:

  if (!v8)
    goto LABEL_75;
LABEL_23:
  v21 = -[NSTextLayoutManager textContainerForLocation:](-[NSTextLayoutFragment textLayoutManager](v8, "textLayoutManager"), "textContainerForLocation:", -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](v8, "rangeInElement"), "location"));
  v22 = -[NSTextLayoutFragment _resolvedRenderingAttributesForCharacterIndex:effectiveRange:](v8, "_resolvedRenderingAttributesForCharacterIndex:effectiveRange:", a3, &range2);
  v54 = (void *)v21;
  if (v21)
  {
    v23 = v22;
    v57 = v17;
    v52 = a3;
    v53 = a4;
    v24 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("__NSTextSelectionForegroundColorAttributeName"));
    v25 = 0;
    v8 = 0;
    v63.location = (NSUInteger)CFSTR("NSColor");
    v63.length = (NSUInteger)CFSTR("NSBackgroundColor");
    v64 = CFSTR("NSStrokeColor");
    v65 = CFSTR("NSUnderlineColor");
    v66 = CFSTR("NSStrikethroughColor");
    v26 = (void *)v56;
    while (1)
    {
      v27 = *(__CFString **)((char *)&v63.location + v25);
      v28 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", v27);
      v29 = objc_msgSend(v28, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
      v30 = v29;
      if (!v28)
        goto LABEL_34;
      v31 = 0;
      v32 = v29 ^ 1;
      if (CFSTR("NSColor") == v27)
      {
        v30 = 0;
      }
      else
      {
        v32 = 1;
        v30 = v29;
      }
      if (!v32)
        v28 = v26;
      if ((v32 & 1) == 0 && !v26)
        break;
LABEL_43:
      if (!v57)
      {
        v35 = v28 && CFSTR("NSColor") == v27;
        if (v35
          && (v30 & 1) == 0
          && v24
          && -[NSTextLineFragment _selectionColorShouldOverrideColor:](v55, "_selectionColorShouldOverrideColor:", v28))
        {
          v28 = (void *)v24;
          v31 = 0;
        }
      }
      if (v28)
        v36 = v30;
      else
        v36 = 1;
      if ((v36 & 1) == 0)
      {
        v37 = (void *)objc_msgSend(v54, "renderingColorForDocumentColor:", v28);
        if (!v31)
          goto LABEL_62;
LABEL_61:
        if ((objc_msgSend(v37, "isEqual:", v28) & 1) == 0)
        {
LABEL_62:
          if (v8)
          {
            if (v30)
              goto LABEL_64;
          }
          else
          {
            if (-[NSDictionary count](v58, "count"))
              v38 = -[NSDictionary mutableCopy](v58, "mutableCopy");
            else
              v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
            v8 = (NSTextLayoutFragment *)v38;
            if (v30)
LABEL_64:
              v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
          }
          -[NSTextLayoutFragment setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v37, v27);
        }
        v26 = (void *)v56;
        goto LABEL_67;
      }
      if (v28)
      {
        v37 = 0;
        if (v31)
          goto LABEL_61;
        goto LABEL_62;
      }
LABEL_67:
      v25 += 8;
      if (v25 == 40)
      {
        a3 = v52;
        a4 = v53;
        goto LABEL_75;
      }
    }
    v30 = 0;
LABEL_34:
    v33 = -[NSDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", v27);
    if (CFSTR("NSColor") == v27)
      v34 = v26;
    else
      v34 = 0;
    if (v33)
      v28 = (void *)v33;
    else
      v28 = v34;
    if (v33)
      v31 = v33;
    else
      v31 = (uint64_t)v34;
    goto LABEL_43;
  }
  v8 = 0;
LABEL_75:
  v39 = -[NSTextLineFragment renderingAttributesProvider](v55, "renderingAttributesProvider");
  v40 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v63 = (NSRange)xmmword_18D6CBB80;
  if (v58)
    v40 = v58;
  if (v8)
    v41 = (uint64_t)v8;
  else
    v41 = (uint64_t)v40;
  if ((unint64_t)a4 | v39)
  {
    v42 = v39;
    v63 = v61;
    v43.location = range2;
    length = v61.length;
    location = v61.location;
    if ((_QWORD)range2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v43.length = *((_QWORD *)&range2 + 1);
      if (*((_QWORD *)&range2 + 1))
      {
        v46 = NSIntersectionRange(v63, v43);
        location = v46.location;
        length = v46.length;
      }
    }
    v69.location = -[NSTextLineFragment characterRange](v55, "characterRange");
    v69.length = v47;
    v68.location = location;
    v68.length = length;
    v48 = NSIntersectionRange(v68, v69);
    v63 = v48;
    if (v42)
    {
      v49 = v48.length;
      if (v48.length + v48.location > a3)
      {
        if (v48.location >= a3)
        {
          a3 = v48.location;
        }
        else
        {
          v63.location = a3;
          v63.length = v48.length + v48.location - a3;
          v49 = v63.length;
        }
        v41 = (*(uint64_t (**)(uint64_t, NSTextLineFragment *, int64_t, NSUInteger, uint64_t, NSRange *))(v42 + 16))(v42, v55, a3, v49, v41, &v63);
      }
    }
    if (a4)
      *a4 = v63;
  }
  v50 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", v41);
  if (v8)

  return v50;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 256, 1);
}

- (int64_t)applicationFrameworkContext
{
  return self->_applicationFrameworkContext;
}

- (BOOL)rendersTextCorrectionMarkers
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  double y;
  double x;
  NSTextLayoutFragment *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSTextLayoutManager *v13;
  NSTextParagraph *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSTextRange *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[14];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  y = a3.y;
  x = a3.x;
  v8 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
  v9 = -[NSTextLineFragment characterRange](self, "characterRange");
  if (v8)
  {
    v11 = v10;
    if (v10)
    {
      v12 = v9;
      v13 = -[NSTextLayoutFragment textLayoutManager](v8, "textLayoutManager");
      v14 = -[NSTextLayoutFragment textParagraph](v8, "textParagraph");
      v15 = -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](v8, "rangeInElement"), "location");
      v16 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v14, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v12, 0, 0);
      v17 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v14, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v12 + v11, 0, 0);
      if (v16)
      {
        if (v17)
        {
          v38 = 0;
          v39 = &v38;
          v40 = 0x2020000000;
          v41 = -1;
          v32 = 0;
          v33 = &v32;
          v34 = 0x3052000000;
          v35 = __Block_byref_object_copy__8;
          v36 = __Block_byref_object_dispose__8;
          v37 = 0;
          v26 = 0;
          v27 = &v26;
          v28 = 0x3052000000;
          v29 = __Block_byref_object_copy__8;
          v30 = __Block_byref_object_dispose__8;
          v31 = 0;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __71__NSTextLineFragment_drawTextCorrectionMarkersAtPoint_graphicsContext___block_invoke;
          v25[3] = &unk_1E2605258;
          v25[4] = v17;
          v25[5] = self;
          v25[10] = &v26;
          v25[11] = &v32;
          v25[6] = v14;
          v25[7] = v15;
          *(double *)&v25[12] = x;
          *(double *)&v25[13] = y;
          v25[8] = a4;
          v25[9] = &v38;
          -[NSTextLayoutFragment enumerateRenderingAttributesFromLocation:reverse:usingBlock:](v8, "enumerateRenderingAttributesFromLocation:reverse:usingBlock:", v16, 0, v25);
          v18 = v39[3];
          if (v18 != -1)
          {
            v19 = v33[5];
            v20 = v27[5];
            v21 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v19, v20);
            v22 = -[NSTextLayoutManager _shouldDrawTextCorrectionMarkerWithType:inRange:](v13, "_shouldDrawTextCorrectionMarkerWithType:inRange:", v18, v21);

            if (v22)
            {
              if (v14)
              {
                v23 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v14, "rangeForLocation:allowsTrailingEdge:", v19, 0);
                v24 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v14, "rangeForLocation:allowsTrailingEdge:", v20, 1);
              }
              else
              {
                v23 = -[NSTextLayoutManager offsetFromLocation:toLocation:](v13, "offsetFromLocation:toLocation:", v15, v19);
                v24 = -[NSTextLayoutManager offsetFromLocation:toLocation:](v13, "offsetFromLocation:toLocation:", v15, v20);
              }
              if (v23 != 0x7FFFFFFFFFFFFFFFLL && v24 != 0x7FFFFFFFFFFFFFFFLL)
                -[NSTextLineFragment _drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:](self, "_drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:", v18, v23, v24 - v23, a4, x, y);
            }
          }

          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v32, 8);
          _Block_object_dispose(&v38, 8);
        }
      }
    }
  }
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  return -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:graphicsContext:adjustmentCallback:](self, "drawMarkedTextBackgroundAtPoint:graphicsContext:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (id)_renderingAttributeOverridesProvider
{
  return objc_getProperty(self, a2, 240, 1);
}

- (void)_setColor:(id)a3 inGraphicsContext:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__NSTextLineFragment__setColor_inGraphicsContext___block_invoke;
  v4[3] = &unk_1E2602FF0;
  v4[4] = a3;
  -[NSTextLineFragment _setCurrentGraphicsContext:duringBlock:](self, "_setCurrentGraphicsContext:duringBlock:", a4, v4);
}

uint64_t __50__NSTextLineFragment__setColor_inGraphicsContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "set");
}

- (void)_setCurrentGraphicsContext:(id)a3 duringBlock:(id)a4
{
  +[NSTextGraphicsContextProvider setCurrentTextGraphicsContext:duringBlock:](NSTextGraphicsContextProvider, "setCurrentTextGraphicsContext:duringBlock:", a3, a4);
}

- (CGRect)boundsWithType:(int64_t)a3 options:(unint64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  _QWORD *v22;
  NSAttributedString *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  _QWORD v32[9];
  _QWORD v33[5];
  uint64_t v34;
  double *v35;
  uint64_t v36;
  const char *v37;
  __int128 v38;
  __int128 v39;
  CGRect result;

  if (a3 != 2)
  {
    -[NSTextLineFragment typographicBounds](self, "typographicBounds", a3, a4);
    v6 = v15;
    v19 = v18;
    v10 = v16;
    v20 = v17;
    v34 = 0;
    v35 = (double *)&v34;
    v36 = 0x4010000000;
    v37 = "";
    v21 = *(_OWORD *)(MEMORY[0x1E0CB2990] + 16);
    v38 = *MEMORY[0x1E0CB2990];
    v39 = v21;
    if (a3)
    {
      if (a3 != 1)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextLineFragment.m"), 341, CFSTR("unhandled NSTextLineFragmentBounds type %lu"), a3);
        v6 = *MEMORY[0x1E0C9D628];
        v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        goto LABEL_9;
      }
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke;
      v33[3] = &unk_1E2605050;
      v22 = v33;
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke_2;
      v32[3] = &unk_1E2605078;
      *(double *)&v32[5] = v15;
      *(double *)&v32[6] = v19;
      *(double *)&v32[7] = v16;
      *(double *)&v32[8] = v17;
      v22 = v32;
    }
    v22[4] = &v34;
    v23 = -[NSTextLineFragment attributedString](self, "attributedString");
    v24 = -[NSTextLineFragment characterRange](self, "characterRange");
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke_3;
    v31[3] = &unk_1E26050A0;
    v31[4] = v22;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v23, "enumerateAttributesInRange:options:usingBlock:", v24, v25, 0x100000, v31);
    v26 = v35[4];
    v8 = v19 - v26;
    v12 = v20 + v26 + v35[6];
LABEL_9:
    _Block_object_dispose(&v34, 8);
    goto LABEL_10;
  }
  -[NSTextLineFragment imageBounds](self, "imageBounds", 2, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
LABEL_10:
  v27 = v6;
  v28 = v8;
  v29 = v10;
  v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)imageBounds
{
  __CTLine *lineRef;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const __CFArray *GlyphRuns;
  CFIndex v9;
  const __CTFont *Font;
  const __CTFont *v11;
  CFTypeID v12;
  double TypographicBounds;
  double v14;
  double MaxY;
  double MinX;
  double MaxX;
  double a;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  double v25;
  CGFloat v26;
  UIFont *v27;
  unsigned __int16 *glyphs;
  CGSize *advances;
  int64_t glyphCount;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  float64x2_t v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  float64x2_t v41;
  CGAffineTransform v42;
  CGAffineTransform descent;
  CGAffineTransform ascent;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect BoundingBox;

  if (CGRectIsNull(self->_imageBounds))
  {
    lineRef = self->_lineRef;
    if (lineRef)
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
      if (CFArrayGetCount(GlyphRuns) >= 1)
      {
        v9 = 0;
        do
        {
          CFArrayGetValueAtIndex(GlyphRuns, v9);
          Font = (const __CTFont *)CTRunGetFont();
          if (Font)
          {
            v11 = Font;
            v12 = CFGetTypeID(Font);
            if (v12 == CTFontGetTypeID())
            {
              BoundingBox = CTFontGetBoundingBox(v11);
              v45.origin.x = x;
              v45.origin.y = y;
              v45.size.width = width;
              v45.size.height = height;
              v46 = CGRectUnion(v45, BoundingBox);
              x = v46.origin.x;
              y = v46.origin.y;
              width = v46.size.width;
              height = v46.size.height;
            }
          }
          ++v9;
        }
        while (v9 < CFArrayGetCount(GlyphRuns));
      }
      ascent.a = 0.0;
      descent.a = 0.0;
      TypographicBounds = CTLineGetTypographicBounds(lineRef, &ascent.a, &descent.a, 0);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v14 = -CGRectGetMinY(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MaxY = CGRectGetMaxY(v48);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      MinX = CGRectGetMinX(v49);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      MaxX = CGRectGetMaxX(v50);
      a = ascent.a;
      if (ascent.a < MaxY)
        a = MaxY;
      v19 = descent.a;
      if (descent.a < v14)
        v19 = v14;
      v20 = -v19;
      v21 = TypographicBounds - MinX + MaxX;
      v22 = a + v19;
    }
    else
    {
      v27 = self->_font;
      if (v27)
      {
        glyphs = self->_glyphs;
        advances = self->_advances;
        glyphCount = self->_glyphCount;
        v54 = CTFontGetBoundingBox((CTFontRef)v27);
        MinX = *MEMORY[0x1E0C9D648];
        v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        if (glyphCount)
        {
          v31 = v54.origin.x;
          v32 = v54.origin.y;
          v33 = v54.size.width;
          v34 = v54.size.height;
          v35 = 0;
          v36 = *(float64x2_t *)MEMORY[0x1E0C9D538];
          do
          {
            if ((__int16)glyphs[v35] != -1)
            {
              v37 = v31 + v36.f64[0];
              v38 = v32 + v36.f64[1];
              v36 = vaddq_f64(v36, (float64x2_t)advances[v35]);
              if (v35)
              {
                v55.origin.x = MinX;
                v41 = v36;
                v55.origin.y = v20;
                v55.size.width = v21;
                v55.size.height = v22;
                v39 = v33;
                v40 = v34;
                v56 = CGRectUnion(v55, *(CGRect *)&v37);
                MinX = v56.origin.x;
                v20 = v56.origin.y;
                v36 = v41;
                v21 = v56.size.width;
                v22 = v56.size.height;
              }
              else
              {
                v22 = v34;
                v21 = v33;
                v20 = v38;
                MinX = v37;
              }
            }
            ++v35;
          }
          while (glyphCount != v35);
        }
      }
      else
      {
        MinX = *MEMORY[0x1E0C9D648];
        v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
    }
    v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&ascent.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&ascent.c = v23;
    v24 = self->_typographicBounds.origin.y;
    v25 = self->_glyphOrigin.y;
    v26 = self->_typographicBounds.origin.x + self->_glyphOrigin.x;
    *(_OWORD *)&ascent.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&descent.a = *(_OWORD *)&ascent.a;
    *(_OWORD *)&descent.c = v23;
    *(_OWORD *)&descent.tx = *(_OWORD *)&ascent.tx;
    CGAffineTransformTranslate(&ascent, &descent, v26, v24 + v25);
    v42 = ascent;
    CGAffineTransformScale(&descent, &v42, 1.0, -1.0);
    ascent = descent;
    v51.origin.x = MinX;
    v51.origin.y = v20;
    v51.size.width = v21;
    v51.size.height = v22;
    v52 = CGRectApplyAffineTransform(v51, &descent);
    result = CGRectIntegral(v52);
    self->_imageBounds = result;
  }
  else
  {
    return self->_imageBounds;
  }
  return result;
}

- (id)textLineFragmentRange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSTextParagraph *v6;
  NSTextParagraph *v7;
  NSTextParagraph *v8;
  __int128 v10;
  __int128 v11;

  v3 = -[NSTextLineFragment characterRange](self, "characterRange");
  v5 = v4;
  v6 = -[NSTextLayoutFragment textParagraph](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
  if (v6)
  {
    v7 = v6;
    v11 = xmmword_18D6CBB80;
    v6 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v6, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v3, 0, &v11);
    if (v6)
    {
      v8 = v6;
      v10 = xmmword_18D6CBB80;
      v6 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v7, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v3 + v5, 0, &v10);
      if (v6)
        v6 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v8, v6);
    }
  }
  return v6;
}

- (void)enumerateTextSegmentBoundsInTextRange:(id)a3 dataSourceLocationsOnly:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  id v15;
  NSTextParagraph *v16;
  NSTextParagraph *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSTextRange *v21;
  NSTextRange *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSTextParagraph *v35;
  unint64_t v36;
  NSTextParagraph *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  BOOL v58;
  int v59;
  int v60;
  _QWORD v62[5];
  id v63[7];
  __int128 v64;
  id location[4];

  v8 = -[NSTextLineFragment characterRange](self, "characterRange");
  if (!a3)
    return;
  v10 = v8;
  v11 = v9;
  v12 = objc_msgSend(a3, "isEmpty");
  if ((v12 & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    v15 = a3;
    goto LABEL_15;
  }
  v16 = -[NSTextLayoutFragment textParagraph](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
  if (!v16
    || (v17 = v16,
        *(_OWORD *)location = xmmword_18D6CBB80,
        (v18 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v16, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v10, 0, location)) == 0)|| (v19 = v18, v64 = xmmword_18D6CBB80, (v20 = -[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](v17, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", v10 + v11, 0, &v64)) == 0))
  {
    v22 = 0;
    goto LABEL_13;
  }
  v21 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v19, v20);
  v22 = v21;
  if (!v21)
  {
LABEL_13:
    v13 = 0;
LABEL_14:

    v15 = a3;
    v14 = v13;
    goto LABEL_15;
  }
  if (a4)
  {
    v13 = 0;
    v14 = 0;
    goto LABEL_10;
  }
  v13 = objc_msgSend(-[NSTextRange location](v21, "location"), "isEqual:", objc_msgSend(a3, "location"));
  v59 = objc_msgSend(-[NSTextRange endLocation](v22, "endLocation"), "isEqual:", objc_msgSend(a3, "endLocation"));
  v14 = v59;
  if (v13 && v59)
  {
    v13 = 1;
    goto LABEL_14;
  }
LABEL_10:
  v15 = (id)objc_msgSend(a3, "textRangeByIntersectingWithTextRange:", v22);

  if (!v15)
    return;
LABEL_15:
  -[NSTextLineFragment typographicBounds](self, "typographicBounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
  v32 = v31;
  v34 = v33;
  v35 = -[NSTextLayoutFragment textParagraph](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  if (v35)
  {
    v37 = v35;
    v60 = v14;
    v38 = v11;
    v39 = v12;
    v40 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v35, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v15, "location"), 1);
    v41 = objc_msgSend(v15, "isEmpty");
    if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v39;
      if (v41)
      {
        v11 = v38;
        if (objc_msgSend(-[NSTextRange endLocation](-[NSTextParagraph paragraphContentRange](v37, "paragraphContentRange"), "endLocation"), "isEqual:", objc_msgSend(v15, "location")))
        {
          v42 = -[NSTextLineFragment characterRange](self, "characterRange");
          v43 = 0;
          v36 = v42 + v44;
        }
        else
        {
          v43 = 0;
        }
        goto LABEL_32;
      }
      v43 = 0;
    }
    else
    {
      if ((v41 & 1) != 0)
      {
        v43 = 0;
        v36 = v40;
      }
      else
      {
        v45 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v37, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v15, "endLocation"), 1);
        v46 = -[NSTextLineFragment characterRange](self, "characterRange");
        if (v45 <= v46 + v47)
          v43 = v45 - v40;
        else
          v43 = 0;
        if (v45 <= v46 + v47)
          v36 = v40;
        else
          v36 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v12 = v39;
    }
    v11 = v38;
LABEL_32:
    v14 = v60;
    goto LABEL_33;
  }
  v43 = 0;
LABEL_33:
  v48 = v10 < v36;
  v49 = (v13 & v48) == 0;
  if ((v13 & v48) != 0)
    v50 = v10;
  else
    v50 = v36;
  if (!v49)
    v43 = v43 - v10 + v36;
  if (v10 + v11 <= v50 + v43)
    v51 = v43;
  else
    v51 = v10 + v11 - v50;
  if (v14)
    v52 = v51;
  else
    v52 = v43;
  if (v52)
  {
    objc_initWeak(location, self);
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __95__NSTextLineFragment_enumerateTextSegmentBoundsInTextRange_dataSourceLocationsOnly_usingBlock___block_invoke;
    v62[3] = &unk_1E2605168;
    objc_copyWeak(v63, location);
    v63[1] = v24;
    v63[2] = v26;
    v63[3] = v28;
    v63[4] = v30;
    v63[5] = v32;
    v63[6] = v34;
    v62[4] = a5;
    -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v50, v52, v62);
    objc_destroyWeak(v63);
    objc_destroyWeak(location);
  }
  else if (v12)
  {
    v53 = -[NSTextLineFragment characterRange](self, "characterRange");
    v55 = v54;
    v56 = -[NSTextLineFragment characterRange](self, "characterRange");
    v58 = v50 - v56 < v57 && v50 >= v56;
    if (v58 || v50 == v53 + v55)
    {
      -[NSTextLineFragment locationForCharacterAtIndex:](self, "locationForCharacterAtIndex:", v50);
      (*((void (**)(id, id))a5 + 2))(a5, a3);
    }
  }
}

- (NSTextLayoutFragment)textLayoutFragment
{
  return (NSTextLayoutFragment *)objc_loadWeak((id *)&self->_textLayoutFragment);
}

- (CGPoint)locationForCharacterAtIndex:(NSInteger)index
{
  double y;
  double x;
  __CTLine *lineRef;
  CGFloat OffsetForStringIndex;
  CGFloat *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t elasticGlyphCount;
  uint64_t v19;
  CGSize *advances;
  CGSize *v21;
  CGFloat *v22;
  double v23;
  double width;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  CGFloat *v29;
  uint64_t v30;
  uint64_t v31;
  NSRange v32;
  CGPoint result;

  x = self->_glyphOrigin.x;
  y = self->_glyphOrigin.y;
  if (+[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled](NSTextLayoutFragment, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled"))
  {
    x = x + self->_typographicBounds.origin.x;
    y = y + self->_typographicBounds.origin.y;
  }
  v28 = 0;
  v29 = (CGFloat *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  lineRef = self->_lineRef;
  if (lineRef)
  {
    OffsetForStringIndex = CTLineGetOffsetForStringIndex(lineRef, index, 0);
    v10 = v29;
    v29[3] = OffsetForStringIndex;
    v11 = v10 + 3;
  }
  else if (self->_glyphs)
  {
    v15 = -[NSTextLineFragment characterRange](self, "characterRange");
    -[NSTextLineFragment characterRange](self, "characterRange");
    v16 = index - v15;
    if (v16 > v17)
    {
      v27 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32.location = -[NSTextLineFragment characterRange](self, "characterRange");
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextLineFragment.m"), 1157, CFSTR("characterIndex %ld is out of bounds %@"), v16, NSStringFromRange(v32));
    }
    elasticGlyphCount = self->_elasticGlyphCount;
    if (v16 >= elasticGlyphCount + self->_glyphCount)
      v19 = elasticGlyphCount + self->_glyphCount;
    else
      v19 = v16;
    if (v19 >= 1)
    {
      advances = self->_advances;
      v21 = &advances[v19];
      v22 = v29;
      v23 = v29[3];
      do
      {
        width = advances->width;
        ++advances;
        v23 = width + v23;
        v22[3] = v23;
      }
      while (advances < v21);
    }
    v25 = -[NSTextLineFragment _rangeOfLigatureContainingCharacterIndex:](self, "_rangeOfLigatureContainingCharacterIndex:", v19);
    v11 = v29 + 3;
    if (v25 < v19 && v26 >= 2)
    {
      v29[3] = v29[3] - self->_advances[v25].width;
      -[NSTextLineFragment _getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:](self, "_getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:");
      v11 = v29 + 3;
    }
  }
  else
  {
    v11 = (double *)&v31;
  }
  v12 = x + *v11;
  _Block_object_dispose(&v28, 8);
  v13 = v12;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (_NSRange)_rangeOfLigatureContainingCharacterIndex:(unint64_t)a3
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v7;
  unint64_t v8;
  int v9;
  _NSRange result;

  v3 = self->_elasticGlyphCount + self->_glyphCount;
  if (v3 == a3)
  {
    v4 = 0;
    v5 = a3;
  }
  else
  {
    if (a3)
    {
      v5 = a3;
      do
      {
        if ((__int16)self->_glyphs[v5] != -1)
          break;
        --v5;
      }
      while (v5);
    }
    else
    {
      v5 = 0;
    }
    v7 = a3 + 1;
    if (v3 <= a3 + 1)
      v8 = a3 + 1;
    else
      v8 = v3;
    while (v7 < v3)
    {
      v9 = (__int16)self->_glyphs[v7++];
      if (v9 != -1)
      {
        v8 = v7 - 1;
        break;
      }
    }
    v4 = v8 - v5;
  }
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)setLineRef:(__CTLine *)a3
{
  __CTLine *lineRef;
  int IsRightToLeft;
  char v7;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  CFIndex v10;
  const __CTRun *ValueAtIndex;

  objc_sync_enter(self);
  lineRef = self->_lineRef;
  if (lineRef != a3)
  {
    if (lineRef)
      CFRelease(lineRef);
    self->_lineRef = (__CTLine *)CFRetain(a3);
    -[NSTextLineFragment invalidateCache](self, "invalidateCache");
    IsRightToLeft = CTLineIsRightToLeft();
    v7 = IsRightToLeft ? 2 : 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v7;
    if ((IsRightToLeft & 1) == 0)
    {
      if (CTLineHasBidiLevels())
      {
        GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
        Count = CFArrayGetCount(GlyphRuns);
        if (Count >= 1)
        {
          v10 = 0;
          while (1)
          {
            ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v10);
            if ((CTRunGetStatus(ValueAtIndex) & 1) != 0)
              break;
            if (Count == ++v10)
              goto LABEL_15;
          }
          *(_BYTE *)&self->_flags |= 2u;
        }
      }
    }
  }
LABEL_15:
  objc_sync_exit(self);
}

- (void)setGlyphs:(const unsigned __int16 *)a3 advances:(const CGSize *)a4 count:(int64_t)a5 elasticCount:(unint64_t)a6 font:(id)a7
{
  NSUInteger v13;
  NSUInteger v14;

  v13 = a6 + a5;
  v14 = 2 * (a6 + a5);
  self->_glyphs = (unsigned __int16 *)NSZoneMalloc(0, v14);
  v13 *= 16;
  self->_advances = (CGSize *)NSZoneMalloc(0, v13);
  memcpy(self->_glyphs, a3, v14);
  memcpy(self->_advances, a4, v13);
  self->_glyphCount = a5;
  self->_elasticGlyphCount = a6;
  self->_font = (UIFont *)a7;
  -[NSTextLineFragment invalidateCache](self, "invalidateCache");
  *(_BYTE *)&self->_flags &= ~2u;
}

void __95__NSTextLineFragment_enumerateTextSegmentBoundsInTextRange_dataSourceLocationsOnly_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSTextRange *v14;
  __int128 v15;
  __int128 v16;

  v10 = (void *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "textLayoutFragment"), "textParagraph");
  if (v10
    && (v11 = v10,
        v16 = xmmword_18D6CBB80,
        (v12 = objc_msgSend(v10, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a2, 0, &v16)) != 0))
  {
    v13 = v12;
    v15 = xmmword_18D6CBB80;
    v14 = (NSTextRange *)objc_msgSend(v11, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a2 + a3, 0, &v15);
    if (v14)
      v14 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v13, v14);
  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + *(double *)(a1 + 80) + a4, *(double *)(a1 + 56), a5 - a4, *(double *)(a1 + 72));

}

uint64_t __65__NSTextLineFragment_drawTextAttachmentsAtPoint_graphicsContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "applicationFrameworkContext"), *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (void)drawTextAttachmentsAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  __CTLine *lineRef;
  double y;
  double x;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned int Type;
  unsigned int v16;
  CFIndex v17;
  double v18;
  uint64_t v19;
  const __CTRun *ValueAtIndex;
  CFDictionaryRef Attributes;
  uint64_t v22;
  uint64_t v23;
  const __CFArray *v24;
  NSTextLayoutFragment *v25;
  CFIndex location;
  double TypographicBounds;
  double v28;
  id v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSTextLayoutManager *v35;
  NSCountableTextLocation *v36;
  NSCountableTextLocation *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  CFIndex v41;
  char v42;
  _QWORD v43[13];
  char v44;
  CGFloat descent;
  CGFloat ascent;
  CGPoint buffer;
  CFRange v48;
  CFRange v49;

  lineRef = self->_lineRef;
  if (lineRef)
  {
    y = a3.y;
    x = a3.x;
    GlyphRuns = CTLineGetGlyphRuns(lineRef);
    Count = CFArrayGetCount(GlyphRuns);
    -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
    v12 = v11;
    v14 = v13;
    if (objc_msgSend(a4, "CGContext"))
    {
      Type = CGContextGetType();
      if (Type <= 9)
        v16 = (0x1E9u >> Type) & 1;
      else
        LOBYTE(v16) = 1;
      v42 = v16;
    }
    else
    {
      v42 = 0;
    }
    if (Count >= 1)
    {
      v17 = 0;
      v40 = x + v12;
      v18 = y + v14;
      v19 = *MEMORY[0x1E0CA85C0];
      v41 = Count;
      v39 = *MEMORY[0x1E0CA85C0];
      do
      {
        ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v17);
        Attributes = CTRunGetAttributes(ValueAtIndex);
        if (-[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", v19))
        {
          v22 = -[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
          if (v22)
          {
            v23 = v22;
            v24 = GlyphRuns;
            v25 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
            location = CTRunGetStringRange(ValueAtIndex).location;
            buffer.x = 0.0;
            buffer.y = 0.0;
            descent = 0.0;
            ascent = 0.0;
            v48.location = 0;
            v48.length = 0;
            TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v48, &ascent, &descent, 0);
            v49.location = 0;
            v49.length = 1;
            CTRunGetPositions(ValueAtIndex, v49, &buffer);
            v28 = buffer.x;
            v29 = a4;
            v30 = objc_msgSend(a4, "isFlipped");
            v31 = buffer.y;
            v32 = descent;
            v33 = ascent;
            if (v30)
              v34 = -descent;
            else
              v34 = descent;
            if (v25
              && (v35 = -[NSTextLayoutFragment textLayoutManager](v25, "textLayoutManager"),
                  (v36 = (NSCountableTextLocation *)-[NSTextParagraph locationForCharacterIndex:dataSourceLocationsOnly:actualRange:](-[NSTextLayoutFragment textParagraph](v25, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location, 0, 0)) != 0))
            {
              v37 = v36;
              v38 = -[NSTextLayoutManager textContainerForLocation:](v35, "textContainerForLocation:", v36);
            }
            else
            {
              v37 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", location);
              v38 = 0;
            }
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __65__NSTextLineFragment_drawTextAttachmentsAtPoint_graphicsContext___block_invoke;
            v43[3] = &unk_1E26051B8;
            *(double *)&v43[9] = v40 + v28;
            *(double *)&v43[10] = v18 - (v31 + v34);
            *(double *)&v43[11] = TypographicBounds;
            *(double *)&v43[12] = v33 + v32;
            v43[4] = v23;
            v43[5] = Attributes;
            v43[6] = v37;
            v43[7] = v38;
            v43[8] = self;
            v44 = v42;
            a4 = v29;
            -[NSTextLineFragment _setCurrentGraphicsContext:duringBlock:](self, "_setCurrentGraphicsContext:duringBlock:", v29, v43, v39);

            GlyphRuns = v24;
            Count = v41;
            v19 = v39;
          }
        }
        ++v17;
      }
      while (Count != v17);
    }
  }
}

- (void)_enumerateTextSegmentsInCharacterRange:(_NSRange)a3 usingBlock:(id)a4
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const __CFArray *GlyphRuns;
  CFIndex v14;
  NSUInteger length;
  double v16;
  NSUInteger location;
  double v18;
  __CTLine *lineRef;
  const __CFArray *v20;
  const __CTRun *ValueAtIndex;
  CFRange StringRange;
  NSRange v23;
  char Status;
  unsigned int v25;
  double OffsetForStringIndex;
  NSUInteger v28;
  double WidthOfRuns;
  double v31;
  NSRange v32;
  NSTextLineFragment *v33;
  CFIndex Count;
  CGFloat v37;
  CGFloat secondaryOffset;
  NSRange v39;

  v5 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled](NSTextLayoutFragment, "coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v6 = 0.0;
    if (v5)
    {
      -[NSTextLineFragment typographicBounds](self, "typographicBounds");
      v8 = v7;
      -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
      v6 = v8 + v9;
    }
    -[NSTextLineFragment locationForCharacterAtIndex:](self, "locationForCharacterAtIndex:", a3.location);
    v11 = v10;
    -[NSTextLineFragment locationForCharacterAtIndex:](self, "locationForCharacterAtIndex:", a3.location + a3.length);
    (*((void (**)(id, NSUInteger, NSUInteger, double, double))a4 + 2))(a4, a3.location, a3.length, v11 - v6, v12 - v6);
    return;
  }
  GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
  Count = CFArrayGetCount(GlyphRuns);
  if (Count < 1)
    return;
  v14 = 0;
  length = 0;
  v16 = 0.0;
  location = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0.0;
  v33 = self;
  do
  {
    lineRef = self->_lineRef;
    v20 = CTLineGetGlyphRuns(lineRef);
    ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v20, v14);
    StringRange = CTRunGetStringRange(ValueAtIndex);
    v23 = NSIntersectionRange(a3, (NSRange)StringRange);
    v37 = 0.0;
    secondaryOffset = 0.0;
    Status = CTRunGetStatus(ValueAtIndex);
    if (!v23.length)
    {
      v31 = 0.0;
      if (!length)
      {
        v16 = 0.0;
        v18 = 0.0;
        goto LABEL_35;
      }
      OffsetForStringIndex = 0.0;
LABEL_32:
      (*((void (**)(id, NSUInteger, NSUInteger, double, double))a4 + 2))(a4, location, length, v18, v16);
      v16 = v31;
      length = v23.length;
      v18 = OffsetForStringIndex;
LABEL_35:
      location = v23.location;
      goto LABEL_38;
    }
    v25 = Status & 1;
    OffsetForStringIndex = CTLineGetOffsetForStringIndex(lineRef, v23.location, &secondaryOffset);
    if (OffsetForStringIndex != secondaryOffset && v23.location == StringRange.location)
      OffsetForStringIndex = getWidthOfRuns(lineRef, 0, v14 + v25);
    v28 = v23.location + v23.length;
    WidthOfRuns = CTLineGetOffsetForStringIndex(lineRef, v23.location + v23.length, &v37);
    if (WidthOfRuns != v37 && v28 == StringRange.location + StringRange.length)
      WidthOfRuns = getWidthOfRuns(lineRef, 0, v14 + (v25 ^ 1));
    if (WidthOfRuns >= OffsetForStringIndex)
      v31 = WidthOfRuns;
    else
      v31 = OffsetForStringIndex;
    if (WidthOfRuns < OffsetForStringIndex)
      OffsetForStringIndex = WidthOfRuns;
    if (length)
    {
      if (OffsetForStringIndex - v16 >= 0.001 || location + length != v23.location && v28 != location)
      {
        self = v33;
        goto LABEL_32;
      }
      v39.location = location;
      v39.length = length;
      v32 = NSUnionRange(v39, v23);
      location = v32.location;
      length = v32.length;
      v16 = v31;
    }
    else
    {
      v16 = v31;
      length = v23.length;
      v18 = OffsetForStringIndex;
      location = v23.location;
    }
    self = v33;
LABEL_38:
    ++v14;
  }
  while (Count != v14);
  if (length)
    (*((void (**)(id, NSUInteger, NSUInteger, double, double))a4 + 2))(a4, location, length, v18, v16);
}

- (void)_enumerateTextAttachmentFramesInCharacterRange:(_NSRange)a3 usingBlock:(id)a4
{
  __CTLine *lineRef;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  double v9;
  double v10;
  double v11;
  double v12;
  CFIndex v13;
  uint64_t v14;
  const __CTRun *ValueAtIndex;
  CFDictionaryRef Attributes;
  uint64_t v17;
  uint64_t v18;
  CFIndex location;
  double TypographicBounds;
  double v21;
  CGFloat ascent;
  CGPoint buffer;
  CFRange v24;
  CFRange v25;

  lineRef = self->_lineRef;
  if (lineRef)
  {
    GlyphRuns = CTLineGetGlyphRuns(lineRef);
    Count = CFArrayGetCount(GlyphRuns);
    -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
    if (Count >= 1)
    {
      v11 = v9;
      v12 = v10;
      v13 = 0;
      v14 = *MEMORY[0x1E0CA85C0];
      do
      {
        ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v13);
        Attributes = CTRunGetAttributes(ValueAtIndex);
        if (-[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", v14))
        {
          v17 = -[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
          if (v17)
          {
            v18 = v17;
            location = CTRunGetStringRange(ValueAtIndex).location;
            buffer.x = 0.0;
            buffer.y = 0.0;
            v21 = 0.0;
            ascent = 0.0;
            v24.location = 0;
            v24.length = 0;
            TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v24, &ascent, &v21, 0);
            v25.location = 0;
            v25.length = 1;
            CTRunGetPositions(ValueAtIndex, v25, &buffer);
            (*((void (**)(id, uint64_t, CFIndex, double, double, double, double))a4 + 2))(a4, v18, location, v11 + buffer.x, v12 - (buffer.y - v21), TypographicBounds, v21 + ascent);
          }
        }
        ++v13;
      }
      while (Count != v13);
    }
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NSAttributedString string](-[NSTextLineFragment attributedString](self, "attributedString"), "string");
  v6 = -[NSTextLineFragment characterRange](self, "characterRange");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p \"%@\">"), v4, self, -[NSString substringWithRange:](v5, "substringWithRange:", v6, v7));
}

- (__CTLine)lineRef
{
  __CTLine *v2;
  __CTLine *lineRef;
  CFTypeRef v5;

  objc_sync_enter(self);
  lineRef = self->_lineRef;
  if (lineRef)
  {
    v5 = CFRetain(self->_lineRef);
    v2 = (__CTLine *)CFAutorelease(v5);
  }
  objc_sync_exit(self);
  if (lineRef)
    return v2;
  else
    return 0;
}

+ (__CFDictionary)_hiddenContentRenderingAttributes
{
  if (_hiddenContentRenderingAttributes_onceToken != -1)
    dispatch_once(&_hiddenContentRenderingAttributes_onceToken, &__block_literal_global_20);
  return (__CFDictionary *)_hiddenContentRenderingAttributes_renderingAttributes;
}

id __55__NSTextLineFragment__hiddenContentRenderingAttributes__block_invoke()
{
  uint64_t v0;
  objc_class *v1;
  id result;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = _NSTextScalingTypeForCurrentEnvironment();
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v1 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v0);
  }
  else
  {
    v1 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v3 = CFSTR("NSColor");
  v4[0] = -[objc_class clearColor](v1, "clearColor");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  _hiddenContentRenderingAttributes_renderingAttributes = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLineFragment)initWithCoder:(NSCoder *)aDecoder
{
  NSUInteger v5;

  if (-[NSCoder allowsKeyedCoding](aDecoder, "allowsKeyedCoding"))
  {
    self->_attributedString = (NSAttributedString *)-[NSCoder decodeObjectOfClass:forKey:](aDecoder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.attributedString"));
    self->_characterRange.location = objc_msgSend(-[NSCoder decodeObjectOfClass:forKey:](aDecoder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.range")), "rangeValue");
    self->_characterRange.length = v5;
    -[NSTextLineFragment invalidateCache](self, "invalidateCache");
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_attributedString, CFSTR("NS.attributedString"));
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_characterRange.location, self->_characterRange.length), CFSTR("NS.range"));
  }
}

- (id)lineBadge
{
  return self->_lineBadge;
}

- (void)setLineBadge:(id)a3
{
  NSAttributedString *v4;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");

  self->_lineBadge = v4;
}

- (BOOL)isHyphenated
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setIsHyphenated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)isTruncated
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)setIsTruncated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

uint64_t __45__NSTextLineFragment_boundsWithType_options___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = CTFontGetLanguageAwareOutsets();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v3 + 32) < 0.0)
  {
    *(_QWORD *)(v3 + 32) = 0;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  if (*(double *)(v3 + 48) < 0.0)
    *(_QWORD *)(v3 + 48) = 0;
  return result;
}

void __45__NSTextLineFragment_boundsWithType_options___block_invoke_2(uint64_t a1, CTFontRef font)
{
  double v3;
  uint64_t v4;
  double v5;
  CGRect BoundingBox;

  BoundingBox = CTFontGetBoundingBox(font);
  v3 = *(double *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3 - BoundingBox.origin.y > *(double *)(v4 + 32))
  {
    *(double *)(v4 + 32) = v3 - BoundingBox.origin.y;
    v3 = *(double *)(a1 + 48);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  v5 = BoundingBox.origin.y + BoundingBox.size.height - (v3 + *(double *)(a1 + 64));
  if (v5 > *(double *)(v4 + 48))
    *(double *)(v4 + 48) = v5;
}

uint64_t __45__NSTextLineFragment_boundsWithType_options___block_invoke_3(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSFont")))
    NSDefaultFont();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (__CTRun)_findRunForStringIndex:(int64_t)a3 runIndex:(int64_t *)a4
{
  __CTRun *activeRun;
  CFRange v8;
  BOOL v9;
  const __CFArray *GlyphRuns;
  CFIndex v11;
  const __CTRun *ValueAtIndex;
  CFRange StringRange;

  if (!self->_lineRef)
    return 0;
  objc_sync_enter(self);
  activeRun = self->_activeRun;
  if (!activeRun
    || ((v8 = CTRunGetStringRange(activeRun), v8.location <= a3) ? (v9 = v8.location + v8.length <= a3) : (v9 = 1), v9))
  {
    GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
    if (CFArrayGetCount(GlyphRuns) < 1)
LABEL_13:
      __assert_rtn("__NSFindRunForStringIndex", "NSTextLineFragment.m", 445, "NO && \"couldn't find run for character at given index\");
    v11 = 0;
    while (1)
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v11);
      StringRange = CTRunGetStringRange(ValueAtIndex);
      if (StringRange.location <= a3 && StringRange.location + StringRange.length > a3)
        break;
      if (++v11 >= CFArrayGetCount(GlyphRuns))
        goto LABEL_13;
    }
    self->_activeRun = ValueAtIndex;
    self->_activeRunIndex = v11;
    if (a4)
      *a4 = v11;
  }
  else
  {
    if (a4)
      *a4 = self->_activeRunIndex;
    ValueAtIndex = self->_activeRun;
  }
  objc_sync_exit(self);
  return ValueAtIndex;
}

uint64_t __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;
  uint64_t v12;

  result = objc_msgSend(a2, "rangeOfCharacterFromSet:options:", a1[4], 8);
  if (!v12)
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if ((unint64_t)(a3 + a4) >= a1[6])
    *a7 = 1;
  return result;
}

uint64_t __95__NSTextLineFragment_enumerateCaretOffsetsWithTextSelectionDataSource_baseLocation_usingBlock___block_invoke(uint64_t a1, unint64_t a2, char a3, _BYTE *a4, double a5)
{
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  uint64_t result;
  char v13;
  unint64_t v14;
  unint64_t v15;
  char v16;

  v8 = *(double *)(a1 + 72) + a5;
  if (v8 >= *(double *)(a1 + 80))
    v9 = *(double *)(a1 + 80);
  else
    v9 = v8;
  v16 = 0;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v14 = 0;
    v15 = 0;
    v11 = (a3 & 1) != 0 || a2 + 1 != *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 88);
    result = objc_msgSend(v10, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a2, v11, &v14);
    if (!result || a2 < v14 || a2 - v14 >= v15)
    {
      v13 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "locationFromLocation:withOffset:", *(_QWORD *)(a1 + 48), a2 - *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16));
  }
  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 64) + 16))(v9);
  v13 = v16;
LABEL_14:
  *a4 = v13;
  return result;
}

- (BOOL)_selectionColorShouldOverrideColor:(id)a3
{
  uint64_t (**v4)(id, id);

  v4 = -[NSTextLayoutManager isSelectionOverridableColor](-[NSTextLayoutFragment textLayoutManager](-[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment"), "textLayoutManager"), "isSelectionOverridableColor");
  if (v4)
    LOBYTE(v4) = v4[2](v4, a3);
  return (char)v4;
}

- (unint64_t)numberOfGlyphs
{
  unint64_t v3;

  if (self->_lineRef)
    return CTLineGetGlyphCount(self->_lineRef);
  -[NSTextLineFragment characterRange](self, "characterRange");
  return v3;
}

double __50__NSTextLineFragment_drawAtPoint_graphicsContext___block_invoke(uint64_t a1, double a2, double a3)
{
  double result;
  CGRect v4;

  v4.size.height = *(CGFloat *)(a1 + 56);
  v4.size.width = a3 - a2;
  v4.origin.x = *(double *)(a1 + 32) + *(double *)(a1 + 64) + a2;
  v4.origin.y = *(CGFloat *)(a1 + 40);
  CGContextFillRect(*(CGContextRef *)(a1 + 72), v4);
  return result;
}

double __50__NSTextLineFragment_locationForCharacterAtIndex___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  double *v5;
  double v6;
  uint64_t v7;
  double result;

  v4 = a1[6];
  v3 = a1[7];
  if (v4 >= v3 + a3)
    v5 = (double *)(*(_QWORD *)(a1[4] + 48) + 16 * v3);
  else
    v5 = (double *)(a2 + 8 * (v4 - v3));
  v6 = *v5;
  v7 = *(_QWORD *)(a1[5] + 8);
  result = v6 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3 fractionOfDistanceThroughGlyph:(double *)a4
{
  double v6;
  __CTLine *lineRef;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  CGSize *advances;
  int64_t glyphCount;
  double v14;
  CGSize *v15;
  CGSize *v16;
  double v17;
  double width;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSTextLayoutFragment *v27;
  NSTextRange *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v38[12];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;

  v6 = a3.x - self->_glyphOrigin.x;
  lineRef = self->_lineRef;
  if (lineRef)
  {
    v8 = a3.y - self->_glyphOrigin.y;
    v55 = 0;
    v56 = (double *)&v55;
    v57 = 0x2020000000;
    v58 = 0;
    v51 = 0;
    v52 = (double *)&v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = -1;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = -1;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __76__NSTextLineFragment_characterIndexForPoint_fractionOfDistanceThroughGlyph___block_invoke;
    v38[3] = &unk_1E2605208;
    v38[4] = self;
    v38[5] = &v43;
    *(double *)&v38[10] = v6;
    *(CGFloat *)&v38[11] = v8;
    v38[6] = &v47;
    v38[7] = &v55;
    v38[8] = &v39;
    v38[9] = &v51;
    CTLineEnumerateCaretOffsets(lineRef, v38);
    if (*((_BYTE *)v40 + 24) || v52[3] > v6 || v44[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v48[3] != -1)
      {
LABEL_40:
        if (a4)
        {
          v33 = v56[3];
          v34 = v52[3];
          v35 = 0.0;
          if (v33 != v34)
          {
            v36 = (v6 - v33) / (v34 - v33);
            if (*((_BYTE *)v40 + 24))
              v36 = 1.0 - v36;
            if (v36 < 0.0)
              v36 = 0.0;
            v35 = fmin(v36, 1.0);
          }
          *a4 = v35;
        }
        v20 = v48[3];
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);
        return v20;
      }
      v9 = -[NSTextLineFragment characterRange](self, "characterRange");
      v48[3] = v9;
      -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
      *((_QWORD *)v52 + 3) = v10;
    }
    else
    {
      v24 = -[NSTextLineFragment characterRange](self, "characterRange");
      v26 = v25;
      v27 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
      v28 = -[NSTextParagraph paragraphSeparatorRange](-[NSTextLayoutFragment textParagraph](v27, "textParagraph"), "paragraphSeparatorRange");
      v29 = v24 + v26;
      if (-[NSTextRange isNotEmpty](v28, "isNotEmpty")
        && -[NSArray lastObject](-[NSTextLayoutFragment textLineFragments](v27, "textLineFragments"), "lastObject") == self)
      {
        v30 = -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](-[NSTextLayoutFragment textLayoutManager](v27, "textLayoutManager"), "textContentManager"), "offsetFromLocation:toLocation:", -[NSTextRange location](v28, "location"), -[NSTextRange endLocation](v28, "endLocation"));
        if (v29 < v30 || v30 < 1)
          v32 = 0;
        else
          v32 = v30;
        v29 -= v32;
      }
      v48[3] = v29;
      v10 = *((_QWORD *)v52 + 3);
    }
    *((_QWORD *)v56 + 3) = v10;
    goto LABEL_40;
  }
  if (self->_glyphs)
  {
    advances = self->_advances;
    glyphCount = self->_glyphCount;
    v14 = 0.0;
    if (glyphCount < 1 || v6 < 0.0)
    {
      v17 = 0.0;
      v16 = self->_advances;
    }
    else
    {
      v15 = &advances[glyphCount];
      v16 = self->_advances;
      do
      {
        v17 = v14;
        width = v16->width;
        ++v16;
        v14 = v14 + width;
      }
      while (v16 < v15 && v14 <= v6);
    }
    if (v6 <= v14)
    {
      v21 = v16 - advances - ((char *)v16 - (char *)advances > 0);
      if (v21 < 0 || (-[NSTextLineFragment characterRange](self, "characterRange"), v21 >= v22))
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextLineFragment.m"), 1282, CFSTR("no character found that contains point"));
      v20 = -[NSTextLineFragment characterRange](self, "characterRange") + v21;
      if (a4)
      {
        v23 = 0.0;
        if (v14 != 0.0)
          v23 = (v6 - v17) / (v14 - v17);
        *a4 = v23;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    if (a4)
      *a4 = 0.0;
    return -[NSTextLineFragment characterRange](self, "characterRange");
  }
  return v20;
}

uint64_t __76__NSTextLineFragment_characterIndexForPoint_fractionOfDistanceThroughGlyph___block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4, double a5)
{
  uint64_t result;
  double v11;
  char v12;
  double v13;
  int v14;

  result = CTRunGetStatus((CTRunRef)objc_msgSend(*(id *)(a1 + 32), "_findRunForStringIndex:runIndex:", a2, 0));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
  if ((result & 1) == a3)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    v13 = *(double *)(a1 + 80);
    if (v13 == a5)
      v14 = a3;
    else
      v14 = 0;
    if (v13 < a5 || v14 != 0)
      *a4 = 1;
  }
  else
  {
    v11 = *(double *)(a1 + 80);
    if (v11 == a5)
      v12 = a3;
    else
      v12 = 0;
    if (v11 > a5 || (v12 & 1) != 0 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == -1)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result & 1;
    }
  }
  return result;
}

- (NSInteger)characterIndexForPoint:(CGPoint)point
{
  double y;
  double x;
  int64_t cachedCharacterIndex;

  y = point.y;
  x = point.x;
  objc_sync_enter(self);
  if (x == self->_cachedPoint.x && y == self->_cachedPoint.y)
  {
    cachedCharacterIndex = self->_cachedCharacterIndex;
  }
  else
  {
    self->_cachedPoint.x = x;
    self->_cachedPoint.y = y;
    cachedCharacterIndex = -[NSTextLineFragment characterIndexForPoint:fractionOfDistanceThroughGlyph:](self, "characterIndexForPoint:fractionOfDistanceThroughGlyph:", &self->_cachedFractionWithinGlyph, x, y);
    self->_cachedCharacterIndex = cachedCharacterIndex;
  }
  objc_sync_exit(self);
  return cachedCharacterIndex;
}

- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point
{
  double y;
  double x;
  double cachedFractionWithinGlyph;

  y = point.y;
  x = point.x;
  objc_sync_enter(self);
  if (x != self->_cachedPoint.x || y != self->_cachedPoint.y)
  {
    self->_cachedPoint.x = x;
    self->_cachedPoint.y = y;
    self->_cachedCharacterIndex = -[NSTextLineFragment characterIndexForPoint:fractionOfDistanceThroughGlyph:](self, "characterIndexForPoint:fractionOfDistanceThroughGlyph:", &self->_cachedFractionWithinGlyph, x, y);
  }
  cachedFractionWithinGlyph = self->_cachedFractionWithinGlyph;
  objc_sync_exit(self);
  return cachedFractionWithinGlyph;
}

- (void)_drawTextCorrectionMarker:(int64_t)a3 characterRange:(_NSRange)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSUInteger v19;
  NSRange v20;
  id v21;
  void *v22;
  NSString *v23;
  _QWORD v24[9];
  double v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;

  y = a5.y;
  x = a5.x;
  length = a4.length;
  location = a4.location;
  v14 = objc_msgSend(a6, "CGContext");
  -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
  if (v14 && length)
  {
    v17 = v15;
    v18 = v16;
    v28.location = -[NSTextLineFragment characterRange](self, "characterRange");
    v28.length = v19;
    v26.location = location;
    v26.length = length;
    v20 = NSIntersectionRange(v26, v28);
    if (!v20.length)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27.location = location;
      v27.length = length;
      v23 = NSStringFromRange(v27);
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextLineFragment.m"), 1425, CFSTR("out of bounds characterRange %@ specified to %@"), v23, NSStringFromSelector(a2));
    }
    v25 = 0.0;
    v21 = +[NSTextCorrectionMarkerRendering textCorrectionAdjustmentAttributedString:range:glyphOrigin:yDelta:](NSTextCorrectionMarkerRendering, "textCorrectionAdjustmentAttributedString:range:glyphOrigin:yDelta:", -[NSTextLineFragment attributedString](self, "attributedString"), v20.location, v20.length, &v25, v17, v18);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __88__NSTextLineFragment__drawTextCorrectionMarker_characterRange_atOrigin_graphicsContext___block_invoke;
    v24[3] = &unk_1E2605230;
    v24[5] = a6;
    v24[6] = a3;
    *(double *)&v24[7] = x + v17;
    *(double *)&v24[8] = y + v18 + v25;
    v24[4] = v21;
    -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v20.location, v20.length, v24);
  }
}

uint64_t __88__NSTextLineFragment__drawTextCorrectionMarker_characterRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, double a2, double a3)
{
  return +[NSTextCorrectionMarkerRendering drawCorrectionMarkerOfType:font:origin:width:graphicsContext:](NSTextCorrectionMarkerRendering, "drawCorrectionMarkerOfType:font:origin:width:graphicsContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56) + a2, *(double *)(a1 + 64), a3 - a2);
}

id __71__NSTextLineFragment_drawTextCorrectionMarkersAtPoint_graphicsContext___block_invoke(double *a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  int64_t v9;
  id result;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  NSTextRange *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v9 = +[NSTextCorrectionMarkerRendering textCorrectionMarkerTypeWithAttributes:](NSTextCorrectionMarkerRendering, "textCorrectionMarkerTypeWithAttributes:");
  result = (id)objc_msgSend((id)objc_msgSend(a4, "endLocation"), "compare:", *((_QWORD *)a1 + 4));
  if (result != (id)-1)
  {
    *a5 = 1;
    return result;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8) + 24);
  if (v9 != -1 && v11 == v9)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)a1 + 10) + 8) + 40), "isEqual:", objc_msgSend(a4, "location")) & 1) != 0)
    {

      goto LABEL_25;
    }
    v11 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8) + 24);
  }
  if (v11 != -1)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 11) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 10) + 8) + 40);
    v15 = (void *)*((_QWORD *)a1 + 6);
    v24 = *((_QWORD *)a1 + 7);
    v25 = (void *)*((_QWORD *)a1 + 5);
    v26 = *((_QWORD *)a1 + 8);
    v16 = a1[12];
    v17 = a1[13];
    v18 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v13, v14);
    v19 = objc_msgSend(a2, "_shouldDrawTextCorrectionMarkerWithType:inRange:", v11, v18);

    if (v19)
    {
      if (v15)
      {
        v20 = objc_msgSend(v15, "rangeForLocation:allowsTrailingEdge:", v13, 0);
        v21 = objc_msgSend(v15, "rangeForLocation:allowsTrailingEdge:", v14, 1);
      }
      else
      {
        v20 = objc_msgSend(a2, "offsetFromLocation:toLocation:", v24, v13);
        v21 = objc_msgSend(a2, "offsetFromLocation:toLocation:", v24, v14);
      }
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v25, "_drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:", v11, v20, v21 - v20, v26, v16, v17);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8) + 24) = v9;

  if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8) + 24) == -1)
    v23 = 0;
  else
    v23 = (id)objc_msgSend(a4, "location");
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 11) + 8) + 40) = v23;

  if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 9) + 8) + 24) == -1)
  {
    result = 0;
    goto LABEL_27;
  }
LABEL_25:
  result = (id)objc_msgSend(a4, "endLocation");
LABEL_27:
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 10) + 8) + 40) = result;
  return result;
}

- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v7;

  if (a4)
  {
    y = a3.y;
    x = a3.x;
    v7 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a4);
    -[NSTextLineFragment drawTextCorrectionMarkersAtPoint:graphicsContext:](self, "drawTextCorrectionMarkersAtPoint:graphicsContext:", v7, x, y);

  }
}

- (void)_drawMarkedTextUnderline:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  CGFloat y;
  CGFloat x;
  NSTextLayoutFragment *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[14];
  char v23;

  y = a5.y;
  x = a5.x;
  v12 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
  v13 = objc_msgSend(a6, "CGContext");
  -[NSTextLineFragment glyphOrigin](self, "glyphOrigin");
  v15 = v14;
  v17 = v16;
  v18 = objc_msgSend(a6, "isFlipped");
  if (v13)
  {
    v19 = v18;
    v20 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSUnderline"));
    v21 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSUnderlineColor"));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__NSTextLineFragment__drawMarkedTextUnderline_inTextRange_atOrigin_graphicsContext___block_invoke;
    v22[3] = &unk_1E2605280;
    v22[4] = v21;
    v22[5] = v20;
    v22[9] = v15;
    v22[10] = v17;
    v23 = v19;
    *(CGFloat *)&v22[11] = x;
    *(CGFloat *)&v22[12] = y;
    v22[13] = v13;
    v22[6] = self;
    v22[7] = v12;
    v22[8] = a6;
    -[NSTextLineFragment enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:](self, "enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:", a4, 1, v22);
  }
}

void __84__NSTextLineFragment__drawMarkedTextUnderline_inTextRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, void *a2, CGFloat a3, double a4, double a5, double a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  __int16 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  objc_class *v26;
  objc_class *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger location;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  _QWORD v40[2];
  NSRange v41;
  NSRange v42;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v14 = v13 & 3;
  if (v13 <= 0)
    v14 = -(-v13 & 3);
  v15 = (double)v14;
  v16 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  if ((v16 & 0x2000) != 0)
  {
    if ((~v16 & 0x3000) != 0)
    {
      if (*(_BYTE *)(a1 + 112))
      {
        v21 = a4 + *(double *)(a1 + 96);
        v22 = 1.0;
        goto LABEL_14;
      }
      v23 = *(double *)(a1 + 96);
      v24 = a4 + 1.0;
    }
    else
    {
      if (*(_BYTE *)(a1 + 112))
      {
        v21 = a4 + a6 + *(double *)(a1 + 96);
        v22 = -1.0;
LABEL_14:
        v20 = v21 + v22;
        goto LABEL_19;
      }
      v23 = *(double *)(a1 + 96);
      v24 = a4 + a6 + -1.0;
    }
    v20 = v23 - v24;
    goto LABEL_19;
  }
  v17 = (a6 - *(double *)(a1 + 80)) * 0.5;
  v18 = floor(v17);
  if (v17 >= 4.0)
    v19 = (v17 - v15) * 0.666;
  else
    v19 = v18;
  if (*(_BYTE *)(a1 + 112))
    v20 = a4 + a6 - v19;
  else
    v20 = a4 + v19;
LABEL_19:
  CGContextSaveGState(*(CGContextRef *)(a1 + 104));
  if (!v12)
  {
    v25 = objc_msgSend(*(id *)(a1 + 48), "applicationFrameworkContext");
    if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
    {
      v26 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v25);
    }
    else
    {
      v26 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
    }
    v27 = v26;
    v28 = -[objc_class blackColor](v26, "blackColor");
    v29 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "textLayoutManager"), "textContentManager");
    v30 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rangeInElement"), "location");
    v31 = objc_msgSend(v29, "offsetFromLocation:toLocation:", v30, objc_msgSend(a2, "location"));
    v32 = objc_msgSend(v29, "offsetFromLocation:toLocation:", v30, objc_msgSend(a2, "endLocation")) - v31;
    v41.location = objc_msgSend(*(id *)(a1 + 48), "characterRange");
    v42.location = v31;
    v42.length = v32;
    location = NSIntersectionRange(v41, v42).location;
    v40[0] = 0;
    v40[1] = 0;
    v34 = (void *)objc_msgSend(*(id *)(a1 + 48), "_defaultRenderingAttributesAtCharacterIndex:effectiveRange:", location, v40);
    if ((objc_msgSend(v34, "count")
       && (v35 = (void *)objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("NSColor"))) != 0
       || ((v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "attributedString"), "attribute:atIndex:effectiveRange:", CFSTR("NSColor"), location, 0)) != 0? (v35 = (void *)v36): (v35 = (void *)v28), v35))&& (objc_msgSend(v35, "isEqual:", v28) & 1) == 0)
    {
      v37 = objc_msgSend(v35, "colorWithAlphaComponent:", 0.8);
    }
    else
    {
      v37 = -[objc_class colorWithWhite:alpha:](v27, "colorWithWhite:alpha:", 0.17, 1.0);
    }
    v12 = v37;
  }
  objc_msgSend(*(id *)(a1 + 48), "_setColor:inGraphicsContext:", v12, *(_QWORD *)(a1 + 64));
  v38 = a3 + a5;
  if (a3 + a5 - a3 > 1.0)
    a3 = a3 + 1.0;
  if (v38 - a3 <= 1.0)
    v39 = v38;
  else
    v39 = v38 + -1.0;
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 104), v15);
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 104), a3, v20);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 104), v39, v20);
  CGContextStrokePath(*(CGContextRef *)(a1 + 104));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 104));
}

- (void)_drawMarkedTextBackground:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  CGContext *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD v14[5];

  v10 = (CGContext *)objc_msgSend(a6, "CGContext", a5.x, a5.y);
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
  if (v11)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = v11;
    if (v11 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    {
      CGContextSaveGState(v10);
      -[NSTextLineFragment _setColor:inGraphicsContext:](self, "_setColor:inGraphicsContext:", v13, a6);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __85__NSTextLineFragment__drawMarkedTextBackground_inTextRange_atOrigin_graphicsContext___block_invoke;
      v14[3] = &__block_descriptor_40_e55_v48__0_CGRect__CGPoint_dd__CGSize_dd__8__NSTextRange_40l;
      v14[4] = v10;
      -[NSTextLineFragment enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:](self, "enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:", a4, 1, v14);
      CGContextRestoreGState(v10);
    }
  }
}

void __85__NSTextLineFragment__drawMarkedTextBackground_inTextRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  const CGPath *v6;

  if (a4 > 1.0)
    a4 = a4 + -1.0;
  v6 = CGPathCreateWithRoundedRect(*(CGRect *)&a2, 3.0, 3.0, 0);
  CGContextAddPath(*(CGContextRef *)(a1 + 32), v6);
  CGContextFillPath(*(CGContextRef *)(a1 + 32));
  CGPathRelease(v6);
}

- (BOOL)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 backgroundOnly:(BOOL)a5 adjustmentCallback:(id)a6
{
  CGFloat y;
  CGFloat x;
  NSTextLayoutFragment *v12;
  uint64_t v13;
  BOOL v14;
  NSTextLayoutManager *v15;
  char v16;
  void *v17;
  id v18;
  _QWORD v20[11];
  BOOL v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v12 = -[NSTextLineFragment textLayoutFragment](self, "textLayoutFragment");
  -[NSTextLineFragment characterRange](self, "characterRange");
  v14 = 0;
  if (v12 && v13)
  {
    v15 = -[NSTextLayoutFragment textLayoutManager](v12, "textLayoutManager");
    v27 = 0;
    v28 = &v27;
    v29 = 0x3052000000;
    v30 = __Block_byref_object_copy__8;
    v31 = __Block_byref_object_dispose__8;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v16 = _os_feature_enabled_impl();
    v17 = (void *)MEMORY[0x18D7917B4]();
    v18 = -[NSTextLineFragment textLineFragmentRange](self, "textLineFragmentRange");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __103__NSTextLineFragment_drawMarkedTextIndicatorAtPoint_graphicsContext_backgroundOnly_adjustmentCallback___block_invoke;
    v20[3] = &unk_1E26052C8;
    v21 = a5;
    v22 = v16 ^ 1;
    *(CGFloat *)&v20[9] = x;
    *(CGFloat *)&v20[10] = y;
    v20[4] = self;
    v20[5] = a4;
    v20[7] = &v27;
    v20[8] = &v23;
    v20[6] = a6;
    -[NSTextLayoutManager markedTextAttributesForRange:usingBlock:](v15, "markedTextAttributesForRange:usingBlock:", v18, v20);
    if (-[__NSMarkedTextUnderlineRenderer renderUnderline:](v28[5], (uint64_t)a6))
      *((_BYTE *)v24 + 24) = 1;

    objc_autoreleasePoolPop(v17);
    v14 = *((_BYTE *)v24 + 24) != 0;
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  return v14;
}

uint64_t __103__NSTextLineFragment_drawMarkedTextIndicatorAtPoint_graphicsContext_backgroundOnly_adjustmentCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v7;
  __NSMarkedTextUnderlineRenderer *v8;
  CGPoint v9;
  __int128 v10;
  objc_super v11;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    result = objc_msgSend(a2, "isNotEmpty");
    if ((_DWORD)result)
    {
      if (*(_BYTE *)(a1 + 88) || !objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSUnderline")))
      {
        v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor"));
        if (v7 && (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_drawMarkedTextBackground:inTextRange:atOrigin:graphicsContext:", a3, a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
      }
      else if (*(_BYTE *)(a1 + 89))
      {
        objc_msgSend(*(id *)(a1 + 32), "_drawMarkedTextUnderline:inTextRange:atOrigin:graphicsContext:", a3, a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80));
      }
      else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v8 = [__NSMarkedTextUnderlineRenderer alloc];
        if (v8)
        {
          v9 = *(CGPoint *)(a1 + 72);
          v10 = *(_OWORD *)(a1 + 32);
          v11.receiver = v8;
          v11.super_class = (Class)__NSMarkedTextUnderlineRenderer;
          v8 = (__NSMarkedTextUnderlineRenderer *)objc_msgSendSuper2(&v11, sel_init);
          if (v8)
          {
            *(_OWORD *)&v8->_textLineFragment = v10;
            v8->_origin = v9;
            v8->_underlineThickness = 2.0;
          }
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v8;
      }
      result = -[__NSMarkedTextUnderlineRenderer processMarkedTextUnderline:textRange:adjustmentCallback:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3, a2, *(_QWORD *)(a1 + 48));
      if ((_DWORD)result)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5
{
  return -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:", a4, 1, a5, a3.x, a3.y);
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5
{
  -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:", a4, 0, a5, a3.x, a3.y);
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
  -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:context:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:context:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v9;

  if (a4)
  {
    y = a3.y;
    x = a3.x;
    v9 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a4);
    -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:", v9, a5, x, y);

  }
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
  return -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:context:adjustmentCallback:](self, "drawMarkedTextBackgroundAtPoint:context:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5
{
  double y;
  double x;
  _NSCGTextGraphicsContext *v9;

  if (!a4)
    return 0;
  y = a3.y;
  x = a3.x;
  v9 = -[_NSCGTextGraphicsContext initWithCGContext:]([_NSCGTextGraphicsContext alloc], "initWithCGContext:", a4);
  LOBYTE(a5) = -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:", v9, 1, a5, x, y);

  return (char)a5;
}

- (BOOL)isExtra
{
  return self->_isExtra;
}

- (void)setIsExtra:(BOOL)a3
{
  self->_isExtra = a3;
}

@end
