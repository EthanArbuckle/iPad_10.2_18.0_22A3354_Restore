@implementation PREditorNumberingSystemViewController

- (PREditorNumberingSystemViewController)initWithSelectedNumberingSystem:(id)a3 selectedFont:(id)a4
{
  id v6;
  id v7;
  PREditorNumberingSystemViewController *v8;
  PREditorNumberingSystemViewController *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PREditorNumberingSystemViewController init](self, "init");
  if (v8)
  {
    if (v6)
    {
      v9 = (PREditorNumberingSystemViewController *)objc_msgSend(v6, "copy");
    }
    else
    {
      PRSystemNumberingSystem();
      self = (PREditorNumberingSystemViewController *)objc_claimAutoreleasedReturnValue();
      v9 = (PREditorNumberingSystemViewController *)-[PREditorNumberingSystemViewController copy](self, "copy");
    }
    objc_storeStrong((id *)&v8->_selectedNumberingSystem, v9);
    if (!v6)
    {

      v9 = self;
    }

    v10 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_font, v10);
    if (!v7)

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PREditingPickerLabeledCellView *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  PREditingPickerLabeledCellView *v17;
  void *v18;
  double largestItemHeight;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t k;
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
  id obj;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  PREditingPickerLabeledCellView *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id location;
  objc_super v88;
  _QWORD v89[5];
  _QWORD v90[4];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)PREditorNumberingSystemViewController;
  -[PREditorNumberingSystemViewController viewDidLoad](&v88, sel_viewDidLoad);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PRAllNumberingSystems();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController selectedNumberingSystem](self, "selectedNumberingSystem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v4)
  {
    v72 = *(_QWORD *)v84;
    do
    {
      v76 = v4;
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v84 != v72)
          objc_enumerationMutation(obj);
        v6 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "intValue");
        PRNumberingSystemStringForType(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController localeWithNumberingSystem:](self, "localeWithNumberingSystem:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PRNumberingSystemDisplayNameForType(v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController font](self, "font");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_alloc_init(PREditingPickerLabeledCellView);
        -[PREditingPickerLabeledCellView contentLabel](v12, "contentLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAttributedText:", v11);

        -[PREditingPickerLabeledCellView nameLabel](v12, "nameLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setText:", v9);

        v15 = (void *)MEMORY[0x1E0DC3428];
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __52__PREditorNumberingSystemViewController_viewDidLoad__block_invoke;
        v79[3] = &unk_1E21842C0;
        objc_copyWeak(&v82, &location);
        v16 = v7;
        v80 = v16;
        v17 = v12;
        v81 = v17;
        objc_msgSend(v15, "actionWithHandler:", v79);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingPickerLabeledCellView addAction:forControlEvents:](v17, "addAction:forControlEvents:", v18, 0x2000);
        if (objc_msgSend(v16, "isEqualToString:", v75))
        {
          -[PREditingPickerLabeledCellView setSelected:](v17, "setSelected:", 1);
          -[PREditorNumberingSystemViewController setSelectedCellView:](self, "setSelectedCellView:", v17);
        }
        -[PREditingPickerLabeledCellView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v78, "addObject:", v17);
        largestItemHeight = self->_largestItemHeight;
        objc_msgSend(v11, "size");
        if (largestItemHeight >= v20)
          v21 = largestItemHeight;
        else
          v21 = v20;
        self->_largestItemHeight = v21;

        objc_destroyWeak(&v82);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v4);
  }

  -[PREditorNumberingSystemViewController setCellViews:](self, "setCellViews:", v78);
  v22 = objc_msgSend(v78, "count");
  if (0xAAAAAAAAAAAAAAABLL * objc_msgSend(v78, "count") <= 0x5555555555555555)
    v23 = v22 / 3;
  else
    v23 = v22 / 3 + 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v25 = 0;
    for (j = 0; j != v23; ++j)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k != 3; ++k)
      {
        if (objc_msgSend(v78, "count") <= (unint64_t)(v25 + k))
          break;
        objc_msgSend(v78, "objectAtIndexedSubscript:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v29);

      }
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v27);
      objc_msgSend(v30, "setAxis:", 0);
      objc_msgSend(v30, "setDistribution:", 1);
      objc_msgSend(v30, "setAlignment:", 1);
      objc_msgSend(v30, "setSpacing:", 0.0);
      objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v24, "addObject:", v30);

      v25 += 3;
    }
  }
  v77 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  objc_msgSend(v77, "setScrollEnabled:", 1);
  objc_msgSend(v77, "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(v77, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v77, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditorNumberingSystemViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v77);

  v51 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v77, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v67, 23.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v65;
  objc_msgSend(v77, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, -23.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v57;
  objc_msgSend(v77, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v90[2] = v33;
  objc_msgSend(v77, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v90[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "activateConstraints:", v38);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v24);
  objc_msgSend(v39, "setAxis:", 1);
  objc_msgSend(v39, "setAlignment:", 0);
  objc_msgSend(v39, "setSpacing:", 24.0);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v77, "addSubview:", v39);
  v47 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v39, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "contentLayoutGuide");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v68);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v66;
  objc_msgSend(v39, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "contentLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v60);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v58;
  objc_msgSend(v39, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "contentLayoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v50;
  objc_msgSend(v39, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "contentLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v41;
  objc_msgSend(v39, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "frameLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v46);

  -[PREditorNumberingSystemViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  objc_destroyWeak(&location);

}

void __52__PREditorNumberingSystemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedNumberingSystem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectedCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelected:", 0);

  objc_msgSend(WeakRetained, "setSelectedCellView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setSelected:", 1);
  objc_msgSend(WeakRetained, "didSelectNumberingSystem:", *(_QWORD *)(a1 + 32));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PREditorNumberingSystemViewController;
  -[PREditorNumberingSystemViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PREditorNumberingSystemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 > 375.0)
  {
    v6 = 0;
    if (-[PREditorNumberingSystemViewController isUsingSmallerSizing](self, "isUsingSmallerSizing"))
      goto LABEL_6;
LABEL_5:
    if (self->_configuredViewWidth == v5)
      return;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "userInterfaceIdiom") != 1;

  if (v6 == -[PREditorNumberingSystemViewController isUsingSmallerSizing](self, "isUsingSmallerSizing"))
    goto LABEL_5;
LABEL_6:
  -[PREditorNumberingSystemViewController setUsingSmallerSizing:](self, "setUsingSmallerSizing:", v6);
  -[PREditorNumberingSystemViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
}

- (void)updateLayoutForCurrentSize
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t i;
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
  NSArray *v22;
  NSArray *widthCellConstraints;
  NSArray *v24;
  NSArray *heightCellConstraints;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  id obj;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = -[PREditorNumberingSystemViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[PREditorNumberingSystemViewController widthCellConstraints](self, "widthCellConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[PREditorNumberingSystemViewController heightCellConstraints](self, "heightCellConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

  if (v3)
    v8 = 86.0;
  else
    v8 = 89.0;
  if (v3)
    v9 = 88.0;
  else
    v9 = 90.0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  PRAllNumberingSystemStrings();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PREditorNumberingSystemViewController cellViews](self, "cellViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v46)
  {
    v10 = 0;
    v42 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v43, "objectAtIndexedSubscript:", v10 + i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contentLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController localeWithNumberingSystem:](self, "localeWithNumberingSystem:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController font](self, "font");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditorNumberingSystemViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setAttributedText:", v17);
        objc_msgSend(v12, "widthAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToConstant:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v19);

        objc_msgSend(v12, "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToConstant:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v21);

      }
      v10 += i;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v46);
  }

  v22 = (NSArray *)objc_msgSend(v45, "copy");
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v22;

  v24 = (NSArray *)objc_msgSend(v44, "copy");
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v24;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v45);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v44);
  if (-[PREditorNumberingSystemViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PREditorNumberingSystemViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v28 = v27;

    if (self->_configuredViewWidth != v28)
    {
      v29 = v28 + v8 * -3.0;
      -[PREditorNumberingSystemViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constant");
      v32 = v31;
      -[PREditorNumberingSystemViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constant");
      v35 = v32 - v34;

      if (v29 >= v35)
        v36 = 23.0;
      else
        v36 = v29 * 0.5;
      -[PREditorNumberingSystemViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v36 >= 0.0)
        v39 = v36;
      else
        v39 = 0.0;
      objc_msgSend(v37, "setConstant:", v39);

      -[PREditorNumberingSystemViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setConstant:", fmin(-v36, 0.0));

      self->_configuredViewWidth = v28;
    }
  }

}

- (id)baseContentStringForLocale:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB37F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "setLocale:", v4);

  objc_msgSend(v5, "stringFromNumber:", &unk_1E21DCC38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
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
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PREditorNumberingSystemViewController baseContentStringForLocale:](self, "baseContentStringForLocale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PRNumberingSystemDisplayFontForFont(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E08];
  v20 = *MEMORY[0x1E0DC1138];
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v6, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "componentsFromLocaleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("numbers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (PRTimeNumberingSystemRequiresLanguageTagging(v16))
  {
    PRTimeNumberingSystemLanguageTag(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2CE0]);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v12);

  return v18;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  UIFont *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    -[PREditorNumberingSystemViewController displayFont](self, "displayFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PREditorNumberingSystemViewController cellViews](self, "cellViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = v6;
      v24 = *(_QWORD *)v27;
      v23 = *MEMORY[0x1E0DC1138];
      v8 = *MEMORY[0x1E0CB2CE0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "contentLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributedText");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0C99E08];
          v30 = v23;
          v31 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryWithDictionary:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "attributesAtIndex:effectiveRange:", 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && objc_msgSend(v17, "length"))
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v8);
          v18 = objc_alloc(MEMORY[0x1E0CB3498]);
          objc_msgSend(v12, "string");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v15);

          objc_msgSend(v11, "setAttributedText:", v20);
          objc_msgSend(v10, "invalidateIntrinsicContentSize");

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v7);
    }

    v5 = v21;
  }

}

