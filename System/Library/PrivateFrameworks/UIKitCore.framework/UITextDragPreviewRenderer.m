@implementation UITextDragPreviewRenderer

- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range
{
  return -[UITextDragPreviewRenderer initWithLayoutManager:range:unifyRects:](self, "initWithLayoutManager:range:unifyRects:", layoutManager, range.location, range.length, 1);
}

- (UITextDragPreviewRenderer)initWithLayoutManager:(NSLayoutManager *)layoutManager range:(NSRange)range unifyRects:(BOOL)unifyRects
{
  NSUInteger length;
  NSUInteger location;
  NSLayoutManager *v10;
  UITextDragPreviewRenderer *v11;
  UITextDragPreviewRenderer *v12;
  objc_super v14;

  length = range.length;
  location = range.location;
  v10 = layoutManager;
  v14.receiver = self;
  v14.super_class = (Class)UITextDragPreviewRenderer;
  v11 = -[UITextDragPreviewRenderer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layoutManager, layoutManager);
    v12->_range.location = location;
    v12->_range.length = length;
    v12->_calculated = 0;
    v12->_unifyRects = unifyRects;
  }

  return v12;
}

- (UIImage)image
{
  -[UITextDragPreviewRenderer _calculate](self, "_calculate");
  return self->_image;
}

- (CGRect)firstLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[UITextDragPreviewRenderer _calculate](self, "_calculate");
  x = self->_firstRect.origin.x;
  y = self->_firstRect.origin.y;
  width = self->_firstRect.size.width;
  height = self->_firstRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)bodyRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[UITextDragPreviewRenderer _calculate](self, "_calculate");
  x = self->_middleRect.origin.x;
  y = self->_middleRect.origin.y;
  width = self->_middleRect.size.width;
  height = self->_middleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)lastLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[UITextDragPreviewRenderer _calculate](self, "_calculate");
  x = self->_lastRect.origin.x;
  y = self->_lastRect.origin.y;
  width = self->_lastRect.size.width;
  height = self->_lastRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_calculate
{
  CGPoint v3;
  CGSize v4;
  void *v5;
  _QWORD v6[5];

  if (!self->_calculated)
  {
    self->_calculated = 1;
    v3 = (CGPoint)*MEMORY[0x1E0C9D648];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_firstRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_firstRect.size = v4;
    self->_middleRect.origin = v3;
    self->_middleRect.size = v4;
    self->_lastRect.origin = v3;
    self->_lastRect.size = v4;
    -[UITextDragPreviewRenderer layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__UITextDragPreviewRenderer__calculate__block_invoke;
    v6[3] = &unk_1E16E4F28;
    v6[4] = self;
    objc_msgSend(v5, "coordinateAccess:", v6);

  }
}

void __39__UITextDragPreviewRenderer__calculate__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSRange v15;
  UIGraphicsImageRenderer *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  CGRect v29;
  CGRect v30;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_calculateRectsUsingLayoutManager:");
  objc_msgSend(*(id *)(a1 + 32), "_correctlyOffsetBoundingRect");
  if (v5 > 0.0)
  {
    v7 = v6;
    if (v6 > 0.0)
    {
      v8 = v3;
      v9 = v4;
      v10 = v5;
      v11 = objc_msgSend(v22, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
      v13 = v12;
      objc_msgSend(v22, "textContainerForGlyphAtIndex:effectiveRange:", v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29.origin.x = v8;
      v29.origin.y = v9;
      v29.size.width = v10;
      v29.size.height = v7;
      v30 = CGRectOffset(v29, -*(double *)(*(_QWORD *)(a1 + 32) + 120), -*(double *)(*(_QWORD *)(a1 + 32) + 128));
      v27.location = objc_msgSend(v22, "glyphRangeForBoundingRect:inTextContainer:", v14, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
      v28.location = v11;
      v28.length = v13;
      v15 = NSIntersectionRange(v27, v28);
      v16 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v10, v7);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __39__UITextDragPreviewRenderer__calculate__block_invoke_2;
      v23[3] = &unk_1E16CAFA0;
      v17 = v22;
      v26 = v15;
      v18 = *(_QWORD *)(a1 + 32);
      v24 = v17;
      v25 = v18;
      -[UIGraphicsImageRenderer imageWithActions:](v16, "imageWithActions:", v23);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(void **)(v20 + 136);
      *(_QWORD *)(v20 + 136) = v19;

    }
  }

}

uint64_t __39__UITextDragPreviewRenderer__calculate__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128));
  return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128));
}

