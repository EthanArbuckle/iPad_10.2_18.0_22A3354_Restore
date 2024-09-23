@implementation CHASActivitySetupViewController

- (CHASActivitySetupViewController)init
{
  return -[CHASActivitySetupViewController initWithPresentationContext:](self, "initWithPresentationContext:", 0);
}

- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3
{
  CHASActivitySetupViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHASActivitySetupViewController;
  result = -[CHASActivitySetupViewController initWithTitle:detailText:icon:](&v5, "initWithTitle:detailText:icon:", &stru_1007AE1D0, 0, 0);
  if (result)
  {
    result->_goalType = -1;
    result->_presentationContext = a3;
  }
  return result;
}

- (CHASActivitySetupViewController)initWithPresentationContext:(int64_t)a3 goalType:(int64_t)a4 editTodayOnly:(BOOL)a5
{
  CHASActivitySetupViewController *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHASActivitySetupViewController;
  result = -[CHASActivitySetupViewController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", &stru_1007AE1D0, 0, 0);
  if (result)
  {
    result->_goalType = a4;
    result->_editTodayOnly = a5;
    result->_presentationContext = a3;
  }
  return result;
}

- (id)advanceGoalHeaderTitle
{
  void *v2;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 isWheelchairUser;
  NSBundle *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSBundle *v11;
  NSBundle *v12;

  v4 = -[CHASActivitySetupViewController _activityGoalTypeForCurrentPage](self, "_activityGoalTypeForCurrentPage");
  if (v4 < 2)
  {
    v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v9 = v8;
    v10 = CFSTR("CUSTOM_MOVE_GOAL");
LABEL_9:
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1007AE1D0, CFSTR("ActivitySetup")));

    return v2;
  }
  if (v4 == 2)
  {
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v9 = v8;
    v10 = CFSTR("CUSTOM_EXERCISE_GOAL");
    goto LABEL_9;
  }
  if (v4 == 3)
  {
    isWheelchairUser = self->_isWheelchairUser;
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (isWheelchairUser)
      v10 = CFSTR("CUSTOM_ROLL_GOAL");
    else
      v10 = CFSTR("CUSTOM_STAND_GOAL");
    goto LABEL_9;
  }
  return v2;
}

