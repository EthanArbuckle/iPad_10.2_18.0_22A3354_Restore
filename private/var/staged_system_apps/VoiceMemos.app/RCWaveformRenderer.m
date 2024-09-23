@implementation RCWaveformRenderer

- (RCWaveformRenderer)initWithNibName:(id)a3 bundle:(id)a4
{
  RCWaveformRenderer *v4;
  RCWaveformRenderer *v5;
  double v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *renderingQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCWaveformRenderer;
  v4 = -[RCWaveformRenderer initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_spacingWidth = 0.0;
    v4->_dataPointWidth = 2.0;
    v4->_visibleTimeRange.beginTime = RCTimeRangeMake(0.0, 15.0);
    v5->_visibleTimeRange.endTime = v6;
    v5->_cachedContentWidth = 0.0;
    v5->_renderedTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeZero;
    v5->_renderingQueueIsBusy = 0;
    v7 = dispatch_queue_create("com.apple.waveformRenderSegmentProcessing", 0);
    renderingQueue = v5->_renderingQueue;
    v5->_renderingQueue = (OS_dispatch_queue *)v7;

    v5->_lastVisibleTimeRange = v5->_visibleTimeRange;
    v5->_visibleTimeRangeVelocity = 0.0;
    v5->_isCompactView = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[RCWaveformRenderer _stopRendering](self, "_stopRendering");
  -[RCWaveformDataSource removeObserver:](self->_dataSource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer dealloc](&v3, "dealloc");
}

- (void)loadView
{
  RCView *v3;

  v3 = -[RCView initWithFrame:]([RCView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[RCWaveformRenderer setView:](self, "setView:");
  -[RCView setRenderer:](v3, "setRenderer:", self);

}

- (void)viewDidLoad
{
  RCWaveformColorCalculator *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer viewDidLoad](&v4, "viewDidLoad");
  v3 = -[RCWaveformColorCalculator initWithDataProvider:]([RCWaveformColorCalculator alloc], "initWithDataProvider:", self);
  -[RCWaveformRenderer setWaveformColorCalculator:](self, "setWaveformColorCalculator:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (self->_dataSource)
  {
    -[RCWaveformRenderer _startUpdating](self, "_startUpdating");
    -[RCWaveformRenderer _startRendering](self, "_startRendering");
    if (!-[RCWaveformRenderer displayMode](self, "displayMode"))
    {
      self->_fitToWidthWaveformNeedsRefresh = 1;
      -[RCWaveformRenderer _setNeedsVisibleTimeRangeRendering](self, "_setNeedsVisibleTimeRangeRendering");
      -[RCWaveformRenderer _setNeedsRendering](self, "_setNeedsRendering");
      -[RCWaveformRenderer _duration](self, "_duration");
      -[RCWaveformRenderer _draw:](self, "_draw:");
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  if (self->_dataSource)
  {
    -[RCWaveformRenderer _stopUpdating](self, "_stopUpdating", a3);
    -[RCWaveformRenderer _stopRendering](self, "_stopRendering");
  }
  v4.receiver = self;
  v4.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer viewWillDisappear:](&v4, "viewWillDisappear:", 0);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer willMoveToParentViewController:](&v5, "willMoveToParentViewController:", v4);
  if (!v4)
  {
    -[RCWaveformRenderer _stopUpdating](self, "_stopUpdating");
    -[RCWaveformRenderer _stopRendering](self, "_stopRendering");
  }

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RCWaveformRenderer;
  -[RCWaveformRenderer viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000430EC;
  v3[3] = &unk_1001ABD58;
  v3[4] = self;
  -[RCWaveformRenderer _performOrDispatchToMainThread:](self, "_performOrDispatchToMainThread:", v3);
}

- (void)_updateFitToWidthUnitsPerSecond
{
  double v3;
  double v4;
  id v5;

  if ((id)-[RCWaveformRenderer displayMode](self, "displayMode") == (id)1)
  {
    -[RCWaveformRenderer _pointsPerSecond](self, "_pointsPerSecond");
    v4 = v3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformDataSource waveformGenerator](self->_dataSource, "waveformGenerator"));
    objc_msgSend(v5, "setOverviewUnitsPerSecond:", (uint64_t)v4);

  }
}

- (void)setDataSource:(id)a3
{
  id v3;
  _QWORD v4[4];
  RCWaveformRenderer *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043248;
  v4[3] = &unk_1001AB928;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[RCWaveformRenderer _performOrDispatchToMainThread:](v5, "_performOrDispatchToMainThread:", v4);

}

- (void)setIsLiveWaveform:(BOOL)a3
{
  if (self->_isLiveWaveform != a3)
  {
    self->_isLiveWaveform = a3;
    -[RCWaveformRenderer _setNeedsVisibleTimeRangeRendering](self, "_setNeedsVisibleTimeRangeRendering");
    -[RCWaveformRenderer _setNeedsRendering](self, "_setNeedsRendering");
  }
}

- (void)setVisibleTimeRange:(id)a3
{
  double var1;
  double var0;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_visibleTimeRange;
  double v7;

  var1 = a3.var1;
  var0 = a3.var0;
  p_visibleTimeRange = &self->_visibleTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime, a3.var0, a3.var1) & 1) == 0)
  {
    if (!-[RCWaveformRenderer displayMode](self, "displayMode")
      || (v7 = RCTimeRangeDelta(p_visibleTimeRange->beginTime, p_visibleTimeRange->endTime),
          vabdd_f64(v7, RCTimeRangeDelta(var0, var1)) > 0.00000011920929))
    {
      self->_calcBlockShouldRefreshAllSlices = 1;
    }
    self->_needsVisibleRangeRendering = 1;
  }
  p_visibleTimeRange->beginTime = var0;
  p_visibleTimeRange->endTime = var1;
  if (self->_dataSource)
  {
    -[RCWaveformRenderer _setNeedsVisibleTimeRangeRendering](self, "_setNeedsVisibleTimeRangeRendering");
    -[RCWaveformRenderer _setNeedsRendering](self, "_setNeedsRendering");
    -[RCWaveformRenderer _duration](self, "_duration");
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (double)_duration
{
  double v3;
  double v4;
  id WeakRetained;
  double v6;
  double v7;

  -[RCWaveformDataSource duration](self->_dataSource, "duration");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate);
  objc_msgSend(WeakRetained, "duration");
  v7 = v6;

  if (v4 >= v7)
    return v4;
  else
    return v7;
}

