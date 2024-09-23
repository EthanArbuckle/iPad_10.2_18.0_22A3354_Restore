@implementation NSTypesetter

- (int64_t)applicationFrameworkContext
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return ((unint64_t)reserved->var19 >> 22) & 7;
}

- (BOOL)usesFontLeading
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (*(_BYTE *)&reserved->var19 >> 4) & 1;
}

- (NSTypesetterBehavior)typesetterBehavior
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return *(_DWORD *)&reserved->var19 & 0xFLL;
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  _BOOL4 v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  int v6;

  v3 = usesFontLeading;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (v3)
    v6 = 16;
  else
    v6 = 0;
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFEF | v6);
}

- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior
{
  char v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  v3 = typesetterBehavior;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFF0 | v3 & 0xF);
}

+ (int64_t)defaultStringDrawingTypesetterBehavior
{
  return __NSStringDrawingTypesetterCompatibilityLevel;
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  *(_QWORD *)reserved->var0 = attributedString;
}

- ($0177D170777CFC227CB001A659B5CD18)_getAuxData
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
  {
    reserved = -[NSTypesetter _allocateAuxData](self, "_allocateAuxData");
    self->_reserved = reserved;
    reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFC7FC0 | objc_msgSend((id)objc_opt_class(), "defaultTypesetterBehavior") & 0xF | 0x28030);
    reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFE3FFFFF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 22));
  }
  return reserved;
}

+ (NSTypesetterBehavior)defaultTypesetterBehavior
{
  return (unint64_t)__NSTypesetterCompatibilityLevel;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  uint64_t v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  LOBYTE(v3) = a3;
  if (!a3)
    v3 = _NSTextScalingTypeForCurrentEnvironment();
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFE3FFFFF | ((v3 & 7) << 22));
}

- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  *((CGFloat *)reserved->var0 + 5) = lineFragmentPadding;
}

- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData
{
  $0177D170777CFC227CB001A659B5CD18 *result;

  result = ($0177D170777CFC227CB001A659B5CD18 *)NSAllocateScannedUncollectable();
  *(_OWORD *)&result->var0 = 0u;
  *(_OWORD *)&result->var1.length = 0u;
  *(_OWORD *)&result->var2.length = 0u;
  *(_OWORD *)&result->var5 = 0u;
  *(_OWORD *)&result->var7 = 0u;
  *(_OWORD *)&result->var9 = 0u;
  *(_OWORD *)&result->var11 = 0u;
  result->var13.origin = 0u;
  result->var13.size = 0u;
  result->var14.origin = 0u;
  result->var14.size = 0u;
  result->var15 = 0u;
  *(_OWORD *)&result->var16 = 0u;
  *(_OWORD *)&result->var18 = 0u;
  *(_OWORD *)&result->var20[2] = 0u;
  *(_OWORD *)&result->var20[4] = 0u;
  *(_OWORD *)&result->var20[6] = 0u;
  *(_OWORD *)&result->var20[8] = 0u;
  *(_OWORD *)&result->var20[10] = 0u;
  result->var20[12] = 0;
  *(_OWORD *)result->var20 = 0u;
  result->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)result->var20;
  return result;
}

- (void)dealloc
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  void *v4;
  objc_super v5;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");

  v4 = self->_reserved;
  if (v4)
    NSZoneFree(0, v4);

  v5.receiver = self;
  v5.super_class = (Class)NSTypesetter;
  -[NSTypesetter dealloc](&v5, sel_dealloc);
}

- (id)defaultParagraphStyle
{
  id result;

  result = self->_defaultParagraphStyle;
  if (!result)
    return +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  return result;
}

- (NSAttributedString)attributedString
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return *(NSAttributedString **)reserved->var0;
}

- (CGFloat)lineFragmentPadding
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return *((double *)reserved->var0 + 5);
}

- (void)setDefaultParagraphStyle:(id)a3
{
  if (self->_defaultParagraphStyle != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_defaultParagraphStyle = (NSParagraphStyle *)a3;
  }
}

+ (id)sharedSystemTypesetterForBehavior:(NSTypesetterBehavior)behavior
{
  return +[NSATSTypesetter sharedTypesetter](NSATSTypesetter, "sharedTypesetter", behavior);
}

- (NSTextContainer)currentTextContainer
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (NSTextContainer *)*((_QWORD *)reserved->var0 + 8);
}

- (BOOL)_forceOriginalFontBaseline
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  if (-[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext") != 2
    || (reserved = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior"),
        reserved != ($0177D170777CFC227CB001A659B5CD18 *)1))
  {
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    LODWORD(reserved) = (*(_BYTE *)&reserved->var19 >> 6) & 1;
  }
  return (char)reserved;
}

- (NSRange)paragraphSeparatorCharacterRange
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  length = reserved->var2.length;
  location = reserved->var2.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)finalizeLineFragmentRect:(CGRect *)a3 lineFragmentUsedRect:(CGRect *)a4 baselineOffset:(double *)a5 forGlyphRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;

  length = a6.length;
  location = a6.location;
  v12 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v12, "layoutManager:shouldSetLineFragmentRect:lineFragmentUsedRect:baselineOffset:inTextContainer:forGlyphRange:", -[NSTypesetter layoutManager](self, "layoutManager"), a3, a4, a5, -[NSTypesetter currentTextContainer](self, "currentTextContainer"), location, length);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v12, "layoutManager:shouldSetLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", -[NSTypesetter layoutManager](self, "layoutManager"), a3, a4, a5, location, length);
  return 0;
}

- (void)endLineWithGlyphRange:(NSRange)lineGlyphRange
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  NSUInteger length;
  $0177D170777CFC227CB001A659B5CD18 *v5;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    ++reserved->var18;
    length = reserved->var1.length;
    v5 = reserved;
  }
  else
  {
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData", lineGlyphRange.location, lineGlyphRange.length);
    v5 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    ++reserved->var18;
    length = reserved->var1.length;
    if (!v5)
      v5 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFBFFFF | ((length == *((_QWORD *)v5->var0 + 2)) << 18));
}

- (NSLayoutManager)layoutManager
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (NSLayoutManager *)*((_QWORD *)reserved->var0 + 6);
}

- (NSRange)paragraphCharacterRange
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  length = reserved->var1.length;
  location = reserved->var1.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)beginLineWithGlyphAtIndex:(NSUInteger)glyphIndex
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  $0177D170777CFC227CB001A659B5CD18 *v6;
  unint64_t v7;

  if (!-[NSTypesetter _isLineBreakModeOverridden](self, "_isLineBreakModeOverridden", glyphIndex))
  {
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (reserved)
    {
      var0 = reserved->var0;
    }
    else
    {
      v6 = -[NSTypesetter _getAuxData](self, "_getAuxData");
      reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
      var0 = v6->var0;
      if (!reserved)
        reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    }
    v7 = objc_msgSend(*((id *)var0 + 8), "maximumNumberOfLines");
    if (v7)
    {
      if (reserved->var18 >= v7)
        *((_QWORD *)var0 + 8) = 0;
    }
  }
}

- (BOOL)_isLineBreakModeOverridden
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (*((unsigned __int8 *)&reserved->var19 + 2) >> 5) & 1;
}

- (NSRange)paragraphSeparatorGlyphRange
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  NSUInteger v5;
  NSUInteger v6;
  NSRange result;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  var0 = reserved->var0;
  v5 = *((_QWORD *)reserved->var0 + 3);
  v6 = *((_QWORD *)var0 + 4);
  result.length = v6;
  result.location = v5;
  return result;
}

- (CGFloat)lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height;
  double width;
  double y;
  double x;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  id v12;
  CGFloat result;
  NSParagraphStyle *v14;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  var0 = reserved->var0;
  v12 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "layoutManager:lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", -[NSTypesetter layoutManager](self, "layoutManager"), glyphIndex, x, y, width, height);
  }
  else if (*((_QWORD *)var0 + 4) || (result = 0.0, *((_QWORD *)var0 + 3) > glyphIndex + 1))
  {
    v14 = -[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle");
    result = 0.0;
    if (v14)
    {
      -[NSParagraphStyle lineSpacing](v14, "lineSpacing", 0.0);
      if (result < 0.0)
        return 0.0;
    }
  }
  return result;
}

- (NSFont)substituteFontForFont:(NSFont *)originalFont
{
  NSLayoutManager *v4;

  v4 = -[NSTypesetter layoutManager](self, "layoutManager");
  if (v4)
    return -[NSLayoutManager substituteFontForFont:](v4, "substituteFontForFont:", originalFont);
  else
    return originalFont;
}

- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7
{
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  unint64_t result;

  length = a3.length;
  location = a3.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  result = *((_QWORD *)reserved->var0 + 6);
  if (result)
    return objc_msgSend((id)result, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", location, length, a4, a5, a6, a7);
  return result;
}

- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $0177D170777CFC227CB001A659B5CD18 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  void *v11;
  NSUInteger v12;
  NSRange result;

  length = charRange.length;
  location = charRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  v9 = reserved;
  if (!reserved)
  {
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    v9 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v9)
      v9 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  var0 = v9->var0;
  if ((*((_BYTE *)&reserved->var19 + 2) & 4) != 0)
  {
    if (actualCharRange)
    {
      actualCharRange->location = location;
      actualCharRange->length = length;
    }
    v11 = (void *)(*((_QWORD *)var0 + 1) + location - reserved->var1.location);
    goto LABEL_11;
  }
  v11 = (void *)*((_QWORD *)var0 + 6);
  if (!v11)
  {
    length = 0;
LABEL_11:
    v12 = length;
    goto LABEL_12;
  }
  v11 = (void *)objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, actualCharRange);
LABEL_12:
  result.length = v12;
  result.location = (NSUInteger)v11;
  return result;
}

- (float)hyphenationFactor
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return reserved->var3;
}

- (CGFloat)paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CGFloat result;
  NSParagraphStyle *v12;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v10 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "layoutManager:paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", -[NSTypesetter layoutManager](self, "layoutManager"), glyphIndex, x, y, width, height);
  }
  else
  {
    v12 = -[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle");
    if (v12 && y > 0.0)
      -[NSParagraphStyle paragraphSpacingBefore](v12, "paragraphSpacingBefore");
    else
      return 0.0;
  }
  return result;
}

- (NSParagraphStyle)currentParagraphStyle
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (NSParagraphStyle *)*((_QWORD *)reserved->var0 + 12);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int v8;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = CFSTR("NSTypesetterBehavior");
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSTypesetterBehavior"))
      || (v4 = CFSTR("NSTypesetterCompatibilityLevel"),
          objc_msgSend(v3, "objectForKey:", CFSTR("NSTypesetterCompatibilityLevel"))))
    {
      v5 = objc_msgSend(v3, "integerForKey:", v4);
      v6 = 6;
      if (v5 < 6)
        v6 = v5;
      __NSTypesetterCompatibilityLevel = v6;
    }
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSStringDrawingTypesetterBehavior")))
    {
      v7 = objc_msgSend(v3, "integerForKey:", CFSTR("NSStringDrawingTypesetterBehavior"));
      v8 = 6;
      if (v7 < 6)
        v8 = v7;
    }
    else
    {
      v8 = __NSTypesetterCompatibilityLevel;
      if (__NSTypesetterCompatibilityLevel >= __NSStringDrawingTypesetterCompatibilityLevel)
      {
LABEL_13:
        __NSDefaultNotShownIMP = +[NSLayoutManager instanceMethodForSelector:](NSLayoutManager, "instanceMethodForSelector:", sel_setNotShownAttribute_forGlyphAtIndex_);
        __NSDefaultDrawsOutsideIMP = +[NSLayoutManager instanceMethodForSelector:](NSLayoutManager, "instanceMethodForSelector:", sel_setDrawsOutsideLineFragment_forGlyphAtIndex_);
        __NSLayoutManagerClass = objc_opt_class();
        return;
      }
    }
    __NSStringDrawingTypesetterCompatibilityLevel = v8;
    goto LABEL_13;
  }
}

- (void)setLineFragmentRect:(NSRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(NSRect)usedRect baselineOffset:(CGFloat)baselineOffset
{
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  double v11;
  double v12;
  double v13;
  double v14;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  void *v17;
  $0177D170777CFC227CB001A659B5CD18 *v18;
  double height;

  height = usedRect.size.height;
  width = usedRect.size.width;
  y = usedRect.origin.y;
  x = usedRect.origin.x;
  length = glyphRange.length;
  location = glyphRange.location;
  v11 = fragmentRect.size.height;
  v12 = fragmentRect.size.width;
  v13 = fragmentRect.origin.y;
  v14 = fragmentRect.origin.x;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    v17 = (void *)*((_QWORD *)reserved->var0 + 6);
  }
  else
  {
    v18 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    v17 = (void *)*((_QWORD *)v18->var0 + 6);
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  reserved->var17 = baselineOffset;
  objc_msgSend(v17, "setTextContainer:forGlyphRange:", -[NSTypesetter currentTextContainer](self, "currentTextContainer"), location, length);
  objc_msgSend(v17, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", location, length, v14, v13, v12, v11, x, y, width, height);
}

- (void)setLocation:(NSPoint)location withAdvancements:(const CGFloat *)advancements forStartOfGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger v6;
  double y;
  double x;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  void *v11;
  $0177D170777CFC227CB001A659B5CD18 *v12;

  if (glyphRange.length)
  {
    length = glyphRange.length;
    v6 = glyphRange.location;
    y = location.y;
    x = location.x;
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (reserved)
    {
      v11 = (void *)*((_QWORD *)reserved->var0 + 6);
    }
    else
    {
      v12 = -[NSTypesetter _getAuxData](self, "_getAuxData", advancements);
      reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
      v11 = (void *)*((_QWORD *)v12->var0 + 6);
      if (!reserved)
        reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    }
    objc_msgSend(v11, "setLocation:forStartOfGlyphRange:", v6, length, x, reserved->var17 - y);
  }
}

- (void)setNotShownAttribute:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v6;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  uint64_t v9;
  $0177D170777CFC227CB001A659B5CD18 *v10;
  void (*var5)(uint64_t, char *, _BOOL8, NSUInteger);

  length = glyphRange.length;
  location = glyphRange.location;
  v6 = flag;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  v9 = *((_QWORD *)reserved->var0 + 6);
  if (v9)
  {
    v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v10)
      v10 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    if (v10->var5)
      var5 = (void (*)(uint64_t, char *, _BOOL8, NSUInteger))v10->var5;
    else
      var5 = (void (*)(uint64_t, char *, _BOOL8, NSUInteger))__NSDefaultNotShownIMP;
    if (location < location + length)
    {
      do
      {
        var5(v9, sel_setNotShownAttribute_forGlyphAtIndex_, v6, location++);
        --length;
      }
      while (length);
    }
  }
}

