@implementation RCWaveformViewController

- (RCWaveformViewController)initWithDisplayStyle:(unint64_t)a3 isOverview:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  RCWaveformViewController *v8;
  RCWaveformViewController *v9;
  RCApplicationWaveformRenderer *v10;
  RCWaveformRenderer *rendererController;
  double v12;
  double v13;
  UIView *v14;
  UIView *timeMarkerView;
  int v16;
  NSMutableArray *v17;
  NSMutableArray *timeMarkerViews;
  RCChronologicalAnnotationView *v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RCWaveformViewController;
  v8 = -[RCWaveformViewController init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    v8->_displayStyle = a3;
    v10 = objc_alloc_init(RCApplicationWaveformRenderer);
    rendererController = v9->_rendererController;
    v9->_rendererController = &v10->super;

    -[RCWaveformRenderer setRendererDelegate:](v9->_rendererController, "setRendererDelegate:", v9);
    v9->_isOverview = v6;
    if (a5 > 0.0 && v6)
      v12 = a5;
    else
      v12 = 6.0;
    v9->_visibleTimeRange.beginTime = RCTimeRangeMake(0.0, v12);
    v9->_visibleTimeRange.endTime = v13;
    -[RCWaveformRenderer setDisplayMode:](v9->_rendererController, "setDisplayMode:", !v6);
    v9->_highlightTimeRange = *($93AB83F55FD8EAABF5C634313E89AB95 *)RCTimeRangeInvalid;
    v9->_currentTimeDisplayOptions = 0;
    v9->_clipTimeMarkersToDuration = 1;
    v14 = objc_opt_new(UIView);
    timeMarkerView = v9->_timeMarkerView;
    v9->_timeMarkerView = v14;

    v9->_isCompactView = 1;
    v9->_desiredTimeDeltaForVisibleTimeRange = 6.0;
    if (!v9->_isOverview)
    {
      v16 = 3;
      v17 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
      timeMarkerViews = v9->_timeMarkerViews;
      v9->_timeMarkerViews = v17;

      do
      {
        v19 = objc_alloc_init(RCChronologicalAnnotationView);
        -[NSMutableArray addObject:](v9->_timeMarkerViews, "addObject:", v19);

        --v16;
      }
      while (v16);
    }
    -[RCWaveformViewController addChildViewController:](v9, "addChildViewController:", v9->_rendererController);
    -[RCWaveformRenderer didMoveToParentViewController:](v9->_rendererController, "didMoveToParentViewController:", v9);
    v9->_pointsPerSecond = 100.0;
    v9->_pointsPerSecondScale = 1.0;
  }
  return v9;
}

- (void)dealloc
{
  NSTimer *overlayAutoscrollTimer;
  RCWaveformRenderer *rendererController;
  objc_super v5;

  -[RCWaveformScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[RCWaveformRenderer setRendererDelegate:](self->_rendererController, "setRendererDelegate:", 0);
  -[NSTimer invalidate](self->_overlayAutoscrollTimer, "invalidate");
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  rendererController = self->_rendererController;
  self->_rendererController = 0;

  v5.receiver = self;
  v5.super_class = (Class)RCWaveformViewController;
  -[RCWaveformViewController dealloc](&v5, "dealloc");
}

- (id)scrollView
{
  return self->_scrollView;
}

- (RCWaveformDataSource)dataSource
{
  return -[RCWaveformRenderer dataSource](self->_rendererController, "dataSource");
}

- (void)setDataSource:(id)a3
{
  id v4;

  v4 = a3;
  -[RCWaveformViewController stopScrolling](self, "stopScrolling");
  -[RCWaveformRenderer setDataSource:](self->_rendererController, "setDataSource:", v4);

  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
  -[RCWaveformViewController _updateAnnotationViews](self, "_updateAnnotationViews");
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    self->_scrubbingEnabled = 0;
    -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  }
  else
  {
    self->_scrubbingEnabled = v3;
    -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v3);
    -[RCWaveformViewController enableZooming:](self, "enableZooming:", self->_scrubbingEnabled);
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[RCWaveformRenderer setFrequentUpdatesSegmentUpdatesExpectedHint:](self->_rendererController, "setFrequentUpdatesSegmentUpdatesExpectedHint:", 0);
    -[RCWaveformViewController _updateSelectionOverlayWithAnimationDuration:](self, "_updateSelectionOverlayWithAnimationDuration:", 0.0);
    -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
  }
}

- (void)setCapturing:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_capturing != a3)
  {
    v3 = a3;
    self->_capturing = a3;
    -[RCWaveformRenderer setCalcBlockShouldRefreshAllSlices:](self->_rendererController, "setCalcBlockShouldRefreshAllSlices:", 1);
    -[RCWaveformRenderer setIsLiveWaveform:](self->_rendererController, "setIsLiveWaveform:", v3);
    -[RCWaveformRenderer setFrequentUpdatesSegmentUpdatesExpectedHint:](self->_rendererController, "setFrequentUpdatesSegmentUpdatesExpectedHint:", v3);
    -[RCWaveformSelectionOverlay setIsRecording:](self->_selectionOverlay, "setIsRecording:", v3);
    -[RCWaveformViewController _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange](self, "_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange");
    -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
  }
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_editing != a3)
  {
    v3 = a3;
    self->_editing = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "setIsEditMode:", v3);
      v4 = v5;
    }

  }
}

- (void)setIsPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  self->_isPlayback = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
  if (v5)
    objc_msgSend(v5, "setIsPlayback:", v3);
  -[RCWaveformViewController updateBackgroundColor](self, "updateBackgroundColor");

}

- (void)setCurrentTimeDisplayOptions:(unint64_t)a3
{
  if (self->_currentTimeDisplayOptions != a3)
  {
    self->_currentTimeDisplayOptions = a3;
    -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
  }
}

- (void)setClipTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipTimeMarkersToDuration != a3)
    self->_clipTimeMarkersToDuration = a3;
  -[RCWaveformViewController _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange](self, "_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange");
}

- (void)setBlurred:(BOOL)a3
{
  if (self->_blurred != a3)
  {
    if (a3)
    {
      -[RCWaveformViewController _forceRenderingForBlurredStateChange](self, "_forceRenderingForBlurredStateChange");
      -[RCWaveformViewController addBlurEffect](self, "addBlurEffect");
    }
    else
    {
      -[RCWaveformViewController removeBlurEffect](self, "removeBlurEffect");
    }
    self->_blurred = a3;
  }
}

- (void)_forceRenderingForBlurredStateChange
{
  void *v3;
  void *v4;
  RCWaveformRenderer *rendererController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v3, "setNeedsLayout");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  -[RCWaveformRenderer setSyncRenderOnMainThread:](self->_rendererController, "setSyncRenderOnMainThread:", 1);
  -[RCWaveformRenderer setCalcBlockShouldRefreshAllSlices:](self->_rendererController, "setCalcBlockShouldRefreshAllSlices:", 1);
  rendererController = self->_rendererController;
  -[RCWaveformRenderer visibleTimeRange](rendererController, "visibleTimeRange");
  -[RCWaveformRenderer setVisibleTimeRange:](rendererController, "setVisibleTimeRange:");
  -[RCWaveformRenderer setSyncRenderOnMainThread:](self->_rendererController, "setSyncRenderOnMainThread:", 0);
}

- (void)addBlurEffect
{
  void *v3;
  void *v4;
  id v5;

  -[UIVisualEffectView setAlpha:](self->_blurEffectView, "setAlpha:", 1.0);
  -[UIVisualEffectView setAlpha:](self->_waveformExtraBlurEffectView, "setAlpha:", 1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v5, "waveformViewBlurEffectRadius");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:"));
  -[UIVisualEffectView setEffect:](self->_blurEffectView, "setEffect:", v3);
  objc_msgSend(v5, "waveformExtraBlurEffectRadius");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:"));
  -[UIVisualEffectView setEffect:](self->_waveformExtraBlurEffectView, "setEffect:", v4);

}

- (void)removeBlurEffect
{
  UIVisualEffectView *blurEffectView;
  void *v4;
  id v5;

  blurEffectView = self->_blurEffectView;
  if (blurEffectView)
  {
    -[UIVisualEffectView setAlpha:](blurEffectView, "setAlpha:", 0.0);
    -[UIVisualEffectView setAlpha:](self->_waveformExtraBlurEffectView, "setAlpha:", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 0.1));
    -[UIVisualEffectView setEffect:](self->_blurEffectView, "setEffect:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 0.1));
    -[UIVisualEffectView setEffect:](self->_waveformExtraBlurEffectView, "setEffect:", v5);

  }
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "annotationViewHeight");
  v9 = height - v8;

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)currentTimeIndicatorCoordinate
{
  double result;

  -[RCWaveformSelectionOverlay currentTimeIndicatorCoordinate](self->_selectionOverlay, "currentTimeIndicatorCoordinate");
  return result;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
}

