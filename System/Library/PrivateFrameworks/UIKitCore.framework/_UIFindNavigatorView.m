@implementation _UIFindNavigatorView

- (_UIFindNavigatorView)initWithFrame:(CGRect)a3
{
  _UIFindNavigatorView *v3;
  _UIFindNavigatorView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIView *left;
  uint64_t v9;
  UIView *right;
  uint64_t v11;
  UIView *bottom;
  uint64_t v13;
  UIButton *doneButton;
  void *v15;
  void *v16;
  double v17;
  double v18;
  UILabel *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  UILabel *resultCountLabel;
  void *v26;
  void *v27;
  id v28;
  _UIFindNavigatorSearchTextField *v29;
  _UIFindNavigatorSearchTextField *searchTextField;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _UIFindNavigatorSearchTextField *v35;
  _UIFindNavigatorSearchTextField *replaceTextField;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIButton *replaceButton;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  const __CFString *v57;
  void *v58;
  id *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  id *v73;
  id *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void (**v80)(void *, _QWORD);
  void *v81;
  id obj;
  _QWORD v83[4];
  id *v84;
  id v85;
  _QWORD v86[4];
  id *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  id location;
  _QWORD aBlock[4];
  id v95;
  objc_super v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  v96.receiver = self;
  v96.super_class = (Class)_UIFindNavigatorView;
  v3 = -[UIInputView initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFindNavigatorView _createNavigatorLayoutForTraitCollection:](v4, "_createNavigatorLayoutForTraitCollection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addMaterialToViewIfNeeded:", v4);
    CreateSeparatorView();
    v7 = objc_claimAutoreleasedReturnValue();
    left = v4->_separatorViews.left;
    v4->_separatorViews.left = (UIView *)v7;

    -[UIView setHidden:](v4->_separatorViews.left, "setHidden:", 1);
    -[UIView addSubview:](v4, "addSubview:", v4->_separatorViews.left);
    CreateSeparatorView();
    v9 = objc_claimAutoreleasedReturnValue();
    right = v4->_separatorViews.right;
    v4->_separatorViews.right = (UIView *)v9;

    -[UIView setHidden:](v4->_separatorViews.right, "setHidden:", 1);
    -[UIView addSubview:](v4, "addSubview:", v4->_separatorViews.right);
    CreateSeparatorView();
    v11 = objc_claimAutoreleasedReturnValue();
    bottom = v4->_separatorViews.bottom;
    v4->_separatorViews.bottom = (UIView *)v11;

    -[UIView setHidden:](v4->_separatorViews.bottom, "setHidden:", 1);
    -[UIView addSubview:](v4, "addSubview:", v4->_separatorViews.bottom);
    _UILocalizedString(CFSTR("DONE"), (uint64_t)CFSTR("Button that's used to dismiss the parent."), CFSTR("Done"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "usesSymbolForDoneButton") & 1) != 0)
      objc_msgSend(v6, "commonButtonConfigWithImageName:isAccessory:", CFSTR("xmark"), 0);
    else
      objc_msgSend(v6, "commonButtonConfigWithTitle:", v75);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v77, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    doneButton = v4->_doneButton;
    v4->_doneButton = (UIButton *)v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_doneButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NSObject setAccessibilityIdentifier:](v4->_doneButton, "setAccessibilityIdentifier:", CFSTR("find.doneButton"));
    -[UIControl setPointerInteractionEnabled:](v4->_doneButton, "setPointerInteractionEnabled:", 1);
    objc_msgSend(v6, "preferredMaximumContentSizeCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:maximumContentSizeCategory:", CFSTR("UICTFontTextStyleBody"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pointSize");
    v18 = v17;

    v19 = [UILabel alloc];
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v24 = -[UILabel initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
    resultCountLabel = v4->_resultCountLabel;
    v4->_resultCountLabel = (UILabel *)v24;

    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", v18, *(double *)off_1E167DC70);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_resultCountLabel, "setFont:", v26);

    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_resultCountLabel, "setTextColor:", v27);

    -[UILabel setTextAlignment:](v4->_resultCountLabel, "setTextAlignment:", 2);
    -[NSObject setAccessibilityIdentifier:](v4->_resultCountLabel, "setAccessibilityIdentifier:", CFSTR("find.resultLabel"));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke;
    aBlock[3] = &unk_1E16C1238;
    v28 = v6;
    v95 = v28;
    v80 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v29 = -[_UIFindNavigatorSearchTextField initWithFrame:]([_UIFindNavigatorSearchTextField alloc], "initWithFrame:", v20, v21, v22, v23);
    searchTextField = v4->_searchTextField;
    v4->_searchTextField = v29;

    ((void (**)(void *, _UIFindNavigatorSearchTextField *))v80)[2](v80, v4->_searchTextField);
    -[_UIFindNavigatorSearchTextField setReturnKeyType:](v4->_searchTextField, "setReturnKeyType:", 6);
    _UILocalizedString(CFSTR("FIND"), (uint64_t)CFSTR("Find in text"), CFSTR("Find"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v4->_searchTextField, "setPlaceholder:", v31);

    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaximumContentSizeCategory:](v4->_searchTextField, "setMaximumContentSizeCategory:", v32);

    -[NSObject setAccessibilityIdentifier:](v4->_searchTextField, "setAccessibilityIdentifier:", CFSTR("find.searchField"));
    objc_msgSend(v28, "commonButtonConfigWithImageName:isAccessory:", CFSTR("magnifyingglass.and.chevron.down"), 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredSymbolConfigurationForImageForTextFields");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setPreferredSymbolConfigurationForImage:", v33);

    objc_msgSend(v81, "setMacIdiomStyle:", 2);
    +[UIButton buttonWithConfiguration:primaryAction:](_UIFindNavigatorSearchFieldButton, "buttonWithConfiguration:primaryAction:", v81, 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setUsesSquareIntrinsicSize:", 1);
    objc_msgSend(obj, "setPreferredBehavioralStyle:", 1);
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setMaximumContentSizeCategory:", v34);

    objc_msgSend(obj, "setAccessibilityIdentifier:", CFSTR("find.settingsButton"));
    objc_storeStrong((id *)&v4->_settingsButton, obj);
    -[UIButton setShowsMenuAsPrimaryAction:](v4->_settingsButton, "setShowsMenuAsPrimaryAction:", 1);
    -[UITextField setLeftView:](v4->_searchTextField, "setLeftView:", v4->_settingsButton);
    -[UITextField setLeftViewMode:](v4->_searchTextField, "setLeftViewMode:", 3);
    -[UITextField setRightView:](v4->_searchTextField, "setRightView:", v4->_resultCountLabel);
    -[UITextField setRightViewMode:](v4->_searchTextField, "setRightViewMode:", 3);
    v35 = -[_UIFindNavigatorSearchTextField initWithFrame:]([_UIFindNavigatorSearchTextField alloc], "initWithFrame:", v20, v21, v22, v23);
    replaceTextField = v4->_replaceTextField;
    v4->_replaceTextField = v35;

    ((void (**)(void *, _UIFindNavigatorSearchTextField *))v80)[2](v80, v4->_replaceTextField);
    -[_UIFindNavigatorSearchTextField setReturnKeyType:](v4->_replaceTextField, "setReturnKeyType:", 4);
    _UILocalizedString(CFSTR("REPLACE"), (uint64_t)CFSTR("Replace text"), CFSTR("Replace"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](v4->_replaceTextField, "setPlaceholder:", v37);

    -[NSObject setAccessibilityIdentifier:](v4->_replaceTextField, "setAccessibilityIdentifier:", CFSTR("find.replaceField"));
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaximumContentSizeCategory:](v4->_replaceTextField, "setMaximumContentSizeCategory:", v38);

    objc_msgSend(v28, "commonButtonConfigWithImageName:isAccessory:", CFSTR("pencil"), 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredSymbolConfigurationForImageForTextFields");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setPreferredSymbolConfigurationForImage:", v39);

    +[UIButton buttonWithConfiguration:primaryAction:](_UIFindNavigatorSearchFieldButton, "buttonWithConfiguration:primaryAction:", v79, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setMaximumContentSizeCategory:", v41);

    objc_msgSend(v40, "setPreferredBehavioralStyle:", 1);
    objc_msgSend(v40, "setUsesSquareIntrinsicSize:", 1);
    objc_msgSend(v40, "setEnabled:", 0);
    -[UITextField setLeftView:](v4->_replaceTextField, "setLeftView:", v40);
    -[UITextField setLeftViewMode:](v4->_replaceTextField, "setLeftViewMode:", 3);
    _UILocalizedString(CFSTR("REPLACE"), (uint64_t)CFSTR("Button whose action replaces text"), CFSTR("Replace"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "commonButtonConfigWithTitle:", v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](v4, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = objc_msgSend(v42, "horizontalSizeClass") == 1;

    if ((_DWORD)v27)
      objc_msgSend(v78, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    objc_initWeak(&location, v4);
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_2;
    v91[3] = &unk_1E16B58D0;
    objc_copyWeak(&v92, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v91);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v78, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    replaceButton = v4->_replaceButton;
    v4->_replaceButton = (UIButton *)v44;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_replaceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setMaximumContentSizeCategory:](v4->_replaceButton, "setMaximumContentSizeCategory:", v46);

    -[UIButton setEnabled:](v4->_replaceButton, "setEnabled:", 0);
    -[NSObject setAccessibilityIdentifier:](v4->_replaceButton, "setAccessibilityIdentifier:", CFSTR("find.replaceButton"));
    -[UIControl setPointerInteractionEnabled:](v4->_replaceButton, "setPointerInteractionEnabled:", 1);
    _UILocalizedFormat(CFSTR("REPLACE_ALL"), (uint64_t)CFSTR("Replace all occurrences."), CFSTR("Replace All"), v47, v48, v49, v50, v51, (uint64_t)v73);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_3;
    v89[3] = &unk_1E16B58D0;
    objc_copyWeak(&v90, &location);
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v52, 0, 0, v89);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](v4->_replaceButton, "setMenu:", v55);

    v56 = objc_msgSend(v28, "usesNextAndPreviousArrows");
    if (v56)
      v57 = CFSTR("chevron.backward");
    else
      v57 = CFSTR("chevron.up");
    objc_msgSend(v28, "commonButtonConfigWithImageName:isAccessory:", v57, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_4;
    v86[3] = &unk_1E16B50A0;
    objc_copyWeak(&v88, &location);
    v59 = v4;
    v87 = v59;
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v86);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v58, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v59[99];
    v59[99] = (id)v61;

    objc_msgSend(v59[99], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v59[99], "setMinimumContentSizeCategory:", CFSTR("UICTContentSizeCategoryM"));
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59[99], "setMaximumContentSizeCategory:", v63);

    objc_msgSend(v59[99], "setAccessibilityIdentifier:", CFSTR("find.previousButton"));
    if (v56)
      v64 = CFSTR("chevron.forward");
    else
      v64 = CFSTR("chevron.down");
    objc_msgSend(v28, "commonButtonConfigWithImageName:isAccessory:", v64, 0, &v88);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_5;
    v83[3] = &unk_1E16B50A0;
    objc_copyWeak(&v85, &location);
    v66 = v59;
    v84 = v66;
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v83);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v65, v67);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = v66[98];
    v66[98] = (id)v68;

    objc_msgSend(v66[98], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v66[98], "setMinimumContentSizeCategory:", CFSTR("UICTContentSizeCategoryM"));
    objc_msgSend(v28, "preferredMaximumContentSizeCategory");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66[98], "setMaximumContentSizeCategory:", v70);

    objc_msgSend(v66[98], "setAccessibilityIdentifier:", CFSTR("find.nextButton"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObserver:selector:name:object:", v66, sel__preferredContentSizeDidChange, CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

    objc_msgSend(v66, "_setNavigatorLayout:", v28);
    objc_destroyWeak(&v85);

    objc_destroyWeak(v74);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&location);

  }
  return v4;
}

