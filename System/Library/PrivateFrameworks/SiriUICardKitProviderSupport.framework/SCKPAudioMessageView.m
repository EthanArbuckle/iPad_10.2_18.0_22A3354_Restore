@implementation SCKPAudioMessageView

- (SCKPAudioMessageView)initWithAudioMessageURL:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SCKPAudioMessageView *v8;
  SCKPAudioMessageView *v9;
  void *v10;
  uint64_t v11;
  UIImage *playImage;
  uint64_t v13;
  UIImage *v14;
  uint64_t v15;
  UIImage *pauseImage;
  uint64_t v17;
  UIImage *v18;
  UIButton *v19;
  UIButton *playButton;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  UIImageView *v29;
  UIImageView *waveformImageView;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCKPAudioMessageView;
  v8 = -[SCKPAudioMessageView init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 38.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("play.circle.fill"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    playImage = v9->_playImage;
    v9->_playImage = (UIImage *)v11;

    -[UIImage imageWithRenderingMode:](v9->_playImage, "imageWithRenderingMode:", 2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v9->_playImage;
    v9->_playImage = (UIImage *)v13;

    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("pause.circle.fill"), v10);
    v15 = objc_claimAutoreleasedReturnValue();
    pauseImage = v9->_pauseImage;
    v9->_pauseImage = (UIImage *)v15;

    -[UIImage imageWithRenderingMode:](v9->_pauseImage, "imageWithRenderingMode:", 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v9->_pauseImage;
    v9->_pauseImage = (UIImage *)v17;

    v19 = (UIButton *)objc_alloc_init(MEMORY[0x24BDF6880]);
    playButton = v9->_playButton;
    v9->_playButton = v19;

    -[UIButton setImage:forState:](v9->_playButton, "setImage:forState:", v9->_playImage, 0);
    v21 = v9->_playButton;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v21, "setTintColor:", v23);

    -[UIButton addTarget:action:forControlEvents:](v9->_playButton, "addTarget:action:forControlEvents:", v9, sel__playButtonPressed_, 64);
    -[SCKPAudioMessageView addSubview:](v9, "addSubview:", v9->_playButton);
    -[SCKPAudioMessageView setPlayButtonState:](v9, "setPlayButtonState:", 0);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v24 = (void *)getCKMediaObjectManagerClass_softClass;
    v37 = getCKMediaObjectManagerClass_softClass;
    if (!getCKMediaObjectManagerClass_softClass)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __getCKMediaObjectManagerClass_block_invoke;
      v33[3] = &unk_24E048F90;
      v33[4] = &v34;
      __getCKMediaObjectManagerClass_block_invoke((uint64_t)v33);
      v24 = (void *)v35[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v34, 8);
    objc_msgSend(v25, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v6, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "composeWaveformForWidth:orientation:", 1, 300.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    waveformImageView = v9->_waveformImageView;
    v9->_waveformImageView = v29;

    -[UIImageView setImage:](v9->_waveformImageView, "setImage:", v28);
    -[SCKPAudioMessageView addSubview:](v9, "addSubview:", v9->_waveformImageView);

  }
  return v9;
}

- (void)setPlayButtonState:(int64_t)a3
{
  int *v3;

  if (self->_playButtonState != a3)
  {
    self->_playButtonState = a3;
    if (!a3)
    {
      v3 = &OBJC_IVAR___SCKPAudioMessageView__playImage;
      goto LABEL_7;
    }
    if (a3 == 1)
    {
      v3 = &OBJC_IVAR___SCKPAudioMessageView__pauseImage;
LABEL_7:
      -[UIButton setImage:forState:](self->_playButton, "setImage:forState:", *(Class *)((char *)&self->super.super.super.isa + *v3), 0);
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCKPAudioMessageView;
  -[SCKPAudioMessageView layoutSubviews](&v10, sel_layoutSubviews);
  -[SCKPAudioMessageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIButton setFrame:](self->_playButton, "setFrame:");
  -[UIButton size](self->_playButton, "size");
  -[UIImageView setFrame:](self->_waveformImageView, "setFrame:", v9 + 10.0, v4, v6 - v8 + -10.0, v8);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 38.0;
  result.height = v3;
  return result;
}

- (void)_playButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "audioMessagePlayButtonTapped:", self);

}

- (int64_t)playButtonState
{
  return self->_playButtonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformImageView, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
