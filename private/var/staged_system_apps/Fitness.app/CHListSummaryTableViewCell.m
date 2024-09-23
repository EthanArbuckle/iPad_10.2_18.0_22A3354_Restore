@implementation CHListSummaryTableViewCell

+ (double)heightForAllWorkoutSummary
{
  return 114.0;
}

+ (double)heightForWorkoutActivityTypeKey:(id)a3 statistics:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;

  v6 = a4;
  v7 = objc_msgSend(a3, "activityType");
  if (v7 == (id)_HKWorkoutActivityTypeNone)
  {
    v9 = 124.0;
  }
  else
  {
    v10 = (void *)objc_opt_class(a1, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostRecentWorkout"));
    v12 = objc_msgSend(v10, "mostRecentWorkout:supportsMetric:", v11, 1);

    v14 = (void *)objc_opt_class(a1, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostRecentWorkout"));
    LODWORD(v14) = objc_msgSend(v14, "mostRecentWorkout:supportsMetric:", v15, 8);

    v16 = 146.0;
    if ((_DWORD)v14)
      v16 = 168.0;
    if (v12)
      v9 = v16;
    else
      v9 = 124.0;
  }

  return v9;
}

+ (double)heightForMindfulnessSessions
{
  return 69.0;
}

- (CHListSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHListSummaryTableViewCell *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *totalHeaderLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *averageHeaderLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _CHWorkoutSummaryTabbedLabelContainer *v22;
  _CHWorkoutSummaryTabbedLabelContainer *numberOfWorkoutsLabel;
  void *v24;
  void *v25;
  _CHWorkoutSummaryTabbedLabelContainer *v26;
  _CHWorkoutSummaryTabbedLabelContainer *activeEnergyLabel;
  void *v28;
  void *v29;
  void *v30;
  _CHWorkoutSummaryTabbedLabelContainer *v31;
  _CHWorkoutSummaryTabbedLabelContainer *durationLabel;
  void *v33;
  void *v34;
  void *v35;
  _CHWorkoutSummaryTabbedLabelContainer *v36;
  _CHWorkoutSummaryTabbedLabelContainer *distanceLabel;
  void *v38;
  void *v39;
  void *v40;
  _CHWorkoutSummaryTabbedLabelContainer *v41;
  _CHWorkoutSummaryTabbedLabelContainer *paceLabel;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)CHListSummaryTableViewCell;
  v4 = -[CHListSummaryTableViewCell initWithStyle:reuseIdentifier:](&v48, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHListSummaryTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v4->_summaryType = 0;
    v4->_isForAllWorkouts = 0;
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    totalHeaderLabel = v4->_totalHeaderLabel;
    v4->_totalHeaderLabel = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_totalHeaderLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_HEADER_TOTAL"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[UILabel setText:](v4->_totalHeaderLabel, "setText:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v15, "addSubview:", v4->_totalHeaderLabel);

    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    averageHeaderLabel = v4->_averageHeaderLabel;
    v4->_averageHeaderLabel = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_averageHeaderLabel, "setTextColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_HEADER_AVERAGE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[UILabel setText:](v4->_averageHeaderLabel, "setText:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v21, "addSubview:", v4->_averageHeaderLabel);

    v22 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    numberOfWorkoutsLabel = v4->_numberOfWorkoutsLabel;
    v4->_numberOfWorkoutsLabel = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTextColor:](v4->_numberOfWorkoutsLabel, "setTextColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v25, "addSubview:", v4->_numberOfWorkoutsLabel);

    v26 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    activeEnergyLabel = v4->_activeEnergyLabel;
    v4->_activeEnergyLabel = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nonGradientTextColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTextColor:](v4->_activeEnergyLabel, "setTextColor:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v30, "addSubview:", v4->_activeEnergyLabel);

    v31 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elapsedTimeColors](ARUIMetricColors, "elapsedTimeColors"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "nonGradientTextColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTextColor:](v4->_durationLabel, "setTextColor:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v35, "addSubview:", v4->_durationLabel);

    v36 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    distanceLabel = v4->_distanceLabel;
    v4->_distanceLabel = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors distanceColors](ARUIMetricColors, "distanceColors"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "nonGradientTextColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTextColor:](v4->_distanceLabel, "setTextColor:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v40, "addSubview:", v4->_distanceLabel);

    v41 = -[_CHWorkoutSummaryTabbedLabelContainer initWithFrame:]([_CHWorkoutSummaryTabbedLabelContainer alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    paceLabel = v4->_paceLabel;
    v4->_paceLabel = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors paceColors](ARUIMetricColors, "paceColors"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "nonGradientTextColor"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTextColor:](v4->_paceLabel, "setTextColor:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v45, "addSubview:", v4->_paceLabel);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v46, "addObserver:selector:name:object:", v4, "_updateUI", kFIUIFitnessUnitPreferencesDidChangeNotification, 0);

  }
  return v4;
}

