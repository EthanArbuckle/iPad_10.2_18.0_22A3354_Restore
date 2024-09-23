@implementation DBSDisplayZoomTableViewCell

- (void)configureView
{
  void *v3;
  DBSDisplayZoomOptionView *v4;
  DBSDisplayZoomOptionView *v5;
  DBSDisplayZoomOptionView *standardOptionView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DBSDisplayZoomOptionView *v11;
  DBSDisplayZoomOptionView *v12;
  DBSDisplayZoomOptionView *zoomedOptionView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DBSDisplayZoomOptionView *v18;
  DBSDisplayZoomOptionView *v19;
  DBSDisplayZoomOptionView *denseOptionView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  DBSDisplayZoomOptionView *v25;
  DBSDisplayZoomOptionView *v26;
  DBSDisplayZoomOptionView *denserOptionView;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  id v41;

  -[DBSDisplayZoomTableViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedDisplayZoomOptions");
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v41, "containsObject:", &unk_24F02F9C0))
  {
    v4 = [DBSDisplayZoomOptionView alloc];
    v5 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v4, "initWithFrame:displayZoomOption:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    standardOptionView = self->_standardOptionView;
    self->_standardOptionView = v5;

    -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    DBSStringForDisplayZoomOption(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  }
  if (objc_msgSend(v41, "containsObject:", &unk_24F02F9D8))
  {
    v11 = [DBSDisplayZoomOptionView alloc];
    v12 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v11, "initWithFrame:displayZoomOption:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    zoomedOptionView = self->_zoomedOptionView;
    self->_zoomedOptionView = v12;

    -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    DBSStringForDisplayZoomOption(1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", v16);

  }
  if (objc_msgSend(v41, "containsObject:", &unk_24F02F9F0))
  {
    v18 = [DBSDisplayZoomOptionView alloc];
    v19 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v18, "initWithFrame:displayZoomOption:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    denseOptionView = self->_denseOptionView;
    self->_denseOptionView = v19;

    -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);

    DBSStringForDisplayZoomOption(2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  }
  if (objc_msgSend(v41, "containsObject:", &unk_24F02FA08))
  {
    v25 = [DBSDisplayZoomOptionView alloc];
    v26 = -[DBSDisplayZoomOptionView initWithFrame:displayZoomOption:](v25, "initWithFrame:displayZoomOption:", 3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    denserOptionView = self->_denserOptionView;
    self->_denserOptionView = v26;

    -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", self);

    DBSStringForDisplayZoomOption(3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAccessibilityIdentifier:", v30);

  }
  if ((DBSReverseZoomEnabled() & 1) != 0)
  {
    -[DBSDisplayZoomTableViewCell _optionViewsByDensity](self, "_optionViewsByDensity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v32, "count") >= 4)
    {
      objc_msgSend(v32, "subarrayWithRange:", objc_msgSend(v32, "count") - 3, 3);
      v33 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v33;
    }
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    if ((unint64_t)objc_msgSend(v32, "count") >= 3)
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v41, "count") == 2)
      -[DBSDisplayZoomTableViewCell _configureForTwoDisplayOptionsWithLeadingView:trailingView:](self, "_configureForTwoDisplayOptionsWithLeadingView:trailingView:", v34, v35);
    else
      -[DBSDisplayZoomTableViewCell _configureForThreeDisplayOptionsWithLeadingView:middleView:trailingView:](self, "_configureForThreeDisplayOptionsWithLeadingView:middleView:trailingView:", v34, v35, v36);

  }
  else
  {
    -[DBSDisplayZoomTableViewCell _configureForLegacy](self, "_configureForLegacy");
  }
  -[DBSDisplayZoomTableViewCell delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    -[DBSDisplayZoomTableViewCell delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "displayZoomTableViewCellCurrentlySelectedDisplayZoomOption:", self);

    -[DBSDisplayZoomTableViewCell updateSelectedViewWithOption:](self, "updateSelectedViewWithOption:", v40);
  }

}

- (void)_configureForTwoDisplayOptionsWithLeadingView:(id)a3 trailingView:(id)a4
{
  id v6;
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
  double v36;
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
  id v50;

  v6 = a4;
  v7 = a3;
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);

  v50 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addLayoutGuide:", v50);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 18.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  objc_msgSend(v7, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 18.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v19);

  objc_msgSend(v6, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -18.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v23);

  objc_msgSend(v7, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -18.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v27);

  objc_msgSend(v7, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v30, 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v31);

  objc_msgSend(v7, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v34);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = objc_msgSend(v35, "sf_isiPad");

  if ((_DWORD)v32)
    v36 = 80.0;
  else
    v36 = 49.0;
  objc_msgSend(v50, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v38);

  objc_msgSend(v50, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v42);

  objc_msgSend(v6, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v45);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v48, 2.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v49);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v11);
}

