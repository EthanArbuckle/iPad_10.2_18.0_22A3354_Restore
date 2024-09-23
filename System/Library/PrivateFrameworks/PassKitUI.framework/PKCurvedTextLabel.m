@implementation PKCurvedTextLabel

- (PKCurvedTextLabel)init
{
  return -[PKCurvedTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKCurvedTextLabel)initWithFrame:(CGRect)a3
{
  PKCurvedTextLabel *v3;
  NSTextContainer *v4;
  NSTextContainer *textContainer;
  NSLayoutManager *v6;
  NSLayoutManager *layoutManager;
  NSTextStorage *v8;
  NSTextStorage *textStorage;
  uint64_t v10;
  UIColor *textColor;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKCurvedTextLabel;
  v3 = -[PKCurvedTextLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x1E0DC12C0]);
    textContainer = v3->_textContainer;
    v3->_textContainer = v4;

    -[NSTextContainer setMaximumNumberOfLines:](v3->_textContainer, "setMaximumNumberOfLines:", 1);
    -[NSTextContainer setLineFragmentPadding:](v3->_textContainer, "setLineFragmentPadding:", 0.0);
    -[NSTextContainer setLineBreakMode:](v3->_textContainer, "setLineBreakMode:", 4);
    v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = v6;

    -[NSLayoutManager addTextContainer:](v3->_layoutManager, "addTextContainer:", v3->_textContainer);
    v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
    textStorage = v3->_textStorage;
    v3->_textStorage = v8;

    -[NSTextStorage addLayoutManager:](v3->_textStorage, "addLayoutManager:", v3->_layoutManager);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

  }
  return v3;
}

- (NSDictionary)textAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PKCurvedTextLabel attributedText](self, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  if (v3)
  {
    objc_msgSend(v2, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[PKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCircleRadius:(double)a3
{
  if (self->_circleRadius != a3)
  {
    self->_circleRadius = a3;
    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[PKCurvedTextLabel _updateMaxSize](self, "_updateMaxSize");
    -[PKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterAngle:(double)a3
{
  if (self->_centerAngle != a3)
  {
    self->_centerAngle = a3;
    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[PKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  long double v5;

  v5 = fmod(a3, 6.28318531);
  if (a3 <= 6.28318531)
    v5 = a3;
  if (self->_maxAngularWidth != v5)
  {
    self->_maxAngularWidth = v5;
    -[PKCurvedTextLabel _updateMaxSize](self, "_updateMaxSize");
  }
}

- (double)linearWidth
{
  return self->_textWidth;
}

- (void)_updateMaxSize
{
  double maxAngularWidth;
  double circleRadius;
  double v5;
  double v6;

  maxAngularWidth = self->_maxAngularWidth;
  if (maxAngularWidth == 0.0 || (circleRadius = self->_circleRadius, circleRadius == 0.0))
  {
    v5 = 1.79769313e308;
  }
  else
  {
    if (maxAngularWidth > 3.14159265)
      maxAngularWidth = 6.28318531 - maxAngularWidth;
    v5 = maxAngularWidth * circleRadius;
  }
  -[NSTextContainer size](self->_textContainer, "size");
  if (v6 != v5 || self->_textWidth != v5)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v5, 1.79769313e308);
    self->_textWidth = v5;
    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[PKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[PKCurvedTextLabel _updateTextColor](self, "_updateTextColor");
  }

}

- (void)_updateTextColor
{
  uint64_t v3;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  if (v3)
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], self->_textColor, 0, v3);
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)textColor
{
  return self->_textColor;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSTextStorage *textStorage;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToAttributedString:", self->_textStorage) & 1) == 0)
  {
    if (!v4)
      goto LABEL_11;
    v5 = objc_msgSend(v4, "length");
    v6 = 0;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v6, v5);
      v12 = v11;

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v7)
      {

        v7 = 0;
      }
      else
      {
        v7 = (void *)objc_msgSend(v4, "mutableCopy");
      }
      objc_msgSend(v7, "mutableString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v10, v12, CFSTR(" "));

      v6 = v10 + 1;
      v5 = objc_msgSend(v4, "length") - v6;
    }
    if (v7)
    {
      v14 = v7;
      v15 = v14;
    }
    else
    {
LABEL_11:
      v16 = (void *)objc_msgSend(v4, "mutableCopy");
      v17 = v16;
      if (v16)
        v18 = v16;
      else
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E3E7D690);
      v15 = v18;

      v14 = 0;
    }
    v19 = *MEMORY[0x1E0DC1178];
    if (qword_1EE4C8478 != -1)
      dispatch_once(&qword_1EE4C8478, &__block_literal_global_54);
    v20 = (id)_MergedGlobals_1_10;
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v15, "length"));

    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v15);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    textStorage = self->_textStorage;
    v22 = -[NSTextStorage length](textStorage, "length");
    v23 = *MEMORY[0x1E0DC1138];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__PKCurvedTextLabel_setAttributedText___block_invoke;
    v24[3] = &unk_1E3E67988;
    v24[4] = &v25;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v24);
    self->_hasMonospacedNumbers = *((_BYTE *)v26 + 24);
    -[PKCurvedTextLabel _updateTextColor](self, "_updateTextColor");
    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[PKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[PKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    _Block_object_dispose(&v25, 8);

  }
}

void __39__PKCurvedTextLabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC1380]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = *MEMORY[0x1E0DC13D8];
    v12 = *MEMORY[0x1E0DC13D0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToNumber:", &unk_1E3FACEC8) & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E3FACEE0);

          if (v17)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
            *a5 = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
LABEL_12:

}