- (void)setIsForAllWorkouts:(BOOL)a3
{
  self->_isForAllWorkouts = a3;
  -[CHListSummaryTableViewCell _updateUI](self, "_updateUI");
}

- (void)setWorkoutStatistics:(id)a3 activityTypeKey:(id)a4 formattingManager:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CHListSummaryTableViewCell setSummaryType:](self, "setSummaryType:", 0);
  -[CHListSummaryTableViewCell setWorkoutStatistics:](self, "setWorkoutStatistics:", v10);

  -[CHListSummaryTableViewCell setMindfulnessSessionsStatistics:](self, "setMindfulnessSessionsStatistics:", 0);
  -[CHListSummaryTableViewCell setActivityTypeKey:](self, "setActivityTypeKey:", v9);

  -[CHListSummaryTableViewCell setFormattingManager:](self, "setFormattingManager:", v8);
  -[CHListSummaryTableViewCell _updateUI](self, "_updateUI");
}

- (void)setMindfulnessSessionsStatistics:(id)a3 formattingManager:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[CHListSummaryTableViewCell setSummaryType:](self, "setSummaryType:", 1);
  -[CHListSummaryTableViewCell setWorkoutStatistics:](self, "setWorkoutStatistics:", 0);
  -[CHListSummaryTableViewCell setMindfulnessSessionsStatistics:](self, "setMindfulnessSessionsStatistics:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutTypeKey emptyKey](CHWorkoutTypeKey, "emptyKey"));
  -[CHListSummaryTableViewCell setActivityTypeKey:](self, "setActivityTypeKey:", v8);

  -[CHListSummaryTableViewCell setFormattingManager:](self, "setFormattingManager:", v6);
  -[CHListSummaryTableViewCell _updateUI](self, "_updateUI");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHListSummaryTableViewCell;
  -[CHListSummaryTableViewCell prepareForReuse](&v4, "prepareForReuse");
  -[CHListSummaryTableViewCell _setShouldHaveFullLengthBottomSeparator:](self, "_setShouldHaveFullLengthBottomSeparator:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell stackedLabels](self, "stackedLabels"));
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", "setText:", 0);

}

- (NSArray)stackedLabels
{
  _CHWorkoutSummaryTabbedLabelContainer *activeEnergyLabel;
  _CHWorkoutSummaryTabbedLabelContainer *distanceLabel;
  _QWORD v5[5];

  activeEnergyLabel = self->_activeEnergyLabel;
  v5[0] = self->_numberOfWorkoutsLabel;
  v5[1] = activeEnergyLabel;
  distanceLabel = self->_distanceLabel;
  v5[2] = self->_durationLabel;
  v5[3] = distanceLabel;
  v5[4] = self->_paceLabel;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5));
}

- (void)_updateUI
{
  unint64_t v3;

  v3 = -[CHListSummaryTableViewCell summaryType](self, "summaryType");
  if (v3 == 1)
  {
    -[CHListSummaryTableViewCell _updateUIForMindfulnessSessions](self, "_updateUIForMindfulnessSessions");
  }
  else if (!v3)
  {
    -[CHListSummaryTableViewCell _updateUIForWorkout](self, "_updateUIForWorkout");
  }
}

