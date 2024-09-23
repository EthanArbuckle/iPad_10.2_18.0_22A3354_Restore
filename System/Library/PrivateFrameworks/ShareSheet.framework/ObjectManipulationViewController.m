@implementation ObjectManipulationViewController

- (ObjectManipulationViewController)initWithCustomizationGroups:(id)a3
{
  id v4;
  ObjectManipulationViewController *v5;
  ObjectManipulationViewController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  ObjectManipulationViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ObjectManipulationViewController;
  v5 = -[ObjectManipulationViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v21 = v4;
    -[ObjectManipulationViewController setCustomizationGroups:](v5, "setCustomizationGroups:", v4);
    v7 = (void *)objc_opt_new();
    -[ObjectManipulationViewController setSectionHeaders:](v6, "setSectionHeaders:", v7);

    v23 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[ObjectManipulationViewController customizationGroups](v6, "customizationGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ObjectManipulationViewController sectionHeaders](v6, "sectionHeaders");
          v14 = v6;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "customizations");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v18);

          v6 = v14;
          objc_msgSend(v12, "customizations");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObjectsFromArray:", v19);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    -[ObjectManipulationViewController setCustomizations:](v6, "setCustomizations:", v23);
    v4 = v21;
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)ObjectManipulationViewController;
  -[ObjectManipulationViewController viewDidLoad](&v75, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  -[ObjectManipulationViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setManualScrollEdgeAppearanceEnabled:", 1);

  v6 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v6, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowColor:", v7);

  -[ObjectManipulationViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEdgeAppearance:", v6);

  v9 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v9, "configureWithDefaultBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowColor:", v10);

  -[ObjectManipulationViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStandardAppearance:", v9);

  -[ObjectManipulationViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setManualScrollEdgeAppearanceProgress:", 1.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v17);
    -[ObjectManipulationViewController setBackgroundView:](self, "setBackgroundView:", v18);
    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ObjectManipulationViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

  }
  v22 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[ObjectManipulationViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v24 = (void *)objc_msgSend(v22, "initWithFrame:style:", 2);
  -[ObjectManipulationViewController setTableView:](self, "setTableView:", v24);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", 0);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDelegate:", self);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDataSource:", self);

  -[ObjectManipulationViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("textFieldCell"));

  v32 = (void *)objc_opt_new();
  -[ObjectManipulationViewController backgroundView](self, "backgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectManipulationViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v38);

    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectManipulationViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v43);

    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectManipulationViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v48);

    -[ObjectManipulationViewController backgroundView](self, "backgroundView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectManipulationViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v53);

  }
  -[ObjectManipulationViewController tableView](self, "tableView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v58);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController view](self, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "heightAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v63);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerYAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v68);

  -[ObjectManipulationViewController tableView](self, "tableView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "centerXAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectManipulationViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v73);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  -[ObjectManipulationViewController tableView](self, "tableView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  -[ObjectManipulationViewController customizations](self, "customizations", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return v5 + 1;
  else
    return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 && v6)
    return 1;
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a4 - (v8 != 0);

  -[ObjectManipulationViewController customizations](self, "customizations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "_optionTitles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "count");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        return isKindOfClass & 1;
      }
    }
    v7 = 1;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  double v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 || (v7 = 0.0, !v6))
  {
    -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a4 - (v8 != 0);

    -[ObjectManipulationViewController customizations](self, "customizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ObjectManipulationViewController sectionHeaders](self, "sectionHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v7 = *MEMORY[0x1E0DC53D8];
    else
      v7 = 0.0;

  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a4 - (v6 != 0);

  if ((v7 & 0x8000000000000000) != 0
    || (-[ObjectManipulationViewController customizations](self, "customizations"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 >= v9))
  {
    v14 = 0;
  }
  else
  {
    -[ObjectManipulationViewController customizations](self, "customizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ObjectManipulationViewController sectionHeaders](self, "sectionHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 || !v6)
  {
    -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a4 - (v8 != 0);

    -[ObjectManipulationViewController customizations](self, "customizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "footerText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;

  v5 = a4;
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 && (v7 = (void *)v6, v8 = objc_msgSend(v5, "section"), v7, !v8))
    v9 = 350.0;
  else
    v9 = *MEMORY[0x1E0DC53D8];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
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

  v6 = a3;
  v7 = a4;
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(v7, "section");

    if (!v10)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("customCell"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("customCell"));
      -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bounds");
      objc_msgSend(v23, "setFrame:");
      objc_msgSend(v23, "setAutoresizingMask:", 18);
      objc_msgSend(v35, "subviews");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "makeObjectsPerformSelector:", sel_removeFromSuperview);

      objc_msgSend(v35, "addSubview:", v23);
      goto LABEL_25;
    }
  }
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "section") - (v11 != 0);

  -[ObjectManipulationViewController customizations](self, "customizations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("switchCell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("switchCell"));
      objc_msgSend(v15, "setSelectionStyle:", 0);
      v16 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
      objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_didToggleSwitch_, 4096);
      objc_msgSend(v15, "setAccessoryView:", v16);

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v19);

    objc_msgSend(v14, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    objc_msgSend(v15, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 0);

    objc_msgSend(v15, "accessoryView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOn:", objc_msgSend(v14, "value"));
    objc_msgSend(v23, "setEnabled:", objc_msgSend(v14, "enabled"));
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v14;
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("pickerCell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("pickerCell"));
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v24);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v26);

    objc_msgSend(v14, "_optionTitles");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    objc_msgSend(v15, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setNumberOfLines:", 0);

    v31 = objc_msgSend(v7, "row");
    v32 = objc_msgSend(v14, "selectedOptionIndex");

    if (v31 == v32)
      v33 = 3;
    else
      v33 = 0;
    v34 = v15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("customCell"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("customCell"));
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setBackgroundColor:", v50);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v52);

      objc_msgSend(v14, "title");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setText:", v53);

      objc_msgSend(v15, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNumberOfLines:", 0);
      goto LABEL_25;
    }
    v14 = v14;
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("textFieldCell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      v38 = objc_alloc(MEMORY[0x1E0DC3DB8]);
      v39 = (void *)objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setFont:", v40);

      objc_msgSend(v39, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(v39, "setAdjustsFontSizeToFitWidth:", 1);
      objc_msgSend(v39, "setClearButtonMode:", 1);
      objc_msgSend(v15, "setTextField:", v39);

    }
    objc_msgSend(v15, "textField");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDelegate:", self);

    objc_msgSend(v14, "text");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textField");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    objc_msgSend(v14, "placeholder");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "textField");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setPlaceholder:", v44);

    objc_msgSend(v15, "textField");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setReturnKeyType:", 9);

    objc_msgSend(v15, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setBackgroundColor:", v47);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v49);

    v34 = v15;
    v33 = 0;
  }
  objc_msgSend(v34, "setAccessoryType:", v33);
LABEL_26:

  return v15;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8 || (v9 = (void *)v8, v10 = objc_msgSend(v7, "section"), v9, v10))
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "section") - (v11 != 0);

    -[ObjectManipulationViewController customizations](self, "customizations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "_setSelectedOptionIndex:", objc_msgSend(v7, "row"));
          -[ObjectManipulationViewController _reloadCustomizations](self, "_reloadCustomizations");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v15, "_handler");
            v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __70__ObjectManipulationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
            v17[3] = &unk_1E4001608;
            v17[4] = self;
            ((void (**)(_QWORD, id, _QWORD *))v16)[2](v16, v15, v17);

          }
        }
      }
    }

  }
}