- (void)setIsOverview:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  if (self->_isOverview != a3)
    self->_isOverview = a3;
  if (a3)
  {
    -[RCWaveformRenderer setDisplayMode:](self->_rendererController, "setDisplayMode:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "setIsCompactView:", 0);
    -[RCWaveformSelectionOverlay setHidden:](self->_selectionOverlay, "setHidden:", 0);
    -[UIView setHidden:](self->_selectionBackgroundView, "setHidden:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v8 = objc_msgSend(v7, "shouldShowOverviewWaveform");

    if (v8)
    {
      v9 = RCLocalizedFrameworkString(CFSTR("AX_OVERVIEW_WAVEFORM"), CFSTR("Full waveform AX label"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[RCWaveformSelectionOverlay setAccessibilityLabel:](self->_selectionOverlay, "setAccessibilityLabel:", v10);

    }
    -[RCWaveformSelectionOverlay setAxSegment:](self->_selectionOverlay, "setAxSegment:", 20.0);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v12 = objc_msgSend(v11, "shouldShowOverviewWaveform");

    if (v12)
      v13 = CFSTR("AX_DETAIL_WAVEFORM");
    else
      v13 = CFSTR("AX_WAVEFORM");
    v14 = RCLocalizedFrameworkString(v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[RCWaveformSelectionOverlay setAccessibilityLabel:](self->_selectionOverlay, "setAccessibilityLabel:", v15);

    -[RCWaveformSelectionOverlay setAxSegment:](self->_selectionOverlay, "setAxSegment:", 30.0);
  }
  -[RCWaveformSelectionOverlay setIsOverView:](self->_selectionOverlay, "setIsOverView:", v3);
}

- (void)setDuration:(double)a3
{
  double beginTime;
  double endTime;
  double v8;
  double v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (self->_duration == a3)
    return;
  self->_duration = a3;
  -[RCWaveformSelectionOverlay setAssetDuration:](self->_selectionOverlay, "setAssetDuration:", a3);
  if (-[RCWaveformSelectionOverlay isEditingEnabled](self->_selectionOverlay, "isEditingEnabled"))
  {
    beginTime = self->_selectedTimeRange.beginTime;
    endTime = self->_selectedTimeRange.endTime;
    if (endTime <= beginTime)
    {
      if (endTime <= a3 && beginTime <= a3)
      {
LABEL_14:
        if ((RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, beginTime, endTime) & 1) == 0)-[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 1, 0, beginTime, endTime, 0.0);
        goto LABEL_16;
      }
      v8 = a3;
    }
    else
    {
      if (beginTime < a3)
      {
        if (endTime > a3)
          self->_selectedTimeRange.endTime = a3;
        goto LABEL_14;
      }
      v8 = 0.0;
    }
    beginTime = RCTimeRangeMake(v8, a3);
    endTime = v9;
    goto LABEL_14;
  }
LABEL_16:
  if (self->_clipTimeMarkersToDuration)
    -[RCWaveformViewController _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange](self, "_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_timeMarkerViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "setContentDuration:", self->_duration, (_QWORD)v15);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
}

- (void)updateVisibleTimeRangeToFullDuration
{
  double duration;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  unsigned int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;

  duration = self->_duration;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "duration");
  v6 = v5;

  if (duration < v6)
    duration = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "overviewWaveformMinimumDurationToDisplayWhenRecording");
  v9 = v8;

  v10 = -[RCWaveformViewController isPlayback](self, "isPlayback");
  if (duration >= v9)
    v11 = 1;
  else
    v11 = v10;
  if (v11)
    v12 = duration;
  else
    v12 = v9;
  v13 = RCTimeRangeMake(0.0, v12);
  v15 = v14;
  -[RCWaveformViewController setDesiredTimeDeltaForVisibleTimeRange:](self, "setDesiredTimeDeltaForVisibleTimeRange:", RCTimeRangeDelta(v13, v14));
  -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v13, v15, 0.0);
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1;
  double var0;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[RCWaveformViewController isOverview](self, "isOverview"))
    -[RCWaveformViewController updateVisibleTimeRangeToFullDuration](self, "updateVisibleTimeRangeToFullDuration");
  else
    -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", var0, var1, 0.0);
}

- (void)setVisibleTimeRange:(id)a3 animationDuration:(double)a4
{
  -[RCWaveformViewController _setVisibleTimeRange:animationDuration:completionBlock:](self, "_setVisibleTimeRange:animationDuration:completionBlock:", 0, a3.var0, a3.var1, a4);
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1;
  double var0;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_highlightTimeRange;

  var1 = a3.var1;
  var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_highlightTimeRange.beginTime, self->_highlightTimeRange.endTime, a3.var0, a3.var1) & 1) == 0)
  {
    p_highlightTimeRange->beginTime = var0;
    p_highlightTimeRange->endTime = var1;
    -[RCWaveformRenderer setHighlightTimeRange:](self->_rendererController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_rendererController)
  {
    -[RCWaveformRenderer highlightTimeRange](self->_rendererController, "highlightTimeRange");
  }
  else
  {
    beginTime = self->_highlightTimeRange.beginTime;
    endTime = self->_highlightTimeRange.endTime;
  }
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeByInsettingVisibleTimeRange:(id)a3 inset:(double)a4
{
  double var1;
  double var0;
  double v7;
  double v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self->_rendererController, "pointsPerSecondWithVisibleTimeRange:");
  v8 = 1.0 / v7 * a4;
  v9 = var0 - v8;
  v10 = var1 + v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
  -[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 1, 1, a3.var0, a3.var1, a4);
}

- (void)setSelectedTimeRange:(id)a3
{
  -[RCWaveformViewController setSelectedTimeRange:animationDuration:](self, "setSelectedTimeRange:animationDuration:", a3.var0, a3.var1, 0.0);
}

- (void)setMaximumSelectionDuration:(double)a3
{
  self->_maximumSelectionDuration = a3;
  -[RCWaveformViewController maximumSelectionDuration](self, "maximumSelectionDuration");
  -[RCWaveformSelectionOverlay setSelectedTimeRangeMaximumDuration:](self->_selectionOverlay, "setSelectedTimeRangeMaximumDuration:");
}

- (void)setSelectedTimeRangeEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_selectedTimeRangeEditingEnabled = a3;
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
  -[RCWaveformSelectionOverlay setInsertMode:](self->_selectionOverlay, "setInsertMode:", -[RCWaveformViewController selectionOverlayShouldUseInsertMode](self, "selectionOverlayShouldUseInsertMode"));
  -[RCWaveformSelectionOverlay setEditingEnabled:](self->_selectionOverlay, "setEditingEnabled:", v3);
  -[RCWaveformViewController _layoutTimeMarkerViewsForCurrentlyVisibleTimeRange](self, "_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange");
}

- (BOOL)isSelectionOverlayCurrentlyTracking
{
  return -[RCWaveformSelectionOverlay isCurrentlyTracking](self->_selectionOverlay, "isCurrentlyTracking");
}

- (void)enableWaveformScrolling:(BOOL)a3
{
  -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", a3);
}

- (void)resetZoomScale
{
  double layoutWidth;
  double v4;

  self->_pointsPerSecond = 100.0;
  self->_pointsPerSecondScale = 1.0;
  layoutWidth = self->_layoutWidth;
  -[RCWaveformViewController pointsPerSecond](self, "pointsPerSecond");
  -[RCWaveformViewController setDesiredTimeDeltaForVisibleTimeRange:](self, "setDesiredTimeDeltaForVisibleTimeRange:", layoutWidth / v4);
  -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
  -[RCWaveformViewController fixupScrollPositionToMatchIndicatorPositionTime](self, "fixupScrollPositionToMatchIndicatorPositionTime");
}

- (double)pointsPerSecond
{
  return self->_pointsPerSecond * self->_pointsPerSecondScale;
}

- (void)scaleWaveform:(id)a3
{
  double v5;
  double v6;
  double v7;
  double layoutWidth;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "scale");
  if (objc_msgSend(v12, "state") == (id)1 || objc_msgSend(v12, "state") == (id)2)
  {
    objc_msgSend(v12, "scale");
    v6 = v5 * self->_pointsPerSecondScale;
    self->_pointsPerSecondScale = v6;
    v7 = 4.0;
    if (v6 > 4.0 || (v7 = 0.01, v6 < 0.01))
      self->_pointsPerSecondScale = v7;
    objc_msgSend(v12, "setScale:", 1.0);
    layoutWidth = self->_layoutWidth;
    -[RCWaveformViewController pointsPerSecond](self, "pointsPerSecond");
    -[RCWaveformViewController setDesiredTimeDeltaForVisibleTimeRange:](self, "setDesiredTimeDeltaForVisibleTimeRange:", layoutWidth / v9);
    -[RCWaveformViewController pointsPerSecond](self, "pointsPerSecond");
    v11 = 100.0 / v10;
    if (v11 > 2.0)
      v11 = 2.0;
    -[RCWaveformSelectionOverlay setSelectedTimeRangeMinimumDuration:](self->_selectionOverlay, "setSelectedTimeRangeMinimumDuration:", v11);
    -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
    -[RCWaveformViewController fixupScrollPositionToMatchIndicatorPositionTime](self, "fixupScrollPositionToMatchIndicatorPositionTime");
  }

}