- (void)_updateUIForWorkout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSString *v69;
  void *v70;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

  -[UILabel setHidden:](self->_totalHeaderLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_averageHeaderLabel, "setHidden:", 0);
  -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_activeEnergyLabel, "setHidden:", 0);
  -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_paceLabel, "setHidden:", 1);
  -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_distanceLabel, "setHidden:", 1);
  if ((id)-[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType") == (id)37)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_RUNS");
  }
  else if ((id)-[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType") == (id)52)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_WALKS");
  }
  else if ((id)-[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType") == (id)24)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_HIKES");
  }
  else
  {
    if ((id)-[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType") != (id)13)
      goto LABEL_10;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_RIDES");
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1007AE1D0, CFSTR("Localizable")));

  v4 = (void *)v9;
LABEL_10:
  if (self->_isForAllWorkouts)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_opt_class(self, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIWorkoutStatistics mostRecentWorkout](self->_workoutStatistics, "mostRecentWorkout"));
    v10 = objc_msgSend(v12, "mostRecentWorkout:supportsMetric:", v13, 1);

    v15 = (void *)objc_opt_class(self, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIWorkoutStatistics mostRecentWorkout](self->_workoutStatistics, "mostRecentWorkout"));
    v11 = objc_msgSend(v15, "mostRecentWorkout:supportsMetric:", v16, 8);

  }
  v17 = -[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType");
  v18 = -[CHWorkoutTypeKey isIndoor](self->_activityTypeKey, "isIndoor");
  v69 = HKMetadataKeySwimmingLocationType;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CHWorkoutTypeKey swimLocationType](self->_activityTypeKey, "swimLocationType")));
  v70 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIUIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", v17, v18, v20));

  v22 = FIUIDistanceTypeForActivityType(v21);
  if (v10)
  {
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_distanceLabel, "setHidden:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "formattedDistanceWithFormattingManager:distanceType:amountType:", v24, v22, 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "formattedDistanceWithFormattingManager:distanceType:amountType:", v26, v22, 1));

  }
  else
  {
    v67 = 0;
    v68 = 0;
  }
  v27 = v4;
  if (v11)
  {
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_paceLabel, "setHidden:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "formattedPaceWithFormattingManager:distanceType:", v29, v22));

    v30 = FIUIPaceFormatForWorkoutActivityType(v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = v31;
    if (v30 == 4)
      v33 = CFSTR("WORKOUT_MONTH_SUMMARY_AVG_SPEED_TITLE");
    else
      v33 = CFSTR("WORKOUT_MONTH_SUMMARY_AVG_PACE_TITLE");
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_1007AE1D0, CFSTR("Localizable")));

  }
  else
  {
    v66 = 0;
    v34 = 0;
  }
  if ((id)-[CHWorkoutTypeKey activityType](self->_activityTypeKey, "activityType") == (id)84
    && !-[CHWorkoutTypeKey isIndoor](self->_activityTypeKey, "isIndoor"))
  {
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_activeEnergyLabel, "setHidden:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("WORKOUT_UNDERWATER"), &stru_1007AE1D0, CFSTR("Localizable")));

    v27 = (void *)v36;
  }
  if (self->_isForAllWorkouts)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_SUMMARY_WORKOUTS_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

    -[UILabel setHidden:](self->_totalHeaderLabel, "setHidden:", 0);
    -[UILabel setHidden:](self->_averageHeaderLabel, "setHidden:", 0);
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_activeEnergyLabel, "setHidden:", 0);
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_paceLabel, "setHidden:", 1);
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_distanceLabel, "setHidden:", 1);
    v27 = (void *)v38;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "simpleWorkoutCount"));

  v41 = v27;
  -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_numberOfWorkoutsLabel, "setTitleText:", v27);
  -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_numberOfWorkoutsLabel, "setTotalText:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_SUMMARY_TIME_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_durationLabel, "setTitleText:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "formattedTotalWorkoutDurationWithFormattingManager:", v45));
  -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_durationLabel, "setTotalText:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "formattedAverageWorkoutDurationWithFormattingManager:", v48));
  -[_CHWorkoutSummaryTabbedLabelContainer setAverageText:](self->_durationLabel, "setAverageText:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "totalActiveEnergyBurn"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](self->_formattingManager, "unitManager"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userActiveEnergyBurnedUnit"));
  objc_msgSend(v51, "doubleValueForUnit:", v53);
  v55 = v54;

  if (v55 <= 2.22044605e-16)
  {
    -[_CHWorkoutSummaryTabbedLabelContainer setHidden:](self->_activeEnergyLabel, "setHidden:", 1);
  }
  else
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedLongActiveEnergyUnitString"));
    -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_activeEnergyLabel, "setTitleText:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "formattedTotalActiveEnergyBurnWithFormattingManager:", v59));
    -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_activeEnergyLabel, "setTotalText:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell workoutStatistics](self, "workoutStatistics"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "formattedAverageActiveEnergyBurnWithFormattingManager:", v62));
    -[_CHWorkoutSummaryTabbedLabelContainer setAverageText:](self->_activeEnergyLabel, "setAverageText:", v63);

  }
  if ((-[_CHWorkoutSummaryTabbedLabelContainer isHidden](self->_distanceLabel, "isHidden") & 1) == 0)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("WORKOUT_MONTH_SUMMARY_DISTANCE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_distanceLabel, "setTitleText:", v65);

    -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_distanceLabel, "setTotalText:", v67);
    -[_CHWorkoutSummaryTabbedLabelContainer setAverageText:](self->_distanceLabel, "setAverageText:", v68);
  }
  if ((-[_CHWorkoutSummaryTabbedLabelContainer isHidden](self->_paceLabel, "isHidden") & 1) == 0)
  {
    -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_paceLabel, "setTitleText:", v34);
    -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_paceLabel, "setTotalText:", 0);
    -[_CHWorkoutSummaryTabbedLabelContainer setAverageText:](self->_paceLabel, "setAverageText:", v66);
  }
  -[CHListSummaryTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

+ (BOOL)mostRecentWorkout:(id)a3 supportsMetric:(unint64_t)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fiui_activityType"));
  if ((objc_msgSend(v6, "bridge_isDownhillSnowSport") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v6, "identifier");
    if (a4 == 8 && v8 == (id)46)
    {
      v7 = 0;
    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider), "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:](FIUIWorkoutDefaultMetricsProvider, "metricsVersionForWorkout:", v5), v6, objc_msgSend(v5, "_activityMoveMode"), 1, 1);
      v7 = objc_msgSend(v9, "isMetricTypeSupported:isMachineWorkout:activityType:", a4, 0, v6);

    }
  }

  return v7;
}

