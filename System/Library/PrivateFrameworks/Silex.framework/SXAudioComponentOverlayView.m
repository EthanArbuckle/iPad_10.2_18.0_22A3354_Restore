@implementation SXAudioComponentOverlayView

- (SXAudioComponentOverlayView)initWithFrame:(CGRect)a3
{
  SXAudioComponentOverlayView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *audioIndicatorImage;
  uint64_t v10;
  UIActivityIndicatorView *activityIndicator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  UIButton *playButton;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SXAudioComponentOverlayView;
  v3 = -[SXAudioComponentOverlayView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    SXBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("SXAudioOnlyIndicator"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    audioIndicatorImage = v3->_audioIndicatorImage;
    v3->_audioIndicatorImage = (UIImage *)v8;

    -[SXAudioComponentOverlayView setImage:](v3, "setImage:", v3->_audioIndicatorImage);
    -[SXAudioComponentOverlayView setContentMode:](v3, "setContentMode:", 4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 0);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v10;

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SXAudioComponentOverlayView addSubview:](v3, "addSubview:", v3->_activityIndicator);
    -[UIActivityIndicatorView centerXAnchor](v3->_activityIndicator, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentOverlayView centerXAnchor](v3, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[UIActivityIndicatorView centerYAnchor](v3->_activityIndicator, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentOverlayView centerYAnchor](v3, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    v18 = objc_alloc(MEMORY[0x24BE90768]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    playButton = v3->_playButton;
    v3->_playButton = (UIButton *)v19;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_playButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SXAudioComponentOverlayView addSubview:](v3, "addSubview:", v3->_playButton);
    -[UIButton centerXAnchor](v3->_playButton, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentOverlayView centerXAnchor](v3, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UIButton centerYAnchor](v3->_playButton, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXAudioComponentOverlayView centerYAnchor](v3, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIButton widthAnchor](v3->_playButton, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 80.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[UIButton heightAnchor](v3->_playButton, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", 80.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

  }
  return v3;
}

- (id)image
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXAudioComponentOverlayView;
  -[SXAudioComponentOverlayView image](&v6, sel_image);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAudioComponentOverlayView audioIndicatorImage](self, "audioIndicatorImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[SXAudioComponentOverlayView audioIndicatorImage](self, "audioIndicatorImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    -[SXAudioComponentOverlayView setContentMode:](self, "setContentMode:", 1);
  v6.receiver = self;
  v6.super_class = (Class)SXAudioComponentOverlayView;
  -[SXAudioComponentOverlayView setImage:](&v6, sel_setImage_, v4);

}

- (void)startActivityIndicator
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[SXAudioComponentOverlayView activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[SXAudioComponentOverlayView activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[SXAudioComponentOverlayView activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke;
  v7[3] = &unk_24D6874A8;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke_2;
  v6[3] = &unk_24D689490;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v7, v6, 0.2);
}

void __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __53__SXAudioComponentOverlayView_startActivityIndicator__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)stopActivityIndicator
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  -[SXAudioComponentOverlayView playButton](self, "playButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke;
  v5[3] = &unk_24D6874A8;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke_2;
  v4[3] = &unk_24D689490;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v5, v4, 0.2);
}

void __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "playButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __52__SXAudioComponentOverlayView_stopActivityIndicator__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (UIButton)playButton
{
  return self->_playButton;
}

- (UIImage)audioIndicatorImage
{
  return self->_audioIndicatorImage;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_audioIndicatorImage, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
}

@end