- (void)generateHeaders
{
  NSArray *v3;
  NSArray *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSBundle *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSBundle *v21;
  void *v22;
  NSArray *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSBundle *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSBundle *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSBundle *v36;
  uint64_t v37;
  NSBundle *v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  NSBundle *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSBundle *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSBundle *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSBundle *v58;
  void *v59;
  void *v60;
  NSArray *pageTitles;
  NSArray *v62;
  NSArray *pageDetailTexts;
  NSArray *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSArray *v71;
  __CFString *v72;

  v3 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v4 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  if (self->_editTodayOnly)
    v5 = CFSTR("_FOR_TODAY");
  else
    v5 = &stru_1007AE1D0;
  v6 = v5;
  v71 = v3;
  v72 = v6;
  if (self->_recommendedMoveGoal)
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RECOMMENDED_MOVE_GOAL"), &stru_1007AE1D0, CFSTR("ActivitySetup")));

    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RECOMMENDED_MOVE_GOAL_DESCRIPTION"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
  }
  else if (self->_isTinkerPaired)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupFlowUserInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", BPSPairingFlowFamilyMember));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedCapitalizedString"));

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SET_UP_MOVE_GOAL%@"), v72));
    if (v18)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DAILY_MOVE_GOAL_DESCRIPTION_FITNESS_JR_TINKER%@_%@"), v72, CFSTR("%@")));
      v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v69 = (void *)v19;
      v23 = v4;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v19, &stru_1007AE1D0, CFSTR("ActivitySetup")));
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v18));

      v4 = v23;
      v3 = v71;
    }
    else
    {
      v34 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DAILY_MOVE_GOAL_DESCRIPTION_FITNESS_JR_TINKER%@"), v72));
      v36 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v35));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v69 = (void *)v34;
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v34, &stru_1007AE1D0, CFSTR("ActivitySetup")));
    }

    v38 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v37));
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", v67, &stru_1007AE1D0, CFSTR("ActivitySetup")));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SET_UP_MOVE_GOAL%@"), v6));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DAILY_MOVE_GOAL_DESCRIPTION%@"), v72));
    v27 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v13, &stru_1007AE1D0, CFSTR("ActivitySetup")));

    v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v30));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", v25, &stru_1007AE1D0, CFSTR("ActivitySetup")));

    v10 = v29;
    v14 = v33;

  }
  v70 = (void *)v10;
  -[NSArray setObject:atIndexedSubscript:](v3, "setObject:atIndexedSubscript:", v10, 0);
  -[NSArray setObject:atIndexedSubscript:](v4, "setObject:atIndexedSubscript:", v14, 0);
  if (self->_isTinkerPaired)
    v40 = CFSTR("_FITNESS_JR_TINKER");
  else
    v40 = CFSTR("_FITNESS_JR");
  v68 = (void *)v14;
  v64 = v4;
  if (self->_activityMoveMode != 2)
  {
    if (self->_isWheelchairUser)
      v40 = CFSTR("_WHEELCHAIR");
    else
      v40 = &stru_1007AE1D0;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SET_UP_EXERCISE_GOAL%@"), v72));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DAILY_EXERCISE_GOAL_DESCRIPTION%@%@"), v40, v72));
  v42 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v41));
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", v66, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  -[NSArray setObject:atIndexedSubscript:](v71, "setObject:atIndexedSubscript:", v44, 1);

  v46 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", v65, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  -[NSArray setObject:atIndexedSubscript:](v64, "setObject:atIndexedSubscript:", v48, 1);

  if (self->_isWheelchairUser)
    v49 = CFSTR("ROLL");
  else
    v49 = CFSTR("STAND");
  v50 = v49;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SET_UP_%@_GOAL%@"), v50, v72));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DAILY_%@_GOAL_DESCRIPTION%@"), v50, v72));

  v54 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v53));
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", v51, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  -[NSArray setObject:atIndexedSubscript:](v71, "setObject:atIndexedSubscript:", v56, 2);

  v58 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v57));
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", v52, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  -[NSArray setObject:atIndexedSubscript:](v64, "setObject:atIndexedSubscript:", v60, 2);

  pageTitles = self->_pageTitles;
  self->_pageTitles = v71;
  v62 = v71;

  pageDetailTexts = self->_pageDetailTexts;
  self->_pageDetailTexts = v64;

}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  HKHealthStore *healthStore;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t active;
  void *v23;
  id *v24;
  id v25;
  void *v26;
  int64_t activityMoveMode;
  id v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  _BOOL8 v42;
  void *v43;
  uint64_t IsStandalonePhoneFitnessMode;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  _BOOL8 v51;
  uint64_t v52;
  void *v53;
  UIScrollView *v54;
  UIScrollView *scrollView;
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
  void *v69;
  uint64_t v70;
  NSBundle *v71;
  void *v72;
  void *v73;
  void *v74;
  UIButton *v75;
  UIButton *advancedButton;
  UIButton *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  OBBoldTrayButton *v105;
  OBBoldTrayButton *continueButton;
  id v107;
  OBBoldTrayButton *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  UILabel *v116;
  UILabel *footerLabel;
  void *v118;
  void *v119;
  uint64_t v120;
  NSBundle *v121;
  void *v122;
  void *v123;
  OBBoldTrayButton *v124;
  uint64_t v125;
  NSBundle *v126;
  void *v127;
  void *v128;
  OBLinkTrayButton *v129;
  OBLinkTrayButton *notNowButton;
  OBLinkTrayButton *v131;
  uint64_t v132;
  NSBundle *v133;
  void *v134;
  void *v135;
  void *v136;
  _BOOL4 isWheelchairUser;
  void *v138;
  uint64_t v139;
  _Unwind_Exception *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id location[2];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  id v158;
  objc_super v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;

  v159.receiver = self;
  v159.super_class = (Class)CHASActivitySetupViewController;
  -[CHASActivitySetupViewController viewDidLoad](&v159, "viewDidLoad");
  if (self->_presentationContext == 6)
  {
    v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = FIUIBundle(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable")));
    v7 = objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 0, self, "_dismiss:");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  }
  v9 = objc_alloc((Class)FIActivitySettingsController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController healthStore](self, "healthStore"));
  v11 = objc_msgSend(v9, "initWithHealthStore:", v10);

  objc_msgSend(v11, "populateExistingCharacteristics");
  self->_activityMoveMode = 1;
  self->_isWheelchairUser = objc_msgSend(v11, "wheelchairUse") == (id)2;
  healthStore = self->_healthStore;
  v158 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthStore _activityMoveModeWithError:](healthStore, "_activityMoveModeWithError:", &v158));
  v14 = v158;
  v16 = v14;
  if (v14 && (_HKInitializeLogging(v14, v15), os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR)))
  {
    sub_1005F1DB8();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
LABEL_6:
    v17 = objc_msgSend(v13, "integerValue");
    goto LABEL_7;
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateOfBirth"));
  if (!v17)
    goto LABEL_8;
  isWheelchairUser = self->_isWheelchairUser;

  if (isWheelchairUser)
    goto LABEL_8;
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateOfBirth"));
  v139 = FIAgeInYearsForDateOfBirth();

  v17 = (id)FIDefaultActivityMoveModeWithAge(v139);
LABEL_7:
  self->_activityMoveMode = (int64_t)v17;
LABEL_8:
  self->_isRTL = FIUILocaleIsRightToLeft(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController delegate](self, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activePairingDevice"));
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    active = FIGetActivePairedDevice();
    v21 = (id)objc_claimAutoreleasedReturnValue(active);
  }
  v23 = v21;

  v160 = 0;
  v161 = &v160;
  v162 = 0x2020000000;
  v24 = (id *)qword_10083DF60;
  v163 = qword_10083DF60;
  if (!qword_10083DF60)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    *(_QWORD *)&v147 = sub_100067B34;
    *((_QWORD *)&v147 + 1) = &unk_100777F08;
    *(_QWORD *)&v148 = &v160;
    sub_100067B34((uint64_t)location);
    v24 = (id *)v161[3];
  }
  _Block_object_dispose(&v160, 8);
  if (!v24)
  {
    v140 = (_Unwind_Exception *)sub_1005F1C5C();
    objc_destroyWeak(0);
    objc_destroyWeak(location);
    _Unwind_Resume(v140);
  }
  v145 = v13;
  v25 = *v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", v25));
  self->_isTinkerPaired = objc_msgSend(v26, "BOOLValue");

  self->_currentPageIndex = 0;
  -[CHASActivitySetupViewController generateHeaders](self, "generateHeaders");
  activityMoveMode = self->_activityMoveMode;
  v28 = objc_msgSend(v11, "biologicalSex");
  v29 = v28;
  v143 = v23;
  v144 = v16;
  if (activityMoveMode == 2)
  {
    if (v28 == (id)2)
      v30 = 0.0;
    else
      v30 = 1.0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weight"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9));
    objc_msgSend(v31, "doubleValueForUnit:", v32);
    v34 = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "height"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 7));
    objc_msgSend(v35, "doubleValueForUnit:", v36);
    v38 = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateOfBirth"));
    v40 = (double)FIAgeInYearsForDateOfBirth();

    v41 = (double)FICMotionConditionForWheelchairUse(objc_msgSend(v11, "wheelchairUse"));
    v42 = -[CHASActivitySetupViewController _isStandalonePhoneFitnessMode](self, "_isStandalonePhoneFitnessMode");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _formattingManager](self, "_formattingManager"));
    IsStandalonePhoneFitnessMode = FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode(v42, v43, v30, v34, v38, v40, v41);
    v45 = objc_claimAutoreleasedReturnValue(IsStandalonePhoneFitnessMode);
  }
  else
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weight"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leanBodyMass"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "height"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateOfBirth"));
    v50 = FIUICalculateBMR(v29, v46, v47, v48, v49, objc_msgSend(v11, "wheelchairUse"));

    v51 = -[CHASActivitySetupViewController _isStandalonePhoneFitnessMode](self, "_isStandalonePhoneFitnessMode");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _formattingManager](self, "_formattingManager"));
    v52 = FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode(v51, v43, v50);
    v45 = objc_claimAutoreleasedReturnValue(v52);
  }
  v53 = (void *)v45;

  v54 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v54;

  -[UIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 0);
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", 1);
  -[UIScrollView setExclusiveTouch:](self->_scrollView, "setExclusiveTouch:", 0);
  -[UIScrollView setCanCancelContentTouches:](self->_scrollView, "setCanCancelContentTouches:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  objc_msgSend(v56, "addSubview:", self->_scrollView);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
  objc_msgSend(v60, "setActive:", 1);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v63));
  objc_msgSend(v64, "setActive:", 1);

  -[CHASActivitySetupViewController _loadMoveGoalView](self, "_loadMoveGoalView");
  v142 = v53;
  -[CHASActivitySetupViewController setActivityLevels:activityMoveMode:](self, "setActivityLevels:activityMoveMode:", v53, self->_activityMoveMode);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "features"));
  LODWORD(v63) = objc_msgSend(v66, "scheduledGoals");

  if ((_DWORD)v63)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont hk_preferredFontForTextStyle:](UIFont, "hk_preferredFontForTextStyle:", UIFontTextStyleCaption1));
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v68));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("calendar")));
    objc_msgSend(v67, "setImage:", v69);

    v71 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v70));
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("SCHEDULE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    objc_msgSend(v67, "setTitle:", v73);

    objc_msgSend(v67, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
    objc_msgSend(v67, "setImagePadding:", 3.0);
    objc_initWeak(location, self);
    v156[0] = _NSConcreteStackBlock;
    v156[1] = 3221225472;
    v156[2] = sub_100062AAC;
    v156[3] = &unk_100778070;
    objc_copyWeak(&v157, location);
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v156));
    v75 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v67, v74));
    advancedButton = self->_advancedButton;
    self->_advancedButton = v75;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_advancedButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v77 = self->_advancedButton;
    v154[0] = _NSConcreteStackBlock;
    v154[1] = 3221225472;
    v154[2] = sub_100062AD8;
    v154[3] = &unk_100778098;
    objc_copyWeak(&v155, location);
    -[UIButton setConfigurationUpdateHandler:](v77, "setConfigurationUpdateHandler:", v154);
    if (!self->_editTodayOnly)
    {
      v78 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", self->_advancedButton);
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v79, "setRightBarButtonItem:", v78);

    }
    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = sub_100062B20;
    v152[3] = &unk_1007780E8;
    objc_copyWeak(&v153, location);
    -[CHASActivitySetupViewController _fetchMostRecentGoalSchedulesWithCompletion:](self, "_fetchMostRecentGoalSchedulesWithCompletion:", v152);
    objc_destroyWeak(&v153);
    objc_destroyWeak(&v155);

    objc_destroyWeak(&v157);
    objc_destroyWeak(location);

  }
  if (self->_recommendedMoveGoal)
  {
    if (self->_activityMoveMode == 2)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit minuteUnit](HKUnit, "minuteUnit"));
    }
    else
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](self->_formattingManager, "unitManager"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "userActiveEnergyBurnedUnit"));

    }
    -[NSNumber doubleValue](self->_recommendedMoveGoal, "doubleValue");
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v80));
    -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", v82, self->_moveGoalView);

  }
  else
  {
    objc_initWeak(location, self);
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472;
    v150[2] = sub_100062C24;
    v150[3] = &unk_100778110;
    objc_copyWeak(&v151, location);
    -[CHASActivitySetupViewController _fetchMostRecentMoveGoalSampleWithCompletion:](self, "_fetchMostRecentMoveGoalSampleWithCompletion:", v150);
    objc_destroyWeak(&v151);
    objc_destroyWeak(location);
  }
  -[CHASActivitySetupViewController _loadExerciseAndStandGoalViews](self, "_loadExerciseAndStandGoalViews");
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _activityLevelView](self, "_activityLevelView"));
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v83);
  objc_msgSend(v83, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "topAnchor"));
  *(_OWORD *)location = 0u;
  v147 = 0u;
  __asm { FMOV            V0.2D, #16.0 }
  v148 = _Q0;
  v149 = _Q0;
  BPSScreenValueGetRelevantValue(location);
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v86));
  objc_msgSend(v92, "setActive:", 1);

  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "centerXAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "centerXAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v95));
  objc_msgSend(v96, "setActive:", 1);

  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v99));
  objc_msgSend(v100, "setActive:", 1);

  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "trailingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:", v103));
  objc_msgSend(v104, "setActive:", 1);

  v105 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  continueButton = self->_continueButton;
  self->_continueButton = v105;

  v107 = -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, "tappedContinue:", 64);
  v108 = self->_continueButton;
  v109 = BPSPillSelectedColor(v107);
  v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
  -[OBBoldTrayButton setTintColor:](v108, "setTintColor:", v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldTrayButton configuration](self->_continueButton, "configuration"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "nonGradientTextColor"));
  objc_msgSend(v111, "setBaseForegroundColor:", v113);

  v114 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController continueButtonTitle](self, "continueButtonTitle"));
  objc_msgSend(v111, "setTitle:", v114);

  -[OBBoldTrayButton setConfiguration:](self->_continueButton, "setConfiguration:", v111);
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v115, "addButton:", self->_continueButton);

  v116 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  footerLabel = self->_footerLabel;
  self->_footerLabel = v116;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 0);
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont defaultFontForTextStyle:](UIFont, "defaultFontForTextStyle:", UIFontTextStyleFootnote));
  -[UILabel setFont:](self->_footerLabel, "setFont:", v118);

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_footerLabel, "setTextColor:", v119);

  v121 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v120));
  v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "localizedStringForKey:value:table:", CFSTR("CHANGE_GOAL_FOOTER"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
  -[UILabel setText:](self->_footerLabel, "setText:", v123);

  -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
  if (self->_recommendedMoveGoal)
  {
    -[CHASActivitySetupLevelView setAlpha:](self->_activityLevelView, "setAlpha:", 0.0);
    v124 = self->_continueButton;
    v126 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v125));
    v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "localizedStringForKey:value:table:", CFSTR("CHANGE_MOVE_GOAL"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    -[OBBoldTrayButton setTitle:forState:](v124, "setTitle:forState:", v128, 0);

    v129 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    notNowButton = self->_notNowButton;
    self->_notNowButton = v129;

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_notNowButton, "addTarget:action:forControlEvents:", self, "_dismiss:", 64);
    v131 = self->_notNowButton;
    v133 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v132));
    v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "localizedStringForKey:value:table:", CFSTR("SKIP_LABEL"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    -[OBLinkTrayButton setTitle:forState:](v131, "setTitle:forState:", v135, 0);

    v136 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v136, "addButton:", self->_notNowButton);

  }
}