- (void)_updateUIForMindfulnessSessions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[UILabel setHidden:](self->_totalHeaderLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_averageHeaderLabel, "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MINDFULNESS_SESSIONS"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_numberOfWorkoutsLabel, "setTitleText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell mindfulnessSessionsStatistics](self, "mindfulnessSessionsStatistics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "formattedSessionCount"));
  -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_numberOfWorkoutsLabel, "setTotalText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TOTAL_TIME"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[_CHWorkoutSummaryTabbedLabelContainer setTitleText:](self->_durationLabel, "setTitleText:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell mindfulnessSessionsStatistics](self, "mindfulnessSessionsStatistics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHListSummaryTableViewCell formattingManager](self, "formattingManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "formattedTotalDurationWithFormattingManager:", v9));
  -[_CHWorkoutSummaryTabbedLabelContainer setTotalText:](self->_durationLabel, "setTotalText:", v10);

}

- (void)layoutSubviews
{
  UILabel *averageHeaderLabel;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v5.receiver = self;
  v5.super_class = (Class)CHListSummaryTableViewCell;
  -[CHListSummaryTableViewCell layoutSubviews](&v5, "layoutSubviews");
  -[CHListSummaryTableViewCell _layoutLabels](self, "_layoutLabels");
  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == (id)1)
  {
    averageHeaderLabel = self->_averageHeaderLabel;
    v6[0] = self->_totalHeaderLabel;
    v6[1] = averageHeaderLabel;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));
    -[CHListSummaryTableViewCell ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v4);

  }
}