- (id)attributedText
{
  return self->_textStorage;
}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UIFont *font;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = [v4 alloc];
    font = self->_font;
    v10 = *MEMORY[0x1E0DC1138];
    v11[0] = font;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  }
  else
  {
    v9 = 0;
  }
  -[PKCurvedTextLabel setAttributedText:](self, "setAttributedText:", v9);

}

- (id)text
{
  return (id)-[NSTextStorage string](self->_textStorage, "string");
}

- (void)setFont:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[PKCurvedTextLabel text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurvedTextLabel setText:](self, "setText:", v5);

    -[PKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
  }

}

- (id)font
{
  return self->_font;
}

- (void)invalidateCachedSize
{
  CGPoint v2;
  CGSize v3;

  self->_cachedSizeIsValid = 0;
  self->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_cachedBounds.size = v3;
  self->_cachedGlyphsBoundingRect.origin = v2;
  self->_cachedGlyphsBoundingRect.size = v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGSize *p_cachedSize;
  double width;
  double height;
  double v7;
  double v8;
  CGSize result;

  p_cachedSize = &self->_cachedSize;
  if (self->_cachedSizeIsValid)
  {
    width = p_cachedSize->width;
    height = self->_cachedSize.height;
  }
  else
  {
    -[PKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect", a3.width, a3.height);
    width = v7;
    height = v8;
    p_cachedSize->width = v7;
    p_cachedSize->height = v8;
    self->_cachedSizeIsValid = 1;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  __CTLine *v8;
  CGFloat x;
  CGFloat y;
  CGContext *CurrentContext;
  _QWORD v12[7];
  CGAffineTransform transform;
  _QWORD v14[4];
  CGFloat v15;
  CGFloat v16;
  CGRect ImageBounds;

  -[PKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  -[PKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  v5 = v4;
  v7 = v6;
  v8 = -[PKCurvedTextLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
  ImageBounds = CTLineGetImageBounds(v8, 0);
  x = ImageBounds.origin.x;
  y = ImageBounds.origin.y;
  CFRelease(v8);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_19E0C78CE;
  v15 = x;
  v16 = y;
  if (self->_hasMonospacedNumbers)
    v15 = 0.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransformMakeTranslation(&transform, v5, v7);
  CGContextConcatCTM(CurrentContext, &transform);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__PKCurvedTextLabel_drawTextInRect___block_invoke;
  v12[3] = &unk_1E3E679B0;
  v12[4] = self;
  v12[5] = v14;
  v12[6] = CurrentContext;
  -[PKCurvedTextLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v12);
  _Block_object_dispose(v14, 8);
}

void __36__PKCurvedTextLabel_drawTextInRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
{
  CGContext *v12;
  __int128 v13;
  CGAffineTransform v14;

  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  v12 = *(CGContext **)(a1 + 48);
  v13 = a4[1];
  *(_OWORD *)&v14.a = *a4;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = a4[2];
  CGContextConcatCTM(v12, &v14);
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "drawGlyphsForGlyphRange:atPoint:", a2, a3, -a5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), -a6);
  CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
}

- (CGRect)textBoundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v20;
  CGRect result;

  -[PKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKCurvedTextLabel bounds](self, "bounds");
  -[PKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
  v16 = v4 + v15;
  v18 = v6 + v17;
  v19 = v8;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (_NSRange)_drawableCharacterRange:(_NSRange *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = -[NSLayoutManager glyphRangeForTextContainer:](self->_layoutManager, "glyphRangeForTextContainer:", self->_textContainer);
  v7 = v6;
  v8 = -[NSLayoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:](self->_layoutManager, "truncatedGlyphRangeInLineFragmentForGlyphAtIndex:", v5);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v8 + 1;
    if (a3)
    {
      a3->location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v8, v9, 0);
      a3->length = v10;
    }
  }
  v11 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v5, v7, 0);
  result.length = v12;
  result.location = v11;
  return result;
}

- (__CTLine)_newLineFromDrawableTextStorage
{
  uint64_t v3;
  uint64_t v4;
  NSTextStorage *textStorage;
  uint64_t v6;
  uint64_t v7;
  NSTextStorage *v8;
  NSTextStorage *v9;
  uint64_t v10;
  __CTLine *v11;
  __int128 v13;

  v13 = xmmword_19DF157F0;
  v4 = -[PKCurvedTextLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", &v13);
  textStorage = self->_textStorage;
  if ((_QWORD)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
    v7 = -[NSTextStorage length](textStorage, "length");
    v8 = self->_textStorage;
    if (v4 || v6 != v7)
    {
      v9 = (NSTextStorage *)-[NSTextStorage mutableCopy](v8, "mutableCopy");
      -[NSTextStorage deleteCharactersInRange:](v9, "deleteCharactersInRange:", v6, -[NSTextStorage length](self->_textStorage, "length") - v6);
    }
    else
    {
      v9 = v8;
    }
  }
  else
  {
    v9 = (NSTextStorage *)-[NSTextStorage mutableCopy](textStorage, "mutableCopy");
    v10 = -[NSTextStorage length](self->_textStorage, "length");
    *((_QWORD *)&v13 + 1) = v10 - v13;
    -[NSTextStorage replaceCharactersInRange:withString:](v9, "replaceCharactersInRange:withString:");
  }
  v11 = CTLineCreateWithAttributedString((CFAttributedStringRef)v9);

  return v11;
}

- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4
{
  CGFloat v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat rect;
  CGFloat width;
  CGPoint result;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  rect = a4.size.height;
  width = a3.size.width;
  v4 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v11 = CGRectGetWidth(a4);
  v19.origin.x = v10;
  v19.origin.y = v9;
  v19.size.width = v8;
  v19.size.height = height;
  v12 = v11 - CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = v4;
  v20.size.height = rect;
  v13 = CGRectGetHeight(v20);
  v21.origin.x = v10;
  v21.origin.y = v9;
  v21.size.width = width;
  v21.size.height = height;
  v14 = v13 - CGRectGetMaxY(v21);
  v15 = v12;
  result.y = v14;
  result.x = v15;
  return result;
}

- (CGRect)_glyphsBoundingRect
{
  CGRect *p_cachedBounds;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double *p_x;
  CGSize size;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[5];
  uint64_t v24;
  CGRect *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  p_cachedBounds = &self->_cachedBounds;
  -[PKCurvedTextLabel bounds](self, "bounds");
  v32.origin.x = v4;
  v32.origin.y = v5;
  v32.size.width = v6;
  v32.size.height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v32) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    x = self->_cachedGlyphsBoundingRect.origin.x;
    y = self->_cachedGlyphsBoundingRect.origin.y;
    width = self->_cachedGlyphsBoundingRect.size.width;
    height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    v24 = 0;
    v25 = (CGRect *)&v24;
    v26 = 0x4010000000;
    v27 = &unk_19E0C78CE;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v28 = *MEMORY[0x1E0C9D628];
    v29 = v8;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __40__PKCurvedTextLabel__glyphsBoundingRect__block_invoke;
    v23[3] = &unk_1E3E679D8;
    v23[4] = &v24;
    -[PKCurvedTextLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v23);
    v30 = CGRectInset(v25[1], 0.0, -1.0);
    v25[1] = v30;
    -[PKCurvedTextLabel bounds](self, "bounds");
    p_cachedBounds->origin.x = v9;
    p_cachedBounds->origin.y = v10;
    p_cachedBounds->size.width = v11;
    p_cachedBounds->size.height = v12;
    p_x = &v25->origin.x;
    size = v25[1].size;
    self->_cachedGlyphsBoundingRect.origin = v25[1].origin;
    self->_cachedGlyphsBoundingRect.size = size;
    x = p_x[4];
    y = p_x[5];
    width = p_x[6];
    height = p_x[7];
    _Block_object_dispose(&v24, 8);
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

void __40__PKCurvedTextLabel__glyphsBoundingRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  double v10;
  __int128 v13;
  CGAffineTransform v15;
  CGRect v16;

  v10 = a5;
  v13 = a10[1];
  *(_OWORD *)&v15.a = *a10;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = a10[2];
  *(double *)&v13 = a7;
  v16 = CGRectApplyAffineTransform(*(CGRect *)(&v10 - 1), &v15);
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(v16, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32));
}

