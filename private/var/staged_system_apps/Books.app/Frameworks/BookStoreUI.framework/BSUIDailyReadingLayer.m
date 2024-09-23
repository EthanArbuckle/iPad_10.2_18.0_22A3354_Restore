@implementation BSUIDailyReadingLayer

- (void)dealloc
{
  objc_super v3;

  -[TUIDynamicProgress unregisterProgressObserver:](self->_dynamicProgress, "unregisterProgressObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIDailyReadingLayer;
  -[BSUIDailyReadingLayer dealloc](&v3, "dealloc");
}

- (void)configureWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5
{
  CGSize size;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TUIDynamicProgress *dynamicProgress;
  id v17;
  void *v18;
  id v19;
  int64_t v20;
  id v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_storeStrong((id *)&self->_metrics, a3);
  self->_timeTextYOffset = a4;
  size = CGRectZero.size;
  self->_workingRect.origin = CGRectZero.origin;
  self->_workingRect.size = size;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "triggerName"));

  if (!v10)
  {
    self->_lastTriggerState = 2;
    -[BSUIDailyReadingLayer _updateProgressNoAnimation](self, "_updateProgressNoAnimation");
  }
  if (-[BSUIDailyReadingMetrics clockTicks](self->_metrics, "clockTicks"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dynamicRegistry"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingTimeToday kind](BCReadingTimeToday, "kind"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "progressProviderForKind:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dynamicProgressForKind:instance:parameters:", v13, 0, 0));
    objc_msgSend(v15, "registerProgressObserver:", self);
    dynamicProgress = self->_dynamicProgress;
    self->_dynamicProgress = (TUIDynamicProgress *)v15;
    v17 = v15;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "progress"));
    v19 = objc_msgSend(v18, "integerValue");

    v20 = -[BSUIDailyReadingLayer dynamicTimeReadToday](self, "dynamicTimeReadToday");
    if ((uint64_t)v19 <= v20)
      v21 = (id)v20;
    else
      v21 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));

    -[BSUIDailyReadingLayer setOverrideReadingTimeToday:](self, "setOverrideReadingTimeToday:", v22);
  }

}

- (void)configureWithSublayers:(id)a3
{
  NSArray *textSublayers;
  NSArray *symbolImageSublayers;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  NSArray *v19;

  v14 = a3;
  textSublayers = self->_textSublayers;
  if (textSublayers)
    -[NSArray enumerateObjectsUsingBlock:](textSublayers, "enumerateObjectsUsingBlock:", &stru_2E5898);
  symbolImageSublayers = self->_symbolImageSublayers;
  if (symbolImageSublayers)
    -[NSArray enumerateObjectsUsingBlock:](symbolImageSublayers, "enumerateObjectsUsingBlock:", &stru_2E58B8);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = objc_alloc_init((Class)NSMutableArray);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3DD40;
  v17[3] = &unk_2E58E0;
  v8 = v6;
  v18 = v8;
  v9 = (NSArray *)v7;
  v19 = v9;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);
  objc_storeStrong((id *)&self->_textSublayers, v6);
  v10 = self->_symbolImageSublayers;
  self->_symbolImageSublayers = v9;
  v11 = v9;

  -[BSUIDailyReadingLayer _setupDailyReading](self, "_setupDailyReading");
  if (-[BSUIDailyReadingLayer _isVisible](self, "_isVisible"))
    -[BSUIDailyReadingLayer _animateProgressTodayIfNeededHonoringDelay:](self, "_animateProgressTodayIfNeededHonoringDelay:", 1);
  v12 = self->_textSublayers;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3DDA8;
  v16[3] = &unk_2E5908;
  v16[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v16);
  v13 = self->_symbolImageSublayers;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3DDF4;
  v15[3] = &unk_2E5908;
  v15[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v15);

}

- (double)_actualReadingTimeSeconds
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer overrideReadingTimeToday](self, "overrideReadingTimeToday"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actualReadingTimeSeconds"));
    objc_msgSend(v8, "floatValue");
    v6 = v9;

  }
  return v6;
}

- (double)_calculatedProgress
{
  uint64_t v3;
  double v4;
  double v5;

  v3 = -[BSUIDailyReadingLayer dynamicStreakDayGoal](self, "dynamicStreakDayGoal");
  if (v3 < 1)
    return 0.0;
  v4 = (double)v3;
  -[BSUIDailyReadingLayer _actualReadingTimeSeconds](self, "_actualReadingTimeSeconds");
  return v5 / v4;
}

