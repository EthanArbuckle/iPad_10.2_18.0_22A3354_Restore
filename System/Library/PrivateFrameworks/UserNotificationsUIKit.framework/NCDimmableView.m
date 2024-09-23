@implementation NCDimmableView

- (void)setBackgroundDimmingView:(id)a3
{
  __int128 v4;
  _OWORD v5[3];

  objc_storeWeak((id *)&self->_backgroundDimmingView, a3);
  v4 = *(_OWORD *)&self->_transform.c;
  v5[0] = *(_OWORD *)&self->_transform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_transform.tx;
  -[NCDimmableView configureStackDimmingForTransform:](self, "configureStackDimmingForTransform:", v5);
}

- (void)setViewToFadeWhenDimming:(id)a3
{
  __int128 v4;
  _OWORD v5[3];

  objc_storeWeak((id *)&self->_viewToFadeWhenDimming, a3);
  v4 = *(_OWORD *)&self->_transform.c;
  v5[0] = *(_OWORD *)&self->_transform.a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&self->_transform.tx;
  -[NCDimmableView configureStackDimmingForTransform:](self, "configureStackDimmingForTransform:", v5);
}

- (NCDimmableView)initWithFrame:(CGRect)a3
{
  NCDimmableView *v3;
  NCDimmableView *v4;
  uint64_t v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCDimmableView;
  v3 = -[NCDimmableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCDimmableView _setIgnoresLayerTransformForSafeAreaInsets:](v3, "_setIgnoresLayerTransformForSafeAreaInsets:", 1);
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v4->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v4->_transform.c = v6;
    *(_OWORD *)&v4->_transform.tx = *(_OWORD *)(v5 + 32);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[NCDimmableView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[NCDimmableView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  NCNotificationListStackDimmingOverlayView *v10;
  NCNotificationListStackDimmingOverlayView *v11;
  NCNotificationListStackDimmingOverlayView *WeakRetained;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  __int128 v18;
  NCNotificationListStackDimmingOverlayView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  NCNotificationListStackDimmingOverlayView *v30;
  NCNotificationListStackDimmingOverlayView *stackDimmingOverlayView;
  void *v32;
  _QWORD v33[5];
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v6 = *(_OWORD *)&a3->c;
  v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tx = v5;
  -[NCDimmableView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    WeakRetained = (NCNotificationListStackDimmingOverlayView *)objc_loadWeakRetained((id *)&self->_backgroundDimmingView);
    v11 = WeakRetained;
    if (a3->a <= 0.94)
      v13 = dbl_1CFD91A50[a3->a < 0.94];
    else
      v13 = 0.0;
    *(double *)&v34 = 1.0;
    -[NCNotificationListStackDimmingOverlayView backgroundColor](WeakRetained, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 1.0;
    if (v14)
    {
      -[NCNotificationListStackDimmingOverlayView backgroundColor](v11, "backgroundColor", 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getWhite:alpha:", 0, &v34);

      v15 = *(double *)&v34;
    }
    v17 = v13 * (1.0 - v15);
    v18 = *(_OWORD *)&a3->c;
    v35 = *(_OWORD *)&a3->a;
    v36 = v18;
    v37 = *(_OWORD *)&a3->tx;
    -[NCNotificationListStackDimmingOverlayView configureStackDimmingForTransform:](v11, "configureStackDimmingForTransform:", &v35);
    if (v17 > 0.0 && !self->_stackDimmingOverlayView)
    {
      v19 = [NCNotificationListStackDimmingOverlayView alloc];
      -[NCDimmableView bounds](self, "bounds");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[NCDimmableView _effectiveContentView](self, "_effectiveContentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_continuousCornerRadius");
      v30 = -[NCNotificationListStackDimmingOverlayView initWithFrame:cornerRadius:](v19, "initWithFrame:cornerRadius:", v21, v23, v25, v27, v29);
      stackDimmingOverlayView = self->_stackDimmingOverlayView;
      self->_stackDimmingOverlayView = v30;

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __52__NCDimmableView_configureStackDimmingForTransform___block_invoke;
      v33[3] = &unk_1E8D1B568;
      v33[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v33);
    }
    -[NCNotificationListStackDimmingOverlayView setAlpha:](self->_stackDimmingOverlayView, "setAlpha:", v17);
    -[NCDimmableView viewToFadeWhenDimming](self, "viewToFadeWhenDimming");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlpha:", fmax(v13 * -2.0 + 1.0, 0.0));

    goto LABEL_13;
  }
  v9 = *(_OWORD *)&a3->c;
  v35 = *(_OWORD *)&a3->a;
  v36 = v9;
  v37 = *(_OWORD *)&a3->tx;
  objc_msgSend(v7, "configureStackDimmingForTransform:", &v35);
  v10 = self->_stackDimmingOverlayView;
  if (v10)
  {
    -[NCNotificationListStackDimmingOverlayView removeFromSuperview](v10, "removeFromSuperview");
    v11 = self->_stackDimmingOverlayView;
    self->_stackDimmingOverlayView = 0;
LABEL_13:

  }
}

uint64_t __52__NCDimmableView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[NCDimmableView _effectiveContentView](self, "_effectiveContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFitsContentWithSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width > 0.0 && height > 0.0)
  {
    -[NCDimmableView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width, 0.0);
    v6 = (double)((int)(height - v7) & ~((int)(height - v7) >> 31));
    v5 = width;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)_effectiveContentView
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (PLContentSizeManaging)contentView
{
  return (PLContentSizeManaging *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (UIView)viewToFadeWhenDimming
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToFadeWhenDimming);
}

- (NCNotificationListStackBackgroundDimmingView)backgroundDimmingView
{
  return (NCNotificationListStackBackgroundDimmingView *)objc_loadWeakRetained((id *)&self->_backgroundDimmingView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundDimmingView);
  objc_destroyWeak((id *)&self->_viewToFadeWhenDimming);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_stackDimmingOverlayView, 0);
}

@end