uint64_t __70__ObjectManipulationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadCustomizations");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = objc_msgSend(v5, "section") != 0;
  else
    v7 = 1;

  return v7;
}

- (void)didToggleSwitch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v7 = v6;
  v9 = v8;

  -[ObjectManipulationViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  -[ObjectManipulationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexPathForRowAtPoint:", v12, v14);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v20, "section") - (v16 != 0);

  -[ObjectManipulationViewController customizations](self, "customizations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "_setValue:", objc_msgSend(v19, "value") ^ 1);
  -[ObjectManipulationViewController _reloadCustomizations](self, "_reloadCustomizations");

}

- (void)_reloadCustomizations
{
  id v3;

  -[ObjectManipulationViewController refreshDelegate](self, "refreshDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestRefreshedCustomizationGroupForObjectManipulationViewController:", self);

}

- (void)updateWithCustomizationGroups:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ObjectManipulationViewController *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ObjectManipulationViewController customizationGroups](self, "customizationGroups");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v20 = v4;
    -[ObjectManipulationViewController setCustomizationGroups:](self, "setCustomizationGroups:", v4);
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = self;
    -[ObjectManipulationViewController customizationGroups](self, "customizationGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "customizations");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v16);

          objc_msgSend(v12, "customizations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v17);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    -[ObjectManipulationViewController setCustomizations:](v19, "setCustomizations:", v7);
    -[ObjectManipulationViewController setSectionHeaders:](v19, "setSectionHeaders:", v6);
    -[ObjectManipulationViewController tableView](v19, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

    v4 = v20;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v15 = a3;
  -[ObjectManipulationViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15)
  {
LABEL_7:

    goto LABEL_8;
  }
  v5 = dyld_program_sdk_at_least();

  if (v5)
  {
    -[ObjectManipulationViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;

    objc_msgSend(v15, "contentOffset");
    if (v10 <= -v9)
    {
      -[ObjectManipulationViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = 0.0;
    }
    else
    {
      objc_msgSend(v15, "contentOffset");
      v12 = fmin((v9 + v11) * 10.0, 100.0) / 100.0;
      -[ObjectManipulationViewController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = v12;
    }
    objc_msgSend(v13, "_setManualScrollEdgeAppearanceProgress:", v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "center");
  v6 = v5;
  v8 = v7;
  -[ObjectManipulationViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v9, v6, v8);
  v11 = v10;
  v13 = v12;

  -[ObjectManipulationViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForRowAtPoint:", v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ObjectManipulationViewController itemPreviewViewController](self, "itemPreviewViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "section") - (v16 != 0);

  -[ObjectManipulationViewController customizations](self, "customizations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setText:", v20);

  -[ObjectManipulationViewController _reloadCustomizations](self, "_reloadCustomizations");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)dismissKeyboard:(id)a3
{
  id v3;

  -[ObjectManipulationViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIKeyboardBoundsUserInfoKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v7 = v6;

    -[UITableView setContentInset:](self->_tableView, "setContentInset:", 0.0, 0.0, v7, 0.0);
    v4 = v8;
  }

}

- (void)keyboardWillHide:(id)a3
{
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", a3, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (ObjectManipulationDelegate)refreshDelegate
{
  return (ObjectManipulationDelegate *)objc_loadWeakRetained((id *)&self->_refreshDelegate);
}

- (void)setRefreshDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_refreshDelegate, a3);
}

- (UIViewController)itemPreviewViewController
{
  return self->_itemPreviewViewController;
}

- (void)setItemPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_itemPreviewViewController, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_customizationGroups, a3);
}

- (NSArray)customizations
{
  return self->_customizations;
}

- (void)setCustomizations:(id)a3
{
  objc_storeStrong((id *)&self->_customizations, a3);
}

- (NSMutableDictionary)sectionHeaders
{
  return self->_sectionHeaders;
}

- (void)setSectionHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaders, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_customizations, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_itemPreviewViewController, 0);
  objc_destroyWeak((id *)&self->_refreshDelegate);
}

@end
