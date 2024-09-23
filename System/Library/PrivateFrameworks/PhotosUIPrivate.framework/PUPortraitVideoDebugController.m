@implementation PUPortraitVideoDebugController

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
  void *v44;
  _QWORD v45[4];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  -[PUPortraitVideoDebugController compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "portraitVideoAdjustmentController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPortraitVideoDebugController setDebugModes:](self, "setDebugModes:", &unk_1E59BA4C8);
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  objc_msgSend(v9, "addSubview:", v10);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v10, "setText:", CFSTR("Debug:"));
  objc_msgSend(v10, "setTextAlignment:", 2);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v10, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  objc_msgSend(v9, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v12;
  objc_msgSend(v10, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 80.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v15;
  objc_msgSend(v10, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMarginsGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, v5, v6, v7, v8);
  objc_msgSend(v42, "addSubview:", v21);
  objc_msgSend(v21, "setDataSource:", self);
  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v44, "debugMode"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "selectRowAtIndexPath:animated:scrollPosition:", v22, 0, 1);

  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v21, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, 8.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v37;
  objc_msgSend(v21, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layoutMarginsGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v23;
  objc_msgSend(v21, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v26;
  objc_msgSend(v21, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPortraitVideoDebugController debugModes](self, "debugModes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToConstant:", (double)(unint64_t)objc_msgSend(v28, "count") * 44.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v30);

  -[PUPortraitVideoDebugController setView:](self, "setView:", v42);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUPortraitVideoDebugController debugModes](self, "debugModes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("cell"));
  -[PUPortraitVideoDebugController debugModes](self, "debugModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[PUPortraitVideoDebugController compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentConstants");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPortraitVideoDebugController compositionController](self, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "PIPortraitVideoAdjustmentKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PUPortraitVideoDebugController_tableView_didSelectRowAtIndexPath___block_invoke;
  v11[3] = &unk_1E58A4B88;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v7, "modifyAdjustmentWithKey:modificationBlock:", v8, v11);

}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (NSArray)debugModes
{
  return self->_debugModes;
}

- (void)setDebugModes:(id)a3
{
  objc_storeStrong((id *)&self->_debugModes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugModes, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

void __68__PUPortraitVideoDebugController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDebugMode:", objc_msgSend(v2, "row"));

}

@end
