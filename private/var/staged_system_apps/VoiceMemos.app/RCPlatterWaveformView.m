@implementation RCPlatterWaveformView

- (RCPlatterWaveformView)initWithFrame:(CGRect)a3 dataProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  RCPlatterWaveformView *v10;
  RCPlatterWaveformView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RCPlatterWaveformView;
  v10 = -[RCPlatterWaveformView initWithFrame:](&v19, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[RCPlatterWaveformView setDataProvider:](v10, "setDataProvider:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "platterWaveformActiveSliceColor"));
    -[RCPlatterWaveformView setActiveSliceColor:](v11, "setActiveSliceColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[RCPlatterWaveformView setActiveSliceQueue:](v11, "setActiveSliceQueue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[RCPlatterWaveformView setInactiveSliceStack:](v11, "setInactiveSliceStack:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[RCPlatterWaveformView setSliceRecyclerStack:](v11, "setSliceRecyclerStack:", v16);

    -[RCPlatterWaveformView _setupViews](v11, "_setupViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView layer](v11, "layer"));
    objc_msgSend(v17, "setAllowsHitTesting:", 0);

  }
  return v11;
}

- (void)_setupViews
{
  UIView *v3;
  UIView *sliceViewContainer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  sliceViewContainer = self->_sliceViewContainer;
  self->_sliceViewContainer = v3;

  -[RCPlatterWaveformView addSubview:](self, "addSubview:", self->_sliceViewContainer);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_sliceViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_sliceViewContainer, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView leadingAnchor](self, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  objc_msgSend(v7, "setActive:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_sliceViewContainer, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_sliceViewContainer, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView topAnchor](self, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_sliceViewContainer, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCPlatterWaveformView;
  -[RCPlatterWaveformView layoutSubviews](&v3, "layoutSubviews");
  -[RCPlatterWaveformView updateSlicesAndFrames](self, "updateSlicesAndFrames");
}

- (void)updateSliceFramesForRecordingTime:(double)a3
{
  double v5;

  -[RCPlatterWaveformView timeWindow](self, "timeWindow");
  -[RCPlatterWaveformView setCurrentTimeWindow:](self, "setCurrentTimeWindow:", RCTimeRangeMake(a3 - v5, a3));
  -[RCPlatterWaveformView updateSliceFrames](self, "updateSliceFrames");
}

- (void)updateSliceFrames
{
  double v3;
  double v4;
  double v5;

  -[RCPlatterWaveformView bounds](self, "bounds");
  v4 = v3;
  -[RCPlatterWaveformView bounds](self, "bounds");
  if (v4 != 0.0 && v5 != 0.0)
    -[RCPlatterWaveformView updateSlicesAndFrames](self, "updateSlicesAndFrames");
}

- (void)updateSlicesAndFrames
{
  double v3;
  double v4;
  _QWORD v5[5];

  -[RCPlatterWaveformView currentTimeWindow](self, "currentTimeWindow");
  -[RCPlatterWaveformView updateActiveSlicesForTimeRange:](self, "updateActiveSlicesForTimeRange:");
  -[RCPlatterWaveformView currentTimeWindow](self, "currentTimeWindow");
  -[RCPlatterWaveformView updateInactiveSlicesForTimeRange:inactiveSliceCount:](self, "updateInactiveSlicesForTimeRange:inactiveSliceCount:", -[RCPlatterWaveformView numberOfInactiveSlices](self, "numberOfInactiveSlices"), v3, v4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000583B4;
  v5[3] = &unk_1001AC4F8;
  v5[4] = self;
  -[RCPlatterWaveformView enumerateAllSlices:](self, "enumerateAllSlices:", v5);
}

- (void)updateActiveSlicesForTimeRange:(id)a3
{
  double var1;
  double var0;
  int64_t v6;
  double v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[RCPlatterWaveformView indexForSliceStartTime:](self, "indexForSliceStartTime:");
  -[RCPlatterWaveformView sliceDuration](self, "sliceDuration");
  v8 = (_BYTE *)(uint64_t)((var1 - var0) / v7);
  if (v6 < self->_indexOfFirstActiveSlice)
    -[RCPlatterWaveformView _resetActiveSlicesWithIndex:](self, "_resetActiveSlicesWithIndex:", v6);
  v9 = -[NSMutableArray count](self->_activeSliceQueue, "count");
  if (v6 - self->_indexOfFirstActiveSlice >= (unint64_t)v9)
    v10 = (uint64_t)v9;
  else
    v10 = v6 - self->_indexOfFirstActiveSlice;
  v11 = v8 - v9 + v10;
  if (v10 >= 1)
  {
    do
    {
      -[RCPlatterWaveformView removeSliceWithType:](self, "removeSliceWithType:", 0);
      --v10;
    }
    while (v10);
  }
  if (v11 >= 1)
  {
    do
    {
      -[RCPlatterWaveformView appendSliceWithType:](self, "appendSliceWithType:", 0);
      --v11;
    }
    while (v11);
  }
  if (-[NSMutableArray count](self->_activeSliceQueue, "count") != v8)
  {
    v12 = OSLogForCategory(kVMLogCategoryDefault);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10010BFC8(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  self->_indexOfFirstActiveSlice = v6;
  -[RCPlatterWaveformView _updateAmplitudes](self, "_updateAmplitudes");
}

- (void)_updateAmplitudes
{
  char *v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  if (self->_dataProvider)
  {
    v3 = (char *)-[NSMutableArray count](self->_activeSliceQueue, "count") - 1;
    if ((uint64_t)v3 < 0)
      return;
    while (1)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_activeSliceQueue, "objectAtIndexedSubscript:", v3));
      if (!-[NSObject amplitudeNeedsUpdate](v4, "amplitudeNeedsUpdate"))
        break;
      -[RCPlatterWaveformView sliceTimeRangeForIndex:](self, "sliceTimeRangeForIndex:", &v3[self->_indexOfFirstActiveSlice]);
      v14 = 0;
      -[RCWaveformDataProviding amplitudeForSliceWithTimeRange:fullTimeRangeSampled:](self->_dataProvider, "amplitudeForSliceWithTimeRange:fullTimeRangeSampled:", &v14);
      -[NSObject setAmplitude:](v4, "setAmplitude:");
      -[NSObject setAmplitudeNeedsUpdate:](v4, "setAmplitudeNeedsUpdate:", v14 == 0);

      if ((uint64_t)v3-- <= 0)
        return;
    }
  }
  else
  {
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10010C038(v4, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)updateInactiveSlicesForTimeRange:(id)a3 inactiveSliceCount:(unint64_t)a4
{
  double var1;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;

  var1 = a3.var1;
  -[RCPlatterWaveformView sliceDuration](self, "sliceDuration", a3.var0);
  v8 = var1 + v7 * (double)a4;
  v9 = -[RCPlatterWaveformView indexForSliceStartTime:](self, "indexForSliceStartTime:", var1);
  v10 = -[RCPlatterWaveformView indexForSliceStartTime:](self, "indexForSliceStartTime:", v8);
  if (a4)
    v11 = v10 - v9 + 1;
  else
    v11 = 0;
  while ((unint64_t)-[NSMutableArray count](self->_inactiveSliceStack, "count") > v11)
    -[RCPlatterWaveformView removeSliceWithType:](self, "removeSliceWithType:", 1);
  while ((unint64_t)-[NSMutableArray count](self->_inactiveSliceStack, "count") < v11)
    -[RCPlatterWaveformView appendSliceWithType:](self, "appendSliceWithType:", 1);
}

- (void)enumerateAllSlices:(id)a3
{
  id v4;
  int64_t indexOfFirstActiveSlice;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v4 = a3;
  indexOfFirstActiveSlice = self->_indexOfFirstActiveSlice;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_activeSliceQueue;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        (*((void (**)(id, int64_t, _QWORD, _QWORD))v4 + 2))(v4, (int64_t)v10 + indexOfFirstActiveSlice, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), 0);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      indexOfFirstActiveSlice += (int64_t)v10;
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_inactiveSliceStack;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*((void (**)(id, int64_t, _QWORD, uint64_t))v4 + 2))(v4, (int64_t)v15 + indexOfFirstActiveSlice, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), 1);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      indexOfFirstActiveSlice += (int64_t)v15;
    }
    while (v13);
  }

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)sliceTimeRangeForIndex:(int64_t)a3
{
  double v5;
  double v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[RCPlatterWaveformView sliceDuration](self, "sliceDuration");
  -[RCPlatterWaveformView _sliceTimeRangeForIndex:sliceDuration:](self, "_sliceTimeRangeForIndex:sliceDuration:", a3);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_sliceTimeRangeForIndex:(int64_t)a3 sliceDuration:(double)a4
{
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = RCTimeRangeMake((double)a3 * a4, (double)a3 * a4 + a4);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)indexForSliceStartTime:(double)a3
{
  double v5;

  -[RCPlatterWaveformView sliceDuration](self, "sliceDuration");
  return -[RCPlatterWaveformView _indexForSliceStartTime:sliceDuration:](self, "_indexForSliceStartTime:sliceDuration:", a3, v5);
}

- (int64_t)_indexForSliceStartTime:(double)a3 sliceDuration:(double)a4
{
  return vcvtmd_s64_f64(a3 / a4);
}

- (void)updateFrameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a3;
  -[RCPlatterWaveformView frameForSlice:sliceType:atIndex:](self, "frameForSlice:sliceType:atIndex:", v8, a4, a5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v22, "bounds");
  v19 = v18 * 0.5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
  objc_msgSend(v21, "setCornerRadius:", v19);

}

- (CGRect)frameForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  v8 = a3;
  -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
  v10 = v9;
  -[RCPlatterWaveformView heightForSlice:sliceType:atIndex:](self, "heightForSlice:sliceType:atIndex:", v8, a4, a5);
  v12 = v11;

  -[RCPlatterWaveformView bounds](self, "bounds");
  v13 = CGRectGetMidY(v18) + v12 * -0.5;
  -[RCPlatterWaveformView xPositionForSliceAtIndex:](self, "xPositionForSliceAtIndex:", a5);
  v15 = v13;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_activeSliceFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
  v4 = v3;
  -[RCPlatterWaveformView slicePadding](self, "slicePadding");
  v6 = v5;
  v7 = -[RCPlatterWaveformView numberOfSlices](self, "numberOfSlices");
  v8 = v6 * (double)v7 + (double)v7 * v4;
  -[RCPlatterWaveformView bounds](self, "bounds");
  v10 = v9;
  -[RCPlatterWaveformView bounds](self, "bounds");
  v12 = v11;
  -[RCPlatterWaveformView bounds](self, "bounds");
  v14 = v10;
  v15 = v12;
  v16 = v8;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_inactiveSliceFrame
{
  double MaxX;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect result;

  -[RCPlatterWaveformView _activeSliceFrame](self, "_activeSliceFrame");
  MaxX = CGRectGetMaxX(v12);
  -[RCPlatterWaveformView bounds](self, "bounds");
  v5 = v4 - MaxX;
  -[RCPlatterWaveformView bounds](self, "bounds");
  v7 = v6;
  -[RCPlatterWaveformView bounds](self, "bounds");
  v9 = MaxX;
  v10 = v7;
  v11 = v5;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)xPositionForSliceAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
  v6 = v5;
  -[RCPlatterWaveformView slicePadding](self, "slicePadding");
  v8 = v7;
  -[RCPlatterWaveformView sliceDuration](self, "sliceDuration");
  v10 = v9;
  -[RCPlatterWaveformView currentTimeWindow](self, "currentTimeWindow");
  -[RCPlatterWaveformView _xPositionForSliceAtIndex:sliceWidth:slicePadding:sliceDuration:inTimeWindow:](self, "_xPositionForSliceAtIndex:sliceWidth:slicePadding:sliceDuration:inTimeWindow:", a3, v6, v8, v10, v11, v12);
  return result;
}

