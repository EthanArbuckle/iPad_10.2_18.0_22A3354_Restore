@implementation CHMoveModeUtilities

+ (void)saveActivityMoveModeAndDefaultGoalSamplesForActivityMoveMode:(int64_t)a3 healthStore:(id)a4 formattingManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  int64_t v46;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)FIActivitySettingsController), "initWithHealthStore:", v7);
  objc_msgSend(v9, "populateExistingCharacteristics");
  v10 = objc_msgSend(v9, "biologicalSex");
  v11 = v10;
  if (a3 == 2)
  {
    if (v10 == (id)2)
      v12 = 0.0;
    else
      v12 = 1.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "weight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9));
    objc_msgSend(v13, "doubleValueForUnit:", v14);
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "height"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 7));
    objc_msgSend(v17, "doubleValueForUnit:", v18);
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateOfBirth"));
    v22 = (double)FIAgeInYearsForDateOfBirth();

    v23 = FICMotionConditionForWheelchairUse(objc_msgSend(v9, "wheelchairUse"));
    v24 = FIUIActivityLevelsForFitnessJr(v8, v12, v16, v20, v22, (double)v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "weight"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leanBodyMass"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "height"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateOfBirth"));
    v30 = FIUICalculateBMR(v11, v26, v27, v28, v29, objc_msgSend(v9, "wheelchairUse"));

    v31 = FIUIActivityLevelsForBMR(v8, v30);
    v25 = objc_claimAutoreleasedReturnValue(v31);
  }
  v32 = (void *)v25;

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "hk_startOfDateByAddingDays:toDate:", 1, v34));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "components:fromDate:", _HKRequiredCalendarUnitsForCacheIndexDateComponents, v35));
  v37 = FIActivityMoveModeChangeSampleForDateComponents(a3, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000881C4;
  v42[3] = &unk_100779168;
  v43 = v32;
  v44 = v7;
  v45 = v35;
  v46 = a3;
  v39 = v35;
  v40 = v7;
  v41 = v32;
  objc_msgSend(v40, "saveObject:withCompletion:", v38, v42);

}

@end
