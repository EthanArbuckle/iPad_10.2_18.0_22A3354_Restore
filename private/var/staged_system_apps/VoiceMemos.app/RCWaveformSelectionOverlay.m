@implementation RCWaveformSelectionOverlay

- (RCWaveformSelectionOverlay)initWithFrame:(CGRect)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCWaveformSelectionOverlay.m"), 110, CFSTR("Use the designated initializer instead"));

  return 0;
}

- (RCWaveformSelectionOverlay)initWithCoder:(id)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCWaveformSelectionOverlay.m"), 116, CFSTR("this view does not support keyed coding.  use the designated initializer instead"));

  return -[RCWaveformSelectionOverlay init](self, "init");
}

- (RCWaveformSelectionOverlay)initWithDelegate:(id)a3 height:(double)a4 selectionAreaInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v11;
  RCWaveformSelectionOverlay *v12;
  RCWaveformSelectionOverlay *v13;
  uint64_t v14;
  NSMutableDictionary *trackedTouches;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v22;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RCWaveformSelectionOverlay;
  v12 = -[RCWaveformSelectionOverlay initWithFrame:](&v22, "initWithFrame:", 0.0, 0.0, 0.0, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    v13->_selectionAreaInsets.top = top;
    v13->_selectionAreaInsets.left = left;
    v13->_selectionAreaInsets.bottom = bottom;
    v13->_selectionAreaInsets.right = right;
    v13->_selectionRect.origin.x = 0.0;
    v13->_selectionRect.origin.y = 0.0;
    v13->_selectionRect.size.width = 0.0;
    v13->_selectionRect.size.height = 177.0;
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    trackedTouches = v13->_trackedTouches;
    v13->_trackedTouches = (NSMutableDictionary *)v14;

    -[RCWaveformSelectionOverlay sizeThatFits:](v13, "sizeThatFits:", 0.0, a4);
    v17 = v16;
    v19 = v18;
    -[RCWaveformSelectionOverlay setMultipleTouchEnabled:](v13, "setMultipleTouchEnabled:", 1);
    -[RCWaveformSelectionOverlay setFrame:](v13, "setFrame:", 0.0, 0.0, v17, v19);
    -[RCWaveformSelectionOverlay setOpaque:](v13, "setOpaque:", 0);
    -[RCWaveformSelectionOverlay setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RCWaveformSelectionOverlay setBackgroundColor:](v13, "setBackgroundColor:", v20);

    -[RCWaveformSelectionOverlay setIsRecording:](v13, "setIsRecording:", 0);
    v13->_trackedAssetCurrentTime = -1.0;
  }

  return v13;
}

- (void)setSelectionRect:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_selectionRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_selectionRect = &self->_selectionRect;
  if (!CGRectEqualToRect(self->_selectionRect, a3))
  {
    if (p_selectionRect->size.height != height)
      -[RCWaveformSelectionOverlay _clearSublayers](self, "_clearSublayers");
    p_selectionRect->origin.x = x;
    p_selectionRect->origin.y = y;
    p_selectionRect->size.width = width;
    p_selectionRect->size.height = height;
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedTimeRange:(id)a3 withAnimationDuration:(double)a4
{
  double var1;
  double var0;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_selectedTimeRange;

  var1 = a3.var1;
  var0 = a3.var0;
  p_selectedTimeRange = &self->_selectedTimeRange;
  if ((RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, a3.var0, a3.var1) & 1) == 0)
  {
    p_selectedTimeRange->beginTime = var0;
    p_selectedTimeRange->endTime = var1;
    -[RCWaveformSelectionOverlay reloadSelectionOffsets](self, "reloadSelectionOffsets");
    -[RCWaveformSelectionOverlay _setWantsAnimatedLayoutDuration:](self, "_setWantsAnimatedLayoutDuration:", a4);
  }
}

- (void)setSelectedTimeRange:(id)a3
{
  -[RCWaveformSelectionOverlay setSelectedTimeRange:withAnimationDuration:](self, "setSelectedTimeRange:withAnimationDuration:", a3.var0, a3.var1, 0.0);
}

- (void)reloadSelectionOffsets
{
  id WeakRetained;
  double v4;
  double beginTime;
  double endTime;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformSelectionOverlayGetCurrentTime:", self);
  self->_assetCurrentTime = v4;

  if (self->_assetCurrentTime >= 0.0
    || self->_trackedAssetCurrentTime >= 0.0
    || RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) > 0.00000011920929)
  {
    beginTime = self->_selectedTimeRange.beginTime;
    endTime = self->_selectedTimeRange.endTime;
  }
  else
  {
    beginTime = RCTimeRangeMake(self->_assetCurrentTime, self->_assetCurrentTime);
  }
  -[RCWaveformSelectionOverlay _selectionRectForSelectedTimeRange:](self, "_selectionRectForSelectedTimeRange:", beginTime, endTime);
  -[RCWaveformSelectionOverlay setSelectionRect:](self, "setSelectionRect:");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCWaveformSelectionOverlay frame](self, "frame");
  if (v8 == height)
  {
    v9.receiver = self;
    v9.super_class = (Class)RCWaveformSelectionOverlay;
    -[RCWaveformSelectionOverlay setFrame:](&v9, "setFrame:", x, y, width, height);
  }
  else
  {
    -[RCWaveformSelectionOverlay _clearSublayers](self, "_clearSublayers");
    v10.receiver = self;
    v10.super_class = (Class)RCWaveformSelectionOverlay;
    -[RCWaveformSelectionOverlay setFrame:](&v10, "setFrame:", x, y, width, height);
    -[RCWaveformSelectionOverlay reloadSelectionOffsets](self, "reloadSelectionOffsets");
  }
  -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTrackedAssetCurrentTime:(double)a3
{
  if (self->_trackedAssetCurrentTime != a3)
  {
    self->_trackedAssetCurrentTime = a3;
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAssetCurrentTime:(double)a3
{
  if (self->_assetCurrentTime != a3)
  {
    self->_assetCurrentTime = a3;
    if (self->_trackedAssetCurrentTime < 0.0)
      -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAssetDuration:(double)a3
{
  self->_assetDuration = a3;
  -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectionMode:(int64_t)a3
{
  if (self->_selectionMode != a3)
  {
    self->_selectionMode = a3;
    -[RCWaveformSelectionOverlay _clearSublayers](self, "_clearSublayers");
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)currentTimeIndicatorCoordinate
{
  CGRect v4;

  -[RCWaveformSelectionOverlay layoutIfNeeded](self, "layoutIfNeeded");
  -[RCOverlayBarLayer frame](self->_currentTimeBar, "frame");
  return CGRectGetMidX(v4);
}

- (int64_t)beginTimeIndicatorSelectionAffinity
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 0));
  v3 = objc_msgSend(v2, "selectionAffinity");

  return (int64_t)v3;
}

- (int64_t)endTimeIndicatorSelectionAffinity
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 1));
  v3 = objc_msgSend(v2, "selectionAffinity");

  return (int64_t)v3;
}

