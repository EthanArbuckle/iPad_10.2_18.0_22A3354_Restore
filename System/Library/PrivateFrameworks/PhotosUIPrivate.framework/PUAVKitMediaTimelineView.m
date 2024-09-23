@implementation PUAVKitMediaTimelineView

- (PUAVKitMediaTimelineView)initWithFrame:(CGRect)a3
{
  PUAVKitMediaTimelineView *v3;
  PUAVKitMediaTimelineView *v4;
  uint64_t v5;
  UIColor *labelColor;
  uint64_t v7;
  AVMediaTimelineControl *timelineControl;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  AVMediaTimelineControl *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PUAVKitMediaTimelineView;
  v3 = -[PUAVKitMediaTimelineView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_whiteValue = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    labelColor = v4->_labelColor;
    v4->_labelColor = (UIColor *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B420]), "initWithSource:", v4);
    timelineControl = v4->_timelineControl;
    v4->_timelineControl = (AVMediaTimelineControl *)v7;

    -[PUAVKitMediaTimelineView bounds](v4, "bounds");
    -[AVMediaTimelineControl setFrame:](v4->_timelineControl, "setFrame:");
    -[AVMediaTimelineControl setDelegate:](v4->_timelineControl, "setDelegate:", v4);
    -[AVMediaTimelineControl setEnabled:](v4->_timelineControl, "setEnabled:", 1);
    -[AVMediaTimelineControl setAutoresizingMask:](v4->_timelineControl, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[AVMediaTimelineControl layer](v4->_timelineControl, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowColor:", v10);

    -[AVMediaTimelineControl layer](v4->_timelineControl, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1050253722;
    objc_msgSend(v12, "setShadowOpacity:", v13);

    -[AVMediaTimelineControl layer](v4->_timelineControl, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowRadius:", 5.0);

    -[PUAVKitMediaTimelineView _updateTimelineConfiguration](v4, "_updateTimelineConfiguration");
    -[PUAVKitMediaTimelineView addSubview:](v4, "addSubview:", v4->_timelineControl);
    v15 = v4->_timelineControl;
    NSStringFromSelector(sel_intrinsicContentSize);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaTimelineControl addObserver:forKeyPath:options:context:](v15, "addObserver:forKeyPath:options:context:", v4, v16, 0, 0);

    -[PUAVKitMediaTimelineView setPlaying:](v4, "setPlaying:", 1);
    -[PUAVKitMediaTimelineView setLoading:](v4, "setLoading:", 0);
    LODWORD(v17) = 0;
    -[PUAVKitMediaTimelineView setMaxValue:](v4, "setMaxValue:", v17);
    LODWORD(v18) = 0;
    -[PUAVKitMediaTimelineView setMinValue:](v4, "setMinValue:", v18);
    LODWORD(v19) = 0.5;
    -[PUAVKitMediaTimelineView setCurrentValue:](v4, "setCurrentValue:", v19);
    -[PUAVKitMediaTimelineView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v4;
}

- (void)dealloc
{
  AVMediaTimelineControl *timelineControl;
  void *v4;
  objc_super v5;

  timelineControl = self->_timelineControl;
  NSStringFromSelector(sel_intrinsicContentSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaTimelineControl removeObserver:forKeyPath:](timelineControl, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)PUAVKitMediaTimelineView;
  -[PUAVKitMediaTimelineView dealloc](&v5, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMediaTimelineControl intrinsicContentSize](self->_timelineControl, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  AVMediaTimelineControl *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = (AVMediaTimelineControl *)a4;
  v11 = a5;
  if (self->_timelineControl != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAVKitMediaTimelineView.m"), 91, CFSTR("Unexpected observed object %@"), v10);

  }
  NSStringFromSelector(sel_intrinsicContentSize);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAVKitMediaTimelineView.m"), 92, CFSTR("Unexpected observed key path %@"), v16);

  }
  -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_labelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelColor, a3);
    -[PUAVKitMediaTimelineView _updateTimelineConfiguration](self, "_updateTimelineConfiguration");
    v5 = v6;
  }

}

- (void)setLabelFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_labelFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelFont, a3);
    -[PUAVKitMediaTimelineView _updateTimelineConfiguration](self, "_updateTimelineConfiguration");
    -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (void)setCurrentValue:(float)a3
{
  if (self->_currentValue != a3)
  {
    self->_currentValue = a3;
    -[PUAVKitMediaTimelineView _updateCurrentValueText](self, "_updateCurrentValueText");
  }
}

