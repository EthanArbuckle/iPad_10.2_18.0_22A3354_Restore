@implementation PGPrerollIndicatorView

+ (double)preferredHeight
{
  return 21.0;
}

- (PGPrerollIndicatorView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PGPrerollIndicatorView *v11;
  PGPrerollIndicatorView *v12;
  PGDisplayLink *v13;
  PGDisplayLink *displayLink;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGPrerollIndicatorView;
  v11 = -[PGPrerollIndicatorView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a4);
    v13 = -[PGDisplayLink initWithOwner:linkFired:]([PGDisplayLink alloc], "initWithOwner:linkFired:", v12, &__block_literal_global_4);
    displayLink = v12->_displayLink;
    v12->_displayLink = v13;

    -[PGPrerollIndicatorView updateValues](v12, "updateValues");
    -[PGButtonView sizeToFit](v12->_skipPrerollButtonView, "sizeToFit");
  }

  return v12;
}

uint64_t __50__PGPrerollIndicatorView_initWithFrame_viewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateValues");
}

- (void)dealloc
{
  objc_super v3;

  -[PGDisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PGPrerollIndicatorView;
  -[PGPrerollIndicatorView dealloc](&v3, sel_dealloc);
}

- (void)updateValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  PGPrerollIndicatorView *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;

  -[PGPrerollIndicatorView viewModel](self, "viewModel");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isPrerollActive"))
  {
    v7 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "prerollAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentType");
  if (v5 == 2)
  {
    v6 = CFSTR("SPONSORED_PREROLL_LABEL");
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    v6 = CFSTR("AD_PREROLL_LABEL");
LABEL_7:
    PGLocalizedString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPrerollIndicatorView setLabelText:](self, "setLabelText:", v8);

  }
  if (objc_msgSend(v18, "secondsUntilPrerollSkippable") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PGButtonView setHidden:](self->_skipPrerollButtonView, "setHidden:", 1);
  }
  else
  {
    v9 = objc_msgSend(v18, "secondsUntilPrerollSkippable");
    if (v9 < 1)
    {
      PGLocalizedString(CFSTR("SKIP_PREROLL"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = &stru_1E6231540;
      v14 = self;
    }
    else
    {
      v10 = v9;
      v11 = (void *)MEMORY[0x1E0CB3940];
      PGLocalizedString(CFSTR("SKIP_PREROLL_IN_N_SECONDS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v10);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v14 = self;
      v15 = v13;
    }
    -[PGPrerollIndicatorView setTimeRemainingText:](v14, "setTimeRemainingText:", v15);
    -[PGButtonView setAccessibilityIdentifier:](self->_skipPrerollButtonView, "setAccessibilityIdentifier:", v13);
    -[PGButtonView setHidden:](self->_skipPrerollButtonView, "setHidden:", 0);

  }
  -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prerollTintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v7 = 10;
LABEL_15:
  -[PGDisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", v7);

}

- (NSString)labelText
{
  void *v2;
  void *v3;

  -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLabelText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  UILabel *v9;
  UILabel *contentTypeLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  _OWORD v24[3];

  v4 = a3;
  -[PGPrerollIndicatorView labelText](self, "labelText");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[PGPrerollIndicatorView labelText](self, "labelText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if ((v8 & 1) == 0)
    {
      if (!self->_contentTypeLabel)
      {
        v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        contentTypeLabel = self->_contentTypeLabel;
        self->_contentTypeLabel = v9;

        v11 = self->_contentTypeLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v11, "setTextColor:", v12);

        v13 = self->_contentTypeLabel;
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5F8]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v13, "setFont:", v14);

        -[UILabel layer](self->_contentTypeLabel, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

        -[UILabel layer](self->_contentTypeLabel, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCornerRadius:", 6.0);

        -[UILabel setTextAlignment:](self->_contentTypeLabel, "setTextAlignment:", 1);
        -[UILabel setClipsToBounds:](self->_contentTypeLabel, "setClipsToBounds:", 1);
        -[PGPrerollIndicatorView addSubview:](self, "addSubview:", self->_contentTypeLabel);
        -[UILabel setUserInteractionEnabled:](self->_contentTypeLabel, "setUserInteractionEnabled:", 0);
        -[UIView PG_recursivelyDisallowGroupBlending](self, "PG_recursivelyDisallowGroupBlending");
      }
      -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v24[0] = *MEMORY[0x1E0C9BAA8];
      v24[1] = v18;
      v24[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v17, "setTransform:", v24);

      -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v4);

      -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sizeToFit");

      -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      -[PGPrerollIndicatorView setLabelSize:](self, "setLabelSize:", v22, v23);

      -[PGPrerollIndicatorView _layoutContentTypeLabel](self, "_layoutContentTypeLabel");
    }
  }

}

- (NSString)timeRemainingText
{
  return -[PGButtonView text](self->_skipPrerollButtonView, "text");
}

- (void)setTimeRemainingText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PGButtonView *skipPrerollButtonView;
  PGButtonView *v8;
  PGButtonView *v9;
  PGButtonView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  PGButtonView *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGPrerollIndicatorView timeRemainingText](self, "timeRemainingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {

  }
  else
  {
    -[PGPrerollIndicatorView timeRemainingText](self, "timeRemainingText");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      skipPrerollButtonView = self->_skipPrerollButtonView;
      if (!skipPrerollButtonView)
      {
        +[PGButtonView buttonWithDelegate:](PGButtonView, "buttonWithDelegate:", self);
        v8 = (PGButtonView *)objc_claimAutoreleasedReturnValue();
        v9 = self->_skipPrerollButtonView;
        self->_skipPrerollButtonView = v8;

        v10 = self->_skipPrerollButtonView;
        +[PGButtonView disabledTintColor](PGButtonView, "disabledTintColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGButtonView setTintColor:](v10, "setTintColor:", v11);

        -[PGButtonView setEnabled:](self->_skipPrerollButtonView, "setEnabled:", 0);
        -[PGButtonView setGlyphSize:](self->_skipPrerollButtonView, "setGlyphSize:", 10.5);
        -[PGMaterialView _setContinuousCornerRadius:](self->_skipPrerollButtonView, "_setContinuousCornerRadius:", 6.0);
        -[PGButtonView setSystemImageName:](self->_skipPrerollButtonView, "setSystemImageName:", CFSTR("forward.end.fill"));
        -[PGMaterialView setBackgroundColor:](self->_skipPrerollButtonView, "setBackgroundColor:", 0);
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 13.0, *MEMORY[0x1E0CEB5E8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *MEMORY[0x1E0CEB518];
        v26[0] = *MEMORY[0x1E0CEB520];
        v26[1] = v13;
        v27[0] = &unk_1E6242768;
        v27[1] = &unk_1E6242780;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "fontDescriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x1E0CEB4E0];
        v24[0] = *MEMORY[0x1E0CEB4D0];
        v24[1] = v17;
        v25[0] = v15;
        v25[1] = &unk_1E62429D8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fontDescriptorByAddingAttributes:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v19, 13.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGButtonView setFont:](self->_skipPrerollButtonView, "setFont:", v20);
        -[PGPrerollIndicatorView addSubview:](self, "addSubview:", self->_skipPrerollButtonView);
        -[UIView PG_recursivelyDisallowGroupBlending](self, "PG_recursivelyDisallowGroupBlending");

        skipPrerollButtonView = self->_skipPrerollButtonView;
      }
      -[PGButtonView setText:](skipPrerollButtonView, "setText:", v4);
      -[PGButtonView sizeToFit](self->_skipPrerollButtonView, "sizeToFit");
      v21 = -[PGControlsViewModel isPrerollSkippable](self->_viewModel, "isPrerollSkippable");
      -[PGButtonView setEnabled:](self->_skipPrerollButtonView, "setEnabled:", v21);
      v22 = self->_skipPrerollButtonView;
      if (v21)
        -[PGButtonView enabledTintColor](self->_skipPrerollButtonView, "enabledTintColor");
      else
        +[PGButtonView disabledTintColor](PGButtonView, "disabledTintColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGButtonView setTintColor:](v22, "setTintColor:", v23);

      -[PGPrerollIndicatorView _layoutSkipPrerollButton](self, "_layoutSkipPrerollButton");
    }
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PGPrerollIndicatorView *v5;
  PGPrerollIndicatorView *v6;
  PGPrerollIndicatorView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGPrerollIndicatorView;
  -[PGPrerollIndicatorView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PGPrerollIndicatorView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGPrerollIndicatorView;
  -[PGPrerollIndicatorView layoutSubviews](&v3, sel_layoutSubviews);
  -[PGPrerollIndicatorView _layoutContentTypeLabel](self, "_layoutContentTypeLabel");
  -[PGPrerollIndicatorView _layoutSkipPrerollButton](self, "_layoutSkipPrerollButton");
}

- (double)labelWidth
{
  CGRect v3;

  -[UILabel frame](self->_contentTypeLabel, "frame");
  return CGRectGetWidth(v3);
}

- (void)buttonViewDidReceiveTouchUpInside:(id)a3
{
  id v3;

  -[PGPrerollIndicatorView viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleSkipPrerollButtonTapped");

}

- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  MaxX = CGRectGetMaxX(a4);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v10 = MaxX - CGRectGetWidth(v14);
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double v8;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  v8 = 6.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = v8;
  return result;
}

- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  objc_msgSend(a3, "text", a4.top, a4.left, a4.bottom, a4.right);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = 9.0;
  else
    v5 = 6.0;

  v6 = 0.0;
  v7 = 0.0;
  v8 = 6.0;
  v9 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v9;
  result.top = v6;
  return result;
}

- (CGAffineTransform)_subviewTransform
{
  double Height;
  CGAffineTransform *result;
  double v6;
  double v7;
  uint64_t v8;
  __int128 v9;
  CGRect v10;

  -[PGPrerollIndicatorView bounds](self, "bounds");
  Height = CGRectGetHeight(v10);
  result = (CGAffineTransform *)objc_msgSend((id)objc_opt_class(), "preferredHeight");
  v7 = Height / v6;
  if (v7 > 1.0)
    v7 = 1.0;
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  if (v7 != 1.0)
    return CGAffineTransformMakeScale(retstr, v7, v7);
  return result;
}

- (void)_layoutContentTypeLabel
{
  UILabel *contentTypeLabel;
  __int128 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *v11;
  uint64_t v12;
  _OWORD v13[3];

  contentTypeLabel = self->_contentTypeLabel;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v4;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UILabel setTransform:](contentTypeLabel, "setTransform:", v13);
  -[PGPrerollIndicatorView contentTypeLabel](self, "contentTypeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  v9 = v8;
  -[PGPrerollIndicatorView labelSize](self, "labelSize");
  -[UILabel setFrame:](self->_contentTypeLabel, "setFrame:", v6, v7, v10 + 12.0, v9);
  v11 = self->_contentTypeLabel;
  -[PGPrerollIndicatorView _subviewTransform](self, "_subviewTransform");
  -[UILabel setTransform:](v11, "setTransform:", &v12);
  -[UILabel setFrameOrigin:](self->_contentTypeLabel, "setFrameOrigin:", v6, v7);
}

- (void)_layoutSkipPrerollButton
{
  PGButtonView *skipPrerollButtonView;
  __int128 v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double MaxX;
  double v14;
  double v15;
  PGButtonView *v16;
  PGButtonView *v17;
  double v18;
  uint64_t v19;
  _OWORD v20[3];
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  skipPrerollButtonView = self->_skipPrerollButtonView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v20[0] = *MEMORY[0x1E0C9BAA8];
  v20[1] = v4;
  v20[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PGButtonView setTransform:](skipPrerollButtonView, "setTransform:", v20);
  -[PGButtonView sizeToFit](self->_skipPrerollButtonView, "sizeToFit");
  -[PGButtonView frame](self->_skipPrerollButtonView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PGPrerollIndicatorView bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v14 = MaxX - CGRectGetWidth(v22);
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  -[PGButtonView setFrame:](self->_skipPrerollButtonView, "setFrame:", v14, 0.0, v10, v15);
  v16 = self->_skipPrerollButtonView;
  -[PGPrerollIndicatorView _subviewTransform](self, "_subviewTransform");
  -[PGButtonView setTransform:](v16, "setTransform:", &v19);
  v17 = self->_skipPrerollButtonView;
  -[PGPrerollIndicatorView bounds](self, "bounds");
  v18 = CGRectGetMaxX(v23);
  -[PGButtonView frame](self->_skipPrerollButtonView, "frame");
  -[PGButtonView setFrameOrigin:](v17, "setFrameOrigin:", v18 - CGRectGetWidth(v24), 0.0);
}

- (PGControlsViewModel)viewModel
{
  return self->_viewModel;
}

- (UILabel)contentTypeLabel
{
  return self->_contentTypeLabel;
}

- (PGButtonView)skipPrerollButtonView
{
  return self->_skipPrerollButtonView;
}

- (CGSize)labelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_labelSize.width;
  height = self->_labelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLabelSize:(CGSize)a3
{
  self->_labelSize = a3;
}

- (PGDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_skipPrerollButtonView, 0);
  objc_storeStrong((id *)&self->_contentTypeLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
