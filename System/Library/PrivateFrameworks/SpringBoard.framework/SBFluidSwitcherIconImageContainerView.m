@implementation SBFluidSwitcherIconImageContainerView

- (SBFluidSwitcherIconImageContainerView)initWithFrame:(CGRect)a3
{
  SBFluidSwitcherIconImageContainerView *v3;
  id v4;
  uint64_t v5;
  UIImageView *imageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherIconImageContainerView;
  v3 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[SBFluidSwitcherIconImageContainerView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    -[SBFluidSwitcherIconImageContainerView _configureIconImageView:](v3, "_configureIconImageView:", v3->_imageView);
    -[SBFluidSwitcherIconImageContainerView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  SBFluidSwitcherIconImageContainerView *v3;
  UIImageView *imageView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherIconImageContainerView;
  -[SBFluidSwitcherIconImageContainerView layoutSubviews](&v5, sel_layoutSubviews);
  -[UIImageView superview](self->_imageView, "superview");
  v3 = (SBFluidSwitcherIconImageContainerView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    imageView = self->_imageView;
    -[SBFluidSwitcherIconImageContainerView bounds](self, "bounds");
    -[UIImageView setFrame:](imageView, "setFrame:");
  }
}

- (void)setImage:(id)a3
{
  -[SBFluidSwitcherIconImageContainerView setImage:animated:](self, "setImage:animated:", a3, 0);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  UIImage *v8;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_image != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_image, a3);
    if (v4)
      -[SBFluidSwitcherIconImageContainerView _crossfadeToImage:](self, "_crossfadeToImage:", v8);
    else
      -[UIImageView setImage:](self->_imageView, "setImage:", v8);
    v7 = v8;
  }

}

- (void)_configureIconImageView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setContentMode:", 1);
  objc_msgSend(v3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", 1);
}

- (void)_crossfadeToImage:(id)a3
{
  objc_class *v4;
  id v5;
  UIImageView *v6;
  void *v7;
  UIImageView *imageView;
  UIImageView *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0CEA658];
  v5 = a3;
  v6 = (UIImageView *)objc_msgSend([v4 alloc], "initWithImage:", v5);

  -[SBFluidSwitcherIconImageContainerView _configureIconImageView:](self, "_configureIconImageView:", v6);
  objc_msgSend(MEMORY[0x1E0DAC218], "crossfadeViewWithStartView:endView:translucent:", self->_imageView, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  self->_imageView = v6;
  v9 = v6;

  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimationFactory:", v10);

  -[SBFluidSwitcherIconImageContainerView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:");
  -[SBFluidSwitcherIconImageContainerView addSubview:](self, "addSubview:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SBFluidSwitcherIconImageContainerView__crossfadeToImage___block_invoke;
  v12[3] = &unk_1E8E9E820;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v11, "crossfadeWithCompletion:", v12);

}

uint64_t __59__SBFluidSwitcherIconImageContainerView__crossfadeToImage___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[52];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
