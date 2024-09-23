@implementation UIKeyboardLayoutCursor

- (UIKeyboardLayoutCursor)initWithFrame:(CGRect)a3
{
  UIKeyboardLayoutCursor *v3;
  UIKeyboardLayoutCursor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardLayoutCursor;
  v3 = -[UIKeyboardLayoutStar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->_selectedKeyBeforeDictation = 0x7FFFFFFFFFFFFFFFLL;
    v3->_shouldConfigureFloatingContentView = 1;
    v3->_shouldToggleLetterCaseNext = 1;
    v3->_keyplaneSwitchSelectedKeyFrameCenter = (CGPoint)*MEMORY[0x1E0C9D538];
    v3->_selectInitialKey = 0;
    v3->_lastSelectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[UIView setOpaque:](v3, "setOpaque:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  _shouldRestoreSelectedKeyIndex = 1;
  -[UIView removeFromSuperview](self->_selectionView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar dealloc](&v3, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[UIKeyboardLayoutCursor setShouldToggleLetterCaseNext:](self, "setShouldToggleLetterCaseNext:", 1);
}

- (void)runWithSuppressedActions:(id)a3
{
  self->_suppressOperations = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_suppressOperations = 0;
}

- (UIKBTree)currentKey
{
  unint64_t selectedKeyIndex;
  void *v4;

  selectedKeyIndex = self->_selectedKeyIndex;
  if (selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL || selectedKeyIndex >= -[NSArray count](self->_keyplaneKeys, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", self->_selectedKeyIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIKBTree *)v4;
}

- (unint64_t)variantCountForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "focusableVariantCount");
  }
  else
  {
    objc_msgSend(v4, "subtrees");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  return v7;
}

- (void)configureFloatingContentViewsIfNeeded
{
  _QWORD v2[5];
  __int128 v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__UIKeyboardLayoutCursor_configureFloatingContentViewsIfNeeded__block_invoke;
  v2[3] = &unk_1E16B1E18;
  v2[4] = self;
  v3 = xmmword_1866806E0;
  v4 = 0x4024000000000000;
  if (configureFloatingContentViewsIfNeeded_onceToken != -1)
    dispatch_once(&configureFloatingContentViewsIfNeeded_onceToken, v2);
}

void __63__UIKeyboardLayoutCursor_configureFloatingContentViewsIfNeeded__block_invoke(double *a1)
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:whenContainedInInstancesOfClasses:](_UIFloatingContentView, "appearanceForTraitCollection:whenContainedInInstancesOfClasses:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCornerRadius:", a1[5]);
  objc_msgSend(v4, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v4, "set_disableOutsetShadowPath:", 1);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:forState:", v5, 8);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:forState:", v6, 1);

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:whenContainedInInstancesOfClasses:](_UIFloatingContentView, "appearanceForTraitCollection:whenContainedInInstancesOfClasses:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCornerRadius:", a1[5]);
  objc_msgSend(v9, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v9, "set_disableOutsetShadowPath:", 1);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:forState:", v10, 8);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:forState:", v11, 1);

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceForTraitCollection:whenContainedInInstancesOfClasses:](_UIFloatingContentView, "appearanceForTraitCollection:whenContainedInInstancesOfClasses:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setCornerRadius:", a1[5]);
  objc_msgSend(v14, "setAsymmetricFocusedSizeIncrease:", a1[6], a1[7]);
  objc_msgSend(v14, "set_disableOutsetShadowPath:", 1);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:forState:", v15, 8);

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:forState:", v16, 1);

}

- (id)keyViewAnimator
{
  UIKBKeyViewAnimatorMonolith *v3;
  UIKBKeyViewAnimator *keyViewAnimator;
  UIKBKeyplaneView *keyplaneView;
  UIKBKeyViewAnimator *v6;
  UIKBKeyViewAnimator *v7;
  objc_super v9;

  if (-[UIKeyboardLayout idiom](self, "idiom") == 2)
  {
    if (!self->super._keyViewAnimator)
    {
      v3 = objc_alloc_init(UIKBKeyViewAnimatorMonolith);
      keyViewAnimator = self->super._keyViewAnimator;
      self->super._keyViewAnimator = &v3->super;

    }
    keyplaneView = self->super._keyplaneView;
    if (keyplaneView)
    {
      -[UIKBKeyplaneView keyViewAnimator](keyplaneView, "keyViewAnimator");
      v6 = (UIKBKeyViewAnimator *)objc_claimAutoreleasedReturnValue();
      v7 = self->super._keyViewAnimator;

      if (v6 != v7)
        -[UIKBKeyplaneView setKeyViewAnimator:](self->super._keyplaneView, "setKeyViewAnimator:", self->super._keyViewAnimator);
    }
    return self->super._keyViewAnimator;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKeyboardLayoutCursor;
    -[UIKeyboardLayoutStar keyViewAnimator](&v9, sel_keyViewAnimator);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
  int v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v8 = _shouldRestoreSelectedKeyIndex;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (v8 == 1)
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor deactivateKey:](self, "deactivateKey:", v12);

    self->_selectedKeyIndex = _savedSelectedKeyIndex;
    _shouldRestoreSelectedKeyIndex = 0;
  }
  else
  {
    -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  -[UIKeyboardLayoutCursor configureFloatingContentViewsIfNeeded](self, "configureFloatingContentViewsIfNeeded");
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar showKeyboardWithInputTraits:screenTraits:splitTraits:](&v13, sel_showKeyboardWithInputTraits_screenTraits_splitTraits_, v11, v10, v9);

  -[UIKeyboardLayoutCursor selectInitialKeyIfNecessary](self, "selectInitialKeyIfNecessary");
}

+ (id)carKeyboardNameForKeyboard:(id)a3 screenTraits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "idiom") == 3
    && ((objc_msgSend(v6, "knobInput") & 1) != 0 || objc_msgSend(v6, "touchpadInput")))
  {
    objc_msgSend(v5, "subtreeWithName:", CFSTR("capital-letters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("Alphabetic");
    if (!v7)
      v8 = CFSTR("Uncased");
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Car-%@-Linear-Keyboard"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  id v23;
  CGSize result;

  v8 = a4;
  UIKeyboardGetKBStarName(a3, v8, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "keyboardWithName:screenTraits:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "carKeyboardNameForKeyboard:screenTraits:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "keyboardWithName:screenTraits:", v11, v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "frame");
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__UIKeyboardLayoutCursor_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke;
    v21[3] = &unk_1E16B1B50;
    v17 = v11;
    v22 = v17;
    v18 = v10;
    v23 = v18;
    if (keyboardSizeForInputMode_screenTraits_keyboardType__once != -1)
    {
      dispatch_once(&keyboardSizeForInputMode_screenTraits_keyboardType__once, v21);
      v17 = v22;
      v18 = v23;
    }

    v14 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v19 = v14;
  v20 = v16;
  result.height = v20;
  result.width = v19;
  return result;
}

void __77__UIKeyboardLayoutCursor_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference__UIATVClearBeforeDictation_block_invoke___s_category;
  if (!_UIInternalPreference__UIATVClearBeforeDictation_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference__UIATVClearBeforeDictation_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Error: LayoutCursor keyboardName %@ resulted in %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "keyboardWithName:screenTraits:", v6, self->super.super._screenTraits);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "carKeyboardNameForKeyboard:screenTraits:", v7, self->super.super._screenTraits);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_storeStrong((id *)&self->_indirectKeyboard, v7);
    v9 = v8;

    v6 = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar setKeyboardName:appearance:](&v10, sel_setKeyboardName_appearance_, v6, a4);

}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->super._appearance = a3;
  -[UIKBTree setVisualStyle:](self->super._keyplane, "setVisualStyle:", -[UIKBTree visualStyle](self->super._keyboard, "visualStyle"));
}

- (void)setRenderConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar setRenderConfig:](&v4, sel_setRenderConfig_, a3);
  -[UIKeyboardLayoutCursor updateDictationHelpString](self, "updateDictationHelpString");
}

- (id)cacheTokenForKeyplane:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (-[UIKeyboardLayout idiom](self, "idiom") == 2)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardLayoutCursor;
    -[UIKeyboardLayoutCursor cacheTokenForKeyplane:](&v7, sel_cacheTokenForKeyplane_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setKeyplaneName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  _BOOL4 v18;
  UIKBTree *keyplane;
  NSArray *v20;
  NSArray *keyplaneKeys;
  UIKBTree *indirectKeyboard;
  UIKBTree *v23;
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
  id v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  int v72;
  int64_t v73;
  NSArray *v74;
  void *v75;
  void *v76;
  NSArray *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  id obj;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  objc_super v98;
  _BYTE v99[128];
  _QWORD v100[6];
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v100[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    x = self->_keyplaneSwitchSelectedKeyFrameCenter.x;
    y = self->_keyplaneSwitchSelectedKeyFrameCenter.y;
    if (x == *MEMORY[0x1E0C9D538] && y == *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      objc_msgSend(v5, "frame");
      x = CGRectGetMidX(v101);
      objc_msgSend(v5, "frame");
      y = CGRectGetMidY(v102);
    }
    v98.receiver = self;
    v98.super_class = (Class)UIKeyboardLayoutCursor;
    -[UIKeyboardLayoutStar setKeyplaneName:](&v98, sel_setKeyplaneName_, v4);
    v18 = -[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft");
    keyplane = self->super._keyplane;
    if (v18)
      -[UIKBTree keysOrderedByPositionRTL](keyplane, "keysOrderedByPositionRTL");
    else
      -[UIKBTree keysOrderedByPosition](keyplane, "keysOrderedByPosition");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    keyplaneKeys = self->_keyplaneKeys;
    self->_keyplaneKeys = v20;

    indirectKeyboard = self->_indirectKeyboard;
    if (indirectKeyboard)
    {
      v23 = self->super._keyplane;
      if (v23)
      {
        -[UIKBTree unhashedName](v23, "unhashedName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBTree subtreeWithName:](indirectKeyboard, "subtreeWithName:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "subtrees");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIKBTree firstCachedKeyWithName:](self->super._keyplane, "firstCachedKeyWithName:", CFSTR("Letter-Line-Key"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "keys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        if (qword_1ECD79A50 != -1)
          dispatch_once(&qword_1ECD79A50, &__block_literal_global_328);
        v31 = (void *)_MergedGlobals_47_0;
        objc_msgSend(v30, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "representedString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v31) = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));

        if ((_DWORD)v31)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_2;
          v95[3] = &unk_1E16D3F68;
          v96 = v34;
          v97 = v35;
          v36 = v35;
          v37 = v34;
          objc_msgSend(v30, "enumerateObjectsUsingBlock:", v95);
          objc_msgSend(v30, "removeAllObjects");
          objc_msgSend(v30, "addObjectsFromArray:", v37);
          objc_msgSend(v30, "addObjectsFromArray:", v36);

        }
        else
        {
          objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_74);
        }
        objc_msgSend(v28, "setSubtrees:", v30);
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutCursor enabledStateForKey:](self, "enabledStateForKey:", v28), v28);
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "subtrees");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutCursor activeStateForKey:](self, "activeStateForKey:", v41), v41);

        goto LABEL_80;
      }
    }
    if (-[UIKeyboardLayout idiom](self, "idiom") != 2)
    {
LABEL_80:

      goto LABEL_81;
    }
    if (-[UIKeyboardLayoutCursor selectedKeyBeforeDictation](self, "selectedKeyBeforeDictation") == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v5 && !self->_selectInitialKey)
      {
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "interactionType") == 3)
        {
          -[UIKeyboardLayoutStar candidateList](self, "candidateList");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "hasCandidates");

          if ((v40 & 1) != 0)
            goto LABEL_72;
        }
        else
        {

        }
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "interactionType");

        if (v46 == 3)
          goto LABEL_65;
        -[UIKeyboardLayoutCursor keyHitTestInSameRowAsCenter:size:](self, "keyHitTestInSameRowAsCenter:size:", x, y, v12, v14);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "interactionType");
        if (v48 == objc_msgSend(v5, "interactionType")
          || (-[UIKeyboardLayoutStar keyboard](self, "keyboard"),
              v49 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v49, "name"),
              v50 = (void *)objc_claimAutoreleasedReturnValue(),
              v51 = objc_msgSend(v50, "containsString:", CFSTR("Linear")),
              v50,
              v49,
              (v51 & 1) != 0))
        {
LABEL_63:
          if (v47)
          {
            v73 = -[NSArray indexOfObject:](self->_keyplaneKeys, "indexOfObject:", v47);
LABEL_71:
            -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", v73);

            goto LABEL_72;
          }
LABEL_65:
          v74 = self->_keyplaneKeys;
          if (-[UIKeyboardLayoutStar hasCandidateKeys](self, "hasCandidateKeys"))
          {
            v75 = (void *)-[NSArray mutableCopy](self->_keyplaneKeys, "mutableCopy");
            -[UIKBTree cachedKeysByKeyName:](self->super._keyplane, "cachedKeysByKeyName:", CFSTR("Candidate-Selection"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "removeObjectsInArray:", v76);
            v77 = v75;

            v73 = -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:inKeys:](self, "targetKeyIndexFromPoint:inKeys:", v77, x, y);
            if (v73 != 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_70;
          }
          else
          {
            v77 = v74;
          }
          v73 = -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:](self, "targetKeyIndexFromPoint:", x, y);
LABEL_70:

          v47 = 0;
          goto LABEL_71;
        }
        objc_msgSend(v47, "displayString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          objc_msgSend(v47, "name");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "containsString:", CFSTR("Empty-Key"));

          if (!v54)
            goto LABEL_39;
        }
        else
        {

        }
        v47 = 0;
