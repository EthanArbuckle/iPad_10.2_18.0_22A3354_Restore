@implementation TTRIDividedGridViewController

+ (id)dividerColor
{
  if (dividerColor_onceToken != -1)
    dispatch_once(&dividerColor_onceToken, &__block_literal_global_3);
  return (id)dividerColor___dividerColor;
}

void __45__TTRIDividedGridViewController_dividerColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dividerColor___dividerColor;
  dividerColor___dividerColor = v0;

}

- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5
{
  id v9;
  id v10;
  TTRIDividedGridViewController *v11;
  TTRIDividedGridViewController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TTRIDividedGridViewController;
  v11 = -[TTRIDividedGridViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_buttonTitles, a4);
    objc_storeStrong((id *)&v12->_cellBackgroundColor, a5);
  }

  return v12;
}

- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 buttonAccessibilityLabels:(id)a5 cellBackgroundColor:(id)a6
{
  id v11;
  TTRIDividedGridViewController *v12;
  TTRIDividedGridViewController *v13;

  v11 = a5;
  v12 = -[TTRIDividedGridViewController initWithType:buttonTitles:cellBackgroundColor:](self, "initWithType:buttonTitles:cellBackgroundColor:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_buttonAccessibilityLabels, a5);

  return v13;
}

- (void)loadView
{
  TTRIDividedGridViewController *v2;
  int64_t type;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  TTRIUIDividedGridViewCell *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  TTRIUIDividedGridViewCell *v20;
  TTRIUIDividedGridViewCell *v21;
  TTRIUIDividedGridViewCell *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
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
  id obj;
  id obja;
  _BOOL4 v83;
  uint64_t v84;
  void *v85;
  TTRIDividedGridViewController *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  const __CFString *v92;
  _QWORD v93[3];

  v2 = self;
  v93[1] = *MEMORY[0x1E0C80C00];
  type = self->_type;
  v4 = 7;
  if (type != 1)
    v4 = 0;
  if (type)
    v5 = v4;
  else
    v5 = 4;
  v78 = (void *)objc_opt_new();
  obj = (id)objc_opt_new();
  v92 = CFSTR("dividerWidth");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "numberWithDouble:", 1.0 / v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  -[TTRIDividedGridViewController buttonTitles](v2, "buttonTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v86 = v2;
  if (v11)
  {
    v79 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = v14 + 1;
      v80 = v12;
      if ((v14 + 1) % v5)
      {
        -[TTRIDividedGridViewController buttonTitles](v2, "buttonTitles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v14 == objc_msgSend(v16, "count") - 1;

      }
      else
      {
        v83 = 1;
      }
      v17 = v14 % v5;
      if (!(v14 % v5))
      {
        v18 = objc_opt_new();

        v19 = objc_opt_new();
        objc_msgSend(obj, "addObject:", v18);
        v79 = (void *)v18;
        v80 = (void *)v19;
      }
      v20 = [TTRIUIDividedGridViewCell alloc];
      v21 = v20;
      if (v2->_cellBackgroundColor)
      {
        v22 = -[TTRIUIDividedGridViewCell initWithBackgroundColor:](v20, "initWithBackgroundColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[TTRIUIDividedGridViewCell initWithBackgroundColor:](v21, "initWithBackgroundColor:", v23);

      }
      -[TTRIUIDividedGridViewCell setViewController:](v22, "setViewController:", v2);
      -[TTRIUIDividedGridViewCell setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TTRIDividedGridViewController buttonTitles](v2, "buttonTitles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIUIDividedGridViewCell label](v22, "label");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

      v2 = v86;
      -[TTRIDividedGridViewController buttonAccessibilityLabels](v86, "buttonAccessibilityLabels");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count") <= v14)
        -[TTRIDividedGridViewController buttonTitles](v86, "buttonTitles");
      else
        -[TTRIDividedGridViewController buttonAccessibilityLabels](v86, "buttonAccessibilityLabels");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIUIDividedGridViewCell setAccessibilityLabel:](v22, "setAccessibilityLabel:", v29);

      objc_msgSend(v78, "addObject:", v22);
      objc_msgSend(v79, "addSubview:", v22);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 8, 0, v79, 8, 1.0, 0.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addObject:", v30);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 3, 0, v79, 3, 1.0, 0.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addObject:", v31);

      v32 = -[TTRIDividedGridViewController _newDividerView](v86, "_newDividerView");
      objc_msgSend(v79, "addSubview:", v32);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 8, 0, v79, 8, 1.0, 0.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addObject:", v33);

      -[TTRIDividedGridViewController _defaultButtonWidthForButtonAtIndex:](v86, "_defaultButtonWidthForButtonAtIndex:", v17);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 7, 0, 0, 0, 1.0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIUIDividedGridViewCell setWidthConstraint:](v22, "setWidthConstraint:", v35);

      -[TTRIUIDividedGridViewCell widthConstraint](v22, "widthConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TTRIUIDividedGridViewCell addConstraint:](v22, "addConstraint:", v36);

      v37 = (void *)MEMORY[0x1E0CB3718];
      if (v17)
      {
        _NSDictionaryOfVariableBindings(CFSTR("previousButton, dividerView, buttonView"), v13, v32, v22, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v40 = CFSTR("H:[previousButton][dividerView(==dividerWidth)][buttonView]");
      }
      else
      {
        _NSDictionaryOfVariableBindings(CFSTR("dividerView, buttonView"), v32, v22, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v40 = CFSTR("H:|[dividerView(==dividerWidth)][buttonView]");
      }
      objc_msgSend(v39, "constraintsWithVisualFormat:options:metrics:views:", v40, 1024, v85, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v80;
      objc_msgSend(v80, "addObjectsFromArray:", v41);

      if (v83)
      {
        v42 = -[TTRIDividedGridViewController _newDividerView](v86, "_newDividerView");
        objc_msgSend(v79, "addSubview:", v42);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, 8, 0, v79, 8, 1.0, 0.0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v43);

        v44 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("buttonView, endOfWeekDivider"), v22, v42, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[buttonView][endOfWeekDivider(==dividerWidth)]|"), 1024, v85, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObjectsFromArray:", v46);

        v2 = v86;
      }
      objc_msgSend(v79, "buttonViews");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v22);

      objc_msgSend(v79, "addConstraints:", v80);
      -[TTRIDividedGridViewController buttonTitles](v2, "buttonTitles");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "count");

      v13 = v22;
      v14 = v15;
    }
    while (v15 < v49);

  }
  else
  {
    v79 = 0;
    v80 = 0;
  }
  v50 = (void *)objc_opt_new();
  objc_msgSend(v50, "setViewController:", v2);
  v51 = (void *)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obja = obj;
  v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
  if (v52)
  {
    v53 = v52;
    v54 = 0;
    v84 = *(_QWORD *)v88;
    do
    {
      v55 = 0;
      v56 = v54;
      do
      {
        if (*(_QWORD *)v88 != v84)
          objc_enumerationMutation(obja);
        v57 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v55);
        v54 = -[TTRIDividedGridViewController _newDividerView](v86, "_newDividerView");
        objc_msgSend(v50, "addSubview:", v54);
        objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 8, 0, 0, 0, 1.0, 43.5);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setHeightConstraint:", v58);

        objc_msgSend(v57, "heightConstraint");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addConstraint:", v59);

        objc_msgSend(v50, "addSubview:", v57);
        v60 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("weekView"), v57, 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[weekView]"), 0, 0, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObjectsFromArray:", v62);

        v63 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("bottomDividerView"), v54, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[bottomDividerView]"), 0, 0, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObjectsFromArray:", v65);

        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 7, 1, v57, 7, 1.0, 0.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v66);

        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 7, 0, v57, 7, 1.0, 0.0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v67);

        v68 = (void *)MEMORY[0x1E0CB3718];
        _NSDictionaryOfVariableBindings(CFSTR("bottomDividerView, weekView"), v54, v57, 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[weekView][bottomDividerView(==dividerWidth)]"), 0, v85, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObjectsFromArray:", v70);

        if (v56)
        {
          v71 = (void *)MEMORY[0x1E0CB3718];
          _NSDictionaryOfVariableBindings(CFSTR("previousView, weekView"), v56, v57, 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[previousView][weekView]"), 0, 0, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObjectsFromArray:", v73);

        }
        ++v55;
        v56 = v54;
      }
      while (v53 != v55);
      v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    }
    while (v53);
  }
  else
  {
    v54 = 0;
  }

  v74 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(obja, "objectAtIndexedSubscript:", 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 3, 0, v75, 3, 1.0, 0.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObject:", v76);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 4, 0, v54, 4, 1.0, 0.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObject:", v77);

  objc_msgSend(v50, "addConstraints:", v51);
  -[TTRIDividedGridViewController setView:](v86, "setView:", v50);
  -[TTRIDividedGridViewController setAllCells:](v86, "setAllCells:", v78);
  -[TTRIDividedGridViewController setWeekViews:](v86, "setWeekViews:", obja);

}

