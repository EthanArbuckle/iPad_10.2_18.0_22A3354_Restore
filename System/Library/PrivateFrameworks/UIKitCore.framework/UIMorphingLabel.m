@implementation UIMorphingLabel

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (UIMorphingLabel)initWithFrame:(CGRect)a3
{
  UIMorphingLabel *v3;
  UIMorphingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMorphingLabel;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIMorphingLabel baseInit](v3, "baseInit");
  return v4;
}

- (void)baseInit
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *hiddenGlyphViews;
  CGSize v7;
  UIView *v8;
  UIView *v9;
  UIView *colorView;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[UIMorphingLabel setText:](self, "setText:", 0);
  -[UIMorphingLabel setTextAlignment:](self, "setTextAlignment:", 1);
  +[UIMorphingLabel preferredFontWithSize:](UIMorphingLabel, "preferredFontWithSize:", 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMorphingLabel setFont:](self, "setFont:", v3);

  +[UIColor blackColor](UIColor, "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMorphingLabel setTextColor:](self, "setTextColor:", v4);

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  hiddenGlyphViews = self->_hiddenGlyphViews;
  self->_hiddenGlyphViews = v5;

  v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_visibleRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_visibleRect.size = v7;
  self->_lastUpdateTime = 0.0;
  self->_isDoingFastAnimation = 0;
  self->_enableAnimation = 1;
  v8 = [UIView alloc];
  v9 = -[UIView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  colorView = self->_colorView;
  self->_colorView = v9;

  -[UIView addSubview:](self, "addSubview:", self->_colorView);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", CFSTR("color"));
  -[UIMorphingLabel textColor](self, "textColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v12, "CGColor"), CFSTR("inputColor"));

  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_colorView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilters:", v13);

  self->_rippleDuration = -1.0;
  self->_initialScale = 0.6;
  self->_glyphScaleAnimationSpeed = 1.4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_contentSizeDidChange_, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

}

- (void)setTextColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_textColor) & 1) != 0)
  {
    v4 = v6;
  }
  else
  {
    v5 = (void *)objc_msgSend(v6, "copy");

    objc_storeStrong((id *)&self->_textColor, v5);
    self->_textColorDidChange = 1;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v4 = v5;
  }

}

- (void)setText:(id)a3
{
  NSString *v4;
  void *v5;
  _UIViewAnimationAttributes *v6;
  _UIViewAnimationAttributes *textAnimationAttributes;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_text != v4)
  {
    v8 = v4;
    if (-[NSString isEqualToString:](v4, "isEqualToString:"))
    {
      v4 = v8;
    }
    else
    {
      v5 = (void *)-[NSString copy](v8, "copy");

      objc_storeStrong((id *)&self->_text, v5);
      self->_textDidChange = 1;
      if (!self->_textAnimationAttributes)
      {
        +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
        v6 = (_UIViewAnimationAttributes *)objc_claimAutoreleasedReturnValue();
        textAnimationAttributes = self->_textAnimationAttributes;
        self->_textAnimationAttributes = v6;

      }
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v4 = (NSString *)v5;
    }
  }

}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _UIViewAnimationAttributes *v7;
  _UIViewAnimationAttributes *textAnimationAttributes;
  id v9;
  id v10;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_font) & 1) != 0)
  {
    v4 = v9;
  }
  else
  {
    v5 = v9;
    if (!v9)
    {
      +[UIMorphingLabel preferredFontWithSize:](UIMorphingLabel, "preferredFontWithSize:", 17.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v5;
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_storeStrong((id *)&self->_font, v6);
    self->_textDidChange = 1;
    if (!self->_textAnimationAttributes)
    {
      +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
      v7 = (_UIViewAnimationAttributes *)objc_claimAutoreleasedReturnValue();
      textAnimationAttributes = self->_textAnimationAttributes;
      self->_textAnimationAttributes = v7;

    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v4 = v6;
  }

}

+ (id)preferredFontWithSize:(double)a3
{
  void *v4;
  double v5;
  const char *v6;
  void *v7;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) == 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("UICTContentSizeCategoryXL")))
    {
      v5 = 2.0;
LABEL_9:
      a3 = a3 + v5;
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXL")))
    {
      v5 = 4.0;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXXL")) & 1) != 0
      || _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v4, v6))
    {
      v5 = 6.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  objc_msgSend(off_1E167A828, "systemFontOfSize:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setVisibleRect:(CGRect)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const CGRect *v8;
  double v9;
  float v10;
  void *v11;
  double v12;

  self->_visibleRect = a3;
  if (-[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", v8[v4].origin.x, v8[v4].origin.y, v8[v4].size.width, v8[v4].size.height);
      v10 = v9;
      objc_msgSend(v7, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = v10;
      objc_msgSend(v11, "setOpacity:", v12);

      ++v5;
      ++v4;
    }
    while (v5 < -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"));
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  BOOL v15;
  _BOOL4 v16;
  uint64_t v18;
  _UIViewAnimationAttributes *textAnimationAttributes;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  CGRect v26;
  CGRect v27;

  if (!-[UIMorphingLabel suppressLayoutSubviews](self, "suppressLayoutSubviews"))
  {
    -[UIView frame](self->_colorView, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView bounds](self, "bounds");
    v27.origin.x = v11;
    v27.origin.y = v12;
    v27.size.width = v13;
    v27.size.height = v14;
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    v15 = CGRectEqualToRect(v26, v27);
    if (!v15)
    {
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_colorView, "setFrame:");
    }
    if (self->_enableAnimation && self->_dstGlyphSet && !_AXSReduceMotionEnabled())
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v23, "_predictionGraphicsQuality") != 10;

    }
    else
    {
      v16 = 0;
    }
    if (self->_textDidChange || !v15)
    {
      objc_storeStrong((id *)&self->_srcGlyphSet, self->_dstGlyphSet);
      v18 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __33__UIMorphingLabel_layoutSubviews__block_invoke;
      v25[3] = &unk_1E16B1B28;
      v25[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
      if (v16 && self->_textAnimationAttributes)
      {
        -[UIMorphingLabel animateGlyphs](self, "animateGlyphs");
      }
      else
      {
        v24[0] = v18;
        v24[1] = 3221225472;
        v24[2] = __33__UIMorphingLabel_layoutSubviews__block_invoke_2;
        v24[3] = &unk_1E16B1B28;
        v24[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
      }
      self->_textDidChange = 0;
      textAnimationAttributes = self->_textAnimationAttributes;
      self->_textAnimationAttributes = 0;

    }
    if (self->_textColorDidChange)
    {
      -[UIView layer](self->_colorView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValue:forKeyPath:", -[UIColor CGColor](self->_textColor, "CGColor"), CFSTR("filters.color.inputColor"));

      -[UIView layer](self->_colorView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeAnimationForKey:", CFSTR("textColor"));

      self->_textColorDidChange = 0;
    }
    -[UIMorphingLabel currentMediaTime](self, "currentMediaTime");
    self->_lastUpdateTime = v22;
  }
}

- (BOOL)suppressLayoutSubviews
{
  return self->_suppressLayoutSubviews;
}

- (double)currentMediaTime
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  return v4;
}

uint64_t __33__UIMorphingLabel_layoutSubviews__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeGlyphs");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 416);
  *(_QWORD *)(v2 + 416) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "placeGlyphs");
}

void __33__UIMorphingLabel_layoutSubviews__block_invoke(uint64_t a1)
{
  UIMorphingLabelGlyphSet *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = [UIMorphingLabelGlyphSet alloc];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "attributedString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UIMorphingLabelGlyphSet initWithLabel:attributedString:](v2, "initWithLabel:attributedString:", v3, v7);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v4;

}

- (id)attributedString
{
  return -[UIMorphingLabel attributedStringForText:](self, "attributedStringForText:", self->_text);
}

- (id)attributedStringForText:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  UIColor *textColor;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E16EDF20;
  v6 = *(_QWORD *)off_1E1678D98;
  v11[0] = *(_QWORD *)off_1E1678D90;
  v11[1] = v6;
  textColor = self->_textColor;
  v12[0] = self->_font;
  v12[1] = textColor;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v8);

  return v9;
}