- (void)_updateAdvanceViewButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIView *advancedGoalView;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont hk_preferredFontForTextStyle:](UIFont, "hk_preferredFontForTextStyle:", UIFontTextStyleCaption1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v5));
  advancedGoalView = self->_advancedGoalView;
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (advancedGoalView)
    v12 = CFSTR("DAILY");
  else
    v12 = CFSTR("SCHEDULE");
  if (advancedGoalView)
    v13 = CFSTR("calendar.badge.ring.closed");
  else
    v13 = CFSTR("checklist.unchecked.note");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1007AE1D0, CFSTR("ActivitySetup")));
  objc_msgSend(v16, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v13, v6));
  objc_msgSend(v16, "setImage:", v15);

  objc_msgSend(v4, "setConfiguration:", v16);
}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t goalType;

  goalType = self->_goalType;
  if (goalType == 2)
  {
    if (self->_currentlyPresentedView != self->_standGoalView)
      -[CHASActivitySetupViewController _displayStandGoalViewAnimated:](self, "_displayStandGoalViewAnimated:", 0);
  }
  else if (goalType == 1 && self->_currentlyPresentedView != self->_exerciseGoalView)
  {
    -[CHASActivitySetupViewController _displayExerciseGoalViewAnimated:](self, "_displayExerciseGoalViewAnimated:", 0);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  int64_t goalType;
  UIScrollView *scrollView;
  double v8;
  double v9;
  double *headerHeights;
  double v11;
  double v12;
  double v13;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double MidY;
  void *v27;
  double v28;
  void *v29;
  double v30;
  UIScrollView *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  objc_super v37[4];
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)CHASActivitySetupViewController;
  -[CHASActivitySetupViewController viewWillLayoutSubviews](&v38, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  goalType = self->_goalType;
  if (goalType == 2)
  {
    scrollView = self->_scrollView;
    if (self->_isRTL)
    {
      v8 = v5 * -2.0;
      goto LABEL_7;
    }
    v9 = v5 + v5;
  }
  else
  {
    if (goalType != 1)
      goto LABEL_11;
    scrollView = self->_scrollView;
    if (self->_isRTL)
    {
      v8 = -v5;
LABEL_7:
      -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v8, 0.0);
      -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v5, 0.0, v5);
      goto LABEL_11;
    }
    v9 = v5;
  }
  -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, v9, 0.0);
LABEL_11:
  -[CHASActivitySetupViewController computeMaxYForGoalViews](self, "computeMaxYForGoalViews");
  headerHeights = self->_headerHeights;
  if (headerHeights)
    v11 = headerHeights[self->_currentPageIndex];
  else
    v11 = 0.0;
  -[CHASActivitySetupGoalView intrinsicContentSize](self->_moveGoalView, "intrinsicContentSize");
  v13 = v12;
  memset(v37, 0, 32);
  __asm { FMOV            V0.2D, #16.0 }
  v37[2] = _Q0;
  v37[3] = _Q0;
  v19 = BPSScreenValueGetRelevantValue(v37) + 30.0;
  -[CHASActivitySetupLevelView frame](self->_activityLevelView, "frame");
  v21 = v19 + v20;
  if (-[CHASActivitySetupViewController shouldAccountForHeaderHeight](self, "shouldAccountForHeaderHeight"))
    v21 = v21 + self->_maxHeaderViewHeight - v11;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  objc_msgSend(v22, "frame");
  v24 = v13 + v21 + v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v25, "frame");
  MidY = CGRectGetMidY(v39);

  if (v24 < MidY)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
    objc_msgSend(v27, "frame");
    v28 = CGRectGetMidY(v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    objc_msgSend(v29, "frame");
    v21 = v21 + v28 - (v13 + v21 + v30);

  }
  v31 = self->_scrollView;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v32, "bounds");
  -[UIScrollView setFrame:](v31, "setFrame:", 0.0, 0.0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  objc_msgSend(v33, "bounds");
  v35 = v34 * 3.0;
  -[CHASActivitySetupGoalView intrinsicContentSize](self->_moveGoalView, "intrinsicContentSize");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v35, v21 + v36);

  -[CHASActivitySetupViewController alignGoalViews](self, "alignGoalViews");
}

- (void)computeMaxYForGoalViews
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  self->_headerHeights = (double *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
  if (-[NSArray count](self->_pageTitles, "count"))
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_pageTitles, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v8, "setTitle:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_pageDetailTexts, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v10, "setDetailText:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
      LODWORD(v13) = 1148846080;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v12, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 1.79769313e308, v13, v14);
      v16 = v15;

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
      objc_msgSend(v17, "frame");
      v19 = v16 + v18;

      if (v19 > v7)
        v7 = v19;
      self->_headerHeights[v6++] = v19;
    }
    while (-[NSArray count](self->_pageTitles, "count") > v6);
  }
  else
  {
    v7 = 0.0;
  }
  self->_maxHeaderViewHeight = v7;
  -[CHASActivitySetupViewController updateHeaderViewContent](self, "updateHeaderViewContent");
  -[CHASActivitySetupViewController updateContinueButton](self, "updateContinueButton");
}

- (void)updateHeaderViewContent
{
  UIView *advancedGoalView;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  advancedGoalView = self->_advancedGoalView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
  if (advancedGoalView)
    v5 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController advanceGoalHeaderTitle](self, "advanceGoalHeaderTitle"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_pageTitles, "objectAtIndexedSubscript:", self->_currentPageIndex));
  v6 = (void *)v5;
  objc_msgSend(v4, "setTitle:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_pageDetailTexts, "objectAtIndexedSubscript:", self->_currentPageIndex));
  objc_msgSend(v8, "setDetailText:", v7);

}

- (id)continueButtonTitle
{
  void *v2;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 isWheelchairUser;
  NSBundle *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSString *v13;
  NSBundle *v14;
  const __CFString *v15;
  NSBundle *v16;
  const __CFString *v17;
  NSBundle *v18;
  void *v19;
  uint64_t v21;

  v4 = -[CHASActivitySetupViewController _activityGoalTypeForCurrentPage](self, "_activityGoalTypeForCurrentPage");
  if (!self->_advancedGoalView)
  {
    if (v4 < 2)
    {
      if (self->_editTodayOnly)
        v15 = CFSTR("_FOR_TODAY");
      else
        v15 = &stru_1007AE1D0;
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CHANGE_MOVE_GOAL%@"), v15, v21);
    }
    else if (v4 == 2)
    {
      if (self->_editTodayOnly)
        v17 = CFSTR("_FOR_TODAY");
      else
        v17 = &stru_1007AE1D0;
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CHANGE_EXERCISE_GOAL%@"), v17, v21);
    }
    else
    {
      if (v4 != 3)
      {
        v9 = 0;
        goto LABEL_28;
      }
      if (self->_isWheelchairUser)
        v11 = CFSTR("ROLL");
      else
        v11 = CFSTR("STAND");
      if (self->_editTodayOnly)
        v12 = CFSTR("_FOR_TODAY");
      else
        v12 = &stru_1007AE1D0;
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CHANGE_%@_GOAL%@"), v11, v12);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
LABEL_28:
    v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v9, &stru_1007AE1D0, CFSTR("ActivitySetup")));

LABEL_32:
    return v2;
  }
  if (v4 < 2)
  {
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v9 = v8;
    v10 = CFSTR("SET_MOVE_GOAL_SCHEDULE");
LABEL_31:
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1007AE1D0, CFSTR("ActivitySetup")));
    goto LABEL_32;
  }
  if (v4 == 2)
  {
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v9 = v8;
    v10 = CFSTR("SET_EXERCISE_GOAL_SCHEDULE");
    goto LABEL_31;
  }
  if (v4 == 3)
  {
    isWheelchairUser = self->_isWheelchairUser;
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (isWheelchairUser)
      v10 = CFSTR("SET_ROLL_GOAL_SCHEDULE");
    else
      v10 = CFSTR("SET_STAND_GOAL_SCHEDULE");
    goto LABEL_31;
  }
  return v2;
}