- (id)_newDividerView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[TTRIDividedGridViewController dividerColor](TTRIDividedGridViewController, "dividerColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (double)_defaultButtonWidthForButtonAtIndex:(int64_t)a3
{
  int64_t type;
  double result;
  BOOL v5;
  double v6;

  type = self->_type;
  if (type == 1)
  {
    if (a3)
      v5 = a3 == 6;
    else
      v5 = 1;
    result = 45.0;
    v6 = 46.0;
  }
  else
  {
    if (type)
      return result;
    result = 80.0;
    if (a3 == 3)
      result = 79.0;
    v5 = a3 == 0;
    v6 = 79.5;
  }
  if (v5)
    return v6;
  return result;
}

- (void)cellTapped:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TTRIDividedGridViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRIDividedGridViewController allCells](self, "allCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dividedGridViewController:didSelectCell:atIndex:", self, v4, objc_msgSend(v5, "indexOfObject:", v4));

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  int64_t type;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[TTRIDividedGridViewController preferredWidth](self, "preferredWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  type = self->_type;
  if (type == 1)
  {
    v4 = v4 + v7 * -6.0;
    v9 = 7.0;
  }
  else if (type)
  {
    v9 = 0.0;
  }
  else
  {
    v4 = v4 + v7 * -3.0;
    v9 = 4.0;
  }
  CalFloorToScreenScale();
  v11 = v10;
  CalCeilToScreenScale();
  v13 = v12;
  v14 = (void *)objc_opt_new();
  if (v9 > 0.0)
  {
    v15 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

      v17 = (double)v15++;
    }
    while (v9 > v17);
  }
  objc_msgSend(v14, "valueForKeyPath:", CFSTR("@sum.self"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v20 < v4)
  {
    v21 = 0;
    v22 = 0;
    v23 = (uint64_t)(v9 + -1.0);
    do
    {
      if (v9 <= (double)v22 || v23 < 1 || v22 >= v23)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v21 & 1) != 0)
      {
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v26, v22);

        ++v22;
      }
      else
      {
        objc_msgSend(v14, "setObject:atIndexedSubscript:", v26, v23);

        --v23;
      }
      v21 ^= 1u;
      objc_msgSend(v14, "valueForKeyPath:", CFSTR("@sum.self"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v29 = v28;

    }
    while (v29 < v4);
  }
  -[TTRIDividedGridViewController _rowHeightForWidth:](self, "_rowHeightForWidth:", v13);
  v31 = v30;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[TTRIDividedGridViewController weekViews](self, "weekViews", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v37, "buttonViews");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {
          v40 = 0;
          do
          {
            objc_msgSend(v37, "buttonViews");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectAtIndexedSubscript:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "objectAtIndexedSubscript:", v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "doubleValue");
            v45 = v44;
            objc_msgSend(v42, "widthConstraint");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setConstant:", v45);

            ++v40;
            objc_msgSend(v37, "buttonViews");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "count");

          }
          while (v48 > v40);
        }
        objc_msgSend(v37, "heightConstraint");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setConstant:", v31);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v34);
  }

}

