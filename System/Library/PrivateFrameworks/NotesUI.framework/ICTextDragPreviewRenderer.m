@implementation ICTextDragPreviewRenderer

- (ICTextDragPreviewRenderer)initWithLayoutManager:(id)a3 range:(_NSRange)a4 textStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  ICTextDragPreviewRenderer *v12;
  ICTextDragPreviewRenderer *v13;
  objc_super v15;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICTextDragPreviewRenderer;
  v12 = -[ICTextDragPreviewRenderer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutManager, a3);
    v13->_range.location = location;
    v13->_range.length = length;
    *(_WORD *)&v13->_calculated = 256;
    objc_storeStrong((id *)&v13->_textStorage, a5);
  }

  return v13;
}

- (UIImage)image
{
  -[ICTextDragPreviewRenderer _calculate](self, "_calculate");
  return self->_image;
}

- (CGRect)firstLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[ICTextDragPreviewRenderer _calculate](self, "_calculate");
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

  -[ICTextDragPreviewRenderer _calculate](self, "_calculate");
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

  -[ICTextDragPreviewRenderer _calculate](self, "_calculate");
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
    -[ICTextDragPreviewRenderer layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__ICTextDragPreviewRenderer__calculate__block_invoke;
    v6[3] = &unk_1E5C20000;
    v6[4] = self;
    objc_msgSend(v5, "coordinateAccess:", v6);

  }
}

void __39__ICTextDragPreviewRenderer__calculate__block_invoke(uint64_t a1, void *a2)
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  NSRange v23;
  __int128 v24;
  NSRange v25;
  NSRange v26;
  CGRect v27;
  CGRect v28;

  v20 = a2;
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
      v11 = objc_msgSend(v20, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
      v13 = v12;
      objc_msgSend(v20, "textContainerForGlyphAtIndex:effectiveRange:", v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27.origin.x = v8;
      v27.origin.y = v9;
      v27.size.width = v10;
      v27.size.height = v7;
      v28 = CGRectOffset(v27, -*(double *)(*(_QWORD *)(a1 + 32) + 120), -*(double *)(*(_QWORD *)(a1 + 32) + 128));
      v25.location = objc_msgSend(v20, "glyphRangeForBoundingRect:inTextContainer:", v14, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
      v26.location = v11;
      v26.length = v13;
      v15 = NSIntersectionRange(v25, v26);
      v24 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v10, v7);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39__ICTextDragPreviewRenderer__calculate__block_invoke_2;
      v21[3] = &unk_1E5C1FFD8;
      v22 = v20;
      v23 = v15;
      objc_msgSend(v16, "imageWithActions:", v21);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 136);
      *(_QWORD *)(v18 + 136) = v17;

    }
  }

}