- (void)setIsRecording:(BOOL)a3
{
  if (self->_isRecording != a3)
  {
    self->_isRecording = a3;
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_clearSublayers
{
  RCOverlayBarLayer *beginTimeSelection;
  RCOverlayBarLayer *endTimeSelection;
  CALayer *middleSelectionOverlay;
  CALayer *corneredDimOverlayContainer;
  RCOverlayBarLayer *currentTimeBar;
  RCOverlayBarLayer *compactCurrentTimeBar;

  -[RCOverlayBarLayer removeFromSuperlayer](self->_beginTimeSelection, "removeFromSuperlayer");
  beginTimeSelection = self->_beginTimeSelection;
  self->_beginTimeSelection = 0;

  -[RCOverlayBarLayer removeFromSuperlayer](self->_endTimeSelection, "removeFromSuperlayer");
  endTimeSelection = self->_endTimeSelection;
  self->_endTimeSelection = 0;

  -[CALayer removeFromSuperlayer](self->_middleSelectionOverlay, "removeFromSuperlayer");
  middleSelectionOverlay = self->_middleSelectionOverlay;
  self->_middleSelectionOverlay = 0;

  -[CALayer removeFromSuperlayer](self->_corneredDimOverlayContainer, "removeFromSuperlayer");
  corneredDimOverlayContainer = self->_corneredDimOverlayContainer;
  self->_corneredDimOverlayContainer = 0;

  -[RCOverlayBarLayer removeFromSuperlayer](self->_currentTimeBar, "removeFromSuperlayer");
  currentTimeBar = self->_currentTimeBar;
  self->_currentTimeBar = 0;

  -[RCOverlayBarLayer removeFromSuperlayer](self->_compactCurrentTimeBar, "removeFromSuperlayer");
  compactCurrentTimeBar = self->_compactCurrentTimeBar;
  self->_compactCurrentTimeBar = 0;

  self->_sublayersCreated = 0;
}

- (void)_createSublayersIfNeeded
{
  CALayer *v3;
  CALayer *middleSelectionOverlay;
  id v5;
  CALayer *v6;
  CALayer *corneredDimOverlayContainer;
  id v8;
  double v9;
  double v10;
  _BOOL4 overviewTrimHandleStyle;
  RCOverlayBarLayer *v12;
  void *v13;
  double v14;
  RCOverlayBarLayer *v15;
  RCOverlayBarLayer *beginTimeSelection;
  RCOverlayBarLayer *v17;
  RCOverlayBarLayer *v18;
  _BOOL4 v19;
  RCOverlayBarLayer *v20;
  void *v21;
  double v22;
  RCOverlayBarLayer *v23;
  RCOverlayBarLayer *endTimeSelection;
  RCOverlayBarLayer *v25;
  RCOverlayBarLayer *v26;
  double v27;
  double v28;
  RCOverlayBarLayer *v29;
  void *v30;
  double v31;
  RCOverlayBarLayer *v32;
  RCOverlayBarLayer *currentTimeBar;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  RCOverlayBarLayer *v40;
  void *v41;
  void *v42;
  RCOverlayBarLayer *v43;
  RCOverlayBarLayer *compactCurrentTimeBar;
  id v45;

  if (!self->_sublayersCreated)
  {
    v45 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    if (!self->_middleSelectionOverlay)
    {
      v3 = (CALayer *)objc_alloc_init((Class)CALayer);
      middleSelectionOverlay = self->_middleSelectionOverlay;
      self->_middleSelectionOverlay = v3;

      if (self->_overviewTrimHandleStyle)
      {
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "selectionOverlayEndpointBarColor")));
        -[CALayer setBorderColor:](self->_middleSelectionOverlay, "setBorderColor:", objc_msgSend(v5, "CGColor"));

        objc_msgSend(v45, "selectionOverlayBorderWidth");
        -[CALayer setBorderWidth:](self->_middleSelectionOverlay, "setBorderWidth:");
      }
    }
    if (!self->_corneredDimOverlayContainer)
    {
      v6 = (CALayer *)objc_alloc_init((Class)CALayer);
      corneredDimOverlayContainer = self->_corneredDimOverlayContainer;
      self->_corneredDimOverlayContainer = v6;

      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
      -[CALayer setBackgroundColor:](self->_corneredDimOverlayContainer, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

      if (self->_overviewTrimHandleStyle)
      {
        objc_msgSend(v45, "overviewWaveformCornerRadius");
        -[CALayer setCornerRadius:](self->_corneredDimOverlayContainer, "setCornerRadius:");
        -[CALayer setMasksToBounds:](self->_corneredDimOverlayContainer, "setMasksToBounds:", 1);
      }
    }
    -[RCWaveformSelectionOverlay knobWidthMultiplier](self, "knobWidthMultiplier");
    -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
    v10 = v9;
    if (!self->_beginTimeSelection)
    {
      overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
      v12 = [RCOverlayBarLayer alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "selectionOverlayEndpointBarColor"));
      -[RCWaveformSelectionOverlay knobWidthMultiplier](self, "knobWidthMultiplier");
      if (overviewTrimHandleStyle)
      {
        v15 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v12, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v13, 0, 0, 1, v10, v14);
        beginTimeSelection = self->_beginTimeSelection;
        self->_beginTimeSelection = v15;

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Trim_Chevron_Left")));
        -[RCOverlayBarLayer setBarGlyph:](self->_beginTimeSelection, "setBarGlyph:", v13);
      }
      else
      {
        v17 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v12, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v13, 1, 1, 0, v10, v14);
        v18 = self->_beginTimeSelection;
        self->_beginTimeSelection = v17;

      }
    }
    if (!self->_endTimeSelection)
    {
      v19 = self->_overviewTrimHandleStyle;
      v20 = [RCOverlayBarLayer alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "selectionOverlayEndpointBarColor"));
      -[RCWaveformSelectionOverlay knobWidthMultiplier](self, "knobWidthMultiplier");
      if (v19)
      {
        v23 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v20, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v21, 0, 0, 1, v10, v22);
        endTimeSelection = self->_endTimeSelection;
        self->_endTimeSelection = v23;

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Trim_Chevron_Right")));
        -[RCOverlayBarLayer setBarGlyph:](self->_endTimeSelection, "setBarGlyph:", v21);
      }
      else
      {
        v25 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v20, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v21, 1, 1, 0, v10, v22);
        v26 = self->_endTimeSelection;
        self->_endTimeSelection = v25;

      }
    }
    if (!self->_currentTimeBar)
    {
      -[RCWaveformSelectionOverlay playWidthMultiplier](self, "playWidthMultiplier");
      -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
      v28 = v27;
      v29 = [RCOverlayBarLayer alloc];
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "playbackPositionBarColor"));
      -[RCWaveformSelectionOverlay playWidthMultiplier](self, "playWidthMultiplier");
      v32 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v29, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v30, 1, 1, -[RCWaveformSelectionOverlay barMatchesKnobRadius](self, "barMatchesKnobRadius"), v28, v31);
      currentTimeBar = self->_currentTimeBar;
      self->_currentTimeBar = v32;

    }
    if (!self->_compactCurrentTimeBar)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v34, "compactStyleTimeBarDefaultHeight");
      v36 = v35;

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v37, "compactStylePlayheadMultiplier");
      v39 = v38;

      v40 = [RCOverlayBarLayer alloc];
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "playbackPositionBarColor"));
      v43 = -[RCOverlayBarLayer initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:](v40, "initWithColor:selectionExtentIncludingKnobs:topKnob:bottomKnob:widthMultiplier:barWidthMatchesKnobs:", v42, 0, 0, 1, v36, v39);
      compactCurrentTimeBar = self->_compactCurrentTimeBar;
      self->_compactCurrentTimeBar = v43;

    }
    +[CATransaction commit](CATransaction, "commit");
    self->_sublayersCreated = 1;

  }
}

