@implementation TUICandidateBackdropView

- (TUICandidateBackdropView)initWithFrame:(CGRect)a3
{
  TUICandidateBackdropView *v3;
  TUICandidateBackdropView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateBackdropView;
  v3 = -[TUICandidateBackdropView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateBackdropView commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateBackdropView)initWithCoder:(id)a3
{
  TUICandidateBackdropView *v3;
  TUICandidateBackdropView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateBackdropView;
  v3 = -[TUICandidateBackdropView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateBackdropView commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUICandidateBackdropView;
  -[TUICandidateBackdropView layoutSubviews](&v12, sel_layoutSubviews);
  -[TUICandidateBackdropView backdropView](self, "backdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC38D8]);
    -[TUICandidateBackdropView bounds](self, "bounds");
    v9 = (void *)objc_msgSend(v4, "initWithFrame:style:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"), v5, v6, v7, v8);
    -[TUICandidateBackdropView setBackdropView:](self, "setBackdropView:", v9);

    -[TUICandidateBackdropView backdropView](self, "backdropView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateBackdropView addSubview:](self, "addSubview:", v10);

    -[TUICandidateBackdropView backdropView](self, "backdropView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizingMask:", 18);

  }
}

- (int64_t)backdropViewStyle
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[TUICandidateBackdropView style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "darkBackdrop"))
    v4 = 2030;
  else
    v4 = 3901;

  -[TUICandidateBackdropView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUICandidateBackdropView _inheritedRenderConfig](self, "_inheritedRenderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "backdropStyle");

    if (v4 == 3904)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        -[TUICandidateBackdropView style](self, "style");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "columnsCount");

        if (v8)
          return 3905;
        else
          return 3903;
      }
      else
      {
        return 3903;
      }
    }
  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUICandidateBackdropView;
  -[TUICandidateBackdropView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[TUICandidateBackdropView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUICandidateBackdropView backdropView](self, "backdropView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));

  }
}

- (void)setStyle:(id)a3
{
  id v3;
  TUICandidateViewStyle *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = a3;
  v5 = self->_style;
  objc_storeStrong((id *)&self->_style, v3);
  LODWORD(v3) = -[TUICandidateViewStyle darkBackdrop](v5, "darkBackdrop");
  if ((_DWORD)v3 != objc_msgSend(v8, "darkBackdrop")
    || (v6 = objc_msgSend(v8, "columnsCount"), v6 != -[TUICandidateViewStyle columnsCount](v5, "columnsCount")))
  {
    -[TUICandidateBackdropView backdropView](self, "backdropView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));

  }
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUICandidateBackdropView;
  v4 = a3;
  -[TUICandidateBackdropView _setRenderConfig:](&v7, sel__setRenderConfig_, v4);
  v5 = objc_msgSend(v4, "animatedBackground", v7.receiver, v7.super_class);

  if (v5)
  {
    -[TUICandidateBackdropView backdropView](self, "backdropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionToStyle:", -[TUICandidateBackdropView backdropViewStyle](self, "backdropViewStyle"));

  }
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
