@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView

- (PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView)initWithScoringContext:(id)a3
{
  id v5;
  PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *v6;
  PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *v7;
  id v8;
  UITextField *v9;
  UITextField *favoriteFactorTextField;
  void *v11;
  uint64_t v12;
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
  UITextField *aestheticFactorTextField;
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
  UITextField *peopleFactorTextField;
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
  UITextField *interactionFactorTextField;
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
  UITextField *meaningFactorTextField;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  UITextField *v72;
  UITextField *atHomeOrWorkFactorTextField;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  UITextField *v85;
  UITextField *maximumFaceSizeTextField;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id firstValue;
  id v101;
  objc_super v102;

  v5 = a3;
  v102.receiver = self;
  v102.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView;
  v6 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView init](&v102, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scoringContext, a3);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v8, "setText:", CFSTR("Favorite Factor:"));
    objc_msgSend(v8, "sizeToFit");
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v8);
    v9 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    v101 = v5;
    favoriteFactorTextField = v7->_favoriteFactorTextField;
    v7->_favoriteFactorTextField = v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext favoriteFactor](v7->_scoringContext, "favoriteFactor");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%.2f"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_favoriteFactorTextField, "setText:", v13);

    -[UITextField sizeToFit](v7->_favoriteFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_favoriteFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_favoriteFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setFavoriteFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_favoriteFactorTextField);
    -[UITextField centerYAnchor](v7->_favoriteFactorTextField, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    firstValue = v8;
    objc_msgSend(v8, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("favoriteFactorLabel, _favoriteFactorTextField"), v8, v7->_favoriteFactorTextField, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[favoriteFactorLabel]-10-[_favoriteFactorTextField]->=0-|"), 0, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v19);

    v20 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView bounds](v7, "bounds");
    v21 = (void *)objc_msgSend(v20, "initWithFrame:");
    objc_msgSend(v21, "setText:", CFSTR("Aesthetic Factor:"));
    objc_msgSend(v21, "sizeToFit");
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v21);
    v22 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    aestheticFactorTextField = v7->_aestheticFactorTextField;
    v7->_aestheticFactorTextField = v22;

    v24 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext aestheticFactor](v7->_scoringContext, "aestheticFactor");
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%.2f"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_aestheticFactorTextField, "setText:", v26);

    -[UITextField sizeToFit](v7->_aestheticFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_aestheticFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_aestheticFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setAestheticFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_aestheticFactorTextField);
    -[UITextField centerYAnchor](v7->_aestheticFactorTextField, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    v30 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("aestheticFactorLabel, _aestheticFactorTextField"), v21, v7->_aestheticFactorTextField, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[aestheticFactorLabel]-10-[_aestheticFactorTextField]->=0-|"), 0, 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v32);

    v33 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView bounds](v7, "bounds");
    v34 = (void *)objc_msgSend(v33, "initWithFrame:");
    objc_msgSend(v34, "setText:", CFSTR("People Factor:"));
    objc_msgSend(v34, "sizeToFit");
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v34);
    v35 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    peopleFactorTextField = v7->_peopleFactorTextField;
    v7->_peopleFactorTextField = v35;

    v37 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext peopleFactor](v7->_scoringContext, "peopleFactor");
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%.2f"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_peopleFactorTextField, "setText:", v39);

    -[UITextField sizeToFit](v7->_peopleFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_peopleFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_peopleFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setPeopleFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_peopleFactorTextField);
    -[UITextField lastBaselineAnchor](v7->_peopleFactorTextField, "lastBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    v43 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("peopleFactorLabel, _peopleFactorTextField"), v34, v7->_peopleFactorTextField, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[peopleFactorLabel]-10-[_peopleFactorTextField]->=0-|"), 0, 0, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v45);

    v46 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView bounds](v7, "bounds");
    v47 = (void *)objc_msgSend(v46, "initWithFrame:");
    objc_msgSend(v47, "setText:", CFSTR("Interaction Factor:"));
    objc_msgSend(v47, "sizeToFit");
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v47);
    v48 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    interactionFactorTextField = v7->_interactionFactorTextField;
    v7->_interactionFactorTextField = v48;

    v50 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext interactionFactor](v7->_scoringContext, "interactionFactor");
    objc_msgSend(v50, "stringWithFormat:", CFSTR("%.2f"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_interactionFactorTextField, "setText:", v52);

    -[UITextField sizeToFit](v7->_interactionFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_interactionFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_interactionFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setInteractionFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_interactionFactorTextField);
    -[UITextField lastBaselineAnchor](v7->_interactionFactorTextField, "lastBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "lastBaselineAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    v56 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("interactionFactorLabel, _interactionFactorTextField"), v47, v7->_interactionFactorTextField, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[interactionFactorLabel]-10-[_interactionFactorTextField]->=0-|"), 0, 0, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v58);

    v59 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v59, "setText:", CFSTR("Meaning Factor:"));
    objc_msgSend(v59, "sizeToFit");
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v59);
    v60 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    meaningFactorTextField = v7->_meaningFactorTextField;
    v7->_meaningFactorTextField = v60;

    v62 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext meaningFactor](v7->_scoringContext, "meaningFactor");
    objc_msgSend(v62, "stringWithFormat:", CFSTR("%.2f"), v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_meaningFactorTextField, "setText:", v64);

    -[UITextField sizeToFit](v7->_meaningFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_meaningFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_meaningFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setMeaningFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_meaningFactorTextField);
    -[UITextField centerYAnchor](v7->_meaningFactorTextField, "centerYAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 0.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

    v68 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("meaningFactorLabel, _meaningFactorTextField"), v59, v7->_meaningFactorTextField, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[meaningFactorLabel]-10-[_meaningFactorTextField]->=0-|"), 0, 0, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v70);

    v71 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v71, "setText:", CFSTR("At Home or Work Factor:"));
    objc_msgSend(v71, "sizeToFit");
    objc_msgSend(v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v71);
    v72 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    atHomeOrWorkFactorTextField = v7->_atHomeOrWorkFactorTextField;
    v7->_atHomeOrWorkFactorTextField = v72;

    v74 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext atHomeOrWorkFactor](v7->_scoringContext, "atHomeOrWorkFactor");
    objc_msgSend(v74, "stringWithFormat:", CFSTR("%.2f"), v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_atHomeOrWorkFactorTextField, "setText:", v76);

    -[UITextField sizeToFit](v7->_atHomeOrWorkFactorTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_atHomeOrWorkFactorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_atHomeOrWorkFactorTextField, "addTarget:action:forControlEvents:", v7, sel_setAtHomeOrWorkFactor_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_atHomeOrWorkFactorTextField);
    -[UITextField centerYAnchor](v7->_atHomeOrWorkFactorTextField, "centerYAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, 0.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setActive:", 1);

    v80 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("atHomeOrWorkFactorLabel, _atHomeOrWorkFactorTextField"), v71, v7->_atHomeOrWorkFactorTextField, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[atHomeOrWorkFactorLabel]-10-[_atHomeOrWorkFactorTextField]->=0-|"), 0, 0, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v82);

    v83 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView bounds](v7, "bounds");
    v84 = (void *)objc_msgSend(v83, "initWithFrame:");
    objc_msgSend(v84, "setText:", CFSTR("Maximum Face Size:"));
    objc_msgSend(v84, "sizeToFit");
    objc_msgSend(v84, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v84);
    v85 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    maximumFaceSizeTextField = v7->_maximumFaceSizeTextField;
    v7->_maximumFaceSizeTextField = v85;

    v87 = (void *)MEMORY[0x1E0CB3940];
    -[PUTopPeopleWallpaperSuggestionsScoringContext maximumSizeAllowedForFaces](v7->_scoringContext, "maximumSizeAllowedForFaces");
    objc_msgSend(v87, "stringWithFormat:", CFSTR("%.2f"), v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7->_maximumFaceSizeTextField, "setText:", v89);

    -[UITextField sizeToFit](v7->_maximumFaceSizeTextField, "sizeToFit");
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v7->_maximumFaceSizeTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField addTarget:action:forControlEvents:](v7->_maximumFaceSizeTextField, "addTarget:action:forControlEvents:", v7, sel_setMaximumFaceSize_, 0x40000);
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addSubview:](v7, "addSubview:", v7->_maximumFaceSizeTextField);
    -[UITextField lastBaselineAnchor](v7->_maximumFaceSizeTextField, "lastBaselineAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "lastBaselineAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, 0.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setActive:", 1);

    v93 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("maximumFaceSizeLabel, _maximumFaceSizeTextField"), v84, v7->_maximumFaceSizeTextField, 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[maximumFaceSizeLabel]-10-[_maximumFaceSizeTextField]->=0-|"), 0, 0, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v95);

    v96 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("favoriteFactorLabel, aestheticFactorLabel, peopleFactorLabel, interactionFactorLabel, meaningFactorLabel, atHomeOrWorkFactorLabel, maximumFaceSizeLabel"), firstValue, v21, v34, v47, v59, v71, v84, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-16-[favoriteFactorLabel(<=44)]-10-[aestheticFactorLabel(<=44)]-10-[peopleFactorLabel(<=44)]-10-[interactionFactorLabel(<=44)]-10-[meaningFactorLabel(<=44)]-10-[atHomeOrWorkFactorLabel(<=44)]-10-[maximumFaceSizeLabel(<=44)]->=0-|"), 0, 0, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView addConstraints:](v7, "addConstraints:", v98);

    v5 = v101;
  }

  return v7;
}

