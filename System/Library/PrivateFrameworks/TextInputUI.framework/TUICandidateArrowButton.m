@implementation TUICandidateArrowButton

- (void)commonInit
{
  id v3;
  UIView *v4;
  UIView *contentView;
  id v6;
  UIView *v7;
  UIView *backgroundView;
  id v9;
  UIView *v10;
  UIView *highlightBackgroundView;
  TUICandidateBackdropView *v12;
  TUICandidateBackdropView *v13;
  TUICandidateBackdropView *backdropView;
  NSString *arrowImageName;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[TUICandidateArrowButton bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  contentView = self->_contentView;
  self->_contentView = v4;

  -[UIView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", 0);
  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[TUICandidateArrowButton bounds](self, "bounds");
  v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[TUICandidateArrowButton bounds](self, "bounds");
  v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  highlightBackgroundView = self->_highlightBackgroundView;
  self->_highlightBackgroundView = v10;

  -[UIView setUserInteractionEnabled:](self->_highlightBackgroundView, "setUserInteractionEnabled:", 0);
  v12 = [TUICandidateBackdropView alloc];
  -[TUICandidateArrowButton bounds](self, "bounds");
  v13 = -[TUICandidateBackdropView initWithFrame:](v12, "initWithFrame:");
  backdropView = self->_backdropView;
  self->_backdropView = v13;

  -[TUICandidateBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
  -[TUICandidateBackdropView setAutoresizingMask:](self->_backdropView, "setAutoresizingMask:", 18);
  arrowImageName = self->_arrowImageName;
  self->_arrowImageName = (NSString *)CFSTR("kb-extend-arrow");

  -[TUICandidateArrowButton setArrowDirection:](self, "setArrowDirection:", 0);
  -[TUICandidateArrowButton setShowsBackground:](self, "setShowsBackground:", 1);
  -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_highlightBackgroundView, 0);
  -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_backgroundView, 0);
  -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_backdropView, 0);
  -[TUICandidateArrowButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0);
}

