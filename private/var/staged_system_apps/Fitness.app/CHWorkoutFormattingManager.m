@implementation CHWorkoutFormattingManager

- (CHWorkoutFormattingManager)initWithFitnessUIFormattingManager:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  CHWorkoutFormattingManager *v9;
  CHWorkoutFormattingManager *v10;
  ARUIRingsViewRenderer *v11;
  ARUIRingsViewRenderer *renderer;
  CHWorkoutDataCalculator *v13;
  void *v14;
  CHWorkoutDataCalculator *v15;
  CHWorkoutDataCalculator *dataCalculator;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CHWorkoutFormattingManager;
  v9 = -[CHWorkoutFormattingManager init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_formattingManager, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = (ARUIRingsViewRenderer *)objc_msgSend(objc_alloc((Class)ARUIRingsViewRenderer), "initWithMaximumRingCount:", 1);
    renderer = v10->_renderer;
    v10->_renderer = v11;

    v13 = [CHWorkoutDataCalculator alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unitManager"));
    v15 = -[CHWorkoutDataCalculator initWithHealthStore:unitManager:](v13, "initWithHealthStore:unitManager:", v8, v14);
    dataCalculator = v10->_dataCalculator;
    v10->_dataCalculator = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[CHWorkoutDataCalculator setShouldUseFakeSegmentMarkers:](v10->_dataCalculator, "setShouldUseFakeSegmentMarkers:", objc_msgSend(v17, "BOOLForKey:", CFSTR("fakeSegments")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[APSubject subjectMonitorRegistry](APSubject, "subjectMonitorRegistry"));
    v19 = objc_msgSend(v18, "addMonitor:", v10);

    -[CHWorkoutFormattingManager updateHiddenAppBundleIds](v10, "updateHiddenAppBundleIds");
  }

  return v10;
}

- (id)fakeLocationDataForWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  double v22;
  id v23;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:", CFSTR("CityRunFakedLocationCoordinates"), CFSTR("json")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v5));
  if (v6)
  {
    v23 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v23));
    v8 = v23;
    v9 = objc_msgSend(v7, "count");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12 / (double)(uint64_t)v9;

    v14 = objc_alloc_init((Class)NSMutableArray);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000532E4;
    v19[3] = &unk_100777D20;
    v20 = v3;
    v22 = v13;
    v15 = v14;
    v21 = v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
    v16 = v21;
    v17 = v15;

  }
  else
  {
    v17 = &__NSArray0__struct;
  }

  return v17;
}

- (BOOL)workoutHasGoalCompletionEvent:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _goalCompletionEventsForWorkout:](self, "_goalCompletionEventsForWorkout:", a3));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_goalCompletionEventsForWorkout:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "workoutEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100777D60));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (id)formattedDescriptionForWorkout:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DayViewDisplayContext")))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedDescriptionForDayViewWithWorkout:](self, "_formattedDescriptionForDayViewWithWorkout:", v6));
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("WorkoutsListDisplayContext")))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedDescriptionForListViewWithWorkout:](self, "_formattedDescriptionForListViewWithWorkout:", v6));
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

- (id)_formattedDescriptionForDayViewWithWorkout:(id)a3
{
  id v4;
  FIUIFormattingManager *formattingManager;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  FIUIFormattingManager *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v22;

  v4 = a3;
  if (objc_msgSend(v4, "workoutActivityType") == (id)84)
  {
    formattingManager = self->_formattingManager;
    objc_msgSend(v4, "duration");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 3));
    v7 = FILocalizedActivityNameWithWorkout(v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v6, v8));
    v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v9);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("DayViewDisplayContext")));
    v11 = self->_formattingManager;
    v22 = &stru_1007AE1D0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedGoalDescriptionForWorkout:withValue:appendActivityType:](v11, "localizedGoalDescriptionForWorkout:withValue:appendActivityType:", v4, &v22, 1));

    v13 = v22;
    v10 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v12);
    v14 = objc_msgSend(v12, "length");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v15, 0, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "goalDescriptionFont"));
    objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v16, 0, v14);

    if (-[__CFString length](v13, "length"))
    {
      v17 = objc_msgSend(v12, "rangeOfString:", v13);
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueFont"));
      objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v20, v17, v19);

    }
  }

  return v10;
}

- (id)_formattedDescriptionForListViewWithWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v3 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("WorkoutsListDisplayContext")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateFont"));
  objc_msgSend(v4, "pointSize");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dateFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHListAndDetailViewDateFormatter listViewDateFormatter](CHListAndDetailViewDateFormatter, "listViewDateFormatter"));
  v25 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fiui_activityType"));
  v8 = FILocalizedNameForActivityType(objc_msgSend(v7, "effectiveTypeIdentifier"), objc_msgSend(v7, "swimmingLocationType"), objc_msgSend(v7, "isIndoor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("\n")));

  v11 = objc_alloc((Class)NSMutableAttributedString);
  v30[0] = NSFontAttributeName;
  v30[1] = NSForegroundColorAttributeName;
  v31[0] = v23;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v31[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
  v14 = objc_msgSend(v11, "initWithString:attributes:", v22, v13);

  v15 = objc_alloc((Class)NSAttributedString);
  v28[1] = NSForegroundColorAttributeName;
  v29[0] = v24;
  v28[0] = NSFontAttributeName;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v29[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
  v18 = objc_msgSend(v15, "initWithString:attributes:", v21, v17);
  objc_msgSend(v14, "appendAttributedString:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedGoalForWorkout:context:](self, "formattedGoalForWorkout:context:", v25, CFSTR("WorkoutsListDisplayContext")));
  objc_msgSend(v14, "appendAttributedString:", v19);

  return v14;
}

- (id)formattedDateForWorkout:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("WorkoutsListDisplayContext")))
    v7 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedDateForListViewWithWorkout:](self, "_formattedDateForListViewWithWorkout:", v6));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedDateForDetailWithWorkout:](self, "_formattedDateForDetailWithWorkout:", v6));
  v8 = (void *)v7;

  return v8;
}

- (id)_formattedDateForDetailWithWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSAttributedStringKey v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("WorkoutDetailDisplayContext")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHListAndDetailViewDateFormatter detailViewDateFormatter](CHListAndDetailViewDateFormatter, "detailViewDateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v6));
  v8 = objc_alloc((Class)NSAttributedString);
  v13 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFont"));
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v11 = objc_msgSend(v8, "initWithString:attributes:", v7, v10);

  return v11;
}

- (id)_formattedDateForListViewWithWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("WorkoutsListDisplayContext")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFont"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CHListAndDetailViewDateFormatter formattedListStringForDate:font:](CHListAndDetailViewDateFormatter, "formattedListStringForDate:font:", v5, v6));

  return v7;
}

- (id)formattedTypeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[3];
  _QWORD v31[3];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutConfiguration"));
    v11 = objc_msgSend(v10, "activityType");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutConfiguration"));
    v13 = objc_msgSend(v12, "swimmingLocationType");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutConfiguration"));
    v15 = objc_msgSend(v14, "locationType") == (id)2;

    v16 = FILocalizedNameForActivityType(v11, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", HKMetadataKeyWorkoutBrandName));

    if (!objc_msgSend(v17, "length"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fiui_activityType"));
      v20 = FILocalizedNameForActivityType(objc_msgSend(v19, "effectiveTypeIdentifier"), objc_msgSend(v19, "swimmingLocationType"), objc_msgSend(v19, "isIndoor"));
      v21 = objc_claimAutoreleasedReturnValue(v20);

      v17 = (void *)v21;
    }
  }
  v22 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v23) = 1.0;
  objc_msgSend(v22, "setHyphenationFactor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutTypeFont"));
  v25 = objc_alloc((Class)NSAttributedString);
  v31[0] = v24;
  v30[0] = NSFontAttributeName;
  v30[1] = NSForegroundColorAttributeName;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v30[2] = NSParagraphStyleAttributeName;
  v31[1] = v26;
  v31[2] = v22;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
  v28 = objc_msgSend(v25, "initWithString:attributes:", v17, v27);

  return v28;
}

- (id)formattedSwimmingStrokeTypeForWorkout:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v5 = a4;
  v6 = objc_msgSend(a3, "fiui_strokeStyle");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v5));
    v9 = FILocalizedStrokeStyleName(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateFont"));
    v12 = objc_alloc((Class)NSAttributedString);
    v17[0] = NSFontAttributeName;
    v17[1] = NSForegroundColorAttributeName;
    v18[0] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v18[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
    v15 = objc_msgSend(v12, "initWithString:attributes:", v10, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)formattedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  uint64_t v33;
  _BOOL4 v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];

  v35 = a4;
  v6 = a3;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100054454;
  v43[3] = &unk_100777D88;
  v36 = v6;
  v44 = v36;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", v43));

  v9 = objc_alloc_init((Class)NSMutableString);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v8;
  v37 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v37)
  {
    v33 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v10);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v12));
        v14 = FILocalizedStrokeStyleName(objc_msgSend(v12, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v35)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattingManager](self, "formattingManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
          objc_msgSend(v13, "doubleValueForUnit:", v17);
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringWithDistanceInMeters:distanceType:unitStyle:roundingMode:", 3, 1, 5));
        }
        else
        {
          v38 = 0;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattingManager](self, "formattingManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
          objc_msgSend(v13, "doubleValueForUnit:", v17);
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 4, 1, &v38));
        }
        v19 = (void *)v18;

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SWIMMING_STROKE_STYLE_DISTANCE_%@_%@"), &stru_1007AE1D0, CFSTR("Localizable")));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v15, v19));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
        LOBYTE(v21) = objc_msgSend(v12, "isEqualToNumber:", v23);

        if ((v21 & 1) == 0)
          objc_msgSend(v9, "appendString:", CFSTR("\n"));
        objc_msgSend(v9, "appendString:", v22);

      }
      v37 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v37);
  }
  v24 = v10;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dateFont"));
  v26 = objc_alloc((Class)NSAttributedString);
  v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v9);
  v45[0] = NSFontAttributeName;
  v45[1] = NSForegroundColorAttributeName;
  v46[0] = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v46[1] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
  v30 = objc_msgSend(v26, "initWithString:attributes:", v27, v29);

  return v30;
}

