@implementation PRXCardBottomTray

- (PRXCardBottomTray)initWithFrame:(CGRect)a3
{
  PRXCardBottomTray *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRXCardBottomTray;
  v3 = -[PRXCardBottomTray initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PRXCardBottomTray setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PRXCardBottomTray"));
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  titleLabel = v3->_titleLabel;
  v3->_titleLabel = v4;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);

  -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

  -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setMaximumContentSizeCategory:](v3->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF76A0]);
  -[PRXCardBottomTray addSubview:](v3, "addSubview:", v3->_titleLabel);
  return v3;
}

- (void)updateConstraints
{
  PRXCardBottomTray *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
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
  id obja;
  id obj;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  PRXCardBottomTray *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[2];
  _BYTE v79[128];
  _QWORD v80[6];

  v2 = self;
  v80[4] = *MEMORY[0x24BDAC8D0];
  -[PRXCardBottomTray activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRXCardBottomTray actionButtons](v2, "actionButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[PRXCardBottomTray title](v2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PRXCardBottomTray titleConstraints](v2, "titleConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v2;
    if (!v7 && v6)
    {
      -[PRXCardBottomTray titleLabel](v2, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[PRXCardBottomTray actionButtons](v2, "actionButtons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "topAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, -8.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bottomAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v11);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[PRXCardBottomTray titleLabel](v2, "titleLabel");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "leadingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v63);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v61;
      -[PRXCardBottomTray titleLabel](v2, "titleLabel");
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "trailingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v15;
      -[PRXCardBottomTray titleLabel](v2, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray topAnchor](v2, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v18, 20.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v80[2] = v19;
      v80[3] = v55;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray setTitleConstraints:](v65, "setTitleConstraints:", v20);

      v2 = v65;
      v21 = (void *)MEMORY[0x24BDD1628];
      -[PRXCardBottomTray titleConstraints](v65, "titleConstraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v22);

    }
    -[PRXCardBottomTray buttonConstraints](v2, "buttonConstraints");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23 && v5)
    {
      -[PRXCardBottomTray actionButtons](v2, "actionButtons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        if (objc_msgSend(v25, "proximityButtonType"))
          v27 = 20.0;
        else
          v27 = 0.0;
        objc_msgSend(v25, "topAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRXCardBottomTray topAnchor](v2, "topAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:constant:", v29, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v30);

      }
      -[PRXCardBottomTray actionButtons](v2, "actionButtons");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 == v32 && objc_msgSend(v25, "proximityButtonType"))
      {
        -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bottomAnchor");
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = 0.0;
      }
      else
      {
        -[PRXCardBottomTray bottomAnchor](v2, "bottomAnchor");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = -10.0;
      }
      v56 = v32;
      objc_msgSend(v32, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v33;
      objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v26;
      objc_msgSend(v26, "addObject:", v37);

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      -[PRXCardBottomTray actionButtons](v2, "actionButtons");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      v58 = v25;
      v38 = 0;
      if (v67)
      {
        v62 = *(_QWORD *)v75;
        do
        {
          v39 = 0;
          v40 = v38;
          do
          {
            v72 = v40;
            if (*(_QWORD *)v75 != v62)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v39);
            objc_msgSend(v41, "leadingAnchor");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "leadingAnchor");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "constraintEqualToAnchor:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v78[0] = v43;
            objc_msgSend(v41, "trailingAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRXCardBottomTray layoutMarginsGuide](v2, "layoutMarginsGuide");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "trailingAnchor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "constraintEqualToAnchor:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v78[1] = v47;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "addObjectsFromArray:", v48);

            if (v72)
            {
              objc_msgSend(v41, "topAnchor");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "bottomAnchor");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, 4.0);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v51);

            }
            v38 = v41;

            ++v39;
            v40 = v38;
            v2 = v65;
          }
          while (v67 != v39);
          v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
        }
        while (v67);
      }

      -[PRXCardBottomTray setButtonConstraints:](v2, "setButtonConstraints:", v64);
      v52 = (void *)MEMORY[0x24BDD1628];
      -[PRXCardBottomTray buttonConstraints](v2, "buttonConstraints");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "activateConstraints:", v53);

    }
  }
  v73.receiver = v2;
  v73.super_class = (Class)PRXCardBottomTray;
  -[PRXCardBottomTray updateConstraints](&v73, sel_updateConstraints);
}

- (void)setActionButtons:(id)a3
{
  NSArray *v4;
  NSArray *actionButtons;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  actionButtons = self->_actionButtons;
  if (actionButtons != v4 && !-[NSArray isEqualToArray:](actionButtons, "isEqualToArray:", v4))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = self->_actionButtons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

    v11 = (NSArray *)-[NSArray copy](v4, "copy");
    v12 = self->_actionButtons;
    self->_actionButtons = v11;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = self->_actionButtons;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v26);
          -[PRXCardBottomTray addSubview:](self, "addSubview:", v18);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v15);
    }

    -[PRXCardBottomTray titleConstraints](self, "titleConstraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDD1628];
      -[PRXCardBottomTray titleConstraints](self, "titleConstraints");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deactivateConstraints:", v21);

      -[PRXCardBottomTray setTitleConstraints:](self, "setTitleConstraints:", 0);
    }
    -[PRXCardBottomTray buttonConstraints](self, "buttonConstraints", (_QWORD)v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDD1628];
      -[PRXCardBottomTray buttonConstraints](self, "buttonConstraints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deactivateConstraints:", v24);

      -[PRXCardBottomTray setButtonConstraints:](self, "setButtonConstraints:", 0);
    }
    -[PRXCardBottomTray setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PRXCardBottomTray delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didChangeContentsOfBottomTray:", self);

  }
}

