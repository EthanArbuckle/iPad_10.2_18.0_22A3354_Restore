@implementation PUIContactsPrivacySettingsInsetView

- (PUIContactsPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  PUIContactsPrivacySettingsInsetView *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PUIContactsPrivacySettingsInsetView;
  v27 = a4;
  v28 = a5;
  v30 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v32, sel_initWithStyle_reuseIdentifier_specifier_, a3, v27);
  if (v30)
  {
    -[PUIContactsPrivacySettingsInsetView contentView](v30, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIContactsPrivacySettingsInsetView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setAxis:", 1);
    objc_msgSend(v7, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v7, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v31, "addSubview:", v7);
    v29 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v29, "setAxis:", 1);
    objc_msgSend(v29, "setLayoutMargins:", 15.0, 15.0, 10.0, 15.0);
    objc_msgSend(v29, "setLayoutMarginsRelativeArrangement:", 1);
    v22 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v24;
    objc_msgSend(v7, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v9;
    objc_msgSend(v7, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v12;
    objc_msgSend(v7, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v16);

    if (objc_opt_class())
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2050000000;
      v17 = (void *)getCNContactGroupVisualizerClass_softClass;
      v37 = getCNContactGroupVisualizerClass_softClass;
      if (!getCNContactGroupVisualizerClass_softClass)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __getCNContactGroupVisualizerClass_block_invoke;
        v33[3] = &unk_1EA26B260;
        v33[4] = &v34;
        __getCNContactGroupVisualizerClass_block_invoke((uint64_t)v33);
        v17 = (void *)v35[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v34, 8);
      objc_msgSend(v18, "allContactsSettingsViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addArrangedSubview:", v20);

    }
  }

  return v30;
}

@end
