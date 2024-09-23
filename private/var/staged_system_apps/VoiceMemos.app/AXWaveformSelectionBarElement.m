@implementation AXWaveformSelectionBarElement

- (BOOL)isWaveformOverview
{
  void *v2;
  void *v3;
  BOOL v5;

  v5 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "safeValueForKey:", CFSTR("_isOverView")));
  objc_msgSend(v3, "getValue:", &v5);

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  char v11;

  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeValueForKey:", CFSTR("_insertMode")));
  objc_msgSend(v4, "getValue:", &v11);

  if (v11)
  {
    if (-[AXWaveformSelectionBarElement adjustsStartTime](self, "adjustsStartTime"))
    {
      v5 = CFSTR("WAVEFORM_SELECTION_START_TIME_BAR");
      v6 = CFSTR("Selection start time changed, AX label");
    }
    else
    {
      v5 = CFSTR("WAVEFORM_SELECTION_END_TIME_BAR");
      v6 = CFSTR("Selection end time, AX label");
    }
  }
  else
  {
    v7 = -[AXWaveformSelectionBarElement isWaveformOverview](self, "isWaveformOverview");
    v8 = -[AXWaveformSelectionBarElement adjustsStartTime](self, "adjustsStartTime");
    if (v7)
    {
      if (v8)
      {
        v5 = CFSTR("AX_TRIM_OVERVIEW_WAVEFORM_START");
        v6 = CFSTR("Trim start, AX label");
      }
      else
      {
        v5 = CFSTR("AX_TRIM_OVERVIEW_WAVEFORM_END");
        v6 = CFSTR("Trim end, AX label");
      }
    }
    else if (v8)
    {
      v5 = CFSTR("AX_TRIM_DETAIL_WAVEFORM_START");
      v6 = CFSTR("Trim start, detailed waveform, AX label");
    }
    else
    {
      v5 = CFSTR("AX_TRIM_DETAIL_WAVEFORM_END");
      v6 = CFSTR("Trim end, detailed waveform, AX label");
    }
  }
  v9 = RCLocalizedFrameworkString(v5, v6);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

- (id)accessibilityHint
{
  return (id)RCLocalizedFrameworkString(CFSTR("WAVEFORM_SELECTION_HINT"), CFSTR("Waveform AX hint"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  double *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer", 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeValueForKey:", CFSTR("_selectedTimeRange")));
  objc_msgSend(v4, "getValue:", &v8);

  if (-[AXWaveformSelectionBarElement adjustsStartTime](self, "adjustsStartTime"))
    v5 = (double *)&v8;
  else
    v5 = (double *)&v9;
  v6 = UIAXTimeStringForDuration(*v5);
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (CGRect)accessibilityFrame
{
  void *v4;
  Class v5;
  char isKindOfClass;
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
  void *v17;
  void *v18;
  float v19;
  float v20;
  double MaxX;
  UIView *v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v5 = NSClassFromString(CFSTR("RCWaveformSelectionOverlay"));
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCWaveformSelectionOverlay.m"), 1287, CFSTR("Unexpected class for container of waveform selection bar: %@"), v32);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeValueForKey:", CFSTR("_selectionRect")));
  objc_msgSend(v8, "CGRectValue");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "safeValueForKey:", CFSTR("_xAdjustmentAmount")));
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  if (-[AXWaveformSelectionBarElement adjustsStartTime](self, "adjustsStartTime"))
  {
    v33.origin.x = v10;
    v33.origin.y = v12;
    v33.size.width = v14;
    v33.size.height = v16;
    MaxX = CGRectGetMinX(v33) + v20;
  }
  else
  {
    v34.origin.x = v10;
    v34.origin.y = v12;
    v34.size.width = v14;
    v34.size.height = v16;
    MaxX = CGRectGetMaxX(v34);
  }
  v22 = (UIView *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v35.size.width = 10.0;
  v35.origin.x = MaxX;
  v35.origin.y = v12;
  v35.size.height = v16;
  v36 = UIAccessibilityConvertFrameToScreenCoordinates(v35, v22);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXWaveformSelectionBarElement;
  return UIAccessibilityTraitAdjustable | -[AXWaveformSelectionBarElement accessibilityTraits](&v3, "accessibilityTraits");
}

