@implementation _PRWidgetEducationHeaderView

- (_PRWidgetEducationHeaderView)initWithFrame:(CGRect)a3
{
  _PRWidgetEducationHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[13];

  v58[11] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)_PRWidgetEducationHeaderView;
  v3 = -[_PRWidgetEducationHeaderView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:withConfiguration:", CFSTR("WidgetEducationLandscape"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:withConfiguration:", CFSTR("WidgetEducationPortrait"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    {
      objc_msgSend(v6, "imageWithHorizontallyFlippedOrientation");
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "imageWithHorizontallyFlippedOrientation");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
      v6 = (void *)v10;
    }
    v34 = v9;
    v37 = v6;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    -[_PRWidgetEducationHeaderView addSubview:](v3, "addSubview:", v12);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    -[_PRWidgetEducationHeaderView addSubview:](v3, "addSubview:", v13);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_PRWidgetEducationHeaderView _makeTimeLabel](v3, "_makeTimeLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v14);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_PRWidgetEducationHeaderView _makeTimeLabel](v3, "_makeTimeLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v39 = (void *)MEMORY[0x1E0CB3718];
    v56 = v14;
    objc_msgSend(v14, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 15.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v53;
    objc_msgSend(v14, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerXAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v15;
    v58[1] = v49;
    objc_msgSend(v15, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 12.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v46;
    objc_msgSend(v15, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v42;
    objc_msgSend(v12, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView leadingAnchor](v3, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v38;
    objc_msgSend(v12, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView topAnchor](v3, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v33;
    v43 = v12;
    objc_msgSend(v12, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView bottomAnchor](v3, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v30;
    objc_msgSend(v13, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v27;
    objc_msgSend(v13, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView trailingAnchor](v3, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v16;
    objc_msgSend(v13, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView topAnchor](v3, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v19;
    objc_msgSend(v13, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRWidgetEducationHeaderView bottomAnchor](v3, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58[10] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v23);

  }
  return v3;
}

- (id)_makeTimeLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithTimeFontIdentifier:forRole:", CFSTR("PRTimeFontIdentifierSoft"), CFSTR("PRPosterRoleLockScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithSize:", 16.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[_PRWidgetEducationHeaderView _timeLabelText](self, "_timeLabelText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v7);

  objc_msgSend(v5, "setFont:", v4);
  return v5;
}

- (id)_timeLabelText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D01738];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatterForDateAsTimeNoAMPMWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 190057260.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
