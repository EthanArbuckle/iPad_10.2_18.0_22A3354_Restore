@implementation SKUIBarButtonItemSubmitWithAnimation

- (SKUIBarButtonItemSubmitWithAnimation)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  SKUIBarButtonItemSubmitWithAnimation *v10;
  uint64_t v11;
  UIButton *button;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIImageView *imageView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  UIImageView *v29;
  CGAffineTransform v31;
  CGAffineTransform v32;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SKUIBarButtonItemSubmitWithAnimation;
  v10 = -[UIBarItem init](&v33, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    button = v10->_button;
    v10->_button = (UIButton *)v11;

    -[UIButton setTitle:forState:](v10->_button, "setTitle:forState:", v8, 0);
    -[UIButton setContentMode:](v10->_button, "setContentMode:", 4);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v10->_button, "addTarget:action:forControlEvents:", v9, a5, 64);
    -[UIButton heightAnchor](v10->_button, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD8028], "PPMConfirmedValueWithValue:newValue:", 36.0, 40.0);
    objc_msgSend(v13, "constraintEqualToConstant:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0DC3520], "borderedButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBaseBackgroundColor:", v16);

    -[UIButton setConfiguration:](v10->_button, "setConfiguration:", v15);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v17);
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v18;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10->_imageView, "setTintColor:", v20);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addSubview:](v10->_button, "addSubview:", v10->_imageView);
    -[UIImageView centerXAnchor](v10->_imageView, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerXAnchor](v10->_button, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UIImageView centerYAnchor](v10->_imageView, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v10->_button, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIImageView layer](v10->_imageView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 0;
    objc_msgSend(v27, "setOpacity:", v28);

    CGAffineTransformMakeScale(&v32, 0.0, 0.0);
    v29 = v10->_imageView;
    v31 = v32;
    -[UIImageView setTransform:](v29, "setTransform:", &v31);
    -[SKUIBarButtonItemSubmitWithAnimation setCustomView:](v10, "setCustomView:", v10->_button);

  }
  return v10;
}

- (void)animateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v8 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke;
  v9[3] = &unk_1E739FD38;
  v9[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E73A0248;
  v7[4] = self;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, 0.1);

}

void __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 0;
  objc_msgSend(v1, "setOpacity:", v2);

}

void __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[5];

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_3;
  v5[3] = &unk_1E739FD38;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_4;
  v3[3] = &unk_1E73A0220;
  v4 = v2;
  objc_msgSend(v1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, v3, 0.3, 0.0, 10.0, 50.0);

}

uint64_t __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setOpacity:", v3);

  CGAffineTransformMakeScale(&v7, 1.0, 1.0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 408);
  v6 = v7;
  return objc_msgSend(v4, "setTransform:", &v6);
}

uint64_t __62__SKUIBarButtonItemSubmitWithAnimation_animateWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
