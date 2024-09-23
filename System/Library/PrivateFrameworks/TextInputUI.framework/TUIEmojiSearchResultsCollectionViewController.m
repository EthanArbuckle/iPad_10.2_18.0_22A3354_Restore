@implementation TUIEmojiSearchResultsCollectionViewController

- (TUIEmojiSearchResultsCollectionViewController)init
{
  _InvertibleFlowLayout *v3;
  TUIEmojiSearchResultsCollectionViewController *v4;
  TUIEmojiSearchResultsCollectionViewController *v5;
  id v6;
  void *v7;
  TUIEmojiSearchResultsCollectionViewController *v8;
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
  NSArray *displayedEmojis;
  _QWORD v23[4];
  TUIEmojiSearchResultsCollectionViewController *v24;
  objc_super v25;

  v3 = objc_alloc_init(_InvertibleFlowLayout);
  v25.receiver = self;
  v25.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  v4 = -[TUIEmojiSearchResultsCollectionViewController initWithCollectionViewLayout:](&v25, sel_initWithCollectionViewLayout_, v3);
  v5 = v4;
  if (v4)
  {
    -[TUIEmojiSearchResultsCollectionViewController setFlowLayout:](v4, "setFlowLayout:", v3);
    v6 = objc_alloc(MEMORY[0x1E0DC35E8]);
    -[TUIEmojiSearchResultsCollectionViewController collectionView](v5, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__TUIEmojiSearchResultsCollectionViewController_init__block_invoke;
    v23[3] = &unk_1E24FABF0;
    v8 = v5;
    v24 = v8;
    v9 = (void *)objc_msgSend(v6, "initWithCollectionView:cellProvider:", v7, v23);
    -[TUIEmojiSearchResultsCollectionViewController setDataSource:](v8, "setDataSource:", v9);

    -[TUIEmojiSearchResultsCollectionViewController dataSource](v8, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "appendSectionsWithIdentifiers:", &unk_1E2517720);
    -[TUIEmojiSearchResultsCollectionViewController dataSource](v8, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applySnapshotUsingReloadData:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchResultsCollectionViewController collectionView](v8, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[TUIEmojiSearchResultsCollectionViewController collectionView](v8, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsHorizontalScrollIndicator:", 0);

    -[TUIEmojiSearchResultsCollectionViewController collectionView](v8, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShowsVerticalScrollIndicator:", 0);

    -[TUIEmojiSearchResultsCollectionViewController collectionView](v8, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v8);

    -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1);
    -[UICollectionViewFlowLayout setSectionInsetReference:](v3, "setSectionInsetReference:", 2);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v8, sel__didRecognizeLongPressGesture_);
    -[TUIEmojiSearchResultsCollectionViewController setLongPressGestureRecognizer:](v8, "setLongPressGestureRecognizer:", v18);

    -[TUIEmojiSearchResultsCollectionViewController collectionView](v8, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchResultsCollectionViewController longPressGestureRecognizer](v8, "longPressGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addGestureRecognizer:", v20);

    v8->_animationBeginOffset = -1;
    v8->_lastAnimatedCellCount = -1;
    v8->_animatingCellUpdates = 0;
    displayedEmojis = v8->_displayedEmojis;
    v8->_displayedEmojis = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (id)_userPreferredEmojiStringVariantForToken:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3950];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastUsedVariantEmojiForEmojiString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)configuredEmojiCollectionViewCellForCollectionView:(id)a3 atIndexPath:(id)a4 forEmojiString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t animationBeginOffset;
  uint64_t v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v9, "integerValue") < 0)
  {
    v11 = 0;
    v16 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", objc_msgSend(v9, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_displayingVerbatimResults)
    {
      -[TUIEmojiSearchResultsCollectionViewController _userPreferredEmojiStringVariantForToken:](self, "_userPreferredEmojiStringVariantForToken:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    +[TUIEmojiSearchResultsCollectionViewController emojiTextAttributes](TUIEmojiSearchResultsCollectionViewController, "emojiTextAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v12, v15);

  }
  v17 = objc_msgSend(v8, "row");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emojistr__%lu"), v17 % 0x14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "row") >= self->_lastAnimatedCellCount)
    objc_msgSend(v19, "setDisplayedEmojiString:", 0);
  if (!self->_animatingCellUpdates)
  {
    v23 = objc_msgSend(v8, "row");
    goto LABEL_13;
  }
  objc_msgSend(v19, "displayedEmojiString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(v19, "displayedEmojiString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "isEqualToAttributedString:", v21);

    v23 = objc_msgSend(v8, "row");
    if ((v22 & 1) == 0)
      goto LABEL_15;
LABEL_13:
    v24 = 0;
    goto LABEL_18;
  }

  v23 = objc_msgSend(v8, "row");
LABEL_15:
  animationBeginOffset = self->_animationBeginOffset;
  if (v23 < animationBeginOffset)
  {
    self->_animationBeginOffset = v23;
    animationBeginOffset = v23;
  }
  v23 -= animationBeginOffset;
  v24 = 1;
