@implementation TSWPText

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)adjustedInsets
{
  TSWPTextDelegate *delegate;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  delegate = self->_delegate;
  if (delegate)
  {
    v4 = (void *)-[TSWPTextDelegate padding](delegate, "padding");
    objc_msgSend(v4, "leftInset");
    v6 = v5;
    objc_msgSend(v4, "topInset");
    v8 = v7;
    v9 = v6;
  }
  else
  {
    -[TSWPColumnStyle adjustedInsets](self->_columnStyle, "adjustedInsets");
  }
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (CGSize)currentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (!-[TSWPText autosizeFlags](self, "autosizeFlags"))
  {
    -[TSWPText minSize](self, "minSize");
    v4 = v3;
    v6 = v5;
    -[TSWPText maxSize](self, "maxSize");
    if (v4 != v8 || v6 != v7)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText currentSize]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 630, CFSTR("autosizeFlags set to no autosize but min and max sizes are unequal. They should be the same."));
    }
  }
  -[TSWPText maxSize](self, "maxSize");
  result.height = v13;
  result.width = v12;
  return result;
}

- (unsigned)autosizeFlags
{
  return self->_flags;
}

- (unint64_t)columnCount
{
  return -[TSWPColumnStyle columnCount](self->_columnStyle, "columnCount");
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  double v11;
  double v12;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;

  if (self->_delegate)
  {
    -[TSWPColumnStyle adjustedInsets](self->_columnStyle, "adjustedInsets");
    if (v12 != *MEMORY[0x24BDBF148] || v11 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText positionForColumnIndex:bodyWidth:outWidth:outGap:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 532, CFSTR("if a delegate provides padding, column style must not have a non-zero adjusted inset"));
    }
    -[TSWPText adjustedInsets](self, "adjustedInsets");
    v17 = 10.0;
    if (a4 <= 10.0)
      v17 = a4;
    if (v16 >= (a4 - v17) * 0.5)
      v18 = (a4 - v17) * 0.5;
    else
      v18 = v16;
    a4 = a4 + v18 * -2.0;
    if (a4 < v17)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText positionForColumnIndex:bodyWidth:outWidth:outGap:]");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 541, CFSTR("created an undersized column"));
    }
  }
  else
  {
    v18 = 0.0;
  }
  -[TSWPColumnStyle positionForColumnIndex:bodyWidth:outWidth:outGap:](self->_columnStyle, "positionForColumnIndex:bodyWidth:outWidth:outGap:", a3, a5, a6, a4);
  return v18 + v21;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (void)setReservedWidthWhenTruncating:(double)a3
{
  self->_reservedWidthWhenTruncating = a3;
}

- (void)setMaxLineCount:(unsigned int)a3
{
  self->_maxLineCount = a3;
}

- (void)setAllowsLastLineTruncation:(BOOL)a3
{
  self->_allowsLastLineTruncation = a3;
}

- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4 alignmentForNaturalAlignment:(unsigned int)a5 naturalDirection:(int)a6
{
  return -[TSWPText initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:](self, "initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", a3, 0, a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (unsigned)naturalAlignment
{
  return self->_naturalAlignment;
}

- (BOOL)forceWesternLineBreaking
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSWPTextDelegate forceWesternLineBreaking](self->_delegate, "forceWesternLineBreaking");
  else
    return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (TSWPStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (unsigned)verticalAlignment
{
  TSWPTextDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    return -[TSWPTextDelegate verticalAlignment](delegate, "verticalAlignment");
  else
    return -[TSSStyle intValueForProperty:](self->_columnStyle, "intValueForProperty:", 149);
}

- (id)textWrapper
{
  return 0;
}

- (TSUColor)textColorOverride
{
  return self->_textColorOverride;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return 0;
}

- (double)maxAnchorY
{
  double v3;
  double v4;
  double v5;

  -[TSWPText position](self, "position");
  v4 = v3;
  -[TSWPText maxSize](self, "maxSize");
  return v4 + v5;
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)layoutMultiColumnTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v16;
  CGFloat v17;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id result;
  TSWPLayoutManager *v25;
  uint64_t v26;
  id v27;
  CGSize v28;

  y = a6.y;
  x = a6.x;
  height = a5.height;
  width = a5.width;
  v16 = a4.height;
  v17 = a4.width;
  if (self->_storage)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 149, CFSTR("Storage should be nil"));
  }
  if (!a3)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 150, CFSTR("Should probably pass some actual text to layout - it is nil"));
  }
  result = (id)objc_msgSend(a3, "length");
  if (result)
  {
    self->_minSize.width = v17;
    self->_maxSize.width = width;
    self->_minSize.height = v16;
    self->_maxSize.height = height;
    self->_flags = a9;
    self->_anchor.x = x;
    self->_anchor.y = y;
    self->_pageNumber = a7;
    self->_pageCount = a8;
    self->_storage = (TSWPStorage *)a3;
    v25 = -[TSWPLayoutManager initWithStorage:owner:]([TSWPLayoutManager alloc], "initWithStorage:owner:", self->_storage, self);
    v26 = -[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:](v25, "layoutIntoTarget:withLayoutState:outSync:", self, 0, 0);
    if (v26)
      (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
    v27 = (id)-[NSMutableArray copy](-[TSWPText columns](self, "columns"), "copy");
    -[NSMutableArray removeAllObjects](-[TSWPText columns](self, "columns"), "removeAllObjects");

    v28 = (CGSize)*MEMORY[0x24BDBF148];
    self->_minSize = (CGSize)*MEMORY[0x24BDBF148];
    self->_maxSize = v28;
    self->_flags = 0;
    self->_anchor = (CGPoint)*MEMORY[0x24BDBEFB0];
    self->_storage = 0;
    return v27;
  }
  return result;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

- (BOOL)isLastTarget
{
  return 1;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (BOOL)allowsLastLineTruncation
{
  return self->_allowsLastLineTruncation;
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (unsigned)maxLineCount
{
  return self->_maxLineCount;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minSize.width;
  height = self->_minSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)adjustColumnOriginForAlignment
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSWPTextDelegate adjustColumnOriginForAlignment](self->_delegate, "adjustColumnOriginForAlignment");
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  self->_storage = 0;
  self->_paragraphStyle = 0;

  self->_listStyle = 0;
  self->_columnStyle = 0;

  self->_columns = 0;
  self->_textColorOverride = 0;

  self->_styleProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPText;
  -[TSWPText dealloc](&v3, sel_dealloc);
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5 alignmentForNaturalAlignment:(unsigned int)a6 naturalDirection:(int)a7
{
  TSWPText *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSWPText;
  v12 = -[TSWPText init](&v14, sel_init);
  if (v12)
  {
    v12->_paragraphStyle = (TSWPParagraphStyle *)a3;
    v12->_listStyle = (TSWPListStyle *)a4;
    if (!a5)
      a5 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", objc_msgSend(a3, "context"));
    v12->_columnStyle = (TSWPColumnStyle *)a5;
    v12->_columns = (NSMutableArray *)objc_opt_new();
    v12->_naturalAlignment = a6;
    v12->_naturalDirection = a7;
  }
  return v12;
}

+ (void)renderColumns:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  _BOOL8 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v8 = a6;
  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(a3);
        +[TSWPText renderColumn:selection:inContext:isFlipped:viewScale:](TSWPText, "renderColumn:selection:inContext:isFlipped:viewScale:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0, a5, v8, a7);
      }
      while (v12 != v14);
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }
}

+ (void)renderColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  _BOOL8 v8;
  void *v12;
  uint64_t v13;
  TSWPRenderer *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v8 = a6;
  if (!a3 || !a5)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPText renderColumn:selection:inContext:isFlipped:viewScale:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 427, CFSTR("Invalid arguments"));
  }
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v14 = -[TSWPRenderer initWithContext:]([TSWPRenderer alloc], "initWithContext:", a5);
  -[TSWPRenderer setFlipShadows:](v14, "setFlipShadows:", v8);
  -[TSWPRenderer setViewScale:](v14, "setViewScale:", a7);
  -[TSWPRenderer setPreventClipToColumn:](v14, "setPreventClipToColumn:", 1);
  v15 = (_QWORD *)MEMORY[0x24BEB3BF0];
  v16 = *MEMORY[0x24BEB3BF0];
  v17 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  LOBYTE(v21) = 0;
  LODWORD(v20) = 3;
  LOBYTE(v19) = TSDCGContextHasBackgroundsSuppressed((uint64_t)a5);
  LOBYTE(v18) = 0;
  objc_msgSend(a3, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v14, 0, a4, v16, v17, v16, v17, v18, 0, v16, v17, v19, &v22, &v22, *v15,
    v15[1],
    0,
    v20,
    0x7FFFFFFFFFFFFFFFLL,
    v21,
    0);

  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4 columnStyle:(id)a5
{
  return -[TSWPText initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:](self, "initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", a3, a4, a5, 0, 0);
}