- (void)_calculateRectsUsingLayoutManager:(id)a3
{
  id v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  unint64_t i;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MinY;
  double MaxY;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, NSUInteger, NSUInteger, _BYTE *, double, double, double, double, double, double, double, double);
  void *v43;
  UITextDragPreviewRenderer *v44;
  id v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  __int128 v51;
  __int128 v52;
  CGRect v53;

  v4 = a3;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x4010000000;
  v50[3] = &unk_18685B0AF;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v51 = *MEMORY[0x1E0C9D628];
  v52 = v5;
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", self->_range.location, self->_range.length, 0);
  v9 = v8;
  v40 = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke;
  v43 = &unk_1E16E4F78;
  v48 = v7;
  v49 = v8;
  v44 = self;
  v10 = v4;
  v45 = v10;
  v11 = v6;
  v46 = v11;
  v47 = v50;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", v7, v9, &v40);
  if (objc_msgSend(v11, "count", v40, v41, v42, v43, v44) == 1)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGRectValue");
    self->_middleRect.origin.x = v13;
    self->_middleRect.origin.y = v14;
    self->_middleRect.size.width = v15;
    self->_middleRect.size.height = v16;

  }
  else if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGRectValue");
    self->_firstRect.origin.x = v18;
    self->_firstRect.origin.y = v19;
    self->_firstRect.size.width = v20;
    self->_firstRect.size.height = v21;

    objc_msgSend(v11, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGRectValue");
    self->_lastRect.origin.x = v23;
    self->_lastRect.origin.y = v24;
    self->_lastRect.size.width = v25;
    self->_lastRect.size.height = v26;

    if ((unint64_t)objc_msgSend(v11, "count") >= 3)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "CGRectValue");
      self->_middleRect.origin.x = v28;
      self->_middleRect.origin.y = v29;
      self->_middleRect.size.width = v30;
      self->_middleRect.size.height = v31;

      for (i = 2; i < objc_msgSend(v11, "count") - 1; ++i)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "CGRectValue");
        v53.origin.x = v34;
        v53.origin.y = v35;
        v53.size.width = v36;
        v53.size.height = v37;
        self->_middleRect = CGRectUnion(self->_middleRect, v53);

      }
      if (self->_unifyRects)
      {
        MinY = CGRectGetMinY(self->_middleRect);
        self->_firstRect.size.height = MinY + 1.0 - CGRectGetMinY(self->_firstRect);
        MaxY = CGRectGetMaxY(self->_lastRect);
        self->_lastRect.size.height = MaxY - CGRectGetMaxY(self->_middleRect) + 1.0;
        self->_lastRect.origin.y = CGRectGetMaxY(self->_middleRect) + -1.0;
      }
    }
  }

  _Block_object_dispose(v50, 8);
}

void __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, _BYTE *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v21;
  NSRange v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  NSRange v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSRange v50;

  v21 = a2;
  v50.location = a3;
  v50.length = a4;
  v22 = NSIntersectionRange(v50, *(NSRange *)(a1 + 64));
  if (v22.length > 1)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "layoutManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "characterRangeForGlyphRange:actualGlyphRange:", v22.location, v22.length, 0);
  if (!v25)
  {

    goto LABEL_9;
  }
  v26 = v24;
  v27 = v25;
  objc_msgSend(v23, "textStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "attributedSubstringFromRange:", v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "string");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v33)
  {
LABEL_4:
    v34 = *(void **)(a1 + 40);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2;
    v40[3] = &unk_1E16E4F50;
    v41 = v34;
    v45 = v22;
    v42 = v21;
    v46 = a10;
    v47 = a11;
    v48 = a12;
    v49 = a13;
    v35 = *(id *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 56);
    v36 = *(_QWORD *)(a1 + 64);
    v43 = v35;
    v44 = v37;
    objc_msgSend(v41, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v22.location, v22.length, v36, *(_QWORD *)(a1 + 72), v42, v40);
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v39 = *(double *)(v38 + 56);
    if (v39 > 400.0 && *(double *)(v38 + 48) / v39 <= 0.8)
      *a5 = 1;

  }
LABEL_9:

}