- (double)estimatedHeight
{
  void *v3;
  _BOOL4 v4;
  double v5;
  unint64_t v6;
  uint64_t v7;
  double v8;

  PRAllNumberingSystems();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PREditorNumberingSystemViewController isViewLoaded](self, "isViewLoaded") & 1) == 0
    && objc_msgSend(v3, "count"))
  {
    v4 = -[PREditorNumberingSystemViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
    v5 = 64.0;
    if (v4)
      v5 = 62.0;
    self->_largestItemHeight = v5;
  }
  v6 = objc_msgSend(v3, "count") / 3uLL;
  if (0xAAAAAAAAAAAAAAABLL * objc_msgSend(v3, "count") <= 0x5555555555555555)
    v7 = v6;
  else
    v7 = v6 + 1;
  v8 = (double)(v7 - 1) * 20.0 + (double)v7 * self->_largestItemHeight + 30.0;

  return v8;
}

- (id)displayFont
{
  void *v2;
  void *v3;
  void *v4;

  -[PREditorNumberingSystemViewController font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "fontWithSize:", 56.0);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 56.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSLocale)displayLocale
{
  void *v3;
  void *v4;

  -[PREditorNumberingSystemViewController selectedNumberingSystem](self, "selectedNumberingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorNumberingSystemViewController localeWithNumberingSystem:](self, "localeWithNumberingSystem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v4;
}

- (id)localeWithNumberingSystem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("numbers"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PREditorNumberingSystemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberingSystemViewController:didSelectNumberingSystem:", self, v4);

}

- (UIFont)font
{
  return self->_font;
}

- (NSString)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (PREditorNumberingSystemViewControllerDelegate)delegate
{
  return (PREditorNumberingSystemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)numberSystemImages
{
  return self->_numberSystemImages;
}

- (void)setNumberSystemImages:(id)a3
{
  objc_storeStrong((id *)&self->_numberSystemImages, a3);
}

- (NSArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
  objc_storeStrong((id *)&self->_cellViews, a3);
}

- (PREditingPickerLabeledCellView)selectedCellView
{
  return self->_selectedCellView;
}

- (void)setSelectedCellView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCellView, a3);
}

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_largestItemHeight = a3;
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  self->_usingSmallerSizing = a3;
}

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (NSArray)widthCellConstraints
{
  return self->_widthCellConstraints;
}

- (void)setWidthCellConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSArray)heightCellConstraints
{
  return self->_heightCellConstraints;
}

- (void)setHeightCellConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return self->_stackViewLeadingConstraint;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightCellConstraints, 0);
  objc_storeStrong((id *)&self->_widthCellConstraints, 0);
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_numberSystemImages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