- (void)endParagraph
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFF87FFF | 0x28000);
}

- (void)beginParagraph
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  NSUInteger length;
  CGSize v5;
  $0177D170777CFC227CB001A659B5CD18 *v6;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  length = reserved->var1.length;
  -[NSTypesetter _updateParagraphStyleCache:](self, "_updateParagraphStyleCache:", -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](-[NSTypesetter attributedString](self, "attributedString"), "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), reserved->var1.location, 0, reserved->var1.location, length));
  v5 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
  reserved->var13.origin = (CGPoint)*MEMORY[0x1E0CB3438];
  reserved->var13.size = v5;
  v6 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v6)
    v6 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFBFFFF | ((length == *((_QWORD *)v6->var0 + 2)) << 18));
}

- (void)_updateParagraphStyleCache:(id)a3
{
  id v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  $0177D170777CFC227CB001A659B5CD18 *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSWritingDirection v14;
  $4E0ED78154A14BB469A82D51316F92F1 var19;
  unsigned int v16;

  v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
    if (a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  var0 = v7->var0;
  if (reserved)
  {
    if (v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (!v3)
LABEL_6:
    v3 = -[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle");
LABEL_7:
  if ((objc_msgSend(*((id *)var0 + 12), "isEqual:", v3) & 1) == 0)
  {
    v3 = (id)objc_msgSend(v3, "copyWithZone:", -[NSTypesetter zone](self, "zone"));

    *((_QWORD *)var0 + 12) = v3;
    objc_msgSend(v3, "lineSpacing");
    reserved->var7 = v8;
    objc_msgSend(v3, "headIndent");
    reserved->var8 = v9;
    objc_msgSend(v3, "tailIndent");
    reserved->var9 = v10;
    objc_msgSend(v3, "minimumLineHeight");
    reserved->var10 = v11;
    objc_msgSend(v3, "maximumLineHeight");
    reserved->var11 = v12;
    objc_msgSend(v3, "lineHeightMultiple");
    reserved->var12 = v13;
    reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFF87FF | ((objc_msgSend(v3, "lineBreakMode") & 0xF) << 11));
  }
  v14 = objc_msgSend(v3, "alignment");
  if (v14 == 4)
  {
    v14 = objc_msgSend(v3, "baseWritingDirection");
    if (v14 == NSWritingDirectionNatural)
      v14 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    LOBYTE(v14) = 2 * (v14 == NSWritingDirectionRightToLeft);
  }
  var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFF87F | ((v14 & 0xF) << 7));
  reserved->var19 = var19;
  if (v3)
  {
    v16 = ((objc_msgSend(v3, "baseWritingDirection") << 19) + 0x80000) & 0x180000;
    var19 = reserved->var19;
  }
  else
  {
    v16 = 0;
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 & 0xFFE7FFFF | v16);
}

- (NSRange)layoutCharactersInRange:(NSRange)characterRange forLayoutManager:(NSLayoutManager *)layoutManager maximumNumberOfLineFragments:(NSUInteger)maxNumLines
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  NSRange result;

  length = characterRange.length;
  location = characterRange.location;
  v11 = characterRange.location + characterRange.length;
  v19 = characterRange.location + characterRange.length;
  v12 = -[NSTextStorage length](-[NSLayoutManager textStorage](layoutManager, "textStorage"), "length");
  if (v11 > v12)
  {
    v13 = v12;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = NSStringFromSelector(a2);
    v20.location = location;
    v20.length = length;
    objc_msgSend(v14, "raise:format:", v15, CFSTR("%@: Invalid character range %@ requested for a text storage with length %d"), v16, NSStringFromRange(v20), v13);
  }
  -[NSTypesetter _layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:maxCharacterIndex:nextGlyphIndex:nextCharacterIndex:](self, "_layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:maxCharacterIndex:nextGlyphIndex:nextCharacterIndex:", layoutManager, -[NSLayoutManager glyphIndexForCharacterAtIndex:](layoutManager, "glyphIndexForCharacterAtIndex:", location), maxNumLines, v11, 0, &v19);
  v17 = v19 - location;
  v18 = location;
  result.length = v17;
  result.location = v18;
  return result;
}

- (void)_layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 maxCharacterIndex:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7 nextCharacterIndex:(unint64_t *)a8
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  __int128 *v12;
  NSUInteger *p_length;
  __int128 v14;
  __int128 v15;
  $0177D170777CFC227CB001A659B5CD18 *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  void *v18;
  uint64_t v19;
  double v20;
  float v21;
  double v22;
  double v23;
  unint64_t v24;
  const void *Value;
  void *v26;
  unint64_t v27;
  void *v28;
  double v29;
  double v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  double v44;
  double v45;
  unint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  unint64_t location;
  void *v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  CGFloat height;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  BOOL v126;
  unint64_t v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  NSUInteger *v133;
  unint64_t *v134;
  unint64_t v135;
  double v136;
  double v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BOOL4 v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t BitmapPtrForPlane;
  uint64_t UnicodePropertyDataForPlane;
  __CFString *v152;
  uint64_t v153;
  const char *CStringPtr;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  UniChar *v159;
  uint64_t v160;
  UniChar v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  UniChar *v168;
  uint64_t v169;
  UniChar v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const __CFString *v182;
  _QWORD *v183;
  _QWORD *v184;
  uint64_t v185;
  double bRect;
  double bRect_8;
  double bRect_16;
  void *bRect_24;
  double v190;
  double v191;
  uint64_t v192;
  double v193;
  double v194;
  double x;
  double y;
  double width;
  double v198;
  double v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  NSUInteger *v203;
  uint64_t v205;
  unint64_t v207;
  CGFloat dX;
  double v211;
  char v212;
  unint64_t v213;
  int v214;
  int v215;
  $0177D170777CFC227CB001A659B5CD18 *v216;
  NSTypesetter *v217;
  unint64_t v218;
  __int128 v219;
  __int128 v220;
  UniChar buffer[8];
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  CFStringRef theString[2];
  __int128 v230;
  __int128 v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  __int128 v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  unint64_t v239;
  unint64_t v240;
  uint64_t v241;
  CFRange v242;
  CFRange v243;
  NSRect v244;
  NSRect v245;
  NSRect v246;
  NSRect v247;
  NSRect v248;
  NSRect v249;
  NSRect v250;
  NSRect v251;
  NSRect v252;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  v216 = reserved;
  v214 = objc_msgSend(a3, "isValidGlyphIndex:", a4);
  v12 = (__int128 *)MEMORY[0x1E0CB3438];
  reserved->var15.length = 0;
  p_length = &reserved->var15.length;
  v14 = *v12;
  v15 = v12[1];
  *(_OWORD *)(p_length - 9) = *v12;
  *(_OWORD *)(p_length - 7) = v15;
  v201 = v15;
  v202 = v14;
  *(_OWORD *)(p_length - 3) = v15;
  *(_OWORD *)(p_length - 5) = v14;
  *(p_length - 1) = 0x7FFFFFFFFFFFFFFFLL;
  v203 = p_length;
  p_length[1] = 0;
  v16 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  v217 = self;
  if (!v16)
    v16 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  var0 = v16->var0;
  v240 = 0;
  v241 = 0;
  v18 = (void *)objc_msgSend(a3, "textContainers");
  *((_QWORD *)var0 + 7) = v18;
  v207 = objc_msgSend(v18, "count");
  if ((v214 & 1) != 0)
    v218 = a4;
  else
    v218 = objc_msgSend(a3, "numberOfGlyphs");
  if (!v207)
    goto LABEL_155;
  if (v218)
    v19 = objc_msgSend(a3, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v218 - 1, &v240, 1);
  else
    v19 = objc_msgSend(*((id *)var0 + 7), "objectAtIndex:", 0);
  *((_QWORD *)var0 + 8) = v19;
  if (v19)
  {
    v238 = 0;
    v239 = 0;
    v236 = 0;
    v237 = 0;
    v200 = *MEMORY[0x1E0CB3430];
    v235 = *MEMORY[0x1E0CB3430];
    *(_QWORD *)var0 = objc_msgSend(a3, "textStorage");
    if (*((id *)var0 + 6) != a3)
    {
      *((_QWORD *)var0 + 6) = a3;
      if (objc_opt_class() != __NSLayoutManagerClass)
      {
        v216->var5 = (void *)objc_msgSend(a3, "methodForSelector:", sel_setNotShownAttribute_forGlyphAtIndex_);
        v216->var6 = (void *)objc_msgSend(a3, "methodForSelector:", sel_setDrawsOutsideLineFragment_forGlyphAtIndex_);
      }
    }
    -[NSTypesetter setTypesetterBehavior:](self, "setTypesetterBehavior:", objc_msgSend(a3, "typesetterBehavior"));
    -[NSTypesetter _setForceOriginalFontBaseline:](self, "_setForceOriginalFontBaseline:", objc_msgSend(a3, "allowsOriginalFontMetricsOverride"));
    -[NSTypesetter setUsesFontLeading:](self, "setUsesFontLeading:", objc_msgSend(a3, "usesFontLeading"));
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", objc_msgSend(a3, "applicationFrameworkContext"));
    objc_msgSend(a3, "hyphenationFactor");
    v21 = v20;
    if (v21 == 0.0 && objc_msgSend(a3, "usesDefaultHyphenation"))
    {
      +[NSParagraphStyle _defaultHyphenationFactor](NSParagraphStyle, "_defaultHyphenationFactor");
      v21 = *(float *)&v20;
    }
    *(float *)&v20 = v21;
    -[NSTypesetter setHyphenationFactor:](self, "setHyphenationFactor:", v20);
    v205 = objc_msgSend(*(id *)var0, "string");
    objc_msgSend(*((id *)var0 + 8), "size");
    *((double *)var0 + 10) = v23;
    *((double *)var0 + 11) = v22;
    if (v23 <= 0.0)
      *((_QWORD *)var0 + 10) = 0x416312D000000000;
    if (v22 <= 0.0)
      *((_QWORD *)var0 + 11) = 0x416312D000000000;
    *((_QWORD *)var0 + 9) = objc_msgSend(*((id *)var0 + 7), "indexOfObjectIdenticalTo:", *((_QWORD *)var0 + 8));
    objc_msgSend(*((id *)var0 + 8), "lineFragmentPadding");
    -[NSTypesetter setLineFragmentPadding:](self, "setLineFragmentPadding:");
    v216->var18 = 0;
    if (!v218)
    {
      v31 = 8;
      if (v214)
        v31 = 1;
      v212 = v31;
      if (_NSTypesetterTextBlockRetriesDict)
      {
        os_unfair_lock_lock_with_options();
        CFDictionaryRemoveValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock);
      }
      goto LABEL_69;
    }
    v24 = v218 - 1;
    v212 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v218 - 1));
    if (_NSTypesetterTextBlockRetriesDict
      && (os_unfair_lock_lock_with_options(),
          Value = CFDictionaryGetValue((CFDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3),
          CFDictionaryRemoveValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3),
          os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock),
          (const void *)v218 == Value))
    {
      CFDictionarySetValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3, Value);
      v212 |= 0x20u;
    }
    else if (*((double *)var0 + 11) < 10000000.0 && (v212 & 0x20) != 0)
    {
      v26 = (void *)objc_msgSend(*((id *)var0 + 12), "textBlocks");
      if (v26)
      {
        if (objc_msgSend(v26, "count"))
        {
          v212 = 8;
          goto LABEL_44;
        }
      }
    }
    if (*((double *)var0 + 11) < 10000000.0 && (v212 & 0x20) != 0)
    {
      v27 = *((_QWORD *)var0 + 9) + 1;
      *((_QWORD *)var0 + 9) = v27;
      if (v27 >= v207)
      {
        *((_QWORD *)var0 + 8) = 0;
      }
      else
      {
        v28 = (void *)objc_msgSend(*((id *)var0 + 7), "objectAtIndex:");
        *((_QWORD *)var0 + 8) = v28;
        objc_msgSend(v28, "size");
        *((double *)var0 + 10) = v30;
        *((double *)var0 + 11) = v29;
        if (v30 <= 0.0)
          *((_QWORD *)var0 + 10) = 0x416312D000000000;
        if (v29 <= 0.0)
          *((_QWORD *)var0 + 11) = 0x416312D000000000;
        objc_msgSend(*((id *)var0 + 8), "lineFragmentPadding");
        -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
      }
      v212 = 8;
      goto LABEL_60;
    }
