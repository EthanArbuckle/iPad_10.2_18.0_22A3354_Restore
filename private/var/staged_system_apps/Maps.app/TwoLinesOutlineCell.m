@implementation TwoLinesOutlineCell

- (TwoLinesOutlineCell)initWithFrame:(CGRect)a3
{
  TwoLinesOutlineCell *v3;
  TwoLinesContentView *v4;
  TwoLinesContentView *twoLinesContentView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    twoLinesContentView = v3->_twoLinesContentView;
    v3->_twoLinesContentView = v4;

    -[TwoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_twoLinesContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_twoLinesContentView);

    -[TwoLinesOutlineCell _invalidateConstraints](v3, "_invalidateConstraints");
  }
  return v3;
}

- (void)_updateConstraints
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
  double v13;
  void *v14;
  NSArray *v15;
  NSArray *constraints;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  uint64_t v24;
  double v25;
  NSArray *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
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
  _QWORD v51[4];
  _QWORD v52[7];

  if (!self->_constraints)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView superview](self->_actionView, "superview"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](self->_twoLinesContentView, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
    v47 = v4;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:"));
    if (v3)
    {
      v52[0] = v50;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self->_twoLinesContentView, "leadingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layoutMarginsGuide"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:"));
      v52[1] = v48;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_twoLinesContentView, "trailingAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layoutMarginsGuide"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
      v46 = v5;
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v39));
      v52[2] = v27;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView topAnchor](self->_actionView, "topAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self->_twoLinesContentView, "bottomAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v6, 7.0));
      v52[3] = v41;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView leadingAnchor](self->_actionView, "leadingAnchor"));
      v35 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray layoutMarginsGuide](v35, "layoutMarginsGuide"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
      v40 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v33, 32.0));
      v52[4] = v31;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView trailingAnchor](self->_actionView, "trailingAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layoutMarginsGuide"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v8));
      v52[5] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView bottomAnchor](self->_actionView, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
      LODWORD(v13) = 1112276992;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:priority:", v12, -7.0, v13));
      v52[6] = v14;
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 7));
      constraints = self->_constraints;
      self->_constraints = v15;

      v17 = (void *)v27;
      v18 = v32;

      v19 = v38;
      v20 = v37;

      v21 = v36;
      v22 = v35;
    }
    else
    {
      v51[0] = v50;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self->_twoLinesContentView, "leadingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutMarginsGuide"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:"));
      v51[1] = v48;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_twoLinesContentView, "trailingAnchor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layoutMarginsGuide"));
      v46 = v23;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v39));
      v51[2] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self->_twoLinesContentView, "bottomAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      LODWORD(v25) = 1112276992;
      v41 = (void *)v24;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:priority:", 0.0, v25));
      v51[3] = v40;
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
      v22 = self->_constraints;
      self->_constraints = v26;
    }

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
  }
}

- (void)_invalidateConstraints
{
  NSArray *constraints;

  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;

  }
  -[TwoLinesOutlineCell _updateConstraints](self, "_updateConstraints");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TwoLinesOutlineCell;
  v5 = -[TwoLinesOutlineCell preferredLayoutAttributesFittingAttributes:](&v12, "preferredLayoutAttributesFittingAttributes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView superview](self->_actionView, "superview"));

  if (v7)
  {
    objc_msgSend(v6, "frame");
    -[TwoLinesOutlineCell setFrame:](self, "setFrame:");
    -[TwoLinesOutlineCell layoutIfNeeded](self, "layoutIfNeeded");
    v11.receiver = self;
    v11.super_class = (Class)TwoLinesOutlineCell;
    v8 = -[TwoLinesOutlineCell preferredLayoutAttributesFittingAttributes:](&v11, "preferredLayoutAttributesFittingAttributes:", v4);
    v9 = objc_claimAutoreleasedReturnValue(v8);

    v6 = (void *)v9;
  }

  return v6;
}

- (void)setHovering:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TwoLinesOutlineCell;
  -[SidebarOutlineCell setHovering:](&v4, "setHovering:", a3);
  -[TwoLinesOutlineCell _updateAccessoryVisibility](self, "_updateAccessoryVisibility");
}

- (void)setUseLightForegroundColors:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TwoLinesOutlineCell;
  -[SidebarOutlineCell setUseLightForegroundColors:](&v4, "setUseLightForegroundColors:", a3);
  -[TwoLinesOutlineCell _updateTextColors](self, "_updateTextColors");
}

- (void)setCellModel:(id)a3
{
  TwoLinesOutlineCellModel *v5;
  TwoLinesOutlineCellModel *v6;
  unsigned __int8 v7;
  TwoLinesOutlineCellModel *v8;

  v5 = (TwoLinesOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[TwoLinesOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[TwoLinesOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel backgroundModel](self->_cellModel, "backgroundModel"));
  -[SidebarOutlineCell setBackgroundModel:](self, "setBackgroundModel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel contentModel](self->_cellModel, "contentModel"));
  -[TwoLinesContentView setViewModel:](self->_twoLinesContentView, "setViewModel:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell axSectionIdentifier](self, "axSectionIdentifier"));
  if (objc_msgSend(v5, "length"))
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell axSectionIdentifier](self, "axSectionIdentifier"));
  else
    v6 = &stru_1011EB268;
  v12 = (__CFString *)v6;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self->_twoLinesContentView, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "axIdentifier"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self->_twoLinesContentView, "viewModel"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "axIdentifier"));

  }
  else
  {
    v10 = CFSTR("TwoLinesOutlineCell");
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v10));
  -[TwoLinesOutlineCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v11);

  -[TwoLinesOutlineCell _updateAccessoryFromModel](self, "_updateAccessoryFromModel");
  -[TwoLinesOutlineCell _updateActionViewFromModel](self, "_updateActionViewFromModel");
  -[TwoLinesOutlineCell _updateTextColors](self, "_updateTextColors");

}

