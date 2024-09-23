@implementation NSStringDrawingTextStorage

+ (BOOL)_hasCustomSettings
{
  return __NSHasCustomSettings;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    __NSDefaultStringDrawingBehavior = +[NSTypesetter defaultStringDrawingTypesetterBehavior](NSTypesetter, "defaultStringDrawingTypesetterBehavior");
}

+ (id)stringDrawingTextStorage
{
  return (id)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "init");
}

+ (void)performLayoutOperation:(id)a3
{
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;

  os_unfair_lock_lock_with_options();
  v5 = __NSStringDrawingTextStorageCacheNextIndex;
  if (__NSStringDrawingTextStorageCacheNextIndex)
  {
    --__NSStringDrawingTextStorageCacheNextIndex;
    v10 = (id)__NSStringDrawingTextStorageCache[v5 - 1];
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
    if (v10)
      goto LABEL_6;
  }
  else
  {
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
  }
  v10 = objc_alloc_init((Class)a1);
LABEL_6:
  (*((void (**)(id, id, uint64_t, uint64_t))a3 + 2))(a3, v10, objc_msgSend(v10, "layoutManager"), objc_msgSend(v10, "textContainer"));
  os_unfair_lock_lock_with_options();
  v6 = objc_msgSend(v10, "retainCount") != 1 || __NSStringDrawingTextStorageCacheNextIndex > 3;
  if (!v6
    && ((v7 = objc_msgSend(v10, "length"), v8 = __NSStringDrawingTextStorageCacheNextIndex, v7 >= 0x190)
      ? (v9 = __NSStringDrawingTextStorageCacheNextIndex == 0)
      : (v9 = 1),
        v9))
  {
    ++__NSStringDrawingTextStorageCacheNextIndex;
    __NSStringDrawingTextStorageCache[v8] = v10;
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
  }
  else
  {
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);

  }
}

- (id)layoutManager
{
  return self->_layoutManager;
}

- (id)textContainer
{
  return self->_textContainer;
}

- (int64_t)typesetterBehavior
{
  return *(_DWORD *)&self->_sdflags & 0xFLL;
}

- (CGRect)usedRectForTextContainer:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[NSLayoutManager ensureLayoutForTextContainer:](self->_layoutManager, "ensureLayoutForTextContainer:");
  -[NSLayoutManager usedRectForTextContainer:](self->_layoutManager, "usedRectForTextContainer:", a3);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_setBaselineDelta:(double)a3
{
  self->_baselineDelta = a3;
}

- (double)_baselineDelta
{
  return self->_baselineDelta;
}

- (void)_setBaselineMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFFDF | v3);
}

- (BOOL)_baselineMode
{
  return (*(_BYTE *)&self->_sdflags >> 5) & 1;
}

- (void)_setApplicationFrameworkContext:(int64_t)a3
{
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFF8FF | ((a3 & 7) << 8));
}

- (int64_t)_applicationFrameworkContext
{
  return ((unint64_t)self->_sdflags >> 8) & 7;
}

- (void)_setWrappedByCluster:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFF7FF | v3);
}

- (BOOL)_wrappedByCluster
{
  return (*((unsigned __int8 *)&self->_sdflags + 1) >> 3) & 1;
}

- (BOOL)_usesSimpleTextEffects
{
  return *(_BYTE *)&self->_sdflags >> 7;
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFF7F | v3);
}

- (BOOL)_forceWordWrapping
{
  return (*(_BYTE *)&self->_sdflags >> 6) & 1;
}

- (void)_setForceWordWrapping:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFFBF | v3);
}

- (void)drawTextContainer:(id)a3 withRect:(CGRect)a4 graphicsContext:(CGContext *)a5 baselineMode:(BOOL)a6 scrollable:(BOOL)a7 padding:(double)a8
{
  -[NSStringDrawingTextStorage drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:](self, "drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:", a3, 0, -[NSStringDrawingTextStorage length](self, "length"), a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a8);
}

- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  NSUInteger location;
  void *v19;
  double *v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGContext *v30;
  double v31;
  double v32;
  double v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  double baselineDelta;
  char v38;
  double v39;
  NSUInteger v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  NSUInteger v55;
  NSRange v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  NSUInteger length;
  double v68;
  unint64_t v69;
  uint64_t v70;
  NSRange v71;
  NSRange v72;
  CGRect v73;

  v9 = a8;
  v10 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  v19 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSStringDrawingTextStorage _applicationFrameworkContext](self, "_applicationFrameworkContext"));
  v20 = (double *)MEMORY[0x1E0CB3438];
  if (v19)
    v21 = objc_msgSend(v19, "isFlipped") ^ 1;
  else
    v21 = 0;
  v22 = *v20;
  v68 = v20[1];
  -[NSStringDrawingTextStorage usedRectForTextContainer:](self, "usedRectForTextContainer:", a3);
  v27 = v24;
  v28 = v25;
  v29 = v26;
  if (width > 0.0 && v25 > width || (v30 = 0, height > 0.0) && v26 > height)
    v30 = a6;
  v31 = v23 + v25;
  v63 = v22;
  v64 = v31;
  if (width <= 0.0)
    v32 = v31;
  else
    v32 = width;
  if (height <= 0.0)
    v33 = v24 + v26;
  else
    v33 = height;
  v61 = v33;
  v62 = v32;
  v34 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRect:inTextContainer:", a3, v22, v68);
  v36 = v35;
  baselineDelta = 0.0;
  if (v10)
    baselineDelta = self->_baselineDelta;
  v38 = 1;
  v65 = x;
  if (width > 0.0 && v9)
  {
    -[NSStringDrawingTextStorage defaultTextContainerOriginForRect:](self, "defaultTextContainerOriginForRect:", x, y, width, height);
    x = floor(v39);
    v38 = 1;
    if (!v10 && height > 0.0 && v28 >= width + width)
    {
      v34 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a3, v63, v68, v62, v61);
      v36 = v40;
      v38 = 0;
    }
  }
  if (height <= 0.0)
    v41 = v29;
  else
    v41 = height;
  v42 = v27 + v41;
  if (v10)
    v42 = baselineDelta;
  v43 = y + v42;
  if ((v21 & 1) != 0)
    v44 = v43;
  else
    v44 = y - (v27 + baselineDelta);
  if (v30)
  {
    v60 = v44;
    v45 = v64;
    if (width > 0.0)
      v45 = width;
    v46 = v45 + a9 * 2.0;
    if (height <= 0.0)
      v47 = v29;
    else
      v47 = height;
    v48 = 0.0;
    v49 = baselineDelta - v29;
    if ((v21 & 1) == 0)
      v49 = -baselineDelta;
    if (v10)
      v48 = v49;
    v50 = y + v48;
    v51 = v38 ^ 1;
    if (height <= 0.0)
      v51 = 1;
    if ((v51 & 1) == 0 && v29 >= height + height)
    {
      v52 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a3, v63, v68, v62, v61);
      v54 = v52 + v53 >= v34 + v36 ? v36 : v52 + v53 - v34;
      if (v53)
        v36 = v54;
    }
    CGContextSaveGState(v30);
    v73.origin.x = v65 - a9;
    v73.origin.y = v50;
    v73.size.width = v46;
    v73.size.height = v47;
    CGContextClipToRect(v30, v73);
  }
  v69 = 0;
  v70 = 0;
  v72.location = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0, *(_QWORD *)&v60);
  v72.length = v55;
  v71.location = v34;
  v71.length = v36;
  v56 = NSIntersectionRange(v71, v72);
  v57 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v56.location, v56.length, 0);
  v69 = v57;
  v70 = v58;
  v59 = v58 + v57;
  -[NSLayoutManager setFlipsIfNeeded:](self->_layoutManager, "setFlipsIfNeeded:", 1);
  if (v57 < v59)
  {
    while (!-[NSStringDrawingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", CFSTR("NSBackgroundColor"), v57, &v69))
    {
      v57 = v70 + v69;
      v69 = v57;
      if (v57 >= v59)
        goto LABEL_56;
    }
    -[NSLayoutManager drawBackgroundForGlyphRange:atPoint:](self->_layoutManager, "drawBackgroundForGlyphRange:atPoint:", v56.location, v56.length, x, v44);
  }
LABEL_56:
  -[NSLayoutManager drawGlyphsForGlyphRange:atPoint:](self->_layoutManager, "drawGlyphsForGlyphRange:atPoint:", v56.location, v56.length, x, v44);
  -[NSLayoutManager setFlipsIfNeeded:](self->_layoutManager, "setFlipsIfNeeded:", 0);
  if (v30)
    CGContextRestoreGState(v30);
}

- (CGPoint)defaultTextContainerOriginForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSLayoutManager usedRectForTextContainer:](self->_layoutManager, "usedRectForTextContainer:", self->_textContainer);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[NSTextContainer size](self->_textContainer, "size");
  v18 = _NSCalculateContainerOrigin(x, y, width, height, v9, v11, v13, v15, v16, v17, *MEMORY[0x1E0CB3440]);
  result.y = v19;
  result.x = v18;
  return result;
}