- (UIMorphingLabel)initWithCoder:(id)a3
{
  UIMorphingLabel *v3;
  UIMorphingLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIMorphingLabel;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[UIMorphingLabel baseInit](v3, "baseInit");
  return v4;
}

- (double)alphaForFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = 1.0;
  if (!CGRectIsNull(self->_visibleRect))
  {
    -[UIMorphingLabel visibleRect](self, "visibleRect");
    v11 = CGRectInset(v10, -1.0, 0.0);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    if (!CGRectContainsRect(v11, v14))
    {
      -[UIMorphingLabel visibleRect](self, "visibleRect");
      v13 = CGRectInset(v12, -8.0, 0.0);
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      if (CGRectContainsRect(v13, v15))
        return 0.5;
      else
        return 0.3;
    }
  }
  return v8;
}

- (double)_rippleDurationForEndInsertion:(BOOL)a3
{
  double result;
  double v4;

  result = self->_rippleDuration;
  if (result <= 0.0)
  {
    v4 = 0.1;
    if (a3)
      v4 = 0.125;
    return v4 * self->_rippleFactor;
  }
  return result;
}

- (BOOL)_isRTL
{
  return -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft;
}

- (unint64_t)calculateHardAlignmentAtIndex:(unint64_t)a3 fromGlyphsInRange:(_NSRange)a4 toGlyphsInRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  const unsigned __int16 *v11;
  const unsigned __int16 *v12;
  unint64_t result;
  uint64_t v14;
  const unsigned __int16 *v15;
  const unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v25;
  NSUInteger v26;
  NSUInteger v27;
  char v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger i;
  BOOL v32;
  NSUInteger v33;
  NSUInteger j;
  int v35;
  unsigned __int8 *v36;
  int v37;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  if (!calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable)
  {
    calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable = (uint64_t)malloc_type_malloc(0x1452uLL, 0x30CA8487uLL);
    bzero((void *)calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable, 0x1452uLL);
  }
  v11 = -[UIMorphingLabelGlyphSet glyphs](self->_srcGlyphSet, "glyphs");
  v12 = -[UIMorphingLabelGlyphSet glyphs](self->_dstGlyphSet, "glyphs");
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 <= 0x32 && length <= 0x32)
  {
    v14 = 0;
    v15 = &v11[v8];
    v16 = &v12[location];
    v17 = calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable;
    v18 = calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable + 1;
    while (1)
    {
      v19 = -1;
      v20 = (_BYTE *)v18;
      do
      {
        if (!v14 || v19 == -1)
        {
          *(v20 - 1) = 0;
          *v20 = 2 * (v14 == 0);
          goto LABEL_19;
        }
        v21 = *(v20 - 103);
        v22 = *(v20 - 3);
        if (v15[v14 - 1] == v16[v19])
          v23 = *(v20 - 105) + 1;
        else
          v23 = *(v20 - 105);
        if (v23 < v21)
        {
          if (v21 >= v22)
          {
            *(_WORD *)(v20 - 1) = v21;
            goto LABEL_19;
          }
LABEL_17:
          *(v20 - 1) = v22;
          *v20 = 2;
          goto LABEL_19;
        }
        if (v23 < v22)
          goto LABEL_17;
        *(v20 - 1) = v23;
        *v20 = 1;
LABEL_19:
        ++v19;
        v20 += 2;
      }
      while (length != v19);
      v18 += 102;
      if (v14++ == v7)
      {
        if (v7 | length)
        {
          v25 = *(unsigned __int8 *)(v17 + 2 * (length + 51 * v7) + 1);
          v26 = length;
          v27 = v7;
          while (1)
          {
            if (v25 == 2)
            {
              --v26;
              v28 = 5;
              goto LABEL_30;
            }
            if (v25 == 1)
              break;
            if (!v25)
            {
              --v27;
              v28 = 3;
LABEL_30:
              v29 = v17 + 2 * (v26 + 51 * v27);
              v25 = *(unsigned __int8 *)(v29 + 1);
              *(_BYTE *)(v29 + 1) = v28;
            }
            if (!(v27 | v26))
              goto LABEL_32;
          }
          --v27;
          --v26;
          v28 = 4;
          goto LABEL_30;
        }
LABEL_32:
        v30 = 0;
        for (i = 0; ; i = v33)
        {
          if (v30 >= v7)
          {
            if (i >= length || a3 >= 0x64)
            {
LABEL_64:
              if (i >= length && v30 >= v7)
                return a3;
              else
                return 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          else if (a3 > 0x63)
          {
            goto LABEL_64;
          }
          if (*(_BYTE *)(v17 + 2 * (i + 51 * v30) + 1) != 4 || v15[v30] != v16[i])
            break;
          if (v30 >= v7 && i >= length)
          {
            v32 = 1;
LABEL_46:
            j = v30;
            v33 = i;
            goto LABEL_63;
          }
          v36 = (unsigned __int8 *)(v17 + 1 + 102 * v30 + 2 * i);
          v33 = i;
          for (j = v30; j < v7 || v33 < length; ++j)
          {
            v37 = *v36;
            v36 += 104;
            if (v37 != 4)
              break;
            if (v15[j] != v16[v33])
              break;
            ++v33;
          }
          v32 = 1;
LABEL_63:
          self->_alignmentSrc[a3] = v30 + v8;
          self->_alignmentDst[a3] = i + location;
          self->_alignmentIsEqual[a3++] = v32;
          v30 = j;
        }
        v33 = i;
        j = v30;
        if (v30 >= v7)
        {
          v33 = i;
          j = v30;
          if (i >= length)
          {
            v32 = 0;
            goto LABEL_46;
          }
        }
        while (2)
        {
          v35 = *(unsigned __int8 *)(v17 + 2 * (v33 + 51 * j) + 1);
          switch(v35)
          {
            case 3:
              ++j;
              break;
            case 5:
              goto LABEL_52;
            case 4:
              if (v15[j] == v16[v33])
                goto LABEL_56;
              ++j;
LABEL_52:
              ++v33;
              break;
          }
          if (j >= v7 && v33 >= length)
          {
LABEL_56:
            v32 = 0;
            goto LABEL_63;
          }
          continue;
        }
      }
    }
  }
  return result;
}

- (void)calculateGlyphAlignment
{
  unint64_t v3;
  unint64_t v4;
  const unsigned __int16 *v5;
  const unsigned __int16 *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  const unsigned __int16 *v10;
  const unsigned __int16 *v11;
  uint64_t v12;
  const unsigned __int16 *v13;
  const unsigned __int16 *v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;

  v3 = -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount");
  v4 = -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount");
  v5 = -[UIMorphingLabelGlyphSet glyphs](self->_srcGlyphSet, "glyphs");
  v6 = -[UIMorphingLabelGlyphSet glyphs](self->_dstGlyphSet, "glyphs");
  v7 = 0;
  if (v3 >= v4)
    v8 = v4;
  else
    v8 = v3;
  if (v8)
  {
    while (v5[v7] == v6[v7])
    {
      if (v8 == ++v7)
      {
        v9 = 0;
        v7 = v8;
        goto LABEL_15;
      }
    }
  }
  v9 = v8 - v7;
  if (v8 > v7 && (v10 = &v5[v3], v11 = &v6[v4], *(v10 - 1) == *(v11 - 1)))
  {
    v12 = 0;
    v13 = v10 - 2;
    v14 = v11 - 2;
    while (v7 - v8 + 1 != v12)
    {
      v15 = v13[v12];
      v16 = v14[v12--];
      if (v15 != v16)
      {
        v8 = v7 - v12;
        v9 = -v12;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
    v8 = v7;
  }
LABEL_15:
  if (v7)
  {
    self->_alignmentSrc[0] = 0;
    self->_alignmentDst[0] = 0;
    v17 = 1;
    self->_alignmentIsEqual[0] = 1;
  }
  else
  {
    v17 = 0;
  }
  if (v7 != v3 || v7 != v4)
  {
    if (v3 == v8
      || v4 == v8
      || (v18 = -[UIMorphingLabel calculateHardAlignmentAtIndex:fromGlyphsInRange:toGlyphsInRange:](self, "calculateHardAlignmentAtIndex:fromGlyphsInRange:toGlyphsInRange:", v17, v7, v3 - v8, v7, v4 - v8), v18 == 0x7FFFFFFFFFFFFFFFLL))
    {
      self->_alignmentSrc[v17] = v7;
      self->_alignmentDst[v17] = v7;
      self->_alignmentIsEqual[v17] = 0;
      v18 = v17 + 1;
    }
    if (v9)
    {
      self->_alignmentSrc[v18] = v3 - v9;
      self->_alignmentDst[v18] = v4 - v9;
      self->_alignmentIsEqual[v18] = 1;
      v17 = v18 + 1;
    }
    else
    {
      v17 = v18;
    }
  }
  self->_alignmentSize = v17;
}

- (_NSRange)srcRangeOfAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = self->_alignmentSrc[a3];
  if (self->_alignmentSize - 1 <= a3)
    v4 = -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount");
  else
    v4 = self->_alignmentSrc[a3 + 1];
  v5 = v4 - v3;
  v6 = v3;
  result.length = v5;
  result.location = v6;
  return result;
}

- (_NSRange)dstRangeOfAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = self->_alignmentDst[a3];
  if (self->_alignmentSize - 1 <= a3)
    v4 = -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount");
  else
    v4 = self->_alignmentDst[a3 + 1];
  v5 = v4 - v3;
  v6 = v3;
  result.length = v5;
  result.location = v6;
  return result;
}

- (id)glyphViewWithImage:(id)a3 isColorGlyph:(BOOL)a4
{
  UIMorphingLabel *v5;
  NSMutableArray *hiddenGlyphViews;
  id v7;
  UIMorphingLabelImageView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = self;
  hiddenGlyphViews = self->_hiddenGlyphViews;
  v7 = a3;
  if (!-[NSMutableArray count](hiddenGlyphViews, "count") || a4)
  {
    v8 = -[UIMorphingLabelImageView initWithImage:]([UIMorphingLabelImageView alloc], "initWithImage:", v7);

    if (!a4)
      v5 = (UIMorphingLabel *)v5->_colorView;
    -[UIView addSubview:](v5, "addSubview:", v8);
  }
  else
  {
    -[NSMutableArray lastObject](v5->_hiddenGlyphViews, "lastObject");
    v8 = (UIMorphingLabelImageView *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](v5->_hiddenGlyphViews, "removeLastObject");
    -[UIMorphingLabelImageView setImage:](v8, "setImage:", v7);
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "size");
    v12 = v11;
    v14 = v13;

    -[UIView setFrame:](v8, "setFrame:", v9, v10, v12, v14);
    -[UIView setAlpha:](v8, "setAlpha:", 1.0);
    -[UIView setHidden:](v8, "setHidden:", 0);
    -[UIView bringSubviewToFront:](v5->_colorView, "bringSubviewToFront:", v8);
  }
  return v8;
}

