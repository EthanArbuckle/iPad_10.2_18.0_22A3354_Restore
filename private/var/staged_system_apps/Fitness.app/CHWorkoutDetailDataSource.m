@implementation CHWorkoutDetailDataSource

- (CHWorkoutDetailDataSource)initWithTableView:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6 model:(id)a7 fitnessAppContext:(id)a8 formattingManager:(id)a9 badgeImageFactory:(id)a10 achievementLocalizationProvider:(id)a11 awardsDataProvider:(id)a12 fiuiFormattingManager:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  CHWorkoutDetailDataSource *v25;
  void *v26;
  char isSwimmingActivity;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  id v34;
  id WeakRetained;
  id v36;
  uint64_t v37;
  CHWorkoutDataCalculator *dataCalculator;
  unsigned __int8 v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  CHWorkoutRouteMapGenerator *v44;
  __objc2_class **v45;
  CHWorkoutRouteMapGenerator *v46;
  CHWorkoutRouteMapGenerator *snapshotGenerator;
  CHDivingDataCalculator *v48;
  CHDivingDataCalculator *divingDataCalculator;
  id v50;
  HKKeyValueDomain *v51;
  HKKeyValueDomain *trackValueDomain;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  id obj;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  objc_super v80;
  CGRect v81;

  v72 = a3;
  v69 = a4;
  v18 = a4;
  v70 = a5;
  v19 = a5;
  obj = a6;
  v20 = a6;
  v68 = a7;
  v21 = a7;
  v78 = a8;
  v79 = a9;
  v77 = a10;
  v22 = v72;
  v76 = a11;
  v23 = v18;
  v24 = v20;
  v75 = a12;
  v74 = a13;
  v80.receiver = self;
  v80.super_class = (Class)CHWorkoutDetailDataSource;
  v25 = -[CHWorkoutDetailDataSource init](&v80, "init");
  if (!v25)
    goto LABEL_21;
  v71 = v19;
  v65 = v21;
  v66 = v24;
  if (objc_msgSend(v23, "workoutActivityType") == (id)46)
  {
    v25->_isSwimmingActivity = 1;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutConfiguration"));
    v25->_isSwimmingActivity = objc_msgSend(v26, "activityType") == (id)46;

    isSwimmingActivity = v25->_isSwimmingActivity;
    if (!isSwimmingActivity)
    {
LABEL_7:
      v28 = v72;
      v25->_workoutIsPoolSwim = isSwimmingActivity;
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v23, "fi_swimmingLocationType") == (id)1)
  {
    isSwimmingActivity = 1;
    goto LABEL_7;
  }
  v28 = v72;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workoutConfiguration"));
  v25->_workoutIsPoolSwim = objc_msgSend(v29, "swimmingLocationType") == (id)1;

LABEL_9:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sourceRevision"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "source"));
  v32 = objc_msgSend(v31, "_isAppleWatch");
  if ((v32 & 1) != 0 || (objc_msgSend(v23, "_isWatchWorkout") & 1) == 0)
  {
    v25->_workoutIsFirstParty = v32;
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_source"));
    v25->_workoutIsFirstParty = objc_msgSend(v33, "_hasFirstPartyBundleID");

  }
  v25->_isUnderwaterDive = objc_msgSend(v23, "workoutActivityType") == (id)84;
  objc_storeStrong((id *)&v25->_fiuiFormattingManager, a13);
  v25->_currentlySelectedSwimmingPaceFormat = 100;
  v25->_didSetInitialSwimmingPaceFormat = 0;
  v22 = v28;
  v34 = objc_storeWeak((id *)&v25->_tableView, v28);
  objc_msgSend(v28, "setEstimatedRowHeight:", 44.0);

  WeakRetained = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(WeakRetained, "setRowHeight:", UITableViewAutomaticDimension);

  v36 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v36, "setSectionHeaderTopPadding:", 0.0);

  objc_storeStrong((id *)&v25->_healthStore, obj);
  objc_storeStrong((id *)&v25->_formattingManager, a9);
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "dataCalculator"));
  dataCalculator = v25->_dataCalculator;
  v25->_dataCalculator = (CHWorkoutDataCalculator *)v37;

  objc_storeStrong((id *)&v25->_model, v68);
  objc_storeStrong((id *)&v25->_fitnessAppContext, a8);
  objc_storeStrong((id *)&v25->_workout, v69);
  objc_storeStrong((id *)&v25->_workoutActivity, v70);
  v39 = objc_msgSend(v23, "isMultiSportWorkout");
  if (v19)
    v40 = 0;
  else
    v40 = v39;
  v25->_isTopLevelMultisport = v40;
  v25->_hasActiveLocationQuery = 0;
  objc_storeStrong((id *)&v25->_badgeImageFactory, a10);
  objc_storeStrong((id *)&v25->_achievementLocalizationProvider, a11);
  objc_storeStrong((id *)&v25->_awardsDataProvider, a12);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout metadata](v25->_workout, "metadata"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", _HKPrivateMetadataKeyWorkoutExtendedMode));

  LODWORD(v41) = objc_msgSend(v42, "BOOLValue");
  v44 = [CHWorkoutRouteMapGenerator alloc];
  v45 = &off_100776FE0;
  if (!(_DWORD)v41)
    v45 = off_100776FD8;
  v46 = -[CHWorkoutRouteMapGenerator initWithPathRendererClass:](v44, "initWithPathRendererClass:", objc_opt_class(*v45, v43));
  snapshotGenerator = v25->_snapshotGenerator;
  v25->_snapshotGenerator = v46;

  if (v25->_isUnderwaterDive)
  {
    v48 = -[CHDivingDataCalculator initWithHealthStore:diveSession:formattingManager:]([CHDivingDataCalculator alloc], "initWithHealthStore:diveSession:formattingManager:", v25->_healthStore, v25->_workout, v25->_fiuiFormattingManager);
    divingDataCalculator = v25->_divingDataCalculator;
    v25->_divingDataCalculator = v48;

    -[CHDivingDataCalculator setDelegate:](v25->_divingDataCalculator, "setDelegate:", v25);
  }
  v50 = objc_alloc((Class)HKKeyValueDomain);
  v51 = (HKKeyValueDomain *)objc_msgSend(v50, "initWithCategory:domainName:healthStore:", 0, kHKNanolifestylePreferencesDomain, v25->_healthStore);
  trackValueDomain = v25->_trackValueDomain;
  v25->_trackValueDomain = v51;

  -[HKKeyValueDomain startObservation:](v25->_trackValueDomain, "startObservation:", v25);
  v25->_trackDistanceUnit = 1;
  -[CHWorkoutDetailDataSource _fetchPreferredTrackDistanceUnit](v25, "_fetchPreferredTrackDistanceUnit");
  -[CHWorkoutDetailDataSource _registerCellClasses](v25, "_registerCellClasses");
  -[CHWorkoutDetailDataSource _createTableItems](v25, "_createTableItems");
  -[CHWorkoutDetailDataSource _createCatalogItemViewModelIfNeeded](v25, "_createCatalogItemViewModelIfNeeded");
  v53 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v53, "setDataSource:", v25);

  v54 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v54, "setDelegate:", v25);

  v55 = objc_alloc((Class)UIView);
  v56 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v56, "bounds");
  v57 = objc_msgSend(v55, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v81), 0.0);
  v58 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v58, "setTableFooterView:", v57);

  v59 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v59, "setAllowsSelection:", 1);

  v60 = objc_loadWeakRetained((id *)&v25->_tableView);
  objc_msgSend(v60, "setSectionFooterHeight:", 0.0);

  -[CHWorkoutDetailDataSource _warmDataCalculatorCache](v25, "_warmDataCalculatorCache");
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v61, "addObserver:selector:name:object:", v25, "_handleFitnessUnitPreferencesDidChange", kFIUIFitnessUnitPreferencesDidChangeNotification, 0);

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[WOEffortBridges didUpdateDemoOverrideEffortValues](WOEffortBridges, "didUpdateDemoOverrideEffortValues"));
  objc_msgSend(v62, "addObserver:selector:name:object:", v25, "_handleDidUpdateDemoOverrideEffortValues", v63, 0);

  v19 = v71;
  v21 = v65;
  v24 = v66;
LABEL_21:

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  -[HKKeyValueDomain stopObservation:](self->_trackValueDomain, "stopObservation:", self);
  -[CHWorkoutDetailDataSource _stopRouteQueryIfNecessary](self, "_stopRouteQueryIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailDataSource;
  -[CHWorkoutDetailDataSource dealloc](&v3, "dealloc");
}

