@implementation PUSceneDebugInspectorCell

- (PUSceneDebugInspectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUSceneDebugInspectorCell *v4;
  PUSceneDebugInspectorCell *v5;
  uint64_t v6;
  UILabel *v7;
  UILabel *keywordLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *sceneIdentifierLabel;
  uint64_t v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *isIndexedLabel;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *thresholdLabel;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *coverageLabel;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *synonymsLabel;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *countLabel;
  void *v34;
  double v35;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v70;
  void *v71;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  objc_super v106;
  _QWORD v107[23];

  v107[21] = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)PUSceneDebugInspectorCell;
  v4 = -[PUSceneDebugInspectorCell initWithStyle:reuseIdentifier:](&v106, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUSceneDebugInspectorCell setAccessoryType:](v4, "setAccessoryType:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    keywordLabel = v5->_keywordLabel;
    v5->_keywordLabel = v7;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_keywordLabel, "setFont:", v9);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_keywordLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_keywordLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v5->_keywordLabel);

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    sceneIdentifierLabel = v5->_sceneIdentifierLabel;
    v5->_sceneIdentifierLabel = v11;

    -[UILabel setTextColor:](v5->_sceneIdentifierLabel, "setTextColor:", v6);
    v13 = *MEMORY[0x1E0DC4A98];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_sceneIdentifierLabel, "setFont:", v14);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_sceneIdentifierLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_sceneIdentifierLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5->_sceneIdentifierLabel);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    isIndexedLabel = v5->_isIndexedLabel;
    v5->_isIndexedLabel = v16;

    -[UILabel setTextColor:](v5->_isIndexedLabel, "setTextColor:", v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_isIndexedLabel, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_isIndexedLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_isIndexedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v5->_isIndexedLabel);

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    thresholdLabel = v5->_thresholdLabel;
    v5->_thresholdLabel = v20;

    -[UILabel setTextColor:](v5->_thresholdLabel, "setTextColor:", v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_thresholdLabel, "setFont:", v22);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_thresholdLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_thresholdLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_thresholdLabel);

    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    coverageLabel = v5->_coverageLabel;
    v5->_coverageLabel = v24;

    v105 = (void *)v6;
    -[UILabel setTextColor:](v5->_coverageLabel, "setTextColor:", v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_coverageLabel, "setFont:", v26);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_coverageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_coverageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v5->_coverageLabel);

    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    synonymsLabel = v5->_synonymsLabel;
    v5->_synonymsLabel = v28;

    -[UILabel setTextColor:](v5->_synonymsLabel, "setTextColor:", v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_synonymsLabel, "setFont:", v30);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_synonymsLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_synonymsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_synonymsLabel, "setNumberOfLines:", 0);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v5->_synonymsLabel);

    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    countLabel = v5->_countLabel;
    v5->_countLabel = v32;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_countLabel, "setFont:", v34);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_countLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_countLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v35) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_countLabel, "setContentCompressionResistancePriority:forAxis:", 0, v35);
    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v5->_countLabel);

    -[PUSceneDebugInspectorCell contentView](v5, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel leadingAnchor](v5->_keywordLabel, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v103);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v102;
    -[UILabel topAnchor](v5->_keywordLabel, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v99;
    -[UILabel leadingAnchor](v5->_sceneIdentifierLabel, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_keywordLabel, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v96;
    -[UILabel topAnchor](v5->_sceneIdentifierLabel, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_keywordLabel, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v94);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v93;
    -[UILabel leadingAnchor](v5->_isIndexedLabel, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_sceneIdentifierLabel, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v107[4] = v90;
    -[UILabel topAnchor](v5->_isIndexedLabel, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_sceneIdentifierLabel, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v107[5] = v87;
    -[UILabel leadingAnchor](v5->_thresholdLabel, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_isIndexedLabel, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v107[6] = v84;
    -[UILabel topAnchor](v5->_thresholdLabel, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_isIndexedLabel, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v107[7] = v81;
    -[UILabel leadingAnchor](v5->_coverageLabel, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_thresholdLabel, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v107[8] = v78;
    -[UILabel topAnchor](v5->_coverageLabel, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_thresholdLabel, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v107[9] = v75;
    -[UILabel leadingAnchor](v5->_synonymsLabel, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_coverageLabel, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v107[10] = v72;
    -[UILabel topAnchor](v5->_synonymsLabel, "topAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_coverageLabel, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v107[11] = v69;
    -[UILabel topAnchor](v5->_countLabel, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v107[12] = v65;
    -[UILabel bottomAnchor](v5->_countLabel, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v107[13] = v61;
    -[UILabel leadingAnchor](v5->_countLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_keywordLabel, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v59, 1.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v107[14] = v58;
    -[UILabel leadingAnchor](v5->_countLabel, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_isIndexedLabel, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v56, 1.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v107[15] = v55;
    -[UILabel leadingAnchor](v5->_countLabel, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_thresholdLabel, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v53, 1.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v107[16] = v52;
    -[UILabel leadingAnchor](v5->_countLabel, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_coverageLabel, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v50, 1.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v107[17] = v49;
    -[UILabel leadingAnchor](v5->_countLabel, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_synonymsLabel, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v40, 1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v107[18] = v41;
    v68 = v38;
    objc_msgSend(v38, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_countLabel, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v107[19] = v44;
    objc_msgSend(v38, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_synonymsLabel, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v107[20] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 21);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v64);
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSceneDebugInspectorCell;
  -[PUSceneDebugInspectorCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUSceneDebugInspectorCell setViewModel:](self, "setViewModel:", 0);
}

- (void)setViewModel:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PUSceneDebugInspectorSceneViewModel *v21;

  v21 = (PUSceneDebugInspectorSceneViewModel *)a3;
  if (self->_viewModel != v21)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PUSceneDebugInspectorSceneViewModel keyword](v21, "keyword");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_keywordLabel, "setText:", v5);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier: %llu"), -[PUSceneDebugInspectorSceneViewModel sceneIdentifier](v21, "sceneIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_sceneIdentifierLabel, "setText:", v6);

    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = -[PUSceneDebugInspectorSceneViewModel isIndexed](v21, "isIndexed");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Searchable: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_isIndexedLabel, "setText:", v10);

    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PUSceneDebugInspectorSceneViewModel threshold](v21, "threshold");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Threshold: %f"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_thresholdLabel, "setText:", v13);

    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PUSceneDebugInspectorSceneViewModel libraryCoverage](v21, "libraryCoverage");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Library Coverage: %2.2f%%"), v15 * 100.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_coverageLabel, "setText:", v16);

    v17 = (void *)MEMORY[0x1E0CB3940];
    -[PUSceneDebugInspectorSceneViewModel concatenatedSynonyms](v21, "concatenatedSynonyms");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Synonyms: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_synonymsLabel, "setText:", v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[PUSceneDebugInspectorSceneViewModel count](v21, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_countLabel, "setText:", v20);

  }
}

- (PUSceneDebugInspectorSceneViewModel)viewModel
{
  return self->_viewModel;
}

- (UILabel)keywordLabel
{
  return self->_keywordLabel;
}

- (void)setKeywordLabel:(id)a3
{
  objc_storeStrong((id *)&self->_keywordLabel, a3);
}

- (UILabel)synonymsLabel
{
  return self->_synonymsLabel;
}

- (void)setSynonymsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_synonymsLabel, a3);
}

- (UILabel)sceneIdentifierLabel
{
  return self->_sceneIdentifierLabel;
}

- (void)setSceneIdentifierLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifierLabel, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (UILabel)isIndexedLabel
{
  return self->_isIndexedLabel;
}

- (void)setIsIndexedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_isIndexedLabel, a3);
}

- (UILabel)thresholdLabel
{
  return self->_thresholdLabel;
}

- (void)setThresholdLabel:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdLabel, a3);
}

- (UILabel)coverageLabel
{
  return self->_coverageLabel;
}

- (void)setCoverageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_coverageLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageLabel, 0);
  objc_storeStrong((id *)&self->_thresholdLabel, 0);
  objc_storeStrong((id *)&self->_isIndexedLabel, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_sceneIdentifierLabel, 0);
  objc_storeStrong((id *)&self->_synonymsLabel, 0);
  objc_storeStrong((id *)&self->_keywordLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("PUSceneDebugInspectorCell");
}

@end