- (void)hideGlyph:(id)a3
{
  UIView *v4;
  UIView *colorView;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  colorView = self->_colorView;

  if (v4 == colorView)
  {
    objc_msgSend(v7, "setHidden:", 1);
    objc_msgSend(v7, "setImage:", 0);
    objc_msgSend(v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllAnimations");

    -[NSMutableArray addObject:](self->_hiddenGlyphViews, "addObject:", v7);
  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");
  }

}

- (id)uniqueString
{
  int v2;
  int v3;
  char __str[256];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int16)uniqueString_nextId++;
  v3 = snprintf(__str, 0x100uLL, "%u", v2);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __str, v3 & ~(v3 >> 31), 4);
}

- (void)animateGlyph:(id)a3 toPosition:(CGPoint)a4 delay:(double)a5
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  BOOL v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  y = a4.y;
  x = a4.x;
  v49 = a3;
  objc_msgSend(v49, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "position");
  v10 = v9;
  v12 = v11;

  if (v10 != x || v12 != y)
  {
    -[UIMorphingLabel visibleRect](self, "visibleRect");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v49, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49);
    v52.origin.x = v22;
    v52.origin.y = v23;
    v52.size.width = v24;
    v52.size.height = v25;
    v50.origin.x = v15;
    v50.origin.y = v17;
    v50.size.width = v19;
    v50.size.height = v21;
    v26 = CGRectIntersectsRect(v50, v52);
    objc_msgSend(v49, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPosition:", x, y);

    if (v26)
      goto LABEL_7;
    -[UIMorphingLabel visibleRect](self, "visibleRect");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v49, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49);
    v53.origin.x = v36;
    v53.origin.y = v37;
    v53.size.width = v38;
    v53.size.height = v39;
    v51.origin.x = v29;
    v51.origin.y = v31;
    v51.size.width = v33;
    v51.size.height = v35;
    if (CGRectIntersectsRect(v51, v53))
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"), *(_QWORD *)&a5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setMass:", 2.0);
      objc_msgSend(v40, "setStiffness:", 300.0);
      objc_msgSend(v40, "setDamping:", 400.0);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v10 - x, v12 - y);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFromValue:", v41);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setToValue:", v42);

      v43 = 1.4 / self->_slowdown;
      *(float *)&v43 = v43;
      objc_msgSend(v40, "setSpeed:", v43);
      objc_msgSend(v40, "setDuration:", 1.0);
      -[UIMorphingLabel currentMediaTime](self, "currentMediaTime");
      objc_msgSend(v40, "setBeginTime:", v44 + self->_slowdown * v48);
      -[_UIViewAnimationAttributes _frameInterval](self->_textAnimationAttributes, "_frameInterval");
      objc_msgSend(v40, "setFrameInterval:");
      objc_msgSend(v40, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      objc_msgSend(v40, "setAdditive:", 1);
      objc_msgSend(v49, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMorphingLabel uniqueString](self, "uniqueString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addAnimation:forKey:", v40, v46);

    }
  }

}

