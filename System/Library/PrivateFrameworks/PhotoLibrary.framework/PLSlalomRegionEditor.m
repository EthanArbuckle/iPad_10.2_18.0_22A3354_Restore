@implementation PLSlalomRegionEditor

- (PLSlalomRegionEditor)initWithFrame:(CGRect)a3
{
  PLSlalomRegionEditor *v3;
  PLSlalomRegionEditor *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *trackSnapshotView;
  uint64_t v13;
  UIImageView *trackImageView;
  uint64_t v15;
  UIImageView *startHandleView;
  UIImageView *v17;
  void *v18;
  uint64_t v19;
  UIImageView *endHandleView;
  UIImageView *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PLSlalomRegionEditor;
  v3 = -[PLSlalomRegionEditor initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLSlalomRegionEditor setOpaque:](v3, "setOpaque:", 0);
    v4->_regionEditorStyle = 0;
    -[PLSlalomRegionEditor _handleImage](v4, "_handleImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    trackSnapshotView = v4->_trackSnapshotView;
    v4->_trackSnapshotView = (UIImageView *)v11;

    -[UIImageView setAlpha:](v4->_trackSnapshotView, "setAlpha:", 0.0);
    -[PLSlalomRegionEditor addSubview:](v4, "addSubview:", v4->_trackSnapshotView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v7, v8, v9, v10);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v13;

    -[PLSlalomRegionEditor addSubview:](v4, "addSubview:", v4->_trackImageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    startHandleView = v4->_startHandleView;
    v4->_startHandleView = (UIImageView *)v15;

    v17 = v4->_startHandleView;
    -[PLSlalomRegionEditor _handleTintColor](v4, "_handleTintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v17, "setTintColor:", v18);

    -[PLSlalomRegionEditor addSubview:](v4, "addSubview:", v4->_startHandleView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v5);
    endHandleView = v4->_endHandleView;
    v4->_endHandleView = (UIImageView *)v19;

    v21 = v4->_endHandleView;
    -[PLSlalomRegionEditor _handleTintColor](v4, "_handleTintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v21, "setTintColor:", v22);

    -[PLSlalomRegionEditor addSubview:](v4, "addSubview:", v4->_endHandleView);
    v4->_minValue = 0.0;
    v4->_maxValue = 1.0;
    v4->_startValue = v4->_minValue;
    v4->_endValue = v4->_maxValue;
    v4->_zoomDelay = 0.5;

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *startHandleView;
  UIImageView *endHandleView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLSlalomRegionEditor;
  -[PLSlalomRegionEditor layoutSubviews](&v13, sel_layoutSubviews);
  if (self->_forceLayout || !self->_zoomAnimating)
  {
    -[PLSlalomRegionEditor _updateTrack](self, "_updateTrack");
    -[PLSlalomRegionEditor _trackFrame](self, "_trackFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    -[UIImageView setFrame:](self->_trackSnapshotView, "setFrame:", v4, v6, v8, v10);
    startHandleView = self->_startHandleView;
    -[PLSlalomRegionEditor startHandleFrame](self, "startHandleFrame");
    -[UIImageView setFrame:](startHandleView, "setFrame:");
    endHandleView = self->_endHandleView;
    -[PLSlalomRegionEditor endHandleFrame](self, "endHandleFrame");
    -[UIImageView setFrame:](endHandleView, "setFrame:");
    self->_forceLayout = 0;
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = fmax(result.height, 21.0);
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[PLSlalomRegionEditor bounds](self, "bounds");
  -[PLSlalomRegionEditor sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setTrackInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_trackInsets.left
    || a3.top != self->_trackInsets.top
    || a3.right != self->_trackInsets.right
    || a3.bottom != self->_trackInsets.bottom)
  {
    self->_trackInsets = a3;
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinValue:(double)minValue
{
  if (self->_minValue != minValue)
  {
    self->_minValue = minValue;
    if (self->_maxValue < minValue)
    {
      -[PLSlalomRegionEditor setMaxValue:](self, "setMaxValue:");
      minValue = self->_minValue;
    }
    if (self->_startValue < minValue)
      -[PLSlalomRegionEditor setStartValue:](self, "setStartValue:");
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaxValue:(double)maxValue
{
  if (self->_maxValue != maxValue)
  {
    self->_maxValue = maxValue;
    if (self->_minValue > maxValue)
    {
      -[PLSlalomRegionEditor setMinValue:](self, "setMinValue:");
      maxValue = self->_maxValue;
    }
    if (self->_endValue > maxValue)
      -[PLSlalomRegionEditor setEndValue:](self, "setEndValue:");
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStartValue:(double)a3
{
  -[PLSlalomRegionEditor setStartValue:notify:](self, "setStartValue:notify:", 0, a3);
}

- (void)setStartValue:(double)minValue notify:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_minValue > minValue)
    minValue = self->_minValue;
  if (minValue > self->_maxValue)
    minValue = self->_maxValue;
  if (self->_startValue != minValue)
  {
    v4 = a4;
    self->_startValue = minValue;
    if (self->_endValue < minValue)
      -[PLSlalomRegionEditor setEndValue:notify:](self, "setEndValue:notify:", a4);
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
    if (v4)
      -[PLSlalomRegionEditorDelegate slalomRegionEditorStartValueChanged:](self->_delegate, "slalomRegionEditorStartValueChanged:", self);
  }
}

- (void)setEndValue:(double)a3
{
  -[PLSlalomRegionEditor setEndValue:notify:](self, "setEndValue:notify:", 0, a3);
}

- (void)setEndValue:(double)minValue notify:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_minValue > minValue)
    minValue = self->_minValue;
  if (minValue > self->_maxValue)
    minValue = self->_maxValue;
  if (self->_endValue != minValue)
  {
    v4 = a4;
    self->_endValue = minValue;
    if (self->_startValue > minValue)
      -[PLSlalomRegionEditor setStartValue:notify:](self, "setStartValue:notify:", a4);
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
    if (v4)
      -[PLSlalomRegionEditorDelegate slalomRegionEditorEndValueChanged:](self->_delegate, "slalomRegionEditorEndValueChanged:", self);
  }
}

- (void)setZoomMinValue:(double)a3 maxValue:(double)a4
{
  double *p_zoomMaxValue;
  UIImageView **p_trackSnapshotView;
  UIImageView *v7;
  UIImageView *trackImageView;
  UIImageView *v9;

  if (self->_zoomMinValue == a3)
  {
    p_zoomMaxValue = &self->_zoomMaxValue;
    if (self->_zoomMaxValue == a4)
      return;
  }
  else
  {
    self->_zoomMinValue = a3;
    p_zoomMaxValue = &self->_zoomMaxValue;
    if (self->_zoomMaxValue == a4)
      goto LABEL_6;
  }
  *p_zoomMaxValue = a4;
LABEL_6:
  p_trackSnapshotView = &self->_trackSnapshotView;
  v7 = self->_trackSnapshotView;
  objc_storeStrong((id *)&self->_trackSnapshotView, self->_trackImageView);
  trackImageView = self->_trackImageView;
  self->_trackImageView = v7;
  v9 = v7;

  self->_forceLayout = 1;
  -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
  -[PLSlalomRegionEditor layoutIfNeeded](self, "layoutIfNeeded");
  -[UIImageView setAlpha:](self->_trackImageView, "setAlpha:", 1.0);
  -[UIImageView setAlpha:](*p_trackSnapshotView, "setAlpha:", 0.0);

}

- (double)_zoomMinValue
{
  return self->_zoomMinValue;
}

- (double)_zoomMaxValue
{
  double result;

  result = self->_zoomMaxValue;
  if (result == 0.0)
    return self->_maxValue;
  return result;
}

- (BOOL)_isZoomed
{
  double v3;
  double v4;
  double v5;

  -[PLSlalomRegionEditor _zoomMinValue](self, "_zoomMinValue");
  v4 = v3;
  -[PLSlalomRegionEditor _zoomMaxValue](self, "_zoomMaxValue");
  return v4 > self->_minValue || v5 < self->_maxValue;
}

- (void)setZoomAnimating:(BOOL)a3
{
  if (self->_zoomAnimating != a3)
  {
    self->_zoomAnimating = a3;
    if (!a3)
      -[UIImageView setImage:](self->_trackSnapshotView, "setImage:", 0);
  }
}

- (void)setRegionEditorStyle:(unint64_t)a3
{
  id v4;

  if (self->_regionEditorStyle != a3)
  {
    self->_regionEditorStyle = a3;
    -[PLSlalomRegionEditor _handleTintColor](self, "_handleTintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_startHandleView, "setTintColor:", v4);
    -[UIImageView setTintColor:](self->_endHandleView, "setTintColor:", v4);
    self->_forceLayout = 1;
    -[PLSlalomRegionEditor setNeedsLayout](self, "setNeedsLayout");
    -[PLSlalomRegionEditor layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (CGRect)startHandleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PLSlalomRegionEditor _handleFrameForValue:isStart:](self, "_handleFrameForValue:isStart:", 1, self->_startValue);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)endHandleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PLSlalomRegionEditor _handleFrameForValue:isStart:](self, "_handleFrameForValue:isStart:", 0, self->_endValue);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_valueFromStartHandleFrame:(CGRect)a3
{
  double result;

  -[PLSlalomRegionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)_valueFromEndHandleFrame:(CGRect)a3
{
  double result;

  -[PLSlalomRegionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CGRect)_trackFrameNoZoom
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  -[PLSlalomRegionEditor bounds](self, "bounds");
  top = self->_trackInsets.top;
  left = self->_trackInsets.left;
  v9.origin.x = v5 + left;
  v9.size.width = v7 - (left + self->_trackInsets.right);
  *(float *)&v8 = (v8 - (top + self->_trackInsets.bottom) + -7.0) * 0.5;
  v9.origin.y = v6 + top + roundf(*(float *)&v8);
  v9.size.height = 7.0;
  return CGRectIntegral(v9);
}

- (CGRect)_trackFrame
{
  double v3;
  double x;
  double v5;
  CGFloat y;
  double v7;
  double width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double minValue;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[PLSlalomRegionEditor _trackFrameNoZoom](self, "_trackFrameNoZoom");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[PLSlalomRegionEditor _isZoomed](self, "_isZoomed"))
  {
    -[PLSlalomRegionEditor _zoomMinValue](self, "_zoomMinValue");
    v12 = v11;
    -[PLSlalomRegionEditor _zoomMaxValue](self, "_zoomMaxValue");
    v14 = v13 - v12;
    if (v14 != 0.0)
    {
      minValue = self->_minValue;
      v16 = self->_maxValue - minValue;
      if (v16 != 0.0)
      {
        v17 = v16 / v14;
        v22.size.width = width * v17;
        v22.origin.x = x
                     - ((v12 - minValue) / v16 * (width * v17 + v17 * -2.0 * self->_trimHandleWidth)
                      + (v17 + -1.0) * self->_trimHandleWidth);
        v22.origin.y = y;
        v22.size.height = height;
        v23 = CGRectIntegral(v22);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
      }
    }
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_trackScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double result;

  -[PLSlalomRegionEditor _zoomMinValue](self, "_zoomMinValue");
  v4 = v3;
  -[PLSlalomRegionEditor _zoomMaxValue](self, "_zoomMaxValue");
  v6 = v5 - v4;
  v7 = self->_maxValue - self->_minValue;
  v8 = v7 == 0.0 || v6 == 0.0;
  result = v7 / v6;
  if (v8)
    return 1.0;
  return result;
}

- (double)_trimHandleWidth
{
  double trimHandleWidth;
  double v3;

  trimHandleWidth = self->_trimHandleWidth;
  -[PLSlalomRegionEditor _trackScale](self, "_trackScale");
  return trimHandleWidth * v3;
}

- (CGRect)_handleFrameForValue:(double)a3 isStart:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double minValue;
  double maxValue;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  -[PLSlalomRegionEditor _trackFrame](self, "_trackFrame", a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  minValue = self->_minValue;
  maxValue = self->_maxValue;
  if (minValue == maxValue)
    v16 = 0.0;
  else
    v16 = (a3 - minValue) / (maxValue - minValue);
  -[UIImageView image](self->_startHandleView, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  v21 = v20;

  -[PLSlalomRegionEditor _trimHandleWidth](self, "_trimHandleWidth");
  v23 = v19 * -0.5 + (v11 + v22 * -2.0) * v16;
  v24 = v7 + v22 + roundf(v23);
  v25 = (v13 - v21) * 0.5;
  v26 = v9 + roundf(v25);
  v27 = v19;
  v28 = v21;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v24;
  return result;
}

- (double)_valueFromHandleFrame:(CGRect)a3 isStart:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLSlalomRegionEditor _trackFrame](self, "_trackFrame", a4);
  if (v10 <= 0.0)
    return 0.0;
  v11 = v9;
  v12 = v10;
  -[PLSlalomRegionEditor _trimHandleWidth](self, "_trimHandleWidth");
  v14 = v13;
  v15 = v12 + v13 * -2.0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  return self->_minValue + (CGRectGetMidX(v17) - (v11 + v14)) / v15 * (self->_maxValue - self->_minValue);
}

- (BOOL)_isTouch:(id)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5
{
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MidX;
  double MidY;
  BOOL v22;
  BOOL result;
  CGRect v24;

  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  if (v6)
    -[PLSlalomRegionEditor startHandleFrame](self, "startHandleFrame");
  else
    -[PLSlalomRegionEditor endHandleFrame](self, "endHandleFrame");
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  MidX = CGRectGetMidX(*(CGRect *)&v12);
  v24.origin.x = v16;
  v24.origin.y = v17;
  v24.size.width = v18;
  v24.size.height = v19;
  MidY = CGRectGetMidY(v24);
  v22 = vabdd_f64(v9, MidX) <= 44.0;
  result = vabdd_f64(v11, MidY) <= 44.0 && v22;
  *a5 = v9 - MidX;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  if (-[PLSlalomRegionEditor isEnabled](self, "isEnabled") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PLSlalomRegionEditor;
    -[PLSlalomRegionEditor setEnabled:](&v6, sel_setEnabled_, v3);
    if (-[PLSlalomRegionEditor isEnabled](self, "isEnabled"))
      v5 = 1.0;
    else
      v5 = 0.5;
    -[UIImageView setAlpha:](self->_startHandleView, "setAlpha:", v5);
    -[UIImageView setAlpha:](self->_endHandleView, "setAlpha:", v5);
    -[UIImageView setAlpha:](self->_trackImageView, "setAlpha:", v5);
    -[UIImageView setAlpha:](self->_trackSnapshotView, "setAlpha:", v5);
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v16;
  double v17;

  v5 = a3;
  v16 = 1.79769313e308;
  v17 = 1.79769313e308;
  v6 = -[PLSlalomRegionEditor _isTouch:inHandleIsStart:outTouchOffset:](self, "_isTouch:inHandleIsStart:outTouchOffset:", v5, 1, &v17);
  v7 = -[PLSlalomRegionEditor _isTouch:inHandleIsStart:outTouchOffset:](self, "_isTouch:inHandleIsStart:outTouchOffset:", v5, 0, &v16);
  v9 = v16;
  v8 = v17;
  v10 = fabs(v17);
  v11 = fabs(v16);
  v12 = v10 < v11;
  v13 = v10 >= v11;
  if (!v7)
  {
    v12 = v6;
    v13 = 0;
  }
  if (!v6)
  {
    v12 = 0;
    v13 = v7;
  }
  self->_draggingStart = v12;
  self->_draggingEnd = v13;
  if (!v12)
    v8 = v9;
  self->_touchOffset = v8;
  if (self->_draggingStart || v13)
  {
    -[PLSlalomRegionEditor _beginTrackingZoomWithTouch:](self, "_beginTrackingZoomWithTouch:", v5);
    -[PLSlalomRegionEditorDelegate slalomRegionEditorDidBeginEditing:withStartHandle:](self->_delegate, "slalomRegionEditorDidBeginEditing:withStartHandle:", self, self->_draggingStart);
    -[PLSlalomRegionEditor sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
  }

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = a3;
  -[PLSlalomRegionEditor _updateSlidersWithTouch:](self, "_updateSlidersWithTouch:", v5);
  if (*(_WORD *)&self->_draggingStart)
  {
    -[PLSlalomRegionEditor _cancelZoomTrackingIfNeccessaryWithTouch:](self, "_cancelZoomTrackingIfNeccessaryWithTouch:", v5);
    -[PLSlalomRegionEditor _beginTrackingZoomWithTouch:](self, "_beginTrackingZoomWithTouch:", v5);
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[PLSlalomRegionEditor _updateSlidersWithTouch:](self, "_updateSlidersWithTouch:", a3, a4);
  -[PLSlalomRegionEditor _stopTrackingAndSendControlEvents:](self, "_stopTrackingAndSendControlEvents:", 64);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[PLSlalomRegionEditor _stopTrackingAndSendControlEvents:](self, "_stopTrackingAndSendControlEvents:", 256);
}

- (void)_stopTrackingAndSendControlEvents:(unint64_t)a3
{
  _BOOL4 draggingEnd;

  if (self->_draggingStart)
  {
    self->_draggingStart = 0;
    self->_draggingEnd = 0;
LABEL_4:
    -[PLSlalomRegionEditorDelegate slalomRegionEditorDidEndEditing:](self->_delegate, "slalomRegionEditorDidEndEditing:", self);
    -[PLSlalomRegionEditor sendActionsForControlEvents:](self, "sendActionsForControlEvents:", a3);
    goto LABEL_5;
  }
  draggingEnd = self->_draggingEnd;
  self->_draggingStart = 0;
  self->_draggingEnd = 0;
  if (draggingEnd)
    goto LABEL_4;
LABEL_5:
  -[PLSlalomRegionEditor _cancelTrackingZoom](self, "_cancelTrackingZoom");
  -[PLSlalomRegionEditor _cancelZoom](self, "_cancelZoom");
}

- (void)_updateSlidersWithTouch:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGRect v18;

  v4 = a3;
  if (v4 && (self->_draggingStart || self->_draggingEnd))
  {
    v17 = v4;
    v5 = -[PLSlalomRegionEditor isZoomAnimating](self, "isZoomAnimating");
    v4 = v17;
    if (!v5)
    {
      if (self->_draggingStart)
        -[PLSlalomRegionEditor startHandleFrame](self, "startHandleFrame");
      else
        -[PLSlalomRegionEditor endHandleFrame](self, "endHandleFrame");
      v10 = v6;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      objc_msgSend(v17, "locationInView:", self);
      v15 = v14;
      v18.origin.x = v10;
      v18.origin.y = v11;
      v18.size.width = v12;
      v18.size.height = v13;
      v16 = v10 + v15 - CGRectGetMidX(v18) - self->_touchOffset;
      if (self->_draggingStart)
      {
        -[PLSlalomRegionEditor _valueFromStartHandleFrame:](self, "_valueFromStartHandleFrame:", v16, v11, v12, v13);
        -[PLSlalomRegionEditor setStartValue:notify:](self, "setStartValue:notify:", 1);
      }
      else
      {
        -[PLSlalomRegionEditor _valueFromEndHandleFrame:](self, "_valueFromEndHandleFrame:", v16, v11, v12, v13);
        -[PLSlalomRegionEditor setEndValue:notify:](self, "setEndValue:notify:", 1);
      }
      v4 = v17;
    }
  }

}

- (void)_beginTrackingZoomWithTouch:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  v4 = a3;
  if (!*(_WORD *)&self->_zoomed)
  {
    self->_trackingZoom = 1;
    v7 = v4;
    objc_msgSend(v4, "locationInView:", self);
    self->_touchLocationWhenTrackingZoomBegan.x = v5;
    self->_touchLocationWhenTrackingZoomBegan.y = v6;
    -[PLSlalomRegionEditor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__zoomPressWasHeld, 0, self->_zoomDelay);
    v4 = v7;
  }

}

- (void)_cancelZoomTrackingIfNeccessaryWithTouch:(id)a3
{
  double v4;

  objc_msgSend(a3, "locationInView:", self);
  if (vabdd_f64(v4, self->_touchLocationWhenTrackingZoomBegan.x) > 4.0)
    -[PLSlalomRegionEditor _cancelTrackingZoom](self, "_cancelTrackingZoom");
}

- (void)_cancelTrackingZoom
{
  if (self->_trackingZoom && !self->_zoomed)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__zoomPressWasHeld, 0);
    self->_trackingZoom = 0;
  }
}

- (void)_zoomPressWasHeld
{
  self->_zoomed = -[PLSlalomRegionEditorDelegate slalomRegionEditorRequestForceZoom:](self->_delegate, "slalomRegionEditorRequestForceZoom:", self);
}

- (void)_cancelZoom
{
  if (self->_zoomed)
  {
    self->_zoomed = 0;
    -[PLSlalomRegionEditorDelegate slalomRegionEditorRequestForceUnzoom:](self->_delegate, "slalomRegionEditorRequestForceUnzoom:", self);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  PLSlalomRegionEditor *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;

  v4 = a3;
  v5 = v4;
  if (!*(_WORD *)&self->_draggingStart)
    goto LABEL_14;
  objc_msgSend(v4, "view");
  v6 = (PLSlalomRegionEditor *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "numberOfTouchesRequired") != 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v5, "minimumNumberOfTouches") <= 1)
    {
      objc_msgSend(v5, "translationInView:", self);
      v18 = fabs(v19) <= fabs(v20);
      goto LABEL_15;
    }
LABEL_14:
    v18 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSlalomRegionEditor convertPoint:toView:](self, "convertPoint:toView:", v7, 10.0, 10.0);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSlalomRegionEditor convertPoint:toView:](self, "convertPoint:toView:", v12, 20.0, 10.0);
  v14 = v13;
  v16 = v15;

  if ((objc_msgSend(v5, "direction") & 3) == 0 || (v18 = 0, v17 = v9 - v14, v9 - v14 >= 0.0) && v9 - v14 <= 0.0)
    v18 = (objc_msgSend(v5, "direction", v17) & 0xC) == 0 || v11 - v16 == 0.0;
LABEL_15:

  return v18;
}

- (void)_updateTrack
{
  id v3;

  -[PLSlalomRegionEditor _trackImageForZoom:](self, "_trackImageForZoom:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_trackImageView, "setImage:", v3);

}

- (id)_trackImageForZoom:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  CGContext *CurrentContext;
  void *v32;
  double MinX;
  double MaxX;
  double MidX;
  double v36;
  double v37;
  double v38;
  double v39;
  double startValue;
  double v41;
  double endValue;
  double v43;
  _BOOL4 v44;
  double i;
  double v47;
  double j;
  void *v49;
  void *v50;
  double k;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGSize v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[PLSlalomRegionEditor _trackFrame](self, "_trackFrame", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PLSlalomRegionEditor startHandleFrame](self, "startHandleFrame");
  v13 = v12;
  v15 = v14;
  v57 = v17;
  v58 = v16;
  -[PLSlalomRegionEditor endHandleFrame](self, "endHandleFrame");
  v55 = v19;
  v56 = v18;
  v20 = v13 - v5;
  v21 = v15 - v7;
  v53 = v23 - v7;
  v54 = v22 - v5;
  v25 = *MEMORY[0x1E0C9D538];
  v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PLSlalomRegionEditor _trackScale](self, "_trackScale");
  v27 = v26;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "scale");
  v30 = v29;
  v59.width = v9;
  v59.height = v11;
  UIGraphicsBeginImageContextWithOptions(v59, 0, v30);

  CurrentContext = UIGraphicsGetCurrentContext();
  -[PLSlalomRegionEditor _trackColor](self, "_trackColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFill");

  v60.origin.x = v25;
  v60.origin.y = v24;
  v60.size.width = v9;
  v60.size.height = v11;
  CGContextFillRect(CurrentContext, v60);
  CGContextSetLineWidth(CurrentContext, 1.0);
  CGContextSetLineCap(CurrentContext, kCGLineCapSquare);
  v61.origin.x = v25;
  v61.origin.y = v24;
  v61.size.width = v9;
  v61.size.height = v11;
  MinX = CGRectGetMinX(v61);
  v62.origin.x = v25;
  v62.origin.y = v24;
  v62.size.width = v9;
  v62.size.height = v11;
  MaxX = CGRectGetMaxX(v62);
  v63.origin.x = v20;
  v63.origin.y = v21;
  v63.size.height = v57;
  v63.size.width = v58;
  MidX = CGRectGetMidX(v63);
  v64.origin.y = v53;
  v64.origin.x = v54;
  v64.size.height = v55;
  v64.size.width = v56;
  v36 = CGRectGetMidX(v64);
  v37 = v27 * 3.0;
  v38 = v27 * 9.0;
  v39 = 1.0 / v9;
  startValue = self->_startValue;
  if (v9 == 0.0)
    v39 = 0.0;
  v41 = startValue - self->_minValue;
  endValue = self->_endValue;
  v43 = endValue - startValue;
  v44 = v43 >= v39 && self->_maxValue - endValue < v39;
  if (v41 >= v39 || v43 < v39)
  {
    for (i = v37 * floor(MinX / v37); i <= MidX; i = v37 + i)
    {
      CGContextMoveToPoint(CurrentContext, i, 0.0);
      CGContextAddLineToPoint(CurrentContext, i, 7.0);
    }
    MinX = MidX;
  }
  if (v44)
    v47 = MaxX;
  else
    v47 = v36;
  for (j = v38 * ceil(MinX / v38); j <= v47; j = v38 + j)
  {
    CGContextMoveToPoint(CurrentContext, j, 0.0);
    CGContextAddLineToPoint(CurrentContext, j, 7.0);
  }
  if (!v44)
  {
    for (k = v37 * ceil(v36 / v37); k <= MaxX; k = v37 + k)
    {
      CGContextMoveToPoint(CurrentContext, k, 0.0);
      CGContextAddLineToPoint(CurrentContext, k, 7.0);
    }
  }
  -[PLSlalomRegionEditor _tickColor](self, "_tickColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setStroke");

  CGContextStrokePath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v50;
}

- (id)_tickColor
{
  unint64_t v2;
  void *v3;

  v2 = -[PLSlalomRegionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_trackColor
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[PLSlalomRegionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 != 1)
    {
      v5 = 0;
      return v5;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_handleTintColor
{
  unint64_t v2;
  void *v3;

  v2 = -[PLSlalomRegionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_drawCurveWithFlatEndsFromX:(double)a3 fromY:(double)a4 toX:(double)a5 toY:(double)a6
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextAddCurveToPoint(CurrentContext, a5 * 0.5 + a3 * 0.5, a4, a5 * 0.5 + a3 * 0.5, a6, a5, a6);
}

- (id)_handleImage
{
  void *v2;
  void *v3;
  void *v4;

  PLPhotoLibraryFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLSlalomGrabberHandle.png"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PLSlalomRegionEditorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PLSlalomRegionEditorDelegate *)a3;
}

- (UIEdgeInsets)trackInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_trackInsets.top;
  left = self->_trackInsets.left;
  bottom = self->_trackInsets.bottom;
  right = self->_trackInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)trimHandleWidth
{
  return self->_trimHandleWidth;
}

- (void)setTrimHandleWidth:(double)a3
{
  self->_trimHandleWidth = a3;
}

- (unint64_t)regionEditorStyle
{
  return self->_regionEditorStyle;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (double)startValue
{
  return self->_startValue;
}

- (double)endValue
{
  return self->_endValue;
}

- (double)zoomDelay
{
  return self->_zoomDelay;
}

- (void)setZoomDelay:(double)a3
{
  self->_zoomDelay = a3;
}

- (BOOL)isZoomAnimating
{
  return self->_zoomAnimating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackSnapshotView, 0);
  objc_storeStrong((id *)&self->_trackImageView, 0);
  objc_storeStrong((id *)&self->_endHandleView, 0);
  objc_storeStrong((id *)&self->_startHandleView, 0);
}

@end