- (void)updateContinueButton
{
  void *v3;
  UIView *advancedGoalView;
  BOOL v5;
  char **v6;
  char **v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[OBBoldTrayButton configuration](self->_continueButton, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController continueButtonTitle](self, "continueButtonTitle"));
  objc_msgSend(v8, "setTitle:", v3);

  -[OBBoldTrayButton setConfiguration:](self->_continueButton, "setConfiguration:", v8);
  advancedGoalView = self->_advancedGoalView;
  v5 = advancedGoalView == 0;
  if (advancedGoalView)
    v6 = &selRef_tappedContinue_;
  else
    v6 = &selRef__updateGoalSchedule;
  if (v5)
    v7 = &selRef_tappedContinue_;
  else
    v7 = &selRef__updateGoalSchedule;
  -[OBBoldTrayButton removeTarget:action:forControlEvents:](self->_continueButton, "removeTarget:action:forControlEvents:", self, *v6, 64);
  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, *v7, 64);

}

- (BOOL)shouldAccountForHeaderHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController headerView](self, "headerView"));
  objc_msgSend(v6, "bounds");
  v8 = v5 + v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  objc_msgSend(v9, "bounds");
  v11 = v8 + v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v12, "bounds");
  v14 = v11 + v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v15, "bounds");
  v17 = v14 < v16;

  return v17;
}

- (void)alignGoalViews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CHASActivitySetupGoalView intrinsicContentSize](self->_moveGoalView, "intrinsicContentSize");
  v7 = v6;
  if (self->_isRTL)
    v8 = -v5;
  else
    v8 = v5;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v10 = v9 - v7;
  -[CHASActivitySetupGoalView setFrame:](self->_moveGoalView, "setFrame:", 0.0, v9 - v7, v5, v7);
  -[CHASActivitySetupGoalView setFrame:](self->_exerciseGoalView, "setFrame:", v8, v10, v5, v7);
  -[CHASActivitySetupGoalView setFrame:](self->_standGoalView, "setFrame:", v8 + v8, v10, v5, v7);
}

- (void)_loadMoveGoalView
{
  CHASActivitySetupGoalView *moveGoalView;
  CHASActivitySetupGoalView *v4;
  CHASActivitySetupGoalView *v5;
  id v6;

  moveGoalView = self->_moveGoalView;
  if (moveGoalView)
    -[CHASActivitySetupGoalView removeFromSuperview](moveGoalView, "removeFromSuperview");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _moveGoalViewConfiguration](self, "_moveGoalViewConfiguration"));
  v4 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v6, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
  v5 = self->_moveGoalView;
  self->_moveGoalView = v4;

  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_moveGoalView);
}

- (id)_createGoalViewWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CHASActivitySetupGoalView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[CHASActivitySetupGoalView initWithFrame:configuration:]([CHASActivitySetupGoalView alloc], "initWithFrame:configuration:", v9, x, y, width, height);

  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v10);
  return v10;
}

- (void)_storeGoals
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 hasMoveGoalSchedule;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 hasExerciseGoalSchedule;
  void *v12;
  void *v13;
  _BOOL4 hasStandGoalSchedule;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDate *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  intptr_t v30;
  uint64_t v31;
  NSObject *v32;
  HKQuantity *newDailyMoveGoal;
  HKQuantity *newDailyExerciseGoal;
  HKQuantity *newDailyStandGoal;
  int64_t activityMoveMode;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  uint8_t buf[4];
  HKQuantity *v48;
  __int16 v49;
  HKQuantity *v50;
  __int16 v51;
  HKQuantity *v52;
  __int16 v53;
  int64_t v54;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar hk_gregorianCalendar](NSCalendar, "hk_gregorianCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startOfDayForDate:", v6));

  hasMoveGoalSchedule = self->_hasMoveGoalSchedule;
  if (!self->_hasMoveGoalSchedule || self->_editTodayOnly)
  {
    if (self->_newDailyMoveGoal)
    {
      if (self->_activityMoveMode == 2)
        v8 = objc_claimAutoreleasedReturnValue(+[HKObjectType moveMinuteGoal](HKObjectType, "moveMinuteGoal"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[HKObjectType calorieGoal](HKObjectType, "calorieGoal"));
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v8, self->_newDailyMoveGoal, v5, v5, v44));
      objc_msgSend(v3, "addObject:", v10);

      hasMoveGoalSchedule = self->_hasMoveGoalSchedule;
    }
    if (!hasMoveGoalSchedule && self->_editTodayOnly && self->_defaultMoveGoalQuantity)
    {
      if (self->_activityMoveMode == 2)
        v37 = objc_claimAutoreleasedReturnValue(+[HKObjectType moveMinuteGoal](HKObjectType, "moveMinuteGoal"));
      else
        v37 = objc_claimAutoreleasedReturnValue(+[HKObjectType calorieGoal](HKObjectType, "calorieGoal"));
      v42 = (void *)v37;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v37, self->_defaultMoveGoalQuantity, v44, v44, v44));
      objc_msgSend(v3, "addObject:", v43);

    }
  }
  hasExerciseGoalSchedule = self->_hasExerciseGoalSchedule;
  if (!self->_hasExerciseGoalSchedule || self->_editTodayOnly)
  {
    if (self->_newDailyExerciseGoal)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType exerciseGoal](HKObjectType, "exerciseGoal"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v12, self->_newDailyExerciseGoal, v5, v5));

      objc_msgSend(v3, "addObject:", v13);
      hasExerciseGoalSchedule = self->_hasExerciseGoalSchedule;
    }
    if (!hasExerciseGoalSchedule && self->_editTodayOnly && self->_defaultExerciseGoalQuantity)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType exerciseGoal](HKObjectType, "exerciseGoal"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v38, self->_defaultExerciseGoalQuantity, v44, v44));

      objc_msgSend(v3, "addObject:", v39);
    }
  }
  hasStandGoalSchedule = self->_hasStandGoalSchedule;
  if (!self->_hasStandGoalSchedule || self->_editTodayOnly)
  {
    if (self->_newDailyStandGoal)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType standGoal](HKObjectType, "standGoal"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v15, self->_newDailyStandGoal, v5, v5));

      objc_msgSend(v3, "addObject:", v16);
      hasStandGoalSchedule = self->_hasStandGoalSchedule;
    }
    if (!hasStandGoalSchedule && self->_editTodayOnly && self->_defaultStandGoalQuantity)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType standGoal](HKObjectType, "standGoal"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantitySample quantitySampleWithType:quantity:startDate:endDate:](HKQuantitySample, "quantitySampleWithType:quantity:startDate:endDate:", v40, self->_defaultStandGoalQuantity, v44, v44));

      objc_msgSend(v3, "addObject:", v41);
    }
  }
  if (self->_activityMoveMode == 2)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startOfDayForDate:", v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "components:fromDate:", _HKRequiredCalendarUnitsForCacheIndexDateComponents, v19));

    v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)_HKCacheIndexFromDateComponents(v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType categoryTypeForIdentifier:](HKObjectType, "categoryTypeForIdentifier:", _HKCategoryTypeIdentifierActivityMoveModeChange));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[HKCategorySample categorySampleWithType:value:startDate:endDate:](HKCategorySample, "categorySampleWithType:value:startDate:endDate:", v24, 2, v23, v23));
    objc_msgSend(v3, "addObject:", v25);

  }
  v26 = dispatch_semaphore_create(0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController healthStore](self, "healthStore"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000640BC;
  v45[3] = &unk_100778138;
  v28 = v26;
  v46 = v28;
  objc_msgSend(v27, "saveObjects:withCompletion:", v3, v45);

  v29 = dispatch_time(0, 5000000000);
  v30 = dispatch_semaphore_wait(v28, v29);
  _HKInitializeLogging(v30, v31);
  v32 = HKLogActivity;
  if (v30)
  {
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_FAULT))
      sub_1005F1E18(v32);
  }
  else if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    newDailyMoveGoal = self->_newDailyMoveGoal;
    newDailyExerciseGoal = self->_newDailyExerciseGoal;
    newDailyStandGoal = self->_newDailyStandGoal;
    activityMoveMode = self->_activityMoveMode;
    *(_DWORD *)buf = 138413058;
    v48 = newDailyMoveGoal;
    v49 = 2112;
    v50 = newDailyExerciseGoal;
    v51 = 2112;
    v52 = newDailyStandGoal;
    v53 = 2048;
    v54 = activityMoveMode;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Successfully saved first daily goals: %@, %@, and %@ with activity move mode: %ld.", buf, 0x2Au);
  }
  FIUISetNeedsActivityRingExplanation(1);

}

