@implementation UIPrintSegmentedSlider

- (UIPrintSegmentedSlider)initWithFrame:(CGRect)a3
{
  UIPrintSegmentedSlider *v3;
  UIPrintNonMovableTapGestureRecognizer *v4;
  void *v5;
  uint64_t v6;
  UIColor *trackMarkersColor;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIPrintSegmentedSlider;
  v3 = -[UIPrintSegmentedSlider initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIPrintNonMovableTapGestureRecognizer initWithTarget:action:]([UIPrintNonMovableTapGestureRecognizer alloc], "initWithTarget:action:", v3, sel_sliderTapped_);
    -[UIPrintSegmentedSlider addGestureRecognizer:](v3, "addGestureRecognizer:", v4);
    -[UIPrintSegmentedSlider addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_controlInteractionBegan_, 1);
    -[UIPrintSegmentedSlider addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_controlInteractionEnded_, 448);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.596078431, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSegmentedSlider _accessibilityHigherContrastTintColorForColor:](v3, "_accessibilityHigherContrastTintColorForColor:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    trackMarkersColor = v3->_trackMarkersColor;
    v3->_trackMarkersColor = (UIColor *)v6;

    v3->_locksToSegment = 1;
    -[UIPrintSegmentedSlider layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsDisplayOnBoundsChange:", 1);

  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  char v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  double v25;
  float v26;
  double v27;
  CGRect v28;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[UIPrintSegmentedSlider bounds](self, "bounds");
  -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[UIPrintSegmentedSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v15 = v7;
  v16 = v9;
  v17 = v11;
  v18 = v13;
  if ((v14 & 1) != 0)
    v19 = CGRectGetMaxX(*(CGRect *)&v15) - v5;
  else
    v19 = v5 - CGRectGetMinX(*(CGRect *)&v15);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  v20 = v19 / CGRectGetWidth(v28);
  if (v20 > 1.0)
    v20 = 1.0;
  v21 = fmax(v20, 0.0);
  -[UIPrintSegmentedSlider maximumValue](self, "maximumValue");
  v23 = v22;
  -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
  v25 = (float)(v23 - v24);
  -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
  v27 = v26 + v21 * v25;
  *(float *)&v27 = v27;
  -[UIPrintSegmentedSlider setValue:animated:](self, "setValue:animated:", 1, v27);
  -[UIPrintSegmentedSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->_segmentCount = a3;
}

- (void)setSegmented:(BOOL)a3
{
  self->_segmented = a3;
}

- (unint64_t)numberOfTicks
{
  unint64_t segmentCount;
  float v5;
  float v6;
  float v7;

  segmentCount = self->_segmentCount;
  if (segmentCount)
  {
    return (unint64_t)(float)(segmentCount + 1);
  }
  else
  {
    -[UIPrintSegmentedSlider maximumValue](self, "maximumValue");
    v6 = v5;
    -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
    return (unint64_t)(float)((float)(v6 - v7) + 1.0);
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  float v5;
  float v6;
  float v7;

  -[UIPrintSegmentedSlider maximumValue](self, "maximumValue");
  v6 = v5;
  -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  objc_super v15;

  v4 = a4;
  if (self->_segmented)
  {
    -[UIPrintSegmentedSlider offsetBetweenTicksForNumberOfTicks:](self, "offsetBetweenTicksForNumberOfTicks:", -[UIPrintSegmentedSlider numberOfTicks](self, "numberOfTicks"));
    v8 = v7;
    -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
    v10 = roundf((float)(a3 - v9) / v8);
    -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
    v12 = v11 + (float)(v8 * (float)(int)v10);
    if (self->_locksToSegment || self->_snapsToSegment && vabds_f32(v12, a3) < 0.015)
    {
      if (-[UIPrintSegmentedSlider isTracking](self, "isTracking"))
      {
        -[UIPrintSegmentedSlider value](self, "value");
        if (v12 != v13)
          -[UISelectionFeedbackGenerator selectionChanged](self->_feedbackGenerator, "selectionChanged");
      }
      a3 = v12;
    }
  }
  -[UIPrintSegmentedSlider value](self, "value");
  if (a3 != *(float *)&v14)
  {
    v15.receiver = self;
    v15.super_class = (Class)UIPrintSegmentedSlider;
    *(float *)&v14 = a3;
    -[UIPrintSegmentedSlider setValue:animated:](&v15, sel_setValue_animated_, v4, v14);
  }
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIPrintSegmentedSlider _minTrackView](self, "_minTrackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", self->_segmented);

  -[UIPrintSegmentedSlider _maxTrackView](self, "_maxTrackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", self->_segmented);

  if (self->_segmented)
  {
    -[UIPrintSegmentedSlider bounds](self, "bounds");
    -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:");
    v11 = v10;
    v33 = v12;
    v14 = v13;
    v16 = v15;
    v35 = objc_alloc_init(MEMORY[0x1E0DC3508]);
    -[UIColor set](self->_trackMarkersColor, "set");
    objc_msgSend(v35, "setLineWidth:", v16);
    v17 = -[UIPrintSegmentedSlider numberOfTicks](self, "numberOfTicks");
    -[UIPrintSegmentedSlider offsetBetweenTicksForNumberOfTicks:](self, "offsetBetweenTicksForNumberOfTicks:", v17);
    if (v17)
    {
      v19 = v18;
      v20 = 0;
      v21 = v33 + v16 * 0.5;
      v22 = v21 + -3.5;
      v23 = v21 + 3.5;
      do
      {
        -[UIPrintSegmentedSlider minimumValue](self, "minimumValue", *(_QWORD *)&v33);
        v25 = v24 + (float)((float)(int)v20 * v19);
        -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
        v27 = v25 - v26;
        -[UIPrintSegmentedSlider maximumValue](self, "maximumValue");
        v29 = v28;
        -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
        v31 = _roundToPixel(v11 + (float)(v27 / (float)(v29 - v30)) * v14);
        objc_msgSend(v35, "moveToPoint:", v31, _roundToPixel(v22));
        objc_msgSend(v35, "addLineToPoint:", v31, _roundToPixel(v23));
        ++v20;
      }
      while (v17 != v20);
    }
    objc_msgSend(v35, "stroke", *(_QWORD *)&v33);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v11, v34, v14, v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fill");

  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)UIPrintSegmentedSlider;
    -[UIPrintSegmentedSlider drawRect:](&v36, sel_drawRect_, x, y, width, height);
  }
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  double height;
  objc_super v42;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = -[UIPrintSegmentedSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v42.receiver = self;
  v42.super_class = (Class)UIPrintSegmentedSlider;
  v39 = x;
  v40 = width;
  -[UIPrintSegmentedSlider thumbRectForBounds:trackRect:value:](&v42, sel_thumbRectForBounds_trackRect_value_, v11, v10, v9, v8, x, y, width, height, LODWORD(a5));
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (self->_segmented)
  {
    -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
    if (v22 == a5 || (-[UIPrintSegmentedSlider maximumValue](self, "maximumValue"), v23 == a5))
    {
      -[UIPrintSegmentedSlider trackRectForBounds:](self, "trackRectForBounds:", v11, v10, v9, v8);
      v24 = v21;
      v26 = v25;
      -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
      if (v27 == a5)
        v28 = -v26;
      else
        v28 = v26;
      v21 = v24;
      v15 = v15 + v28;
    }
    else
    {
      -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
      v34 = a5 - v33;
      -[UIPrintSegmentedSlider maximumValue](self, "maximumValue");
      v36 = v35;
      -[UIPrintSegmentedSlider minimumValue](self, "minimumValue");
      v38 = v34 / (float)(v36 - v37);
      if (v13)
        v38 = 1.0 - v38;
      v15 = v39 + v19 * -0.5 + v38 * v40;
    }
  }
  v29 = v15;
  v30 = v17;
  v31 = v19;
  v32 = v21;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)controlInteractionBegan:(id)a3
{
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *feedbackGenerator;

  v4 = (UISelectionFeedbackGenerator *)objc_opt_new();
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v4;

  -[UISelectionFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
}

- (void)controlInteractionEnded:(id)a3
{
  UISelectionFeedbackGenerator *feedbackGenerator;

  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

}

- (BOOL)isSegmented
{
  return self->_segmented;
}

- (BOOL)locksToSegment
{
  return self->_locksToSegment;
}

- (void)setLocksToSegment:(BOOL)a3
{
  self->_locksToSegment = a3;
}

- (BOOL)snapsToSegment
{
  return self->_snapsToSegment;
}

- (void)setSnapsToSegment:(BOOL)a3
{
  self->_snapsToSegment = a3;
}

- (unint64_t)segmentCount
{
  return self->_segmentCount;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackMarkersColor, 0);
}

@end