- (double)_visibleOrActualProgress
{
  void *v3;
  void *v4;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastVisibleProgressToday"));

  if (v4)
    -[BSUIDailyReadingLayer visibleProgressToday](self, "visibleProgressToday");
  else
    -[BSUIDailyReadingLayer _calculatedProgress](self, "_calculatedProgress");
  return result;
}

- (BOOL)_goalCompleted
{
  double v3;

  -[BSUIDailyReadingLayer _actualReadingTimeSeconds](self, "_actualReadingTimeSeconds");
  return v3 >= (double)-[BSUIDailyReadingLayer dynamicStreakDayGoal](self, "dynamicStreakDayGoal");
}

- (CGRect)workingRect
{
  CGRect *p_workingRect;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_workingRect = &self->_workingRect;
  if (CGRectIsEmpty(self->_workingRect))
  {
    -[BSUIDailyReadingLayer _workingInsetRect](self, "_workingInsetRect");
    p_workingRect->origin.x = x;
    p_workingRect->origin.y = y;
    p_workingRect->size.width = width;
    p_workingRect->size.height = height;
  }
  else
  {
    x = p_workingRect->origin.x;
    y = p_workingRect->origin.y;
    width = p_workingRect->size.width;
    height = p_workingRect->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_workingInsetRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v24;
  unsigned int v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
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
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  -[BSUIDailyReadingLayer frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progressBarWidth"));
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arcWidth"));
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  if (v18 > 0.0)
  {
    v19 = v18;
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    if (CGRectGetWidth(v40) > v19)
      v8 = v19;
  }
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  v42 = CGRectInset(v41, v14 * 0.5, v14 * 0.5);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v25 = objc_msgSend(v24, "iconMode");

  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  if (v25)
  {
    v30 = CGRectGetWidth(*(CGRect *)&v26);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v31 = CGRectGetHeight(v43);
  }
  else
  {
    v32 = CGRectGetHeight(*(CGRect *)&v26);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v33 = CGRectGetWidth(v44) * 0.5;
    if (v32 < v33)
      v33 = v32;
    v30 = v14 + v33 * 2.0;
    v31 = v33 + v14;
  }
  -[BSUIDailyReadingLayer frame](self, "frame");
  v34 = CGRectGetWidth(v45);
  v35 = v34;
  v36 = 0.0;
  if (v25)
  {
    -[BSUIDailyReadingLayer frame](self, "frame", v34, 0.0);
    v36 = (CGRectGetHeight(v46) - v31) * 0.5;
  }
  v37 = (v35 - v30) * 0.5;
  v38 = v30;
  v39 = v31;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v36;
  result.origin.x = v37;
  return result;
}

- (double)_endCapHeight
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progressBarWidth"));
  objc_msgSend(v3, "floatValue");
  v5 = v4 * 0.5;

  return v5;
}

- (void)_updateArcLayer:(id)a3 color:(id)a4 percent:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidY;
  double MaxY;
  double v33;
  double MidX;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  CGRect v46;

  v8 = a4;
  v9 = a3;
  -[BSUIDailyReadingLayer workingRect](self, "workingRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "progressBarWidth"));
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v23 = objc_msgSend(v22, "iconMode");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightToLeft"));
  v26 = objc_msgSend(v25, "BOOLValue");

  v27 = v11;
  v28 = v13;
  v29 = v15;
  v30 = v17;
  if (v23)
  {
    MidY = CGRectGetMidY(*(CGRect *)&v27);
  }
  else
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v27);
    -[BSUIDailyReadingLayer _endCapHeight](self, "_endCapHeight");
    MidY = MaxY - v33;
  }
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  MidX = CGRectGetMidX(v46);
  v35 = -1.57079633;
  if (v26)
    v36 = 4.71238898;
  else
    v36 = -1.57079633;
  if (!v26)
    v35 = 4.71238898;
  v37 = -3.14159265;
  if (v26)
    v38 = -6.28318531;
  else
    v38 = -3.14159265;
  if (!v26)
    v37 = 0.0;
  if (v23)
    v39 = v35;
  else
    v39 = v37;
  if (!v23)
    v36 = v38;
  v40 = v21;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v26 ^ 1, MidX, MidY, (v15 - v40) * 0.5, v36, v39, v38));
  v42 = objc_retainAutorelease(v8);
  v43 = objc_msgSend(v42, "CGColor");

  objc_msgSend(v9, "setStrokeColor:", v43);
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v9, "setFillColor:", objc_msgSend(v44, "CGColor"));

  objc_msgSend(v9, "setBounds:", v11, v13, v15, v17);
  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v9, "setLineWidth:", v40);
  objc_msgSend(v9, "setLineCap:", kCALineCapRound);
  objc_msgSend(v9, "setStrokeStart:", 0.0);
  objc_msgSend(v9, "setStrokeEnd:", a5);
  objc_msgSend(v9, "setZPosition:", 1.0);
  v45 = objc_retainAutorelease(v41);
  objc_msgSend(v9, "setPath:", objc_msgSend(v45, "CGPath"));

}