- (id)formattedTimeRangeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v7 = a3;
  v8 = a4;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dateFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  if (v8)
    v11 = v8;
  else
    v11 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CHListAndDetailViewDateFormatter timeDateFormatter](CHListAndDetailViewDateFormatter, "timeDateFormatter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromDate:", v12));

  v24 = v7;
  if (v8)
    v15 = v8;
  else
    v15 = v7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CHListAndDetailViewDateFormatter timeDateFormatter](CHListAndDetailViewDateFormatter, "timeDateFormatter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringFromDate:", v16));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@–%@"), v14, v18));
  v20 = objc_alloc((Class)NSAttributedString);
  v26[0] = NSFontAttributeName;
  v26[1] = NSForegroundColorAttributeName;
  v27[0] = v9;
  v27[1] = v10;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v22 = objc_msgSend(v20, "initWithString:attributes:", v19, v21);

  return v22;
}

- (id)defaultCircularRingImageForContext:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a3));
  v4 = FIUICircularWorkoutGradientImage(objc_msgSend(v3, "ringDiameter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)_ringImageForWorkout:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fiui_completionFactor");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors metricColorsForWorkout:](ARUIMetricColors, "metricColorsForWorkout:", v6));
  if (!objc_msgSend(v6, "shouldUseCircularGradientImage"))
  {
    if (!objc_msgSend(v6, "_goalType"))
    {
      v21 = objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext _dayViewDisplayContext](CHWorkoutDisplayContext, "_dayViewDisplayContext"));
      if ((id)v21 == v7)
      {

      }
      else
      {
        v22 = (void *)v21;
        v23 = (id)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext _friendDetailDisplayContext](CHWorkoutDisplayContext, "_friendDetailDisplayContext"));

        if (v23 != v7)
        {
          v24 = FIUICircularWorkoutGradientImage(objc_msgSend(v7, "ringDiameter"));
          v19 = objc_claimAutoreleasedReturnValue(v24);
          goto LABEL_5;
        }
      }
    }
    objc_msgSend(v7, "ringDiameter");
    v17 = v16;
    objc_msgSend(v7, "ringThickness");
    v19 = objc_claimAutoreleasedReturnValue(+[RingViewFactory workoutRingWithPercent:colors:diameter:thickness:renderer:](RingViewFactory, "workoutRingWithPercent:colors:diameter:thickness:renderer:", v10, self->_renderer, v9, v17, v18));
LABEL_5:
    v15 = (void *)v19;
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "gradientDarkColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "gradientLightColor"));
  objc_msgSend(v7, "ringDiameter");
  v14 = FIUICircularGradientImage(v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

LABEL_6:
  return v15;
}

- (void)_fetchRingImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  void (**v8)(id, id);
  id v9;

  v8 = (void (**)(id, id))a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _ringImageForWorkout:context:](self, "_ringImageForWorkout:context:", a3, a4));
  v8[2](v8, v9);

}

- (void)_fetchWatchIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHWatchIconParameters *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CHWatchIconParameters);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceRevision"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
  -[CHIconParameters setBundleID:](v10, "setBundleID:", v13);

  objc_msgSend(v8, "appIconWidth");
  v15 = v14;

  -[CHIconParameters setPreferredAppStoreIconWidth:](v10, "setPreferredAppStoreIconWidth:", v15);
  -[CHWatchIconParameters setIconVariant2x:](v10, "setIconVariant2x:", 32771);
  -[CHWatchIconParameters setIconVariant3x:](v10, "setIconVariant3x:", 32771);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100054A3C;
  v17[3] = &unk_100777DB0;
  v18 = v7;
  v16 = v7;
  +[CHIconCache fetchWatchIconWithParameters:completion:](CHIconCache, "fetchWatchIconWithParameters:completion:", v10, v17);

}

- (void)_fetchPhoneIconForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  CHPhoneIconParameters *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CHPhoneIconParameters);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceRevision"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
  -[CHIconParameters setBundleID:](v10, "setBundleID:", v13);

  objc_msgSend(v8, "appIconWidth");
  v15 = v14;

  -[CHIconParameters setPreferredAppStoreIconWidth:](v10, "setPreferredAppStoreIconWidth:", v15);
  -[CHPhoneIconParameters setAppIconFormat:](v10, "setAppIconFormat:", 2);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100054B84;
  v17[3] = &unk_100777DB0;
  v18 = v7;
  v16 = v7;
  +[CHIconCache fetchPhoneIconWithParameters:completion:](CHIconCache, "fetchPhoneIconWithParameters:completion:", v10, v17);

}

- (void)_fetchIconForConnectedGymWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "device"));
  objc_msgSend(v9, "gymKitIconWidth");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:](HKUIConnectedGymIconUtilties, "iconForConnectedGymDevice:preferredIconWidth:", v10));

  if (!v11)
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _ringImageForWorkout:context:](self, "_ringImageForWorkout:context:", v12, v9));
  v8[2](v8, v11);

}

- (void)_fetchIconForFirstPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  CHPhoneIconParameters *v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceRevision"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  if ((objc_msgSend(v12, "_isAppleWatch") & 1) != 0)
  {

  }
  else
  {
    v13 = objc_msgSend(v8, "_isWatchWorkout");

    if ((v13 & 1) == 0)
    {
      v14 = objc_opt_new(CHPhoneIconParameters);
      -[CHIconParameters setBundleID:](v14, "setBundleID:", CFSTR("com.apple.Health"));
      objc_msgSend(v10, "appIconWidth");
      -[CHIconParameters setPreferredAppStoreIconWidth:](v14, "setPreferredAppStoreIconWidth:");
      -[CHPhoneIconParameters setAppIconFormat:](v14, "setAppIconFormat:", 2);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100054DD0;
      v15[3] = &unk_100777DB0;
      v16 = v9;
      +[CHIconCache fetchPhoneIconWithParameters:completion:](CHIconCache, "fetchPhoneIconWithParameters:completion:", v14, v15);

      goto LABEL_6;
    }
  }
  -[CHWorkoutFormattingManager _fetchRingImageForWorkout:context:completion:](self, "_fetchRingImageForWorkout:context:completion:", v8, v10, v9);
LABEL_6:

}

- (void)_fetchIconForThirdPartyWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  if (objc_msgSend(v9, "_isWatchWorkout"))
    -[CHWorkoutFormattingManager _fetchWatchIconForWorkout:context:completion:](self, "_fetchWatchIconForWorkout:context:completion:", v9, v10, v8);
  else
    -[CHWorkoutFormattingManager _fetchPhoneIconForWorkout:context:completion:](self, "_fetchPhoneIconForWorkout:context:completion:", v9, v10, v8);

}

- (BOOL)hasConnectedGymVendorIconForWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("WorkoutDetailDisplayContext")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));

  objc_msgSend(v4, "gymKitIconWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:](HKUIConnectedGymIconUtilties, "iconForConnectedGymDevice:preferredIconWidth:", v5));

  return v6 != 0;
}

- (id)_groundElevationFont
{
  return +[UIFont fu_mediumFontOfSize:](UIFont, "fu_mediumFontOfSize:", 13.0);
}

- (float)_groundElevationHeight
{
  return 13.0;
}

- (void)fetchIconImageForWorkout:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSArray *hiddenApplicationBundleIds;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "fiui_isConnectedGymWorkout"))
  {
    -[CHWorkoutFormattingManager _fetchIconForConnectedGymWorkout:context:completion:](self, "_fetchIconForConnectedGymWorkout:context:completion:", v8, v9, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceRevision"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
    v13 = objc_msgSend(v12, "_hasFirstPartyBundleID");

    if (!v13)
    {
      hiddenApplicationBundleIds = self->_hiddenApplicationBundleIds;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceRevision"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "source"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleIdentifier"));
      LODWORD(hiddenApplicationBundleIds) = -[NSArray containsObject:](hiddenApplicationBundleIds, "containsObject:", v17);

      if (!(_DWORD)hiddenApplicationBundleIds)
      {
        -[CHWorkoutFormattingManager _fetchIconForThirdPartyWorkout:context:completion:](self, "_fetchIconForThirdPartyWorkout:context:completion:", v8, v9, v10);
        goto LABEL_9;
      }
      _HKInitializeLogging(v18, v19);
      v20 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG))
        sub_1005F1C1C(v20);
    }
    -[CHWorkoutFormattingManager _fetchIconForFirstPartyWorkout:context:completion:](self, "_fetchIconForFirstPartyWorkout:context:completion:", v8, v9, v10);
  }