LABEL_39:
        v87 = v47;
        v103.origin.x = v8;
        v103.origin.y = v10;
        v103.size.width = v12;
        v103.size.height = v14;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x - CGRectGetWidth(v103), y);
        v55 = objc_claimAutoreleasedReturnValue();
        v104.origin.x = v8;
        v104.origin.y = v10;
        v104.size.width = v12;
        v104.size.height = v14;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x + CGRectGetWidth(v104), y);
        v56 = objc_claimAutoreleasedReturnValue();
        if (-[UIKeyboardLayoutCursor isKeyboardRightToLeft](self, "isKeyboardRightToLeft"))
          v57 = v56;
        else
          v57 = v55;
        v100[0] = v57;
        v85 = (void *)v56;
        v86 = (void *)v55;
        if (-[UIKeyboardLayoutCursor isKeyboardRightToLeft](self, "isKeyboardRightToLeft"))
          v58 = v55;
        else
          v58 = v56;
        v100[1] = v58;
        v105.origin.x = v8;
        v105.origin.y = v10;
        v105.size.width = v12;
        v105.size.height = v14;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y - CGRectGetHeight(v105));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v100[2] = v59;
        v106.origin.x = v8;
        v106.origin.y = v10;
        v106.size.width = v12;
        v106.size.height = v14;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y + CGRectGetHeight(v106));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v100[3] = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        obj = v61;
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v92;
          v88 = v5;
          while (2)
          {
            v65 = 0;
            v89 = v63;
            do
            {
              if (*(_QWORD *)v92 != v64)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v65), "CGPointValue");
              -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v66;
              if (v66)
              {
                objc_msgSend(v66, "displayString");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v68, "length"))
                {
                  v69 = v64;
                  objc_msgSend(v67, "name");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v71 = objc_msgSend(v70, "containsString:", CFSTR("Empty-Key"));

                  if ((v71 & 1) != 0)
                  {
                    v64 = v69;
                    v5 = v88;
                    v63 = v89;
                  }
                  else
                  {
                    v64 = v69;
                    if (!v87)
                      v87 = v67;
                    v72 = objc_msgSend(v67, "interactionType");
                    v5 = v88;
                    v63 = v89;
                    if (v72 == objc_msgSend(v88, "interactionType"))
                    {

                      v87 = v67;
                      goto LABEL_62;
                    }
                  }
                }
                else
                {

                }
              }

              ++v65;
            }
            while (v63 != v65);
            v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
            if (v63)
              continue;
            break;
          }
        }
LABEL_62:

        v47 = v87;
        goto LABEL_63;
      }
    }
    else
    {
      -[UIKBTree name](self->super._keyplane, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "rangeOfString:", CFSTR("Dictation"));

      if (v44 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", -[UIKeyboardLayoutCursor selectedKeyBeforeDictation](self, "selectedKeyBeforeDictation"));
        -[UIKeyboardLayoutCursor setSelectedKeyBeforeDictation:](self, "setSelectedKeyBeforeDictation:", 0x7FFFFFFFFFFFFFFFLL);
      }
    }
LABEL_72:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v78, "shouldShowDictationKey") & 1) != 0)
    {
      -[UIKBTree name](self->super._keyplane, "name");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "rangeOfString:", CFSTR("Dictation"));

      if (v80 == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "updateHelperMessageDisplayIfNeeded");
LABEL_77:

        -[UIKeyboardLayoutCursor updateRecentInputsKeyIfNecessary](self, "updateRecentInputsKeyIfNecessary");
        -[UIKBTree name](self->super._keyplane, "name");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v82, "rangeOfString:", CFSTR("Dictation"));

        if (v83 == 0x7FFFFFFFFFFFFFFFLL)
          -[UIKeyboardLayoutCursor selectInitialKeyIfNecessary](self, "selectInitialKeyIfNecessary");
        -[UIKeyboardLayoutCursor updateKeyplaneSwitchEdgeBiases](self, "updateKeyplaneSwitchEdgeBiases");
        -[UIKeyboardLayoutCursor updateDictationHelpString](self, "updateDictationHelpString");
        +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v84);

        self->_keyplaneSwitchSelectedKeyFrameCenter.x = x;
        self->_keyplaneSwitchSelectedKeyFrameCenter.y = y;
        -[UIKeyboardLayoutCursor setLastSelectedKeyIndex:](self, "setLastSelectedKeyIndex:", 0x7FFFFFFFFFFFFFFFLL);
        goto LABEL_80;
      }
    }
    else
    {

    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "stopHelperMessageDisplayIfNeeded");
    goto LABEL_77;
  }
LABEL_81:

}

void __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_47_0;
  _MergedGlobals_47_0 = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".,-/#&@'+"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD79A48;
  qword_1ECD79A48 = v2;

}

void __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = (void *)_MergedGlobals_47_0;
  v10 = v3;
  objc_msgSend(v3, "representedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0));

  if ((_DWORD)v4)
  {
    v6 = v10;
    v7 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v7, "addObject:", v6);
    goto LABEL_6;
  }
  v8 = (void *)qword_1ECD79A48;
  objc_msgSend(v10, "representedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

  if ((_DWORD)v8)
  {
    v6 = v10;
    v7 = (id *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __42__UIKeyboardLayoutCursor_setKeyplaneName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "representedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

- (BOOL)shouldAllowCurrentKeyplaneReload
{
  return -[UIKeyboardLayout idiom](self, "idiom") != 2
      || -[UITextInputTraits keyboardType](self->super.super._inputTraits, "keyboardType") != 7;
}

- (void)selectInitialKeyIfNecessary
{
  void *v3;
  void *v4;
  BOOL v5;
  NSArray *keyplaneKeys;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIKBKeyplaneView *keyplaneView;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  if (-[UIKBScreenTraits idiom](self->super.super._screenTraits, "idiom") == 3)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isFocused"))
    {

    }
    else
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[UIView isDescendantOfView:](self, "isDescendantOfView:", v4);

      if (v5)
        return;
    }
  }
  if (!self->_selectInitialKey)
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "visible");

      if (v13)
      {
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UIKeyboardLayoutCursor activeStateForKey:](self, "activeStateForKey:", v14);

        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "state") == (_DWORD)v15)
        {
          keyplaneView = self->super._keyplaneView;
          -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBKeyplaneView viewForKey:](keyplaneView, "viewForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_opt_class();

          if (v20)
          {
LABEL_20:
            -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardLayoutCursor refreshSelectedCellIfNecessaryForKey:](self, "refreshSelectedCellIfNecessaryForKey:", v22);

            return;
          }
        }
        else
        {

        }
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v15, v21);

        goto LABEL_20;
      }
    }
  }
  if (-[UITextInputTraits hasDefaultContents](self->super.super._inputTraits, "hasDefaultContents"))
  {
    keyplaneKeys = self->_keyplaneKeys;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke;
    v23[3] = &unk_1E16CEF88;
    v23[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](keyplaneKeys, "enumerateObjectsUsingBlock:", v23);
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFocused");

    if (v8)
    {
      v9 = -[UIKeyboardLayoutCursor _indexOfFirstKeyPassingTest:](self, "_indexOfFirstKeyPassingTest:", &__block_literal_global_89_3);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
        -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", v9);
        self->_selectInitialKey = 1;
      }
    }
    else
    {
      _savedSelectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
}

void __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "interactionType") == 4
    || (objc_msgSend(v9, "name"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Monolith-Recent-Inputs-Key")),
        v7,
        v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedKeyIndex:", a3);
    *a4 = 1;
  }

}

uint64_t __53__UIKeyboardLayoutCursor_selectInitialKeyIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "interactionType") == 1
    || objc_msgSend(v2, "interactionType") == 2
    || objc_msgSend(v2, "interactionType") == 16)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("Monolith-Recent-Inputs-Key"));

  }
  return v3;
}

- (void)updateKeyplaneSwitchEdgeBiases
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_keyplaneKeys;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
  {
    v6 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v5 = v4;
  v6 = 0;
  LODWORD(v7) = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if ((objc_msgSend(v10, "interactionType") == 10
         || objc_msgSend(v10, "interactionType") == 9)
        && objc_msgSend(v10, "visible"))
      {
        if ((_DWORD)v7)
        {
          -[NSArray lastObject](self->_keyplaneKeys, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 == v11)
          {
            if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
              v7 = 21;
            else
              v7 = 29;
          }
          else
          {
            v7 = 2;
          }
        }
        else if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
        {
          v7 = 29;
        }
        else
        {
          v7 = 21;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forProperty:", v12, CFSTR("popup-bias"));

        v13 = v10;
        v6 = v13;
      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v5);

  if (v6 && (_DWORD)v7 == 2)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
      v15 = 21;
    else
      v15 = 29;
    objc_msgSend(v14, "numberWithInt:", v15);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forProperty:", v3, CFSTR("popup-bias"));
    goto LABEL_28;
  }
LABEL_29:

}

