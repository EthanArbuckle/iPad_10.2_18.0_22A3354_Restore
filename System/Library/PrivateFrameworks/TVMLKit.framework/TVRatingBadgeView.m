@implementation TVRatingBadgeView

+ (id)ratingBadgeViewWithValue:(double)a3 layout:(id)a4 existingBadgeView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  objc_msgSend(v9, "setRatingBadgeLayout:", v7);
  objc_msgSend(v10, "setRatingValue:", a3);
  objc_msgSend(v10, "setNeedsDisplay");

  return v10;
}

- (TVRatingBadgeView)initWithFrame:(CGRect)a3
{
  TVRatingBadgeView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRatingBadgeView;
  v3 = -[TVRatingBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRatingBadgeView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[TVRatingBadgeView setOpaque:](v3, "setOpaque:", 0);
  }
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)setRatingValue:(double)a3
{
  if (self->_ratingValue != a3)
  {
    self->_ratingValue = a3;
    -[TVRatingBadgeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double ratingValue;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(_QWORD, _QWORD);
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CGContext *CurrentContext;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGPath *Mutable;
  CGPath *v50;
  void (**v51)(_QWORD, _QWORD);
  uint64_t v52;
  uint64_t i;
  uint64_t j;
  _QWORD v55[17];
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  TVRatingBadgeView *v60;
  _QWORD *v61;
  double v62;
  uint64_t v63;
  CGFloat v64;
  CGFloat v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[5];

  -[TVRatingBadgeView _starImage](self, "_starImage", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVViewLayout padding](self->_ratingBadgeLayout, "padding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TVRatingBadgeView _interitemSpacing](self, "_interitemSpacing");
  v14 = v13;
  v15 = -[TVRatingBadgeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v4)
  {
    -[TVRatingBadgeView _halfStarImage](self, "_halfStarImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRatingBadgeView _tintColor](self, "_tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRatingBadgeView _tintColor](self, "_tintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorWithAlphaComponent:", 0.3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRatingBadgeView _tintColor](self, "_tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_flatImageWithColor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    *(CGFloat *)&v70[3] = v8;
    ratingValue = self->_ratingValue;
    -[TVRatingBadgeView _starSize](self, "_starSize");
    v26 = v25;
    v28 = v27;
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __30__TVRatingBadgeView_drawRect___block_invoke;
    v56[3] = &unk_24EB86F80;
    v29 = v21;
    v57 = v29;
    v62 = round(ratingValue * 10.0) * 0.5;
    v30 = v18;
    v58 = v30;
    v31 = v23;
    v60 = self;
    v61 = v70;
    v63 = v6;
    v64 = v8;
    v65 = v10;
    v66 = v12;
    v67 = v26;
    v68 = v28;
    v59 = v31;
    v69 = v14;
    v32 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v56);
    if (v15 == 1)
    {
      v33 = 5;
      do
        v32[2](v32, v33--);
      while (v33);
    }
    else
    {
      for (i = 1; i != 6; ++i)
        v32[2](v32, i);
    }

    _Block_object_dispose(v70, 8);
  }
  else
  {
    -[TVRatingBadgeLayout fillColor](self->_ratingBadgeLayout, "fillColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = objc_msgSend(v34, "CGColor");

    -[TVRatingBadgeView _tintColor](self, "_tintColor");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend(v36, "CGColor");

    if (v15 == 1)
      v38 = v37;
    else
      v38 = v35;
    if (v15 == 1)
      v39 = v35;
    else
      v39 = v37;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, v8, v10);
    v41 = round(self->_ratingValue * 10.0) * 0.5;
    -[TVRatingBadgeView _circleRadius](self, "_circleRadius");
    v43 = v42;
    v44 = v42 + v42;
    UIRectGetCenter();
    v46 = v45;
    v48 = v47;
    Mutable = CGPathCreateMutable();
    CGPathAddArc(Mutable, 0, v46, v48, v43, 4.71238898, 1.57079633, 1);
    v50 = CGPathCreateMutable();
    CGPathAddArc(v50, 0, v46, v48, v43, 4.71238898, 1.57079633, 0);
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __30__TVRatingBadgeView_drawRect___block_invoke_2;
    v55[3] = &unk_24EB86FA8;
    *(double *)&v55[5] = v41;
    v55[6] = CurrentContext;
    v55[7] = Mutable;
    v55[8] = v50;
    v55[9] = v35;
    v55[10] = v38;
    v55[11] = v39;
    v55[13] = 0;
    v55[14] = 0;
    v55[12] = v37;
    *(double *)&v55[15] = v44;
    *(double *)&v55[16] = v44;
    v55[4] = self;
    v51 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v55);
    if (v15 == 1)
    {
      v52 = 5;
      do
        v51[2](v51, v52--);
      while (v52);
    }
    else
    {
      for (j = 1; j != 6; ++j)
        v51[2](v51, j);
    }
    CGPathRelease(Mutable);
    CGPathRelease(v50);

  }
}

void __30__TVRatingBadgeView_drawRect___block_invoke(uint64_t a1, unint64_t a2)
{
  id v4;
  double v5;
  id *v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v5 = *(double *)(a1 + 72);
  v10 = v4;
  if (v5 >= (double)a2)
  {
    v7 = (id *)(a1 + 40);
    goto LABEL_9;
  }
  if (v5 > (double)(a2 - 1) && v5 < (double)a2)
  {
    v7 = (id *)(a1 + 48);
LABEL_9:
    v8 = *v7;

    v10 = v8;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v10);
  objc_msgSend(v9, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(double *)(a1 + 80), *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 56), "addSubview:", v9);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 112)
                                                              + *(double *)(a1 + 128)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24);

}