- (void)enableZooming:(BOOL)a3
{
  _BOOL8 v3;
  UIPinchGestureRecognizer *pinchGesture;
  UIPinchGestureRecognizer *v6;
  UIPinchGestureRecognizer *v7;

  v3 = a3;
  if (!-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    pinchGesture = self->_pinchGesture;
    if (!pinchGesture)
    {
      -[RCWaveformScrollView setBouncesZoom:](self->_scrollView, "setBouncesZoom:", 0);
      -[RCWaveformScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", 2.0);
      -[RCWaveformScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", 0.5);
      v6 = (UIPinchGestureRecognizer *)objc_claimAutoreleasedReturnValue(-[RCWaveformScrollView pinchGestureRecognizer](self->_scrollView, "pinchGestureRecognizer"));
      v7 = self->_pinchGesture;
      self->_pinchGesture = v6;

      -[UIPinchGestureRecognizer addTarget:action:](self->_pinchGesture, "addTarget:action:", self, "scaleWaveform:");
      pinchGesture = self->_pinchGesture;
    }
    -[UIPinchGestureRecognizer setEnabled:](pinchGesture, "setEnabled:", v3);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  CGFloat Width;
  void *v5;
  CGFloat Height;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v23);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v24);

  if (self->_layoutWidth != Width || self->_layoutHeight != Height)
  {
    self->_layoutWidth = Width;
    self->_layoutHeight = Height;
    -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v9, "annotationViewHeight");
    v11 = v8 - v10;
    -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v14, "annotationViewHeight");
    -[UIView setFrame:](self->_timeMarkerView, "setFrame:", 0.0, v11, v13, v15);

    -[RCWaveformViewController selectedTimeRange](self, "selectedTimeRange");
    if (RCTimeRangeDeltaWithUIPrecision(v16, v17) < 4.4408921e-16)
      -[RCWaveformViewController fixupScrollPositionToMatchIndicatorPositionTime](self, "fixupScrollPositionToMatchIndicatorPositionTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    objc_msgSend(v18, "frame");
    v20 = v19;

    v21 = 6.0;
    if (v20 > 0.0)
    {
      -[RCWaveformViewController pointsPerSecond](self, "pointsPerSecond", 6.0);
      v21 = Width / v22;
    }
    -[RCWaveformViewController setDesiredTimeDeltaForVisibleTimeRange:](self, "setDesiredTimeDeltaForVisibleTimeRange:", v21);
    -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
    -[RCWaveformViewController reloadOverlayOffsets](self, "reloadOverlayOffsets");
  }
}

- (void)reloadOverlayOffsets
{
  -[RCWaveformSelectionOverlay reloadSelectionOffsets](self->_selectionOverlay, "reloadSelectionOffsets");
}

- (void)setIsCompactView:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_isCompactView = a3;
  -[UIView setHidden:](self->_timeMarkerView, "setHidden:");
  v5 = v3 && !self->_showPlayBarOnly;
  -[RCWaveformSelectionOverlay setHidden:](self->_selectionOverlay, "setHidden:", v5);
  -[UIView setHidden:](self->_selectionBackgroundView, "setHidden:", v3);
  -[UIView setHidden:](self->_backgroundWaveFormHighlightView, "setHidden:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
  if (v7)
    objc_msgSend(v7, "setIsCompactView:", v3);
  -[RCWaveformViewController updateBackgroundColor](self, "updateBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v6, "setNeedsLayout");

}

- (BOOL)isCompactView
{
  return self->_isCompactView;
}

- (void)setShowPlayBarOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  id v7;

  v3 = a3;
  self->_showPlayBarOnly = a3;
  -[RCWaveformSelectionOverlay setPlayBarOnly:](self->_selectionOverlay, "setPlayBarOnly:");
  if (self->_isCompactView && v3)
    -[RCWaveformSelectionOverlay setHidden:](self->_selectionOverlay, "setHidden:", 0);
  -[RCWaveformSelectionOverlay setSelectionMode:](self->_selectionOverlay, "setSelectionMode:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setIsPlayBarOnlyMode:", v3);
    v6 = v7;
  }

}