- (void)_setWantsAnimatedLayoutDuration:(double)a3
{
  BOOL requestedNonAnimatedLayout;

  if (a3 <= 0.0)
  {
    requestedNonAnimatedLayout = 1;
  }
  else
  {
    self->_requestedAnimatedLayoutDuration = a3;
    requestedNonAnimatedLayout = self->_requestedNonAnimatedLayout;
  }
  self->_requestedNonAnimatedLayout = requestedNonAnimatedLayout;
  -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEditingEnabled:(BOOL)a3
{
  if (self->_editingEnabled != a3)
  {
    self->_editingEnabled = a3;
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
    -[RCWaveformSelectionOverlay layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setInsertMode:(BOOL)a3
{
  if (self->_insertMode != a3)
  {
    self->_insertMode = a3;
    -[RCWaveformSelectionOverlay setNeedsLayout](self, "setNeedsLayout");
    -[RCWaveformSelectionOverlay layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)layoutSubviews
{
  void *v3;
  unsigned int v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _QWORD *v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 overviewTrimHandleStyle;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id WeakRetained;
  void *v32;
  double assetDuration;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinY;
  double v40;
  __n128 v41;
  __n128 v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  __n128 v51;
  __n128 v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double trackedAssetCurrentTime;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  unsigned int v89;
  double v90;
  double v91;
  id v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  double v107;
  CGFloat v108;
  int64_t selectionMode;
  _BOOL8 v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  double v121;
  void *v122;
  uint64_t v123;
  void *v124;
  double MidX;
  double v126;
  double v127;
  double v128;
  CALayer *middleSelectionOverlay;
  CGFloat v130;
  double v131;
  __n128 v132;
  unint64_t v133;
  id v134;
  id v135;
  double v136;
  id v137;
  double v138;
  double v139;
  id v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  uint64_t v147;
  void *i;
  double v149;
  void *v150;
  double v151;
  double v152;
  unsigned int v153;
  double v154;
  double v155;
  unsigned int v156;
  double v157;
  void *v158;
  double v159;
  double v160;
  id v161;
  id *location;
  double v163;
  double rect;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[7];
  char v170;
  _BYTE v171[128];
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "isInAndromeda");

  if (self->_requestedAnimatedLayoutDuration <= 0.0)
  {
    v5 = 0;
  }
  else if (self->_requestedNonAnimatedLayout)
  {
    v5 = 0;
  }
  else
  {
    v5 = v4 ^ 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v6, "animationDragCoefficient");
  v8 = v7;

  v9 = v8 * self->_requestedAnimatedLayoutDuration;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (v5)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", v9);
  }
  else if (v4)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  }
  self->_requestedAnimatedLayoutDuration = 0.0;
  self->_requestedNonAnimatedLayout = 0;
  v169[0] = _NSConcreteStackBlock;
  v169[1] = 3221225472;
  v169[2] = sub_1000342BC;
  v169[3] = &unk_1001ABB60;
  v169[4] = self;
  *(double *)&v169[5] = v8;
  *(double *)&v169[6] = v9;
  v170 = v5;
  v11 = objc_retainBlock(v169);
  -[RCWaveformSelectionOverlay _createSublayersIfNeeded](self, "_createSublayersIfNeeded");
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobs](self, "_selectionBoundsIncludingKnobs");
  x = v172.origin.x;
  y = v172.origin.y;
  width = v172.size.width;
  height = v172.size.height;
  if (CGRectIsEmpty(v172)
    || (v173.origin.x = x, v173.origin.y = y, v173.size.width = width, v173.size.height = height, CGRectIsInfinite(v173))
    || fabs(x) == INFINITY
    || fabs(y) == INFINITY
    || fabs(width) == INFINITY
    || fabs(height) == INFINITY)
  {
    if (v5)
      +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    v156 = v4;
    if (-[RCWaveformSelectionOverlay playBarOnly](self, "playBarOnly"))
    {
      v153 = 0;
      v16 = 0.0;
    }
    else
    {
      v153 = -[RCWaveformSelectionOverlay isEditingEnabled](self, "isEditingEnabled");
      v16 = 0.0;
      if (v153)
        v16 = 1.0;
    }
    v152 = v16;
    -[RCWaveformSelectionOverlay selectedTimeRange](self, "selectedTimeRange");
    v18 = v17;
    v157 = v19;
    v20 = RCTimeRangeDeltaWithUIPrecision(v17, v19);
    v151 = v20;
    v21 = v20 == 0.0 && self->_insertMode;
    v22 = v20 > 0.0 || !self->_insertMode;
    overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
    -[CALayer setZPosition:](self->_middleSelectionOverlay, "setZPosition:", 1.0);
    if (overviewTrimHandleStyle)
      v24 = 3.0;
    else
      v24 = 2.0;
    if (overviewTrimHandleStyle)
      v25 = 2.0;
    else
      v25 = 3.0;
    -[RCOverlayBarLayer setZPosition:](self->_currentTimeBar, "setZPosition:", v24);
    -[RCOverlayBarLayer setZPosition:](self->_compactCurrentTimeBar, "setZPosition:", v24);
    -[RCOverlayBarLayer setZPosition:](self->_beginTimeSelection, "setZPosition:", v25);
    -[RCOverlayBarLayer setZPosition:](self->_endTimeSelection, "setZPosition:", v25);
    -[CALayer setZPosition:](self->_corneredDimOverlayContainer, "setZPosition:", 0.5);
    -[RCWaveformSelectionOverlay _selectionHighlightBounds](self, "_selectionHighlightBounds");
    v163 = v26;
    rect = v27;
    -[RCOverlayBarLayer frame](self->_beginTimeSelection, "frame");
    v29 = v28;
    v159 = v30;
    location = (id *)&self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v32 = WeakRetained;
    assetDuration = self->_assetDuration;
    if (v18 < assetDuration)
      assetDuration = v18;
    if (assetDuration < 0.0)
      assetDuration = 0.0;
    objc_msgSend(WeakRetained, "waveformSelectionOverlay:offsetForTime:", self, assetDuration);
    v35 = v34;

    v154 = v35;
    if (self->_overviewTrimHandleStyle)
    {
      if (v21 || v22)
      {
        -[RCOverlayBarLayer frame](self->_endTimeSelection, "frame");
        v37 = v36;
        -[RCOverlayBarLayer setMasksToBounds:](self->_beginTimeSelection, "setMasksToBounds:", 0);
        v159 = rect;
        v38 = v163;
        MinY = v163;
        v40 = v37;
      }
      else
      {
        -[RCOverlayBarLayer setMasksToBounds:](self->_beginTimeSelection, "setMasksToBounds:", 1);
        v40 = 1.0;
        v159 = rect;
        v38 = v163;
        MinY = v163;
        v37 = 1.0;
      }
    }
    else
    {
      v40 = v29;
      v37 = v29 * 0.5;
      v174.origin.x = x;
      v174.origin.y = y;
      v174.size.width = width;
      v174.size.height = height;
      MinY = CGRectGetMinY(v174);
      v38 = v163;
    }
    v41.n128_f64[0] = RCRoundCoord(v154 - v37);
    if (v21)
      v42.n128_f64[0] = 0.0;
    else
      v42.n128_f64[0] = v152;
    ((void (*)(_QWORD *, RCOverlayBarLayer *, _QWORD, _QWORD, __n128, double, double, double, __n128))v11[2])(v11, self->_beginTimeSelection, 0, 0, v41, MinY, v40, v159, v42);
    -[RCOverlayBarLayer frame](self->_endTimeSelection, "frame");
    v160 = v43;
    v155 = v44;
    v45 = objc_loadWeakRetained(location);
    v46 = v45;
    v47 = self->_assetDuration;
    if (v157 < v47)
      v47 = v157;
    if (v47 < 0.0)
      v47 = 0.0;
    objc_msgSend(v45, "waveformSelectionOverlay:offsetForTime:", self, v47);
    v49 = v48;

    v50 = rect;
    if (!self->_overviewTrimHandleStyle)
    {
      v49 = v49 + v160 * -0.5;
      v175.origin.x = x;
      v175.origin.y = y;
      v175.size.width = width;
      v175.size.height = height;
      v38 = CGRectGetMinY(v175);
      v50 = v155;
    }
    v51.n128_f64[0] = RCRoundCoord(v49);
    if (v22)
      v52.n128_f64[0] = v152;
    else
      v52.n128_f64[0] = 0.0;
    ((void (*)(_QWORD *, RCOverlayBarLayer *, _QWORD, _QWORD, __n128, double, double, double, __n128))v11[2])(v11, self->_endTimeSelection, 0, 0, v51, v38, v160, v50, v52);
    -[RCWaveformSelectionOverlay playWidthMultiplier](self, "playWidthMultiplier");
    -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    trackedAssetCurrentTime = self->_trackedAssetCurrentTime;
    if (trackedAssetCurrentTime < 0.0)
    {
      v62 = objc_loadWeakRetained(location);
      objc_msgSend(v62, "waveformSelectionOverlayGetCurrentTime:", self);
      trackedAssetCurrentTime = v63;

    }
    v64 = self->_assetDuration;
    if (trackedAssetCurrentTime < v64)
      v64 = trackedAssetCurrentTime;
    if (v64 >= 0.0)
      v65 = v64;
    else
      v65 = 0.0;
    -[RCOverlayBarLayer frame](self->_currentTimeBar, "frame");
    v67 = v66;
    v69 = v68;
    v70 = objc_loadWeakRetained(location);
    objc_msgSend(v70, "waveformSelectionOverlay:offsetForTime:", self, v65);
    v72 = v71;

    +[RCOverlayBarLayer selectionKnobRadius](RCOverlayBarLayer, "selectionKnobRadius");
    v74 = v73;
    -[RCWaveformSelectionOverlay playWidthMultiplier](self, "playWidthMultiplier");
    v76 = RCRoundCoord(v72 - v74 * v75);
    if (self->_overviewTrimHandleStyle)
    {
      objc_msgSend(v10, "overviewPlayheadHeightInset");
      v78 = -v77;
      v176.origin.x = v76;
      v176.origin.y = v163;
      v176.size.width = v67;
      v176.size.height = rect;
      v177 = CGRectInset(v176, 0.0, v78);
      v76 = v177.origin.x;
      v79 = v177.origin.y;
      v67 = v177.size.width;
      v69 = v177.size.height;
    }
    else
    {
      v178.origin.x = v54;
      v178.origin.y = v56;
      v178.size.width = v58;
      v178.size.height = v60;
      v79 = CGRectGetMinY(v178);
    }
    if (v72 < 0.0)
      v80 = 0.0;
    else
      v80 = 1.0;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay layer](self, "layer"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "animationForKey:", CFSTR("bounds.origin")));

    v158 = v82;
    if (objc_msgSend(v82, "isMemberOfClass:", objc_opt_class(CASpringAnimation, v83)))
      v161 = v82;
    else
      v161 = 0;
    -[RCOverlayBarLayer position](self->_currentTimeBar, "position");
    v85 = v84;
    v87 = v86;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay delegate](self, "delegate"));
    v89 = objc_msgSend(v88, "waveformSelectionOverlayNeedsExplicitAnimations");

    -[RCOverlayBarLayer frame](self->_currentTimeBar, "frame");
    if (v89 && v161)
    {
      v91 = v76 - v85;
      if (v76 - v85 < 0.0)
        v91 = -(v76 - v85);
      if (v91 > v90)
      {
        +[CATransaction begin](CATransaction, "begin");
        v92 = v158;
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position")));
        objc_msgSend(v92, "duration");
        objc_msgSend(v93, "setDuration:");
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "timingFunction"));
        objc_msgSend(v93, "setTimingFunction:", v94);

        objc_msgSend(v92, "damping");
        objc_msgSend(v93, "setDamping:");
        objc_msgSend(v92, "stiffness");
        objc_msgSend(v93, "setStiffness:");
        objc_msgSend(v92, "mass");
        v96 = v95;

        objc_msgSend(v93, "setMass:", v96);
        -[RCOverlayBarLayer position](self->_currentTimeBar, "position");
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        objc_msgSend(v93, "setFromValue:", v97);

        -[RCOverlayBarLayer setPosition:](self->_currentTimeBar, "setPosition:", v76, v79);
        -[RCOverlayBarLayer addAnimation:forKey:](self->_currentTimeBar, "addAnimation:forKey:", v93, CFSTR("position"));
        +[CATransaction commit](CATransaction, "commit");

      }
    }
    else if (v85 != v76 || v87 != v79)
    {
      ((void (*)(_QWORD *, RCOverlayBarLayer *, _QWORD, _QWORD, double, double, double, double, double))v11[2])(v11, self->_currentTimeBar, 0, 0, v76, v79, v67, v69, v80);
    }
    -[RCWaveformSelectionOverlay bounds](self, "bounds");
    v99 = v98;
    v101 = v100;
    v103 = v102;
    -[RCOverlayBarLayer frame](self->_compactCurrentTimeBar, "frame");
    v104 = CGRectGetWidth(v179);
    v180.origin.x = v99;
    v180.origin.y = v101;
    v180.size.width = v104;
    v180.size.height = v103;
    v105 = CGRectGetWidth(v180);
    v106 = RCRoundCoord(v72 + v105 * -0.5);
    objc_msgSend(v10, "compactStyleTimeBarHeightInset");
    v108 = v107;
    v181.origin.x = v106;
    v181.origin.y = v101;
    v181.size.width = v104;
    v181.size.height = v103;
    v182 = CGRectInset(v181, 0.0, v108);
    ((void (*)(_QWORD *, RCOverlayBarLayer *, _QWORD, _QWORD, CGPoint, __n128, CGSize, __n128, double))v11[2])(v11, self->_compactCurrentTimeBar, 0, 0, v182.origin, *(__n128 *)&v182.origin.y, v182.size, *(__n128 *)&v182.size.height, v80);
    selectionMode = self->_selectionMode;
    v110 = selectionMode == 1;
    -[RCOverlayBarLayer setHidden:](self->_compactCurrentTimeBar, "setHidden:", selectionMode != 1);
    -[RCOverlayBarLayer setHidden:](self->_currentTimeBar, "setHidden:", v110);
    if (self->_insertMode)
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordPositionBarColor"));
      -[RCOverlayBarLayer setColor:](self->_beginTimeSelection, "setColor:", v111);

      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordPositionBarColor"));
      -[RCOverlayBarLayer setColor:](self->_endTimeSelection, "setColor:", v112);

      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replaceSelectionOverlayColor"));
      v114 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
      objc_msgSend(v114, "setBackgroundColor:", v113);

      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordPositionBarColor"));
    }
    else
    {
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionOverlayEndpointBarColor"));
      -[RCOverlayBarLayer setColor:](self->_beginTimeSelection, "setColor:", v116);

      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionOverlayEndpointBarColor"));
      -[RCOverlayBarLayer setColor:](self->_endTimeSelection, "setColor:", v117);

      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionOverlayColor"));
      v119 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
      objc_msgSend(v119, "setBackgroundColor:", v118);

      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionOverlayEndpointBarColor"));
    }
    v120 = objc_retainAutorelease(v115);
    -[CALayer setBorderColor:](self->_middleSelectionOverlay, "setBorderColor:", objc_msgSend(v120, "CGColor"));

    if (self->_isRecording || self->_insertMode && (v121 = v151, v151 == 0.0))
    {
      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordPositionBarColor"));
      -[RCOverlayBarLayer setColor:](self->_currentTimeBar, "setColor:", v122);

      v123 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordPositionBarColor"));
    }
    else
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackPositionBarColor", v121));
      -[RCOverlayBarLayer setColor:](self->_currentTimeBar, "setColor:", v150);

      v123 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackPositionBarColor"));
    }
    v124 = (void *)v123;
    -[RCOverlayBarLayer setColor:](self->_compactCurrentTimeBar, "setColor:", v123);

    -[RCOverlayBarLayer frame](self->_beginTimeSelection, "frame");
    MidX = CGRectGetMidX(v183);
    -[RCOverlayBarLayer frame](self->_endTimeSelection, "frame");
    v126 = CGRectGetMidX(v184) - MidX;
    v127 = RCRoundCoord(MidX);
    v128 = RCRoundCoord(v126);
    middleSelectionOverlay = self->_middleSelectionOverlay;
    v130 = 0.0;
    v131 = 0.0;
    v132.n128_u64[0] = 0;
    if ((v153 & v22) == 1)
    {
      objc_msgSend(v10, "selectionOverlayAlpha");
      v132.n128_u64[0] = v133;
      v131 = 1.0;
    }
    ((void (*)(_QWORD *, CALayer *, _QWORD, _QWORD, double, double, double, double, __n128))v11[2])(v11, middleSelectionOverlay, 0, 0, v127, v163, v128, rect, v132);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v134 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
    objc_msgSend(v134, "setFrame:", v127, v163, v128, rect);

    v135 = objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
    objc_msgSend(v135, "setAlpha:", v131);

    if (-[RCWaveformSelectionOverlay overviewTrimHandleStyle](self, "overviewTrimHandleStyle"))
    {
      objc_msgSend(v10, "selectionOverlayBorderWidth");
      v130 = v136;
    }
    v137 = objc_loadWeakRetained(location);
    objc_msgSend(v137, "waveformSelectionOverlay:offsetForTime:", self, 0.0);
    v139 = v138;

    v140 = objc_loadWeakRetained(location);
    objc_msgSend(v140, "waveformSelectionOverlay:offsetForTime:", self, self->_assetDuration);
    v142 = v141;

    v185.origin.x = v127;
    v185.origin.y = v163;
    v185.size.width = v128;
    v185.size.height = rect;
    v186 = CGRectInset(v185, 0.0, v130);
    ((void (*)(_QWORD *, CALayer *, _QWORD, _QWORD, double, __n128, double, __n128, double))v11[2])(v11, self->_corneredDimOverlayContainer, 0, 0, v139, *(__n128 *)&v186.origin.y, v142 - v139, *(__n128 *)&v186.size.height, v131);
    v187.origin.x = v127 - v139;
    v187.origin.y = v163;
    v187.size.width = v128;
    v187.size.height = rect;
    +[CATransaction commit](CATransaction, "commit", CGRectGetMinX(v187));
    if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
    {
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v143 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay layer](self, "layer"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "sublayers"));

      v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
      if (v145)
      {
        v146 = v145;
        v147 = *(_QWORD *)v166;
        do
        {
          for (i = 0; i != v146; i = (char *)i + 1)
          {
            if (*(_QWORD *)v166 != v147)
              objc_enumerationMutation(v144);
            objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)i), "setHidden:", 1);
          }
          v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
        }
        while (v146);
      }

      -[RCOverlayBarLayer setHidden:](self->_currentTimeBar, "setHidden:", 0);
      LODWORD(v149) = 1.0;
      -[RCOverlayBarLayer setOpacity:](self->_currentTimeBar, "setOpacity:", v149);
    }
    if ((v5 | v156) == 1)
      +[CATransaction commit](CATransaction, "commit");

  }
}