- (void)_configureForThreeDisplayOptionsWithLeadingView:(id)a3 middleView:(id)a4 trailingView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
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
  id v72;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v9);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v8);

  v72 = objc_alloc_init(MEMORY[0x24BEBD718]);
  v14 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addLayoutGuide:", v72);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addLayoutGuide:", v14);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 18.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v21);

  objc_msgSend(v10, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 18.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v25);

  objc_msgSend(v9, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 18.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v29);

  objc_msgSend(v8, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -18.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v33);

  objc_msgSend(v10, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -18.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v37);

  objc_msgSend(v9, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -18.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v41);

  objc_msgSend(v10, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v44, 2.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v45);

  objc_msgSend(v10, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v48);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = objc_msgSend(v49, "sf_isiPad");

  if ((_DWORD)v46)
    v50 = 80.0;
  else
    v50 = 29.0;
  objc_msgSend(v72, "widthAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToConstant:", v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v52);

  objc_msgSend(v9, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v55);

  objc_msgSend(v9, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v58);

  objc_msgSend(v9, "centerXAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v62);

  objc_msgSend(v14, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToConstant:", v50);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v64);

  objc_msgSend(v8, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v67);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v70, 2.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v71);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
}

- (void)_configureForLegacy
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
  double v39;
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
  id v55;

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v55 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLayoutGuide:", v55);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 56.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 56.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v18);

  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -56.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v23);

  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, -56.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v28);

  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v32, 2.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v33);

  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v37);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = objc_msgSend(v38, "sf_isiPad");

  if ((_DWORD)v35)
    v39 = 80.0;
  else
    v39 = 49.0;
  objc_msgSend(v55, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToConstant:", v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v41);

  objc_msgSend(v55, "centerXAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v45);

  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v49);

  -[DBSDisplayZoomTableViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v53, 2.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v54);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v8);
}

- (id)_optionViewsByDensity
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

  v3 = (void *)objc_opt_new();
  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)updateSelectedViewWithOption:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[DBSDisplayZoomTableViewCell _optionViewsByDensity](self, "_optionViewsByDensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;
      break;
    default:
      v7 = 0;
      break;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12), "setSelected:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) == (_QWORD)v7, (_QWORD)v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)startAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimation");

  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimation");

  -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimation");

  -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimation");

}

- (void)stopAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DBSDisplayZoomTableViewCell standardOptionView](self, "standardOptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation");

  -[DBSDisplayZoomTableViewCell zoomedOptionView](self, "zoomedOptionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimation");

  -[DBSDisplayZoomTableViewCell denseOptionView](self, "denseOptionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimation");

  -[DBSDisplayZoomTableViewCell denserOptionView](self, "denserOptionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimation");

}

- (void)userDidTapOnDisplayZoomOptionView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DBSDisplayZoomTableViewCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DBSDisplayZoomTableViewCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayZoomTableViewCell:userDidTapOnDisplayZoomOption:", self, objc_msgSend(v7, "displayZoomOption"));

    -[DBSDisplayZoomTableViewCell updateSelectedViewWithOption:](self, "updateSelectedViewWithOption:", objc_msgSend(v7, "displayZoomOption"));
  }

}

- (DBSDisplayZoomTableViewCellDelegate)delegate
{
  return (DBSDisplayZoomTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DBSDisplayZoomOptionView)standardOptionView
{
  return self->_standardOptionView;
}

- (void)setStandardOptionView:(id)a3
{
  objc_storeStrong((id *)&self->_standardOptionView, a3);
}

- (DBSDisplayZoomOptionView)zoomedOptionView
{
  return self->_zoomedOptionView;
}

- (void)setZoomedOptionView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomedOptionView, a3);
}

- (DBSDisplayZoomOptionView)denseOptionView
{
  return self->_denseOptionView;
}

- (void)setDenseOptionView:(id)a3
{
  objc_storeStrong((id *)&self->_denseOptionView, a3);
}

- (DBSDisplayZoomOptionView)denserOptionView
{
  return self->_denserOptionView;
}

- (void)setDenserOptionView:(id)a3
{
  objc_storeStrong((id *)&self->_denserOptionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denserOptionView, 0);
  objc_storeStrong((id *)&self->_denseOptionView, 0);
  objc_storeStrong((id *)&self->_zoomedOptionView, 0);
  objc_storeStrong((id *)&self->_standardOptionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