LABEL_9:

}

- (id)_goalStringForWorkout:(id)a3 outValue:(id *)a4
{
  id v6;
  id v7;
  FIUIFormattingManager *formattingManager;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = objc_msgSend(v6, "workoutActivityType");
  formattingManager = self->_formattingManager;
  if (v7 == (id)84)
    v9 = objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedGoalDescriptionForDive:healthStore:outValue:](formattingManager, "localizedGoalDescriptionForDive:healthStore:outValue:", v6, self->_healthStore, a4));
  else
    v9 = objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedGoalDescriptionForWorkout:withValue:appendActivityType:](formattingManager, "localizedGoalDescriptionForWorkout:withValue:appendActivityType:", v6, a4, 0));
  v10 = (void *)v9;

  return v10;
}

- (id)formattedGoalForWorkout:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  __CFString *v29;
  __CFString *v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WorkoutDetailDisplayContext")))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedGoalForDetailViewWithWorkout:](self, "_formattedGoalForDetailViewWithWorkout:", v6));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v7));
    v30 = &stru_1007AE1D0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _goalStringForWorkout:outValue:](self, "_goalStringForWorkout:outValue:", v6, &v30));
    v29 = v30;
    v11 = objc_alloc((Class)NSMutableAttributedString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedUppercaseString"));
    v8 = objc_msgSend(v11, "initWithString:", v12);

    v13 = objc_msgSend(v10, "length");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors metricColorsForWorkout:](ARUIMetricColors, "metricColorsForWorkout:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonGradientTextColor"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("DayViewDisplayContext")))
    {
      v16 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));

      v15 = (void *)v16;
    }
    objc_msgSend(v8, "addAttribute:value:range:", NSForegroundColorAttributeName, v15, 0, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "goalDescriptionFont"));
    objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v17, 0, v13);

    v18 = v29;
    if (-[__CFString length](v29, "length"))
    {
      v19 = objc_msgSend(v10, "rangeOfString:", v29);
      v21 = v20;
      v28 = v6;
      v22 = v10;
      v23 = v14;
      v24 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueFont"));
      v26 = v19;
      v18 = v29;
      objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v25, v26, v21);

      v9 = v24;
      v14 = v23;
      v10 = v22;
      v6 = v28;
    }

  }
  return v8;
}

- (id)_formattedGoalForDetailViewWithWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[2];
  _QWORD v25[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext _workoutDetailDisplayContext](CHWorkoutDisplayContext, "_workoutDetailDisplayContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nonGradientTextColor"));

  objc_msgSend(v3, "fiui_completionFactor");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v8 * 100.0) / 100.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager percentStringWithNumber:](FIUIFormattingManager, "percentStringWithNumber:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WORKOUT_COMPLETION_FORMAT_%@"), &stru_1007AE1D0, CFSTR("Localizable")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors metricColorsForWorkout:](ARUIMetricColors, "metricColorsForWorkout:", v3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonGradientTextColor"));

  v16 = objc_msgSend(v3, "_goalType");
  if (!v16)
  {
    v17 = FIUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WORKOUT_OPEN_GOAL"), &stru_1007AE1D0, CFSTR("Localizable")));

    v13 = (void *)v19;
  }
  v20 = objc_alloc((Class)NSAttributedString);
  v24[0] = NSFontAttributeName;
  v24[1] = NSForegroundColorAttributeName;
  v25[0] = v5;
  v25[1] = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v22 = objc_msgSend(v20, "initWithString:attributes:", v13, v21);

  return v22;
}

- (id)formattedHeartRate:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  if ((uint64_t)objc_msgSend(v5, "integerValue") < 1)
  {
    v24 = objc_alloc((Class)NSAttributedString);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("WORKOUT_EMPTY_VALUE"), &stru_1007AE1D0, CFSTR("Localizable")));
    v29[0] = NSFontAttributeName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueFont"));
    v30[0] = v10;
    v29[1] = NSForegroundColorAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors heartRateColors](ARUIMetricColors, "heartRateColors"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nonGradientTextColor"));
    v30[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    v17 = objc_msgSend(v24, "initWithString:attributes:", v8, v26);

  }
  else
  {
    v28 = objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v5, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BPM"), &stru_1007AE1D0, CFSTR("Localizable")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unitFormatString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@"), 0, v28, v8));

    v11 = objc_alloc((Class)NSMutableAttributedString);
    v31[0] = NSFontAttributeName;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueFont"));
    v32[0] = v12;
    v31[1] = NSForegroundColorAttributeName;
    v13 = v5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors heartRateColors](ARUIMetricColors, "heartRateColors"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonGradientTextColor"));
    v32[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v17 = objc_msgSend(v11, "initWithString:attributes:", v10, v16);

    v18 = objc_msgSend(v10, "rangeOfString:", v8);
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "goalDescriptionFont"));
    v22 = v20;
    v5 = v13;
    v23 = (void *)v28;
    objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v21, v18, v22);
  }

  return v17;
}

- (id)formattedEnergyBurn:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedStringWithActiveEnergy:](self->_formattingManager, "localizedStringWithActiveEnergy:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortActiveEnergyUnitString](self->_formattingManager, "localizedShortActiveEnergyUnitString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedUppercaseString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unitFormatString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@%@"), 0, v23, v9));

  v22 = objc_msgSend(v11, "rangeOfString:", v9);
  v13 = v12;
  v14 = objc_alloc((Class)NSMutableAttributedString);
  v24[0] = NSFontAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueFont"));
  v25[0] = v15;
  v24[1] = NSForegroundColorAttributeName;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nonGradientTextColor"));
  v25[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v19 = objc_msgSend(v14, "initWithString:attributes:", v11, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "goalDescriptionFont"));
  objc_msgSend(v19, "addAttribute:value:range:", NSFontAttributeName, v20, v22, v13);

  return v19;
}

- (void)_formattedDistanceStringForWorkout:(id)a3 distanceString:(id *)a4 unitString:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  _UNKNOWN **v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  FIUIFormattingManager *formattingManager;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[128];

  v8 = a3;
  v34 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fiui_activityType"));
  v10 = FIUIDistanceTypeForActivityType();

  v11 = &FIUIDistanceTypeForActivityType_ptr;
  if (objc_msgSend(v8, "workoutActivityType") == (id)82)
  {
    v27 = v10;
    v28 = a4;
    v29 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12, 0.0));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutActivities"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        v19 = v13;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "distanceType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "statisticsForType:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sumQuantity"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_quantityByAddingQuantity:", v23));

          v18 = (char *)v18 + 1;
          v19 = v13;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    a4 = v28;
    a5 = v29;
    v10 = v27;
    v11 = &FIUIDistanceTypeForActivityType_ptr;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fiui_totalDistance"));
  }
  formattingManager = self->_formattingManager;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[287], "meterUnit"));
  objc_msgSend(v13, "doubleValueForUnit:", v25);
  *a4 = (id)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v10, 0, &v34));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v34));
  *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedUppercaseString"));

}

- (id)formattedRacePaceOrSpeedForWorkout:(id)a3 metersPerSecond:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fiui_activityType"));
  v12 = FIUIPaceFormatForWorkoutActivityType(v11);
  v13 = FIUIDistanceTypeForActivityType(v11);
  v14 = objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
  objc_msgSend(v9, "doubleValue");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v14, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:](self->_formattingManager, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v17, v12, v13, 1.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _paceUnitForActivityType:paceFormat:](self, "_paceUnitForActivityType:paceFormat:", v11, v12));
  LOBYTE(v14) = objc_msgSend(v10, "didWinRace");

  if ((v14 & 1) != 0)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors raceAheadColors](ARUIMetricColors, "raceAheadColors"));
  else
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors raceBehindColors](ARUIMetricColors, "raceBehindColors"));
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nonGradientTextColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedValueString:withUnitString:paceFormat:context:color:](self, "_formattedValueString:withUnitString:paceFormat:context:color:", v18, v19, v12, v8, v22));

  return v23;
}

- (id)formattedGoalCompletedDurationForWorkout:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _goalCompletionEventsForWorkout:](self, "_goalCompletionEventsForWorkout:", v6));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v9, "fiui_distanceGoalCompletionTime");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", 2, v11));
    v13 = objc_alloc((Class)NSAttributedString);
    v20[0] = NSFontAttributeName;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueFont"));
    v21[0] = v14;
    v20[1] = NSForegroundColorAttributeName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors metricColorsForWorkout:](ARUIMetricColors, "metricColorsForWorkout:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nonGradientTextColor"));
    v21[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v18 = objc_msgSend(v13, "initWithString:attributes:", v12, v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)nonZeroMetadataExistsInWorkout:(id)a3 orWorkoutActivity:(id)a4 withKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
      v15 = objc_opt_class(HKQuantity, v14);
      isKindOfClass = objc_opt_isKindOfClass(v13, v15);

      if ((isKindOfClass & 1) != 0)
      {
        v17 = v8;
LABEL_8:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metadata"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        LOBYTE(v11) = objc_msgSend(v23, "fiui_isNonzero");

        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));
      v21 = objc_opt_class(HKQuantity, v20);
      v22 = objc_opt_isKindOfClass(v19, v21);

      if ((v22 & 1) != 0)
      {
        v17 = v7;
        goto LABEL_8;
      }