- (id)_hitSelectionForPoint:(CGPoint)a3
{
  CGFloat y;
  double x;
  void *v6;
  _QWORD *v7;
  double v8;
  double v9;
  double v10;
  id *p_endTimeSelection;
  RCOverlayBarLayer *endTimeSelection;
  RCOverlayBarLayer *beginTimeSelection;
  double v14;
  id v15;
  double v16;
  RCOverlayBarLayer *v17;
  double v18;
  RCOverlayBarLayer *currentTimeBar;
  double v20;
  double v21;
  double v22;
  id v23;
  _QWORD v25[7];

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100034950;
  v25[3] = &unk_1001ABB88;
  v25[4] = self;
  *(double *)&v25[5] = x;
  *(CGFloat *)&v25[6] = y;
  v7 = objc_retainBlock(v25);
  if (self->_editingEnabled)
  {
    if (x >= 0.0)
    {
      -[RCWaveformSelectionOverlay frame](self, "frame");
      v8 = 0.0;
      if (x > v9)
      {
        -[RCWaveformSelectionOverlay frame](self, "frame");
        v8 = x - v10;
      }
    }
    else
    {
      v8 = fabs(x);
    }
    p_endTimeSelection = (id *)&self->_endTimeSelection;
    endTimeSelection = self->_endTimeSelection;
    objc_msgSend(v6, "selectionHitTestSlop");
    if ((((uint64_t (*)(_QWORD *, RCOverlayBarLayer *))v7[2])(v7, endTimeSelection) & 1) != 0)
      goto LABEL_16;
    beginTimeSelection = self->_beginTimeSelection;
    objc_msgSend(v6, "selectionHitTestSlop");
    if ((((uint64_t (*)(_QWORD *, RCOverlayBarLayer *, double, double))v7[2])(v7, beginTimeSelection, 0.0, v14) & 1) != 0)
    {
      p_endTimeSelection = (id *)&self->_beginTimeSelection;
      goto LABEL_16;
    }
    v15 = *p_endTimeSelection;
    objc_msgSend(v6, "selectionHitTestSlop");
    if ((((uint64_t (*)(_QWORD *, id, double, double))v7[2])(v7, v15, 0.0, v8 + v16) & 1) != 0)
      goto LABEL_16;
    v17 = self->_beginTimeSelection;
    objc_msgSend(v6, "selectionHitTestSlop");
    p_endTimeSelection = (id *)&self->_beginTimeSelection;
    if ((((uint64_t (*)(_QWORD *, RCOverlayBarLayer *, double, double))v7[2])(v7, v17, v8 + v18, 0.0) & 1) != 0)
      goto LABEL_16;
    if (-[RCWaveformSelectionOverlay enablePlayBarTracking](self, "enablePlayBarTracking"))
    {
      if (v8 == 0.0)
      {
        p_endTimeSelection = (id *)&self->_currentTimeBar;
        currentTimeBar = self->_currentTimeBar;
        objc_msgSend(v6, "selectionHitTestSlop");
        v21 = v20;
        objc_msgSend(v6, "selectionHitTestSlop");
        if ((((uint64_t (*)(_QWORD *, RCOverlayBarLayer *, double, double))v7[2])(v7, currentTimeBar, v21, v22) & 1) != 0)goto LABEL_16;
      }
    }
  }
  if (!-[RCWaveformSelectionOverlay enableTimeTrackingInView](self, "enableTimeTrackingInView"))
  {
    v23 = 0;
    goto LABEL_18;
  }
  p_endTimeSelection = (id *)&self->_currentTimeBar;
LABEL_16:
  v23 = *p_endTimeSelection;
LABEL_18:

  return v23;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _hitSelectionForPoint:](self, "_hitSelectionForPoint:", a4, a3.x, a3.y));
  v5 = v4 != 0;

  return v5;
}

