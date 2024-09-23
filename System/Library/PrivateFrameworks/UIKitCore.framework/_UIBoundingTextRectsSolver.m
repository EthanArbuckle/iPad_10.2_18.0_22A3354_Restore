@implementation _UIBoundingTextRectsSolver

- (_UIBoundingTextRectsSolver)initWithTextContainer:(id)a3 range:(id)a4 unifyRects:(BOOL)a5
{
  id v9;
  id v10;
  _UIBoundingTextRectsSolver *v11;
  _UIBoundingTextRectsSolver *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIBoundingTextRectsSolver;
  v11 = -[_UIBoundingTextRectsSolver init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textContainer, a3);
    objc_storeStrong((id *)&v12->_range, a4);
    v12->_calculated = 0;
    v12->_unifyRects = a5;
  }

  return v12;
}

- (CGRect)firstLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UIBoundingTextRectsSolver _calculate](self, "_calculate");
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

  -[_UIBoundingTextRectsSolver _calculate](self, "_calculate");
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

  -[_UIBoundingTextRectsSolver _calculate](self, "_calculate");
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

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UIBoundingTextRectsSolver _calculate](self, "_calculate");
  x = self->_totalRect.origin.x;
  y = self->_totalRect.origin.y;
  width = self->_totalRect.size.width;
  height = self->_totalRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_calculate
{
  uint64_t v3;
  CGPoint v4;
  CGSize v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  if (!self->_calculated)
  {
    v3 = MEMORY[0x1E0C9D648];
    self->_calculated = 1;
    v4 = *(CGPoint *)v3;
    v5 = *(CGSize *)(v3 + 16);
    self->_firstRect.origin = *(CGPoint *)v3;
    self->_firstRect.size = v5;
    self->_middleRect.origin = v4;
    self->_middleRect.size = v5;
    self->_lastRect.origin = v4;
    self->_lastRect.size = v5;
    self->_totalRect.origin = v4;
    self->_totalRect.size = v5;
    -[NSTextContainer textLayoutManager](self->_textContainer, "textLayoutManager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_UIBoundingTextRectsSolver _calculateRectsUsingTextLayoutManager:](self, "_calculateRectsUsingTextLayoutManager:", v6, v6);
    }
    else
    {
      -[NSTextContainer layoutManager](self->_textContainer, "layoutManager", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40___UIBoundingTextRectsSolver__calculate__block_invoke;
      v9[3] = &unk_1E16E4F28;
      v9[4] = self;
      objc_msgSend(v7, "coordinateAccess:", v9);

    }
    -[_UIBoundingTextRectsSolver _calculateTotalRect](self, "_calculateTotalRect");

  }
}

- (void)_calculateRectsUsingTextLayoutManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[NSTextContainer textContainerOrigin](self->_textContainer, "textContainerOrigin");
  v7 = v6;
  v9 = v8;
  -[UITextRange unionTextRange](self->_range, "unionTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68___UIBoundingTextRectsSolver__calculateRectsUsingTextLayoutManager___block_invoke;
  v12[3] = &unk_1E16E78C0;
  v14 = v7;
  v15 = v9;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v4, "enumerateTextSegmentsInRange:type:options:usingBlock:", v10, 0, 0, v12);

  -[_UIBoundingTextRectsSolver _coalesceRectsForRects:](self, "_coalesceRectsForRects:", v11);
}

- (void)_calculateRectsUsingLayoutManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[NSTextContainer textContainerOrigin](self->_textContainer, "textContainerOrigin");
  v7 = v6;
  v9 = v8;
  v10 = -[UITextRange asRange](self->_range, "asRange");
  v12 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v11, 0);
  v14 = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke;
  v17[3] = &unk_1E16E7910;
  v20 = v12;
  v21 = v13;
  v17[4] = self;
  v18 = v4;
  v22 = v7;
  v23 = v9;
  v19 = v5;
  v15 = v5;
  v16 = v4;
  objc_msgSend(v16, "enumerateLineFragmentsForGlyphRange:usingBlock:", v12, v14, v17);
  -[_UIBoundingTextRectsSolver _coalesceRectsForRects:](self, "_coalesceRectsForRects:", v15);

}