- (double)_distance
{
  double result;

  result = self->_circleRadius;
  if (!self->_interior)
    return -result;
  return result;
}

- (void)_enumerateTransformsForDrawableCharacters:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  __CTLine *v15;
  CGFloat x;
  CGFloat y;
  CGFloat MinX;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  void (*v43)(_QWORD *, uint64_t, _QWORD, CGAffineTransform *, double, double, double, double, double, double);
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  CGFloat a;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  CGFloat *p_b;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  double MaxX;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  void (*v70)(_QWORD *, uint64_t, _QWORD, CGAffineTransform *, double, double, double, double, double, double);
  uint64_t v71;
  CGFloat v72;
  CGFloat rect;
  double MidX;
  CGFloat v75;
  CGFloat v76;
  CGFloat height;
  CGFloat width;
  double TypographicBounds;
  uint64_t v80;
  CGFloat v81;
  uint64_t v82;
  CGFloat v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _QWORD v89[5];
  _QWORD *v90;
  uint64_t v91;
  CGFloat v92;
  __int128 v93;
  uint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  BOOL v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  _OWORD v106[2];
  CGRect ImageBounds;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v4 = a3;
  -[PKCurvedTextLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKCurvedTextLabel _distance](self, "_distance");
  v14 = v13;
  v15 = -[PKCurvedTextLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
  ImageBounds = CTLineGetImageBounds(v15, 0);
  x = ImageBounds.origin.x;
  y = ImageBounds.origin.y;
  height = ImageBounds.size.height;
  width = ImageBounds.size.width;
  MinX = 0.0;
  TypographicBounds = 0.0;
  if (self->_hasMonospacedNumbers)
    TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
  CFRelease(v15);
  v75 = y;
  if (self->_hasMonospacedNumbers)
  {
    v19 = TypographicBounds;
  }
  else
  {
    v108.origin.x = x;
    v108.origin.y = y;
    v108.size.height = height;
    v108.size.width = width;
    v20 = CGRectGetWidth(v108);
    v21 = y;
    v19 = v20;
    if (!self->_hasMonospacedNumbers)
    {
      v22 = x;
      v24 = height;
      v23 = width;
      MinX = CGRectGetMinX(*(CGRect *)(&v21 - 1));
    }
  }
  v76 = x;
  v106[0] = xmmword_19DF157F0;
  v25 = -[PKCurvedTextLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", v106);
  v27 = v26;
  if (self->_hasMonospacedNumbers)
  {
    -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v109.origin.y = v75;
    v109.origin.x = x;
    v109.size.height = height;
    v109.size.width = width;
    rect = CGRectGetMinX(v109);
    objc_msgSend(v28, "xHeight");
    *(double *)&v86 = v14;
    v30 = v29;
    -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", 0);
    v80 = v12;
    v82 = v10;
    v32 = v31;
    v110.origin.y = 0.0;
    v110.origin.x = v33 + 0.0;
    v34 = v110.origin.x;
    v110.size.width = rect;
    v110.size.height = v30;
    v111.origin.y = v32 - CGRectGetMaxY(v110);
    v72 = v111.origin.y;
    v111.origin.x = v34;
    v111.size.width = rect;
    v111.size.height = v30;
    memset(&v105, 0, sizeof(v105));
    MidX = CGRectGetMidX(v111);
    v35 = v32;
    v12 = v80;
    _TransformForLayoutLocation(&v105, v36, v37, v38, v39, v40, v41, v42, MidX, v35, v19, *(double *)&v86, self->_centerAngle, v6, v8, v82, v80);
    v112.origin.x = v34;
    v10 = v82;
    v112.origin.y = v72;
    v112.size.height = v30;
    v112.size.width = rect;
    v14 = *(double *)&v86;
    v113 = CGRectOffset(v112, -MidX, -v35);
    v43 = (void (*)(_QWORD *, uint64_t, _QWORD, CGAffineTransform *, double, double, double, double, double, double))v4[2];
    v104 = v105;
    v43(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v104, MidX, v35, v113.origin.x, v113.origin.y, v113.size.width, v113.size.height);

  }
  v87 = v25 + v27;
  if (v25 < v25 + v27)
  {
    v84 = v4;
    do
    {
      *(_OWORD *)&v105.a = xmmword_19DF157F0;
      v45 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v25, 1, &v105);
      v46 = *(_QWORD *)&v106[0];
      a = v105.a;
      if (*(_QWORD *)&v106[0] == *(_QWORD *)&v105.a)
        v48 = 1;
      else
        v48 = v44;
      v49 = (void *)objc_opt_new();
      v50 = v48;
      v51 = v45;
      if (v45 < v48 + v45)
      {
        do
        {
          if ((-[NSLayoutManager propertyForGlyphAtIndex:](self->_layoutManager, "propertyForGlyphAtIndex:", v51) & 1) == 0)
            objc_msgSend(v49, "addIndex:", v51);
          ++v51;
          --v50;
        }
        while (v50);
      }
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __63__PKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke;
      v89[3] = &unk_1E3E67A00;
      v89[4] = self;
      v91 = 0;
      v92 = MinX;
      v4 = v84;
      v93 = *(_OWORD *)&v105.a;
      v94 = v48;
      v103 = v46 == *(_QWORD *)&a;
      v95 = v19;
      v96 = v14;
      v97 = v6;
      v98 = v8;
      v99 = v10;
      v100 = v12;
      if (v46 == *(_QWORD *)&a)
        p_b = (CGFloat *)v106 + 1;
      else
        p_b = &v105.b;
      v90 = v84;
      v101 = v45;
      v102 = v48;
      objc_msgSend(v49, "enumerateRangesUsingBlock:", v89);
      v53 = *(_QWORD *)p_b;
      if (*(_QWORD *)p_b <= 1uLL)
        v53 = 1;
      v25 += v53;

    }
    while (v25 < v87);
  }
  if (self->_hasMonospacedNumbers)
  {
    v54 = v87 - 1;
    -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], v87 - 1, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v114.origin.x = v76;
    v114.origin.y = v75;
    v88 = v6;
    v114.size.width = width;
    v85 = v8;
    v114.size.height = height;
    v83 = TypographicBounds - CGRectGetMaxX(v114);
    v115.origin.x = v76;
    v115.origin.y = v75;
    v115.size.width = width;
    v115.size.height = height;
    MaxX = CGRectGetMaxX(v115);
    objc_msgSend(v55, "xHeight");
    v58 = v57;
    -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", -[NSLayoutManager glyphIndexForCharacterAtIndex:](self->_layoutManager, "glyphIndexForCharacterAtIndex:", v54));
    v60 = v59;
    v116.origin.y = 0.0;
    v116.origin.x = MaxX + 0.0;
    v116.size.width = v83;
    v116.size.height = v58;
    v117.origin.y = v60 - CGRectGetMaxY(v116);
    v81 = v117.origin.y;
    v117.origin.x = MaxX + 0.0;
    v117.size.width = v83;
    v117.size.height = v58;
    v61 = CGRectGetMidX(v117);
    memset(&v105, 0, sizeof(v105));
    v71 = v10;
    v62 = v61;
    _TransformForLayoutLocation(&v105, v63, v64, v65, v66, v67, v68, v69, v61, v60, v19, v14, self->_centerAngle, v88, v85, v71, v12);
    v118.origin.x = MaxX + 0.0;
    v118.origin.y = v81;
    v118.size.width = v83;
    v118.size.height = v58;
    v119 = CGRectOffset(v118, -v62, -v60);
    v70 = (void (*)(_QWORD *, uint64_t, _QWORD, CGAffineTransform *, double, double, double, double, double, double))v4[2];
    v104 = v105;
    v70(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v104, v62, v60, v119.origin.x, v119.origin.y, v119.size.width, v119.size.height);

  }
}

