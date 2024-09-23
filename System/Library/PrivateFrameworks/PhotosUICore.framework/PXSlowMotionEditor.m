@implementation PXSlowMotionEditor

- (PXSlowMotionEditor)initWithFrame:(CGRect)a3
{
  PXSlowMotionEditor *v3;
  PXSlowMotionEditor *v4;
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
  uint64_t v17;
  UIImageView *endHandleView;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXSlowMotionEditor;
  v3 = -[PXSlowMotionEditor initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSlowMotionEditor setOpaque:](v3, "setOpaque:", 0);
    v4->_regionEditorStyle = 0;
    objc_msgSend((id)objc_opt_class(), "handleImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    trackSnapshotView = v4->_trackSnapshotView;
    v4->_trackSnapshotView = (UIImageView *)v11;

    -[UIImageView setAlpha:](v4->_trackSnapshotView, "setAlpha:", 0.0);
    -[PXSlowMotionEditor addSubview:](v4, "addSubview:", v4->_trackSnapshotView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    trackImageView = v4->_trackImageView;
    v4->_trackImageView = (UIImageView *)v13;

    -[PXSlowMotionEditor addSubview:](v4, "addSubview:", v4->_trackImageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    startHandleView = v4->_startHandleView;
    v4->_startHandleView = (UIImageView *)v15;

    -[PXSlowMotionEditor addSubview:](v4, "addSubview:", v4->_startHandleView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
    endHandleView = v4->_endHandleView;
    v4->_endHandleView = (UIImageView *)v17;

    -[PXSlowMotionEditor addSubview:](v4, "addSubview:", v4->_endHandleView);
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
  v13.super_class = (Class)PXSlowMotionEditor;
  -[PXSlowMotionEditor layoutSubviews](&v13, sel_layoutSubviews);
  if (self->_forceLayout || !self->_zoomAnimating)
  {
    -[PXSlowMotionEditor _updateTrack](self, "_updateTrack");
    -[PXSlowMotionEditor _trackFrame](self, "_trackFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIImageView setFrame:](self->_trackImageView, "setFrame:");
    -[UIImageView setFrame:](self->_trackSnapshotView, "setFrame:", v4, v6, v8, v10);
    startHandleView = self->_startHandleView;
    -[PXSlowMotionEditor startHandleFrame](self, "startHandleFrame");
    -[UIImageView setFrame:](startHandleView, "setFrame:");
    endHandleView = self->_endHandleView;
    -[PXSlowMotionEditor endHandleFrame](self, "endHandleFrame");
    -[UIImageView setFrame:](endHandleView, "setFrame:");
    self->_forceLayout = 0;
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = fmax(result.height, 22.0);
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

  -[PXSlowMotionEditor bounds](self, "bounds");
  -[PXSlowMotionEditor sizeThatFits:](self, "sizeThatFits:", v3, v4);
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
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinValue:(double)minValue
{
  if (self->_minValue != minValue)
  {
    self->_minValue = minValue;
    if (self->_maxValue < minValue)
    {
      -[PXSlowMotionEditor setMaxValue:](self, "setMaxValue:");
      minValue = self->_minValue;
    }
    if (self->_startValue < minValue)
      -[PXSlowMotionEditor setStartValue:](self, "setStartValue:");
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaxValue:(double)maxValue
{
  if (self->_maxValue != maxValue)
  {
    self->_maxValue = maxValue;
    if (self->_minValue > maxValue)
    {
      -[PXSlowMotionEditor setMinValue:](self, "setMinValue:");
      maxValue = self->_maxValue;
    }
    if (self->_endValue > maxValue)
      -[PXSlowMotionEditor setEndValue:](self, "setEndValue:");
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStartValue:(double)a3
{
  -[PXSlowMotionEditor setStartValue:notify:](self, "setStartValue:notify:", 0, a3);
}

- (void)setStartValue:(double)minValue notify:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;

  if (self->_minValue > minValue)
    minValue = self->_minValue;
  if (minValue > self->_maxValue)
    minValue = self->_maxValue;
  if (self->_startValue != minValue)
  {
    v4 = a4;
    self->_startValue = minValue;
    if (self->_endValue < minValue)
      -[PXSlowMotionEditor setEndValue:notify:](self, "setEndValue:notify:", a4);
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "slowMotionEditorStartValueChanged:", self);

    }
  }
}

- (void)setEndValue:(double)a3
{
  -[PXSlowMotionEditor setEndValue:notify:](self, "setEndValue:notify:", 0, a3);
}

- (void)setEndValue:(double)minValue notify:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;

  if (self->_minValue > minValue)
    minValue = self->_minValue;
  if (minValue > self->_maxValue)
    minValue = self->_maxValue;
  if (self->_endValue != minValue)
  {
    v4 = a4;
    self->_endValue = minValue;
    if (self->_startValue > minValue)
      -[PXSlowMotionEditor setStartValue:notify:](self, "setStartValue:notify:", a4);
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "slowMotionEditorEndValueChanged:", self);

    }
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
  -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
  -[PXSlowMotionEditor layoutIfNeeded](self, "layoutIfNeeded");
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

  -[PXSlowMotionEditor _zoomMinValue](self, "_zoomMinValue");
  v4 = v3;
  -[PXSlowMotionEditor _zoomMaxValue](self, "_zoomMaxValue");
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
    -[PXSlowMotionEditor _handleTintColor](self, "_handleTintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_startHandleView, "setTintColor:", v4);
    -[UIImageView setTintColor:](self->_endHandleView, "setTintColor:", v4);
    self->_forceLayout = 1;
    -[PXSlowMotionEditor setNeedsLayout](self, "setNeedsLayout");
    -[PXSlowMotionEditor layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (CGRect)startHandleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PXSlowMotionEditor _handleFrameForValue:isStart:](self, "_handleFrameForValue:isStart:", 1, self->_startValue);
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

  -[PXSlowMotionEditor _handleFrameForValue:isStart:](self, "_handleFrameForValue:isStart:", 0, self->_endValue);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)_valueFromStartHandleFrame:(CGRect)a3
{
  double result;

  -[PXSlowMotionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)_valueFromEndHandleFrame:(CGRect)a3
{
  double result;

  -[PXSlowMotionEditor _valueFromHandleFrame:isStart:](self, "_valueFromHandleFrame:isStart:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

  -[PXSlowMotionEditor bounds](self, "bounds");
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

  -[PXSlowMotionEditor _trackFrameNoZoom](self, "_trackFrameNoZoom");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[PXSlowMotionEditor _isZoomed](self, "_isZoomed"))
  {
    -[PXSlowMotionEditor _zoomMinValue](self, "_zoomMinValue");
    v12 = v11;
    -[PXSlowMotionEditor _zoomMaxValue](self, "_zoomMaxValue");
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

  -[PXSlowMotionEditor _zoomMinValue](self, "_zoomMinValue");
  v4 = v3;
  -[PXSlowMotionEditor _zoomMaxValue](self, "_zoomMaxValue");
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
  -[PXSlowMotionEditor _trackScale](self, "_trackScale");
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

  -[PXSlowMotionEditor _trackFrame](self, "_trackFrame", a4);
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

  -[PXSlowMotionEditor _trimHandleWidth](self, "_trimHandleWidth");
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
  -[PXSlowMotionEditor _trackFrame](self, "_trackFrame", a4);
  if (v10 <= 0.0)
    return 0.0;
  v11 = v9;
  v12 = v10;
  -[PXSlowMotionEditor _trimHandleWidth](self, "_trimHandleWidth");
  v14 = v13;
  v15 = v12 + v13 * -2.0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  return self->_minValue + (CGRectGetMidX(v17) - (v11 + v14)) / v15 * (self->_maxValue - self->_minValue);
}

- (BOOL)_isPoint:(CGPoint)a3 inHandleIsStart:(BOOL)a4 outTouchOffset:(double *)a5
{
  double y;
  double x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MidX;
  double MidY;
  BOOL v18;
  BOOL result;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  if (a4)
    -[PXSlowMotionEditor startHandleFrame](self, "startHandleFrame");
  else
    -[PXSlowMotionEditor endHandleFrame](self, "endHandleFrame");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  MidX = CGRectGetMidX(*(CGRect *)&v8);
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  MidY = CGRectGetMidY(v20);
  v18 = vabdd_f64(x, MidX) <= 44.0;
  result = vabdd_f64(y, MidY) <= 44.0 && v18;
  *a5 = x - MidX;
  return result;
}

- (void)handleBeginTrackingAtLocation:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  id WeakRetained;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  v16 = 1.79769313e308;
  v17 = 1.79769313e308;
  v6 = -[PXSlowMotionEditor _isPoint:inHandleIsStart:outTouchOffset:](self, "_isPoint:inHandleIsStart:outTouchOffset:", 1, &v17);
  v7 = -[PXSlowMotionEditor _isPoint:inHandleIsStart:outTouchOffset:](self, "_isPoint:inHandleIsStart:outTouchOffset:", 0, &v16, x, y);
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
    -[PXSlowMotionEditor _beginTrackingZoomWithPoint:](self, "_beginTrackingZoomWithPoint:", x, y);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "slowMotionEditorDidBeginEditing:withStartHandle:", self, self->_draggingStart);

  }
}

- (void)handleChangeTrackingAtLocation:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[PXSlowMotionEditor _updateSlidersWithPoint:](self, "_updateSlidersWithPoint:");
  if (*(_WORD *)&self->_draggingStart)
  {
    -[PXSlowMotionEditor _cancelZoomTrackingIfNeccessaryWithPoint:](self, "_cancelZoomTrackingIfNeccessaryWithPoint:", x, y);
    -[PXSlowMotionEditor _beginTrackingZoomWithPoint:](self, "_beginTrackingZoomWithPoint:", x, y);
  }
}

- (void)handleEndTrackingAtLocation:(CGPoint)a3
{
  _BOOL4 draggingEnd;
  id WeakRetained;

  -[PXSlowMotionEditor _updateSlidersWithPoint:](self, "_updateSlidersWithPoint:", a3.x, a3.y);
  if (self->_draggingStart)
  {
    self->_draggingStart = 0;
    self->_draggingEnd = 0;
LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "slowMotionEditorDidEndEditing:", self);

    goto LABEL_5;
  }
  draggingEnd = self->_draggingEnd;
  self->_draggingStart = 0;
  self->_draggingEnd = 0;
  if (draggingEnd)
    goto LABEL_4;
LABEL_5:
  -[PXSlowMotionEditor _cancelTrackingZoom](self, "_cancelTrackingZoom");
  -[PXSlowMotionEditor _cancelZoom](self, "_cancelZoom");
}

- (void)_updateSlidersWithPoint:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  x = a3.x;
  if ((self->_draggingStart || self->_draggingEnd)
    && !-[PXSlowMotionEditor isZoomAnimating](self, "isZoomAnimating", a3.x, a3.y))
  {
    if (self->_draggingStart)
      -[PXSlowMotionEditor startHandleFrame](self, "startHandleFrame");
    else
      -[PXSlowMotionEditor endHandleFrame](self, "endHandleFrame");
    v9 = v6;
    v10 = v7;
    v11 = v8;
    v12 = v5 + x - CGRectGetMidX(*(CGRect *)&v5) - self->_touchOffset;
    if (self->_draggingStart)
    {
      -[PXSlowMotionEditor _valueFromStartHandleFrame:](self, "_valueFromStartHandleFrame:", v12, v9, v10, v11);
      -[PXSlowMotionEditor setStartValue:notify:](self, "setStartValue:notify:", 1);
    }
    else
    {
      -[PXSlowMotionEditor _valueFromEndHandleFrame:](self, "_valueFromEndHandleFrame:", v12, v9, v10, v11);
      -[PXSlowMotionEditor setEndValue:notify:](self, "setEndValue:notify:", 1);
    }
  }
}

- (void)_beginTrackingZoomWithPoint:(CGPoint)a3
{
  if (!self->_trackingZoom && !self->_zoomed)
  {
    self->_trackingZoom = 1;
    self->_touchLocationWhenTrackingZoomBegan = a3;
    -[PXSlowMotionEditor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__zoomPressWasHeld, 0, self->_zoomDelay);
  }
}

- (void)_cancelZoomTrackingIfNeccessaryWithPoint:(CGPoint)a3
{
  if (vabdd_f64(a3.x, self->_touchLocationWhenTrackingZoomBegan.x) > 4.0)
    -[PXSlowMotionEditor _cancelTrackingZoom](self, "_cancelTrackingZoom");
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
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_zoomed = objc_msgSend(WeakRetained, "slowMotionEditorRequestForceZoom:", self);

}

- (void)_cancelZoom
{
  id WeakRetained;

  if (self->_zoomed)
  {
    self->_zoomed = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "slowMotionEditorRequestForceUnzoom:", self);

  }
}

- (void)_updateTrack
{
  id v3;

  -[PXSlowMotionEditor _trackImageForZoom:](self, "_trackImageForZoom:", 0);
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
  double v11;
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
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  int v31;
  CGColorSpace *DeviceRGB;
  CGContext *v33;
  id v34;
  double MinX;
  double MaxX;
  double MidX;
  double v38;
  double v39;
  double v40;
  double v41;
  double startValue;
  double v43;
  double endValue;
  double v45;
  _BOOL4 v46;
  double i;
  double v49;
  double j;
  id v51;
  CGImage *Image;
  void *v53;
  double k;
  double rect;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGAffineTransform v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  -[PXSlowMotionEditor _trackFrame](self, "_trackFrame", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXSlowMotionEditor startHandleFrame](self, "startHandleFrame");
  v13 = v12;
  v15 = v14;
  v61 = v17;
  v62 = v16;
  -[PXSlowMotionEditor endHandleFrame](self, "endHandleFrame");
  rect_24 = v19;
  v60 = v18;
  v20 = v15 - v7;
  rect_16 = v21 - v5;
  rect = v13 - v5;
  rect_8 = v22 - v7;
  v23 = *MEMORY[0x1E0C9D538];
  v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXSlowMotionEditor _trackScale](self, "_trackScale");
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scale");
  v29 = v28;

  v30 = vcvtpd_s64_f64(v9 * v29);
  v31 = vcvtpd_s64_f64(v11 * v29);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v33 = CGBitmapContextCreate(0, v30, v31, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v33)
  {
    v64.size.width = (double)v30;
    v64.origin.x = 0.0;
    v64.origin.y = 0.0;
    v64.size.height = (double)v31;
    CGContextClearRect(v33, v64);
    CGContextTranslateCTM(v33, 0.0, (double)v31);
    CGContextScaleCTM(v33, v29, -v29);
    CGContextGetCTM(&v63, v33);
    CGContextSetBaseCTM();
  }
  -[PXSlowMotionEditor _trackColor](self, "_trackColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v33, (CGColorRef)objc_msgSend(v34, "CGColor"));

  v65.origin.x = v23;
  v65.origin.y = v24;
  v65.size.width = v9;
  v65.size.height = v11;
  CGContextFillRect(v33, v65);
  CGContextSetLineWidth(v33, 1.0);
  CGContextSetLineCap(v33, kCGLineCapSquare);
  v66.origin.x = v23;
  v66.origin.y = v24;
  v66.size.width = v9;
  v66.size.height = v11;
  MinX = CGRectGetMinX(v66);
  v67.origin.x = v23;
  v67.origin.y = v24;
  v67.size.width = v9;
  v67.size.height = v11;
  MaxX = CGRectGetMaxX(v67);
  v68.origin.x = rect;
  v68.origin.y = v20;
  v68.size.height = v61;
  v68.size.width = v62;
  MidX = CGRectGetMidX(v68);
  v69.origin.y = rect_8;
  v69.origin.x = rect_16;
  v69.size.height = rect_24;
  v69.size.width = v60;
  v38 = CGRectGetMidX(v69);
  v39 = v26 * 3.0;
  v40 = v26 * 9.0;
  v41 = 1.0 / v9;
  startValue = self->_startValue;
  if (v9 == 0.0)
    v41 = 0.0;
  v43 = startValue - self->_minValue;
  endValue = self->_endValue;
  v45 = endValue - startValue;
  v46 = v45 >= v41 && self->_maxValue - endValue < v41;
  if (v43 >= v41 || v45 < v41)
  {
    for (i = v39 * floor(MinX / v39); i <= MidX; i = v39 + i)
    {
      CGContextMoveToPoint(v33, i, 0.0);
      CGContextAddLineToPoint(v33, i, 7.0);
    }
    MinX = MidX;
  }
  if (v46)
    v49 = MaxX;
  else
    v49 = v38;
  for (j = v40 * ceil(MinX / v40); j <= v49; j = v40 + j)
  {
    CGContextMoveToPoint(v33, j, 0.0);
    CGContextAddLineToPoint(v33, j, 7.0);
  }
  if (!v46)
  {
    for (k = v39 * ceil(v38 / v39); k <= MaxX; k = v39 + k)
    {
      CGContextMoveToPoint(v33, k, 0.0);
      CGContextAddLineToPoint(v33, k, 7.0);
    }
  }
  -[PXSlowMotionEditor _tickColor](self, "_tickColor");
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v33, (CGColorRef)objc_msgSend(v51, "CGColor"));

  CGContextStrokePath(v33);
  Image = CGBitmapContextCreateImage(v33);
  CGContextRelease(v33);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, v29);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  return v53;
}

- (id)_tickColor
{
  unint64_t v2;
  void *v3;

  v2 = -[PXSlowMotionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 == 2 || v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
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

  v2 = -[PXSlowMotionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (v2 != 1)
    {
      v5 = 0;
      return v5;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
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

  v2 = -[PXSlowMotionEditor regionEditorStyle](self, "regionEditorStyle");
  if (v2)
  {
    if (v2 == 2 || v2 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
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

- (PXSlowMotionEditorDelegate)delegate
{
  return (PXSlowMotionEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackSnapshotView, 0);
  objc_storeStrong((id *)&self->_trackImageView, 0);
  objc_storeStrong((id *)&self->_endHandleView, 0);
  objc_storeStrong((id *)&self->_startHandleView, 0);
}

+ (UIImage)handleImage
{
  return 0;
}

@end