- (double)contentWidth
{
  return self->_cachedContentWidth;
}

- (double)horizontalOffsetAtTime:(double)a3
{
  double result;

  -[RCWaveformRenderer horizontalOffsetAtTime:withVisibleTimeRange:](self, "horizontalOffsetAtTime:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)horizontalOffsetAtTime:(double)a3 withVisibleTimeRange:(id)a4
{
  double v5;

  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  return v5 * a3;
}

- (double)_pointsPerSecond
{
  double result;

  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)pointsPerSecondWithVisibleTimeRange:(id)a3
{
  double v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  v3 = 1.0;
  if (a3.var1 - a3.var0 >= 4.4408921e-16)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;

    if (v7 >= 1.0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer rendererDelegate](self, "rendererDelegate"));
      objc_msgSend(v11, "desiredTimeDeltaForVisibleTimeRange");
      v3 = v10 / v12;

    }
  }
  return v3;
}

- (double)timeAtHorizontalOffset:(double)a3
{
  double result;

  -[RCWaveformRenderer timeAtHorizontalOffset:withVisibleTimeRange:](self, "timeAtHorizontalOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (double)timeAtHorizontalOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  double result;

  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, a4.var0, a4.var1);
  return result;
}

- (CGRect)visibleRect
{
  $93AB83F55FD8EAABF5C634313E89AB95 *p_visibleTimeRange;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  p_visibleTimeRange = &self->_visibleTimeRange;
  -[RCWaveformRenderer horizontalOffsetAtTime:](self, "horizontalOffsetAtTime:", self->_visibleTimeRange.beginTime);
  v5 = v4;
  -[RCWaveformRenderer horizontalOffsetAtTime:](self, "horizontalOffsetAtTime:", p_visibleTimeRange->endTime);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = 0.0;
  v12 = rint(v5);
  v13 = rint(v7) - v12;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (id)rasterizeTimeRange:(id)a3 imageSize:(CGSize)a4 afterScreenUpdates:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double var1;
  double var0;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double y;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  void *v44;
  void *v45;
  UIImage *ImageFromCurrentImageContext;
  void *v47;
  void *v48;
  void *v49;
  double v51;
  double v52;
  double v53;
  double v54;
  CGSize v55;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  var1 = a3.var1;
  var0 = a3.var0;
  -[RCWaveformDataSource duration](self->_dataSource, "duration");
  if (v11 >= var1)
    v12 = var1;
  else
    v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;

    v21 = objc_alloc((Class)UIWindow);
    if (v18 >= v20)
      v22 = v18;
    else
      v22 = v20;
    v15 = objc_msgSend(v21, "initWithFrame:", v22 + v22, v22 + v22, width, height);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
    objc_msgSend(v15, "addSubview:", v23);

    objc_msgSend(v15, "setHidden:", 0);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v24, "frame");
  v53 = v26;
  v54 = v25;
  v28 = v27;
  v30 = v29;

  -[RCWaveformRenderer visibleTimeRange](self, "visibleTimeRange");
  v51 = v32;
  v52 = v31;
  y = CGPointZero.y;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v34, "setFrame:", CGPointZero.x, y, width, height);

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", fmax(var0, 0.0), v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v35, "rc_runUntilNextDisplayLinkEventWithTimeout:", 0.5);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v41, "scale");
  v43 = v42;
  v55.width = v38;
  v55.height = v40;
  UIGraphicsBeginImageContextWithOptions(v55, 0, v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v45, "bounds");
  objc_msgSend(v44, "drawViewHierarchyInRect:afterScreenUpdates:", v5);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v47 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v48, "setFrame:", v54, v53, v28, v30);

  -[RCWaveformRenderer setVisibleTimeRange:](self, "setVisibleTimeRange:", v52, v51);
  if (v15)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
    objc_msgSend(v49, "removeFromSuperview");

    objc_msgSend(v15, "setHidden:", 1);
  }

  return v47;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  if (a3)
  {
    -[RCWaveformRenderer _stopUpdating](self, "_stopUpdating");
    -[RCWaveformRenderer _stopRendering](self, "_stopRendering");
  }
  else
  {
    -[RCWaveformRenderer _startUpdating](self, "_startUpdating");
    -[RCWaveformRenderer _startRendering](self, "_startRendering");
  }
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v4;
  _QWORD v5[4];
  RCWaveformRenderer *v6;
  id v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043AB0;
  v5[3] = &unk_1001AB928;
  v6 = self;
  v7 = a4;
  v4 = v7;
  -[RCWaveformRenderer _performOrDispatchToMainThread:](v6, "_performOrDispatchToMainThread:", v5);

}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100043BD4;
  v3[3] = &unk_1001ABD58;
  v3[4] = self;
  -[RCWaveformRenderer _performOrDispatchToMainThread:](self, "_performOrDispatchToMainThread:", v3);
}

