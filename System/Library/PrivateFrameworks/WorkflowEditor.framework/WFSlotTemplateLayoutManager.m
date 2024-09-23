@implementation WFSlotTemplateLayoutManager

- (WFSlotTemplateLayoutManager)init
{
  WFSlotTemplateLayoutManager *v2;
  WFSlotTemplateLayoutManager *v3;
  WFSlotTemplateLayoutManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSlotTemplateLayoutManager;
  v2 = -[WFSlotTemplateLayoutManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WFSlotTemplateLayoutManager setDelegate:](v2, "setDelegate:", v2);
    -[WFSlotTemplateLayoutManager setShowsControlCharacters:](v3, "setShowsControlCharacters:", 0);
    -[WFSlotTemplateLayoutManager setShowsInvisibleCharacters:](v3, "setShowsInvisibleCharacters:", 0);
    v4 = v3;
  }

  return v3;
}

- (unint64_t)numberOfLaidLines
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 IsEmpty;
  CGRect v8;

  v3 = -[WFSlotTemplateLayoutManager numberOfGlyphs](self, "numberOfGlyphs");
  v4 = 0;
  do
  {
    v5 = v4;
    if (!v3)
      break;
    -[WFSlotTemplateLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:");
    IsEmpty = CGRectIsEmpty(v8);
    v4 = v5 + 1;
  }
  while (!IsEmpty);
  return v5;
}

- (void)enumerateEnclosingRectsForSlot:(id)a3 includeInsideSpacing:(BOOL)a4 insetForBackground:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v6 = a5;
  v7 = a4;
  v19 = a6;
  v10 = a3;
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "characterRangeForSlot:includingInsideSpacingOpportunities:", v10, v7);
  v14 = v13;

  v15 = -[WFSlotTemplateLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v12, v14, 0);
  v17 = v16;
  v18 = objc_msgSend(v10, "standaloneTextAttachment");

  -[WFSlotTemplateLayoutManager enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:](self, "enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:", v15, v17, v6, v18, v19);
}

- (void)enumerateInsetEnclosingRectsForGlyphRange:(_NSRange)a3 usingBlock:(id)a4
{
  -[WFSlotTemplateLayoutManager enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:](self, "enumerateEnclosingRectsForGlyphRange:insetForBackground:standaloneTextAttachment:usingBlock:", a3.location, a3.length, 1, 0, a4);
}

- (void)enumerateEnclosingRectsForGlyphRange:(_NSRange)a3 insetForBackground:(BOOL)a4 standaloneTextAttachment:(BOOL)a5 usingBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  BOOL v17;
  BOOL v18;

  length = a3.length;
  location = a3.location;
  v11 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke;
  v13[3] = &unk_24EE256C8;
  v15 = location;
  v16 = length;
  v17 = a4;
  v18 = a5;
  v13[4] = self;
  v14 = v11;
  v12 = v11;
  -[WFSlotTemplateLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", location, length, v13);

}

- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  if (-[WFSlotTemplateLayoutManager isLayoutManagerForTextView](self, "isLayoutManagerForTextView"))
  {
    v14.receiver = self;
    v14.super_class = (Class)WFSlotTemplateLayoutManager;
    -[WFSlotTemplateLayoutManager drawBackgroundForGlyphRange:atPoint:](&v14, sel_drawBackgroundForGlyphRange_atPoint_, location, length, x, y);
  }
  else
  {
    v9 = -[WFSlotTemplateLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    v11 = v10;
    -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke;
    v13[3] = &unk_24EE25748;
    v13[4] = self;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("WFSlot"), v9, v11, 0, v13);

  }
}