- (id)textContainerForAttributedString:(id)a3
{
  return -[NSStringDrawingTextStorage textContainerForAttributedString:containerSize:lineFragmentPadding:](self, "textContainerForAttributedString:containerSize:lineFragmentPadding:", a3, *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8), 0.0);
}

- (id)textContainerForAttributedString:(id)a3 containerSize:(CGSize)a4 lineFragmentPadding:(double)a5
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  -[NSConcreteMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_contents, "replaceCharactersInRange:withAttributedString:", 0, -[NSStringDrawingTextStorage length](self, "length"), a3);
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, height);
  -[NSTextContainer setLineFragmentPadding:](self->_textContainer, "setLineFragmentPadding:", a5);
  return self->_textContainer;
}

- (BOOL)_isStringDrawingTextStorage
{
  return 1;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (NSStringDrawingTextStorage)init
{
  $7E7425F4EA3793911E8C372F275FD724 *p_settings;
  NSStringDrawingTextStorage *v4;
  NSStringDrawingTextStorage *v5;
  NSConcreteNotifyingMutableAttributedString *v6;
  uint64_t v7;
  char v8;
  NSTextContainer *v9;
  objc_super v11;

  if (__NSHasCustomSettings)
    p_settings = &+[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1)->_settings;
  else
    p_settings = 0;
  v11.receiver = self;
  v11.super_class = (Class)NSStringDrawingTextStorage;
  v4 = -[NSTextStorage init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSConcreteMutableAttributedString initWithAttributedString:](+[NSConcreteNotifyingMutableAttributedString allocWithZone:](NSConcreteNotifyingMutableAttributedString, "allocWithZone:", -[NSStringDrawingTextStorage zone](v4, "zone")), "initWithAttributedString:", 0);
    v5->_contents = v6;
    -[NSConcreteNotifyingMutableAttributedString setDelegate:](v6, "setDelegate:", v5);
    v7 = objc_msgSend(objc_allocWithZone((Class)NSLayoutManager), "init");
    v5->_layoutManager = (NSLayoutManager *)v7;
    -[NSTextStorage addLayoutManager:](v5, "addLayoutManager:", v7);
    -[NSLayoutManager setUsesFontLeading:](v5->_layoutManager, "setUsesFontLeading:", 0);
    -[NSLayoutManager setAllowsOriginalFontMetricsOverride:](v5->_layoutManager, "setAllowsOriginalFontMetricsOverride:", 1);
    -[NSLayoutManager setIgnoresViewTransformations:](v5->_layoutManager, "setIgnoresViewTransformations:", 1);
    -[NSLayoutManager setBackgroundLayoutEnabled:](v5->_layoutManager, "setBackgroundLayoutEnabled:", 0);
    if (p_settings)
      v8 = *((_BYTE *)&p_settings->_flags + 1);
    else
      v8 = __NSDefaultStringDrawingBehavior;
    v5->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&v5->_sdflags & 0xFFFFFFF0 | v8 & 0xF);
    -[NSLayoutManager setTypesetterBehavior:](v5->_layoutManager, "setTypesetterBehavior:", v8 & 0xF);
    -[NSLayoutManager setLimitsLayoutForSuspiciousContents:](v5->_layoutManager, "setLimitsLayoutForSuspiciousContents:", 1);

    v9 = (NSTextContainer *)objc_msgSend(objc_allocWithZone((Class)NSTextContainer), "init");
    v5->_textContainer = v9;
    -[NSTextContainer setSize:](v9, "setSize:", 9000000.0, 9000000.0);
    -[NSLayoutManager addTextContainer:](v5->_layoutManager, "addTextContainer:", v5->_textContainer);

    if (p_settings)
    {
      -[NSLayoutManager setUsesFontLeading:](v5->_layoutManager, "setUsesFontLeading:", *(_WORD *)&p_settings->_flags & 1);
      -[NSLayoutManager setAllowsOriginalFontMetricsOverride:](v5->_layoutManager, "setAllowsOriginalFontMetricsOverride:", 1);
      -[NSLayoutManager setUsesScreenFonts:](v5->_layoutManager, "setUsesScreenFonts:", (*(_WORD *)&p_settings->_flags >> 1) & 1);
      -[NSLayoutManager setHyphenationFactor:](v5->_layoutManager, "setHyphenationFactor:", p_settings->_hyphenationFactor);
      -[NSLayoutManager setShowsInvisibleCharacters:](v5->_layoutManager, "setShowsInvisibleCharacters:", (*(_WORD *)&p_settings->_flags >> 2) & 1);
      -[NSLayoutManager setShowsControlCharacters:](v5->_layoutManager, "setShowsControlCharacters:", (*(_WORD *)&p_settings->_flags >> 3) & 1);
    }
    *(_DWORD *)&v5->_sdflags &= ~0x20u;
    v5->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&v5->_sdflags & 0xFFFFF8FF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 8));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSStringDrawingTextStorage;
  -[NSTextStorage dealloc](&v3, sel_dealloc);
}