- (double)_nonCachedContentWidthWithDuration:(double)a3
{
  double v4;

  -[RCWaveformRenderer _pointsPerSecond](self, "_pointsPerSecond");
  return ceil(v4 * a3);
}

- (void)_startUpdating
{
  if (!-[RCWaveformRenderer isPaused](self, "isPaused"))
  {
    -[RCWaveformRenderer _setNeedsVisibleTimeRangeRendering](self, "_setNeedsVisibleTimeRangeRendering");
    -[RCWaveformDataSource addObserver:](self->_dataSource, "addObserver:", self);
  }
}

- (void)_stopUpdating
{
  -[RCWaveformDataSource removeObserver:](self->_dataSource, "removeObserver:", self);
}

- (void)_setNeedsRendering
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100043CD8;
  v2[3] = &unk_1001ABD58;
  v2[4] = self;
  -[RCWaveformRenderer _performOrDispatchToMainThread:](self, "_performOrDispatchToMainThread:", v2);
}

- (void)_setNeedsVisibleTimeRangeRenderingFromFrameChange
{
  -[RCWaveformRenderer _setNeedsVisibleTimeRangeRendering](self, "_setNeedsVisibleTimeRangeRendering");
  if (!-[RCWaveformRenderer displayMode](self, "displayMode"))
  {
    if (-[RCWaveformRenderer isLiveWaveform](self, "isLiveWaveform"))
      self->_fitToWidthWaveformNeedsRefresh = 1;
  }
}

- (void)_setNeedsVisibleTimeRangeRendering
{
  if (!self->_needsVisibleRangeRendering)
  {
    if (-[RCWaveformRenderer _needsWaveformRendering](self, "_needsWaveformRendering"))
    {
      self->_needsVisibleRangeRendering = 1;
      -[RCWaveformRenderer _startRendering](self, "_startRendering");
    }
  }
}

- (void)_startRendering
{
  void *v3;

  if (!self->displayLinkConnected)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCDisplayLinkManager sharedManager](RCDisplayLinkManager, "sharedManager"));
    objc_msgSend(v3, "addDisplayLinkObserver:", self);

    self->displayLinkConnected = 1;
  }
}

- (void)_stopRendering
{
  void *v3;

  if (self->displayLinkConnected)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCDisplayLinkManager sharedManager](RCDisplayLinkManager, "sharedManager"));
    objc_msgSend(v3, "removeDisplayLinkObserver:", self);

    self->displayLinkConnected = 0;
  }
}