- (double)_xPositionForSliceAtIndex:(int64_t)a3 sliceWidth:(double)a4 slicePadding:(double)a5 sliceDuration:(double)a6 inTimeWindow:(id)a7
{
  return (a4 + a5) * (double)a3 - a7.var0 * ((a4 + a5) / a6);
}

- (double)heightForSlice:(id)a3 sliceType:(int64_t)a4 atIndex:(int64_t)a5
{
  double v8;
  double v9;
  double result;

  objc_msgSend(a3, "amplitude");
  -[RCPlatterWaveformView _heightForAmplitude:](self, "_heightForAmplitude:");
  v9 = v8;
  -[RCPlatterWaveformView _maxHeightForSliceAtIndex:sliceType:](self, "_maxHeightForSliceAtIndex:sliceType:", a5, a4);
  if (v9 < result)
    return v9;
  return result;
}

- (double)_heightForAmplitude:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[RCPlatterWaveformView maximumSliceHeight](self, "maximumSliceHeight");
  v6 = v5;
  -[RCPlatterWaveformView minimumSliceHeight](self, "minimumSliceHeight");
  return v7 + a3 * (v6 - v7);
}

- (double)_maxHeightForSliceAtIndex:(int64_t)a3 sliceType:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double MaxX;
  double MinX;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat rect;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[RCPlatterWaveformView maximumSliceHeight](self, "maximumSliceHeight");
  v8 = v7;
  if (a4 != 1)
  {
    -[RCPlatterWaveformView _leadingRoundedFrame](self, "_leadingRoundedFrame");
    v10 = v9;
    v12 = v11;
    v40 = v8;
    rect = v13;
    v15 = v14;
    -[RCPlatterWaveformView _trailingRoundedFrame](self, "_trailingRoundedFrame");
    v17 = v16;
    v19 = v18;
    v39 = v20;
    v22 = v21;
    -[RCPlatterWaveformView xPositionForSliceAtIndex:](self, "xPositionForSliceAtIndex:", a3);
    v24 = v23;
    -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
    v26 = v24 + v25;
    v37 = v12;
    v38 = v10;
    v42.origin.x = v10;
    v42.origin.y = v12;
    v27 = v15;
    v8 = v40;
    v42.size.height = rect;
    v42.size.width = v27;
    MaxX = CGRectGetMaxX(v42);
    v36 = v17;
    v43.origin.x = v17;
    v43.origin.y = v19;
    v43.size.width = v39;
    v43.size.height = v22;
    MinX = CGRectGetMinX(v43);
    if (v26 <= MaxX || v24 >= MinX)
    {
      if (v26 > MaxX)
      {
        v31 = 0.0;
        if (v24 >= MinX)
        {
          v45.origin.y = v19;
          v45.origin.x = v36;
          v45.size.width = v39;
          v45.size.height = v22;
          v31 = CGRectGetMaxX(v45) - v26;
        }
      }
      else
      {
        v44.origin.y = v37;
        v44.origin.x = v38;
        v44.size.width = v27;
        v44.size.height = rect;
        v31 = v24 - CGRectGetMinX(v44);
      }
      -[RCPlatterWaveformView _roundedSliceWidthPerSide](self, "_roundedSliceWidthPerSide");
      v33 = fmin(v31 / v32, 1.0);
      if (v33 >= 0.0)
        v34 = 1.0 - v33;
      else
        v34 = 1.0;
      return v40 * sqrt(1.0 - v34 * v34);
    }
  }
  return v8;
}