- (void)animateGlyph:(id)a3 toAlpha:(double)a4 duration:(double)a5 delay:(double)a6
{
  id v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  UIMorphingLabel *v44;
  id v45;
  CGRect v46;
  CGRect v47;

  v10 = a3;
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "opacity");
  v13 = v12;

  objc_msgSend(v10, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a4;
  *(float *)&v16 = v14;
  objc_msgSend(v15, "setOpacity:", v16);

  if (v13 == a4)
    goto LABEL_5;
  -[UIMorphingLabel visibleRect](self, "visibleRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v10, "bounds");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v10);
  v47.origin.x = v25;
  v47.origin.y = v26;
  v47.size.width = v27;
  v47.size.height = v28;
  v46.origin.x = v18;
  v46.origin.y = v20;
  v46.size.width = v22;
  v46.size.height = v24;
  if (!CGRectIntersectsRect(v46, v47))
  {
LABEL_5:
    if (a4 == 0.0)
      -[UIMorphingLabel hideGlyph:](self, "hideGlyph:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimingFunction:", v30);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 - a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFromValue:", v31);

    objc_msgSend(v29, "setToValue:", &unk_1E1A992E8);
    v32 = 1.0 / self->_slowdown;
    *(float *)&v32 = v32;
    objc_msgSend(v29, "setSpeed:", v32);
    objc_msgSend(v29, "setDuration:", a5);
    -[UIMorphingLabel currentMediaTime](self, "currentMediaTime");
    objc_msgSend(v29, "setBeginTime:", v33 + self->_slowdown * a6);
    -[_UIViewAnimationAttributes _frameInterval](self->_textAnimationAttributes, "_frameInterval");
    objc_msgSend(v29, "setFrameInterval:");
    objc_msgSend(v29, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    objc_msgSend(v29, "setAdditive:", 1);
    if (a4 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v34 = (void *)MEMORY[0x1E0CD28B0];
      v40 = MEMORY[0x1E0C809B0];
      v41 = 3221225472;
      v42 = __55__UIMorphingLabel_animateGlyph_toAlpha_duration_delay___block_invoke;
      v43 = &unk_1E16B1B50;
      v44 = self;
      v35 = v10;
      v45 = v35;
      objc_msgSend(v34, "setCompletionBlock:", &v40);

      objc_msgSend(v35, "layer", v40, v41, v42, v43, v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMorphingLabel uniqueString](self, "uniqueString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addAnimation:forKey:", v29, v37);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      objc_msgSend(v10, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMorphingLabel uniqueString](self, "uniqueString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addAnimation:forKey:", v29, v39);

    }
  }

}

uint64_t __55__UIMorphingLabel_animateGlyph_toAlpha_duration_delay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideGlyph:", *(_QWORD *)(a1 + 40));
}

- (void)animateGlyph:(id)a3 toScale:(double)a4 delay:(double)a5
{
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double glyphScaleAnimationSpeed;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v37 = a3;
  objc_msgSend(v37, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("transform.scale.xy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (v11 != a4)
  {
    objc_msgSend(v37, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKeyPath:", v13, CFSTR("transform.scale.xy"));

    -[UIMorphingLabel visibleRect](self, "visibleRect");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v37, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v37);
    v39.origin.x = v22;
    v39.origin.y = v23;
    v39.size.width = v24;
    v39.size.height = v25;
    v38.origin.x = v15;
    v38.origin.y = v17;
    v38.size.width = v19;
    v38.size.height = v21;
    if (CGRectIntersectsRect(v38, v39))
    {
      glyphScaleAnimationSpeed = self->_glyphScaleAnimationSpeed;
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = 1.0;
      v30 = dbl_186681A20[a4 < 1.0];
      if (a4 >= 1.0)
      {
        v31 = 45.0;
      }
      else
      {
        v29 = 2.0;
        v31 = 34.0;
      }
      objc_msgSend(v27, "setMass:", v29);
      objc_msgSend(v28, "setStiffness:", v30);
      objc_msgSend(v28, "setDamping:", v31);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 - a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFromValue:", v32);

      objc_msgSend(v28, "setToValue:", &unk_1E1A992E8);
      v33 = glyphScaleAnimationSpeed / self->_slowdown;
      *(float *)&v33 = v33;
      objc_msgSend(v28, "setSpeed:", v33);
      objc_msgSend(v28, "setDuration:", 1.0);
      -[UIMorphingLabel currentMediaTime](self, "currentMediaTime");
      objc_msgSend(v28, "setBeginTime:", v34 + self->_slowdown * a5);
      -[_UIViewAnimationAttributes _frameInterval](self->_textAnimationAttributes, "_frameInterval");
      objc_msgSend(v28, "setFrameInterval:");
      objc_msgSend(v28, "setFillMode:", *MEMORY[0x1E0CD2B50]);
      objc_msgSend(v28, "setAdditive:", 1);
      objc_msgSend(v37, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIMorphingLabel uniqueString](self, "uniqueString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addAnimation:forKey:", v28, v36);

    }
  }

}

- (void)animateShowGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5
{
  -[UIMorphingLabel animateShowGlyph:alpha:alphaDuration:delay:](self, "animateShowGlyph:alpha:alphaDuration:delay:", a3, 1.0, a4, a5);
}

- (void)animateShowGlyph:(id)a3 alpha:(double)a4 alphaDuration:(double)a5 delay:(double)a6
{
  double scaleFactor;
  id v11;
  void *v12;
  void *v13;
  double v14;
  CATransform3D v15;
  CATransform3D v16;

  scaleFactor = self->_scaleFactor;
  v11 = a3;
  CATransform3DMakeScale(&v16, scaleFactor, scaleFactor, 1.0);
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  objc_msgSend(v12, "setTransform:", &v15);

  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 0;
  objc_msgSend(v13, "setOpacity:", v14);

  -[UIMorphingLabel animateGlyph:toScale:delay:](self, "animateGlyph:toScale:delay:", v11, 1.0, a6);
  -[UIMorphingLabel animateGlyph:toAlpha:duration:delay:](self, "animateGlyph:toAlpha:duration:delay:", v11, a4, a5, a6);

}

- (void)animateHideGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5
{
  double scaleFactor;
  id v9;

  scaleFactor = self->_scaleFactor;
  v9 = a3;
  -[UIMorphingLabel animateGlyph:toScale:delay:](self, "animateGlyph:toScale:delay:", v9, scaleFactor, a5);
  -[UIMorphingLabel animateGlyph:toAlpha:duration:delay:](self, "animateGlyph:toAlpha:duration:delay:", v9, 0.0, a4, a5);

}

- (double)totalLeftOffsetForAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  UIMorphingLabelGlyphSet *srcGlyphSet;
  double v10;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v6 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  if (self->_alignmentIsEqual[a3])
  {
    v7 = (double)-[UIMorphingLabelGlyphSet glyphPositions](self->_srcGlyphSet, "glyphPositions")[16 * v5];
    v8 = (double)-[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions")[16 * v6];
  }
  else
  {
    srcGlyphSet = self->_srcGlyphSet;
    if (v5)
    {
      v7 = *(double *)(-[UIMorphingLabelGlyphSet glyphPositions](srcGlyphSet, "glyphPositions") + 16 * v5 - 16);
      v8 = *(double *)(-[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions") + 16 * v6 - 16);
    }
    else
    {
      -[UIMorphingLabelGlyphSet lineOrigin](srcGlyphSet, "lineOrigin");
      v7 = v10;
      -[UIMorphingLabelGlyphSet lineOrigin](self->_dstGlyphSet, "lineOrigin");
    }
  }
  return v8 - v7;
}

- (double)totalRightOffsetForAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  UIMorphingLabelGlyphSet *srcGlyphSet;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v7 = v6;
  v8 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v10 = v9;
  if (self->_alignmentIsEqual[a3])
  {
    v11 = *(double *)(-[UIMorphingLabelGlyphSet glyphPositions](self->_srcGlyphSet, "glyphPositions")
                    + 16 * (v7 + v5)
                    - 16);
    v12 = *(double *)(-[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions")
                    + 16 * (v10 + v8)
                    - 16);
  }
  else
  {
    v13 = v5 + v7;
    v14 = -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount");
    srcGlyphSet = self->_srcGlyphSet;
    if (v13 == v14)
    {
      -[UIMorphingLabelGlyphSet lineOrigin](srcGlyphSet, "lineOrigin");
      v17 = v16;
      -[UIMorphingLabelGlyphSet lineWidth](self->_srcGlyphSet, "lineWidth");
      v11 = v17 + v18;
      -[UIMorphingLabelGlyphSet lineOrigin](self->_dstGlyphSet, "lineOrigin");
      v20 = v19;
      -[UIMorphingLabelGlyphSet lineWidth](self->_dstGlyphSet, "lineWidth");
      v12 = v20 + v21;
    }
    else
    {
      v11 = (double)-[UIMorphingLabelGlyphSet glyphPositions](srcGlyphSet, "glyphPositions")[16 * v13];
      v12 = (double)-[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions")[16 * (v8 + v10)];
    }
  }
  return v12 - v11;
}

- (double)changeInWidthDueToAlignmentHunkAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[UIMorphingLabel totalRightOffsetForAlignmentHunkAtIndex:](self, "totalRightOffsetForAlignmentHunkAtIndex:");
  v6 = v5;
  -[UIMorphingLabel totalLeftOffsetForAlignmentHunkAtIndex:](self, "totalLeftOffsetForAlignmentHunkAtIndex:", a3);
  return v6 - v7;
}

- (void)animateGlyphsInRange:(_NSRange)a3 ofGlyphSet:(id)a4 byOffset:(double)a5 delay:(double)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  length = a3.length;
  location = a3.location;
  v11 = a4;
  if (a5 != 0.0 && location < location + length)
  {
    v20 = v11;
    do
    {
      objc_msgSend(v20, "glyphViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", location);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "position");
      v17 = v16;
      v19 = v18;

      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v14, v17 + a5, v19, a6);
      v11 = v20;
      ++location;
      --length;
    }
    while (length);
  }

}

- (void)animateChangeInWidthOutsideAlignmentHunkAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (!self->_alignmentIsEqual[a3])
  {
    -[UIMorphingLabel changeInWidthDueToAlignmentHunkAtIndex:](self, "changeInWidthDueToAlignmentHunkAtIndex:");
    if (v5 != 0.0)
    {
      v6 = v5;
      v7 = self->_alignmentDelays[a3];
      -[UIMorphingLabel flushAmount](self, "flushAmount");
      v9 = -(v6 * v8);
      -[UIMorphingLabel flushAmount](self, "flushAmount");
      v11 = v6 * (1.0 - v10);
      v12 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:", a3);
      v14 = v13;
      v15 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
      v17 = v16;
      v18 = v12 + v14;
      v19 = -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount") - v18;
      v20 = v15 + v17;
      v21 = -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount") - v20;
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", 0, v12, self->_srcGlyphSet, v9, v7);
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", v18, v19, self->_srcGlyphSet, v11, v7);
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", 0, v15, self->_dstGlyphSet, v9, v7);
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", v20, v21, self->_dstGlyphSet, v11, v7);
    }
  }
}

- (void)initInsertionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const CGPoint *v14;
  double y;
  CGFloat v16;
  void *v17;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v6 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v8 = v7;
  if (-[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount"))
  {
    if (v5 | v6)
      -[UIMorphingLabel totalLeftOffsetForAlignmentHunkAtIndex:](self, "totalLeftOffsetForAlignmentHunkAtIndex:", a3);
    else
      -[UIMorphingLabel totalRightOffsetForAlignmentHunkAtIndex:](self, "totalRightOffsetForAlignmentHunkAtIndex:", a3);
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }
  if (v6 < v6 + v8)
  {
    v11 = v6;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      y = v14[v11].y;
      v16 = v14[v11].x - v10;
      objc_msgSend(v13, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPosition:", v16, y);

      ++v6;
      ++v11;
      --v8;
    }
    while (v8);
  }
}

- (void)animateInsertionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const CGRect *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const CGPoint *v31;
  const CGRect *v32;
  CGRect v33;
  CGRect v34;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v6 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v8 = v7;
  v9 = -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount");
  if (v9)
    v10 = (v5 | v6) == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (v9 != 0) ^ -[UIMorphingLabel _isRTL](self, "_isRTL");
    goto LABEL_7;
  }
  if (v5 == -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount"))
  {
    v13 = -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount");
    v11 = -[UIMorphingLabel _isRTL](self, "_isRTL");
    if (v6 + v8 != v13)
      goto LABEL_12;
LABEL_7:
    v12 = 1;
    goto LABEL_13;
  }
  v11 = -[UIMorphingLabel _isRTL](self, "_isRTL");
LABEL_12:
  v12 = 0;
LABEL_13:
  -[UIMorphingLabel _rippleDurationForEndInsertion:](self, "_rippleDurationForEndInsertion:", v12);
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v6, v8);
  if (v6 < v6 + v8)
  {
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = v17;
    v22 = (32 * v6) | 0x18;
    v23 = (16 * v6) | 8;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      v27 = *(_QWORD *)((char *)v26 + v22 - 24);
      v28 = *(_QWORD *)((char *)v26 + v22 - 16);
      v29 = *(_QWORD *)((char *)v26 + v22 - 8);
      v30 = *(_QWORD *)((char *)&v26->origin.x + v22);
      if (v11)
        CGRectGetMaxX(*(CGRect *)&v27);
      else
        CGRectGetMinX(*(CGRect *)&v27);
      v33.origin.x = v18;
      v33.origin.y = v19;
      v33.size.width = v20;
      v33.size.height = v21;
      CGRectGetMinX(v33);
      v34.origin.x = v18;
      v34.origin.y = v19;
      v34.size.width = v20;
      v34.size.height = v21;
      CGRectGetMaxX(v34);
      v31 = -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v25, *(double *)((char *)v31 + v23 - 8), *(double *)((char *)&v31->x + v23), 0.0);
      v32 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", *(double *)((char *)v32 + v22 - 24), *(double *)((char *)v32 + v22 - 16), *(double *)((char *)v32 + v22 - 8), *(double *)((char *)&v32->origin.x + v22));
      -[UIMorphingLabel animateShowGlyph:alpha:alphaDuration:delay:](self, "animateShowGlyph:alpha:alphaDuration:delay:", v25);

      ++v6;
      v22 += 32;
      v23 += 16;
      --v8;
    }
    while (v8);
  }
}

