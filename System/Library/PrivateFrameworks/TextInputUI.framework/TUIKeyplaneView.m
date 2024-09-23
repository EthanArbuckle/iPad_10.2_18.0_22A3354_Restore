@implementation TUIKeyplaneView

- (TUIKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  TUIKeyplaneView *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *storedKeyViews;
  NSMutableDictionary *v14;
  NSMutableDictionary *storedVariantViews;
  NSMutableDictionary *v16;
  NSMutableDictionary *delayedDeactivationKeys;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TUIKeyplaneView;
  v11 = -[TUIKeyplaneView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storedKeyViews = v11->_storedKeyViews;
    v11->_storedKeyViews = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storedVariantViews = v11->_storedVariantViews;
    v11->_storedVariantViews = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    delayedDeactivationKeys = v11->_delayedDeactivationKeys;
    v11->_delayedDeactivationKeys = v16;

    objc_storeStrong((id *)&v11->_keyplane, a4);
    objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferencesActions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_currentHandBias = objc_msgSend(v19, "handBias");

    v11->_isCurrentlySplit = objc_msgSend(MEMORY[0x1E0DC3958], "isSplit");
    v11->_dismissingKeyboardMenu = 0;
    -[TUIKeyplaneView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
  }

  return v11;
}

- (id)keyplaneFromTree:(id)a3 size:(CGSize)a4 controlKeyType:(int64_t)a5
{
  double height;
  double width;
  id v7;
  TUIKeyplaneView *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v7, 0.0, 0.0, width, height);

  return v8;
}

- (BOOL)_userInteractionStateDeterminesLayerHitTestState
{
  return 1;
}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  -[TUIKeyplaneView deactivateKeys](self, "deactivateKeys");
  -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[TUIKeyplaneView setBiasEscapeButton:](self, "setBiasEscapeButton:", 0);
  v4.receiver = self;
  v4.super_class = (Class)TUIKeyplaneView;
  -[TUIKeyplaneView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)createContentViewsIfNeeded
{
  void *v3;
  TUIKeyboardContentView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  int64_t v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[7];

  v60[6] = *MEMORY[0x1E0C80C00];
  -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(TUIKeyboardContentView);
    -[TUIKeyplaneView setKeyboardContentView:](self, "setKeyboardContentView:", v4);

    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);

    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView addSubview:](self, "addSubview:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(v8, "setIdentifier:", CFSTR("TUIKeyplane.leading"));
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(v9, "setIdentifier:", CFSTR("TUIKeyplane.trailing"));
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v9);
    objc_msgSend(v8, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setLeadingSpacing:](self, "setLeadingSpacing:", v11);

    objc_msgSend(v9, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setTrailingSpacing:](self, "setTrailingSpacing:", v13);

    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView topAnchor](self, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 8.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setTopSpacing:](self, "setTopSpacing:", v17);

    -[TUIKeyplaneView bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setBottomSpacing:](self, "setBottomSpacing:", v21);

    objc_msgSend(v9, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView trailingAnchor](self, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setTrailingTieConstraint:](self, "setTrailingTieConstraint:", v24);

    -[TUIKeyplaneView topSpacing](self, "topSpacing");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v57;
    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v53;
    v59 = v8;
    objc_msgSend(v8, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView leadingAnchor](self, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v26;
    v58 = v9;
    objc_msgSend(v9, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v30;
    -[TUIKeyplaneView leadingSpacing](self, "leadingSpacing");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v31;
    -[TUIKeyplaneView trailingSpacing](self, "trailingSpacing");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "keyboardScreenReferenceSize");
      v37 = v36;
      v39 = v38;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bounds");
      v37 = v40;
      v39 = v41;
    }

    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isKeyboardMinorEdgeWidth") ^ 1;

    }
    else
    {
      v44 = v37 > v39;
    }

    v45 = +[TUIKeyplane layoutClassFromScreenDimensions:](TUIKeyplane, "layoutClassFromScreenDimensions:", v37, v39);
    +[TUIKeyplane sizeBasisForLayoutClass:](TUIKeyplane, "sizeBasisForLayoutClass:", v45);
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyboardWidth");
      v37 = v47;
    }
    -[TUIKeyplaneView keyplane](self, "keyplane");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUIKeyplane baseHeightForLayout:layoutClass:landscape:](TUIKeyplane, "baseHeightForLayout:layoutClass:landscape:", v49, v45, v44);
    v51 = v50;

    if (v46)
    -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v37, v51);
    -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);

  }
}

- (int64_t)keyLayoutStyle
{
  void *v2;
  int64_t v3;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyLayoutStyle");

  if (v3 == -1)
    return 1;
  else
    return v3;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  char v5;

  -[TUIKeyplaneView displayedType](self, "displayedType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree unhashedName](self->_keyplane, "unhashedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
    -[TUIKeyplaneView createContentViewsIfNeeded](self, "createContentViewsIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 1);
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  -[TUIKeyplaneView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    -[TUIKeyplaneView _regenerateFactoryPreservingUpdates:](self, "_regenerateFactoryPreservingUpdates:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          v15 = -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle");
          -[TUIKeyplaneView factory](self, "factory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateKeysInRowWithStyle:factory:", v15, v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

  }
  v17 = objc_msgSend(v4, "horizontalSizeClass");
  -[TUIKeyplaneView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "horizontalSizeClass");

  if (v17 == v19)
  {
    -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__TUIKeyplaneView_traitCollectionDidChange___block_invoke;
    v20[3] = &unk_1E24FC068;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v20);
  }

}

- (void)compareKeyplane:(id)a3 toKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUIKeyplaneView deactivateKeys](self, "deactivateKeys");
  if (!v6 || objc_msgSend(v6, "needsResetFromKeyplane:", v7))
  {
    if (-[TUIKeyplaneView supportsSplit](self, "supportsSplit")
      && (objc_msgSend(v6, "hasSimilarLayoutToKeyplane:", v7) & 1) == 0)
    {
      -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActive:", 0);

      -[TUIKeyplaneView setSplitSpacing:](self, "setSplitSpacing:", 0);
      -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActive:", 0);

      -[TUIKeyplaneView setRightSplitWidth:](self, "setRightSplitWidth:", 0);
      -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setActive:", 0);

      -[TUIKeyplaneView setLeftSplitWidth:](self, "setLeftSplitWidth:", 0);
      -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 0);

      -[TUIKeyplaneView setKeySizeSpacer:](self, "setKeySizeSpacer:", 0);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            -[TUIKeyplaneView removeLayoutGuide:](self, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++));
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeAllObjects");

    }
    -[TUIKeyplaneView resetLayoutAndApplyKeyplane:](self, "resetLayoutAndApplyKeyplane:", v7);
  }

}

- (void)resetLayoutAndApplyKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TUIKeyplaneView storedVariantViews](self, "storedVariantViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10++), "removeFromSuperview");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  -[TUIKeyplaneView storedVariantViews](self, "storedVariantViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "removeFromSuperview");
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  -[TUIKeyplaneView setCurrentKeyplane:](self, "setCurrentKeyplane:", v4);
  -[TUIKeyplaneView layoutRows:](self, "layoutRows:", objc_msgSend(v4, "numberOfRows"));
  objc_msgSend(v4, "orderedKeysByRow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView layoutKeysInRows:](self, "layoutKeysInRows:", v20);

  -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 1);

}

- (void)updateRowsForKeyplane:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "numberOfRows"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v7, "orderedKeysByRow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView updateKeysForRow:withKeys:](self, "updateKeysForRow:withKeys:", v4, v6);

      ++v4;
    }
    while (v4 < objc_msgSend(v7, "numberOfRows"));
  }
  -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");

}

- (void)updateKeysForRow:(unint64_t)a3 withKeys:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "updateKeysInRowWithData:", v9);

}

- (void)setKeyplane:(id)a3
{
  UIKBTree **p_keyplane;
  void *v6;
  UIKBTree *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  UIKBTree *v38;

  v38 = (UIKBTree *)a3;
  -[TUIKeyplaneView createContentViewsIfNeeded](self, "createContentViewsIfNeeded");
  p_keyplane = &self->_keyplane;
  if (self->_keyplane)
  {
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = *p_keyplane;
      *p_keyplane = 0;

    }
  }
  -[TUIKeyplaneView renderingContext](self, "renderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyboardType");

  if (v9 == 126)
  {
    -[TUIKeyplaneView factory](self, "factory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "dynamicFactory"))
    {

    }
    else
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFloating");

      if (!v12)
      {
        v9 = 126;
        goto LABEL_12;
      }
    }
    -[UIKBTree name](v38, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[TUIKeyplane layoutClassFromKeyplaneName:](TUIKeyplane, "layoutClassFromKeyplaneName:", v13);

    if (v14 == 1)
      v9 = 0;
    else
      v9 = 126;
  }
LABEL_12:
  +[TUIKeyplane keyplaneFromKBTree:withType:](TUIKeyplane, "keyplaneFromKBTree:withType:", v38, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (*p_keyplane == v38
    && (-[TUIKeyplaneView currentKeyplane](self, "currentKeyplane"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "needsResetFromKeyplane:", v16),
        v16,
        !v17))
  {
    v19 = 1;
  }
  else
  {
    -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);
    -[UIKBTree updateFlickKeycapOnKeys](v38, "updateFlickKeycapOnKeys");
    objc_storeStrong((id *)&self->_keyplane, a3);
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = 1;
    }
    else
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView setIsFloating:](self, "setIsFloating:", objc_msgSend(v20, "isFloating"));

      v19 = -[TUIKeyplaneView isFloating](self, "isFloating");
      -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    }
    -[TUIKeyplaneView setCurrentHandBias:](self, "setCurrentHandBias:", 0);
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView compareKeyplane:toKeyplane:](self, "compareKeyplane:toKeyplane:", v21, v15);

    if (-[TUIKeyplaneView supportsSplit](self, "supportsSplit"))
    {
      if (!-[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition"))
      {
        -[TUIKeyplaneView setIsCurrentlySplit:](self, "setIsCurrentlySplit:", objc_msgSend(MEMORY[0x1E0DC3958], "isSplit"));
        if (-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit"))
        {
          -[TUIKeyplaneView prepareForSplitTransition](self, "prepareForSplitTransition");
          -[TUIKeyplaneView updateSplitProgress:](self, "updateSplitProgress:", 1.0);
          -[TUIKeyplaneView finishSplitTransition](self, "finishSplitTransition");
        }
      }
    }
  }
  -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
  v23 = v22;
  v25 = v24;
  if (!-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit")
    && !-[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition"))
  {
    -[TUIKeyplaneView preferredSize](self, "preferredSize");
    if (v23 != v27 || v25 != v26)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyboardWidth");
      v30 = v29;

      if (v30 > 0.0)
        -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v23, v25);
    }
  }
  -[TUIKeyplaneView bottomSpacing](self, "bottomSpacing");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[TUIKeyplaneView trailingTieConstraint](self, "trailingTieConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "layoutClass") == 1)
  {
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isFloating");

    if ((v35 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "preferencesActions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView setKeyboardBias:](self, "setKeyboardBias:", objc_msgSend(v37, "handBias"));

      if (!v19)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else
  {

  }
  -[TUIKeyplaneView updateKeyplaneSpacing](self, "updateKeyplaneSpacing");
  if (v19)
LABEL_34:
    -[TUIKeyplaneView updateKeysForFloating:](self, "updateKeysForFloating:", -[TUIKeyplaneView isFloating](self, "isFloating"));
LABEL_35:

}

- (void)setKeyplaneForAutomation:(id)a3
{
  id v4;
  void *v5;
  UIKBTree *keyplane;
  UIKBTree *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TUIKeyplaneView createContentViewsIfNeeded](self, "createContentViewsIfNeeded");
  if (self->_keyplane)
  {
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      keyplane = self->_keyplane;
      self->_keyplane = 0;

    }
  }
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);
  objc_msgSend(v4, "updateFlickKeycapOnKeys");
  v7 = self->_keyplane;
  self->_keyplane = (UIKBTree *)v4;
  v8 = v4;

  +[TUIKeyplane keyplaneFromKBTree:withType:](TUIKeyplane, "keyplaneFromKBTree:withType:", self->_keyplane, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[TUIKeyplaneView setCurrentHandBias:](self, "setCurrentHandBias:", 0);
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView compareKeyplane:toKeyplane:](self, "compareKeyplane:toKeyplane:", v9, v10);

  -[TUIKeyplaneView updateKeyplaneSpacing](self, "updateKeyplaneSpacing");
}

- (void)transitionToKeyplane:(id)a3
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  UIKBTree *v9;

  v9 = (UIKBTree *)a3;
  if (self->_keyplane != v9)
    objc_storeStrong((id *)&self->_keyplane, a3);
  -[TUIKeyplaneView screenTraits](self, "screenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFloating");
  v7 = -[TUIKeyplaneView isFloating](self, "isFloating");

  if (v6 != v7)
  {
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView updateKeysForFloating:](self, "updateKeysForFloating:", objc_msgSend(v8, "isFloating"));

  }
}

- (void)updateKeysForFloating:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);
  -[TUIKeyplaneView deactivateKeys](self, "deactivateKeys");
  -[TUIKeyplaneView setIsFloating:](self, "setIsFloating:", v3);
  -[TUIKeyplaneView _regenerateFactoryPreservingUpdates:](self, "_regenerateFactoryPreservingUpdates:", 0);
  if (v3)
  {
    v5 = 1;
  }
  else
  {
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "layoutClass");

    if (v7 == 4)
      v5 = 3;
    else
      v5 = 2;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUIKeyplaneView factory](self, "factory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateKeysInRowWithStyle:factory:", v5, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[TUIKeyplaneView updateBottomRowSizingGuide](self, "updateBottomRowSizingGuide");
  -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 1);
}

- (void)updateKeyplaneSpacing
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[TUIKeyplaneView keyplaneInsets](self, "keyplaneInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIKeyplaneView topSpacing](self, "topSpacing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v4);

  -[TUIKeyplaneView leadingSpacing](self, "leadingSpacing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v6);

  -[TUIKeyplaneView bottomSpacing](self, "bottomSpacing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v8);

  -[TUIKeyplaneView trailingSpacing](self, "trailingSpacing");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v10);

}