- (double)_roundedSliceWidthPerSide
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "platterWaveformPercentageOfRoundedSlices");
  v5 = v4;
  objc_msgSend(v3, "platterWaveformMinimumRoundedSliceWidthPerSide");
  v7 = v6;
  -[RCPlatterWaveformView _activeSliceFrame](self, "_activeSliceFrame");
  if (v7 >= v5 * v8 * 0.5)
    v9 = v7;
  else
    v9 = v5 * v8 * 0.5;

  return v9;
}

- (CGRect)_leadingRoundedFrame
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
  double v12;
  double v13;
  CGRect result;

  -[RCPlatterWaveformView _activeSliceFrame](self, "_activeSliceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[RCPlatterWaveformView _roundedSliceWidthPerSide](self, "_roundedSliceWidthPerSide");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_trailingRoundedFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[RCPlatterWaveformView _activeSliceFrame](self, "_activeSliceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RCPlatterWaveformView _roundedSliceWidthPerSide](self, "_roundedSliceWidthPerSide");
  v12 = v11;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  v13 = CGRectGetMaxX(v17) - v12;
  v14 = v6;
  v15 = v12;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)appendSliceWithType:(int64_t)a3
{
  int *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = &OBJC_IVAR___RCPlatterWaveformView__inactiveSliceStack;
  if (!a3)
    v5 = &OBJC_IVAR___RCPlatterWaveformView__activeSliceQueue;
  v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView sliceWithType:](self, "sliceWithType:", a3));
  objc_msgSend(v6, "addObject:", v9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView sliceViewContainer](self, "sliceViewContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v7, "addSubview:", v8);

}

