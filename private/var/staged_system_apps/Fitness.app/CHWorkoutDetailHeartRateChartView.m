@implementation CHWorkoutDetailHeartRateChartView

- (CHWorkoutDetailHeartRateChartView)initWithChartType:(unint64_t)a3
{
  CHWorkoutDetailHeartRateChartView *v4;
  CHWorkoutDetailHeartRateChartView *v5;
  FIUIChartView *v6;
  FIUIChartView *chartView;
  FIUIChartDashedBackgroundView *v8;
  FIUIChartDashedBackgroundView *backgroundView;
  FIUIChartDashedBackgroundView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __objc2_class **v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  FIUIChartFloatingBarSeries *v24;
  FIUIChartFloatingBarSeries *heartRateBarSeries;
  FIUIChartFloatingBarSeries *v26;
  FIUIChartFloatingBarSeries *v27;
  void *v28;
  void *v29;
  FIUIChartFloatingBarSeries *v30;
  void *v31;
  void *v32;
  void *v34;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v35.receiver = self;
  v35.super_class = (Class)CHWorkoutDetailHeartRateChartView;
  v4 = -[CHWorkoutDetailHeartRateChartView initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_chartType = a3;
    v6 = (FIUIChartView *)objc_msgSend(objc_alloc((Class)FIUIChartView), "initWithDateInterval:", 0);
    chartView = v5->_chartView;
    v5->_chartView = v6;

    -[FIUIChartView setDataSource:](v5->_chartView, "setDataSource:", v5);
    -[FIUIChartView setContentBufferEdgeInsets:](v5->_chartView, "setContentBufferEdgeInsets:", -10.0, 0.0, -10.0, 0.0);
    -[CHWorkoutDetailHeartRateChartView addSubview:](v5, "addSubview:", v5->_chartView);
    v8 = (FIUIChartDashedBackgroundView *)objc_alloc_init((Class)FIUIChartDashedBackgroundView);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v8;

    -[FIUIChartDashedBackgroundView setLineInsets:](v5->_backgroundView, "setLineInsets:", 0.0, 0.0, 2.0, 0.0);
    -[FIUIChartDashedBackgroundView setNumLines:](v5->_backgroundView, "setNumLines:", 3);
    -[FIUIChartDashedBackgroundView setDirection:](v5->_backgroundView, "setDirection:", 1);
    v10 = v5->_backgroundView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.15));
    -[FIUIChartDashedBackgroundView setColor:](v10, "setColor:", v11);

    -[FIUIChartView setBackgroundView:](v5->_chartView, "setBackgroundView:", v5->_backgroundView);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleCaption1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fu_fontWithStraightSidedNumbers"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.301960784, 0.301960784, 0.301960784, 1.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors heartRateColors](ARUIMetricColors, "heartRateColors"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nonGradientTextColor"));

    v17 = off_100776600;
    if (a3)
      v17 = off_100776608;
    v18 = objc_alloc_init(*v17);
    objc_msgSend(v18, "setHighlightedLabelColor:", v14);
    objc_msgSend(v18, "setUnhighlightedLabelColor:", v14);
    v34 = (void *)v16;
    objc_msgSend(v18, "setHighlightedSubLabelColor:", v16);
    objc_msgSend(v18, "setUnhighlightedSubLabelColor:", v16);
    objc_msgSend(v18, "setTextStyle:", 2);
    objc_msgSend(v18, "setTimeInterval:", 0);
    objc_msgSend(v18, "setSubTimeInterval:", 0);
    objc_msgSend(v18, "setSubLabelAlignment:", 1);
    objc_msgSend(v18, "setLabelFont:", v13);
    objc_msgSend(v18, "setForceAMPMOnFirstLabel:", 1);
    objc_msgSend(v18, "setHideClippedLabels:", 1);
    v19 = objc_alloc_init((Class)FIUIChartDateAnchorRule);
    objc_msgSend(v19, "setCalendarUnit:", 128);
    objc_msgSend(v19, "setRoundingValue:", 1);
    objc_msgSend(v18, "setAnchorRule:", v19);
    objc_msgSend(v18, "setSubAnchorRule:", v19);
    v20 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v20, "setMinute:", 10);
    objc_msgSend(v18, "setAxisSpacing:", v20);
    objc_msgSend(v18, "setSubAxisSpacing:", v20);
    objc_msgSend(v18, "setAxisDescriptorPadding:", 2.0);
    objc_msgSend(v18, "setSubAxisDescriptorPadding:", 2.0);
    -[FIUIChartView setXAxisDescriptor:](v5->_chartView, "setXAxisDescriptor:", v18);
    v21 = objc_alloc_init((Class)FIUIChartMinMaxValueAxisDescriptor);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v21, "setUnhighlightedLabelColor:", v22);

    objc_msgSend(v21, "setLabelFont:", v13);
    objc_msgSend(v21, "setAxisDescriptorPadding:", 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v21, "setShadowColor:", v23);

    objc_msgSend(v21, "setShadowOffset:", 0.0, 0.0);
    objc_msgSend(v21, "setShadowBlur:", 3.0);
    -[FIUIChartView setYAxisDescriptor:](v5->_chartView, "setYAxisDescriptor:", v21);
    v24 = (FIUIChartFloatingBarSeries *)objc_alloc_init((Class)FIUIChartFloatingBarSeries);
    heartRateBarSeries = v5->_heartRateBarSeries;
    v5->_heartRateBarSeries = v24;

    -[FIUIChartFloatingBarSeries setEdgeInsets:](v5->_heartRateBarSeries, "setEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
    v26 = v5->_heartRateBarSeries;
    -[FIUIChartView valueForSmallWidth:mediumWidth:largeWidth:](v5->_chartView, "valueForSmallWidth:mediumWidth:largeWidth:", 1.0, 1.5, 1.5);
    -[FIUIChartFloatingBarSeries setCornerRadius:](v26, "setCornerRadius:");
    v27 = v5->_heartRateBarSeries;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors heartRateColors](ARUIMetricColors, "heartRateColors"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nonGradientTextColor"));
    -[FIUIChartFloatingBarSeries setBarColor:](v27, "setBarColor:", v29);

    v30 = v5->_heartRateBarSeries;
    v37[0] = v13;
    v36[0] = NSFontAttributeName;
    v36[1] = NSForegroundColorAttributeName;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIChartFloatingBarSeries barColor](v30, "barColor"));
    v37[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
    -[FIUIChartFloatingBarSeries setLabelAttributes:](v30, "setLabelAttributes:", v32);

  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailHeartRateChartView;
  -[CHWorkoutDetailHeartRateChartView layoutSubviews](&v3, "layoutSubviews");
  -[CHWorkoutDetailHeartRateChartView bounds](self, "bounds");
  -[FIUIChartView setFrame:](self->_chartView, "setFrame:");
}

