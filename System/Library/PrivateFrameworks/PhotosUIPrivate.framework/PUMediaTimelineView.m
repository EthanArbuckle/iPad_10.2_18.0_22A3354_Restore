@implementation PUMediaTimelineView

- (PUMediaTimelineView)initWithFrame:(CGRect)a3
{
  PUMediaTimelineView *v3;
  id v4;
  uint64_t v5;
  UISlider *slider;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  UIColor *labelColor;
  uint64_t v18;
  UIFont *labelFont;
  UILabel *v20;
  UILabel *currentTimeLabel;
  UILabel *v22;
  UILabel *durationLabel;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PUMediaTimelineView;
  v3 = -[PUMediaTimelineView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3C80]);
    -[PUMediaTimelineView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    slider = v3->_slider;
    v3->_slider = (UISlider *)v5;

    -[UISlider addTarget:action:forControlEvents:](v3->_slider, "addTarget:action:forControlEvents:", v3, sel__sliderValueChanged_, 4096);
    -[UISlider _setSliderStyle:](v3->_slider, "_setSliderStyle:", 110);
    v3->_whiteValue = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[UISlider layer](v3->_slider, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UISlider layer](v3->_slider, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowOffset:", v10, v11);

    -[UISlider layer](v3->_slider, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1050253722;
    objc_msgSend(v13, "setShadowOpacity:", v14);

    -[UISlider layer](v3->_slider, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 5.0);

    -[PUMediaTimelineView addSubview:](v3, "addSubview:", v3->_slider);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = objc_claimAutoreleasedReturnValue();
    labelColor = v3->_labelColor;
    v3->_labelColor = (UIColor *)v16;

    PXFontWithTextStyleAndWeight();
    v18 = objc_claimAutoreleasedReturnValue();
    labelFont = v3->_labelFont;
    v3->_labelFont = (UIFont *)v18;

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    currentTimeLabel = v3->_currentTimeLabel;
    v3->_currentTimeLabel = v20;

    -[UILabel setTextAlignment:](v3->_currentTimeLabel, "setTextAlignment:", 0);
    -[UILabel setFont:](v3->_currentTimeLabel, "setFont:", v3->_labelFont);
    -[UILabel setTextColor:](v3->_currentTimeLabel, "setTextColor:", v3->_labelColor);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = v22;

    -[UILabel setTextAlignment:](v3->_durationLabel, "setTextAlignment:", 2);
    -[UILabel setFont:](v3->_durationLabel, "setFont:", v3->_labelFont);
    -[UILabel setTextColor:](v3->_durationLabel, "setTextColor:", v3->_labelColor);
    -[PUMediaTimelineView addSubview:](v3, "addSubview:", v3->_currentTimeLabel);
    -[PUMediaTimelineView addSubview:](v3, "addSubview:", v3->_durationLabel);
    -[PUMediaTimelineView _updateCurrentTimeText](v3, "_updateCurrentTimeText");
    -[PUMediaTimelineView _updateSliderConfiguration](v3, "_updateSliderConfiguration");
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MaxY;
  double Width;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v19.receiver = self;
  v19.super_class = (Class)PUMediaTimelineView;
  -[PUMediaTimelineView layoutSubviews](&v19, sel_layoutSubviews);
  -[PUMediaTimelineView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIVisualEffectView setFrame:](self->_platterView, "setFrame:");
  PXRectGetCenter();
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGRectGetWidth(v20);
  PXRectWithCenterAndSize();
  -[UISlider setFrame:](self->_slider, "setFrame:");
  -[UISlider frame](self->_slider, "frame");
  MaxY = CGRectGetMaxY(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  Width = CGRectGetWidth(v22);
  -[PUMediaTimelineView labelFont](self, "labelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");
  -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", 0.0, MaxY, Width, v14);

  -[UISlider frame](self->_slider, "frame");
  v15 = CGRectGetMaxY(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v16 = CGRectGetWidth(v24);
  -[PUMediaTimelineView labelFont](self, "labelFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lineHeight");
  -[UILabel setFrame:](self->_durationLabel, "setFrame:", 0.0, v15, v16, v18);

  -[UILabel setHidden:](self->_durationLabel, "setHidden:", -[PUMediaTimelineView showsTimeLabels](self, "showsTimeLabels") ^ 1);
  -[UILabel setHidden:](self->_currentTimeLabel, "setHidden:", -[PUMediaTimelineView showsTimeLabels](self, "showsTimeLabels") ^ 1);
}

- (void)setWhiteValue:(double)a3
{
  if (self->_whiteValue != a3)
  {
    self->_whiteValue = a3;
    -[PUMediaTimelineView _updateSliderConfiguration](self, "_updateSliderConfiguration");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUMediaTimelineView *slider;
  PUMediaTimelineView *v6;
  PUMediaTimelineView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUMediaTimelineView;
  -[PUMediaTimelineView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  slider = (PUMediaTimelineView *)objc_claimAutoreleasedReturnValue();
  v6 = slider;
  if (slider == self)
    slider = (PUMediaTimelineView *)self->_slider;
  v7 = slider;

  return v7;
}

- (void)setLabelFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_labelFont, a3);
  v5 = a3;
  -[UILabel setFont:](self->_currentTimeLabel, "setFont:", v5);
  -[UILabel setFont:](self->_durationLabel, "setFont:", v5);

}

- (void)setLabelColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_labelColor, a3);
  v5 = a3;
  -[UILabel setTextColor:](self->_currentTimeLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_durationLabel, "setTextColor:", v5);

}

- (void)setShowsTimeLabels:(BOOL)a3
{
  if (self->_showsTimeLabels != a3)
  {
    self->_showsTimeLabels = a3;
    -[PUMediaTimelineView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaxValue:(float)a3
{
  double v5;

  -[UISlider maximumValue](self->_slider, "maximumValue");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[UISlider setMaximumValue:](self->_slider, "setMaximumValue:", v5);
    -[PUMediaTimelineView _updateDurationText](self, "_updateDurationText");
  }
}

- (float)maxValue
{
  float result;

  -[UISlider maximumValue](self->_slider, "maximumValue");
  return result;
}

- (void)setMinValue:(float)a3
{
  double v5;

  -[UISlider minimumValue](self->_slider, "minimumValue");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[UISlider setMinimumValue:](self->_slider, "setMinimumValue:", v5);
  }
}

- (float)minValue
{
  float result;

  -[UISlider minimumValue](self->_slider, "minimumValue");
  return result;
}

- (float)currentValue
{
  float result;

  -[UISlider value](self->_slider, "value");
  return result;
}

- (void)setCurrentValue:(float)a3
{
  double v5;

  -[UISlider value](self->_slider, "value");
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[UISlider setValue:](self->_slider, "setValue:", v5);
    -[PUMediaTimelineView _updateCurrentTimeText](self, "_updateCurrentTimeText");
  }
}

- (void)_sliderValueChanged:(id)a3
{
  id v4;

  -[PXEventCoalescer inputEvent](self->_eventCoalescer, "inputEvent", a3);
  -[PUMediaTimelineView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaTimelineControlViewDidChangeValue:", self);

}

- (void)_updateCurrentTimeText
{
  void *v3;
  float v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[PUMediaTimelineView currentValue](self, "currentValue");
  objc_msgSend(v3, "_stringFromTimeInterval:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_currentTimeLabel, "setText:", v5);

}

- (void)_updateDurationText
{
  void *v3;
  float v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[PUMediaTimelineView maxValue](self, "maxValue");
  objc_msgSend(v3, "_stringFromTimeInterval:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_durationLabel, "setText:", v5);

}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  void *v4;
  PXEventCoalescer *eventCoalescer;

  if (self->_eventCoalescer == a3)
  {
    -[PUMediaTimelineView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaTimelineControlViewDidEndChanging:", self);

    eventCoalescer = self->_eventCoalescer;
    self->_eventCoalescer = 0;

  }
}

- (void)_updateSliderConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0DC4348]);
  v3 = (void *)MEMORY[0x1E0DC3510];
  v4 = (void *)MEMORY[0x1E0DC3658];
  -[PUMediaTimelineView whiteValue](self, "whiteValue");
  objc_msgSend(v4, "colorWithWhite:alpha:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumTrackEffect:", v6);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaximumTrackEffect:", v7);

  objc_msgSend(v8, "setDelegate:", self);
  -[UISlider _setSliderConfiguration:](self->_slider, "_setSliderConfiguration:", v8);

}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  id v5;

  -[PUMediaTimelineView delegate](self, "delegate", a3, a4.x, a4.y);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaTimelineControlViewWillBeginChanging:", self);

}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  PXEventCoalescer *v4;
  PXEventCoalescer *eventCoalescer;

  objc_msgSend(MEMORY[0x1E0D7CCF0], "delayedCoalescerWithDelay:", a3, 0.1);
  v4 = (PXEventCoalescer *)objc_claimAutoreleasedReturnValue();
  eventCoalescer = self->_eventCoalescer;
  self->_eventCoalescer = v4;

  -[PXEventCoalescer registerObserver:](self->_eventCoalescer, "registerObserver:", self);
  -[PXEventCoalescer inputEvent](self->_eventCoalescer, "inputEvent");
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (BOOL)isLoading
{
  return self->loading;
}

- (void)setLoading:(BOOL)a3
{
  self->loading = a3;
}

- (BOOL)isPlaying
{
  return self->playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->playing = a3;
}

- (PUMediaTimelineViewDelegate)delegate
{
  return (PUMediaTimelineViewDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)highlightedTimeRanges
{
  return self->highlightedTimeRanges;
}

- (void)setHighlightedTimeRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (BOOL)showsTimeLabels
{
  return self->_showsTimeLabels;
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightedTimeRanges, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_eventCoalescer, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

+ (id)_stringFromTimeInterval:(double)a3
{
  uint64_t *v4;

  if (_stringFromTimeInterval__onceToken_87445 != -1)
    dispatch_once(&_stringFromTimeInterval__onceToken_87445, &__block_literal_global_87446);
  v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter_87447;
  if (a3 < 3600.0)
    v4 = &_stringFromTimeInterval__minuteSecondFormatter_87448;
  return (id)objc_msgSend((id)*v4, "stringFromTimeInterval:", a3);
}

uint64_t __47__PUMediaTimelineView__stringFromTimeInterval___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter_87448;
  _stringFromTimeInterval__minuteSecondFormatter_87448 = (uint64_t)v0;

  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_87448, "setAllowedUnits:", 192);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_87448, "setUnitsStyle:", 0);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter_87448, "setZeroFormattingBehavior:", 0x10000);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter_87447;
  _stringFromTimeInterval__hourMinuteSecondFormatter_87447 = (uint64_t)v2;

  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_87447, "setAllowedUnits:", 224);
  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_87447, "setUnitsStyle:", 0);
  return objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter_87447, "setZeroFormattingBehavior:", 0x10000);
}

@end
