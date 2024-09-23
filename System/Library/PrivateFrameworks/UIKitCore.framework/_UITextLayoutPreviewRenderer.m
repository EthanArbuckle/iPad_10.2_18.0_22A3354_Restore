@implementation _UITextLayoutPreviewRenderer

- (_UITextLayoutPreviewRenderer)initWithTextLayoutManager:(id)a3 range:(id)a4 unifyRects:(BOOL)a5
{
  id v9;
  id v10;
  _UITextLayoutPreviewRenderer *v11;
  _UITextLayoutPreviewRenderer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UITextLayoutPreviewRenderer;
  v11 = -[_UITextLayoutPreviewRenderer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textLayoutManager, a3);
    objc_storeStrong((id *)&v12->_range, a4);
    v12->_unifyRects = a5;
    v12->_calculated = 0;
  }

  return v12;
}

- (UIImage)image
{
  -[_UITextLayoutPreviewRenderer _updateDataIfNeeded](self, "_updateDataIfNeeded");
  return self->_image;
}

- (CGRect)firstLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UITextLayoutPreviewRenderer _updateDataIfNeeded](self, "_updateDataIfNeeded");
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

  -[_UITextLayoutPreviewRenderer _updateDataIfNeeded](self, "_updateDataIfNeeded");
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

  -[_UITextLayoutPreviewRenderer _updateDataIfNeeded](self, "_updateDataIfNeeded");
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

- (void)_updateDataIfNeeded
{
  void *v3;
  void *v4;
  NSTextRange *range;
  uint64_t v6;
  NSTextLayoutManager *textLayoutManager;
  NSTextRange *v8;
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
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  unint64_t i;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double MinY;
  double MaxY;
  double v37;
  double v38;
  UIGraphicsImageRenderer *v39;
  UIGraphicsImageRenderer *v40;
  NSTextLayoutManager *v41;
  NSTextRange *v42;
  id v43;
  NSTextLayoutManager *v44;
  NSTextRange *v45;
  UIImage *v46;
  UIImage *image;
  CGSize v48;
  CGPoint v49;
  _QWORD v50[4];
  id v51;
  NSTextLayoutManager *v52;
  NSTextRange *v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  void *v64;
  CGPoint v65;
  CGSize v66;
  CGRect firstRect;
  CGRect middleRect;
  CGRect lastRect;
  CGRect v70;

  if (!self->_calculated)
  {
    self->_calculated = 1;
    v48 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v49 = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_firstRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_firstRect.size = v48;
    self->_middleRect.origin = v49;
    self->_middleRect.size = v48;
    self->_lastRect.origin = v49;
    self->_lastRect.size = v48;
    v3 = (void *)objc_opt_new();
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v62 = (double *)&v61;
    v63 = 0x4010000000;
    v64 = &unk_18685B0AF;
    v65 = v49;
    v66 = v48;
    range = self->_range;
    v6 = MEMORY[0x1E0C809B0];
    if (range && !-[NSTextRange isEmpty](range, "isEmpty"))
    {
      textLayoutManager = self->_textLayoutManager;
      v8 = self->_range;
      v57[0] = v6;
      v57[1] = 3221225472;
      v57[2] = __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke;
      v57[3] = &unk_1E16D37C8;
      v58 = v3;
      v59 = v4;
      v60 = &v61;
      -[NSTextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](textLayoutManager, "enumerateTextSegmentsInRange:type:options:usingBlock:", v8, 0, 67108865, v57);

    }
    if (objc_msgSend(v3, "count", v48, v49) == 1)
    {
      objc_msgSend(v3, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "CGRectValue");
      self->_middleRect.origin.x = v10;
      self->_middleRect.origin.y = v11;
      self->_middleRect.size.width = v12;
      self->_middleRect.size.height = v13;

    }
    else if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "CGRectValue");
      self->_firstRect.origin.x = v15;
      self->_firstRect.origin.y = v16;
      self->_firstRect.size.width = v17;
      self->_firstRect.size.height = v18;

      objc_msgSend(v3, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGRectValue");
      self->_lastRect.origin.x = v20;
      self->_lastRect.origin.y = v21;
      self->_lastRect.size.width = v22;
      self->_lastRect.size.height = v23;

      if ((unint64_t)objc_msgSend(v3, "count") >= 3)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "CGRectValue");
        self->_middleRect.origin.x = v25;
        self->_middleRect.origin.y = v26;
        self->_middleRect.size.width = v27;
        self->_middleRect.size.height = v28;

        for (i = 2; i < objc_msgSend(v3, "count") - 1; ++i)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", i);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "CGRectValue");
          v70.origin.x = v31;
          v70.origin.y = v32;
          v70.size.width = v33;
          v70.size.height = v34;
          self->_middleRect = CGRectUnion(self->_middleRect, v70);

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
    v37 = v62[4];
    v38 = v62[5];
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformMakeTranslation(&v56, -v37, -v38);
    if (!CGRectIsEmpty(self->_firstRect))
    {
      firstRect = self->_firstRect;
      v55 = v56;
      self->_firstRect = CGRectApplyAffineTransform(firstRect, &v55);
    }
    if (!CGRectIsEmpty(self->_middleRect))
    {
      middleRect = self->_middleRect;
      v55 = v56;
      self->_middleRect = CGRectApplyAffineTransform(middleRect, &v55);
    }
    if (!CGRectIsEmpty(self->_lastRect))
    {
      lastRect = self->_lastRect;
      v55 = v56;
      self->_lastRect = CGRectApplyAffineTransform(lastRect, &v55);
    }
    v39 = [UIGraphicsImageRenderer alloc];
    v40 = -[UIGraphicsImageRenderer initWithSize:](v39, "initWithSize:", v62[6], v62[7]);
    v41 = self->_textLayoutManager;
    v42 = self->_range;
    v50[0] = v6;
    v50[1] = 3221225472;
    v50[2] = __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke_2;
    v50[3] = &unk_1E16D37F0;
    v54 = v56;
    v43 = v4;
    v51 = v43;
    v44 = v41;
    v52 = v44;
    v45 = v42;
    v53 = v45;
    -[UIGraphicsImageRenderer imageWithActions:](v40, "imageWithActions:", v50);
    v46 = (UIImage *)objc_claimAutoreleasedReturnValue();
    image = self->_image;
    self->_image = v46;

    _Block_object_dispose(&v61, 8);
  }
}

- (void)addRenderingAttributes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___UITextLayoutPreviewRenderer_addRenderingAttributes___block_invoke;
  v3[3] = &unk_1E16B4FF0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)removeRenderingAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSTextLayoutManager removeRenderingAttribute:forTextRange:](self->_textLayoutManager, "removeRenderingAttribute:forTextRange:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), self->_range);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (NSTextRange)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