- (void)viewDidLayoutSubviews
{
  id v3;

  -[TTRIDividedGridViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dividedGridViewControllerDidLayout:", self);

}

- (double)_neededHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[TTRIDividedGridViewController weekViews](self, "weekViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (double)v4;
    -[TTRIDividedGridViewController weekViews](self, "weekViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constant");
    v10 = v9;
    v11 = (double)(v4 + 1);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = 1.0 / v13 * v11 + v5 * v10;

  }
  else
  {
    -[TTRIDividedGridViewController preferredWidth](self, "preferredWidth");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v14 = v16 + 1.0 / v17 * 2.0;
  }

  return v14;
}

- (double)_rowHeightForWidth:(double)a3
{
  double result;

  CalRoundToScreenScale();
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[TTRIDividedGridViewController preferredWidth](self, "preferredWidth");
  v4 = v3;
  -[TTRIDividedGridViewController _neededHeight](self, "_neededHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  void *v4;
  id v5;

  if (self->_preferredWidth != a3)
  {
    self->_preferredWidth = a3;
    -[TTRIDividedGridViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[TTRIDividedGridViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateIntrinsicContentSize");

  }
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (NSArray)buttonTitles
{
  return self->_buttonTitles;
}

- (void)setButtonTitles:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitles, a3);
}

- (NSArray)buttonAccessibilityLabels
{
  return (NSArray *)objc_getProperty(self, a2, 1000, 1);
}

- (NSArray)allCells
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setAllCells:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (TTRIDividedGridViewControllerDelegate)delegate
{
  return (TTRIDividedGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)weekViews
{
  return (NSArray *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setWeekViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allCells, 0);
  objc_storeStrong((id *)&self->_buttonAccessibilityLabels, 0);
  objc_storeStrong((id *)&self->_buttonTitles, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
}

@end
