@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView

- (PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView)initWithDistancingContext:(id)a3
{
  PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *v5;
  PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *v6;
  id v7;
  UITextField *v8;
  UITextField *timePivotTextField;
  void *v10;
  double v11;
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
  UITextField *v22;
  UITextField *locationPivotTextField;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  UITextField *v35;
  UITextField *peoplePivotTextField;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  UITextField *v48;
  UITextField *sceneprintPivotTextField;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  UITextField *v60;
  UITextField *timeFactorTextField;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  UITextField *v74;
  UITextField *locationFactorTextField;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  UITextField *v88;
  UITextField *peopleFactorTextField;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  UITextField *v101;
  UITextField *sceneprintFactorTextField;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  UITextField *v114;
  UITextField *maximumNumberOfSuggestionsWithPeopleTextField;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  UITextField *v126;
  UITextField *maximumNumberOfSuggestionsWithoutPeopleTextField;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
  objc_super v147;

  v146 = a3;
  v147.receiver = self;
  v147.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView;
  v5 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView init](&v147, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_distancingContext, a3);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v7, "setText:", CFSTR("Time Pivot (days):"));
    objc_msgSend(v7, "sizeToFit");
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v7);
    v8 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    timePivotTextField = v6->_timePivotTextField;
    v6->_timePivotTextField = v8;

    v10 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext timePivot](v6->_distancingContext, "timePivot");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%.2f"), v11 / 86400.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_timePivotTextField, "setText:", v12);

    -[UITextField sizeToFit](v6->_timePivotTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_timePivotTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_timePivotTextField, "addTarget:action:forControlEvents:", v6, sel_setTimePivot_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_timePivotTextField);
    -[UITextField centerYAnchor](v6->_timePivotTextField, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v145 = v7;
    objc_msgSend(v7, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("timePivotLabel, _timePivotTextField"), v14, v6->_timePivotTextField, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[timePivotLabel]-10-[_timePivotTextField]->=0-|"), 0, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v19);

    v20 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v21 = (void *)objc_msgSend(v20, "initWithFrame:");
    objc_msgSend(v21, "setText:", CFSTR("Location Pivot (m):"));
    objc_msgSend(v21, "sizeToFit");
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v144 = v21;
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v21);
    v22 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    locationPivotTextField = v6->_locationPivotTextField;
    v6->_locationPivotTextField = v22;

    v24 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext locationPivot](v6->_distancingContext, "locationPivot");
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%.2f"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_locationPivotTextField, "setText:", v26);

    -[UITextField sizeToFit](v6->_locationPivotTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_locationPivotTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_locationPivotTextField, "addTarget:action:forControlEvents:", v6, sel_setLocationPivot_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_locationPivotTextField);
    -[UITextField centerYAnchor](v6->_locationPivotTextField, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    v30 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("locationPivotLabel, _locationPivotTextField"), v21, v6->_locationPivotTextField, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[locationPivotLabel]-10-[_locationPivotTextField]->=0-|"), 0, 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v32);

    v33 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v34 = (void *)objc_msgSend(v33, "initWithFrame:");
    objc_msgSend(v34, "setText:", CFSTR("People Pivot:"));
    objc_msgSend(v34, "sizeToFit");
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v143 = v34;
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v34);
    v35 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    peoplePivotTextField = v6->_peoplePivotTextField;
    v6->_peoplePivotTextField = v35;

    v37 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext peoplePivot](v6->_distancingContext, "peoplePivot");
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%.2f"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_peoplePivotTextField, "setText:", v39);

    -[UITextField sizeToFit](v6->_peoplePivotTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_peoplePivotTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_peoplePivotTextField, "addTarget:action:forControlEvents:", v6, sel_setPeoplePivot_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_peoplePivotTextField);
    -[UITextField lastBaselineAnchor](v6->_peoplePivotTextField, "lastBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    v43 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("peoplePivotLabel, _peoplePivotTextField"), v34, v6->_peoplePivotTextField, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[peoplePivotLabel]-10-[_peoplePivotTextField]->=0-|"), 0, 0, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v45);

    v46 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v47 = (void *)objc_msgSend(v46, "initWithFrame:");
    objc_msgSend(v47, "setText:", CFSTR("Sceneprint Pivot:"));
    objc_msgSend(v47, "sizeToFit");
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v142 = v47;
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v47);
    v48 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    sceneprintPivotTextField = v6->_sceneprintPivotTextField;
    v6->_sceneprintPivotTextField = v48;

    v50 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext sceneprintPivot](v6->_distancingContext, "sceneprintPivot");
    objc_msgSend(v50, "stringWithFormat:", CFSTR("%.2f"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_sceneprintPivotTextField, "setText:", v52);

    -[UITextField sizeToFit](v6->_sceneprintPivotTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_sceneprintPivotTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_sceneprintPivotTextField, "addTarget:action:forControlEvents:", v6, sel_setSceneprintPivot_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_sceneprintPivotTextField);
    -[UITextField lastBaselineAnchor](v6->_sceneprintPivotTextField, "lastBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "lastBaselineAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    v56 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("sceneprintPivotLabel, _sceneprintPivotTextField"), v47, v6->_sceneprintPivotTextField, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[sceneprintPivotLabel]-10-[_sceneprintPivotTextField]->=0-|"), 0, 0, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v58);

    v59 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v59, "setText:", CFSTR("Time Factor:"));
    objc_msgSend(v59, "sizeToFit");
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v59);
    v60 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    timeFactorTextField = v6->_timeFactorTextField;
    v6->_timeFactorTextField = v60;

    v62 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext timeFactor](v6->_distancingContext, "timeFactor");
    objc_msgSend(v62, "stringWithFormat:", CFSTR("%.2f"), v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_timeFactorTextField, "setText:", v64);

    -[UITextField sizeToFit](v6->_timeFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_timeFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_timeFactorTextField, "addTarget:action:forControlEvents:", v6, sel_setTimeFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_timeFactorTextField);
    -[UITextField centerYAnchor](v6->_timeFactorTextField, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v59;
    v141 = v59;
    objc_msgSend(v59, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, 0.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", 1);

    v69 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("timeFactorLabel, _timeFactorTextField"), v66, v6->_timeFactorTextField, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[timeFactorLabel]-10-[_timeFactorTextField]->=0-|"), 0, 0, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v71);

    v72 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v73 = (void *)objc_msgSend(v72, "initWithFrame:");
    objc_msgSend(v73, "setText:", CFSTR("Location Factor:"));
    objc_msgSend(v73, "sizeToFit");
    objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v73);
    v74 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    locationFactorTextField = v6->_locationFactorTextField;
    v6->_locationFactorTextField = v74;

    v76 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext locationFactor](v6->_distancingContext, "locationFactor");
    objc_msgSend(v76, "stringWithFormat:", CFSTR("%.2f"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_locationFactorTextField, "setText:", v78);

    -[UITextField sizeToFit](v6->_locationFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_locationFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_locationFactorTextField, "addTarget:action:forControlEvents:", v6, sel_setLocationFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_locationFactorTextField);
    -[UITextField centerYAnchor](v6->_locationFactorTextField, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v73;
    v140 = v73;
    objc_msgSend(v73, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v81, 0.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setActive:", 1);

    v83 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("locationFactorLabel, _locationFactorTextField"), v80, v6->_locationFactorTextField, 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[locationFactorLabel]-10-[_locationFactorTextField]->=0-|"), 0, 0, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v85);

    v86 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v87 = (void *)objc_msgSend(v86, "initWithFrame:");
    objc_msgSend(v87, "setText:", CFSTR("People Factor:"));
    objc_msgSend(v87, "sizeToFit");
    objc_msgSend(v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v87);
    v88 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    peopleFactorTextField = v6->_peopleFactorTextField;
    v6->_peopleFactorTextField = v88;

    v90 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext peopleFactor](v6->_distancingContext, "peopleFactor");
    objc_msgSend(v90, "stringWithFormat:", CFSTR("%.2f"), v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_peopleFactorTextField, "setText:", v92);

    -[UITextField sizeToFit](v6->_peopleFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_peopleFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_peopleFactorTextField, "addTarget:action:forControlEvents:", v6, sel_setPeopleFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_peopleFactorTextField);
    -[UITextField lastBaselineAnchor](v6->_peopleFactorTextField, "lastBaselineAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "lastBaselineAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, 0.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    v96 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("peopleFactorLabel, _peopleFactorTextField"), v87, v6->_peopleFactorTextField, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[peopleFactorLabel]-10-[_peopleFactorTextField]->=0-|"), 0, 0, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v98);

    v99 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v100 = (void *)objc_msgSend(v99, "initWithFrame:");
    objc_msgSend(v100, "setText:", CFSTR("Sceneprint Factor:"));
    objc_msgSend(v100, "sizeToFit");
    objc_msgSend(v100, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v139 = v100;
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v100);
    v101 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    sceneprintFactorTextField = v6->_sceneprintFactorTextField;
    v6->_sceneprintFactorTextField = v101;

    v103 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsDistancingContext sceneprintFactor](v6->_distancingContext, "sceneprintFactor");
    objc_msgSend(v103, "stringWithFormat:", CFSTR("%.2f"), v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_sceneprintFactorTextField, "setText:", v105);

    -[UITextField sizeToFit](v6->_sceneprintFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_sceneprintFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_sceneprintFactorTextField, "addTarget:action:forControlEvents:", v6, sel_setSceneprintFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_sceneprintFactorTextField);
    -[UITextField lastBaselineAnchor](v6->_sceneprintFactorTextField, "lastBaselineAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "lastBaselineAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, 0.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setActive:", 1);

    v109 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("sceneprintFactorLabel, _sceneprintFactorTextField"), v100, v6->_sceneprintFactorTextField, 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[sceneprintFactorLabel]-10-[_sceneprintFactorTextField]->=0-|"), 0, 0, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v111);

    v112 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v113 = (void *)objc_msgSend(v112, "initWithFrame:");
    objc_msgSend(v113, "setText:", CFSTR("Maximum Number of Suggestions With People:"));
    objc_msgSend(v113, "sizeToFit");
    objc_msgSend(v113, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v113);
    v114 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    maximumNumberOfSuggestionsWithPeopleTextField = v6->_maximumNumberOfSuggestionsWithPeopleTextField;
    v6->_maximumNumberOfSuggestionsWithPeopleTextField = v114;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[PUTopPeopleWallpaperSuggestionsDistancingContext maximumNumberOfSuggestionsWithPeople](v6->_distancingContext, "maximumNumberOfSuggestionsWithPeople"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_maximumNumberOfSuggestionsWithPeopleTextField, "setText:", v116);

    -[UITextField sizeToFit](v6->_maximumNumberOfSuggestionsWithPeopleTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_maximumNumberOfSuggestionsWithPeopleTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_maximumNumberOfSuggestionsWithPeopleTextField, "addTarget:action:forControlEvents:", v6, sel_setMaximumNumberOfSuggestionsWithPeople_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_maximumNumberOfSuggestionsWithPeopleTextField);
    -[UITextField lastBaselineAnchor](v6->_maximumNumberOfSuggestionsWithPeopleTextField, "lastBaselineAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v113;
    objc_msgSend(v113, "lastBaselineAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:constant:", v119, 0.0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setActive:", 1);

    v121 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("maximumNumberOfSuggestionsWithPeopleLabel, _maximumNumberOfSuggestionsWithPeopleTextField"), v118, v6->_maximumNumberOfSuggestionsWithPeopleTextField, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[maximumNumberOfSuggestionsWithPeopleLabel]-10-[_maximumNumberOfSuggestionsWithPeopleTextField]->=0-|"), 0, 0, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v123);

    v124 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView bounds](v6, "bounds");
    v125 = (void *)objc_msgSend(v124, "initWithFrame:");
    objc_msgSend(v125, "setText:", CFSTR("Maximum Number of Suggestions Without People:"));
    objc_msgSend(v125, "sizeToFit");
    objc_msgSend(v125, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v125);
    v126 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    maximumNumberOfSuggestionsWithoutPeopleTextField = v6->_maximumNumberOfSuggestionsWithoutPeopleTextField;
    v6->_maximumNumberOfSuggestionsWithoutPeopleTextField = v126;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[PUTopPeopleWallpaperSuggestionsDistancingContext maximumNumberOfSuggestionsWithoutPeople](v6->_distancingContext, "maximumNumberOfSuggestionsWithoutPeople"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, "setText:", v128);

    -[UITextField sizeToFit](v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, "addTarget:action:forControlEvents:", v6, sel_setMaximumNumberOfSuggestionsWithoutPeople_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addSubview:](v6, "addSubview:", v6->_maximumNumberOfSuggestionsWithoutPeopleTextField);
    -[UITextField lastBaselineAnchor](v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, "lastBaselineAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "lastBaselineAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:constant:", v130, 0.0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setActive:", 1);

    v132 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("maximumNumberOfSuggestionsWithoutPeopleLabel, _maximumNumberOfSuggestionsWithoutPeopleTextField"), v125, v6->_maximumNumberOfSuggestionsWithoutPeopleTextField, 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[maximumNumberOfSuggestionsWithoutPeopleLabel]-10-[_maximumNumberOfSuggestionsWithoutPeopleTextField]->=0-|"), 0, 0, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v134);

    v135 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("timePivotLabel, locationPivotLabel, peoplePivotLabel, sceneprintPivotLabel, timeFactorLabel, locationFactorLabel, peopleFactorLabel, sceneprintFactorLabel, maximumNumberOfSuggestionsWithPeopleLabel, maximumNumberOfSuggestionsWithoutPeopleLabel"), v145, v144, v143, v142, v141, v140, v87, v139, v118, v125, 0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-16-[timePivotLabel(<=44)]-10-[locationPivotLabel(<=44)]-10-[peoplePivotLabel(<=44)]-10-[sceneprintPivotLabel(<=44)]-10-[timeFactorLabel(<=44)]-10-[locationFactorLabel(<=44)]-10-[peopleFactorLabel(<=44)]-10-[sceneprintFactorLabel(<=44)]-10-[maximumNumberOfSuggestionsWithPeopleLabel(<=44)]-10-[maximumNumberOfSuggestionsWithoutPeopleLabel(<=44)]->=0-|"), 0, 0, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView addConstraints:](v6, "addConstraints:", v137);

  }
  return v6;
}

- (void)setTimePivot:(id)a3
{
  double v4;
  id v5;

  objc_msgSend(a3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setTimePivot:](self->_distancingContext, "setTimePivot:", v4 * 86400.0);

}

- (void)setLocationPivot:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setLocationPivot:](self->_distancingContext, "setLocationPivot:");

}