- (BOOL)_beginTrackingSelectionBar:(id)a3 selectionBarType:(int64_t)a4 withTouch:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *trackedTouches;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  uint64_t v17;
  double v21;
  double MaxX;
  RCSelectionTouchTrackingInfo *v23;
  void *v24;
  double v25;
  NSMutableDictionary *v26;
  void *v27;

  v8 = a3;
  v9 = a5;
  trackedTouches = self->_trackedTouches;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](trackedTouches, "objectForKey:", v11));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", a4));

    if (!v13)
    {
      objc_msgSend(v9, "locationInView:", self);
      v14 = (id)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _hitSelectionForPoint:](self, "_hitSelectionForPoint:"));

      if (v14 == v8)
      {
        -[RCWaveformSelectionOverlay selectionRect](self, "selectionRect");
        if (a4 == 2)
        {
          -[RCWaveformSelectionOverlay currentTimeIndicatorCoordinate](self, "currentTimeIndicatorCoordinate");
        }
        else if (a4 == 1)
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v17);
        }
        else
        {
          v21 = 0.0;
          if (a4)
          {
LABEL_13:
            v23 = objc_alloc_init(RCSelectionTouchTrackingInfo);
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay superview](self, "superview"));
            objc_msgSend(v9, "locationInView:", v24);
            -[RCSelectionTouchTrackingInfo setTrackingOffset:](v23, "setTrackingOffset:", v21 - v25);

            -[RCSelectionTouchTrackingInfo setSelectionBarType:](v23, "setSelectionBarType:", a4);
            -[RCSelectionTouchTrackingInfo setTouch:](v23, "setTouch:", v9);
            v26 = self->_trackedTouches;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v9));
            -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v23, v27);

            v15 = 1;
            goto LABEL_5;
          }
          MaxX = CGRectGetMinX(*(CGRect *)&v17);
        }
        v21 = MaxX;
        goto LABEL_13;
      }
    }
  }
  v15 = 0;
LABEL_5:

  return v15;
}

- (void)_updateSelectedTimeRangeForTrackedTouchesAnimated:(BOOL)a3
{
  double v4;
  double beginTime;
  double endTime;
  void *v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double assetDuration;
  id v18;
  uint64_t v19;
  double trackedAssetCurrentTime;
  _QWORD v21[5];
  Block_layout *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  double v54;
  _QWORD v55[3];
  CGFloat MaxX;
  _QWORD v57[3];
  CGFloat MinX;
  CGRect v59;
  CGRect v60;

  v4 = 0.0;
  if (a3)
    v4 = 0.5;
  -[RCWaveformSelectionOverlay _setWantsAnimatedLayoutDuration:](self, "_setWantsAnimatedLayoutDuration:", v4);
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  MinX = 0.0;
  -[RCWaveformSelectionOverlay selectionRect](self, "selectionRect");
  MinX = CGRectGetMinX(v59);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  MaxX = 0.0;
  -[RCWaveformSelectionOverlay selectionRect](self, "selectionRect");
  MaxX = CGRectGetMaxX(v60);
  beginTime = self->_selectedTimeRange.beginTime;
  endTime = self->_selectedTimeRange.endTime;
  v53 = 0x2020000000;
  v54 = beginTime;
  v51 = 0;
  v52 = (double *)&v51;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = endTime;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0xBFF0000000000000;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_trackedTouches, "allValues"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100035054;
  v21[3] = &unk_1001ABBF0;
  v23 = &v39;
  v24 = v57;
  v21[4] = self;
  v22 = &stru_1001ABBC8;
  v25 = &v51;
  v26 = &v47;
  v27 = &v35;
  v28 = v55;
  v29 = &v31;
  v30 = &v43;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);

  v8 = RCTimeRangeMake(v52[3], v48[3]);
  v10 = v9;
  if ((RCTimeRangeEqualToTimeRange(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime, v8, v9) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "waveformSelectionOverlay:willChangeSelectedTimeRange:isTrackingMin:isTrackingMax:", self, *((unsigned __int8 *)v40 + 24), *((unsigned __int8 *)v36 + 24), v8, v10);
    v13 = v12;
    v15 = v14;

    if (v13 >= 0.0)
      -[RCWaveformSelectionOverlay setSelectedTimeRange:](self, "setSelectedTimeRange:", v13, v15);
  }
  if (*((_BYTE *)v32 + 24))
  {
    v16 = v44[3];
    if (v16 != self->_assetCurrentTime || v16 != self->_trackedAssetCurrentTime)
    {
      assetDuration = 0.0;
      if (v16 < 0.0 || (assetDuration = self->_assetDuration, v16 > assetDuration))
        v44[3] = assetDuration;
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "waveformSelectionOverlay:willChangeAssetCurrentTime:isTracking:", self, 1, v44[3]);
      *((_QWORD *)v44 + 3) = v19;

      -[RCWaveformSelectionOverlay setTrackedAssetCurrentTime:](self, "setTrackedAssetCurrentTime:", v44[3]);
      -[RCWaveformSelectionOverlay setAssetCurrentTime:](self, "setAssetCurrentTime:", v44[3]);
    }
  }
  else
  {
    trackedAssetCurrentTime = self->_trackedAssetCurrentTime;
    -[RCWaveformSelectionOverlay setTrackedAssetCurrentTime:](self, "setTrackedAssetCurrentTime:", -1.0);
    if (trackedAssetCurrentTime >= 0.0)
      -[RCWaveformSelectionOverlay setAssetCurrentTime:](self, "setAssetCurrentTime:", trackedAssetCurrentTime);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
}