- (void)updateDictationHelpString
{
  void *v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *v17;
  UILabel *dictationHelpLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UILabel *v36;
  void *v37;
  void *v38;
  int v39;
  __CFString **v40;
  __CFString *v41;
  UILabel *v42;
  uint64_t v43;
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
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  UIKeyboardLayoutCursor *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  -[UIKBTree name](self->super._keyplane, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("Dictation"));

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v5 = self->_keyplaneKeys;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v6)
  {
    v7 = v6;
    v73 = 0;
    v8 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v76 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        if (objc_msgSend(v10, "interactionType") == 10
          || objc_msgSend(v10, "interactionType") == 9)
        {
          -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setHidden:", v4 != 0x7FFFFFFFFFFFFFFFLL);
          if (!v73)
          {
            if (objc_msgSend(v10, "interactionType") == 10)
              v73 = v10;
            else
              v73 = 0;
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v7);

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v73)
      {

        return;
      }
      if (!self->_dictationHelpLabel)
      {
        objc_msgSend(v73, "frame");
        v13 = v12;
        v15 = v14;
        -[UIView bounds](self, "bounds");
        v17 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, v13, v16, v15);
        dictationHelpLabel = self->_dictationHelpLabel;
        self->_dictationHelpLabel = v17;

        -[UILabel setTextAlignment:](self->_dictationHelpLabel, "setTextAlignment:", 1);
      }
      -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderingContext renderingContextForRenderConfig:](UIKBRenderingContext, "renderingContextForRenderConfig:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKBRenderFactory lightweightFactoryForVisualStyle:renderingContext:](UIKBRenderFactory, "lightweightFactoryForVisualStyle:renderingContext:", -[UIKBTree visualStyling](self->super._keyplane, "visualStyling"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "traitsForKey:onKeyplane:", v73, self->super._keyplane);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "symbolStyle");
      v23 = objc_claimAutoreleasedReturnValue();
      v72 = v22;
      if (!v23)
        goto LABEL_25;
      v24 = (void *)v23;
      objc_msgSend(v22, "symbolStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v22, "symbolStyle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "fontSize");
        v29 = v28;
        objc_msgSend(v22, "symbolStyle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fontWeight");
        objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_dictationHelpLabel, "setFont:", v32);

        objc_msgSend(v22, "symbolStyle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "textColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(v34));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](self->_dictationHelpLabel, "setTextColor:", v35);

      }
      else
      {
LABEL_25:
        objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 29.0, *(double *)off_1E167DC68);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_dictationHelpLabel, "setFont:", v37);

        -[UIKeyboardLayoutStar renderConfig](self, "renderConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "lightKeyboard");
        v40 = UIKBColorBlack_Alpha40;
        if (!v39)
          v40 = UIKBColorWhite_Alpha50;
        v41 = *v40;

        +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(v41));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = self->_dictationHelpLabel;

        -[UILabel setTextColor:](v42, "setTextColor:", v33);
      }

      v43 = -[UITextInputTraits dictationInfoKeyboardType](self->super.super._inputTraits, "dictationInfoKeyboardType");
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "currentInputMode");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "languageWithRegion");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "enabledDictationLanguages");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (UIKeyboardTypeSupportsDictationSpelling(v43)
        || -[UITextInputTraits isSecureTextEntry](self->super.super._inputTraits, "isSecureTextEntry")
        || -[UITextInputTraits forceSpellingDictation](self->super.super._inputTraits, "forceSpellingDictation"))
      {
        if (v48 < 2)
        {
          _UILocalizedString(CFSTR("ATV_DICTATION_SPELLING_INSTRUCTION"), (uint64_t)CFSTR("Instruction text for AppleTV spelling dictation."), CFSTR("Speak in letters, numbers, and symbols."));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _UILocalizedString(CFSTR("ATV_DICTATION_SPELLING_INSTRUCTION_LANGUAGE"), (uint64_t)CFSTR("Instruction text for AppleTV spelling dictation with language."), CFSTR("Speak in letters, numbers, and symbols in %@."));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "currentInputMode");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "defaultDictationLanguage");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "currentInputModeForDictation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "dictationLanguage");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          TIInputModeGetLanguageWithRegion();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "hasPrefix:", CFSTR("%@")))
            v57 = 4;
          else
            v57 = 5;
          UIKeyboardDictationDisplayNameInUILanguage(v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v49, CFSTR("%@"), 0, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        _UILocalizedString(CFSTR("ATV_DICTATION_GENERIC_INSTRUCTION"), (uint64_t)CFSTR("Instruction text for AppleTV generic dictation."), CFSTR("Speak in full words and phrases."));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48 >= 2)
        {
          _UILocalizedString(CFSTR("ATV_DICTATION_GENERIC_INSTRUCTION_LANGUAGE"), (uint64_t)CFSTR("Instruction text for AppleTV generic dictation with language."), CFSTR("Speak in full words and phrases in %@."));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "currentInputMode");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "defaultDictationLanguage");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "currentInputModeForDictation");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "dictationLanguage");
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          TIInputModeGetLanguageWithRegion();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v61, "hasPrefix:", CFSTR("%@")))
            v69 = 4;
          else
            v69 = 5;
          UIKeyboardDictationDisplayNameInUILanguage(v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v61, CFSTR("%@"), 0, v70);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      -[UILabel setText:](self->_dictationHelpLabel, "setText:", v59);
      -[UIView superview](self->_dictationHelpLabel, "superview");
      v60 = (UIKeyboardLayoutCursor *)objc_claimAutoreleasedReturnValue();

      if (v60 != self)
      {
        -[UIView setAlpha:](self->_dictationHelpLabel, "setAlpha:", 0.0);
        -[UIView insertSubview:above:](self, "insertSubview:above:", self->_dictationHelpLabel, self->super._keyplaneView);
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __51__UIKeyboardLayoutCursor_updateDictationHelpString__block_invoke;
        v74[3] = &unk_1E16B1B28;
        v74[4] = self;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v74, 0.133);
      }

      goto LABEL_41;
    }
  }
  else
  {

    v73 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_42;
  }
  v36 = self->_dictationHelpLabel;
  if (v36)
  {
    -[UIView removeFromSuperview](v36, "removeFromSuperview");
    v20 = self->_dictationHelpLabel;
    self->_dictationHelpLabel = 0;
LABEL_41:

  }
LABEL_42:

}

uint64_t __51__UIKeyboardLayoutCursor_updateDictationHelpString__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1616), "setAlpha:", 1.0);
}

- (BOOL)shouldMatchCaseForDomainKeys
{
  return -[UIKeyboardLayout idiom](self, "idiom") == 2;
}

- (void)showRecentInputsAlert
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Previously-Used Emails"), CFSTR("Previously-Used Emails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIKBAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setKbDelegate:", self);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UILexicon entries](self->_recentInputs, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "userInput");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke;
        v17[3] = &unk_1E16B3EC8;
        v17[4] = self;
        +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAction:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "_addSectionDelimiter");
  _UINSLocalizedStringWithDefaultValue(CFSTR("Clear All"), CFSTR("Clear All"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke_2;
  v16[3] = &unk_1E16B3EC8;
  v16[4] = self;
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAction:", v13);
  +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", 0, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", 0);
  objc_msgSend(v4, "addAction:", v14);
  -[UIKeyboardLayoutCursor setRecentInputsAlert:](self, "setRecentInputsAlert:", v4);
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v4, 1, 0);

}

void __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "title");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSelectRecentInputString:", v3);

}

uint64_t __47__UIKeyboardLayoutCursor_showRecentInputsAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSelectRecentInputString:", 0x1E1744240);
}

- (void)alertDidDismiss
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIKeyboardLayoutCursor_alertDidDismiss__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __41__UIKeyboardLayoutCursor_alertDidDismiss__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusedView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", v5)
    && !objc_msgSend(*(id *)(a1 + 32), "cursorLocation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectInitialKeyIfNecessary");
  }
  v3 = *(void **)(a1 + 32);
  +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_didChangeKeyplaneWithContext:", v4);

}

- (void)didSelectRecentInputString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", 0x1E1744240))
  {
    objc_msgSend(v4, "clearRecentInput");
    -[UIKeyboardLayoutCursor setRecentInputs:](self, "setRecentInputs:", 0);
    -[UIKBTree name](self->super._keyplane, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v5);

    -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(v4, "handleClear");
    -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", v8, 0, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleKeyEvent:", v6);

  }
  -[UIKeyboardLayoutCursor recentInputsAlert](self, "recentInputsAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  -[UIKeyboardLayoutCursor setRecentInputsAlert:](self, "setRecentInputsAlert:", 0);
}

- (void)updateRecentInputsKeyIfNecessary
{
  void *v3;
  id v4;

  -[UIKBTree firstCachedKeyWithName:](self->super._keyplane, "firstCachedKeyWithName:", CFSTR("Monolith-Recent-Inputs-Key"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVerticalLayout:", self->_disableTouchInput);
  objc_msgSend(v3, "setRecentInputs:", self->_recentInputs);

}

- (void)acceptRecentInputIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[UIKBTree firstCachedKeyWithName:](self->super._keyplane, "firstCachedKeyWithName:", CFSTR("Monolith-Recent-Inputs-Key"));
  v8 = objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)v8;
  if (v3 == (void *)v8)
  {
    -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "selectedRecentInputString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", 0x1E1744240) & 1) == 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "acceptRecentInput:", v6);

      }
    }

    v4 = (void *)v8;
  }

}

- (void)setRecentInputs:(id)a3
{
  objc_storeStrong((id *)&self->_recentInputs, a3);
  -[UIKeyboardLayoutCursor updateRecentInputsKeyIfNecessary](self, "updateRecentInputsKeyIfNecessary");
}

- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3
{
  return 1;
}

- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5
{
  return 0;
}

- (unsigned)getHandRestRecognizerState
{
  return 0;
}

- (BOOL)supportsEmoji
{
  return 0;
}

- (BOOL)isPossibleToTypeFast
{
  return 0;
}

- (id)_keyplaneForKeyplaneProperties
{
  UIKBTree *indirectKeyboard;
  UIKBTree *keyplane;
  void *v5;
  UIKBTree *v6;

  indirectKeyboard = self->_indirectKeyboard;
  if (!indirectKeyboard
    || (keyplane = self->super._keyplane) == 0
    || (-[UIKBTree name](keyplane, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[UIKBTree subtreeWithName:](indirectKeyboard, "subtreeWithName:", v5),
        v6 = (UIKBTree *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v6 = self->super._keyplane;
  }
  return v6;
}

- (BOOL)usesAutoShift
{
  void *v2;
  char v3;

  -[UIKeyboardLayoutCursor _keyplaneForKeyplaneProperties](self, "_keyplaneForKeyplaneProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForProperty:", CFSTR("autoshift"));

  return v3;
}

- (BOOL)ignoresShiftState
{
  void *v2;
  char v3;

  -[UIKeyboardLayoutCursor _keyplaneForKeyplaneProperties](self, "_keyplaneForKeyplaneProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForProperty:", CFSTR("ignore-shift-state"));

  return v3;
}

- (void)setShift:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar setShift:](&v3, sel_setShift_, a3);
}

- (BOOL)isAlphabeticPlane
{
  void *v2;
  char v3;

  -[UIKeyboardLayoutCursor _keyplaneForKeyplaneProperties](self, "_keyplaneForKeyplaneProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForProperty:", CFSTR("is-alphabetic-plane"));

  return v3;
}

- (BOOL)isKanaPlane
{
  void *v2;
  char v3;

  -[UIKeyboardLayoutCursor _keyplaneForKeyplaneProperties](self, "_keyplaneForKeyplaneProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKanaPlane");

  return v3;
}

- (BOOL)supportsContinuousPath
{
  return -[UIKBTree BOOLForProperty:](self->super._keyplane, "BOOLForProperty:", CFSTR("supports-continuous-path"));
}

- (BOOL)diacriticForwardCompose
{
  void *v2;
  char v3;

  -[UIKeyboardLayoutCursor _keyplaneForKeyplaneProperties](self, "_keyplaneForKeyplaneProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForProperty:", CFSTR("diacritic-forward-compose"));

  return v3;
}

- (void)setDisableTouchInput:(BOOL)a3
{
  self->_disableTouchInput = a3;
}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 0;
}

- (BOOL)shouldToggleKeyplaneWithName:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("Recents")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v3, "rangeOfString:", CFSTR("Dictation")) == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)isKeyplaneDisabledWithName:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  int v7;
  unint64_t v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("Dictation")) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    v5 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("Recents")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_useRecentsAlert");

    if (v7 && !-[UITextInputTraits isSecureTextEntry](self->super.super._inputTraits, "isSecureTextEntry"))
    {
      -[UILexicon entries](self->_recentInputs, "entries");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v11, "count") == 0;

      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("Numbers")) == 0x7FFFFFFFFFFFFFFFLL
    || ((v9 = -[UITextInputTraits keyboardType](self->super.super._inputTraits, "keyboardType"), v5 = 1, v9 <= 9)
      ? (v10 = ((1 << v9) & 0x2CF) == 0)
      : (v10 = 1),
        v10 && v9 != 123))
  {
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (BOOL)shouldMergeKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  int v8;
  char HasMultipleActiveSecureInputModes;

  v4 = a3;
  if (objc_msgSend(v4, "interactionType") == 10)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[UIKeyboardLayoutCursor isKeyplaneDisabledWithName:](self, "isKeyplaneDisabledWithName:", v5);
    return v6;
  }
  else
  {
    v8 = objc_msgSend(v4, "interactionType");

    if (v8 == 9)
    {
      if (-[UITextInputTraits isSecureTextEntry](self->super.super._inputTraits, "isSecureTextEntry"))
        HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();
      else
        HasMultipleActiveSecureInputModes = (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") > 1;
      return HasMultipleActiveSecureInputModes ^ 1;
    }
    else
    {
      return 0;
    }
  }
}

- (int)stateForKeyplaneSwitchKey:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutCursor;
  v5 = -[UIKeyboardLayoutStar stateForKeyplaneSwitchKey:](&v10, sel_stateForKeyplaneSwitchKey_, v4);
  if (v5 != 4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("Recents"));

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UILexicon entries](self->_recentInputs, "entries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
        v5 = 2;
      else
        v5 = 1;

    }
  }

  return v5;
}

- (int)stateForCandidateListKey:(id)a3
{
  return 16;
}

- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4
{
  if (-[UIKeyboardLayout idiom](self, "idiom", a3, a4) == 2)
    return 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)canMultitap
{
  UIKBTree *keyplane;
  UIKBTree **p_cachedMultitapKeyplane;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  keyplane = self->super._keyplane;
  p_cachedMultitapKeyplane = &self->_cachedMultitapKeyplane;
  if (keyplane != *p_cachedMultitapKeyplane)
  {
    objc_storeStrong((id *)p_cachedMultitapKeyplane, keyplane);
    self->_cachedCanMultitap = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIKBTree keys](self->super._keyplane, "keys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "interactionType") == 16)
          {
            self->_cachedCanMultitap = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return self->_cachedCanMultitap;
}

- (void)endMultitapForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UIKeyboardLayoutCursor keyViewAnimator](self, "keyViewAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "state");
      -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v10)
        v9 = 8;
      else
        v9 = 2;
      objc_msgSend(v6, "transitionKeyView:fromState:toState:completion:", v5, v7, v9, 0);

    }
    v4 = v10;
  }

}

- (void)longPressAction
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v13;

  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardLayoutCursor;
  -[UIKeyboardLayoutStar longPressAction](&v13, sel_longPressAction);
  if (-[UIKeyboardLayoutCursor isSlimLinearKeyboardTV](self, "isSlimLinearKeyboardTV"))
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interactionType");

    if (v6 == 10)
      -[UIKeyboardLayoutCursor showPopupKeyplaneSwitcher](self, "showPopupKeyplaneSwitcher");
  }
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v4 != 16 && v8 == 16)
  {
    self->_ignoreEventsUntilPressEnds = 1;
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v9);

    +[_UIKeyboardUsageTracking showVariantsIncrement](_UIKeyboardUsageTracking, "showVariantsIncrement");
  }
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "interactionType");

  if (v11 == 4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleClear");

  }
}

