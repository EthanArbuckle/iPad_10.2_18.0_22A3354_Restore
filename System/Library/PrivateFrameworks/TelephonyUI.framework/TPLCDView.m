@implementation TPLCDView

- (CGRect)fullSizedContentViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[TPLCDView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if (v8 >= v10)
    v8 = v10;
  objc_msgSend((id)objc_opt_class(), "defaultHeightForOrientation:", 4);
  v12 = v11;
  v13 = floor((v3 - v8) * 0.5);
  v14 = floor((v5 - v12) * 0.5);
  v15 = v8;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_resetContentViewFrame
{
  UIView *contentView;

  contentView = self->_contentView;
  -[TPLCDView fullSizedContentViewFrame](self, "fullSizedContentViewFrame");
  -[UIView setFrame:](contentView, "setFrame:");
  -[TPLCDView setNeedsLayout](self, "setNeedsLayout");
}

- (TPLCDView)initWithDefaultSizeForOrientation:(int64_t)a3
{
  TPLCDView *v3;
  id v4;
  uint64_t v5;
  UIView *contentView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPLCDView;
  v3 = -[TPLCDBar initWithDefaultSizeForOrientation:](&v8, sel_initWithDefaultSizeForOrientation_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[TPLCDView fullSizedContentViewFrame](v3, "fullSizedContentViewFrame");
    v5 = objc_msgSend(v4, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    -[UIView setAutoresizingMask:](v3->_contentView, "setAutoresizingMask:", 45);
    -[TPLCDView addSubview:](v3, "addSubview:", v3->_contentView);
  }
  return v3;
}

+ (double)defaultTextFontSize
{
  return 36.0;
}

+ (double)defaultLabelFontSize
{
  return 18.0;
}

- (BOOL)shouldCenterText
{
  return self->_imageView == 0;
}

- (BOOL)shouldCenterContentView
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && self->_imageView != 0;
}

- (void)setContentsAlpha:(double)a3
{
  -[TPLCDTextView setAlpha:](self->_textView, "setAlpha:");
  -[TPLCDTextView setAlpha:](self->_labelView, "setAlpha:", a3);
  -[TPLCDSubImageView setAlpha:](self->_imageView, "setAlpha:", a3);
}

- (double)_labelVInset
{
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  -[TPLCDView subImage](self, "subImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self->_contentView, "bounds");
  v4 = floor(CGRectGetMidY(v7));
  v5 = 5.0;
  if (!v3)
    v5 = 18.0;
  return v4 + v5;
}

- (double)_textVInset
{
  CGRect v3;

  -[UIView bounds](self->_contentView, "bounds");
  return floor(CGRectGetMidY(v3)) + -32.0;
}

- (void)setTextFontSize:(double)a3
{
  TPLCDTextView *textView;
  id v4;

  textView = self->_textView;
  objc_msgSend(MEMORY[0x1E0DC1350], "_thinSystemFontOfSize:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TPLCDTextView setFont:](textView, "setFont:", v4);

}

- (void)setText:(id)a3
{
  TPLCDTextView *textView;
  void *v5;
  void *v6;
  TPLCDTextView *v7;
  TPLCDTextView *v8;
  id v9;

  v9 = a3;
  -[TPLCDView _resetContentViewFrame](self, "_resetContentViewFrame");
  textView = self->_textView;
  if (!textView)
  {
    v5 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "defaultTextFontSize");
    objc_msgSend(v5, "_thinSystemFontOfSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(TPLCDTextView);
    v8 = self->_textView;
    self->_textView = v7;

    -[TPLCDTextView setLCDTextFont:](self->_textView, "setLCDTextFont:", v6);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_textView);

    textView = self->_textView;
  }
  -[TPLCDTextView setText:](textView, "setText:", v9);
  -[TPLCDView layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)text
{
  return -[TPLCDTextView text](self->_textView, "text");
}

- (CGRect)_text1Frame
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[TPLCDView _textVInset](self, "_textVInset");
  v4 = v3;
  v5 = v3;
  -[TPLCDView _labelVInset](self, "_labelVInset");
  v7 = v6;
  -[UIView bounds](self->_contentView, "bounds");
  v9 = v8;
  v10 = v7 - v4;
  if (!self->_labelView && (*((_BYTE *)self + 456) & 1) == 0)
  {
    -[TPLCDView _textVInset](self, "_textVInset");
    v5 = v11;
  }
  v12 = v9 + -40.0;
  if (self->_imageView)
  {
    if (-[TPLCDView shouldCenterContentView](self, "shouldCenterContentView"))
      v13 = 0.0;
    else
      v13 = 20.0;
    if (-[TPLCDView verticallyCenterTextViewIfLabelless](self, "verticallyCenterTextViewIfLabelless")
      && !self->_labelView)
    {
      -[TPLCDSubImageView frame](self->_imageView, "frame");
      v15 = v14;
      -[TPLCDSubImageView bounds](self->_imageView, "bounds");
      v5 = v15 + v16 * 0.5 - (v10 + 5.0) * 0.5;
    }
    else
    {
      v5 = v4 + -6.0;
    }
    -[TPLCDTextView sizeToFit](self->_textView, "sizeToFit");
    if (v12 >= v17)
      v18 = v17;
    else
      v18 = v9 + -40.0;
    -[UIView bounds](self->_contentView, "bounds");
    v20 = v19;
    -[TPLCDSubImageView bounds](self->_imageView, "bounds");
    if (v18 >= v20 - (v21 + 42.0))
      v12 = v20 - (v21 + 42.0);
    else
      v12 = v18;
  }
  else
  {
    v13 = 20.0;
  }
  v22 = v13;
  v23 = v5;
  v24 = v12;
  v25 = v10 + 5.0;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)_labelFrame
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
  CGRect result;

  -[UIView bounds](self->_contentView, "bounds");
  v4 = v3;
  v6 = v5;
  -[TPLCDView _labelVInset](self, "_labelVInset");
  v8 = v7;
  v9 = v4 + -40.0;
  if (self->_imageView)
  {
    if (-[TPLCDView shouldCenterContentView](self, "shouldCenterContentView"))
      v10 = 0.0;
    else
      v10 = 20.0;
    v8 = v8 + -1.0;
    -[TPLCDTextView sizeToFit](self->_labelView, "sizeToFit");
    if (v9 >= v11)
      v9 = v11;
    -[TPLCDSubImageView bounds](self->_imageView, "bounds");
    if (v9 >= v4 - (v12 + 42.0))
      v9 = v4 - (v12 + 42.0);
  }
  else
  {
    v10 = 20.0;
  }
  v13 = v6 - v8;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_imageViewFrame
{
  TPLCDSubImageView *imageView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  imageView = self->_imageView;
  if (imageView)
  {
    -[TPLCDSubImageView bounds](imageView, "bounds");
    v5 = v4;
    v7 = v6;
    -[UIView bounds](self->_contentView, "bounds");
    v9 = v8 + -20.0 - v5;
    -[UIView bounds](self->_contentView, "bounds");
    v11 = (v10 - v7) * 0.5;
    v12 = (float)(roundf(v11) + -4.0);
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = v9;
  v14 = v5;
  v15 = v7;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (void)layoutSubviews
{
  UIView *contentView;
  _BOOL8 v4;
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

  contentView = self->_contentView;
  -[TPLCDView fullSizedContentViewFrame](self, "fullSizedContentViewFrame");
  -[UIView setFrame:](contentView, "setFrame:");
  v4 = -[TPLCDView shouldCenterText](self, "shouldCenterText");
  -[TPLCDTextView setCenterText:](self->_textView, "setCenterText:", v4);
  -[TPLCDTextView setCenterText:](self->_labelView, "setCenterText:", v4);
  v5 = 0.0;
  v6 = 0.0;
  if (self->_imageView)
  {
    -[TPLCDView _imageViewFrame](self, "_imageViewFrame");
    v6 = v7;
    -[TPLCDSubImageView setFrame:](self->_imageView, "setFrame:");
  }
  if (self->_textView)
  {
    -[TPLCDView textFrame](self, "textFrame");
    v5 = v8;
    -[TPLCDTextView setFrame:](self->_textView, "setFrame:");
  }
  if (self->_labelView)
  {
    -[TPLCDView _labelFrame](self, "_labelFrame");
    v10 = v9;
    -[TPLCDTextView setFrame:](self->_labelView, "setFrame:");
  }
  else
  {
    v10 = 0.0;
  }
  if (-[TPLCDView shouldCenterContentView](self, "shouldCenterContentView"))
  {
    -[UIView frame](self->_contentView, "frame");
    v12 = v11;
    v14 = v13;
    if (v5 >= v10)
      v15 = v5;
    else
      v15 = v10;
    v16 = v6 + v15 + 40.0;
    -[TPLCDView bounds](self, "bounds");
    -[UIView setFrame:](self->_contentView, "setFrame:", floor((v17 - v16) * 0.5), v12, v16, v14);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPLCDView;
  -[TPLCDView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[TPLCDView setNeedsLayout](self, "setNeedsLayout");
}

- (void)didFinishAnimatingLCDLabelFadeOut:(id)a3 finished:(id)a4 context:(id)a5
{
  objc_msgSend(a5, "removeFromSuperview", a3, a4);
}

- (void)setLabelFontSize:(double)a3
{
  TPLCDTextView *labelView;
  id v4;

  labelView = self->_labelView;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TPLCDTextView setFont:](labelView, "setFont:", v4);

}

- (void)setLabel:(id)a3
{
  -[TPLCDView setLabel:animate:](self, "setLabel:animate:", a3, 0);
}

- (void)setLabel:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  TPLCDTextView *labelView;
  uint64_t v7;
  TPLCDTextView *v8;
  TPLCDTextView *v9;
  TPLCDTextView *v10;
  TPLCDTextView *v11;
  void *v12;
  void *v13;
  TPLCDTextView *v14;
  TPLCDTextView *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  -[TPLCDView _resetContentViewFrame](self, "_resetContentViewFrame");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "beginAnimations:context:", CFSTR("lcdViewFadeLabelOut"), self->_labelView);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationDuration:", 0.5);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationDidStopSelector:", sel_didFinishAnimatingLCDLabelFadeOut_finished_context_);
    -[TPLCDTextView setAlpha:](self->_labelView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0DC3F10], "endAnimations");
    labelView = self->_labelView;
    self->_labelView = 0;

  }
  v7 = objc_msgSend(v16, "length");
  v8 = self->_labelView;
  if (v7)
  {
    if (!v8)
    {
      v9 = objc_alloc_init(TPLCDTextView);
      v10 = self->_labelView;
      self->_labelView = v9;

      v11 = self->_labelView;
      v12 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend((id)objc_opt_class(), "defaultLabelFontSize");
      objc_msgSend(v12, "systemFontOfSize:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPLCDTextView setLCDTextFont:](v11, "setLCDTextFont:", v13);

      -[TPLCDTextView setMinimumFontSize:](self->_labelView, "setMinimumFontSize:", 14.0);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_labelView);
      v8 = self->_labelView;
    }
    -[TPLCDTextView setText:](v8, "setText:", v16);
  }
  else if (v8)
  {
    -[TPLCDTextView removeFromSuperview](v8, "removeFromSuperview");
    v14 = self->_labelView;
    self->_labelView = 0;

  }
  if (v4)
  {
    v15 = self->_labelView;
    if (v15)
    {
      -[TPLCDTextView setAlpha:](v15, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0DC3F10], "beginAnimations:", CFSTR("lcdViewFadeLabelIn"));
      objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationDuration:", 0.5);
      -[TPLCDTextView setAlpha:](self->_labelView, "setAlpha:", 1.0);
      objc_msgSend(MEMORY[0x1E0DC3F10], "endAnimations");
    }
  }
  -[TPLCDView layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)label
{
  return -[TPLCDTextView text](self->_labelView, "text");
}