uint64_t __39__ICTextDragPreviewRenderer__calculate__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
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
  double MinX;
  CGPoint v39;
  CGSize v40;
  double MinY;
  double MaxY;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *, NSUInteger, NSUInteger, _BYTE *);
  void *v46;
  ICTextDragPreviewRenderer *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _NSRange *v56;
  uint64_t v57;
  const char *v58;
  __int128 v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  const char *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  const char *v69;
  __int128 v70;
  __int128 v71;
  CGRect v72;

  v4 = a3;
  v66 = 0;
  v67 = (double *)&v66;
  v68 = 0x4010000000;
  v69 = "";
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v70 = *MEMORY[0x1E0C9D628];
  v71 = v5;
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x4010000000;
  v63 = "";
  v64 = v70;
  v65 = v5;
  v55 = 0;
  v56 = (_NSRange *)&v55;
  v57 = 0x3010000000;
  v58 = "";
  v59 = xmmword_1ACA582A0;
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", self->_range.location, self->_range.length, 0);
  v9 = v8;
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke;
  v46 = &unk_1E5C20050;
  v53 = v7;
  v54 = v8;
  v47 = self;
  v50 = &v55;
  v10 = v4;
  v48 = v10;
  v11 = v6;
  v49 = v11;
  v51 = &v66;
  v52 = &v60;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", v7, v9, &v43);
  if (objc_msgSend(v11, "count", v43, v44, v45, v46, v47) == 1)
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

    if ((unint64_t)objc_msgSend(v11, "count") < 3)
    {
      if (self->_unifyRects)
      {
        MinX = CGRectGetMinX(self->_firstRect);
        if (MinX > CGRectGetMaxX(self->_lastRect))
        {
          self->_middleRect = CGRectUnion(self->_firstRect, self->_lastRect);
          v39 = (CGPoint)*MEMORY[0x1E0C9D648];
          v40 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
          self->_firstRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
          self->_firstRect.size = v40;
          self->_lastRect.origin = v39;
          self->_lastRect.size = v40;
        }
      }
    }
    else
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
        v72.origin.x = v34;
        v72.origin.y = v35;
        v72.size.width = v36;
        v72.size.height = v37;
        self->_middleRect = CGRectUnion(self->_middleRect, v72);

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
  self->_renderedGlyphRange = v56[2];
  -[ICTextDragPreviewRenderer setOriginAdjustment:](self, "setOriginAdjustment:", v67[4] - v61[4], v67[5] - v61[5]);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

}

void __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, _BYTE *a5)
{
  id v9;
  NSRange v10;
  uint64_t v11;
  NSRange v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  NSRange v35;
  NSRange v36;

  v9 = a2;
  v36.location = a3;
  v36.length = a4;
  v10 = NSIntersectionRange(v36, *(NSRange *)(a1 + 80));
  if (!v10.length)
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "characterRangeForGlyphRange:actualGlyphRange:", v10.location, 0, 0);
    if (v20)
    {
      v21 = v19;
      v22 = v20;
      objc_msgSend(v18, "textStorage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "attributedSubstringFromRange:", v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "string");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByTrimmingCharactersInSet:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");

      if (v28)
        goto LABEL_2;
    }
    else
    {

    }
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 146))
      goto LABEL_9;
  }
LABEL_2:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12.location = *(_QWORD *)(v11 + 32);
  if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(NSRange *)(v11 + 32) = v10;
  }
  else
  {
    v12.length = *(_QWORD *)(v11 + 40);
    *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = NSUnionRange(v12, v10);
  }
  v13 = *(void **)(a1 + 40);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2;
  v29[3] = &unk_1E5C20028;
  v30 = v13;
  v35 = v10;
  v14 = v9;
  v15 = *(_QWORD *)(a1 + 32);
  v31 = v14;
  v32 = v15;
  v33 = *(id *)(a1 + 48);
  v34 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v30, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v10.location, v10.length, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v14, v29);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(double *)(v16 + 56);
  if (v17 > 400.0 && *(double *)(v16 + 48) / v17 <= 0.8)
    *a5 = 1;

LABEL_9:
}

