@implementation RCPlaybackSettingsSlider

- (RCPlaybackSettingsSlider)init
{
  RCPlaybackSettingsSlider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RCPlaybackSettingsSlider;
  v2 = -[RCPlaybackSettingsSlider init](&v15, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackSpeedSliderMinimumValueImage"));
    -[RCPlaybackSettingsSlider setMinimumValueImage:](v2, "setMinimumValueImage:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackSpeedSliderImageColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider _minValueView](v2, "_minValueView"));
    objc_msgSend(v6, "setTintColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackSpeedSliderMaximumValueImage"));
    -[RCPlaybackSettingsSlider setMaximumValueImage:](v2, "setMaximumValueImage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackSpeedSliderImageColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider _maxValueView](v2, "_maxValueView"));
    objc_msgSend(v9, "setTintColor:", v8);

    -[RCPlaybackSettingsSlider _minimumValue](v2, "_minimumValue");
    *(float *)&v10 = v10;
    -[RCPlaybackSettingsSlider setMinimumValue:](v2, "setMinimumValue:", v10);
    -[RCPlaybackSettingsSlider _maximumValue](v2, "_maximumValue");
    *(float *)&v11 = v11;
    -[RCPlaybackSettingsSlider setMaximumValue:](v2, "setMaximumValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_SPEED_SLIDER"), &stru_1001B2BC0, 0));
    -[RCPlaybackSettingsSlider setAccessibilityLabel:](v2, "setAccessibilityLabel:", v13);

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCPlaybackSettingsSlider;
  -[RCPlaybackSettingsSlider layoutSubviews](&v3, "layoutSubviews");
  -[RCPlaybackSettingsSlider setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[RCPlaybackSettingsSlider _hideDefaultSliderViews](self, "_hideDefaultSliderViews", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[RCPlaybackSettingsSlider trackRect](self, "trackRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[RCPlaybackSettingsSlider _createTickPathsForTrackRect:](self, "_createTickPathsForTrackRect:");
  -[RCPlaybackSettingsSlider _createTrackPathsForTrackRect:](self, "_createTrackPathsForTrackRect:", v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider regularTrackPaths](self, "regularTrackPaths"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider regularTickPaths](self, "regularTickPaths"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13));

  -[RCPlaybackSettingsSlider _drawBezierPaths:tinted:](self, "_drawBezierPaths:tinted:", v17, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider tintedTrackPaths](self, "tintedTrackPaths"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider tintedTickPaths](self, "tintedTickPaths"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15));

  -[RCPlaybackSettingsSlider _drawBezierPaths:tinted:](self, "_drawBezierPaths:tinted:", v16, 1);
}

- (void)_drawBezierPaths:(id)a3 tinted:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = v6;
  if (v4)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackSpeedTintedTrackColor"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackSpeedRegularTrackColor"));
  v9 = v8;
  objc_msgSend(v8, "set");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        objc_msgSend(v10, "appendPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), (_QWORD)v16);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "fill");
}

- (void)_createTickPathsForTrackRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double MidY;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 v25;
  void *v27;
  id v28;
  id v29;
  CGFloat v30;
  id v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = x;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  v10 = -[RCPlaybackSettingsSlider numberOfTicks](self, "numberOfTicks");
  v11 = -[RCPlaybackSettingsSlider tickNumberForDefaultValue](self, "tickNumberForDefaultValue");
  v12 = -[RCPlaybackSettingsSlider tickNumberForSelectedValue](self, "tickNumberForSelectedValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v13, "playbackSpeedSliderTickSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "playbackSpeedSliderTickCornerRadius");
  if (v10)
  {
    v19 = v18;
    v20 = 0;
    v21 = MidY - v17 * 0.5;
    do
    {
      -[RCPlaybackSettingsSlider valueForTickNumber:](self, "valueForTickNumber:", v20, *(_QWORD *)&v30);
      -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v22 - v15 * 0.5, v21, v15, v17, v19));
      v25 = v12 <= v20 && v20 <= v11;
      if (v11 <= v20 && v20 <= v12)
        v25 = 1;
      v27 = v31;
      if (v25)
        v27 = v8;
      objc_msgSend(v27, "addObject:", v23);

      ++v20;
    }
    while (v10 != v20);
  }
  v28 = objc_msgSend(v31, "copy", *(_QWORD *)&v30);
  -[RCPlaybackSettingsSlider setRegularTickPaths:](self, "setRegularTickPaths:", v28);

  v29 = objc_msgSend(v8, "copy");
  -[RCPlaybackSettingsSlider setTintedTickPaths:](self, "setTintedTickPaths:", v29);

}