- (void)_animateArcLayer:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    -[BSUIDailyReadingLayer _calculatedProgress](self, "_calculatedProgress");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer progressArcLayer](self, "progressArcLayer"));
    objc_msgSend(v7, "setStrokeEnd:", v6);

    v10 = (id)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
    objc_msgSend(v10, "setMass:", 1.0);
    objc_msgSend(v10, "setStiffness:", 55.0);
    objc_msgSend(v10, "setDamping:", 15.0);
    objc_msgSend(v10, "setInitialVelocity:", 0.0);
    -[BSUIDailyReadingLayer _visibleOrActualProgress](self, "_visibleOrActualProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v10, "setFromValue:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    objc_msgSend(v10, "setToValue:", v9);

    objc_msgSend(v10, "settlingDuration");
    objc_msgSend(v10, "setDuration:");
    objc_msgSend(v4, "addAnimation:forKey:", v10, CFSTR("strokeEnd"));

    -[BSUIDailyReadingLayer setVisibleProgressToday:](self, "setVisibleProgressToday:", v6);
  }
}

- (void)_backgroundArc
{
  void *v3;
  void *v4;
  void *v5;
  CAShapeLayer *backgroundArcLayer;
  CGColor *v7;
  id v8;
  CAShapeLayer *v9;
  CAShapeLayer *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "controlColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedColorWithTraitCollection:", v13));

  backgroundArcLayer = self->_backgroundArcLayer;
  if (backgroundArcLayer)
  {
    v7 = -[CAShapeLayer strokeColor](backgroundArcLayer, "strokeColor");
    v8 = objc_retainAutorelease(v5);
    if (!CGColorEqualToColor(v7, (CGColorRef)objc_msgSend(v8, "CGColor")))
      -[CAShapeLayer setStrokeColor:](self->_backgroundArcLayer, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
  }
  else
  {
    v9 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v10 = self->_backgroundArcLayer;
    self->_backgroundArcLayer = v9;

    -[BSUIDailyReadingLayer _updateArcLayer:color:percent:](self, "_updateArcLayer:color:percent:", self->_backgroundArcLayer, v5, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundArcLayer](self, "backgroundArcLayer"));
    objc_msgSend(v11, "addSublayer:", v12);

  }
}

- (void)_progressArc
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CAShapeLayer *progressArcLayer;
  CGColor *v8;
  id v9;
  double v10;
  CAShapeLayer *v11;
  CAShapeLayer *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progressColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedColorWithTraitCollection:", v15));

  -[BSUIDailyReadingLayer _visibleOrActualProgress](self, "_visibleOrActualProgress");
  progressArcLayer = self->_progressArcLayer;
  if (progressArcLayer)
  {
    v8 = -[CAShapeLayer strokeColor](progressArcLayer, "strokeColor");
    v9 = objc_retainAutorelease(v5);
    if (!CGColorEqualToColor(v8, (CGColorRef)objc_msgSend(v9, "CGColor")))
      -[CAShapeLayer setStrokeColor:](self->_progressArcLayer, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
  }
  else
  {
    v10 = v6;
    v11 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v12 = self->_progressArcLayer;
    self->_progressArcLayer = v11;

    -[BSUIDailyReadingLayer _updateArcLayer:color:percent:](self, "_updateArcLayer:color:percent:", self->_progressArcLayer, v5, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundArcLayer](self, "backgroundArcLayer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer progressArcLayer](self, "progressArcLayer"));
    objc_msgSend(v13, "addSublayer:", v14);

  }
}

- (void)_updateProgressNoAnimation
{
  double v3;
  double v4;
  id v5;

  -[BSUIDailyReadingLayer _calculatedProgress](self, "_calculatedProgress");
  v4 = v3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer progressArcLayer](self, "progressArcLayer"));
  objc_msgSend(v5, "setStrokeEnd:", v4);

}