- (void)animateDeletionAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  int v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double rippleFactor;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const CGPoint *v26;
  double v27;
  double v28;
  const CGRect *v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v35;
  double v36;
  double MinX;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v7 = v6;
  v8 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  if (!-[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"))
  {
    v10 = 1;
    v41 = 0.0;
    goto LABEL_5;
  }
  if (!(v5 | v8))
  {
    -[UIMorphingLabel totalRightOffsetForAlignmentHunkAtIndex:](self, "totalRightOffsetForAlignmentHunkAtIndex:", a3);
    v41 = v9;
    v10 = 0;
LABEL_5:
    v11 = v10 ^ -[UIMorphingLabel _isRTL](self, "_isRTL");
    v12 = v5 + v7;
    v13 = 0.1;
    *(double *)&v14 = 0.14;
    goto LABEL_10;
  }
  v12 = v5 + v7;
  if (v5 + v7 == -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount")
    && v8 == -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"))
  {
    -[UIMorphingLabel totalLeftOffsetForAlignmentHunkAtIndex:](self, "totalLeftOffsetForAlignmentHunkAtIndex:", a3);
    v41 = v15;
    v10 = 1;
    goto LABEL_5;
  }
  -[UIMorphingLabel totalLeftOffsetForAlignmentHunkAtIndex:](self, "totalLeftOffsetForAlignmentHunkAtIndex:", a3);
  v41 = v16;
  v11 = !-[UIMorphingLabel _isRTL](self, "_isRTL");
  v13 = 0.12;
  *(double *)&v14 = 0.1;
LABEL_10:
  v42 = *(double *)&v14;
  rippleFactor = self->_rippleFactor;
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_srcGlyphSet, "boundingRectForGlyphsInRange:", v5, v7);
  v45 = v19;
  v46 = v18;
  v43 = v21;
  v44 = v20;
  if (v5 < v12)
  {
    v40 = v13 * rippleFactor;
    v22 = v5;
    v23 = (16 * v5) | 8;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_srcGlyphSet, "glyphViews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = -[UIMorphingLabelGlyphSet glyphPositions](self->_srcGlyphSet, "glyphPositions");
      v27 = *(double *)((char *)v26 + v23 - 8);
      v28 = *(double *)((char *)&v26->x + v23);
      v29 = -[UIMorphingLabelGlyphSet glyphFrames](self->_srcGlyphSet, "glyphFrames");
      x = v29[v22].origin.x;
      y = v29[v22].origin.y;
      width = v29[v22].size.width;
      height = v29[v22].size.height;
      if (v11)
        MaxX = CGRectGetMaxX(*(CGRect *)&x);
      else
        MaxX = CGRectGetMinX(*(CGRect *)&x);
      v35 = MaxX;
      v36 = v41 + v27;
      v47.origin.x = v46;
      v47.origin.y = v45;
      v47.size.width = v44;
      v47.size.height = v43;
      MinX = CGRectGetMinX(v47);
      v48.origin.x = v46;
      v48.origin.y = v45;
      v48.size.width = v44;
      v48.size.height = v43;
      v38 = v40 * ((v35 - MinX) / (CGRectGetMaxX(v48) - MinX));
      if (v11)
        v38 = v40 - v38;
      if (v38 >= 0.0)
        v39 = v38;
      else
        v39 = 0.0;
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v25, v36, v28, 0.0);
      -[UIMorphingLabel animateHideGlyph:alphaDuration:delay:](self, "animateHideGlyph:alphaDuration:delay:", v25, v42, v39);

      ++v5;
      ++v22;
      v23 += 16;
    }
    while (v12 != v5);
  }
}