- (void)_createTrackPathsForTrackRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[RCPlaybackSettingsSlider value](self, "value");
  v10 = v9;
  -[RCPlaybackSettingsSlider _defaultStartingValue](self, "_defaultStartingValue");
  v12 = v11;
  -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v10, x, y, width, height);
  v14 = v13;
  -[RCPlaybackSettingsSlider xPositionWithSelectedTickValue:forTrackRect:](self, "xPositionWithSelectedTickValue:forTrackRect:", v12, x, y, width, height);
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  if (v14 < v15)
    v14 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, v16 - x, height));
  objc_msgSend(v22, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v14, y, x + width - v14, height));
  objc_msgSend(v22, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v16, y, v14 - v16, height));
  objc_msgSend(v8, "addObject:", v19);

  v20 = objc_msgSend(v22, "copy");
  -[RCPlaybackSettingsSlider setRegularTrackPaths:](self, "setRegularTrackPaths:", v20);

  v21 = objc_msgSend(v8, "copy");
  -[RCPlaybackSettingsSlider setTintedTrackPaths:](self, "setTintedTrackPaths:", v21);

}

- (void)_hideDefaultSliderViews
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider _minTrackView](self, "_minTrackView"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingsSlider _maxTrackView](self, "_maxTrackView"));
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  float v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  -[RCPlaybackSettingsSlider valueForTickNumber:](self, "valueForTickNumber:", -[RCPlaybackSettingsSlider tickNumberForValue:](self, "tickNumberForValue:", a3));
  v7 = v6;
  -[RCPlaybackSettingsSlider value](self, "value");
  if (v7 != v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:", 0);
    objc_msgSend(v9, "prepare");
    *(float *)&v10 = v7;
    v15.receiver = self;
    v15.super_class = (Class)RCPlaybackSettingsSlider;
    -[RCPlaybackSettingsSlider setValue:animated:](&v15, "setValue:animated:", v4, v10);
    objc_msgSend(v9, "impactOccurred");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%g"), *(_QWORD *)&v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_SPEED_SLIDER_AX_VALUE"), &stru_1001B2BC0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11));

    -[RCPlaybackSettingsSlider setAccessibilityValue:](self, "setAccessibilityValue:", v14);
  }
}

- (CGRect)trackRect
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  int v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat MidY;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double MidX;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  -[RCPlaybackSettingsSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RCPlaybackSettingsSlider trackRectForBounds:](self, "trackRectForBounds:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v46 = v15;
  v18 = v17;
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  LODWORD(v40) = v19;
  -[RCPlaybackSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v40);
  v44 = v21;
  v45 = v20;
  v43 = v22;
  v24 = v23;
  -[RCPlaybackSettingsSlider maximumValue](self, "maximumValue");
  LODWORD(v41) = v25;
  -[RCPlaybackSettingsSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v46, v18, v41);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v47.origin.x = v45;
  v47.origin.y = v44;
  v47.size.width = v43;
  v47.size.height = v24;
  MidX = CGRectGetMidX(v47);
  v48.origin.x = v27;
  v48.origin.y = v29;
  v48.size.width = v31;
  v48.size.height = v33;
  v34 = CGRectGetMidX(v48);
  v49.origin.x = v45;
  v49.origin.y = v44;
  v49.size.width = v43;
  v49.size.height = v24;
  MidY = CGRectGetMidY(v49);
  v36 = v34 - MidX;
  v37 = v18;
  v38 = MidY - v18 * 0.5;
  v39 = v12 + (v46 - (v34 - MidX)) * 0.5;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v38;
  result.origin.x = v39;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)RCPlaybackSettingsSlider;
  -[RCPlaybackSettingsSlider trackRectForBounds:](&v16, "trackRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v9, "playbackSpeedSliderHeight");
  v11 = v10;

  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)tickNumberForValue:(double)a3
{
  double v5;
  double v6;
  float v7;
  float v8;

  -[RCPlaybackSettingsSlider offsetBetweenTicks](self, "offsetBetweenTicks");
  v6 = v5;
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  v8 = (a3 - v7) / v6;
  return vcvtas_u32_f32(v8);
}