- (void)viewDidLoad
{
  RCWaveformScrollView *v3;
  void *v4;
  RCWaveformScrollView *v5;
  RCWaveformScrollView *scrollView;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  double v18;
  double left;
  double right;
  double bottom;
  void *v22;
  double v23;
  RCWaveformSelectionOverlay *v24;
  double v25;
  RCWaveformSelectionOverlay *v26;
  RCWaveformSelectionOverlay *selectionOverlay;
  _BOOL8 v28;
  RCWaveformSelectionOverlay *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  UIView *v34;
  UIView *selectionBackgroundView;
  UIView *v36;
  UIView *backgroundView;
  UIView *v38;
  UIView *backgroundWaveFormHighlightView;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  UIView *v63;
  void *v64;
  void *v65;
  double v66;
  UIView *v67;
  void *v68;
  void *v69;
  double v70;
  UIView *v71;
  void *v72;
  void *v73;
  double v74;
  UIView *v75;
  void *v76;
  NSLayoutConstraint *v77;
  NSLayoutConstraint *backgroundBottomToBottomConstraint;
  double v79;
  NSLayoutConstraint *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  NSLayoutConstraint *v100;
  NSLayoutConstraint *renderViewBottomInsetConstraint;
  double v102;
  NSLayoutConstraint *v103;
  void *v104;
  void *v105;
  RCWaveformScrollView *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  RCWaveformScrollView *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  RCWaveformScrollView *v116;
  void *v117;
  void *v118;
  double v119;
  RCWaveformScrollView *v120;
  void *v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  UIView *v126;
  void *v127;
  NSLayoutConstraint *v128;
  NSLayoutConstraint *backgroundWaveFormHighlightViewLeftAlignment;
  double v130;
  UIView *v131;
  void *v132;
  NSLayoutConstraint *v133;
  NSLayoutConstraint *backgroundWaveFormHighlightViewRightAlignment;
  double v135;
  UIView *v136;
  void *v137;
  void *v138;
  double v139;
  UIView *v140;
  void *v141;
  NSLayoutConstraint *v142;
  NSLayoutConstraint *backgroundWaveformHighlightViewBottomToBottom;
  double v144;
  NSLayoutConstraint *v145;
  NSLayoutConstraint *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  UIVisualEffectView *blurEffectView;
  void *v160;
  void *v161;
  void *v162;
  double v163;
  UIVisualEffectView *v164;
  void *v165;
  void *v166;
  double v167;
  UIVisualEffectView *v168;
  void *v169;
  void *v170;
  double v171;
  UIVisualEffectView *v172;
  void *v173;
  double v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  UIVisualEffectView *waveformExtraBlurEffectView;
  void *v180;
  void *v181;
  double v182;
  UIVisualEffectView *v183;
  void *v184;
  void *v185;
  double v186;
  UIVisualEffectView *v187;
  void *v188;
  void *v189;
  double v190;
  UIVisualEffectView *v191;
  void *v192;
  void *v193;
  double v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  objc_super v227;
  void *v228;
  _QWORD v229[4];
  _QWORD v230[4];
  _QWORD v231[4];
  _QWORD v232[4];
  _QWORD v233[4];
  _QWORD v234[4];
  _QWORD v235[4];
  _BYTE v236[128];

  v227.receiver = self;
  v227.super_class = (Class)RCWaveformViewController;
  -[RCWaveformViewController viewDidLoad](&v227, "viewDidLoad");
  v3 = [RCWaveformScrollView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = -[RCWaveformScrollView initWithFrame:](v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[RCWaveformScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
  -[RCWaveformScrollView setDirectionalLockEnabled:](self->_scrollView, "setDirectionalLockEnabled:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RCWaveformScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v7);

  -[RCWaveformScrollView setBounces:](self->_scrollView, "setBounces:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  -[RCWaveformScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v9 * 0.5, 0.0, 0.0);

  -[RCWaveformScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[RCWaveformScrollView setOpaque:](self->_scrollView, "setOpaque:", 0);
  -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  -[RCWaveformScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[RCWaveformScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer"));
  objc_msgSend(v10, "addTarget:action:", self, "_scrollViewPanGestureRecognized:");

  -[RCWaveformScrollView addSubview:](self->_scrollView, "addSubview:", self->_timeMarkerView);
  -[UIView setHidden:](self->_timeMarkerView, "setHidden:", -[RCWaveformViewController isCompactView](self, "isCompactView"));
  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  v11 = self->_timeMarkerViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v224;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v224 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
        objc_msgSend(v17, "annotationViewHeight");
        objc_msgSend(v16, "setFrame:", 0.0, 0.0, 0.0, v18);

        -[UIView addSubview:](self->_timeMarkerView, "addSubview:", v16);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v223, v236, 16);
    }
    while (v13);
  }

  -[RCWaveformViewController _setTimeMarkerViewsNeedInitialLayout:](self, "_setTimeMarkerViewsNeedInitialLayout:", 1);
  left = UIEdgeInsetsZero.left;
  right = UIEdgeInsetsZero.right;
  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    bottom = UIEdgeInsetsZero.bottom;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v22, "annotationViewHeight");
    bottom = v23;

  }
  v24 = [RCWaveformSelectionOverlay alloc];
  -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
  v26 = -[RCWaveformSelectionOverlay initWithDelegate:height:selectionAreaInsets:](v24, "initWithDelegate:height:selectionAreaInsets:", self, v25, UIEdgeInsetsZero.top, left, bottom, right);
  selectionOverlay = self->_selectionOverlay;
  self->_selectionOverlay = v26;

  -[RCWaveformSelectionOverlay setSelectedTimeRangeMinimumDuration:](self->_selectionOverlay, "setSelectedTimeRangeMinimumDuration:", 1.0);
  v28 = -[RCWaveformViewController isOverview](self, "isOverview");
  v29 = self->_selectionOverlay;
  if (v28)
  {
    -[RCWaveformSelectionOverlay setOverviewTrimHandleStyle:](v29, "setOverviewTrimHandleStyle:", 1);
    -[RCWaveformSelectionOverlay setBarMatchesKnobRadius:](self->_selectionOverlay, "setBarMatchesKnobRadius:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v30, "overviewKnobWidthMultiplier");
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v31, "overviewPlayheadWidthMultiplier");
  }
  else
  {
    -[RCWaveformSelectionOverlay setOverviewTrimHandleStyle:](v29, "setOverviewTrimHandleStyle:", 0);
    -[RCWaveformSelectionOverlay setBarMatchesKnobRadius:](self->_selectionOverlay, "setBarMatchesKnobRadius:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v32, "knobWidthMultiplier");
    -[RCWaveformSelectionOverlay setKnobWidthMultiplier:](self->_selectionOverlay, "setKnobWidthMultiplier:");

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v31, "playheadWidthMultiplier");
  }
  -[RCWaveformSelectionOverlay setPlayWidthMultiplier:](self->_selectionOverlay, "setPlayWidthMultiplier:");

  -[RCWaveformSelectionOverlay setEnableTimeTrackingInView:](self->_selectionOverlay, "setEnableTimeTrackingInView:", v28);
  v33 = 0.0;
  v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  selectionBackgroundView = self->_selectionBackgroundView;
  self->_selectionBackgroundView = v34;

  -[RCWaveformSelectionOverlay setSelectionBackgroundView:](self->_selectionOverlay, "setSelectionBackgroundView:", self->_selectionBackgroundView);
  v36 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v36;

  v38 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  backgroundWaveFormHighlightView = self->_backgroundWaveFormHighlightView;
  self->_backgroundWaveFormHighlightView = v38;

  -[RCWaveformViewController updateColors](self, "updateColors");
  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v40, "overviewWaveformCornerRadius");
    v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v43, "setCornerRadius:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v44, "setMasksToBounds:", 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v45, "overviewWaveformCornerRadius");
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundWaveFormHighlightView, "layer"));
    objc_msgSend(v48, "setCornerRadius:", v47);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundWaveFormHighlightView, "layer"));
    objc_msgSend(v49, "setMasksToBounds:", 1);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v50, "overviewWaveformCornerRadius");
    v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
    objc_msgSend(v54, "setCornerRadius:", v52);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layer"));
    objc_msgSend(v56, "setMasksToBounds:", 1);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v57, "addSubview:", self->_backgroundView);

  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v58, "selectionOverlayBorderWidth");
    v33 = v59;

  }
  v60 = -v33;
  if (!-[RCWaveformViewController isCompactView](self, "isCompactView"))
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v61, "annotationViewHeight");
    v60 = v60 - v62;

  }
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v63 = self->_backgroundView;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 1, 0, v64, 1, 1.0, 0.0));

  v221 = v65;
  LODWORD(v66) = 1144750080;
  objc_msgSend(v65, "setPriority:", v66);
  v67 = self->_backgroundView;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 2, 0, v68, 2, 1.0, 0.0));

  v220 = v69;
  LODWORD(v70) = 1144750080;
  objc_msgSend(v69, "setPriority:", v70);
  v71 = self->_backgroundView;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v71, 3, 0, v72, 3, 1.0, v33));

  v219 = v73;
  LODWORD(v74) = 1144750080;
  objc_msgSend(v73, "setPriority:", v74);
  v75 = self->_backgroundView;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v77 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v75, 4, 0, v76, 4, 1.0, v60));
  backgroundBottomToBottomConstraint = self->_backgroundBottomToBottomConstraint;
  self->_backgroundBottomToBottomConstraint = v77;

  LODWORD(v79) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_backgroundBottomToBottomConstraint, "setPriority:", v79);
  v235[0] = v65;
  v235[1] = v69;
  v80 = self->_backgroundBottomToBottomConstraint;
  v235[2] = v73;
  v235[3] = v80;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v235, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  objc_msgSend(v82, "setUserInteractionEnabled:", 0);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  objc_msgSend(v83, "addSubview:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  objc_msgSend(v85, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v86, 1, 0, v87, 1, 1.0, 0.0));

  v218 = v88;
  LODWORD(v89) = 1144750080;
  objc_msgSend(v88, "setPriority:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v90, 2, 0, v91, 2, 1.0, 0.0));

  v217 = v92;
  LODWORD(v93) = 1144750080;
  objc_msgSend(v92, "setPriority:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v94, 3, 0, v95, 3, 1.0, v33));

  v216 = v96;
  LODWORD(v97) = 1144750080;
  objc_msgSend(v96, "setPriority:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v100 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v98, 4, 0, v99, 4, 1.0, 0.0));
  renderViewBottomInsetConstraint = self->_renderViewBottomInsetConstraint;
  self->_renderViewBottomInsetConstraint = v100;

  -[NSLayoutConstraint setConstant:](self->_renderViewBottomInsetConstraint, "setConstant:", v60);
  LODWORD(v102) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_renderViewBottomInsetConstraint, "setPriority:", v102);
  v234[0] = v88;
  v234[1] = v92;
  v103 = self->_renderViewBottomInsetConstraint;
  v234[2] = v96;
  v234[3] = v103;
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v234, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v104);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v105, "addSubview:", self->_scrollView);

  -[RCWaveformScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v106 = self->_scrollView;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v106, 1, 0, v107, 1, 1.0, 0.0));

  v109 = v108;
  v213 = v108;
  LODWORD(v110) = 1144750080;
  objc_msgSend(v108, "setPriority:", v110);
  v111 = self->_scrollView;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v111, 2, 0, v112, 2, 1.0, 0.0));

  v114 = v113;
  v212 = v113;
  LODWORD(v115) = 1144750080;
  objc_msgSend(v113, "setPriority:", v115);
  v116 = self->_scrollView;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v116, 3, 0, v117, 3, 1.0, 0.0));

  v211 = v118;
  LODWORD(v119) = 1144750080;
  objc_msgSend(v118, "setPriority:", v119);
  v120 = self->_scrollView;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v120, 4, 0, v121, 4, 1.0, 0.0));

  LODWORD(v122) = 1144750080;
  objc_msgSend(v210, "setPriority:", v122);
  v233[0] = v109;
  v233[1] = v114;
  v233[2] = v118;
  v233[3] = v210;
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v233, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v123);

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v124, "sendSubviewToBack:", self->_backgroundView);

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v125, "insertSubview:aboveSubview:", self->_backgroundWaveFormHighlightView, self->_backgroundView);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundWaveFormHighlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v126 = self->_backgroundWaveFormHighlightView;
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v128 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v126, 1, 0, v127, 1, 1.0, 0.0));
  backgroundWaveFormHighlightViewLeftAlignment = self->_backgroundWaveFormHighlightViewLeftAlignment;
  self->_backgroundWaveFormHighlightViewLeftAlignment = v128;

  LODWORD(v130) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_backgroundWaveFormHighlightViewLeftAlignment, "setPriority:", v130);
  v131 = self->_backgroundWaveFormHighlightView;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v133 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v131, 2, 0, v132, 2, 1.0, 0.0));
  backgroundWaveFormHighlightViewRightAlignment = self->_backgroundWaveFormHighlightViewRightAlignment;
  self->_backgroundWaveFormHighlightViewRightAlignment = v133;

  LODWORD(v135) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_backgroundWaveFormHighlightViewRightAlignment, "setPriority:", v135);
  v136 = self->_backgroundWaveFormHighlightView;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v136, 3, 0, v137, 3, 1.0, v33));

  v209 = v138;
  LODWORD(v139) = 1144750080;
  objc_msgSend(v138, "setPriority:", v139);
  v140 = self->_backgroundWaveFormHighlightView;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v142 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v140, 4, 0, v141, 4, 1.0, v60));
  backgroundWaveformHighlightViewBottomToBottom = self->_backgroundWaveformHighlightViewBottomToBottom;
  self->_backgroundWaveformHighlightViewBottomToBottom = v142;

  LODWORD(v144) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_backgroundWaveformHighlightViewBottomToBottom, "setPriority:", v144);
  v145 = self->_backgroundWaveFormHighlightViewRightAlignment;
  v232[0] = self->_backgroundWaveFormHighlightViewLeftAlignment;
  v232[1] = v145;
  v146 = self->_backgroundWaveformHighlightViewBottomToBottom;
  v232[2] = v138;
  v232[3] = v146;
  v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v232, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v147);

  -[UIView setHidden:](self->_selectionBackgroundView, "setHidden:", self->_isCompactView);
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v148, "insertSubview:aboveSubview:", self->_selectionBackgroundView, self->_backgroundWaveFormHighlightView);

  -[RCWaveformSelectionOverlay setHidden:](self->_selectionOverlay, "setHidden:", self->_isCompactView);
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v149, "addSubview:", self->_selectionOverlay);

  -[RCWaveformSelectionOverlay setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionOverlay, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectionOverlay, 1, 0, self->_scrollView, 1, 1.0, 0.0));
  LODWORD(v150) = 1144750080;
  objc_msgSend(v215, "setPriority:", v150);
  v214 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectionOverlay, 2, 0, self->_scrollView, 2, 1.0, 0.0));
  LODWORD(v151) = 1144750080;
  objc_msgSend(v214, "setPriority:", v151);
  v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectionOverlay, 3, 0, self->_scrollView, 3, 1.0, 0.0));
  LODWORD(v152) = 1144750080;
  objc_msgSend(v208, "setPriority:", v152);
  v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_selectionOverlay, 4, 0, self->_scrollView, 4, 1.0, 0.0));
  LODWORD(v153) = 1144750080;
  objc_msgSend(v207, "setPriority:", v153);
  v231[0] = v215;
  v231[1] = v214;
  v231[2] = v208;
  v231[3] = v207;
  v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v231, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v154);

  v206 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 0.1));
  v155 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v206);
  objc_msgSend(v155, "setAlpha:", 0.0);
  objc_storeStrong((id *)&self->_blurEffectView, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v205 = v155;
  objc_msgSend(v156, "addSubview:", v155);

  v157 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v157, "bringSubviewToFront:", v155);

  v158 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v158, "bringSubviewToFront:", self->_selectionOverlay);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  blurEffectView = self->_blurEffectView;
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", blurEffectView, 1, 0, v160, 1, 1.0, 0.0));

  v162 = v161;
  v222 = v161;
  LODWORD(v163) = 1144750080;
  objc_msgSend(v161, "setPriority:", v163);
  v164 = self->_blurEffectView;
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v164, 2, 0, v165, 2, 1.0, 0.0));

  v204 = v166;
  LODWORD(v167) = 1144750080;
  objc_msgSend(v166, "setPriority:", v167);
  v168 = self->_blurEffectView;
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v168, 3, 0, v169, 3, 1.0, 0.0));

  v203 = v170;
  LODWORD(v171) = 1144750080;
  objc_msgSend(v170, "setPriority:", v171);
  v172 = self->_blurEffectView;
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v172, 4, 0, v173, 4, 1.0, 0.0));

  LODWORD(v174) = 1144750080;
  objc_msgSend(v202, "setPriority:", v174);
  v230[0] = v162;
  v230[1] = v166;
  v230[2] = v170;
  v230[3] = v202;
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v230, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v175);

  v201 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 0.1));
  v176 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v201);
  objc_msgSend(v176, "setAlpha:", 0.0);
  objc_storeStrong((id *)&self->_waveformExtraBlurEffectView, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  objc_msgSend(v177, "addSubview:", v176);

  v178 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  objc_msgSend(v178, "bringSubviewToFront:", v176);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_waveformExtraBlurEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  waveformExtraBlurEffectView = self->_waveformExtraBlurEffectView;
  v180 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", waveformExtraBlurEffectView, 1, 0, v180, 1, 1.0, 0.0));

  LODWORD(v182) = 1144750080;
  objc_msgSend(v181, "setPriority:", v182);
  v183 = self->_waveformExtraBlurEffectView;
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v183, 2, 0, v184, 2, 1.0, 0.0));

  LODWORD(v186) = 1144750080;
  objc_msgSend(v185, "setPriority:", v186);
  v187 = self->_waveformExtraBlurEffectView;
  v188 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v187, 3, 0, v188, 3, 1.0, 0.0));

  LODWORD(v190) = 1144750080;
  objc_msgSend(v189, "setPriority:", v190);
  v191 = self->_waveformExtraBlurEffectView;
  v192 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self->_rendererController, "view"));
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v191, 4, 0, v192, 4, 1.0, 0.0));

  LODWORD(v194) = 1144750080;
  objc_msgSend(v193, "setPriority:", v194);
  v229[0] = v181;
  v229[1] = v185;
  v229[2] = v189;
  v229[3] = v193;
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v229, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v195);

  -[RCWaveformViewController _updateVisibleAreaWithAnimationDuration:](self, "_updateVisibleAreaWithAnimationDuration:", 0.0);
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
  -[RCWaveformViewController setScrubbingEnabled:](self, "setScrubbingEnabled:", 1);
  v196 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v196, "setNeedsLayout");

  v197 = objc_opt_self(UITraitUserInterfaceStyle);
  v198 = (void *)objc_claimAutoreleasedReturnValue(v197);
  v228 = v198;
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v228, 1));
  v200 = -[RCWaveformViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v199, "_traitCollectionDidChange:previousTraitCollection:");

}