- (void)_resetActiveSlicesWithIndex:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = (uint64_t)-[NSMutableArray count](self->_activeSliceQueue, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    do
    {
      -[RCPlatterWaveformView removeSliceWithType:](self, "removeSliceWithType:", 0);
      --v6;
    }
    while (v6);
  }
  self->_indexOfFirstActiveSlice = a3;
}

- (void)removeSliceWithType:(int64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_inactiveSliceStack, "lastObject"));
    if (!v7)
      return;
    v5 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject view](v7, "view"));
    objc_msgSend(v8, "removeFromSuperview");

    -[NSMutableArray removeLastObject](self->_inactiveSliceStack, "removeLastObject");
  }
  else
  {
    if (a3)
    {
      v9 = OSLogForCategory(kVMLogCategoryDefault);
      v5 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_10010C0A8(v5);
      goto LABEL_10;
    }
    v4 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_activeSliceQueue, "firstObject"));
    if (!v4)
      return;
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject view](v4, "view"));
    objc_msgSend(v6, "removeFromSuperview");

    -[NSMutableArray removeObjectAtIndex:](self->_activeSliceQueue, "removeObjectAtIndex:", 0);
  }
  -[NSMutableArray addObject:](self->_sliceRecyclerStack, "addObject:", v5);
LABEL_10:

}