void __63__ICTextDragPreviewRenderer__calculateRectsUsingLayoutManager___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGFloat v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  _BOOL4 IsEmpty;
  CGRect *v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  double v45;
  id v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
  v52.origin.y = v10;
  v52.size.height = v11;
  v47.origin.x = a2;
  v47.origin.y = a3;
  v47.size.width = a4;
  v47.size.height = a5;
  v52.origin.x = a2;
  v52.size.width = a4;
  v48 = CGRectUnion(v47, v52);
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  objc_msgSend(*(id *)(a1 + 48), "layoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "characterRangeForGlyphRange:actualGlyphRange:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), 0);
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 48), "textStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], v17, 0);
  v46 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 48), "textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "string");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend((id)v22, "characterAtIndex:", v17 - 1);

    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_msgSend(v24, "characterIsMember:", v23);

    if ((v22 & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  if (!v46)
  {
LABEL_15:
    v46 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(v46, "isList"))
  {
LABEL_16:
    v30 = height;
    v35 = width;
    v32 = y;
    v37 = x;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 48), "textStorage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "attributedString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICTextController extraWidthNeededForStyle:range:attributedString:textView:](ICTextController, "extraWidthNeededForStyle:range:attributedString:textView:", v46, v17, v19, v26, 0);
  v28 = v27;

  v29 = v28 + 4.0;
  if (v28 <= 0.0)
    v29 = v28;
  v30 = height;
  v31 = width;
  v32 = y;
  v33 = x;
  if (objc_msgSend(v46, "style", *(_QWORD *)&v29) == 103)
  {
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v50 = CGRectInset(v49, 0.0, -6.0);
    v33 = v50.origin.x;
    v32 = v50.origin.y;
    v31 = v50.size.width;
    v30 = v50.size.height;
  }
  v34 = objc_msgSend(v46, "layoutWritingDirection");
  if (v34 == -1)
    v34 = objc_msgSend(MEMORY[0x1E0DC1290], "defaultWritingDirectionForLanguage:", 0);
  v35 = v45 + v31;
  v36 = 0.0;
  if (!v34)
    v36 = v45;
  v37 = v33 - v36;
LABEL_17:
  v38 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v37, v32, v35, v30);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v39);

  IsEmpty = CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
  v41 = *(CGRect **)(*(_QWORD *)(a1 + 64) + 8);
  if (IsEmpty)
  {
    v41[1].origin.x = x;
    v41[1].origin.y = y;
    v42 = a1 + 72;
    v41[1].size.width = width;
    v41[1].size.height = height;
  }
  else
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = CGRectUnion(v41[1], v53);
    v43 = *(_QWORD *)(a1 + 72);
    v42 = a1 + 72;
    v54.origin.x = v37;
    v54.origin.y = v32;
    v54.size.width = v35;
    v54.size.height = v30;
    v51 = CGRectUnion(*(CGRect *)(*(_QWORD *)(v43 + 8) + 32), v54);
    v37 = v51.origin.x;
    v32 = v51.origin.y;
    v35 = v51.size.width;
    v30 = v51.size.height;
  }
  v44 = *(double **)(*(_QWORD *)v42 + 8);
  v44[4] = v37;
  v44[5] = v32;
  v44[6] = v35;
  v44[7] = v30;

}

- (CGRect)_correctlyOffsetBoundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[ICTextDragPreviewRenderer _rawBoundingRect](self, "_rawBoundingRect");
  self->_origin.x = -v3;
  self->_origin.y = -v4;
  if (!CGRectIsEmpty(self->_firstRect))
    self->_firstRect = CGRectOffset(self->_firstRect, self->_origin.x, self->_origin.y);
  if (!CGRectIsEmpty(self->_middleRect))
    self->_middleRect = CGRectOffset(self->_middleRect, self->_origin.x, self->_origin.y);
  if (!CGRectIsEmpty(self->_lastRect))
    self->_lastRect = CGRectOffset(self->_lastRect, self->_origin.x, self->_origin.y);
  -[ICTextDragPreviewRenderer _rawBoundingRect](self, "_rawBoundingRect");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
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

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  self->_isDraggingChecklistItem = a3;
}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (CGPoint)originAdjustment
{
  double x;
  double y;
  CGPoint result;

  x = self->_originAdjustment.x;
  y = self->_originAdjustment.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginAdjustment:(CGPoint)a3
{
  self->_originAdjustment = a3;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (_NSRange)renderedGlyphRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_renderedGlyphRange.length;
  location = self->_renderedGlyphRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRenderedGlyphRange:(_NSRange)a3
{
  self->_renderedGlyphRange = a3;
}

- (ICTTTextStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_textStorage, a3);
}

- (double)renderOffset
{
  return self->_renderOffset;
}

- (void)setRenderOffset:(double)a3
{
  self->_renderOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