- (void)viewWillLayoutSubviews
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];

  v3 = 0.0;
  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v4, "selectionOverlayBorderWidth");
    v3 = -v5;

  }
  if (!-[RCWaveformViewController isCompactView](self, "isCompactView"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v6, "annotationViewHeight");
    v3 = v3 - v7;

  }
  -[NSLayoutConstraint constant](self->_renderViewBottomInsetConstraint, "constant");
  if (v8 != v3)
    -[NSLayoutConstraint setConstant:](self->_renderViewBottomInsetConstraint, "setConstant:", v3);
  -[NSLayoutConstraint constant](self->_backgroundBottomToBottomConstraint, "constant");
  if (v9 != v3)
    -[NSLayoutConstraint setConstant:](self->_backgroundBottomToBottomConstraint, "setConstant:", v3);
  -[NSLayoutConstraint constant](self->_backgroundWaveformHighlightViewBottomToBottom, "constant");
  if (v10 != v3)
    -[NSLayoutConstraint setConstant:](self->_backgroundWaveformHighlightViewBottomToBottom, "setConstant:", v3);
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
  -[RCWaveformViewController _updateAnnotationViews](self, "_updateAnnotationViews");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100089E88;
  v11[3] = &unk_1001AB588;
  v11[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isScrubbingSelectionTimeRange
{
  _BOOL4 v3;
  double v4;
  double v5;

  if (self->_scrubbing)
  {
    v3 = -[RCWaveformViewController isSelectedTimeRangeEditingEnabled](self, "isSelectedTimeRangeEditingEnabled");
    if (v3)
    {
      -[RCWaveformViewController selectedTimeRange](self, "selectedTimeRange");
      LOBYTE(v3) = RCTimeRangeDeltaWithUIPrecision(v4, v5) != 0.0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_isScrubbing
{
  return self->_scrubbing;
}

- (void)scrollViewDidScroll:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "isZooming");
  v5 = v16;
  if ((v4 & 1) == 0)
  {
    v6 = v16;
    objc_msgSend(v6, "beginIgnoringContentOffsetChanges");
    if (self->_scrubbing)
    {
      objc_msgSend(v6, "contentOffsetInPresentationLayer:", 0);
      v8 = v7;
      -[RCWaveformRenderer setFrequentUpdatesSegmentUpdatesExpectedHint:](self->_rendererController, "setFrequentUpdatesSegmentUpdatesExpectedHint:", self->_scrubbing);
      -[RCWaveformRenderer timeAtHorizontalOffset:](self->_rendererController, "timeAtHorizontalOffset:", v8);
      v10 = v9;
      -[RCWaveformViewController desiredTimeDeltaForVisibleTimeRange](self, "desiredTimeDeltaForVisibleTimeRange");
      v12 = v11;
      -[RCWaveformViewController setVisibleTimeRange:](self, "setVisibleTimeRange:", RCTimeRangeMake(v10, v10 + v11));
      if (self->_scrubbing)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = objc_opt_respondsToSelector(WeakRetained, "waveformViewController:didScrubToTime:finished:");

        if ((v14 & 1) != 0)
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v15, "waveformViewController:didScrubToTime:finished:", self, 0, v10 + v12 * 0.5);

        }
      }
    }
    objc_msgSend(v6, "endIgnoringContentOffsetChanges");

    v5 = v16;
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;

  x = a5->x;
  -[RCWaveformViewController desiredTimeDeltaForVisibleTimeRange](self, "desiredTimeDeltaForVisibleTimeRange", a3, a4.x, a4.y);
  v9 = v8;
  -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
  v10 = CGRectGetWidth(v17) * 0.5;
  -[RCWaveformViewController currentTimeIndicatorCoordinate](self, "currentTimeIndicatorCoordinate");
  v12 = v10 - v11;
  v13 = v9 * -0.5;
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", v13);
  v15 = v12 + v14;
  if (x >= v15)
  {
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_duration + v13);
    v15 = v12 + v16;
    if (x <= v15)
      v15 = x;
  }
  a5->x = v15;
}

- (void)_scrubbingDidFinish
{
  self->_scrubbing = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[RCWaveformViewController _scrubbingDidFinish](self, "_scrubbingDidFinish", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[RCWaveformViewController _scrubbingDidFinish](self, "_scrubbingDidFinish", a3);
}

- (void)stopScrolling
{
  RCWaveformScrollView *scrollView;

  self->_scrubbing = 0;
  -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  scrollView = self->_scrollView;
  -[RCWaveformScrollView contentOffset](scrollView, "contentOffset");
  -[RCWaveformScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0);
  -[RCWaveformScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", self->_scrubbingEnabled);
  -[RCWaveformViewController fixupScrollPositionToMatchIndicatorPositionTime](self, "fixupScrollPositionToMatchIndicatorPositionTime");
}

- (void)waveformSelectionOverlay:(id)a3 willBeginTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  id WeakRetained;

  if (a4 || a5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "waveformViewControllerWillBeginEditingSelectedTimeRange:", self);

  }
}

