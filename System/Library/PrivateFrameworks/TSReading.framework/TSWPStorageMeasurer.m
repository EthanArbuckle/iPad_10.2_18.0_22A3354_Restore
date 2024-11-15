@implementation TSWPStorageMeasurer

- (TSWPStorageMeasurer)initWithStorage:(id)a3
{
  TSWPStorageMeasurer *v4;

  v4 = -[TSWPStorageMeasurer init](self, "init");
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_columns = (NSMutableArray *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageMeasurer;
  -[TSWPStorageMeasurer dealloc](&v3, sel_dealloc);
}

- (id)pLayoutWithMinSize:(CGSize)a3 maxSize:(CGSize)a4 anchor:(CGPoint)a5 flags:(unsigned int)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  TSWPLayoutManager *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  CGSize v19;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v11 = a3.height;
  v12 = a3.width;
  if (!-[TSWPStorage length](self->_storage, "length"))
    return 0;
  self->_minSize.width = v12;
  self->_minSize.height = v11;
  self->_maxSize.width = width;
  self->_maxSize.height = height;
  self->_flags = a6;
  self->_anchor.x = x;
  self->_anchor.y = y;
  v14 = -[TSWPLayoutManager initWithStorage:owner:]([TSWPLayoutManager alloc], "initWithStorage:owner:", self->_storage, self);
  v15 = -[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:](v14, "layoutIntoTarget:withLayoutState:outSync:", self, 0, 0);
  if (-[NSMutableArray count](-[TSWPStorageMeasurer columns](self, "columns"), "count") != 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1183, CFSTR("Invalid column count"));
  }
  v18 = (id)-[NSMutableArray firstObject](-[TSWPStorageMeasurer columns](self, "columns"), "firstObject");
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  -[NSMutableArray removeAllObjects](-[TSWPStorageMeasurer columns](self, "columns"), "removeAllObjects");

  v19 = (CGSize)*MEMORY[0x24BDBF148];
  self->_minSize = (CGSize)*MEMORY[0x24BDBF148];
  self->_maxSize = v19;
  self->_flags = 0;
  self->_anchor = (CGPoint)*MEMORY[0x24BDBEFB0];
  return v18;
}

- (CGSize)measuredSizeWithFlags:(unsigned int)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:](self, "pLayoutWithMinSize:maxSize:anchor:flags:", a3 | 0x1000, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), 4294967300.0, 4294967300.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)), "frameBounds");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)measuredSizeWithFlags:(unsigned int)a3 maxSize:(CGSize)a4 layoutParent:(id)a5 styleProvider:(id)a6
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  self->_layoutParent = (TSWPLayoutParent *)a5;
  self->_styleProvider = (TSWPStyleProvider *)a6;
  objc_msgSend(-[TSWPStorageMeasurer pLayoutWithMinSize:maxSize:anchor:flags:](self, "pLayoutWithMinSize:maxSize:anchor:flags:", a3 | 0x1000, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), a4.width, a4.height, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8)), "frameBounds");
  v8 = v7;
  v10 = v9;
  self->_layoutParent = 0;
  self->_styleProvider = 0;
  result.height = v10;
  result.width = v8;
  return result;
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if (-[TSWPStorage supportsColumnStyles](self->_storage, "supportsColumnStyles", a3, a4))
    return -[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self->_storage, "columnStyleAtCharIndex:effectiveRange:", 0, 0);
  else
    return self;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
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

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (BOOL)isLastTarget
{
  return 1;
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

- (unsigned)autosizeFlags
{
  return self->_flags;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 0;
}

- (int)naturalDirection
{
  return -1;
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
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageMeasurer layoutForInlineDrawable:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1355, CFSTR("Inline attachments not yet supported in TSWPText."));
  return 0;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageMeasurer validatedLayoutForAnchoredDrawable:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1363, CFSTR("Anchored attachments not yet supported in TSWPText."));
  return 0;
}

- (id)currentInlineDrawableLayouts
{
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageMeasurer addAttachmentLayout:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPText.mm"), 1389, CFSTR("Partitioned attachments not yet supported in TSWPText."));
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (double)maxAnchorY
{
  double v3;
  double v4;
  double v5;

  -[TSWPStorageMeasurer position](self, "position");
  v4 = v3;
  -[TSWPStorageMeasurer maxSize](self, "maxSize");
  return v4 + v5;
}

- (unint64_t)pageNumber
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pageCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (BOOL)isLayoutOffscreen
{
  return 1;
}

- (BOOL)layoutIsValid
{
  return 1;
}

- (id)styleProvider
{
  return self->_styleProvider;
}

- (BOOL)caresAboutStorageChanges
{
  return 0;
}

- (id)textWrapper
{
  return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  return 0;
}

- (unsigned)maxLineCount
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSWPLayoutParent maxLineCountForTextLayout:](self->_layoutParent, "maxLineCountForTextLayout:", 0);
  else
    return 0;
}

- (CGSize)adjustedInsets
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a5)
    *a5 = a4;
  if (a6)
    *a6 = 0.0;
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

@end