- (void)initSubstitutionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const CGPoint *v23;
  double y;
  CGFloat v25;
  void *v26;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v7 = v6;
  v8 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v10 = v9;
  if (-[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount") == v7
    && -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount") == v10
    || v5 | v8)
  {
    -[UIMorphingLabel totalLeftOffsetForAlignmentHunkAtIndex:](self, "totalLeftOffsetForAlignmentHunkAtIndex:", a3);
  }
  else
  {
    -[UIMorphingLabel totalRightOffsetForAlignmentHunkAtIndex:](self, "totalRightOffsetForAlignmentHunkAtIndex:", a3);
  }
  v12 = v11;
  -[UIMorphingLabel changeInWidthDueToAlignmentHunkAtIndex:](self, "changeInWidthDueToAlignmentHunkAtIndex:", a3);
  if (v13 > 0.0)
  {
    -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_srcGlyphSet, "boundingRectForGlyphsInRange:", v5, v7);
    v15 = v14;
    -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v8, v10);
    if (v15 < v16)
    {
      v17 = v16;
      v18 = -[UIMorphingLabel _isRTL](self, "_isRTL");
      v19 = v15 / v17 * 0.2;
      if (v18)
        v19 = 0.2 - v19;
      if (v19 < 0.0)
        v19 = 0.0;
      self->_alignmentDelays[a3] = v19;
    }
  }
  if (v8 < v8 + v10)
  {
    v20 = v8;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      y = v23[v20].y;
      v25 = v23[v20].x - v12;
      objc_msgSend(v22, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setPosition:", v25, y);

      ++v8;
      ++v20;
      --v10;
    }
    while (v10);
  }
}