LABEL_18:
  if (_os_feature_enabled_impl())
    v26 = objc_msgSend(v11, "supportsSkinToneVariants") ^ 1;
  else
    v26 = 0;
  objc_msgSend(v19, "setDragEnabled:", v26);
  objc_msgSend(v19, "setDisplayedEmojiString:animated:withAnimationOffset:", v16, v24, v23);

  return v19;
}

- (void)viewDidLoad
{
  uint64_t i;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  -[TUIEmojiSearchResultsCollectionViewController viewDidLoad](&v6, sel_viewDidLoad);
  for (i = 0; i != 20; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("emojistr__%lu"), i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), v4);

  }
}

- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSArray *v10;
  void *v11;
  id v12;
  NSArray *placeholderIdentifiers;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *displayedEmojis;
  NSArray *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v5 = a5;
  v8 = a3;
  self->_animatingCellUpdates = v5;
  self->_animationBeginOffset = -1;
  self->_displayingVerbatimResults = a4;
  v37 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v37, "appendSectionsWithIdentifiers:", &unk_1E2517738);
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = (NSArray *)v8;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __AsIdentifiers_block_invoke;
  v38[3] = &unk_1E24FAC38;
  v39 = v11;
  v12 = v11;
  -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v38);

  objc_msgSend(v37, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, &unk_1E2517230);
  if (self->_placeholderIdentifiers)
  {
    objc_msgSend(v37, "deleteItemsWithIdentifiers:");
    placeholderIdentifiers = self->_placeholderIdentifiers;
    self->_placeholderIdentifiers = 0;

  }
  -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleCells");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = v16 - objc_msgSend(v37, "numberOfItems");

  if (v17 >= 1)
  {
    if (AnimationPlaceholderCellIdentifiersWithCount_onceToken != -1)
      dispatch_once(&AnimationPlaceholderCellIdentifiersWithCount_onceToken, &__block_literal_global_298);
    if ((unint64_t)v17 >= 0x14)
      v18 = 20;
    else
      v18 = v17;
    objc_msgSend((id)AnimationPlaceholderCellIdentifiersWithCount_placeholderIdentifiers, "subarrayWithRange:", 0, v18);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_placeholderIdentifiers;
    self->_placeholderIdentifiers = v19;

    objc_msgSend(v37, "appendItemsWithIdentifiers:", self->_placeholderIdentifiers);
  }
  displayedEmojis = self->_displayedEmojis;
  self->_displayedEmojis = v10;
  v22 = v10;

  -[TUIEmojiSearchResultsCollectionViewController dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "applySnapshotUsingReloadData:", v37);

  -[TUIEmojiSearchResultsCollectionViewController setDisplayingNoResultsLabel:animated:](self, "setDisplayingNoResultsLabel:animated:", -[NSArray count](v22, "count") == 0, v5);
  v24 = -[NSArray count](v22, "count");

  self->_lastAnimatedCellCount = v24;
  self->_animatingCellUpdates = 0;
  -[TUIEmojiSearchResultsCollectionViewController flowLayout](self, "flowLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "collectionViewContentSize");
  v27 = v26;
  v29 = v28;

  if (v27 > 0.0)
  {
    -[TUIEmojiSearchResultsCollectionViewController flowLayout](self, "flowLayout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "minimumLineSpacing");
    v32 = v31;
    -[TUIEmojiSearchResultsCollectionViewController flowLayout](self, "flowLayout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "itemSize");
    v35 = v27 - (v32 + v34) * (double)v17;

    -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentSize:", v35, v29);

  }
}

- (void)setDisplayingNoResultsLabel:(BOOL)a3
{
  -[TUIEmojiSearchResultsCollectionViewController setDisplayingNoResultsLabel:animated:](self, "setDisplayingNoResultsLabel:animated:", a3, 0);
}

- (void)setDisplayingNoResultsLabel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  UILabel *v8;
  UILabel *noResultsLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[5];
  BOOL v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  if (self->_displayingNoResultsLabel != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_displayingNoResultsLabel = a3;
    if (a3 && !self->_noResultsLabel)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC3990]);
      v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      noResultsLabel = self->_noResultsLabel;
      self->_noResultsLabel = v8;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noResultsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringInDeviceLanguageForKey:", CFSTR("NO_RESULTS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_noResultsLabel, "setText:", v11);

      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_noResultsLabel, "setFont:", v12);

      -[UILabel setTextAlignment:](self->_noResultsLabel, "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_407);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_noResultsLabel, "setTextColor:", v13);

      -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_noResultsLabel;
      -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertSubview:belowSubview:", v16, v17);

      v27 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel centerXAnchor](self->_noResultsLabel, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v18;
      -[UILabel centerYAnchor](self->_noResultsLabel, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "centerYAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "activateConstraints:", v23);

      -[UILabel setAlpha:](self->_noResultsLabel, "setAlpha:", 0.0);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke_2;
    aBlock[3] = &unk_1E24FC1D0;
    aBlock[4] = self;
    v32 = v5;
    v24 = _Block_copy(aBlock);
    v25 = v24;
    if (v4)
    {
      v26 = 0.2;
      if (v5)
        v26 = 0.33;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v24, v26);
    }
    else
    {
      (*((void (**)(void *))v24 + 2))(v24);
    }

  }
}