- (void)_layoutLabels
{
  double y;
  double x;
  double height;
  double width;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  _CHWorkoutSummaryTabbedLabelContainer *activeEnergyLabel;
  _CHWorkoutSummaryTabbedLabelContainer *paceLabel;
  void *v38;
  _CHWorkoutSummaryTabbedLabelContainer *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  _CHWorkoutSummaryTabbedLabelContainer *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[4];
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  if ((-[UILabel isHidden](self->_totalHeaderLabel, "isHidden") & 1) != 0)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = 20.0;
  }
  else
  {
    -[UILabel sizeToFit](self->_totalHeaderLabel, "sizeToFit");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_totalHeaderLabel, "font"));
    objc_msgSend(v8, "_scaledValueForValue:", 10.0);
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    y = UIRoundToScreenScale(v10);

    x = sub_1000D3DB4() + 16.0 + 4.0;
    -[UILabel bounds](self->_totalHeaderLabel, "bounds");
    width = CGRectGetWidth(v59);
    -[UILabel bounds](self->_totalHeaderLabel, "bounds");
    height = CGRectGetHeight(v60);
    v7 = 28.0;
  }
  -[UILabel setFrame:](self->_totalHeaderLabel, "setFrame:", x, y, width, height);
  -[UILabel sizeToFit](self->_averageHeaderLabel, "sizeToFit");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_averageHeaderLabel, "font"));
  objc_msgSend(v12, "_scaledValueForValue:", 10.0);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = UIRoundToScreenScale(v14);

  v17 = sub_1000D3DB4() * 2.0 + 16.0 + 4.0;
  -[UILabel bounds](self->_averageHeaderLabel, "bounds");
  v18 = CGRectGetWidth(v61);
  -[UILabel bounds](self->_averageHeaderLabel, "bounds");
  -[UILabel setFrame:](self->_averageHeaderLabel, "setFrame:", v17, v16, v18, CGRectGetHeight(v62));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v19, "_scaledValueForValue:", v7);
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v23 = UIRoundToScreenScale(v21);

  -[_CHWorkoutSummaryTabbedLabelContainer sizeToFit](self->_numberOfWorkoutsLabel, "sizeToFit");
  -[_CHWorkoutSummaryTabbedLabelContainer frame](self->_numberOfWorkoutsLabel, "frame");
  v25 = v24;
  -[_CHWorkoutSummaryTabbedLabelContainer frame](self->_numberOfWorkoutsLabel, "frame");
  v27 = v26;
  -[_CHWorkoutSummaryTabbedLabelContainer _firstBaselineOffsetFromTop](self->_numberOfWorkoutsLabel, "_firstBaselineOffsetFromTop");
  v29 = v23 - v28;
  -[UILabel frame](self->_totalHeaderLabel, "frame");
  v30 = v29 + CGRectGetMinY(v63);
  -[UILabel _firstBaselineOffsetFromTop](self->_totalHeaderLabel, "_firstBaselineOffsetFromTop");
  -[_CHWorkoutSummaryTabbedLabelContainer setFrame:](self->_numberOfWorkoutsLabel, "setFrame:", 16.0, v30 + v31, v25, v27);
  objc_msgSend(v19, "_scaledValueForValue:", 20.0);
  v33 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v35 = UIRoundToScreenScale(v33);

  activeEnergyLabel = self->_activeEnergyLabel;
  v58[0] = self->_durationLabel;
  v58[1] = activeEnergyLabel;
  paceLabel = self->_paceLabel;
  v58[2] = self->_distanceLabel;
  v58[3] = paceLabel;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));
  v39 = self->_numberOfWorkoutsLabel;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v40 = v38;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v54;
    do
    {
      v44 = 0;
      v45 = v39;
      do
      {
        if (*(_QWORD *)v54 != v43)
          objc_enumerationMutation(v40);
        v46 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v44);
        objc_msgSend(v46, "sizeToFit", (_QWORD)v53);
        objc_msgSend(v46, "frame");
        v47 = CGRectGetWidth(v64);
        objc_msgSend(v46, "frame");
        v48 = CGRectGetHeight(v65);
        objc_msgSend(v46, "_firstBaselineOffsetFromTop");
        v50 = v35 - v49;
        -[_CHWorkoutSummaryTabbedLabelContainer frame](v45, "frame");
        v51 = v50 + CGRectGetMinY(v66);
        -[_CHWorkoutSummaryTabbedLabelContainer _firstBaselineOffsetFromTop](v45, "_firstBaselineOffsetFromTop");
        objc_msgSend(v46, "setFrame:", 16.0, v51 + v52, v47, v48);
        v39 = v46;

        v44 = (char *)v44 + 1;
        v45 = v39;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v42);
  }

}

- (FIUIWorkoutStatistics)workoutStatistics
{
  return self->_workoutStatistics;
}

- (void)setWorkoutStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_workoutStatistics, a3);
}

- (CHMindfulnessSessionsStatistics)mindfulnessSessionsStatistics
{
  return self->_mindfulnessSessionsStatistics;
}

- (void)setMindfulnessSessionsStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_mindfulnessSessionsStatistics, a3);
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (CHWorkoutTypeKey)activityTypeKey
{
  return self->_activityTypeKey;
}

- (void)setActivityTypeKey:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeKey, a3);
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (void)setSummaryType:(unint64_t)a3
{
  self->_summaryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeKey, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_mindfulnessSessionsStatistics, 0);
  objc_storeStrong((id *)&self->_workoutStatistics, 0);
  objc_storeStrong((id *)&self->_paceLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_activeEnergyLabel, 0);
  objc_storeStrong((id *)&self->_numberOfWorkoutsLabel, 0);
  objc_storeStrong((id *)&self->_averageHeaderLabel, 0);
  objc_storeStrong((id *)&self->_totalHeaderLabel, 0);
}

@end
