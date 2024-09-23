@implementation PXFocusTimelineView

- (PXFocusTimelineView)initWithFrame:(CGRect)a3
{
  PXFocusTimelineView *v3;
  PXFocusTimelineView *v4;
  uint64_t v5;
  NSMutableArray *focusEvents;
  uint64_t v7;
  NSMutableArray *animatableFocusEvents;
  uint64_t v9;
  PXFocusTimelineEvent *objectTrackingEvent;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  UIImageView *trackImageView;
  uint64_t v18;
  UIView *focusEventsView;
  uint64_t v20;
  UIView *progressView;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXFocusTimelineView;
  v3 = -[PXFocusTimelineView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXFocusTimelineView setOpaque:](v3, "setOpaque:", 0);
    -[PXFocusTimelineView setDimmed:](v4, "setDimmed:", 1);
    v4->_viewCanBeEnabled = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    focusEvents = v4->_focusEvents;
    v4->_focusEvents = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    animatableFocusEvents = v4->_animatableFocusEvents;
    v4->_animatableFocusEvents = (NSMutableArray *)v7;

    v9 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v4->_currentTrackingTime.value = *MEMORY[0x1E0CA2E18];
    v4->_currentTrackingTime.epoch = *(_QWORD *)(v9 + 16);
    objectTrackingEvent = v4->_objectTrackingEvent;
    v4->_objectTrackingEvent = 0;

    v4->_zoomMinValue = 0.0;
    v4->_zoomMaxValue = 0.0;
    v11 = objc_alloc(MEMORY[0x1E0DC3890]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
    focusEventsView = v4->_focusEventsView;
    v4->_focusEventsView = (UIView *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v12, v13, v14, v15);
    progressView = v4->_progressView;
    v4->_progressView = (UIView *)v20;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_progressView, "setBackgroundColor:", v22);
    -[PXFocusTimelineView addSubview:](v4, "addSubview:", v4->_trackImageView);
    -[PXFocusTimelineView addSubview:](v4, "addSubview:", v4->_progressView);
    -[PXFocusTimelineView addSubview:](v4, "addSubview:", v4->_focusEventsView);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFocusTimelineView;
  -[PXFocusTimelineView layoutSubviews](&v3, sel_layoutSubviews);
  if (!-[PXFocusTimelineView skipLayoutUpdates](self, "skipLayoutUpdates"))
  {
    -[PXFocusTimelineView _trackFrame](self, "_trackFrame");
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    -[PXFocusTimelineView _updateTrack](self, "_updateTrack");
    -[PXFocusTimelineView bounds](self, "bounds");
    -[UIView setFrame:](self->_focusEventsView, "setFrame:");
    -[PXFocusTimelineView updateTimeline](self, "updateTimeline");
    -[PXFocusTimelineView _updateTrackingProgress](self, "_updateTrackingProgress");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[PXFocusTimelineView bounds](self, "bounds");
  -[PXFocusTimelineView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setZoomMinValue:(double)a3 maxValue:(double)a4
{
  self->_zoomed = 1;
  self->_zoomMinValue = a3;
  self->_zoomMaxValue = a4;
  -[PXFocusTimelineView setNeedsLayout](self, "setNeedsLayout");
  -[PXFocusTimelineView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)unzoom
{
  self->_zoomed = 0;
  -[PXFocusTimelineView setNeedsLayout](self, "setNeedsLayout");
  -[PXFocusTimelineView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)handleEventSelectedAtLocation:(CGPoint)a3
{
  void *v4;
  PXFocusTimelineAction *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  -[PXFocusTimelineView _eventAtLocation:threshold:](self, "_eventAtLocation:threshold:", a3.x, a3.y, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(PXFocusTimelineAction);
    objc_msgSend(v4, "time");
    v7 = v9;
    v8 = v10;
    -[PXFocusTimelineAction setTime:](v5, "setTime:", &v7);
    -[PXFocusTimelineAction setKind:](v5, "setKind:", 2 * (objc_msgSend(v4, "type") != 1));
    -[PXFocusTimelineView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    objc_msgSend(v6, "focusTimeline:presentAction:locationInTimeline:", self, v5);

  }
}

- (void)addFocusEvent:(id *)a3 userInitiated:(BOOL)a4 shouldAnimate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v8;
  PXFocusTimelineEvent *v9;
  PXFocusTimelineEvent *v10;
  void *v11;
  char v12;
  PXFocusTimelineEvent *objectTrackingEvent;
  PXFocusTimelineEvent *v14;
  CMTime time1;
  CMTime time2;

  v5 = a5;
  v8 = a4;
  v9 = [PXFocusTimelineEvent alloc];
  time2 = *(CMTime *)a3;
  v10 = -[PXFocusTimelineEvent initWithTime:type:](v9, "initWithTime:type:", &time2, v8);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("disableTimelineAnimations"));

  if ((v12 & 1) == 0)
  {
    if (v5)
    {
      objectTrackingEvent = self->_objectTrackingEvent;
      if (!objectTrackingEvent
        || (-[PXFocusTimelineEvent time](objectTrackingEvent, "time"), time2 = (CMTime)*a3,
                                                                       CMTimeCompare(&time1, &time2)))
      {
        -[PXFocusTimelineEvent setShouldAnimate:](v10, "setShouldAnimate:", 1);
        -[NSMutableArray addObject:](self->_animatableFocusEvents, "addObject:", v10);
        goto LABEL_8;
      }
      v14 = self->_objectTrackingEvent;
      self->_objectTrackingEvent = 0;

    }
    -[PXFocusTimelineEvent setShouldAnimate:](v10, "setShouldAnimate:", 0);
  }
LABEL_8:
  time2 = (CMTime)*a3;
  -[PXFocusTimelineView _trackPointFromTimestamp:](self, "_trackPointFromTimestamp:", &time2);
  -[PXFocusTimelineEvent setLocation:](v10, "setLocation:");
  -[NSMutableArray addObject:](self->_focusEvents, "addObject:", v10);

}

- (void)setTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_timeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    p_timeRange = &self->_timeRange;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range1.start.epoch = v6;
    *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
    v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&v10.start.epoch = v7;
    *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    if (!CMTimeRangeEqual(&range1, &v10))
    {
      v8 = *(_OWORD *)&a3->var0.var0;
      v9 = *(_OWORD *)&a3->var1.var1;
      *(_OWORD *)&p_timeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&p_timeRange->duration.timescale = v9;
      *(_OWORD *)&p_timeRange->start.value = v8;
      -[PXFocusTimelineView updateTimeline](self, "updateTimeline");
    }
  }
}

- (void)resetTimeline
{
  -[NSMutableArray removeAllObjects](self->_focusEvents, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_animatableFocusEvents, "removeAllObjects");
  -[PXFocusTimelineView setNeedsLayout](self, "setNeedsLayout");
  -[PXFocusTimelineView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = !self->_viewCanBeEnabled || a3;
  if (self->_dimmed != v3)
  {
    self->_dimmed = v3;
    -[PXFocusTimelineView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !v3);
    v5 = 0.3;
    if (!v3)
      v5 = 1.0;
    -[PXFocusTimelineView setAlpha:](self, "setAlpha:", v5);
  }
}

- (void)enableUIForCinematographyScriptLoad:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
  -[PXFocusTimelineView setDimmed:](self, "setDimmed:", !a3);
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  __int128 v5;
  PXFocusTimelineEvent *v6;
  PXFocusTimelineEvent *v7;
  PXFocusTimelineEvent *objectTrackingEvent;
  PXFocusTimelineAction *v9;
  void *v10;
  __int128 v11;
  int64_t var3;
  CMTime time;
  CMTimeRange range;

  if ((a3->var2 & 1) != 0)
  {
    v5 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.epoch = v5;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    time = *(CMTime *)a3;
    if (CMTimeRangeContainsTime(&range, &time))
    {
      if (!self->_objectTrackingEvent)
      {
        v6 = [PXFocusTimelineEvent alloc];
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
        range.start.epoch = a3->var3;
        v7 = -[PXFocusTimelineEvent initWithTime:type:](v6, "initWithTime:type:", &range, 1);
        objectTrackingEvent = self->_objectTrackingEvent;
        self->_objectTrackingEvent = v7;

        -[NSMutableArray addObject:](self->_focusEvents, "addObject:", self->_objectTrackingEvent);
        -[PXFocusTimelineView updateTimeline](self, "updateTimeline");
      }
      v9 = objc_alloc_init(PXFocusTimelineAction);
      v11 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[PXFocusTimelineAction setTime:](v9, "setTime:", &v11);
      -[PXFocusTimelineAction setKind:](v9, "setKind:", 1);
      -[PXFocusTimelineView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFocusTimelineEvent location](self->_objectTrackingEvent, "location");
      objc_msgSend(v10, "focusTimeline:presentAction:locationInTimeline:", self, v9);

      -[PXFocusTimelineView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    }
  }
}

- (void)updateObjectTrackingProgressAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  __int128 v7;
  void *v8;
  int64_t var3;
  CMTime v10;
  CMTimeRange range;

  if (self->_objectTrackingEvent && (a3->var2 & 1) != 0)
  {
    v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range.start.epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    v10 = *(CMTime *)a3;
    if (CMTimeRangeContainsTime(&range, &v10))
    {
      -[PXFocusTimelineView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "focusTimeline:updateTrackingProgressShouldStop:", self, a4);

      var3 = a3->var3;
      *(_OWORD *)&self->_currentTrackingTime.value = *(_OWORD *)&a3->var0;
      self->_currentTrackingTime.epoch = var3;
      -[PXFocusTimelineView _updateTrackingProgress](self, "_updateTrackingProgress");
    }
  }
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  void *v4;

  -[PXFocusTimelineView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideFocusTimelineActions:", self);

  self->_currentTrackingTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[UIView setFrame:](self->_progressView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PXFocusTimelineView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)_updateTrack
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  int v14;
  double Seconds;
  double v16;
  CGColorSpace *DeviceRGB;
  CGContext *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CGColor *v24;
  void *v25;
  id v26;
  CGColor *v27;
  double v28;
  double zoomMinValue;
  double v30;
  double v31;
  CGColor *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGColor *v39;
  CGImage *Image;
  void *v41;
  CGAffineTransform v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime time;
  CGRect v47;

  -[UIImageView layer](self->_trackImageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  -[PXFocusTimelineView _trackFrame](self, "_trackFrame");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = vcvtpd_s64_f64(v7 * v12);
  v14 = vcvtpd_s64_f64(v9 * v12);
  -[PXFocusTimelineView timeRange](self, "timeRange");
  time = v45;
  Seconds = CMTimeGetSeconds(&time);
  -[PXFocusTimelineView timeRange](self, "timeRange");
  v44 = v43;
  v16 = CMTimeGetSeconds(&v44);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18 = CGBitmapContextCreate(0, v13, v14, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v18)
  {
    v47.size.width = (double)v13;
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.height = (double)v14;
    CGContextClearRect(v18, v47);
    CGContextTranslateCTM(v18, 0.0, (double)v14);
    CGContextScaleCTM(v18, v12, -v12);
    CGContextGetCTM(&v42, v18);
    CGContextSetBaseCTM();
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFocusTimelineView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resolvedColorWithTraitCollection:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 0.6);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = (CGColor *)objc_msgSend(v23, "CGColor");

  -[PXFocusTimelineView traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resolvedColorWithTraitCollection:", v25);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = (CGColor *)objc_msgSend(v26, "CGColor");

  v28 = 1.0;
  CGContextSetLineWidth(v18, 1.0);
  if (self->_zoomed)
  {
    zoomMinValue = self->_zoomMinValue;
    if (zoomMinValue > v16)
      v30 = 2.0;
    else
      v30 = 0.0;
    if (zoomMinValue > v16)
      v31 = 2.0;
    else
      v31 = 6.0;
  }
  else
  {
    v31 = 6.0;
    v30 = 0.0;
  }
  CGContextBeginPath(v18);
  if (-[PXFocusTimelineView _isTickWithinActiveTrackRange:](self, "_isTickWithinActiveTrackRange:", 1.0))
    v32 = v27;
  else
    v32 = v24;
  CGContextSetStrokeColorWithColor(v18, v32);
  CGContextMoveToPoint(v18, 1.0, v30);
  CGContextAddLineToPoint(v18, 1.0, v30 + v31);
  CGContextStrokePath(v18);
  -[PXFocusTimelineView _zoomAdjustedTickGap](self, "_zoomAdjustedTickGap");
  v34 = v7 - v33;
  if (v7 - v33 > 1.0)
  {
    v35 = v33;
    do
    {
      v28 = v35 + v28;
      CGContextBeginPath(v18);
      if (-[PXFocusTimelineView _isTickWithinActiveTrackRange:](self, "_isTickWithinActiveTrackRange:", v28))
      {
        CGContextSetStrokeColorWithColor(v18, v27);
        CGContextMoveToPoint(v18, v28, 1.0);
        CGContextAddLineToPoint(v18, v28, 5.0);
      }
      else
      {
        CGContextMoveToPoint(v18, v28, 2.0);
        CGContextAddLineToPoint(v18, v28, 4.0);
        CGContextSetStrokeColorWithColor(v18, v24);
      }
      CGContextStrokePath(v18);
    }
    while (v28 < v34);
  }
  if (!self->_zoomed || (v36 = Seconds + v16, v37 = 2.0, v38 = 2.0, self->_zoomMaxValue >= v36))
  {
    v28 = v7 + -1.0;
    v38 = 6.0;
    v37 = 0.0;
  }
  CGContextBeginPath(v18);
  if (-[PXFocusTimelineView _isTickWithinActiveTrackRange:](self, "_isTickWithinActiveTrackRange:", v28))
    v39 = v27;
  else
    v39 = v24;
  CGContextSetStrokeColorWithColor(v18, v39);
  CGContextMoveToPoint(v18, v28, v37);
  CGContextAddLineToPoint(v18, v28, v37 + v38);
  CGContextStrokePath(v18);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  -[UIImageView setImage:](self->_trackImageView, "setImage:", v41);

}

- (void)updateTimeline
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *focusEvents;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _QWORD v21[5];
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXFocusTimelineView timeRange](self, "timeRange");
  if ((v22 & 1) != 0 && -[NSMutableArray count](self->_focusEvents, "count"))
  {
    -[UIView subviews](self->_focusEventsView, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v5, "BOOLForKey:", CFSTR("disableTimelineAnimations"));

    if ((_DWORD)v4)
    {
      focusEvents = self->_focusEvents;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __37__PXFocusTimelineView_updateTimeline__block_invoke;
      v21[3] = &unk_1E5133050;
      v21[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](focusEvents, "enumerateObjectsUsingBlock:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_focusEvents);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectsInArray:", self->_animatableFocusEvents);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __37__PXFocusTimelineView_updateTimeline__block_invoke_2;
      v20[3] = &unk_1E5133050;
      v20[4] = self;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v20);
      -[PXFocusTimelineView _updateTrack](self, "_updateTrack");
      if (-[NSMutableArray count](self->_animatableFocusEvents, "count"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFocusTimelineView _addEventToTimeline:atIndex:](self, "_addEventToTimeline:atIndex:", v8, 0);

      }
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_focusEvents;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "type", (_QWORD)v16) == 1)
          {
            -[PXFocusTimelineView _imageViewForFocusEvent:](self, "_imageViewForFocusEvent:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIView bringSubviewToFront:](self->_focusEventsView, "bringSubviewToFront:", v15);

          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v11);
    }

  }
}

- (void)_addEventToTimeline:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD aBlock[4];
  id v19;
  _QWORD *v20;
  id v21[3];
  id location;
  _QWORD v23[4];

  v6 = a3;
  if (!-[PXFocusTimelineView _isEventWithinZoomRange:](self, "_isEventWithinZoomRange:", v6))
  {
    -[PXFocusTimelineView _imageViewForFocusEvent:](self, "_imageViewForFocusEvent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = a4;
    v8 = -[NSMutableArray count](self->_animatableFocusEvents, "count");
    v9 = v8;
    v10 = 0;
    if (a4 && v8 > a4 - 1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "shouldAnimate");

    }
    if (v9 <= a4 + 1)
    {
      v12 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:", a4 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_initWeak(&location, self);
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke;
    aBlock[3] = &unk_1E51330B8;
    objc_copyWeak(v21, &location);
    v20 = v23;
    v21[1] = (id)(v9 - 1);
    v14 = v12;
    v19 = v14;
    v21[2] = (id)(a4 + 1);
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v6, "shouldAnimate"))
    {
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_3;
      v16[3] = &unk_1E5148A40;
      v17 = v15;
      -[PXFocusTimelineView _animateFocusChangeFrom:to:completion:](self, "_animateFocusChangeFrom:to:completion:", v6, v14, v16);

    }
    else
    {
      if ((v10 & 1) == 0)
        -[UIView addSubview:](self->_focusEventsView, "addSubview:", v7);
      v15[2](v15);
    }

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);

    _Block_object_dispose(v23, 8);
  }

}