LABEL_10:
      LOBYTE(v11) = 0;
      goto LABEL_11;
    }
  }
LABEL_9:

LABEL_11:
  return (char)v11;
}

- (BOOL)hasAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4
{
  return -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", a3, a4, _HKPrivateMetadataKeyWorkoutAverageCadence);
}

- (BOOL)hasAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  return -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", a3, a4, _HKPrivateMetadataKeyWorkoutAveragePower);
}

- (BOOL)hasAverageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fiui_activityType"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fiui_activityType"));
  v11 = v10;

  if (objc_msgSend(v11, "identifier") == (id)13)
    v12 = -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", v6, v7, _HKPrivateMetadataKeyWorkoutAveragePower);
  else
    v12 = 0;

  return v12;
}

- (BOOL)isIndoorCyclingForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "fiui_activityType"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fiui_activityType"));
  v9 = v8;

  if (objc_msgSend(v9, "identifier") == (id)13)
    v10 = objc_msgSend(v9, "isIndoor");
  else
    v10 = 0;

  return v10;
}

- (BOOL)hasAverageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fiui_activityType"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fiui_activityType"));
  v11 = v10;

  if (objc_msgSend(v11, "identifier") == (id)13)
    v12 = -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", v6, v7, _HKPrivateMetadataKeyWorkoutAveragePace);
  else
    v12 = 0;

  return v12;
}

- (BOOL)hasDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  v6 = a4;
  v7 = &FIUIDistanceTypeForActivityType_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8, 0.0));

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "distanceType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statisticsForType:", v10));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sumQuantity"));
LABEL_13:
    v9 = (void *)v12;
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "workoutActivityType") != (id)82)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fiui_totalDistance"));

    goto LABEL_13;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workoutActivities", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      v18 = v9;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "distanceType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "statisticsForType:", v20));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sumQuantity"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_quantityByAddingQuantity:", v22));

        v17 = (char *)v17 + 1;
        v18 = v9;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v7 = &FIUIDistanceTypeForActivityType_ptr;
LABEL_14:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[287], "meterUnit"));
  objc_msgSend(v9, "doubleValueForUnit:", v23);
  v25 = v24 > 0.0;

  return v25;
}

- (BOOL)hasElevationAscendedDataForWorkout:(id)a3 workoutActivity:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = _HKPrivateMetadataKeyWorkoutElevationAscended;
  v7 = a4;
  v8 = a3;
  LOBYTE(v6) = -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", v8, v7, v6);
  LOBYTE(self) = -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", v8, v7, HKMetadataKeyElevationAscended);

  return v6 | self;
}

- (BOOL)hasFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  double v9;

  v5 = a4;
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierFlightsClimbed);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statisticsForType:", v6));
    v8 = v7 != 0;
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "totalFlightsClimbed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
    objc_msgSend(v6, "doubleValueForUnit:", v7);
    v8 = v9 > 0.0;
  }

  return v8;
}

- (BOOL)hasGroundElevationDataForWorkout:(id)a3 workoutActivity:(id)a4
{
  return -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", a3, a4, NLWorkoutMetadataKeyMaxGroundElevation);
}

- (BOOL)hasStepCountForWorkout:(id)a3 workoutActivity:(id)a4
{
  return -[CHWorkoutFormattingManager nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:](self, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:", a3, a4, _HKPrivateMetadataKeyWorkoutStepCount);
}

- (BOOL)shouldShowDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceRevision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "source"));
  v10 = objc_msgSend(v9, "_hasFirstPartyBundleID");

  if (v10
    && !-[CHWorkoutFormattingManager supportsDistanceForWorkout:workoutActivity:](self, "supportsDistanceForWorkout:workoutActivity:", v6, v7))
  {
    v11 = 0;
  }
  else
  {
    v11 = -[CHWorkoutFormattingManager hasDistanceForWorkout:workoutActivity:](self, "hasDistanceForWorkout:workoutActivity:", v6, v7);
  }

  return v11;
}

- (BOOL)supportsDistanceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  void *j;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableSet);
  v31 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fiui_activityType"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fiui_activityType"));
  v11 = v10;

  v30 = v11;
  if (objc_msgSend(v11, "identifier") == (id)82)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workoutActivities"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "fiui_activityType"));
          if (objc_msgSend(v17, "effectiveTypeIdentifier") != (id)83)
            objc_msgSend(v7, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v14);
    }

  }
  else
  {
    objc_msgSend(v7, "addObject:", v11);
  }
  v18 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:](FIUIWorkoutDefaultMetricsProvider, "metricsVersionForWorkout:", v5);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    v22 = 1;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        v25 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
        v26 = objc_msgSend(v5, "_activityMoveMode");
        v27 = FIUIDeviceSupportsElevationGain();
        v28 = objc_msgSend(v25, "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", v18, v24, v26, v27, FIUIDeviceSupportsGroundElevation());
        v22 &= objc_msgSend(v28, "isMetricTypeSupported:isMachineWorkout:activityType:", 1, objc_msgSend(v5, "fiui_isConnectedGymWorkout"), v24);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v20);
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (BOOL)supportsPaceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unsigned __int8 v14;

  v5 = a3;
  v6 = v5;
  if (a4)
    v5 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fiui_activityType"));
  v8 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:](FIUIWorkoutDefaultMetricsProvider, "metricsVersionForWorkout:", v6);
  v9 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
  v10 = objc_msgSend(v6, "_activityMoveMode");
  v11 = FIUIDeviceSupportsElevationGain();
  v12 = objc_msgSend(v9, "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", v8, v7, v10, v11, FIUIDeviceSupportsGroundElevation());
  v13 = objc_msgSend(v6, "fiui_isConnectedGymWorkout");

  v14 = objc_msgSend(v12, "isMetricTypeSupported:isMachineWorkout:activityType:", 8, v13, v7);
  return v14;
}

- (BOOL)supportsElevationAscendedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  if (a4)
    v4 = a4;
  else
    v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType", a3));
  v6 = objc_msgSend(v5, "bridge_supportsElevationAscendedInSummary");

  return v6;
}

- (BOOL)supportsElevationDescendedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  if (a4)
    v4 = a4;
  else
    v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType", a3));
  v6 = objc_msgSend(v5, "bridge_supportsElevationDescendedInSummary");

  return v6;
}

- (BOOL)supportsDownhillRunsCountForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v4;
  void *v5;
  BOOL v6;

  if (a4)
    v4 = a4;
  else
    v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType", a3));
  v6 = +[CHWorkoutDownhillRun supportsActivityType:](CHWorkoutDownhillRun, "supportsActivityType:", objc_msgSend(v5, "effectiveTypeIdentifier"));

  return v6;
}

- (id)formattedActiveEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierActiveEnergyBurned);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statisticsForType:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sumQuantity"));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "totalEnergyBurned"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedEnergyBurn:context:](self, "formattedEnergyBurn:context:", v12, a5));

  return v13;
}

- (id)formattedAverageCadenceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CHWorkoutFormattingManager hasAverageCadenceForWorkout:workoutActivity:](self, "hasAverageCadenceForWorkout:workoutActivity:", v8, v9))
  {
    v38 = v8;
    if (v9)
    {
      objc_msgSend(v9, "fiui_averageCadence");
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutConfiguration"));
      v14 = objc_msgSend(v13, "activityType");

    }
    else
    {
      objc_msgSend(v8, "fiui_averageCadence");
      v12 = v16;
      v14 = objc_msgSend(v8, "workoutActivityType");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v17, 1));

    v19 = objc_msgSend((id)objc_opt_class(self->_formattingManager, v18), "localizedShortCadenceUnitStringForActivityType:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedUppercaseString"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v10));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "unitFormatString"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@%@"), 0, v36, v21));

    v25 = objc_alloc((Class)NSMutableAttributedString);
    v39[0] = NSFontAttributeName;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "valueFont"));
    v40[0] = v26;
    v39[1] = NSForegroundColorAttributeName;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors cadenceColors](ARUIMetricColors, "cadenceColors"));
    v37 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nonGradientTextColor"));
    v40[1] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
    v15 = objc_msgSend(v25, "initWithString:attributes:", v24, v29);

    v30 = objc_msgSend(v24, "rangeOfString:", v21);
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "goalDescriptionFont"));
    v34 = v32;
    v10 = v37;
    objc_msgSend(v15, "addAttribute:value:range:", NSFontAttributeName, v33, v30, v34);

    v8 = v38;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (double)averageCyclingPowerForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierCyclingPower);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statisticsForType:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "averageQuantity"));
    objc_msgSend(v8, "_value");
    v10 = v9;

  }
  else
  {
    objc_msgSend(a3, "fiui_averagePower");
    v10 = v11;
  }

  return v10;
}