- (void)animateSubstitutionAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  double v20;
  CGFloat x;
  double v22;
  CGFloat y;
  double v24;
  CGFloat width;
  double v26;
  CGFloat height;
  double v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double MaxX;
  double v51;
  double MinX;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  const CGRect *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  const CGPoint *v66;
  const CGRect *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  int v73;
  double *v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v7 = v6;
  v8 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v10 = v9;
  v11 = (double)-[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions")[16 * v8];
  -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "position");
  v16 = v15;

  -[UIMorphingLabel changeInWidthDueToAlignmentHunkAtIndex:](self, "changeInWidthDueToAlignmentHunkAtIndex:", a3);
  v18 = v17 < 0.0;
  if (!(v5 | v8))
    v18 = (v17 < 0.0) ^ (v7 < -[UIMorphingLabelGlyphSet glyphCount](self->_srcGlyphSet, "glyphCount"));
  v19 = v18 ^ -[UIMorphingLabel _isRTL](self, "_isRTL");
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v8, v10);
  x = v20;
  y = v22;
  width = v24;
  height = v26;
  v74 = (double *)(&self->super.super.super.isa + a3);
  if (v5 < v5 + v7)
  {
    v73 = v19;
    v28 = v11 - v16;
    v29 = 416;
    v30 = v7;
    v31 = v5;
    do
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v29), "glyphViews");
      v32 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "position");
      v37 = v36;
      v39 = v38;

      v29 = v32;
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v34, v28 + v37, v39, v74[270]);
      objc_msgSend(v34, "frame");
      v81.origin.x = v40;
      v81.origin.y = v41;
      v81.size.width = v42;
      v81.size.height = v43;
      v75.origin.x = x;
      v75.origin.y = y;
      v75.size.width = width;
      v75.size.height = height;
      v76 = CGRectUnion(v75, v81);
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;

      ++v31;
      --v30;
    }
    while (v30);
    v19 = v73;
    do
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v29), "glyphViews");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", v5);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "frame");
      if (v73)
        MaxX = CGRectGetMaxX(*(CGRect *)&v46);
      else
        MaxX = CGRectGetMinX(*(CGRect *)&v46);
      v51 = MaxX;
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      MinX = CGRectGetMinX(v77);
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v53 = (v51 - MinX) / (CGRectGetMaxX(v78) - MinX) * 0.2;
      if (v73)
        v53 = 0.2 - v53;
      v54 = 0.0;
      if (v53 >= 0.0)
        v54 = v53;
      -[UIMorphingLabel animateHideGlyph:alphaDuration:delay:](self, "animateHideGlyph:alphaDuration:delay:", v45, 0.1, v54);

      ++v5;
      --v7;
    }
    while (v7);
  }
  if (v8 < v8 + v10)
  {
    v55 = (32 * v8) | 0x18;
    v56 = (16 * v8) | 8;
    do
    {
      v57 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      v58 = *(_QWORD *)((char *)v57 + v55 - 24);
      v59 = *(_QWORD *)((char *)v57 + v55 - 16);
      v60 = *(_QWORD *)((char *)v57 + v55 - 8);
      v61 = *(_QWORD *)((char *)&v57->origin.x + v55);
      if (v19)
        v62 = CGRectGetMaxX(*(CGRect *)&v58);
      else
        v62 = CGRectGetMinX(*(CGRect *)&v58);
      v63 = v62;
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndexedSubscript:", v8);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v65, *(double *)((char *)v66 + v56 - 8), *(double *)((char *)&v66->x + v56), v74[270]);
      v67 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", *(double *)((char *)v67 + v55 - 24), *(double *)((char *)v67 + v55 - 16), *(double *)((char *)v67 + v55 - 8), *(double *)((char *)&v67->origin.x + v55));
      v69 = v68;
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      v70 = CGRectGetMinX(v79);
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      v71 = (v63 - v70) / (CGRectGetMaxX(v80) - v70) * 0.2;
      if (v19)
        v71 = 0.2 - v71;
      if (v71 >= 0.0)
        v72 = v71 + 0.02;
      else
        v72 = 0.02;
      -[UIMorphingLabel animateShowGlyph:alpha:alphaDuration:delay:](self, "animateShowGlyph:alpha:alphaDuration:delay:", v65, v69, 0.14, v72);

      ++v8;
      v55 += 32;
      v56 += 16;
      --v10;
    }
    while (v10);
  }
}

- (void)copyStateFromGlyph:(id)a3 toGlyph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[8];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", v9, v11);

  objc_msgSend(v5, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "opacity");
  LODWORD(v9) = v14;
  objc_msgSend(v6, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = LODWORD(v9);
  objc_msgSend(v15, "setOpacity:", v16);

  objc_msgSend(v5, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "transform");
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
  }
  objc_msgSend(v6, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v40;
  v35[5] = v41;
  v35[6] = v42;
  v35[7] = v43;
  v35[0] = v36;
  v35[1] = v37;
  v35[2] = v38;
  v35[3] = v39;
  objc_msgSend(v19, "setTransform:", v35);

  objc_msgSend(v6, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllAnimations");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "layer", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "animationKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v6, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "animationForKey:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addAnimation:forKey:", v30, v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v24);
  }

}

- (void)initMovementAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v7 = v6;
  v8 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  if (v5 < v5 + v7)
  {
    v9 = v8;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_srcGlyphSet, "glyphViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIMorphingLabel copyStateFromGlyph:toGlyph:](self, "copyStateFromGlyph:toGlyph:", v11, v13);
      -[UIMorphingLabel hideGlyph:](self, "hideGlyph:", v11);

      ++v5;
      ++v9;
      --v7;
    }
    while (v7);
  }
}