- (id)_unitManager
{
  FIUIUnitManager *unitManager;
  id v4;
  void *v5;
  FIUIUnitManager *v6;
  FIUIUnitManager *v7;

  unitManager = self->_unitManager;
  if (!unitManager)
  {
    v4 = objc_alloc((Class)FIUIUnitManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController healthStore](self, "healthStore"));
    v6 = (FIUIUnitManager *)objc_msgSend(v4, "initWithHealthStore:", v5);
    v7 = self->_unitManager;
    self->_unitManager = v6;

    unitManager = self->_unitManager;
  }
  return unitManager;
}

- (id)_formattingManager
{
  FIUIFormattingManager *formattingManager;
  id v4;
  void *v5;
  FIUIFormattingManager *v6;
  FIUIFormattingManager *v7;

  formattingManager = self->_formattingManager;
  if (!formattingManager)
  {
    v4 = objc_alloc((Class)FIUIFormattingManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _unitManager](self, "_unitManager"));
    v6 = (FIUIFormattingManager *)objc_msgSend(v4, "initWithUnitManager:", v5);
    v7 = self->_formattingManager;
    self->_formattingManager = v6;

    formattingManager = self->_formattingManager;
  }
  return formattingManager;
}

- (id)healthStore
{
  HKHealthStore *healthStore;
  void *v4;
  void *v5;
  uint64_t v6;
  HKHealthStore *v7;
  HKHealthStore *v8;

  healthStore = self->_healthStore;
  if (!healthStore)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activePairingDevice"));

    v6 = FIUIHealthStoreForDevice(v5);
    v7 = (HKHealthStore *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_healthStore;
    self->_healthStore = v7;

    healthStore = self->_healthStore;
  }
  return healthStore;
}

- (void)_displayExerciseGoalViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIScrollView *scrollView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  UIScrollView *v19;
  int64_t activityMoveMode;
  void *v21;
  uint64_t *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;

  v3 = a3;
  scrollView = self->_scrollView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  LOBYTE(scrollView) = -[UIScrollView isDescendantOfView:](scrollView, "isDescendantOfView:", v6);

  if ((scrollView & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_scrollView);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  v18 = v17;

  -[CHASActivitySetupGoalView becomeFirstResponder](self->_exerciseGoalView, "becomeFirstResponder");
  v19 = self->_scrollView;
  if (self->_isRTL)
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, -v18, 0.0);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v18, 0.0, v18);
  }
  else
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18, 0.0);
  }
  self->_currentPageIndex = 1;
  -[CHASActivitySetupViewController updateHeaderViewContent](self, "updateHeaderViewContent");
  -[CHASActivitySetupViewController updateContinueButton](self, "updateContinueButton");
  -[CHASActivitySetupLevelView setHidden:](self->_activityLevelView, "setHidden:", 1);
  activityMoveMode = self->_activityMoveMode;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit minuteUnit](HKUnit, "minuteUnit"));
  v22 = (uint64_t *)&_HKDefaultTinkerDailyBriskMinutesGoal;
  if (activityMoveMode != 2)
    v22 = (uint64_t *)&_HKDefaultDailyBriskMinutesGoal;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v21, (double)*v22));

  -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", v23, self->_exerciseGoalView);
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100064520;
  v24[3] = &unk_100778110;
  objc_copyWeak(&v25, &location);
  -[CHASActivitySetupViewController _fetchMostRecentExerciseGoalSampleWithCompletion:](self, "_fetchMostRecentExerciseGoalSampleWithCompletion:", v24);
  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_exerciseGoalView);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_displayStandGoalViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UIScrollView *scrollView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  UIScrollView *v19;
  int64_t activityMoveMode;
  void *v21;
  uint64_t *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;

  v3 = a3;
  scrollView = self->_scrollView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  LOBYTE(scrollView) = -[UIScrollView isDescendantOfView:](scrollView, "isDescendantOfView:", v6);

  if ((scrollView & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_scrollView);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    objc_msgSend(v15, "setActive:", 1);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  v18 = v17;

  -[CHASActivitySetupGoalView becomeFirstResponder](self->_standGoalView, "becomeFirstResponder");
  v19 = self->_scrollView;
  if (self->_isRTL)
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18 * -2.0, 0.0);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, v18 + v18, 0.0, v18);
  }
  else
  {
    -[UIScrollView setContentOffset:animated:](v19, "setContentOffset:animated:", v3, v18 + v18, 0.0);
  }
  self->_currentPageIndex = 2;
  -[CHASActivitySetupViewController updateHeaderViewContent](self, "updateHeaderViewContent");
  -[CHASActivitySetupViewController updateContinueButton](self, "updateContinueButton");
  -[CHASActivitySetupLevelView setHidden:](self->_activityLevelView, "setHidden:", 1);
  activityMoveMode = self->_activityMoveMode;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
  v22 = (uint64_t *)&_HKDefaultTinkerDailyActiveHoursGoal;
  if (activityMoveMode != 2)
    v22 = (uint64_t *)&_HKDefaultDailyActiveHoursGoal;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v21, (double)*v22));

  -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", v23, self->_standGoalView);
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100064948;
  v24[3] = &unk_100778110;
  objc_copyWeak(&v25, &location);
  -[CHASActivitySetupViewController _fetchMostRecentStandGoalSampleWithCompletion:](self, "_fetchMostRecentStandGoalSampleWithCompletion:", v24);
  objc_storeStrong((id *)&self->_currentlyPresentedView, self->_standGoalView);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_saveGoalsAndDismiss
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t presentationContext;
  void *v9;
  void *v10;
  id v11;

  -[CHASActivitySetupViewController _storeGoals](self, "_storeGoals");
  if (self->_isTinkerPaired)
  {
    v3 = objc_msgSend(objc_alloc((Class)HKSecondaryDevicePairingAgent), "initWithHealthStore:", self->_healthStore);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activePairingDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingID"));

    objc_msgSend(v3, "performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:", v6, 1, &stru_100778178);
  }
  else
  {
    v3 = objc_msgSend(objc_alloc((Class)HKNanoSyncControl), "initWithHealthStore:", self->_healthStore);
    objc_msgSend(v3, "forceNanoSyncWithOptions:completion:", 1, &stru_100778198);
  }

  presentationContext = self->_presentationContext;
  if (presentationContext == 4 || presentationContext == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
    FIActivityAnalyticsSubmission(CFSTR("com.apple.standalonePhoneFitnessModeGraduation"), CFSTR("graduationType"), v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController delegate](self, "delegate"));

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController delegate](self, "delegate"));
    objc_msgSend(v11, "buddyControllerDone:", self);

  }
  else
  {
    -[CHASActivitySetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)_isStandalonePhoneFitnessMode
{
  unint64_t presentationContext;
  BOOL v3;
  uint64_t v4;
  void *v6;
  unsigned __int8 v7;

  presentationContext = self->_presentationContext;
  v3 = presentationContext > 6;
  v4 = (1 << presentationContext) & 0x46;
  if (v3 || v4 == 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v7 = objc_msgSend(v6, "isStandalonePhoneFitnessMode");

  return v7;
}

- (BOOL)_shouldShowChangeGoalFooter
{
  void *v3;
  BOOL v4;

  if (self->_presentationContext != 6)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v4 = (objc_msgSend(v3, "isStandalonePhoneFitnessMode") & 1) == 0 && self->_advancedGoalView == 0;

  return v4;
}

- (void)tappedContinue:(id)a3
{
  _QWORD *v5;
  unsigned int v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSBundle *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(_QWORD *);
  void *v31;
  CHASActivitySetupViewController *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100065120;
  v35[3] = &unk_100777E20;
  v35[4] = self;
  v5 = objc_retainBlock(v35);
  v6 = -[CHASActivitySetupViewController _currentPageHasGoalSchedule](self, "_currentPageHasGoalSchedule");
  if (a3 && v6 && !self->_editTodayOnly)
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOVE_SCHEDULE_TITLE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REMOVE_SCHEDULE_MESSAGE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v14, 1));

    v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &stru_1007781D8));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _existingActivityGoalScheduleForCurrentPage](self, "_existingActivityGoalScheduleForCurrentPage"));
    v23 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_100065278;
    v31 = &unk_100778248;
    v32 = self;
    v33 = v21;
    v34 = v5;
    v26 = v21;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 2, &v28));

    objc_msgSend(v15, "addAction:", v20, v28, v29, v30, v31, v32);
    objc_msgSend(v15, "addAction:", v27);
    objc_msgSend(v15, "setPreferredAction:", v27);
    -[CHASActivitySetupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }

}