- (double)averageCyclingSpeedForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierCyclingSpeed);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statisticsForType:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "averageQuantity"));
    objc_msgSend(v8, "_value");
    v10 = v9;

  }
  else
  {
    objc_msgSend(a3, "fiui_averagePace");
    v10 = v11;
  }

  return v10;
}

- (id)formattedAveragePowerForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CHWorkoutFormattingManager hasAveragePowerForWorkout:workoutActivity:](self, "hasAveragePowerForWorkout:workoutActivity:", v8, v9))
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fiui_activityType"));
      v12 = objc_msgSend(v11, "identifier");

      v13 = (id *)&HKQuantityTypeIdentifierCyclingPower;
      if (v12 != (id)13)
        v13 = (id *)&HKQuantityTypeIdentifierRunningPower;
      v14 = *v13;
      v15 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "averageQuantity"));
      objc_msgSend(v17, "_value");
      v19 = v18;

    }
    else
    {
      objc_msgSend(v8, "fiui_averagePower");
      v19 = v21;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedAveragePowerStringFor:context:](self, "formattedAveragePowerStringFor:context:", v10, v19));
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)formattedAveragePowerStringFor:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedPowerStringFor:](self, "formattedPowerStringFor:", a3));
  v9 = objc_msgSend((id)objc_opt_class(self->_formattingManager, v8), "localizedShortPowerUnitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedUppercaseString"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unitFormatString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), 0, v7, v11));

  v15 = objc_alloc((Class)NSMutableAttributedString);
  v26[0] = NSFontAttributeName;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueFont"));
  v27[0] = v16;
  v26[1] = NSForegroundColorAttributeName;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors powerColors](ARUIMetricColors, "powerColors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nonGradientTextColor"));
  v27[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v20 = objc_msgSend(v15, "initWithString:attributes:", v14, v19);

  v21 = objc_msgSend(v14, "rangeOfString:", v11);
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "goalDescriptionFont"));
  objc_msgSend(v20, "addAttribute:value:range:", NSFontAttributeName, v24, v21, v23);

  return v20;
}

- (id)formattedPowerStringFor:(double)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(a3)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v3, 0));

  return v4;
}

- (id)formattedDistanceForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  FIUIFormattingManager *formattingManager;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  FIUIFormattingManager *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _BYTE v63[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  v52 = v9;
  v53 = v8;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "distanceType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sumQuantity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fiui_activityType"));
    v15 = FIUIDistanceTypeForActivityType(v14);

    v60 = 0;
    formattingManager = self->_formattingManager;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    objc_msgSend(v13, "doubleValueForUnit:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v15, 0, &v60));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v60));
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedUppercaseString"));

  }
  else if (objc_msgSend(v8, "workoutActivityType") == (id)82)
  {
    v50 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v21, 0.0));

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workoutActivities"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v57;
      do
      {
        v27 = 0;
        v28 = v22;
        do
        {
          if (*(_QWORD *)v57 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "distanceType"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "statisticsForType:", v30));

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sumQuantity"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_quantityByAddingQuantity:", v32));

          v27 = (char *)v27 + 1;
          v28 = v22;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v25);
    }

    v60 = 0;
    v33 = self->_formattingManager;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    objc_msgSend(v22, "doubleValueForUnit:", v34);
    v18 = (id)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](v33, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 1, 0, &v60));

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v60));
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedUppercaseString"));

    v10 = v50;
  }
  else
  {
    v54 = 0;
    v55 = 0;
    -[CHWorkoutFormattingManager _formattedDistanceStringForWorkout:distanceString:unitString:](self, "_formattedDistanceStringForWorkout:distanceString:unitString:", v8, &v55, &v54);
    v18 = v55;
    v20 = v54;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unitFormatString"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v36, CFSTR("%@%@"), 0, v18, v20));

  v38 = objc_msgSend(v37, "rangeOfString:", v20);
  v49 = v39;
  v51 = v38;
  v40 = objc_alloc((Class)NSMutableAttributedString);
  v61[0] = NSFontAttributeName;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueFont"));
  v62[0] = v41;
  v61[1] = NSForegroundColorAttributeName;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors distanceColors](ARUIMetricColors, "distanceColors"));
  v43 = v18;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "nonGradientTextColor"));
  v62[1] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 2));
  v46 = objc_msgSend(v40, "initWithString:attributes:", v37, v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "goalDescriptionFont"));
  objc_msgSend(v46, "addAttribute:value:range:", NSFontAttributeName, v47, v51, v49);

  return v46;
}

- (id)formattedDurationForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[2];
  _QWORD v25[2];

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  if (v8)
    objc_msgSend(v8, "duration");
  else
    objc_msgSend(v9, "fiui_duration");
  v12 = v11;
  v13 = objc_msgSend(v9, "workoutActivityType");

  if (v12 < 3600.0 && v13 == (id)84)
    v15 = 3;
  else
    v15 = 2;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", v15, v12));
  v17 = objc_alloc((Class)NSAttributedString);
  v24[0] = NSFontAttributeName;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueFont"));
  v25[0] = v18;
  v24[1] = NSForegroundColorAttributeName;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elapsedTimeColors](ARUIMetricColors, "elapsedTimeColors"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nonGradientTextColor"));
  v25[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v22 = objc_msgSend(v17, "initWithString:attributes:", v16, v21);

  return v22;
}

- (id)formattedElapsedTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  if (v9)
    v11 = v9;
  else
    v11 = v8;
  objc_msgSend(v11, "elapsedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", 2));
  v13 = objc_alloc((Class)NSAttributedString);
  v20[0] = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueFont"));
  v21[0] = v14;
  v20[1] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elapsedTimeColors](ARUIMetricColors, "elapsedTimeColors"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nonGradientTextColor"));
  v21[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v18 = objc_msgSend(v13, "initWithString:attributes:", v12, v17);

  return v18;
}

- (id)formattedRaceTimeForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  _QWORD v20[2];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a5));
  objc_msgSend(v7, "raceTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](self->_formattingManager, "stringWithDuration:durationFormat:", 2));
  v10 = objc_msgSend(v7, "didWinRace");

  if ((v10 & 1) != 0)
    v11 = objc_claimAutoreleasedReturnValue(+[ARUIMetricColors raceAheadColors](ARUIMetricColors, "raceAheadColors"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[ARUIMetricColors raceBehindColors](ARUIMetricColors, "raceBehindColors"));
  v12 = (void *)v11;
  v13 = objc_alloc((Class)NSAttributedString);
  v19[0] = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueFont"));
  v20[0] = v14;
  v19[1] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nonGradientTextColor"));
  v20[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  v17 = objc_msgSend(v13, "initWithString:attributes:", v9, v16);

  return v17;
}

- (id)formattedElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", HKMetadataKeyElevationAscended));

    if (!v12)
    {
      v13 = v9;
LABEL_6:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metadata"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutElevationAscended));

    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", HKMetadataKeyElevationAscended));

    if (!v12)
    {
      v13 = v8;
      goto LABEL_6;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedElevation:context:](self, "formattedElevation:context:", v12, v10));

  return v16;
}

- (id)formattedElevation:(id)a3 context:(id)a4
{
  FIUIFormattingManager *formattingManager;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  FIUIFormattingManager *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];

  formattingManager = self->_formattingManager;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](formattingManager, "unitManager"));
  v10 = objc_msgSend(v9, "userDistanceElevationUnit");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v7));
  v12 = self->_formattingManager;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
  objc_msgSend(v8, "doubleValueForUnit:", v13);
  v15 = v14;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:](v12, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:", v10, 0, 1, v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedUppercaseString"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "unitFormatString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%@%@"), 0, v31, v17));

  v20 = objc_msgSend(v19, "rangeOfString:", v17);
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elevationColors](ARUIMetricColors, "elevationColors"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nonGradientTextColor"));

  v25 = objc_alloc((Class)NSMutableAttributedString);
  v32[0] = NSFontAttributeName;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueFont"));
  v32[1] = NSForegroundColorAttributeName;
  v33[0] = v26;
  v33[1] = v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  v28 = objc_msgSend(v25, "initWithString:attributes:", v19, v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "goalDescriptionFont"));
  objc_msgSend(v28, "addAttribute:value:range:", NSFontAttributeName, v29, v20, v22);

  return v28;
}