- (void)_updateTextColors
{
  -[TwoLinesContentView setIsParentCellSelected:](self->_twoLinesContentView, "setIsParentCellSelected:", -[SidebarOutlineCell useLightForegroundColors](self, "useLightForegroundColors"));
  -[TwoLinesOutlineCell _updateAccessoryVisibility](self, "_updateAccessoryVisibility");
}

- (void)_updateAccessoryFromModel
{
  NSArray *v3;
  unsigned __int8 v4;
  NSArray *v5;
  NSArray *accessoryModels;
  NSArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSArray *accessoryConfigurations;
  NSArray *obj;
  NSArray *obja;
  _QWORD v17[5];
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  obj = self->_accessoryModels;
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel accessoryModels](self->_cellModel, "accessoryModels"));
  if (obj == v3)
  {

  }
  else
  {
    v4 = -[NSArray isEqual:](obj, "isEqual:", v3);

    if ((v4 & 1) == 0)
    {
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel accessoryModels](self->_cellModel, "accessoryModels"));
      accessoryModels = self->_accessoryModels;
      self->_accessoryModels = v5;

      v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      obja = self->_accessoryModels;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(obja);
            v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            objc_initWeak(&location, self);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_10077BDA0;
            v17[3] = &unk_1011ACEC0;
            objc_copyWeak(&v18, &location);
            v17[4] = v11;
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createAccessoryConfigurationWithAction:", v12));

            -[NSArray addObject:](v7, "addObject:", v13);
            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v8);
      }

      accessoryConfigurations = self->_accessoryConfigurations;
      self->_accessoryConfigurations = v7;

      -[TwoLinesOutlineCell _updateAccessoryVisibility](self, "_updateAccessoryVisibility");
      -[TwoLinesOutlineCell _updateDisclosureAccessoryInteraction](self, "_updateDisclosureAccessoryInteraction");
    }
  }
}

- (void)_updateAccessoryVisibility
{
  id v3;
  NSArray *accessoryModels;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = objc_alloc_init((Class)NSMutableArray);
  accessoryModels = self->_accessoryModels;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10077BEA8;
  v6[3] = &unk_1011C6208;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](accessoryModels, "enumerateObjectsUsingBlock:", v6);
  -[TwoLinesOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v5);

}

- (void)_updateDisclosureAccessoryInteraction
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  UITapGestureRecognizer *doubleTapGestureRecognizer;
  uint64_t v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_accessoryModels;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(TwoLineOutlineCellButtonAccessoryModel);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && objc_msgSend(v8, "accessoryType", (_QWORD)v14) == (id)2)
        {

          doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
          if (!doubleTapGestureRecognizer)
          {
            v12 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_toggleDisclosureAccessory:");
            v13 = self->_doubleTapGestureRecognizer;
            self->_doubleTapGestureRecognizer = v12;

            -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
            -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_doubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
            -[TwoLinesOutlineCell addGestureRecognizer:](self, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
            doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
          }
          v11 = 1;
          goto LABEL_14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }

  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  v11 = 0;
LABEL_14:
  -[UITapGestureRecognizer setEnabled:](doubleTapGestureRecognizer, "setEnabled:", v11, (_QWORD)v14);
}

- (void)_toggleDisclosureAccessory:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_accessoryModels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "accessoryType", (_QWORD)v12) == (id)2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
          objc_msgSend(v11, "twoLinesOutlineCell:accessoryViewTapped:accessoryModel:", self, v4, v10);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_accessoryButtonTapped:(id)a3 accessoryModel:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  objc_msgSend(v8, "twoLinesOutlineCell:accessoryViewTapped:accessoryModel:", self, v7, v6);

}

- (void)_updateActionViewFromModel
{
  void *v3;
  TwoLinesOutlineCellActionView *actionView;
  TwoLinesOutlineCellActionView *v5;
  TwoLinesOutlineCellActionView *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel actionModel](self->_cellModel, "actionModel"));

  actionView = self->_actionView;
  if (v3)
  {
    if (!actionView)
    {
      v5 = -[TwoLinesOutlineCellActionView initWithFrame:twoLinesOutlineCell:]([TwoLinesOutlineCellActionView alloc], "initWithFrame:twoLinesOutlineCell:", self, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v6 = self->_actionView;
      self->_actionView = v5;

      -[TwoLinesOutlineCellActionView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      actionView = self->_actionView;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView superview](actionView, "superview"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCell contentView](self, "contentView"));
      objc_msgSend(v8, "addSubview:", self->_actionView);

      -[TwoLinesOutlineCell _invalidateConstraints](self, "_invalidateConstraints");
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellModel actionModel](self->_cellModel, "actionModel"));
    -[TwoLinesOutlineCellActionView setViewModel:](self->_actionView, "setViewModel:", v10);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionView superview](actionView, "superview"));

    if (v9)
    {
      -[TwoLinesOutlineCellActionView removeFromSuperview](self->_actionView, "removeFromSuperview");
      -[TwoLinesOutlineCell _invalidateConstraints](self, "_invalidateConstraints");
    }
  }
}

- (TwoLinesOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_accessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);
  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end
