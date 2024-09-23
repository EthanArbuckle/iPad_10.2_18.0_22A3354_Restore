@implementation PKPerformActionPassView

- (PKPerformActionPassView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionPassView;
  return -[PKPerformActionBackdropView init](&v3, sel_init);
}

- (PKPerformActionPassView)initWithPass:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  id v8;
  PKPerformActionPassView *v9;
  PKPerformActionPassView *v10;
  PKPassSnapshotter *v11;
  PKPassSnapshotter *snapshotter;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPerformActionPassView;
  v9 = -[PKPerformActionBackdropView init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    v11 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v10->_snapshotter;
    v10->_snapshotter = v11;

    -[PKPerformActionPassView _createSubviews](v10, "_createSubviews");
    -[PKPerformActionPassView _loadSnapshotView](v10, "_loadSnapshotView");
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PKPerformActionPassView sizeThatFits:](v10, "sizeThatFits:", width, width);
    -[PKPerformActionPassView setFrame:](v10, "setFrame:", v13, v14, v15, v16);
    -[PKPerformActionPassView sizeThatFits:](v10, "sizeThatFits:", width, height);
    -[PKPerformActionPassView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 1);
  }

  return v10;
}

- (void)configureWithPass:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  id v8;
  PKPassSnapshotter *v9;
  PKPassSnapshotter *snapshotter;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a4.size.height;
  width = a4.size.width;
  objc_storeStrong((id *)&self->_pass, a3);
  v8 = a3;
  v9 = objc_alloc_init(PKPassSnapshotter);
  snapshotter = self->_snapshotter;
  self->_snapshotter = v9;

  -[PKPerformActionPassView _createSubviews](self, "_createSubviews");
  -[PKPerformActionPassView _loadSnapshotView](self, "_loadSnapshotView");
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKPerformActionPassView sizeThatFits:](self, "sizeThatFits:", width, width);
  -[PKPerformActionPassView setFrame:](self, "setFrame:", v11, v12, v13, v14);
  -[PKPerformActionPassView sizeThatFits:](self, "sizeThatFits:", width, height);
  -[PKPerformActionPassView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPerformActionPassView;
  -[PKPerformActionBackdropView layoutSubviews](&v7, sel_layoutSubviews);
  -[PKPerformActionPassView bounds](self, "bounds");
  v4 = v3;
  -[PKPerformActionPassView _passImageSize](self, "_passImageSize");
  -[UIImageView setFrame:](self->_passView, "setFrame:", v4 * 0.5 - v5 * 0.5, 0.0, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKPerformActionPassView _passImageSize](self, "_passImageSize", a3.width, a3.height);
  v5 = fmax(v4, 88.0);
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)shakeImage
{
  -[UIImageView pkui_shakeWithCompletion:](self->_passView, "pkui_shakeWithCompletion:", 0);
}

- (void)smallShakeImage
{
  -[UIImageView pkui_smallShakeWithCompletion:](self->_passView, "pkui_smallShakeWithCompletion:", 0);
}

- (void)_createSubviews
{
  UIImageView *v3;
  UIImageView *passView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  passView = self->_passView;
  self->_passView = v3;

  -[UIImageView layer](self->_passView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowRadius:", 12.0);

  -[UIImageView layer](self->_passView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  -[UIImageView layer](self->_passView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, 12.0);

  -[UIImageView layer](self->_passView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(v9, "setShadowOpacity:", v10);

  -[UIImageView layer](self->_passView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 0);

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_passView, "setAccessibilityIgnoresInvertColors:", 1);
  -[PKPerformActionPassView addSubview:](self, "addSubview:", self->_passView);
}

- (void)_loadSnapshotView
{
  PKPassSnapshotter *snapshotter;
  PKPass *pass;
  _QWORD v5[5];

  snapshotter = self->_snapshotter;
  pass = self->_pass;
  -[PKPerformActionPassView _passImageSize](self, "_passImageSize");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PKPerformActionPassView__loadSnapshotView__block_invoke;
  v5[3] = &unk_1E3E613B0;
  v5[4] = self;
  -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", pass, v5);
}

void __44__PKPerformActionPassView__loadSnapshotView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PKPerformActionPassView__loadSnapshotView__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __44__PKPerformActionPassView__loadSnapshotView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setImage:", *(_QWORD *)(a1 + 40));
}

- (CGSize)_passImageSize
{
  PKPassType v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[PKPass passType](self->_pass, "passType");
  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v2 == PKPassTypeSecureElement)
  {
    v3 = 190.0;
    v4 = 121.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