- (void)showPopupKeyplaneSwitcher
{
  UIKBTree *keyboard;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  keyboard = self->super._keyboard;
  -[UIKeyboardLayoutStar keyplane](self, "keyplane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keyplaneSwitchKeysWithoutCurrentKeyplane:](keyboard, "keyplaneSwitchKeysWithoutCurrentKeyplane:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardLayoutStar updateLocalizedDisplayStringsForKeys:](self, "updateLocalizedDisplayStringsForKeys:", v14);
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedVariantIndex:", 0);

  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariantType:", 14);

  v7 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v8 = UIKBAttributeValueFixedLeftStr;
  if (v7)
    v8 = UIKBAttributeValueFixedRightStr;
  v9 = *v8;
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVariantPopupBias:", v9);

  v11 = (void *)objc_msgSend(v14, "mutableCopy");
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSubtrees:", v11);

  if (-[UIKBScreenTraits idiom](self->super.super._screenTraits, "idiom") == 2)
    -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 1);
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 16, v13);

}

- (int)activeStateForKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") == 38 || objc_msgSend(v3, "displayType") == 1)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "displayType") == 14)
  {
    v4 = 8;
  }
  else
  {
    v4 = 8;
    if (objc_msgSend(v3, "displayType") != 4)
    {
      if (objc_msgSend(v3, "displayType") == 13)
        v4 = 8;
      else
        v4 = 4;
    }
  }

  return v4;
}

- (int)enabledStateForKey:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (objc_msgSend(v4, "displayType") == 38 || objc_msgSend(v4, "displayType") == 1)
  {
    v5 = 16;
  }
  else if (objc_msgSend(v4, "displayType") == 14 || objc_msgSend(v4, "displayType") == 4)
  {
    v5 = -[UIKeyboardLayoutCursor stateForKeyplaneSwitchKey:](self, "stateForKeyplaneSwitchKey:", v4);
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (unint64_t)downActionFlagsForKey:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  _BOOL4 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardLayoutCursor;
  v5 = -[UIKeyboardLayoutStar downActionFlagsForKey:](&v9, sel_downActionFlagsForKey_, v4);
  if (objc_msgSend(v4, "interactionType") == 16)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isLongPress") & 1) != 0)
    {
      v7 = -[UIKeyboardLayoutStar keyHasAccentedVariants:](self, "keyHasAccentedVariants:", v4);

      if (v7)
        v5 |= 0x8080uLL;
    }
    else
    {

    }
  }

  return v5;
}

- (unint64_t)cursorLocation
{
  unint64_t v2;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t selectedKeyIndex;
  int v29;
  int64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  _BOOL4 v46;
  _BOOL4 v47;
  int v48;
  CGRect v49;
  CGRect v50;

  if (self->_selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v5);
  if (v6)
  {
    v7 = objc_msgSend(v5, "state");
    v8 = objc_msgSend(v5, "selectedVariantIndex");
    if (v4 == 1)
      v9 = 0;
    else
      v9 = v6 - 1;
    if (v4 == 1)
      v10 = v6 - 1;
    else
      v10 = 0;
    v11 = v8 == 0;
    v12 = v8 == v10;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 1;
      v12 = 1;
    }
    v13 = v7 == 16;
    v14 = v7 == 16 && v8 == v6 - 1;
    LODWORD(v6) = v7 == 16 && v11;
    v15 = v7 == 16 && v12;
    v47 = v15;
  }
  else
  {
    v8 = objc_msgSend(v5, "selectedVariantIndex");
    v13 = 0;
    v14 = 0;
    v47 = 0;
    if (v4 == 1)
      v9 = 0;
    else
      v9 = -1;
  }
  v16 = v8 == v9 && v13;
  v46 = v16;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v18 = v17;
  }
  else
  {
    -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
    v18 = v19;
  }
  -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
  if (v18 > v20)
  {
    -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
    v18 = v21;
  }
  v48 = v6;
  if (v5)
  {
    objc_msgSend(v5, "frame");
    v23 = v22;
  }
  else
  {
    -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
    v23 = v24;
  }
  v25 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, -v18, 0.0);
  v26 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, v18, 0.0);
  v27 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, 0.0, -v23);
  -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](self, "targetKeyIndexAtOffset:fromKey:", v5, 0.0, v23);
  selectedKeyIndex = self->_selectedKeyIndex;
  v29 = !v13;
  if (selectedKeyIndex || ((v29 | v47) & 1) == 0)
  {
    if (((selectedKeyIndex >= -[NSArray count](self->_keyplaneKeys, "count") - 1) & (v29 | v46)) != 0)
      v31 = 4;
    else
      v31 = 0;
    v30 = self->_selectedKeyIndex;
  }
  else
  {
    v30 = 0;
    v31 = 1;
  }
  v32 = v14;
  v33 = v25 == v30;
  v34 = v48;
  if ((v33 & (v29 | v48)) != 0)
    v31 |= 0x20uLL;
  if (((v26 == v30) & (v29 | v14)) != 0)
    v35 = v31 | 0x40;
  else
    v35 = v31;
  if (v35)
    v36 = v35;
  else
    v36 = 2;
  objc_msgSend(v5, "frame");
  if (fabs(CGRectGetMinY(v49)) >= 15.0)
  {
    if (v27 != 0x7FFFFFFFFFFFFFFFLL && v27 != self->_selectedKeyIndex)
    {
      -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", v27);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "interactionType") == 3)
      {
        -[UIKeyboardLayoutStar candidateList](self, "candidateList");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "hasCandidates");

        v34 = v48;
        if (!v39)
          v36 |= 8uLL;
      }

    }
  }
  else
  {
    v36 |= 8uLL;
  }
  -[UIView bounds](self, "bounds");
  v41 = v40;
  objc_msgSend(v5, "frame");
  if (vabdd_f64(v41, CGRectGetMaxY(v50)) >= 15.0)
    v2 = v36;
  else
    v2 = v36 | 0x10;
  if (v13)
  {
    v42 = objc_msgSend(v5, "variantType");
    v43 = 128;
    if (v34)
      v43 = 160;
    v44 = v2 & 0xFFFFFFFFFFFFFFE7 | v43;
    if (v32)
      v44 |= 0x40uLL;
    if (v42)
      v2 = v44;
  }

  return v2;
}

- (void)setCursorLocation:(unint64_t)a3
{
  __int16 v3;
  unint64_t v5;
  int64_t selectedKeyIndex;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  v5 = a3 & 7;
  selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
  switch(v5)
  {
    case 0uLL:
      if ((v3 & 0x200) == 0)
        _savedSelectedKeyIndex = self->_selectedKeyIndex;
      goto LABEL_10;
    case 1uLL:
      selectedKeyIndex = 0;
      goto LABEL_10;
    case 2uLL:
      selectedKeyIndex = self->_selectedKeyIndex;
      if (selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_10;
      selectedKeyIndex = _savedSelectedKeyIndex;
      if ((v3 & 0x100) != 0 || _savedSelectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_10;
      -[UIKeyboardLayoutCursor selectInitialKeyIfNecessary](self, "selectInitialKeyIfNecessary");
      break;
    case 4uLL:
      selectedKeyIndex = -[NSArray count](self->_keyplaneKeys, "count", 0x7FFFFFFFFFFFFFFFLL) - 1;
      goto LABEL_10;
    default:
LABEL_10:
      -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", selectedKeyIndex);
      break;
  }
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:");
  if (v7)
  {
    v8 = v7;
    if (!objc_msgSend(v14, "variantType"))
    {
      if (v5 - 1 >= 2)
      {
        if (v5 != 4)
        {
          v13 = 0x7FFFFFFFFFFFFFFFLL;
          v12 = v14;
LABEL_21:
          -[UIKeyboardLayoutCursor setHighlightedVariantIndex:key:](self, "setHighlightedVariantIndex:key:", v13, v12);
          goto LABEL_22;
        }
        v9 = -[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft");
        v11 = 0;
        v10 = v8 - 1;
      }
      else
      {
        v9 = -[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft");
        v10 = 0;
        v11 = v8 - 1;
      }
      v12 = v14;
      if (v9)
        v13 = v11;
      else
        v13 = v10;
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)restoreFocusFromEntryPoint:(CGPoint)a3
{
  double y;
  double x;
  int64_t v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIKBTree keysExcludingEmptyKeys](self->super._keyplane, "keysExcludingEmptyKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:inKeys:](self, "targetKeyIndexFromPoint:inKeys:", x, y);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    -[UIKeyboardLayoutCursor selectInitialKeyIfNecessary](self, "selectInitialKeyIfNecessary");
  else
    -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", v6);

}

- (BOOL)shouldDeactivateWithoutWindow
{
  return self->_selectedKeyIndex == 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)selectionFrameForKeyIndex:(int64_t)a3
{
  void *v3;
  int v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat MidX;
  CGFloat MidY;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interactionType");
  objc_msgSend(v3, "paddedFrame");
  MidX = v5;
  MidY = v6;
  v11 = v7;
  v12 = v8;
  if (v4 == 10)
  {
    MidX = CGRectGetMidX(*(CGRect *)&v5);
    objc_msgSend(v3, "paddedFrame");
    MidY = CGRectGetMidY(v17);
    v11 = 0.0;
    v12 = 0.0;
  }

  v13 = MidX;
  v14 = MidY;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)deactivateKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
    v5 = -[UIKeyboardLayoutCursor enabledStateForKey:](self, "enabledStateForKey:", v8);
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v5, v8);
    v4 = v8;
    if ((_DWORD)v5 == 16)
    {
      objc_msgSend(v8, "subtrees");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v4 = v8;
      if (!v7)
      {
        -[UIKeyboardLayoutCursor refreshSelectedCellIfNecessaryForKey:](self, "refreshSelectedCellIfNecessaryForKey:", v8);
        v4 = v8;
      }
    }
  }

}

- (void)setSelectedKeyIndex:(int64_t)a3
{
  unint64_t v5;
  int64_t selectedKeyIndex;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIKBCursorSelection *v11;
  void *v12;
  UIView *v13;
  UIView *selectionView;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];

  if (!-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations") && self->_selectedKeyIndex != a3)
  {
    if ((unint64_t)a3 >= 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v5 = a3;
    if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || v5 >= -[NSArray count](self->_keyplaneKeys, "count"))
    {
      -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      self->_selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
      -[UIKeyboardLayoutCursor deactivateKey:](self, "deactivateKey:", v18);
      -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);

    }
    else
    {
      selectedKeyIndex = self->_selectedKeyIndex;
      if (-[UIKBScreenTraits idiom](self->super.super._screenTraits, "idiom") == 3
        && (-[UIKBScreenTraits knobInput](self->super.super._screenTraits, "knobInput")
         || -[UIKBScreenTraits touchpadInput](self->super.super._screenTraits, "touchpadInput"))
        || -[UIKBScreenTraits idiom](self->super.super._screenTraits, "idiom") == 2)
      {
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutCursor setLastSelectedKeyIndex:](self, "setLastSelectedKeyIndex:", self->_selectedKeyIndex);
        self->_selectedKeyIndex = v5;
        -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 != v8)
        {
          -[UIKeyboardLayoutCursor deactivateKey:](self, "deactivateKey:", v7);
          -[UIKeyboardLayoutStar activeKey](self, "activeKey");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 == v7)
            -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
        }
        if (!objc_msgSend(v8, "visible") || objc_msgSend(v8, "state") == 1)
          goto LABEL_17;
        v15 = -[UIKeyboardLayoutCursor activeStateForKey:](self, "activeStateForKey:", v8);
        if (v7 != v8)
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", v15, v8);
        if ((_DWORD)v15 == 16)
        {
          objc_msgSend(v8, "subtrees");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (!v17
            && !-[UIKeyboardLayoutCursor refreshSelectedCellIfNecessaryForKey:](self, "refreshSelectedCellIfNecessaryForKey:", v8))
          {
LABEL_17:
            -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", selectedKeyIndex);
          }
        }
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);

      }
      else
      {
        if (!self->_selectionView)
        {
          v11 = [UIKBCursorSelection alloc];
          -[UIResponder _responderSelectionImage](self, "_responderSelectionImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[UIImageView initWithImage:](v11, "initWithImage:", v12);
          selectionView = self->_selectionView;
          self->_selectionView = v13;

          -[UIView addSubview:](self, "addSubview:", self->_selectionView);
        }
        self->_selectedKeyIndex = v5;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __46__UIKeyboardLayoutCursor_setSelectedKeyIndex___block_invoke;
        v19[3] = &unk_1E16B1B28;
        v19[4] = self;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v19, 0.3);
      }
      self->_selectInitialKey = 0;
      self->_keyplaneSwitchSelectedKeyFrameCenter = (CGPoint)*MEMORY[0x1E0C9D538];
    }
  }
}