- (void)_createCatalogItemViewModelIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  HKWorkout *workout;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider"));
  v4 = objc_msgSend(v3, "isSeymourWorkout:", self->_workout);

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider"));
    workout = self->_workout;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009471C;
    v7[3] = &unk_100779410;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "fetchCatalogItemViewModelForWorkout:completion:", workout, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_fetchBurnBarScoreSummary
{
  void *v3;
  HKWorkout *workout;
  HKHealthStore *healthStore;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider"));
  workout = self->_workout;
  healthStore = self->_healthStore;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000948E8;
  v6[3] = &unk_100779438;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "fetchScoreSummaryForWorkout:healthStore:completion:", workout, healthStore, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_fetchPreferredTrackDistanceUnit
{
  HKKeyValueDomain *trackValueDomain;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  if (-[HKWorkout supportsTrackWorkout](self->_workout, "supportsTrackWorkout"))
  {
    trackValueDomain = self->_trackValueDomain;
    v8 = 0;
    v4 = objc_claimAutoreleasedReturnValue(-[HKKeyValueDomain numberForKey:error:](trackValueDomain, "numberForKey:error:", CFSTR("WOTrackWorkoutsUnit"), &v8));
    v5 = (void *)v4;
    if (v8)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
      -[CHWorkoutDetailDataSource setTrackDistanceUnit:](self, "setTrackDistanceUnit:", 1);
    if (objc_msgSend(v5, "intValue"))
      v7 = 1;
    else
      v7 = 3;
    -[CHWorkoutDetailDataSource setTrackDistanceUnit:](self, "setTrackDistanceUnit:", v7);

  }
}

- (void)setCurrentlySelectedSwimmingPaceFormat:(int64_t)a3
{
  void *v5;
  int v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD block[6];

  if (self->_currentlySelectedSwimmingPaceFormat != a3
    || !-[CHWorkoutDetailDataSource didSetInitialSwimmingPaceFormat](self, "didSetInitialSwimmingPaceFormat"))
  {
    -[CHWorkoutDetailDataSource setDidSetInitialSwimmingPaceFormat:](self, "setDidSetInitialSwimmingPaceFormat:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource swimmingSplitItems](self, "swimmingSplitItems"));
    v6 = dword_10083DFB8;

    if (v5 || v6 > 9)
    {
      dword_10083DFB8 = 0;
      self->_currentlySelectedSwimmingPaceFormat = a3;
      if (-[CHWorkoutDetailDataSource segmentsExpanded](self, "segmentsExpanded"))
        -[CHWorkoutDetailDataSource _updatePaceFormatForSets:](self, "_updatePaceFormatForSets:", a3);
      v8 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource swimmingSplitItems](self, "swimmingSplitItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_currentlySelectedSwimmingPaceFormat));
      v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "objectForKeyedSubscript:", v9));

      LOBYTE(v8) = -[CHWorkoutDetailDataSource splitsExpanded](self, "splitsExpanded");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
      v11 = v10;
      if ((v8 & 1) != 0 || !v24)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 8));

        v13 = objc_alloc_init((Class)NSMutableArray);
        v14 = objc_alloc_init((Class)NSMutableArray);
        if (objc_msgSend(v12, "count"))
        {
          v15 = 0;
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v15, 8));
            objc_msgSend(v13, "addObject:", v16);

            ++v15;
          }
          while (v15 < (unint64_t)objc_msgSend(v12, "count"));
        }
        if (objc_msgSend(v24, "count"))
        {
          v17 = 0;
          do
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 8));
            objc_msgSend(v14, "addObject:", v18);

            ++v17;
          }
          while (v17 < (unint64_t)objc_msgSend(v24, "count"));
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        objc_msgSend(v19, "beginUpdates");

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        objc_msgSend(v20, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 3);

        if (objc_msgSend(v24, "count"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
          objc_msgSend(v21, "setObject:atIndexedSubscript:", v24, 8);

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        objc_msgSend(v22, "insertRowsAtIndexPaths:withRowAnimation:", v14, 3);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        objc_msgSend(v23, "endUpdates");

      }
      else
      {
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v24, 8);
        v12 = v11;
      }

    }
    else
    {
      ++dword_10083DFB8;
      v7 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100094E14;
      block[3] = &unk_100779460;
      block[4] = self;
      block[5] = a3;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updatePaceFormatForSets:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 7));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paceFormatUpdatedBlock", (_QWORD)v14));

        if (v12)
        {
          v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paceFormatUpdatedBlock"));
          v13[2](v13, a3);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_registerCellClasses
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[17];

  v3 = objc_opt_class(CHWorkoutDetailTwoValueTableViewCell, a2);
  if (self->_isUnderwaterDive)
    v3 = objc_opt_class(CHDivingDetailMapTableViewCell, v4);
  v5 = v3;
  v41[0] = objc_opt_class(CHWorkoutDetailSummaryTableViewCell, v4);
  v41[1] = v5;
  v41[2] = objc_opt_class(CHWorkoutDetailEffortTableViewCell, v6);
  v41[3] = objc_opt_class(CHWorkoutDetailPaceTableViewCell, v7);
  v41[4] = objc_opt_class(CHWorkoutDetailActivityTableViewCell, v8);
  v41[5] = objc_opt_class(CHWorkoutDetailFourColumnIntervalTableViewCell, v9);
  v41[6] = objc_opt_class(CHWorkoutDetailFourColumnTrackLapTableViewCell, v10);
  v41[7] = objc_opt_class(CHWorkoutDetailFourColumnSwimmingSetTableViewCell, v11);
  v41[8] = objc_opt_class(CHWorkoutDetailFourColumnSplitTableViewCell, v12);
  v41[9] = objc_opt_class(CHWorkoutDetailFourColumnDownhillRunTableViewCell, v13);
  v41[10] = objc_opt_class(CHWorkoutDetailFourColumnSegmentTableViewCell, v14);
  v41[11] = objc_opt_class(CHWorkoutDetailBurnBarTableViewCell, v15);
  v41[12] = objc_opt_class(CHWorkoutDetailHeartRateTableViewCell, v16);
  v41[13] = objc_opt_class(CHWorkoutDetailPowerTableViewCell, v17);
  v41[14] = objc_opt_class(CHWorkoutDetailMapAndWeatherTableViewCell, v18);
  v41[15] = objc_opt_class(CHWorkoutDetailGuidedRunMediaMomentsTableViewCell, v19);
  v41[16] = objc_opt_class(CHWorkoutDetailAwardTableViewCell, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 17));
  -[CHWorkoutDetailDataSource setCellClassesBySection:](self, "setCellClassesBySection:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
  if (objc_msgSend(v22, "count") != (id)17)
    sub_1005F2918();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection", 0));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(objc_class **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        v30 = NSStringFromClass(v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        objc_msgSend(v29, "registerClass:forCellReuseIdentifier:", v28, v31);

        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v25);
  }

  v33 = objc_opt_class(_TtC10FitnessApp26WorkoutDetailSectionHeader, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[ActivityTileSectionHeader reuseIdentifier](_TtC10FitnessApp26WorkoutDetailSectionHeader, "reuseIdentifier"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  objc_msgSend(v35, "registerClass:forHeaderFooterViewReuseIdentifier:", v33, v34);

}

- (void)_warmDataCalculatorCache
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  if (objc_msgSend(v3, "workoutActivityType") == (id)37)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v5 = objc_msgSend(v4, "workoutActivityType");

    if (v5 != (id)13)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  objc_msgSend(v6, "cadenceSamplesForWorkout:workoutActivity:completion:", v7, 0, &stru_1007794A0);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  objc_msgSend(v9, "powerSamplesForWorkout:workoutActivity:completion:", v8, 0, &stru_1007794C0);

}

- (void)_handleFitnessUnitPreferencesDidChange
{
  id WeakRetained;

  -[CHWorkoutDetailDataSource _createValuesSection](self, "_createValuesSection");
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "reloadData");

}

- (void)_handleDidUpdateDemoOverrideEffortValues
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 2));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 5);

}

- (void)didUpdateKeyValueDomain:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095454;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_createTableItems
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSBundle *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[17];

  v3 = objc_alloc_init((Class)NSMutableArray);
  -[CHWorkoutDetailDataSource setTableItemsBySection:](self, "setTableItemsBySection:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
      objc_msgSend(v7, "addObject:", &__NSArray0__struct);

      ++v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
      v9 = objc_msgSend(v8, "count");

    }
    while ((unint64_t)v9 > v6);
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v48[0] = v47;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = v10;
  if (self->_isUnderwaterDive)
    v11 = CFSTR("UNDERWATER_DIVING_DETAILS");
  else
    v11 = CFSTR("WORKOUT_DETAILS_TITLE");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1007AE1D0, CFSTR("Localizable")));
  v48[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v48[2] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v48[3] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v48[4] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("WORKOUT_INTERVAL_HEADER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[5] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("WORKOUT_LAPS_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[6] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("WORKOUT_AUTO_SETS_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[7] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SPLITS_HEADER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[8] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("WORKOUT_DOWNHILL_RUNS_HEADER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[9] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SEGMENT_HEADER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[10] = v30;
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
  v29 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("BURN_BAR"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v48[11] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("WORKOUT_HEART_RATE_PAGE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[12] = v26;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WORKOUT_POWER_PAGE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[13] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ROUTE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[14] = v17;
  v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MEDIA_MOMENTS_IMAGES"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v48[15] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AWARDS"), &stru_1007AE1D0, CFSTR("Localizable")));
  v48[16] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 17));
  -[CHWorkoutDetailDataSource setTableSectionHeaders:](self, "setTableSectionHeaders:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableSectionHeaders](self, "tableSectionHeaders"));
  if (objc_msgSend(v25, "count") != (id)17)
    sub_1005F2940();

  -[CHWorkoutDetailDataSource _createSummarySection](self, "_createSummarySection");
  -[CHWorkoutDetailDataSource _createMultiSportSection](self, "_createMultiSportSection");
  if (self->_isUnderwaterDive)
    -[CHWorkoutDetailDataSource _createDiveSection](self, "_createDiveSection");
  else
    -[CHWorkoutDetailDataSource _createValuesSection](self, "_createValuesSection");
  if (!self->_isTopLevelMultisport)
  {
    -[CHWorkoutDetailDataSource _createEffortSection](self, "_createEffortSection");
    -[CHWorkoutDetailDataSource _createIntervalsSection](self, "_createIntervalsSection");
    -[CHWorkoutDetailDataSource _createTrackLapsSection](self, "_createTrackLapsSection");
    -[CHWorkoutDetailDataSource _createSplitsSection](self, "_createSplitsSection");
    -[CHWorkoutDetailDataSource _createDownhillRunsSection](self, "_createDownhillRunsSection");
    -[CHWorkoutDetailDataSource _createSegmentsSection](self, "_createSegmentsSection");
    -[CHWorkoutDetailDataSource _createSwimSetsSection](self, "_createSwimSetsSection");
    -[CHWorkoutDetailDataSource _createRouteAndWeatherSection](self, "_createRouteAndWeatherSection");
  }
  -[CHWorkoutDetailDataSource _createAwardSection](self, "_createAwardSection");
}

- (void)_createSummarySection
{
  _CHWorkoutDetailSummaryLocationItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  _QWORD v11[4];
  _CHWorkoutDetailSummaryLocationItem *v12;
  _QWORD v13[4];
  _CHWorkoutDetailSummaryLocationItem *v14;
  _CHWorkoutDetailSummaryLocationItem *v15;

  v3 = objc_alloc_init(_CHWorkoutDetailSummaryLocationItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
  -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", objc_msgSend(v4, "objectAtIndexedSubscript:", 0));

  v15 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 0);

  if (-[CHWorkoutDetailDataSource workoutIsPoolSwim](self, "workoutIsPoolSwim"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100095C5C;
    v13[3] = &unk_1007794E8;
    v10 = (id *)&v14;
    v14 = v3;
    objc_msgSend(v7, "swimDistanceByStrokeStyleForWorkout:workoutActivity:completion:", v8, v9, v13);
LABEL_5:

    goto LABEL_6;
  }
  if (-[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100095CF0;
    v11[3] = &unk_1007794E8;
    v10 = (id *)&v12;
    v12 = v3;
    objc_msgSend(v7, "openWaterSwimDistanceByStrokeStyleForWorkout:workoutActivity:completion:", v8, v9, v11);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_createMultiSportSection
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _CHWorkoutDetailMultiSportTableItem *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_isTopLevelMultisport)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout workoutActivities](self->_workout, "workoutActivities", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
          v10 = objc_alloc_init(_CHWorkoutDetailMultiSportTableItem);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
          -[_CHWorkoutDetailTableItem setCellClass:](v10, "setCellClass:", objc_msgSend(v11, "objectAtIndexedSubscript:", 4));

          -[_CHWorkoutDetailMultiSportTableItem setWorkoutActivity:](v10, "setWorkoutActivity:", v9);
          objc_msgSend(v3, "addObject:", v10);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v12, "setObject:atIndexedSubscript:", v3, 4);

    -[CHWorkoutDetailDataSource _insertMultiSportSection](self, "_insertMultiSportSection");
  }
}

- (void)_createValuesSection
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _CHWorkoutDetailTableItem *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource _createSubItemsForWorkoutMetrics](self, "_createSubItemsForWorkoutMetrics"));
  v3 = (unint64_t)objc_msgSend(v15, "count");
  v4 = ((unint64_t)objc_msgSend(v15, "count") & 1) + (v3 >> 1);
  v5 = objc_alloc_init((Class)NSMutableArray);
  if (v4)
  {
    v6 = 0;
    do
    {
      if (v4 == 1)
      {
        v7 = ((unint64_t)objc_msgSend(v15, "count") & 1) == 0;
        v8 = v15;
        if (v7)
          v9 = 2;
        else
          v9 = 1;
      }
      else
      {
        v9 = 2;
        v8 = v15;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v6, v9));
      v11 = objc_alloc_init(_CHWorkoutDetailTableItem);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
      -[_CHWorkoutDetailTableItem setCellClass:](v11, "setCellClass:", objc_msgSend(v12, "objectAtIndexedSubscript:", 1));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v10));
      -[_CHWorkoutDetailTableItem setSubItems:](v11, "setSubItems:", v13);

      objc_msgSend(v5, "addObject:", v11);
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  objc_msgSend(v14, "setObject:atIndexedSubscript:", v5, 1);

}

- (void)_createEffortSection
{
  _CHWorkoutDetailEffortItem *v3;
  void *v4;
  void *v5;
  void *v6;
  _CHWorkoutDetailEffortItem *v7;

  if (!self->_isUnderwaterDive && (FIIsTinkerVegaOrFitnessJunior() & 1) == 0)
  {
    if (_os_feature_enabled_impl("Fitness", "Harmonia"))
    {
      v3 = objc_alloc_init(_CHWorkoutDetailEffortItem);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
      -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", objc_msgSend(v4, "objectAtIndexedSubscript:", 2));

      -[_CHWorkoutDetailEffortItem setEffortQuantity:](v3, "setEffortQuantity:", 0);
      v7 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 2);

    }
  }
}

- (void)_createDiveSection
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  _CHWorkoutDetailTableItem *v7;

  v7 = objc_alloc_init(_CHWorkoutDetailTableItem);
  -[_CHWorkoutDetailTableItem setCellClass:](v7, "setCellClass:", objc_opt_class(CHDivingDetailMapTableViewCell, v3));
  -[_CHWorkoutDetailTableItem setSubItems:](v7, "setSubItems:", &__NSArray0__struct);
  v4 = 3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  do
  {
    objc_msgSend(v5, "addObject:", v7);
    --v4;
  }
  while (v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 1);

}