- (id)sliceWithType:(int64_t)a3
{
  uint64_t v5;
  RCPlatterWaveformSlice *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_sliceRecyclerStack, "lastObject"));
  if (v5)
  {
    v6 = (RCPlatterWaveformSlice *)v5;
    -[NSMutableArray removeLastObject](self->_sliceRecyclerStack, "removeLastObject");
  }
  else
  {
    v6 = objc_alloc_init(RCPlatterWaveformSlice);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v8 = v7;
  if (a3)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platterWaveformInactiveSliceColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceColor](self, "activeSliceColor"));
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformSlice view](v6, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[RCPlatterWaveformSlice setAmplitudeNeedsUpdate:](v6, "setAmplitudeNeedsUpdate:", a3 == 0);
  -[RCPlatterWaveformSlice setAmplitude:](v6, "setAmplitude:", 0.0);

  return v6;
}

- (unint64_t)numberOfInactiveSlices
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[RCPlatterWaveformView _inactiveSliceFrame](self, "_inactiveSliceFrame");
  v4 = v3;
  -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
  v6 = v5;
  -[RCPlatterWaveformView slicePadding](self, "slicePadding");
  return (unint64_t)(v4 / (v6 + v7));
}

- (void)setSliceColor:(id)a3
{
  -[RCPlatterWaveformView setActiveSliceColor:](self, "setActiveSliceColor:", a3);
  -[RCPlatterWaveformView _updateSliceColors](self, "_updateSliceColors");
}

- (void)_updateSliceColors
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_activeSliceQueue;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceColor](self, "activeSliceColor", (_QWORD)v11));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
        objc_msgSend(v10, "setBackgroundColor:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (double)timeWindow
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "activityWaveformTimeWindowDuration");
  v4 = v3;

  return v4;
}

- (double)sliceDuration
{
  double v3;

  -[RCPlatterWaveformView timeWindow](self, "timeWindow");
  return v3 / (double)-[RCPlatterWaveformView numberOfSlices](self, "numberOfSlices");
}

- (unint64_t)numberOfSlices
{
  -[RCPlatterWaveformView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (double)sliceWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "platterWaveformSliceWidth");
  v4 = v3;

  return v4;
}

- (double)slicePadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "platterWaveformSlicePadding");
  v4 = v3;

  return v4;
}

- (double)maximumSliceHeight
{
  double v2;

  -[RCPlatterWaveformView frame](self, "frame");
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (double)-[RCPlatterWaveformView numberOfSlices](self, "numberOfSlices");
  -[RCPlatterWaveformView sliceWidth](self, "sliceWidth");
  v5 = v4;
  -[RCPlatterWaveformView slicePadding](self, "slicePadding");
  v7 = (v3 + -1.0) * v6 + v3 * v5;
  v8 = UIViewNoIntrinsicMetric;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AX_WAVEFORM"), &stru_1001B2BC0, 0));

  return v3;
}

- (RCWaveformDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (UIColor)activeSliceColor
{
  return self->_activeSliceColor;
}

- (void)setActiveSliceColor:(id)a3
{
  objc_storeStrong((id *)&self->_activeSliceColor, a3);
}

- (UIView)sliceViewContainer
{
  return self->_sliceViewContainer;
}

- (void)setSliceViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_sliceViewContainer, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)currentTimeWindow
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_currentTimeWindow.beginTime;
  endTime = self->_currentTimeWindow.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setCurrentTimeWindow:(id)a3
{
  self->_currentTimeWindow = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (NSMutableArray)sliceRecyclerStack
{
  return self->_sliceRecyclerStack;
}

- (void)setSliceRecyclerStack:(id)a3
{
  objc_storeStrong((id *)&self->_sliceRecyclerStack, a3);
}

- (NSMutableArray)activeSliceQueue
{
  return self->_activeSliceQueue;
}

- (void)setActiveSliceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activeSliceQueue, a3);
}

- (NSMutableArray)inactiveSliceStack
{
  return self->_inactiveSliceStack;
}

- (void)setInactiveSliceStack:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveSliceStack, a3);
}

- (int64_t)indexOfFirstActiveSlice
{
  return self->_indexOfFirstActiveSlice;
}

- (void)setIndexOfFirstActiveSlice:(int64_t)a3
{
  self->_indexOfFirstActiveSlice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveSliceStack, 0);
  objc_storeStrong((id *)&self->_activeSliceQueue, 0);
  objc_storeStrong((id *)&self->_sliceRecyclerStack, 0);
  objc_storeStrong((id *)&self->_sliceViewContainer, 0);
  objc_storeStrong((id *)&self->_activeSliceColor, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