- (void)setMaxValue:(float)a3
{
  if (self->_maxValue != a3)
  {
    self->_maxValue = a3;
    -[PUAVKitMediaTimelineView _updateMaxValueText](self, "_updateMaxValueText");
    -[AVMediaTimelineControl setNeedsLayout](self->_timelineControl, "setNeedsLayout");
  }
}

- (void)setShowsTimeLabels:(BOOL)a3
{
  if (self->_showsTimeLabels != a3)
  {
    self->_showsTimeLabels = a3;
    -[PUAVKitMediaTimelineView _updateTimelineConfiguration](self, "_updateTimelineConfiguration");
    -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setWhiteValue:(double)a3
{
  if (self->_whiteValue != a3)
  {
    self->_whiteValue = a3;
    -[PUAVKitMediaTimelineView _updateTimelineConfiguration](self, "_updateTimelineConfiguration");
  }
}

- (void)setHighlightedTimeRanges:(id)a3
{
  NSArray *v4;
  NSArray *highlightedTimeRanges;

  if (self->_highlightedTimeRanges != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    highlightedTimeRanges = self->_highlightedTimeRanges;
    self->_highlightedTimeRanges = v4;

    -[PUAVKitMediaTimelineView _updateTimeRangeMarks](self, "_updateTimeRangeMarks");
  }
}

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  CGFloat height;
  double width;
  id v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  CGSize result;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3;
  -[PUAVKitMediaTimelineView maxValue](self, "maxValue");
  if (v8 == 0.0)
  {
    v9 = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v10 = v8;
    objc_msgSend(v7, "endValue");
    v12 = v11;
    objc_msgSend(v7, "startValue");
    v9 = width * (float)(v12 - v13) / v10;
  }

  v14 = v9;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C8B458];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.85);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 4.0;
  objc_msgSend(v4, "timeRangeMarkUIProxyWithBackgroundColor:cornerRadius:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateTimeRangeMarks
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PUAVKitMediaTimelineView highlightedTimeRanges](self, "highlightedTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PUAVKitMediaTimelineView highlightedTimeRanges](self, "highlightedTimeRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAVKitMediaTimelineView setTimeRangeMarks:](self, "setTimeRangeMarks:", v6);

  }
  else
  {
    -[PUAVKitMediaTimelineView setTimeRangeMarks:](self, "setTimeRangeMarks:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)_updateCurrentValueText
{
  void *v3;
  float v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PUAVKitMediaTimelineView currentValue](self, "currentValue");
  objc_msgSend(v3, "_stringFromTimeInterval:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAVKitMediaTimelineView setCurrentValueText:](self, "setCurrentValueText:", v5);

  -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateMaxValueText
{
  void *v3;
  float v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PUAVKitMediaTimelineView maxValue](self, "maxValue");
  objc_msgSend(v3, "_stringFromTimeInterval:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAVKitMediaTimelineView setMaxValueText:](self, "setMaxValueText:", v5);

  -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateTimelineConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C8B428], "defaultConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0DC3510];
    v4 = (void *)MEMORY[0x1E0DC3658];
    -[PUAVKitMediaTimelineView whiteValue](self, "whiteValue");
    objc_msgSend(v4, "colorWithWhite:alpha:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_effectWithTintColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentValueVisualEffect:", v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaxValueVisualEffect:", v7);

  }
  objc_msgSend(MEMORY[0x1E0C8B430], "belowConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAVKitMediaTimelineView labelColor](self, "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v9);

  -[PUAVKitMediaTimelineView labelFont](self, "labelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextFont:", v10);

  objc_msgSend(v12, "setLabelsConfiguration:", v8);
  if (-[PUAVKitMediaTimelineView showsTimeLabels](self, "showsTimeLabels"))
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(v8, "setLabelsStyle:", v11);
  -[AVMediaTimelineControl setConfiguration:](self->_timelineControl, "setConfiguration:", v12);
  -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAVKitMediaTimelineView;
  -[PUAVKitMediaTimelineView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  -[PUAVKitMediaTimelineView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaTimelineControlIntrinsicContentSizeDidChange:", self);

}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  id v5;

  -[PUAVKitMediaTimelineView setCurrentValue:](self, "setCurrentValue:", a3);
  -[PUAVKitMediaTimelineView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaTimelineControlViewDidChangeValue:", self);

}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4;

  -[PUAVKitMediaTimelineView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaTimelineControlViewWillBeginChanging:", self);

}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4;

  -[PUAVKitMediaTimelineView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaTimelineControlViewDidEndChanging:", self);

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
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (float)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(float)a3
{
  self->_minValue = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (PUMediaTimelineViewDelegate)delegate
{
  return (PUMediaTimelineViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)currentValue
{
  return self->_currentValue;
}

- (NSArray)highlightedTimeRanges
{
  return self->_highlightedTimeRanges;
}

- (NSArray)timeRangeMarks
{
  return self->timeRangeMarks;
}

- (void)setTimeRangeMarks:(id)a3
{
  objc_storeStrong((id *)&self->timeRangeMarks, a3);
}

- (BOOL)showsTimeLabels
{
  return self->_showsTimeLabels;
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (AVMediaTimelineControl)timelineControl
{
  return self->_timelineControl;
}

- (NSString)maxValueText
{
  return self->_maxValueText;
}

- (void)setMaxValueText:(id)a3
{
  objc_storeStrong((id *)&self->_maxValueText, a3);
}

- (NSString)currentValueText
{
  return self->_currentValueText;
}

- (void)setCurrentValueText:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueText, 0);
  objc_storeStrong((id *)&self->_maxValueText, 0);
  objc_storeStrong((id *)&self->_timelineControl, 0);
  objc_storeStrong((id *)&self->timeRangeMarks, 0);
  objc_storeStrong((id *)&self->_highlightedTimeRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
}

id __49__PUAVKitMediaTimelineView__updateTimeRangeMarks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float Seconds;
  Float64 v5;
  double v6;
  CMTimeRange v8;
  CMTime time;
  CMTimeRange v10;

  memset(&v10, 0, sizeof(v10));
  if (a2)
    objc_msgSend(a2, "CMTimeRangeValue");
  v3 = objc_alloc(MEMORY[0x1E0C8B450]);
  *(_OWORD *)&v8.start.value = *(_OWORD *)&v10.start.value;
  v8.start.epoch = v10.start.epoch;
  Seconds = CMTimeGetSeconds(&v8.start);
  v8 = v10;
  CMTimeRangeGetEnd(&time, &v8);
  v5 = CMTimeGetSeconds(&time);
  *(float *)&v6 = v5;
  *(float *)&v5 = Seconds;
  return (id)objc_msgSend(v3, "initWithStartValue:endValue:identifier:markUIProvider:", &stru_1E58AD278, *(_QWORD *)(a1 + 32), v5, v6);
}

+ (id)_stringFromTimeInterval:(double)a3
{
  uint64_t *v4;

  if (_stringFromTimeInterval__onceToken != -1)
    dispatch_once(&_stringFromTimeInterval__onceToken, &__block_literal_global_30732);
  v4 = &_stringFromTimeInterval__hourMinuteSecondFormatter;
  if (a3 < 3600.0)
    v4 = &_stringFromTimeInterval__minuteSecondFormatter;
  return (id)objc_msgSend((id)*v4, "stringFromTimeInterval:", a3);
}

uint64_t __52__PUAVKitMediaTimelineView__stringFromTimeInterval___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_stringFromTimeInterval__minuteSecondFormatter;
  _stringFromTimeInterval__minuteSecondFormatter = (uint64_t)v0;

  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter, "setAllowedUnits:", 192);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter, "setUnitsStyle:", 0);
  objc_msgSend((id)_stringFromTimeInterval__minuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v3 = (void *)_stringFromTimeInterval__hourMinuteSecondFormatter;
  _stringFromTimeInterval__hourMinuteSecondFormatter = (uint64_t)v2;

  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter, "setAllowedUnits:", 224);
  objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter, "setUnitsStyle:", 0);
  return objc_msgSend((id)_stringFromTimeInterval__hourMinuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
}

@end