LABEL_44:
    v32 = objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v24);
    v33 = objc_msgSend(*(id *)var0, "length");
    v34 = (void *)objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v32, 0), "textBlocks");
    objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v24, 0, 1);
    *(_QWORD *)&v235 = 0;
    *((double *)&v235 + 1) = v35 + v36;
    if (!v34 || (v37 = objc_msgSend(v34, "count")) == 0)
    {
LABEL_60:
      v46 = objc_msgSend(*((id *)var0 + 8), "maximumNumberOfLines");
      if (v46)
      {
        if (v241)
        {
          *(_QWORD *)buffer = v240;
          *(_QWORD *)&buffer[4] = 0;
          if (v240 < v218)
          {
            v47 = 0;
            do
            {
              objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:");
              --v47;
            }
            while (*(_QWORD *)&buffer[4] + *(_QWORD *)buffer < v218);
            if (v47)
            {
              if (-v47 >= v46)
              {
                *((_QWORD *)var0 + 8) = 0;
              }
              else
              {
                v216->var18 -= v47;
                a5 -= v47;
              }
            }
          }
        }
      }
LABEL_69:
      if (!*((_QWORD *)var0 + 8))
        goto LABEL_156;
      v48 = CFSTR("NSParagraphStyle");
      v198 = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v199 = *MEMORY[0x1E0CB3438];
      v193 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      v194 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v49 = (_QWORD *)&v231 + 1;
      while (1)
      {
        if (v216->var18 >= a5)
          goto LABEL_156;
        if ((v214 & 1) == 0)
        {
          if ((v212 & 8) != 0)
          {
            *(_OWORD *)buffer = 0u;
            v222 = 0u;
            v219 = 0u;
            v220 = 0u;
            -[NSTypesetter getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:](v217, "getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:", buffer, &v219, v218, 0, v235);
            objc_msgSend(a3, "setExtraLineFragmentRect:usedRect:textContainer:", *((_QWORD *)var0 + 8), *(double *)buffer, *(double *)&buffer[4], v222, v219, v220);
          }
          goto LABEL_155;
        }
        if (objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v218) >= a6)
          goto LABEL_156;
        v212 = -[NSTypesetter _getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:](v217, "_getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:", &v238, &v236, objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v218), a3, v205);
        if ((v212 & 0x28) != 0)
        {
          v50 = v238;
          v51 = v239;
          v52 = v236;
          v53 = v237;
        }
        else
        {
          v52 = objc_msgSend(a3, "numberOfGlyphs");
          v53 = 0;
          v50 = v218;
          v51 = v52 - v218;
          v238 = v218;
          v239 = v52 - v218;
          v236 = v52;
          v237 = 0;
        }
        -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](v217, "setParagraphGlyphRange:separatorGlyphRange:", v50, v51, v52, v53);
        v238 = -[NSTypesetter paragraphGlyphRange](v217, "paragraphGlyphRange");
        v239 = v54;
        v55 = -[NSTypesetter layoutParagraphAtPoint:](v217, "layoutParagraphAtPoint:", &v235);
        v218 = v55;
        if (!NSIsEmptyRect(v216->var13) && v216->var13.size.width < 10000000.0)
        {
          v56 = (void *)objc_msgSend(*((id *)var0 + 12), "textBlocks");
          if (v56)
          {
            if (objc_msgSend(v56, "count"))
            {
              location = v216->var1.location;
              if (location < objc_msgSend(*(id *)var0, "length"))
              {
                v58 = (void *)objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", v48, v216->var1.location, 0), "textBlocks");
                v59 = v58;
                if (v58)
                {
                  v60 = objc_msgSend(v58, "count");
                  if (v60)
                  {
                    v61 = v216->var1.location;
                    if (v61 < objc_msgSend(*(id *)var0, "length"))
                      break;
                  }
                }
              }
            }
          }
        }
LABEL_131:
        if (!*((_QWORD *)var0 + 8))
        {
          if (!v55)
          {
            v218 = 0;
            goto LABEL_156;
          }
          if (v55 >= v237 + v236)
            goto LABEL_151;
          v131 = (void *)objc_msgSend(a3, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v55 - 1, 0, 1);
          v132 = v131;
          if (!v131 || !objc_msgSend(v131, "lineBreakMode"))
            goto LABEL_151;
          v219 = 0uLL;
          *((_QWORD *)var0 + 8) = v132;
          *((_QWORD *)var0 + 9) = objc_msgSend(*((id *)var0 + 7), "indexOfObject:", v132);
          objc_msgSend(*((id *)var0 + 8), "size");
          *((double *)var0 + 10) = v137;
          *((double *)var0 + 11) = v136;
          if (v137 <= 0.0)
            *((_QWORD *)var0 + 10) = 0x416312D000000000;
          if (v136 <= 0.0)
            *((_QWORD *)var0 + 11) = 0x416312D000000000;
          objc_msgSend(*((id *)var0 + 8), "lineFragmentPadding");
          -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
          objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v55 - 1, &v219, 1);
          *(_QWORD *)&v235 = v138;
          *((_QWORD *)&v235 + 1) = v139;
          v140 = v219;
          if ((unint64_t)v219 >= v238 && (unint64_t)v219 - v238 < v239)
          {
            v141 = -[NSTypesetter paragraphSeparatorCharacterRange](v217, "paragraphSeparatorCharacterRange");
            v143 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:", v141, v142, 0);
            v144 = 0;
            *((_QWORD *)&v219 + 1) = v143 + v145 - v219;
            goto LABEL_232;
          }
          if ((_QWORD)v219)
          {
            v146 = v219;
            v184 = v49;
            v213 = v219;
            while (1)
            {
              -[NSTypesetter _getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:](v217, "_getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:", &v238, &v236, objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v146), a3, v205);
              v147 = v219;
              if (v239)
                break;
              objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", (_QWORD)v219 - 1, &v219, 1);
              *(_QWORD *)&v235 = v148;
              *((_QWORD *)&v235 + 1) = v149;
              v146 = v219;
              if (!(_QWORD)v219)
              {
                if (-[NSTypesetter bidiProcessingEnabled](v217, "bidiProcessingEnabled")
                  && (*((_BYTE *)&v216->var19 + 1) & 0x80) == 0)
                {
                  BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
                  UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
                  v232 = 0;
                  v230 = 0u;
                  v231 = 0u;
                  v228 = 0u;
                  *(_OWORD *)theString = 0u;
                  v226 = 0u;
                  v227 = 0u;
                  v224 = 0u;
                  v225 = 0u;
                  v222 = 0u;
                  v223 = 0u;
                  *(_OWORD *)buffer = 0u;
                  v152 = (__CFString *)objc_msgSend(*(id *)var0, "string");
                  v153 = -[__CFString length](v152, "length");
                  theString[0] = v152;
                  *((_QWORD *)&v230 + 1) = 0;
                  *(_QWORD *)&v231 = v153;
                  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v152);
                  if (theString[1])
                    CStringPtr = 0;
                  else
                    CStringPtr = CFStringGetCStringPtr(v152, 0x600u);
                  *(_QWORD *)&v230 = CStringPtr;
                  *v49 = 0;
                  v49[1] = 0;
                  v155 = objc_msgSend(a3, "characterRangeForGlyphRange:actualGlyphRange:", v219, 0);
                  v157 = v155 + v156;
                  if (v155 < (unint64_t)(v155 + v156))
                  {
                    while (1)
                    {
                      if (v155 < 0 || (v158 = v231, (uint64_t)v231 <= v155))
                      {
                        LOWORD(v162) = 0;
                        goto LABEL_187;
                      }
                      v159 = (UniChar *)theString[1];
                      if (theString[1])
                        break;
                      if (!(_QWORD)v230)
                      {
                        if (v232 <= v155 || (v171 = *((_QWORD *)&v231 + 1), *((uint64_t *)&v231 + 1) > v155))
                        {
                          v172 = v155 - 4;
                          if ((unint64_t)v155 < 4)
                            v172 = 0;
                          if (v172 + 64 < (uint64_t)v231)
                            v158 = v172 + 64;
                          *((_QWORD *)&v231 + 1) = v172;
                          v232 = v158;
                          v242.location = *((_QWORD *)&v230 + 1) + v172;
                          v242.length = v158 - v172;
                          CFStringGetCharacters(theString[0], v242, buffer);
                          v171 = *((_QWORD *)&v231 + 1);
                        }
                        v160 = v155 - v171;
                        v159 = buffer;
                        goto LABEL_185;
                      }
                      v161 = *(char *)(v230 + *((_QWORD *)&v230 + 1) + v155);
LABEL_198:
                      v162 = v161;
                      if (v161 >> 10 != 54)
                        goto LABEL_187;
                      v166 = v155 + 1;
                      v167 = v231;
                      if ((uint64_t)v231 <= v155 + 1)
                        goto LABEL_194;
                      v168 = (UniChar *)theString[1];
                      if (theString[1])
                      {
                        v169 = *((_QWORD *)&v230 + 1) + v166;
LABEL_202:
                        v170 = v168[v169];
                        goto LABEL_213;
                      }
                      if (!(_QWORD)v230)
                      {
                        if (v232 <= v166 || (v173 = *((_QWORD *)&v231 + 1), *((uint64_t *)&v231 + 1) > v166))
                        {
                          v174 = v155 - 3;
                          if ((unint64_t)v155 < 3)
                            v174 = 0;
                          if (v174 + 64 < (uint64_t)v231)
                            v167 = v174 + 64;
                          *((_QWORD *)&v231 + 1) = v174;
                          v232 = v167;
                          v243.location = *((_QWORD *)&v230 + 1) + v174;
                          v243.length = v167 - v174;
                          CFStringGetCharacters(theString[0], v243, buffer);
                          v173 = *((_QWORD *)&v231 + 1);
                        }
                        v169 = v166 - v173;
                        v168 = buffer;
                        goto LABEL_202;
                      }
                      v170 = *(char *)(v230 + *((_QWORD *)&v230 + 1) + v166);
LABEL_213:
                      if (v170 >> 10 != 55)
                        goto LABEL_194;
                      v162 = (v162 << 10) + v170 - 56613888;
                      if ((v162 & 0x1F0000) == 0)
                      {
                        ++v155;
LABEL_187:
                        v163 = BitmapPtrForPlane;
                        v164 = UnicodePropertyDataForPlane;
                        if (BitmapPtrForPlane)
                          goto LABEL_188;
                        goto LABEL_189;
                      }
                      v163 = CFUniCharGetBitmapPtrForPlane();
                      v164 = CFUniCharGetUnicodePropertyDataForPlane();
                      ++v155;
                      if (v163)
                      {
LABEL_188:
                        if (((*(unsigned __int8 *)(v163 + ((unsigned __int16)v162 >> 3)) >> (v162 & 7)) & 1) != 0)
                          goto LABEL_226;
                      }
LABEL_189:
                      if (v164)
                      {
                        v165 = *(unsigned __int8 *)(v164 + BYTE1(v162));
                        if (v165 >= 0x13)
                          v165 = *(unsigned __int8 *)(v164 + (v165 << 8) - 4864 + v162 + 256);
                        if (v165 == 3)
                        {
LABEL_226:
                          *(_DWORD *)&v216->var19 |= 0x8000u;
                          goto LABEL_227;
                        }
                      }
                      v166 = v155 + 1;
LABEL_194:
                      v155 = v166;
                      if (v166 >= v157)
                        goto LABEL_227;
                    }
                    v160 = *((_QWORD *)&v230 + 1) + v155;
LABEL_185:
                    v161 = v159[v160];
                    goto LABEL_198;
                  }
LABEL_227:
                  v49 = v184;
                  v140 = v213;
                }
                v146 = v219;
              }
              *((_QWORD *)&v219 + 1) = v237 + v236 - v146;
              if (!v146)
                goto LABEL_230;
            }
          }
          else
          {
LABEL_230:
            v147 = 0;
          }
          v144 = v147 < v140;
LABEL_232:
          v175 = objc_msgSend(v132, "lineBreakMode");
          v177 = *((_QWORD *)&v219 + 1);
          v176 = v219;
          if (v175 >= 3)
          {
            v178 = -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](v217, "characterRangeForGlyphRange:actualGlyphRange:", v219, 0);
            v180 = v179;
            objc_msgSend(a3, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v178, v179, 0);
            v176 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:", v178, v180, 0);
            v177 = v181;
            *(_QWORD *)&v219 = v176;
            *((_QWORD *)&v219 + 1) = v181;
          }
          -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](v217, "setParagraphGlyphRange:separatorGlyphRange:", v176, v177, v177 + v176, 0);
          -[NSTypesetter _setLineBreakModeOverridden:](v217, "_setLineBreakModeOverridden:", 1);
          v218 = -[NSTypesetter layoutParagraphAtPoint:](v217, "layoutParagraphAtPoint:", &v235);
          -[NSTypesetter _setLineBreakModeOverridden:](v217, "_setLineBreakModeOverridden:", 0);
          if (v144)
            objc_msgSend(a3, "_invalidateUsageForTextContainersInRange:", *((_QWORD *)var0 + 9), 1);
LABEL_155:
          *((_QWORD *)var0 + 8) = 0;
          goto LABEL_156;
        }
        LOBYTE(v214) = objc_msgSend(a3, "isValidGlyphIndex:", v55);
        v126 = *((double *)var0 + 11) >= 10000000.0 || (v212 & 0x20) == 0;
        if (v126 || NSIsEmptyRect(v216->var13) || v216->var13.size.width >= 10000000.0)
        {
          if (*((double *)var0 + 11) >= 10000000.0 || (v212 & 0x20) == 0)
            goto LABEL_151;
          v127 = *((_QWORD *)var0 + 9) + 1;
          *((_QWORD *)var0 + 9) = v127;
          if (v127 >= v207)
            goto LABEL_155;
          v128 = (void *)objc_msgSend(*((id *)var0 + 7), "objectAtIndex:");
          *((_QWORD *)var0 + 8) = v128;
          objc_msgSend(v128, "size");
          *((double *)var0 + 10) = v130;
          *((double *)var0 + 11) = v129;
          if (v130 <= 0.0)
            *((_QWORD *)var0 + 10) = 0x416312D000000000;
          if (v129 <= 0.0)
            *((_QWORD *)var0 + 11) = 0x416312D000000000;
          objc_msgSend(*((id *)var0 + 8), "lineFragmentPadding");
          -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
          v235 = v200;
        }
        v212 = 8;