- (int64_t)currentHandBias
{
  return self->_currentHandBias;
}

- (void)setKeyboardBias:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "layoutClass") != 1)
    goto LABEL_9;
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "effectsType") == 1)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "interfaceOrientation") - 1) >= 2)
  {

    goto LABEL_8;
  }
  v8 = -[TUIKeyplaneView isFloating](self, "isFloating");

  if (v8)
  {
LABEL_10:
    -[TUIKeyplaneView setCurrentHandBias:](self, "setCurrentHandBias:", 0);
    v12 = -[TUIKeyplaneView isFloating](self, "isFloating") ^ 1;
    -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", v12);

    -[TUIKeyplaneView updateBiasEscapeButtonVisbility:](self, "updateBiasEscapeButtonVisbility:", 0);
    -[TUIKeyplaneView updateKeyplaneSpacing](self, "updateKeyplaneSpacing");
    return;
  }
  if (a3)
  {
    -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  else
  {
    v14 = -[TUIKeyplaneView isFloating](self, "isFloating") ^ 1;
    -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v14;
  }
  objc_msgSend(v9, "setActive:", v11);

  if (-[TUIKeyplaneView currentHandBias](self, "currentHandBias") != a3)
  {
    -[TUIKeyplaneView horizontalBiasButtonConstraint](self, "horizontalBiasButtonConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 0);

    -[TUIKeyplaneView setHorizontalBiasButtonConstraint:](self, "setHorizontalBiasButtonConstraint:", 0);
    -[TUIKeyplaneView setCurrentHandBias:](self, "setCurrentHandBias:", a3);
  }
  -[TUIKeyplaneView updateBiasEscapeButtonVisbility:](self, "updateBiasEscapeButtonVisbility:", a3 != 0);
  -[TUIKeyplaneView updateKeyplaneSpacing](self, "updateKeyplaneSpacing");
  -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);
  -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
}

- (void)updateBiasEscapeButtonVisbility:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];

  v3 = a3;
  v5 = -[TUIKeyplaneView currentHandBias](self, "currentHandBias");
  if (v3)
  {
    v6 = v5;
    if (v5)
    {
      -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = MEMORY[0x1E0C809B0];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke;
        v43[3] = &unk_1E24FC090;
        v43[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v43);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setContentInsets:", 0.0, 15.0, 0.0, 15.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_8478);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setBaseForegroundColor:", v11);
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, 40.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPreferredSymbolConfigurationForImage:", v12);
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v8, v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView setBiasEscapeButton:](self, "setBiasEscapeButton:", v13);

        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[TUIKeyplaneView superview](self, "superview");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v16);

        v42[0] = v9;
        v42[1] = 3221225472;
        v42[2] = __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_3;
        v42[3] = &unk_1E24FC0F8;
        v42[4] = self;
        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setConfigurationUpdateHandler:", v42);

        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "topAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setActive:", 1);

        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActive:", 1);

      }
      -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNeedsUpdateConfiguration");

      -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 0);

      -[TUIKeyplaneView horizontalBiasButtonConstraint](self, "horizontalBiasButtonConstraint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == 1)
      {
        if (!v30)
        {
          -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "leadingAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView leadingAnchor](self, "leadingAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 1.0;
          v35 = v32;
LABEL_13:
          objc_msgSend(v35, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v33, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView setHorizontalBiasButtonConstraint:](self, "setHorizontalBiasButtonConstraint:", v38);

        }
      }
      else if (!v30)
      {
        -[TUIKeyplaneView trailingAnchor](self, "trailingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "trailingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 1.0;
        v35 = v31;
        goto LABEL_13;
      }
      -[TUIKeyplaneView horizontalBiasButtonConstraint](self, "horizontalBiasButtonConstraint");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setActive:", 1);

      return;
    }
  }
  -[TUIKeyplaneView horizontalBiasButtonConstraint](self, "horizontalBiasButtonConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[TUIKeyplaneView horizontalBiasButtonConstraint](self, "horizontalBiasButtonConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 0);

    -[TUIKeyplaneView setHorizontalBiasButtonConstraint:](self, "setHorizontalBiasButtonConstraint:", 0);
  }
  -[TUIKeyplaneView biasEscapeButton](self, "biasEscapeButton");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHidden:", 1);

}

- (void)updateBottomRowSizingGuide
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  -[TUIKeyplaneView bottomRowSizingGuide](self, "bottomRowSizingGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUIKeyplaneView factory](self, "factory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "layoutClass");

      switch(v10)
      {
        case 1:
          -[TUIKeyplaneView factory](self, "factory");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v6, "dynamicFactory") == 0;
          v12 = 0.1;
          v13 = 0.125;
          goto LABEL_11;
        case 2:
          -[TUIKeyplaneView factory](self, "factory");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dynamicFactory");
          v8 = 1.07;
          goto LABEL_14;
        case 3:
          -[TUIKeyplaneView factory](self, "factory");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v6, "dynamicFactory") == 0;
          v12 = 1.115;
          v13 = 1.08;
          goto LABEL_11;
        case 4:
          -[TUIKeyplaneView factory](self, "factory");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v6, "dynamicFactory") == 0;
          v12 = 1.07;
          v13 = 1.04;
LABEL_11:
          if (v11)
            v8 = v12;
          else
            v8 = v13;
          goto LABEL_14;
        default:
          v8 = 0.125;
          goto LABEL_15;
      }
    }
    -[TUIKeyplaneView factory](self, "factory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dynamicBottomRowMultiplier");
    v8 = v7;
LABEL_14:

LABEL_15:
    -[TUIKeyplaneView bottomRowSizingConstraint](self, "bottomRowSizingConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 0);

    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "layoutClass");

    if (v16 - 2 >= 3)
    {
      if (v16 > 1)
      {
LABEL_20:
        -[TUIKeyplaneView bottomRowSizingConstraint](self, "bottomRowSizingConstraint");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 1);

        return;
      }
      -[TUIKeyplaneView bottomRowSizingGuide](self, "bottomRowSizingGuide");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUIKeyplaneView bottomRowSizingGuide](self, "bottomRowSizingGuide");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView keySizeReferenceGuide](self, "keySizeReferenceGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "heightAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;
    objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v20, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setBottomRowSizingConstraint:](self, "setBottomRowSizingConstraint:", v22);

    goto LABEL_20;
  }
}

- (void)didTapBiasEscapeButton
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[TUIKeyplaneView currentHandBias](self, "currentHandBias");
  objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandBias:", 0);

  -[TUIKeyplaneView setKeyboardBias:](self, "setKeyboardBias:", 0);
  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForHandBiasChange");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DC4EF0], 0, 0);

  }
}

- (void)updateAllTrees
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL IsEmpty;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  CGRect v28;

  if (self->_keyplane)
  {
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      if (!-[TUIKeyplaneView layoutReadyForTreeUpdate](self, "layoutReadyForTreeUpdate")
        || -[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition"))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __33__TUIKeyplaneView_updateAllTrees__block_invoke;
        v27[3] = &unk_1E24FC068;
        v27[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v27);
      }
      -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      IsEmpty = CGRectIsEmpty(v28);

      if (!IsEmpty)
        -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      -[UIKBTree keys](self->_keyplane, "keys");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v26, "count");
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC30]), "initWithCapacity:", v7);
      objc_msgSend(v8, "setUsesTwoHands:", 0);
      if (v7)
      {
        v9 = 0;
        v10 = *MEMORY[0x1E0C9D628];
        v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        do
        {
          objc_msgSend(v26, "objectAtIndex:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView updateFrameForKey:](self, "updateFrameForKey:", v14);
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          if (objc_msgSend(v14, "isExemptFromInputManagerLayout"))
          {
            objc_msgSend(v8, "addKeyWithString:frame:", &stru_1E24FC6C0, v10, v11, v12, v13);
          }
          else
          {
            objc_msgSend(v14, "representedString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lowercaseString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addKeyWithString:frame:", v24, v16, v18, v20, v22);

          }
          ++v9;
        }
        while (v7 != v9);
      }
      -[TUIKeyplaneView setNeedsLayout](self, "setNeedsLayout");
      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLayoutForKeyHitTest:", v8);

    }
  }
}

- (void)layoutRows:(unint64_t)a3
{
  TUIKeyplaneView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
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
  _QWORD *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  _BOOL4 v95;
  TUIKeyplaneView *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  _QWORD v110[3];
  void *v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[4];

  v4 = self;
  v116[2] = *MEMORY[0x1E0C80C00];
  -[TUIKeyplaneView keySizeReferenceGuide](self, "keySizeReferenceGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keySizeReferenceGuide](v4, "keySizeReferenceGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLayoutGuide:", v7);

    -[TUIKeyplaneView setKeySizeReferenceGuide:](v4, "setKeySizeReferenceGuide:", 0);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[TUIKeyplaneView setKeySizeReferenceGuide:](v4, "setKeySizeReferenceGuide:", v8);

  -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView keySizeReferenceGuide](v4, "keySizeReferenceGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addLayoutGuide:", v10);

  -[TUIKeyplaneView keyRowViews](v4, "keyRowViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[TUIKeyplaneView setKeyRowViews:](v4, "setKeyRowViews:", v12);

  }
  v95 = -[TUIKeyplaneView supportsSplit](v4, "supportsSplit");
  if (v95)
  {
    -[TUIKeyplaneView splitTransitionLayoutGuides](v4, "splitTransitionLayoutGuides");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("TUIKBSplitGuide_Middle"));
    v14 = objc_claimAutoreleasedReturnValue();

    v97 = (void *)v14;
    if (!v14)
    {
      -[TUIKeyplaneView createSplitLayoutIfNeeded](v4, "createSplitLayoutIfNeeded");
      -[TUIKeyplaneView splitTransitionLayoutGuides](v4, "splitTransitionLayoutGuides");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("TUIKBSplitGuide_Middle"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = -[TUIKeyplaneView isCurrentlySplit](v4, "isCurrentlySplit") ^ 1;
    -[TUIKeyplaneView splitSpacing](v4, "splitSpacing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", v16);

  }
  else
  {
    v97 = 0;
  }
  -[TUIKeyplaneView currentKeyplane](v4, "currentKeyplane");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isGridLayout");
  v20 = 7;
  if (!v19)
    v20 = 0;
  v105 = v20;

  -[TUIKeyplaneView currentKeyplane](v4, "currentKeyplane");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "effectsType");

  v96 = v4;
  if (v22 == 1)
  {
    -[TUIKeyplaneView idealKeySizeforLayoutType:](v4, "idealKeySizeforLayoutType:", v105);
    v24 = v23;
    v26 = v25;
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneView keySizeReferenceGuide](v4, "keySizeReferenceGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v30;
    -[TUIKeyplaneView keySizeReferenceGuide](v4, "keySizeReferenceGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v34);

    v4 = v96;
  }
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = v35;
  if (a3)
  {
    v37 = 0;
    v98 = a3 - 1;
    v99 = v35;
    v94 = a3;
    v38 = 0;
    while (1)
    {
      +[TUIKeyplaneRow emptyRowForKeyplane:rowNumber:](TUIKeyplaneRow, "emptyRowForKeyplane:rowNumber:", v4, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = v105;
      v107 = v37;
      v108 = v38;
      if (v105 != 7)
        break;
      objc_msgSend(v39, "setEdgeToEdge:", 1);
      objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v105 = 7;
      v42 = v97;
      if (v95)
        goto LABEL_24;
LABEL_28:
      -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addSubview:", v40);

      -[TUIKeyplaneView rowsVerticalSpacing](v4, "rowsVerticalSpacing");
      v61 = v60;
      -[TUIKeyplaneView rowInsets](v4, "rowInsets");
      v63 = v62;
      v65 = v64;
      v67 = v66;
      objc_msgSend(v40, "topAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_msgSend(v37, "bottomAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, v61);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v71);
      }
      else
      {
        -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "topAnchor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "constraintEqualToAnchor:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v71;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
        v72 = v40;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v73);

        v40 = v72;
      }

      -[TUIKeyplaneView currentKeyplane](v4, "currentKeyplane");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "heightMultiplierForRowNumber:", v38);
      v76 = v75;

      objc_msgSend(v40, "leadingAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "leadingAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:constant:", v102, v63);
      v77 = v40;
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v101;
      -[TUIKeyplaneView keyboardContentView](v4, "keyboardContentView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "trailingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:constant:", v79, v67);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v80;
      objc_msgSend(v40, "heightAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView keySizeReferenceGuide](v4, "keySizeReferenceGuide");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "heightAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:multiplier:", v83, v76);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v84;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 3);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "addObjectsFromArray:", v85);

      v4 = v96;
      v36 = v99;
      if (v98 == v108)
      {
        -[TUIKeyplaneView keyboardContentView](v96, "keyboardContentView");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "bottomAnchor");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bottomAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, v65);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v89;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "addObjectsFromArray:", v90);

      }
      -[TUIKeyplaneView keyRowViews](v96, "keyRowViews");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v108);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKey:", v77, v92);

      v38 = v108 + 1;
      v37 = v77;
      if (v94 == v108 + 1)
      {

        goto LABEL_35;
      }
    }
    if (!v105)
      v41 = v98 == v38;
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v42 = v97;
    v105 = v41;
    if (!v95)
      goto LABEL_28;
    if (v41)
    {
      -[TUIKeyplaneView splitTransitionLayoutGuides](v4, "splitTransitionLayoutGuides");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKey:", CFSTR("TUIKBSplitGuide_Padding"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v97, "leftAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "splitLayoutGuide");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "leftAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v40;
      v93 = v40;
      if (v44)
      {
        objc_msgSend(v45, "constraintEqualToAnchor:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v115[0] = v49;
        objc_msgSend(v44, "leftAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "splitLayoutGuide");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "rightAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v115[1] = v52;
        v53 = v115;
      }
      else
      {
        objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 0.0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v114[0] = v49;
        objc_msgSend(v97, "rightAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "splitLayoutGuide");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "rightAnchor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", 30.0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v114[1] = v52;
        v53 = v114;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "addObjectsFromArray:", v58);

      v105 = 1;
    }
    else
    {
LABEL_24:
      objc_msgSend(v40, "splitLayoutGuide");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "widthAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "widthAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 1.0);
      v57 = v36;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v113[0] = v44;
      objc_msgSend(v42, "leftAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v40;
      objc_msgSend(v40, "splitLayoutGuide");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "leftAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addObjectsFromArray:", v50);
    }

    v36 = v99;
    v37 = v107;
    v38 = v108;
    v40 = v93;
    goto LABEL_28;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v36);

}