- (void)drawGradientInEnclosingRect:(id)a3 enclosingRect:(CGRect *)a4 lineFragmentPadding:(double)a5 runsOffLeft:(BOOL)a6 runsOffRight:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  const __CFArray *v17;
  CGGradient *v18;
  id v19;
  CGContext *v20;
  CGFloat v21;
  CGFloat MinY;
  CGFloat Height;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat locations[3];
  uint64_t v34;
  CGPoint v35;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v7 = a7;
  v8 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a3;
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGColor");
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v15, "CGColor");

  v17 = (const __CFArray *)objc_msgSend(v11, "arrayWithObjects:", v14, v16, 0, 0, 0x3FF0000000000000);
  v18 = CGGradientCreateWithColors(0, v17, locations);
  objc_msgSend(MEMORY[0x24BEC1378], "currentContextWithScale:", 0.0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (CGContext *)objc_msgSend(v19, "CGContext");

  if (v8)
  {
    CGContextSaveGState(v20);
    v21 = CGRectGetMinX(*a4) - a5;
    MinY = CGRectGetMinY(*a4);
    Height = CGRectGetHeight(*a4);
    v39.origin.x = v21;
    v39.origin.y = MinY;
    v39.size.width = a5;
    v39.size.height = Height;
    CGContextClipToRect(v20, v39);
    v40.origin.x = v21;
    v40.origin.y = MinY;
    v40.size.width = a5;
    v40.size.height = Height;
    MinX = CGRectGetMinX(v40);
    v41.origin.x = v21;
    v41.origin.y = MinY;
    v41.size.width = a5;
    v41.size.height = Height;
    MidY = CGRectGetMidY(v41);
    v42.origin.x = v21;
    v42.origin.y = MinY;
    v42.size.width = a5;
    v42.size.height = Height;
    MaxX = CGRectGetMaxX(v42);
    v43.origin.x = v21;
    v43.origin.y = MinY;
    v43.size.width = a5;
    v43.size.height = Height;
    v37.y = CGRectGetMidY(v43);
    v35.x = MinX;
    v35.y = MidY;
    v37.x = MaxX;
    CGContextDrawLinearGradient(v20, v18, v35, v37, 0);
    CGContextRestoreGState(v20);
  }
  if (v7)
  {
    CGContextSaveGState(v20);
    v27 = CGRectGetMaxX(*a4);
    v28 = CGRectGetMinY(*a4);
    v29 = CGRectGetHeight(*a4);
    v44.origin.x = v27;
    v44.origin.y = v28;
    v44.size.width = a5;
    v44.size.height = v29;
    CGContextClipToRect(v20, v44);
    v45.origin.x = v27;
    v45.origin.y = v28;
    v45.size.width = a5;
    v45.size.height = v29;
    v30 = CGRectGetMinX(v45);
    v46.origin.x = v27;
    v46.origin.y = v28;
    v46.size.width = a5;
    v46.size.height = v29;
    v31 = CGRectGetMidY(v46);
    v47.origin.x = v27;
    v47.origin.y = v28;
    v47.size.width = a5;
    v47.size.height = v29;
    v32 = CGRectGetMaxX(v47);
    v48.origin.x = v27;
    v48.origin.y = v28;
    v48.size.width = a5;
    v48.size.height = v29;
    v36.y = CGRectGetMidY(v48);
    v36.x = v32;
    v38.x = v30;
    v38.y = v31;
    CGContextDrawLinearGradient(v20, v18, v36, v38, 0);
    CGContextRestoreGState(v20);
  }
}

- (BOOL)shouldDrawTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[WFSlotTemplateLayoutManager isLayoutManagerForTextView](self, "isLayoutManagerForTextView", a3))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("WFSlot"), a4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typingSlots");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "containsObject:", v8) ^ 1;

  }
  return v6;
}

- (double)preferredHeightForDrawingTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4 withProposedHeight:(double)a5
{
  void *v8;
  void *v9;
  uint64_t v11;
  double v12;

  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", CFSTR("WFSlot"), a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "standaloneTextAttachment"))
  {
    v11 = 0;
    v12 = 0.0;
    -[WFSlotTemplateLayoutManager getCalculatedLineHeight:originalFontLineHeight:](self, "getCalculatedLineHeight:originalFontLineHeight:", &v12, &v11);
    a5 = v12 + -5.0;
  }

  return a5;
}

