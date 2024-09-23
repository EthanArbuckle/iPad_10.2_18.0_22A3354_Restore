@implementation PUTopPeopleWallpaperSuggestionsDebugSettingsViewController

- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewController)initWithDelegate:(id)a3
{
  id v4;
  PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *v5;
  PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsViewController;
  v5 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *closeButton;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UISegmentedControl *v17;
  UISegmentedControl *segmentedControl;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIView *v27;
  UIView *contentView;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *v41;
  id WeakRetained;
  void *v43;
  UIView *v44;
  UIView *filteringSettingsView;
  PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView *v46;
  id v47;
  void *v48;
  UIView *v49;
  UIView *scoringSettingsView;
  PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView *v51;
  id v52;
  void *v53;
  UIView *v54;
  UIView *distancingSettingsView;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugSettingsViewController;
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController viewDidLoad](&v56, sel_viewDidLoad);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:animated:", 1, 0);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v7;

  -[UIButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, sel__close_, 64);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v9) = 1132134400;
  -[UIButton setContentHuggingPriority:forAxis:](self->_closeButton, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1132134400;
  -[UIButton setContentHuggingPriority:forAxis:](self->_closeButton, "setContentHuggingPriority:forAxis:", 1, v10);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_closeButton);

  -[UIButton topAnchor](self->_closeButton, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v15, 16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  v17 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E59B9C58);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v17;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchSettings_, 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1132134400;
  -[UISegmentedControl setContentHuggingPriority:forAxis:](self->_segmentedControl, "setContentHuggingPriority:forAxis:", 0, v19);
  LODWORD(v20) = 1132134400;
  -[UISegmentedControl setContentHuggingPriority:forAxis:](self->_segmentedControl, "setContentHuggingPriority:forAxis:", 1, v20);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_segmentedControl);

  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v25, 16.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  contentView = self->_contentView;
  self->_contentView = v27;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->_contentView);

  v30 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v30);

  v32 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v32);

  _NSDictionaryOfVariableBindings(CFSTR("spacer1, _segmentedControl, spacer2, _closeButton, _contentView"), v30, self->_segmentedControl, v32, self->_closeButton, self->_contentView, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-16-[_segmentedControl(<=31)]-10-[_contentView]-0-|"), 0, 0, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addConstraints:", v36);

  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[spacer1]-[_segmentedControl]-[spacer2(==spacer1)]-[_closeButton]-|"), 0, 0, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addConstraints:", v38);

  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_contentView]|"), 0, 0, v34);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addConstraints:", v40);

  v41 = [PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "filteringContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView initWithFilteringContext:](v41, "initWithFilteringContext:", v43);
  filteringSettingsView = self->_filteringSettingsView;
  self->_filteringSettingsView = v44;

  -[UIView bounds](self->_contentView, "bounds");
  -[UIView setFrame:](self->_filteringSettingsView, "setFrame:");
  -[UIView setAutoresizingMask:](self->_filteringSettingsView, "setAutoresizingMask:", 18);
  v46 = [PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView alloc];
  v47 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v47, "scoringContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsScoringSettingsView initWithScoringContext:](v46, "initWithScoringContext:", v48);
  scoringSettingsView = self->_scoringSettingsView;
  self->_scoringSettingsView = v49;

  -[UIView bounds](self->_contentView, "bounds");
  -[UIView setFrame:](self->_scoringSettingsView, "setFrame:");
  -[UIView setAutoresizingMask:](self->_scoringSettingsView, "setAutoresizingMask:", 18);
  v51 = [PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView alloc];
  v52 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v52, "distancingContext");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsDistancingSettingsView initWithDistancingContext:](v51, "initWithDistancingContext:", v53);
  distancingSettingsView = self->_distancingSettingsView;
  self->_distancingSettingsView = v54;

  -[UIView bounds](self->_contentView, "bounds");
  -[UIView setFrame:](self->_distancingSettingsView, "setFrame:");
  -[UIView setAutoresizingMask:](self->_distancingSettingsView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_filteringSettingsView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_scoringSettingsView);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_distancingSettingsView);
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController _switchSettings:](self, "_switchSettings:", 0);

}

- (void)_switchSettings:(id)a3
{
  NSInteger v4;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  -[UIView setHidden:](self->_filteringSettingsView, "setHidden:", v4 != 0);
  -[UIView setHidden:](self->_scoringSettingsView, "setHidden:", v4 != 1);
  -[UIView setHidden:](self->_distancingSettingsView, "setHidden:", v4 != 2);
}

- (void)_close:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PUTopPeopleWallpaperSuggestionsDebugSettingsViewController__close___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (PUTopPeopleWallpaperSuggestionsDebugSettingsViewControllerDelegate)delegate
{
  return (PUTopPeopleWallpaperSuggestionsDebugSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_distancingSettingsView, 0);
  objc_storeStrong((id *)&self->_scoringSettingsView, 0);
  objc_storeStrong((id *)&self->_filteringSettingsView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
}

void __69__PUTopPeopleWallpaperSuggestionsDebugSettingsViewController__close___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1016));
  objc_msgSend(WeakRetained, "settingsDidDismiss");

}

@end