- (id)titleLayer
{
  void *v3;

  if ((char *)-[NSArray count](self->_textSublayers, "count") == (char *)&dword_0 + 3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_textSublayers, "objectAtIndexedSubscript:", 0));
  else
    v3 = 0;
  return v3;
}

- (id)hiddenTimeLayer
{
  void *v3;

  if ((char *)-[NSArray count](self->_textSublayers, "count") == (char *)&dword_0 + 3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_textSublayers, "objectAtIndexedSubscript:", 1));
  else
    v3 = 0;
  return v3;
}

- (id)detailLayer
{
  void *v3;

  if ((char *)-[NSArray count](self->_textSublayers, "count") == (char *)&dword_0 + 3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_textSublayers, "objectAtIndexedSubscript:", 2));
  else
    v3 = 0;
  return v3;
}

- (void)_setupGoalArtwork
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MidY;
  double Height;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  id v33;
  void *v34;
  BSUIMicaFileProvider *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat rect;
  _OWORD rect_8[8];
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer awardImageLayer](self, "awardImageLayer"));
  objc_msgSend(v3, "removeFromSuperlayer");

  -[BSUIDailyReadingLayer setAwardImageLayer:](self, "setAwardImageLayer:", 0);
  -[BSUIDailyReadingLayer workingRect](self, "workingRect");
  rect = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
  v12 = *(_OWORD *)&CATransform3DIdentity.m33;
  rect_8[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  rect_8[5] = v12;
  v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  rect_8[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  rect_8[7] = v13;
  v14 = *(_OWORD *)&CATransform3DIdentity.m13;
  rect_8[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  rect_8[1] = v14;
  v15 = *(_OWORD *)&CATransform3DIdentity.m23;
  rect_8[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  rect_8[3] = v15;
  objc_msgSend(v11, "setTransform:", rect_8);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v60.origin.x = v18;
  v60.origin.y = v20;
  v60.size.width = v22;
  v60.size.height = v24;
  MidY = CGRectGetMidY(v60);
  v61.origin.x = v18;
  v61.origin.y = v20;
  v61.size.width = v22;
  v61.size.height = v24;
  Height = CGRectGetHeight(v61);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  if (objc_msgSend(v27, "isAX"))
    v28 = 22.0;
  else
    v28 = 16.0;

  v29 = Height - v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  if (objc_msgSend(v30, "isAX"))
    v31 = 4.0;
  else
    v31 = 2.0;

  v62.origin.x = rect;
  v62.origin.y = v6;
  v62.size.width = v8;
  v62.size.height = v10;
  v32 = CGRectGetMidX(v62) - v29 * 0.5;
  v33 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v33, "setFrame:", v32, MidY - v29 * 0.5 - v31, v29, v29);
  -[BSUIDailyReadingLayer setAwardImageLayer:](self, "setAwardImageLayer:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));
  objc_msgSend(v34, "addSublayer:", v33);

  v35 = objc_alloc_init(BSUIMicaFileProvider);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
  if (v36)
  {

LABEL_10:
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
    objc_msgSend(v40, "removeFromSuperlayer");

    v41 = objc_msgSend(objc_alloc((Class)TUIMicaPlayer), "initWithPath:retinaScale:fileProvider:", CFSTR("/mica/ic_ReadingMeter-Checkmark_58_v4~AMH.caar"), v35, 1.0);
    -[BSUIDailyReadingLayer setMicaPlayer:](self, "setMicaPlayer:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "opacity"));
    objc_msgSend(v43, "floatValue");
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "rootLayer"));
    LODWORD(v48) = v45;
    objc_msgSend(v47, "setOpacity:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer awardImageLayer](self, "awardImageLayer"));
    objc_msgSend(v49, "addToLayer:onTop:gravity:", v50, 1, CFSTR("resize"));

    goto LABEL_11;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
  v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("/mica/ic_ReadingMeter-Checkmark_58_v4~AMH.caar"));

  if ((v39 & 1) == 0)
    goto LABEL_10;
LABEL_11:
  if (-[BSUIDailyReadingLayer _goalCompleted](self, "_goalCompleted"))
  {
    -[BSUIDailyReadingLayer _visibleOrActualProgress](self, "_visibleOrActualProgress");
    if (v51 >= 1.0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
      objc_msgSend(v52, "documentDuration");
      v54 = v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));
      objc_msgSend(v55, "setPlaybackTime:", v54);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
      LODWORD(v57) = 0;
      objc_msgSend(v56, "setOpacity:", v57);

      -[BSUIDailyReadingLayer setGoalCompletedAnimationRequested:](self, "setGoalCompletedAnimationRequested:", 1);
    }
  }

}

- (void)_setupBackgroundWithDebugBounds:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CALayer *v6;
  CALayer *backgroundLayer;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));

  if (!v5)
  {
    v6 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v6;

  }
  -[BSUIDailyReadingLayer bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor")));
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

  if (v3)
  {
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor")));
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", objc_msgSend(v18, "CGColor"));

    -[CALayer setBorderWidth:](self->_backgroundLayer, "setBorderWidth:", 0.5);
  }
  -[CALayer setMasksToBounds:](self->_backgroundLayer, "setMasksToBounds:", 1);
  -[BSUIDailyReadingLayer addSublayer:](self, "addSublayer:", self->_backgroundLayer);
  -[BSUIDailyReadingLayer workingRect](self, "workingRect");
  -[BSUIDailyReadingLayer setLastWorkingRect:](self, "setLastWorkingRect:");
}