- (TSWPText)initWithParagraphStyle:(id)a3 columnStyle:(id)a4
{
  return -[TSWPText initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:](self, "initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", a3, 0, a4, 0, 0);
}

- (TSWPText)initWithParagraphStyle:(id)a3
{
  return -[TSWPText initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:](self, "initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", a3, 0, 0, 0, 0);
}

- (TSWPText)initWithParagraphStyle:(id)a3 listStyle:(id)a4
{
  return -[TSWPText initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:](self, "initWithParagraphStyle:listStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", a3, a4, 0, 0, 0);
}

- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7
{
  return -[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](self, "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", a3, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)&a7, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
}

- (id)layoutTextStorage:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 pageNumber:(unint64_t)a7 pageCount:(unint64_t)a8 flags:(int)a9
{
  id v9;
  void *v10;
  uint64_t v11;

  v9 = -[TSWPText layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:](self, "layoutMultiColumnTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", a3, a7, a8, *(_QWORD *)&a9, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
  if (objc_msgSend(v9, "count") != 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 140, CFSTR("Invalid column count"));
  }
  return (id)objc_msgSend(v9, "firstObject");
}

- (id)layoutText:(id)a3 minSize:(CGSize)a4 maxSize:(CGSize)a5 anchor:(CGPoint)a6 flags:(int)a7
{
  return -[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:](self, "layoutText:kind:minSize:maxSize:anchor:flags:", a3, 3, *(_QWORD *)&a7, a4.width, a4.height, a5.width, a5.height, a6.x, a6.y);
}

- (id)layoutText:(id)a3 kind:(int)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  TSWPStorage *v24;
  TSPObjectContext *v25;
  TSSStylesheet *v26;
  TSWPStorage *v27;
  TSWPLayoutManager *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  CGSize v33;
  uint64_t v35;

  y = a7.y;
  x = a7.x;
  height = a6.height;
  width = a6.width;
  v13 = a5.height;
  v14 = a5.width;
  v15 = *(_QWORD *)&a4;
  if (!self->_paragraphStyle)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 208, CFSTR("Paragraph style is required"));
  }
  if (self->_storage)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 209, CFSTR("Storage should be nil"));
  }
  if (!a3)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 210, CFSTR("Should probably pass some actual text to layout - it is nil"));
  }
  if (!objc_msgSend(a3, "length"))
    return 0;
  self->_minSize.width = v14;
  self->_minSize.height = v13;
  self->_maxSize.width = width;
  self->_maxSize.height = height;
  self->_flags = a8;
  self->_anchor.x = x;
  self->_anchor.y = y;
  v24 = [TSWPStorage alloc];
  v25 = -[TSPObject context](self->_paragraphStyle, "context");
  v26 = -[TSSStyle stylesheet](self->_paragraphStyle, "stylesheet");
  LODWORD(v35) = self->_naturalDirection;
  v27 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:](v24, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", v25, a3, v15, v26, self->_paragraphStyle, self->_listStyle, 0, 0, v35);
  self->_storage = v27;
  if (!v27)
    return 0;
  v28 = -[TSWPLayoutManager initWithStorage:owner:]([TSWPLayoutManager alloc], "initWithStorage:owner:", self->_storage, self);
  v29 = -[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:](v28, "layoutIntoTarget:withLayoutState:outSync:", self, 0, 0);
  if (-[NSMutableArray count](-[TSWPText columns](self, "columns"), "count") != 1)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText layoutText:kind:minSize:maxSize:anchor:flags:]");
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 244, CFSTR("Invalid column count"));
  }
  v32 = (id)-[NSMutableArray firstObject](-[TSWPText columns](self, "columns"), "firstObject");
  if (v29)
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  -[NSMutableArray removeAllObjects](-[TSWPText columns](self, "columns"), "removeAllObjects");

  v33 = (CGSize)*MEMORY[0x24BDBF148];
  self->_minSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_maxSize = v33;
  self->_flags = 0;
  self->_anchor = (CGPoint)*MEMORY[0x24BDBEFB0];

  self->_storage = 0;
  return v32;
}