- (void)animateMovementAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const CGPoint *v12;
  double x;
  double y;
  void *v15;
  const CGRect *v16;

  v4 = -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  if (v4 < v4 + v5)
  {
    v6 = v4;
    v7 = v5;
    v8 = v4;
    v9 = v4;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      x = v12[v9].x;
      y = v12[v9].y;
      objc_msgSend(v11, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPosition:", x, y);

      v16 = -[UIMorphingLabelGlyphSet glyphFrames](self->_dstGlyphSet, "glyphFrames");
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", v16[v8].origin.x, v16[v8].origin.y, v16[v8].size.width, v16[v8].size.height);
      -[UIMorphingLabel animateGlyph:toAlpha:duration:delay:](self, "animateGlyph:toAlpha:duration:delay:", v11);

      ++v6;
      ++v8;
      ++v9;
      --v7;
    }
    while (v7);
  }
}

- (void)initAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;

  -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v6 = v5;
  -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  v8 = self->_alignmentIsEqual[a3];
  self->_alignmentDelays[a3] = 0.0;
  if (v6)
  {
    if (v7)
    {
      if (v8)
        -[UIMorphingLabel initMovementAlignmentHunkAtIndex:](self, "initMovementAlignmentHunkAtIndex:", a3);
      else
        -[UIMorphingLabel initSubstitutionAlignmentHunkAtIndex:](self, "initSubstitutionAlignmentHunkAtIndex:", a3);
    }
    else
    {
      -[UIMorphingLabel initDeletionAlignmentHunkAtIndex:](self, "initDeletionAlignmentHunkAtIndex:", a3);
    }
  }
  else
  {
    -[UIMorphingLabel initInsertionAlignmentHunkAtIndex:](self, "initInsertionAlignmentHunkAtIndex:", a3);
  }
}

- (void)animateAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  v6 = v5;
  -[UIMorphingLabel dstRangeOfAlignmentHunkAtIndex:](self, "dstRangeOfAlignmentHunkAtIndex:", a3);
  if (v6)
  {
    if (v7)
    {
      if (self->_alignmentIsEqual[a3])
        -[UIMorphingLabel animateMovementAlignmentHunkAtIndex:](self, "animateMovementAlignmentHunkAtIndex:", a3);
      else
        -[UIMorphingLabel animateSubstitutionAlignmentHunkAtIndex:](self, "animateSubstitutionAlignmentHunkAtIndex:", a3);
    }
    else
    {
      -[UIMorphingLabel animateDeletionAlignmentHunkAtIndex:](self, "animateDeletionAlignmentHunkAtIndex:", a3);
    }
  }
  else
  {
    -[UIMorphingLabel animateInsertionAlignmentHunkAtIndex:](self, "animateInsertionAlignmentHunkAtIndex:", a3);
  }
}

- (void)animateGlyphs
{
  double lastUpdateTime;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  unint64_t v9;
  unint64_t alignmentSize;
  unint64_t i;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;

  -[UIMorphingLabel currentMediaTime](self, "currentMediaTime");
  lastUpdateTime = self->_lastUpdateTime;
  self->_isDoingFastAnimation = 0;
  v5 = v4 - lastUpdateTime;
  v6 = v5 + v5;
  v7 = v5 < 0.5;
  v8 = 1.0;
  if (!v7)
    v6 = 1.0;
  self->_rippleFactor = v6;
  if (v6 >= 0.5)
    v8 = 1.0 - (v6 + -0.5 + v6 + -0.5) + (v6 + -0.5 + v6 + -0.5) * self->_initialScale;
  self->_scaleFactor = v8;
  self->_slowdown = self->_rippleFactor * UIAnimationDragCoefficient();
  -[UIMorphingLabel calculateGlyphAlignment](self, "calculateGlyphAlignment");
  if (self->_alignmentSize)
  {
    v9 = 0;
    do
    {
      -[UIMorphingLabel initAlignmentHunkAtIndex:](self, "initAlignmentHunkAtIndex:", v9++);
      alignmentSize = self->_alignmentSize;
    }
    while (v9 < alignmentSize);
    if (alignmentSize)
    {
      for (i = 0; i < v12; ++i)
      {
        -[UIMorphingLabel animateChangeInWidthOutsideAlignmentHunkAtIndex:](self, "animateChangeInWidthOutsideAlignmentHunkAtIndex:", i);
        v12 = self->_alignmentSize;
      }
      if (v12)
      {
        v13 = 0;
        do
          -[UIMorphingLabel animateAlignmentHunkAtIndex:](self, "animateAlignmentHunkAtIndex:", v13++);
        while (v13 < self->_alignmentSize);
      }
    }
  }
  if (-[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"))
  {
    v14 = 0;
    do
    {
      -[UIMorphingLabelGlyphSet glyphViews](self->_dstGlyphSet, "glyphViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIMorphingLabelGlyphSet glyphPositions](self->_dstGlyphSet, "glyphPositions");
      ++v14;
    }
    while (v14 < -[UIMorphingLabelGlyphSet glyphCount](self->_dstGlyphSet, "glyphCount"));
  }
}

- (BOOL)canFitText:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[UIMorphingLabel requiredWidthForText:](self, "requiredWidthForText:", a3);
  v5 = v4;
  -[UIView bounds](self, "bounds");
  return v5 <= v6;
}

- (double)flushAmount
{
  int64_t textAlignment;
  double result;

  textAlignment = self->_textAlignment;
  result = 0.0;
  if (textAlignment == 1)
    result = 0.5;
  if (textAlignment == 2)
    return 1.0;
  return result;
}

- (double)requiredWidthForText:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[UIMorphingLabel attributedStringForText:](self, "attributedStringForText:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

  return v5;
}

- (void)contentSizeDidChange:(id)a3
{
  id v4;

  +[UIMorphingLabel preferredFontWithSize:](UIMorphingLabel, "preferredFontWithSize:", a3, 17.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIMorphingLabel setFont:](self, "setFont:", v4);

}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSuppressLayoutSubviews:(BOOL)a3
{
  self->_suppressLayoutSubviews = a3;
}

- (BOOL)enableAnimation
{
  return self->_enableAnimation;
}

- (void)setEnableAnimation:(BOOL)a3
{
  self->_enableAnimation = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

- (double)glyphScaleAnimationSpeed
{
  return self->_glyphScaleAnimationSpeed;
}

- (void)setGlyphScaleAnimationSpeed:(double)a3
{
  self->_glyphScaleAnimationSpeed = a3;
}

- (double)rippleDuration
{
  return self->_rippleDuration;
}

- (void)setRippleDuration:(double)a3
{
  self->_rippleDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textAnimationAttributes, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_hiddenGlyphViews, 0);
  objc_storeStrong((id *)&self->_dstGlyphSet, 0);
  objc_storeStrong((id *)&self->_srcGlyphSet, 0);
}

@end
