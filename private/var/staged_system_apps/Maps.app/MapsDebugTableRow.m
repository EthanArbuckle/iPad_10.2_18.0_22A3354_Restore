@implementation MapsDebugTableRow

- (MapsDebugTableRow)init
{
  MapsDebugTableRow *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableRow;
  result = -[MapsDebugTableRow init](&v3, "init");
  if (result)
    result->_visible = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsDebugTableRow invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableRow;
  -[MapsDebugTableRow dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  -[MapsDebugTableRow setCurrentCell:](self, "setCurrentCell:", 0);
  -[MapsDebugTableRow setSection:](self, "setSection:", 0);
  -[MapsDebugTableRow setSelectionAction:](self, "setSelectionAction:", 0);
}

+ (NSString)reuseIdentifier
{
  return 0;
}

- (void)setCurrentCell:(id)a3
{
  UITableViewCell *v5;
  UITableViewCell *v6;

  v5 = (UITableViewCell *)a3;
  if (self->_currentCell != v5)
  {
    v6 = v5;
    if (!v5)
      -[MapsDebugTableRow _clearAllControlTargetsForReuse](self, "_clearAllControlTargetsForReuse");
    objc_storeStrong((id *)&self->_currentCell, a3);
    v5 = v6;
  }

}

- (void)addControlThatNeedsClearingTargetOnReuse:(id)a3
{
  id v4;
  NSMutableArray *controlsToClearTargetsFromOnReuse;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  controlsToClearTargetsFromOnReuse = self->_controlsToClearTargetsFromOnReuse;
  v8 = v4;
  if (!controlsToClearTargetsFromOnReuse)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_controlsToClearTargetsFromOnReuse;
    self->_controlsToClearTargetsFromOnReuse = v6;

    v4 = v8;
    controlsToClearTargetsFromOnReuse = self->_controlsToClearTargetsFromOnReuse;
  }
  -[NSMutableArray addObject:](controlsToClearTargetsFromOnReuse, "addObject:", v4);

}

- (void)_clearAllControlTargetsForReuse
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_controlsToClearTargetsFromOnReuse;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL, (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_controlsToClearTargetsFromOnReuse, "removeAllObjects");
}

- (id)cellForTableView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v6));

  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", -[MapsDebugTableRow cellStyle](self, "cellStyle"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == (id)5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintGreaterThanOrEqualToConstant:", 34.0));
      objc_msgSend(v10, "addConstraint:", v13);

    }
  }
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("MapsDebugTableViewCell"));
  -[MapsDebugTableRow configureCell:](self, "configureCell:", v7);

  return v7;
}

- (void)configureCell:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow cellContentConfiguration](self, "cellContentConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
  if (v4)
  {
    objc_msgSend(v4, "setText:", v5);

    v6 = -[MapsDebugTableRow deprecated](self, "deprecated");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v7, "length");

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR(" - DEPRECATED (SOON TO BE REMOVED)")));
        objc_msgSend(v4, "setSecondaryText:", v11);

      }
      else
      {
        objc_msgSend(v4, "setSecondaryText:", CFSTR("DEPRECATED (SOON TO BE REMOVED)"));
      }
      v19 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    }
    else
    {
      objc_msgSend(v4, "setSecondaryText:", v7);

      v19 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v22 = (void *)v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextProperties"));
    objc_msgSend(v23, "setColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "textLabel"));
    objc_msgSend(v12, "setText:", v5);

    LODWORD(v12) = -[MapsDebugTableRow deprecated](self, "deprecated");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
    v14 = v13;
    if ((_DWORD)v12)
    {
      v15 = objc_msgSend(v13, "length");

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR(" - DEPRECATED (SOON TO BE REMOVED)")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "detailTextLabel"));
        objc_msgSend(v18, "setText:", v17);

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "detailTextLabel"));
        objc_msgSend(v16, "setText:", CFSTR("DEPRECATED (SOON TO BE REMOVED)"));
      }

      v21 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "detailTextLabel"));
      objc_msgSend(v20, "setText:", v14);

      v21 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v25 = (void *)v21;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "detailTextLabel"));
    objc_msgSend(v26, "setTextColor:", v25);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "textLabel"));
  }
  v27 = v24;
  objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureBlock](self, "configureBlock"));
  if (v28)
  {
    v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureBlock](self, "configureBlock"));
    ((void (**)(_QWORD, id, void *))v29)[2](v29, v32, v4);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "textLabel"));
  objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("TextLabel"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "detailTextLabel"));
  objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("DetailTextLabel"));

  objc_msgSend(v32, "setContentConfiguration:", v4);
}

