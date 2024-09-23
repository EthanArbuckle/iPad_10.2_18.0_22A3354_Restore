@implementation CACMicStatusView

- (CACMicStatusView)initWithFrame:(CGRect)a3
{
  CACMicStatusView *v3;
  CACMicStatusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACMicStatusView;
  v3 = -[CACMicStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_swapPalette = 1;
    -[CACMicStatusView drawBase](v3, "drawBase");
    -[CACMicStatusView setMicStatus:](v4, "setMicStatus:", 1);
  }
  return v4;
}

- (void)drawBase
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  id v7;
  UIImageView *v8;
  UIImageView *statusIndicatorImageView;
  void *v10;
  UIImageView *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  -[CACMicStatusView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  -[CACMicStatusView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACMicStatusView frame](self, "frame");
  objc_msgSend(v5, "setCornerRadius:", v6 * 0.5);

  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, 0.75, 0.75);
  v7 = objc_alloc(MEMORY[0x24BEBD668]);
  -[CACMicStatusView frame](self, "frame");
  v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
  statusIndicatorImageView = self->_statusIndicatorImageView;
  self->_statusIndicatorImageView = v8;

  -[UIImageView layer](self->_statusIndicatorImageView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAnchorPoint:", 0.5, 0.5);

  v11 = self->_statusIndicatorImageView;
  v12 = v13;
  -[UIImageView setTransform:](v11, "setTransform:", &v12);
  -[UIImageView setAlpha:](self->_statusIndicatorImageView, "setAlpha:", 0.8);
  -[CACMicStatusView addSubview:](self, "addSubview:", self->_statusIndicatorImageView);
}

- (void)setMicStatus:(int64_t)a3
{
  if (self->_micStatus != a3)
  {
    switch(a3)
    {
      case 3:
        -[CACMicStatusView transitionToRecording](self, "transitionToRecording");
        break;
      case 2:
        -[CACMicStatusView transitionToListening](self, "transitionToListening");
        break;
      case 1:
        -[CACMicStatusView transitionToIdle](self, "transitionToIdle");
        break;
    }
    self->_micStatus = a3;
  }
}

- (void)setSwapPalette:(BOOL)a3
{
  int64_t v5;

  if (self->_swapPalette != a3)
  {
    v5 = -[CACMicStatusView micStatus](self, "micStatus");
    switch(v5)
    {
      case 3:
        -[CACMicStatusView transitionToRecording](self, "transitionToRecording");
        break;
      case 2:
        -[CACMicStatusView transitionToListening](self, "transitionToListening");
        break;
      case 1:
        -[CACMicStatusView transitionToIdle](self, "transitionToIdle");
        break;
    }
    self->_swapPalette = a3;
  }
}

- (void)transitionToIdle
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CACMicStatusView stopRecordingAnimation](self, "stopRecordingAnimation");
  v3 = (void *)MEMORY[0x24BEBDB00];
  -[CACMicStatusView statusIndicatorImageView](self, "statusIndicatorImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__CACMicStatusView_transitionToIdle__block_invoke;
  v5[3] = &unk_24F2AA860;
  v5[4] = self;
  objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242880, v5, 0, 0.3);

}

void __36__CACMicStatusView_transitionToIdle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("voice.control.slash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

- (void)transitionToListening
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CACMicStatusView stopRecordingAnimation](self, "stopRecordingAnimation");
  v3 = (void *)MEMORY[0x24BEBDB00];
  -[CACMicStatusView statusIndicatorImageView](self, "statusIndicatorImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__CACMicStatusView_transitionToListening__block_invoke;
  v5[3] = &unk_24F2AA860;
  v5[4] = self;
  objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242880, v5, 0, 0.3);

}

void __41__CACMicStatusView_transitionToListening__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("voice.control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

- (void)transitionToRecording
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x24BEBDB00];
  -[CACMicStatusView statusIndicatorImageView](self, "statusIndicatorImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__CACMicStatusView_transitionToRecording__block_invoke;
  v6[3] = &unk_24F2AA860;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_2;
  v5[3] = &unk_24F2AB328;
  objc_msgSend(v3, "transitionWithView:duration:options:animations:completion:", v4, 5242880, v6, v5, 0.3);

}

void __41__CACMicStatusView_transitionToRecording__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("voice.control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

void __41__CACMicStatusView_transitionToRecording__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorAnimationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_3;
    v4[3] = &unk_24F2AC250;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v4, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStatusIndicatorAnimationTimer:", v3);

  }
}

uint64_t __41__CACMicStatusView_transitionToRecording__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  BOOL v4;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 == 1.0;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__CACMicStatusView_transitionToRecording__block_invoke_4;
  v6[3] = &unk_24F2ABF88;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 1.3, 0.0);
}

void __41__CACMicStatusView_transitionToRecording__block_invoke_4(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.2;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)stopRecordingAnimation
{
  void *v3;
  id v4;

  -[CACMicStatusView statusIndicatorAnimationTimer](self, "statusIndicatorAnimationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CACMicStatusView setStatusIndicatorAnimationTimer:](self, "setStatusIndicatorAnimationTimer:", 0);
  -[CACMicStatusView statusIndicatorImageView](self, "statusIndicatorImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CACMicStatusView frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)imageBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__CACMicStatusView_imageBundle__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (imageBundle_onceToken != -1)
    dispatch_once(&imageBundle_onceToken, block);
  return (id)imageBundle_sImageBundle;
}

void __31__CACMicStatusView_imageBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageBundle_sImageBundle;
  imageBundle_sImageBundle = v0;

}

- (int64_t)micStatus
{
  return self->_micStatus;
}

- (double)micPowerLevel
{
  return self->_micPowerLevel;
}

- (void)setMicPowerLevel:(double)a3
{
  self->_micPowerLevel = a3;
}

- (BOOL)swapPalette
{
  return self->_swapPalette;
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorImageView, a3);
}

- (NSTimer)statusIndicatorAnimationTimer
{
  return self->_statusIndicatorAnimationTimer;
}

- (void)setStatusIndicatorAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIndicatorAnimationTimer, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
}

@end
