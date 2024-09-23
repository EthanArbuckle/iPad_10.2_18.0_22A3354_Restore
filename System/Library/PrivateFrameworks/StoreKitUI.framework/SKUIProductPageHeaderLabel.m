@implementation SKUIProductPageHeaderLabel

- (void)setText:(id)a3
{
  NSString *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageHeaderLabel setText:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_text != v5)
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[SKUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageHeaderLabel setTextColor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[SKUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setContentRating:(id)a3
{
  NSString *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIImage *v14;
  UIImage *contentRatingImage;

  v5 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageHeaderLabel setContentRating:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_contentRating != v5)
  {
    objc_storeStrong((id *)&self->_contentRating, a3);
    -[SKUIProductPageHeaderLabel _imageForContentRating:](self, "_imageForContentRating:", self->_contentRating);
    v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v14;

    -[SKUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setSecondaryContentRatingImages:(id)a3
{
  NSArray *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (NSArray *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageHeaderLabel setSecondaryContentRatingImages:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_secondaryContentRatingImages != v5)
  {
    objc_storeStrong((id *)&self->_secondaryContentRatingImages, a3);
    -[SKUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setRatingColor:(id)a3
{
  UIColor *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIImage *v14;
  UIImage *contentRatingImage;

  v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageHeaderLabel setRatingColor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_ratingColor != v5)
  {
    objc_storeStrong((id *)&self->_ratingColor, a3);
    -[SKUIProductPageHeaderLabel _imageForContentRating:](self, "_imageForContentRating:", self->_contentRating);
    v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v14;

    -[SKUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (double)secondaryImageWidth
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIProductPageHeaderLabel secondaryImageWidth].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (!-[NSArray count](self->_secondaryContentRatingImages, "count"))
    return 0.0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_secondaryContentRatingImages;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "size", (_QWORD)v19);
        v15 = v15 + v17 + 5.0;
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

- (void)drawRect:(CGRect)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double *v16;
  __CTFramesetter *v17;
  CGPath *Mutable;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  CGPoint *v22;
  const __CTFrame *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const __CTLine *ValueAtIndex;
  double v30;
  CGPath *v31;
  const __CTFrame *v32;
  CFIndex v33;
  const __CTFrame *v34;
  CGContext *CurrentContext;
  __int128 v36;
  uint64_t v37;
  CFIndex v38;
  double *p_x;
  double *v40;
  const __CTLine *v41;
  CFIndex location;
  CFRange VisibleStringRange;
  void *v44;
  id v45;
  void *v46;
  const __CFAttributedString *v47;
  unint64_t v48;
  CTLineRef v49;
  const __CFAttributedString *v50;
  const __CTLine *v51;
  const __CTLine *v52;
  id v53;
  void *v54;
  const __CFAttributedString *v55;
  const __CTLine *v56;
  UIImage *contentRatingImage;
  double v58;
  double v59;
  double v60;
  const __CTLine *v61;
  const __CTLine *TruncatedLine;
  CGFloat v63;
  double v64;
  float v65;
  UIImage *v66;
  double v67;
  double v68;
  double width;
  void *v70;
  unint64_t v71;
  void *v72;
  float v73;
  double v74;
  CGFloat v75;
  double v76;
  float v77;
  void *v78;
  double v79;
  uint64_t v80;
  const __CTLine *v81;
  UIImage *v82;
  unint64_t v83;
  void *v84;
  void *v85;
  __CTFramesetter *v86;
  const __CFArray *v87;
  CGPoint *v88;
  double v89;
  double v90;
  uint64_t v91;
  double v92;
  const __CTFrame *cf;
  const __CTLine *v94;
  void *v95;
  double *v96;
  double *v97;
  const __CTLine *v98;
  const __CFAttributedString *v99;
  uint64_t v100;
  CGContext *c;
  const __CTLine *v102;
  CGAffineTransform v103;
  CFRange v104;
  CFRange v105;
  CFRange v106;
  CFRange v107;
  CGRect v108;
  CGRect BoundsWithOptions;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIProductPageHeaderLabel drawRect:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[SKUIProductPageHeaderLabel bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v16 = (double *)MEMORY[0x1E0C9D538];
  v17 = -[SKUIProductPageHeaderLabel _newTextFramesetter](self, "_newTextFramesetter");
  Mutable = CGPathCreateMutable();
  v108.origin.x = 0.0;
  v108.origin.y = 0.0;
  v92 = v13;
  v108.size.width = v13;
  v108.size.height = v15;
  CGPathAddRect(Mutable, 0, v108);
  v104.location = 0;
  v104.length = 0;
  Frame = CTFramesetterCreateFrame(v17, v104, Mutable, 0);
  CFRelease(Mutable);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  v22 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  cf = Frame;
  v23 = Frame;
  v24 = Count;
  v105.location = 0;
  v105.length = 0;
  CTFrameGetLineOrigins(v23, v105, v22);
  -[SKUIProductPageHeaderLabel secondaryImageWidth](self, "secondaryImageWidth");
  v26 = v25;
  -[UIImage size](self->_contentRatingImage, "size");
  if (Count == 1)
  {
    if (self->_contentRatingImage
      && (v28 = v26 + v27 + 5.0,
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0),
          BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0),
          v30 = v13 - v28,
          BoundsWithOptions.size.width > v30))
    {
      CFRelease(cf);
      free(v22);
      v31 = CGPathCreateMutable();
      v110.origin.x = 0.0;
      v110.origin.y = 0.0;
      v110.size.width = v30;
      v110.size.height = v15;
      CGPathAddRect(v31, 0, v110);
      v106.location = 0;
      v106.length = 0;
      v32 = CTFramesetterCreateFrame(v17, v106, v31, 0);
      CFRelease(v31);
      Lines = CTFrameGetLines(v32);
      v33 = CFArrayGetCount(Lines);
      v22 = (CGPoint *)malloc_type_malloc(16 * v33, 0x1000040451B5BE8uLL);
      cf = v32;
      v34 = v32;
      v24 = v33;
      v107.location = 0;
      v107.length = 0;
      CTFrameGetLineOrigins(v34, v107, v22);
    }
    else
    {
      v24 = 1;
    }
  }
  v89 = v16[1];
  v90 = *v16;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v15);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v103.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v103.c = v36;
  *(_OWORD *)&v103.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  c = CurrentContext;
  CGContextSetTextMatrix(CurrentContext, &v103);
  v37 = v24 - 1;
  v86 = v17;
  if (v24 < 1)
  {
    v95 = 0;
  }
  else
  {
    v38 = 0;
    p_x = &v22[v37].x;
    v40 = p_x + 1;
    v88 = v22;
    v87 = Lines;
    v97 = p_x + 1;
    v95 = 0;
    v96 = p_x;
    v91 = v24;
    v100 = v24 - 1;
    do
    {
      v41 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v38);
      v102 = v41;
      if (v38 == v37)
      {
        location = CTLineGetStringRange(v41).location;
        VisibleStringRange = CTFrameGetVisibleStringRange(cf);
        if (VisibleStringRange.location + VisibleStringRange.length >= -[NSString length](self->_text, "length"))
        {
          v51 = 0;
          v48 = 0x1E0CB3000uLL;
        }
        else
        {
          -[NSString substringFromIndex:](self->_text, "substringFromIndex:", location);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_alloc(MEMORY[0x1E0CB3498]);
          -[SKUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (const __CFAttributedString *)objc_msgSend(v45, "initWithString:attributes:", v44, v46);

          v48 = 0x1E0CB3000;
          v49 = CTLineCreateWithAttributedString(v47);
          v50 = v47;
          v51 = v49;
          CFRelease(v50);

        }
        v53 = objc_alloc(*(Class *)(v48 + 1176));
        -[SKUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (const __CFAttributedString *)objc_msgSend(v53, "initWithString:attributes:", CFSTR("…"), v54);

        v99 = v55;
        v56 = CTLineCreateWithAttributedString(v55);
        contentRatingImage = self->_contentRatingImage;
        if (contentRatingImage)
        {
          -[UIImage size](contentRatingImage, "size");
          v59 = v58 + 5.0;
        }
        else
        {
          v59 = 0.0;
        }
        v60 = v92 - v59 - v26;
        if (v51)
          v61 = v51;
        else
          v61 = v102;
        v98 = v56;
        TruncatedLine = CTLineCreateTruncatedLine(v61, v60, kCTLineTruncationEnd, v56);
        v52 = TruncatedLine;
        if (self->_contentRatingImage)
        {
          v111 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
          *(float *)&v111.origin.x = *p_x + v111.size.width + 5.0;
          v90 = roundf(*(float *)&v111.origin.x);
          v63 = v15 - *v40;
          -[UIImage size](self->_contentRatingImage, "size");
          v65 = v63 - v64 + 0.0;
          v89 = roundf(v65);
        }
        if (-[NSArray count](self->_secondaryContentRatingImages, "count"))
        {
          v66 = self->_contentRatingImage;
          v94 = v51;
          if (v66)
          {
            -[UIImage size](v66, "size");
            v68 = v67 + 5.0 + 5.0;
          }
          else
          {
            v68 = 5.0;
          }
          v112 = CTLineGetBoundsWithOptions(v52, 0);
          width = v112.size.width;
          v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_secondaryContentRatingImages, "count"));
          if (-[NSArray count](self->_secondaryContentRatingImages, "count"))
          {
            v71 = 0;
            do
            {
              -[NSArray objectAtIndex:](self->_secondaryContentRatingImages, "objectAtIndex:", v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v68 + width + *v96;
              v74 = roundf(v73);
              v75 = v15 - *v97;
              objc_msgSend(v72, "size");
              v77 = v75 - v76 + -1.0;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v74, roundf(v77));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "addObject:", v78);
              objc_msgSend(v72, "size");
              v68 = v68 + v79 + 5.0;

              ++v71;
            }
            while (-[NSArray count](self->_secondaryContentRatingImages, "count") > v71);
          }
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v70);
          v80 = objc_claimAutoreleasedReturnValue();

          v95 = (void *)v80;
          v22 = v88;
          Lines = v87;
          v51 = v94;
        }
        CFRelease(v98);
        CFRelease(v99);
        v24 = v91;
        if (v51)
          CFRelease(v51);
        p_x = v96;
        v40 = v97;
      }
      else
      {
        v52 = 0;
      }
      CGContextSetTextPosition(c, v22[v38].x, v22[v38].y);
      if (v52)
        v81 = v52;
      else
        v81 = v102;
      CTLineDraw(v81, c);
      if (v52)
        CFRelease(v52);
      ++v38;
      v37 = v100;
    }
    while (v38 != v24);
  }
  CGContextRestoreGState(c);
  v82 = self->_contentRatingImage;
  if (v82)
    -[UIImage drawAtPoint:](v82, "drawAtPoint:", v90, v89);
  if (-[NSArray count](self->_secondaryContentRatingImages, "count")
    && -[NSArray count](self->_secondaryContentRatingImages, "count"))
  {
    v83 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_secondaryContentRatingImages, "objectAtIndex:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectAtIndex:", v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "CGPointValue");
      objc_msgSend(v84, "drawAtPoint:");

      ++v83;
    }
    while (-[NSArray count](self->_secondaryContentRatingImages, "count") > v83);
  }
  free(v22);
  CFRelease(cf);
  CFRelease(v86);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  __CTFramesetter *v6;
  CGSize v7;
  double v8;
  CGPath *Mutable;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  double v13;
  double v14;
  double v15;
  double v16;
  const __CTLine *ValueAtIndex;
  double v18;
  CGPath *v19;
  const __CTLine *v20;
  float v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  CGPoint v27;
  CFRange v28;
  CFRange v29;
  CFRange v30;
  CFRange v31;
  CFRange v32;
  CGSize v33;
  CGSize v34;
  CGSize result;
  CGRect v36;
  CGRect BoundsWithOptions;
  CGRect v38;
  CGRect v39;

  height = a3.height;
  width = a3.width;
  v6 = -[SKUIProductPageHeaderLabel _newTextFramesetter](self, "_newTextFramesetter");
  v28.location = 0;
  v28.length = 0;
  v33.width = width;
  v33.height = height;
  v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v28, 0, v33, 0);
  v8 = v7.height;
  Mutable = CGPathCreateMutable();
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v7.width;
  v36.size.height = v7.height;
  CGPathAddRect(Mutable, 0, v36);
  v29.location = 0;
  v29.length = 0;
  Frame = CTFramesetterCreateFrame(v6, v29, Mutable, 0);
  CFRelease(Mutable);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  -[SKUIProductPageHeaderLabel secondaryImageWidth](self, "secondaryImageWidth");
  v14 = v13;
  -[UIImage size](self->_contentRatingImage, "size");
  if (Count == 1)
  {
    v16 = v14 + v15 + 5.0;
    if (v16 > 0.0)
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0);
      BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
      v18 = width - v16;
      if (BoundsWithOptions.size.width <= v18)
        goto LABEL_7;
      CFRelease(Frame);
      v30.location = 0;
      v30.length = 0;
      v34.width = v18;
      v34.height = height;
      v8 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v30, 0, v34, 0).height;
      v19 = CGPathCreateMutable();
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.width = v18;
      v38.size.height = height;
      CGPathAddRect(v19, 0, v38);
      v31.location = 0;
      v31.length = 0;
      Frame = CTFramesetterCreateFrame(v6, v31, v19, 0);
      CFRelease(v19);
      Lines = CTFrameGetLines(Frame);
      Count = CFArrayGetCount(Lines);
    }
  }
  if (Count >= 3)
  {
    v27.x = 0.0;
    v27.y = 0.0;
    v32.location = 1;
    v32.length = 1;
    CTFrameGetLineOrigins(Frame, v32, &v27);
    v20 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 1);
    v39 = CTLineGetBoundsWithOptions(v20, 0);
    v8 = v8 - v27.y - v39.origin.y;
  }