- (void)processEditing
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSTextStorageEditActions v6;
  NSInteger v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSTextStorage editedRange](self, "editedRange");
  v5 = v4;
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", v3, v4);
  v6 = -[NSTextStorage editedMask](self, "editedMask");
  v7 = -[NSTextStorage changeInLength](self, "changeInLength");
  v8 = -[NSTextStorage editedRange](self, "editedRange");
  -[NSTextStorage _notifyEdited:range:changeInLength:invalidatedRange:](self, "_notifyEdited:range:changeInLength:invalidatedRange:", v6, v3, v5, v7, v8, v9);
}

- (unint64_t)length
{
  return -[NSConcreteMutableAttributedString length](self->_contents, "length");
}

- (id)string
{
  return -[NSConcreteMutableAttributedString string](self->_contents, "string");
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[NSConcreteMutableAttributedString attributesAtIndex:effectiveRange:](self->_contents, "attributesAtIndex:effectiveRange:", a3, a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return -[NSConcreteMutableAttributedString attribute:atIndex:effectiveRange:](self->_contents, "attribute:atIndex:effectiveRange:", a3, a4, a5);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:](self->_contents, "replaceCharactersInRange:withString:", a3.location, a3.length, a4);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  -[NSConcreteMutableAttributedString setAttributes:range:](self->_contents, "setAttributes:range:", a3, a4.location, a4.length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  -[NSConcreteMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_contents, "replaceCharactersInRange:withAttributedString:", a3.location, a3.length, a4);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  -[NSConcreteMutableAttributedString addAttribute:value:range:](self->_contents, "addAttribute:value:range:", a3, a4, a5.location, a5.length);
}

+ (void)_setHasCustomSettings:(BOOL)a3
{
  __NSHasCustomSettings = a3;
}

- (double)defaultTighteningFactor
{
  return self->_defaultTighteningFactor;
}

- (void)setDefaultTighteningFactor:(double)a3
{
  self->_defaultTighteningFactor = a3;
}

- (CUICatalog)cuiCatalog
{
  return self->_catalog;
}

- (void)setCuiCatalog:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_styleEffects;
}

- (void)setCuiStyleEffects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