- (void)_clearStaleTouches
{
  void *v3;
  NSMutableDictionary *trackedTouches;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  trackedTouches = self->_trackedTouches;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035404;
  v7[3] = &unk_1001ABC18;
  v6 = v3;
  v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trackedTouches, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (objc_msgSend(v6, "count"))
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_trackedTouches, "removeObjectsForKeys:", v6);
    if (!-[NSMutableDictionary count](self->_trackedTouches, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "waveformSelectionOverlay:didFinishTrackingSelectionBeginTime:endTime:assetCurrentTime:", self, 1, 1, 1);

    }
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  id WeakRetained;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  if (!self->_isRecording
    && (self->_editingEnabled || -[RCWaveformSelectionOverlay enableTimeTrackingInView](self, "enableTimeTrackingInView")))
  {
    v22 = v7;
    -[RCWaveformSelectionOverlay _clearStaleTouches](self, "_clearStaleTouches");
    v21 = -[NSMutableDictionary count](self->_trackedTouches, "count");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (!-[RCWaveformSelectionOverlay _beginTrackingSelectionBar:selectionBarType:withTouch:](self, "_beginTrackingSelectionBar:selectionBarType:withTouch:", self->_beginTimeSelection, 0, v13)&& !-[RCWaveformSelectionOverlay _beginTrackingSelectionBar:selectionBarType:withTouch:](self, "_beginTrackingSelectionBar:selectionBarType:withTouch:", self->_endTimeSelection, 1, v13))
          {
            -[RCWaveformSelectionOverlay _beginTrackingSelectionBar:selectionBarType:withTouch:](self, "_beginTrackingSelectionBar:selectionBarType:withTouch:", self->_currentTimeBar, 2, v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    v7 = v22;
    if (v21 != -[NSMutableDictionary count](self->_trackedTouches, "count"))
    {
      -[RCWaveformSelectionOverlay _updateSelectedTimeRangeForTrackedTouchesAnimated:](self, "_updateSelectedTimeRangeForTrackedTouchesAnimated:", -[RCWaveformSelectionOverlay rc_canAnimate](self, "rc_canAnimate"));
      if (-[NSMutableDictionary count](self->_trackedTouches, "count"))
      {
        if (!v21)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 0));
          v15 = v14 != 0;

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 1));
          v17 = v16 != 0;

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 2));
          v19 = v18 != 0;

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "waveformSelectionOverlay:willBeginTrackingSelectionBeginTime:endTime:assetCurrentTime:", self, v15, v17, v19);

        }
      }
    }
  }

}

- (BOOL)isCurrentlyTracking
{
  return -[NSMutableDictionary count](self->_trackedTouches, "count") != 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_selectedTimeRange;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_trackedTouches, "allKeys"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000358B0;
  v16[3] = &unk_1001ABC40;
  v17 = v5;
  v15 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", v16));

  if (objc_msgSend(v7, "count"))
  {
    -[RCWaveformSelectionOverlay _updateSelectedTimeRangeForTrackedTouchesAnimated:](self, "_updateSelectedTimeRangeForTrackedTouchesAnimated:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 2));

    if (-[RCWaveformSelectionOverlay enableTimeTrackingInView](self, "enableTimeTrackingInView"))
    {
      if (v8)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "waveformSelectionOverlay:didFinishTrackingSelectionBeginTime:endTime:assetCurrentTime:", self, 0, 0, 1);

      }
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("LastSpokenTime")));
  p_selectedTimeRange = &self->_selectedTimeRange;
  if (!v10)
    p_selectedTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95 *)&self->_selectedTimeRange.endTime;
  v13 = UIAXTimeStringForDuration(p_selectedTimeRange->beginTime);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_msgSend(v11, "isEqualToString:", v14) & 1) == 0)
  {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v14);
    -[RCWaveformSelectionOverlay _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v14, CFSTR("LastSpokenTime"));
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[RCWaveformSelectionOverlay touchesEnded:withEvent:](self, "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableDictionary *trackedTouches;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  id WeakRetained;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 2));

  v6 = -[NSMutableDictionary count](self->_trackedTouches, "count");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        trackedTouches = self->_trackedTouches;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i)));
        -[NSMutableDictionary removeObjectForKey:](trackedTouches, "removeObjectForKey:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (v6 != -[NSMutableDictionary count](self->_trackedTouches, "count"))
  {
    -[RCWaveformSelectionOverlay _updateSelectedTimeRangeForTrackedTouchesAnimated:](self, "_updateSelectedTimeRangeForTrackedTouchesAnimated:", -[RCWaveformSelectionOverlay rc_canAnimate](self, "rc_canAnimate"));
    if (!-[NSMutableDictionary count](self->_trackedTouches, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "waveformSelectionOverlay:didFinishTrackingSelectionBeginTime:endTime:assetCurrentTime:", self, v21 != 0, v20 != 0, v19 != 0);

      if (v21)
        goto LABEL_11;
LABEL_13:
      v14 = CFSTR("WAVEFORM_SELECTION_CHANGED_END_TIME");
      v15 = CFSTR("Selection changed end time AX announcement");
      goto LABEL_14;
    }
  }
  if (!v21)
    goto LABEL_13;
LABEL_11:
  v14 = CFSTR("WAVEFORM_SELECTION_CHANGED_START_TIME");
  v15 = CFSTR("Selection changed start time AX announcement");
LABEL_14:
  v17 = RCLocalizedFrameworkString(v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v18);
  -[RCWaveformSelectionOverlay _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("LastSpokenTime"));

}

- (double)_effectiveSelectionWidth
{
  return self->_selectionRect.size.width;
}

- (double)_xAdjustmentAmount
{
  _BOOL4 overviewTrimHandleStyle;
  double v4;
  double v5;
  double v6;

  overviewTrimHandleStyle = self->_overviewTrimHandleStyle;
  +[RCOverlayBarLayer selectionKnobRadius](RCOverlayBarLayer, "selectionKnobRadius");
  v5 = v4;
  -[RCWaveformSelectionOverlay knobWidthMultiplier](self, "knobWidthMultiplier");
  if (overviewTrimHandleStyle)
    v6 = v6 + v6;
  return -(v5 * v6);
}

- (CGRect)_selectionBoundsIncludingKnobsUsingMultiplier:(double)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  -[RCWaveformSelectionOverlay selectionRect](self, "selectionRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[RCOverlayBarLayer selectionKnobRadius](RCOverlayBarLayer, "selectionKnobRadius");
  v14 = v13 * a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v15, "selectionHighlightToKnobInset");
  v17 = v16 + v14 * 2.0;

  -[RCWaveformSelectionOverlay _xAdjustmentAmount](self, "_xAdjustmentAmount");
  v19 = v18;
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v20 = v19 + CGRectGetMinX(v28);
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  v21 = CGRectGetMaxX(v29) - v19;
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v22 = CGRectGetMinY(v30) - v17;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  MaxY = CGRectGetMaxY(v31);
  v24 = v21 - v20;
  v25 = v17 + MaxY - v22;
  v26 = v20;
  v27 = v22;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)_selectionBoundsIncludingKnobs
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RCWaveformSelectionOverlay knobWidthMultiplier](self, "knobWidthMultiplier");
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobsUsingMultiplier:](self, "_selectionBoundsIncludingKnobsUsingMultiplier:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_selectionRectForSelectedTimeRange:(id)a3
{
  double var1;
  double var0;
  void *v6;
  id WeakRetained;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double MinY;
  double top;
  double v15;
  double v16;
  double MaxY;
  double bottom;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformSelectionOverlay:offsetForTime:", self, var0);
  v9 = v8 + self->_selectionAreaInsets.left;

  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v10, "waveformSelectionOverlay:offsetForTime:", self, var1);
  v12 = v11 - self->_selectionAreaInsets.right;

  -[RCWaveformSelectionOverlay bounds](self, "bounds");
  MinY = CGRectGetMinY(v27);
  top = self->_selectionAreaInsets.top;
  objc_msgSend(v6, "selectionHighlightToKnobInset");
  v16 = MinY + top + v15;
  -[RCWaveformSelectionOverlay bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v28);
  bottom = self->_selectionAreaInsets.bottom;
  objc_msgSend(v6, "selectionHighlightToKnobInset");
  v20 = MaxY - (bottom + v19);
  v21 = v12 - v9;
  v22 = v20 - v16;

  v23 = v9;
  v24 = v16;
  v25 = v21;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_drawsSelectionForWidth:(double)a3
{
  double v4;

  -[RCWaveformSelectionOverlay _minimumOverlaySelectionWidth](self, "_minimumOverlaySelectionWidth");
  return v4 <= a3;
}

- (double)_minimumOverlaySelectionWidth
{
  double v2;

  +[RCOverlayBarLayer selectionKnobRadius](RCOverlayBarLayer, "selectionKnobRadius");
  return v2 * 4.0;
}

- (double)_minimumOverlayWidth
{
  double v2;

  +[RCOverlayBarLayer selectionKnobRadius](RCOverlayBarLayer, "selectionKnobRadius");
  return v2 + v2;
}

- (CGRect)_middleTimeRectWithFont:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  v4 = a3;
  -[RCWaveformSelectionOverlay bounds](self, "bounds");
  v6 = v5;
  v29 = v7;
  -[RCWaveformSelectionOverlay _selectionHighlightBounds](self, "_selectionHighlightBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v4, "lineHeight");
  *(float *)&v16 = v16;
  v17 = ceilf(*(float *)&v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v18, "selectionMiddleTimeBaselineInset");
  v20 = v19;
  objc_msgSend(v4, "descender");
  v22 = v21;

  v23 = v20 + v22;
  v24 = rintf(v23);

  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  v25 = CGRectGetMaxY(v30) - v17 - v24;
  v26 = v6;
  v27 = v29;
  v28 = v17;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v25;
  result.origin.x = v26;
  return result;
}

- (id)_touchTrackingInfoForSelectionBarTye:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_trackedTouches, "allValues", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "selectionBarType") == (id)a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)__shouldDisplayBeginTimeText
{
  void *v3;
  BOOL v4;
  $93AB83F55FD8EAABF5C634313E89AB95 *p_selectedTimeRange;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 0));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    p_selectedTimeRange = &self->_selectedTimeRange;
    v4 = RCTimeRangeDeltaWithUIPrecision(p_selectedTimeRange->beginTime, p_selectedTimeRange->endTime) > 0.001
      && p_selectedTimeRange->beginTime != 0.0;
  }

  return v4;
}