- (void)getPreferredLeadingSpacing:(double *)a3 trailingSpacing:(double *)a4 forDrawingTextAttachment:(id)a5 atCharacterIndex:(unint64_t)a6
{
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  __int128 v23;

  v10 = a5;
  v23 = xmmword_2268AB430;
  v11 = -[WFSlotTemplateLayoutManager isLayoutManagerForTextView](self, "isLayoutManagerForTextView");
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = objc_msgSend(v12, "length");
  }
  else
  {
    v14 = (id)objc_msgSend(v12, "slotAtCharacterIndex:effectiveRange:effectiveContentRange:", a6, 0, &v23);
  }

  v15 = 2.0;
  if (a6 && a6 - 1 >= (unint64_t)v23 && a6 - 1 - (unint64_t)v23 < *((_QWORD *)&v23 + 1))
  {
    -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB318], a6 - 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v15 = 1.0;
    else
      v15 = 2.0;
  }
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage", (_QWORD)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length") - 1 <= a6
    || (v19 = a6 + 1, v19 < (unint64_t)v23)
    || v19 - (unint64_t)v23 >= *((_QWORD *)&v23 + 1))
  {

    v22 = 2.0;
  }
  else
  {
    -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB318], v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 1.0;
    if (!v21)
      v22 = 2.0;
  }
  *a3 = v15;
  *a4 = v22;

}

- (void)getCalculatedLineHeight:(double *)a3 originalFontLineHeight:(double *)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paragraphStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "lineHeight");
  v11 = v10;
  *a4 = v10;
  objc_msgSend(v9, "lineHeightMultiple");
  if (v12 > 0.0)
  {
    objc_msgSend(v9, "lineHeightMultiple");
    v11 = v11 * v13;
  }
  objc_msgSend(v9, "maximumLineHeight");
  if (v14 > 0.0)
  {
    objc_msgSend(v9, "maximumLineHeight");
    if (v15 < v11)
      v11 = v15;
  }
  objc_msgSend(v9, "minimumLineHeight");
  if (v16 < v11)
    v16 = v11;
  *a3 = v16;

}

- (BOOL)layoutManager:(id)a3 shouldBreakLineByWordBeforeCharacterAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  int v8;
  __int128 v10;

  v10 = xmmword_2268AB430;
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotAtCharacterIndex:effectiveRange:effectiveContentRange:", a4, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (a4 < (unint64_t)v10 || a4 - (unint64_t)v10 >= *((_QWORD *)&v10 + 1))
      LOBYTE(v8) = 0;
    else
      v8 = objc_msgSend(v6, "prefersNoWrapping") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8
{
  double height;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v19;
  double v20;

  v19 = 0.0;
  v20 = 0.0;
  -[WFSlotTemplateLayoutManager getCalculatedLineHeight:originalFontLineHeight:](self, "getCalculatedLineHeight:originalFontLineHeight:", &v19, &v20, a5, a6, a7);
  height = a4->size.height;
  v13 = v19;
  if (height < v19)
    height = v19;
  a4->size.height = height;
  a5->size.height = height;
  v14 = (v13 - v20) * -0.5;
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descender");
  *a6 = v13 + v17 + v14;

  return 1;
}

- (int64_t)layoutManager:(id)a3 shouldUseAction:(int64_t)a4 forControlCharacterAtIndex:(unint64_t)a5
{
  void *v7;
  uint64_t v8;

  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "slotSpacingOpportunityAtCharacterIndex:", a5);

  if (v8)
    return 2;
  else
    return a4;
}

