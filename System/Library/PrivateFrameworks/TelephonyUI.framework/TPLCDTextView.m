@implementation TPLCDTextView

+ (double)defaultMinimumFontSize
{
  return 18.0;
}

- (TPLCDTextView)initWithFrame:(CGRect)a3
{
  TPLCDTextView *v3;
  TPLCDTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPLCDTextView;
  v3 = -[TPLCDTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TPLCDTextView setOpaque:](v3, "setOpaque:", 0);
    -[TPLCDTextView setEnabled:](v4, "setEnabled:", 0);
    *((_BYTE *)v4 + 512) |= 2u;
    v4->_minFontSize = 18.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TPLCDTextView stopAnimating](self, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)TPLCDTextView;
  -[TPLCDTextView dealloc](&v3, sel_dealloc);
}

- (CGRect)textRect
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double minFontSize;
  UIFont *v11;
  NSString *text;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  NSString *v21;
  UIFont *font;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  uint64_t v32;
  uint64_t v33;
  double v34;
  UIFont *v35;
  double v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v43;
  void *v44;
  BOOL v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  UIFont *v56;
  double v57;
  UIFont *v58;
  double v59;
  double v60;
  double v61;
  UIFont *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double x;
  double y;
  double width;
  double height;
  uint64_t v71;
  void *v72;
  _QWORD v73[3];
  _QWORD v74[3];
  void *v75;
  _QWORD v76[3];
  _QWORD v77[3];
  void *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  void *v84;
  _QWORD v85[2];
  _QWORD v86[4];
  CGRect result;

  v86[2] = *MEMORY[0x1E0C80C00];
  v3 = 512;
  if ((*((_BYTE *)self + 512) & 1) == 0)
  {
    -[TPLCDTextView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    if (self->_scrollingView)
    {
      minFontSize = self->_minFontSize;
      objc_msgSend(MEMORY[0x1E0DC1350], "_thinSystemFontOfSize:", minFontSize);
      v11 = (UIFont *)objc_claimAutoreleasedReturnValue();
      if (-[NSString length](self->_text, "length"))
      {
        text = self->_text;
        v13 = *MEMORY[0x1E0DC1258];
        v85[0] = *MEMORY[0x1E0DC1138];
        v85[1] = v13;
        v86[0] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString boundingRectWithSize:options:attributes:context:](text, "boundingRectWithSize:options:attributes:context:", 0, v16, 0, v7, v9);
        v18 = v17;
        v20 = v19;

      }
      else
      {
        v18 = *MEMORY[0x1E0C9D820];
        v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
    }
    else
    {
      if (-[NSString length](self->_text, "length"))
      {
        v21 = self->_text;
        font = self->_font;
        v23 = *MEMORY[0x1E0DC1258];
        v82[0] = *MEMORY[0x1E0DC1138];
        v82[1] = v23;
        v83[0] = font;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v83[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString boundingRectWithSize:options:attributes:context:](v21, "boundingRectWithSize:options:attributes:context:", 0, v26, 0, v7, v9);
        v28 = v27;

      }
      else
      {
        v28 = *MEMORY[0x1E0C9D820];
      }
      -[UIFont pointSize](self->_font, "pointSize");
      minFontSize = v29;
      v11 = self->_font;
      v30 = v28 > v7;
      if (minFontSize > self->_minFontSize && v28 > v7)
      {
        v71 = 512;
        v32 = *MEMORY[0x1E0DC1138];
        v33 = *MEMORY[0x1E0DC1258];
        v34 = *MEMORY[0x1E0C9D820];
        do
        {
          v35 = v11;
          minFontSize = minFontSize + -1.0;
          objc_msgSend(MEMORY[0x1E0DC1350], "_thinSystemFontOfSize:", minFontSize, v71);
          v11 = (UIFont *)objc_claimAutoreleasedReturnValue();

          v36 = v34;
          if (-[NSString length](self->_text, "length"))
          {
            v37 = self->_text;
            v79[1] = v33;
            v80[0] = v11;
            v79[0] = v32;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v38;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v80[1] = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString boundingRectWithSize:options:attributes:context:](v37, "boundingRectWithSize:options:attributes:context:", 0, v40, 0, v7, v9);
            v36 = v41;

          }
          v30 = v36 > v7;
        }
        while (minFontSize > self->_minFontSize && v36 > v7);
        v3 = v71;
      }
      objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v43, "mutableCopy");

      v45 = minFontSize < self->_minFontSize || !v30;
      if (!v45 && (*((_BYTE *)self + 512) & 0x10) != 0)
      {
        objc_msgSend(v44, "setLineBreakMode:", 3);
        v52 = *MEMORY[0x1E0DC1178];
        v76[0] = *MEMORY[0x1E0DC1138];
        v76[1] = v52;
        v77[0] = v11;
        v77[1] = v44;
        v76[2] = *MEMORY[0x1E0DC1258];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v77[2] = v48;
        v49 = (void *)MEMORY[0x1E0C99D80];
        v50 = v77;
        v51 = v76;
      }
      else
      {
        objc_msgSend(v44, "setLineBreakMode:", 4);
        v46 = *MEMORY[0x1E0DC1178];
        v73[0] = *MEMORY[0x1E0DC1138];
        v73[1] = v46;
        v74[0] = v11;
        v74[1] = v44;
        v73[2] = *MEMORY[0x1E0DC1258];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v74[2] = v48;
        v49 = (void *)MEMORY[0x1E0C99D80];
        v50 = v74;
        v51 = v73;
      }
      objc_msgSend(v49, "dictionaryWithObjects:forKeys:count:", v50, v51, 3);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSString length](self->_text, "length"))
      {
        -[NSString boundingRectWithSize:options:attributes:context:](self->_text, "boundingRectWithSize:options:attributes:context:", 0, v53, 0, v7, v9);
        v18 = v54;
        v20 = v55;
      }
      else
      {
        v18 = *MEMORY[0x1E0C9D820];
        v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }

    }
    v56 = self->_font;
    v57 = 0.0;
    v58 = v11;
    v59 = 0.0;
    if (v11 != v56)
    {
      -[UIFont xHeight](v56, "xHeight");
      v59 = v60;
      v58 = self->_font;
    }
    if (v11 != v58)
    {
      -[UIFont xHeight](v11, "xHeight");
      v57 = v61;
    }
    self->_fontSize = minFontSize;
    if ((*((_BYTE *)self + 512) & 2) != 0)
      v5 = v5 + fmax(round((v7 - v18) * 0.5), 0.0);
    v62 = self->_font;
    if (v62 == v11)
    {
      v66 = 0.0;
    }
    else
    {
      -[UIFont ascender](v62, "ascender");
      v64 = (v59 - v57) * 0.5 + v63 - v59;
      -[UIFont ascender](v11, "ascender");
      v66 = round(v64 - (v65 - v57));
    }
    self->_textRect.origin.x = v5;
    self->_textRect.origin.y = v66;
    self->_textRect.size.width = ceil(v18);
    self->_textRect.size.height = v20;
    *((_BYTE *)&self->super.super.super.isa + v3) |= 1u;

  }
  x = self->_textRect.origin.x;
  y = self->_textRect.origin.y;
  width = self->_textRect.size.width;
  height = self->_textRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TPLCDTextView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)TPLCDTextView;
  -[TPLCDTextView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    *((_BYTE *)self + 512) &= ~1u;
    if ((*((_BYTE *)self + 512) & 4) != 0)
      -[TPLCDTextView _setupForAnimationIfNecessary](self, "_setupForAnimationIfNecessary");
    if (!self->_scrollingView)
      -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterText:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 512);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)self + 512) = v3 & 0xFD | v4;
    *((_BYTE *)self + 512) &= ~1u;
    -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLeftTruncatesText:(BOOL)a3
{
  char v3;
  char v5;
  double width;
  double v7;

  v3 = *((_BYTE *)self + 512);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 16;
    else
      v5 = 0;
    *((_BYTE *)self + 512) = v3 & 0xEF | v5;
    width = self->_textRect.size.width;
    -[TPLCDTextView bounds](self, "bounds");
    if (width > v7)
    {
      *((_BYTE *)self + 512) &= ~1u;
      -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
}

- (void)setLCDTextFont:(id)a3
{
  UIFont *v5;
  void *scrollingView;
  UIFont *v7;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    *((_BYTE *)self + 512) &= ~1u;
    if (self->_scrollingView)
      scrollingView = self->_scrollingView;
    else
      scrollingView = self;
    objc_msgSend(scrollingView, "setNeedsDisplay");
    v5 = v7;
    if ((*((_BYTE *)self + 512) & 4) != 0)
    {
      -[TPLCDTextView _setupForAnimationIfNecessary](self, "_setupForAnimationIfNecessary");
      v5 = v7;
    }
  }

}