- (BOOL)__shouldDisplayEndTimeText
{
  BOOL v3;
  void *v4;

  v3 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _touchTrackingInfoForSelectionBarTye:](self, "_touchTrackingInfoForSelectionBarTye:", 1));
  if (!v4)
    v3 = RCTimeRangeDeltaWithUIPrecision(self->_selectedTimeRange.beginTime, self->_selectedTimeRange.endTime) > 0.001
      && vabdd_f64(self->_selectedTimeRange.endTime, self->_assetDuration) > 0.001;

  return v3;
}

- (BOOL)_shouldDisplayBeginTimeText
{
  if (-[RCWaveformSelectionOverlay __shouldDisplayBeginTimeText](self, "__shouldDisplayBeginTimeText"))
    return 1;
  else
    return -[RCWaveformSelectionOverlay __shouldDisplayEndTimeText](self, "__shouldDisplayEndTimeText");
}

- (BOOL)_shouldOffsetSelectionBarTypeForThumb:(int64_t)a3
{
  return 0;
}

- (CGRect)_beginTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  unsigned int v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double MinY;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double Width;
  double v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobs](self, "_selectionBoundsIncludingKnobs");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[RCWaveformSelectionOverlay _shouldOffsetSelectionBarTypeForThumb:](self, "_shouldOffsetSelectionBarTypeForThumb:", 0);
  v18 = v17;
  if (v17)
    objc_msgSend(v8, "selectionTimeInsetWhenSelected");
  else
    objc_msgSend(v8, "selectionTimeInsetNormal");
  v47 = v19;
  objc_msgSend(v8, "selectionTimeBaseLineOffset");
  v21 = v20;
  objc_msgSend(v7, "ascender");
  v23 = v22;
  v48.origin.x = v10;
  v48.origin.y = v12;
  v48.size.width = v14;
  v48.size.height = v16;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = v10;
  v49.origin.y = v12;
  v49.size.width = v14;
  v49.size.height = v16;
  MinY = CGRectGetMinY(v49);
  objc_msgSend(v6, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v50.origin.x = v27;
  v50.origin.y = v29;
  v50.size.width = v31;
  v50.size.height = v33;
  Width = CGRectGetWidth(v50);
  objc_msgSend(v7, "lineHeight");
  if (a4)
    *a4 = v18;
  v36 = v47;
  v37 = v21 + v23;
  v38 = v35;
  v39 = rint(MinX + rintf(v36));
  v40 = rint(MinY - rintf(v37));
  v41 = ceil(Width);
  v42 = ceilf(v38);

  v43 = v39;
  v44 = v40;
  v45 = v41;
  v46 = v42;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (CGRect)_alternateBeginTimeRectWithSizedTextLayer:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double MinX;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v4 = a3;
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobs](self, "_selectionBoundsIncludingKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[RCWaveformSelectionOverlay _beginTimeRectWithSizedTextLayer:isOffsetForThumb:](self, "_beginTimeRectWithSizedTextLayer:isOffsetForThumb:", v4, 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v22 = MinX - CGRectGetMinX(v28);
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  v23 = CGRectGetMinX(v29) - v22 - v18;
  v24 = v16;
  v25 = v18;
  v26 = v20;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_shouldDisplayEndTimeText
{
  if (-[RCWaveformSelectionOverlay __shouldDisplayBeginTimeText](self, "__shouldDisplayBeginTimeText"))
    return 1;
  else
    return -[RCWaveformSelectionOverlay __shouldDisplayEndTimeText](self, "__shouldDisplayEndTimeText");
}

- (CGRect)_endTimeRectWithSizedTextLayer:(id)a3 isOffsetForThumb:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  unsigned int v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double Width;
  double MinY;
  double v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MaxX;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobs](self, "_selectionBoundsIncludingKnobs");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[RCWaveformSelectionOverlay _shouldOffsetSelectionBarTypeForThumb:](self, "_shouldOffsetSelectionBarTypeForThumb:", 1);
  v18 = v17;
  if (v17)
    objc_msgSend(v8, "selectionTimeInsetWhenSelected");
  else
    objc_msgSend(v8, "selectionTimeInsetNormal");
  v49 = v19;
  objc_msgSend(v8, "selectionTimeBaseLineOffset");
  v48 = v20;
  objc_msgSend(v7, "ascender");
  v47 = v21;
  v50.origin.x = v10;
  v50.origin.y = v12;
  v50.size.width = v14;
  v50.size.height = v16;
  MaxX = CGRectGetMaxX(v50);
  objc_msgSend(v6, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v51.origin.x = v23;
  v51.origin.y = v25;
  v51.size.width = v27;
  v51.size.height = v29;
  Width = CGRectGetWidth(v51);
  v52.origin.x = v10;
  v52.origin.y = v12;
  v52.size.width = v14;
  v52.size.height = v16;
  MinY = CGRectGetMinY(v52);
  objc_msgSend(v7, "lineHeight");
  if (a4)
    *a4 = v18;
  v33 = v49;
  v34 = MaxX - rintf(v33);
  v35 = v48 + v47;
  v36 = MinY - rintf(v35);
  v37 = v32;
  v38 = rint(v34 - Width);
  v39 = rint(v36);
  v40 = ceil(v34 - (v34 - Width));
  v41 = ceilf(v37);

  v42 = v38;
  v43 = v39;
  v44 = v40;
  v45 = v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGRect)_alternateEndTimeRectWithSizedTextLayer:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxX;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v4 = a3;
  -[RCWaveformSelectionOverlay _selectionBoundsIncludingKnobs](self, "_selectionBoundsIncludingKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[RCWaveformSelectionOverlay _endTimeRectWithSizedTextLayer:isOffsetForThumb:](self, "_endTimeRectWithSizedTextLayer:isOffsetForThumb:", v4, 0);
  rect = v13;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = rect;
  v28.origin.y = v15;
  v28.size.width = v17;
  v28.size.height = v19;
  v21 = MaxX - CGRectGetMaxX(v28);
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  v22 = CGRectGetMaxX(v29) + v21;
  v23 = v15;
  v24 = v17;
  v25 = v19;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)changeAXValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  LOBYTE(v2) = objc_msgSend(v3, "isLockScreenActive") ^ 1;
  return (char)v2;
}

- (BOOL)_axIsShowingSelectionBars
{
  return self->_editingEnabled;
}

- (BOOL)isAccessibilityElement
{
  return !-[RCWaveformSelectionOverlay _axIsShowingSelectionBars](self, "_axIsShowingSelectionBars");
}

