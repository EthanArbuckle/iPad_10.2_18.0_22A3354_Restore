@implementation MonthDayCellLayer

- (MonthDayCellLayer)initWithDateCache:(id)a3
{
  MonthDayCellLayer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  MonthWorkoutIndicator *v9;
  id v10;
  void *v11;
  void *v12;
  CGFloat v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)MonthDayCellLayer;
  v3 = -[MonthDayCellLayer initWithDateCache:](&v20, "initWithDateCache:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 16.0));
    -[MonthDayCellLayer setFont:](v3, "setFont:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer font](v3, "font"));
    -[MonthDayCellLayer setBoldFont:](v3, "setBoldFont:", v5);

    -[MonthDayCellLayer setDayDiameter:](v3, "setDayDiameter:", 25.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000D611C;
    v18[3] = &unk_100777E20;
    v8 = v3;
    v19 = v8;
    objc_msgSend(v7, "performAsCurrentTraitCollection:", v18);

    v9 = objc_alloc_init(MonthWorkoutIndicator);
    v10 = v8[1];
    v8[1] = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "scale");
    objc_msgSend(v8[1], "setContentsScale:");

    objc_msgSend(v8[1], "setHasWorkout:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle"));
    objc_msgSend(v12, "frame");
    v13 = CGRectGetMaxX(v21) + 4.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle"));
    objc_msgSend(v14, "frame");
    objc_msgSend(v8[1], "setFrame:", v13, CGRectGetMaxY(v22) + 1.0, 6.0, 6.0);

    v15 = v8[1];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "circle"));
    objc_msgSend(v8, "insertSublayer:below:", v15, v16);

  }
  return v3;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MonthDayCellLayer;
  v6 = a3;
  -[MonthDayCellLayer updateWithDate:dayOfMonth:](&v12, "updateWithDate:dayOfMonth:", v6, a4);
  self->_dayOfMonth = a4;
  -[MonthDayCellLayer setHasWorkout:](self, "setHasWorkout:", self->_hasWorkout, v12.receiver, v12.super_class);
  -[MonthDayCellLayer setupCircleBackground](self, "setupCircleBackground");
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer dateCache](self, "dateCache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startOfDayMidnight"));
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  self->_isFutureDay = v8 > v11;

}

- (void)setHasWorkout:(BOOL)a3
{
  void *v4;
  void *v5;
  int64_t dayOfMonth;
  void *v7;
  _QWORD v8[5];

  self->_hasWorkout = a3;
  -[MonthWorkoutIndicator setHasWorkout:](self->_workoutIndicator, "setHasWorkout:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D6338;
  v8[3] = &unk_100777E20;
  v8[4] = self;
  objc_msgSend(v5, "performAsCurrentTraitCollection:", v8);

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  dayOfMonth = self->_dayOfMonth;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer textColor](self, "textColor"));
  -[MonthDayCellLayer updateDateTextForDayNumber:textColor:](self, "updateDateTextForDayNumber:textColor:", dayOfMonth, v7);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)setupCircleBackground
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[MonthDayCellLayer representsToday](self, "representsToday") ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer circle](self, "circle"));
  objc_msgSend(v4, "setHidden:", v3);

  if ((-[MonthDayCellLayer representsToday](self, "representsToday") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nonGradientTextColor"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer circle](self, "circle"));
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

}

- (void)pressToTransition:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.3);
  if ((-[MonthDayCellLayer representsToday](self, "representsToday") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayCellLayer circle](self, "circle"));
    objc_msgSend(v5, "setHidden:", !v3);

  }
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setPercentMinimized:(double)a3
{
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  CGRect v9;
  CGRect v10;

  y = self->_fullFrame.origin.y;
  width = self->_fullFrame.size.width;
  height = self->_fullFrame.size.height;
  v7 = self->_fullFrame.origin.x + (self->_narrowFrame.origin.x - self->_fullFrame.origin.x) * a3;
  -[MonthDayCellLayer setFrame:](self, "setFrame:", v7, y, width, height);
  v9.origin.x = v7;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  v8 = CGRectGetWidth(v9) + 4.0;
  v10.origin.x = v7;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[MonthWorkoutIndicator setFrame:](self->_workoutIndicator, "setFrame:", v8, CGRectGetHeight(v10) + 1.0, 6.0, 6.0);
}

- (BOOL)cellMinimized
{
  return self->_cellMinimized;
}

- (void)setCellMinimized:(BOOL)a3
{
  self->_cellMinimized = a3;
}

- (BOOL)isFutureDay
{
  return self->_isFutureDay;
}

- (void)setIsFutureDay:(BOOL)a3
{
  self->_isFutureDay = a3;
}

- (BOOL)hasWorkout
{
  return self->_hasWorkout;
}

- (CGRect)fullFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullFrame.origin.x;
  y = self->_fullFrame.origin.y;
  width = self->_fullFrame.size.width;
  height = self->_fullFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFullFrame:(CGRect)a3
{
  self->_fullFrame = a3;
}

- (CGRect)narrowFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_narrowFrame.origin.x;
  y = self->_narrowFrame.origin.y;
  width = self->_narrowFrame.size.width;
  height = self->_narrowFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNarrowFrame:(CGRect)a3
{
  self->_narrowFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutIndicator, 0);
}

@end