- (id)_imageViewForFocusEvent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "time");
  else
    memset(v13, 0, sizeof(v13));
  -[PXFocusTimelineView _trackPointFromTimestamp:](self, "_trackPointFromTimestamp:", v13);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "setLocation:");
  if (objc_msgSend(v5, "type"))
    -[PXFocusTimelineView userInitiatedFocusEventMarkerImage](self, "userInitiatedFocusEventMarkerImage");
  else
    -[PXFocusTimelineView autoFocusEventMarkerImage](self, "autoFocusEventMarkerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v11, "setFrame:", v7, v9 + -7.0, 14.0, 14.0);
  objc_msgSend(v11, "setImage:", v10);

  return v11;
}

- (void)_animateFocusChangeFrom:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  NSMutableArray *focusEvents;
  void *v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  _QWORD aBlock[4];
  id v46;
  PXFocusTimelineView *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  PXFocusTimelineView *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXFocusTimelineView _imageViewForFocusEvent:](self, "_imageViewForFocusEvent:", v8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v41, "setOpacity:", v11);
  -[UIView addSubview:](self->_focusEventsView, "addSubview:", v42);
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__184857;
  v62 = __Block_byref_object_dispose__184858;
  v12 = v9;
  v63 = v12;
  if (v12)
    goto LABEL_3;
  focusEvents = self->_focusEvents;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke;
  v54[3] = &unk_1E51330E0;
  v55 = v8;
  v56 = self;
  v57 = &v58;
  -[NSMutableArray enumerateObjectsUsingBlock:](focusEvents, "enumerateObjectsUsingBlock:", v54);
  v12 = (id)v59[5];

  if (v12)
  {
LABEL_3:
    -[PXFocusTimelineView _imageViewForFocusEvent:](self, "_imageViewForFocusEvent:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "shouldAnimate"))
    {
      LODWORD(v15) = 0;
      objc_msgSend(v40, "setOpacity:", v15);
    }
    -[UIView addSubview:](self->_focusEventsView, "addSubview:", v14);
  }
  else
  {
    v40 = 0;
    v14 = 0;
  }
  v16 = -[NSMutableArray indexOfObject:](self->_animatableFocusEvents, "indexOfObject:", v8);
  v17 = -[NSMutableArray count](self->_animatableFocusEvents, "count");
  v18 = 0;
  if (v16 && v17 > v16 - 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_animatableFocusEvents, "objectAtIndexedSubscript:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "shouldAnimate");

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v39 = v10;
  LODWORD(v20) = 1036831949;
  LODWORD(v21) = 0.25;
  LODWORD(v22) = 0.25;
  LODWORD(v23) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v21, v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  objc_msgSend(v25, "setBeginTime:", CACurrentMediaTime() + 0.3);
  objc_msgSend(v25, "setRemovedOnCompletion:", 0);
  objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDuration:", 0.3);
  objc_msgSend(v26, "setTimingFunction:", v24);
  objc_msgSend(v26, "setFromValue:", &unk_1E53EFA80);
  objc_msgSend(v26, "setToValue:", &unk_1E53EFA90);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStiffness:", 600.0);
  objc_msgSend(v27, "setDamping:", 20.0);
  objc_msgSend(v27, "setFromValue:", &unk_1E53EFAA0);
  objc_msgSend(v27, "setToValue:", &unk_1E53EE580);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_60;
  aBlock[3] = &unk_1E5133108;
  v28 = v8;
  v46 = v28;
  v47 = self;
  v29 = v12;
  v48 = v29;
  v30 = v24;
  v49 = v30;
  v31 = v26;
  v50 = v31;
  v32 = v27;
  v51 = v32;
  v33 = v39;
  v53 = v33;
  v34 = v14;
  v52 = v34;
  v35 = _Block_copy(aBlock);
  v36 = v35;
  if (v18)
  {
    (*((void (**)(void *))v35 + 2))(v35);
  }
  else
  {
    v64[0] = v31;
    v64[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAnimations:", v37);

    v38 = (void *)MEMORY[0x1E0CD28B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_69;
    v43[3] = &unk_1E5148A40;
    v44 = v36;
    objc_msgSend(v38, "setCompletionBlock:", v43);
    objc_msgSend(v41, "addAnimation:forKey:", v25, CFSTR("appearAnimations"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
  _Block_object_dispose(&v58, 8);

}

- (void)_updateTrackingProgress
{
  PXFocusTimelineEvent *objectTrackingEvent;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v12;
  int64_t epoch;
  CGRect v14;
  CGRect v15;

  objectTrackingEvent = self->_objectTrackingEvent;
  if (objectTrackingEvent && (self->_currentTrackingTime.flags & 1) != 0)
  {
    -[PXFocusTimelineEvent location](objectTrackingEvent, "location");
    v5 = v4;
    v12 = *(_OWORD *)&self->_currentTrackingTime.value;
    epoch = self->_currentTrackingTime.epoch;
    -[PXFocusTimelineView _trackPointFromTimestamp:](self, "_trackPointFromTimestamp:", &v12);
    v7 = v6 - v5;
    -[PXFocusTimelineView _trackFrame](self, "_trackFrame");
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    CGRectGetMidY(v14);
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    CGRectGetMaxX(v15);
    if (v7 > 0.0)
      -[UIView setFrame:](self->_progressView, "setFrame:");
  }
}

- (CGRect)_trackFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect v6;

  -[PXFocusTimelineView bounds](self, "bounds");
  v6.size.width = v2 + -14.0;
  v6.origin.x = v3 + 7.0;
  *(float *)&v4 = (v4 + -6.0) * 0.5;
  v6.origin.y = v5 + roundf(*(float *)&v4);
  v6.size.height = 6.0;
  return CGRectIntegral(v6);
}

- (CGPoint)_trackPointFromTimestamp:(id *)a3
{
  int64_t var0;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double value;
  double v17;
  double v18;
  double v19;
  double MidY;
  double v21;
  CMTime v22;
  CMTime v23;
  uint64_t v24;
  uint64_t v25;
  CGPoint result;
  CGRect v27;

  var0 = a3->var0;
  -[PXFocusTimelineView _trackFrame](self, "_trackFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXFocusTimelineView timeRange](self, "timeRange");
  v14 = (double)v25;
  -[PXFocusTimelineView timeRange](self, "timeRange");
  v15 = (double)v24;
  CMTimeMakeWithSeconds(&v23, self->_zoomMinValue, a3->var1);
  value = (double)v23.value;
  CMTimeMakeWithSeconds(&v22, self->_zoomMaxValue, a3->var1);
  v17 = (double)v22.value - value;
  if (self->_zoomed && v17 > 0.0)
  {
    v18 = value;
  }
  else
  {
    v17 = v14;
    v18 = v15;
  }
  v19 = v11 * (((double)var0 - v18) / v17);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  MidY = CGRectGetMidY(v27);
  v21 = v19;
  result.y = MidY;
  result.x = v21;
  return result;
}

- (CGPoint)_closestTickPointToPointOnTrack:(CGPoint)a3
{
  CGFloat y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PXFocusTimelineView _zoomAdjustedTickGap](self, "_zoomAdjustedTickGap");
  v6 = v5 * round(x / v5);
  v7 = y;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)_eventAtLocation:(CGPoint)a3 threshold:(double)a4
{
  double x;
  void *v7;
  NSMutableArray *focusEvents;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  double v33;
  uint64_t v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  x = a3.x;
  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3.x, a3.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  focusEvents = self->_focusEvents;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __50__PXFocusTimelineView__eventAtLocation_threshold___block_invoke;
  v31[3] = &unk_1E5133130;
  v33 = x;
  v34 = 0x401C000000000000;
  v35 = a4;
  v9 = v7;
  v32 = v9;
  -[NSMutableArray enumerateObjectsUsingBlock:](focusEvents, "enumerateObjectsUsingBlock:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "location", (_QWORD)v27);
        v19 = v18 - x;
        if (v18 - x < a4)
        {
          v20 = v17;

          v14 = v20;
          a4 = v19;
        }
        if (objc_msgSend(v17, "type") == 1)
        {
          v21 = v17;

          v13 = v21;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  v22 = objc_msgSend(v14, "type");
  if (v13)
    v23 = v22 == 1;
  else
    v23 = 1;
  if (v23)
    v24 = v14;
  else
    v24 = v13;
  v25 = v24;

  return v25;
}

- (BOOL)_isEventWithinZoomRange:(id)a3
{
  id v4;
  void *v5;
  double zoomMinValue;
  double zoomMaxValue;
  int32_t v8;
  BOOL v9;
  CMTime v11;
  CMTime time1;
  CMTime time2;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CMTime v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CMTime v21;

  v4 = a3;
  v5 = v4;
  memset(&v21, 0, sizeof(v21));
  zoomMinValue = self->_zoomMinValue;
  if (v4)
  {
    objc_msgSend(v4, "time");
    LODWORD(v4) = v19;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  CMTimeMakeWithSeconds(&v21, zoomMinValue, (int32_t)v4);
  memset(&v17, 0, sizeof(v17));
  zoomMaxValue = self->_zoomMaxValue;
  if (v5)
  {
    objc_msgSend(v5, "time");
    v8 = v15;
  }
  else
  {
    v8 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  CMTimeMakeWithSeconds(&v17, zoomMaxValue, v8);
  if (!self->_zoomed)
    goto LABEL_17;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(&time2, 0, sizeof(time2));
  time1 = v21;
  if (CMTimeCompare(&time1, &time2) > 0)
    goto LABEL_12;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(&v11, 0, sizeof(v11));
  time1 = v17;
  if (CMTimeCompare(&time1, &v11) < 0)
LABEL_12:
    v9 = 1;
  else
LABEL_17:
    v9 = 0;

  return v9;
}

- (BOOL)_isTickWithinActiveTrackRange:(double)a3
{
  void *v5;
  char v6;
  NSMutableArray *focusEvents;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("disableTimelineAnimations"));

  if ((v6 & 1) != 0 || !-[NSMutableArray count](self->_focusEvents, "count"))
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  focusEvents = self->_focusEvents;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PXFocusTimelineView__isTickWithinActiveTrackRange___block_invoke;
  v10[3] = &unk_1E5133158;
  *(double *)&v10[6] = a3;
  v10[4] = self;
  v10[5] = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](focusEvents, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (double)_zoomAdjustedTickGap
{
  double v2;
  BOOL v3;
  double result;

  v2 = self->_zoomMaxValue - self->_zoomMinValue;
  v3 = v2 <= 0.0 || !self->_zoomed;
  result = 3.0 / (1.0 / v2) + 1.0;
  if (v3)
    return 4.0;
  return result;
}

- (id)_axDescriptionForFocusEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BYTE v8[24];

  if (!a3)
    return &stru_1E5149688;
  v4 = a3;
  -[PXFocusTimelineView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");

  objc_msgSend(v5, "axDescriptionForFocusEventATime:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIImage)autoFocusEventMarkerImage
{
  return 0;
}

- (UIImage)userInitiatedFocusEventMarkerImage
{
  return 0;
}

- (PXFocusTimelineViewDelegate)delegate
{
  return (PXFocusTimelineViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[11].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[11].var1.var1;
  return self;
}

- (BOOL)skipLayoutUpdates
{
  return self->_skipLayoutUpdates;
}

- (void)setSkipLayoutUpdates:(BOOL)a3
{
  self->_skipLayoutUpdates = a3;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)viewCanBeEnabled
{
  return self->_viewCanBeEnabled;
}

- (void)setViewCanBeEnabled:(BOOL)a3
{
  self->_viewCanBeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_objectTrackingEvent, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_focusEventsView, 0);
  objc_storeStrong((id *)&self->_trackImageView, 0);
  objc_storeStrong((id *)&self->_animatableFocusEvents, 0);
  objc_storeStrong((id *)&self->_focusEvents, 0);
}

void __53__PXFocusTimelineView__isTickWithinActiveTrackRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  _BYTE *v13;
  double v14;
  double v15;
  _BYTE *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a2;
  objc_msgSend(v7, "location");
  v9 = v8;
  v10 = a3 + 1;
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count");
  if (v11 <= v10)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = *(_BYTE **)(a1 + 32);
  if (v13[488])
  {
    if (v7)
    {
      objc_msgSend(v7, "time");
    }
    else
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
    }
    objc_msgSend(v13, "_trackPointFromTimestamp:", &v21);
    v9 = v14;
  }
  v15 = 0.0;
  if (v11 > v10)
  {
    v16 = *(_BYTE **)(a1 + 32);
    if (v16[488])
    {
      if (v12)
      {
        objc_msgSend(v12, "time");
      }
      else
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
      }
      objc_msgSend(v16, "_trackPointFromTimestamp:", &v18);
    }
    else
    {
      objc_msgSend(v12, "location");
    }
    v15 = v17;
  }
  if (objc_msgSend(v7, "type", v18, v19, v20, v21, v22, v23) == 1
    && *(id *)(*(_QWORD *)(a1 + 32) + 480) != v7
    && (objc_msgSend(v7, "shouldAnimate") & 1) == 0
    && *(double *)(a1 + 48) >= v9
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count") == v10 || v11 > v10 && *(double *)(a1 + 48) <= v15))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __50__PXFocusTimelineView__eventAtLocation_threshold___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "location");
  v7 = v6;
  v8 = *(double *)(a1 + 40);
  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  if (v8 >= v7 - v9 - v10 && v8 <= v7 + v9 + v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
    v8 = *(double *)(a1 + 40);
    v9 = *(double *)(a1 + 48);
    v10 = *(double *)(a1 + 56);
  }
  if (v7 > v8 + v9 + v10)
    *a4 = 1;

}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a1[4] == a2)
  {
    v4 = a3 + 1;
    if (a3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1[5] + 416), "count"))
    {
      objc_msgSend(*(id *)(a1[5] + 416), "objectAtIndexedSubscript:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1[6] + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_60(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double MaxX;
  double v7;
  double v8;
  CGFloat v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CGRect v34;

  objc_msgSend(MEMORY[0x1E0CD2828], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "location");
  objc_msgSend(*(id *)(a1 + 40), "_closestTickPointToPointOnTrack:");
  v4 = v3 + 1.0;
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    objc_msgSend(v5, "location");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_trackFrame");
    MaxX = CGRectGetMaxX(v34);
  }
  v7 = MaxX - v4 + 7.0;
  objc_msgSend(*(id *)(a1 + 40), "_zoomAdjustedTickGap");
  v9 = v8;
  v10 = (unint64_t)(v7 / v8);
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, v7, 6.0);
  objc_msgSend(v2, "setPosition:", v4 + v7 * 0.5, 4.0);
  objc_msgSend(v2, "setInstanceCount:", v10);
  objc_msgSend(v2, "setInstanceDelay:", 0.005);
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v32.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v32.m33 = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v32.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v32.m43 = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v32.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v32.m13 = v13;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v32.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v32.m23 = v14;
  CATransform3DTranslate(&v33, &v32, v9, 0.0, 0.0);
  v31 = v33;
  objc_msgSend(v2, "setInstanceTransform:", &v31);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0;
  objc_msgSend(v15, "setOpacity:", v16);
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, 1.0, 4.0);
  objc_msgSend(v15, "setPosition:", 0.0, 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));
  objc_msgSend(v2, "addSublayer:", v15);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDuration:", 0.1);
  objc_msgSend(v18, "setTimingFunction:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v18, "setFromValue:", &unk_1E53EFA80);
  objc_msgSend(v18, "setToValue:", &unk_1E53EFA90);
  objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v18, "setRemovedOnCompletion:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", v2);

  v20 = *(void **)(a1 + 48);
  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CD28B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_2;
    v23[3] = &unk_1E5139768;
    v29 = v10;
    v30 = 0x3F747AE147AE147BLL;
    v24 = v20;
    v25 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 72);
    v28 = *(id *)(a1 + 88);
    v27 = *(id *)(a1 + 80);
    objc_msgSend(v21, "setCompletionBlock:", v23);

  }
  else
  {
    v22 = dispatch_time(0, (uint64_t)((double)v10 * 0.005 * 1000000000.0));
    dispatch_after(v22, MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 88));
  }
  objc_msgSend(v15, "addAnimation:forKey:", v18, CFSTR("opacityAnimation"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_69(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__PXFocusTimelineView__animateFocusChangeFrom_to_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v2 = objc_alloc_init(MEMORY[0x1E0CD2700]);
  objc_msgSend(v2, "setBeginTime:", CACurrentMediaTime() + (double)*(unint64_t *)(a1 + 72) * *(double *)(a1 + 80));
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAnimate"))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v8[0] = v3;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAnimations:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStiffness:", 600.0);
    objc_msgSend(v3, "setDamping:", 20.0);
    objc_msgSend(v3, "setFromValue:", &unk_1E53EFAB0);
    objc_msgSend(v3, "setToValue:", &unk_1E53EE580);
    v7 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAnimations:", v4);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 56), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v2, CFSTR("appearAnimations"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_QWORD *)(a1 + 56))
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained[53], "enumerateObjectsUsingBlock:", &__block_literal_global_184882);
      objc_msgSend(v4, "_updateTrack");
LABEL_6:
      WeakRetained = v4;
      goto LABEL_7;
    }
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_addEventToTimeline:atIndex:", v3, *(_QWORD *)(a1 + 64));
      goto LABEL_6;
    }
  }
LABEL_7:

}

uint64_t __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PXFocusTimelineView__addEventToTimeline_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldAnimate:", 0);
}

void __37__PXFocusTimelineView_updateTimeline__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEventWithinZoomRange:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageViewForFocusEvent:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "addSubview:", v3);

  }
}

void __37__PXFocusTimelineView_updateTimeline__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEventWithinZoomRange:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_imageViewForFocusEvent:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "addSubview:", v3);

  }
}

@end