uint64_t __46__UIKeyboardLayoutCursor_setSelectedKeyIndex___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "selectionFrameForKeyIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1568));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "setFrame:");
}

- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3
{
  return -[UIKeyboardLayoutCursor refreshSelectedCellIfNecessaryForKey:animated:](self, "refreshSelectedCellIfNecessaryForKey:animated:", a3, 1);
}

- (BOOL)refreshSelectedCellIfNecessaryForKey:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  v6 = a3;
  if (-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
  {
    v7 = 0;
  }
  else
  {
    -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "focusableVariantCount");
    v7 = v9 != 0;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10 == v6)
        {
          v12 = objc_msgSend(v6, "selectedVariantIndex");

          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v6, "setSelectedVariantIndex:", 0);
        }
        else
        {

        }
        objc_msgSend(v8, "refreshSelectedRecent");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if (v11 == v6)
          {
            v13 = objc_msgSend(v6, "selectedVariantIndex");

            if (v13 == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v6, "setSelectedVariantIndex:", 0);
          }
          else
          {

          }
          objc_msgSend(v8, "refreshSelectedCandidateAnimated:", v4);
        }
      }
    }

  }
  return v7;
}

- (void)setHighlightedVariantIndex:(int64_t)a3 key:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  if (!-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
  {
    v6 = objc_msgSend(v7, "selectedVariantIndex");
    objc_msgSend(v7, "setSelectedVariantIndex:", a3);
    if (v6 != a3)
    {
      -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 16, v7);
      -[UIKeyboardLayoutCursor refreshSelectedCellIfNecessaryForKey:](self, "refreshSelectedCellIfNecessaryForKey:", v7);
    }
  }

}

- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3
{
  return -[UIKeyboardLayoutCursor targetKeyIndexFromPoint:inKeys:](self, "targetKeyIndexFromPoint:inKeys:", self->_keyplaneKeys, a3.x, a3.y);
}

- (int64_t)targetKeyIndexFromPoint:(CGPoint)a3 inKeys:(id)a4
{
  NSArray *keyplaneKeys;
  void *v5;
  int64_t v6;

  keyplaneKeys = self->_keyplaneKeys;
  -[UIKeyboardLayoutStar keyHitTestClosestToPoint:inKeys:](self, "keyHitTestClosestToPoint:inKeys:", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray indexOfObject:](keyplaneKeys, "indexOfObject:", v5);

  return v6;
}

- (int64_t)targetKeyIndexAtOffset:(CGPoint)a3 fromKey:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  int v22;
  int v23;
  _BOOL4 v25;
  int v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  int64_t v31;
  _BOOL4 v32;
  id v33;
  int v34;
  void *v35;
  CGPoint v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  v9 = fabs(y);
  if (fabs(x) >= 2.22044605e-16 || v9 >= 2.22044605e-16)
  {
    v11 = v7;
    objc_msgSend(v11, "navigationPointOfKey");
    v13 = x + v12;
    v15 = y + v14;
    objc_msgSend(v11, "frame");
    v37.x = v13;
    v37.y = v15;
    v16 = CGRectContainsPoint(v38, v37);
    v17 = -0.0;
    if (v16)
      v18 = y;
    else
      v18 = -0.0;
    v19 = v15 + v18;
    if (v16)
      v17 = x;
    v20 = v13 + v17;
    -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v20, v19);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "interactionType");
    v23 = objc_msgSend(v21, "interactionType");
    v25 = v22 == 4 || v23 == 15;
    if (v21 == v11 && v25)
    {
      v27 = v23;
      if (-[UIKeyboardLayoutCursor isKeyboardRightToLeft](self, "isKeyboardRightToLeft"))
        v28 = x > 0.0;
      else
        v28 = x < 0.0;
      if (-[UIKeyboardLayoutCursor isKeyboardRightToLeft](self, "isKeyboardRightToLeft"))
        v29 = x < 0.0;
      else
        v29 = x > 0.0;
      if (v22 != 4)
        v29 = 0;
      v30 = v27 == 15 && v28;
      LOBYTE(v25) = v29 || v30;
    }
    if (-[UIKBScreenTraits knobInput](self->super.super._screenTraits, "knobInput"))
    {
      if (!v25)
        -[UIKBScreenTraits touchInput](self->super.super._screenTraits, "touchInput");
LABEL_40:
      v33 = v11;

      v34 = 5;
      v21 = v33;
      while (1)
      {
        v35 = v21;
        objc_msgSend(v33, "frame");
        -[UIKeyboardLayoutCursor keyHitTestInSameRowAsCenter:size:](self, "keyHitTestInSameRowAsCenter:size:", v20, v19);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          if (v21 != v33)
            goto LABEL_46;
        }
        v20 = x + v20;
        v19 = y + v19;
        if (!--v34)
          goto LABEL_44;
      }
    }
    v32 = -[UIKBScreenTraits touchpadInput](self->super.super._screenTraits, "touchpadInput");
    if (v25)
    {
      if (v32)
        goto LABEL_40;
    }
    else if (-[UIKBScreenTraits touchInput](self->super.super._screenTraits, "touchInput") || v32)
    {
      goto LABEL_40;
    }
LABEL_44:
    if (!v21)
      v21 = v11;
LABEL_46:
    v31 = -[NSArray indexOfObject:](self->_keyplaneKeys, "indexOfObject:", v21);

    goto LABEL_47;
  }
  v31 = -[NSArray indexOfObject:](self->_keyplaneKeys, "indexOfObject:", v7, 2.22044605e-16, v9);
LABEL_47:

  return v31;
}

- (id)keyHitTestInSameRowAsCenter:(CGPoint)a3 size:(CGSize)a4
{
  double height;
  double y;
  CGFloat x;
  double v8;
  CGFloat v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  float v15;
  uint64_t i;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  float v23;
  id v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  height = a4.height;
  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds", a3.x, a3.y, a4.width);
  v9 = v8;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_keyplaneKeys;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    v15 = 3.4028e38;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v17, (_QWORD)v27))
        {
          objc_msgSend(v17, "frame");
          v34.origin.x = 0.0;
          v34.origin.y = y + height * -0.5;
          v34.size.width = v9;
          v34.size.height = height;
          if (CGRectIntersectsRect(v33, v34))
          {
            objc_msgSend(v17, "frame");
            UIDistanceBetweenPointAndRect(x, y, v18, v19, v20, v21);
            v23 = v22;
            if (fabsf(v23) < 2.2204e-16)
            {
              v25 = v17;

              goto LABEL_17;
            }
            if (v15 > v23)
            {
              v24 = v17;

              v13 = v24;
              v15 = v23;
            }
          }
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }

  v13 = v13;
  v25 = v13;
LABEL_17:

  return v25;
}

- (BOOL)canHandleEvent:(id)a3
{
  return -[UIKeyboardLayoutCursor canHandlePresses:withEvent:](self, "canHandlePresses:withEvent:", 0, a3);
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  UIKeyboardLayoutCursor *v13;
  id v14;
  uint64_t *v15;
  objc_super v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (-[UIKeyboardLayout idiom](self, "idiom") == 3)
  {
    if (objc_msgSend(v7, "type"))
    {
      v16.receiver = self;
      v16.super_class = (Class)UIKeyboardLayoutCursor;
      v8 = -[UIKeyboardLayout canHandleEvent:](&v16, sel_canHandleEvent_, v7);
    }
    else
    {
      v8 = -[UIKBScreenTraits touchInput](self->super.super._screenTraits, "touchInput");
    }
    *((_BYTE *)v18 + 24) = v8;
    if (!v8)
      goto LABEL_8;
  }
  else if (!*((_BYTE *)v18 + 24))
  {
LABEL_8:
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__UIKeyboardLayoutCursor_canHandlePresses_withEvent___block_invoke;
    v11[3] = &unk_1E16D3FB0;
    v15 = &v17;
    v12 = v7;
    v13 = self;
    v14 = v6;
    -[UIKeyboardLayoutCursor runWithSuppressedActions:](self, "runWithSuppressedActions:", v11);
    v9 = *((_BYTE *)v18 + 24) != 0;

    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __53__UIKeyboardLayoutCursor_canHandlePresses_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  switch(result)
  {
    case 2:
      result = objc_msgSend(*(id *)(a1 + 40), "_handleRemoteControlReceivedWithEvent:", *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 3:
      result = objc_msgSend(*(id *)(a1 + 40), "_handlePresses:withEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 5:
      result = objc_msgSend(*(id *)(a1 + 40), "_handleMoveWithEvent:", *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 7:
      result = objc_msgSend(*(id *)(a1 + 40), "_handleWheelChangedWithEvent:", *(_QWORD *)(a1 + 32));
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
      break;
    default:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      break;
  }
  return result;
}

- (void)takeKeyAction:(id)a3
{
  UIKBTree *v4;
  UIKBTree *multitapKey;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  UIKBTree *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UIKBTree *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  UIKBTree *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  UIKBTree *v62;

  v4 = (UIKBTree *)a3;
  if (!-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
  {
    multitapKey = self->super._multitapKey;
    if (multitapKey)
      v6 = multitapKey == v4;
    else
      v6 = 1;
    if (!v6)
      -[UIKeyboardLayoutStar multitapExpired](self, "multitapExpired");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKBTree interactionType](v4, "interactionType") == 4)
    {
      -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", CFSTR("\b"), v4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleKeyEvent:", v8);

      goto LABEL_14;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") == 23)
    {
      objc_msgSend(v7, "handleClear");
      goto LABEL_14;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") == 11)
    {
      -[UIKBTree alternateKeyplaneName](self->super._keyplane, "alternateKeyplaneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v9);
      goto LABEL_13;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") == 10)
    {
      if (-[UIKeyboardLayoutCursor isSlimLinearKeyboardTV](self, "isSlimLinearKeyboardTV"))
      {
        -[UIKeyboardLayoutCursor setOverrideInitialKey:](self, "setOverrideInitialKey:", 1);
        self->_selectInitialKey = 0;
        self->_overridenSelectedKeyType = 10;
      }
      -[UIKBTree representedString](v4, "representedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("Recents"));

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UIKeyboardLayoutCursor showRecentInputsAlert](self, "showRecentInputsAlert");
        goto LABEL_14;
      }
      -[UIKBTree representedString](v4, "representedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("Dictation"));

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_14:

        goto LABEL_15;
      }
      v14 = v4;
      v15 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v14);
      v16 = -[UIKBTree selectedVariantIndex](v14, "selectedVariantIndex");
      v9 = v14;
      if (-[UIKBTree state](v14, "state") == 16)
      {
        v9 = v14;
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v14;
          if (v16 < v15)
          {
            -[UIKBTree subtrees](v14, "subtrees");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
      objc_msgSend(v9, "representedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v14);
      -[UIKBTree setSelectedVariantIndex:](v14, "setSelectedVariantIndex:", 0);
      -[UIKBTree subtreeWithName:](self->super._keyboard, "subtreeWithName:", v18);
      v19 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
      if (v19 != self->super._keyplane)
        -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v18);

LABEL_13:
      goto LABEL_14;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") == 9)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree representedString](v4, "representedString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "identifierIsValidSystemInputMode:", v21);

      objc_msgSend(v7, "taskQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke;
        v60[3] = &unk_1E16BB0D8;
        v61 = v7;
        v62 = v4;
        objc_msgSend(v23, "addTask:", v60);

        v24 = v61;
      }
      else
      {
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_2;
        v58[3] = &unk_1E16BAF98;
        v59 = v7;
        objc_msgSend(v23, "addTask:", v58);

        v24 = v59;
      }

      goto LABEL_14;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") == 3)
    {
      v25 = -[UIKBTree selectedVariantIndex](v4, "selectedVariantIndex");
      v26 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v4);
      if (-[UIKBTree state](v4, "state") == 16 && v25 != 0x7FFFFFFFFFFFFFFFLL && v25 < v26)
      {
        -[UIKBKeyplaneView viewForKey:](self->super._keyplaneView, "viewForKey:", v4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v27, "selectedRecentInputString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "candidateController");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v45, "currentIndex") != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v45, "acceptSelectedCandidate");
              -[UIKeyboardLayoutCursor handleVisualDirectionalInput:](self, "handleVisualDirectionalInput:", 2);
              +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v46);

            }
          }
          v28 = 0;
        }
        if (objc_msgSend(v28, "isEqualToString:", 0x1E1744240))
        {
          objc_msgSend(v7, "clearRecentInput");
          -[UIKeyboardLayoutCursor setRecentInputs:](self, "setRecentInputs:", 0);
          -[UIKeyboardLayoutStar setToInitialKeyplane](self, "setToInitialKeyplane");
        }
        else if (v28)
        {
          objc_msgSend(v7, "handleClear");
          -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", v28, v4, 2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "handleKeyEvent:", v50);

        }
      }
      goto LABEL_14;
    }
    if (-[UIKBTree interactionType](v4, "interactionType") != 16)
    {
      -[UIKBTree representedString](v4, "representedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[UIKBTree selectedVariantIndex](v4, "selectedVariantIndex");
      v38 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v4);
      v39 = 0;
      if (-[UIKBTree state](v4, "state") == 16 && v37 != 0x7FFFFFFFFFFFFFFFLL && v37 < v38)
      {
        -[UIKBTree subtrees](v4, "subtrees");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndex:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "representedString");
        v42 = objc_claimAutoreleasedReturnValue();

        -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v4);
        v39 = 2;
        v9 = (void *)v42;
      }
      if (objc_msgSend(v9, "length"))
      {
        -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", v9, v4, v39);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleKeyEvent:", v43);

      }
      goto LABEL_13;
    }
    -[UIKBTree fullRepresentedString](v4, "fullRepresentedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree representedString](v4, "representedString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[UIKBTree selectedVariantIndex](v4, "selectedVariantIndex");
    v31 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v4);
    if (-[UIKBTree state](v4, "state") != 16 || v30 == 0x7FFFFFFFFFFFFFFFLL || v30 >= v31)
    {
      if (!-[UIKBTree forceMultitap](v4, "forceMultitap"))
      {
        v47 = objc_msgSend(v29, "length");
        if (v47 >= objc_msgSend(v9, "length") || !-[UIKeyboardLayoutCursor canMultitap](self, "canMultitap"))
        {
          v36 = 0;
          v35 = 0;
LABEL_70:
          if (objc_msgSend(v29, "length"))
          {
            -[UIKeyboardLayoutStar createKeyEventForStringAction:forKey:inputFlags:](self, "createKeyEventForStringAction:forKey:inputFlags:", v29, v4, v35 | v36);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "handleKeyEvent:", v57);

          }
          goto LABEL_13;
        }
      }
      if (self->super._multitapKey == v4)
      {
        -[UIKBTree fullRepresentedString](v4, "fullRepresentedString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "rangeOfComposedCharacterSequenceAtIndex:", self->super._multitapCount);
        v53 = v52;

        v54 = v53 + self->super._multitapCount;
        -[UIKBTree fullRepresentedString](self->super._multitapKey, "fullRepresentedString");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        self->super._multitapCount = v54 % objc_msgSend(v49, "length");
        v35 = 4;
      }
      else
      {
        self->super._multitapCount = 0;
        v48 = v4;
        v35 = 0;
        v49 = self->super._multitapKey;
        self->super._multitapKey = v48;
      }

      -[UIKeyboardLayoutStar touchMultitapTimer](self, "touchMultitapTimer");
      v55 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", self->super._multitapCount);
      objc_msgSend(v9, "substringWithRange:", v55, v56);
      v34 = objc_claimAutoreleasedReturnValue();
      v36 = 0;
    }
    else
    {
      -[UIKBTree subtrees](v4, "subtrees");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndex:", v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "representedString");
      v34 = objc_claimAutoreleasedReturnValue();

      -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v4);
      v35 = 0;
      v36 = 2;
      v29 = v33;
    }

    v29 = (void *)v34;
    goto LABEL_70;
  }
