@implementation PUPlaybackTimeLabel

- (PUPlaybackTimeLabel)initWithFrame:(CGRect)a3
{
  PUPlaybackTimeLabel *v3;
  id v4;
  uint64_t v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  UILabel *label;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PUPlaybackTimeLabel;
  v3 = -[PUPlaybackTimeLabel initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PUPlaybackTimeLabel bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    backgroundView = v3->__backgroundView;
    v3->__backgroundView = (UIView *)v5;

    -[UIView layer](v3->__backgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 2.0);

    v8 = v3->__backgroundView;
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackTimeLabelBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[UIView setAutoresizingMask:](v3->__backgroundView, "setAutoresizingMask:", 45);
    -[PUPlaybackTimeLabel addSubview:](v3, "addSubview:", v3->__backgroundView);
    v11 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUPlaybackTimeLabel bounds](v3, "bounds");
    v12 = objc_msgSend(v11, "initWithFrame:");
    label = v3->__label;
    v3->__label = (UILabel *)v12;

    v14 = v3->__label;
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playbackTimeLabelFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v16);

    -[UILabel setTextAlignment:](v3->__label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->__label, "setNumberOfLines:", 1);
    v17 = v3->__label;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UILabel setAutoresizingMask:](v3->__label, "setAutoresizingMask:", 18);
    -[PUPlaybackTimeLabel addSubview:](v3, "addSubview:", v3->__label);
  }
  return v3;
}

- (void)setFormat:(int64_t)a3
{
  if (self->_format != a3)
  {
    self->_format = a3;
    -[PUPlaybackTimeLabel _invalidateBackground](self, "_invalidateBackground");
    -[PUPlaybackTimeLabel _invalidateLabel](self, "_invalidateLabel");
  }
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentPlaybackTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentPlaybackTime;
  CMTime time1;

  p_currentPlaybackTime = &self->_currentPlaybackTime;
  time1 = *(CMTime *)a3;
  currentPlaybackTime = self->_currentPlaybackTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentPlaybackTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_currentPlaybackTime->epoch = a3->var3;
    *(_OWORD *)&p_currentPlaybackTime->value = v6;
    if (-[PUPlaybackTimeLabel format](self, "format"))
      -[PUPlaybackTimeLabel _invalidateLabel](self, "_invalidateLabel");
  }
}