LABEL_7:
  v21 = v8;
  v22 = roundf(v21);
  v23 = width;
  v24 = roundf(v23);
  CFRelease(Frame);
  CFRelease(v6);
  v25 = v24;
  v26 = v22;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (id)_imageForContentRating:(id)a3
{
  return SKUIBadgeImageFromText(a3, self->_ratingColor, 1);
}

- (__CTFramesetter)_newTextFramesetter
{
  id v3;
  NSString *text;
  void *v5;
  const __CFAttributedString *v6;
  __CTFramesetter *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  text = self->_text;
  -[SKUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFAttributedString *)objc_msgSend(v3, "initWithString:attributes:", text, v5);

  v7 = CTFramesetterCreateWithAttributedString(v6);
  CFRelease(v6);
  return v7;
}

- (id)_textAttributes
{
  double v3;
  void *v4;
  UIColor *textColor;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0DC1138];
  v3 = 22.0;
  if (!self->_isPad)
    v3 = 17.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0DC1140];
  textColor = self->_textColor;
  v6 = textColor;
  if (!textColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!textColor)

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (NSArray)secondaryContentRatingImages
{
  return self->_secondaryContentRatingImages;
}

- (UIColor)ratingColor
{
  return self->_ratingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingColor, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatingImages, 0);
  objc_storeStrong((id *)&self->_contentRatingImage, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTextColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentRating:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSecondaryContentRatingImages:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRatingColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)secondaryImageWidth
{
  OUTLINED_FUNCTION_1();
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