- (void)setActiveDisplayLinkRequired:(BOOL)a3
{
  if (self->_activeDisplayLinkRequired != a3)
  {
    self->_activeDisplayLinkRequired = a3;
    if (a3)
      -[RCWaveformRenderer _startRendering](self, "_startRendering");
    else
      -[RCWaveformRenderer _stopRendering](self, "_stopRendering");
  }
}

- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view", a3, a4));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

  if (v11 && v7 != 0.0 && v9 != 0.0)
  {
    if ((id)-[RCWaveformRenderer displayMode](self, "displayMode") == (id)1)
      self->_visibleTimeRangeVelocity = (self->_visibleTimeRange.beginTime + self->_visibleTimeRange.endTime) * 0.5
                                      - (self->_lastVisibleTimeRange.beginTime + self->_lastVisibleTimeRange.endTime)
                                      * 0.5;
    self->_lastVisibleTimeRange = self->_visibleTimeRange;
    -[RCWaveformRenderer _duration](self, "_duration");
    -[RCWaveformRenderer _draw:](self, "_draw:");
  }
}

- (void)_draw:(double)a3
{
  if (a3 > 0.0)
    -[RCWaveformRenderer _renderVisibleTimeRangeWithDuration:](self, "_renderVisibleTimeRangeWithDuration:");
}

- (void)_clearRenderingState
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004402C;
  v4[3] = &unk_1001ABD58;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  dispatch_sync((dispatch_queue_t)self->_renderingQueue, v3);

}

