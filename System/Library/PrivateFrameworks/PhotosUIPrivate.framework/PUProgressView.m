@implementation PUProgressView

- (PUProgressView)initWithStyle:(int64_t)a3
{
  PUProgressView *v4;
  PUProgressView *v5;
  uint64_t v6;
  UIActivityIndicatorView *spinner;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUProgressView;
  v4 = -[PUProgressView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v5->_spinner, "setColor:", v10);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUProgressView setBackgroundColor:](v5, "setBackgroundColor:", v11);

    }
    else
    {
      if (a3)
      {
LABEL_7:
        -[PUProgressView addSubview:](v5, "addSubview:", v5->_spinner);
        -[PUProgressView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
        return v5;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v5->_spinner, "setColor:", v8);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUProgressView setBackgroundColor:](v5, "setBackgroundColor:", v9);
    }

    goto LABEL_7;
  }
  return v5;
}

- (PUProgressView)initWithFrame:(CGRect)a3
{
  return -[PUProgressView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUProgressView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUProgressView.m"), 47, CFSTR("unsupported initializer"));

  return -[PUProgressView initWithStyle:](self, "initWithStyle:", 0);
}

- (void)showInView:(id)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL4 v6;
  id v8;
  double v9;
  _QWORD v10[5];

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "bounds");
  -[PUProgressView setFrame:](self, "setFrame:");
  objc_msgSend(v8, "addSubview:", self);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[PUProgressView setAlpha:](self, "setAlpha:", 0.0);
  v9 = 0.5;
  if (!v6)
    v9 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PUProgressView_showInView_animated_afterDelay___block_invoke;
  v10[3] = &unk_1E58ABD10;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v10, 0, v9, a5);
}

- (void)hideAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = 0.0;
  if (a3)
    v3 = 0.5;
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__PUProgressView_hideAnimated___block_invoke;
  v5[3] = &unk_1E58ABD10;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__PUProgressView_hideAnimated___block_invoke_2;
  v4[3] = &unk_1E58A9910;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v5, v4, v3, 0.0);
}

- (void)layoutSubviews
{
  UIActivityIndicatorView *spinner;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUProgressView;
  -[PUProgressView layoutSubviews](&v4, sel_layoutSubviews);
  spinner = self->_spinner;
  -[PUProgressView center](self, "center");
  -[UIActivityIndicatorView setCenter:](spinner, "setCenter:");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

uint64_t __31__PUProgressView_hideAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __31__PUProgressView_hideAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "stopAnimating");
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __49__PUProgressView_showInView_animated_afterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