void __63__UITextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  void *v17;
  _BOOL4 IsEmpty;
  CGRect *v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v24.origin.y = v10;
  v24.size.height = v11;
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  v24.origin.x = a2;
  v24.size.width = a4;
  v21 = CGRectUnion(v20, v24);
  v22 = CGRectIntersection(v21, *(CGRect *)(a1 + 80));
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v16 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  IsEmpty = CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v19 = *(CGRect **)(*(_QWORD *)(a1 + 56) + 8);
  if (IsEmpty)
  {
    v19[1].origin.x = x;
  }
  else
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v23 = CGRectUnion(v19[1], v25);
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    v19 = *(CGRect **)(*(_QWORD *)(a1 + 56) + 8);
    v19[1].origin.x = v23.origin.x;
  }
  v19[1].origin.y = y;
  v19[1].size.width = width;
  v19[1].size.height = height;
}

- (CGRect)_correctlyOffsetBoundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  -[UITextDragPreviewRenderer _rawBoundingRect](self, "_rawBoundingRect");
  v4 = v3;
  v6 = v5;
  v7 = -v3;
  v12.origin.x = self->_firstRect.origin.x;
  self->_origin.x = v7;
  self->_origin.y = -v6;
  v12.origin.y = self->_firstRect.origin.y;
  v12.size.width = self->_firstRect.size.width;
  v12.size.height = self->_firstRect.size.height;
  if (!CGRectIsEmpty(v12))
    self->_firstRect = CGRectOffset(self->_firstRect, self->_origin.x, self->_origin.y);
  if (!CGRectIsEmpty(self->_middleRect))
    self->_middleRect = CGRectOffset(self->_middleRect, self->_origin.x, self->_origin.y);
  if (!CGRectIsEmpty(self->_lastRect))
    self->_lastRect = CGRectOffset(self->_lastRect, self->_origin.x, self->_origin.y);
  -[UITextDragPreviewRenderer adjustFirstLineRect:bodyRect:lastLineRect:textOrigin:](self, "adjustFirstLineRect:bodyRect:lastLineRect:textOrigin:", &self->_firstRect, &self->_middleRect, &self->_lastRect, v4, v6);
  -[UITextDragPreviewRenderer _rawBoundingRect](self, "_rawBoundingRect");
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_rawBoundingRect
{
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  _BOOL4 IsEmpty;
  CGFloat v9;
  _BOOL4 v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;
  CGRect v25;

  if (CGRectIsEmpty(self->_firstRect))
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    x = self->_firstRect.origin.x;
    y = self->_firstRect.origin.y;
    width = self->_firstRect.size.width;
    height = self->_firstRect.size.height;
  }
  if (CGRectIsEmpty(self->_middleRect))
  {
    v7 = x;
  }
  else
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    IsEmpty = CGRectIsEmpty(v20);
    v7 = self->_middleRect.origin.x;
    if (IsEmpty)
    {
      y = self->_middleRect.origin.y;
      width = self->_middleRect.size.width;
      height = self->_middleRect.size.height;
    }
    else
    {
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v21 = CGRectUnion(self->_middleRect, v24);
      v7 = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
    }
  }
  if (CGRectIsEmpty(self->_lastRect))
  {
    v9 = v7;
  }
  else
  {
    v22.origin.x = v7;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v10 = CGRectIsEmpty(v22);
    v9 = self->_lastRect.origin.x;
    if (v10)
    {
      y = self->_lastRect.origin.y;
      width = self->_lastRect.size.width;
      height = self->_lastRect.size.height;
    }
    else
    {
      v11 = self->_lastRect.origin.y;
      v12 = self->_lastRect.size.width;
      v13 = self->_lastRect.size.height;
      v25.origin.x = v7;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      *(CGRect *)&v9 = CGRectUnion(*(CGRect *)&v9, v25);
      y = v14;
      width = v15;
      height = v16;
    }
  }
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v9;
  return result;
}

- (void)addRenderingAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextDragPreviewRenderer layoutManager](self, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTemporaryAttributes:forCharacterRange:", v4, self->_range.location, self->_range.length);

}

- (void)removeRenderingAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[UITextDragPreviewRenderer layoutManager](self, "layoutManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeTemporaryAttribute:forCharacterRange:", v9, self->_range.location, self->_range.length);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