- (void)_renderTimeRangeOfSegments:(id)a3 withDuration:(double)a4 needsWaveformCalculation:(BOOL)a5
{
  double var1;
  double var0;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int recordDidSwitch;
  BOOL v55;
  double v56;
  CFTimeInterval v57;
  int64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _QWORD *v67;
  id WeakRetained;
  unsigned int v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  unsigned int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  id v80;
  double v81;
  double v82;
  unint64_t v83;
  double v84;
  _QWORD *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *v90;
  double v91;
  id v92;
  char v93;
  id v94;
  BOOL calcBlockShouldRefreshAllSlices;
  BOOL isLiveWaveform;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  _OWORD v105[8];
  CATransform3D v106;
  _QWORD v107[6];
  $93AB83F55FD8EAABF5C634313E89AB95 v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  BOOL waveformAmpSlicesForRenderingRecordStateChanged;
  $93AB83F55FD8EAABF5C634313E89AB95 waveformAmpSlicesForRenderingTimeRange;
  _QWORD v122[15];
  $93AB83F55FD8EAABF5C634313E89AB95 v123;
  BOOL v124;
  BOOL v125;
  BOOL v126;
  BOOL v127;
  $93AB83F55FD8EAABF5C634313E89AB95 visibleTimeRange;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCWaveformRenderer waveformWaveWidth](self, "waveformWaveWidth");
  v11 = v10;
  -[RCWaveformRenderer waveformHorizontalSpacing](self, "waveformHorizontalSpacing");
  v13 = v12;
  -[RCWaveformRenderer maximumDecibelDisplayRange](self, "maximumDecibelDisplayRange");
  *(float *)&v14 = v14;
  v104 = RCNormalizedDecibelValue(*(float *)&v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;

  v20 = RCTimeRangeDeltaWithUIPrecision(self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  if (v20 <= 0.0)
    return;
  v21 = v20;
  if (v17 == 100.0 && v19 == 100.0)
    return;
  if (self->_calcBlockShouldRefreshAllSlices)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer waveformAmpSlicesForRendering](self, "waveformAmpSlicesForRendering"));
    v23 = objc_msgSend(v22, "count") == 0;

  }
  else
  {
    v23 = 0;
  }
  v103 = var0;
  v100 = v11;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v24, "frame");
  v99 = v25;

  -[RCWaveformRenderer verticalWaveformPadding](self, "verticalWaveformPadding");
  v97 = v26;
  v98 = v13;
  v102 = v17;
  v27 = v17 / v13 / v21;
  v28 = 1.0 / v27;
  -[RCWaveformRenderer _duration](self, "_duration");
  v30 = v29;
  v101 = var1;
  if (-[RCWaveformRenderer displayMode](self, "displayMode"))
  {
    v31 = a4;
    v32 = v103;
    if (v103 >= v30)
      v32 = v30;
    if (v32 >= 0.0)
      v33 = v32;
    else
      v33 = 0.0;
    v34 = var1 + v28;
    if (var1 + v28 >= v30)
      v34 = v30;
    if (v34 >= 0.0)
      v35 = v34;
    else
      v35 = 0.0;
    v36 = 1.0 / v27;
    -[RCWaveformDataSource setDurationPerWaveformSlice:](self->_dataSource, "setDurationPerWaveformSlice:", 1.0 / v27);
  }
  else
  {
    v37 = var1;
    v36 = 1.0 / v27;
    v38 = v103;
    if (v103 >= a4)
      v38 = a4;
    v39 = a4;
    if (v38 >= 0.0)
      v33 = v38;
    else
      v33 = 0.0;
    v31 = v39;
    if (v37 >= v39)
      v40 = v39;
    else
      v40 = v37;
    if (v40 >= 0.0)
      v35 = v40;
    else
      v35 = 0.0;
  }
  v41 = (uint64_t)rint(v27 * v33);
  v42 = (uint64_t)rint(v27 * v35);
  v43 = v42 - v41;
  if (v42 != v41)
  {
    visibleTimeRange = self->_visibleTimeRange;
    isLiveWaveform = self->_isLiveWaveform;
    calcBlockShouldRefreshAllSlices = self->_calcBlockShouldRefreshAllSlices;
    self->_calcBlockShouldRefreshAllSlices = 0;
    v53 = self->_isLiveWaveform;
    recordDidSwitch = self->_rendererState.recordDidSwitch;
    v55 = v53 != recordDidSwitch;
    if (v53 != recordDidSwitch)
      self->_rendererState.recordDidSwitch = v53;
    v56 = v36;
    if (self->_isLiveWaveform)
    {
      v57 = CACurrentMediaTime();
      if (v57 - self->_rendererState.lastRenderTime >= v36
        || v53 != recordDidSwitch
        || self->_lastVisibleTimeDuration != v21
        || self->_fitToWidthWaveformNeedsRefresh)
      {
        self->_rendererState.lastRenderTime = v57;
        self->_lastVisibleTimeDuration = v21;
        self->_fitToWidthWaveformNeedsRefresh = 0;
        -[RCWaveformDataSource timeRangeToHighlight](self->_dataSource, "timeRangeToHighlight");
        v60 = v65;
        v62 = v66;
        v55 = 1;
        if (!a5)
          goto LABEL_49;
        goto LABEL_50;
      }
      if (!-[RCWaveformRenderer displayMode](self, "displayMode")
        && !-[RCWaveformRenderer renderReadyForDraw](self, "renderReadyForDraw"))
      {
        return;
      }
      v58 = -[RCWaveformRenderer displayMode](self, "displayMode");
      -[RCWaveformDataSource timeRangeToHighlight](self->_dataSource, "timeRangeToHighlight");
      v60 = v59;
      v62 = v61;
      v55 = 0;
      if (v58 == 1)
      {
LABEL_49:
        if (!-[RCWaveformRenderer failedFirstRenderCalculationAttempt](self, "failedFirstRenderCalculationAttempt"))
          goto LABEL_54;
        goto LABEL_50;
      }
    }
    else
    {
      -[RCWaveformDataSource timeRangeToHighlight](self->_dataSource, "timeRangeToHighlight");
      v60 = v63;
      v62 = v64;
    }
    if (!a5)
      goto LABEL_49;
LABEL_50:
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_100044B88;
    v122[3] = &unk_1001ABF70;
    v122[4] = self;
    *(double *)&v122[5] = v103;
    *(double *)&v122[6] = v101;
    v122[7] = v41;
    v122[8] = v43;
    v124 = calcBlockShouldRefreshAllSlices;
    *(double *)&v122[9] = v56;
    *(double *)&v122[10] = 2.0 / v19 * 0.5;
    v125 = isLiveWaveform;
    v126 = v55;
    *(double *)&v122[11] = v60;
    *(double *)&v122[12] = v62;
    *(double *)&v122[13] = v104;
    *(double *)&v122[14] = 1.0 / v104;
    v127 = v23;
    v123 = visibleTimeRange;
    v67 = objc_retainBlock(v122);
    if (self->_syncRenderOnMainThread
      || (WeakRetained = objc_loadWeakRetained((id *)&self->_rendererDelegate),
          v69 = objc_msgSend(WeakRetained, "isZooming"),
          WeakRetained,
          v69))
    {
      -[RCWaveformRenderer setNextRenderBlock:](self, "setNextRenderBlock:", 0);
      dispatch_sync((dispatch_queue_t)self->_renderingQueue, v67);
    }
    else if (-[RCWaveformRenderer renderingQueueIsBusy](self, "renderingQueueIsBusy"))
    {
      -[RCWaveformRenderer setNextRenderBlock:](self, "setNextRenderBlock:", v67);
    }
    else
    {
      -[RCWaveformRenderer setNextRenderBlock:](self, "setNextRenderBlock:", 0);
      dispatch_async((dispatch_queue_t)self->_renderingQueue, v67);
    }

LABEL_54:
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "waveformLayer"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer waveformAmpSlicesForRendering](self, "waveformAmpSlicesForRendering"));
    if ((id)-[RCWaveformRenderer displayMode](self, "displayMode") == (id)1)
    {
      v73 = 1;
      if (!v71)
        goto LABEL_77;
    }
    else if (-[RCWaveformRenderer displayMode](self, "displayMode"))
    {
      v73 = 0;
      if (!v71)
        goto LABEL_77;
    }
    else
    {
      v73 = -[RCWaveformRenderer renderReadyForDraw](self, "renderReadyForDraw");
      if (!v71)
      {
LABEL_77:

        return;
      }
    }
    if (objc_msgSend(v72, "count"))
      v74 = v73;
    else
      v74 = 0;
    if (v74 == 1)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer waveformColorCalculator](self, "waveformColorCalculator"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "resolvedPrimaryColor:", -[RCWaveformRenderer isLiveWaveform](self, "isLiveWaveform")));
      +[RCVisualWaveformAmpSlice setResolvedPrimaryColor:](RCVisualWaveformAmpSlice, "setResolvedPrimaryColor:", v76);

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer waveformColorCalculator](self, "waveformColorCalculator"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "resolvedSecondaryColor"));
      +[RCVisualWaveformAmpSlice setResolvedSecondaryColor:](RCVisualWaveformAmpSlice, "setResolvedSecondaryColor:", v78);
      v79 = v56;

      waveformAmpSlicesForRenderingTimeRange = self->_waveformAmpSlicesForRenderingTimeRange;
      v80 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
      objc_msgSend(v80, "currentTime");
      v82 = v81;
      v83 = vcvtmd_u64_f64(v60 / v79);

      if (v62 >= v82)
        v84 = v62;
      else
        v84 = v82;
      v117 = 0;
      v118 = &v117;
      v119 = 0x2020000000;
      waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472;
      v107[2] = sub_1000452E4;
      v107[3] = &unk_1001ABF98;
      v108 = waveformAmpSlicesForRenderingTimeRange;
      v109 = v102;
      v110 = v98;
      v111 = v99 * 0.5;
      v112 = v99 * 0.5 - v97;
      v107[4] = self;
      v107[5] = &v117;
      v113 = v60;
      v114 = v62;
      v115 = v83;
      v116 = vcvtpd_u64_f64(v84 / v79);
      v85 = objc_retainBlock(v107);
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
      if (!-[RCWaveformRenderer displayMode](self, "displayMode"))
      {
        objc_msgSend(v71, "transform");
        if (!CATransform3DIsIdentity(&v106))
        {
          v86 = *(_OWORD *)&CATransform3DIdentity.m33;
          v105[4] = *(_OWORD *)&CATransform3DIdentity.m31;
          v105[5] = v86;
          v87 = *(_OWORD *)&CATransform3DIdentity.m43;
          v105[6] = *(_OWORD *)&CATransform3DIdentity.m41;
          v105[7] = v87;
          v88 = *(_OWORD *)&CATransform3DIdentity.m13;
          v105[0] = *(_OWORD *)&CATransform3DIdentity.m11;
          v105[1] = v88;
          v89 = *(_OWORD *)&CATransform3DIdentity.m23;
          v105[2] = *(_OWORD *)&CATransform3DIdentity.m21;
          v105[3] = v89;
          objc_msgSend(v71, "setTransform:", v105);
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
          objc_msgSend(v90, "bounds");
          objc_msgSend(v71, "setFrame:");

        }
      }
      ((void (*)(_QWORD *, void *, void *, double))v85[2])(v85, v72, v71, v100);
      +[CATransaction commit](CATransaction, "commit");
      self->_renderedTimeRange = waveformAmpSlicesForRenderingTimeRange;
      if (*((_BYTE *)v118 + 24))
        self->_waveformAmpSlicesForRenderingRecordStateChanged = 0;
      self->_calcBlockShouldRefreshAllSlices = 0;
      -[RCWaveformRenderer setRenderReadyForDraw:](self, "setRenderReadyForDraw:", 0);
      -[RCWaveformRenderer setWaitForFinalCalc:](self, "setWaitForFinalCalc:", 0);
      -[RCWaveformRenderer _nonCachedContentWidthWithDuration:](self, "_nonCachedContentWidthWithDuration:", v31);
      if (self->_cachedContentWidth != v91)
      {
        self->_cachedContentWidth = v91;
        v92 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
        v93 = objc_opt_respondsToSelector(v92, "waveformRenderer:contentWidthDidChange:");

        if ((v93 & 1) != 0)
        {
          v94 = objc_loadWeakRetained((id *)&self->_rendererDelegate);
          objc_msgSend(v94, "waveformRenderer:contentWidthDidChange:", self, self->_cachedContentWidth);

        }
      }

      _Block_object_dispose(&v117, 8);
    }
    goto LABEL_77;
  }
  v44 = OSLogForCategory(kVMLogCategoryDefault);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    sub_10010AF54(v45, v46, v47, v48, v49, v50, v51, v52);

}