- (void)setDisplayedEmojis:(id)a3
{
  -[TUIEmojiSearchResultsCollectionViewController setDisplayedEmojis:verbatimSkinTones:animated:](self, "setDisplayedEmojis:verbatimSkinTones:animated:", a3, 0, 0);
}

- (void)resetScrollPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentOffset:animated:", v3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)setCellHighlightFrozen:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_cellHighlightFrozen = a3;
  if (!a3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "visibleCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setHighlighted:", 0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_isSelectableEmojiTokenAtIndexPath:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "row");
  return v4 < -[NSArray count](self->_displayedEmojis, "count");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchResultsCollectionViewController;
  v5 = a4;
  -[TUIEmojiSearchResultsCollectionViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__TUIEmojiSearchResultsCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v6[3] = &unk_1E24FBCC8;
  v6[4] = self;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v6, 0);

}

- (void)_didRecognizeLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
  v29 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v29;
  if (v29)
  {
    v12 = -[TUIEmojiSearchResultsCollectionViewController _isSelectableEmojiTokenAtIndexPath:](self, "_isSelectableEmojiTokenAtIndexPath:", v29);
    v11 = (void *)v29;
    if (v12)
    {
      -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "supportsSkinToneVariants"))
      {
        v15 = (void *)MEMORY[0x1E0D1F278];
        objc_msgSend(v14, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_baseStringForEmojiString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(MEMORY[0x1E0D1F228], "_isCoupleMultiSkinToneEmoji:", v17) & 1) == 0)
        {
          -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "layoutAttributesForItemAtIndexPath:", v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "frame");
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          -[TUIEmojiSearchResultsCollectionViewController delegate](self, "delegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "emojiSearchResultsController:didRequestVariantSelectorForEmojiToken:fromRect:", self, v14, v21, v23, v25, v27);

        }
      }

      v11 = (void *)v29;
    }
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  CGFloat Height;
  double v8;
  double v9;
  _QWORD block[5];
  CGSize result;
  CGRect v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TUIEmojiSearchResultsCollectionViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E24FC068;
  block[4] = self;
  if (collectionView_layout_sizeForItemAtIndexPath__onceToken != -1)
    dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken, block);
  -[TUIEmojiSearchResultsCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v12);

  v8 = *(double *)&collectionView_layout_sizeForItemAtIndexPath__emojiWidth;
  v9 = Height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return -[TUIEmojiSearchResultsCollectionViewController _isSelectableEmojiTokenAtIndexPath:](self, "_isSelectableEmojiTokenAtIndexPath:", a4);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[TUIEmojiSearchResultsCollectionViewController _isSelectableEmojiTokenAtIndexPath:](self, "_isSelectableEmojiTokenAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  -[TUIEmojiSearchResultsCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndex:](self->_displayedEmojis, "objectAtIndex:", objc_msgSend(v6, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_displayingVerbatimResults)
  {
    -[TUIEmojiSearchResultsCollectionViewController _userPreferredEmojiStringVariantForToken:](self, "_userPreferredEmojiStringVariantForToken:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[TUIEmojiSearchResultsCollectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emojiSearchResultsController:didSelectEmoji:indexPath:", self, v8, v11);

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[TUIEmojiSearchResultsCollectionViewController isCellHighlightFrozen](self, "isCellHighlightFrozen"))
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlighted:", 1);

  }
}

- (TUIEmojiSearchResultsCollectionViewControllerDelegate)delegate
{
  return (TUIEmojiSearchResultsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isCellHighlightFrozen
{
  return self->_cellHighlightFrozen;
}

- (NSArray)displayedEmojis
{
  return self->_displayedEmojis;
}

- (BOOL)displayingVerbatimResults
{
  return self->_displayingVerbatimResults;
}

- (void)setDisplayingVerbatimResults:(BOOL)a3
{
  self->_displayingVerbatimResults = a3;
}

- (BOOL)displayingNoResultsLabel
{
  return self->_displayingNoResultsLabel;
}

- (UILabel)noResultsLabel
{
  return self->_noResultsLabel;
}

- (void)setNoResultsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noResultsLabel, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (_InvertibleFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayedEmojis, 0);
}

void __94__TUIEmojiSearchResultsCollectionViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke()
{
  double v0;
  id v1;

  objc_msgSend((id)objc_opt_class(), "emojiTextAttributes");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("😀"), "sizeWithAttributes:", v1);
  collectionView_layout_sizeForItemAtIndexPath__emojiWidth = ceil(v0);

}

void __100__TUIEmojiSearchResultsCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "flowLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

uint64_t __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", v1);
}

id __86__TUIEmojiSearchResultsCollectionViewController_setDisplayingNoResultsLabel_animated___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.518, 0.553, 0.6, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__TUIEmojiSearchResultsCollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "configuredEmojiCollectionViewCellForCollectionView:atIndexPath:forEmojiString:", a2, a3, a4);
}

+ (double)emojiFontSize
{
  return 38.0;
}

+ (id)emojiTextAttributes
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 38.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