- (void)_checkEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  CGRect v28;
  CGRect v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axValue"));
    v6 = objc_msgSend(v5, "integerValue");

    v7 = -[BSUIDailyReadingLayer lastAXValue](self, "lastAXValue");
    v8 = v7 != (_QWORD)v6;
    if ((id)v7 != v6)
      -[BSUIDailyReadingLayer setLastAXValue:](self, "setLastAXValue:", v6);
    v9 = -[BSUIDailyReadingLayer dynamicStreakDayGoal](self, "dynamicStreakDayGoal");
    if ((void *)-[BSUIDailyReadingLayer lastGoals](self, "lastGoals") != v9)
    {
      if ((uint64_t)v9 >= 1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicProgress](self, "dynamicProgress"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "progress"));
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        -[BSUIDailyReadingLayer _actualReadingTimeSeconds](self, "_actualReadingTimeSeconds");
        if (v14 <= v13)
          v14 = v13;
        -[BSUIDailyReadingLayer setVisibleProgressToday:](self, "setVisibleProgressToday:", v14 / (double)(uint64_t)v9);
      }
      -[BSUIDailyReadingLayer setLastGoals:](self, "setLastGoals:", v9);
      v8 = 1;
    }
    -[BSUIDailyReadingLayer lastWorkingRect](self, "lastWorkingRect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[BSUIDailyReadingLayer workingRect](self, "workingRect");
    v29.origin.x = v23;
    v29.origin.y = v24;
    v29.size.width = v25;
    v29.size.height = v26;
    v28.origin.x = v16;
    v28.origin.y = v18;
    v28.size.width = v20;
    v28.size.height = v22;
    if (CGRectEqualToRect(v28, v29))
    {
      if (!v8)
        return;
    }
    else
    {
      -[BSUIDailyReadingLayer workingRect](self, "workingRect");
      -[BSUIDailyReadingLayer setLastWorkingRect:](self, "setLastWorkingRect:");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));
    objc_msgSend(v27, "removeFromSuperlayer");

    -[BSUIDailyReadingLayer setAwardImageLayer:](self, "setAwardImageLayer:", 0);
    -[BSUIDailyReadingLayer setProgressArcLayer:](self, "setProgressArcLayer:", 0);
    -[BSUIDailyReadingLayer setBackgroundArcLayer:](self, "setBackgroundArcLayer:", 0);
    -[BSUIDailyReadingLayer setDynamicTimeLayer:](self, "setDynamicTimeLayer:", 0);
    -[BSUIDailyReadingLayer setBackgroundLayer:](self, "setBackgroundLayer:", 0);
  }
}