LABEL_151:
        if (!*((_QWORD *)var0 + 8))
          goto LABEL_156;
      }
      v62 = objc_msgSend(*(id *)var0, "length");
      if (v216->var1.length + v216->var1.location + v237 >= v62)
      {
        v64 = 0;
      }
      else
      {
        v63 = (void *)objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", v48), "textBlocks");
        v64 = v63;
        if (v63)
        {
          v65 = objc_msgSend(v63, "count");
          goto LABEL_90;
        }
      }
      v65 = 0;
LABEL_90:
      v182 = v48;
      v183 = v49;
      memset(buffer, 0, sizeof(buffer));
      v219 = xmmword_18D6CBB80;
      if (v60 >= v65)
        v66 = v65;
      else
        v66 = v60;
      v233 = 0;
      v234 = 0;
      bRect_24 = v59;
      v67 = 0;
      if (!v66)
        goto LABEL_98;
      while (1)
      {
        v68 = objc_msgSend(v59, "objectAtIndex:", v67);
        if (v68 != objc_msgSend(v64, "objectAtIndex:", v67))
          break;
        if (v66 == ++v67)
        {
          v67 = v66;
          break;
        }
      }
      if (v60 > v67)
      {
LABEL_98:
        v69 = 0;
        v185 = 0x7FFFFFFFFFFFFFFFLL;
        bRect_8 = v198;
        bRect_16 = v199;
        do
        {
          v70 = v60--;
          v71 = (void *)objc_msgSend(bRect_24, "objectAtIndex:", v60);
          if (v69)
          {
            *(_OWORD *)buffer = v219;
            v72 = bRect_8;
            v73 = bRect_16;
            v192 = v69;
            v74 = v185;
          }
          else
          {
            objc_msgSend(a3, "layoutRectForTextBlock:atIndex:effectiveRange:", v71, *((_QWORD *)var0 + 1), buffer);
            v73 = v75;
            v72 = v76;
            if (*(_QWORD *)&buffer[4])
            {
              v74 = objc_msgSend(a3, "characterRangeForGlyphRange:actualGlyphRange:", *(_QWORD *)buffer, *(_QWORD *)&buffer[4], 0);
              v192 = v77;
            }
            else
            {
              v74 = objc_msgSend(*(id *)var0, "rangeOfTextBlock:atIndex:", v71, v216->var1.location);
              v192 = v78;
              *(_QWORD *)buffer = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:");
              *(_QWORD *)&buffer[4] = v79;
            }
          }
          v80 = (void *)objc_msgSend(a3, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", *(_QWORD *)buffer, 0, 1);
          if (!v80)
          {
            v80 = (void *)*((_QWORD *)var0 + 8);
            if (!v80)
              continue;
          }
          objc_msgSend(v80, "size");
          v82 = v81;
          v84 = v83;
          objc_msgSend(v80, "lineFragmentPadding");
          v86 = v85;
          if (v82 > 0.0)
            v87 = v82;
          else
            v87 = 10000000.0;
          if (v84 > 0.0)
            v88 = v84;
          else
            v88 = 10000000.0;
          v89 = 0;
          v90 = 0;
          v244 = NSInsetRect(*(NSRect *)(&v87 - 2), v86, 0.0);
          x = v244.origin.x;
          y = v244.origin.y;
          width = v244.size.width;
          height = v244.size.height;
          v191 = v72;
          bRect = v73;
          dX = v86;
          if (v60)
          {
            v92 = objc_msgSend(bRect_24, "objectAtIndex:", v70 - 2);
            objc_msgSend(a3, "layoutRectForTextBlock:atIndex:effectiveRange:", v92, *((_QWORD *)var0 + 1), &v219);
            bRect_8 = v96;
            bRect_16 = v95;
            if (*((_QWORD *)&v219 + 1))
            {
              v97 = v93;
              v98 = v94;
              v185 = objc_msgSend(a3, "characterRangeForGlyphRange:actualGlyphRange:", v219, 0);
              v69 = v99;
              height = v98;
              y = v97;
              width = bRect_8;
              x = bRect_16;
            }
            else
            {
              v185 = objc_msgSend(*(id *)var0, "rangeOfTextBlock:atIndex:", v92, v216->var1.location);
              v69 = v100;
              *(_QWORD *)&v219 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:");
              *((_QWORD *)&v219 + 1) = v101;
            }
          }
          v190 = height;
          v102 = *(_QWORD *)buffer;
          v104 = v193;
          v103 = v194;
          v106 = v198;
          v105 = v199;
          if (*(_QWORD *)buffer < *(_QWORD *)&buffer[4] + *(_QWORD *)buffer)
          {
            v211 = v86 + v86;
            v108 = v198;
            v107 = v199;
            v109 = v193;
            v110 = v194;
            do
            {
              objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v102, &v233, 1);
              v105 = v111;
              v103 = v112;
              v106 = v113;
              v104 = v114;
              objc_msgSend(a3, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v102, &v233, 1);
              v117 = v115 + v116;
              if (v103 + v104 > v117)
                v104 = v117 - v103;
              if (v106 >= v211)
              {
                v245.origin.x = v105;
                v245.origin.y = v103;
                v245.size.width = v106;
                v245.size.height = v104;
                v246 = NSInsetRect(v245, dX, 0.0);
                v105 = v246.origin.x;
                v103 = v246.origin.y;
                v106 = v246.size.width;
                v104 = v246.size.height;
              }
              v247.origin.x = v107;
              v247.origin.y = v110;
              v247.size.width = v108;
              v247.size.height = v109;
              if (!NSIsEmptyRect(v247))
              {
                v248.origin.x = v107;
                v248.origin.y = v110;
                v248.size.width = v108;
                v248.size.height = v109;
                v252.origin.x = v105;
                v252.origin.y = v103;
                v252.size.width = v106;
                v252.size.height = v104;
                v249 = NSUnionRect(v248, v252);
                v105 = v249.origin.x;
                v103 = v249.origin.y;
                v106 = v249.size.width;
                v104 = v249.size.height;
              }
              v102 = v234 + v233;
              v107 = v105;
              v110 = v103;
              v108 = v106;
              v109 = v104;
            }
            while ((unint64_t)(v234 + v233) < *(_QWORD *)&buffer[4] + *(_QWORD *)buffer);
          }
          v118 = v191;
          if (v191 > 0.0)
          {
            v250.origin.x = v105;
            v250.origin.y = v103;
            v250.size.width = v106;
            v250.size.height = v104;
            v119 = bRect;
            v120 = v103;
            v121 = v104;
            v251 = NSUnionRect(v250, *(NSRect *)(&v118 - 2));
            v105 = v251.origin.x;
            v103 = v251.origin.y;
            v106 = v251.size.width;
            v104 = v251.size.height;
          }
          objc_msgSend(v71, "boundsRectForContentRect:inRect:textContainer:characterRange:", v80, v74, v192, v105, v103, v106, v104, x, y, width, v190);
          v123 = v122;
          v125 = v124;
          objc_msgSend(a3, "setBoundsRect:forTextBlock:glyphRange:", v71, *(_QWORD *)buffer, *(_QWORD *)&buffer[4]);
          if (*((double *)&v235 + 1) < v123 + v125)
            *((double *)&v235 + 1) = v123 + v125;
        }
        while (v60 > v67);
      }
      v48 = v182;
      v49 = v183;
      goto LABEL_131;
    }
    if (v32 + 1 >= v33)
    {
      v39 = 0;
    }
    else
    {
      v38 = (void *)objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle")), "textBlocks");
      v39 = v38;
      if (v38)
      {
        v40 = objc_msgSend(v38, "count");
        goto LABEL_53;
      }
    }
    v40 = 0;
LABEL_53:
    v41 = 0;
    v42 = 1;
    do
    {
      v43 = objc_msgSend(v34, "objectAtIndex:", v41);
      if ((v42 & (v41 < v40)) == 1 && v43 == objc_msgSend(v39, "objectAtIndex:", v41))
      {
        v42 = 1;
      }
      else
      {
        objc_msgSend(a3, "boundsRectForTextBlock:atIndex:effectiveRange:", v43, v24, 0);
        v42 = 0;
        if (*((double *)&v235 + 1) < v44 + v45)
          *((double *)&v235 + 1) = v44 + v45;
      }
      ++v41;
    }
    while (v37 != v41);
    goto LABEL_60;
  }
LABEL_156:
  v215 = v214 & 1;
  v133 = v203 - 5;
  v216->var5 = 0;
  v216->var6 = 0;
  v216->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&v216->var19 & 0xFFF87FFF | 0x28000);
  *(_OWORD *)v133 = v202;
  *((_OWORD *)v133 + 1) = v201;
  v216->var15.location = 0x7FFFFFFFFFFFFFFFLL;
  *v203 = 0;
  v203[1] = 0;
  if (a7)
    *a7 = v218;
  v134 = a8;
  if (a8)
  {
    if (v215)
    {
      v135 = objc_msgSend(a3, "characterIndexForGlyphAtIndex:", v218);
      v134 = a8;
      a6 = v135;
    }
    *v134 = a6;
  }
}

- (NSRange)paragraphGlyphRange
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  NSUInteger v5;
  NSUInteger v6;
  NSRange result;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  var0 = reserved->var0;
  v5 = *((_QWORD *)reserved->var0 + 1);
  v6 = *((_QWORD *)var0 + 2);
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)_setForceOriginalFontBaseline:(BOOL)a3
{
  _BOOL4 v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  int v6;

  v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (v3)
    v6 = 64;
  else
    v6 = 0;
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFBF | v6);
}

- (void)setHyphenationFactor:(float)hyphenationFactor
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var3 = hyphenationFactor;
}

- (unint64_t)_getRemainingNominalParagraphRange:(_NSRange *)a3 andParagraphSeparatorRange:(_NSRange *)a4 charactarIndex:(unint64_t)a5 layoutManager:(id)a6 string:(id)a7
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  unint64_t v14;
  BOOL v15;
  $0177D170777CFC227CB001A659B5CD18 *v16;
  double v17;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  void **p_vtable;
  unint64_t v21;
  uint64_t v22;
  UniChar *v23;
  unint64_t v24;
  UniChar v25;
  unsigned int v26;
  uint64_t BitmapPtrForPlane;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  UniChar *v31;
  uint64_t v32;
  UniChar v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t UnicodePropertyDataForPlane;
  unsigned int v37;
  $4E0ED78154A14BB469A82D51316F92F1 var19;
  int v39;
  NSTypesetterControlCharacterAction v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v45;
  uint64_t v46;
  NSUInteger v47;
  NSUInteger v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  UniChar *v52;
  uint64_t v53;
  UniChar v54;
  BOOL v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  _NSRange *v59;
  _NSRange *v60;
  UniChar buffer[8];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CFStringRef theString[2];
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  CFRange v73;
  CFRange v74;
  CFRange v75;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  v14 = objc_msgSend(a7, "length");
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  *(_OWORD *)theString = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  *(_OWORD *)buffer = 0u;
  v15 = -[NSTypesetter bidiProcessingEnabled](self, "bidiProcessingEnabled");
  v16 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v16)
    v16 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  v17 = *((double *)v16->var0 + 11);
  if (_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bmpOnce != -1)
    dispatch_once(&_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bmpOnce, &__block_literal_global_31);
  *(_DWORD *)&reserved->var19 &= 0xFFFD7FFF;
  theString[0] = (CFStringRef)a7;
  *((_QWORD *)&v70 + 1) = 0;
  *(_QWORD *)&v71 = v14;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr((CFStringRef)a7);
  CStringPtr = 0;
  theString[1] = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a7, 0x600u);
  *((_QWORD *)&v71 + 1) = 0;
  v72 = 0;
  *(_QWORD *)&v70 = CStringPtr;
  if (v14 <= a5)
    return 1;
  v58 = a6;
  v59 = a3;
  v60 = a4;
  p_vtable = &OBJC_METACLASS___NSTextGraphicsContextProvider.vtable;
  v21 = a5;
  while (1)
  {
    if ((v21 & 0x8000000000000000) != 0 || (v22 = v71, (uint64_t)v71 <= (uint64_t)v21))
    {
      v25 = 0;
    }
    else
    {
      v23 = (UniChar *)theString[1];
      if (theString[1])
      {
        v24 = *((_QWORD *)&v70 + 1) + v21;
LABEL_15:
        v25 = v23[v24];
        goto LABEL_17;
      }
      if (!(_QWORD)v70)
      {
        if (v72 <= (uint64_t)v21 || (v34 = *((_QWORD *)&v71 + 1), *((uint64_t *)&v71 + 1) > (uint64_t)v21))
        {
          v35 = v21 - 4;
          if (v21 < 4)
            v35 = 0;
          if ((uint64_t)(v35 + 64) < (uint64_t)v71)
            v22 = v35 + 64;
          *((_QWORD *)&v71 + 1) = v35;
          v72 = v22;
          v73.location = *((_QWORD *)&v70 + 1) + v35;
          v73.length = v22 - v35;
          CFStringGetCharacters(theString[0], v73, buffer);
          p_vtable = (void **)(&OBJC_METACLASS___NSTextGraphicsContextProvider + 24);
          v34 = *((_QWORD *)&v71 + 1);
        }
        v24 = v21 - v34;
        v23 = buffer;
        goto LABEL_15;
      }
      v25 = *(char *)(v70 + *((_QWORD *)&v70 + 1) + v21);
    }
LABEL_17:
    v26 = v25;
    if (!v15)
    {
      v15 = 0;
      goto LABEL_50;
    }
    BitmapPtrForPlane = (uint64_t)p_vtable[372];
    v28 = _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bidiPropertyBMP;
    if (v25 >> 10 != 54)
      goto LABEL_41;
    v29 = v21 + 1;
    if ((uint64_t)(v21 + 1) >= 0)
    {
      v30 = v71;
      if ((uint64_t)v71 > v29)
        break;
    }
LABEL_48:
    v15 = 1;
LABEL_71:
    v21 = v29;
    if (v29 >= v14)
      return 1;
  }
  v31 = (UniChar *)theString[1];
  if (theString[1])
  {
    v32 = *((_QWORD *)&v70 + 1) + v29;
    goto LABEL_23;
  }
  if ((_QWORD)v70)
  {
    v33 = *(char *)(v70 + *((_QWORD *)&v70 + 1) + v29);
  }
  else
  {
    if (v72 <= v29 || (v42 = *((_QWORD *)&v71 + 1), *((uint64_t *)&v71 + 1) > v29))
    {
      v43 = v21 - 3;
      if (v21 < 3)
        v43 = 0;
      if ((uint64_t)(v43 + 64) < (uint64_t)v71)
        v30 = v43 + 64;
      *((_QWORD *)&v71 + 1) = v43;
      v72 = v30;
      v74.location = *((_QWORD *)&v70 + 1) + v43;
      v74.length = v30 - v43;
      CFStringGetCharacters(theString[0], v74, buffer);
      p_vtable = (void **)(&OBJC_METACLASS___NSTextGraphicsContextProvider + 24);
      v42 = *((_QWORD *)&v71 + 1);
    }
    v32 = v29 - v42;
    v31 = buffer;
LABEL_23:
    v33 = v31[v32];
  }
  if (v33 >> 10 != 55)
    goto LABEL_48;
  v26 = (v26 << 10) + v33 - 56613888;
  if ((v26 & 0x1F0000) != 0)
  {
    BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
    UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
    p_vtable = (void **)(&OBJC_METACLASS___NSTextGraphicsContextProvider + 24);
    v28 = UnicodePropertyDataForPlane;
  }
  ++v21;