- (id)accessibilityElements
{
  void *v3;
  AXWaveformSelectionBarElement *v4;
  AXWaveformSelectionBarElement *v5;
  _QWORD v7[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kUIAccessibilityStorageKeyChildren")));
  if (!v3)
  {
    v4 = -[AXWaveformSelectionBarElement initWithAccessibilityContainer:]([AXWaveformSelectionBarElement alloc], "initWithAccessibilityContainer:", self);
    -[AXWaveformSelectionBarElement setAdjustsStartTime:](v4, "setAdjustsStartTime:", 1);
    v5 = -[AXWaveformSelectionBarElement initWithAccessibilityContainer:]([AXWaveformSelectionBarElement alloc], "initWithAccessibilityContainer:", self);
    v7[0] = v4;
    v7[1] = v5;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
    -[RCWaveformSelectionOverlay _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("kUIAccessibilityStorageKeyChildren"));

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCWaveformSelectionOverlay;
  v3 = -[RCWaveformSelectionOverlay accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[RCWaveformSelectionOverlay changeAXValue](self, "changeAXValue");
  v5 = UIAccessibilityTraitAdjustable;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityValue
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformSelectionOverlayGetCurrentTime:", self);
  v5 = v4;

  return (id)UIAXTimeStringForDuration(v5);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _BOOL4 v5;
  double v6;
  RCWaveformSelectionOverlay *v7;
  uint64_t v8;
  UIAccessibilityNotifications v9;
  void *v10;

  v5 = -[RCWaveformSelectionOverlay changeAXValue](self, "changeAXValue");
  if (v5)
  {
    v5 = -[RCWaveformSelectionOverlay isAccessibilityElement](self, "isAccessibilityElement");
    if (v5)
    {
      v6 = 8.0;
      if (!self->_isOverView)
        v6 = 20.0;
      if (a3 == 4)
      {
        v7 = self;
        v8 = 1;
      }
      else
      {
        if (a3 != 3)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
        v7 = self;
        v8 = 0;
      }
      -[RCWaveformSelectionOverlay _accessibilityIncreaseValue:bySegment:](v7, "_accessibilityIncreaseValue:bySegment:", v8, v6);
      v9 = UIAccessibilityAnnouncementNotification;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformSelectionOverlay accessibilityValue](self, "accessibilityValue"));
      UIAccessibilityPostNotification(v9, v10);

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_accessibilityIncreaseValue:(BOOL)a3 bySegment:(double)a4
{
  _BOOL4 v4;
  double v6;
  RCWaveformSelectionOverlayDelegate **p_delegate;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double assetDuration;
  id v14;

  v4 = a3;
  if (a4 == 0.0)
    a4 = 20.0;
  v6 = self->_assetDuration / a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waveformSelectionOverlayGetCurrentTime:", self);
  v10 = v9;

  v11 = -v6;
  if (v4)
    v11 = v6;
  v12 = v11 + v10;
  if (v12 == self->_assetCurrentTime && v12 == self->_trackedAssetCurrentTime)
  {
    assetDuration = v12;
  }
  else
  {
    assetDuration = 0.0;
    if (v12 >= 0.0)
    {
      assetDuration = v12;
      if (v12 > self->_assetDuration)
        assetDuration = self->_assetDuration;
    }
  }
  v14 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v14, "waveformSelectionOverlay:willChangeAssetCurrentTime:isTracking:", self, 1, assetDuration);

}

- (void)accessibilityIncrement
{
  if (-[RCWaveformSelectionOverlay changeAXValue](self, "changeAXValue"))
  {
    -[RCWaveformSelectionOverlay axSegment](self, "axSegment");
    -[RCWaveformSelectionOverlay _accessibilityIncreaseValue:bySegment:](self, "_accessibilityIncreaseValue:bySegment:", 1);
  }
}

- (void)accessibilityDecrement
{
  if (-[RCWaveformSelectionOverlay changeAXValue](self, "changeAXValue"))
  {
    -[RCWaveformSelectionOverlay axSegment](self, "axSegment");
    -[RCWaveformSelectionOverlay _accessibilityIncreaseValue:bySegment:](self, "_accessibilityIncreaseValue:bySegment:", 0);
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  RCWaveformSelectionOverlay *v8;
  id v9;
  RCWaveformSelectionOverlay *v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[RCWaveformSelectionOverlay _axIsShowingSelectionBars](self, "_axIsShowingSelectionBars")
    || (-[RCWaveformSelectionOverlay bounds](self, "bounds"), v13.x = x, v13.y = y, !CGRectContainsPoint(v14, v13)))
  {
    v12.receiver = self;
    v12.super_class = (Class)RCWaveformSelectionOverlay;
    v9 = -[RCWaveformSelectionOverlay _accessibilityHitTest:withEvent:](&v12, "_accessibilityHitTest:withEvent:", v7, x, y);
    v8 = (RCWaveformSelectionOverlay *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v8 = self;
  }
  v10 = v8;

  return v10;
}

- (RCWaveformSelectionOverlayDelegate)delegate
{
  return (RCWaveformSelectionOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (double)selectedTimeRangeMinimumDuration
{
  return self->_selectedTimeRangeMinimumDuration;
}

- (void)setSelectedTimeRangeMinimumDuration:(double)a3
{
  self->_selectedTimeRangeMinimumDuration = a3;
}

- (double)selectedTimeRangeMaximumDuration
{
  return self->_selectedTimeRangeMaximumDuration;
}

- (void)setSelectedTimeRangeMaximumDuration:(double)a3
{
  self->_selectedTimeRangeMaximumDuration = a3;
}

- (double)assetCurrentTime
{
  return self->_assetCurrentTime;
}

- (double)assetDuration
{
  return self->_assetDuration;
}

- (CGRect)selectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_selectionRect.origin.x;
  y = self->_selectionRect.origin.y;
  width = self->_selectionRect.size.width;
  height = self->_selectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)axSegment
{
  return self->_axSegment;
}

- (void)setAxSegment:(double)a3
{
  self->_axSegment = a3;
}

- (BOOL)isEditingEnabled
{
  return self->_editingEnabled;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (BOOL)insertMode
{
  return self->_insertMode;
}

- (BOOL)enablePlayBarTracking
{
  return self->_enablePlayBarTracking;
}

- (void)setEnablePlayBarTracking:(BOOL)a3
{
  self->_enablePlayBarTracking = a3;
}

- (BOOL)enableTimeTrackingInView
{
  return self->_enableTimeTrackingInView;
}

- (void)setEnableTimeTrackingInView:(BOOL)a3
{
  self->_enableTimeTrackingInView = a3;
}

- (BOOL)barMatchesKnobRadius
{
  return self->_barMatchesKnobRadius;
}

- (void)setBarMatchesKnobRadius:(BOOL)a3
{
  self->_barMatchesKnobRadius = a3;
}

- (BOOL)overviewTrimHandleStyle
{
  return self->_overviewTrimHandleStyle;
}

- (void)setOverviewTrimHandleStyle:(BOOL)a3
{
  self->_overviewTrimHandleStyle = a3;
}

- (double)knobWidthMultiplier
{
  return self->_knobWidthMultiplier;
}

- (void)setKnobWidthMultiplier:(double)a3
{
  self->_knobWidthMultiplier = a3;
}

- (double)playWidthMultiplier
{
  return self->_playWidthMultiplier;
}

- (void)setPlayWidthMultiplier:(double)a3
{
  self->_playWidthMultiplier = a3;
}

- (BOOL)playBarOnly
{
  return self->_playBarOnly;
}

- (void)setPlayBarOnly:(BOOL)a3
{
  self->_playBarOnly = a3;
}

- (BOOL)isOverView
{
  return self->_isOverView;
}

- (void)setIsOverView:(BOOL)a3
{
  self->_isOverView = a3;
}

- (int64_t)selectionMode
{
  return self->_selectionMode;
}

- (UIView)selectionBackgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_selectionBackgroundView);
}

- (void)setSelectionBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_selectionBackgroundView, a3);
}

- (double)trackedAssetCurrentTime
{
  return self->_trackedAssetCurrentTime;
}

- (UIButton)resetRegionButton
{
  return self->_resetRegionButton;
}

- (void)setResetRegionButton:(id)a3
{
  objc_storeStrong((id *)&self->_resetRegionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetRegionButton, 0);
  objc_destroyWeak((id *)&self->_selectionBackgroundView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedTouches, 0);
  objc_storeStrong((id *)&self->_compactCurrentTimeBar, 0);
  objc_storeStrong((id *)&self->_currentTimeBar, 0);
  objc_storeStrong((id *)&self->_corneredDimOverlayContainer, 0);
  objc_storeStrong((id *)&self->_middleSelectionOverlay, 0);
  objc_storeStrong((id *)&self->_endTimeSelection, 0);
  objc_storeStrong((id *)&self->_beginTimeSelection, 0);
}

@end
