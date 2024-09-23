@implementation VideosExtrasActivityIndicator

- (VideosExtrasActivityIndicator)initWithElement:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  VideosExtrasActivityIndicator *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  UILabel *titleLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  UIActivityIndicatorView *spinner;
  void *v24;
  void *v25;
  UIActivityIndicatorView *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VideosExtrasActivityIndicator;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[VideosExtrasActivityIndicator initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasActivityIndicator setBackgroundColor:](v9, "setBackgroundColor:", v10);

    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
          titleLabel = v9->_titleLabel;
          v9->_titleLabel = (UILabel *)v14;

          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v16 = v9->_titleLabel;
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

          v18 = v9->_titleLabel;
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v18, "setTextColor:", v19);

          v20 = *MEMORY[0x1E0DC4A88];
          objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](v9->_titleLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v11, v21, v20);
          -[UILabel setAlpha:](v9->_titleLabel, "setAlpha:", 0.0);
          -[VideosExtrasActivityIndicator addSubview:](v9, "addSubview:", v9->_titleLabel);

        }
      }
    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 0);
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v22;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v9->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidesWhenStopped:](v9->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView startAnimating](v9->_spinner, "startAnimating");
    -[UIActivityIndicatorView setAlpha:](v9->_spinner, "setAlpha:", 0.0);
    -[VideosExtrasActivityIndicator addSubview:](v9, "addSubview:", v9->_spinner);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_spinner, 9, 0, v9, 9, 1.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v25);
    v26 = v9->_spinner;
    if (v9->_titleLabel)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v9, 3, 1.0, 0.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v27);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_titleLabel, 3, 0, v9->_spinner, 4, 1.0, 5.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v28);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_titleLabel, 9, 0, v9->_spinner, 9, 1.0, 0.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v29);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 10, 0, v9, 10, 1.0, 0.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v27);
    }

    -[VideosExtrasActivityIndicator addConstraints:](v9, "addConstraints:", v24);
  }

  return v9;
}

- (CGSize)intrinsicContentSize
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
  CGSize result;

  -[UIActivityIndicatorView intrinsicContentSize](self->_spinner, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v9 = v8 + 5.0;
  if (!self->_titleLabel)
    v9 = -0.0;
  v10 = v6 + v9;
  if (v4 >= v7)
    v7 = v4;
  v11 = v7 + 10.0;
  v12 = v10 + 10.0;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setAlpha:(double)a3
{
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:");
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