- (void)setPeoplePivot:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setPeoplePivot:](self->_distancingContext, "setPeoplePivot:");

}

- (void)setSceneprintPivot:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setSceneprintPivot:](self->_distancingContext, "setSceneprintPivot:");

}

- (void)setTimeFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setTimeFactor:](self->_distancingContext, "setTimeFactor:");

}

- (void)setLocationFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setLocationFactor:](self->_distancingContext, "setLocationFactor:");

}

- (void)setPeopleFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setPeopleFactor:](self->_distancingContext, "setPeopleFactor:");

}

- (void)setSceneprintFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setSceneprintFactor:](self->_distancingContext, "setSceneprintFactor:");

}

- (void)setMaximumNumberOfSuggestionsWithPeople:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setMaximumNumberOfSuggestionsWithPeople:](self->_distancingContext, "setMaximumNumberOfSuggestionsWithPeople:", objc_msgSend(v4, "integerValue"));

}

- (void)setMaximumNumberOfSuggestionsWithoutPeople:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDistancingContext setMaximumNumberOfSuggestionsWithoutPeople:](self->_distancingContext, "setMaximumNumberOfSuggestionsWithoutPeople:", objc_msgSend(v4, "integerValue"));

}

- (UITextField)timePivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 424, 1);
}

- (UITextField)locationPivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 432, 1);
}