- (void)waveformSelectionOverlay:(id)a3 didFinishTrackingSelectionBeginTime:(BOOL)a4 endTime:(BOOL)a5 assetCurrentTime:(BOOL)a6
{
  _BOOL4 v6;
  NSTimer *overlayAutoscrollTimer;
  id WeakRetained;

  v6 = a5;
  -[NSTimer invalidate](self->_overlayAutoscrollTimer, "invalidate", a3, a4, a5, a6);
  overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
  self->_overlayAutoscrollTimer = 0;

  if (a4 || v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "waveformViewControllerDidEndEditingSelectedTimeRange:", self);

  }
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)waveformSelectionOverlay:(id)a3 willChangeSelectedTimeRange:(id)a4 isTrackingMin:(BOOL)a5 isTrackingMax:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  NSTimer *v10;
  NSTimer *overlayAutoscrollTimer;
  double v12;
  id WeakRetained;
  void *v14;
  double endTime;
  RCWaveformViewController *v16;
  double beginTime;
  double v18;
  double MidTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v6 = a6;
  v7 = a5;
  v9 = -[RCWaveformViewController _setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:](self, "_setSelectedTimeRange:updateVisibleTimeRange:updateWaveformViewContentSizeAndOffset:notifyDelegate:animationDuration:", 0, 0, 1, a4.var0, a4.var1, 0.0);
  if (!self->_overlayAutoscrollTimer && !self->_isOverview)
  {
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autoscrollOverlayIfNecessary", 0, 1, 0.1));
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = v10;

    self->_overlayAutoscrollRateForSelectionTracking = 1.0;
    v9 = -[RCWaveformViewController desiredTimeDeltaForVisibleTimeRange](self, "desiredTimeDeltaForVisibleTimeRange");
    self->_overlayAutoscrollBaseDuration = v12;
  }
  if (self->_selectedTimeRangeEditingEnabled && self->_isOverview && !self->_playing && !self->_scrubbing)
  {
    if (!v7 || v6)
    {
      if (!v6 || v7)
      {
        if (v7 && v6)
        {
          MidTime = RCTimeRangeGetMidTime(v9);
          if (self->_currentTime != MidTime)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v14 = WeakRetained;
            v16 = self;
            endTime = MidTime;
            goto LABEL_17;
          }
        }
      }
      else if (self->_currentTime != self->_selectedTimeRange.endTime)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = WeakRetained;
        endTime = self->_selectedTimeRange.endTime;
        goto LABEL_16;
      }
    }
    else if (self->_currentTime != self->_selectedTimeRange.beginTime)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = WeakRetained;
      endTime = self->_selectedTimeRange.beginTime;
LABEL_16:
      v16 = self;
LABEL_17:
      objc_msgSend(WeakRetained, "waveformViewController:didScrubToTime:finished:", v16, 1, endTime);

    }
  }
  beginTime = self->_selectedTimeRange.beginTime;
  v18 = self->_selectedTimeRange.endTime;
  result.var1 = v18;
  result.var0 = beginTime;
  return result;
}

- (double)waveformSelectionOverlay:(id)a3 willChangeAssetCurrentTime:(double)a4 isTracking:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;

  if (self->_selectedTimeRangeEditingEnabled)
  {
    v7 = a3;
    objc_msgSend(v7, "selectedTimeRange");
    v9 = v8;
    objc_msgSend(v7, "selectedTimeRange");
    v11 = v10;

    if (v11 <= a4)
      v12 = v11;
    else
      v12 = a4;
    if (v12 >= v9)
      a4 = v12;
    else
      a4 = v9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformViewController:didScrubToTime:finished:", self, 0, a4);

  return a4;
}

- (double)waveformSelectionOverlay:(id)a3 offsetForTime:(double)a4
{
  double v6;
  double v7;
  double v8;

  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  v7 = v6;
  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a4);
  return v8 - v7;
}

- (double)waveformSelectionOverlay:(id)a3 timeForOffset:(double)a4
{
  double v6;
  double result;

  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", a3, self->_visibleTimeRange.beginTime);
  -[RCWaveformRenderer timeAtHorizontalOffset:](self->_rendererController, "timeAtHorizontalOffset:", v6 + a4);
  return result;
}

- (double)waveformSelectionOverlayGetCurrentTime:(id)a3
{
  return self->_currentTime;
}

- (BOOL)waveformSelectionOverlayNeedsExplicitAnimations
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController splitViewController](self, "splitViewController"));
  v3 = objc_msgSend(v2, "isTransitioningBetweenVisibleColumnStates");

  return v3;
}

- (BOOL)isZooming
{
  return -[RCWaveformScrollView isZooming](self->_scrollView, "isZooming");
}

- (void)waveformRenderer:(id)a3 contentWidthDidChange:(double)a4
{
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffsetToSize:](self, "_updateWaveformViewContentSizeAndOffsetToSize:", a3, a4);
  -[RCWaveformViewController _updateSelectionOverlayWithAnimationDuration:](self, "_updateSelectionOverlayWithAnimationDuration:", 0.0);
  -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
  if (!self->_isOverview)
  {
    -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
    -[RCWaveformViewController fixupScrollPositionToMatchIndicatorPositionTime](self, "fixupScrollPositionToMatchIndicatorPositionTime");
  }
}

- (RCTimeController)activeTimeController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTimeController"));

  return (RCTimeController *)v3;
}

- (double)desiredTimeDeltaForVisibleTimeRange
{
  return self->_desiredTimeDeltaForVisibleTimeRange;
}

- (void)setDesiredTimeDeltaForVisibleTimeRange:(double)a3
{
  if (a3 <= 0.0)
    a3 = 6.0;
  if (self->_desiredTimeDeltaForVisibleTimeRange != a3)
    self->_desiredTimeDeltaForVisibleTimeRange = a3;
}

- (id)applicationWaveformRenderer
{
  RCWaveformRenderer *rendererController;
  uint64_t v4;
  RCWaveformRenderer *v5;

  rendererController = self->_rendererController;
  v4 = objc_opt_class(RCApplicationWaveformRenderer, a2);
  if ((objc_opt_isKindOfClass(rendererController, v4) & 1) != 0)
    v5 = self->_rendererController;
  else
    v5 = 0;
  return v5;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[RCWaveformViewController updateColors](self, "updateColors");
    -[RCWaveformRenderer setCalcBlockShouldRefreshAllSlices:](self->_rendererController, "setCalcBlockShouldRefreshAllSlices:", 1);
  }
}

- (void)updateBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timelinePlaybackBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (-[RCWaveformViewController isCompactView](self, "isCompactView")
    && !-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformCompactBackgroundColor"));
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v7);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformCompactHighlightedBackgroundColor"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformPlaybackBackgroundColor"));
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v5);

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waveformPlaybackHighlightedBackgroundColor"));
  }
  v8 = (void *)v6;
  -[UIView setBackgroundColor:](self->_backgroundWaveFormHighlightView, "setBackgroundColor:", v6);

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_visibleTimeRangeForCurrentSelectionTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    beginTime = RCTimeRangeMake(0.0, self->_duration);
  }
  else
  {
    beginTime = self->_visibleTimeRange.beginTime;
    endTime = self->_visibleTimeRange.endTime;
  }
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)_setVisibleTimeRange:(id)a3 animationDuration:(double)a4 completionBlock:(id)a5
{
  double var1;
  double var0;
  void (**v9)(id, uint64_t);
  $93AB83F55FD8EAABF5C634313E89AB95 *p_visibleTimeRange;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, uint64_t);
  _QWORD v22[5];
  id v23;
  double v24;

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = (void (**)(id, uint64_t))a5;
  if (RCTimeRangeDeltaWithUIPrecision(var0, var1) < 2.22044605e-16)
    var1 = var0 + 2.22044605e-16;
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime, var0, var1) & 1) != 0)
  {
    -[RCWaveformViewController _updateVisibleAreaWithAnimationDuration:](self, "_updateVisibleAreaWithAnimationDuration:", 0.0);
  }
  else
  {
    v11 = RCTimeRangeDeltaWithUIPrecision(p_visibleTimeRange->beginTime, self->_visibleTimeRange.endTime);
    v12 = RCTimeRangeDeltaWithUIPrecision(var0, var1);
    p_visibleTimeRange->beginTime = var0;
    self->_visibleTimeRange.endTime = var1;
    if (vabdd_f64(v11, v12) > 0.00000011920929)
      -[RCWaveformViewController _setTimeMarkerViewsNeedInitialLayout:](self, "_setTimeMarkerViewsNeedInitialLayout:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewWithTag:", 92314));

    if (!v14)
    {
      v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v14, "setTag:", 92314);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v14, "setBackgroundColor:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
      objc_msgSend(v16, "addSubview:", v14);

    }
    objc_msgSend(v14, "setAlpha:", 1.0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10008AC0C;
    v22[3] = &unk_1001AD0F0;
    v22[4] = self;
    v24 = a4;
    v17 = v14;
    v23 = v17;
    v18 = objc_retainBlock(v22);
    v19 = v18;
    if (a4 <= 0.0)
    {
      ((void (*)(_QWORD *))v18[2])(v18);
      if (v9)
        v9[2](v9, 1);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10008AC50;
      v20[3] = &unk_1001ABE60;
      v21 = v9;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v19, v20, a4, 0.0);

    }
  }

}