- (void)_setNavigatorLayout:(id)a3
{
  _UIFindNavigatorViewLayout **p_layout;
  id v6;

  p_layout = &self->_layout;
  v6 = a3;
  if (!-[_UIFindNavigatorViewLayout isEqual:](*p_layout, "isEqual:"))
  {
    -[UIView removeFromSuperview](*p_layout, "removeFromSuperview");
    objc_storeStrong((id *)&self->_layout, a3);
    -[UIView addSubview:](self, "addSubview:", v6);
    objc_msgSend(v6, "setNextResultButton:", self->_nextResultButton);
    objc_msgSend(v6, "setPreviousResultButton:", self->_previousResultButton);
    objc_msgSend(v6, "setDoneButton:", self->_doneButton);
    objc_msgSend(v6, "setReplaceButton:", self->_replaceButton);
    objc_msgSend(v6, "setSearchTextField:", self->_searchTextField);
    objc_msgSend(v6, "setReplaceTextField:", self->_replaceTextField);
    objc_msgSend(v6, "setAssistantBarStyle:", self->_assistantBarStyle);
    objc_msgSend(v6, "setUsesAssistantBarHeight:", self->_intrinsicHeightDerivedFromAssistantBar);
    objc_msgSend(v6, "preferredCornerRadius");
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");
    -[_UIFindNavigatorView _preferredBackgroundColorChanged](self, "_preferredBackgroundColorChanged");
    objc_msgSend(v6, "prepareForLayout");
    objc_msgSend(v6, "setReplaceFieldVisible:", self->_mode == 1);
  }

}

