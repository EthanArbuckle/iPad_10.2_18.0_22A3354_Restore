@implementation PUINumberingSystemPickerComponentViewController

- (PUINumberingSystemPickerComponentViewController)initWithNumberingSystem:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  PUINumberingSystemPickerComponentViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  v8 = -[PUINumberingSystemPickerComponentViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = v9;
    if (!v9)
    {
      +[PUINumberingSystem systemDefaultNumberingSystem](PUINumberingSystem, "systemDefaultNumberingSystem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_selectedNumberingSystem, v10);
    if (!v9)

    v11 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_font, v11);
    if (!v7)

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  PUINumberingSystem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PUIStylePickerLabeledButton *v11;
  void *v12;
  void *v13;
  void *v14;
  PUINumberingSystem *v15;
  PUIStylePickerLabeledButton *v16;
  void *v17;
  double largestItemHeight;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t k;
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
  id obj;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  PUINumberingSystem *v56;
  PUIStylePickerLabeledButton *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id location;
  objc_super v64;
  _QWORD v65[4];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v64.receiver = self;
  v64.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  -[PUINumberingSystemPickerComponentViewController viewDidLoad](&v64, sel_viewDidLoad);
  v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[PUINumberingSystem supportedNumberingSystemTypes](PUINumberingSystem, "supportedNumberingSystemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController selectedNumberingSystem](self, "selectedNumberingSystem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v4)
  {
    v49 = *(_QWORD *)v60;
    do
    {
      v52 = v4;
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(obj);
        v6 = -[PUINumberingSystem initWithNumberingSystemType:]([PUINumberingSystem alloc], "initWithNumberingSystemType:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        -[PUINumberingSystem locale](v6, "locale");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINumberingSystem localizedDisplayName](v6, "localizedDisplayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINumberingSystemPickerComponentViewController font](self, "font");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINumberingSystemPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v9, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_alloc_init(PUIStylePickerLabeledButton);
        -[PUIStylePickerLabeledButton contentLabel](v11, "contentLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAttributedText:", v10);

        -[PUIStylePickerLabeledButton nameLabel](v11, "nameLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v8);

        v14 = (void *)MEMORY[0x24BDF67B8];
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __62__PUINumberingSystemPickerComponentViewController_viewDidLoad__block_invoke;
        v55[3] = &unk_25154CC98;
        objc_copyWeak(&v58, &location);
        v15 = v6;
        v56 = v15;
        v16 = v11;
        v57 = v16;
        objc_msgSend(v14, "actionWithHandler:", v55);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIStylePickerLabeledButton addAction:forControlEvents:](v16, "addAction:forControlEvents:", v17, 0x2000);
        if (-[PUINumberingSystem isEqual:](v15, "isEqual:", v51))
        {
          -[PUIStylePickerLabeledButton setSelected:](v16, "setSelected:", 1);
          -[PUINumberingSystemPickerComponentViewController setSelectedSymbolView:](self, "setSelectedSymbolView:", v16);
        }
        -[PUIStylePickerLabeledButton setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v54, "addObject:", v16);
        largestItemHeight = self->_largestItemHeight;
        objc_msgSend(v10, "size");
        if (largestItemHeight >= v19)
          v20 = largestItemHeight;
        else
          v20 = v19;
        self->_largestItemHeight = v20;

        objc_destroyWeak(&v58);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v4);
  }

  -[PUINumberingSystemPickerComponentViewController setSymbolViews:](self, "setSymbolViews:", v54);
  v21 = objc_msgSend(v54, "count");
  if (0xAAAAAAAAAAAAAAABLL * objc_msgSend(v54, "count") <= 0x5555555555555555)
    v22 = v21 / 3;
  else
    v22 = v21 / 3 + 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v24 = 0;
    for (j = 0; j != v22; ++j)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k != 3; ++k)
      {
        if (objc_msgSend(v54, "count") <= (unint64_t)(v24 + k))
          break;
        objc_msgSend(v54, "objectAtIndexedSubscript:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v28);

      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v26);
      objc_msgSend(v29, "setAxis:", 0);
      objc_msgSend(v29, "setDistribution:", 1);
      objc_msgSend(v29, "setAlignment:", 1);
      objc_msgSend(v29, "setSpacing:", 0.0);
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v23, "addObject:", v29);

      v24 += 3;
    }
  }
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DD0]), "initWithArrangedSubviews:", v23);
  objc_msgSend(v30, "setAxis:", 1);
  objc_msgSend(v30, "setSpacing:", 24.0);
  objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v30);

  v39 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v30, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v50, 23.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v46;
  objc_msgSend(v30, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, -23.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v42;
  objc_msgSend(v30, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v33;
  objc_msgSend(v30, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v38);

  -[PUINumberingSystemPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  objc_destroyWeak(&location);

}

void __62__PUINumberingSystemPickerComponentViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedNumberingSystem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectedSymbolView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelected:", 0);

  objc_msgSend(WeakRetained, "setSelectedSymbolView:", *(_QWORD *)(a1 + 40));
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
  v8.super_class = (Class)PUINumberingSystemPickerComponentViewController;
  -[PUINumberingSystemPickerComponentViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PUINumberingSystemPickerComponentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 > 375.0)
  {
    v6 = 0;
    if (-[PUINumberingSystemPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing"))
      goto LABEL_6;
LABEL_5:
    if (self->_configuredViewWidth == v5)
      return;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "userInterfaceIdiom") != 1;

  if (v6 == -[PUINumberingSystemPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing"))
    goto LABEL_5;
LABEL_6:
  -[PUINumberingSystemPickerComponentViewController setUsingSmallerSizing:](self, "setUsingSmallerSizing:", v6);
  -[PUINumberingSystemPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
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
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PUINumberingSystem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *widthCellConstraints;
  NSArray *v25;
  NSArray *heightCellConstraints;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  id obj;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = -[PUINumberingSystemPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
  v4 = (void *)MEMORY[0x24BDD1628];
  -[PUINumberingSystemPickerComponentViewController widthCellConstraints](self, "widthCellConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  v6 = (void *)MEMORY[0x24BDD1628];
  -[PUINumberingSystemPickerComponentViewController heightCellConstraints](self, "heightCellConstraints");
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController font](self, "font");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUINumberingSystem supportedNumberingSystemTypes](PUINumberingSystem, "supportedNumberingSystemTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PUINumberingSystemPickerComponentViewController symbolViews](self, "symbolViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v48)
  {
    v11 = 0;
    v43 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v44, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PUINumberingSystem initWithNumberingSystemType:]([PUINumberingSystem alloc], "initWithNumberingSystemType:", v14);
        objc_msgSend(v13, "contentLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINumberingSystem locale](v15, "locale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUINumberingSystemPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v45, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setAttributedText:", v18);
        objc_msgSend(v13, "widthAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v20);

        objc_msgSend(v13, "heightAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToConstant:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v22);

        v11 += 2;
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v48);
  }

  v23 = (NSArray *)objc_msgSend(v47, "copy");
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v23;

  v25 = (NSArray *)objc_msgSend(v46, "copy");
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v25;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v47);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v46);
  if (-[PUINumberingSystemPickerComponentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUINumberingSystemPickerComponentViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;

    if (self->_configuredViewWidth != v29)
    {
      v30 = v29 + v8 * -3.0;
      -[PUINumberingSystemPickerComponentViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constant");
      v33 = v32;
      -[PUINumberingSystemPickerComponentViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constant");
      v36 = v33 - v35;

      if (v30 >= v36)
        v37 = 23.0;
      else
        v37 = v30 * 0.5;
      -[PUINumberingSystemPickerComponentViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37 >= 0.0)
        v40 = v37;
      else
        v40 = 0.0;
      objc_msgSend(v38, "setConstant:", v40);

      -[PUINumberingSystemPickerComponentViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setConstant:", fmin(-v37, 0.0));

      self->_configuredViewWidth = v29;
    }
  }

}

- (id)baseContentStringForLocale:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD16F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "setLocale:", v4);

  objc_msgSend(v5, "stringFromNumber:", &unk_25156AEE8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[PUINumberingSystemPickerComponentViewController baseContentStringForLocale:](self, "baseContentStringForLocale:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUINumberingSystemPickerComponentViewController selectedNumberingSystem](self, "selectedNumberingSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  -[PUINumberingSystemPickerComponentViewController font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUINumberingSystem numberingSystemDisplayFontForFont:](PUINumberingSystem, "numberingSystemDisplayFontForFont:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDBCED8];
  v21 = *MEMORY[0x24BDF65F8];
  v22[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PUINumberingSystemTypeRequiresLanguageTagging(v15);

  if (v16)
  {
    objc_msgSend(v9, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PUINumberingTypeSystemLanguageTag(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD0E98]);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v14);

  return v19;
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

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v21 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    -[PUINumberingSystemPickerComponentViewController displayFont](self, "displayFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PUINumberingSystemPickerComponentViewController symbolViews](self, "symbolViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = v6;
      v24 = *(_QWORD *)v27;
      v23 = *MEMORY[0x24BDF65F8];
      v8 = *MEMORY[0x24BDD0E98];
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
          v13 = (void *)MEMORY[0x24BDBCED8];
          v30 = v23;
          v31 = v25;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryWithDictionary:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "attributesAtIndex:effectiveRange:", 0, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && objc_msgSend(v17, "length"))
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v8);
          v18 = objc_alloc(MEMORY[0x24BDD1458]);
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
  void *v4;
  _BOOL4 v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  double v9;

  +[PUINumberingSystem supportedNumberingSystemTypes](PUINumberingSystem, "supportedNumberingSystemTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[PUINumberingSystemPickerComponentViewController isViewLoaded](self, "isViewLoaded") & 1) == 0
    && objc_msgSend(v4, "count"))
  {
    v5 = -[PUINumberingSystemPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
    v6 = 64.0;
    if (v5)
      v6 = 62.0;
    self->_largestItemHeight = v6;
  }
  v7 = objc_msgSend(v4, "count") / 3uLL;
  if (0xAAAAAAAAAAAAAAABLL * objc_msgSend(v4, "count") <= 0x5555555555555555)
    v8 = v7;
  else
    v8 = v7 + 1;
  v9 = (double)(v8 - 1) * 20.0 + (double)v8 * self->_largestItemHeight + 30.0;

  return v9;
}

- (id)displayFont
{
  void *v2;
  void *v3;
  void *v4;

  -[PUINumberingSystemPickerComponentViewController font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "fontWithSize:", 56.0);
  else
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 56.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSLocale)displayLocale
{
  void *v2;
  void *v3;

  -[PUINumberingSystemPickerComponentViewController selectedNumberingSystem](self, "selectedNumberingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v3;
}

- (void)didSelectNumberingSystem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUINumberingSystemPickerComponentViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberingSystemPickerViewController:didSelectNumberingSystem:", self, v4);

}

- (PUINumberingSystem)selectedNumberingSystem
{
  return self->_selectedNumberingSystem;
}

- (void)setSelectedNumberingSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (PUINumberingSystemPickerComponentViewControllerDelegate)delegate
{
  return (PUINumberingSystemPickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (NSDictionary)numberSystemImages
{
  return self->_numberSystemImages;
}

- (void)setNumberSystemImages:(id)a3
{
  objc_storeStrong((id *)&self->_numberSystemImages, a3);
}

- (NSArray)symbolViews
{
  return self->_symbolViews;
}

- (void)setSymbolViews:(id)a3
{
  objc_storeStrong((id *)&self->_symbolViews, a3);
}

- (PUIStylePickerLabeledButton)selectedSymbolView
{
  return self->_selectedSymbolView;
}

- (void)setSelectedSymbolView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSymbolView, a3);
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
  objc_storeStrong((id *)&self->_selectedSymbolView, 0);
  objc_storeStrong((id *)&self->_symbolViews, 0);
  objc_storeStrong((id *)&self->_numberSystemImages, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedNumberingSystem, 0);
}

@end