void __63__PKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CFIndex v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const __CTFont *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const CGGlyph *v20;
  double x;
  CGFloat y;
  CGFloat width;
  double v24;
  CGFloat height;
  CGFloat v26;
  CGFloat v27;
  double MidX;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void (*v36)(double, double, double, double, double, double);
  CGAffineTransform v37;
  CGAffineTransform v38;
  uint64_t v39;
  CGRect BoundingRectsForGlyphs;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "locationForGlyphAtIndex:", a2);
  v7 = v6;
  v9 = v8;
  v10 = a2 + 1;
  if (a2 + 1 < (unint64_t)(a2 + a3))
  {
    v11 = a3 - 1;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "locationForGlyphAtIndex:", v10);
      if (v12 < v7)
      {
        v9 = v13;
        v7 = v12;
      }
      ++v10;
      --v11;
    }
    while (v11);
  }
  v14 = *(double *)(a1 + 48);
  v15 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], *(_QWORD *)(a1 + 64), 0);
  v16 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v18 = MEMORY[0x1E0C80A78](v16, v17).n128_u64[0];
  v20 = (const CGGlyph *)((char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v20, 0, 0, 0, v18);
  BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v16, kCTFontOrientationDefault, v20, 0, a3);
  x = BoundingRectsForGlyphs.origin.x;
  y = BoundingRectsForGlyphs.origin.y;
  width = BoundingRectsForGlyphs.size.width;
  if (*(_BYTE *)(a1 + 152))
  {
    -[__CTFont xHeight](v16, "xHeight");
    height = v24;
  }
  else
  {
    height = BoundingRectsForGlyphs.size.height;
  }
  v26 = v7 + v14 - v15 + x;
  v41.origin.x = v26;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v27 = v9 - CGRectGetMaxY(v41);
  v42.origin.x = v26;
  v42.origin.y = v27;
  v42.size.width = width;
  v42.size.height = height;
  MidX = CGRectGetMidX(v42);
  memset(&v38, 0, sizeof(v38));
  _TransformForLayoutLocation(&v38, v29, v30, v31, v32, v33, v34, v35, MidX, v9, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(*(_QWORD *)(a1 + 32) + 960), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
  v43.origin.x = v26;
  v43.origin.y = v27;
  v43.size.width = width;
  v43.size.height = height;
  v44 = CGRectOffset(v43, -MidX, -v9);
  v36 = *(void (**)(double, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16);
  v37 = v38;
  v36(MidX, v9, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);

}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end