- (void)setHeartRateReadings:(id)a3 averageHeartRate:(id)a4 workout:(id)a5
{
  NSNumber *v8;
  HKWorkout *v9;
  NSArray *v10;
  NSArray *heartRateReadings;
  NSNumber *averageHeartRate;
  NSNumber *v13;
  HKWorkout *workout;

  v8 = (NSNumber *)a4;
  v9 = (HKWorkout *)a5;
  v10 = (NSArray *)objc_msgSend(a3, "copy");
  heartRateReadings = self->_heartRateReadings;
  self->_heartRateReadings = v10;

  averageHeartRate = self->_averageHeartRate;
  self->_averageHeartRate = v8;
  v13 = v8;

  workout = self->_workout;
  self->_workout = v9;

  -[CHWorkoutDetailHeartRateChartView _updateChartSpacing](self, "_updateChartSpacing");
  -[CHWorkoutDetailHeartRateChartView _reloadChartPoints](self, "_reloadChartPoints");
}

- (void)_reloadChartPoints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *heartRateChartPoints;
  id v9;
  void **v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  void **v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  CHWorkoutDetailHeartRateChartView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  uint64_t v38;
  double v39;
  double v40;
  _BOOL4 v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSArray *obj;
  id obja;
  CHWorkoutDetailHeartRateChartView *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIChartView dateInterval](self->_chartView, "dateInterval"));
  objc_msgSend(v3, "duration");
  v5 = v4 / 96.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  heartRateChartPoints = self->_heartRateChartPoints;
  self->_heartRateChartPoints = v7;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v58 = self;
  obj = self->_heartRateReadings;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  v10 = (void **)&FIUIDistanceTypeForActivityType_ptr;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
        v16 = objc_msgSend(v3, "containsDate:", v15);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
          objc_msgSend(v17, "timeIntervalSinceDate:", v18);
          v20 = v19;

          v21 = vcvtmd_s64_f64(v20 / v5);
          v22 = v10;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[369], "numberWithInteger:", v21));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v23));

          if (!v24)
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "quantity"));
          objc_msgSend(v25, "ch_beatsPerMinute");
          v27 = (double)(uint64_t)llround(v26);

          objc_msgSend(v24, "addIndex:", (unint64_t)v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[369], "numberWithInteger:", v21));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v28);

          v10 = v22;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v11);
  }

  v29 = 0;
  v30 = -2;
  v31 = v58;
  do
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[369], "numberWithUnsignedInteger:", v30 + 2));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v32));
    if (v33)
    {

    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[369], "numberWithUnsignedInteger:", v30 + 3));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v34));

      if (!v35)
        goto LABEL_17;
    }
    ++v29;