- (void)_setSelectedTimeRange:(id)a3 updateVisibleTimeRange:(BOOL)a4 updateWaveformViewContentSizeAndOffset:(BOOL)a5 notifyDelegate:(BOOL)a6 animationDuration:(double)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v10;
  double v12;
  double var1;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_selectedTimeRange;
  double v15;
  double v16;
  double v17;
  double v18;
  id WeakRetained;

  v7 = a6;
  v8 = a5;
  v10 = a4;
  v12 = fmax(a3.var0, 0.0);
  if (self->_duration >= a3.var1)
    var1 = a3.var1;
  else
    var1 = self->_duration;
  p_selectedTimeRange = &self->_selectedTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, v12, var1) & 1) == 0)
  {
    p_selectedTimeRange->beginTime = v12;
    p_selectedTimeRange->endTime = var1;
    if (v8)
      -[RCWaveformViewController _updateWaveformViewContentSizeAndOffset](self, "_updateWaveformViewContentSizeAndOffset");
    if (v10)
    {
      if (self->_isOverview)
      {
        -[RCWaveformViewController updateVisibleTimeRangeToFullDuration](self, "updateVisibleTimeRangeToFullDuration");
      }
      else
      {
        -[RCWaveformViewController _visibleTimeRangeForCurrentSelectionTimeRange](self, "_visibleTimeRangeForCurrentSelectionTimeRange");
        v16 = v15;
        v18 = v17;
        if ((RCTimeRangeEqualToTimeRange(v15, v17, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime) & 1) == 0)
          -[RCWaveformViewController setVisibleTimeRange:animationDuration:](self, "setVisibleTimeRange:animationDuration:", v16, v18, a7);
      }
    }
    -[RCWaveformViewController _updateSelectionOverlayWithAnimationDuration:](self, "_updateSelectionOverlayWithAnimationDuration:", a7);
    -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "waveformViewController:didChangeToSelectedTimeRange:", self, p_selectedTimeRange->beginTime, p_selectedTimeRange->endTime);

    }
  }
}

- (void)_autoscrollOverlayIfNecessary
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_visibleTimeRange;
  NSTimer *overlayAutoscrollTimer;
  _QWORD v9[6];

  v3 = -[RCWaveformSelectionOverlay beginTimeIndicatorSelectionAffinity](self->_selectionOverlay, "beginTimeIndicatorSelectionAffinity");
  v4 = -[RCWaveformSelectionOverlay endTimeIndicatorSelectionAffinity](self->_selectionOverlay, "endTimeIndicatorSelectionAffinity");
  -[RCWaveformViewController desiredTimeDeltaForVisibleTimeRange](self, "desiredTimeDeltaForVisibleTimeRange");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008AF50;
  v9[3] = &unk_1001AD118;
  v9[5] = v5;
  v9[4] = self;
  v6 = objc_retainBlock(v9);
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((((uint64_t (*)(_QWORD *, const __CFString *, int64_t, _QWORD, uint64_t, double))v6[2])(v6, CFSTR("[min-marker, max]"), v3, 0, 1, self->_visibleTimeRange.endTime - self->_selectedTimeRange.beginTime) & 1) == 0&& (((uint64_t (*)(_QWORD *, const __CFString *, int64_t, _QWORD, uint64_t, double))v6[2])(v6, CFSTR("[min-marker, min]"), v3, 0, 0xFFFFFFFFLL, self->_selectedTimeRange.beginTime - p_visibleTimeRange->beginTime) & 1) == 0&& (((uint64_t (*)(_QWORD *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, CFSTR("[max-marker, max]"), v4, 1, 1,
          self->_visibleTimeRange.endTime - self->_selectedTimeRange.endTime) & 1) == 0
    && (((uint64_t (*)(_QWORD *, const __CFString *, int64_t, uint64_t, uint64_t, double))v6[2])(v6, CFSTR("[max-marker, min]"), v4, 1, 0xFFFFFFFFLL, self->_selectedTimeRange.endTime - p_visibleTimeRange->beginTime) & 1) == 0)
  {
    -[NSTimer invalidate](self->_overlayAutoscrollTimer, "invalidate");
    overlayAutoscrollTimer = self->_overlayAutoscrollTimer;
    self->_overlayAutoscrollTimer = 0;

  }
}

- (void)_setTimeMarkerViewUpdatesDisabled:(BOOL)a3
{
  UIView *v4;
  double v5;
  NSMutableArray *timeMarkerViews;
  UIView *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  UIView *v10;

  self->_timeMarkerViewsUpdatesDisabled = a3;
  if (a3)
  {
    v4 = (UIView *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    v5 = 0.200000003;
  }
  else
  {
    v4 = self->_timeMarkerView;
    v5 = 1.0;
  }
  timeMarkerViews = self->_timeMarkerViews;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B318;
  v9[3] = &unk_1001AD140;
  v10 = v4;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](timeMarkerViews, "enumerateObjectsUsingBlock:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008B394;
  v8[3] = &unk_1001ABE10;
  v8[4] = self;
  *(double *)&v8[5] = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.5);

}

- (void)_updateBackgroundWaveformHighlight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double MinX;
  double MaxX;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_visibleTimeRange.beginTime);
  v4 = v3;
  -[UIView bounds](self->_backgroundView, "bounds");
  v9 = 0.0;
  v10 = 0.0;
  if (v7 > 0.0)
  {
    v11 = v5;
    v12 = v6;
    v13 = v7;
    v14 = v8;
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", 0.0);
    v10 = v15 - v4;
    v25.origin.x = v11;
    v25.origin.y = v12;
    v25.size.width = v13;
    v25.size.height = v14;
    MinX = CGRectGetMinX(v25);
    if (v10 < MinX)
      v10 = MinX;
    v26.origin.x = v11;
    v26.origin.y = v12;
    v26.size.width = v13;
    v26.size.height = v14;
    MaxX = CGRectGetMaxX(v26);
    if (v10 >= MaxX)
      v10 = MaxX;
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_duration);
    v19 = v18;
    v27.origin.x = v11;
    v27.origin.y = v12;
    v27.size.width = v13;
    v27.size.height = v14;
    v20 = CGRectGetMaxX(v27);
    v28.origin.x = v11;
    v28.origin.y = v12;
    v28.size.width = v13;
    v28.size.height = v14;
    v5 = CGRectGetMinX(v28);
    v21 = 0.0;
    if (!self->_capturing)
    {
      v22 = v19 - v4;
      if (v19 - v4 >= v20)
        v22 = v20;
      if (v22 >= v5)
        v5 = v22;
      v21 = v11 + v13 - v5;
    }
    v9 = -v21;
  }
  -[NSLayoutConstraint constant](self->_backgroundWaveFormHighlightViewLeftAlignment, "constant", v5);
  if (v10 != v23)
    -[NSLayoutConstraint setConstant:](self->_backgroundWaveFormHighlightViewLeftAlignment, "setConstant:", v10);
  -[NSLayoutConstraint constant](self->_backgroundWaveFormHighlightViewRightAlignment, "constant");
  if (v9 != v24)
    -[NSLayoutConstraint setConstant:](self->_backgroundWaveFormHighlightViewRightAlignment, "setConstant:", v9);
}

- (void)_updateWaveformViewContentSizeAndOffsetToSize:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  RCWaveformScrollView **p_scrollView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6 * 0.5 + a3;

  if (self->_isPlayback
    || self->_isOverview
    || !self->_selectedTimeRangeEditingEnabled
    || -[RCWaveformSelectionOverlay isCurrentlyTracking](self->_selectionOverlay, "isCurrentlyTracking"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v10 = v9;

    if (v7 >= v10)
      v10 = v7;
    p_scrollView = &self->_scrollView;
    -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v10, v12);
    v22 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    objc_msgSend(v22, "bounds");
    v14 = v13 * 0.5;
    v15 = 0.0;
  }
  else
  {
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_selectedTimeRange.beginTime);
    v17 = v16;
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_selectedTimeRange.endTime);
    v19 = v18;
    p_scrollView = &self->_scrollView;
    -[RCWaveformScrollView bounds](self->_scrollView, "bounds");
    -[RCWaveformScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, v20);
    v22 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController view](self, "view"));
    objc_msgSend(v22, "bounds");
    v14 = v21 * 0.5 - v17;
    v15 = -(a3 - v19);
  }
  -[RCWaveformScrollView setContentInset:](*p_scrollView, "setContentInset:", 0.0, v14, 0.0, v15);

}

- (void)_updateWaveformViewContentSizeAndOffset
{
  -[RCWaveformRenderer contentWidth](self->_rendererController, "contentWidth");
  -[RCWaveformViewController _updateWaveformViewContentSizeAndOffsetToSize:](self, "_updateWaveformViewContentSizeAndOffsetToSize:");
}