- (void)_setupDailyReading
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  -[BSUIDailyReadingLayer _checkEnvironment](self, "_checkEnvironment");
  -[BSUIDailyReadingLayer _setupBackgroundWithDebugBounds:](self, "_setupBackgroundWithDebugBounds:", 0);
  -[BSUIDailyReadingLayer _backgroundArc](self, "_backgroundArc");
  -[BSUIDailyReadingLayer _progressArc](self, "_progressArc");
  -[BSUIDailyReadingLayer _setupDynamicTimeLayerWithDebugBounds:](self, "_setupDynamicTimeLayerWithDebugBounds:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer hiddenTimeLayer](self, "hiddenTimeLayer"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = objc_msgSend(v4, "iconMode");

  if ((v5 & 1) == 0)
    -[BSUIDailyReadingLayer _setupGoalArtwork](self, "_setupGoalArtwork");
}

- (BOOL)_isVisible
{
  unint64_t lastTriggerState;
  unsigned int v4;
  void *v5;

  lastTriggerState = self->_lastTriggerState;
  if ((-[BSUIDailyReadingLayer isHidden](self, "isHidden") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer superlayer](self, "superlayer"));
    v4 = objc_msgSend(v5, "isHidden") ^ 1;

  }
  if (lastTriggerState == 2)
    return v4;
  else
    return 0;
}

- (void)setVisibleProgressToday:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastVisibleProgressToday"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v4, "updateWithValueIfChanged:", v5);

}

- (double)visibleProgressToday
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  float v12;
  float v13;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastVisibleProgressToday"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = BUDynamicCast(v3, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  v10 = &off_2FB9A8;
  if (v8)
    v10 = (_UNKNOWN **)v8;
  v11 = v10;

  objc_msgSend(v11, "floatValue");
  v13 = v12;

  return v13;
}

- (int64_t)dynamicStreakDayGoal
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicStreakDayGoal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = BUDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readingGoalSeconds"));

  }
  v12 = objc_msgSend(v10, "integerValue");

  return (int64_t)v12;
}

- (int64_t)dynamicTimeReadToday
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  id v12;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicTimeReadToday"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = BUDynamicCast(v3, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  v10 = &off_2FB9A8;
  if (v8)
    v10 = (_UNKNOWN **)v8;
  v11 = v10;

  v12 = objc_msgSend(v11, "integerValue");
  return (int64_t)v12;
}

- (BOOL)dynamicCompletedReadingGoal
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  unsigned __int8 v12;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicCompletedReadingGoal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v7 = BUDynamicCast(v3, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  v10 = &off_2FB9A8;
  if (v8)
    v10 = (_UNKNOWN **)v8;
  v11 = v10;

  v12 = objc_msgSend(v11, "BOOLValue");
  return v12;
}

- (void)_setupDynamicTimeLayerWithDebugBounds:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  double timeTextYOffset;
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
  void *v22;
  _BSUIDynamicTimeLayer *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _UNKNOWN **v40;
  void *v41;
  float v42;
  void *v43;
  id v44;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v6 = objc_msgSend(v5, "iconMode");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeFontSpec"));
    v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));

    timeTextYOffset = self->_timeTextYOffset;
    objc_msgSend(v44, "capHeight");
    v11 = timeTextYOffset + v10;
    objc_msgSend(v44, "ascender");
    v13 = v11 - v12;
    objc_msgSend(v44, "ascender");
    v15 = v14;
    objc_msgSend(v44, "capHeight");
    v17 = (v15 - v16) * 0.5;
    objc_msgSend(v44, "ascender");
    v19 = v18;
    -[CALayer frame](self->_backgroundLayer, "frame");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));

    if (!v22)
    {
      v23 = objc_opt_new(_BSUIDynamicTimeLayer);
      -[BSUIDailyReadingLayer setDynamicTimeLayer:](self, "setDynamicTimeLayer:", v23);

    }
    v24 = v19 + v17 * 0.5;
    v25 = v13 + v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
    objc_msgSend(v27, "setMasksToBounds:", 1);
    if (v3)
    {
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor")));
      objc_msgSend(v27, "setBorderColor:", objc_msgSend(v28, "CGColor"));

      objc_msgSend(v27, "setBorderWidth:", 0.5);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v30 = objc_msgSend(v29, "useFontFallback");

    objc_msgSend(v27, "setFrame:", 0.0, v25, v21, v24);
    objc_msgSend(v27, "setBounds:", 0.0, v17, v21, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "timeFontSpec"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "font"));
    objc_msgSend(v27, "setFont:useFontFallback:", v33, v30);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "textColor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "resolvedColorWithTraitCollection:", v26));
    objc_msgSend(v27, "setColor:", v36);

    objc_msgSend(v27, "setHeight:", v24);
    objc_msgSend(v27, "setUseFontFallback:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "timeSeparator"));
    objc_msgSend(v27, "setTimeSeparator:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v40 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "contentsScale"));
    v41 = v40;
    if (!v40)
      v40 = &off_2FB9C0;
    objc_msgSend(v40, "floatValue");
    objc_msgSend(v27, "setContentsScale:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer backgroundLayer](self, "backgroundLayer"));
    objc_msgSend(v43, "addSublayer:", v27);

    -[BSUIDailyReadingLayer _setInitialTimeTextAnimate](self, "_setInitialTimeTextAnimate");
  }
}

- (int64_t)_readingTimeForVisibleOrActualProgress
{
  double v3;

  -[BSUIDailyReadingLayer _visibleOrActualProgress](self, "_visibleOrActualProgress");
  return llround(v3 * (double)-[BSUIDailyReadingLayer dynamicStreakDayGoal](self, "dynamicStreakDayGoal"));
}

- (void)_setInitialTimeTextAnimate
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  id v12;

  if (-[BSUIDailyReadingLayer _goalCompleted](self, "_goalCompleted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicProgress](self, "dynamicProgress"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progress"));
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    -[BSUIDailyReadingLayer _actualReadingTimeSeconds](self, "_actualReadingTimeSeconds");
    if (v7 <= v6)
      v8 = v6;
    else
      v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
    v10 = (uint64_t)v8;
    v12 = v9;
  }
  else
  {
    v11 = -[BSUIDailyReadingLayer _readingTimeForVisibleOrActualProgress](self, "_readingTimeForVisibleOrActualProgress");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
    v12 = v9;
    v10 = v11;
  }
  objc_msgSend(v9, "setReadingTime:animate:", v10, 0);

}

