@implementation VideosExtrasLoadingView

- (VideosExtrasLoadingView)initWithDocument:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  VideosExtrasLoadingView *v12;
  id *p_isa;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  VideosExtrasActivityIndicator *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  VideosExtrasLoadingView *v26;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v28.receiver = self;
    v28.super_class = (Class)VideosExtrasLoadingView;
    v12 = -[VideosExtrasLoadingView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    p_isa = (id *)&v12->super.super.super.isa;
    if (v12)
    {
      -[VideosExtrasLoadingView setOpaque:](v12, "setOpaque:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setBackgroundColor:", v14);

      objc_msgSend(p_isa, "setAutoresizingMask:", 18);
      objc_msgSend(p_isa, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(p_isa, "setHidden:", 1);
      objc_storeWeak(p_isa + 55, v11);
      objc_storeStrong(p_isa + 52, a3);
      objc_msgSend(p_isa[52], "setDelegate:", p_isa);
      v15 = objc_msgSend(v10, "copy");
      v16 = p_isa[53];
      p_isa[53] = (id)v15;

      objc_msgSend(v9, "templateElement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_storeStrong(p_isa + 52, a3);
        objc_storeStrong(p_isa + 53, a4);
        objc_msgSend(v9, "setDelegate:", p_isa);
        objc_msgSend(v9, "templateElement");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "activityElement");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = -[VideosExtrasActivityIndicator initWithElement:]([VideosExtrasActivityIndicator alloc], "initWithElement:", v20);
            v22 = p_isa[54];
            p_isa[54] = v21;

            objc_msgSend(p_isa[54], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(p_isa[54], "setAlpha:", 0.0);
            objc_msgSend(p_isa, "addSubview:", p_isa[54]);
          }
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", p_isa[54], 9, 0, p_isa, 9, 1.0, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", p_isa[54], 10, 0, p_isa, 10, 1.0, 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v23;
      v29[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "addConstraints:", v25);

    }
    self = p_isa;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)startCountdownToVisibilityWithInterval:(double)a3
{
  -[VideosExtrasLoadingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__show, 0, a3);
}

- (void)cancelCountdownToVisibility
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__show, 0);
}

- (void)_show
{
  _QWORD v3[5];

  -[VideosExtrasLoadingView setHidden:](self, "setHidden:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__VideosExtrasLoadingView__show__block_invoke;
  v3[3] = &unk_1E9F98DF0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.150000006);
}

void __32__VideosExtrasLoadingView__show__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

- (void)documentDidUpdate:(id)a3
{
  VideosExtrasLoadingViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "loadingView:documentDidUpdate:options:", self, v5, self->_options);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
