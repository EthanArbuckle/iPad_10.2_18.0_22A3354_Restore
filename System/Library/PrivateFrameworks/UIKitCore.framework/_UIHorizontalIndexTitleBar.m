@implementation _UIHorizontalIndexTitleBar

- (_UIHorizontalIndexTitleBar)init
{
  _UIHorizontalIndexTitleBar *v2;
  _UIHorizontalIndexTitleBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIHorizontalIndexTitleBar;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIHorizontalIndexTitleBar commonInit](v2, "commonInit");
  return v3;
}

- (void)commonInit
{
  UICollectionViewCompositionalLayout *v3;
  UICollectionViewCompositionalLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UICollectionView *v9;
  void *v10;
  UICollectionView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIFocusGuide *v20;
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
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UICollectionViewCompositionalLayoutConfiguration *v46;
  _QWORD v47[5];
  void *v48;
  _QWORD v49[4];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  -[_UIHorizontalIndexTitleBar setEntries:](self, "setEntries:", MEMORY[0x1E0C9AA60]);
  v46 = objc_alloc_init(UICollectionViewCompositionalLayoutConfiguration);
  -[UICollectionViewCompositionalLayoutConfiguration setScrollDirection:](v46, "setScrollDirection:", 1);
  v3 = [UICollectionViewCompositionalLayout alloc];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __40___UIHorizontalIndexTitleBar_commonInit__block_invoke;
  v47[3] = &unk_1E16C41F0;
  v47[4] = self;
  v4 = -[UICollectionViewCompositionalLayout initWithSectionProvider:configuration:](v3, "initWithSectionProvider:configuration:", v47, v46);
  -[_UIHorizontalIndexTitleBar setLayout:](self, "setLayout:", v4);

  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v9 = [UICollectionView alloc];
  -[_UIHorizontalIndexTitleBar layout](self, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UICollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v10, 0.0, 0.0, v6, v8);
  -[_UIHorizontalIndexTitleBar setCollectionView:](self, "setCollectionView:", v11);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_UIHorizontalIndexTitleBarCell"));

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataSource:", self);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsSelection:", 1);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setSafeAreaInsetsFrozen:", 1);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v17);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAutoresizingMask:", 18);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  v20 = objc_alloc_init(UIFocusGuide);
  -[_UIHorizontalIndexTitleBar setHorizontalIndexTitleBarFocusGuide:](self, "setHorizontalIndexTitleBarFocusGuide:", v20);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPreferredFocusEnvironments:", v22);

  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addLayoutGuide:](self, "addLayoutGuide:", v24);

  v38 = (void *)MEMORY[0x1E0D156E0];
  -[UIView leftAnchor](self, "leftAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v42;
  -[UIView topAnchor](self, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v37;
  -[UIView rightAnchor](self, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v28;
  -[UIView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar horizontalIndexTitleBarFocusGuide](self, "horizontalIndexTitleBarFocusGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v33);

  -[_UIHorizontalIndexTitleBar _flipIfRightToLeft](self, "_flipIfRightToLeft");
  objc_opt_self();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v35, sel__flipIfRightToLeft);

}

- (void)_flipIfRightToLeft
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "flipsHorizontalAxis");

  if (v4 == 1)
  {
    if ((v6 & 1) != 0)
      return;
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
  }
  else
  {
    if (!v6)
      return;
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setFlipsHorizontalAxis:", v8);

}

- (void)_updateWithEntries:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIHorizontalIndexTitleBar setSelectedEntry:](self, "setSelectedEntry:", 0);
  -[_UIHorizontalIndexTitleBar setSelectedEntryIndexPath:](self, "setSelectedEntryIndexPath:", 0);
  -[_UIHorizontalIndexTitleBar setEntries:](self, "setEntries:", v4);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)_selectEntryForTitleIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  -[_UIHorizontalIndexTitleBar entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar setSelectedEntry:](self, "setSelectedEntry:", v6);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar setSelectedEntryIndexPath:](self, "setSelectedEntryIndexPath:", v7);

  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14
    || (-[_UIHorizontalIndexTitleBar selectedEntryIndexPath](self, "selectedEntryIndexPath"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v14, "isEqual:", v10),
        v10,
        (v11 & 1) == 0))
  {
    -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHorizontalIndexTitleBar selectedEntryIndexPath](self, "selectedEntryIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v13, 1, 16);

  }
}

- (BOOL)_isViewEntryCell:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  id v3;

  self->_sectionInset = a3;
  -[_UIHorizontalIndexTitleBar layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (void)_setParentContentInset:(UIEdgeInsets)a3
{
  id v3;

  self->_parentContentInset = a3;
  -[_UIHorizontalIndexTitleBar layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (void)_selectFocusedCell
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_UIHorizontalIndexTitleBar focusedCell](self, "focusedCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = v3;
    v5 = objc_msgSend(v3, "isSelected");
    v4 = v10;
    if ((v5 & 1) == 0)
    {
      -[_UIHorizontalIndexTitleBar _cancelDelayedFocusAction](self, "_cancelDelayedFocusAction");
      -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForCell:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v7, 1, 0);

        -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIHorizontalIndexTitleBar collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v9, v7);

      }
      v4 = v10;
    }
  }

}