- (void)_dismiss:(id)a3
{
  -[CHASActivitySetupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_toggleAdvancedMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_advancedGoalView)
  {
    -[CHASActivitySetupViewController _removeAdvancedView](self, "_removeAdvancedView");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    objc_msgSend(v3, "addSubview:", self->_scrollView);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_scrollView, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v11, "setActive:", 1);

  }
  else
  {
    -[CHASActivitySetupViewController _showAdvancedViewForCurrentGoalPage](self, "_showAdvancedViewForCurrentGoalPage");
  }
  -[CHASActivitySetupViewController updateContinueButton](self, "updateContinueButton");
}

- (void)_showAdvancedViewIfNeeded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _existingActivityGoalScheduleForCurrentPage](self, "_existingActivityGoalScheduleForCurrentPage"));
  if (v3 && !self->_editTodayOnly)
  {
    v4 = v3;
    -[CHASActivitySetupViewController _showAdvancedViewForCurrentGoalPage](self, "_showAdvancedViewForCurrentGoalPage");
    v3 = v4;
  }

}

- (void)_removeAdvancedView
{
  UIView *advancedGoalView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  -[UIView removeFromSuperview](self->_advancedGoalView, "removeFromSuperview");
  advancedGoalView = self->_advancedGoalView;
  self->_advancedGoalView = 0;

  -[UIButton setNeedsUpdateConfiguration](self->_advancedButton, "setNeedsUpdateConfiguration");
  if (-[CHASActivitySetupViewController _shouldShowChangeGoalFooter](self, "_shouldShowChangeGoalFooter"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v4, "addSubview:", self->_footerLabel);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_footerLabel, "bottomAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldTrayButton topAnchor](self->_continueButton, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -15.0));
    v15[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_footerLabel, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldTrayButton leadingAnchor](self->_continueButton, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    v15[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_footerLabel, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldTrayButton trailingAnchor](self->_continueButton, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v15[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  }
}

- (id)_existingActivityGoalScheduleForCurrentPage
{
  int64_t v3;
  NSArray *goalSchedules;
  _QWORD v6[5];

  v3 = -[CHASActivitySetupViewController _activityGoalTypeForCurrentPage](self, "_activityGoalTypeForCurrentPage");
  goalSchedules = self->_goalSchedules;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100065788;
  v6[3] = &unk_100778268;
  v6[4] = v3;
  return (id)objc_claimAutoreleasedReturnValue(-[NSArray hk_firstObjectPassingTest:](goalSchedules, "hk_firstObjectPassingTest:", v6));
}

- (BOOL)_currentPageHasGoalSchedule
{
  unint64_t v3;

  v3 = -[CHASActivitySetupViewController _activityGoalTypeForCurrentPage](self, "_activityGoalTypeForCurrentPage");
  return v3 <= 3 && self->OBTableWelcomeController_opaque[*off_1007783D8[v3]] != 0;
}

- (int64_t)_activityGoalTypeForCurrentPage
{
  int currentPageIndex;

  currentPageIndex = self->_currentPageIndex;
  if (currentPageIndex == 1)
    return 2;
  if (currentPageIndex)
    return 3;
  return self->_activityMoveMode == 2;
}

- (void)_showAdvancedViewForCurrentGoalPage
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC10FitnessApp13GoalDaysModel *v9;
  _TtC10FitnessApp13GoalDaysModel *goalDaysModel;
  int currentPageIndex;
  uint64_t v12;
  void *v13;
  UIView *v14;
  UIView *advancedGoalView;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
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
  id v37;

  -[UIScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_footerLabel, "removeFromSuperview");
  v37 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _existingActivityGoalScheduleForCurrentPage](self, "_existingActivityGoalScheduleForCurrentPage"));
  if (v37)
    goto LABEL_11;
  v3 = -[CHASActivitySetupViewController _activityGoalTypeForCurrentPage](self, "_activityGoalTypeForCurrentPage");
  v4 = v3;
  if (v3 < 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController currentMoveGoal](self, "currentMoveGoal"));
  }
  else if (v3 == 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController currentExerciseGoal](self, "currentExerciseGoal"));
  }
  else
  {
    if (v3 != 3)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController currentStandGoal](self, "currentStandGoal"));
  }
  v6 = (void *)v5;
LABEL_10:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKDevice localDevice](HKDevice, "localDevice"));
  v37 = (id)objc_claimAutoreleasedReturnValue(+[HKActivityGoalSchedule activityGoalScheduleWithDate:goalType:goal:device:metadata:](HKActivityGoalSchedule, "activityGoalScheduleWithDate:goalType:goal:device:metadata:", v7, v4, v6, v8, 0));

LABEL_11:
  v9 = -[GoalDaysModel initWithGoalSchedule:]([_TtC10FitnessApp13GoalDaysModel alloc], "initWithGoalSchedule:", v37);
  goalDaysModel = self->_goalDaysModel;
  self->_goalDaysModel = v9;

  currentPageIndex = self->_currentPageIndex;
  if (currentPageIndex == 1)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _exerciseGoalViewConfiguration](self, "_exerciseGoalViewConfiguration"));
  }
  else if (currentPageIndex)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _standGoalViewConfiguration](self, "_standGoalViewConfiguration"));
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _moveGoalViewConfiguration](self, "_moveGoalViewConfiguration"));
  }
  v13 = (void *)v12;
  -[UIView removeFromSuperview](self->_advancedGoalView, "removeFromSuperview");
  v14 = (UIView *)objc_claimAutoreleasedReturnValue(+[CHASAdvancedGoalViewFactory makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:](CHASAdvancedGoalViewFactory, "makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:", v37, self->_goalDaysModel, self->_isWheelchairUser, objc_msgSend(v37, "goalType"), self->_formattingManager, -[CHASActivitySetupViewController _shouldShowChangeGoalFooter](self, "_shouldShowChangeGoalFooter")));
  advancedGoalView = self->_advancedGoalView;
  self->_advancedGoalView = v14;

  v17 = BPSSetupBackgroundColor(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UIView setBackgroundColor:](self->_advancedGoalView, "setBackgroundColor:", v18);

  -[UIView setAccessibilityViewIsModal:](self->_advancedGoalView, "setAccessibilityViewIsModal:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  objc_msgSend(v19, "addSubview:", self->_advancedGoalView);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_advancedGoalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_advancedGoalView, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_advancedGoalView, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  objc_msgSend(v27, "setActive:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_advancedGoalView, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  objc_msgSend(v31, "setActive:", 1);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_advancedGoalView, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
  objc_msgSend(v35, "setActive:", 1);

  -[UIButton setNeedsUpdateConfiguration](self->_advancedButton, "setNeedsUpdateConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController view](self, "view"));
  objc_msgSend(v36, "setNeedsLayout");

}

- (void)setActivityLevels:(id)a3 activityMoveMode:(int64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_activityLevels, a3);
  self->_activityMoveMode = a4;
  if (-[NSArray count](self->_activityLevels, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    -[CHASActivitySetupViewController _setActivityLevel:activityMoveMode:](self, "_setActivityLevel:activityMoveMode:", v7, a4);

  }
}

- (id)_activityLevelView
{
  CHASActivitySetupLevelView *activityLevelView;
  CHASActivitySetupLevelView *v4;
  CHASActivitySetupLevelView *v5;
  CHASActivitySetupLevelView *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  activityLevelView = self->_activityLevelView;
  if (!activityLevelView)
  {
    v4 = -[CHASActivitySetupLevelView initWithFrame:]([CHASActivitySetupLevelView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_activityLevelView;
    self->_activityLevelView = v4;

    v6 = self->_activityLevelView;
    v8 = BPSSetupBackgroundColor(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CHASActivitySetupLevelView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupLevelView segmentedControl](self->_activityLevelView, "segmentedControl"));
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_activityLevelPresetChanged:", 4096);

    activityLevelView = self->_activityLevelView;
  }
  return activityLevelView;
}

- (void)_activityLevelPresetChanged:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupLevelView segmentedControl](self->_activityLevelView, "segmentedControl", a3));
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController activityLevelForSegmentedControlIndex:](self, "activityLevelForSegmentedControlIndex:", v5));
  -[CHASActivitySetupViewController _setActivityLevel:activityMoveMode:](self, "_setActivityLevel:activityMoveMode:", v6, self->_activityMoveMode);

}