- (void)_createTrackLapsSection
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v4 = objc_msgSend(v3, "supportsTrackWorkout");

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009634C;
    v7[3] = &unk_100779538;
    objc_copyWeak(v8, &location);
    v8[1] = (id)6;
    objc_msgSend(v5, "trackLapsForWorkout:completion:", v6, v7);

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_shouldShowSplits
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v6 = objc_msgSend(v3, "supportsPaceForWorkout:workoutActivity:", v4, v5);

  return v6;
}

- (void)_createSplitsSection
{
  void *v3;
  void *v4;
  id v5;

  if (-[CHWorkoutDetailDataSource _shouldShowSplits](self, "_shouldShowSplits"))
  {
    if (-[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity"))
    {
      -[CHWorkoutDetailDataSource _createSwimSplits](self, "_createSwimSplits");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fiui_workoutCustomSplits"));
      v5 = objc_msgSend(v4, "count");

      if (v5)
        -[CHWorkoutDetailDataSource _createCustomSplits](self, "_createCustomSplits");
      else
        -[CHWorkoutDetailDataSource _createNormalSplits](self, "_createNormalSplits");
    }
  }
}

- (void)_createNormalSplits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout fiui_activityType](self->_workout, "fiui_activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100096850;
  v8[3] = &unk_100779588;
  objc_copyWeak(v10, &location);
  v7 = v3;
  v9 = v7;
  v10[1] = (id)8;
  objc_msgSend(v4, "splitsForWorkout:workoutActivity:completion:", v5, v6, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_createCustomSplits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout fiui_activityType](self->_workout, "fiui_activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100096D00;
  v8[3] = &unk_100779588;
  objc_copyWeak(v10, &location);
  v7 = v3;
  v9 = v7;
  v10[1] = (id)8;
  objc_msgSend(v4, "customSplitsForWorkout:workoutActivity:completion:", v5, v6, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_createSwimSplits
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100097180;
  v6[3] = &unk_1007795D8;
  objc_copyWeak(v7, &location);
  v7[1] = (id)8;
  objc_msgSend(v3, "swimmingSplitsForWorkout:workoutActivity:completion:", v4, v5, v6);

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_createSegmentsSection
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];
  id location;

  if (!-[CHWorkoutDetailDataSource workoutIsPoolSwim](self, "workoutIsPoolSwim"))
  {
    if (-[CHWorkoutDetailDataSource workoutIsFirstParty](self, "workoutIsFirstParty"))
    {
      objc_initWeak(&location, self);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100097700;
      v5[3] = &unk_100779538;
      objc_copyWeak(v6, &location);
      v6[1] = (id)10;
      objc_msgSend(v3, "segmentsForWorkout:completion:", v4, v5);

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_createDownhillRunsSection
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fiui_activityType"));
  v5 = objc_msgSend(v4, "bridge_isDownhillSnowSport");

  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100097AA8;
    v8[3] = &unk_100779538;
    objc_copyWeak(v9, &location);
    v9[1] = (id)9;
    objc_msgSend(v6, "downhillRunsForWorkout:completion:", v7, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_createIntervalsSection
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v4 = objc_msgSend(v3, "isIntervalWorkout");

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100097F18;
    v7[3] = &unk_100779538;
    objc_copyWeak(v8, &location);
    v8[1] = (id)5;
    objc_msgSend(v5, "intervalsForWorkout:completion:", v6, v7);

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

- (void)_createSwimSetsSection
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  if (-[CHWorkoutDetailDataSource workoutIsPoolSwim](self, "workoutIsPoolSwim")
    && -[CHWorkoutDetailDataSource workoutIsFirstParty](self, "workoutIsFirstParty"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    if (objc_msgSend(v3, "isIntervalWorkout"))
    {
      v4 = sub_1000D3E58();

      if ((v4 & 1) == 0)
        return;
    }
    else
    {

    }
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000982F0;
    v8[3] = &unk_100779538;
    objc_copyWeak(v9, &location);
    v9[1] = (id)7;
    objc_msgSend(v5, "swimmingSetsForWorkout:workoutActivity:completion:", v6, v7, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)_createBurnBarSection
{
  _CHWorkoutDetailBurnBarTableItem *v3;
  void *v4;
  void *v5;
  void *v6;
  _CHWorkoutDetailBurnBarTableItem *v7;

  if (-[CHCatalogItemViewModel isSeymourPairedWorkout](self->_catalogItemViewModel, "isSeymourPairedWorkout"))
  {
    v3 = objc_alloc_init(_CHWorkoutDetailBurnBarTableItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
    -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", objc_msgSend(v4, "objectAtIndexedSubscript:", 11));

    v7 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 11);

    -[CHWorkoutDetailDataSource _insertBurnBarSection](self, "_insertBurnBarSection");
  }
}

- (void)_createHeartRateSectionWithHeartRateReadings:(id)a3 averageHeartRate:(id)a4 recoveryHeartRateReadings:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CHWorkoutDetailHeartRateTableItem *v11;
  void *v12;
  void *v13;
  void *v14;
  _CHWorkoutDetailHeartRateTableItem *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc_init(_CHWorkoutDetailHeartRateTableItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
    -[_CHWorkoutDetailTableItem setCellClass:](v11, "setCellClass:", objc_msgSend(v12, "objectAtIndexedSubscript:", 12));

    -[_CHWorkoutDetailHeartRateTableItem setHeartRateReadings:](v11, "setHeartRateReadings:", v8);
    -[_CHWorkoutDetailHeartRateTableItem setAverageHeartRate:](v11, "setAverageHeartRate:", v9);
    -[_CHWorkoutDetailHeartRateTableItem setRecoveryHeartRateReadings:](v11, "setRecoveryHeartRateReadings:", v10);
    v15 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, 12);

    -[CHWorkoutDetailDataSource _insertHeartRateSection](self, "_insertHeartRateSection");
  }

}

- (void)_createRouteAndWeatherSection
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  HKAnchoredObjectQuery *v7;
  HKAnchoredObjectQuery *routeQuery;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  id location;

  -[CHWorkoutDetailDataSource _stopRouteQueryIfNecessary](self, "_stopRouteQueryIfNecessary");
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100098940;
  v13[3] = &unk_1007796A0;
  objc_copyWeak(&v14, &location);
  v3 = objc_retainBlock(v13);
  v4 = objc_alloc((Class)HKAnchoredObjectQuery);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HKSeriesType workoutRouteType](HKSeriesType, "workoutRouteType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuery predicateForObjectsFromWorkout:](HKQuery, "predicateForObjectsFromWorkout:", self->_workout));
  v7 = (HKAnchoredObjectQuery *)objc_msgSend(v4, "initWithType:predicate:anchor:limit:resultsHandler:", v5, v6, 0, 0, v3);
  routeQuery = self->_routeQuery;
  self->_routeQuery = v7;

  v9 = -[HKAnchoredObjectQuery setUpdateHandler:](self->_routeQuery, "setUpdateHandler:", v3);
  _HKInitializeLogging(v9, v10);
  v11 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[routes] Starting anchored route query", v12, 2u);
  }
  -[CHWorkoutDetailDataSource setHasActiveLocationQuery:](self, "setHasActiveLocationQuery:", 1);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_routeQuery);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_stopRouteQueryIfNecessary
{
  HKAnchoredObjectQuery *routeQuery;

  if (self->_routeQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    routeQuery = self->_routeQuery;
    self->_routeQuery = 0;

  }
}

- (void)fetchLocations
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationFetcher](self, "locationFetcher"));

  if (!v3)
  {
    v4 = objc_alloc((Class)HKLocationFetcher);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIModel healthStore](self->_model, "healthStore"));
    v6 = objc_msgSend(v4, "initWithHealthStore:", v5);
    -[CHWorkoutDetailDataSource setLocationFetcher:](self, "setLocationFetcher:", v6);

  }
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100098CA4;
  v14[3] = &unk_1007796C8;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  v7 = objc_retainBlock(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationFetcher](self, "locationFetcher"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    objc_msgSend(v9, "fetchLocationsFromWorkout:workoutActivity:samplesHandler:", v10, v11, v7);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", _HKPrivateMetadataKeyWorkoutExtendedMode));

    LODWORD(v13) = objc_msgSend(v9, "BOOLValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationFetcher](self, "locationFetcher"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    objc_msgSend(v10, "fetchLocationsFromWorkout:applyThreshold:withSamplesHandler:", v11, v13 ^ 1, v7);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_createAwardSection
{
  CHAwardsDataProvider *awardsDataProvider;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _CHWorkoutDetailAwardItem *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (AAUIShouldUseNewTrophyCase(self))
  {
    awardsDataProvider = self->_awardsDataProvider;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout UUID](self->_workout, "UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAwardsDataProvider achievementsForWorkoutIdentifier:](awardsDataProvider, "achievementsForWorkoutIdentifier:", v5));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }
  v7 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v14 = objc_alloc_init(_CHWorkoutDetailAwardItem);
        -[_CHWorkoutDetailAwardItem setAchievement:](v14, "setAchievement:", v13, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
        -[_CHWorkoutDetailTableItem setCellClass:](v14, "setCellClass:", objc_msgSend(v15, "objectAtIndexedSubscript:", 16));

        objc_msgSend(v7, "addObject:", v14);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  objc_msgSend(v16, "setObject:atIndexedSubscript:", v7, 16);

}

- (void)_createGuidedRunMediaMomentsSection
{
  _CHWorkoutDetailGuidedRunMediaMomentsTableItem *v3;
  void *v4;
  void *v5;
  void *v6;
  _CHWorkoutDetailGuidedRunMediaMomentsTableItem *v7;

  if (-[CHCatalogItemViewModel isSeymourGuidedRunWorkout](self->_catalogItemViewModel, "isSeymourGuidedRunWorkout"))
  {
    v3 = objc_alloc_init(_CHWorkoutDetailGuidedRunMediaMomentsTableItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
    -[_CHWorkoutDetailTableItem setCellClass:](v3, "setCellClass:", objc_msgSend(v4, "objectAtIndexedSubscript:", 15));

    v7 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 15);

    -[CHWorkoutDetailDataSource _insertGuidedRunMediaMomentsSection](self, "_insertGuidedRunMediaMomentsSection");
  }
}

- (BOOL)_createRouteAndWeatherCellIfNeeded
{
  BOOL v2;
  void *v4;
  void *v5;
  _CHWorkoutDetailRouteAndWeatherItem *v6;
  void *v7;
  void *v8;
  void *v9;
  _CHWorkoutDetailRouteAndWeatherItem *v11;

  if (self->_isTopLevelMultisport)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 14));
  v6 = (_CHWorkoutDetailRouteAndWeatherItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v2 = v6 == 0;
  if (!v6)
  {
    v6 = objc_alloc_init(_CHWorkoutDetailRouteAndWeatherItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
    -[_CHWorkoutDetailTableItem setCellClass:](v6, "setCellClass:", objc_msgSend(v7, "objectAtIndexedSubscript:", 14));

    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, 14);

  }
  return v2;
}

- (void)_handleLocations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "count");
  if (v5 > 1
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationReadings](self, "locationReadings")),
        v8 = (uint64_t)objc_msgSend(v7, "count"),
        v7,
        v8 < 2))
  {
    _HKInitializeLogging(v5, v6);
    v10 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v27 = 134217984;
      v28 = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[routes] Storing %li locations", (uint8_t *)&v27, 0xCu);

    }
    -[CHWorkoutDetailDataSource setLocationReadings:](self, "setLocationReadings:", v4);
    -[CHWorkoutDetailDataSource updateSharingImage](self, "updateSharingImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

    objc_msgSend(v15, "setFirstCoordinate:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstCoordinateUpdatedBlock"));

    if (v16)
    {
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstCoordinateUpdatedBlock"));
      ((void (**)(_QWORD, void *))v17)[2](v17, v12);

    }
    if (-[CHWorkoutDetailDataSource _createRouteAndWeatherCellIfNeeded](self, "_createRouteAndWeatherCellIfNeeded"))
      v18 = 3;
    else
      v18 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 14));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationReadings](self, "locationReadings"));
    objc_msgSend(v21, "setLocationReadings:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
    objc_msgSend(v23, "beginUpdates");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 14));
    objc_msgSend(v24, "reloadSections:withRowAnimation:", v25, v18);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
    objc_msgSend(v26, "endUpdates");

    -[CHWorkoutDetailDataSource _presentPageAwaitingLocationData](self, "_presentPageAwaitingLocationData");
  }
  else
  {
    _HKInitializeLogging(v5, v6);
    v9 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[routes] Discarding location updates that would wipe out known good data.", (uint8_t *)&v27, 2u);
    }
  }

}