- (void)layoutKeysInRows:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  TUIKeyplaneView *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  TUIKeyplaneView *v60;
  void *v61;
  uint64_t v62;
  id obj;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77;
  _QWORD v78[2];
  _BYTE v79[128];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
  v5 = objc_claimAutoreleasedReturnValue();
  v60 = self;
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v4, "count");

  self = v60;
  if (v8 < v9)
LABEL_3:
    -[TUIKeyplaneView layoutRows:](self, "layoutRows:", objc_msgSend(v4, "count"));
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isGridLayout");

  v12 = v60;
  -[TUIKeyplaneView keySizeReferenceGuide](v60, "keySizeReferenceGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0;
    v15 = 0;
    v16 = 7;
    if (!v11)
      v16 = 0;
    v62 = v16;
    v17 = 0x1E0C99000uLL;
    v57 = v4;
    do
    {
      -[TUIKeyplaneView keyRowViews](v12, "keyRowViews", v57);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v19);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectAtIndex:", v14);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v14;
      if (v14 == objc_msgSend(v4, "count") - 1)
      {
        v20 = v62;
        if (v62 == 7)
        {
          v30 = v59;
          v12 = v60;
        }
        else
        {
          -[TUIKeyplaneView currentKeyplane](v60, "currentKeyplane");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView currentKeyplane](v60, "currentKeyplane");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "variantTypeIncludesSpaceBar:", objc_msgSend(v22, "currentVariantType"));

          v12 = v60;
          if (v23)
            v24 = 1;
          else
            v24 = 2;
          -[TUIKeyplaneView bottomRowSizingGuide](v60, "bottomRowSizingGuide");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            v26 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
            -[TUIKeyplaneView setBottomRowSizingGuide:](v60, "setBottomRowSizingGuide:", v26);

            -[TUIKeyplaneView keyboardContentView](v60, "keyboardContentView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyplaneView bottomRowSizingGuide](v60, "bottomRowSizingGuide");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addLayoutGuide:", v28);

            v12 = v60;
          }
          -[TUIKeyplaneView bottomRowSizingGuide](v12, "bottomRowSizingGuide");
          v29 = objc_claimAutoreleasedReturnValue();

          -[TUIKeyplaneView updateBottomRowSizingGuide](v12, "updateBottomRowSizingGuide");
          v30 = (void *)v29;
          v20 = v24;
        }
      }
      else
      {
        v30 = v59;
        v12 = v60;
        v20 = v62;
      }
      v31 = v68;
      v59 = v30;
      v62 = v20;
      objc_msgSend(v68, "layoutRowWithKeys:guide:type:", v61);
      v64 = v15;
      if (v15)
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v15, "doubleHeightKeysForRow");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v74 != v35)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "bottomAnchor");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "bottomAnchor");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "constraintEqualToAnchor:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v39;
              objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", &v80, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObjectsFromArray:", v40);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
          }
          while (v34);
        }

        v12 = v60;
        v15 = v64;
        v31 = v68;
      }
      if (v62 == 7 && objc_msgSend(v31, "rowHasDoubleHeightKeys"))
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v31, "doubleHeightKeysForRow");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (v66)
        {
          v65 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v66; ++j)
            {
              if (*(_QWORD *)v70 != v65)
                objc_enumerationMutation(obj);
              v42 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              objc_msgSend(v42, "topAnchor");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v15, "topAnchor");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "constraintEqualToAnchor:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v78[0] = v45;
                objc_msgSend(v42, "bottomAnchor");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "bottomAnchor");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "constraintEqualToAnchor:", v47);
                v48 = v17;
                v49 = v13;
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v78[1] = v50;
                objc_msgSend(*(id *)(v48 + 3360), "arrayWithObjects:count:", v78, 2);
                v67 = v43;
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "addObjectsFromArray:", v51);

                v13 = v49;
                v17 = v48;
                v31 = v68;

                v15 = v64;
                objc_msgSend(v42, "setHidden:", 1);
              }
              else
              {
                objc_msgSend(v31, "topAnchor");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "constraintEqualToAnchor:", v52);
                v53 = v43;
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v54;
                objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", &v77, 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObjectsFromArray:", v55);

              }
            }
            v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          }
          while (v66);
        }

        v56 = v31;
        v12 = v60;
      }
      else
      {
        v56 = 0;
      }

      if (-[TUIKeyplaneView supportsSplit](v12, "supportsSplit"))
        objc_msgSend(v68, "toggleConstraintsForSplit:", -[TUIKeyplaneView isCurrentlySplit](v12, "isCurrentlySplit"));

      v4 = v57;
      v14 = v58 + 1;
      v15 = v56;
    }
    while (v58 + 1 < (unint64_t)objc_msgSend(v57, "count"));

  }
  if (objc_msgSend(v13, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIKeyplaneView;
  -[TUIKeyplaneView layoutSubviews](&v3, sel_layoutSubviews);
  if (-[TUIKeyplaneView layoutReadyForTreeUpdate](self, "layoutReadyForTreeUpdate"))
    -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
}

- (void)setState:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  BOOL v38;
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
  id v52;
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
  unsigned int v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v4 = *(_QWORD *)&a3;
  v77 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v64 = objc_msgSend(v6, "state");
  objc_msgSend(v6, "setState:", v4);
  v66 = v6;
  -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v6, objc_msgSend(v6, "state"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 == 16;
  if (v4 > 0x14 || ((1 << v4) & 0x110010) == 0)
    -[TUIKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v6);
  -[TUIKeyplaneView viewForKey:](self, "viewForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "layoutShape") == 2)
  {
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keysForName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v72 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (objc_msgSend(v17, "state") != (_DWORD)v4)
            -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", v4, v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v14);
    }

  }
  if ((_DWORD)v4 == 4 && objc_msgSend(v66, "interactionType") == 2)
  {
    -[TUIKeyplaneView factory](self, "factory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v18, "allowsPaddles");

  }
  if ((_DWORD)v4 == 20)
    v19 = 1;
  else
    v19 = v7;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v26, "associatedTree");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "state");

        if (v19)
        {
          objc_msgSend(v26, "associatedTree");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29 != v66)
          {
            if (v28 == 16 || v28 == 4)
            {
              objc_msgSend(v26, "associatedTree");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setState:", 2);

            }
            objc_msgSend(v26, "removeFromSuperview");
            -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "removeObject:", v26);

          }
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v23);
  }

  -[TUIKeyplaneView activeKey](self, "activeKey");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v63;
  if (v33)
  {
    v35 = (void *)v33;
    v36 = -[TUIKeyplaneView dismissingKeyboardMenu](self, "dismissingKeyboardMenu");

    if (!v36 && v64 != (_DWORD)v4)
    {
      if ((v37 = objc_msgSend(v66, "selectedVariantIndex"), (_DWORD)v4 == 16)
        || v37 != 0x7FFFFFFFFFFFFFFFLL
        || (v64 != 1 ? (v38 = (_DWORD)v4 == 2) : (v38 = 0), v38 || v64 == 4))
      {
        -[TUIKeyplaneView activeKey](self, "activeKey");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "backingTree");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView cachedVariantViewForTree:state:](self, "cachedVariantViewForTree:state:", v54, v64);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "superview");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
          objc_msgSend(v55, "removeFromSuperview");
        -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "removeObject:", v55);

        if (v64)
          -[TUIKeyplaneView setActiveKey:](self, "setActiveKey:", 0);

        if (v19)
          goto LABEL_48;
LABEL_63:
        if (v63)
        {
          v52 = v63;
          v34 = v52;
        }
        else
        {
          +[TUIKey keyFromKBTree:](TUIKey, "keyFromKBTree:", v66);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView keyplane](self, "keyplane");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setKeyplane:", v59);

          objc_msgSend(v58, "setStyle:", -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle"));
          v52 = (id)objc_msgSend(objc_alloc(-[TUIKeyplaneView preferredKeyViewClass](self, "preferredKeyViewClass")), "initWithKey:", v58);
          -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKey:", v52, v65);

          v34 = 0;
        }
        goto LABEL_66;
      }
    }
  }
  if (!v19)
    goto LABEL_63;
LABEL_48:
  if (!v63)
  {
    -[TUIKeyplaneView viewForBaseKey:](self, "viewForBaseKey:", v66);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[TUIKey keyFromKBTree:](TUIKey, "keyFromKBTree:", v66);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView keyplane](self, "keyplane");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setKeyplane:", v40);

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setStyle:", objc_msgSend(v41, "keyStyleForLayoutClass:", objc_msgSend(v42, "layoutClass")));

  -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v39, v65);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView setActiveKey:](self, "setActiveKey:", v39);
  if (v43)
  {
    objc_msgSend(v43, "superview");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TUIKeyplaneView window](self, "window");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "rootViewController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addSubview:", v43);

      objc_msgSend(v34, "popupMenu");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
        objc_msgSend(v43, "updateVariantsIfNeededForKey:", v66);
      -[TUIKeyplaneView presentSelectorView:fromBaseKey:](self, "presentSelectorView:fromBaseKey:", v43, v34);
      -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView setActiveVariantViews:](self, "setActiveVariantViews:", v50);

      }
      -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObject:", v43);

      objc_msgSend(v43, "layoutIfNeeded");
    }
  }

  v52 = 0;
LABEL_66:
  objc_msgSend(v52, "setAlpha:", 1.0);
  if ((_DWORD)v4 != 16)
  {
    -[TUIKeyplaneView keyplaneRenderConfig](self, "keyplaneRenderConfig");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setRenderConfig:", v61);

    -[TUIKeyplaneView factory](self, "factory");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFactory:", v62);

  }
  if (v64 != (_DWORD)v4)
    -[TUIKeyplaneView updateFrameForKey:](self, "updateFrameForKey:", v66);
  objc_msgSend(v52, "updateStateFrom:to:", v64, v4);

}

- (void)deactivateKey:(id)a3 previousState:(int)a4
{
  id v4;

  -[TUIKeyplaneView viewForKey:](self, "viewForKey:", a3, *(_QWORD *)&a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDisplay");

}

- (void)presentSelectorView:(id)a3 fromBaseKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  TUIKeyplaneView *v37;
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
  id v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[3];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "baseKeyLayoutGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v42;
    objc_msgSend(v6, "baseKeyLayoutGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leftAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v38;
    objc_msgSend(v8, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baseKeyLayoutGuide");
    v50 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v14;
    objc_msgSend(v50, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baseKeyLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v37 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObjectsFromArray:", v20);

    v8 = v50;
    objc_msgSend(v50, "popupMenu");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[TUIKeyplaneView setDismissingKeyboardMenu:](v37, "setDismissingKeyboardMenu:", 0);
      objc_msgSend(v50, "popupMenu");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", 1.0);
      objc_msgSend(v6, "setAlpha:", 1.0);
      objc_msgSend(v22, "frame");
      if (v23 < 0.0)
      {
        objc_msgSend(v22, "frame");
        objc_msgSend(v22, "setFrame:", 0.0);
      }
      objc_msgSend(v6, "setPopupDelegate:", v37);
      -[TUIKeyplaneView window](v37, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rootViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bringSubviewToFront:", v22);

      objc_msgSend(v6, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v27);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v48;
      objc_msgSend(v6, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v28;
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v30;
      objc_msgSend(v6, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v49;
      objc_msgSend(v49, "addObjectsFromArray:", v34);

      v36 = v44;
      v8 = v50;
    }
    else
    {
      objc_msgSend(v6, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView keyboardContentView](v37, "keyboardContentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v27);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v48;
      -[TUIKeyplaneView keyboardContentView](v37, "keyboardContentView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v49;
      objc_msgSend(v49, "addObjectsFromArray:", v32);
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v35);
  }

}

- (void)tappedToDismissSelector
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
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  -[TUIKeyplaneView activeKey](self, "activeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[TUIKeyplaneView dismissingKeyboardMenu](self, "dismissingKeyboardMenu")
    && objc_msgSend(v4, "interactionType") == 9)
  {
    -[TUIKeyplaneView viewForBaseKey:](self, "viewForBaseKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popupMenu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TUIKeyplaneView activeKey](self, "activeKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v4, 16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUIKeyplaneView activeVariantViews](self, "activeVariantViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v9);

      -[TUIKeyplaneView setDismissingKeyboardMenu:](self, "setDismissingKeyboardMenu:", 1);
      -[TUIKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v4);
      -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v4);
      v11 = (void *)MEMORY[0x1E0DC3F10];
      -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "layoutClass") == 1)
        v13 = 0.5;
      else
        v13 = 0.1;
      v14 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke;
      v19[3] = &unk_1E24FC1F8;
      v20 = v5;
      v21 = v9;
      v16[0] = v14;
      v16[1] = 3221225472;
      v16[2] = __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke_2;
      v16[3] = &unk_1E24FC120;
      v16[4] = self;
      v17 = v20;
      v18 = v21;
      v15 = v21;
      objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 50331648, v19, v16, v13, 0.0);

    }
    else
    {
      -[TUIKeyplaneView setDismissingKeyboardMenu:](self, "setDismissingKeyboardMenu:", 0);
      -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v4);
    }

  }
}

- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4
{
  -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:isDragging:](self, "changingSelectedVariantForKey:atPoint:isDragging:", a3, 0, a4.x, a4.y);
}