- (id)formattedFlightsClimbedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CHWorkoutFormattingManager hasFlightsClimbedForWorkout:workoutActivity:](self, "hasFlightsClimbedForWorkout:workoutActivity:", v8, v9))
  {
    if (v9)
    {
      v11 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierFlightsClimbed);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sumQuantity"));
      objc_msgSend(v13, "_value");
      v15 = v14;

    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "totalFlightsClimbed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
      objc_msgSend(v11, "doubleValueForUnit:", v12);
      v15 = v17;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v18, 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v10));
    v21 = objc_alloc((Class)NSAttributedString);
    v27[0] = NSFontAttributeName;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueFont"));
    v28[0] = v22;
    v27[1] = NSForegroundColorAttributeName;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors flightsClimbedColors](ARUIMetricColors, "flightsClimbedColors"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "nonGradientTextColor"));
    v28[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v16 = objc_msgSend(v21, "initWithString:attributes:", v19, v25);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)formattedGroundElevationGainForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  float v25;
  float v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[3];
  _QWORD v55[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NLWorkoutMetadataKeyMaxGroundElevation));

    v13 = v9;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NLWorkoutMetadataKeyMaxGroundElevation));

    v13 = v8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metadata"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NLWorkoutMetadataKeyMinGroundElevation));

  if (v12)
    v17 = v16 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v42 = 0;
  }
  else
  {
    v53 = 0;
    v51 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    objc_msgSend(v12, "doubleValueForUnit:", v18);
    v20 = v19;

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self->_formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 5, 0, &v53, v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    objc_msgSend(v16, "doubleValueForUnit:", v21);
    v23 = v22;

    v48 = v9;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self->_formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 5, 0, &v53, v23));
    v47 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v53));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _groundElevationFont](self, "_groundElevationFont"));
    v44 = objc_alloc_init((Class)NSMutableParagraphStyle);
    -[CHWorkoutFormattingManager _groundElevationHeight](self, "_groundElevationHeight");
    objc_msgSend(v44, "setMaximumLineHeight:", v25);
    -[CHWorkoutFormattingManager _groundElevationHeight](self, "_groundElevationHeight");
    v50 = v10;
    v27 = FIUIBundle(objc_msgSend(v44, "setMinimumLineHeight:", v26));
    v49 = v12;
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SUMMARY_GROUND_ELEVATION_MIN"), &stru_1007AE1D0, CFSTR("Localizable")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v29, v46, v24));

    v32 = FIUIBundle(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SUMMARY_GROUND_ELEVATION_MAX"), &stru_1007AE1D0, CFSTR("Localizable")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v34, v52, v24));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@\n%@"), v35, v30));
    v37 = objc_alloc((Class)NSMutableAttributedString);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedUppercaseString"));
    v55[0] = v45;
    v54[0] = NSFontAttributeName;
    v54[1] = NSForegroundColorAttributeName;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elevationColors](ARUIMetricColors, "elevationColors"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "nonGradientTextColor"));
    v54[2] = NSParagraphStyleAttributeName;
    v55[1] = v40;
    v55[2] = v44;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 3));
    v42 = objc_msgSend(v37, "initWithString:attributes:", v38, v41);

    v10 = v50;
    v12 = v49;

    v8 = v51;
    v16 = v47;

    v9 = v48;
  }

  return v42;
}

- (id)formattedLapCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  if (a4)
    v9 = a4;
  else
    v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100777DD0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));
  v13 = objc_msgSend(v12, "count");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors lapColors](ARUIMetricColors, "lapColors"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonGradientTextColor"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedCount:color:context:](self, "formattedCount:color:context:", v13, v15, v8));
  return v16;
}

- (id)formattedDownhillRunsCount:(int64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors lapColors](ARUIMetricColors, "lapColors"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nonGradientTextColor"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedCount:color:context:](self, "formattedCount:color:context:", a3, v8, v6));
  return v9;
}

- (id)formattedCount:(int64_t)a3 color:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[2];

  if (!a3)
    return 0;
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v9, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v7));
  v12 = objc_alloc((Class)NSAttributedString);
  v17[0] = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueFont"));
  v17[1] = NSForegroundColorAttributeName;
  v18[0] = v13;
  v18[1] = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  v15 = objc_msgSend(v12, "initWithString:attributes:", v10, v14);
  return v15;
}

- (id)formattedPaceOrSpeedForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fiui_activityType"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fiui_activityType"));
  v14 = v13;

  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "distanceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sumQuantity"));
    objc_msgSend(v9, "duration");
    v19 = v18;

  }
  else if (((objc_msgSend(v8, "fiui_isConnectedGymWorkout") & 1) != 0
          || objc_msgSend(v14, "identifier") == (id)13 && objc_msgSend(v14, "isIndoor"))
         && objc_msgSend(v8, "fiui_hasAveragePace"))
  {
    objc_msgSend(v8, "fiui_averagePace");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v22, v21));

    v19 = 1.0;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "totalDistance"));
    objc_msgSend(v8, "duration");
    v19 = v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedPaceOrSpeedWithDistance:overDuration:activityType:context:](self, "formattedPaceOrSpeedWithDistance:overDuration:activityType:context:", v17, v14, v10, v19));

  return v24;
}

- (id)formattedPaceOrSpeedWithDistance:(id)a3 overDuration:(double)a4 activityType:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = FIUIPaceFormatForWorkoutActivityType(v11);
  v14 = -[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:](self->_formattingManager, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v12, v13, FIUIDistanceTypeForActivityType(v11), a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _paceUnitForActivityType:paceFormat:](self, "_paceUnitForActivityType:paceFormat:", v11, v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors paceColors](ARUIMetricColors, "paceColors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nonGradientTextColor"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedValueString:withUnitString:paceFormat:context:color:](self, "_formattedValueString:withUnitString:paceFormat:context:color:", v15, v16, v13, v10, v18));
  return v19;
}

- (id)formattedAverageSwimPaceWithDuration:(id)a3 context:(id)a4
{
  FIUIFormattingManager *formattingManager;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  formattingManager = self->_formattingManager;
  v7 = a4;
  objc_msgSend(a3, "doubleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](self->_formattingManager, "unitManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLapLengthHKUnit"));

  v11 = -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", FIUIDistanceUnitForHKUnit(v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = FIUINumberOfUnitsInPaceForPaceFormat(2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedLowercaseString"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PACE_MANY_UNIT_FORMAT"), &stru_1007AE1D0, CFSTR("Localizable")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17, v14));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors paceColors](ARUIMetricColors, "paceColors"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nonGradientTextColor"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _formattedValueString:withUnitString:paceFormat:context:color:](self, "_formattedValueString:withUnitString:paceFormat:context:color:", v8, v18, 2, v7, v20));
  return v21;
}

- (id)_paceUnitForActivityType:(id)a3 paceFormat:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  FIUIFormattingManager *formattingManager;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = FIUIDistanceTypeForActivityType(v6);
  if (a4 == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedSpeedUnitStringForActivityType:](self->_formattingManager, "localizedSpeedUnitStringForActivityType:", v6));
LABEL_10:

    return v8;
  }
  v9 = v7;
  v10 = objc_msgSend(v6, "identifier");

  formattingManager = self->_formattingManager;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](formattingManager, "unitManager"));
  v13 = v12;
  if (v10 == (id)46)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userLapLengthHKUnit"));

    v15 = -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", FIUIDistanceUnitForHKUnit(v14));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v13 = (void *)v14;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](formattingManager, "localizedShortUnitStringForDistanceUnit:", objc_msgSend(v12, "paceDistanceUnitForDistanceType:", v9)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedUppercaseString"));

  }
  if ((unint64_t)(a4 - 2) < 2)
  {
    v17 = FIUINumberOfUnitsInPaceForPaceFormat(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedLowercaseString"));

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PACE_MANY_UNIT_FORMAT"), &stru_1007AE1D0, CFSTR("Localizable")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20, v18));

    goto LABEL_10;
  }
  if (a4 == 1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FITNESS_PACE_UNIT_FORMAT_%@"), &stru_1007AE1D0, CFSTR("Localizable")));
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v8));

    v8 = (void *)v22;
    goto LABEL_10;
  }
  return v8;
}

- (id)_formattedValueString:(id)a3 withUnitString:(id)a4 paceFormat:(int64_t)a5 context:(id)a6 color:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  UIUserInterfaceLayoutDirection v28;
  uint64_t v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", a6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "goalDescriptionFont"));
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pace100UnitFont"));

    v15 = (void *)v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unitFormatString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@"), 0, v13, v12));

  v19 = objc_msgSend(v18, "rangeOfString:", v12);
  v21 = v20;

  v22 = objc_msgSend(v18, "rangeOfString:", v13);
  v30 = v23;
  v31 = v22;

  v24 = objc_alloc((Class)NSMutableAttributedString);
  v32[0] = NSFontAttributeName;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueFont"));
  v32[1] = NSForegroundColorAttributeName;
  v33[0] = v25;
  v33[1] = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  v27 = objc_msgSend(v24, "initWithString:attributes:", v18, v26);

  objc_msgSend(v27, "addAttribute:value:range:", NSFontAttributeName, v15, v19, v21);
  v28 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0);

  if (v28 == UIUserInterfaceLayoutDirectionRightToLeft)
    objc_msgSend(v27, "addAttribute:value:range:", NSWritingDirectionAttributeName, &off_1007B3EF8, v31, v30);

  return v27;
}

- (id)formattedPoolLengthForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FIUIFormattingManager *formattingManager;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fiui_lapLength"));
    if (v14)
    {
      v12 = (void *)v14;
      v39 = 0;
      v40 = v8;
      v41 = 0;
      v13 = v8;
      goto LABEL_6;
    }
