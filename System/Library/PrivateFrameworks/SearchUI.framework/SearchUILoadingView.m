@implementation SearchUILoadingView

- (SearchUILoadingView)init
{
  SearchUILoadingView *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SearchUILoadingView;
  v2 = -[SearchUILoadingView init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setHidesWhenStopped:", 0);
    -[SearchUILoadingView setLoadingSpinner:](v2, "setLoadingSpinner:", v3);
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC1350], "_lightSystemFontOfSize:", 18.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    -[SearchUILoadingView setLoadingLabel:](v2, "setLoadingLabel:", v4);
    v6 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    v11[0] = v3;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArrangedSubviews:", v7);

    objc_msgSend(v8, "setAlignment:", 3);
    objc_msgSend(v8, "setSpacing:", 6.0);
    -[SearchUILoadingView addArrangedSubview:](v2, "addArrangedSubview:", v8);
    -[NUIContainerBoxView setVerticalAlignment:](v2, "setVerticalAlignment:", 1);
    -[NUIContainerBoxView setHorizontalAlignment:](v2, "setHorizontalAlignment:", 3);
    -[SearchUILoadingView setLayoutMarginsRelativeArrangement:](v2, "setLayoutMarginsRelativeArrangement:", 1);
    -[SearchUILoadingView setLayoutMargins:](v2, "setLayoutMargins:", 45.0, 0.0, 0.0, 0.0);
    -[SearchUILoadingView setLoadingState:](v2, "setLoadingState:", 0);

  }
  return v2;
}

- (void)setLoadingState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_loadingState = a3;
  if (a3 == 2)
  {
    -[SearchUILoadingView loadingSpinner](self, "loadingSpinner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CARD_LOADING_ERROR"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SearchUILoadingView loadingLabel](self, "loadingLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v8);

  }
  else if (a3 == 1)
  {
    -[SearchUILoadingView loadingSpinner](self, "loadingSpinner");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimating");
  }
  else
  {
    if (a3)
      return;
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CARD_LOADING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILoadingView loadingLabel](self, "loadingLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[SearchUILoadingView loadingSpinner](self, "loadingSpinner");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAnimating");
  }

}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (UIActivityIndicatorView)loadingSpinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 680, 1);
}

- (void)setLoadingSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (TLKLabel)loadingLabel
{
  return (TLKLabel *)objc_getProperty(self, a2, 688, 1);
}

- (void)setLoadingLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingSpinner, 0);
}

@end