- (void)changingSelectedVariantForKey:(id)a3 atPoint:(CGPoint)a4 isDragging:(BOOL)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;

  y = a4.y;
  x = a4.x;
  v29 = a3;
  -[TUIKeyplaneView activeKey](self, "activeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backingTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKeyplaneView activeKey](self, "activeKey");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = objc_msgSend(v10, "state");

    if (v13 == 16)
    {
      -[TUIKeyplaneView activeKey](self, "activeKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v10, 16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_11;
      objc_msgSend(v16, "bounds");
      if (CGRectIsEmpty(v30))
        goto LABEL_11;
      -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
      v18 = v17;
      v20 = v19;
      -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "effectsType") == 1 && a5)
      {

      }
      else
      {
        v22 = objc_msgSend(v16, "pointInside:withEvent:", 0, v18, v20);

        if ((v22 & 1) == 0)
        {
          objc_msgSend(v10, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
          -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v10);
          goto LABEL_11;
        }
      }
      objc_msgSend(v16, "updateSelectorForPoint:", v18, v20);
LABEL_11:

    }
  }
  if (objc_msgSend(v10, "state") == 16 && (objc_msgSend(v10, "isEqual:", v29) & 1) == 0)
  {
    -[TUIKeyplaneView cachedVariantViewForTree:](self, "cachedVariantViewForTree:", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "bounds");
      if (!CGRectIsEmpty(v31))
      {
        -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v24, x, y);
        v26 = v25;
        v28 = v27;
        if (objc_msgSend(v24, "pointInside:withEvent:", 0))
        {
          objc_msgSend(v24, "updateSelectorForPoint:", v26, v28);
        }
        else
        {
          objc_msgSend(v29, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
          -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v29);
        }
      }
    }

  }
}

- (void)finishedSelectingVariantForKey:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  y = a4.y;
  x = a4.x;
  v17 = a3;
  if (objc_msgSend(v17, "interactionType") == 9)
  {
    -[TUIKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v17);
  }
  else
  {
    -[TUIKeyplaneView activeKey](self, "activeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backingTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUIKeyplaneView activeKey](self, "activeKey");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(v8, "state");

      if (v11 == 16)
      {
        -[TUIKeyplaneView activeKey](self, "activeKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v8, 16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "bounds");
          if (!CGRectIsEmpty(v18))
          {
            -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
            if (objc_msgSend(v14, "pointInside:withEvent:", 0))
            {
              objc_msgSend(v14, "finishVariantSelection");
            }
            else
            {
              objc_msgSend(v8, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
              -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v8);
            }
          }
        }

      }
    }
    if ((objc_msgSend(v8, "isEqual:", v17) & 1) == 0 && objc_msgSend(v8, "state") == 16)
    {
      -[TUIKeyplaneView cachedVariantViewForTree:](self, "cachedVariantViewForTree:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "bounds");
        if (!CGRectIsEmpty(v19))
        {
          -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
          if (objc_msgSend(v16, "pointInside:withEvent:", 0))
          {
            objc_msgSend(v16, "finishVariantSelection");
          }
          else
          {
            objc_msgSend(v17, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
            -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v17);
          }
        }
      }

    }
  }

}

- (id)hitTestVariantKeyAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL IsEmpty;
  void *v14;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  -[TUIKeyplaneView activeKey](self, "activeKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingTree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v8 == 16)
  {
    objc_msgSend(v6, "backingTree");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView cachedVariantViewForTree:](self, "cachedVariantViewForTree:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "superview");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11
      && (v12 = (void *)v11, objc_msgSend(v10, "bounds"), IsEmpty = CGRectIsEmpty(v16), v12, !IsEmpty))
    {
      -[TUIKeyplaneView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      v14 = 0;
      if (objc_msgSend(v10, "pointInside:withEvent:", 0))
      {
        objc_msgSend(v6, "backingTree");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "dimKeyUsingOpacities:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)deactivateKeys
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  int v18;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[NSMutableDictionary allValues](self->_delayedDeactivationKeys, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = v5;
    v2 = *(void **)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void **)v36 != v2)
          objc_enumerationMutation(v4);
        -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v14, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "state");

        if (v16 == 16 || v16 == 4)
        {
          objc_msgSend(v14, "key");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v2, "avoidAutoDeactivation") ^ 1;
        }
        else
        {
          v18 = 0;
        }
        if (v16 == 16 || v16 == 4)

        if (v18)
        {
          objc_msgSend(v14, "key");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v20);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v11);
  }

  -[TUIKeyplaneView activeKey](self, "activeKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TUIKeyplaneView activeKey](self, "activeKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView activeKey](self, "activeKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backingTree");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v24, 16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v26, "bounds");
      if (!CGRectIsEmpty(v42))
      {
        -[TUIKeyplaneView activeKey](self, "activeKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "backingTree");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);

        -[TUIKeyplaneView activeKey](self, "activeKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "backingTree");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v30);

      }
    }
    -[TUIKeyplaneView setActiveKey:](self, "setActiveKey:", 0);

  }
}

- (void)deactivateAdaptiveKey:(id)a3
{
  id v4;

  v4 = a3;
  -[TUIKeyplaneView setState:forKey:](self, "setState:forKey:", 2, v4);
  -[TUIKeyplaneView removeKeyFromDelayedDeactivationSet:](self, "removeKeyFromDelayedDeactivationSet:", v4);
  -[TUIKeyplaneView deactivateKey:previousState:](self, "deactivateKey:previousState:", v4, objc_msgSend(v4, "state"));

}

- (void)addKeyToDelayedDeactivationSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSMutableDictionary *delayedDeactivationKeys;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "displayTypeHint") == 10)
    {
      -[TUIKeyplaneView viewForKey:](self, "viewForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endingTransitionDuration");
      v7 = 0.059;
      if (v8 > 0.059)
      {
        objc_msgSend(v6, "endingTransitionDuration");
        v7 = v9;
      }

    }
    else
    {
      v7 = 0.059;
    }
    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](delayedDeactivationKeys, "setObject:forKey:", v5, v11);

    v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__TUIKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke;
    v13[3] = &unk_1E24FC1F8;
    v13[4] = self;
    v14 = v5;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);

  }
}

- (void)removeKeyFromDelayedDeactivationSet:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *delayedDeactivationKeys;
  void *v7;
  id v8;

  v8 = a3;
  if (v8 && -[NSMutableDictionary count](self->_delayedDeactivationKeys, "count"))
  {
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "effectsType");

    if (v5 == 1)
      objc_msgSend(v8, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    objc_msgSend(v8, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](delayedDeactivationKeys, "removeObjectForKey:", v7);

  }
}

- (int)stateForKey:(id)a3
{
  return objc_msgSend(a3, "state");
}

- (BOOL)_shouldAllowKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "visible"))
    goto LABEL_6;
  -[UIKBTree keys](self->_keyplane, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v4))
  {
    objc_msgSend(v4, "parentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }

LABEL_5:
  v7 = 1;
LABEL_7:

  return v7;
}

- (id)variantViewForKey:(id)a3 cacheID:(id)a4
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

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(v6, "backingTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingTree");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v8, objc_msgSend(v9, "state"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[TUIKeyplaneView storedVariantViews](self, "storedVariantViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKeyplaneView factory](self, "factory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingTree");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView keyplane](self, "keyplane");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitsForKey:onKeyplane:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setRenderTraits:", v15);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "selectorViewClassForKey:", v6)), "initWithKey:renderTraits:", v6, v15);
    -[TUIKeyplaneView storedVariantViews](self, "storedVariantViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v11, v7);

  }
  -[TUIKeyplaneView renderConfig](self, "renderConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateBackgroundMaterialsForRenderConfig:", v17);

  objc_msgSend(v11, "setTouchesForwardingView:", self);
  return v11;
}

- (id)cachedVariantViewForTree:(id)a3
{
  return -[TUIKeyplaneView cachedVariantViewForTree:state:](self, "cachedVariantViewForTree:state:", a3, 16);
}

- (id)cachedVariantViewForTree:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView storedVariantViews](self, "storedVariantViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUIKeyplaneView factory](self, "factory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keyplane](self, "keyplane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitsForKey:onKeyplane:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setRenderTraits:", v12);
    -[TUIKeyplaneView renderConfig](self, "renderConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateBackgroundMaterialsForRenderConfig:", v13);

    objc_msgSend(v9, "setTouchesForwardingView:", self);
  }

  return v9;
}

- (id)keyViewForTree:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v4, objc_msgSend(v4, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "displayTypeHint") == 10 && !v7)
  {
    -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v4, 4);
    v8 = objc_claimAutoreleasedReturnValue();

    -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v7;
}

- (id)viewForBaseKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", a3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)renderConfigForCurrentTraitCollection
{
  void *v2;
  uint64_t v3;

  -[TUIKeyplaneView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    objc_msgSend(MEMORY[0x1E0DC38F8], "darkConfig");
  else
    objc_msgSend(MEMORY[0x1E0DC38F8], "defaultConfig");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setRenderConfig:(id)a3
{
  id v4;
  UIKBRenderConfig *renderConfig;
  int v6;
  int v7;
  UIKBRenderConfig *v8;
  UIKBRenderConfig *v9;
  void *v10;
  UIKBRenderConfig *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    v6 = -[UIKBRenderConfig lightKeyboard](renderConfig, "lightKeyboard");
    v7 = v6 ^ objc_msgSend(v4, "lightKeyboard") ^ 1;
    if (v4)
    {
LABEL_3:
      v8 = (UIKBRenderConfig *)v4;
      goto LABEL_6;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
    if (v4)
      goto LABEL_3;
  }
  -[TUIKeyplaneView renderConfigForCurrentTraitCollection](self, "renderConfigForCurrentTraitCollection");
  v8 = (UIKBRenderConfig *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = self->_renderConfig;
  self->_renderConfig = v8;

  -[UIKBRenderFactory renderingContext](self->_factory, "renderingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_renderConfig;
    -[UIKBRenderFactory renderingContext](self->_factory, "renderingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRenderConfig:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3908], "renderingContextForRenderConfig:", self->_renderConfig);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIsFloating:", objc_msgSend(v14, "isFloating"));

    }
    else
    {
      objc_msgSend(v12, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
    }

    -[UIKBRenderFactory setRenderingContext:](self->_factory, "setRenderingContext:", v12);
  }

  if (v4)
    v15 = v7;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
    -[TUIKeyplaneView setNeedsDisplay](self, "setNeedsDisplay");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v22, "setRenderConfig:", self->_renderConfig);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

}

- (id)keyplaneRenderConfig
{
  UIKBRenderConfig *renderConfig;
  UIKBRenderConfig *v4;
  UIKBRenderConfig *v5;

  renderConfig = self->_renderConfig;
  if (!renderConfig)
  {
    -[TUIKeyplaneView renderConfigForCurrentTraitCollection](self, "renderConfigForCurrentTraitCollection");
    v4 = (UIKBRenderConfig *)objc_claimAutoreleasedReturnValue();
    v5 = self->_renderConfig;
    self->_renderConfig = v4;

    renderConfig = self->_renderConfig;
  }
  return renderConfig;
}

- (void)setRenderingContext:(id)a3
{
  int v5;
  int v6;
  UIKBRenderFactory *factory;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(v8, "isFloating");
  v6 = -[UIKBRenderingContext isFloating](self->_renderingContext, "isFloating");
  objc_storeStrong((id *)&self->_renderingContext, a3);
  -[TUIKeyplaneView _generateRenderingContextIfNeeded](self, "_generateRenderingContextIfNeeded");
  if (v5 == v6 && (factory = self->_factory) != 0)
    -[UIKBRenderFactory setRenderingContext:](factory, "setRenderingContext:", self->_renderingContext);
  else
    -[TUIKeyplaneView _regenerateFactoryPreservingUpdates:](self, "_regenerateFactoryPreservingUpdates:", 0);

}

- (void)_updateRenderingContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderingContext setKeyboardType:](self->_renderingContext, "setKeyboardType:", objc_msgSend(v4, "keyboardType"));

  -[TUIKeyplaneView screenTraits](self, "screenTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderingContext setIsFloating:](self->_renderingContext, "setIsFloating:", objc_msgSend(v5, "isFloating"));

  }
  else
  {
    -[UIKBRenderingContext setIsFloating:](self->_renderingContext, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
  }

}

- (void)_generateRenderingContextIfNeeded
{
  void *v3;
  void *v4;
  UIKBRenderingContext *v5;
  UIKBRenderingContext *renderingContext;

  if (!self->_renderingContext)
  {
    v3 = (void *)MEMORY[0x1E0DC3908];
    -[TUIKeyplaneView keyplaneRenderConfig](self, "keyplaneRenderConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "renderingContextForRenderConfig:", v4);
    v5 = (UIKBRenderingContext *)objc_claimAutoreleasedReturnValue();
    renderingContext = self->_renderingContext;
    self->_renderingContext = v5;

  }
  -[TUIKeyplaneView _updateRenderingContext](self, "_updateRenderingContext");
}

- (void)_generateFactoryIfNeeded
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  UIKBRenderFactory *v10;
  UIKBRenderFactory *factory;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  char v20;
  id v21;

  if (!self->_factory)
  {
    -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[TUIKeyplaneView _generateRenderingContextIfNeeded](self, "_generateRenderingContextIfNeeded");
    v3 = -[UIKBTree visualStyling](self->_keyplane, "visualStyling");
    v4 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    v5 = 128;
    if (!v4)
      v5 = 0;
    v6 = v3 & 0xFFFFFFFFFFFFFF3FLL | v5 | 0x40;
    -[UIKBTree setVisualStyling:](self->_keyplane, "setVisualStyling:", v6);
    -[TUIKeyplaneView renderingContext](self, "renderingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHandBias:", 0);

    v8 = (void *)MEMORY[0x1E0DC3900];
    -[TUIKeyplaneView renderingContext](self, "renderingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "factoryForVisualStyle:renderingContext:", v6, v9);
    v10 = (UIKBRenderFactory *)objc_claimAutoreleasedReturnValue();
    factory = self->_factory;
    self->_factory = v10;

    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    -[UIKBRenderFactory setScale:](self->_factory, "setScale:");

    UIKeyboardGetCurrentInputMode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory setPreferStringKeycapOverImage:](self->_factory, "setPreferStringKeycapOverImage:", UIKeyboardUIPreferStringOverImageForInputMode());

    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:", 1.0, 1.0);
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stretchFactor");
    if (v16 != 1.0)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stretchFactor");
      if (v18 <= 0.0)
      {

      }
      else
      {
        -[TUIKeyplaneView screenTraits](self, "screenTraits");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isFloating");

        if ((v20 & 1) != 0)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          -[UIKBRenderFactory setAllowsPaddles:](self->_factory, "setAllowsPaddles:", objc_msgSend(v21, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1B0]));

          return;
        }
        -[TUIKeyplaneView screenTraits](self, "screenTraits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stretchFactor");
        -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:");
      }
    }

    goto LABEL_10;
  }
}