- (CGRect)layoutManager:(id)a3 boundingBoxForControlGlyphAtIndex:(unint64_t)a4 forTextContainer:(id)a5 proposedLineFragment:(CGRect)a6 glyphPosition:(CGPoint)a7 characterIndex:(unint64_t)a8
{
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int8x16_t v20;
  int8x16_t v21;
  __int128 v22;
  double v23;
  double v24;
  int8x16_t v25;
  int8x16_t v26;
  CGRect v27;
  CGRect result;

  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  v13 = a6.origin.x;
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage", a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "slotSpacingOpportunityAtCharacterIndex:", a8);

  if (v16 == 2)
  {
    if (x != 0.0)
    {
      v27.origin.x = v13;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      if (CGRectGetMaxX(v27) - x >= 15.0)
      {
        v22 = xmmword_2268AB3F0;
        v21 = 0uLL;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  if (v16 != 1)
  {
LABEL_9:
    v21 = *(int8x16_t *)MEMORY[0x24BDBF090];
    v22 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    goto LABEL_10;
  }
  -[WFSlotTemplateLayoutManager textStorage](self, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "slotAtCharacterIndex:effectiveRange:effectiveContentRange:", a8, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "standaloneTextAttachment"))
    v19 = -1;
  else
    v19 = 0;
  v20 = (int8x16_t)vdupq_n_s64(v19);
  v25 = vandq_s8(*MEMORY[0x24BDBF090], v20);
  v26 = vbslq_s8(v20, *(int8x16_t *)(MEMORY[0x24BDBF090] + 16), (int8x16_t)xmmword_2268AB400);

  v21 = v25;
  v22 = (__int128)v26;
LABEL_10:
  v23 = *(double *)&v21.i64[1];
  v24 = *((double *)&v22 + 1);
  result.size.width = *(double *)&v22;
  result.origin.x = *(double *)v21.i64;
  result.size.height = v24;
  result.origin.y = v23;
  return result;
}

- (BOOL)isLayoutManagerForTextView
{
  return *(&self->super._delegateIsWeakValue + 1);
}

- (void)setIsLayoutManagerForTextView:(BOOL)a3
{
  *(&self->super._delegateIsWeakValue + 1) = a3;
}

- (BOOL)extendSlotBackgroundOffEdges
{
  return *(&self->super._delegateIsWeakValue + 2);
}

- (void)setExtendSlotBackgroundOffEdges:(BOOL)a3
{
  *(&self->super._delegateIsWeakValue + 2) = a3;
}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v7 = a2;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "standaloneTextAttachment") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB320], a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "set");
    v14 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "textContainerForGlyphAtIndex:effectiveRange:", v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    v19 = *(void **)(a1 + 32);
    v20 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_2;
    v29[3] = &unk_24EE256F8;
    v21 = v18;
    v30 = v21;
    objc_msgSend(v19, "enumerateInsetEnclosingRectsForGlyphRange:usingBlock:", v14, v16, v29);
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_3;
    v25[3] = &unk_24EE25720;
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = v21;
    v27 = v17;
    v28 = v13;
    v22 = v13;
    v23 = v17;
    v24 = v21;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v25);

  }
}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1968], "wf_valueWithCGRect:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __67__WFSlotTemplateLayoutManager_drawBackgroundForGlyphRange_atPoint___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;

  objc_msgSend(a2, "wf_CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(*(id *)(a1 + 32), "extendSlotBackgroundOffEdges", *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11);
  v14 = v13;
  if (!a3 || (v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "shouldReverseLayoutDirection");

    v16 = v17 ^ 1;
    if ((_DWORD)v17)
      v15 = 10;
    else
      v15 = 5;
    if (!v14)
      goto LABEL_10;
LABEL_9:
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 != a3)
      goto LABEL_19;
    goto LABEL_10;
  }
  v15 = 0;
  v16 = 1;
  v17 = 1;
  if (v13)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldReverseLayoutDirection");

  if (v20)
    v16 = v16;
  else
    v16 = 0;
  if (v20)
    v17 = 0;
  else
    v17 = v17;
  if (v20)
    v15 |= 5uLL;
  else
    v15 |= 0xAuLL;