LABEL_15:

}

void __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLastUsedInputMode:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "representedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInputMode:userInitiated:updateIndicator:executionContext:", v8, 1, 0, v3);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateLastUsedInputMode:", v10);

}

uint64_t __40__UIKeyboardLayoutCursor_takeKeyAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputModeToNextInPreferredListWithExecutionContext:", a2);
}

- (void)clearVariantStateForKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
  {
    -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", -[UIKeyboardLayoutCursor activeStateForKey:](self, "activeStateForKey:", v5), v5);
    -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutStar _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v4);

  }
}

- (void)handleVariantDeleteIfNecessaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "variantType"))
  {
    objc_msgSend(v4, "subtrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "highlightedVariantIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "interactionType") == 4 && !self->_didVariantDelete)
    {
      self->_didVariantDelete = 1;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleDelete");

      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_playInputDeleteSound");

      +[_UIKeyboardUsageTracking variantDeleteIncrement](_UIKeyboardUsageTracking, "variantDeleteIncrement");
      v9 = dispatch_time(0, 200000000);
      v10 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke;
      block[3] = &unk_1E16B1B50;
      block[4] = self;
      v15 = v4;
      v11 = MEMORY[0x1E0C80D38];
      dispatch_after(v9, MEMORY[0x1E0C80D38], block);
      v12 = dispatch_time(0, 500000000);
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke_2;
      v13[3] = &unk_1E16B1B28;
      v13[4] = self;
      dispatch_after(v12, v11, v13);

    }
  }

}

void __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1624])
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "currentKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != v4)
    {
LABEL_3:

      return;
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "state");

    if (v5 == 16)
    {
      objc_msgSend(*(id *)(a1 + 32), "handleLinearDirectionalInput:", 4);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canHandleDelete");

      v8 = *(void **)(a1 + 32);
      if ((v7 & 1) != 0)
      {
        +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_didChangeKeyplaneWithContext:", v9);
        v4 = (void *)v9;
        goto LABEL_3;
      }
      objc_msgSend(*(id *)(a1 + 32), "clearVariantStateForKey:", *(_QWORD *)(a1 + 40));
    }
  }
}

uint64_t __63__UIKeyboardLayoutCursor_handleVariantDeleteIfNecessaryForKey___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1624) = 0;
  return result;
}

- (BOOL)handleLinearDirectionalInput:(int)a3
{
  BOOL v3;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int64_t selectedKeyIndex;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  UIKeyboardLayoutCursor *v18;
  void *v19;
  char v20;

  if (!self->_ignoreEventsUntilPressEnds)
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v6);
    v8 = objc_msgSend(v6, "selectedVariantIndex");
    selectedKeyIndex = self->_selectedKeyIndex;
    v10 = -[NSArray count](self->_keyplaneKeys, "count");
    if (a3 == 5)
    {
      -[UIKeyboardLayoutCursor takeKeyAction:](self, "takeKeyAction:", v6);
      v3 = self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL;
LABEL_56:

      return v3;
    }
    v11 = v10 - 1;
    if (a3 == 4)
    {
      if (objc_msgSend(v6, "state") != 16 || v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= v7 - 1)
      {
        if (self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
          {
            if (selectedKeyIndex <= 0)
              goto LABEL_55;
          }
          else if (selectedKeyIndex >= v11)
          {
            goto LABEL_55;
          }
          if (objc_msgSend(v6, "state") == 16)
            -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
          v13 = 0;
          while (1)
          {
            v19 = v13;
            if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
              --selectedKeyIndex;
            else
              ++selectedKeyIndex;
            -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", selectedKeyIndex);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
              goto LABEL_54;
            v20 = objc_msgSend(v13, "visible");
            if (selectedKeyIndex < 1
              || (v20 & 1) != 0
              || selectedKeyIndex >= -[NSArray count](self->_keyplaneKeys, "count") - 1)
            {
              if (!objc_msgSend(v13, "visible"))
                goto LABEL_54;
              v18 = self;
              v17 = 0;
LABEL_53:
              -[UIKeyboardLayoutCursor setHighlightedVariantIndex:key:](v18, "setHighlightedVariantIndex:key:", v17, v13);
              -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", selectedKeyIndex);

              goto LABEL_19;
            }
          }
        }
LABEL_55:
        v3 = 0;
        goto LABEL_56;
      }
      v12 = v8 + 1;
    }
    else
    {
      if (a3 != 3)
        goto LABEL_55;
      if (objc_msgSend(v6, "state") != 16 || v8 == 0x7FFFFFFFFFFFFFFFLL || (v12 = v8 - 1, v8 < 1))
      {
        if (self->_selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
          {
            if (selectedKeyIndex >= v11)
              goto LABEL_55;
            goto LABEL_25;
          }
          if (selectedKeyIndex >= 1)
          {
LABEL_25:
            if (objc_msgSend(v6, "state") == 16)
              -[UIKeyboardLayoutStar setKeyboardDim:](self, "setKeyboardDim:", 0);
            v13 = 0;
            while (1)
            {
              v14 = v13;
              if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
                ++selectedKeyIndex;
              else
                --selectedKeyIndex;
              -[NSArray objectAtIndex:](self->_keyplaneKeys, "objectAtIndex:", selectedKeyIndex);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v13)
                break;
              v15 = objc_msgSend(v13, "visible");
              if (selectedKeyIndex < 1
                || (v15 & 1) != 0
                || selectedKeyIndex >= -[NSArray count](self->_keyplaneKeys, "count") - 1)
              {
                if (!objc_msgSend(v13, "visible"))
                  break;
                v16 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v13);
                if (v16)
                  v17 = v16 - 1;
                else
                  v17 = 0x7FFFFFFFFFFFFFFFLL;
                v18 = self;
                goto LABEL_53;
              }
            }
LABEL_54:

            goto LABEL_55;
          }
        }
        goto LABEL_55;
      }
    }
    -[UIKeyboardLayoutCursor setHighlightedVariantIndex:key:](self, "setHighlightedVariantIndex:key:", v12, v6);
    -[UIKeyboardLayoutCursor handleVariantDeleteIfNecessaryForKey:](self, "handleVariantDeleteIfNecessaryForKey:", v6);
LABEL_19:
    v3 = 1;
    goto LABEL_56;
  }
  return 1;
}