- (void)_accessibilityIncreaseValue:(BOOL)a3 isThreeFingerScroll:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIAccessibilityNotifications v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  v4 = a4;
  v5 = a3;
  v41 = 0.0;
  v42 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeValueForKey:", CFSTR("_selectedTimeRange")));
  objc_msgSend(v8, "getValue:", &v41);

  v10 = v41;
  v9 = v42;
  v40 = 0.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeValueForKey:", CFSTR("_assetDuration")));
  objc_msgSend(v12, "getValue:", &v40);

  v13 = -[AXWaveformSelectionBarElement isWaveformOverview](self, "isWaveformOverview");
  v14 = 10.0;
  v15 = 6.0;
  if (!v13)
  {
    v15 = 10.0;
    v14 = 20.0;
  }
  if (v4)
    v14 = v15;
  v16 = v40 / v14;
  v17 = -[AXWaveformSelectionBarElement adjustsStartTime](self, "adjustsStartTime");
  if (v5)
  {
    if (v17)
    {
      v18 = 0.0;
      if (v10 + v16 >= 0.0)
      {
        v18 = v10 + v16;
        if (v10 + v16 >= v9)
          v18 = v9;
      }
LABEL_13:
      v19 = RCTimeRangeMake(v18, v9);
      v21 = v20;
      v22 = 0;
      v23 = 1;
      goto LABEL_21;
    }
    v24 = v40;
    if (v9 + v16 <= v40)
      v24 = v9 + v16;
  }
  else
  {
    if (v17)
    {
      v18 = v10 - v16;
      if (v10 - v16 < 0.0)
        v18 = 0.0;
      goto LABEL_13;
    }
    v24 = v40;
    if (v9 - v16 <= v40)
    {
      v24 = v9 - v16;
      if (v9 - v16 <= v10)
        v24 = v10;
    }
  }
  v19 = RCTimeRangeMake(v10, v24);
  v21 = v25;
  v23 = 0;
  v22 = 1;
LABEL_21:
  if ((RCTimeRangeEqualToTimeRange(v41, v42, v19, v21) & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "safeValueForKey:", CFSTR("_delegate")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
    objc_msgSend(v27, "waveformSelectionOverlay:willChangeSelectedTimeRange:isTrackingMin:isTrackingMax:", v28, v23, v22, v19, v21);
    v30 = v29;
    v32 = v31;

    if (v30 >= 0.0 && v32 <= v40)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
      objc_msgSend(v34, "setSelectedTimeRange:", v30, v32);

    }
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "safeValueForKey:", CFSTR("_delegate")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityContainer](self, "accessibilityContainer"));
  objc_msgSend(v36, "waveformSelectionOverlay:didFinishTrackingSelectionBeginTime:endTime:assetCurrentTime:", v37, v23, v22, 0);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  v38 = UIAccessibilityAnnouncementNotification;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AXWaveformSelectionBarElement accessibilityValue](self, "accessibilityValue"));
  UIAccessibilityPostNotification(v38, v39);

}

- (void)accessibilityIncrement
{
  -[AXWaveformSelectionBarElement _accessibilityIncreaseValue:isThreeFingerScroll:](self, "_accessibilityIncreaseValue:isThreeFingerScroll:", 1, 0);
}

- (void)accessibilityDecrement
{
  -[AXWaveformSelectionBarElement _accessibilityIncreaseValue:isThreeFingerScroll:](self, "_accessibilityIncreaseValue:isThreeFingerScroll:", 0, 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;

  v5 = 0;
  if (a3 == 3)
    goto LABEL_4;
  if (a3 == 4)
  {
    v5 = 1;
LABEL_4:
    -[AXWaveformSelectionBarElement _accessibilityIncreaseValue:isThreeFingerScroll:](self, "_accessibilityIncreaseValue:isThreeFingerScroll:", v5, 1, v3, v4);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)adjustsStartTime
{
  return self->_adjustsStartTime;
}

- (void)setAdjustsStartTime:(BOOL)a3
{
  self->_adjustsStartTime = a3;
}

@end
