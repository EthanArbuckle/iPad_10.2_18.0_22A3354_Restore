@implementation VUIAppLoadingViewController

- (void)setView:(id)a3
{
  UIView *v4;
  UIView *v5;
  UIView *parentView;
  UIView *v7;
  VUIAppSpinnerView *v8;
  VUIAppSpinnerView *loadingView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIView *principalView;
  objc_super v27;

  v4 = (UIView *)a3;
  if (!self->_parentView)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    parentView = self->_parentView;
    self->_parentView = v5;

    -[UIView setAutoresizingMask:](self->_parentView, "setAutoresizingMask:", 18);
    v7 = self->_parentView;
    v27.receiver = self;
    v27.super_class = (Class)VUIAppLoadingViewController;
    -[VUIAppLoadingViewController setView:](&v27, sel_setView_, v7);
  }
  if (!self->_loadingView)
  {
    v8 = objc_alloc_init(VUIAppSpinnerView);
    loadingView = self->_loadingView;
    self->_loadingView = v8;

    -[VUIAppSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self->_parentView, "addSubview:", self->_loadingView);
    -[VUIAppSpinnerView leadingAnchor](self->_loadingView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppLoadingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[VUIAppSpinnerView topAnchor](self->_loadingView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppLoadingViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[VUIAppSpinnerView trailingAnchor](self->_loadingView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppLoadingViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[VUIAppSpinnerView bottomAnchor](self->_loadingView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppLoadingViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[VUIAppSpinnerView setAlpha:](self->_loadingView, "setAlpha:", 0.0);
  }
  -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_parentView, "addSubview:", v4);
  principalView = self->_principalView;
  self->_principalView = v4;

}

- (void)setLoading:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD block[5];

  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (a3)
    {
      v4 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke;
      block[3] = &unk_1E9F98DF0;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);
      -[UIView setAlpha:](self->_principalView, "setAlpha:", 0.0);
    }
    else
    {
      self->_cancelLoading = 1;
      v5[4] = self;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_4;
      v6[3] = &unk_1E9F98DF0;
      v6[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_5;
      v5[3] = &unk_1E9F9B4F8;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v6, v5, 0.25);
    }
  }
}

_BYTE *__42__VUIAppLoadingViewController_setLoading___block_invoke(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;

  result = *(_BYTE **)(a1 + 32);
  if (!result[992])
  {
    objc_msgSend(result, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_2;
    v5[3] = &unk_1E9F98DF0;
    v6 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__VUIAppLoadingViewController_setLoading___block_invoke_3;
    v4[3] = &unk_1E9F9B4F8;
    v4[4] = v6;
    return (_BYTE *)objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.25);
  }
  return result;
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", 1.0);
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

uint64_t __42__VUIAppLoadingViewController_setLoading___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968));

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
}

- (BOOL)loading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