void __30__TVRatingBadgeView_drawRect___block_invoke_2(uint64_t a1, unint64_t a2)
{
  double v3;
  double v4;
  double v5;
  CGContext *v6;
  CGColorRef *v8;
  CGContext *v9;
  double Width;
  double v11;

  v3 = *(double *)(a1 + 40);
  v4 = (double)a2;
  if (v3 >= (double)a2)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 56));
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 64));
    v8 = (CGColorRef *)(a1 + 72);
  }
  else
  {
    v5 = (double)(a2 - 1);
    CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 56));
    v6 = *(CGContext **)(a1 + 48);
    if (v3 > v5 && v3 < v4)
    {
      CGContextSetFillColorWithColor(v6, *(CGColorRef *)(a1 + 80));
      CGContextDrawPath(*(CGContextRef *)(a1 + 48), kCGPathFill);
      CGContextAddPath(*(CGContextRef *)(a1 + 48), *(CGPathRef *)(a1 + 64));
      v8 = (CGColorRef *)(a1 + 88);
    }
    else
    {
      CGContextAddPath(v6, *(CGPathRef *)(a1 + 64));
      v8 = (CGColorRef *)(a1 + 96);
    }
  }
  CGContextSetFillColorWithColor(*(CGContextRef *)(a1 + 48), *v8);
  CGContextDrawPath(*(CGContextRef *)(a1 + 48), kCGPathFill);
  v9 = *(CGContext **)(a1 + 48);
  Width = CGRectGetWidth(*(CGRect *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 32), "_interitemSpacing");
  CGContextTranslateCTM(v9, Width + v11, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
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
  double v21;
  CGSize result;

  -[TVRatingBadgeView _starImage](self, "_starImage", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVViewLayout padding](self->_ratingBadgeLayout, "padding");
  v6 = v5;
  v8 = v7;
  v11 = v9 + v10;
  if (v4)
  {
    -[TVRatingBadgeView _starSize](self, "_starSize");
    v13 = v11 + v12;
    -[TVRatingBadgeView _starSize](self, "_starSize");
  }
  else
  {
    -[TVRatingBadgeView _circleRadius](self, "_circleRadius");
    v13 = v11 + v15 * 2.0;
    -[TVRatingBadgeView _circleRadius](self, "_circleRadius");
    v14 = v16 + v16;
  }
  v17 = v6 + v8 + v14 * 5.0;
  -[TVRatingBadgeView _interitemSpacing](self, "_interitemSpacing");
  v19 = v17 + v18 * 4.0;

  v20 = v19;
  v21 = v13;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_tintColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[TVRatingBadgeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "userInterfaceStyle") == 2
    && (-[TVViewLayout darkTintColor](self->_ratingBadgeLayout, "darkTintColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[TVViewLayout darkTintColor](self->_ratingBadgeLayout, "darkTintColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TVViewLayout tintColor](self->_ratingBadgeLayout, "tintColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (double)_interitemSpacing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[TVRatingBadgeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRatingBadgeLayout interitemSpacing](self->_ratingBadgeLayout, "interitemSpacing");
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TVMLUtilities isAXSmallEnabled:](TVMLUtilities, "isAXSmallEnabled:", v6))
    {
      -[TVRatingBadgeLayout interitemSpacingAXSmall](self->_ratingBadgeLayout, "interitemSpacingAXSmall");
      v8 = v7;

      if (v8 > 0.0)
      {
        -[TVRatingBadgeLayout interitemSpacingAXSmall](self->_ratingBadgeLayout, "interitemSpacingAXSmall");
LABEL_9:
        v5 = v9;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[TVMLUtilities isAXLargeEnabled:](TVMLUtilities, "isAXLargeEnabled:", v10))
    {

      goto LABEL_11;
    }
    -[TVRatingBadgeLayout interitemSpacingAXLarge](self->_ratingBadgeLayout, "interitemSpacingAXLarge");
    v12 = v11;

    if (v12 > 0.0)
    {
      -[TVRatingBadgeLayout interitemSpacingAXLarge](self->_ratingBadgeLayout, "interitemSpacingAXLarge");
      goto LABEL_9;
    }
  }
LABEL_11:

  return v5;
}