LABEL_41:
  if (BitmapPtrForPlane
    && ((*(unsigned __int8 *)(BitmapPtrForPlane + ((unsigned __int16)v26 >> 3)) >> (v26 & 7)) & 1) != 0)
  {
    goto LABEL_47;
  }
  if (!v28)
    goto LABEL_49;
  v37 = *(unsigned __int8 *)(v28 + BYTE1(v26));
  if (v37 >= 0x13)
    v37 = *(unsigned __int8 *)(v28 + (v37 << 8) - 4864 + v26 + 256);
  if (v37 == 3)
  {
LABEL_47:
    v15 = 0;
    *(_DWORD *)&reserved->var19 |= 0x8000u;
  }
  else
  {
LABEL_49:
    v15 = 1;
  }
LABEL_50:
  var19 = reserved->var19;
  if ((*(_DWORD *)&var19 & 0x20000) != 0 || v26 < 0x590)
  {
LABEL_58:
    if (!HIWORD(v26))
    {
      if ((v26 - 1424) >> 4 <= 0x10E)
        reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 | 0x10000);
      goto LABEL_61;
    }
LABEL_70:
    v29 = v21 + 1;
    goto LABEL_71;
  }
  if (v26 - 11264 < 0xFFFFF400
    || _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
    && ((*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
                            + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1) != 0
    || _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP
    && ((*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP
                            + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1) != 0)
  {
    var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 | 0x20000);
    reserved->var19 = var19;
    goto LABEL_58;
  }
LABEL_61:
  LOBYTE(v39) = _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP;
  if (_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP)
    v39 = (*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
                              + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1;
  if (v26 == 9)
    LOBYTE(v39) = 0;
  if ((v39 & 1) == 0 && (v26 & 0xFFFFFFFE) != 0x2028)
    goto LABEL_70;
  v40 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v21, v58);
  p_vtable = (void **)(&OBJC_METACLASS___NSTextGraphicsContextProvider + 24);
  v41 = v40;
  if ((v40 & 8) == 0 && (v17 >= 10000000.0 || (v40 & 0x20) == 0))
    goto LABEL_70;
  v45 = v21 - a5;
  if (v21 == a5)
  {
    v46 = objc_msgSend(v58, "glyphIndexForCharacterAtIndex:", a5, v45);
    v47 = 0;
  }
  else
  {
    v46 = objc_msgSend(v58, "glyphRangeForCharacterRange:actualCharacterRange:", a5, v45, 0);
  }
  v59->location = v46;
  v59->length = v47;
  v48 = v47 + v46;
  if (v26 != 13)
    goto LABEL_93;
  v49 = v21 + 1;
  v50 = 1;
  if (v21 + 1 >= v14 || v49 < 0)
    goto LABEL_94;
  v51 = v71;
  if ((uint64_t)v71 <= v49)
  {
LABEL_93:
    v50 = 1;
    goto LABEL_94;
  }
  v52 = (UniChar *)theString[1];
  if (theString[1])
  {
    v53 = *((_QWORD *)&v70 + 1) + v49;
    goto LABEL_92;
  }
  if ((_QWORD)v70)
  {
    v54 = *(char *)(v70 + *((_QWORD *)&v70 + 1) + v49);
  }
  else
  {
    if (v72 <= v49 || (v56 = *((_QWORD *)&v71 + 1), *((uint64_t *)&v71 + 1) > v49))
    {
      v57 = v21 - 3;
      if (v21 < 3)
        v57 = 0;
      if ((uint64_t)(v57 + 64) < (uint64_t)v71)
        v51 = v57 + 64;
      *((_QWORD *)&v71 + 1) = v57;
      v72 = v51;
      v75.location = *((_QWORD *)&v70 + 1) + v57;
      v75.length = v51 - v57;
      CFStringGetCharacters(theString[0], v75, buffer);
      v56 = *((_QWORD *)&v71 + 1);
    }
    v53 = v49 - v56;
    v52 = buffer;
LABEL_92:
    v54 = v52[v53];
  }
  v55 = v54 == 10;
  v50 = 1;
  if (v55)
    v50 = 2;
LABEL_94:
  v60->location = v48;
  v60->length = v50;
  return v41;
}

- (BOOL)bidiProcessingEnabled
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (*(_BYTE *)&reserved->var19 >> 5) & 1;
}

- (void)_setLineBreakModeOverridden:(BOOL)a3
{
  _BOOL4 v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  int v6;

  v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (v3)
    v6 = 0x200000;
  else
    v6 = 0;
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFDFFFFF | v6);
}

- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect remainingRect:(NSRectPointer)remainingRect forStartingGlyphAtIndex:(NSUInteger)startingGlyphIndex proposedRect:(NSRect)proposedRect lineSpacing:(CGFloat)lineSpacing paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore paragraphSpacingAfter:(CGFloat)paragraphSpacingAfter
{
  double height;
  double width;
  double y;
  double x;
  $500F09A0A86A1DC0979241A7D72823DF *v22;
  $500F09A0A86A1DC0979241A7D72823DF *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGSize size;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  double v31;
  $0177D170777CFC227CB001A659B5CD18 *v32;
  NSArray *v33;
  NSTextContainer *v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  char *__ptr32 *v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  CGFloat v46;
  BOOL v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  void *v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  unint64_t v73;
  NSUInteger v74;
  NSUInteger length;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  NSUInteger v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  NSUInteger location;
  BOOL v105;
  NSUInteger v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  BOOL v112;
  double v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  void *v120;
  unint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  CGPoint v136;
  CGSize v137;
  char v138;
  const __CFDictionary *Mutable;
  const void *v140;
  const void *Value;
  uint64_t v142;
  NSUInteger v143;
  double v144;
  NSRect *v145;
  NSRect *v146;
  double v147;
  double v148;
  char v149;
  NSArray *v150;
  double v151;
  double v152;
  double v153;
  unint64_t v154;
  double v155;
  double v156;
  double v157;
  double v158;
  uint64_t v159;
  double v160;
  NSRect *v161;
  NSUInteger v162;
  NSTextContainer *v163;
  double v164;
  double v165;
  double v166;
  CGFloat dX;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v168;
  double v169;
  double v170;
  double i;
  double v172;
  double v173;
  _QWORD v174[2];
  uint64_t v175;
  uint64_t v176;
  _OWORD v177[2];
  NSRect v178;
  NSRect v179;
  NSRect v180;
  NSRect v181;
  NSRect v182;
  NSRect v183;
  NSRect v184;

  height = proposedRect.size.height;
  width = proposedRect.size.width;
  y = proposedRect.origin.y;
  x = proposedRect.origin.x;
  v22 = -[NSTypesetter _lineFragmentRectForProposedRectArgs](self, "_lineFragmentRectForProposedRectArgs");
  if (v22)
  {
    v23 = v22;
    v22->var0.var0 = lineSpacing;
    v22->var0.var1 = paragraphSpacingBefore;
    v22->var0.var2 = paragraphSpacingAfter;
    v22->var0.var3 = startingGlyphIndex;
    -[NSTypesetter lineFragmentRectForProposedRect:remainingRect:](self, "lineFragmentRectForProposedRect:remainingRect:", remainingRect, x, y, width, height + lineSpacing + paragraphSpacingBefore + paragraphSpacingAfter);
    lineFragmentRect->origin.x = v24;
    lineFragmentRect->origin.y = v25;
    lineFragmentRect->size.width = v26;
    lineFragmentRect->size.height = v27;
    if (lineFragmentUsedRect)
    {
      size = v23->var1.var0.size;
      lineFragmentUsedRect->origin = *(CGPoint *)&v23->var0.var0;
      lineFragmentUsedRect->size = size;
    }
    return;
  }
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  v158 = paragraphSpacingAfter;
  v155 = lineSpacing;
  v160 = paragraphSpacingBefore;
  v172 = width;
  v173 = x;
  if (reserved)
  {
    var0 = reserved->var0;
    v31 = y;
  }
  else
  {
    v32 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v32->var0;
    v31 = y;
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  v33 = -[NSTypesetter textContainers](self, "textContainers");
  v34 = -[NSTypesetter currentTextContainer](self, "currentTextContainer");
  v35 = *((double *)var0 + 10);
  v166 = *((double *)var0 + 11);
  v159 = *((_QWORD *)var0 + 9);
  v36 = *MEMORY[0x1E0CB3438];
  v156 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v38 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v37 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v150 = v33;
  v154 = -[NSArray count](v33, "count");
  if (!v34)
  {
    v138 = 1;
    v165 = paragraphSpacingAfter;
    goto LABEL_112;
  }
  v151 = v36;
  v152 = v37;
  v153 = v38;
  v149 = 0;
  v169 = height + paragraphSpacingBefore;
  v39 = height + paragraphSpacingBefore + paragraphSpacingAfter + v155;
  v143 = startingGlyphIndex - 1;
  v142 = *MEMORY[0x1E0C99768];
  v147 = *(double *)(MEMORY[0x1E0CB3430] + 8);
  v148 = *MEMORY[0x1E0CB3430];
  v40 = &off_18D6CB000;
  v41 = v155;
  v165 = paragraphSpacingAfter;
  v168 = var0;
  v161 = remainingRect;
  v162 = startingGlyphIndex;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        v163 = v34;
        v157 = v41;
LABEL_11:
        for (i = v41; ; i = v102 - v31 - v169)
        {
          v170 = v39;
          if (NSIsEmptyRect(reserved->var13))
          {
            v42 = (void *)*((_QWORD *)var0 + 6);
            v43 = (void *)objc_msgSend(*((id *)var0 + 12), "textBlocks");
            v44 = objc_msgSend(v43, "count");
            v177[0] = 0uLL;
            -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
            dX = v45;
            v46 = *((double *)v40 + 426);
            if (v43)
              v47 = v44 == 0;
            else
              v47 = 1;
            if (v47 || (v48 = reserved->var1.location, v48 >= objc_msgSend(*(id *)var0, "length")))
            {
              length = 0;
              v61 = 0;
              v73 = 0x7FFFFFFFFFFFFFFFLL;
              v60 = v46;
              v54 = v31;
              v59 = v31;
              v58 = v173;
            }
            else
            {
              v49 = (void *)objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), reserved->var1.location, 0), "textBlocks");
              if (v49
                && (v50 = v49, (v51 = objc_msgSend(v49, "count")) != 0)
                && (v52 = v51, v53 = reserved->var1.location, v53 < objc_msgSend(*(id *)var0, "length")))
              {
                v54 = v31;
                v55 = objc_msgSend(v50, "lastObject");
                if ((id)v55 == reserved->var16
                  && (location = reserved->var1.location,
                      v73 = reserved->var15.location,
                      v105 = location >= v73,
                      v106 = location - v73,
                      v105)
                  && (length = reserved->var15.length, v106 < length))
                {
                  v61 = (void *)v55;
                  v58 = reserved->var14.origin.x;
                  v59 = reserved->var14.origin.y;
                  v60 = reserved->var14.size.width;
                  v46 = reserved->var14.size.height;
                }
                else
                {
                  v145 = lineFragmentRect;
                  v146 = lineFragmentUsedRect;
                  v56 = 0;
                  v57 = 0;
                  v46 = v166;
                  v58 = 0.0;
                  v59 = 0.0;
                  v144 = v35;
                  v60 = v35;
                  do
                  {
                    v61 = (void *)objc_msgSend(v50, "objectAtIndex:", v56);
                    v178.origin.x = v58;
                    v178.origin.y = v59;
                    v178.size.width = v60;
                    v178.size.height = v46;
                    v179 = NSInsetRect(v178, dX, 0.0);
                    v62 = v179.origin.x;
                    v63 = v179.origin.y;
                    v64 = v179.size.width;
                    v164 = v179.size.height;
                    objc_msgSend(v42, "layoutRectForTextBlock:atIndex:effectiveRange:", v61, *((_QWORD *)v168 + 1), v177);
                    if (*((_QWORD *)&v177[0] + 1)
                      && (v69 = v65, v70 = v66, v71 = v67, v72 = v68, !NSIsEmptyRect(*(NSRect *)&v65)))
                    {
                      v73 = objc_msgSend(v42, "characterRangeForGlyphRange:actualGlyphRange:", v177[0], 0);
                      length = v83;
                      v78 = v173;
                    }
                    else
                    {
                      v73 = objc_msgSend(*(id *)v168, "rangeOfTextBlock:atIndex:", v61, reserved->var1.location);
                      length = v74;
                      *(_QWORD *)&v177[0] = objc_msgSend(v42, "glyphRangeForCharacterRange:actualCharacterRange:", v73, v74, 0);
                      *((_QWORD *)&v177[0] + 1) = v76;
                      v77 = v64;
                      v78 = v173;
                      objc_msgSend(v61, "rectForLayoutAtPoint:inRect:textContainer:characterRange:", v163, v73, length, v173, v54, v62, v63, v77, v164);
                      v69 = v79;
                      v70 = v80;
                      v71 = v81;
                      v72 = v82;
                      objc_msgSend(v42, "setLayoutRect:forTextBlock:glyphRange:", v61, v177[0]);
                      v57 |= reserved->var1.location == v73;
                    }
                    v180.origin.x = v69;
                    v180.origin.y = v70;
                    v180.size.width = v71;
                    v180.size.height = v72;
                    v181 = NSInsetRect(v180, -dX, 0.0);
                    v58 = v181.origin.x;
                    v59 = v181.origin.y;
                    v60 = v181.size.width;
                    v46 = v181.size.height;
                    if ((v57 & 1) != 0)
                      v78 = v181.origin.x;
                    v173 = v78;
                    if ((v57 & 1) != 0)
                      v54 = v181.origin.y;
                    ++v56;
                  }
                  while (v52 != v56);
                  lineFragmentRect = v145;
                  lineFragmentUsedRect = v146;
                  v35 = v144;
                }
              }
              else
              {
                length = 0;
                v61 = 0;
                v73 = 0x7FFFFFFFFFFFFFFFLL;
                v60 = v46;
                v54 = v31;
                v59 = v31;
                v58 = v173;
              }
              v34 = v163;
            }
            reserved->var13.origin.x = v58;
            reserved->var13.origin.y = v59;
            reserved->var13.size.width = v60;
            reserved->var13.size.height = v46;
            reserved->var14.origin.x = v58;
            reserved->var14.origin.y = v59;
            reserved->var14.size.width = v60;
            reserved->var14.size.height = v46;
            reserved->var15.location = v73;
            reserved->var15.length = length;
            reserved->var16 = v61;
            var0 = v168;
            remainingRect = v161;
            startingGlyphIndex = v162;
            v40 = &off_18D6CB000;
          }
          else
          {
            v54 = v31;
            v58 = reserved->var13.origin.x;
            v59 = reserved->var13.origin.y;
            v60 = reserved->var13.size.width;
            v46 = reserved->var13.size.height;
          }
          v182.origin.x = v58;
          v182.origin.y = v59;
          v182.size.width = v60;
          v182.size.height = v46;
          if (NSIsEmptyRect(v182))
          {
            v84 = v172;
            v85 = v173;
            v31 = v54;
LABEL_48:
            v94 = v170;
            goto LABEL_49;
          }
          v86 = reserved->var13.size.width;
          v84 = v172;
          v85 = v173;
          v31 = v54;
          if (v86 >= *((double *)v40 + 426))
            goto LABEL_48;
          v87 = reserved->var13.origin.x;
          v88 = reserved->var13.origin.y;
          v89 = v173 >= v87 ? *(_QWORD *)&v173 : *(_QWORD *)&reserved->var13.origin.x;
          v90 = v54 >= v88 ? v54 : reserved->var13.origin.y;
          v91 = reserved->var13.size.height;
          v92 = v172;
          v93 = v170;
          v183 = NSIntersectionRect(*(NSRect *)&v89, *(NSRect *)(&v86 - 2));
          v85 = v183.origin.x;
          v31 = v183.origin.y;
          v84 = v183.size.width;
          v94 = v183.size.height;