- (id)activityLevelForSegmentedControlIndex:(int64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_activityLevels, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_activityLevels, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (void)_setActivityLevel:(id)a3 activityMoveMode:(int64_t)a4
{
  -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", a3, self->_moveGoalView);
}

- (id)currentMoveGoal
{
  return -[CHASActivitySetupGoalView dailyGoal](self->_moveGoalView, "dailyGoal");
}

- (id)currentExerciseGoal
{
  return -[CHASActivitySetupGoalView dailyGoal](self->_exerciseGoalView, "dailyGoal");
}

- (id)currentStandGoal
{
  return -[CHASActivitySetupGoalView dailyGoal](self->_standGoalView, "dailyGoal");
}

- (id)_moveGoalViewConfiguration
{
  CHASActivitySetupGoalViewConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int IsCalorieUnit;
  _OWORD v19[4];
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors energyColors](ARUIMetricColors, "energyColors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonGradientTextColor"));
  -[CHASActivitySetupGoalViewConfiguration setGoalColor:](v3, "setGoalColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _unitManager](self, "_unitManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userActiveEnergyBurnedUnit"));

  -[CHASActivitySetupGoalViewConfiguration setUnit:](v3, "setUnit:", v7);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006605C;
  v21[3] = &unk_100778290;
  v21[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalValueStringFormatter:](v3, "setGoalValueStringFormatter:", v21);
  if (self->_activityMoveMode == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit minuteUnit](HKUnit, "minuteUnit"));
    -[CHASActivitySetupGoalViewConfiguration setUnit:](v3, "setUnit:", v8);

    v9 = 10.0;
    v10 = 1000.0;
  }
  else
  {
    IsCalorieUnit = FIUIHKUnitIsCalorieUnit(v7);
    if (IsCalorieUnit)
      v9 = 10.0;
    else
      v9 = 20.0;
    if (IsCalorieUnit)
      v10 = 9999.0;
    else
      v10 = 39999.0;
  }
  -[CHASActivitySetupGoalViewConfiguration setMinimumValue:](v3, "setMinimumValue:", v9);
  -[CHASActivitySetupGoalViewConfiguration setMaximumValue:](v3, "setMaximumValue:", v10);
  -[CHASActivitySetupGoalViewConfiguration setValueIncrement:](v3, "setValueIncrement:", v9);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000660C8;
  v20[3] = &unk_100778290;
  v20[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalUnitStringFormatter:](v3, "setGoalUnitStringFormatter:", v20);
  __asm { FMOV            V0.2D, #13.0 }
  v19[0] = _Q0;
  v19[1] = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  v19[2] = _Q0;
  v19[3] = _Q0;
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", BPSScreenValueGetRelevantValue(v19));

  return v3;
}

- (id)_exerciseGoalViewConfiguration
{
  CHASActivitySetupGoalViewConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v14[4];
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonGradientTextColor"));
  -[CHASActivitySetupGoalViewConfiguration setGoalColor:](v3, "setGoalColor:", v5);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006632C;
  v16[3] = &unk_100778290;
  v16[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalValueStringFormatter:](v3, "setGoalValueStringFormatter:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit minuteUnit](HKUnit, "minuteUnit"));
  -[CHASActivitySetupGoalViewConfiguration setUnit:](v3, "setUnit:", v6);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100066384;
  v15[3] = &unk_100778290;
  v15[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalUnitStringFormatter:](v3, "setGoalUnitStringFormatter:", v15);
  __asm { FMOV            V0.2D, #13.0 }
  v14[0] = _Q0;
  v14[1] = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  v14[2] = _Q0;
  v14[3] = _Q0;
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", BPSScreenValueGetRelevantValue(v14));
  -[CHASActivitySetupGoalViewConfiguration setMinimumValue:](v3, "setMinimumValue:", 5.0);
  -[CHASActivitySetupGoalViewConfiguration setMaximumValue:](v3, "setMaximumValue:", 90.0);
  -[CHASActivitySetupGoalViewConfiguration setValueIncrement:](v3, "setValueIncrement:", 5.0);
  return v3;
}

- (id)_standGoalViewConfiguration
{
  CHASActivitySetupGoalViewConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v14[4];
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = objc_alloc_init(CHASActivitySetupGoalViewConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors sedentaryColors](ARUIMetricColors, "sedentaryColors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonGradientTextColor"));
  -[CHASActivitySetupGoalViewConfiguration setGoalColor:](v3, "setGoalColor:", v5);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000665D0;
  v16[3] = &unk_100778290;
  v16[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalValueStringFormatter:](v3, "setGoalValueStringFormatter:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKUnit countUnit](HKUnit, "countUnit"));
  -[CHASActivitySetupGoalViewConfiguration setUnit:](v3, "setUnit:", v6);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100066628;
  v15[3] = &unk_100778290;
  v15[4] = self;
  -[CHASActivitySetupGoalViewConfiguration setGoalUnitStringFormatter:](v3, "setGoalUnitStringFormatter:", v15);
  __asm { FMOV            V0.2D, #13.0 }
  v14[0] = _Q0;
  v14[1] = _Q0;
  __asm { FMOV            V0.2D, #30.0 }
  v14[2] = _Q0;
  v14[3] = _Q0;
  -[CHASActivitySetupGoalViewConfiguration setUnitTextYOffset:](v3, "setUnitTextYOffset:", BPSScreenValueGetRelevantValue(v14));
  -[CHASActivitySetupGoalViewConfiguration setMinimumValue:](v3, "setMinimumValue:", 6.0);
  -[CHASActivitySetupGoalViewConfiguration setMaximumValue:](v3, "setMaximumValue:", 16.0);
  -[CHASActivitySetupGoalViewConfiguration setValueIncrement:](v3, "setValueIncrement:", 1.0);
  return v3;
}

- (void)_loadExerciseAndStandGoalViews
{
  double y;
  double width;
  double height;
  CHASActivitySetupGoalView *v6;
  CHASActivitySetupGoalView *exerciseGoalView;
  void *v8;
  CHASActivitySetupGoalView *v9;
  CHASActivitySetupGoalView *standGoalView;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _exerciseGoalViewConfiguration](self, "_exerciseGoalViewConfiguration"));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v6 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v11, CGRectZero.origin.x, y, width, height));
  exerciseGoalView = self->_exerciseGoalView;
  self->_exerciseGoalView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _standGoalViewConfiguration](self, "_standGoalViewConfiguration"));
  v9 = (CHASActivitySetupGoalView *)objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _createGoalViewWithFrame:configuration:](self, "_createGoalViewWithFrame:configuration:", v8, CGRectZero.origin.x, y, width, height));
  standGoalView = self->_standGoalView;
  self->_standGoalView = v9;

}

- (void)_setGoalQuantityForGoalView:(id)a3
{
  CHASActivitySetupGoalView *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CHASActivitySetupGoalView *v8;

  v4 = (CHASActivitySetupGoalView *)a3;
  v8 = v4;
  if (self->_moveGoalView == v4)
  {
    if (!self->_hasMoveGoalSchedule || self->_editTodayOnly)
    {
      v5 = 136;
      goto LABEL_12;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _moveQuantityForToday](self, "_moveQuantityForToday"));
LABEL_16:
    v7 = (void *)v6;
    -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", v6, v8);

    goto LABEL_17;
  }
  if (self->_exerciseGoalView == v4)
  {
    if (!self->_hasExerciseGoalSchedule || self->_editTodayOnly)
    {
      v5 = 144;
      goto LABEL_12;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _exerciseQuantityForToday](self, "_exerciseQuantityForToday"));
    goto LABEL_16;
  }
  if (self->_hasStandGoalSchedule && !self->_editTodayOnly)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[CHASActivitySetupViewController _standQuantityForToday](self, "_standQuantityForToday"));
    goto LABEL_16;
  }
  v5 = 152;
LABEL_12:
  -[CHASActivitySetupViewController _setGoalQuantity:goalView:](self, "_setGoalQuantity:goalView:", *(_QWORD *)&self->OBTableWelcomeController_opaque[v5], v4);
LABEL_17:

}

- (void)_setGoalQuantity:(id)a3 goalView:(id)a4
{
  if (a3)
    _objc_msgSend(a4, "setGoal:");
}

- (id)_moveQuantityForToday
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray hk_filter:](self->_goalSchedules, "hk_filter:", &stru_1007782D0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "goalQuantityForToday"));
  else
    v4 = 0;

  return v4;
}

- (id)_exerciseQuantityForToday
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray hk_filter:](self->_goalSchedules, "hk_filter:", &stru_1007782F0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "goalQuantityForToday"));
  else
    v4 = 0;

  return v4;
}

