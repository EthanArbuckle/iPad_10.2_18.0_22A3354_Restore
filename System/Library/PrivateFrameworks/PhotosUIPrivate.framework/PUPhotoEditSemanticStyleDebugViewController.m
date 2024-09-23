@implementation PUPhotoEditSemanticStyleDebugViewController

- (void)loadView
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PUPhotoEditSemanticStyleDebugViewController *v57;
  void *v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "semanticStyleAdjustmentController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditSemanticStyleDebugViewController _addLabel:inView:below:](self, "_addLabel:inView:below:", CFSTR("on:"), v9, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", v5, v6, v7, v8);
  objc_msgSend(v9, "addSubview:", v10);
  objc_msgSend(v10, "setOn:", objc_msgSend(v58, "enabled"));
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__enabledChanged_, 4096);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v56 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 60.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v14;
  v55 = v10;
  objc_msgSend(v10, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activateConstraints:", v18);

  -[PUPhotoEditSemanticStyleDebugViewController _addLabel:inView:below:](self, "_addLabel:inView:below:", CFSTR("show:"), v9, v59);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E59BA570);
  objc_msgSend(v9, "addSubview:", v20);
  v57 = self;
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__debugModeSelected_, 4096);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v20, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v9;
  objc_msgSend(v9, "layoutMarginsGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 60.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v25;
  v26 = v20;
  objc_msgSend(v20, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v19;
  objc_msgSend(v19, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v30);

  objc_msgSend(v58, "debugMode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v31;
  if ((objc_msgSend(v31, "isEqualToString:", CFSTR("showSubjectMatte")) & 1) != 0)
  {
    v32 = 1;
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("showSkinMatte")) & 1) != 0)
  {
    v32 = 2;
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("showSkyMatte")) & 1) != 0)
  {
    v32 = 3;
  }
  else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("originalThumb")) & 1) != 0)
  {
    v32 = 4;
  }
  else if (objc_msgSend(v31, "isEqualToString:", CFSTR("linearThumb")))
  {
    v32 = 5;
  }
  else
  {
    v32 = 0;
  }
  v51 = v26;
  objc_msgSend(v26, "setSelectedSegmentIndex:", v32);
  -[PUPhotoEditSemanticStyleDebugViewController _addSlider:controller:inView:below:](v57, "_addSlider:controller:inView:below:", CFSTR("tone"), v58, v53, v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addTarget:action:forControlEvents:", v57, sel__toneChanged_, 4096);
  -[PUPhotoEditSemanticStyleDebugViewController _addSlider:controller:inView:below:](v57, "_addSlider:controller:inView:below:", CFSTR("color"), v58, v53, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "addTarget:action:forControlEvents:", v57, sel__colorChanged_, 4096);
  -[PUPhotoEditSemanticStyleDebugViewController _addSlider:controller:inView:below:](v57, "_addSlider:controller:inView:below:", CFSTR("intensity"), v58, v53, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v35;
  objc_msgSend(v35, "addTarget:action:forControlEvents:", v57, sel__intensityChanged_, 4096);
  v36 = objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  objc_msgSend(v36, "setDelegate:", v57);
  objc_msgSend(v36, "setDataSource:", v57);
  objc_msgSend(v53, "addSubview:", v36);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v36, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v47;
  objc_msgSend(v36, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutMarginsGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v38;
  objc_msgSend(v36, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v43);

  -[PUPhotoEditSemanticStyleDebugViewController setView:](v57, "setView:", v53);
}

- (id)_addLabel:(id)a3 inView:(id)a4 below:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DC3990];
  v10 = a3;
  v11 = [v9 alloc];
  v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "addSubview:", v12);
  objc_msgSend(v12, "setText:", v10);

  v13 = v8;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v12, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v17;
  if (v13)
  {
    v27[0] = v17;
    objc_msgSend(v12, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v21);
  }
  else
  {
    v26[0] = v17;
    objc_msgSend(v12, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

    v13 = 0;
  }

  return v12;
}

- (id)_addSlider:(id)a3 controller:(id)a4 inView:(id)a5 below:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "adjustment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "schema");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditSemanticStyleDebugViewController _addLabel:inView:below:](self, "_addLabel:inView:below:", v16, v11, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0DC3C80]);
  v18 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v11, "addSubview:", v18);
  v37 = v15;
  objc_msgSend(v15, "minimumValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  objc_msgSend(v18, "setMinimumValue:");

  objc_msgSend(v15, "maximumValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  objc_msgSend(v18, "setMaximumValue:");

  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "floatValue");
  objc_msgSend(v18, "setValue:");

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v18, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 80.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v22;
  objc_msgSend(v18, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v26;
  objc_msgSend(v18, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v30);

  return v18;
}

- (void)_enabledChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D71420];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PUPhotoEditSemanticStyleDebugViewController__enabledChanged___block_invoke;
  v8[3] = &unk_1E58A44E0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (void)_debugModeSelected:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D71420];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PUPhotoEditSemanticStyleDebugViewController__debugModeSelected___block_invoke;
  v8[3] = &unk_1E58A44E0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (void)_toneChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D71420];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PUPhotoEditSemanticStyleDebugViewController__toneChanged___block_invoke;
  v8[3] = &unk_1E58A44E0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (void)_colorChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D71420];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PUPhotoEditSemanticStyleDebugViewController__colorChanged___block_invoke;
  v8[3] = &unk_1E58A44E0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (void)_intensityChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D71420];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PUPhotoEditSemanticStyleDebugViewController__intensityChanged___block_invoke;
  v8[3] = &unk_1E58A44E0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v6, v8);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D712A0], "allCasts", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  unint64_t v7;
  void *v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0D712A0], "allCasts", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v9 = CFSTR("NA");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D712A0], "allCasts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0D712A0], "allCasts", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditSemanticStyleDebugViewController compositionController](self, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D71420];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PUPhotoEditSemanticStyleDebugViewController_pickerView_didSelectRow_inComponent___block_invoke;
  v12[3] = &unk_1E58A44E0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v10, v12);

}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
}

uint64_t __83__PUPhotoEditSemanticStyleDebugViewController_pickerView_didSelectRow_inComponent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCast:", *(_QWORD *)(a1 + 32));
}

void __65__PUPhotoEditSemanticStyleDebugViewController__intensityChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "value");
  objc_msgSend(v4, "setIntensity:", v3);

}

void __61__PUPhotoEditSemanticStyleDebugViewController__colorChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "value");
  objc_msgSend(v4, "setColor:", v3);

}

void __60__PUPhotoEditSemanticStyleDebugViewController__toneChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "value");
  objc_msgSend(v4, "setTone:", v3);

}

void __66__PUPhotoEditSemanticStyleDebugViewController__debugModeSelected___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  const __CFString *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "selectedSegmentIndex") - 1;
  if (v3 > 4)
    v4 = CFSTR("none");
  else
    v4 = off_1E58A4448[v3];
  objc_msgSend(v5, "setDebugMode:", v4);

}

void __63__PUPhotoEditSemanticStyleDebugViewController__enabledChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "isOn"));
  objc_msgSend(v3, "setCast:", *MEMORY[0x1E0D71428]);

}

@end