- (void)_presentPageAwaitingLocationData
{
  int64_t sectionAwaitingLocationDataForPresenting;

  sectionAwaitingLocationDataForPresenting = self->_sectionAwaitingLocationDataForPresenting;
  if (sectionAwaitingLocationDataForPresenting == 14 || sectionAwaitingLocationDataForPresenting == 1)
  {
    -[CHWorkoutDetailDataSource presentPageForSection:](self, "presentPageForSection:");
    self->_sectionAwaitingLocationDataForPresenting = -1;
  }
}

- (void)updateSharingImage
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  CHWorkoutRouteMapGenerator *snapshotGenerator;
  void *v8;
  void *v9;
  CHWorkoutRouteMapGenerator *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  if (objc_msgSend(v3, "workoutActivityType") == (id)84)
    v4 = 1;
  else
    v4 = 2;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationReadings](self, "locationReadings"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= v4)
  {
    objc_initWeak(&location, self);
    snapshotGenerator = self->_snapshotGenerator;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource locationReadings](self, "locationReadings"));
    -[CHWorkoutRouteMapGenerator setLocationReadings:](snapshotGenerator, "setLocationReadings:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", &stru_100779708));
    v10 = self->_snapshotGenerator;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100099B7C;
    v11[3] = &unk_100779730;
    objc_copyWeak(&v12, &location);
    -[CHWorkoutRouteMapGenerator snapshotWithSize:lineWidth:traitCollection:insets:completion:](v10, "snapshotWithSize:lineWidth:traitCollection:insets:completion:", v9, v11, 270.0, 240.0, 3.0, 16.0, 80.0, 125.0, 24.0);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

- (id)_createSubItemsForWorkoutMetrics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  _CHWorkoutDetailTableSubItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _CHWorkoutDetailTableSubItem *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id WeakRetained;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _CHWorkoutDetailTableSubItem *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _CHWorkoutDetailTableSubItem *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned int v89;
  _CHWorkoutDetailTableSubItem *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unsigned int v101;
  _CHWorkoutDetailTableSubItem *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  unsigned int v112;
  _CHWorkoutDetailTableSubItem *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  unsigned int v123;
  _CHWorkoutDetailTableSubItem *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned int v134;
  _CHWorkoutDetailTableSubItem *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  unsigned int v150;
  _CHWorkoutDetailTableSubItem *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  _CHWorkoutDetailTableSubItem *v161;
  void *v162;
  void *v163;
  void *v164;
  _CHWorkoutDetailTableSubItem *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  _QWORD *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  _CHWorkoutDetailTableSubItem *v184;
  void *v185;
  void *v186;
  _BOOL8 v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  _CHWorkoutDetailTableSubItem *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  unsigned int v208;
  _CHWorkoutDetailTableSubItem *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  unsigned int v220;
  void *v221;
  void *v222;
  void *v223;
  unsigned int v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  _CHWorkoutDetailTableSubItem *v229;
  void *v230;
  void *v231;
  CHWorkoutDownhillRunsStats *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  id v238;
  _CHWorkoutDetailTableSubItem *v239;
  _CHWorkoutDetailTableSubItem *v240;
  _CHWorkoutDetailTableSubItem *v241;
  _QWORD v242[5];
  _QWORD v243[4];
  id v244;
  BOOL v245;
  _QWORD v246[4];
  _CHWorkoutDetailTableSubItem *v247;
  CHWorkoutDetailDataSource *v248;
  id location[2];

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType"));
  v6 = v5;
  if (v5)
  {
    v238 = v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v238 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fiui_activityType"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v10 = objc_msgSend(v8, "workoutHasGoalCompletionEvent:", v9);

  if (v10)
  {
    v11 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WORKOUT_PACER_RESULT_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v11, "setTitleString:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "formattedGoalCompletedDurationForWorkout:context:", v15, CFSTR("WorkoutsListDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v11, "setValueAttrString:", v16);

    objc_msgSend(v3, "addObject:", v11);
    v17 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    objc_msgSend(v3, "addObject:", v17);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v19 = objc_msgSend(v18, "shouldShowRaceResults");

    if (!v19)
      goto LABEL_9;
    v11 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WORKOUT_RACE_TIME"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v11, "setTitleString:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "formattedRaceTimeForWorkout:workoutActivity:context:", v23, v24, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v11, "setValueAttrString:", v25);

    objc_msgSend(v3, "addObject:", v11);
    v17 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("WORKOUT_RACE_PACE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v17, "setTitleString:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "metadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HKWorkout kRaceWorkoutAveragePaceOnRouteMetadataKey](HKWorkout, "kRaceWorkoutAveragePaceOnRouteMetadataKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", v30));

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "formattedRacePaceOrSpeedForWorkout:metersPerSecond:context:", v33, v31, CFSTR("WorkoutsListDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v17, "setValueAttrString:", v34);

    objc_msgSend(v3, "addObject:", v17);
  }

LABEL_9:
  v241 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("WORKOUT_TIME_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[_CHWorkoutDetailTableSubItem setTitleString:](v241, "setTitleString:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "formattedDurationForWorkout:workoutActivity:context:", v38, v39, CFSTR("WorkoutDetailDisplayContext")));
  -[_CHWorkoutDetailTableSubItem setValueAttrString:](v241, "setValueAttrString:", v40);

  objc_msgSend(v3, "addObject:", v241);
  v240 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ELAPSED_TIME_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[_CHWorkoutDetailTableSubItem setTitleString:](v240, "setTitleString:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v44 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "formattedElapsedTimeForWorkout:workoutActivity:context:", v44, v45, CFSTR("WorkoutDetailDisplayContext")));
  -[_CHWorkoutDetailTableSubItem setValueAttrString:](v240, "setValueAttrString:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v241, "valueAttrString"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v240, "valueAttrString"));
  LOBYTE(v44) = objc_msgSend(v47, "isEqualToAttributedString:", v48);

  if ((v44 & 1) == 0)
    objc_msgSend(v3, "addObject:", v240);
  v239 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v52 = objc_msgSend(v49, "shouldShowDistanceForWorkout:workoutActivity:", v50, v51);

  if (v52)
  {
    if (objc_msgSend(v238, "bridge_isDownhillSnowSport"))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("WORKOUT_RUN_DISTANCE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("WORKOUT_DISTANCE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    }
    v55 = (void *)v54;
    -[_CHWorkoutDetailTableSubItem setTitleString:](v239, "setTitleString:", v54);

    WeakRetained = objc_loadWeakRetained(location);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "formattingManager"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "formattedDistanceForWorkout:workoutActivity:context:", v58, v59, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v239, "setValueAttrString:", v60);

    if ((objc_msgSend(v238, "bridge_isDownhillSnowSport") & 1) == 0)
      objc_msgSend(v3, "addObject:", v239);
  }
  if (-[HKWorkout _activityMoveMode](self->_workout, "_activityMoveMode") != (id)2)
  {
    v61 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "fitnessUIFormattingManager"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizationKeyForEnergyBaseKey:", CFSTR("WORKOUT_ACTIVE_ENERGY_TITLE")));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", v65, &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v61, "setTitleString:", v66);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "formattedActiveEnergyForWorkout:workoutActivity:context:", v68, v69, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v61, "setValueAttrString:", v70);

    objc_msgSend(v3, "addObject:", v61);
    v71 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "fitnessUIFormattingManager"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "localizationKeyForEnergyBaseKey:", CFSTR("WORKOUT_TOTAL_ENERGY_TITLE")));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", v75, &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v71, "setTitleString:", v76);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "formattedTotalEnergyForWorkout:workoutActivity:context:", v78, v79, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v71, "setValueAttrString:", v80);

    objc_msgSend(v3, "addObject:", v71);
  }
  if (self->_isTopLevelMultisport)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource _normalizeSubItemsArray:](self, "_normalizeSubItemsArray:", v3));
  }
  else
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v85 = objc_msgSend(v82, "supportsElevationAscendedForWorkout:workoutActivity:", v83, v84);

    if (v85)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v89 = objc_msgSend(v86, "hasElevationAscendedDataForWorkout:workoutActivity:", v87, v88);

      if (v89)
      {
        v90 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ELEVATION_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
        -[_CHWorkoutDetailTableSubItem setTitleString:](v90, "setTitleString:", v92);

        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "formattedElevationGainForWorkout:workoutActivity:context:", v94, v95, CFSTR("WorkoutDetailDisplayContext")));
        -[_CHWorkoutDetailTableSubItem setValueAttrString:](v90, "setValueAttrString:", v96);

        v97 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v90, "valueAttrString"));
        if (v97)
          objc_msgSend(v3, "addObject:", v90);

      }
    }
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v101 = objc_msgSend(v98, "hasAveragePowerForWorkout:workoutActivity:", v99, v100);

    if (v101)
    {
      v102 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("WORKOUT_AVERAGE_POWER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v102, "setTitleString:", v104);

      v105 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "formattedAveragePowerForWorkout:workoutActivity:context:", v106, v107, CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v102, "setValueAttrString:", v108);

      objc_msgSend(v3, "addObject:", v102);
    }
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v112 = objc_msgSend(v109, "hasStepCountForWorkout:workoutActivity:", v110, v111);

    if (v112)
    {
      v113 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STEP_COUNT_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v113, "setTitleString:", v115);

      v116 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "formattedStepCountForWorkout:workoutActivity:context:", v117, v118, CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v113, "setValueAttrString:", v119);

      objc_msgSend(v3, "addObject:", v113);
    }
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v123 = objc_msgSend(v120, "hasFlightsClimbedForWorkout:workoutActivity:", v121, v122);

    if (v123)
    {
      v124 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("WORKOUT_FLIGHTS_CLIMBED_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v124, "setTitleString:", v126);

      v127 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "formattedFlightsClimbedForWorkout:workoutActivity:context:", v128, v129, CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v124, "setValueAttrString:", v130);

      objc_msgSend(v3, "addObject:", v124);
    }
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v134 = objc_msgSend(v131, "hasAverageCadenceForWorkout:workoutActivity:", v132, v133);

    if (v134)
    {
      v135 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v136 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "fiui_activityType"));
      v138 = v137;
      if (v137)
      {
        v139 = v137;
      }
      else
      {
        v140 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
        v139 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "fiui_activityType"));

      }
      if (FIUIIsWorkoutTypePedestrianActivity(objc_msgSend(v139, "effectiveTypeIdentifier")))
      {
        v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v142 = objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "localizedStringForKey:value:table:", CFSTR("WORKOUT_AVERAGE_CADENCE_TITLE_PEDOMETER"), &stru_1007AE1D0, CFSTR("Localizable")));
      }
      else
      {
        v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v142 = objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "localizedStringForKey:value:table:", CFSTR("WORKOUT_AVERAGE_CADENCE_TITLE_CYCLING"), &stru_1007AE1D0, CFSTR("Localizable")));
      }
      v143 = (void *)v142;
      -[_CHWorkoutDetailTableSubItem setTitleString:](v135, "setTitleString:", v142);

      v144 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v145 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v146 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "formattedAverageCadenceForWorkout:workoutActivity:context:", v145, v146, CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v135, "setValueAttrString:", v147);

      objc_msgSend(v3, "addObject:", v135);
    }
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v150 = -[CHWorkoutDetailDataSource _showAveragePaceForWorkout:workoutActivity:](self, "_showAveragePaceForWorkout:workoutActivity:", v148, v149);

    if (v150)
    {
      v151 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v152 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      if (v152)
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      else
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "fiui_activityType"));
      v155 = FIUIDistanceTypeForActivityType(v154);

      if (FIUIPaceFormatForDistanceType(v155) == 4)
      {
        v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SPEED_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      }
      else
      {
        v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "localizedStringForKey:value:table:", CFSTR("WORKOUT_PACE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      }
      -[_CHWorkoutDetailTableSubItem setTitleString:](v151, "setTitleString:", v157);

      if (-[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity"))
      {
        v158 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
        v246[0] = _NSConcreteStackBlock;
        v246[1] = 3221225472;
        v246[2] = sub_10009B7B4;
        v246[3] = &unk_100779758;
        v247 = v151;
        v248 = self;
        objc_msgSend(v158, "swimmingPacePerHundredForWorkout:workoutActivity:completion:", v159, v160, v246);

        v161 = v247;
      }
      else
      {
        v161 = (_CHWorkoutDetailTableSubItem *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
        v162 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
        v163 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
        v164 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem formattedPaceOrSpeedForWorkout:workoutActivity:context:](v161, "formattedPaceOrSpeedForWorkout:workoutActivity:context:", v162, v163, CFSTR("WorkoutDetailDisplayContext")));
        -[_CHWorkoutDetailTableSubItem setValueAttrString:](v151, "setValueAttrString:", v164);

      }
      objc_msgSend(v3, "addObject:", v151);

    }
    if (!self->_isUnderwaterDive)
    {
      v165 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "localizedStringForKey:value:table:", CFSTR("WORKOUT_HEART_RATE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v165, "setTitleString:", v167);

      v168 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "formattedHeartRate:context:", 0, CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v165, "setValueAttrString:", v169);

      v170 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
      v171 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v172 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "averageHeartRateForWorkout:workoutActivity:", v171, v172));

      v243[0] = _NSConcreteStackBlock;
      v243[1] = 3221225472;
      v243[2] = sub_10009B894;
      v243[3] = &unk_100779780;
      v245 = v173 != 0;
      objc_copyWeak(&v244, location);
      v174 = objc_retainBlock(v243);
      v175 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
      v176 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v177 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      objc_msgSend(v175, "heartRateDataForWorkout:workoutActivity:completion:", v176, v177, v174);

      if (v173)
      {
        v178 = objc_loadWeakRetained(location);
        v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "formattingManager"));
        v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "formattedHeartRate:context:", v173, CFSTR("WorkoutDetailDisplayContext")));
        -[_CHWorkoutDetailTableSubItem setValueAttrString:](v165, "setValueAttrString:", v180);

        objc_msgSend(v3, "addObject:", v165);
      }

      objc_destroyWeak(&v244);
    }
    v181 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v182 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v242[0] = _NSConcreteStackBlock;
    v242[1] = 3221225472;
    v242[2] = sub_10009B964;
    v242[3] = &unk_1007797A8;
    v242[4] = self;
    objc_msgSend(v181, "powerSamplesForWorkout:workoutActivity:completion:", v182, v183, v242);

    v184 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "localizedStringForKey:value:table:", CFSTR("WORKOUT_LAPS_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v184, "setTitleString:", v186);

    v187 = -[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity");
    if (v187)
    {
      v188 = FIUIBundle(v187);
      v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
      v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("SUMMARY_NUMBER_OF_LAPS"), &stru_1007AE1D0, CFSTR("Localizable-Ariel")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v184, "setTitleString:", v190);

    }
    v191 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v193 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "formattedLapCountForWorkout:workoutActivity:context:", v192, v193, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v184, "setValueAttrString:", v194);

    v195 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v184, "valueAttrString"));
    if (v195)
      objc_msgSend(v3, "addObject:", v184);
    v196 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
    v197 = FIUIBundle(v196);
    v198 = (void *)objc_claimAutoreleasedReturnValue(v197);
    v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "localizedStringForKey:value:table:", CFSTR("SUMMARY_LAP_LENGTH"), &stru_1007AE1D0, CFSTR("Localizable-Ariel")));
    -[_CHWorkoutDetailTableSubItem setTitleString:](v196, "setTitleString:", v199);

    v200 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v201 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v202 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "formattedPoolLengthForWorkout:workoutActivity:context:", v201, v202, CFSTR("WorkoutDetailDisplayContext")));
    -[_CHWorkoutDetailTableSubItem setValueAttrString:](v196, "setValueAttrString:", v203);

    v204 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v196, "valueAttrString"));
    if (v204)
      objc_msgSend(v3, "addObject:", v196);
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v206 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v208 = objc_msgSend(v205, "supportsDownhillRunsCountForWorkout:workoutActivity:", v206, v207);

    if (v208)
    {
      v209 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
      v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "localizedStringForKey:value:table:", CFSTR("WORKOUT_DOWNHILL_RUNS_HEADER_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      -[_CHWorkoutDetailTableSubItem setTitleString:](v209, "setTitleString:", v211);

      v212 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v213 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v213, "downhillRunEventsBridge"));
      v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v212, "formattedDownhillRunsCount:context:", objc_msgSend(v214, "count"), CFSTR("WorkoutDetailDisplayContext")));
      -[_CHWorkoutDetailTableSubItem setValueAttrString:](v209, "setValueAttrString:", v215);

      v216 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v209, "valueAttrString"));
      if (v216)
        objc_msgSend(v3, "addObject:", v209);

    }
    v217 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v218 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v219 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    if (objc_msgSend(v217, "shouldShowDistanceForWorkout:workoutActivity:", v218, v219))
    {
      v220 = objc_msgSend(v238, "bridge_isDownhillSnowSport");

      if (v220)
        objc_msgSend(v3, "addObject:", v239);
    }
    else
    {

    }
    v221 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v223 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v224 = objc_msgSend(v221, "supportsElevationDescendedForWorkout:workoutActivity:", v222, v223);

    if (v224)
    {
      v225 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
      v226 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v227 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "cachedDownhillRunsForWorkout:workoutActivity:", v226, v227));

      if (v228)
      {
        v229 = objc_alloc_init(_CHWorkoutDetailTableSubItem);
        v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v230, "localizedStringForKey:value:table:", CFSTR("WORKOUT_TOTAL_ELEVATION_DESCENDED_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
        -[_CHWorkoutDetailTableSubItem setTitleString:](v229, "setTitleString:", v231);

        v232 = -[CHWorkoutDownhillRunsStats initWithDownhillRunBridges:]([CHWorkoutDownhillRunsStats alloc], "initWithDownhillRunBridges:", v228);
        v233 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDownhillRunsStats elevationDescended](v232, "elevationDescended"));
        v234 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
        v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "formattedElevation:context:", v233, CFSTR("WorkoutDetailDisplayContext")));
        -[_CHWorkoutDetailTableSubItem setValueAttrString:](v229, "setValueAttrString:", v235);

        v236 = (void *)objc_claimAutoreleasedReturnValue(-[_CHWorkoutDetailTableSubItem valueAttrString](v229, "valueAttrString"));
        if (v236)
          objc_msgSend(v3, "addObject:", v229);

      }
    }
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource _normalizeSubItemsArray:](self, "_normalizeSubItemsArray:", v3));

  }
  objc_destroyWeak(location);

  return v81;
}