- (void)_updateTimeTextAnimate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer overrideReadingTimeToday](self, "overrideReadingTimeToday"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer overrideReadingTimeToday](self, "overrideReadingTimeToday"));
    v7 = objc_msgSend(v6, "integerValue");

    if (!-[BSUIDailyReadingLayer goalCompletedAnimationRequested](self, "goalCompletedAnimationRequested"))
    {
      if (-[BSUIDailyReadingLayer _goalCompleted](self, "_goalCompleted"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicProgress](self, "dynamicProgress"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "progress"));
        objc_msgSend(v9, "floatValue");
        v11 = v10;

        -[BSUIDailyReadingLayer _actualReadingTimeSeconds](self, "_actualReadingTimeSeconds");
        if (v12 <= v11)
          v13 = v11;
        else
          v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
        v15 = (uint64_t)v13;
        v17 = v14;
        v16 = 0;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer dynamicTimeLayer](self, "dynamicTimeLayer"));
        v17 = v14;
        v15 = (uint64_t)v7;
        v16 = v3;
      }
      objc_msgSend(v14, "setReadingTime:animate:", v15, v16);

    }
  }
}

- (void)_animateTimeTextFade
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3FB18;
  block[3] = &unk_2E4608;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_startMicaPlayer
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer micaPlayer](self, "micaPlayer"));

  if (v3)
  {
    v4 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3FE0C;
    block[3] = &unk_2E4608;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_animateProgressTodayIfNeededHonoringDelay:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  dispatch_time_t v13;
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  _QWORD *v18;
  _QWORD v19[5];

  v3 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_3FFE0;
  v19[3] = &unk_2E4608;
  v19[4] = self;
  v5 = objc_retainBlock(v19);
  -[BSUIDailyReadingLayer _visibleOrActualProgress](self, "_visibleOrActualProgress");
  v7 = v6;
  -[BSUIDailyReadingLayer _calculatedProgress](self, "_calculatedProgress");
  if (v7 != v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "triggerDelay"));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v3 && v12 > 0.0)
    {
      v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_400EC;
      block[3] = &unk_2E3F88;
      v18 = v5;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
      v14 = (void (**)(_QWORD))v18;
    }
    else
    {
      v14 = objc_retainBlock(v5);
      if (v14)
      {
        if (+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          v14[2](v14);
        }
        else
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_400F8;
          v15[3] = &unk_2E3F88;
          v14 = v14;
          v16 = v14;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

        }
      }
    }

  }
}

- (void)didAddLayerWithFeedControllerHost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[BSUIDailyReadingLayer setFeedControllerHost:](self, "setFeedControllerHost:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "triggerName"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggerStateManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "triggerName"));
    objc_msgSend(v7, "addObserver:forTrigger:", self, v9);

  }
}