LABEL_7:
    v31 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workoutConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lapLength"));

  if (!v12)
    goto LABEL_7;
  v40 = v8;
  v41 = 0;
  v39 = v9;
  v13 = v9;
LABEL_6:
  v36 = v12;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fiui_activityType"));
  v15 = FIUIDistanceTypeForActivityType(v38);
  formattingManager = self->_formattingManager;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnit](HKUnit, "meterUnit"));
  objc_msgSend(v12, "doubleValueForUnit:", v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](formattingManager, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", v15, 0, &v41));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self->_formattingManager, "localizedShortUnitStringForDistanceUnit:", v41));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedUppercaseString"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v10));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "unitFormatString"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@%@"), 0, v37, v19));

  v23 = objc_msgSend(v22, "rangeOfString:", v19);
  v34 = v24;
  v35 = v23;
  v25 = objc_alloc((Class)NSMutableAttributedString);
  v42[0] = NSFontAttributeName;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueFont"));
  v43[0] = v26;
  v42[1] = NSForegroundColorAttributeName;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors lapColors](ARUIMetricColors, "lapColors"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "nonGradientTextColor"));
  v43[1] = v28;
  v29 = v10;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  v31 = objc_msgSend(v25, "initWithString:attributes:", v22, v30);

  v10 = v29;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "goalDescriptionFont"));
  objc_msgSend(v31, "addAttribute:value:range:", NSFontAttributeName, v32, v35, v34);

  v9 = v39;
  v8 = v40;
LABEL_8:

  return v31;
}

- (id)formattedStepCountForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CHWorkoutFormattingManager hasStepCountForWorkout:workoutActivity:](self, "hasStepCountForWorkout:workoutActivity:", v8, v9))
  {
    if (v9)
      v11 = v9;
    else
      v11 = v8;
    objc_msgSend(v11, "fiui_totalStepCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v13, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", v10));
    v16 = objc_alloc((Class)NSAttributedString);
    v22[0] = NSFontAttributeName;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueFont"));
    v23[0] = v17;
    v22[1] = NSForegroundColorAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors stepColors](ARUIMetricColors, "stepColors"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "nonGradientTextColor"));
    v23[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
    v12 = objc_msgSend(v16, "initWithString:attributes:", v14, v20);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)formattedTotalEnergyForWorkout:(id)a3 workoutActivity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  CHWorkoutFormattingManager *v21;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v21 = self;
    v10 = a5;
    v11 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierActiveEnergyBurned);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sumQuantity"));
    v14 = objc_msgSend(objc_alloc((Class)HKQuantityType), "initWithIdentifier:", HKQuantityTypeIdentifierBasalEnergyBurned);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statisticsForType:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sumQuantity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_quantityByAddingQuantity:", v16));

    self = v21;
  }
  else
  {
    v18 = a5;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "totalEnergyBurned"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_totalBasalEnergyBurned"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_quantityByAddingQuantity:", v12));
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedEnergyBurn:context:](self, "formattedEnergyBurn:context:", v17, a5));
  return v19;
}

- (id)weatherTemperatureForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[CHWorkoutFormattingManager shouldFakeData](self, "shouldFakeData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit degreeFahrenheitUnit](HKUnit, "degreeFahrenheitUnit"));
    v9 = objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8, 72.0));
  }
  else
  {
    if (v7)
      v10 = v7;
    else
      v10 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", HKMetadataKeyWeatherTemperature));
  }
  v11 = (void *)v9;

  return v11;
}

- (id)waterTemperatureForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[CHWorkoutFormattingManager shouldFakeData](self, "shouldFakeData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit"));
    v9 = objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8, 18.0));
  }
  else
  {
    if (v7)
      v10 = v7;
    else
      v10 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NLPrivateMetadataKeyAverageWaterTemperature));
  }
  v11 = (void *)v9;

  return v11;
}

- (id)weatherHumidityForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[CHWorkoutFormattingManager shouldFakeData](self, "shouldFakeData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit percentUnit](HKUnit, "percentUnit"));
    v9 = objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v8, 0.23));
  }
  else
  {
    if (v7)
      v10 = v7;
    else
      v10 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", HKMetadataKeyWeatherHumidity));
  }
  v11 = (void *)v9;

  return v11;
}

- (id)airQualityIndexForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[CHWorkoutFormattingManager shouldFakeData](self, "shouldFakeData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 34));
  }
  else
  {
    if (v7)
      v9 = v7;
    else
      v9 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NLPrivateMetadataKeyAirQualityIndex));

  }
  return v8;
}

- (id)timeZoneForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CHWorkoutFormattingManager shouldFakeData](self, "shouldFakeData"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", HKMetadataKeyTimeZone));

    if (v7)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v7));
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)workoutWasInDayTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutDaytime));

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager timeZoneForWorkout:](self, "timeZoneForWorkout:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "setTimeZone:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v12 = (char *)objc_msgSend(v10, "component:fromDate:", 32, v11);

    v7 = (unint64_t)(v12 - 6) < 0xD;
  }

  return v7;
}

- (id)locationForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude));

    v10 = v7;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLatitude));

    v10 = v5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherLocationCoordinatesLongitude));

  if (v9)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v19 = 0;
  }
  else
  {
    v15 = objc_alloc((Class)CLLocation);
    objc_msgSend(v9, "doubleValue");
    v17 = v16;
    objc_msgSend(v13, "doubleValue");
    v19 = objc_msgSend(v15, "initWithLatitude:longitude:", v17, v18);
  }

  return v19;
}

- (id)shareImageForWorkout:(id)a3 routeImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  CHSharingImageWorkoutConfiguration *v18;
  id v19;
  CHSharingImageWorkoutConfiguration *v20;
  id v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _shareIconForWorkout:routeImage:](self, "_shareIconForWorkout:routeImage:", v6, v7));
  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _workoutTypeInfoForWorkout:](self, "_workoutTypeInfoForWorkout:", v6));
  objc_msgSend(v9, "addObject:", v10);
  v11 = -[CHWorkoutFormattingManager shouldShowDistanceForWorkout:workoutActivity:](self, "shouldShowDistanceForWorkout:workoutActivity:", v6, 0);
  v12 = objc_msgSend(v6, "_activityMoveMode");
  if (objc_msgSend(v6, "workoutActivityType") != (id)84)
  {
    if (v12 == (id)2)
      v16 = v11;
    else
      v16 = 1;
    if ((v16 & 1) != 0)
    {
      if (v12 != (id)2)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _activeEnergyInfoForWorkout:](self, "_activeEnergyInfoForWorkout:", v6));
        objc_msgSend(v9, "addObject:", v13);
        if (v11)
          v14 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _distanceInfoForWorkout:](self, "_distanceInfoForWorkout:", v6));
        else
          v14 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _durationInfoForWorkout:](self, "_durationInfoForWorkout:", v6));
        goto LABEL_3;
      }
      v17 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _distanceInfoForWorkout:](self, "_distanceInfoForWorkout:", v6));
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _durationInfoForWorkout:](self, "_durationInfoForWorkout:", v6));
    }
    v13 = (void *)v17;
    objc_msgSend(v9, "addObject:", v17);
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _underwaterTimeInfoForDive:](self, "_underwaterTimeInfoForDive:", v6));
  objc_msgSend(v9, "addObject:", v13);
  v14 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _maxDepthInfoForDive:](self, "_maxDepthInfoForDive:", v6));
LABEL_3:
  v15 = (void *)v14;
  objc_msgSend(v9, "addObject:", v14);

LABEL_14:
  v18 = [CHSharingImageWorkoutConfiguration alloc];
  v19 = objc_msgSend(v9, "copy");
  v20 = -[CHSharingImageWorkoutConfiguration initWithIconImage:routeImage:metricTitleAndValueInfo:](v18, "initWithIconImage:routeImage:metricTitleAndValueInfo:", v8, v7, v19);

  v21 = sub_100092A1C(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

- (id)shareTextForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _shareValueForWorkout:](self, "_shareValueForWorkout:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShareTextWithWorkout:shareValue:](self->_formattingManager, "localizedShareTextWithWorkout:shareValue:", v4, v5));

  return v6;
}

- (id)_shareValueForWorkout:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CHWorkoutFormattingManager supportsDistanceForWorkout:workoutActivity:](self, "supportsDistanceForWorkout:workoutActivity:", v4, 0))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _distanceInfoForWorkout:](self, "_distanceInfoForWorkout:", v4));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager _durationInfoForWorkout:](self, "_durationInfoForWorkout:", v4));
  }
  v6 = (void *)v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  return v7;
}

- (id)_workoutTypeInfoForWorkout:(id)a3
{
  id v3;
  CHSharingImageTitleAndValueInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", HKMetadataKeyWorkoutBrandName));

  if (!objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fiui_activityType"));
    v8 = FILocalizedNameForActivityType(objc_msgSend(v7, "effectiveTypeIdentifier"), objc_msgSend(v7, "swimmingLocationType"), objc_msgSend(v7, "isIndoor"));
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v6 = (void *)v9;
  }
  -[CHSharingImageTitleAndValueInfo setTitle:](v4, "setTitle:", v6);

  return v4;
}