- (BOOL)_showAveragePaceForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v9 = objc_msgSend(v8, "isIndoorCyclingForWorkout:workoutActivity:", v6, v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v11 = objc_msgSend(v10, "hasAverageCyclingSpeedForWorkout:workoutActivity:", v6, v7);

  if (!v9 || v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fiui_activityType"));
    v14 = v13;
    if (v13)
      v15 = v13;
    else
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fiui_activityType"));
    v16 = v15;

    if ((objc_msgSend(v16, "bridge_isDownhillSnowSport") & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v12 = objc_msgSend(v17, "supportsPaceForWorkout:workoutActivity:", v6, v7);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_createPowerSectionWithPowerSamples:(id)a3
{
  id v4;
  _CHWorkoutDetailPowerTableItem *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _CHWorkoutDetailPowerTableItem *v12;

  v4 = a3;
  v5 = (_CHWorkoutDetailPowerTableItem *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  if (!-[_CHWorkoutDetailPowerTableItem hasAverageCyclingPowerForWorkout:workoutActivity:](v5, "hasAverageCyclingPowerForWorkout:workoutActivity:", v6, v7))
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v4, "count");

  if (v8)
  {
    v5 = objc_alloc_init(_CHWorkoutDetailPowerTableItem);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
    -[_CHWorkoutDetailTableItem setCellClass:](v5, "setCellClass:", objc_msgSend(v9, "objectAtIndexedSubscript:", 13));

    -[_CHWorkoutDetailPowerTableItem setPowerSamples:](v5, "setPowerSamples:", v4);
    v12 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, 13);

    -[CHWorkoutDetailDataSource _insertPowerSection](self, "_insertPowerSection");
LABEL_5:

  }
}

- (id)_normalizeSubItemsArray:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = sub_10005F17C();
        if (self->_isTopLevelMultisport || self->_isSwimmingActivity)
          v13 = v13 + sub_10005F11C();
        if ((v9 & 1) != 0)
        {
          if ((objc_msgSend(v12, "_fitsWidth:", v13, (_QWORD)v19) & 1) != 0)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CHWorkoutDetailTableSubItem _emptyItem](_CHWorkoutDetailTableSubItem, "_emptyItem"));
            objc_msgSend(v5, "addObject:", v15);

            objc_msgSend(v5, "addObject:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CHWorkoutDetailTableSubItem _emptyItem](_CHWorkoutDetailTableSubItem, "_emptyItem"));
            objc_msgSend(v5, "addObject:", v16);

            v9 += 2;
          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
          if ((objc_msgSend(v12, "_fitsWidth:", v13) & 1) == 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CHWorkoutDetailTableSubItem _emptyItem](_CHWorkoutDetailTableSubItem, "_emptyItem"));
            objc_msgSend(v5, "addObject:", v14);

            ++v9;
          }
        }
        ++v9;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  return v17;
}

- (id)_makeUltraModeFooterView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WORKOUT_DETAIL_ULTRA_MODE_FOOTER_TEXT"), &stru_1007AE1D0, CFSTR("Localizable")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  objc_msgSend(v7, "setLineBreakMode:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleFootnote));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

  return v2;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  if (a5 == 1)
  {
    v16 = v7;
    v8 = -[CHWorkoutDetailDataSource _isExtendedMode](self, "_isExtendedMode");
    v7 = v16;
    if (v8)
    {
      v9 = objc_opt_class(UITableViewHeaderFooterView, v16);
      isKindOfClass = objc_opt_isKindOfClass(v16, v9);
      v7 = v16;
      if ((isKindOfClass & 1) != 0)
      {
        v11 = v16;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleFootnote));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));
        objc_msgSend(v13, "setFont:", v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));

        objc_msgSend(v15, "setTextColor:", v14);
        v7 = v16;
      }
    }
  }

}

