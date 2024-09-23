@implementation PNPPencilView

- (void)layoutSubviews
{
  UIImageView *pencilImageView;
  void *v4;
  _PNPPencilMovieView *pencilMovieView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  UIView *touchIndicatorView;
  void *v14;
  double v15;
  _PNPPencilMovieView *v16;
  _BOOL4 v17;
  double v18;

  pencilImageView = self->_pencilImageView;
  -[PNPPencilView bounds](self, "bounds");
  -[PNPPencilView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  UIRectIntegralWithScale();
  -[UIImageView setFrame:](pencilImageView, "setFrame:");

  pencilMovieView = self->_pencilMovieView;
  -[PNPPencilView bounds](self, "bounds");
  -[PNPPencilView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRectIntegralWithScale();
  -[_PNPPencilMovieView setFrame:](pencilMovieView, "setFrame:");

  -[PNPPencilView bounds](self, "bounds");
  v8 = v7;
  -[PNPPencilView bounds](self, "bounds");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = v10 * 0.5;
  -[PNPPencilView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  -[UIView _setCornerRadius:](self->_touchIndicatorView, "_setCornerRadius:", 6.0);
  -[PNPPencilView bounds](self, "bounds");
  UIRectCenteredYInRect();
  -[PNPPencilView bounds](self, "bounds");
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_touchIndicatorView, "setFrame:");
  touchIndicatorView = self->_touchIndicatorView;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](touchIndicatorView, "setBackgroundColor:", v14);

  v15 = 0.6;
  if (!self->_touchIndicatorShown)
    v15 = 0.0;
  -[UIView setAlpha:](self->_touchIndicatorView, "setAlpha:", v15);
  v16 = self->_pencilMovieView;
  v17 = -[PNPPencilView spinning](self, "spinning");
  v18 = 1.0;
  if (!v17)
    v18 = 0.0;
  -[_PNPPencilMovieView setAlpha:](v16, "setAlpha:", v18);
}

- (void)_animateIndicatorToShown:(BOOL)a3 withCompletionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  BOOL v12;

  v6 = a4;
  -[PNPPencilView setNeedsLayout](self, "setNeedsLayout");
  -[PNPPencilView layoutIfNeeded](self, "layoutIfNeeded");
  v7 = (void *)MEMORY[0x24BDF6F90];
  v10 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke;
  v11[3] = &unk_24F4E5160;
  v11[4] = self;
  v12 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke_2;
  v9[3] = &unk_24F4E5240;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 6, v11, v9, 0.2, 0.0);

}

uint64_t __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __62__PNPPencilView__animateIndicatorToShown_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_resetTouchIndicatorPosition
{
  self->_touchIndicatorPosition = 0.0;
  -[PNPPencilView setNeedsLayout](self, "setNeedsLayout");
}

- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  -[PNPPencilView _resetTouchIndicatorPosition](self, "_resetTouchIndicatorPosition");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke;
  v7[3] = &unk_24F4E56F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PNPPencilView _animateIndicatorToShown:withCompletionBlock:](self, "_animateIndicatorToShown:withCompletionBlock:", 1, v7);

}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_2;
  v2[3] = &unk_24F4E56F0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_animateIndicatorToShown:withCompletionBlock:", 0, v2);

}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_3;
  v2[3] = &unk_24F4E56F0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_animateIndicatorToShown:withCompletionBlock:", 1, v2);

}

void __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_4;
  v2[3] = &unk_24F4E5188;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_animateIndicatorToShown:withCompletionBlock:", 0, v2);

}

uint64_t __51__PNPPencilView_eventSource_hadPencilDoubleTapped___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDeviceState:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PNPPencilView deviceState](self, "deviceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_deviceState, a3);
    -[PNPPencilView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)_edgeAccurateSizeForLength:(double)a3 depth:(double)a4 deviceState:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGSize result;

  v5 = (void *)MEMORY[0x24BDF6D38];
  v6 = a5;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nativeScale");

  objc_msgSend(v6, "isOnLeftOrRightSide");
  UISizeRoundToScale();
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicSizeForDeviceState:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PNPPencilView _edgeAccurateSizeForLength:depth:deviceState:](self, "_edgeAccurateSizeForLength:depth:deviceState:", a3, 855.0, 51.2);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)comfortableContainingSizeForDeviceState:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PNPPencilView _edgeAccurateSizeForLength:depth:deviceState:](self, "_edgeAccurateSizeForLength:depth:deviceState:", a3, 950.0, 128.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PNPPencilView deviceState](self, "deviceState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPencilView intrinsicSizeForDeviceState:](self, "intrinsicSizeForDeviceState:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
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
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "_hardwareImageForVariant:", self->_variant);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v7 / v8;
  if (width == 0.0 || width == *MEMORY[0x24BDF7FB8])
  {
    width = height * v9;
  }
  else if (height == 0.0 || height == *MEMORY[0x24BDF7FB8])
  {
    height = width * (1.0 / v9);
  }
  else
  {
    objc_msgSend(v5, "size", v9);
    width = v10;
    height = v11;
  }

  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGAffineTransform)transformForDeviceState:(SEL)a3
{
  CGFloat v5;
  uint64_t v6;
  __int128 v7;
  CGAffineTransform *result;
  id v9;

  v9 = a4;
  if (!objc_msgSend(v9, "isOnLeftOrRightSide"))
    goto LABEL_7;
  if (objc_msgSend(v9, "edge") != 8)
  {
    if (objc_msgSend(v9, "edge") == 2)
    {
      v5 = -1.57079633;
      goto LABEL_6;
    }
LABEL_7:
    v6 = MEMORY[0x24BDBD8B8];
    v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
    goto LABEL_8;
  }
  v5 = 1.57079633;
LABEL_6:
  CGAffineTransformMakeRotation(retstr, v5);
LABEL_8:

  return result;
}