- (double)valueForTickNumber:(unint64_t)a3
{
  double v5;
  double v6;
  float v7;

  -[RCPlaybackSettingsSlider offsetBetweenTicks](self, "offsetBetweenTicks");
  v6 = v5;
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  return v7 + (double)a3 * v6;
}

- (double)xPositionWithSelectedTickValue:(double)a3 forTrackRect:(CGRect)a4
{
  double width;
  double x;
  float v8;
  float v9;
  float v10;
  double v11;
  float v12;

  width = a4.size.width;
  x = a4.origin.x;
  -[RCPlaybackSettingsSlider maximumValue](self, "maximumValue", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v9 = v8;
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  v11 = width / (float)(v9 - v10);
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  return x + (a3 - v12) * v11;
}

- (double)offsetBetweenTicks
{
  float v3;
  float v4;
  float v5;

  -[RCPlaybackSettingsSlider maximumValue](self, "maximumValue");
  v4 = v3;
  -[RCPlaybackSettingsSlider minimumValue](self, "minimumValue");
  return (float)((float)(v4 - v5) / (float)(-[RCPlaybackSettingsSlider numberOfTicks](self, "numberOfTicks") - 1));
}

- (unint64_t)tickNumberForDefaultValue
{
  -[RCPlaybackSettingsSlider _defaultStartingValue](self, "_defaultStartingValue");
  return -[RCPlaybackSettingsSlider tickNumberForValue:](self, "tickNumberForValue:");
}

- (unint64_t)tickNumberForSelectedValue
{
  float v3;

  -[RCPlaybackSettingsSlider value](self, "value");
  return -[RCPlaybackSettingsSlider tickNumberForValue:](self, "tickNumberForValue:", v3);
}

- (unint64_t)numberOfTicks
{
  return 7;
}

- (double)_minimumValue
{
  return 0.5;
}

- (double)_maximumValue
{
  return 2.0;
}

- (double)_defaultStartingValue
{
  return 1.0;
}

- (NSArray)regularTickPaths
{
  return self->_regularTickPaths;
}

- (void)setRegularTickPaths:(id)a3
{
  objc_storeStrong((id *)&self->_regularTickPaths, a3);
}

- (NSArray)tintedTickPaths
{
  return self->_tintedTickPaths;
}

- (void)setTintedTickPaths:(id)a3
{
  objc_storeStrong((id *)&self->_tintedTickPaths, a3);
}

- (NSArray)regularTrackPaths
{
  return self->_regularTrackPaths;
}

- (void)setRegularTrackPaths:(id)a3
{
  objc_storeStrong((id *)&self->_regularTrackPaths, a3);
}

- (NSArray)tintedTrackPaths
{
  return self->_tintedTrackPaths;
}

- (void)setTintedTrackPaths:(id)a3
{
  objc_storeStrong((id *)&self->_tintedTrackPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedTrackPaths, 0);
  objc_storeStrong((id *)&self->_regularTrackPaths, 0);
  objc_storeStrong((id *)&self->_tintedTickPaths, 0);
  objc_storeStrong((id *)&self->_regularTickPaths, 0);
}

@end