- (void)setActivityIndicator:(id)a3
{
  UIView *v5;
  id *p_activityIndicator;
  UIView *activityIndicator;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _BOOL8 v23;
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x24BDAC8D0];
  v5 = (UIView *)a3;
  p_activityIndicator = (id *)&self->_activityIndicator;
  activityIndicator = self->_activityIndicator;
  if (activityIndicator != v5)
  {
    -[UIView removeFromSuperview](activityIndicator, "removeFromSuperview");
    objc_storeStrong((id *)&self->_activityIndicator, a3);
    v8 = *p_activityIndicator;
    if (*p_activityIndicator)
    {
      objc_msgSend(*p_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXCardBottomTray addSubview:](self, "addSubview:", *p_activityIndicator);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = 0.0;
      else
        v9 = -14.0;
      objc_msgSend(*p_activityIndicator, "centerXAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray centerXAnchor](self, "centerXAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v36;
      objc_msgSend(*p_activityIndicator, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](self, "layoutMarginsGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:", v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v32;
      objc_msgSend(*p_activityIndicator, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](self, "layoutMarginsGuide");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v28;
      objc_msgSend(*p_activityIndicator, "topAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray topAnchor](self, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 20.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v12;
      objc_msgSend(*p_activityIndicator, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](self, "layoutMarginsGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bottomAnchor");
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:constant:", v16, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44[4] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v15;
      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v27);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[PRXCardBottomTray actionButtons](self, "actionButtons", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "setHidden:", v8 != 0);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v20);
    }
    v23 = v8 != 0;

    -[PRXCardBottomTray titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", v23);

    -[PRXCardBottomTray imageView](self, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", v23);

    -[PRXCardBottomTray setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PRXCardBottomTray delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didChangeContentsOfBottomTray:", self);

  }
}

- (void)setImageView:(id)a3
{
  UIImageView *v5;
  UIImageView *v6;
  id *p_imageView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[5];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v5 = (UIImageView *)a3;
  v6 = v5;
  p_imageView = (id *)&self->_imageView;
  if (self->_imageView != v5)
  {
    -[UIImageView removeFromSuperview](v5, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    v8 = *p_imageView;
    if (*p_imageView)
    {
      objc_msgSend(*p_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXCardBottomTray addSubview:](self, "addSubview:", *p_imageView);
      v25 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(*p_imageView, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray centerXAnchor](self, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v27;
      objc_msgSend(*p_imageView, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray topAnchor](self, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 20.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v10;
      objc_msgSend(*p_imageView, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXCardBottomTray layoutMarginsGuide](self, "layoutMarginsGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v13, -8.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "activateConstraints:", v15);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[PRXCardBottomTray actionButtons](self, "actionButtons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20++), "setHidden:", v8 != 0);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }
    v21 = v8 != 0;

    -[PRXCardBottomTray titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", v21);

    -[PRXCardBottomTray activityIndicator](self, "activityIndicator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", v21);

    -[PRXCardBottomTray delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "didChangeContentsOfBottomTray:", self);

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[PRXCardBottomTray titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  -[PRXCardBottomTray titleConstraints](self, "titleConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD1628];
    -[PRXCardBottomTray titleConstraints](self, "titleConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    -[PRXCardBottomTray setTitleConstraints:](self, "setTitleConstraints:", 0);
  }
  -[PRXCardBottomTray buttonConstraints](self, "buttonConstraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1628];
    -[PRXCardBottomTray buttonConstraints](self, "buttonConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deactivateConstraints:", v13);

    -[PRXCardBottomTray setButtonConstraints:](self, "setButtonConstraints:", 0);
  }
  -[PRXCardBottomTray setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PRXCardBottomTray delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didChangeContentsOfBottomTray:", self);

}

- (BOOL)containsContents
{
  void *v2;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v9;

  -[PRXCardBottomTray title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PRXCardBottomTray title](self, "title");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v5 = 1;
      goto LABEL_9;
    }
  }
  -[PRXCardBottomTray imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[PRXCardBottomTray actionButtons](self, "actionButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      -[PRXCardBottomTray activityIndicator](self, "activityIndicator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9 != 0;

      if (!v4)
        goto LABEL_10;
      goto LABEL_9;
    }

  }
  v5 = 1;
  if (v4)
LABEL_9:

LABEL_10:
  return v5;
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)activityIndicator
{
  return self->_activityIndicator;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (PRXCardBottomTrayDelegate)delegate
{
  return (PRXCardBottomTrayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSArray)titleConstraints
{
  return self->_titleConstraints;
}

- (void)setTitleConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end