LABEL_17:
    v30 += 2;
  }
  while (v30 < 0x5E);
  v36 = (double)-[NSArray count](v58->_heartRateReadings, "count");
  v37 = objc_msgSend(v3, "duration");
  v40 = v36 / v39 * 60.0;
  v42 = v40 >= 3.0 && v29 > 23;
  v58->_hasAdequateDataForDisplay = v42;
  if (v58->_chartType == 1)
    v42 = 1;
  v58->_hasAdequateDataForDisplay = v42;
  if (v42)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v45)
            objc_enumerationMutation(obja);
          v47 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
          v48 = v5 * (double)(uint64_t)objc_msgSend(v47, "integerValue");
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "dateByAddingTimeInterval:", v48));

          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dateByAddingTimeInterval:", v5 * 0.5));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v47));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIChartPointMultiple chartPointWithDate:valueIndexSet:](FIUIChartPointMultiple, "chartPointWithDate:valueIndexSet:", v51, v52));
          -[NSMutableArray addObject:](v58->_heartRateChartPoints, "addObject:", v53);

        }
        v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v44);
    }

    v31 = v58;
    -[FIUIChartDashedBackgroundView setNumLines:](v58->_backgroundView, "setNumLines:", 4);
    -[FIUIChartDashedBackgroundView setShouldCenterLines:](v58->_backgroundView, "setShouldCenterLines:", 0);
  }
  else
  {
    _HKInitializeLogging(v37, v38);
    v54 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
      sub_1005F2968(v54, v29, v40);
    -[FIUIChartDashedBackgroundView setNumLines:](v58->_backgroundView, "setNumLines:", 2);
    -[FIUIChartDashedBackgroundView setShouldCenterLines:](v58->_backgroundView, "setShouldCenterLines:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIChartView xAxisDescriptor](v58->_chartView, "xAxisDescriptor"));
    objc_msgSend(v55, "setAverageHeartRate:", 0);

  }
  -[FIUIChartView reloadData](v31->_chartView, "reloadData");

}

- (id)_dateInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t chartType;
  id v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout startDate](self->_workout, "startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateBySettingUnit:value:ofDate:options:", 0x8000, 0, v4, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout endDate](self->_workout, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateBySettingUnit:value:ofDate:options:", 0x8000, 0, v6, 0));

  chartType = self->_chartType;
  v9 = objc_alloc((Class)NSDateInterval);
  if (chartType == 1)
    v10 = objc_msgSend(v9, "initWithStartDate:duration:", v7, kHKWorkoutHeartRateRecoveryDisplayInterval);
  else
    v10 = objc_msgSend(v9, "initWithStartDate:endDate:", v5, v7);
  v11 = v10;

  return v11;
}

- (void)_updateChartSpacing
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailHeartRateChartView _dateInterval](self, "_dateInterval"));
  -[FIUIChartView setDateInterval:](self->_chartView, "setDateInterval:", v11);
  objc_msgSend(v11, "duration");
  v4 = v3 / 3.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 224, v6, v8, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIChartView xAxisDescriptor](self->_chartView, "xAxisDescriptor"));
  objc_msgSend(v10, "setAxisSpacing:", v9);
  objc_msgSend(v10, "setSubAxisSpacing:", v9);
  -[FIUIChartView setXAxisDescriptor:](self->_chartView, "setXAxisDescriptor:", v10);
  if (self->_chartType == 1)
    objc_msgSend(v10, "setRecoveryHeartRateReadings:", self->_heartRateReadings);
  else
    objc_msgSend(v10, "setAverageHeartRate:", self->_averageHeartRate);

}

- (unint64_t)numberOfSeriesInChart:(id)a3
{
  return 1;
}

- (id)chart:(id)a3 seriesAtIndex:(unint64_t)a4
{
  return self->_heartRateBarSeries;
}

- (unint64_t)chart:(id)a3 numberOfDataPointsForSeriesAtIndex:(unint64_t)a4
{
  return (unint64_t)-[NSMutableArray count](self->_heartRateChartPoints, "count", a3, a4);
}

- (id)chart:(id)a3 dataPointAtIndex:(unint64_t)a4 forSeriesAtIndex:(unint64_t)a5
{
  return -[NSMutableArray objectAtIndex:](self->_heartRateChartPoints, "objectAtIndex:", a4);
}

- (BOOL)hasAdequateDataForDisplay
{
  return self->_hasAdequateDataForDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateChartPoints, 0);
  objc_storeStrong((id *)&self->_heartRateBarSeries, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_heartRateReadings, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
}

@end
