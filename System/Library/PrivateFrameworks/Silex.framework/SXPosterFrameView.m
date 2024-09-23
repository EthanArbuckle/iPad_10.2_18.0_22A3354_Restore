@implementation SXPosterFrameView

- (SXPosterFrameView)initWithFrame:(CGRect)a3
{
  SXPosterFrameView *v3;
  SXPosterFrameView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  SVVideoPlayButton *playButton;
  void *v9;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SXPosterFrameView;
  v3 = -[SXPosterFrameView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SXPosterFrameView setContentMode:](v3, "setContentMode:", 2);
    -[SXPosterFrameView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXPosterFrameView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[SXPosterFrameView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v6 = objc_alloc(MEMORY[0x24BE90768]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    playButton = v4->_playButton;
    v4->_playButton = (SVVideoPlayButton *)v7;

    -[SVVideoPlayButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_playButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SXPosterFrameView addSubview:](v4, "addSubview:", v4->_playButton);
    -[SXPosterFrameView playButton](v4, "playButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXPosterFrameView centerXAnchor](v4, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    -[SXPosterFrameView playButton](v4, "playButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXPosterFrameView centerYAnchor](v4, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[SXPosterFrameView playButton](v4, "playButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 80.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[SXPosterFrameView playButton](v4, "playButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 80.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

  }
  return v4;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x24BDF6F90];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__SXPosterFrameView_setImage_animated___block_invoke;
    v9[3] = &unk_24D687408;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", self, 5242880, v9, 0, 0.100000001);

  }
  else
  {
    -[SXPosterFrameView setImage:](self, "setImage:", v6);
  }

}

uint64_t __39__SXPosterFrameView_setImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SVVideoPlayButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playButton, 0);
}

@end