- (id)_makeAppleWeatherFooterView
{
  if (self->_isTopLevelMultisport)
    return 0;
  else
    return objc_alloc_init(CHWorkoutDetailAppleWeatherFooterView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = objc_msgSend(v6, "count");
  return (int64_t)v7;
}

- (id)analyticsHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDetailAnalyticsTracker sharedInstance](CHWorkoutDetailAnalyticsTracker, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workoutAnalyticsHandlerFor:workoutActivity:", v4, v5));

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  NSString *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  CHCatalogItemViewModel *catalogItemViewModel;
  CHFitnessAppContext *fitnessAppContext;
  CHWorkoutFormattingManager *formattingManager;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  BOOL v116;
  id v117;
  void *v118;
  void *v119;
  unint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _BOOL8 v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  _BOOL8 v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  BOOL v153;
  id v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  _BOOL8 v166;
  id v167;
  void *v168;
  void *v169;
  void *v171;
  id v172;
  id v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  id v199;
  uint64_t v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  void *v207;
  void *v208;
  _BOOL4 v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  _BOOL4 v215;
  _QWORD v216[4];
  id v217;
  id location;
  _QWORD v219[4];
  id v220;
  id v221;
  _QWORD v222[4];
  id v223;
  id v224;
  _QWORD v225[4];
  id v226;
  id v227;
  _QWORD v228[4];
  id v229;
  id v230;
  _QWORD v231[4];
  id v232;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v13 = (char *)objc_msgSend(v12, "count");
  v14 = (char *)objc_msgSend(v7, "row");

  v15 = NSStringFromClass((Class)objc_msgSend(v10, "cellClass"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v16));

  v18 = objc_msgSend(v10, "cellClass");
  if (v18 == (id)objc_opt_class(CHWorkoutDetailSummaryTableViewCell, v19))
  {
    v206 = v7;
    v213 = v17;
    v61 = v17;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v63 = v10;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v65 = v6;
    fitnessAppContext = self->_fitnessAppContext;
    catalogItemViewModel = self->_catalogItemViewModel;
    formattingManager = self->_formattingManager;
    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472;
    v231[2] = sub_10009D4A0;
    v231[3] = &unk_100777E20;
    v69 = v65;
    v70 = v65;
    v232 = v70;
    objc_msgSend(v61, "summaryConfigureWithWorkout:workoutActivity:fitnessAppContext:catalogItemViewModel:formattingManager:resizeBlock:", v62, v64, fitnessAppContext, catalogItemViewModel, formattingManager, v231);

    v10 = v63;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "location"));

    if (!v71)
    {
      v72 = v63;
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "firstCoordinate"));
      objc_msgSend(v61, "setLocation:", v73);

      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "firstCoordinate"));
      if (!v74)
      {
        v228[0] = _NSConcreteStackBlock;
        v228[1] = 3221225472;
        v228[2] = sub_10009D4C8;
        v228[3] = &unk_1007797D0;
        v229 = v61;
        v230 = v70;
        objc_msgSend(v72, "setFirstCoordinateUpdatedBlock:", v228);

      }
    }
    if (-[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity"))
    {
      v75 = v63;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "swimDistanceByStrokeStyle"));
      objc_msgSend(v61, "setSwimDistanceByStrokeStyle:", v76);

      v225[0] = _NSConcreteStackBlock;
      v225[1] = 3221225472;
      v225[2] = sub_10009D564;
      v225[3] = &unk_1007797F8;
      v226 = v61;
      v227 = v70;
      objc_msgSend(v75, "setSwimDistanceByStrokeStyleUpdateBlock:", v225);

    }
    v6 = v69;
    v7 = v206;
    v17 = v213;
    goto LABEL_59;
  }
  v20 = objc_msgSend(v10, "cellClass");
  if (v20 == (id)objc_opt_class(CHDivingDetailMapTableViewCell, v21))
  {
    objc_msgSend(v17, "configureWithDive:row:dataCalculator:", self->_workout, objc_msgSend(v7, "row"), self->_divingDataCalculator);
    goto LABEL_59;
  }
  v22 = v13 - 1;
  v23 = objc_msgSend(v10, "cellClass");
  if (v23 == (id)objc_opt_class(CHWorkoutDetailTwoValueTableViewCell, v24))
  {
    objc_msgSend(v17, "setHidesSeparator:", v22 == v14);
    if (self->_isTopLevelMultisport || self->_isSwimmingActivity)
      objc_msgSend(v17, "removeLeadingPadding");
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
    v78 = objc_msgSend(v77, "count");

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", 0));

      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "titleString"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "valueAttrString"));
      objc_msgSend(v17, "configureWithTitle1:value1:", v81, v82);
      v222[0] = _NSConcreteStackBlock;
      v222[1] = 3221225472;
      v222[2] = sub_10009D598;
      v222[3] = &unk_100779820;
      v223 = v17;
      v224 = v81;
      v83 = v81;
      objc_msgSend(v80, "setUpdateBlock:", v222);

    }
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
    v85 = objc_msgSend(v84, "count");

    if ((unint64_t)v85 < 2)
      goto LABEL_59;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectAtIndexedSubscript:", 1));

    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "titleString"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "valueAttrString"));
    objc_msgSend(v17, "configureWithTitle2:value2:", v88, v89);
    v219[0] = _NSConcreteStackBlock;
    v219[1] = 3221225472;
    v219[2] = sub_10009D5A8;
    v219[3] = &unk_100779820;
    v220 = v17;
    v221 = v88;
    v90 = v88;
    objc_msgSend(v87, "setUpdateBlock:", v219);

LABEL_35:
    goto LABEL_59;
  }
  v25 = objc_msgSend(v10, "cellClass");
  if (v25 == (id)objc_opt_class(CHWorkoutDetailPaceTableViewCell, v26))
  {
    v91 = v17;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    objc_msgSend(v91, "setFormattingManager:", v92);

    objc_msgSend(v91, "setSelectedPaceFormat:", -[CHWorkoutDetailDataSource currentlySelectedSwimmingPaceFormat](self, "currentlySelectedSwimmingPaceFormat"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    objc_msgSend(v91, "configureWithWorkout:workoutActivity:dataCalculator:", v93, v94, v95);

    objc_msgSend(v91, "setPaceSelectionDelegate:", self);
LABEL_37:

    goto LABEL_59;
  }
  v27 = objc_msgSend(v10, "cellClass");
  if (v27 == (id)objc_opt_class(CHWorkoutDetailActivityTableViewCell, v28))
  {
    v214 = v17;
    v96 = v10;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "workoutActivity"));

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "fitnessUIFormattingManager"));
    v101 = v17;
    v102 = v10;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    objc_msgSend(v214, "configureWithWorkout:workoutActivity:formattingManager:dataCalculator:", v97, v98, v100, v103);

    v10 = v102;
    v17 = v101;

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    objc_msgSend(v214, "setNavigationDelegate:", v104);

    goto LABEL_59;
  }
  v29 = objc_msgSend(v10, "cellClass");
  v205 = v6;
  if (v29 == (id)objc_opt_class(CHWorkoutDetailFourColumnSplitTableViewCell, v30))
  {
    v105 = v10;
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "split"));

    if (v106)
    {
      v215 = v22 == v14;
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      v207 = v10;
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "unit"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "split"));
      v201 = objc_msgSend(v105, "splitIndex");
      objc_msgSend(v105, "expectedSplitDistance");
      v112 = v111;
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "fitnessUIFormattingManager"));
      objc_msgSend(v17, "configureWithWorkout:workoutActivity:unit:split:splitIndex:splitDistance:isLastCell:dataCalculator:formattingManager:", v107, v108, v109, v110, v201, v215, v112, v113, v115);

      v10 = v207;
    }
    else
    {
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "swimmingSplit"));

      if (!v132)
      {
        v161 = v10;
        v162 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
        v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "fiui_activityType"));
        v164 = v163;
        if (v163)
        {
          v165 = v163;
        }
        else
        {
          v171 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
          v165 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "fiui_activityType"));

        }
        v107 = v165;
        objc_msgSend(v17, "configureHeaderWithActivityType:", v165);
        v10 = v161;
        goto LABEL_48;
      }
      v133 = v22 == v14;
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "swimmingSplit"));
      v134 = objc_msgSend(v105, "splitIndex");
      v135 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "fitnessUIFormattingManager"));
      objc_msgSend(v17, "configureWithSwimmingSplit:splitIndex:isLastCell:formattingManager:", v107, v134, v133, v136);

    }
    v6 = v205;
LABEL_48:

LABEL_49:
    goto LABEL_59;
  }
  v212 = v17;
  v31 = objc_msgSend(v10, "cellClass");
  if (v31 == (id)objc_opt_class(CHWorkoutDetailFourColumnSegmentTableViewCell, v32))
  {
    v116 = v22 == v14;
    v117 = v10;
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "segment"));
    v202 = objc_msgSend(v117, "segmentIndex");

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v120 = -[CHWorkoutDetailDataSource trackDistanceUnit](self, "trackDistanceUnit");
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v208 = v10;
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "fiui_activityType"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v124 = objc_msgSend(v123, "_activityMoveMode");
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    LOBYTE(v200) = v116;
    v17 = v212;
    objc_msgSend(v212, "configureWithSegment:segmentIndex:workout:trackDistanceUnit:activityType:activityMoveMode:isLastCell:formattingManager:", v118, v202, v119, v120, v122, v124, v200, v125);

    v10 = v208;
LABEL_42:

    goto LABEL_58;
  }
  v33 = objc_msgSend(v10, "cellClass");
  if (v33 == (id)objc_opt_class(CHWorkoutDetailFourColumnDownhillRunTableViewCell, v34))
  {
    v126 = objc_opt_class(_CHWorkoutDetailDownhillRunsStatsTableItem, v35);
    if ((objc_opt_isKindOfClass(v10, v126) & 1) == 0)
    {
      v146 = objc_opt_class(_CHWorkoutDetailDownhillRunTableItem, v127);
      if ((objc_opt_isKindOfClass(v10, v146) & 1) == 0)
        goto LABEL_59;
      v147 = v22 == v14;
      v148 = v10;
      v91 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "downhillRun"));
      v149 = objc_msgSend(v148, "downhillRunIndex");

      v150 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "fiui_activityType"));
      v152 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
      objc_msgSend(v17, "configureWithDownhillRun:downhillRunIndex:activityType:isLastCell:formattingManager:", v91, v149, v151, v147, v152);

      goto LABEL_37;
    }
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downhillRunsStats"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "fiui_activityType"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    objc_msgSend(v17, "configureWithDownhillRunsStats:activityType:formattingManager:", v128, v130, v131);

LABEL_58:
    v6 = v205;
    goto LABEL_59;
  }
  v36 = objc_msgSend(v10, "cellClass");
  if (v36 == (id)objc_opt_class(CHWorkoutDetailFourColumnIntervalTableViewCell, v37))
  {
    v209 = v22 == v14;
    v137 = v10;
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "interval"));
    v203 = objc_msgSend(v137, "intervalIndex");

    v139 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v141 = v10;
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "fiui_activityType"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v144 = objc_msgSend(v143, "_activityMoveMode");
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    objc_msgSend(v17, "configureWithInterval:index:workout:activityType:activityMoveMode:isLastCell:formattingManager:", v138, v203, v139, v142, v144, v209, v145);

    v10 = v141;