- (BOOL)handleVisualDirectionalInput:(int)a3
{
  char v3;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int64_t selectedKeyIndex;
  void *v23;
  BOOL v24;
  double v25;
  void *v26;
  UIKBTree *keyboard;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  double v40;
  UIKeyboardLayoutCursor *v41;
  uint64_t v42;
  int64_t v43;
  double v44;
  UIKeyboardLayoutCursor *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  UIKeyboardLayoutCursor *v51;
  uint64_t v52;
  uint64_t v54;

  if (!self->_ignoreEventsUntilPressEnds)
  {
    self->_didVariantDelete = 0;
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "frame");
      v9 = v8;
    }
    else
    {
      -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
      v9 = v10;
    }
    -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
    if (v9 > v11)
    {
      -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
      v9 = v12;
    }
    if (v7)
    {
      objc_msgSend(v7, "frame");
      v14 = v13;
    }
    else
    {
      -[UIKeyboardLayoutCursor defaultCursorAdjustDistance](self, "defaultCursorAdjustDistance");
      v14 = v15;
    }
    -[UIKBTree subtrees](self->super._keyboard, "subtrees");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "indexOfObject:", self->super._keyplane);

    v18 = objc_msgSend(v7, "selectedVariantIndex");
    v19 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v7);
    objc_msgSend(v7, "subtrees");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    selectedKeyIndex = self->_selectedKeyIndex;
    v54 = v18;
    if (objc_msgSend(v7, "state") == 16)
    {
      -[UIKBTree firstCachedKeyWithName:](self->super._keyplane, "firstCachedKeyWithName:", CFSTR("Monolith-Recent-Inputs-Key"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7 != v23;

    }
    else
    {
      v24 = 1;
    }
    switch(a3)
    {
      case 1:
        if (objc_msgSend(v7, "state") != 16)
          goto LABEL_57;
        if (!v24 && self->_disableTouchInput)
        {
          if (v19 >= 1)
            goto LABEL_71;
          goto LABEL_57;
        }
        if (!objc_msgSend(v7, "variantType") || v21 < 1 || v54 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_57:
          v44 = -v14;
          v45 = self;
          goto LABEL_63;
        }
LABEL_61:
        -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v7);
        v3 = 1;
        goto LABEL_81;
      case 2:
        if (objc_msgSend(v7, "state") != 16)
          goto LABEL_62;
        if (v24 || !self->_disableTouchInput)
        {
          if (objc_msgSend(v7, "variantType") && v21 >= 1 && v54 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_61;
        }
        else if (v19 >= 1)
        {
          goto LABEL_74;
        }
LABEL_62:
        v45 = self;
        v44 = v14;
LABEL_63:
        v46 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](v45, "targetKeyIndexAtOffset:fromKey:", v7, 0.0, v44);
        selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
        if (v46 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_80;
        v43 = v46;
        -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", v46);
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "displayType") == 38)
        {
          v48 = -[UIKeyboardLayoutCursor variantCountForKey:](self, "variantCountForKey:", v47);
          if (v48)
          {
            v49 = v48;
            if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
              v50 = v49 - 1;
            else
              v50 = 0;
          }
          else
          {
            v50 = 0x7FFFFFFFFFFFFFFFLL;
          }
          -[UIKeyboardLayoutCursor setHighlightedVariantIndex:key:](self, "setHighlightedVariantIndex:key:", v50, v47);
        }

        goto LABEL_79;
      case 3:
        if (objc_msgSend(v7, "state") != 16)
        {
          v40 = -v9;
          v41 = self;
          goto LABEL_52;
        }
        if (v24)
        {
          v3 = 1;
          if (v19 < 1 || v54 < 1)
          {
LABEL_81:

            return v3;
          }
        }
        else
        {
          v3 = 0;
          if (self->_disableTouchInput || v19 < 1)
            goto LABEL_81;
        }
LABEL_71:
        v51 = self;
        v52 = 3;
        goto LABEL_75;
      case 4:
        if (objc_msgSend(v7, "state") != 16)
        {
          v41 = self;
          v40 = v9;
LABEL_52:
          v42 = -[UIKeyboardLayoutCursor targetKeyIndexAtOffset:fromKey:](v41, "targetKeyIndexAtOffset:fromKey:", v7, v40, 0.0);
          selectedKeyIndex = 0x7FFFFFFFFFFFFFFFLL;
          if (v42 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v43 = v42;
            -[UIKeyboardLayoutCursor setSelectedKeyIndex:](self, "setSelectedKeyIndex:", v42);
LABEL_79:
            selectedKeyIndex = v43;
          }
          goto LABEL_80;
        }
        if (v24)
        {
          v3 = 1;
          if (v19 < 1 || v54 >= v19 - 1)
            goto LABEL_81;
        }
        else
        {
          v3 = 0;
          if (self->_disableTouchInput || v19 < 1)
            goto LABEL_81;
        }
LABEL_74:
        v51 = self;
        v52 = 4;
LABEL_75:
        v3 = -[UIKeyboardLayoutCursor handleLinearDirectionalInput:](v51, "handleLinearDirectionalInput:", v52);
        goto LABEL_81;
      case 5:
        -[UIView alpha](self->_selectionView, "alpha");
        if (v25 != 0.0 && objc_msgSend(v7, "interactionType") != 10)
          -[UIKeyboardLayoutCursor takeKeyAction:](self, "takeKeyAction:", v7);
        goto LABEL_80;
      case 6:
        -[UIKBTree stringForProperty:](self->super._keyplane, "stringForProperty:", CFSTR("shift-alternate"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          keyboard = self->super._keyboard;
          -[UIKBTree stringForProperty:](self->super._keyplane, "stringForProperty:", CFSTR("shift-alternate"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v29, "name");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v30);

            +[_UIKeyboardUsageTracking letterCaseToggleIncrement](_UIKeyboardUsageTracking, "letterCaseToggleIncrement");
            goto LABEL_80;
          }
        }
        v31 = 0;
        v32 = 1;
        while (2)
        {
          v33 = v31;
          -[UIKBTree subtrees](self->super._keyboard, "subtrees");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTree subtrees](self->super._keyboard, "subtrees");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndex:", (v17 + v32) % (unint64_t)objc_msgSend(v35, "count"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
            goto LABEL_47;
          objc_msgSend(v31, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[UIKeyboardLayoutCursor isKeyplaneDisabledWithName:](self, "isKeyplaneDisabledWithName:", v36))
          {

          }
          else
          {
            objc_msgSend(v31, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = -[UIKeyboardLayoutCursor shouldToggleKeyplaneWithName:](self, "shouldToggleKeyplaneWithName:", v37);

            if (v38)
            {
LABEL_47:
              if (v31)
              {
                objc_msgSend(v31, "name");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v39);

              }
LABEL_80:
              v3 = selectedKeyIndex != 0x7FFFFFFFFFFFFFFFLL;
              goto LABEL_81;
            }
          }
          ++v32;
          continue;
        }
      default:
        goto LABEL_80;
    }
  }
  return 1;
}

- (unint64_t)getNextKeyplaneIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  UIKBTree *keyboard;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  if (-[UIKeyboardLayoutCursor suppressOperations](self, "suppressOperations"))
    return a3;
  if (!-[UIKeyboardLayoutCursor shouldToggleLetterCaseNext](self, "shouldToggleLetterCaseNext"))
    goto LABEL_7;
  -[UIKBTree stringForProperty:](self->super._keyplane, "stringForProperty:", CFSTR("shift-alternate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  -[UIKeyboardLayoutCursor setShouldToggleLetterCaseNext:](self, "setShouldToggleLetterCaseNext:", 0);
  keyboard = self->super._keyboard;
  -[UIKBTree stringForProperty:](self->super._keyplane, "stringForProperty:", CFSTR("shift-alternate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree subtreeWithName:](keyboard, "subtreeWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (+[_UIKeyboardUsageTracking letterCaseToggleIncrement](_UIKeyboardUsageTracking, "letterCaseToggleIncrement"), v5 = -[UIKBTree indexOfSubtree:](self->super._keyboard, "indexOfSubtree:", v9), v9, v5 == a3))
  {
LABEL_7:
    v10 = 0;
    v5 = a3;
    while (1)
    {
      v11 = v10;
      -[UIKBTree subtrees](self->super._keyboard, "subtrees");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (v5 + 1) % objc_msgSend(v12, "count");

      -[UIKBTree subtrees](self->super._keyboard, "subtrees");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == a3)
        break;
      objc_msgSend(v10, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIKeyboardLayoutCursor isKeyplaneDisabledWithName:](self, "isKeyplaneDisabledWithName:", v14))
      {

      }
      else
      {
        objc_msgSend(v10, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[UIKeyboardLayoutCursor shouldToggleKeyplaneWithName:](self, "shouldToggleKeyplaneWithName:", v15);

        if (v16)
          goto LABEL_14;
      }
    }
    v5 = a3;
LABEL_14:

  }
  return v5;
}

- (void)switchToDictationKeyplaneWithActivationIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dictationEnabled");

  if (v6)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActivationIdentifier:", v4);

    -[UIKBTree name](self->super._keyplane, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor setKeyplaneBeforeDictation:](self, "setKeyplaneBeforeDictation:", v8);

    -[UIKeyboardLayoutCursor setSelectedKeyBeforeDictation:](self, "setSelectedKeyBeforeDictation:", self->_selectedKeyIndex);
    if (UIKeyboardTypeSupportsDictationSpelling(-[UITextInputTraits dictationKeyboardType](self->super.super._inputTraits, "dictationKeyboardType"))
      || -[UITextInputTraits isSecureTextEntry](self->super.super._inputTraits, "isSecureTextEntry"))
    {
      v9 = 0;
    }
    else
    {
      v9 = !-[UITextInputTraits forceSpellingDictation](self->super.super._inputTraits, "forceSpellingDictation");
    }
    if (((byte_1EDDA8184 != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIATVClearBeforeDictation, (uint64_t)CFSTR("_UIATVClearBeforeDictation"))) != 0|| v9)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleClear");

    }
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke_2;
    v11[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v11, 0.133);
  }

}

uint64_t __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setAlpha:", 0.0);
}

void __76__UIKeyboardLayoutCursor_switchToDictationKeyplaneWithActivationIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "keyplaneBeforeDictation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setKeyplaneName:", CFSTR("Dictation"));
    objc_msgSend(*(id *)(a1 + 32), "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFocusWindow:", v3);

    objc_msgSend(*(id *)(a1 + 32), "focusWindow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_focusEventRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

  }
}

- (void)returnToKeyplaneAfterDictation
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[UIKeyboardLayoutCursor keyplaneBeforeDictation](self, "keyplaneBeforeDictation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardLayoutCursor keyplaneBeforeDictation](self, "keyplaneBeforeDictation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor setKeyplaneName:](self, "setKeyplaneName:", v4);

    -[UIKeyboardLayoutCursor setKeyplaneBeforeDictation:](self, "setKeyplaneBeforeDictation:", 0);
    -[UIKeyboardLayoutCursor setSelectedKeyBeforeDictation:](self, "setSelectedKeyBeforeDictation:", 0x7FFFFFFFFFFFFFFFLL);
    -[UIView setAlpha:](self->super._keyplaneView, "setAlpha:", 0.0);
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke_2;
    v5[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.133);
  }
}

uint64_t __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setAlpha:", 1.0);
}

uint64_t __56__UIKeyboardLayoutCursor_returnToKeyplaneAfterDictation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "focusWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusEventRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "setFocusWindow:", 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  UIKBKeyplaneView *keyplaneView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
    goto LABEL_28;
  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", v8);

  if (-[UIKBScreenTraits idiom](self->super.super._screenTraits, "idiom") != 2)
    goto LABEL_28;
  self->_didVariantDelete = 0;
  if (_UIPressesContainsPressType(v6, 4))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchLongPressTimerWithDelay:", 1.0);

    v10 = UIKeyboardTypeSupportsDictationSpelling(-[UITextInputTraits dictationKeyboardType](self->super.super._inputTraits, "dictationKeyboardType"))
       || -[UITextInputTraits isSecureTextEntry](self->super.super._inputTraits, "isSecureTextEntry")
       || -[UITextInputTraits forceSpellingDictation](self->super.super._inputTraits, "forceSpellingDictation");
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "interactionType");

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 == 4)
    {
      objc_msgSend(v17, "_playInputDeleteSound");

      if (v10)
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "markKeyboardDeleteMetricEvent");
LABEL_24:

      }
    }
    else
    {
      objc_msgSend(v17, "_playInputSelectSound");

      if (v10)
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "markKeyboardInputMetricEvent");
        goto LABEL_24;
      }
    }
    keyplaneView = self->super._keyplaneView;
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyplaneView viewForKey:](keyplaneView, "viewForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[UIKeyboardLayoutCursor keyViewAnimator](self, "keyViewAnimator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "transitionKeyView:fromState:toState:completion:", v22, objc_msgSend(v24, "state"), 12, 0);

    }
    goto LABEL_28;
  }
  if ((_UIPressesContainsPressType(v6, 18) & 1) != 0
    || _UIPressesContainsPressType(v6, 6)
    && (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIAllowDictationFromPlayPause, (uint64_t)CFSTR("_UIAllowDictationFromPlayPause")) & 1) == 0&& byte_1EDDA817C)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldShowDictationKey");

    if (v12
      && -[NSString rangeOfString:](self->super._keyplaneName, "rangeOfString:", CFSTR("Dictation")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "_hidEvent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", IOHIDEventGetSenderID());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardLayoutCursor switchToDictationKeyplaneWithActivationIdentifier:](self, "switchToDictationKeyplaneWithActivationIdentifier:", v14);
    }
  }
  else if (_UIPressesContainsPressType(v6, 5)
         && !-[UIKeyboardLayoutCursor _menuTapShouldExitVariants](self, "_menuTapShouldExitVariants")
         && !-[UIKeyboardLayoutCursor _menuTapShouldStopDictation](self, "_menuTapShouldStopDictation"))
  {
    v25.receiver = self;
    v25.super_class = (Class)UIKeyboardLayoutCursor;
    -[UIResponder pressesBegan:withEvent:](&v25, sel_pressesBegan_withEvent_, v6, v7);
  }
LABEL_28:

}