- (double)waveformWaveWidth
{
  void *v2;
  double v3;
  double v4;

  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "waveformWaveWidth");
  v4 = v3;

  return v4;
}

- (double)waveformHorizontalSpacing
{
  void *v2;
  double v3;
  double v4;

  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "waveformHorizontalSpacing");
  v4 = v3;

  return v4;
}

- (double)maximumDecibelDisplayRange
{
  void *v2;
  double v3;
  double v4;

  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "maximumDecibelDisplayRange");
  v4 = v3;

  return v4;
}

- (double)verticalWaveformPadding
{
  void *v2;
  double v3;
  double v4;

  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "waveformWaveVerticalPadding");
  v4 = v3;

  return v4;
}

- (BOOL)useCenteredStyleColoring
{
  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)renderDimmedUnprocessedSegments
{
  -[RCWaveformRenderer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_needsWaveformRendering
{
  char v2;
  double beginTime;
  double endTime;
  _BOOL4 waveformAmpSlicesForRenderingRecordStateChanged;
  void *v7;
  id v8;
  char v9;

  if (self->_calcBlockShouldRefreshAllSlices)
    return 1;
  beginTime = self->_waveformAmpSlicesForRenderingTimeRange.beginTime;
  endTime = self->_waveformAmpSlicesForRenderingTimeRange.endTime;
  waveformAmpSlicesForRenderingRecordStateChanged = self->_waveformAmpSlicesForRenderingRecordStateChanged;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer waveformAmpSlicesForRendering](self, "waveformAmpSlicesForRendering"));
  v8 = objc_msgSend(v7, "count");
  v9 = v8 == 0;
  if (!waveformAmpSlicesForRenderingRecordStateChanged && v8 != 0)
    v9 = RCTimeRangeEqualToTimeRange(self->_renderedTimeRange.beginTime, self->_renderedTimeRange.endTime, beginTime, endTime);
  v2 = v9 ^ 1;

  return v2;
}