- (void)willRemoveLayerWithFeedControllerHost:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "triggerName"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggerStateManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "triggerName"));
    objc_msgSend(v7, "removeObserver:forTrigger:", self, v9);

  }
  -[BSUIDailyReadingLayer setFeedControllerHost:](self, "setFeedControllerHost:", 0);

}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  self->_lastTriggerState = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
  v8 = objc_msgSend(v7, "targetTriggerState");
  if (a4 && v8 == (id)a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDailyReadingLayer metrics](self, "metrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "triggerName"));
    v11 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v11)
      -[BSUIDailyReadingLayer _animateProgressTodayIfNeededHonoringDelay:](self, "_animateProgressTodayIfNeededHonoringDelay:", 1);
  }
  else
  {

  }
}

- (void)dynamicProgressChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progress"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progress"));
    -[BSUIDailyReadingLayer setOverrideReadingTimeToday:](self, "setOverrideReadingTimeToday:", v5);

    if (-[BSUIDailyReadingLayer _isVisible](self, "_isVisible"))
    {
      if (!-[BSUIDailyReadingLayer goalCompletedAnimationRequested](self, "goalCompletedAnimationRequested"))
        -[BSUIDailyReadingLayer _animateProgressTodayIfNeededHonoringDelay:](self, "_animateProgressTodayIfNeededHonoringDelay:", 0);
    }
  }

}

- (BSUIDailyReadingMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (CALayer)awardImageLayer
{
  return self->_awardImageLayer;
}

- (void)setAwardImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_awardImageLayer, a3);
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (CAShapeLayer)backgroundArcLayer
{
  return self->_backgroundArcLayer;
}

- (void)setBackgroundArcLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundArcLayer, a3);
}

- (CAShapeLayer)progressArcLayer
{
  return self->_progressArcLayer;
}

- (void)setProgressArcLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressArcLayer, a3);
}

- (_BSUIDynamicTimeLayer)dynamicTimeLayer
{
  return self->_dynamicTimeLayer;
}

- (void)setDynamicTimeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicTimeLayer, a3);
}

- (NSArray)textSublayers
{
  return self->_textSublayers;
}

- (void)setTextSublayers:(id)a3
{
  objc_storeStrong((id *)&self->_textSublayers, a3);
}

- (NSArray)symbolImageSublayers
{
  return self->_symbolImageSublayers;
}

- (void)setSymbolImageSublayers:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageSublayers, a3);
}

- (int64_t)lastAXValue
{
  return self->_lastAXValue;
}

- (void)setLastAXValue:(int64_t)a3
{
  self->_lastAXValue = a3;
}

- (int64_t)lastGoals
{
  return self->_lastGoals;
}

- (void)setLastGoals:(int64_t)a3
{
  self->_lastGoals = a3;
}

- (CGRect)lastWorkingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastWorkingRect.origin.x;
  y = self->_lastWorkingRect.origin.y;
  width = self->_lastWorkingRect.size.width;
  height = self->_lastWorkingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastWorkingRect:(CGRect)a3
{
  self->_lastWorkingRect = a3;
}

- (TUIFeedControllerHosting)feedControllerHost
{
  return (TUIFeedControllerHosting *)objc_loadWeakRetained((id *)&self->_feedControllerHost);
}

- (void)setFeedControllerHost:(id)a3
{
  objc_storeWeak((id *)&self->_feedControllerHost, a3);
}

- (TUIMicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_micaPlayer, a3);
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (NSNumber)overrideReadingTimeToday
{
  return self->_overrideReadingTimeToday;
}

- (void)setOverrideReadingTimeToday:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)goalCompletedAnimationRequested
{
  return self->_goalCompletedAnimationRequested;
}

- (void)setGoalCompletedAnimationRequested:(BOOL)a3
{
  self->_goalCompletedAnimationRequested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideReadingTimeToday, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_micaPlayer, 0);
  objc_destroyWeak((id *)&self->_feedControllerHost);
  objc_storeStrong((id *)&self->_symbolImageSublayers, 0);
  objc_storeStrong((id *)&self->_textSublayers, 0);
  objc_storeStrong((id *)&self->_dynamicTimeLayer, 0);
  objc_storeStrong((id *)&self->_progressArcLayer, 0);
  objc_storeStrong((id *)&self->_backgroundArcLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_awardImageLayer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