- (CGSize)measureText:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a3)
  {
    objc_msgSend(-[TSWPText layoutText:minSize:maxSize:anchor:flags:](self, "layoutText:minSize:maxSize:anchor:flags:", a3, 4111, v3, v4, 4294967300.0, 4294967300.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)), "frameBounds");
    v3 = v5;
    v4 = v6;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)measureStorage:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a3)
  {
    objc_msgSend(-[TSWPText layoutTextStorage:minSize:maxSize:anchor:flags:](self, "layoutTextStorage:minSize:maxSize:anchor:flags:", a3, 4111, v3, v4, 4294967300.0, 4294967300.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)), "frameBounds");
    v3 = v5;
    v4 = v6;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawColumn:(id)a3 selection:(id)a4 inContext:(CGContext *)a5 isFlipped:(BOOL)a6 viewScale:(double)a7
{
  _BOOL8 v8;
  void *v13;
  uint64_t v14;
  TSWPRenderer *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v8 = a6;
  if (!a3 || !a5)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText drawColumn:selection:inContext:isFlipped:viewScale:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 306, CFSTR("Invalid arguments"));
  }
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v15 = -[TSWPRenderer initWithContext:]([TSWPRenderer alloc], "initWithContext:", a5);
  -[TSWPRenderer setFlipShadows:](v15, "setFlipShadows:", v8);
  -[TSWPRenderer setViewScale:](v15, "setViewScale:", a7);
  v16 = (_QWORD *)MEMORY[0x24BEB3BF0];
  v17 = *MEMORY[0x24BEB3BF0];
  v18 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  LOBYTE(v22) = 0;
  LODWORD(v21) = 3;
  LOBYTE(v20) = TSDCGContextHasBackgroundsSuppressed((uint64_t)a5);
  LOBYTE(v19) = 0;
  objc_msgSend(a3, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v15, 0, a4, v17, v18, v17, v18, v19, 0, v17, v18, v20, &v23, &v23, *v16,
    v16[1],
    0,
    v21,
    -[TSWPText pageCount](self, "pageCount"),
    v22,
    0);

  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
}

- (void)drawColumn:(id)a3 inContext:(CGContext *)a4 isFlipped:(BOOL)a5 viewScale:(double)a6
{
  -[TSWPText drawColumn:selection:inContext:isFlipped:viewScale:](self, "drawColumn:selection:inContext:isFlipped:viewScale:", a3, 0, a4, a5, a6);
}

- (void)drawText:(id)a3 inContext:(CGContext *)a4 minSize:(CGSize)a5 maxSize:(CGSize)a6 anchor:(CGPoint)a7 flags:(int)a8 viewScale:(double)a9
{
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;

  y = a7.y;
  x = a7.x;
  v14 = -[TSWPText layoutText:minSize:maxSize:anchor:flags:](self, "layoutText:minSize:maxSize:anchor:flags:", a3, *(_QWORD *)&a8, a5.width, a5.height, a6.width, a6.height);
  if (v14)
  {
    v15 = v14;
    CGContextSaveGState(a4);
    CGContextTranslateCTM(a4, x, y);
    -[TSWPText drawColumn:inContext:isFlipped:viewScale:](self, "drawColumn:inContext:isFlipped:viewScale:", v15, a4, 0, a9);
    CGContextRestoreGState(a4);
  }
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double result;

  -[TSWPColumnStyle widthForColumnIndex:bodyWidth:](self->_columnStyle, "widthForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double result;

  -[TSWPColumnStyle gapForColumnIndex:bodyWidth:](self->_columnStyle, "gapForColumnIndex:bodyWidth:", a3, a4);
  return result;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (const)previousTargetTopicNumbers
{
  return 0;
}

- (const)nextTargetTopicNumbers
{
  return 0;
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchor.x;
  y = self->_anchor.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)wantsLineFragments
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)layoutForInlineDrawable:(id)a3
{
  return 0;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText validatedLayoutForAnchoredDrawable:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 699, CFSTR("Anchored attachments not yet supported in TSWPText."));
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (id)currentInlineDrawableLayouts
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPText addAttachmentLayout:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 725, CFSTR("Partitioned attachments not yet supported in TSWPTableText."));
}

- (BOOL)isLayoutOffscreen
{
  return 0;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (double)reservedWidthWhenTruncating
{
  return self->_reservedWidthWhenTruncating;
}

- (TSWPTextDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPTextDelegate *)a3;
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (void)setStyleProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (int)naturalDirection
{
  return self->_naturalDirection;
}

- (void)setTextColorOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