- (void)setMinimumFontSize:(double)a3
{
  if (self->_minFontSize != a3)
  {
    self->_minFontSize = a3;
    *((_BYTE *)self + 512) &= ~1u;
  }
}

- (void)setText:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  v6 = v5;
  if (self->_text != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:");
    v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_text, a3);
      *((_BYTE *)self + 512) &= ~1u;
      -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
      v6 = v8;
      if ((*((_BYTE *)self + 512) & 4) != 0)
      {
        -[TPLCDTextView _setupForAnimationIfNecessary](self, "_setupForAnimationIfNecessary");
        v6 = v8;
      }
    }
  }

}

- (id)text
{
  return self->_text;
}

- (CGSize)sizeToFit
{
  NSString *text;
  UIFont *font;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[2];
  CGSize result;

  v12[1] = *MEMORY[0x1E0C80C00];
  text = self->_text;
  font = self->_font;
  v11 = *MEMORY[0x1E0DC1138];
  v12[0] = font;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString sizeWithAttributes:](text, "sizeWithAttributes:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_drawTextInRect:(CGRect)a3 verticallyOffset:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIColor *textColor;
  UIColor *v19;
  UIColor *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v4 = a4;
  width = a3.size.width;
  x = a3.origin.x;
  v30[4] = *MEMORY[0x1E0C80C00];
  -[TPLCDTextView textRect](self, "textRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC1350], "_thinSystemFontOfSize:", self->_fontSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if ((*((_BYTE *)self + 512) & 0x10) != 0)
    v17 = 3;
  else
    v17 = 4;
  objc_msgSend(v16, "setLineBreakMode:", v17);
  objc_msgSend(v16, "setBaseWritingDirection:", 0);
  textColor = self->_textColor;
  if (textColor)
  {
    v19 = textColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  if (!v4)
    v11 = 0.0;
  v21 = -[NSString isNaturallyRTL](self->_text, "isNaturallyRTL");
  v22 = *MEMORY[0x1E0DC1178];
  v29[0] = *MEMORY[0x1E0DC1138];
  v29[1] = v22;
  v30[0] = v14;
  v30[1] = v16;
  v23 = *MEMORY[0x1E0DC1140];
  v30[2] = v20;
  v24 = *MEMORY[0x1E0DC1258];
  v29[2] = v23;
  v29[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSString drawInRect:withAttributes:](self->_text, "drawInRect:withAttributes:", v27, x + v9, v11, ceil(width), v13);
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setShadowColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_shadowColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_shadowColor, a3);
    -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)drawRect:(CGRect)a3
{
  if (self->_font && self->_text && !self->_scrollingView)
  {
    -[TPLCDTextView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[TPLCDTextView _drawTextInRect:verticallyOffset:](self, "_drawTextInRect:verticallyOffset:", 1);
  }
}

- (void)_tearDownAnimation
{
  TPLCDTextViewScrollingView *scrollingView;

  -[TPLCDTextView stopAnimating](self, "stopAnimating");
  -[TPLCDTextViewScrollingView removeFromSuperview](self->_scrollingView, "removeFromSuperview");
  scrollingView = self->_scrollingView;
  self->_scrollingView = 0;

  -[TPLCDTextView setClipsSubviews:](self, "setClipsSubviews:", 0);
  -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_scheduleStartScrolling
{
  *((_BYTE *)self + 512) |= 8u;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__startScrolling, 0);
  -[TPLCDTextView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__startScrolling, 0, 2.5);
}

- (void)_setupForAnimationIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSString *text;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TPLCDTextViewScrollingView *scrollingView;
  TPLCDTextViewScrollingView *v30;
  TPLCDTextViewScrollingView *v31;
  double v32;
  double v33;
  double v34;
  char v37;
  TPLCDTextViewScrollingView *v38;
  TPLCDTextViewScrollingView *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "_thinSystemFontOfSize:", self->_minFontSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPLCDTextView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  if (-[NSString length](self->_text, "length"))
  {
    text = self->_text;
    v9 = *MEMORY[0x1E0DC1258];
    v41[0] = *MEMORY[0x1E0DC1138];
    v41[1] = v9;
    v42[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString boundingRectWithSize:options:attributes:context:](text, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, v5, v7);
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (v14 > v5)
  {
    -[UIFont xHeight](self->_font, "xHeight");
    v18 = v17;
    objc_msgSend(v3, "xHeight");
    v20 = v19;
    v21 = ceil(v14);
    v22 = (v18 - v19) * 0.5;
    -[UIFont ascender](self->_font, "ascender");
    v24 = v22 + v23 - v18;
    objc_msgSend(v3, "ascender");
    v26 = round(v24 - (v25 - v20));
    v27 = ceil(v16 + 1.0);
    v28 = v5 + v21 + 30.0;
    scrollingView = self->_scrollingView;
    if (!scrollingView)
    {
      v38 = -[TPLCDTextViewScrollingView initWithFrame:owner:]([TPLCDTextViewScrollingView alloc], "initWithFrame:owner:", self, -(v21 + 30.0), v26, v28, v27);
      v39 = self->_scrollingView;
      self->_scrollingView = v38;

      -[TPLCDTextView addSubview:](self, "addSubview:", self->_scrollingView);
      -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
      if ((*((_BYTE *)self + 512) & 8) != 0)
        -[TPLCDTextView _scheduleStartScrolling](self, "_scheduleStartScrolling");
      goto LABEL_21;
    }
    if (self->_animation)
    {
      -[UIFrameAnimation target](self->_animation, "target");
      v30 = (TPLCDTextViewScrollingView *)objc_claimAutoreleasedReturnValue();
      v31 = self->_scrollingView;

      if (v30 == v31)
      {
LABEL_21:
        -[TPLCDTextView setClipsSubviews:](self, "setClipsSubviews:", 1);
        goto LABEL_22;
      }
      scrollingView = self->_scrollingView;
    }
    -[TPLCDTextViewScrollingView frame](scrollingView, "frame");
    if (v34 != v26 || v28 != v32 || v27 != v33)
    {
      -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", -(v21 + 30.0), v26, v28, v27);
      -[TPLCDTextViewScrollingView setNeedsDisplay](self->_scrollingView, "setNeedsDisplay");
    }
    goto LABEL_21;
  }
  v37 = *((_BYTE *)self + 512);
  -[TPLCDTextView _tearDownAnimation](self, "_tearDownAnimation");
  if ((v37 & 8) != 0)
    -[TPLCDTextView _scheduleStartScrolling](self, "_scheduleStartScrolling");
LABEL_22:

}

- (void)setAnimatesIfTruncated:(BOOL)a3
{
  char v4;

  if (((((*((_BYTE *)self + 512) & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      -[TPLCDTextView _setupForAnimationIfNecessary](self, "_setupForAnimationIfNecessary");
      v4 = 4;
    }
    else
    {
      -[TPLCDTextView _tearDownAnimation](self, "_tearDownAnimation");
      v4 = 0;
    }
    -[TPLCDTextView setNeedsDisplay](self, "setNeedsDisplay");
    *((_BYTE *)self + 512) = *((_BYTE *)self + 512) & 0xFB | v4;
    *((_BYTE *)self + 512) &= ~8u;
  }
}

- (void)_startScrolling
{
  void *v3;
  TPLCDTextViewScrollingView *scrollingView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIFrameAnimation *v14;
  UIFrameAnimation *animation;
  void *v16;

  -[TPLCDTextView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    scrollingView = self->_scrollingView;
    if (scrollingView)
    {
      -[TPLCDTextViewScrollingView frame](scrollingView, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      -[TPLCDTextView bounds](self, "bounds");
      v12 = v8 - v11;
      v13 = -(v8 - v11);
      -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", 0.0, v6, v8, v10);
      v14 = (UIFrameAnimation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3810]), "initWithTarget:", self->_scrollingView);
      animation = self->_animation;
      self->_animation = v14;

      -[UIFrameAnimation setSignificantRectFields:](self->_animation, "setSignificantRectFields:", 1);
      -[UIFrameAnimation setStartFrame:](self->_animation, "setStartFrame:", 0.0, v6, v8, v10);
      -[UIFrameAnimation setEndFrame:](self->_animation, "setEndFrame:", v13, v6, v8, v10);
      -[UIFrameAnimation setAnimationCurve:](self->_animation, "setAnimationCurve:", 3);
      -[UIFrameAnimation setDelegate:](self->_animation, "setDelegate:", self);
      -[UIFrameAnimation setAction:](self->_animation, "setAction:", sel__finishedScrolling);
      objc_msgSend(MEMORY[0x1E0DC3468], "sharedAnimator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAnimation:withDuration:start:", self->_animation, 1, (v12 + 0.0) * 0.025);

      *((_BYTE *)self + 512) |= 8u;
    }
    else
    {
      -[TPLCDTextView _finishedScrolling](self, "_finishedScrolling");
    }
  }
}

- (void)startAnimating
{
  if ((*((_BYTE *)self + 512) & 4) != 0 && (*((_BYTE *)self + 512) & 8) == 0)
  {
    -[TPLCDTextView _scheduleStartScrolling](self, "_scheduleStartScrolling");
    *((_BYTE *)self + 512) |= 8u;
  }
}

- (void)_finishedScrolling
{
  UIFrameAnimation *animation;
  void *v4;

  animation = self->_animation;
  self->_animation = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "lcdTextViewCompletedScroll:", self);
  if ((*((_BYTE *)self + 512) & 8) != 0 && (*((_BYTE *)self + 512) & 4) != 0 && self->_scrollingView)
  {
    -[TPLCDTextView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[TPLCDTextView _scheduleStartScrolling](self, "_scheduleStartScrolling");
  }
}

- (void)stopAnimating
{
  void *v3;
  UIFrameAnimation *animation;

  if ((*((_BYTE *)self + 512) & 4) != 0 && (*((_BYTE *)self + 512) & 8) != 0)
  {
    if (self->_scrollingView)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__startScrolling, 0);
      -[UIFrameAnimation setDelegate:](self->_animation, "setDelegate:", 0);
      objc_msgSend(MEMORY[0x1E0DC3468], "sharedAnimator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeAnimationsForTarget:", self->_scrollingView);

      animation = self->_animation;
      self->_animation = 0;

      *((_BYTE *)self + 512) &= ~8u;
    }
  }
}

- (BOOL)animates
{
  return (*((unsigned __int8 *)self + 512) >> 2) & 1;
}

- (void)resetAnimation
{
  char v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_scrollingView)
  {
    v3 = *((_BYTE *)self + 512);
    -[TPLCDTextView stopAnimating](self, "stopAnimating");
    -[TPLCDTextViewScrollingView frame](self->_scrollingView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[TPLCDTextView bounds](self, "bounds");
    -[TPLCDTextViewScrollingView setFrame:](self->_scrollingView, "setFrame:", -(v7 - v10), v5, v7, v9);
    if ((v3 & 8) != 0)
      -[TPLCDTextView _scheduleStartScrolling](self, "_scheduleStartScrolling");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_scrollingView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