- (id)_standQuantityForToday
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray hk_filter:](self->_goalSchedules, "hk_filter:", &stru_100778310));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "goalQuantityForToday"));
  else
    v4 = 0;

  return v4;
}

- (void)_fetchMostRecentMoveGoalSampleWithCompletion:(id)a3
{
  int64_t activityMoveMode;
  id v5;
  uint64_t v6;
  id v7;

  activityMoveMode = self->_activityMoveMode;
  v5 = a3;
  if (activityMoveMode == 2)
    v6 = objc_claimAutoreleasedReturnValue(+[HKObjectType moveMinuteGoal](HKObjectType, "moveMinuteGoal"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[HKObjectType calorieGoal](HKObjectType, "calorieGoal"));
  v7 = (id)v6;
  -[CHASActivitySetupViewController _fetchMostRecentSampleForQuantityType:completion:](self, "_fetchMostRecentSampleForQuantityType:completion:", v6, v5);

}

- (void)_fetchMostRecentExerciseGoalSampleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[HKObjectType exerciseGoal](HKObjectType, "exerciseGoal"));
  -[CHASActivitySetupViewController _fetchMostRecentSampleForQuantityType:completion:](self, "_fetchMostRecentSampleForQuantityType:completion:", v5, v4);

}

- (void)_fetchMostRecentStandGoalSampleWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[HKObjectType standGoal](HKObjectType, "standGoal"));
  -[CHASActivitySetupViewController _fetchMostRecentSampleForQuantityType:completion:](self, "_fetchMostRecentSampleForQuantityType:completion:", v5, v4);

}

- (void)_fetchMostRecentSampleForQuantityType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", HKSampleSortIdentifierStartDate, 0));
    v11 = objc_alloc((Class)HKSampleQuery);
    v17 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100066E04;
    v14[3] = &unk_100778338;
    v15 = v6;
    v16 = v7;
    v13 = objc_msgSend(v11, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v15, v9, 1, v12, v14);

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v13);
  }

}

- (void)_fetchMostRecentGoalSchedulesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", HKSampleSortIdentifierStartDate, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKObjectType activityGoalScheduleType](HKObjectType, "activityGoalScheduleType"));
    v7 = objc_alloc((Class)HKSampleQuery);
    v17 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100067024;
    v14 = &unk_100778338;
    v15 = v6;
    v16 = v4;
    v9 = v6;
    v10 = objc_msgSend(v7, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, 0, 0, v8, &v11);

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v10, v11, v12, v13, v14);
  }

}

- (void)_setGoalSchedules:(id)a3
{
  id v5;
  _QWORD v6[5];

  objc_storeStrong((id *)&self->_goalSchedules, a3);
  v5 = a3;
  self->_hasMoveGoalSchedule = 0;
  self->_hasExerciseGoalSchedule = 0;
  self->_hasStandGoalSchedule = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100067150;
  v6[3] = &unk_100778360;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)_updateGoalSchedule
{
  void *v3;
  void *v4;
  NSArray *goalSchedules;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  void **v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GoalDaysModel goalDays](self->_goalDaysModel, "goalDays"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[HKActivityGoalSchedule scheduleFrom:goalType:](HKActivityGoalSchedule, "scheduleFrom:goalType:", v3, -[GoalDaysModel goalType](self->_goalDaysModel, "goalType")));

  v4 = v9;
  if (!v9)
    goto LABEL_9;
  goalSchedules = self->_goalSchedules;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100067300;
  v14 = &unk_100778200;
  v6 = v9;
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray hk_firstObjectPassingTest:](goalSchedules, "hk_firstObjectPassingTest:", &v11));
  if (!v7)
    goto LABEL_5;
  if (!-[CHASActivitySetupViewController _isGoalSchedule:theSameAs:](self, "_isGoalSchedule:theSameAs:", v7, v6))
  {
    -[HKHealthStore deleteObject:withCompletion:](self->_healthStore, "deleteObject:withCompletion:", v7, &stru_100778380);
LABEL_5:
    -[HKHealthStore saveObject:withCompletion:](self->_healthStore, "saveObject:withCompletion:", v6, &stru_1007783A0, v9, v11, v12, v13, v14);
  }
  v8 = (unint64_t)objc_msgSend(v6, "goalType", v9);
  if (v8 <= 3)
    self->OBTableWelcomeController_opaque[*off_1007783D8[v8]] = 1;
  -[CHASActivitySetupViewController tappedContinue:](self, "tappedContinue:", 0);

  v4 = v10;
LABEL_9:

}

- (BOOL)_isGoalSchedule:(id)a3 theSameAs:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  BOOL v52;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "goalType");
  if (v7 != objc_msgSend(v6, "goalType"))
    goto LABEL_37;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mondayGoal"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mondayGoal"));
  if (v8 == (void *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mondayGoal"));
    if (!v11)
      goto LABEL_36;
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mondayGoal"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mondayGoal"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_37;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tuesdayGoal"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tuesdayGoal"));
  if (v8 == (void *)v16)
  {

  }
  else
  {
    v10 = (void *)v16;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tuesdayGoal"));
    if (!v17)
      goto LABEL_36;
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tuesdayGoal"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tuesdayGoal"));
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wednesdayGoal"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wednesdayGoal"));
  if (v8 == (void *)v22)
  {

  }
  else
  {
    v10 = (void *)v22;
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wednesdayGoal"));
    if (!v23)
      goto LABEL_36;
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wednesdayGoal"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wednesdayGoal"));
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_37;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thursdayGoal"));
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thursdayGoal"));
  if (v8 == (void *)v28)
  {

  }
  else
  {
    v10 = (void *)v28;
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thursdayGoal"));
    if (!v29)
      goto LABEL_36;
    v30 = (void *)v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thursdayGoal"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thursdayGoal"));
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_37;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fridayGoal"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fridayGoal"));
  if (v8 == (void *)v34)
  {

  }
  else
  {
    v10 = (void *)v34;
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fridayGoal"));
    if (!v35)
      goto LABEL_36;
    v36 = (void *)v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fridayGoal"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fridayGoal"));
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (!v39)
      goto LABEL_37;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "saturdayGoal"));
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "saturdayGoal"));
  if (v8 == (void *)v40)
  {

    goto LABEL_32;
  }
  v10 = (void *)v40;
  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "saturdayGoal"));
  if (!v41)
  {
LABEL_36:

    goto LABEL_37;
  }
  v42 = (void *)v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "saturdayGoal"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "saturdayGoal"));
  v45 = objc_msgSend(v43, "isEqual:", v44);

  if (!v45)
    goto LABEL_37;
LABEL_32:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sundayGoal"));
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sundayGoal"));
  if (v8 == (void *)v46)
  {

LABEL_40:
    v52 = 1;
    goto LABEL_38;
  }
  v10 = (void *)v46;
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sundayGoal"));
  if (!v47)
    goto LABEL_36;
  v48 = (void *)v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sundayGoal"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sundayGoal"));
  v51 = objc_msgSend(v49, "isEqual:", v50);

  if ((v51 & 1) != 0)
    goto LABEL_40;
LABEL_37:
  v52 = 0;
LABEL_38:

  return v52;
}

- (id)tapToRadarMetadata
{
  return objc_msgSend(objc_alloc((Class)BPSTTRMetadata), "initWithComponent:", 2);
}

- (BPSBuddyControllerDelegate)delegate
{
  return (BPSBuddyControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationContext
{
  return self->_presentationContext;
}

- (NSNumber)recommendedMoveGoal
{
  return self->_recommendedMoveGoal;
}

- (void)setRecommendedMoveGoal:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedMoveGoal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedMoveGoal, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_newDailyStandGoal, 0);
  objc_storeStrong((id *)&self->_newDailyExerciseGoal, 0);
  objc_storeStrong((id *)&self->_pageDetailTexts, 0);
  objc_storeStrong((id *)&self->_pageTitles, 0);
  objc_storeStrong((id *)&self->_goalDaysModel, 0);
  objc_storeStrong((id *)&self->_goalSchedules, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_advancedGoalView, 0);
  objc_storeStrong((id *)&self->_advancedButton, 0);
  objc_storeStrong((id *)&self->_defaultStandGoalQuantity, 0);
  objc_storeStrong((id *)&self->_defaultExerciseGoalQuantity, 0);
  objc_storeStrong((id *)&self->_defaultMoveGoalQuantity, 0);
  objc_storeStrong((id *)&self->_standGoalView, 0);
  objc_storeStrong((id *)&self->_exerciseGoalView, 0);
  objc_storeStrong((id *)&self->_moveGoalView, 0);
  objc_storeStrong((id *)&self->_currentlyPresentedView, 0);
  objc_storeStrong((id *)&self->_activityLevelView, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_newDailyMoveGoal, 0);
  objc_storeStrong((id *)&self->_activityLevels, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