- (BOOL)_menuTapShouldExitVariants
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "state") == 16)
  {
    objc_msgSend(v3, "subtrees");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      v5 = objc_msgSend(v3, "variantType") != 0;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_menuTapShouldStopDictation
{
  void *v3;
  BOOL v4;

  if (-[UIKeyboardLayout idiom](self, "idiom") != 2
    || !+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    return 0;
  }
  -[UIKBTree name](self->super._keyplane, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("Dictation")) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UIKBKeyplaneView *keyplaneView;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
    goto LABEL_27;
  self->_didVariantDelete = 0;
  if (_UIPressesContainsPressType(v6, 4))
  {
    if (-[UIKeyboardLayout idiom](self, "idiom") == 2
      && -[NSString rangeOfString:](self->super._keyplaneName, "rangeOfString:", CFSTR("Dictation")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopDictation:", 0);

    }
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    keyplaneView = self->super._keyplaneView;
    -[UIKeyboardLayoutStar activeKey](self, "activeKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBKeyplaneView viewForKey:](keyplaneView, "viewForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "interactionType");

      if (v14 != 16)
      {
        -[UIKeyboardLayoutCursor keyViewAnimator](self, "keyViewAnimator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "transitionKeyView:fromState:toState:completion:", v12, objc_msgSend(v16, "state"), 4, 0);

      }
    }

    if (!v9)
      goto LABEL_17;
    goto LABEL_16;
  }
  if ((_UIPressesContainsPressType(v6, 18) & 1) == 0
    && (!_UIPressesContainsPressType(v6, 6)
     || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIAllowDictationFromPlayPause, (uint64_t)CFSTR("_UIAllowDictationFromPlayPause")) & 1) != 0|| !byte_1EDDA817C))
  {
LABEL_16:
    -[UIKeyboardLayoutCursor _handlePresses:withEvent:](self, "_handlePresses:withEvent:", v6, v7);
    goto LABEL_17;
  }
  -[UIKeyboardLayoutCursor returnToKeyplaneAfterDictation](self, "returnToKeyplaneAfterDictation");
LABEL_17:
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clearLongPressTimer");

  if (_UIPressesContainsPressType(v6, 4))
  {
    -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
LABEL_19:
    self->_ignoreEventsUntilPressEnds = 0;
    goto LABEL_27;
  }
  if (!_UIPressesContainsPressType(v6, 5))
    goto LABEL_27;
  if (-[UIKeyboardLayoutCursor _menuTapShouldExitVariants](self, "_menuTapShouldExitVariants"))
  {
    -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v18);

    goto LABEL_19;
  }
  if (-[UIKeyboardLayoutCursor _menuTapShouldStopDictation](self, "_menuTapShouldStopDictation"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopDictation:", 0);

  }
  else if (!self->_isForwardingEvent)
  {
    self->_isForwardingEvent = 1;
    v20.receiver = self;
    v20.super_class = (Class)UIKeyboardLayoutCursor;
    -[UIResponder pressesEnded:withEvent:](&v20, sel_pressesEnded_withEvent_, v6, v7);
    self->_isForwardingEvent = 0;
  }
LABEL_27:

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIKBKeyplaneView *keyplaneView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
  {
    self->_didVariantDelete = 0;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearLongPressTimer");

    if (_UIPressesContainsPressType(v6, 4))
    {
      keyplaneView = self->super._keyplaneView;
      -[UIKeyboardLayoutStar activeKey](self, "activeKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyplaneView viewForKey:](keyplaneView, "viewForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[UIKeyboardLayoutCursor keyViewAnimator](self, "keyViewAnimator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutStar activeKey](self, "activeKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "transitionKeyView:fromState:toState:completion:", v11, objc_msgSend(v13, "state"), 4, 0);

      }
      -[UIKeyboardLayoutStar setActiveKey:](self, "setActiveKey:", 0);
      self->_ignoreEventsUntilPressEnds = 0;
      goto LABEL_6;
    }
    if (_UIPressesContainsPressType(v6, 5))
    {
      if (-[UIKeyboardLayoutCursor _menuTapShouldExitVariants](self, "_menuTapShouldExitVariants"))
      {
        -[UIKeyboardLayoutCursor currentKey](self, "currentKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayoutCursor clearVariantStateForKey:](self, "clearVariantStateForKey:", v11);
LABEL_6:

        goto LABEL_7;
      }
      if (-[UIKeyboardLayoutCursor _menuTapShouldStopDictation](self, "_menuTapShouldStopDictation"))
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stopDictation:", 0);

        goto LABEL_7;
      }
      if (self->_isForwardingEvent)
        goto LABEL_7;
      self->_isForwardingEvent = 1;
      -[UIResponder pressesCancelled:withEvent:](&v16, sel_pressesCancelled_withEvent_, v6, v7, v15.receiver, v15.super_class, self, UIKeyboardLayoutCursor);
    }
    else
    {
      if (!_UIPressesContainsPressType(v6, 6))
        goto LABEL_7;
      if (-[UIKeyboardLayoutCursor canHandleEvent:](self, "canHandleEvent:", v7))
      {
        -[UIKeyboardLayoutCursor _handlePresses:withEvent:](self, "_handlePresses:withEvent:", v6, v7);
        goto LABEL_7;
      }
      if (self->_isForwardingEvent)
        goto LABEL_7;
      self->_isForwardingEvent = 1;
      -[UIResponder pressesCancelled:withEvent:](&v15, sel_pressesCancelled_withEvent_, v6, v7, self, UIKeyboardLayoutCursor, v16.receiver, v16.super_class);
    }
    self->_isForwardingEvent = 0;
  }
LABEL_7:

}

- (BOOL)_handlePresses:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(0, "type");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  if (qword_1ECD79A58 != -1)
  {
    dispatch_once(&qword_1ECD79A58, &__block_literal_global_160_1);
    if (v6)
      goto LABEL_4;
LABEL_33:
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "presses should never be nil. Caller must filter [event allPresses] appropriately and pass in a set of UIPress objects that matches current phase. Not doing so runs a risk of triggering infinite loop.", buf, 2u);
      }

    }
    else
    {
      v22 = qword_1ECD79A68;
      if (!qword_1ECD79A68)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD79A68);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "presses should never be nil. Caller must filter [event allPresses] appropriately and pass in a set of UIPress objects that matches current phase. Not doing so runs a risk of triggering infinite loop.", buf, 2u);
      }
    }
    objc_msgSend(v7, "allPresses");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v6)
    goto LABEL_33;
LABEL_4:
  v9 = v6;
LABEL_5:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v25 = v7;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)qword_1ECD79A60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v17))
        {
          v18 = objc_msgSend(v15, "phase");

          if (v18 != 2)
          {
            v8 = objc_msgSend(v15, "type");
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
LABEL_16:
    v7 = v25;
  }

LABEL_18:
  if (-[UIKeyboardLayout idiom](self, "idiom") == 2 && v8 > 5)
  {
    if (v8 == 18)
      goto LABEL_30;
    if (v8 == 6)
    {
      v19 = -[UIKeyboardLayoutCursor handleVisualDirectionalInput:](self, "handleVisualDirectionalInput:", 6);
      goto LABEL_28;
    }
LABEL_29:
    v20 = 0;
    goto LABEL_31;
  }
  if (v8 == 4)
  {
    v19 = -[UIKeyboardLayoutCursor handleLinearDirectionalInput:](self, "handleLinearDirectionalInput:", 5);
    goto LABEL_28;
  }
  if (v8 != 5)
    goto LABEL_29;
  if (-[UIKeyboardLayoutCursor _menuTapShouldExitVariants](self, "_menuTapShouldExitVariants"))
  {
LABEL_30:
    v20 = 1;
    goto LABEL_31;
  }
  v19 = -[UIKeyboardLayoutCursor _menuTapShouldStopDictation](self, "_menuTapShouldStopDictation");
LABEL_28:
  v20 = v19;
LABEL_31:

  return v20;
}

void __51__UIKeyboardLayoutCursor__handlePresses_withEvent___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E1A93BA8);
  v1 = (void *)qword_1ECD79A60;
  qword_1ECD79A60 = v0;

}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
    -[UIKeyboardLayoutCursor _handleRemoteControlReceivedWithEvent:](self, "_handleRemoteControlReceivedWithEvent:", v4);

}

- (BOOL)_handleRemoteControlReceivedWithEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "subtype") - 103;
  return v4 <= 9
      && ((0x3A9u >> v4) & 1) != 0
      && -[UIKeyboardLayoutCursor handleVisualDirectionalInput:](self, "handleVisualDirectionalInput:", dword_18668070C[v4]);
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
    -[UIKeyboardLayoutCursor _handleWheelChangedWithEvent:](self, "_handleWheelChangedWithEvent:", v4);

}

- (BOOL)_handleWheelChangedWithEvent:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "subtype") - 200;
  return v4 <= 5
      && -[UIKeyboardLayoutCursor handleLinearDirectionalInput:](self, "handleLinearDirectionalInput:", dword_186680734[v4]);
}

- (void)_moveWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[UIKeyboardLayout disableInteraction](self, "disableInteraction"))
    -[UIKeyboardLayoutCursor _handleMoveWithEvent:](self, "_handleMoveWithEvent:", v4);

}

- (BOOL)_isDirectionalHeading:(unint64_t)a3
{
  return (a3 & 0x30) == 0 && (a3 & 0xF) != 0;
}

- (BOOL)_handleMoveWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "_focusHeading");
  v6 = 0;
  v7 = 2;
  switch(v5)
  {
    case 1:
      v7 = 1;
      goto LABEL_9;
    case 2:
      goto LABEL_9;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_13;
    case 4:
      goto LABEL_6;
    case 8:
      goto LABEL_8;
    default:
      if (v5 == 16)
      {
        if (-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
        {
LABEL_6:
          v7 = 3;
          goto LABEL_9;
        }
      }
      else
      {
        if (v5 != 32)
          goto LABEL_13;
        if (!-[UIKeyboardLayoutCursor isAppRightToLeft](self, "isAppRightToLeft"))
          goto LABEL_6;
      }
LABEL_8:
      v7 = 4;
LABEL_9:
      if (-[UIKeyboardLayoutCursor _isDirectionalHeading:](self, "_isDirectionalHeading:", objc_msgSend(v4, "_focusHeading")))
      {
        v8 = -[UIKeyboardLayoutCursor handleVisualDirectionalInput:](self, "handleVisualDirectionalInput:", v7);
      }
      else
      {
        v8 = -[UIKeyboardLayoutCursor handleLinearDirectionalInput:](self, "handleLinearDirectionalInput:", v7);
      }
      v6 = v8;
LABEL_13:

      return v6;
  }
}

- (unint64_t)_indexOfFirstKeyPassingTest:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *keyplaneKeys;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[UIKeyboardLayoutCursor _isKeyboardReverseOfAppLayoutDirection](self, "_isKeyboardReverseOfAppLayoutDirection"))
    v5 = 2;
  else
    v5 = 0;
  keyplaneKeys = self->_keyplaneKeys;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__UIKeyboardLayoutCursor__indexOfFirstKeyPassingTest___block_invoke;
  v10[3] = &unk_1E16D3FD8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](keyplaneKeys, "enumerateObjectsWithOptions:usingBlock:", v5, v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __54__UIKeyboardLayoutCursor__indexOfFirstKeyPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isKeyboardReverseOfAppLayoutDirection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_getLocalizedInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "characterDirectionForLanguage:", v4) == 1;

  return v2 ^ (objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") == 0);
}

- (id)getRomanAccentVariantsForString:(id)a3 inputMode:(id)a4 keyboardVariantIndludes:(int)a5
{
  return UIKeyboardRomanAccentVariants((uint64_t)a3, a4, *(uint64_t *)&a5);
}

- (double)defaultCursorAdjustDistance
{
  return 60.0;
}

- (BOOL)isSlimLinearKeyboardTV
{
  return 0;
}

- (BOOL)isAppRightToLeft
{
  return objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") == 1;
}

- (BOOL)isKeyboardRightToLeft
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDefaultRightToLeft");

  return v4;
}

- (UIAlertController)recentInputsAlert
{
  return self->_recentInputsAlert;
}

- (void)setRecentInputsAlert:(id)a3
{
  objc_storeStrong((id *)&self->_recentInputsAlert, a3);
}

- (NSString)keyplaneBeforeDictation
{
  return self->_keyplaneBeforeDictation;
}

- (void)setKeyplaneBeforeDictation:(id)a3
{
  objc_storeStrong((id *)&self->_keyplaneBeforeDictation, a3);
}

- (int64_t)selectedKeyBeforeDictation
{
  return self->_selectedKeyBeforeDictation;
}

- (void)setSelectedKeyBeforeDictation:(int64_t)a3
{
  self->_selectedKeyBeforeDictation = a3;
}

- (BOOL)suppressOperations
{
  return self->_suppressOperations;
}

- (void)setSuppressOperations:(BOOL)a3
{
  self->_suppressOperations = a3;
}

- (BOOL)overrideInitialKey
{
  return self->_overrideInitialKey;
}

- (void)setOverrideInitialKey:(BOOL)a3
{
  self->_overrideInitialKey = a3;
}

- (unint64_t)lastSelectedKeyIndex
{
  return self->_lastSelectedKeyIndex;
}

- (void)setLastSelectedKeyIndex:(unint64_t)a3
{
  self->_lastSelectedKeyIndex = a3;
}

- (BOOL)shouldConfigureFloatingContentView
{
  return self->_shouldConfigureFloatingContentView;
}

- (void)setShouldConfigureFloatingContentView:(BOOL)a3
{
  self->_shouldConfigureFloatingContentView = a3;
}

- (BOOL)shouldToggleLetterCaseNext
{
  return self->_shouldToggleLetterCaseNext;
}

- (void)setShouldToggleLetterCaseNext:(BOOL)a3
{
  self->_shouldToggleLetterCaseNext = a3;
}

- (UIWindow)focusWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_focusWindow);
}

- (void)setFocusWindow:(id)a3
{
  objc_storeWeak((id *)&self->_focusWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusWindow);
  objc_storeStrong((id *)&self->_keyplaneBeforeDictation, 0);
  objc_storeStrong((id *)&self->_recentInputsAlert, 0);
  objc_storeStrong((id *)&self->_dictationHelpLabel, 0);
  objc_storeStrong((id *)&self->_cachedMultitapKeyplane, 0);
  objc_storeStrong((id *)&self->_recentInputs, 0);
  objc_storeStrong((id *)&self->_keyplaneKeys, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_indirectKeyboard, 0);
}

@end