- (void)blinkLabel
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CD2798], "animation");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyPath:", CFSTR("hidden"));
  v3 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v4) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v8);

  v9 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v10) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v11, v13, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyTimes:", v16);

  objc_msgSend(v18, "setDuration:", 0.3);
  objc_msgSend(v18, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  LODWORD(v17) = 3.0;
  objc_msgSend(v18, "setRepeatCount:", v17);
  -[TPLCDTextView addAnimation:forKey:](self->_labelView, "addAnimation:forKey:", v18, CFSTR("hidden"));

}

- (void)setSubImage:(id)a3
{
  TPLCDSubImageView *imageView;
  TPLCDSubImageView *v5;
  TPLCDSubImageView *v6;
  TPLCDSubImageView *v7;
  id v8;

  v8 = a3;
  -[TPLCDView _resetContentViewFrame](self, "_resetContentViewFrame");
  imageView = self->_imageView;
  if (v8 && !imageView)
  {
    v5 = -[TPLCDSubImageView initWithDefaultSize]([TPLCDSubImageView alloc], "initWithDefaultSize");
    v6 = self->_imageView;
    self->_imageView = v5;

    -[UIView addSubview:](self->_contentView, "addSubview:", self->_imageView);
    imageView = self->_imageView;
LABEL_5:
    -[TPLCDSubImageView setAutoresizingMask:](imageView, "setAutoresizingMask:", 41);
    -[TPLCDSubImageView setImage:](self->_imageView, "setImage:", v8);
    goto LABEL_6;
  }
  if (v8)
    goto LABEL_5;
  if (imageView)
  {
    -[TPLCDSubImageView removeFromSuperview](imageView, "removeFromSuperview");
    v7 = self->_imageView;
    self->_imageView = 0;

  }
LABEL_6:
  -[TPLCDView layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)subImage
{
  return -[TPLCDSubImageView image](self->_imageView, "image");
}

- (void)setShadowColor:(id)a3
{
  TPLCDTextView *textView;
  id v5;

  textView = self->_textView;
  v5 = a3;
  -[TPLCDTextView setShadowColor:](textView, "setShadowColor:", v5);
  -[TPLCDTextView setShadowColor:](self->_labelView, "setShadowColor:", v5);

}

- (void)setLayoutAsLabelled:(BOOL)a3
{
  char v3;
  TPLCDTextView *labelView;

  v3 = *((_BYTE *)self + 456);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 456) = v3 & 0xFE | a3;
    if (!a3)
    {
      -[TPLCDTextView removeFromSuperview](self->_labelView, "removeFromSuperview");
      labelView = self->_labelView;
      self->_labelView = 0;

    }
    -[TPLCDView layoutIfNeeded](self, "layoutIfNeeded");
    -[TPLCDView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)secondLineText
{
  return 0;
}

- (BOOL)verticallyCenterTextViewIfLabelless
{
  return self->_verticallyCenterTextViewIfLabelless;
}

- (void)setVerticallyCenterTextViewIfLabelless:(BOOL)a3
{
  self->_verticallyCenterTextViewIfLabelless = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