- (id)_durationInfoForWorkout:(id)a3
{
  id v4;
  CHSharingImageTitleAndValueInfo *v5;
  void *v6;
  void *v7;
  FIUIFormattingManager *formattingManager;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TOTAL_TIME"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHSharingImageTitleAndValueInfo setTitle:](v5, "setTitle:", v7);

  formattingManager = self->_formattingManager;
  objc_msgSend(v4, "duration");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 3, v10));
  -[CHSharingImageTitleAndValueInfo setValue:](v5, "setValue:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elapsedTimeColors](ARUIMetricColors, "elapsedTimeColors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nonGradientTextColor"));
  -[CHSharingImageTitleAndValueInfo setValueColor:](v5, "setValueColor:", v13);

  return v5;
}

- (id)_distanceInfoForWorkout:(id)a3
{
  id v4;
  CHSharingImageTitleAndValueInfo *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WORKOUT_DISTANCE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHSharingImageTitleAndValueInfo setTitle:](v5, "setTitle:", v7);

  v15 = 0;
  v16 = 0;
  -[CHWorkoutFormattingManager _formattedDistanceStringForWorkout:distanceString:unitString:](self, "_formattedDistanceStringForWorkout:distanceString:unitString:", v4, &v16, &v15);

  v8 = v16;
  v9 = v15;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uppercaseString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v10));
  -[CHSharingImageTitleAndValueInfo setValue:](v5, "setValue:", v11);

  -[CHSharingImageTitleAndValueInfo setUnit:](v5, "setUnit:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors distanceColors](ARUIMetricColors, "distanceColors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nonGradientTextColor"));
  -[CHSharingImageTitleAndValueInfo setValueColor:](v5, "setValueColor:", v13);

  return v5;
}

- (id)_maxDepthInfoForDive:(id)a3
{
  id v4;
  CHSharingImageTitleAndValueInfo *v5;
  void *v6;
  void *v7;
  FIUIFormattingManager *formattingManager;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;

  v4 = a3;
  v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNDERWATER_DIVE_MAX_DEPTH"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHSharingImageTitleAndValueInfo setTitle:](v5, "setTitle:", v7);

  formattingManager = self->_formattingManager;
  v13 = &stru_1007AE1D0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedGoalDescriptionForWorkout:withValue:appendActivityType:](formattingManager, "localizedGoalDescriptionForWorkout:withValue:appendActivityType:", v4, &v13, 0));

  -[CHSharingImageTitleAndValueInfo setValue:](v5, "setValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors diveColors](ARUIMetricColors, "diveColors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nonGradientTextColor"));
  -[CHSharingImageTitleAndValueInfo setValueColor:](v5, "setValueColor:", v11);

  return v5;
}

- (id)_underwaterTimeInfoForDive:(id)a3
{
  id v4;
  CHSharingImageTitleAndValueInfo *v5;
  void *v6;
  void *v7;
  FIUIFormattingManager *formattingManager;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TOTAL_TIME"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHSharingImageTitleAndValueInfo setTitle:](v5, "setTitle:", v7);

  formattingManager = self->_formattingManager;
  objc_msgSend(v4, "duration");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager stringWithDuration:durationFormat:](formattingManager, "stringWithDuration:durationFormat:", 3, v10));
  -[CHSharingImageTitleAndValueInfo setValue:](v5, "setValue:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors elapsedTimeColors](ARUIMetricColors, "elapsedTimeColors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nonGradientTextColor"));
  -[CHSharingImageTitleAndValueInfo setValueColor:](v5, "setValueColor:", v13);

  return v5;
}

- (id)_activeEnergyInfoForWorkout:(id)a3
{
  id v4;
  CHSharingImageTitleAndValueInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  FIUIFormattingManager *formattingManager;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_alloc_init(CHSharingImageTitleAndValueInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizationKeyForEnergyBaseKey:](self->_formattingManager, "localizationKeyForEnergyBaseKey:", CFSTR("WORKOUT_ACTIVE_ENERGY_TITLE")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHSharingImageTitleAndValueInfo setTitle:](v5, "setTitle:", v8);

  formattingManager = self->_formattingManager;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "totalEnergyBurned"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedStringWithActiveEnergy:](formattingManager, "localizedStringWithActiveEnergy:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager localizedShortActiveEnergyUnitString](self->_formattingManager, "localizedShortActiveEnergyUnitString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedUppercaseString"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDisplayContext displayContextWithName:](CHWorkoutDisplayContext, "displayContextWithName:", CFSTR("WorkoutDetailDisplayContext")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unitFormatString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@%@"), 0, v11, v13));

  -[CHSharingImageTitleAndValueInfo setValue:](v5, "setValue:", v16);
  -[CHSharingImageTitleAndValueInfo setUnit:](v5, "setUnit:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nonGradientTextColor"));
  -[CHSharingImageTitleAndValueInfo setValueColor:](v5, "setValueColor:", v18);

  return v5;
}

- (id)_shareIconForWorkout:(id)a3 routeImage:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  CGFloat v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  UIImage *ImageFromCurrentImageContext;
  void *v43;
  _QWORD v45[4];
  id v46;
  CGSize v47;

  v6 = a3;
  if (objc_msgSend(v6, "fiui_isConnectedGymWorkout"))
    v7 = -[CHWorkoutFormattingManager hasConnectedGymVendorIconForWorkout:](self, "hasConnectedGymVendorIconForWorkout:", v6);
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceRevision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "source"));
  v10 = objc_msgSend(v9, "_hasFirstPartyBundleID");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceRevision"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  if ((objc_msgSend(v12, "_isAppleWatch") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v6, "_isWatchWorkout");

  v14 = objc_msgSend(v6, "workoutActivityType");
  if ((v7 & 1) != 0)
    v15 = 0;
  else
    v15 = v10 & v13;
  v16 = objc_alloc_init((Class)UIImageView);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v14 == (id)84)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors diveColors](ARUIMetricColors, "diveColors"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nonGradientTextColor"));

    v19 = FIUICircularImage(v18, 20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    objc_msgSend(v16, "setImage:", v20);

  }
  else if (v15)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.28627451, 0.37254902, 0.145098039, 1.0));
    v22 = v21;
    if (a4)
    {
      v23 = v21;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nonGradientTextColor"));

    }
    v25 = FIUICircularImage(v23, 20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v16, "setImage:", v26);

  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10005AEF4;
    v45[3] = &unk_100777DF8;
    v46 = v16;
    -[CHWorkoutFormattingManager fetchIconImageForWorkout:context:completion:](self, "fetchIconImageForWorkout:context:completion:", v6, CFSTR("WorkoutDetailDisplayContext"), v45);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIWorkoutActivityType activityTypeWithWorkout:](FIUIWorkoutActivityType, "activityTypeWithWorkout:", v6));
  v28 = FIUIStaticWorkoutIconImage(v27, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageWithRenderingMode:", 2));

  v31 = objc_alloc_init((Class)UIImageView);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v31, "setImage:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
  objc_msgSend(v32, "size");
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
  objc_msgSend(v35, "size");
  v47.width = v34;
  UIGraphicsBeginImageContextWithOptions(v47, 0, 0.0);

  if (v14 == (id)84)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors diveColors](ARUIMetricColors, "diveColors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "valueDisplayColor"));
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "nonGradientTextColor"));
  }
  v38 = v37;
  objc_msgSend(v37, "setFill");
  if (((a4 == 0) & v15) != 0)
    v39 = 0.2;
  else
    v39 = 1.0;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "image"));
  objc_msgSend(v40, "drawAtPoint:blendMode:alpha:", 0, 0.0, 0.0, v39);

  if (v15)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "image"));
    objc_msgSend(v41, "drawInRect:blendMode:alpha:", 0, 3.0, 3.0, 14.0, 14.0, 1.0);

  }
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v43 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v43;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging(self, a2);
  v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[AppProtection] appProtectionSubjectsChanged", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AFAC;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateHiddenAppBundleIds
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *hiddenApplicationBundleIds;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APApplication hiddenApplications](APApplication, "hiddenApplications", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "bundleIdentifier"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (NSArray *)objc_msgSend(v3, "copy");
  hiddenApplicationBundleIds = self->_hiddenApplicationBundleIds;
  self->_hiddenApplicationBundleIds = v10;

}

- (CHWorkoutDataCalculator)dataCalculator
{
  return self->_dataCalculator;
}

- (BOOL)shouldFakeData
{
  return self->_shouldFakeData;
}

- (void)setShouldFakeData:(BOOL)a3
{
  self->_shouldFakeData = a3;
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_dataCalculator, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_hiddenApplicationBundleIds, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (BOOL)hasWeatherConditionForWorkout:(id)a3 workoutActivity:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  CHWorkoutFormattingManager *v12;
  uint64_t v13;
  uint64_t v15;

  v7 = sub_100047110(&qword_10082E268);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_10030A4D4(v10, a4, (uint64_t)v9);
  v13 = type metadata accessor for WeatherCondition(0);
  LOBYTE(a4) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v9, 1, v13) != 1;
  sub_10001BE90((uint64_t)v9, &qword_10082E268);

  return (char)a4;
}

@end