- (void)_coalesceRectsForRects:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  unint64_t v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double MaxY;
  double MinX;
  CGPoint v33;
  CGSize v34;
  id v35;
  CGRect v36;

  v35 = a3;
  if (objc_msgSend(v35, "count") == 1)
  {
    objc_msgSend(v35, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CGRectValue");
    self->_middleRect.origin.x = v5;
    self->_middleRect.origin.y = v6;
    self->_middleRect.size.width = v7;
    self->_middleRect.size.height = v8;

  }
  else if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGRectValue");
    self->_firstRect.origin.x = v10;
    self->_firstRect.origin.y = v11;
    self->_firstRect.size.width = v12;
    self->_firstRect.size.height = v13;

    objc_msgSend(v35, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CGRectValue");
    self->_lastRect.origin.x = v15;
    self->_lastRect.origin.y = v16;
    self->_lastRect.size.width = v17;
    self->_lastRect.size.height = v18;

    if ((unint64_t)objc_msgSend(v35, "count") < 3)
    {
      if (self->_unifyRects)
      {
        MinX = CGRectGetMinX(self->_firstRect);
        if (MinX > CGRectGetMaxX(self->_lastRect))
        {
          self->_middleRect = CGRectUnion(self->_firstRect, self->_lastRect);
          v33 = (CGPoint)*MEMORY[0x1E0C9D648];
          v34 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
          self->_firstRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
          self->_firstRect.size = v34;
          self->_lastRect.origin = v33;
          self->_lastRect.size = v34;
        }
      }
    }
    else
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGRectValue");
      self->_middleRect.origin.x = v20;
      self->_middleRect.origin.y = v21;
      self->_middleRect.size.width = v22;
      self->_middleRect.size.height = v23;

      if ((unint64_t)(objc_msgSend(v35, "count") - 4) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        v24 = 2;
        do
        {
          objc_msgSend(v35, "objectAtIndexedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "CGRectValue");
          v36.origin.x = v26;
          v36.origin.y = v27;
          v36.size.width = v28;
          v36.size.height = v29;
          self->_middleRect = CGRectUnion(self->_middleRect, v36);

          ++v24;
        }
        while (v24 < objc_msgSend(v35, "count") - 1);
      }
      if (self->_unifyRects)
      {
        v30 = CGRectGetMinY(self->_middleRect) + 1.0;
        self->_firstRect.size.height = v30 - CGRectGetMinY(self->_firstRect);
        MaxY = CGRectGetMaxY(self->_lastRect);
        self->_lastRect.size.height = MaxY - CGRectGetMaxY(self->_middleRect) + 1.0;
        self->_lastRect.origin.y = CGRectGetMaxY(self->_middleRect) + -1.0;
      }
    }
  }

}

- (void)_calculateTotalRect
{
  CGRect *p_firstRect;
  CGFloat x;
  CGRect *p_totalRect;
  CGSize v6;
  CGFloat y;
  CGFloat height;
  CGSize size;
  CGSize v10;
  CGSize v11;

  p_firstRect = &self->_firstRect;
  x = self->_firstRect.origin.x;
  p_totalRect = &self->_totalRect;
  v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_totalRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_totalRect.size = v6;
  y = self->_firstRect.origin.y;
  v6.width = self->_firstRect.size.width;
  height = self->_firstRect.size.height;
  if (!CGRectIsEmpty(*(CGRect *)&x))
  {
    size = p_firstRect->size;
    p_totalRect->origin = p_firstRect->origin;
    p_totalRect->size = size;
  }
  if (!CGRectIsEmpty(self->_middleRect))
  {
    if (CGRectIsEmpty(self->_totalRect))
    {
      v10 = self->_middleRect.size;
      p_totalRect->origin = self->_middleRect.origin;
      p_totalRect->size = v10;
    }
    else
    {
      self->_totalRect = CGRectUnion(self->_middleRect, self->_totalRect);
    }
  }
  if (!CGRectIsEmpty(self->_lastRect))
  {
    if (CGRectIsEmpty(self->_totalRect))
    {
      v11 = self->_lastRect.size;
      p_totalRect->origin = self->_lastRect.origin;
      p_totalRect->size = v11;
    }
    else
    {
      self->_totalRect = CGRectUnion(self->_lastRect, self->_totalRect);
    }
  }
}

- (NSArray)rects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_UIBoundingTextRectsSolver _calculate](self, "_calculate");
  v3 = (void *)objc_opt_new();
  if (!CGRectIsEmpty(self->_firstRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_firstRect.origin.x, self->_firstRect.origin.y, self->_firstRect.size.width, self->_firstRect.size.height);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (!CGRectIsEmpty(self->_middleRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_middleRect.origin.x, self->_middleRect.origin.y, self->_middleRect.size.width, self->_middleRect.size.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (!CGRectIsEmpty(self->_lastRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_lastRect.origin.x, self->_lastRect.origin.y, self->_lastRect.size.width, self->_lastRect.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v7;
}

- (id)description
{
  _BOOL4 calculated;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  UITextRange *range;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  calculated = self->_calculated;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  range = self->_range;
  if (self->_unifyRects)
    v9 = CFSTR("unified");
  else
    v9 = CFSTR("not unified");
  if (calculated)
  {
    -[_UIBoundingTextRectsSolver rects](self, "rects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p (%@, %@) = (%@)"), v7, self, range, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p (%@, %@) not calculated>"), v6, self, self->_range, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end