- (void)_updateAnnotationViews
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008B7E0;
  v2[3] = &unk_1001AB588;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)fixupScrollPositionToMatchIndicatorPositionTime
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self->_rendererController, "horizontalOffsetAtTime:withVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  v4 = v3;
  -[RCWaveformScrollView contentOffsetInPresentationLayer:](self->_scrollView, "contentOffsetInPresentationLayer:", 1);
  if (vabdd_f64(v5, v4) > 0.00000011920929)
  {
    -[RCWaveformScrollView visibleBounds](self->_scrollView, "visibleBounds");
    if (v6 > 0.00000011920929)
    {
      -[RCWaveformScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, 0.0);
      -[RCWaveformViewController _updateVisibleAreaWithAnimationDuration:](self, "_updateVisibleAreaWithAnimationDuration:", 0.0);
      -[RCWaveformViewController _updateCurrentTimeDisplay](self, "_updateCurrentTimeDisplay");
    }
  }
}

- (void)_updateVisibleAreaWithAnimationDuration:(double)a3
{
  double v5;
  double v6;
  _BOOL4 v7;
  _QWORD v8[7];
  CGRect v9;
  CGRect v10;

  -[RCWaveformRenderer setVisibleTimeRange:](self->_rendererController, "setVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  if (!self->_scrubbing)
  {
    -[RCWaveformRenderer horizontalOffsetAtTime:](self->_rendererController, "horizontalOffsetAtTime:", self->_visibleTimeRange.beginTime);
    v6 = RCRoundCoord(v5);
    -[RCWaveformScrollView visibleBounds](self->_scrollView, "visibleBounds");
    v10.origin.x = v6;
    v10.origin.y = v9.origin.y;
    v10.size.width = v6;
    v10.size.height = v9.size.height;
    v7 = CGRectIntersectsRect(v9, v10);
    if (a3 == 0.0 || !v7)
    {
      -[RCWaveformScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, v6, 0.0);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008BD7C;
      v8[3] = &unk_1001ABDE8;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      v8[6] = 0;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131076, v8, 0, a3, 0.0);
    }
  }
  -[RCWaveformViewController _updateAnnotationViews](self, "_updateAnnotationViews");
}

- (void)_updateSelectionOverlayWithAnimationDuration:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double beginTime;
  double endTime;
  double v11;
  double currentTime;

  if (!self->_scrubbing
    || -[RCWaveformViewController _isScrubbingSelectionTimeRange](self, "_isScrubbingSelectionTimeRange"))
  {
    -[RCWaveformSelectionOverlay selectedTimeRange](self->_selectionOverlay, "selectedTimeRange");
    v6 = v5;
    v8 = v7;
    if (RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) == 0.0)
    {
      beginTime = RCTimeRangeMake(self->_currentTime, self->_currentTime);
      endTime = v11;
    }
    else
    {
      beginTime = self->_selectedTimeRange.beginTime;
      endTime = self->_selectedTimeRange.endTime;
    }
    if ((RCTimeRangeEqualToTimeRange(v6, v8, beginTime, endTime) & 1) != 0)
    {
      -[RCWaveformViewController reloadOverlayOffsets](self, "reloadOverlayOffsets");
      -[RCWaveformSelectionOverlay setNeedsLayout](self->_selectionOverlay, "setNeedsLayout");
    }
    else
    {
      -[RCWaveformSelectionOverlay setSelectedTimeRange:withAnimationDuration:](self->_selectionOverlay, "setSelectedTimeRange:withAnimationDuration:", beginTime, endTime, a3);
    }
    currentTime = -1.0;
    if (self->_currentTimeDisplayOptions == 2)
      currentTime = self->_currentTime;
    -[RCWaveformSelectionOverlay setAssetCurrentTime:](self->_selectionOverlay, "setAssetCurrentTime:", currentTime);
  }
}

- (void)_updateCurrentTimeDisplay
{
  double v3;
  double v4;
  void *v5;
  unsigned int v6;
  double currentTime;
  double v8;
  double v9;
  id v10;

  if (-[RCWaveformViewController isOverview](self, "isOverview"))
  {
    -[RCWaveformViewController updateVisibleTimeRangeToFullDuration](self, "updateVisibleTimeRangeToFullDuration");
    -[RCWaveformViewController _updateSelectionOverlayWithAnimationDuration:](self, "_updateSelectionOverlayWithAnimationDuration:", 0.0);
    -[RCWaveformViewController _updateBackgroundWaveformHighlight](self, "_updateBackgroundWaveformHighlight");
  }
  else
  {
    -[RCWaveformViewController desiredTimeDeltaForVisibleTimeRange](self, "desiredTimeDeltaForVisibleTimeRange");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformViewController applicationWaveformRenderer](self, "applicationWaveformRenderer"));
    v10 = v5;
    if (v5)
      v6 = objc_msgSend(v5, "isPlayBarOnlyMode") ^ 1;
    else
      v6 = 1;
    if (self->_isCompactView
      && (-[RCWaveformRenderer isLiveWaveform](self->_rendererController, "isLiveWaveform") & v6) == 1)
    {
      currentTime = self->_currentTime;
      v8 = currentTime - v4;
    }
    else
    {
      v9 = self->_currentTime;
      v8 = v9 - v4 * 0.5;
      currentTime = v4 * 0.5 + v9;
    }
    -[RCWaveformViewController setVisibleTimeRange:](self, "setVisibleTimeRange:", RCTimeRangeMake(v8, currentTime));

  }
}

- (CGRect)_frameForTimeMarkerView:(id)a3
{
  RCWaveformRenderer *rendererController;
  id v5;
  double v6;
  double v7;
  RCWaveformRenderer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  rendererController = self->_rendererController;
  v5 = a3;
  objc_msgSend(v5, "visibleTimeRange");
  -[RCWaveformRenderer horizontalOffsetAtTime:](rendererController, "horizontalOffsetAtTime:");
  v7 = RCRoundCoord(v6);
  v8 = self->_rendererController;
  objc_msgSend(v5, "visibleTimeRange");
  v10 = v9;

  -[RCWaveformRenderer horizontalOffsetAtTime:](v8, "horizontalOffsetAtTime:", v10);
  v12 = RCRoundCoord(v11) - v7;
  if (v12 >= 1.0)
    v13 = v12;
  else
    v13 = 1.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v14, "annotationViewHeight");
  v16 = v15;

  v17 = 0.0;
  v18 = v7;
  v19 = v13;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v17;
  result.origin.x = v18;
  return result;
}

- (void)_setTimeMarkerViewsNeedInitialLayout:(BOOL)a3
{
  if (self->_timeMarkerViewsNeedInitialLayout)
    a3 = 1;
  self->_timeMarkerViewsNeedInitialLayout = a3;
}

- (void)_layoutTimeMarkerViewsForCurrentlyVisibleTimeRange
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008C108;
  v2[3] = &unk_1001AB588;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_scrollViewPanGestureRecognized:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)1)
    self->_scrubbing = 1;
}

- (id)rasterizeCurrentTimeRangeIntoImageWithSize:(CGSize)a3
{
  RCWaveformRenderer *rendererController;

  rendererController = self->_rendererController;
  -[RCWaveformViewController visibleTimeRange](self, "visibleTimeRange");
  return -[RCWaveformRenderer rasterizeTimeRange:imageSize:afterScreenUpdates:](rendererController, "rasterizeTimeRange:imageSize:afterScreenUpdates:", 0);
}

- (RCWaveformViewDelegate)delegate
{
  return (RCWaveformViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPlayback
{
  return self->_isPlayback;
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (BOOL)playing
{
  return self->_playing;
}

- (BOOL)capturing
{
  return self->_capturing;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (unint64_t)currentTimeDisplayOptions
{
  return self->_currentTimeDisplayOptions;
}

- (BOOL)clipTimeMarkersToDuration
{
  return self->_clipTimeMarkersToDuration;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (double)duration
{
  return self->_duration;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_visibleTimeRange.beginTime;
  endTime = self->_visibleTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_highlightTimeRange.beginTime;
  endTime = self->_highlightTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_selectedTimeRange.beginTime;
  endTime = self->_selectedTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isSelectedTimeRangeEditingEnabled
{
  return self->_selectedTimeRangeEditingEnabled;
}

- (void)setSelectedTimeRangeScrubbingEnabled:(BOOL)a3
{
  self->_selectedTimeRangeScrubbingEnabled = a3;
}

- (BOOL)selectionOverlayShouldUseInsertMode
{
  return self->_selectionOverlayShouldUseInsertMode;
}

- (void)setSelectionOverlayShouldUseInsertMode:(BOOL)a3
{
  self->_selectionOverlayShouldUseInsertMode = a3;
}

- (BOOL)showPlayBarOnly
{
  return self->_showPlayBarOnly;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_backgroundWaveformHighlightViewBottomToBottom, 0);
  objc_storeStrong((id *)&self->_backgroundBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_renderViewBottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewRightAlignment, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightViewLeftAlignment, 0);
  objc_storeStrong((id *)&self->_overlayAutoscrollTimer, 0);
  objc_storeStrong((id *)&self->_timeMarkerViews, 0);
  objc_storeStrong((id *)&self->_waveformExtraBlurEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_selectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundWaveFormHighlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeMarkerView, 0);
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
  objc_storeStrong((id *)&self->_rendererController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