LABEL_19:
  objc_msgSend(*(id *)(a1 + 48), "lineFragmentPadding");
  v22 = v21;
  if (a3)
  {
    v23 = -v21;
    if ((_DWORD)v17)
      v24 = -v22;
    else
      v24 = 0.0;
    if (!(_DWORD)v16)
      v23 = 0.0;
    v6 = v24 + v6;
    v8 = v8 + 0.0;
    v26 = v6;
    v27 = v8;
    v10 = v10 - (v24 + v23);
    v28 = v10;
    v29 = v12;
  }
  objc_msgSend(MEMORY[0x24BEBD420], "wf_bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v15, v6, v8, v10, v12, 8.0, 8.0, *(_QWORD *)&v26, *(_QWORD *)&v27, *(_QWORD *)&v28, *(_QWORD *)&v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fill");
  if (!a3)
    objc_msgSend(*(id *)(a1 + 32), "drawGradientInEnclosingRect:enclosingRect:lineFragmentPadding:runsOffLeft:runsOffRight:", *(_QWORD *)(a1 + 56), &v26, v17, v16, v22);

}

void __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  id v17;
  NSRange v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  NSUInteger v25;
  NSUInteger v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  char v32;
  char v33;
  NSRange v34;

  v17 = a2;
  v34.location = a3;
  v34.length = a4;
  v18 = NSIntersectionRange(*(NSRange *)(a1 + 48), v34);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke_2;
  v21[3] = &unk_24EE256A0;
  v32 = *(_BYTE *)(a1 + 64);
  v24 = *(_OWORD *)(a1 + 48);
  v25 = a3;
  v26 = a4;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  v30 = a9;
  v22 = v17;
  v33 = *(_BYTE *)(a1 + 65);
  v19 = *(void **)(a1 + 32);
  v23 = *(id *)(a1 + 40);
  v31 = a5;
  v20 = v17;
  objc_msgSend(v19, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v18.location, v18.length, 0x7FFFFFFFFFFFFFFFLL, 0, v20, v21);

}

uint64_t __123__WFSlotTemplateLayoutManager_enumerateEnclosingRectsForGlyphRange_insetForBackground_standaloneTextAttachment_usingBlock___block_invoke_2(uint64_t result, CGFloat a2, CGFloat a3, double a4, CGFloat a5)
{
  double v6;
  uint64_t v9;
  void *v10;
  int v11;
  double MaxX;
  double MinX;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;

  if (a4 != 0.0)
  {
    v6 = a4;
    v9 = result;
    if (!*(_BYTE *)(result + 120))
      goto LABEL_15;
    if (*(_QWORD *)(result + 56) + *(_QWORD *)(result + 48) > *(_QWORD *)(result + 72) + *(_QWORD *)(result + 64))
    {
      objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldReverseLayoutDirection");

      if (v11)
      {
        v19.origin.x = a2;
        v19.origin.y = a3;
        v19.size.width = v6;
        v19.size.height = a5;
        MaxX = CGRectGetMaxX(v19);
        MinX = CGRectGetMinX(*(CGRect *)(v9 + 80));
        result = objc_msgSend(*(id *)(v9 + 32), "lineFragmentPadding");
        a2 = MinX + v14;
        v6 = MaxX - a2;
      }
      else
      {
        v15 = CGRectGetMaxX(*(CGRect *)(v9 + 80)) - a2;
        result = objc_msgSend(*(id *)(v9 + 32), "lineFragmentPadding");
        v6 = v15 - v16;
      }
    }
    if (*(_BYTE *)(v9 + 120))
    {
      a2 = a2 + 0.0;
      a3 = a3 + 2.5;
      a5 = a5 + -5.0;
    }
    else
    {
LABEL_15:
      if (!*(_BYTE *)(v9 + 121))
      {
        objc_msgSend(*(id *)(v9 + 32), "lineFragmentPadding");
        a2 = a2 - v17;
        result = objc_msgSend(*(id *)(v9 + 32), "lineFragmentPadding");
        v6 = v6 + v18 * 2.0;
      }
    }
    if (v6 != 0.0)
      return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(v9 + 40) + 16))(a2, a3, v6, a5);
  }
  return result;
}

@end