- (void)_regenerateFactoryPreservingUpdates:(BOOL)a3
{
  UIKBRenderFactory *factory;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIKBRenderFactory *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  factory = self->_factory;
  if (factory && a3)
  {
    v5 = -[UIKBRenderFactory preferStringKeycapOverImage](factory, "preferStringKeycapOverImage");
    v6 = -[UIKBRenderFactory allowsPaddles](self->_factory, "allowsPaddles");
    -[UIKBRenderFactory stretchFactor](self->_factory, "stretchFactor");
    v8 = v7;
    v10 = v9;
    v11 = self->_factory;
    self->_factory = 0;

    -[TUIKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
    -[UIKBRenderFactory setPreferStringKeycapOverImage:](self->_factory, "setPreferStringKeycapOverImage:", v5);
    -[UIKBRenderFactory setAllowsPaddles:](self->_factory, "setAllowsPaddles:", v6);
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:", v8, v10);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
          v19 = -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle");
          -[TUIKeyplaneView factory](self, "factory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "updateKeysInRowWithStyle:factory:", v19, v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
  else
  {
    self->_factory = 0;

    -[TUIKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  }
}

- (UIKBRenderFactory)factory
{
  void *v3;
  UIKBRenderFactory **p_factory;
  void *v5;
  _BOOL8 v6;

  -[TUIKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  -[TUIKeyplaneView screenTraits](self, "screenTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isKeyboardMinorEdgeWidth") & 1) != 0)
  {
    p_factory = &self->_factory;
    -[UIKBRenderFactory setDynamicFactory:](*p_factory, "setDynamicFactory:", 1);
  }
  else
  {
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v5, "isFloating") & 1) != 0 || -[TUIKeyplaneView currentHandBias](self, "currentHandBias") != 0;
    p_factory = &self->_factory;
    -[UIKBRenderFactory setDynamicFactory:](*p_factory, "setDynamicFactory:", v6);

  }
  return *p_factory;
}

- (void)setOverrideScreenTraits:(id)a3
{
  UIKBScreenTraits *v5;
  UIKBRenderFactory *factory;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (UIKBScreenTraits *)a3;
  if (self->_screenTraits == v5)
  {
    -[TUIKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
  }
  else
  {
    objc_storeStrong((id *)&self->_screenTraits, a3);
    factory = self->_factory;
    self->_factory = 0;

    -[TUIKeyplaneView _generateFactoryIfNeeded](self, "_generateFactoryIfNeeded");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle");
          -[TUIKeyplaneView factory](self, "factory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "updateKeysInRowWithStyle:factory:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

  }
  -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
  v17 = v16;
  v19 = v18;
  if (!-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit")
    && !-[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition"))
  {
    -[TUIKeyplaneView preferredSize](self, "preferredSize");
    if (v17 != v21 || v19 != v20)
    {
      -[TUIKeyplaneView screenTraits](self, "screenTraits");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keyboardWidth");
      v24 = v23;

      if (v24 > 0.0)
        -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v17, v19);
    }
  }

}

- (UIEdgeInsets)keycapInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[TUIKeyplaneView standardKeyInsets](self, "standardKeyInsets");
  if (v6 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
    && v3 == *MEMORY[0x1E0DC49E8]
    && v5 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
    && v4 == *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    -[TUIKeyplaneView factory](self, "factory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dynamicInsetsForNumberOfRows:", objc_msgSend(v11, "numberOfRows"));
    -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:");

  }
  -[TUIKeyplaneView standardKeyInsets](self, "standardKeyInsets");
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)keyplaneInsets
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  char v36;
  double v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  UIEdgeInsets result;

  v3 = MEMORY[0x1E0DC49E8];
  v4 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "effectsType");

  if (v8 == 1)
  {
    v9 = *(double *)(v3 + 8);
  }
  else
  {
    -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
    v9 = v14;
    -[TUIKeyplaneView screenTraits](self, "screenTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isKeyboardMinorEdgeWidth");

    if (v16)
      v17 = 1;
    else
      v17 = 4;
    objc_msgSend(MEMORY[0x1E0DC3958], "deviceSpecificPaddingForInterfaceOrientation:inputMode:", v17, 0);
    v19 = v18;
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "layoutClass");

    switch(v21)
    {
      case 1:
        -[TUIKeyplaneView preferredSize](self, "preferredSize");
        if (v22 <= 400.0)
        {
          v24 = 0;
        }
        else
        {
          -[TUIKeyplaneView screenTraits](self, "screenTraits");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isKeyboardMinorEdgeWidth");

        }
        v33 = 10.0;
        if (v19 >= 10.0)
        {
          if (!v16)
            v33 = 16.0;
          if (v24)
            v6 = 12.0;
          else
            v6 = v33;
        }
        else
        {
          if (v24)
            v34 = 2.0;
          else
            v34 = 1.0;
          -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
          v6 = v34 - v35;
          if (-[TUIKeyplaneView currentHandBias](self, "currentHandBias"))
            v36 = v16;
          else
            v36 = 0;
          if ((v36 & 1) == 0)
          {
            if (v16)
              v5 = 0.0;
            else
              v5 = 68.0;
            -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
            v9 = v5 + v37;
          }
        }
        v38 = 5.0;
        if (v24)
          v38 = 0.0;
        if (v16)
          v4 = 7.0;
        else
          v4 = v38;
        if (-[TUIKeyplaneView currentHandBias](self, "currentHandBias", v38))
          v39 = v16;
        else
          v39 = 0;
        if (v39 == 1)
        {
          -[TUIKeyplaneView preferredSize](self, "preferredSize");
          if (v40 <= 0.0)
          {
            -[TUIKeyplaneView bounds](self, "bounds");
            v41 = v47;
          }
          else
          {
            -[TUIKeyplaneView preferredSize](self, "preferredSize");
          }
          v42 = v41 - *MEMORY[0x1E0DC5B40];
          if (-[TUIKeyplaneView currentHandBias](self, "currentHandBias") == 2)
          {
            -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
            v9 = v48;
          }
          else if (-[TUIKeyplaneView currentHandBias](self, "currentHandBias") == 1)
          {
            v9 = v42;
            v42 = 0.0;
          }
          else
          {
            v42 = v5;
          }
        }
        else
        {
          v42 = v5;
        }
        if (-[TUIKeyplaneView isFloating](self, "isFloating"))
        {
          v4 = v4 + 3.0;
          v9 = v9 * 0.5;
          -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
          v50 = v49 * 0.5;
          -[TUIKeyplaneView trailingTieConstraint](self, "trailingTieConstraint");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setConstant:", v50);

        }
        v5 = v42;
        break;
      case 2:
        if (v19 + -3.0 >= 0.0)
          v6 = v19 + -3.0;
        else
          v6 = 0.0;
        if (v16)
          v4 = 7.0;
        else
          v4 = 10.0;
        -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
        v31 = v30;
        -[TUIKeyplaneView trailingTieConstraint](self, "trailingTieConstraint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setConstant:", v31);

        v5 = v31 * 0.5;
        v9 = v5;
        break;
      case 3:
        if (v19 + -3.0 >= 0.0)
          v6 = v19 + -3.0;
        else
          v6 = 0.0;
        if (v16)
          v4 = 7.0;
        else
          v4 = 10.0;
        -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
        v9 = v9 + v25 * 0.5;
        -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
        v5 = v5 + v26 * 0.5;
        break;
      case 4:
        if (v16)
          v4 = 5.0;
        else
          v4 = 7.0;
        v6 = v19 - v4;
        if (v19 - v4 < 0.0)
        {
          v27 = v6 * 0.5;
          -[TUIKeyplaneView screenTraits](self, "screenTraits");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isKeyboardMinorEdgeWidth");

          if (v29)
            v6 = v27 + 0.5;
          else
            v6 = v27 + -0.5;
        }
        -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
        v9 = v43 * 0.5;
        -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
        v45 = v44 * 0.5;
        -[TUIKeyplaneView trailingTieConstraint](self, "trailingTieConstraint");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setConstant:", v45);

        break;
      default:
        break;
    }
  }
  v10 = v4;
  v11 = v9;
  v12 = v6;
  v13 = v5;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGRect)updateFrameForKey:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  char v56;
  void *v57;
  int v58;
  int v59;
  BOOL IsEmpty;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect result;
  CGRect v80;
  CGRect v81;

  v4 = a3;
  objc_msgSend(v4, "paddedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[TUIKeyplaneView viewForKey:](self, "viewForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "frame");
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v80.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
    v80.origin.y = v16;
    v80.size.width = v17;
    v80.size.height = v18;
    if (!CGRectEqualToRect(v76, v80))
    {
      -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "rowNumber"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "frame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v14, "superview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 == v21)
      {
        objc_msgSend(v14, "frame");
        -[TUIKeyplaneView convertRect:fromView:](self, "convertRect:fromView:", v21);
        v23 = v31;
        v25 = v32;
        v27 = v33;
        v29 = v34;
      }
      -[TUIKeyplaneView keycapInsets](self, "keycapInsets");
      v74 = v25;
      v75 = v23;
      v72 = v29;
      v73 = v27;
      v70 = v36;
      v71 = v35;
      v68 = v38;
      v69 = v37;
      UIRectInset();
      v6 = v40;
      v8 = v41;
      v10 = v39;
      v12 = v42;
      if (v42 <= 0.0 || v39 <= 0.0)
        goto LABEL_29;
      if (objc_msgSend(v14, "layoutShape") != 2)
      {
        objc_msgSend(v4, "setFrame:", v75, v74, v73, v72);
        objc_msgSend(v4, "setPaddedFrame:", v6, v8, v10, v12);
LABEL_28:
        objc_msgSend(v14, "setDrawFrame:", v6, v8, v10, v12);
        objc_msgSend(v14, "setNeedsDisplay");
        objc_msgSend(v14, "prepareForDisplay");
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v4, "paddedFrame");
      v81.origin.x = v15;
      v81.origin.y = v16;
      v81.size.width = v17;
      v81.size.height = v18;
      if (CGRectEqualToRect(v77, v81) || (objc_msgSend(v4, "frame"), v44 = v43, objc_msgSend(v14, "frame"), v44 != v45))
      {
        objc_msgSend(v4, "setFrame:", v75, v74, v73, v72);
        objc_msgSend(v4, "setPaddedFrame:", v6, v8, v10, v12);
      }
      -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "keysForName:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v48, "count") < 2)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v4, "isEqual:", v49);
      v52 = v50;
      if ((v51 & 1) == 0 && (v53 = objc_msgSend(v4, "isEqual:", v50), v52 = v49, !v53)
        || (-[TUIKeyplaneView viewForKey:](self, "viewForKey:", v52), (v54 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_26:

        goto LABEL_27;
      }
      v67 = (void *)v54;
      objc_msgSend(v14, "shapeWhenMergedWithKey:insets:", v71, v70, v69, v68);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isEmpty");
      -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isGridLayout");
      v59 = v58;
      if ((v56 & 1) != 0)
      {
        if (v58)
        {
          v78.origin.x = v6;
          v78.origin.y = v8;
          v78.size.width = v10;
          v78.size.height = v12;
          IsEmpty = CGRectIsEmpty(v78);

          v61 = v55;
          v62 = v67;
          if (!IsEmpty)
          {
            objc_msgSend(v49, "setFrame:", v75, v74, v73, v72);
            objc_msgSend(v49, "setPaddedFrame:", v6, v8, v10, v12);
            objc_msgSend(v50, "setFrame:", v75, v74, v73, v72);
            objc_msgSend(v50, "setPaddedFrame:", v6, v8, v10, v12);
          }
          goto LABEL_25;
        }

        v61 = v55;
      }
      else
      {

        v61 = v55;
        if (v59)
        {
          objc_msgSend(v55, "frame");
          objc_msgSend(v49, "setFrame:");
          objc_msgSend(v55, "paddedFrame");
          objc_msgSend(v49, "setPaddedFrame:");
          objc_msgSend(v55, "frame");
          objc_msgSend(v50, "setFrame:");
          objc_msgSend(v55, "paddedFrame");
          objc_msgSend(v50, "setPaddedFrame:");
        }
        else
        {
          objc_msgSend(v49, "setShape:", v55);
          objc_msgSend(v50, "setShape:", v55);
        }
      }
      v62 = v67;
LABEL_25:

      goto LABEL_26;
    }
  }
LABEL_30:

  v63 = v6;
  v64 = v8;
  v65 = v10;
  v66 = v12;
  result.size.height = v66;
  result.size.width = v65;
  result.origin.y = v64;
  result.origin.x = v63;
  return result;
}

- (BOOL)supportsSplit
{
  void *v2;
  BOOL v3;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutClass") == 2;

  return v3;
}