- (void)_sendDelayedFocusActionIfNecessary
{
  -[_UIHorizontalIndexTitleBar _cancelDelayedFocusAction](self, "_cancelDelayedFocusAction");
  -[_UIHorizontalIndexTitleBar performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__selectFocusedCell, 0, 0.31);
}

- (void)_cancelDelayedFocusAction
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__selectFocusedCell, 0);
}

- (NSDirectionalEdgeInsets)_combinedSectionInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSDirectionalEdgeInsets result;

  -[_UIHorizontalIndexTitleBar sectionInset](self, "sectionInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIHorizontalIndexTitleBar _parentContentInset](self, "_parentContentInset");
  v12 = UIEdgeInsetsAdd(10, v4, v6, v8, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "layoutDirection");

  if (v20 == 1)
    v21 = v18;
  else
    v21 = v14;
  if (v20 == 1)
    v22 = v14;
  else
    v22 = v18;
  v23 = v12;
  v24 = v16;
  result.trailing = v22;
  result.bottom = v24;
  result.leading = v21;
  result.top = v23;
  return result;
}

- (id)_existingCellForSelectedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIHorizontalIndexTitleBar selectedEntryIndexPath](self, "selectedEntryIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHorizontalIndexTitleBar selectedEntryIndexPath](self, "selectedEntryIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setEntries:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *entries;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (NSArray *)v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  entries = self->_entries;
  self->_entries = v5;

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "nextFocusedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIHorizontalIndexTitleBar _isViewEntryCell:](self, "_isViewEntryCell:", v5))
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)_UIHorizontalIndexTitleBar;
    v8 = -[UIView shouldUpdateFocusInContext:](&v10, sel_shouldUpdateFocusInContext_, v4);
    goto LABEL_6;
  }
  -[_UIHorizontalIndexTitleBar focusedCell](self, "focusedCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar _existingCellForSelectedIndexPath](self, "_existingCellForSelectedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    goto LABEL_5;
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIHorizontalIndexTitleBar;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    objc_msgSend(v6, "nextFocusedItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHorizontalIndexTitleBar setFocusedCell:](self, "setFocusedCell:", v10);

  }
  else
  {
    -[_UIHorizontalIndexTitleBar setFocusedCell:](self, "setFocusedCell:", 0);
  }
  -[_UIHorizontalIndexTitleBar _sendDelayedFocusActionIfNecessary](self, "_sendDelayedFocusActionIfNecessary");

}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_UIHorizontalIndexTitleBar collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_UIHorizontalIndexTitleBar entries](self, "entries", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[_UIHorizontalIndexTitleBar entries](self, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_UIHorizontalIndexTitleBarCell"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateForEntry:", v9);
  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[_UIHorizontalIndexTitleBar entries](self, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIHorizontalIndexTitleBar setSelectedEntry:](self, "setSelectedEntry:", v8);
  -[_UIHorizontalIndexTitleBar setSelectedEntryIndexPath:](self, "setSelectedEntryIndexPath:", v5);

  -[_UIHorizontalIndexTitleBar delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "horizontalIndexBar:selectedEntry:", self, v8);

}

- (NSArray)entries
{
  return self->_entries;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (UIFocusGuide)horizontalIndexTitleBarFocusGuide
{
  return self->_horizontalIndexTitleBarFocusGuide;
}

- (void)setHorizontalIndexTitleBarFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalIndexTitleBarFocusGuide, a3);
}

- (_UIFocusFastScrollingIndexBarEntry)selectedEntry
{
  return self->_selectedEntry;
}

- (void)setSelectedEntry:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEntry, a3);
}

- (NSIndexPath)selectedEntryIndexPath
{
  return self->_selectedEntryIndexPath;
}

- (void)setSelectedEntryIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEntryIndexPath, a3);
}

- (_UIHorizontalIndexTitleBarCell)focusedCell
{
  return (_UIHorizontalIndexTitleBarCell *)objc_loadWeakRetained((id *)&self->_focusedCell);
}

- (void)setFocusedCell:(id)a3
{
  objc_storeWeak((id *)&self->_focusedCell, a3);
}

- (_UIHorizontalIndexTitleBarDelegate)delegate
{
  return (_UIHorizontalIndexTitleBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)_parentContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_parentContentInset.top;
  left = self->_parentContentInset.left;
  bottom = self->_parentContentInset.bottom;
  right = self->_parentContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_focusedCell);
  objc_storeStrong((id *)&self->_selectedEntryIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedEntry, 0);
  objc_storeStrong((id *)&self->_horizontalIndexTitleBarFocusGuide, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