LABEL_49:
          v172 = v84;
          v173 = v85;
          v95 = v94;
          -[NSTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](v34, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", startingGlyphIndex, 1, 0), -[NSTypesetter _baseWritingDirection](self, "_baseWritingDirection"), remainingRect, v85, v31, v84, v94);
          v36 = v97;
          v99 = v98;
          v38 = v96;
          v37 = v100;
          if (v100 != 0.0 && v96 != 0.0)
          {
            v138 = 0;
            goto LABEL_113;
          }
          -[NSTextContainer size](v34, "size");
          v103 = *((double *)v40 + 426);
          if (v101 <= 0.0)
            v35 = *((double *)v40 + 426);
          else
            v35 = v101;
          if (v102 <= 0.0)
            v102 = *((double *)v40 + 426);
          v166 = v102;
          if (v38 == 0.0 || v169 + v31 > v102)
            break;
          if (v165 > 0.0)
          {
            v107 = v31 + v95 - v165;
            v108 = v102;
            v109 = v102 - v31;
            v110 = v108 - v107;
            v111 = v95 - v165;
            v112 = v107 < v108;
            v113 = 0.0;
            if (v112)
              v113 = v110;
            v165 = v113;
            if (v112)
              v39 = v109;
            else
              v39 = v111;
            v41 = v157;
            goto LABEL_11;
          }
          if (i <= 0.0)
            break;
          v39 = v102 - v31;
        }
        if (NSIsEmptyRect(reserved->var13) || reserved->var13.size.width >= v103)
          goto LABEL_94;
        v114 = (void *)*((_QWORD *)var0 + 6);
        v115 = (void *)objc_msgSend(*((id *)var0 + 12), "textBlocks");
        objc_msgSend(v115, "count");
        v177[0] = xmmword_18D6CBB80;
        v175 = 0;
        v176 = 0;
        if (!v115)
          goto LABEL_93;
        v116 = objc_msgSend(v115, "count");
        if (!v116)
          goto LABEL_93;
        v117 = v116;
        v118 = reserved->var1.location;
        if (v118 >= objc_msgSend(*(id *)v168, "length"))
          goto LABEL_93;
        v119 = objc_msgSend((id)objc_msgSend(*(id *)v168, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), reserved->var1.location, 0), "textBlocks");
        if (!v119)
          goto LABEL_93;
        v120 = (void *)v119;
        v121 = reserved->var1.location;
        if (v121 >= objc_msgSend(*(id *)v168, "length"))
          goto LABEL_93;
        v122 = (void *)objc_msgSend(v120, "objectAtIndex:", 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v123 = *(id *)v168;
          v124 = objc_msgSend(v122, "table");
          v125 = v123;
          var0 = v168;
          v34 = v163;
          v126 = objc_msgSend(v125, "_rangeOfTextTableRow:atIndex:", v124, reserved->var1.location);
          *(_QWORD *)&v177[0] = objc_msgSend(v114, "glyphRangeForCharacterRange:actualCharacterRange:", v126, v127, 0);
          *((_QWORD *)&v177[0] + 1) = v128;
        }
        else
        {
          v128 = *((_QWORD *)&v177[0] + 1);
          var0 = v168;
        }
        if (!v128)
        {
          objc_msgSend(v114, "layoutRectForTextBlock:atIndex:effectiveRange:", v122, *((_QWORD *)var0 + 1), v177);
          v128 = *((_QWORD *)&v177[0] + 1);
          if (!*((_QWORD *)&v177[0] + 1))
          {
            v129 = objc_msgSend(*(id *)var0, "rangeOfTextBlock:atIndex:", v122, reserved->var1.location);
            *(_QWORD *)&v177[0] = objc_msgSend(v114, "glyphRangeForCharacterRange:actualCharacterRange:", v129, v130, 0);
            *((_QWORD *)&v177[0] + 1) = v128;
          }
        }
        if (*(_QWORD *)&v177[0] < v162 && *(_QWORD *)&v177[0] && v128)
        {
          v174[0] = 0;
          v174[1] = 0;
          v37 = v152;
          v38 = v153;
          v36 = v151;
          v99 = v156;
          if (!objc_msgSend(v114, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v143, v174, 1)|| v174[0] != *(_QWORD *)&v177[0])
          {
            os_unfair_lock_lock_with_options();
            Mutable = (const __CFDictionary *)_NSTypesetterTextBlockRetriesDict;
            if (!_NSTypesetterTextBlockRetriesDict)
            {
              Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
              _NSTypesetterTextBlockRetriesDict = (uint64_t)Mutable;
            }
            v140 = *(const void **)&v177[0];
            Value = CFDictionaryGetValue(Mutable, v114);
            CFDictionarySetValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, v114, *(const void **)&v177[0]);
            os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock);
            if (v140 == Value)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v142, CFSTR("*** block retry failed at %ld for layout manager %p"), *(_QWORD *)&v177[0], v114);
          }
          v34 = 0;
          goto LABEL_109;
        }
        for (j = 0; j != v117; ++j)
        {
          v132 = objc_msgSend(v120, "objectAtIndex:", j);
          objc_msgSend(v114, "layoutRectForTextBlock:atIndex:effectiveRange:", v132, *((_QWORD *)v168 + 1), &v175);
          if (v176)
            objc_msgSend(v114, "setLayoutRect:forTextBlock:glyphRange:", v132, v175, v151, v156, v153, v152);
          objc_msgSend(v114, "boundsRectForTextBlock:atIndex:effectiveRange:", v132, *((_QWORD *)v168 + 1), &v175);
          if (v176)
            objc_msgSend(v114, "setBoundsRect:forTextBlock:glyphRange:", v132, v175, v151, v156, v153, v152);
        }
LABEL_93:
        var0 = v168;
        remainingRect = v161;
        startingGlyphIndex = v162;
        v40 = &off_18D6CB000;
LABEL_94:
        if (v31 == 0.0 && v95 > v166)
        {
          v39 = v166;
          v41 = i;
          continue;
        }
        break;
      }
      v105 = v159 + 1 >= v154;
      v41 = i;
      ++v159;
      if (!v105)
      {
        v34 = -[NSArray objectAtIndex:](v150, "objectAtIndex:", v166);
        -[NSTextContainer size](v34, "size");
        if (v133 <= 0.0)
          v35 = v103;
        else
          v35 = v133;
        if (v134 <= 0.0)
          v135 = v103;
        else
          v135 = v134;
        v166 = v135;
        v41 = v155;
        v136 = (CGPoint)*MEMORY[0x1E0CB3438];
        v137 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
        reserved->var13.origin = (CGPoint)*MEMORY[0x1E0CB3438];
        reserved->var13.size = v137;
        v39 = v169 - v160 + v155 + v158;
        reserved->var14.origin = v136;
        reserved->var14.size = v137;
        reserved->var15.location = 0x7FFFFFFFFFFFFFFFLL;
        reserved->var15.length = 0;
        reserved->var16 = 0;
        v160 = 0.0;
        v165 = v158;
        v173 = v148;
        v31 = v147;
        if (!v34)
        {
LABEL_109:
          v138 = 1;
          goto LABEL_113;
        }
        continue;
      }
      break;
    }
    v138 = 1;
    if (!((i <= 0.0) | v149 & 1) && v95 > i)
    {
      v39 = v95 - i;
      v149 = 1;
      continue;
    }
    break;
  }
  v34 = 0;
  v37 = v152;
  v38 = v153;
  v36 = v151;
LABEL_112:
  v99 = v156;
LABEL_113:
  lineFragmentRect->origin.x = v36;
  lineFragmentRect->origin.y = v99;
  lineFragmentRect->size.width = v38;
  lineFragmentRect->size.height = v37;
  if (lineFragmentUsedRect)
  {
    v184.origin.x = v36;
    v184.origin.y = v99;
    v184.size.width = v38;
    v184.size.height = v37;
    if (!NSIsEmptyRect(v184))
    {
      lineFragmentUsedRect->origin.x = v36;
      lineFragmentUsedRect->origin.y = v160 + v99;
      lineFragmentUsedRect->size.width = v38;
      lineFragmentUsedRect->size.height = v37 - (v165 + v160);
    }
  }
  if (v34 != *((NSTextContainer **)var0 + 8))
  {
    *((_QWORD *)var0 + 8) = v34;
    if ((v138 & 1) == 0)
    {
      *((double *)var0 + 10) = v35;
      *((double *)var0 + 11) = v166;
      *((_QWORD *)var0 + 9) = v159;
      -[NSTextContainer lineFragmentPadding](v34, "lineFragmentPadding");
      -[NSTypesetter setLineFragmentPadding:](self, "setLineFragmentPadding:");
    }
  }
}

- (NSArray)textContainers
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return (NSArray *)*((_QWORD *)reserved->var0 + 7);
}

- (void)setParagraphGlyphRange:(NSRange)paragraphRange separatorGlyphRange:(NSRange)paragraphSeparatorRange
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  $0177D170777CFC227CB001A659B5CD18 *v11;
  NSUInteger v12;
  NSUInteger v13;

  length = paragraphSeparatorRange.length;
  location = paragraphSeparatorRange.location;
  v6 = paragraphRange.length;
  v7 = paragraphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
  }
  else
  {
    v11 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v11->var0;
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  *((_QWORD *)var0 + 1) = v7;
  *((_QWORD *)var0 + 2) = v6;
  *((_QWORD *)var0 + 3) = location;
  *((_QWORD *)var0 + 4) = length;
  if (location + length == v7 + v6)
    *((_QWORD *)var0 + 2) = location - v7;
  *(_DWORD *)&reserved->var19 &= ~0x40000u;
  reserved->var1.location = -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", *((_QWORD *)var0 + 1), *((_QWORD *)var0 + 2));
  reserved->var1.length = v12;
  reserved->var2.location = -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", *((_QWORD *)var0 + 3), *((_QWORD *)var0 + 4), (char *)var0 + 24);
  reserved->var2.length = v13;
}

- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange
{
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $0177D170777CFC227CB001A659B5CD18 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  void *v11;
  NSUInteger v12;
  NSRange result;

  length = glyphRange.length;
  location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  v9 = reserved;
  if (!reserved)
  {
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    v9 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v9)
      v9 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  var0 = v9->var0;
  if ((*((_BYTE *)&reserved->var19 + 2) & 4) != 0)
  {
    if (actualGlyphRange)
    {
      actualGlyphRange->location = location;
      actualGlyphRange->length = length;
    }
    v11 = (void *)(reserved->var1.location + location - *((_QWORD *)var0 + 1));
    goto LABEL_11;
  }
  v11 = (void *)*((_QWORD *)var0 + 6);
  if (!v11)
  {
    length = 0;
LABEL_11:
    v12 = length;
    goto LABEL_12;
  }
  v11 = (void *)objc_msgSend(v11, "characterRangeForGlyphRange:actualGlyphRange:", location, length, actualGlyphRange);
LABEL_12:
  result.length = v12;
  result.location = (NSUInteger)v11;
  return result;
}

- (NSTypesetterControlCharacterAction)actionForControlCharacterAtIndex:(NSUInteger)charIndex
{
  NSAttributedString *v4;
  int v5;
  int v6;
  NSTypesetterControlCharacterAction result;

  v4 = -[NSTypesetter attributedString](self, "attributedString");
  v5 = -[NSString characterAtIndex:](-[NSAttributedString string](v4, "string"), "characterAtIndex:", charIndex);
  if (v5 > 132)
  {
    if (v5 == 133 || v5 == 8232)
    {
      return 8;
    }
    else if (v5 == 8233)
    {
      return 24;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    v6 = v5 - 9;
    result = 4;
    switch(v6)
    {
      case 0:
        return result;
      case 1:
      case 4:
        return 24;
      case 2:
        return 8;
      case 3:
        if (-[NSAttributedString _isStringDrawingTextStorage](v4, "_isStringDrawingTextStorage"))
          result = 8;
        else
          result = 40;
        break;
      default:
        return 1;
    }
  }
  return result;
}

uint64_t __114__NSTypesetter__getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string___block_invoke()
{
  uint64_t result;

  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__strongRightBMP = CFUniCharGetBitmapPtrForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP = CFUniCharGetBitmapPtrForPlane();
  result = CFUniCharGetBitmapPtrForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP = result;
  return result;
}

+ (BOOL)_usesATSTypesetter
{
  return __NSTypesetterCompatibilityLevel > 0;
}

+ (NSTypesetter)sharedSystemTypesetter
{
  return (NSTypesetter *)objc_msgSend(a1, "sharedSystemTypesetterForBehavior:", __NSTypesetterCompatibilityLevel);
}

- (void)finalize
{
  void *reserved;
  objc_super v4;

  reserved = self->_reserved;
  if (reserved)
    NSZoneFree(0, reserved);
  v4.receiver = self;
  v4.super_class = (Class)NSTypesetter;
  -[NSTypesetter finalize](&v4, sel_finalize);
}

- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs
{
  return 0;
}

+ (unint64_t)defaultLineBreakStrategy
{
  return 0xFFFFLL;
}

- (BOOL)_allowsEllipsisGlyphSubstitution
{
  return -[NSTypesetter layoutManager](self, "layoutManager") != 0;
}

- (id)_ellipsisFontForFont:(id)a3
{
  CTFontGetWeight();
  objc_msgSend(a3, "pointSize");
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (int64_t)_baseWritingDirection
{
  return 0;
}

- (NSTextTab)textTabForGlyphLocation:(CGFloat)glyphLocation writingDirection:(NSWritingDirection)direction maxLocation:(CGFloat)maxLocation
{
  _BOOL4 v8;
  NSParagraphStyle *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSTextTab *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  NSTextTab *v27;

  v8 = direction != NSWritingDirectionRightToLeft;
  v9 = -[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle");
  v10 = -[NSParagraphStyle tabStops](v9, "tabStops");
  v11 = -[NSArray count](v10, "count");
  if (v11 < 1)
  {
LABEL_14:
    -[NSParagraphStyle defaultTabInterval](v9, "defaultTabInterval");
    if (v21 > 0.0)
    {
      v22 = (uint64_t)(glyphLocation / v21);
      v23 = v21 * (double)(v22 + 1);
      v24 = v21 * (double)(v22 + 2);
      v25 = v23 <= glyphLocation ? v24 : v23;
      if (v25 < maxLocation)
      {
        v27 = [NSTextTab alloc];
        return -[NSTextTab initWithTextAlignment:location:options:](v27, "initWithTextAlignment:location:options:", 2 * (direction == NSWritingDirectionRightToLeft), MEMORY[0x1E0C9AA70], v25);
      }
    }
  }
  else
  {
    v12 = v11;
    v13 = 0;
    v14 = 2 * v8;
    while (1)
    {
      v15 = -[NSArray objectAtIndex:](v10, "objectAtIndex:", v13);
      -[NSTextTab location](v15, "location");
      v17 = v16;
      v18 = -[NSTextTab alignment](v15, "alignment");
      if (v17 > maxLocation)
        break;
      v19 = (unint64_t)(v18 - 3) >= 2 ? v18 : 2 * (direction == NSWritingDirectionRightToLeft);
      if (v17 == maxLocation && v19 != v14)
        break;
      if (v17 > glyphLocation)
        return v15;
      if (v12 == ++v13)
        goto LABEL_14;
    }
  }
  return 0;
}

- (void)setBidiProcessingEnabled:(BOOL)bidiProcessingEnabled
{
  _BOOL4 v3;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  int v6;

  v3 = bidiProcessingEnabled;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (v3)
    v6 = 32;
  else
    v6 = 0;
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFDF | v6);
}

- (float)tightenThresholdForTruncation
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return reserved->var4;
}

- (void)setTightenThresholdForTruncation:(float)a3
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  reserved->var4 = a3;
}

- (CGFloat)paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CGFloat result;
  NSParagraphStyle *v12;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v10 = -[NSLayoutManager delegate](-[NSTypesetter layoutManager](self, "layoutManager"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "layoutManager:paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", -[NSTypesetter layoutManager](self, "layoutManager"), glyphIndex, x, y, width, height);
  }
  else
  {
    v12 = -[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle");
    if (v12)
      -[NSParagraphStyle paragraphSpacing](v12, "paragraphSpacing");
    else
      return 0.0;
  }
  return result;
}

- (void)setHardInvalidation:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  NSLayoutManager *v6;

  length = glyphRange.length;
  location = glyphRange.location;
  v6 = -[NSTypesetter layoutManager](self, "layoutManager", flag);
  if (v6)
    -[NSLayoutManager invalidateGlyphsOnLayoutInvalidationForGlyphRange:](v6, "invalidateGlyphsOnLayoutInvalidationForGlyphRange:", location, length);
}

- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect forParagraphSeparatorGlyphRange:(NSRange)paragraphSeparatorGlyphRange atProposedOrigin:(NSPoint)lineOrigin
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  $0177D170777CFC227CB001A659B5CD18 *v14;
  NSAttributedString *v15;
  NSString *v16;
  _BOOL4 v17;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char v22;
  _BOOL4 v23;
  NSDictionary *v24;
  NSDictionary *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSFont *v30;
  double v31;
  double v32;
  double var10;
  uint64_t v34;
  double var12;
  double v36;
  double var11;
  BOOL v38;
  double v39;
  double v40;
  double var7;
  double v42;
  NSAttributedString *v43;
  id v44;
  char v45;
  double v46;
  double v47;
  NSRectPointer v48;
  char v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double *p_x;
  unint64_t v55;
  int v56;
  char v57;
  NSAttributedString *v58;
  id v59;
  double v60;
  NSParagraphStyle *v61;
  double v62;
  double v63;
  unint64_t var19;
  unsigned int v65;
  double v66;
  double var8;
  CGSize v68;
  NSWritingDirection v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double var9;
  double v82;
  double v84;
  double v85;
  double v86;
  int64_t v87;
  NSRectPointer v88;
  _BOOL4 v89;
  _BOOL4 v91;
  NSTypesetterBehavior v92;
  _OWORD v93[2];
  uint64_t v94;
  uint64_t v95;

  y = lineOrigin.y;
  x = lineOrigin.x;
  length = paragraphSeparatorGlyphRange.length;
  location = paragraphSeparatorGlyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
  }
  else
  {
    v14 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v14->var0;
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  }
  v88 = lineFragmentUsedRect;
  v15 = -[NSTypesetter attributedString](self, "attributedString");
  v16 = -[NSAttributedString string](v15, "string");
  v87 = -[NSTextContainer layoutOrientation](-[NSTypesetter currentTextContainer](self, "currentTextContainer"), "layoutOrientation");
  memset(v93, 0, sizeof(v93));
  v92 = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior");
  v89 = -[NSTypesetter usesFontLeading](self, "usesFontLeading");
  v17 = -[NSTypesetter _forceOriginalFontBaseline](self, "_forceOriginalFontBaseline");
  if (location != *((_QWORD *)var0 + 3) || length != *((_QWORD *)var0 + 4))
    -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](self, "setParagraphGlyphRange:separatorGlyphRange:", location, 0, location, length);
  v19 = reserved->var1.location;
  if ((uint64_t)v19 < 1)
    goto LABEL_21;
  if (v19 == 1)
  {
    v20 = 0;
  }
  else
  {
    v21 = -[NSString characterAtIndex:](v16, "characterAtIndex:", v19 - 1);
    v20 = v19 - 1;
    if (v21 == 10)
    {
      if (-[NSString characterAtIndex:](v16, "characterAtIndex:", v19 - 2) == 13)
        v20 = v19 - 2;
      else
        v20 = v19 - 1;
    }
  }
  v22 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v20);
  if ((v22 & 0x10) != 0 || v92 <= NSTypesetterBehavior_10_3 && (v22 & 0x20) != 0)
  {
LABEL_21:
    v23 = 1;
  }
  else
  {
    v43 = -[NSTypesetter attributedString](self, "attributedString");
    v94 = 0;
    v95 = 0;
    v44 = -[NSAttributedString attribute:atIndex:effectiveRange:](v43, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v19 - 1, &v94);
    if (v95 + v94 > v19 || !v44)
    {
      if (-[NSString length](v16, "length") <= v19)
      {
        v44 = 0;
      }
      else
      {
        v44 = -[NSAttributedString attribute:atIndex:effectiveRange:](v43, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v19, &v94);
        if (v95 + v94 > v19)
          v44 = 0;
      }
    }
    v23 = objc_msgSend(v44, "embeddingType") == 1;
  }
  v91 = v23;
  if (length)
  {
    if (!-[NSAttributedString length](v15, "length"))
    {
      v25 = 0;
      goto LABEL_28;
    }
    v24 = -[NSAttributedString attributesAtIndex:effectiveRange:](v15, "attributesAtIndex:effectiveRange:", v19, 0);
  }
  else
  {
    v24 = -[NSTypesetter attributesForExtraLineFragment](self, "attributesForExtraLineFragment");
  }
  v25 = v24;