- (int64_t)cellStyle
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = 3;
  }
  else if (-[MapsDebugTableRow deprecated](self, "deprecated"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (UIListContentConfiguration)cellContentConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
  if (objc_msgSend(v3, "length") || -[MapsDebugTableRow deprecated](self, "deprecated"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v5 = (void *)v4;

  return (UIListContentConfiguration *)v5;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[12];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v18[0] = objc_opt_class(MapsDebugSwitchTableRow);
  v18[1] = objc_opt_class(MapsDebugNavigationTableRow);
  v18[2] = objc_opt_class(MapsDebugActionTableRow);
  v18[3] = objc_opt_class(MapsDebugEmptySectionBannerRow);
  v18[4] = objc_opt_class(MapsDebugSliderTableRow);
  v18[5] = objc_opt_class(MapsDebugTextFieldTableRow);
  v18[6] = objc_opt_class(MapsDebugDateFieldTableRow);
  v18[7] = objc_opt_class(MapsDebugReadOnlyValueRow);
  v18[8] = objc_opt_class(MapsDebugReadOnlySubtitleRow);
  v18[9] = objc_opt_class(MapsDebugCheckmarkRow);
  v18[10] = objc_opt_class(MapsDebugActivityIndicatorRow);
  v18[11] = objc_opt_class(MapsDebugMenuRow);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 12, 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(objc_class **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(MapsDebugCollectionViewCell);
        v11 = NSStringFromClass(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v10, v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)cellForCollectionView:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 != (id)5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 44.0));
    objc_msgSend(v14, "addConstraint:", v17);

  }
  -[MapsDebugTableRow configureCollectionViewCell:](self, "configureCollectionViewCell:", v11);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("MapsDebugCollectionViewCell"));
  objc_msgSend(v11, "layoutIfNeeded");

  return v11;
}

- (void)configureCollectionViewCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureCollectionViewCellBlock](self, "configureCollectionViewCellBlock"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow cellContentConfiguration](self, "cellContentConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
    objc_msgSend(v5, "setText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
    objc_msgSend(v5, "setSecondaryText:", v7);

    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow configureCollectionViewCellBlock](self, "configureCollectionViewCellBlock"));
    ((void (**)(_QWORD, id, void *))v8)[2](v8, v25, v5);

    objc_msgSend(v25, "setContentConfiguration:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentView"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("TextLabel"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentView"));
    objc_msgSend(v11, "setAccessibilityLabel:", v10);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentConfiguration"));

    if (v12)
    {
      objc_msgSend(v25, "setContentConfiguration:", 0);
      objc_msgSend(v25, "setupContentView");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

    LODWORD(v14) = -[MapsDebugTableRow deprecated](self, "deprecated");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
    v16 = v15;
    if ((_DWORD)v14)
    {
      v17 = objc_msgSend(v15, "length");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow subtitle](self, "subtitle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR(" - DEPRECATED (SOON TO BE REMOVED)")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "detailTextLabel"));
        objc_msgSend(v20, "setText:", v19);

      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "detailTextLabel"));
        objc_msgSend(v18, "setText:", CFSTR("DEPRECATED (SOON TO BE REMOVED)"));
      }

      v22 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "detailTextLabel"));
      objc_msgSend(v21, "setText:", v16);

      v22 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v23 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "detailTextLabel"));
    objc_msgSend(v24, "setTextColor:", v23);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "textLabel"));
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  }

}

- (MapsDebugTableSection)section
{
  return (MapsDebugTableSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (void)setSection:(id)a3
{
  objc_storeWeak((id *)&self->_section, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)deprecated
{
  return self->_deprecated;
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (id)prepareContentBlock
{
  return self->_prepareContentBlock;
}

- (void)setPrepareContentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)selectionAction
{
  return self->_selectionAction;
}

- (void)setSelectionAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UITableViewCell)currentCell
{
  return self->_currentCell;
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (void)setConfigureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)configureCollectionViewCellBlock
{
  return self->_configureCollectionViewCellBlock;
}

- (void)setConfigureCollectionViewCellBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UICollectionViewCell)currentCollectionViewCell
{
  return self->_currentCollectionViewCell;
}

- (void)setCurrentCollectionViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_currentCollectionViewCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCollectionViewCell, 0);
  objc_storeStrong(&self->_configureCollectionViewCellBlock, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong((id *)&self->_currentCell, 0);
  objc_storeStrong(&self->_selectionAction, 0);
  objc_storeStrong(&self->_prepareContentBlock, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong((id *)&self->_controlsToClearTargetsFromOnReuse, 0);
}

@end