- (void)setFavoriteFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setFavoriteFactor:](self->_scoringContext, "setFavoriteFactor:");

}

- (void)setAestheticFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setAestheticFactor:](self->_scoringContext, "setAestheticFactor:");

}

- (void)setPeopleFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setPeopleFactor:](self->_scoringContext, "setPeopleFactor:");

}

- (void)setInteractionFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setInteractionFactor:](self->_scoringContext, "setInteractionFactor:");

}

- (void)setMeaningFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setMeaningFactor:](self->_scoringContext, "setMeaningFactor:");

}

- (void)setAtHomeOrWorkFactor:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setAtHomeOrWorkFactor:](self->_scoringContext, "setAtHomeOrWorkFactor:");

}

- (void)setMaximumFaceSize:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  -[PUTopPeopleWallpaperSuggestionsScoringContext setMaximumSizeAllowedForFaces:](self->_scoringContext, "setMaximumSizeAllowedForFaces:");

}

- (UITextField)favoriteFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 424, 1);
}

- (UITextField)aestheticFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 432, 1);
}

- (UITextField)peopleFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 440, 1);
}

- (UITextField)interactionFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 448, 1);
}

- (UITextField)meaningFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 456, 1);
}

- (UITextField)atHomeOrWorkFactorTextField
{
  return (UITextField *)objc_getProperty(self, a2, 464, 1);
}

- (UITextField)maximumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 472, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_atHomeOrWorkFactorTextField, 0);
  objc_storeStrong((id *)&self->_meaningFactorTextField, 0);
  objc_storeStrong((id *)&self->_interactionFactorTextField, 0);
  objc_storeStrong((id *)&self->_peopleFactorTextField, 0);
  objc_storeStrong((id *)&self->_aestheticFactorTextField, 0);
  objc_storeStrong((id *)&self->_favoriteFactorTextField, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
}

@end