LABEL_28:
  -[NSTypesetter _updateParagraphStyleCache:](self, "_updateParagraphStyleCache:", -[NSDictionary objectForKey:](v25, "objectForKey:", CFSTR("NSParagraphStyle")));
  v26 = -[NSDictionary objectForKey:](v25, "objectForKey:", CFSTR("CTVerticalForms"));
  if (!v25)
    goto LABEL_35;
  if (!v17 || (v27 = -[NSDictionary objectForKey:](v25, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
    v27 = -[NSDictionary objectForKey:](v25, "objectForKey:", CFSTR("NSFont"));
  if (objc_msgSend(-[NSDictionary objectForKey:](v25, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))v27 = (id)objc_msgSend(v27, "verticalFont");
  if (!v27)
LABEL_35:
    v27 = (id)NSDefaultFont();
  if ((objc_msgSend(v26, "BOOLValue") & 1) != 0 || (v28 = (uint64_t)v27, !v26) && (v28 = (uint64_t)v27, v87))
    v28 = objc_msgSend(v27, "verticalFont");
  if (v28)
    v29 = (void *)v28;
  else
    v29 = v27;
  v30 = -[NSTypesetter substituteFontForFont:](self, "substituteFontForFont:", v29);
  -[UIFont _defaultLineHeightForUILayout](v30, "_defaultLineHeightForUILayout");
  v31 = 0.0;
  var10 = v32 + 0.0;
  v34 = v92;
  if (v92 >= NSTypesetterBehavior_10_3)
  {
    var12 = reserved->var12;
    v38 = var12 <= 0.0;
    v36 = var10 * var12;
    if (!v38)
      var10 = v36;
  }
  var11 = reserved->var11;
  if (var10 < reserved->var10)
    var10 = reserved->var10;
  v38 = var11 >= var10 || var11 <= 0.0;
  if (v38)
    v39 = var10;
  else
    v39 = reserved->var11;
  if (v89)
  {
    -[UIFont _leading](v30, "_leading");
    v31 = v40;
  }
  if (v92 >= NSTypesetterBehavior_10_2)
  {
    var7 = reserved->var7;
    if (var7 < 0.0)
    {
      v42 = v31 + var7;
      if (v31 + var7 >= 0.0)
      {
        v31 = v31 + var7;
      }
      else
      {
        v31 = 0.0;
        if (v19)
        {
          if (-[NSString characterAtIndex:](-[NSAttributedString string](v15, "string"), "characterAtIndex:", (_QWORD)((__PAIR128__(v19, length) - 1) >> 64)) != 12)
          {
            v39 = v39 + v42;
            if (v39 <= 0.0)
              v39 = 0.0001;
          }
          v34 = v92;
        }
      }
    }
  }
  v45 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext") == 2 || v89;
  if ((v45 & 1) == 0 && length)
  {
    if (CTFontIsSystemUIFont())
    {
      -[UIFont _leading](v30, "_leading");
      v31 = v46;
    }
    goto LABEL_79;
  }
  if (length)
  {
LABEL_79:
    -[NSTypesetter lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", length + location - 1, x, y, 10000000.0, v39);
    goto LABEL_80;
  }
  v47 = 0.0;
LABEL_80:
  v48 = lineFragmentRect;
  if (v31 < v47)
    v31 = v47;
  v49 = !v91;
  v50 = 0.0;
  if (v34 < 3)
    v49 = 1;
  v51 = 0.0;
  if ((v49 & 1) == 0)
  {
    -[NSTypesetter paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", location, x, y, 10000000.0, v39);
    v51 = v52;
  }
  if (length && (v53 = v19 + length, -[NSString length](v16, "length") >= v19 + length))
  {
    p_x = &v88->origin.x;
    if ((uint64_t)v53 < 1)
      goto LABEL_112;
    if (v53 == 1)
    {
      v55 = 0;
    }
    else
    {
      v56 = -[NSString characterAtIndex:](v16, "characterAtIndex:", v53 - 1);
      v55 = v53 - 1;
      if (v56 == 10)
      {
        if (-[NSString characterAtIndex:](v16, "characterAtIndex:", v53 - 2) == 13)
          v55 = v53 - 2;
        else
          v55 = v53 - 1;
        v34 = v92;
      }
    }
    v57 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v55);
    if ((v57 & 0x10) != 0 || v34 <= 3 && (v57 & 0x20) != 0)
      goto LABEL_112;
    v58 = -[NSTypesetter attributedString](self, "attributedString");
    v94 = 0;
    v95 = 0;
    v59 = -[NSAttributedString attribute:atIndex:effectiveRange:](v58, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v53 - 1, &v94);
    if (v95 + v94 > v53 || !v59)
    {
      if (-[NSString length](v16, "length") <= v53)
      {
        v59 = 0;
      }
      else
      {
        v59 = -[NSAttributedString attribute:atIndex:effectiveRange:](v58, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v53, &v94);
        if (v95 + v94 > v53)
          v59 = 0;
      }
    }
    v48 = lineFragmentRect;
    if (objc_msgSend(v59, "embeddingType") == 1)
    {
LABEL_112:
      -[NSTypesetter paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", length + location - 1, x, y, 10000000.0, v39);
      v50 = v60;
    }
  }
  else
  {
    p_x = &v88->origin.x;
  }
  -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", v48, p_x, v93, location, x, y, 10000000.0, v39, v31, v51, v50);
  if (v48->size.width <= 0.0 || v48->size.height <= 0.0)
  {
    v68 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
    v48->origin = (CGPoint)*MEMORY[0x1E0CB3438];
    v48->size = v68;
    return;
  }
  v61 = -[NSTypesetter currentParagraphStyle](self, "currentParagraphStyle");
  -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
  v63 = v62;
  var19 = reserved->var19;
  v65 = (var19 >> 19) & 3;
  if (v91)
  {
    -[NSParagraphStyle firstLineHeadIndent](v61, "firstLineHeadIndent");
    var8 = v66;
  }
  else
  {
    var8 = reserved->var8;
  }
  if (v65)
    v69 = (unint64_t)(v65 - 1);
  else
    v69 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  if (v48->size.width >= 10000000.0)
    v70 = 0;
  else
    v70 = (var19 >> 7) & 0xF;
  v71 = 2 * (v69 == NSWritingDirectionRightToLeft);
  if (v70 != 3)
    v71 = v70;
  p_x[2] = v63 + v63;
  v72 = 0.0;
  if (var8 >= 0.0)
    v72 = var8;
  if (v71 == 1)
  {
    if (v92 > NSTypesetterBehavior_10_2_WithCompatibility)
    {
      if (v69 == NSWritingDirectionRightToLeft)
      {
        v79 = v48->size.width + v63 * -2.0;
        v80 = v79 - v72;
        var9 = reserved->var9;
        if (var9 <= 0.0)
          v79 = 0.0;
        v82 = v80 - (var9 - v79);
      }
      else
      {
        v84 = reserved->var9;
        if (v84 <= 0.0)
        {
          v85 = v63 + v84;
          v86 = v84 - v63;
          if (v85 > 0.0)
            v86 = -v63;
          v84 = v86 + v48->size.width - v63;
        }
        v82 = v72 + v84;
      }
      v73 = v82 * 0.5;
    }
    else
    {
      if (length)
        v74 = reserved->var8;
      else
        v74 = 0.0;
      v73 = (v48->size.width - (v63 + v63)) * 0.5 + v74;
    }
    goto LABEL_162;
  }
  if (v71 == 2)
  {
    if (v69 == NSWritingDirectionRightToLeft)
    {
      v73 = v48->size.width - (v72 + v63 * 2.0);
LABEL_162:
      v76 = *p_x + v73;
      goto LABEL_163;
    }
    v72 = reserved->var9;
    if (v72 <= 0.0)
    {
      v77 = v63 + v72;
      v78 = v72 - v63;
      if (v77 > 0.0)
        v78 = -v63;
      v72 = v78 + v48->size.width - v63;
    }
  }
  else
  {
    if (v69 == NSWritingDirectionRightToLeft)
    {
      v75 = reserved->var9;
      if (v75 > 0.0)
        v75 = v75 + v63 * 2.0 - v48->size.width;
      v76 = *p_x - v75;
      goto LABEL_163;
    }
    if (v92 < NSTypesetterBehavior_10_2 && length == 0)
      v72 = 0.0;
  }
  v76 = v72 + *p_x;
LABEL_163:
  *p_x = v76;
}

- (NSDictionary)attributesForExtraLineFragment
{
  NSAttributedString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSDictionary *result;

  v3 = -[NSTypesetter attributedString](self, "attributedString");
  v4 = -[NSAttributedString length](v3, "length");
  v5 = (void *)-[NSTextView superview](-[NSTextContainer textView](-[NSTypesetter currentTextContainer](self, "currentTextContainer"), "textView"), "superview");
  if (!v5
    || (v6 = v5, v4) && objc_msgSend(v5, "selectedRange") != v4
    || (objc_opt_respondsToSelector() & 1) == 0
    || (result = (NSDictionary *)objc_msgSend(v6, "typingAttributes")) == 0)
  {
    result = -[NSTextContainer attributesForExtraLineFragment](-[NSTypesetter currentTextContainer](self, "currentTextContainer"), "attributesForExtraLineFragment");
    if (!result)
    {
      if (v4)
        return -[NSAttributedString attributesAtIndex:effectiveRange:](v3, "attributesAtIndex:effectiveRange:", v4 - 1, 0);
      else
        return (NSDictionary *)MEMORY[0x1E0C9AA70];
    }
  }
  return result;
}

- (void)layoutGlyphsInLayoutManager:(NSLayoutManager *)layoutManager startingAtGlyphIndex:(NSUInteger)startGlyphIndex maxNumberOfLineFragments:(NSUInteger)maxNumLines nextGlyphIndex:(NSUInteger *)nextGlyph
{
  -[NSTypesetter _layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:maxCharacterIndex:nextGlyphIndex:nextCharacterIndex:](self, "_layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:maxCharacterIndex:nextGlyphIndex:nextCharacterIndex:", layoutManager, startGlyphIndex, maxNumLines, -[NSTextStorage length](-[NSLayoutManager textStorage](layoutManager, "textStorage"), "length"), nextGlyph, 0);
}

- (CGFloat)baselineOffsetInLayoutManager:(NSLayoutManager *)layoutMgr glyphIndex:(NSUInteger)glyphIndex
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;

  -[NSLayoutManager baselineOffsetForGlyphAtIndex:](layoutMgr, "baselineOffsetForGlyphAtIndex:", glyphIndex);
  v8 = v7;
  if (v7 == 0.0)
  {
    v9 = (void *)-[NSTextStorage attributesAtIndex:effectiveRange:](-[NSLayoutManager textStorage](layoutMgr, "textStorage"), "attributesAtIndex:effectiveRange:", -[NSLayoutManager characterIndexForGlyphAtIndex:](layoutMgr, "characterIndexForGlyphAtIndex:", glyphIndex), 0);
    v10 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("NSBaselineOffset"));
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v8 = v8 + v11;
    }
    v12 = objc_msgSend(v9, "objectForKey:", CFSTR("NSSuperScript"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = -[NSTypesetter _forceOriginalFontBaseline](self, "_forceOriginalFontBaseline");
      if (!v9)
        goto LABEL_12;
      if (!v14 || (v15 = (void *)objc_msgSend(v9, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
        v15 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("NSFont"));
      if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
        v15 = (void *)objc_msgSend(v15, "verticalFont");
      if (!v15)
LABEL_12:
        v15 = (void *)NSDefaultFont();
      -[NSLayoutManager typesetterBehavior](layoutMgr, "typesetterBehavior");
      v16 = -[NSLayoutManager usesFontLeading](layoutMgr, "usesFontLeading");
      objc_msgSend(v15, "_defaultLineHeightForUILayout");
      v18 = v17;
      v19 = 0.0;
      if (v16)
        objc_msgSend(v15, "_leading", 0.0);
      v8 = v8 + ceil((v18 + v19) * (double)objc_msgSend(v13, "integerValue") * 0.4);
    }
    if (-[NSTextContainer layoutOrientation](-[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](layoutMgr, "textContainerForGlyphAtIndex:effectiveRange:", glyphIndex, 0), "layoutOrientation"))
    {
      v20 = (void *)objc_msgSend(v9, "objectForKey:", CFSTR("NSFont"));
      if (!v20)
        v20 = (void *)NSDefaultFont();
      if (!objc_msgSend((id)objc_msgSend(v20, "verticalFont"), "isVertical"))
      {
        -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](layoutMgr, "lineFragmentRectForGlyphAtIndex:effectiveRange:", glyphIndex, 0);
        v24 = v26 * 0.5;
        return v24 - v8;
      }
    }
    -[NSLayoutManager locationForGlyphAtIndex:](layoutMgr, "locationForGlyphAtIndex:", glyphIndex);
    v22 = v21;
  }
  else
  {
    v22 = 0.0;
  }
  -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](layoutMgr, "lineFragmentRectForGlyphAtIndex:effectiveRange:", glyphIndex, 0);
  v24 = v23 - v22;
  return v24 - v8;
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphsRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  NSUInteger result;

  length = glyphsRange.length;
  location = glyphsRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  result = *((_QWORD *)reserved->var0 + 6);
  if (result)
    return objc_msgSend((id)result, "getGlyphsInRange:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:", location, length, glyphBuffer, charIndexBuffer, inscribeBuffer, elasticBuffer);
  return result;
}

- (void)substituteGlyphsInRange:(NSRange)glyphRange withGlyphs:(NSGlyph *)glyphs
{
  int64_t length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  void *v9;
  NSGlyph *v10;
  unsigned int v11;

  length = glyphRange.length;
  location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (length >= 1)
  {
    v9 = (void *)*((_QWORD *)reserved->var0 + 6);
    v10 = &glyphs[length];
    do
    {
      v11 = *glyphs++;
      objc_msgSend(v9, "replaceGlyphAtIndex:withGlyph:", location++, v11);
    }
    while (glyphs < v10);
  }
}

- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)characterIndex
{
  uint64_t v7;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $0177D170777CFC227CB001A659B5CD18 *v10;

  v7 = *(_QWORD *)&glyph;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  objc_msgSend(*((id *)reserved->var0 + 6), "insertGlyph:atGlyphIndex:characterIndex:", v7, glyphIndex, characterIndex);
  v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v10)
    v10 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  *(_DWORD *)&v10->var19 &= ~0x40000u;
}

- (void)deleteGlyphsInRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  $0177D170777CFC227CB001A659B5CD18 *v7;

  length = glyphRange.length;
  location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  objc_msgSend(*((id *)reserved->var0 + 6), "deleteGlyphsInRange:", location, length);
  v7 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v7)
    v7 = -[NSTypesetter _getAuxData](self, "_getAuxData");
  *(_DWORD *)&v7->var19 &= ~0x40000u;
}

- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v6;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  uint64_t v9;
  $0177D170777CFC227CB001A659B5CD18 *v10;
  void (*var6)(uint64_t, char *, _BOOL8, NSUInteger);

  length = glyphRange.length;
  location = glyphRange.location;
  v6 = flag;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  v9 = *((_QWORD *)reserved->var0 + 6);
  if (v9)
  {
    v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v10)
      v10 = -[NSTypesetter _getAuxData](self, "_getAuxData");
    if (v10->var6)
      var6 = (void (*)(uint64_t, char *, _BOOL8, NSUInteger))v10->var6;
    else
      var6 = (void (*)(uint64_t, char *, _BOOL8, NSUInteger))__NSDefaultDrawsOutsideIMP;
    if (location < location + length)
    {
      do
      {
        var6(v9, sel_setDrawsOutsideLineFragment_forGlyphAtIndex_, v6, location++);
        --length;
      }
      while (length);
    }
  }
}

- (void)setAttachmentSize:(NSSize)attachmentSize forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  if (glyphRange.length)
  {
    length = glyphRange.length;
    location = glyphRange.location;
    height = attachmentSize.height;
    width = attachmentSize.width;
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!reserved)
      reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
    objc_msgSend(*((id *)reserved->var0 + 6), "setAttachmentSize:forGlyphRange:", location, length, width, height);
  }
}

- (void)setBidiLevels:(const uint8_t *)levels forGlyphRange:(NSRange)glyphRange
{
  int64_t length;
  NSUInteger location;
  $0177D170777CFC227CB001A659B5CD18 *reserved;
  void *v9;
  const uint8_t *v10;
  unsigned int v11;

  length = glyphRange.length;
  location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  if (length >= 1)
  {
    v9 = (void *)*((_QWORD *)reserved->var0 + 6);
    v10 = &levels[length];
    do
    {
      v11 = *levels++;
      objc_msgSend(v9, "setIntAttribute:value:forGlyphAtIndex:", 2, v11, location++);
    }
    while (levels < v10);
  }
}

- (NSUInteger)layoutParagraphAtPoint:(NSPointPointer)lineFragmentOrigin
{
  $0177D170777CFC227CB001A659B5CD18 *reserved;

  objc_opt_class();
  NSRequestConcreteImplementation();
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
    reserved = -[NSTypesetter _getAuxData](self, "_getAuxData");
  return *((_QWORD *)reserved->var0 + 1);
}

@end
