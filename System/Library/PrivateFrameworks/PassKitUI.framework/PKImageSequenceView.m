@implementation PKImageSequenceView

- (id)initWitImages:(id)a3
{
  id v4;
  PKImageSequenceView *v5;
  uint64_t v6;
  NSArray *images;
  UIImageView *v8;
  UIImageView *imageView;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *fadeInImageView;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKImageSequenceView;
  v5 = -[PKImageSequenceView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    images = v5->_images;
    v5->_images = (NSArray *)v6;

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v5->_imageView;
    v5->_imageView = v8;

    v10 = v5->_imageView;
    -[NSArray firstObject](v5->_images, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v10, "setImage:", v11);

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKImageSequenceView addSubview:](v5, "addSubview:", v5->_imageView);
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    fadeInImageView = v5->_fadeInImageView;
    v5->_fadeInImageView = v12;

    -[UIImageView setContentMode:](v5->_fadeInImageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v5->_fadeInImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setAlpha:](v5->_fadeInImageView, "setAlpha:", 0.0);
    -[PKImageSequenceView addSubview:](v5, "addSubview:", v5->_fadeInImageView);
    if (!objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKImageSequenceView setBackgroundColor:](v5, "setBackgroundColor:", v14);

    }
  }

  return v5;
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  UIImageView *fadeInImageView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKImageSequenceView;
  -[PKImageSequenceView layoutSubviews](&v5, sel_layoutSubviews);
  imageView = self->_imageView;
  -[PKImageSequenceView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
  fadeInImageView = self->_fadeInImageView;
  -[PKImageSequenceView bounds](self, "bounds");
  -[UIImageView setFrame:](fadeInImageView, "setFrame:");
}

- (void)updateImages:(id)a3
{
  NSArray *v4;
  NSArray *images;

  if (a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    images = self->_images;
    self->_images = v4;

    -[PKImageSequenceView startAnimation](self, "startAnimation");
  }
}

- (void)startAnimation
{
  NSUInteger v3;
  NSUInteger v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  PKImageSequenceView *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (!-[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    v3 = -[NSArray count](self->_images, "count");
    if (!self->_isAnimating && v3 != 0)
    {
      self->_isAnimating = 1;
      v5 = -[NSArray count](self->_images, "count");
      -[NSArray firstObject](self->_images, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();
      v13 = (id)v6;
      if (v5 < 2)
      {
        v12 = v6;
        v9 = self;
        v8 = v12;
        v10 = 1;
        v11 = 1;
      }
      else
      {
        -[UIImageView image](self->_imageView, "image");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        self->_activeImageIndex = v13 == v7;

        -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", self->_activeImageIndex);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = self;
        v13 = (id)v8;
        v10 = 0;
        v11 = 0;
      }
      -[PKImageSequenceView _transitionToImage:immedately:fast:](v9, "_transitionToImage:immedately:fast:", v8, v10, v11);

    }
  }
}

- (void)stopAnimation
{
  self->_isAnimating = 0;
  ++self->_animationContext;
}

- (void)_transitionToImage:(id)a3 immedately:(BOOL)a4 fast:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *animationContext;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD block[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  id v19[2];
  BOOL v20;
  id location;

  v6 = a4;
  v8 = a3;
  objc_initWeak(&location, self);
  animationContext = (void *)self->_animationContext;
  -[UIImageView setAlpha:](self->_fadeInImageView, "setAlpha:", 0.0);
  -[UIImageView setImage:](self->_fadeInImageView, "setImage:", v8);
  -[PKImageSequenceView bringSubviewToFront:](self, "bringSubviewToFront:", self->_fadeInImageView);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke;
  aBlock[3] = &unk_1E3E74048;
  aBlock[4] = self;
  v19[1] = animationContext;
  v20 = a5;
  objc_copyWeak(v19, &location);
  v11 = v8;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v6)
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }
  else
  {
    v14 = dispatch_time(0, 2000000000);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_4;
    block[3] = &unk_1E3E61590;
    v16 = v13;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  double v4;
  uint64_t v5;
  id *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 424) == *(_QWORD *)(a1 + 56))
  {
    v3 = (void *)MEMORY[0x1E0DC3F10];
    if (*(_BYTE *)(a1 + 64))
      v4 = 0.25;
    else
      v4 = 1.0;
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_2;
    v10[3] = &unk_1E3E612C0;
    v10[4] = v1;
    v6 = (id *)(a1 + 48);
    objc_copyWeak(&v11, (id *)(a1 + 48));
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_3;
    v7[3] = &unk_1E3E62FA0;
    objc_copyWeak(&v9, v6);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0x10000, v10, v7, v4, 0.0);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
  }
}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setBackgroundColor:", v2);

}

void __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishedTransitionToImage:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __58__PKImageSequenceView__transitionToImage_immedately_fast___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_finishedTransitionToImage:(id)a3
{
  UIImageView **p_fadeInImageView;
  UIImageView *fadeInImageView;
  unint64_t v6;
  void *v7;
  UIImageView *v8;

  p_fadeInImageView = &self->_fadeInImageView;
  fadeInImageView = self->_fadeInImageView;
  v8 = fadeInImageView;
  objc_storeStrong((id *)p_fadeInImageView, self->_imageView);
  objc_storeStrong((id *)&self->_imageView, fadeInImageView);
  if (self->_isAnimating && -[NSArray count](self->_images, "count") >= 2)
  {
    v6 = self->_activeImageIndex + 1;
    self->_activeImageIndex = v6 % -[NSArray count](self->_images, "count");
    -[NSArray objectAtIndex:](self->_images, "objectAtIndex:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKImageSequenceView _transitionToImage:immedately:fast:](self, "_transitionToImage:immedately:fast:", v7, 0, 0);

  }
  else
  {
    -[PKImageSequenceView stopAnimation](self, "stopAnimation");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_fadeInImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