LABEL_57:

    goto LABEL_58;
  }
  v38 = objc_msgSend(v10, "cellClass");
  if (v38 == (id)objc_opt_class(CHWorkoutDetailFourColumnTrackLapTableViewCell, v39))
  {
    v153 = v22 == v14;
    v154 = v10;
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "trackLap"));
    v204 = objc_msgSend(v154, "lapIndex");
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v155 = objc_msgSend(v154, "distanceUnit");

    v156 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v210 = v10;
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "fiui_activityType"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v159 = objc_msgSend(v158, "_activityMoveMode");
    v160 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    LOBYTE(v200) = v153;
    v17 = v212;
    objc_msgSend(v212, "configureWithTrackLap:lapIndex:workout:distanceUnit:activityType:activityMoveMode:isLastCell:formattingManager:", v118, v204, v119, v155, v157, v159, v200, v160);

    v10 = v210;
    goto LABEL_42;
  }
  v40 = objc_msgSend(v10, "cellClass");
  if (v40 == (id)objc_opt_class(CHWorkoutDetailFourColumnSwimmingSetTableViewCell, v41))
  {
    v166 = v22 == v14;
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "set"));
    v167 = objc_msgSend(v7, "row");
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "fitnessUIFormattingManager"));
    objc_msgSend(v17, "configureWithSwimmingSet:index:isLastCell:formattingManager:", v138, v167, v166, v169);

    goto LABEL_57;
  }
  v42 = objc_msgSend(v10, "cellClass");
  if (v42 == (id)objc_opt_class(CHWorkoutDetailBurnBarTableViewCell, v43))
  {
    objc_msgSend(v17, "configureWithFitnessAppContext:workout:scoreSummaryWrapper:", self->_fitnessAppContext, self->_workout, self->_scoreSummaryWrapper);
    goto LABEL_59;
  }
  v44 = objc_msgSend(v10, "cellClass");
  if (v44 == (id)objc_opt_class(CHWorkoutDetailHeartRateTableViewCell, v45))
  {
    v172 = v17;
    v173 = v10;
    v174 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v211 = v10;
    v176 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "heartRateReadings"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "averageHeartRate"));

    v180 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    v87 = (void *)v174;
    objc_msgSend(v172, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:heartRateReadings:averageHeartRate:parent:", v174, v175, v176, v177, v178, v179, v180);

    v6 = v205;
    v10 = v211;
    v17 = v212;

    goto LABEL_35;
  }
  v46 = objc_msgSend(v10, "cellClass");
  if (v46 == (id)objc_opt_class(CHWorkoutDetailPowerTableViewCell, v47))
  {
    v181 = v17;
    v182 = v10;
    v91 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v185 = v10;
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "powerSamples"));

    v188 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    objc_msgSend(v181, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:powerSamples:parent:", v91, v183, v184, v186, v187, v188);

    v6 = v205;
    v10 = v185;
    v17 = v212;

    goto LABEL_37;
  }
  v48 = objc_msgSend(v10, "cellClass");
  if (v48 == (id)objc_opt_class(CHWorkoutDetailMapAndWeatherTableViewCell, v49))
  {
    v189 = v17;
    v190 = v10;
    v191 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    objc_msgSend(v189, "setNavigationDelegate:", v191);

    v192 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource analyticsHandler](self, "analyticsHandler"));
    objc_msgSend(v189, "setAnalyticsHandler:", v192);

    v105 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v193 = v10;
    v194 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v196 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource formattingManager](self, "formattingManager"));
    v197 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "locationReadings"));

    objc_msgSend(v189, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:parent:locationReadings:", v105, v194, v195, v196, v197, v198);
    v6 = v205;

    v10 = v193;
    v17 = v212;
    goto LABEL_49;
  }
  v50 = objc_msgSend(v10, "cellClass");
  if (v50 == (id)objc_opt_class(CHWorkoutDetailGuidedRunMediaMomentsTableViewCell, v51))
  {
    v91 = v17;
    objc_msgSend(v91, "configureWithWorkout:fitnessAppContext:", self->_workout, self->_fitnessAppContext);
    objc_initWeak(&location, self);
    v216[0] = _NSConcreteStackBlock;
    v216[1] = 3221225472;
    v216[2] = sub_10009D5B8;
    v216[3] = &unk_100779848;
    objc_copyWeak(&v217, &location);
    objc_msgSend(v91, "setOnDidTapMediaMomentItem:", v216);
    objc_destroyWeak(&v217);
    objc_destroyWeak(&location);
    goto LABEL_37;
  }
  v52 = objc_msgSend(v10, "cellClass");
  if (v52 == (id)objc_opt_class(CHWorkoutDetailAwardTableViewCell, v53))
  {
    v199 = v17;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "achievement"));
    objc_msgSend(v199, "configureForAchievement:badgeImageFactory:localizationProvider:", v57, self->_badgeImageFactory, self->_achievementLocalizationProvider);

    goto LABEL_68;
  }
  v54 = objc_msgSend(v10, "cellClass");
  if (v54 == (id)objc_opt_class(CHWorkoutDetailEffortTableViewCell, v55))
  {
    v56 = v17;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    objc_msgSend(v56, "configureWithWorkout:workoutActivity:dataCalculator:parent:", v57, v58, v59, v60);

LABEL_68:
  }
LABEL_59:

  return v17;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource cellClassesBySection](self, "cellClassesBySection"));
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  if ((objc_opt_respondsToSelector(v7, "preferredHeightForWorkout:") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    objc_msgSend(v7, "preferredHeightForWorkout:", v8);
    v10 = v9;
  }
  else
  {
    if ((objc_opt_respondsToSelector(v7, "preferredHeightForWorkout:indexPath:numberOfRows:") & 1) == 0)
    {
      v10 = 44.0;
      goto LABEL_7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
    objc_msgSend(v7, "preferredHeightForWorkout:indexPath:numberOfRows:", v8, v5, objc_msgSend(v12, "count"));
    v10 = v13;

  }
LABEL_7:

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  v8 = objc_msgSend(v7, "count");
  if (a4 != 2 || (v9 = 10.0, !v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableSectionHeaders](self, "tableSectionHeaders"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", a4));

    if (a4 == 1)
      v12 = self->_isTopLevelMultisport || self->_isSwimmingActivity;
    else
      v12 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if ((objc_msgSend(v11, "isEqual:", v13) & 1) != 0 || !objc_msgSend(v7, "count"))
    {

      v9 = 0.0;
    }
    else
    {

      if (v12)
        v9 = 0.0;
      else
        v9 = UITableViewAutomaticDimension;
    }

  }
  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v6 = a3;
  v7 = 0.0;
  if (a4 == 1)
  {
    if (-[CHWorkoutDetailDataSource _isExtendedMode](self, "_isExtendedMode"))
LABEL_6:
      v7 = UITableViewAutomaticDimension;
  }
  else if (a4 == 14)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout metadata](self->_workout, "metadata"));
    v9 = _HKPrivateMetadataKeyWorkoutWeatherSourceName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", _HKPrivateMetadataKeyWorkoutWeatherSourceName));
    if (objc_msgSend(v10, "isEqualToString:", kHKAppleWeatherSourceName))
    {

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout metadata](self->_workout, "metadata"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
      v14 = objc_msgSend(v13, "isEqualToString:", kHKAppleWeatherLogoSourceName);

      if ((v14 & 1) == 0)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == (id)16)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "achievement"));
    objc_msgSend(v10, "badgeRect");
    objc_msgSend(v11, "presentAchievement:badgeRect:cell:", v12, v10);

  }
  else
  {
    -[CHWorkoutDetailDataSource presentPageForSection:](self, "presentPageForSection:", objc_msgSend(v6, "section"));
  }

}

- (void)presentPageForSection:(int64_t)a3
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource navigationActionForHeaderInSection:](self, "navigationActionForHeaderInSection:", a3));
  if (v3)
  {
    v4 = v3;
    v3[2](v3, 1);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (id)navigationActionForHeaderInSection:(int64_t)a3
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _QWORD *v12;
  _QWORD v14[4];
  _QWORD *v15;
  id v16;
  _QWORD v17[4];
  _QWORD *v18;
  id v19;
  _QWORD v20[4];
  _QWORD *v21;
  id v22;
  _QWORD v23[4];
  _QWORD *v24;
  id v25;
  _QWORD v26[4];
  _QWORD *v27;
  id v28;
  _QWORD v29[4];
  _QWORD *v30;
  id v31;
  _QWORD v32[4];
  _QWORD *v33;
  id v34;
  _QWORD v35[4];
  _QWORD *v36;
  id v37;
  _QWORD v38[4];
  _QWORD *v39;
  id v40;
  _QWORD v41[4];
  _QWORD *v42;
  id v43;
  _QWORD v44[5];
  _QWORD *v45;
  id v46;
  _QWORD v47[4];
  _QWORD *v48;
  id v49;
  _QWORD v50[4];
  _QWORD *v51;
  id v52;
  _QWORD v53[4];
  id v54[2];
  id location;

  objc_initWeak(&location, self);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10009E0E4;
  v53[3] = &unk_100779870;
  objc_copyWeak(v54, &location);
  v54[1] = (id)a3;
  v5 = objc_retainBlock(v53);
  v6 = 0;
  switch(a3)
  {
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
      if ((objc_msgSend(v7, "hasChartableMetrics") & 1) != 0)
      {

        if (!self->_isUnderwaterDive)
          goto LABEL_20;
LABEL_18:
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10009E130;
        v50[3] = &unk_100779898;
        v8 = &v52;
        objc_copyWeak(&v52, &location);
        v51 = v5;
        v6 = objc_retainBlock(v50);
        v9 = v51;
        goto LABEL_21;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
      v11 = objc_msgSend(v10, "hasChartableMetrics");

      if (self->_isUnderwaterDive)
        goto LABEL_18;
      if (!v11)
      {
        v6 = 0;
        goto LABEL_22;
      }
LABEL_20:
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10009E1E0;
      v47[3] = &unk_100779898;
      v8 = &v49;
      objc_copyWeak(&v49, &location);
      v48 = v5;
      v6 = objc_retainBlock(v47);
      v9 = v48;
LABEL_21:

      objc_destroyWeak(v8);
LABEL_22:
      v12 = objc_retainBlock(v6);

      objc_destroyWeak(v54);
      objc_destroyWeak(&location);

      return v12;
    case 2:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10009EF54;
      v14[3] = &unk_100779898;
      v8 = &v16;
      objc_copyWeak(&v16, &location);
      v15 = v5;
      v6 = objc_retainBlock(v14);
      v9 = v15;
      goto LABEL_21;
    case 5:
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10009E968;
      v29[3] = &unk_100779898;
      v8 = &v31;
      objc_copyWeak(&v31, &location);
      v30 = v5;
      v6 = objc_retainBlock(v29);
      v9 = v30;
      goto LABEL_21;
    case 6:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10009EA88;
      v26[3] = &unk_100779898;
      v8 = &v28;
      objc_copyWeak(&v28, &location);
      v27 = v5;
      v6 = objc_retainBlock(v26);
      v9 = v27;
      goto LABEL_21;
    case 7:
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10009E388;
      v44[3] = &unk_1007798C0;
      v8 = &v46;
      objc_copyWeak(&v46, &location);
      v44[4] = self;
      v45 = v5;
      v6 = objc_retainBlock(v44);
      v9 = v45;
      goto LABEL_21;
    case 8:
      if (-[CHWorkoutDetailDataSource isSwimmingActivity](self, "isSwimmingActivity"))
      {
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_10009E4B0;
        v41[3] = &unk_100779898;
        v8 = &v43;
        objc_copyWeak(&v43, &location);
        v42 = v5;
        v6 = objc_retainBlock(v41);
        v9 = v42;
      }
      else
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10009E5CC;
        v38[3] = &unk_100779898;
        v8 = &v40;
        objc_copyWeak(&v40, &location);
        v39 = v5;
        v6 = objc_retainBlock(v38);
        v9 = v39;
      }
      goto LABEL_21;
    case 9:
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10009E814;
      v32[3] = &unk_100779898;
      v8 = &v34;
      objc_copyWeak(&v34, &location);
      v33 = v5;
      v6 = objc_retainBlock(v32);
      v9 = v33;
      goto LABEL_21;
    case 10:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10009E700;
      v35[3] = &unk_100779898;
      v8 = &v37;
      objc_copyWeak(&v37, &location);
      v36 = v5;
      v6 = objc_retainBlock(v35);
      v9 = v36;
      goto LABEL_21;
    case 12:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10009EBBC;
      v23[3] = &unk_100779898;
      v8 = &v25;
      objc_copyWeak(&v25, &location);
      v24 = v5;
      v6 = objc_retainBlock(v23);
      v9 = v24;
      goto LABEL_21;
    case 13:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10009ECA4;
      v20[3] = &unk_100779898;
      v8 = &v22;
      objc_copyWeak(&v22, &location);
      v21 = v5;
      v6 = objc_retainBlock(v20);
      v9 = v21;
      goto LABEL_21;
    case 14:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10009EDB0;
      v17[3] = &unk_100779898;
      v8 = &v19;
      objc_copyWeak(&v19, &location);
      v18 = v5;
      v6 = objc_retainBlock(v17);
      v9 = v18;
      goto LABEL_21;
    default:
      goto LABEL_22;
  }
}