- (void)_renderVisibleTimeRangeWithDuration:(double)a3
{
  unsigned int v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double visibleTimeRangeVelocity;
  double v12;

  if (-[RCWaveformRenderer _needsWaveformRendering](self, "_needsWaveformRendering")
    || self->_needsVisibleRangeRendering)
  {
    LOBYTE(v5) = 0;
    v6 = 1;
  }
  else
  {
    v6 = 0;
    v5 = !-[RCWaveformRenderer renderReadyForDraw](self, "renderReadyForDraw");
  }
  if (self->_dataSource)
  {
    if (self->_paused)
      LOBYTE(v5) = 1;
    if ((v5 & 1) == 0)
    {
      -[RCWaveformRenderer visibleTimeRange](self, "visibleTimeRange");
      v8 = v7;
      v10 = v9;
      if ((id)-[RCWaveformRenderer displayMode](self, "displayMode") == (id)1)
      {
        -[RCWaveformRenderer _updateFitToWidthUnitsPerSecond](self, "_updateFitToWidthUnitsPerSecond");
        visibleTimeRangeVelocity = self->_visibleTimeRangeVelocity;
        v12 = fabs(visibleTimeRangeVelocity);
        if (v12 > 10.0)
          v12 = 10.0;
        if (visibleTimeRangeVelocity <= 0.0)
        {
          if (visibleTimeRangeVelocity < 0.0)
            v8 = v8 - v12;
        }
        else
        {
          v10 = v10 + v12;
        }
      }
      -[RCWaveformRenderer _renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:](self, "_renderTimeRangeOfSegments:withDuration:needsWaveformCalculation:", v6, v8, v10, a3);
      self->_needsVisibleRangeRendering = 0;
    }
  }
}

- (double)_pointOffsetForTime:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformRenderer rendererDelegate](self, "rendererDelegate"));
  objc_msgSend(v8, "desiredTimeDeltaForVisibleTimeRange");
  v10 = v9;

  result = 0.0;
  if (v10 > 0.0)
    return v7 / v10 * a3;
  return result;
}

