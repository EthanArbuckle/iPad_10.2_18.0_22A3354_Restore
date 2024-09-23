@implementation PXAudioPlayerHUDUIView

- (PXAudioPlayerHUDUIView)initWithFrame:(CGRect)a3 audioPlayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PXAudioPlayerHUDUIView *v11;
  PXAudioPlayerHUDUIView *v12;
  UILabel *v13;
  UILabel *trackLabel;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXAudioPlayerHUDUIView;
  v11 = -[PXAudioPlayerHUDUIView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioPlayer, a4);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    trackLabel = v12->_trackLabel;
    v12->_trackLabel = v13;

    -[UILabel setNumberOfLines:](v12->_trackLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v12->_trackLabel, "setTextAlignment:", 0);
    -[PXAudioPlayerHUDUIView addSubview:](v12, "addSubview:", v12->_trackLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAudioPlayerHUDUIView setBackgroundColor:](v12, "setBackgroundColor:", v15);

    -[PXAudioPlayerHUDUIView _updateInfoText](v12, "_updateInfoText");
  }

  return v12;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayerHUDUIView;
  -[PXAudioPlayerHUDUIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXAudioPlayerHUDUIView _updateDisplayLink](self, "_updateDisplayLink");
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)PXAudioPlayerHUDUIView;
  -[PXAudioPlayerHUDUIView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXAudioPlayerHUDUIView bounds](self, "bounds");
  v5 = CGRectInset(v4, 30.0, 30.0);
  -[UILabel setFrame:](self->_trackLabel, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)_updateInfoText
{
  PXAudioPlayer *audioPlayer;
  double v4;
  double v5;
  id v6;

  audioPlayer = self->_audioPlayer;
  -[UILabel bounds](self->_trackLabel, "bounds");
  -[PXAudioPlayer lcdStringForSize:](audioPlayer, "lcdStringForSize:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_trackLabel, "setText:", v6);

}

- (void)_updateDisplayLink
{
  void *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  void *v9;

  -[PXAudioPlayerHUDUIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  displayLink = self->_displayLink;
  if (v3)
  {
    if (!displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v6 = self->_displayLink;
      self->_displayLink = v5;

      v7 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    }
  }
  else if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v8 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (PXAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
}

@end