- (TUICandidateArrowButton)initWithFrame:(CGRect)a3
{
  TUICandidateArrowButton *v3;
  TUICandidateArrowButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateArrowButton;
  v3 = -[TUICandidateArrowButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateArrowButton commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateArrowButton)initWithCoder:(id)a3
{
  TUICandidateArrowButton *v3;
  TUICandidateArrowButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateArrowButton;
  v3 = -[TUICandidateArrowButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateArrowButton commonInit](v3, "commonInit");
  return v4;
}

- (void)setShowsBackground:(BOOL)a3
{
  if (self->_showsBackground != a3)
  {
    self->_showsBackground = a3;
    -[TUICandidateArrowButton updateStyle](self, "updateStyle");
  }
}

- (BOOL)isTextEffectsButton
{
  void *v2;
  void *v3;
  char v4;

  -[TUICandidateArrowButton style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrowButtonImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("character.motion"));

  return v4;
}

- (void)layoutSubviews
{
  UIView *contentView;
  void *v4;
  UIView *v5;
  void *v6;
  UIView *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)TUICandidateArrowButton;
  -[TUICandidateArrowButton layoutSubviews](&v36, sel_layoutSubviews);
  contentView = self->_contentView;
  -[TUICandidateArrowButton highlightBackgroundView](self, "highlightBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](contentView, "sendSubviewToBack:", v4);

  v5 = self->_contentView;
  -[TUICandidateArrowButton backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](v5, "sendSubviewToBack:", v6);

  v7 = self->_contentView;
  -[TUICandidateArrowButton backdropView](self, "backdropView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](v7, "sendSubviewToBack:", v8);

  -[TUICandidateArrowButton contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateArrowButton sendSubviewToBack:](self, "sendSubviewToBack:", v9);

  -[TUICandidateArrowButton bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[TUICandidateArrowButton style](self, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrowButtonPadding");
  v20 = v11 + v19;
  v22 = v13 + v21;
  v24 = v15 - (v19 + v23);
  v26 = v17 - (v21 + v25);

  -[TUICandidateArrowButton bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v20, v22, v24, v26);
  -[UIView setFrame:](self->_highlightBackgroundView, "setFrame:", v20, v22, v24, v26);
  if (-[TUICandidateArrowButton isTextEffectsButton](self, "isTextEffectsButton"))
    v27 = 4.0;
  else
    v27 = 0.0;
  -[TUICandidateArrowButton arrowImageOffset](self, "arrowImageOffset");
  v29 = v20 + v24 * 0.5 + v28;
  -[TUICandidateArrowButton arrowImageOffset](self, "arrowImageOffset");
  v31 = v27 + v22 + v26 * 0.5 + v30;
  -[TUICandidateArrowButton imageView](self, "imageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v29, v31);

  -[TUICandidateArrowButton imageViewAlpha](self, "imageViewAlpha");
  v34 = v33;
  -[TUICandidateArrowButton imageView](self, "imageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v34);

}

- (void)setStyle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    objc_msgSend(v16, "arrowButtonImageName");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_4;
    v6 = (void *)v5;
    -[TUICandidateArrowButton arrowImageName](self, "arrowImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrowButtonImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      -[TUICandidateArrowButton originalArrowImageName](self, "originalArrowImageName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[TUICandidateArrowButton arrowImageName](self, "arrowImageName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUICandidateArrowButton setOriginalArrowImageName:](self, "setOriginalArrowImageName:", v12);

      }
      objc_msgSend(v16, "arrowButtonImageName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateArrowButton setArrowImageName:](self, "setArrowImageName:", v13);

    }
    else
    {
LABEL_4:
      objc_msgSend(v16, "arrowButtonImageName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

      }
      else
      {
        -[TUICandidateArrowButton originalArrowImageName](self, "originalArrowImageName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[TUICandidateArrowButton originalArrowImageName](self, "originalArrowImageName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUICandidateArrowButton setArrowImageName:](self, "setArrowImageName:", v15);

          -[TUICandidateArrowButton setOriginalArrowImageName:](self, "setOriginalArrowImageName:", 0);
        }
      }
    }
    -[TUICandidateArrowButton updateStyle](self, "updateStyle");
  }

}

- (void)setArrowImageName:(id)a3
{
  NSString *v4;
  NSString *arrowImageName;

  if (self->_arrowImageName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    arrowImageName = self->_arrowImageName;
    self->_arrowImageName = v4;

    -[TUICandidateArrowButton updateStyle](self, "updateStyle");
  }
}

- (void)setArrowDirection:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_arrowDirection != a3)
  {
    self->_arrowDirection = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __45__TUICandidateArrowButton_setArrowDirection___block_invoke;
    v3[3] = &unk_1E24FC068;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICandidateArrowButton;
  -[TUICandidateArrowButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[TUICandidateArrowButton udpateBackgroundColor](self, "udpateBackgroundColor");
}

- (void)udpateBackgroundColor
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (double)-[TUICandidateArrowButton showsBackground](self, "showsBackground");
  -[TUICandidateArrowButton backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  v5 = (double)-[TUICandidateArrowButton showsBackground](self, "showsBackground");
  -[TUICandidateArrowButton backdropView](self, "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  v7 = (double)-[TUICandidateArrowButton isHighlighted](self, "isHighlighted");
  -[TUICandidateArrowButton highlightBackgroundView](self, "highlightBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  -[TUICandidateArrowButton style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  -[TUICandidateArrowButton style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "arrowButtonHighlightBackgroundHidden");

  if (v11)
  {
    -[TUICandidateArrowButton highlightBackgroundView](self, "highlightBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);
LABEL_4:

  }
  -[TUICandidateArrowButton style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "highlightedBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateArrowButton highlightBackgroundView](self, "highlightBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[TUICandidateArrowButton style](self, "style");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrowButtonBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateArrowButton backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

}

- (double)imageViewAlpha
{
  void *v3;
  double v4;
  double v5;
  int v6;
  double v7;
  double v8;

  -[TUICandidateArrowButton style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "foregroundOpacity");
  v5 = v4;
  v6 = -[TUICandidateArrowButton isEnabled](self, "isEnabled");
  v7 = 0.35;
  if (v6)
    v7 = 1.0;
  v8 = v5 * v7;

  return v8;
}

- (id)rotatedImageForImage:(id)a3 scale:(double)a4
{
  id v6;
  int64_t v7;
  id v8;
  id v9;
  uint64_t v10;

  v6 = a3;
  v7 = -[TUICandidateArrowButton arrowDirection](self, "arrowDirection");
  v8 = objc_alloc(MEMORY[0x1E0DC3870]);
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "CGImage");

  return (id)objc_msgSend(v8, "initWithCGImage:scale:orientation:", v10, v7, a4);
}

- (void)updateStyle
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;

  -[TUICandidateArrowButton style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[TUICandidateArrowButton style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateArrowButton style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performSelector:", sel_arrowButtonColor);
    v7 = objc_claimAutoreleasedReturnValue();

    v38 = (id)v7;
  }
  -[TUICandidateArrowButton style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateArrowButton style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrowButtonConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_7;
    -[TUICandidateArrowButton style](self, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrowButtonConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateArrowButton setConfiguration:](self, "setConfiguration:", v11);

  }
LABEL_7:
  -[TUICandidateArrowButton style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateArrowButton backdropView](self, "backdropView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStyle:", v12);

  -[TUICandidateArrowButton setTitleColor:forState:](self, "setTitleColor:forState:", v38, 0);
  -[TUICandidateArrowButton setTintColor:](self, "setTintColor:", v38);
  v14 = -[TUICandidateArrowButton isTextEffectsButton](self, "isTextEffectsButton");
  v15 = (void *)MEMORY[0x1E0DC3888];
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "performSelector:", sel_textEffectsButtonLanguageCode);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "configurationWithLocale:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v22;
      }
    }
    v23 = (void *)MEMORY[0x1E0DC3870];
    -[TUICandidateArrowButton arrowImageName](self, "arrowImageName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_systemImageNamed:withConfiguration:", v24, v16);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUICandidateArrowButton style](self, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "candidateNumberFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pointSize");
    objc_msgSend(v15, "configurationWithPointSize:weight:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC3870];
    -[TUICandidateArrowButton arrowImageName](self, "arrowImageName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemImageNamed:withConfiguration:", v29, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v30 = (void *)MEMORY[0x1E0DC3870];
      -[TUICandidateArrowButton arrowImageName](self, "arrowImageName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "kitImageNamed:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v24, "scale");
    -[TUICandidateArrowButton rotatedImageForImage:scale:](self, "rotatedImageForImage:scale:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v25;

  objc_msgSend(v32, "imageWithTintColor:renderingMode:", v38, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateArrowButton setImage:forState:](self, "setImage:forState:", v33, 0);
  objc_msgSend(v32, "imageWithTintColor:renderingMode:", v38, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateArrowButton setImage:forState:](self, "setImage:forState:", v34, 2);
  -[TUICandidateArrowButton imageViewAlpha](self, "imageViewAlpha");
  v36 = v35;
  -[TUICandidateArrowButton imageView](self, "imageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAlpha:", v36);

  -[TUICandidateArrowButton udpateBackgroundColor](self, "udpateBackgroundColor");
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (NSString)arrowImageName
{
  return self->_arrowImageName;
}

- (CGPoint)arrowImageOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_arrowImageOffset.x;
  y = self->_arrowImageOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setArrowImageOffset:(CGPoint)a3
{
  self->_arrowImageOffset = a3;
}

- (int64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)highlightBackgroundView
{
  return self->_highlightBackgroundView;
}

- (void)setHighlightBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightBackgroundView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (TUICandidateBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (NSString)originalArrowImageName
{
  return self->_originalArrowImageName;
}

- (void)setOriginalArrowImageName:(id)a3
{
  objc_storeStrong((id *)&self->_originalArrowImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalArrowImageName, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_arrowImageName, 0);
}

uint64_t __45__TUICandidateArrowButton_setArrowDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStyle");
}

@end