- (BOOL)isSplit
{
  _BOOL4 v3;

  v3 = -[TUIKeyplaneView supportsSplit](self, "supportsSplit");
  if (v3)
  {
    v3 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    if (v3)
      LOBYTE(v3) = !-[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition");
  }
  return v3;
}

- (void)createSplitLayoutIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
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
  id v63;
  _QWORD v64[7];

  v64[5] = *MEMORY[0x1E0C80C00];
  if (-[TUIKeyplaneView supportsSplit](self, "supportsSplit"))
  {
    -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
          return;
      }
      else
      {

      }
    }
    -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView setSplitTransitionLayoutGuides:](self, "setSplitTransitionLayoutGuides:", v10);

    }
    -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("TUIKBSplitGuide_Middle"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v12 == 0;
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(v12, "setIdentifier:", CFSTR("TUIKBSplitGuide_Middle"));
      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("TUIKBSplitGuide_Middle"));

    }
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v12);
    -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("TUIKBSplitGuide_Left"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(v16, "setIdentifier:", CFSTR("TUIKBSplitGuide_Left"));
      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("TUIKBSplitGuide_Left"));

      v13 = 1;
    }
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v16);
    -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("TUIKBSplitGuide_Right"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(v19, "setIdentifier:", CFSTR("TUIKBSplitGuide_Right"));
      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("TUIKBSplitGuide_Right"));

      v13 = 1;
    }
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v19);
    -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("TUIKBSplitGuide_Padding"));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(v22, "setIdentifier:", CFSTR("TUIKBSplitGuide_Padding"));
      -[TUIKeyplaneView splitTransitionLayoutGuides](self, "splitTransitionLayoutGuides");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v22, CFSTR("TUIKBSplitGuide_Padding"));

    }
    -[TUIKeyplaneView addLayoutGuide:](self, "addLayoutGuide:", v22);
    if (v13)
    {
      v56 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v16, "leftAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneView leftAnchor](self, "leftAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToAnchor:", v61);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v60;
      objc_msgSend(v12, "leftAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rightAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v58);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v57;
      objc_msgSend(v22, "leftAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leftAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v54);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v53;
      objc_msgSend(v12, "rightAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintEqualToAnchor:constant:", v24, 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v64[3] = v25;
      -[TUIKeyplaneView rightAnchor](self, "rightAnchor");
      v63 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v64[4] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "activateConstraints:", v29);

      v12 = v63;
    }
    -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
    v31 = v30;
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v33 = v32;
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    v35 = (v31 - (v33 + v34)) * 0.5;
    v36 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    if (v36)
      v38 = -0.0;
    else
      v38 = v35;
    v39 = v37 + v38;
    v40 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    if (v40)
      v42 = -0.0;
    else
      v42 = v35;
    v43 = v41 + v42;
    objc_msgSend(v22, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setKeySizeSpacer:](self, "setKeySizeSpacer:", v45);

    objc_msgSend(v12, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setSplitSpacing:](self, "setSplitSpacing:", v47);

    objc_msgSend(v16, "widthAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToConstant:", v39);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setLeftSplitWidth:](self, "setLeftSplitWidth:", v49);

    objc_msgSend(v19, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", v43);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView setRightSplitWidth:](self, "setRightSplitWidth:", v51);

  }
}

- (void)prepareForSplitTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!-[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition"))
  {
    -[TUIKeyplaneView deactivateKeys](self, "deactivateKeys");
    -[TUIKeyplaneView createSplitLayoutIfNeeded](self, "createSplitLayoutIfNeeded");
    -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
    v4 = v3;
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v6 = v5;
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    v8 = (v4 - (v6 + v7)) * 0.5;
    v9 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    if (v9)
      v11 = -0.0;
    else
      v11 = v8;
    v12 = v10 + v11;
    v13 = -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit");
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    if (v13)
      v15 = -0.0;
    else
      v15 = v8;
    v16 = v14 + v15;
    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", v12);

    -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", v16);

    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v20 = v19;
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    v22 = vabdd_f64(v20, v21) + 20.0;
    -[TUIKeyplaneView transitionProgress](self, "transitionProgress");
    v24 = v23 * v22;
    -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", v24);

    -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1148829696;
    objc_msgSend(v26, "setPriority:", v27);

    -[TUIKeyplaneView _regenerateFactoryPreservingUpdates:](self, "_regenerateFactoryPreservingUpdates:", 0);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v35 = -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle");
          -[TUIKeyplaneView factory](self, "factory");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "updateKeysInRowWithStyle:factory:", v35, v36);

          objc_msgSend(v34, "updateKeysForTransition:", 1);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v31);
    }

    -[TUIKeyplaneView bottomSpacing](self, "bottomSpacing");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 0);

    -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 0);

    -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[TUIKeyplaneView setIsInSplitTransition:](self, "setIsInSplitTransition:", 1);
  }
}

- (void)updateSplitProgress:(double)a3
{
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  _QWORD v58[5];
  _QWORD v59[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0 || a3 == 1.0)
  {
    -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", -[TUIKeyplaneView isInSplitTransition](self, "isInSplitTransition") ^ 1);
    -[TUIKeyplaneView setIsInSplitTransition:](self, "setIsInSplitTransition:", 1);
    if (a3 == 0.0)
    {
      -[TUIKeyplaneView transitionProgress](self, "transitionProgress");
      if (v6 > 0.0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v66 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "toggleConstraintsForSplit:", 0);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
          }
          while (v10);
        }

        -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setConstant:", 0.0);

        -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setActive:", 1);

        -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setActive:", 0);

        -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setActive:", 0);

        v17 = (void *)MEMORY[0x1E0DC3F10];
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke;
        v64[3] = &unk_1E24FC068;
        v64[4] = self;
        v18 = &__block_literal_global_84;
        v19 = v64;
        goto LABEL_26;
      }
    }
  }
  else
  {
    -[TUIKeyplaneView setIsInSplitTransition:](self, "setIsInSplitTransition:", 1);
    -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 0);
    -[TUIKeyplaneView transitionProgress](self, "transitionProgress");
    if (v20 == 0.0 || (-[TUIKeyplaneView transitionProgress](self, "transitionProgress"), v21 == 1.0))
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v61 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "toggleConstraintsForSplit:", 1);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v25);
      }

      -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 0);

      -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setActive:", 1);

      v17 = (void *)MEMORY[0x1E0DC3F10];
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke_3;
      v59[3] = &unk_1E24FC068;
      v59[4] = self;
      v18 = &__block_literal_global_85;
      v19 = v59;
LABEL_26:
      objc_msgSend(v17, "animateWithDuration:animations:completion:", v19, v18, 0.1);
    }
  }
  v31 = 0.0;
  if (a3 >= 0.0)
    v31 = a3;
  if (a3 <= 1.0)
    v32 = v31;
  else
    v32 = 1.0;
  -[TUIKeyplaneView unsplitSize](self, "unsplitSize", v31);
  v34 = v33;
  -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
  v36 = v35;
  -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
  v38 = v34 - (v36 + v37);
  -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
  v40 = v39 + v38 * 0.5 * (1.0 - v32);
  -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setConstant:", v40);

  -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
  v43 = v42 + v38 * 0.5 * (1.0 - v32);
  -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setConstant:", v43);

  -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
  v46 = v45;
  -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
  v48 = vabdd_f64(v46, v47) + 20.0;
  if (v32 * v38 <= v48)
    v49 = v32 * v38;
  else
    v49 = v48;
  -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setConstant:", v49);

  -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  v52 = v51;
  -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
  v54 = v32 * (v52 - v53);
  -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  v56 = v55 - v54;
  -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setConstant:", v56);

  if (v32 > 0.6)
  {
    if (-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit"))
      goto LABEL_41;
    goto LABEL_40;
  }
  if (v32 < 0.6 && -[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit"))
  {
LABEL_40:
    -[TUIKeyplaneView setIsCurrentlySplit:](self, "setIsCurrentlySplit:", v32 > 0.6);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __39__TUIKeyplaneView_updateSplitProgress___block_invoke_5;
    v58[3] = &unk_1E24FC068;
    v58[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v58, 0, 0.1);
  }
LABEL_41:
  -[TUIKeyplaneView setTransitionProgress:](self, "setTransitionProgress:", v32);
}

- (void)transitionWillFinishWithProgress:(double)a3 completion:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v6 = a4;
  -[TUIKeyplaneView transitionProgress](self, "transitionProgress");
  v8 = vabdd_f64(a3, v7) / 3.0;
  -[TUIKeyplaneView finalLayoutForSplit:](self, "finalLayoutForSplit:", a3 != 0.0);
  -[TUIKeyplaneView setTransitionProgress:](self, "setTransitionProgress:", a3);
  v9 = (void *)MEMORY[0x1E0DC3F10];
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke;
  v13[3] = &unk_1E24FC068;
  v13[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke_2;
  v11[3] = &unk_1E24FC1A8;
  v11[4] = self;
  v10 = v6;
  objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 4, v13, v11, v8, 0.0);

}

- (void)finishSplitTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  v4 = v3;
  v6 = v5;
  -[TUIKeyplaneView transitionProgress](self, "transitionProgress");
  if (v7 == 1.0)
  {
    -[TUIKeyplaneView preferredSize](self, "preferredSize");
    v4 = v8;
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v6 = v9;
  }
  -[TUIKeyplaneView setIsInSplitTransition:](self, "setIsInSplitTransition:", 0);
  -[TUIKeyplaneView bottomSpacing](self, "bottomSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "updateKeysForTransition:", 0);
        if (-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit"))
          v18 = 1;
        else
          v18 = 2;
        -[TUIKeyplaneView factory](self, "factory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateKeysInRowWithStyle:factory:", v18, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  -[TUIKeyplaneView updateToSize:](self, "updateToSize:", v4, v6);
}

- (void)finalLayoutForSplit:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  if (-[TUIKeyplaneView isCurrentlySplit](self, "isCurrentlySplit") != a3)
    -[TUIKeyplaneView setIsCurrentlySplit:](self, "setIsCurrentlySplit:", v3);
  -[TUIKeyplaneView _regenerateFactoryPreservingUpdates:](self, "_regenerateFactoryPreservingUpdates:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[TUIKeyplaneView keyRowViews](self, "keyRowViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "toggleConstraintsForSplit:", v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  if (v3)
  {
    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v12 = v11;
    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    v14 = vabdd_f64(v12, v13) + 20.0;
    -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", v14);

    -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 0);

    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
    v18 = v17;
    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", v18);

    -[TUIKeyplaneView rightSplitSize](self, "rightSplitSize");
    v21 = v20;
    -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", v21);

    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    -[TUIKeyplaneView leftSplitSize](self, "leftSplitSize");
  }
  else
  {
    -[TUIKeyplaneView keySizeSpacer](self, "keySizeSpacer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", 0.0);

    -[TUIKeyplaneView splitSpacing](self, "splitSpacing");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[TUIKeyplaneView leftSplitWidth](self, "leftSplitWidth");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 0);

    -[TUIKeyplaneView rightSplitWidth](self, "rightSplitWidth");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 0);

    -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
    -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  }
  v30 = v25;
  -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setConstant:", v30);

}

- (CGSize)leftSplitSize
{
  double v2;
  double v3;
  CGSize result;

  -[TUIKeyplaneView splitSizeForRightSide:](self, "splitSizeForRightSide:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)rightSplitSize
{
  double v2;
  double v3;
  CGSize result;

  -[TUIKeyplaneView splitSizeForRightSide:](self, "splitSizeForRightSide:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)splitSizeForRightSide:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v3 = a3;
  if (a3)
    v5 = 280.0;
  else
    v5 = 266.0;
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finalSplitSizeForRightSide:", v3);
    v5 = v8;

    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finalHeightForSplitKeyboard");
    v11 = v10;

  }
  else
  {
    v11 = 205.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferencesActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rivenSizeFactor:", v5);
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0DC3978], "sharedPreferencesController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferencesActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rivenSizeFactor:", v11);
  v19 = v18;

  v20 = v15;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)sizeFromScreenTraitsAndClass
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[TUIKeyplaneView screenTraits](self, "screenTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView keyplane](self, "keyplane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUIKeyplane sizeFromScreenTraits:layout:layoutClass:](TUIKeyplane, "sizeFromScreenTraits:layout:layoutClass:", v3, v5, objc_msgSend(v6, "layoutClass"));
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)idealKeySizeforLayoutType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectsType");

  v6 = 60.0;
  v7 = 102.0;
  if (a3 != 7)
    v7 = 60.0;
  if (v5 != 1)
  {
    v7 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)rowsVerticalSpacing
{
  void *v2;
  uint64_t v3;
  double result;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectsType");

  result = 0.0;
  if (v3 == 1)
    return 12.0;
  return result;
}

- (UIEdgeInsets)rowInsets
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectsType");

  v4 = 0.0;
  v5 = 24.0;
  if (v3 != 1)
    v5 = 0.0;
  v6 = 0.0;
  v7 = v5;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)fullHeightForDockedKeyboard
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  v4 = v3;
  -[TUIKeyplaneView preferredSize](self, "preferredSize");
  if (v4 < v5)
  {
    -[TUIKeyplaneView sizeFromScreenTraitsAndClass](self, "sizeFromScreenTraitsAndClass");
    -[TUIKeyplaneView setUnsplitSize:](self, "setUnsplitSize:");
  }
  -[TUIKeyplaneView unsplitSize](self, "unsplitSize");
  return v6;
}