- (void)setPlaybackDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_playbackDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 playbackDuration;
  CMTime time1;

  p_playbackDuration = &self->_playbackDuration;
  time1 = *(CMTime *)a3;
  playbackDuration = self->_playbackDuration;
  if (CMTimeCompare(&time1, (CMTime *)&playbackDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_playbackDuration->epoch = a3->var3;
    *(_OWORD *)&p_playbackDuration->value = v6;
    if (-[PUPlaybackTimeLabel format](self, "format"))
    {
      -[PUPlaybackTimeLabel _invalidateBackground](self, "_invalidateBackground");
      -[PUPlaybackTimeLabel _invalidateLabel](self, "_invalidateLabel");
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPlaybackTimeLabel;
  -[PUPlaybackTimeLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[PUPlaybackTimeLabel _updateIfNeeded](self, "_updateIfNeeded");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PUPlaybackTimeLabel _updateIfNeeded](self, "_updateIfNeeded", a3.width, a3.height);
  -[PUPlaybackTimeLabel _backgroundView](self, "_backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)_needsUpdate
{
  return -[PUPlaybackTimeLabel _needsUpdateBackground](self, "_needsUpdateBackground")
      || -[PUPlaybackTimeLabel _needsUpdateLabel](self, "_needsUpdateLabel");
}

- (void)_updateIfNeeded
{
  if (-[PUPlaybackTimeLabel _needsUpdate](self, "_needsUpdate"))
  {
    -[PUPlaybackTimeLabel _updateBackgroundIfNeeded](self, "_updateBackgroundIfNeeded");
    -[PUPlaybackTimeLabel _updateLabelIfNeeded](self, "_updateLabelIfNeeded");
  }
}

- (void)_invalidateBackground
{
  -[PUPlaybackTimeLabel _setNeedsUpdateBackground:](self, "_setNeedsUpdateBackground:", 1);
  -[PUPlaybackTimeLabel _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBackgroundIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CMTime v14[2];
  CGRect v15;
  CGRect v16;

  if (-[PUPlaybackTimeLabel _needsUpdateBackground](self, "_needsUpdateBackground"))
  {
    -[PUPlaybackTimeLabel _setNeedsUpdateBackground:](self, "_setNeedsUpdateBackground:", 0);
    memset(&v14[1], 0, sizeof(CMTime));
    -[PUPlaybackTimeLabel playbackDuration](self, "playbackDuration");
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v14[0] = v14[1];
      v3 = round(CMTimeGetSeconds(v14));
    }
    else
    {
      v3 = 120.0;
    }
    -[PUPlaybackTimeLabel _maximumLabelSizeWithDuration:](self, "_maximumLabelSizeWithDuration:", v3);
    v5 = v4 + 16.0;
    v7 = v6 + 4.0;
    -[PUPlaybackTimeLabel _backgroundView](self, "_backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPlaybackTimeLabel bounds](self, "bounds");
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    MidX = CGRectGetMidX(v15);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    objc_msgSend(v8, "setCenter:", MidX + 0.0, CGRectGetMidY(v16) + 0.0);
    objc_msgSend(v8, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v5, v7);

  }
}

- (void)_invalidateLabel
{
  -[PUPlaybackTimeLabel _setNeedsUpdateLabel:](self, "_setNeedsUpdateLabel:", 1);
  -[PUPlaybackTimeLabel _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLabelIfNeeded
{
  void *v3;
  double v4;
  void *v5;
  _BYTE v6[80];

  if (-[PUPlaybackTimeLabel _needsUpdateLabel](self, "_needsUpdateLabel"))
  {
    -[PUPlaybackTimeLabel _setNeedsUpdateLabel:](self, "_setNeedsUpdateLabel:", 0);
    -[PUPlaybackTimeLabel currentPlaybackTime](self, "currentPlaybackTime");
    memset(&v6[32], 0, 48);
    -[PUPlaybackTimeLabel playbackDuration](self, "playbackDuration");
    v3 = 0;
    if ((unsigned __int128)0 >> 96 == 1)
    {
      if ((v6[44] & 0x1D) == 1)
      {
        *(CMTime *)v6 = *(CMTime *)&v6[56];
        v4 = round(CMTimeGetSeconds((CMTime *)v6));
        *(CMTime *)v6 = *(CMTime *)&v6[32];
        -[PUPlaybackTimeLabel _labelTextWithFormat:elapsedInterval:remainingInterval:](self, "_labelTextWithFormat:elapsedInterval:remainingInterval:", -[PUPlaybackTimeLabel format](self, "format"), v4, round(CMTimeGetSeconds((CMTime *)v6)) - v4);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }
    -[PUPlaybackTimeLabel _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v3);

  }
}

- (CGSize)_maximumLabelSizeWithDuration:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(double);
  void (**v9)(void *, uint64_t);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[7];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  CGSize result;

  -[PUPlaybackTimeLabel _label](self, "_label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0x4008000000000000;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke;
  aBlock[3] = &unk_1E58A6DB0;
  *(double *)&aBlock[5] = a3;
  aBlock[4] = &v24;
  aBlock[6] = 3;
  v8 = (void (**)(double))_Block_copy(aBlock);
  v8[2](10.0);
  ((void (*)(void (**)(double), double))v8[2])(v8, 60.0);
  ((void (*)(void (**)(double), double))v8[2])(v8, 600.0);
  ((void (*)(void (**)(double), double))v8[2])(v8, 3600.0);
  ((void (*)(void (**)(double), double))v8[2])(v8, 36000.0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 2;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke_2;
  v18[3] = &unk_1E58A6DD8;
  v18[4] = &v19;
  v9 = (void (**)(void *, uint64_t))_Block_copy(v18);
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, objc_msgSend(v10, "defaultPlaybackIndicator"));
  v9[2](v9, objc_msgSend(v10, "initialPlaybackIndicator"));
  v9[2](v9, objc_msgSend(v10, "scrubbingPlaybackIndicator"));
  v9[2](v9, objc_msgSend(v10, "chromeShownPlaybackIndicator"));
  v9[2](v9, objc_msgSend(v10, "playingPlaybackIndicator"));
  -[PUPlaybackTimeLabel _labelTextWithFormat:elapsedInterval:remainingInterval:](self, "_labelTextWithFormat:elapsedInterval:remainingInterval:", v20[3], v25[3], v25[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v11);
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "setText:", v6);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v24, 8);

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)_labelTextWithFormat:(int64_t)a3 elapsedInterval:(double)a4 remainingInterval:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3 == 3)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[PUPlaybackTimeLabel _stringFromTimeInterval:](self, "_stringFromTimeInterval:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPlaybackTimeLabel _stringFromTimeInterval:](self, "_stringFromTimeInterval:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ / -%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[PUPlaybackTimeLabel _stringFromTimeInterval:](self, "_stringFromTimeInterval:", a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("-%@"), v8);
    }
    else
    {
      if (a3 != 1)
      {
        v11 = 0;
        return v11;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[PUPlaybackTimeLabel _stringFromTimeInterval:](self, "_stringFromTimeInterval:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_stringFromTimeInterval:(double)a3
{
  uint64_t *v4;

  if (_stringFromTimeInterval__onceToken_76024 != -1)
    dispatch_once(&_stringFromTimeInterval__onceToken_76024, &__block_literal_global_76025);
  v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter_76026;
  if (a3 < 3600.0)
    v4 = &_stringFromTimeInterval__minuteSecondFormatter_76027;
  return (id)objc_msgSend((id)*v4, "stringFromTimeInterval:", a3);
}

- (int64_t)format
{
  return self->_format;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 448);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 472);
  return self;
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (UILabel)_label
{
  return self->__label;
}

- (BOOL)_needsUpdateBackground
{
  return self->__needsUpdateBackground;
}

- (void)_setNeedsUpdateBackground:(BOOL)a3
{
  self->__needsUpdateBackground = a3;
}

- (BOOL)_needsUpdateLabel
{
  return self->__needsUpdateLabel;
}

- (void)_setNeedsUpdateLabel:(BOOL)a3
{
  self->__needsUpdateLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
}

uint64_t __47__PUPlaybackTimeLabel__stringFromTimeInterval___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter_76027;
  _stringFromTimeInterval__minuteSecondFormatter_76027 = (uint64_t)v0;

  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_76027, "setAllowedUnits:", 192);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_76027, "setUnitsStyle:", 0);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_76027, "setZeroFormattingBehavior:", 0x10000);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_76026;
  _stringFromTimeInterval__hourMinuteSecondFormatter_76026 = (uint64_t)v2;

  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_76026, "setAllowedUnits:", 224);
  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_76026, "setUnitsStyle:", 0);
  return objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_76026, "setZeroFormattingBehavior:", 0x10000);
}

double __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke(uint64_t a1, double result)
{
  uint64_t v2;

  if (*(double *)(a1 + 40) >= result)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(double *)(v2 + 24) + (double)*(uint64_t *)(a1 + 48) * result;
    *(double *)(v2 + 24) = result;
  }
  return result;
}

uint64_t __53__PUPlaybackTimeLabel__maximumLabelSizeWithDuration___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 == 3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 3;
  return result;
}

@end
