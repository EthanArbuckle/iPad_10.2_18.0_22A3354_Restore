@implementation IMExpandingLabel

- (IMExpandingLabel)initWithFrame:(CGRect)a3
{
  IMExpandingLabel *v3;
  IMExpandingLabel *v4;
  id v5;
  uint64_t v6;
  UITextView *textView;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  CAGradientLayer *gradientLayer;
  id v17;
  uint64_t v18;
  id gradientClearColor;
  id v20;
  uint64_t v21;
  id gradientSemiClearColor;
  id v23;
  uint64_t v24;
  id gradientSolidColor;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)IMExpandingLabel;
  v3 = -[IMExpandingLabel initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfLines = 2;
    v3->_textMode = 8;
    v3->_expanded = 1;
    v3->_fitsWithinLineLimit = 0;
    v3->_hasGradient = 0;
    v3->_gradientHeight = 22.0;
    v3->_languageDirection = 1;
    -[IMExpandingLabel setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[IMExpandingLabel setContentMode:](v4, "setContentMode:", 5);
    -[IMExpandingLabel setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3E50]);
    -[IMExpandingLabel bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    -[UITextView setAutoresizingMask:](v4->_textView, "setAutoresizingMask:", 18);
    -[UITextView setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v4->_textView, "setEditable:", 0);
    -[UITextView textContainer](v4->_textView, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 4);

    -[UITextView textContainer](v4->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    v10 = *MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[UITextView setTextContainerInset:](v4->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], v11, v12, v13);
    -[UITextView setContentInset:](v4->_textView, "setContentInset:", v10, v11, v12, v13);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_textView, "setBackgroundColor:", v14);

    -[UITextView setDataDetectorTypes:](v4->_textView, "setDataDetectorTypes:", 7);
    -[UITextView setTextAlignment:](v4->_textView, "setTextAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v15 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = (CAGradientLayer *)v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.100000001);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "CGColor");
    v18 = objc_claimAutoreleasedReturnValue();
    gradientClearColor = v4->_gradientClearColor;
    v4->_gradientClearColor = (id)v18;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.330000013);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "CGColor");
    v21 = objc_claimAutoreleasedReturnValue();
    gradientSemiClearColor = v4->_gradientSemiClearColor;
    v4->_gradientSemiClearColor = (id)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v23, "CGColor");
    v24 = objc_claimAutoreleasedReturnValue();
    gradientSolidColor = v4->_gradientSolidColor;
    v4->_gradientSolidColor = (id)v24;

    -[IMExpandingLabel addSubview:](v4, "addSubview:", v4->_textView);
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double gradientHeight;
  CGFloat Height;
  CAGradientLayer *gradientLayer;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  CAGradientLayer *v47;
  id gradientSolidColor;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  double v52;
  id gradientClearColor;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[2];
  CGRect v78;

  v77[1] = *MEMORY[0x1E0C80C00];
  v73.receiver = self;
  v73.super_class = (Class)IMExpandingLabel;
  -[IMExpandingLabel layoutSubviews](&v73, sel_layoutSubviews);
  -[IMExpandingLabel moreButton](self, "moreButton");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[IMExpandingLabel isExpanded](self, "isExpanded");

    if (!v5)
    {
      -[IMExpandingLabel textView](self, "textView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

      -[IMExpandingLabel textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMaximumNumberOfLines:", 0);

      -[IMExpandingLabel textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMExpandingLabel bounds](self, "bounds");
      objc_msgSend(v10, "sizeThatFits:", v11, 3.40282347e38);
      v13 = v12;
      v14 = ceilf(v13);

      v15 = -[IMExpandingLabel numberOfLines](self, "numberOfLines");
      -[IMExpandingLabel textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMaximumNumberOfLines:", v15);

      -[IMExpandingLabel textView](self, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMExpandingLabel bounds](self, "bounds");
      objc_msgSend(v18, "sizeThatFits:", v19, 3.40282347e38);
      v21 = v20;
      v22 = ceilf(v21);

      if (vabdd_f64(v14, v22) < 2.22044605e-16)
      {
        -[IMExpandingLabel setFitsWithinLineLimit:](self, "setFitsWithinLineLimit:", 1);
        -[IMExpandingLabel textView](self, "textView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "textContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMaximumNumberOfLines:", 0);

        -[IMExpandingLabel moreButton](self, "moreButton");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 1;
LABEL_7:
        objc_msgSend(v25, "setHidden:", v27);

        goto LABEL_8;
      }
      if (-[IMExpandingLabel fitsWithinLineLimit](self, "fitsWithinLineLimit"))
      {
        -[IMExpandingLabel setFitsWithinLineLimit:](self, "setFitsWithinLineLimit:", 0);
        v28 = -[IMExpandingLabel numberOfLines](self, "numberOfLines");
        -[IMExpandingLabel textView](self, "textView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "textContainer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setMaximumNumberOfLines:", v28);

        -[IMExpandingLabel moreButton](self, "moreButton");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  -[IMExpandingLabel moreButton](self, "moreButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || -[IMExpandingLabel isExpanded](self, "isExpanded"))
  {

LABEL_11:
    -[IMExpandingLabel textView](self, "textView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textContainer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);
    goto LABEL_12;
  }
  v50 = -[IMExpandingLabel fitsWithinLineLimit](self, "fitsWithinLineLimit");

  if ((v50 & 1) != 0)
    goto LABEL_11;
  v51 = -[IMExpandingLabel languageDirection](self, "languageDirection");
  if (v51 == 2)
  {
    v52 = 0.0;
  }
  else
  {
    -[IMExpandingLabel bounds](self, "bounds");
    v56 = v55;
    -[IMExpandingLabel moreButton](self, "moreButton");
    v50 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v50, "bounds");
    v52 = v56 - v57;
  }
  -[IMExpandingLabel bounds](self, "bounds");
  -[IMExpandingLabel heightForWidth:](self, "heightForWidth:", v58);
  v60 = v59;
  -[IMExpandingLabel moreButton](self, "moreButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bounds");
  v63 = v60 - v62;
  -[IMExpandingLabel moreButton](self, "moreButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bounds");
  v66 = v65;
  -[IMExpandingLabel moreButton](self, "moreButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bounds");
  v69 = v68;

  if (v51 != 2)
  -[IMExpandingLabel moreButton](self, "moreButton");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setFrame:", v52, v63, v66, v69);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v52, v63, v66, v69);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMExpandingLabel textView](self, "textView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "textContainer");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setExclusionPaths:", v33);

LABEL_12:
  if (-[IMExpandingLabel hasGradient](self, "hasGradient"))
  {
    gradientHeight = self->_gradientHeight;
    -[IMExpandingLabel bounds](self, "bounds");
    Height = CGRectGetHeight(v78);
    gradientLayer = self->_gradientLayer;
    v37 = gradientHeight / Height;
    LODWORD(Height) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", Height);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v38;
    v39 = 1.0 - v37;
    *(float *)&v39 = 1.0 - v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v40;
    v41 = v37 / -3.0 + 1.0;
    *(float *)&v41 = v41;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v42;
    v43 = v37 / -12.0 + 1.0;
    *(float *)&v43 = v43;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setLocations:](gradientLayer, "setLocations:", v45);

    v46 = -[IMExpandingLabel isExpanded](self, "isExpanded");
    v47 = self->_gradientLayer;
    gradientSolidColor = self->_gradientSolidColor;
    if (v46)
    {
      v75[0] = self->_gradientSolidColor;
      v75[1] = gradientSolidColor;
      v49 = v75;
      v75[2] = gradientSolidColor;
      v75[3] = gradientSolidColor;
    }
    else
    {
      v74[0] = self->_gradientSolidColor;
      v74[1] = gradientSolidColor;
      gradientClearColor = self->_gradientClearColor;
      v74[2] = self->_gradientSemiClearColor;
      v74[3] = gradientClearColor;
      v49 = v74;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v47, "setColors:", v54);

    -[IMExpandingLabel bounds](self, "bounds");
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  }
}

- (void)setMoreButton:(id)a3
{
  UIButton *v4;
  UIButton *moreButton;
  UIButton *v6;

  v4 = (UIButton *)a3;
  -[UIButton removeTarget:action:forControlEvents:](self->_moreButton, "removeTarget:action:forControlEvents:", self, sel_moreButtonTapped_, 64);
  -[UIButton removeFromSuperview](self->_moreButton, "removeFromSuperview");
  moreButton = self->_moreButton;
  self->_moreButton = v4;
  v6 = v4;

  -[IMExpandingLabel addSubview:](self, "addSubview:", self->_moreButton);
  -[UIButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, sel_moreButtonTapped_, 64);

  -[IMExpandingLabel setExpanded:](self, "setExpanded:", 0);
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 expanded;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  expanded = self->_expanded;
  self->_expanded = a3;
  if (a3)
  {
    -[IMExpandingLabel textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", 0);

    -[IMExpandingLabel textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

    -[IMExpandingLabel moreButton](self, "moreButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
    if (!expanded)
    {
      -[IMExpandingLabel delegate](self, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expandingLabelShouldExpand:", self);

    }
  }
  else
  {
    v10 = -[IMExpandingLabel numberOfLines](self, "numberOfLines");
    -[IMExpandingLabel textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaximumNumberOfLines:", v10);

    -[IMExpandingLabel moreButton](self, "moreButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasGradient:(BOOL)a3
{
  CAGradientLayer *gradientLayer;
  void *v5;
  void *v6;
  CAGradientLayer *v7;

  self->_hasGradient = a3;
  if (a3)
  {
    gradientLayer = self->_gradientLayer;
    -[UITextView layer](self->_textView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = gradientLayer;
  }
  else
  {
    -[UITextView layer](self->_textView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setMask:", v7);

  -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
  -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)moreButtonTapped:(id)a3
{
  -[IMExpandingLabel setExpanded:](self, "setExpanded:", 1);
}

- (void)setText:(id)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  CFRange v23;

  v22 = a3;
  if ((objc_msgSend(v22, "isEqualToString:", self->_text) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    if (v22)
    {
      if (-[IMExpandingLabel textMode](self, "textMode") == 2
        || ((v5 = -[IMExpandingLabel textMode](self, "textMode"),
             v6 = -[IMExpandingLabel textMode](self, "textMode"),
             v5 == 4)
         || v6 == 8)
        && objc_msgSend(v22, "hasHTML"))
      {
        v7 = (void *)MEMORY[0x1E0CB3498];
        -[IMExpandingLabel textAttributes](self, "textAttributes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safeAttributedStringWithHTML:attributes:", v22, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[IMExpandingLabel textMode](self, "textMode") == 8)
        {
          objc_msgSend(v9, "attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters");
          v10 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v10;
        }
        -[IMExpandingLabel textView](self, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAttributedText:", v9);
      }
      else
      {
        v13 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[IMExpandingLabel textAttributes](self, "textAttributes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v13, "initWithString:attributes:", v22, v9);
        -[IMExpandingLabel textView](self, "textView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAttributedText:", v11);

      }
      -[IMExpandingLabel textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "text");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[IMExpandingLabel textView](self, "textView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23.length = objc_msgSend(v18, "length");
      v23.location = 0;
      v19 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v16, v23);

      -[IMExpandingLabel setLanguageDirection:](self, "setLanguageDirection:", objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v19));
    }
    else
    {
      -[IMExpandingLabel textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", 0);

      -[IMExpandingLabel setLanguageDirection:](self, "setLanguageDirection:", 1);
    }
    v20 = -[IMExpandingLabel languageDirection](self, "languageDirection") == 2;
    -[IMExpandingLabel textView](self, "textView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextAlignment:", 2 * v20);

    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setNumberOfLines:(unint64_t)a3
{
  void *v5;
  void *v6;

  self->_numberOfLines = a3;
  if (!-[IMExpandingLabel isExpanded](self, "isExpanded"))
  {
    -[IMExpandingLabel textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", a3);

    -[IMExpandingLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)heightForWidth:(double)a3
{
  void *v4;
  double v5;
  float v6;
  double v7;

  -[IMExpandingLabel textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  v6 = v5;
  v7 = ceilf(v6);

  return v7;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMExpandingLabel textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)isScrollEnabled
{
  void *v2;
  char v3;

  -[IMExpandingLabel textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollEnabled");

  return v3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSString)text
{
  return self->_text;
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (int64_t)textMode
{
  return self->_textMode;
}

- (void)setTextMode:(int64_t)a3
{
  self->_textMode = a3;
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)hasGradient
{
  return self->_hasGradient;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (IMExpandingLabelDelegate)delegate
{
  return (IMExpandingLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fitsWithinLineLimit
{
  return self->_fitsWithinLineLimit;
}

- (void)setFitsWithinLineLimit:(BOOL)a3
{
  self->_fitsWithinLineLimit = a3;
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_textAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong(&self->_gradientSolidColor, 0);
  objc_storeStrong(&self->_gradientSemiClearColor, 0);
  objc_storeStrong(&self->_gradientClearColor, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