- (void)updateToSize:(CGSize)a3
{
  double width;
  double height;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _BOOL4 v19;
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
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;

  width = a3.width;
  if (a3.width >= 280.0)
  {
    height = a3.height;
    if (a3.height >= 140.0)
    {
      -[TUIKeyplaneView factory](self, "factory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v8 = v7;

      if (v8 > 0.0)
      {
        -[TUIKeyplaneView factory](self, "factory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "scale");
        v11 = ceil(height * v10);
        -[TUIKeyplaneView factory](self, "factory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        height = v11 / v13;

        -[TUIKeyplaneView factory](self, "factory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scale");
        v16 = ceil(width * v15);
        -[TUIKeyplaneView factory](self, "factory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scale");
        width = v16 / v18;

      }
      v19 = -[TUIKeyplaneView isFloating](self, "isFloating");
      -[TUIKeyplaneView sizeRatioConstraint](self, "sizeRatioConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActive:", 0);

      -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v19)
      {
        objc_msgSend(v21, "setActive:", 0);

        -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 0);

        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "heightAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "widthAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:multiplier:", v27, ceil(height) / width);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneView setSizeRatioConstraint:](self, "setSizeRatioConstraint:", v28);

        -[TUIKeyplaneView sizeRatioConstraint](self, "sizeRatioConstraint");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setActive:", 1);

        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bounds");
        -[TUIKeyplaneView setMaximumWidth:](self, "setMaximumWidth:", v31);
      }
      else
      {

        if (!v22)
        {
          -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "heightAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "constraintEqualToConstant:", height);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView setHeightConstraint:](self, "setHeightConstraint:", v34);

        }
        -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "widthAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "constraintEqualToConstant:", width);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView setPreferredWidthConstraint:](self, "setPreferredWidthConstraint:", v38);

          -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = 1144750080;
          objc_msgSend(v39, "setPriority:", v40);

        }
        -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setActive:", 1);

        -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setActive:", 1);
      }

      -[TUIKeyplaneView preferredSize](self, "preferredSize");
      if (v42 != height)
      {
        -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setConstant:", height);

      }
      -[TUIKeyplaneView preferredSize](self, "preferredSize");
      if (v44 != width)
      {
        -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setConstant:", width);

      }
      -[TUIKeyplaneView preferredSize](self, "preferredSize");
      v47 = v46;
      v49 = v48;
      -[TUIKeyplaneView setPreferredSize:](self, "setPreferredSize:", width, height);
      -[TUIKeyplaneView setLayoutReadyForTreeUpdate:](self, "setLayoutReadyForTreeUpdate:", 1);
      if (v47 != width || v49 != height)
        -[TUIKeyplaneView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[TUIKeyplaneView updateAllTrees](self, "updateAllTrees");
    }
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUIKeyplaneView keyplane](self, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUIKeyplaneView isFloating](self, "isFloating"))
    -[TUIKeyplaneView preferredFloatingSize](self, "preferredFloatingSize");
  else
    -[TUIKeyplaneView preferredSize](self, "preferredSize");
  NSStringFromCGSize(*(CGSize *)&v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> name = %@; preferredSize = %@; currentKeyplane = %@"),
    v4,
    self,
    v6,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (Class)preferredKeyViewClass
{
  void *v2;

  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectsType");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (TUIKeyplane)currentKeyplane
{
  return self->_currentKeyplane;
}

- (void)setCurrentKeyplane:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyplane, a3);
}

- (NSMutableDictionary)storedKeyViews
{
  return self->_storedKeyViews;
}

- (void)setStoredKeyViews:(id)a3
{
  objc_storeStrong((id *)&self->_storedKeyViews, a3);
}

- (NSMutableDictionary)storedVariantViews
{
  return self->_storedVariantViews;
}

- (void)setStoredVariantViews:(id)a3
{
  objc_storeStrong((id *)&self->_storedVariantViews, a3);
}

- (NSMutableArray)activeVariantViews
{
  return self->_activeVariantViews;
}

- (void)setActiveVariantViews:(id)a3
{
  objc_storeStrong((id *)&self->_activeVariantViews, a3);
}

- (BOOL)layoutReadyForTreeUpdate
{
  return self->_layoutReadyForTreeUpdate;
}

- (void)setLayoutReadyForTreeUpdate:(BOOL)a3
{
  self->_layoutReadyForTreeUpdate = a3;
}

- (BOOL)dismissingKeyboardMenu
{
  return self->_dismissingKeyboardMenu;
}

- (void)setDismissingKeyboardMenu:(BOOL)a3
{
  self->_dismissingKeyboardMenu = a3;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, a3);
}

- (NSLayoutConstraint)sizeRatioConstraint
{
  return self->_sizeRatioConstraint;
}

- (void)setSizeRatioConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sizeRatioConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)preferredWidthConstraint
{
  return self->_preferredWidthConstraint;
}

- (void)setPreferredWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_preferredWidthConstraint, a3);
}

- (NSLayoutConstraint)trailingTieConstraint
{
  return self->_trailingTieConstraint;
}

- (void)setTrailingTieConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTieConstraint, a3);
}

- (NSLayoutConstraint)scalingConstraint
{
  return self->_scalingConstraint;
}

- (void)setScalingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scalingConstraint, a3);
}

- (NSLayoutConstraint)topSpacing
{
  return self->_topSpacing;
}

- (void)setTopSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_topSpacing, a3);
}

- (NSLayoutConstraint)leadingSpacing
{
  return self->_leadingSpacing;
}

- (void)setLeadingSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSpacing, a3);
}

- (NSLayoutConstraint)trailingSpacing
{
  return self->_trailingSpacing;
}

- (void)setTrailingSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSpacing, a3);
}

- (NSLayoutConstraint)bottomSpacing
{
  return self->_bottomSpacing;
}

- (void)setBottomSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSpacing, a3);
}

- (NSLayoutConstraint)splitSpacing
{
  return self->_splitSpacing;
}

- (void)setSplitSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_splitSpacing, a3);
}

- (NSLayoutConstraint)keySizeSpacer
{
  return self->_keySizeSpacer;
}

- (void)setKeySizeSpacer:(id)a3
{
  objc_storeStrong((id *)&self->_keySizeSpacer, a3);
}

- (NSLayoutConstraint)leftSplitWidth
{
  return self->_leftSplitWidth;
}

- (void)setLeftSplitWidth:(id)a3
{
  objc_storeStrong((id *)&self->_leftSplitWidth, a3);
}

- (NSLayoutConstraint)rightSplitWidth
{
  return self->_rightSplitWidth;
}

- (void)setRightSplitWidth:(id)a3
{
  objc_storeStrong((id *)&self->_rightSplitWidth, a3);
}

- (UIView)keyboardContentView
{
  return self->_keyboardContentView;
}

- (void)setKeyboardContentView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardContentView, a3);
}

- (UILayoutGuide)keySizeReferenceGuide
{
  return self->_keySizeReferenceGuide;
}

- (void)setKeySizeReferenceGuide:(id)a3
{
  objc_storeStrong((id *)&self->_keySizeReferenceGuide, a3);
}

- (UILayoutGuide)bottomRowSizingGuide
{
  return self->_bottomRowSizingGuide;
}

- (void)setBottomRowSizingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRowSizingGuide, a3);
}

- (NSLayoutConstraint)bottomRowSizingConstraint
{
  return self->_bottomRowSizingConstraint;
}

- (void)setBottomRowSizingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRowSizingConstraint, a3);
}

- (UIEdgeInsets)standardKeyInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_standardKeyInsets.top;
  left = self->_standardKeyInsets.left;
  bottom = self->_standardKeyInsets.bottom;
  right = self->_standardKeyInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setStandardKeyInsets:(UIEdgeInsets)a3
{
  self->_standardKeyInsets = a3;
}

- (NSString)displayedType
{
  return self->_displayedType;
}

- (void)setDisplayedType:(id)a3
{
  objc_storeStrong((id *)&self->_displayedType, a3);
}

- (NSString)keyLayout
{
  return self->_keyLayout;
}

- (void)setKeyLayout:(id)a3
{
  objc_storeStrong((id *)&self->_keyLayout, a3);
}

- (double)startingWidthConstant
{
  return self->_startingWidthConstant;
}

- (void)setStartingWidthConstant:(double)a3
{
  self->_startingWidthConstant = a3;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(double)a3
{
  self->_maximumWidth = a3;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (CGSize)preferredFloatingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredFloatingSize.width;
  height = self->_preferredFloatingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredFloatingSize:(CGSize)a3
{
  self->_preferredFloatingSize = a3;
}

- (CGSize)unsplitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unsplitSize.width;
  height = self->_unsplitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnsplitSize:(CGSize)a3
{
  self->_unsplitSize = a3;
}

- (void)setCurrentHandBias:(int64_t)a3
{
  self->_currentHandBias = a3;
}

- (UIButton)biasEscapeButton
{
  return self->_biasEscapeButton;
}

- (void)setBiasEscapeButton:(id)a3
{
  objc_storeStrong((id *)&self->_biasEscapeButton, a3);
}

- (NSLayoutConstraint)horizontalBiasButtonConstraint
{
  return self->_horizontalBiasButtonConstraint;
}

- (void)setHorizontalBiasButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalBiasButtonConstraint, a3);
}

- (BOOL)allowsPaddles
{
  return self->_allowsPaddles;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  self->_allowsPaddles = a3;
}

- (BOOL)movingFromFloating
{
  return self->_movingFromFloating;
}

- (void)setMovingFromFloating:(BOOL)a3
{
  self->_movingFromFloating = a3;
}

- (BOOL)movingToFloating
{
  return self->_movingToFloating;
}

