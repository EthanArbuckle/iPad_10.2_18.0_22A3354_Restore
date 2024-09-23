@implementation RCVisualWaveformAmpSlice

+ (UIColor)resolvedPrimaryColor
{
  return (UIColor *)(id)qword_1001ED888;
}

+ (void)setResolvedPrimaryColor:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&qword_1001ED888, a3);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED888, "colorWithAlphaComponent:", 0.15));
  v5 = (void *)qword_1001ED890;
  qword_1001ED890 = v4;

}

+ (UIColor)resolvedSecondaryColor
{
  return (UIColor *)(id)qword_1001ED898;
}

+ (void)setResolvedSecondaryColor:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&qword_1001ED898, a3);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED898, "colorWithAlphaComponent:", 0.15));
  v5 = (void *)qword_1001ED8A0;
  qword_1001ED8A0 = v4;

}

+ (id)colorForSliceColor:(unint64_t)a3 dimmed:(BOOL)a4
{
  uint64_t *v4;
  uint64_t *v5;

  if (a3 == 1)
  {
    v4 = &qword_1001ED888;
    v5 = &qword_1001ED890;
  }
  else
  {
    if (a3 != 2)
      return 0;
    v4 = &qword_1001ED898;
    v5 = &qword_1001ED8A0;
  }
  if (a4)
    v4 = v5;
  return (id)*v4;
}

- (RCVisualWaveformAmpSlice)initWithIndex:(double)a3 amplitude:(double)a4
{
  RCVisualWaveformAmpSlice *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCVisualWaveformAmpSlice;
  result = -[RCVisualWaveformAmpSlice init](&v7, "init");
  if (result)
  {
    result->_hasProcessedSegments = 0;
    result->_sliceIndex = (uint64_t)a3;
    result->_amplitude = a4;
    result->_visualAmplitudeHeight = 0.0;
    result->_visualAmplitudeHeightInterpolatingFrames = 0;
  }
  return result;
}

- (RCVisualWaveformAmpSlice)init
{
  return -[RCVisualWaveformAmpSlice initWithIndex:amplitude:](self, "initWithIndex:amplitude:", 0.0, 0.0);
}

- (BOOL)hasVisualAmplitudeInterpolatingFramesLeft
{
  return self->_interpolatingVisualAmplitudeHeightFrameCount != 0;
}

- (UIColor)uiColor
{
  return (UIColor *)+[RCVisualWaveformAmpSlice colorForSliceColor:dimmed:](RCVisualWaveformAmpSlice, "colorForSliceColor:dimmed:", self->_color, 0);
}

- (UIColor)uiColorDimmed
{
  return (UIColor *)+[RCVisualWaveformAmpSlice colorForSliceColor:dimmed:](RCVisualWaveformAmpSlice, "colorForSliceColor:dimmed:", self->_color, 1);
}

- (void)setColor:(unint64_t)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *lastColor;
  CGColor *v8;
  void *v9;
  UIColor *v10;

  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[RCVisualWaveformAmpSlice colorForSliceColor:dimmed:](RCVisualWaveformAmpSlice, "colorForSliceColor:dimmed:", a3, 0));
  if (self->_lastColor != v5)
  {
    v10 = v5;
    self->_color = a3;
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue(-[RCVisualWaveformAmpSlice uiColor](self, "uiColor"));
    lastColor = self->_lastColor;
    self->_lastColor = v6;

    v8 = -[UIColor CGColor](self->_lastColor, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCVisualWaveformAmpSlice sliceLayer](self, "sliceLayer"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v5 = v10;
  }

}

- (void)setHasProcessedSegments:(BOOL)a3
{
  if (self->_hasProcessedSegments != a3)
    self->_hasProcessedSegments = a3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hidden = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCVisualWaveformAmpSlice sliceLayer](self, "sliceLayer"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  id v19;
  id v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v18, "scale");
  v9 = v8;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[RCVisualWaveformAmpSlice sliceLayer](self, "sliceLayer"));
  objc_msgSend(v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (COERCE__INT64(v9 * v11) != COERCE__INT64(x * v9)
    || COERCE__INT64(v9 * v13) != COERCE__INT64(y * v9)
    || COERCE__INT64(v9 * v15) != COERCE__INT64(height * v9))
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(-[RCVisualWaveformAmpSlice sliceLayer](self, "sliceLayer"));
    objc_msgSend(v20, "setFrame:", x, y, width, height);

  }
}

- (void)setVisualAmplitudeHeightInterpolatingFrames:(int64_t)a3
{
  self->_visualAmplitudeHeightInterpolatingFrames = a3;
  if (!a3)
  {
    self->_interpolatingvisualAmplitudeHeight = self->_visualAmplitudeHeight;
    self->_interpolatingvisualAmplitudeHeightDiff = 0.0;
    self->_interpolatingVisualAmplitudeHeightFrameCount = 0;
  }
}

- (void)setVisualAmplitudeHeight:(double)a3
{
  double visualAmplitudeHeight;
  uint64_t visualAmplitudeHeightInterpolatingFrames;

  visualAmplitudeHeight = self->_visualAmplitudeHeight;
  if (vabdd_f64(visualAmplitudeHeight, a3) > 2.22044605e-16)
  {
    visualAmplitudeHeightInterpolatingFrames = self->_visualAmplitudeHeightInterpolatingFrames;
    if (visualAmplitudeHeightInterpolatingFrames < 1)
    {
      self->_interpolatingVisualAmplitudeHeightFrameCount = 0;
      self->_interpolatingvisualAmplitudeHeight = a3;
    }
    else
    {
      self->_interpolatingvisualAmplitudeHeight = visualAmplitudeHeight;
      self->_interpolatingvisualAmplitudeHeightDiff = (a3 - visualAmplitudeHeight)
                                                    / (double)visualAmplitudeHeightInterpolatingFrames;
      self->_interpolatingVisualAmplitudeHeightFrameCount = visualAmplitudeHeightInterpolatingFrames;
    }
  }
  self->_visualAmplitudeHeight = a3;
}

- (double)visualAmplitudeHeight
{
  int64_t interpolatingVisualAmplitudeHeightFrameCount;
  BOOL v3;
  int64_t v4;
  double result;

  interpolatingVisualAmplitudeHeightFrameCount = self->_interpolatingVisualAmplitudeHeightFrameCount;
  v3 = interpolatingVisualAmplitudeHeightFrameCount < 1;
  v4 = interpolatingVisualAmplitudeHeightFrameCount - 1;
  if (v3)
    return self->_visualAmplitudeHeight;
  result = self->_interpolatingvisualAmplitudeHeight + self->_interpolatingvisualAmplitudeHeightDiff;
  self->_interpolatingvisualAmplitudeHeight = result;
  self->_interpolatingVisualAmplitudeHeightFrameCount = v4;
  return result;
}

- (int64_t)sliceIndex
{
  return self->_sliceIndex;
}

- (void)setSliceIndex:(int64_t)a3
{
  self->_sliceIndex = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)visualAmplitudeHeightInterpolatingFrames
{
  return self->_visualAmplitudeHeightInterpolatingFrames;
}

- (CALayer)sliceLayer
{
  return self->_sliceLayer;
}

- (void)setSliceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_sliceLayer, a3);
}

- (BOOL)hasProcessedSegments
{
  return self->_hasProcessedSegments;
}

- (unint64_t)color
{
  return self->_color;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceLayer, 0);
  objc_storeStrong((id *)&self->_lastColor, 0);
}

@end