+ (id)_hardwareImageForVariant:(unint64_t)a3
{
  uint64_t *v4;

  if (_hardwareImageForVariant__onceToken != -1)
    dispatch_once(&_hardwareImageForVariant__onceToken, &__block_literal_global_6);
  v4 = &_hardwareImageForVariant____hardwareImageForSettings;
  if (!a3)
    v4 = &_hardwareImageForVariant____hardwareImageForPencilPairingUI;
  return (id)*v4;
}

void __42__PNPPencilView__hardwareImageForVariant___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  PencilPairingUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("hw_pencilpairingui"), v1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_hardwareImageForVariant____hardwareImageForPencilPairingUI;
  _hardwareImageForVariant____hardwareImageForPencilPairingUI = v2;

  v4 = (void *)MEMORY[0x24BDF6AC8];
  PencilPairingUIBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("hw_settings"), v7, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_hardwareImageForVariant____hardwareImageForSettings;
  _hardwareImageForVariant____hardwareImageForSettings = v5;

}

- (void)setSpinning:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[PNPPencilView spinning](self, "spinning") != a3)
  {
    if (v3)
      -[_PNPPencilMovieView prepare](self->_pencilMovieView, "prepare");
    self->_spinning = v3;
    -[PNPPencilView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_prepareMovieView
{
  _PNPPencilMovieView *pencilMovieView;
  _QWORD v4[5];

  -[_PNPPencilMovieView prepare](self->_pencilMovieView, "prepare");
  pencilMovieView = self->_pencilMovieView;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__PNPPencilView__prepareMovieView__block_invoke;
  v4[3] = &unk_24F4E50A0;
  v4[4] = self;
  -[_PNPPencilMovieView completeRevolutionWithCompletionBlock:](pencilMovieView, "completeRevolutionWithCompletionBlock:", v4);
}

void __34__PNPPencilView__prepareMovieView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 480));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 480));
    objc_msgSend(v3, "didCompleteOneRevolution");

  }
}

- (void)cleanupSpinningResources
{
  -[_PNPPencilMovieView teardown](self->_pencilMovieView, "teardown");
}

- (void)completeRevolutionWithCompletionBlock:(id)a3
{
  -[_PNPPencilMovieView completeRevolutionWithCompletionBlock:](self->_pencilMovieView, "completeRevolutionWithCompletionBlock:", a3);
}

- (PNPPencilView)initWithVariant:(unint64_t)a3
{
  PNPPencilView *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UIImageView *pencilImageView;
  UIView *v9;
  UIView *touchIndicatorView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PNPPencilView;
  v4 = -[PNPPencilView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4->_variant = a3;
  v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend((id)objc_opt_class(), "_hardwareImageForVariant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithImage:", v6);
  pencilImageView = v4->_pencilImageView;
  v4->_pencilImageView = (UIImageView *)v7;

  -[UIImageView setContentMode:](v4->_pencilImageView, "setContentMode:", 1);
  -[PNPPencilView addSubview:](v4, "addSubview:", v4->_pencilImageView);
  v9 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  touchIndicatorView = v4->_touchIndicatorView;
  v4->_touchIndicatorView = v9;

  -[PNPPencilView addSubview:](v4, "addSubview:", v4->_touchIndicatorView);
  return v4;
}

- (PNPPencilView)initWithCoder:(id)a3
{
  return -[PNPPencilView initWithVariant:](self, "initWithVariant:", 0);
}

- (void)prepareMovieForSpinningPencil:(id)a3
{
  id v4;
  _PNPPencilMovieView *v5;
  uint64_t v6;
  _PNPPencilMovieView *v7;
  _PNPPencilMovieView *pencilMovieView;

  v4 = a3;
  v5 = [_PNPPencilMovieView alloc];
  v6 = objc_msgSend(v4, "deviceType");

  v7 = -[_PNPPencilMovieView initWithDeviceType:](v5, "initWithDeviceType:", v6);
  pencilMovieView = self->_pencilMovieView;
  self->_pencilMovieView = v7;

  -[PNPPencilView addSubview:](self, "addSubview:", self->_pencilMovieView);
  if (self->_spinning)
    -[PNPPencilView _prepareMovieView](self, "_prepareMovieView");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPPencilViewDelegate)delegate
{
  return (PNPPencilViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)spinning
{
  return self->_spinning;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_touchIndicatorView, 0);
  objc_storeStrong((id *)&self->_pencilMovieView, 0);
  objc_storeStrong((id *)&self->_pencilImageView, 0);
}

@end