- (id)_createNavigatorLayoutForTraitCollection:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = off_1E167C510;
  if (objc_msgSend(v3, "userInterfaceIdiom") && objc_msgSend(v3, "horizontalSizeClass") != 1)
    v4 = off_1E167C508;
  v5 = objc_alloc(*v4);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  -[_UIFindNavigatorView _navigatorHostingTypeChanged](self, "_navigatorHostingTypeChanged", a3);
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorView _createNavigatorLayoutForTraitCollection:](self, "_createNavigatorLayoutForTraitCollection:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFindNavigatorView _setNavigatorLayout:](self, "_setNavigatorLayout:", v5);
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorView;
  -[UIView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFindNavigatorView;
  -[UIView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[_UIFindNavigatorView _navigatorHostingTypeChanged](self, "_navigatorHostingTypeChanged");
}

- (void)_navigatorHostingTypeChanged
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hostingTypeForTraitCollection:", v4);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", v5 != 1);
  -[UIInputView setAllowsSelfSizing:](self, "setAllowsSelfSizing:", v5 == 1);
}

- (void)_preferredBackgroundColorChanged
{
  id v3;

  if (self->_usesOpaqueBackground)
  {
    -[_UIFindNavigatorViewLayout preferredOpaqueBackgroundColor](self->_layout, "preferredOpaqueBackgroundColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
  else
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (void)setMode:(int64_t)a3
{
  int64_t v3;
  id WeakRetained;

  v3 = a3;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_5;
    a3 = 1;
  }
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](self->_layout, "setReplaceFieldVisible:", a3);
LABEL_5:
  if (self->_mode != v3)
  {
    self->_mode = v3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
    objc_msgSend(WeakRetained, "findNavigator:didChangeMode:", self, v3);

  }
}

- (BOOL)_replacementEnabled
{
  _UIFindNavigatorView *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "findNavigatorShouldShowReplacementOption:", v2);

  return (char)v2;
}