- (double)_timeForPointOffset:(double)a3 withVisibleTimeRange:(id)a4
{
  double v5;
  double v6;
  BOOL v7;
  double result;

  -[RCWaveformRenderer pointsPerSecondWithVisibleTimeRange:](self, "pointsPerSecondWithVisibleTimeRange:", a4.var0, a4.var1);
  v6 = a3 / v5;
  v7 = v5 == 0.0;
  result = 0.0;
  if (!v7)
    return v6;
  return result;
}

- (double)_timeForPointOffset:(double)a3
{
  double result;

  -[RCWaveformRenderer _timeForPointOffset:withVisibleTimeRange:](self, "_timeForPointOffset:withVisibleTimeRange:", a3, self->_visibleTimeRange.beginTime, self->_visibleTimeRange.endTime);
  return result;
}

- (void)_performOrDispatchToMainThread:(id)a3
{
  void (**block)(_QWORD);

  block = (void (**)(_QWORD))a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    block[2](block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (RCWaveformDataSource)dataSource
{
  return self->_dataSource;
}

- (RCWaveformRendererDelegate)rendererDelegate
{
  return (RCWaveformRendererDelegate *)objc_loadWeakRetained((id *)&self->_rendererDelegate);
}

- (void)setRendererDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rendererDelegate, a3);
}

- (BOOL)frequentUpdatesSegmentUpdatesExpectedHint
{
  return self->_frequentUpdatesSegmentUpdatesExpectedHint;
}

- (void)setFrequentUpdatesSegmentUpdatesExpectedHint:(BOOL)a3
{
  self->_frequentUpdatesSegmentUpdatesExpectedHint = a3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)isLiveWaveform
{
  return self->_isLiveWaveform;
}

- (BOOL)calcBlockShouldRefreshAllSlices
{
  return self->_calcBlockShouldRefreshAllSlices;
}

- (void)setCalcBlockShouldRefreshAllSlices:(BOOL)a3
{
  self->_calcBlockShouldRefreshAllSlices = a3;
}

- (BOOL)syncRenderOnMainThread
{
  return self->_syncRenderOnMainThread;
}

- (void)setSyncRenderOnMainThread:(BOOL)a3
{
  self->_syncRenderOnMainThread = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isActiveDisplayLinkRequired
{
  return self->_activeDisplayLinkRequired;
}

- (double)spacingWidth
{
  return self->_spacingWidth;
}

- (void)setSpacingWidth:(double)a3
{
  self->_spacingWidth = a3;
}

- (double)dataPointWidth
{
  return self->_dataPointWidth;
}

- (void)setDataPointWidth:(double)a3
{
  self->_dataPointWidth = a3;
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

- (void)setHighlightTimeRange:(id)a3
{
  self->_highlightTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (BOOL)fitToWidthWaveformNeedsRefresh
{
  return self->_fitToWidthWaveformNeedsRefresh;
}

- (void)setFitToWidthWaveformNeedsRefresh:(BOOL)a3
{
  self->_fitToWidthWaveformNeedsRefresh = a3;
}

- (BOOL)renderingQueueIsBusy
{
  return self->_renderingQueueIsBusy;
}

- (void)setRenderingQueueIsBusy:(BOOL)a3
{
  self->_renderingQueueIsBusy = a3;
}

- (BOOL)renderReadyForDraw
{
  return self->_renderReadyForDraw;
}

- (void)setRenderReadyForDraw:(BOOL)a3
{
  self->_renderReadyForDraw = a3;
}

- (BOOL)failedFirstRenderCalculationAttempt
{
  return self->_failedFirstRenderCalculationAttempt;
}

- (void)setFailedFirstRenderCalculationAttempt:(BOOL)a3
{
  self->_failedFirstRenderCalculationAttempt = a3;
}

- (BOOL)waitForFinalCalc
{
  return self->_waitForFinalCalc;
}

- (void)setWaitForFinalCalc:(BOOL)a3
{
  self->_waitForFinalCalc = a3;
}

- (id)nextRenderBlock
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setNextRenderBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSArray)waveformAmpSlicesForRendering
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWaveformAmpSlicesForRendering:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)waveformSlices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWaveformSlices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableIndexSet)waveformSliceIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWaveformSliceIndexes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (RCWaveformColorCalculator)waveformColorCalculator
{
  return (RCWaveformColorCalculator *)objc_getProperty(self, a2, 232, 1);
}

- (void)setWaveformColorCalculator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformColorCalculator, 0);
  objc_storeStrong((id *)&self->_waveformSliceIndexes, 0);
  objc_storeStrong((id *)&self->_waveformSlices, 0);
  objc_storeStrong((id *)&self->_waveformAmpSlicesForRendering, 0);
  objc_storeStrong(&self->_nextRenderBlock, 0);
  objc_destroyWeak((id *)&self->_rendererDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 128) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