- (void)presentEffortViewController:(BOOL)a3 presentationCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource dataCalculator](self, "dataCalculator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workoutActivity](self, "workoutActivity"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009F0C4;
  v11[3] = &unk_100779950;
  objc_copyWeak(&v13, &location);
  v14 = a3;
  v10 = v6;
  v12 = v10;
  objc_msgSend(v7, "effortForWorkout:workoutActivity:completion:", v8, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ActivityTileSectionHeader reuseIdentifier](_TtC10FitnessApp26WorkoutDetailSectionHeader, "reuseIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v7));

    objc_msgSend(v8, "configureWithTitle:buttonAction:", &stru_1007AE1D0, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableSectionHeaders](self, "tableSectionHeaders"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a4));

    if (a4 == 1)
      v11 = self->_isTopLevelMultisport || self->_isSwimmingActivity;
    else
      v11 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v13 = objc_msgSend(v10, "isEqual:", v12);

    v8 = 0;
    if (!v11 && (v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource navigationActionForHeaderInSection:](self, "navigationActionForHeaderInSection:", a4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[ActivityTileSectionHeader reuseIdentifier](_TtC10FitnessApp26WorkoutDetailSectionHeader, "reuseIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v15));

      objc_msgSend(v8, "configureWithTitle:buttonAction:", v10, v14);
    }

  }
  return v8;
}

- (BOOL)_isExtendedMode
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource workout](self, "workout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", _HKPrivateMetadataKeyWorkoutExtendedMode));

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  return (char)v2;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (a4 == 14)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource _makeAppleWeatherFooterView](self, "_makeAppleWeatherFooterView"));
    goto LABEL_7;
  }
  if (a4 == 1 && -[CHWorkoutDetailDataSource _isExtendedMode](self, "_isExtendedMode"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource _makeUltraModeFooterView](self, "_makeUltraModeFooterView"));
LABEL_7:
    v8 = (void *)v7;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v11 = a5;
  v7 = a4;
  if (!objc_msgSend(v11, "section")
    || objc_msgSend(v11, "section") == (id)4
    || objc_msgSend(v11, "section") == (id)16
    || objc_msgSend(v11, "section") == (id)1 && (self->_isTopLevelMultisport || self->_isSwimmingActivity))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  }
  else
  {
    v10 = sub_100032490();
    v8 = objc_claimAutoreleasedReturnValue(v10);
  }
  v9 = (void *)v8;
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setSelectionStyle:", 0);
}

- (void)_section:(int64_t)a3 setExpanded:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  switch(a3)
  {
    case 7:
    case 10:
      if (-[CHWorkoutDetailDataSource segmentsExpanded](self, "segmentsExpanded") != a4)
      {
        -[CHWorkoutDetailDataSource setSegmentsExpanded:](self, "setSegmentsExpanded:", v4);
        goto LABEL_8;
      }
      break;
    case 8:
      if (-[CHWorkoutDetailDataSource splitsExpanded](self, "splitsExpanded") != a4)
      {
        -[CHWorkoutDetailDataSource setSplitsExpanded:](self, "setSplitsExpanded:", v4);
        goto LABEL_8;
      }
      break;
    case 11:
      if (-[CHWorkoutDetailDataSource burnBarExpanded](self, "burnBarExpanded") != a4)
      {
        -[CHWorkoutDetailDataSource setBurnBarExpanded:](self, "setBurnBarExpanded:", v4);
LABEL_8:
        v17 = objc_alloc_init((Class)NSMutableArray);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          v10 = 0;
          do
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, a3));
            objc_msgSend(v17, "addObject:", v11);

            ++v10;
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableItemsBySection](self, "tableItemsBySection"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a3));
            v14 = objc_msgSend(v13, "count");

          }
          while (v10 < (unint64_t)v14);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
        v16 = v15;
        if (v4)
          objc_msgSend(v15, "insertRowsAtIndexPaths:withRowAnimation:", v17, 3);
        else
          objc_msgSend(v15, "deleteRowsAtIndexPaths:withRowAnimation:", v17, 3);

      }
      break;
    default:
      return;
  }
}

- (void)expandingHeaderView:(id)a3 didChangeExpanded:(BOOL)a4
{
  -[CHWorkoutDetailDataSource _section:setExpanded:](self, "_section:setExpanded:", objc_msgSend(a3, "section"), a4);
}

- (void)paceCell:(id)a3 didSelectNewPaceFormat:(int64_t)a4
{
  -[CHWorkoutDetailDataSource setCurrentlySelectedSwimmingPaceFormat:](self, "setCurrentlySelectedSwimmingPaceFormat:", a4);
}

- (void)_insertMultiSportSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 4));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertSegmentsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 10));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertDownhillRunsSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 9));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v4, 3);

  -[CHWorkoutDetailDataSource _createValuesSection](self, "_createValuesSection");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 1));
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 5);

}

- (void)_insertIntervalsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 5));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertTrackLapsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 6));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertSwimSetsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 7));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertSplitsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 8));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 3);

}

- (void)_insertBurnBarSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 11));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

}

- (void)_insertHeartRateSubItem
{
  void *v3;
  id v4;

  -[CHWorkoutDetailDataSource _createValuesSection](self, "_createValuesSection");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 1));
  objc_msgSend(v4, "reloadSections:withRowAnimation:", v3, 100);

}

- (void)_insertHeartRateSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 12));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

}

- (void)_insertPowerSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 13));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

}

- (void)_insertGuidedRunMediaMomentsSection
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource tableView](self, "tableView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 15));
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v2, 100);

}

- (BOOL)weatherOrLocationAvailableForWorkout
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager weatherTemperatureForWorkout:workoutActivity:](self->_formattingManager, "weatherTemperatureForWorkout:workoutActivity:", self->_workout, self->_workoutActivity));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager weatherHumidityForWorkout:workoutActivity:](self->_formattingManager, "weatherHumidityForWorkout:workoutActivity:", self->_workout, self->_workoutActivity));
    if (v5)
      v4 = 1;
    else
      v4 = -[CHWorkoutFormattingManager hasWeatherConditionForWorkout:workoutActivity:](self->_formattingManager, "hasWeatherConditionForWorkout:workoutActivity:", self->_workout, self->_workoutActivity);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager locationForWorkout:workoutActivity:](self->_formattingManager, "locationForWorkout:workoutActivity:", self->_workout, self->_workoutActivity));

  return v6 || v4;
}

- (void)divingDataDidFinishLoading
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "reloadData");

}

- (CHWorkoutDetailNavigationDelegate)delegate
{
  return (CHWorkoutDetailNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHWorkoutDetailLocationFetcherObserver)locationFetcherObserver
{
  return (CHWorkoutDetailLocationFetcherObserver *)objc_loadWeakRetained((id *)&self->_locationFetcherObserver);
}

- (void)setLocationFetcherObserver:(id)a3
{
  objc_storeWeak((id *)&self->_locationFetcherObserver, a3);
}

- (UIImage)routeImageForSharing
{
  return self->_routeImageForSharing;
}

- (void)setRouteImageForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_routeImageForSharing, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (void)setWorkoutActivity:(id)a3
{
  objc_storeStrong((id *)&self->_workoutActivity, a3);
}

- (CHDivingDataCalculator)divingDataCalculator
{
  return self->_divingDataCalculator;
}

- (void)setDivingDataCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_divingDataCalculator, a3);
}

- (NSArray)cellClassesBySection
{
  return self->_cellClassesBySection;
}

- (void)setCellClassesBySection:(id)a3
{
  objc_storeStrong((id *)&self->_cellClassesBySection, a3);
}

- (NSMutableArray)tableItemsBySection
{
  return self->_tableItemsBySection;
}

- (void)setTableItemsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_tableItemsBySection, a3);
}

- (NSArray)tableSectionHeaders
{
  return self->_tableSectionHeaders;
}

- (void)setTableSectionHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_tableSectionHeaders, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKAnchoredObjectQuery)routeQuery
{
  return self->_routeQuery;
}

- (void)setRouteQuery:(id)a3
{
  objc_storeStrong((id *)&self->_routeQuery, a3);
}

- (FIUIModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (CHFitnessAppContext)fitnessAppContext
{
  return self->_fitnessAppContext;
}

- (void)setFitnessAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessAppContext, a3);
}

- (CHCatalogItemViewModel)catalogItemViewModel
{
  return self->_catalogItemViewModel;
}

- (void)setCatalogItemViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_catalogItemViewModel, a3);
}

- (CHScoreSummaryWrapper)scoreSummaryWrapper
{
  return self->_scoreSummaryWrapper;
}

- (void)setScoreSummaryWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_scoreSummaryWrapper, a3);
}

- (CHWorkoutFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (CHWorkoutDataCalculator)dataCalculator
{
  return self->_dataCalculator;
}

- (void)setDataCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_dataCalculator, a3);
}

- (BOOL)splitsExpanded
{
  return self->_splitsExpanded;
}

- (void)setSplitsExpanded:(BOOL)a3
{
  self->_splitsExpanded = a3;
}

- (NSArray)indexPathsForSplitCells
{
  return self->_indexPathsForSplitCells;
}

- (void)setIndexPathsForSplitCells:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathsForSplitCells, a3);
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_locationFetcher, a3);
}

- (BOOL)segmentsExpanded
{
  return self->_segmentsExpanded;
}

- (void)setSegmentsExpanded:(BOOL)a3
{
  self->_segmentsExpanded = a3;
}

- (int64_t)currentlySelectedSwimmingPaceFormat
{
  return self->_currentlySelectedSwimmingPaceFormat;
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
}

- (CHWorkoutRouteMapGenerator)snapshotGenerator
{
  return self->_snapshotGenerator;
}

- (void)setSnapshotGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotGenerator, a3);
}

- (BOOL)burnBarExpanded
{
  return self->_burnBarExpanded;
}

- (void)setBurnBarExpanded:(BOOL)a3
{
  self->_burnBarExpanded = a3;
}

- (BOOL)workoutIsFirstParty
{
  return self->_workoutIsFirstParty;
}

- (void)setWorkoutIsFirstParty:(BOOL)a3
{
  self->_workoutIsFirstParty = a3;
}

- (BOOL)workoutIsPoolSwim
{
  return self->_workoutIsPoolSwim;
}

- (void)setWorkoutIsPoolSwim:(BOOL)a3
{
  self->_workoutIsPoolSwim = a3;
}

- (BOOL)isSwimmingActivity
{
  return self->_isSwimmingActivity;
}

- (void)setIsSwimmingActivity:(BOOL)a3
{
  self->_isSwimmingActivity = a3;
}

- (BOOL)isTopLevelMultisport
{
  return self->_isTopLevelMultisport;
}

- (void)setIsTopLevelMultisport:(BOOL)a3
{
  self->_isTopLevelMultisport = a3;
}

- (BOOL)hasActiveLocationQuery
{
  return self->_hasActiveLocationQuery;
}

- (void)setHasActiveLocationQuery:(BOOL)a3
{
  self->_hasActiveLocationQuery = a3;
}

- (BOOL)isUnderwaterDive
{
  return self->_isUnderwaterDive;
}

- (void)setIsUnderwaterDive:(BOOL)a3
{
  self->_isUnderwaterDive = a3;
}

- (NSDictionary)swimmingSplitItems
{
  return self->_swimmingSplitItems;
}

- (void)setSwimmingSplitItems:(id)a3
{
  objc_storeStrong((id *)&self->_swimmingSplitItems, a3);
}

- (BOOL)didSetInitialSwimmingPaceFormat
{
  return self->_didSetInitialSwimmingPaceFormat;
}

- (void)setDidSetInitialSwimmingPaceFormat:(BOOL)a3
{
  self->_didSetInitialSwimmingPaceFormat = a3;
}

- (HKKeyValueDomain)trackValueDomain
{
  return self->_trackValueDomain;
}

- (void)setTrackValueDomain:(id)a3
{
  objc_storeStrong((id *)&self->_trackValueDomain, a3);
}

- (unint64_t)trackDistanceUnit
{
  return self->_trackDistanceUnit;
}

- (void)setTrackDistanceUnit:(unint64_t)a3
{
  self->_trackDistanceUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackValueDomain, 0);
  objc_storeStrong((id *)&self->_swimmingSplitItems, 0);
  objc_storeStrong((id *)&self->_snapshotGenerator, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_indexPathsForSplitCells, 0);
  objc_storeStrong((id *)&self->_dataCalculator, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_scoreSummaryWrapper, 0);
  objc_storeStrong((id *)&self->_catalogItemViewModel, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_routeQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_tableSectionHeaders, 0);
  objc_storeStrong((id *)&self->_tableItemsBySection, 0);
  objc_storeStrong((id *)&self->_cellClassesBySection, 0);
  objc_storeStrong((id *)&self->_divingDataCalculator, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_routeImageForSharing, 0);
  objc_destroyWeak((id *)&self->_locationFetcherObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fiuiFormattingManager, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
}

@end