- (void)setMovingToFloating:(BOOL)a3
{
  self->_movingToFloating = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (BOOL)isCurrentlySplit
{
  return self->_isCurrentlySplit;
}

- (void)setIsCurrentlySplit:(BOOL)a3
{
  self->_isCurrentlySplit = a3;
}

- (BOOL)isInSplitTransition
{
  return self->_isInSplitTransition;
}

- (void)setIsInSplitTransition:(BOOL)a3
{
  self->_isInSplitTransition = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

- (int64_t)fullControlKeyType
{
  return self->_fullControlKeyType;
}

- (void)setFullControlKeyType:(int64_t)a3
{
  self->_fullControlKeyType = a3;
}

- (int64_t)floatingControlKeyType
{
  return self->_floatingControlKeyType;
}

- (void)setFloatingControlKeyType:(int64_t)a3
{
  self->_floatingControlKeyType = a3;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (NSMutableDictionary)keyRowViews
{
  return self->_keyRowViews;
}

- (void)setKeyRowViews:(id)a3
{
  objc_storeStrong((id *)&self->_keyRowViews, a3);
}

- (NSMutableDictionary)delayedDeactivationKeys
{
  return self->_delayedDeactivationKeys;
}

- (void)setDelayedDeactivationKeys:(id)a3
{
  objc_storeStrong((id *)&self->_delayedDeactivationKeys, a3);
}

- (NSMutableDictionary)splitTransitionLayoutGuides
{
  return self->_splitTransitionLayoutGuides;
}

- (void)setSplitTransitionLayoutGuides:(id)a3
{
  objc_storeStrong((id *)&self->_splitTransitionLayoutGuides, a3);
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_screenTraits, a3);
}

- (TUIKey)activeKey
{
  return self->_activeKey;
}

- (void)setActiveKey:(id)a3
{
  objc_storeStrong((id *)&self->_activeKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_splitTransitionLayoutGuides, 0);
  objc_storeStrong((id *)&self->_delayedDeactivationKeys, 0);
  objc_storeStrong((id *)&self->_keyRowViews, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
  objc_storeStrong((id *)&self->_horizontalBiasButtonConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButton, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_displayedType, 0);
  objc_storeStrong((id *)&self->_bottomRowSizingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomRowSizingGuide, 0);
  objc_storeStrong((id *)&self->_keySizeReferenceGuide, 0);
  objc_storeStrong((id *)&self->_keyboardContentView, 0);
  objc_storeStrong((id *)&self->_rightSplitWidth, 0);
  objc_storeStrong((id *)&self->_leftSplitWidth, 0);
  objc_storeStrong((id *)&self->_keySizeSpacer, 0);
  objc_storeStrong((id *)&self->_splitSpacing, 0);
  objc_storeStrong((id *)&self->_bottomSpacing, 0);
  objc_storeStrong((id *)&self->_trailingSpacing, 0);
  objc_storeStrong((id *)&self->_leadingSpacing, 0);
  objc_storeStrong((id *)&self->_topSpacing, 0);
  objc_storeStrong((id *)&self->_scalingConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTieConstraint, 0);
  objc_storeStrong((id *)&self->_preferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_sizeRatioConstraint, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeVariantViews, 0);
  objc_storeStrong((id *)&self->_storedVariantViews, 0);
  objc_storeStrong((id *)&self->_storedKeyViews, 0);
  objc_storeStrong((id *)&self->_currentKeyplane, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

uint64_t __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __63__TUIKeyplaneView_transitionWillFinishWithProgress_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateAllTrees");
  objc_msgSend(*(id *)(a1 + 32), "setLayoutReadyForTreeUpdate:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__TUIKeyplaneView_updateSplitProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __39__TUIKeyplaneView_updateSplitProgress___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __39__TUIKeyplaneView_updateSplitProgress___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyRowViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if (objc_msgSend(*(id *)(a1 + 32), "isCurrentlySplit"))
          v9 = 1;
        else
          v9 = 2;
        objc_msgSend(v8, "updateKeysInRowWithStyle:factory:", v9, 0);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __50__TUIKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 728);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentKeyplane");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "effectsType") == 1
      && objc_msgSend(MEMORY[0x1E0DC3938], "isKeyboardProcess")
      && objc_msgSend(v7, "interactionType") == 14)
    {
      v6 = objc_msgSend(v7, "state");

      if (v6 == 8)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeKeyFromDelayedDeactivationSet:", v7);
LABEL_9:
        v4 = v7;
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:forKey:", 2, v7);
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "popupMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "popupMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __42__TUIKeyplaneView_tappedToDismissSelector__block_invoke_2(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "setDismissingKeyboardMenu:", 0);
  objc_msgSend(a1[5], "popupMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(a1[6], "removeFromSuperview");
}

uint64_t __33__TUIKeyplaneView_updateAllTrees__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapBiasEscapeButton");
}

void __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "configuration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend(*(id *)(a1 + 32), "currentHandBias");
  v7 = CFSTR("right");
  if (v6 == 1)
    v7 = CFSTR("left");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("chevron.compact.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemImageNamed:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v9);
  objc_msgSend(v3, "setConfiguration:", v10);

}

id __51__TUIKeyplaneView_updateBiasEscapeButtonVisbility___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.353, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__TUIKeyplaneView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (CGSize)keyplaneSizeForLayout:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "keyboardScreenReferenceSize");
  v8 = +[TUIKeyplane layoutClassFromScreenDimensions:](TUIKeyplane, "layoutClassFromScreenDimensions:");
  MEMORY[0x18D7872E4](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[TUIKeyplane sizeFromScreenTraits:layout:layoutClass:](TUIKeyplane, "sizeFromScreenTraits:layout:layoutClass:", v6, v9, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (Class)selectorViewClassForKey:(id)a3
{
  void *v3;

  objc_msgSend(a3, "backingTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactionType");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updateVariantSelectorFramesForKey:(id)a3
{
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  id v48;

  v48 = a3;
  -[TUIKeyplaneView viewForBaseKey:](self, "viewForBaseKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popupMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v48, 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setState:", 16);
    +[TUIKey keyFromKBTree:](TUIKey, "keyFromKBTree:", v48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView keyplane](self, "keyplane");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyplane:", v8);

    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStyle:", objc_msgSend(v9, "keyStyleForLayoutClass:", objc_msgSend(v10, "layoutClass")));

    -[TUIKeyplaneView variantViewForKey:cacheID:](self, "variantViewForKey:cacheID:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v12);

        objc_msgSend(v12, "updateVariantsIfNeededForKey:", v48);
        -[TUIKeyplaneView presentSelectorView:fromBaseKey:](self, "presentSelectorView:fromBaseKey:", v12, v4);
        -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layoutIfNeeded");

      }
      objc_msgSend(v12, "cellViewsInSubtreeOrder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      objc_msgSend(v48, "subtrees");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v17 == v19)
      {
        objc_msgSend(v48, "subtrees");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v22 = 0;
          do
          {
            objc_msgSend(v16, "objectAtIndex:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "frame");
            v26 = v25;
            v28 = v27;
            v30 = v29;
            v32 = v31;
            objc_msgSend(v23, "superview");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "convertRect:fromView:", v33, v26, v28, v30, v32);
            v35 = v34;
            v37 = v36;
            v39 = v38;
            v41 = v40;

            objc_msgSend(v48, "subtrees");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndex:", v22);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

            objc_msgSend(v48, "subtrees");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectAtIndex:", v22);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setPaddedFrame:", v35, v37, v39, v41);

            ++v22;
            objc_msgSend(v48, "subtrees");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "count");

          }
          while (v22 < v47);
        }
      }
      objc_msgSend(v12, "removeFromSuperview");

    }
  }

}

- (void)updateToSpecifiedSize:(CGSize)a3
{
  double height;
  double width;
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

  height = a3.height;
  width = a3.width;
  -[TUIKeyplaneView sizeRatioConstraint](self, "sizeRatioConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 0);

  -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 0);

  -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView setHeightConstraint:](self, "setHeightConstraint:", v11);

  -[TUIKeyplaneView keyboardContentView](self, "keyboardContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", width);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView setPreferredWidthConstraint:](self, "setPreferredWidthConstraint:", v14);

  -[TUIKeyplaneView heightConstraint](self, "heightConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[TUIKeyplaneView preferredWidthConstraint](self, "preferredWidthConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[TUIKeyplaneView setPreferredSize:](self, "setPreferredSize:", width, height);
}

- (void)generateFactoryForKeyplane:(id)a3 landscape:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIKBScreenTraits *v12;
  UIKBScreenTraits *screenTraits;
  void *v14;
  void *v15;
  UIKBScreenTraits *v16;
  UIKBScreenTraits *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  UIKBRenderingContext *v21;
  UIKBRenderingContext *renderingContext;
  void *v23;
  void *v24;
  UIKBRenderFactory *factory;
  id v26;

  v4 = a4;
  v26 = a3;
  -[TUIKeyplaneView setStandardKeyInsets:](self, "setStandardKeyInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v26, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[TUIKeyplane layoutClassFromKeyplaneName:](TUIKeyplane, "layoutClassFromKeyplaneName:", v6);

  if (self->_screenTraits)
  {
    if (v7)
      goto LABEL_3;
LABEL_10:
    v9 = 68;
    if (!v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0DC3910];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitsWithScreen:orientation:", v11, 1);
  v12 = (UIKBScreenTraits *)objc_claimAutoreleasedReturnValue();
  screenTraits = self->_screenTraits;
  self->_screenTraits = v12;

  if (!v7)
    goto LABEL_10;
LABEL_3:
  if (v7 != 1)
  {
    v9 = 65;
    if (!v4)
      goto LABEL_14;
LABEL_13:
    v14 = (void *)MEMORY[0x1E0DC3910];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitsWithScreen:orientation:", v15, 4);
    v16 = (UIKBScreenTraits *)objc_claimAutoreleasedReturnValue();
    v17 = self->_screenTraits;
    self->_screenTraits = v16;

    goto LABEL_14;
  }
  -[UIKBScreenTraits keyboardWidth](self->_screenTraits, "keyboardWidth");
  if (v8 <= 375.0)
    v9 = 85;
  else
    v9 = 86;
  if (v4)
    goto LABEL_13;
LABEL_14:
  v18 = v9 | objc_msgSend(v26, "visualStyling") & 0xFFFFFFFFFFFFFF00;
  objc_msgSend(v26, "setVisualStyling:", v18);
  v19 = (void *)MEMORY[0x1E0DC3908];
  objc_msgSend(MEMORY[0x1E0DC38F8], "defaultConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "renderingContextForRenderConfig:", v20);
  v21 = (UIKBRenderingContext *)objc_claimAutoreleasedReturnValue();
  renderingContext = self->_renderingContext;
  self->_renderingContext = v21;

  objc_msgSend(MEMORY[0x1E0DC3900], "factoryForVisualStyle:renderingContext:", v18, self->_renderingContext);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBScreenTraits screen](self->_screenTraits, "screen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  objc_msgSend(v23, "setScale:");

  objc_msgSend(v23, "setStretchFactor:", 1.0, 1.0);
  objc_msgSend(v23, "setAllowsPaddles:", 1);
  objc_msgSend(v23, "setDynamicFactory:", !v4);
  factory = self->_factory;
  self->_factory = (UIKBRenderFactory *)v23;

}

- (void)updateTreeForAutomation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD v10[5];

  if (self->_keyplane)
  {
    -[TUIKeyplaneView keyRowViews](self, "keyRowViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__TUIKeyplaneView_Testing__updateTreeForAutomation__block_invoke;
      v10[3] = &unk_1E24FC068;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
      -[UIKBTree keys](self->_keyplane, "keys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      if (v6)
      {
        v7 = v6;
        for (i = 0; i != v7; ++i)
        {
          objc_msgSend(v5, "objectAtIndex:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneView updateFrameForKey:](self, "updateFrameForKey:", v9);

        }
      }

    }
  }
}

uint64_t __51__TUIKeyplaneView_Testing__updateTreeForAutomation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)keyViewForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "backingTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingTree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneView cacheIdentifierForKey:withState:](self, "cacheIdentifierForKey:withState:", v5, objc_msgSend(v6, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[TUIKeyplaneView keyplane](self, "keyplane");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyplane:", v10);

    objc_msgSend(v4, "setStyle:", -[TUIKeyplaneView keyLayoutStyle](self, "keyLayoutStyle"));
    v9 = (void *)objc_msgSend(objc_alloc(-[TUIKeyplaneView preferredKeyViewClass](self, "preferredKeyViewClass")), "initWithKey:", v4);
    -[TUIKeyplaneView storedKeyViews](self, "storedKeyViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, v7);

  }
  -[TUIKeyplaneView factory](self, "factory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFactory:", v12);

  -[TUIKeyplaneView keyplaneRenderConfig](self, "keyplaneRenderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRenderConfig:", v13);

  return v9;
}

- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4
{
  uint64_t v4;
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overrideDisplayString");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[TUIKeyplaneView _shouldUseUnifiedKeyView:](self, "_shouldUseUnifiedKeyView:", v6);

    if (!v10)
    {
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "overrideDisplayString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("_%@"), v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v13;
    }
  }
  if ((v4 & 0xFFFFFFFB) == 0x10)
  {
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("_%i"), v4);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v14;
  }
  if (objc_msgSend(v6, "displayType") == 31)
  {

    v7 = CFSTR("TenKey-AdaptiveKey-Facemark-Voiced");
  }

  return v7;
}

- (BOOL)_shouldUseUnifiedKeyView:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "displayType") == 8 || objc_msgSend(v4, "interactionType") == 9)
    goto LABEL_3;
  -[TUIKeyplaneView currentKeyplane](self, "currentKeyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "effectsType");

  if (v8 != 1)
  {
    v5 = 0;
    goto LABEL_4;
  }
  if (objc_msgSend(v4, "interactionType") == 15)
LABEL_3:
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "interactionType") == 13;
LABEL_4:

  return v5;
}

+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5 displayKeyplane:(unint64_t)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  TUIKeyplaneView *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v10 = a3;
  +[TUIKeyboardLayoutFactory sharedKeyboardFactory](TUIKeyboardLayoutFactory, "sharedKeyboardFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dynamic-%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyboardWithName:inCache:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "type") == 2)
    {
      +[TUIKeyplaneView keyplaneViewForLayout:size:isLandscape:](TUIKeyplaneView, "keyplaneViewForLayout:size:isLandscape:", v13, v7, width, height);
      v14 = (TUIKeyplaneView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "subtrees");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") - 1;

      if (v16 < a6)
      {
        objc_msgSend(v13, "subtrees");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        a6 = objc_msgSend(v17, "count") - 1;

      }
      objc_msgSend(v13, "subtrees");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "count");

      v14 = 0;
      if (v19)
      {
        v19 = 0;
        v20 = 0;
        do
        {
          objc_msgSend(v13, "subtrees");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "type") == 2)
          {
            if (!v14)
            {
              v14 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v22, 0.0, 0.0, width, height);
              v23 = v22;

              v19 = v23;
            }
            if (a6 == v20)
            {
              v24 = v22;

              v19 = v24;
            }
            -[TUIKeyplaneView generateFactoryForKeyplane:landscape:](v14, "generateFactoryForKeyplane:landscape:", v22, v7);
            -[TUIKeyplaneView setKeyplaneForAutomation:](v14, "setKeyplaneForAutomation:", v22);
            -[TUIKeyplaneView updateToSpecifiedSize:](v14, "updateToSpecifiedSize:", width, height);
            -[TUIKeyplaneView updateTreeForAutomation](v14, "updateTreeForAutomation");
          }

          ++v20;
          objc_msgSend(v13, "subtrees");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

        }
        while (v20 < v26);
      }
      -[TUIKeyplaneView setKeyplane:](v14, "setKeyplane:", v19);
      -[TUIKeyplaneView updateTreeForAutomation](v14, "updateTreeForAutomation");

    }
  }
  else
  {
    NSLog(CFSTR("Error: Specified name %@ did not return a keyboard"), v10);
    v14 = 0;
  }

  return v14;
}

+ (id)keyplaneViewForKeyboard:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  return (id)objc_msgSend(a1, "keyplaneViewForKeyboard:size:isLandscape:displayKeyplane:", a3, a5, 0, a4.width, a4.height);
}

+ (id)keyplaneViewForLayout:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  TUIKeyplaneView *v9;
  void *v10;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  if ((objc_msgSend(v8, "dynamicLayout") & 1) == 0)
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@ is not a dynamic layout"), v10);
LABEL_6:

    v9 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "type") != 2)
  {
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@ is not a keyplane"), v10);
    goto LABEL_6;
  }
  v9 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v8, 0.0, 0.0, width, height);
  -[TUIKeyplaneView generateFactoryForKeyplane:landscape:](v9, "generateFactoryForKeyplane:landscape:", v8, v5);
  -[TUIKeyplaneView setKeyplaneForAutomation:](v9, "setKeyplaneForAutomation:", v8);
  -[TUIKeyplaneView updateToSpecifiedSize:](v9, "updateToSpecifiedSize:", width, height);
  -[TUIKeyplaneView updateTreeForAutomation](v9, "updateTreeForAutomation");
LABEL_7:

  return v9;
}

+ (id)dynamicKeyboardForName:(id)a3 size:(CGSize)a4 isLandscape:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  TUIKeyplaneView *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[TUIKeyboardLayoutFactory sharedKeyboardFactory](TUIKeyboardLayoutFactory, "sharedKeyboardFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dynamic-%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardWithName:inCache:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "type") == 1)
  {
    v23 = v11;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v11, "subtrees");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v19, "type") == 2)
          {
            if (!v16)
            {
              v16 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v19, 0.0, 0.0, width, height);
              v20 = v19;

              v15 = v20;
            }
            -[TUIKeyplaneView generateFactoryForKeyplane:landscape:](v16, "generateFactoryForKeyplane:landscape:", v19, v5);
            -[TUIKeyplaneView setKeyplaneForAutomation:](v16, "setKeyplaneForAutomation:", v19);
            -[TUIKeyplaneView updateToSpecifiedSize:](v16, "updateToSpecifiedSize:", width, height);
            -[TUIKeyplaneView updateTreeForAutomation](v16, "updateTreeForAutomation");
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
      v16 = 0;
    }

    v11 = v23;
    v21 = v23;

  }
  else
  {
    NSLog(CFSTR("Error: Specified name %@ did not return a keyboard"), v8);
    v21 = 0;
  }

  return v21;
}

+ (id)updateDynamicKeyboard:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  TUIKeyplaneView *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "type") == 2)
  {
    +[TUIKeyplaneView updateDynamicKeyplane:usingSize:isLandscape:](TUIKeyplaneView, "updateDynamicKeyplane:usingSize:isLandscape:", v8, v5, width, height);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "type") == 1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "subtrees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "type") == 2)
          {
            if (!v13)
              v13 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v16, 0.0, 0.0, width, height);
            -[TUIKeyplaneView generateFactoryForKeyplane:landscape:](v13, "generateFactoryForKeyplane:landscape:", v16, v5);
            -[TUIKeyplaneView setKeyplaneForAutomation:](v13, "setKeyplaneForAutomation:", v16);
            -[TUIKeyplaneView updateToSpecifiedSize:](v13, "updateToSpecifiedSize:", width, height);
            -[TUIKeyplaneView updateTreeForAutomation](v13, "updateTreeForAutomation");
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@ is not a keyboard"), v17);

    v9 = 0;
  }

  return v9;
}

+ (id)updateDynamicKeyplane:(id)a3 usingSize:(CGSize)a4 isLandscape:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  TUIKeyplaneView *v9;
  id v10;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (objc_msgSend(v8, "type") == 2)
  {
    v9 = -[TUIKeyplaneView initWithFrame:keyplane:]([TUIKeyplaneView alloc], "initWithFrame:keyplane:", v8, 0.0, 0.0, width, height);
    -[TUIKeyplaneView generateFactoryForKeyplane:landscape:](v9, "generateFactoryForKeyplane:landscape:", v8, v5);
    -[TUIKeyplaneView setKeyplaneForAutomation:](v9, "setKeyplaneForAutomation:", v8);
    -[TUIKeyplaneView updateToSpecifiedSize:](v9, "updateToSpecifiedSize:", width, height);
    -[TUIKeyplaneView updateTreeForAutomation](v9, "updateTreeForAutomation");
    v10 = v8;
  }
  else
  {
    objc_msgSend(v8, "name");
    v9 = (TUIKeyplaneView *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@ is not a keyplane"), v9);
    v10 = 0;
  }

  return v10;
}

@end