- (void)setReplaceButtonEnabled:(BOOL)a3
{
  self->_replaceButtonEnabled = a3;
  -[UIButton setEnabled:](self->_replaceButton, "setEnabled:");
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorView _createNavigatorLayoutForTraitCollection:](self, "_createNavigatorLayoutForTraitCollection:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFindNavigatorView _setNavigatorLayout:](self, "_setNavigatorLayout:", v6);
  self->_assistantBarStyle = a3;
  -[_UIFindNavigatorViewLayout setAssistantBarStyle:](self->_layout, "setAssistantBarStyle:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (id)suggestedFindMenuItems
{
  $02D0185996920FD39292A0351C5AAF42 *p_searchMenu;
  void *v4;
  void *v5;
  uint64_t v6;
  UIAction *find;
  void *v8;
  uint64_t v9;
  UIAction *replace;
  void *v11;
  uint64_t v12;
  UIAction *wholeWords;
  void *v14;
  uint64_t v15;
  UIAction *matchCase;
  UIAction *v17;
  void *v18;
  void *v19;
  void *v20;
  UIAction *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id location;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  p_searchMenu = &self->_searchMenu;
  if (!self->_searchMenu.initialized)
  {
    objc_initWeak(&location, self);
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __46___UIFindNavigatorView_suggestedFindMenuItems__block_invoke;
    v28 = &unk_1E16B58D0;
    objc_copyWeak(&v29, &location);
    v4 = _Block_copy(&v25);
    _UILocalizedString(CFSTR("FIND"), (uint64_t)CFSTR("Find text"), CFSTR("Find"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v5, 0, CFSTR("find"), v4, v25, v26, v27, v28);
    v6 = objc_claimAutoreleasedReturnValue();
    find = p_searchMenu->find;
    p_searchMenu->find = (UIAction *)v6;

    _UILocalizedString(CFSTR("FIND_AND_REPLACE"), (uint64_t)CFSTR("Find and replace text"), CFSTR("Find & Replace"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, 0, CFSTR("replace"), v4);
    v9 = objc_claimAutoreleasedReturnValue();
    replace = p_searchMenu->replace;
    p_searchMenu->replace = (UIAction *)v9;

    _UILocalizedString(CFSTR("WHOLE_WORDS"), (uint64_t)CFSTR("Match whole words"), CFSTR("Whole Words"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, 0, CFSTR("wholeWords"), v4);
    v12 = objc_claimAutoreleasedReturnValue();
    wholeWords = p_searchMenu->wholeWords;
    p_searchMenu->wholeWords = (UIAction *)v12;

    _UILocalizedString(CFSTR("MATCH_CASE"), (uint64_t)CFSTR("Match, case sensitive"), CFSTR("Match Case"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, 0, CFSTR("matchCase"), v4);
    v15 = objc_claimAutoreleasedReturnValue();
    matchCase = p_searchMenu->matchCase;
    p_searchMenu->matchCase = (UIAction *)v15;

    p_searchMenu->initialized = 1;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  -[UIAction setState:](p_searchMenu->find, "setState:", self->_mode == 0);
  -[UIAction setState:](p_searchMenu->replace, "setState:", self->_mode == 1);
  -[UIAction setState:](p_searchMenu->matchCase, "setState:", self->_matchCase);
  -[UIAction setState:](p_searchMenu->wholeWords, "setState:", self->_wholeWords);
  if (-[_UIFindNavigatorView _replacementEnabled](self, "_replacementEnabled")
    && -[_UIFindNavigatorViewLayout showsReplaceInOptionsMenu](self->_layout, "showsReplaceInOptionsMenu"))
  {
    v17 = p_searchMenu->replace;
    v32[0] = p_searchMenu->find;
    v32[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, 0, 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }
  v21 = p_searchMenu->wholeWords;
  v31[0] = p_searchMenu->matchCase;
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)_invalidateSearchSession
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
  objc_msgSend(WeakRetained, "findNavigatorDidInvalidateSearchSession:", self);

}

- (void)_handleSearchMenuItem:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  _UIFindNavigatorView *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "identifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == CFSTR("find"))
  {
    v8 = self;
    v9 = 0;
LABEL_8:
    -[_UIFindNavigatorView setMode:](v8, "setMode:", v9);
    goto LABEL_11;
  }
  objc_msgSend(v10, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 == CFSTR("replace"))
  {
    v8 = self;
    v9 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v10, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 == CFSTR("matchCase"))
  {
    -[_UIFindNavigatorView setMatchCase:](self, "setMatchCase:", -[_UIFindNavigatorView matchCase](self, "matchCase") ^ 1);
    goto LABEL_10;
  }
  objc_msgSend(v10, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 == CFSTR("wholeWords"))
  {
    -[_UIFindNavigatorView setWholeWords:](self, "setWholeWords:", -[_UIFindNavigatorView wholeWords](self, "wholeWords") ^ 1);
LABEL_10:
    -[_UIFindNavigatorView _invalidateSearchSession](self, "_invalidateSearchSession");
  }
LABEL_11:

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIFindNavigatorViewLayout preferredContentSize](self->_layout, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setVisibleSeparatorEdges:(unint64_t)a3
{
  char v3;
  $32421936A46D8EC4B566C4AED980D175 *p_separatorViews;

  v3 = a3;
  self->_visibleSeparatorEdges = a3;
  p_separatorViews = &self->_separatorViews;
  -[UIView setHidden:](self->_separatorViews.left, "setHidden:", (a3 & 2) == 0);
  -[UIView setHidden:](p_separatorViews->right, "setHidden:", (v3 & 8) == 0);
  -[UIView setHidden:](p_separatorViews->bottom, "setHidden:", (v3 & 4) == 0);
}

- (void)setUsesOpaqueBackground:(BOOL)a3
{
  self->_usesOpaqueBackground = a3;
  -[_UIFindNavigatorView _preferredBackgroundColorChanged](self, "_preferredBackgroundColorChanged");
}

- (BOOL)becomeFirstResponder
{
  BOOL v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v3 = -[UIView isFirstResponder](self->_searchTextField, "isFirstResponder");
  v4 = -[UISearchTextField becomeFirstResponder](self->_searchTextField, "becomeFirstResponder");
  v5 = v4;
  if (!v3 && v4)
  {
    -[_UIFindNavigatorSearchTextField text](self->_searchTextField, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      -[UITextField selectAll](self->_searchTextField, "selectAll");
  }
  return v5;
}

- (BOOL)resignFirstResponder
{
  uint64_t v3;
  objc_super v5;

  v3 = 768;
  if (-[UIView isFirstResponder](self->_searchTextField, "isFirstResponder"))
    return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "resignFirstResponder");
  v3 = 776;
  if (-[UIView isFirstResponder](self->_replaceTextField, "isFirstResponder"))
    return objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorView;
  return -[UIResponder resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (id)_linearFocusMovementSequences
{
  _UIFindNavigatorSearchTextField *replaceTextField;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  replaceTextField = self->_replaceTextField;
  v7[0] = self->_searchTextField;
  v7[1] = replaceTextField;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusLinearMovementSequence sequenceWithItems:loops:](_UIFocusLinearMovementSequence, "sequenceWithItems:loops:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)find:(id)a3
{
  if (!-[UIView isFirstResponder](self->_searchTextField, "isFirstResponder", a3))
    -[UISearchTextField becomeFirstResponder](self->_searchTextField, "becomeFirstResponder");
  -[UITextField selectAll](self->_searchTextField, "selectAll");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void (**v7)(void *, UIView *, double);
  UIView *right;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double x;
  double y;
  double width;
  double height;
  _QWORD v32[6];
  objc_super v33;
  CGRect v34;
  CGRect v35;

  v33.receiver = self;
  v33.super_class = (Class)_UIFindNavigatorView;
  -[UIView layoutSubviews](&v33, sel_layoutSubviews);
  if (-[_UIFindNavigatorView visibleSeparatorEdges](self, "visibleSeparatorEdges"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayScale");
    v5 = 1.0 / v4;

    -[UIView bounds](self, "bounds");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __38___UIFindNavigatorView_layoutSubviews__block_invoke;
    v32[3] = &__block_descriptor_48_e19_v24__0__UIView_8d16l;
    *(double *)&v32[4] = v5;
    v32[5] = v6;
    v7 = (void (**)(void *, UIView *, double))_Block_copy(v32);
    v7[2](v7, self->_separatorViews.left, 0.0);
    right = self->_separatorViews.right;
    -[UIView bounds](self, "bounds");
    v7[2](v7, right, v9 - v5);
    -[UIView bounds](self, "bounds");
    v11 = v10 - v5;
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_separatorViews.bottom, "setFrame:", 0.0, v11);

  }
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v13 = v12;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v15 = v13 + v14;
  -[UIView bounds](self, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIFindNavigatorViewLayout preferredHorizontalPadding](self->_layout, "preferredHorizontalPadding");
  v25 = v15 + v24;
  -[_UIFindNavigatorViewLayout preferredVerticalPadding](self->_layout, "preferredVerticalPadding");
  v27 = v26;
  v34.origin.x = v17;
  v34.origin.y = v19;
  v34.size.width = v21;
  v34.size.height = v23;
  v35 = CGRectInset(v34, v25, v27);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  if (!CGRectIsNull(v35))
    -[UIView setFrame:](self->_layout, "setFrame:", x, y, width, height);
}

- (_UIFindNavigatorViewDelegate)findNavigatorDelegate
{
  return (_UIFindNavigatorViewDelegate *)objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
}

- (void)setFindNavigatorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_findNavigatorDelegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)matchCase
{
  return self->_matchCase;
}

- (void)setMatchCase:(BOOL)a3
{
  self->_matchCase = a3;
}

- (BOOL)wholeWords
{
  return self->_wholeWords;
}

- (void)setWholeWords:(BOOL)a3
{
  self->_wholeWords = a3;
}

- (BOOL)usesOpaqueBackground
{
  return self->_usesOpaqueBackground;
}

- (unint64_t)visibleSeparatorEdges
{
  return self->_visibleSeparatorEdges;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (UILabel)resultCountLabel
{
  return self->_resultCountLabel;
}

- (BOOL)replaceButtonEnabled
{
  return self->_replaceButtonEnabled;
}

- (BOOL)intrinsicHeightDerivedFromAssistantBar
{
  return self->_intrinsicHeightDerivedFromAssistantBar;
}

- (void)setIntrinsicHeightDerivedFromAssistantBar:(BOOL)a3
{
  self->_intrinsicHeightDerivedFromAssistantBar = a3;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (_UIFindNavigatorSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (_UIFindNavigatorSearchTextField)replaceTextField
{
  return self->_replaceTextField;
}

- (UIButton)nextResultButton
{
  return self->_nextResultButton;
}

- (UIButton)previousResultButton
{
  return self->_previousResultButton;
}

- (UIButton)replaceButton
{
  return self->_replaceButton;
}

- (void).cxx_destruct
{
  id *p_isa;

  p_isa = (id *)&self->super.super.super.super.isa;
  objc_storeStrong((id *)&self->_replaceButton, 0);
  objc_storeStrong(p_isa + 99, 0);
  objc_storeStrong(p_isa + 98, 0);
  objc_storeStrong(p_isa + 97, 0);
  objc_storeStrong(p_isa + 96, 0);
  objc_storeStrong(p_isa + 94, 0);
  objc_storeStrong(p_isa + 93, 0);
  objc_storeStrong(p_isa + 92, 0);
  objc_destroyWeak(p_isa + 89);
  objc_storeStrong(p_isa + 87, 0);

  p_isa += 79;
}

@end