- (UITextField)peoplePivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 440, 1);
}

- (UITextField)sceneprintPivotTextField
{
  return (UITextField *)objc_getProperty(self, a2, 448, 1);
}

- (UITextField)timeFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 456, 1);
}

- (UITextField)locationFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 464, 1);
}

- (UITextField)peopleFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 472, 1);
}

- (UITextField)sceneprintFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 480, 1);
}

- (UITextField)maximumNumberOfSuggestionsWithPeopleTextField
{
  return (UITextField *)objc_getProperty(self, a2, 488, 1);
}

- (UITextField)maximumNumberOfSuggestionsWithoutPeopleTextField
{
  return (UITextField *)objc_getProperty(self, a2, 496, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumNumberOfSuggestionsWithoutPeopleTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfSuggestionsWithPeopleTextField, 0);
  objc_storeStrong((id *)&self->_sceneprintFactorTextField, 0);
  objc_storeStrong((id *)&self->_peopleFactorTextField, 0);
  objc_storeStrong((id *)&self->_locationFactorTextField, 0);
  objc_storeStrong((id *)&self->_timeFactorTextField, 0);
  objc_storeStrong((id *)&self->_sceneprintPivotTextField, 0);
  objc_storeStrong((id *)&self->_peoplePivotTextField, 0);
  objc_storeStrong((id *)&self->_locationPivotTextField, 0);
  objc_storeStrong((id *)&self->_timePivotTextField, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
}

@end