- (id)_ratingStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[TVRatingBadgeView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRatingBadgeLayout ratingStyle](self->_ratingBadgeLayout, "ratingStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TVMLUtilities isAXSmallEnabled:](TVMLUtilities, "isAXSmallEnabled:", v5))
    {
      -[TVRatingBadgeLayout ratingStyleAXSmall](self->_ratingBadgeLayout, "ratingStyleAXSmall");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[TVRatingBadgeLayout ratingStyleAXSmall](self->_ratingBadgeLayout, "ratingStyleAXSmall");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = v4;
        v4 = (void *)v7;
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!+[TVMLUtilities isAXLargeEnabled:](TVMLUtilities, "isAXLargeEnabled:", v8))
    {
LABEL_10:

      goto LABEL_11;
    }
    -[TVRatingBadgeLayout ratingStyleAXLarge](self->_ratingBadgeLayout, "ratingStyleAXLarge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TVRatingBadgeLayout ratingStyleAXLarge](self->_ratingBadgeLayout, "ratingStyleAXLarge");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
LABEL_11:

  return v4;
}

- (CGSize)_starSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[TVRatingBadgeView _starImage](self, "_starImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[TVRatingBadgeView _starHeight](self, "_starHeight");
  v7 = v5 * v6;
  -[TVRatingBadgeView _starImage](self, "_starImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v7 / v9;

  v11 = v10;
  v12 = ceilf(v11);
  -[TVRatingBadgeView _starHeight](self, "_starHeight");
  v14 = v13;
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (double)_starHeight
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  float v7;
  double v8;

  if (_starHeight_onceToken != -1)
    dispatch_once(&_starHeight_onceToken, &__block_literal_global_34);
  -[TVRatingBadgeView _ratingStyle](self, "_ratingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("star-hollow-l")) && self->_ratingValue > 0.0)
  {
    v4 = CFSTR("star-l");
  }
  else
  {
    -[TVRatingBadgeView _ratingStyle](self, "_ratingStyle");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend((id)_starHeight_sStarStyleMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

void __32__TVRatingBadgeView__starHeight__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("star-s");
  v2[1] = CFSTR("star-m");
  v3[0] = &unk_24EBCCD48;
  v3[1] = &unk_24EBCCD60;
  v2[2] = CFSTR("star-l");
  v2[3] = CFSTR("star-hollow-l");
  v3[2] = &unk_24EBCCD78;
  v3[3] = &unk_24EBCCD78;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_starHeight_sStarStyleMap;
  _starHeight_sStarStyleMap = v0;

}

- (id)_starImage
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TVRatingBadgeView _ratingStyle](self, "_ratingStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("star-hollow-l")) && self->_ratingValue > 0.0)
  {
    v4 = CFSTR("star-l");
  }
  else
  {
    -[TVRatingBadgeView _ratingStyle](self, "_ratingStyle");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("star-hollow-l")) & 1) != 0)
  {
    v6 = CFSTR("star_hollow_mask");
  }
  else if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("circle")))
  {
    v6 = 0;
  }
  else
  {
    v6 = CFSTR("star_mask");
  }
  v7 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_halfStarImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("star_half_mask"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && -[TVRatingBadgeView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    v7 = objc_retainAutorelease(v5);
    v8 = objc_msgSend(v7, "CGImage");
    objc_msgSend(v7, "scale");
    objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, 4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;

  return v10;
}

- (double)_circleRadius
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  float v9;
  float v10;

  if (_circleRadius_onceToken != -1)
    dispatch_once(&_circleRadius_onceToken, &__block_literal_global_14_1);
  v3 = (void *)_circleRadius_sCircleRadiusMap;
  -[TVRatingBadgeView _ratingStyle](self, "_ratingStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24EBCCD90;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

void __34__TVRatingBadgeView__circleRadius__block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("circle");
  v3[0] = &unk_24EBCCD90;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_circleRadius_sCircleRadiusMap;
  _circleRadius_sCircleRadiusMap = v0;

}

- (TVRatingBadgeLayout)ratingBadgeLayout
{
  return self->_ratingBadgeLayout;
}

- (void)setRatingBadgeLayout:(id)a3
{
  objc_storeStrong((id *)&self->_ratingBadgeLayout, a3);
}

- (double)ratingValue
{
  return self->_ratingValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingBadgeLayout, 0);
}

@end
