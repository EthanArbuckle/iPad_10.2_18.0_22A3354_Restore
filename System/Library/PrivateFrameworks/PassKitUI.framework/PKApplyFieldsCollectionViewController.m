@implementation PKApplyFieldsCollectionViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKApplyFieldsCollectionViewController;
  -[PKApplyCollectionViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678C0]);
  -[PKApplyFieldsCollectionViewController _recomputeSections](self, "_recomputeSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 0);

  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalBottomPadding:", 4.0);
  objc_msgSend(v6, "setTitleAccessoriesEnabled:", 0);
  PKProvisioningBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);
  -[PKApplyFieldsCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[PKPaymentSetupOptionsViewController setHeaderBackgroundColor:](self, "setHeaderBackgroundColor:", v7);
  v9 = v3;
  -[PKApplyFieldsCollectionViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v11 != CFSTR("taxWithholding"))
  {
    v12 = v11;
    if (!v11
      || (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("taxWithholding")),
          v12,
          v12,
          (v13 & 1) == 0))
    {
      objc_msgSend(v10, "setLeftBarButtonItem:", 0);
      objc_msgSend(v10, "setHidesBackButton:", 0);
    }
  }
  objc_msgSend(v9, "primaryActionTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = PKUIGetMinScreenWidthType();
    v17 = -20.0;
    if (!v16)
      v17 = -10.0;
    objc_msgSend(v6, "setAdditionalTopPadding:", v17);
    self->_needsToReachEndOfPage = 1;
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("SUBMIT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 2, self, sel_handleNextStep);

    objc_msgSend(v20, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
    objc_msgSend(v20, "setEnabled:", 0);
    objc_msgSend(v10, "setRightBarButtonItem:", v20);

  }
  -[PKApplyCollectionViewController controller](self, "controller");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "applicationType") != 5)
    goto LABEL_13;
  objc_msgSend(v9, "secondaryActionTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (!v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[PKApplyCollectionViewController controller](self, "controller");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "featureIdentifier");
    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v24, "initWithTitle:style:target:action:", v26, 0, self, sel__terminateFlow);

    objc_msgSend(v21, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    objc_msgSend(v10, "setLeftBarButtonItem:", v21);
LABEL_13:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  -[PKPaymentSetupOptionsViewController setShouldCollapseHeaderOnKeyboardShow:](self, "setShouldCollapseHeaderOnKeyboardShow:", 0);
  -[PKPaymentSetupOptionsViewController setShowNoResultsView:animated:](self, "setShowNoResultsView:animated:", 0, 0);

}

- (id)_recomputeSections
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  PKApplyRequiredFieldSectionController *v18;
  uint64_t v19;
  PKApplyRadioPickerSectionController *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  PKApplyInlineFooterSectionController *v30;
  PKApplyRequiredFieldSectionController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __objc2_class **v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char isKindOfClass;
  void *v43;
  void *v44;
  uint64_t v45;
  PKApplyPrimaryActionSectionController *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  PKApplyFieldsCollectionViewController *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKApplyCollectionViewController controller](self, "controller");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKApplyFieldsCollectionViewController _determineNextEnablementWithPage:](self, "_determineNextEnablementWithPage:", v5);
  v61 = self;
  -[PKApplyFieldsCollectionViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  v10 = (void *)v4;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v62 = v6;
  objc_msgSend(v6, "visiblePaymentSetupFields");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  v57 = v5;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    v59 = *(_QWORD *)v68;
    v55 = (void *)v4;
    v56 = v3;
    do
    {
      v14 = 0;
      v58 = v12;
      do
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v14);
        objc_msgSend(v15, "identifier", v55);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v62, "requirementsMetForFieldWithIdentifier:", v16);

        if (v17)
        {
          if (objc_msgSend(v15, "fieldType") == 5)
          {
            objc_msgSend(v15, "pickerFieldObject");
            v18 = (PKApplyRequiredFieldSectionController *)objc_claimAutoreleasedReturnValue();
            v19 = -[PKApplyRequiredFieldSectionController pickerType](v18, "pickerType");
            if (v19 != 2)
            {
              if (v19 == 1)
              {
                v20 = -[PKApplyRadioPickerSectionController initWithController:applyPage:picker:]([PKApplyRadioPickerSectionController alloc], "initWithController:applyPage:picker:", v10, v5, v18);
                -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v20, "setDynamicCollectionDelegate:", v61);
                objc_msgSend(v3, "addObject:", v20);
                goto LABEL_33;
              }
LABEL_35:

              goto LABEL_36;
            }
            v20 = -[PKApplyMultilevelListPickerSectionController initWithController:applyPage:picker:]([PKApplyMultilevelListPickerSectionController alloc], "initWithController:applyPage:picker:", v10, v5, v18);
            -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v20, "setDynamicCollectionDelegate:", v61);
            objc_msgSend(v3, "addObject:", v20);
            -[PKApplyRequiredFieldSectionController currentValue](v18, "currentValue");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "nextLevelPicker");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              while (2)
              {
                if (objc_msgSend(v35, "fieldType") == 5)
                {
                  v36 = objc_msgSend(v35, "pickerType");
                  if (v36 == 1)
                  {
                    v37 = off_1E3E1A958;
LABEL_28:
                    v38 = (void *)objc_msgSend(objc_alloc(*v37), "initWithController:applyPage:picker:", v10, v5, v35);
                    objc_msgSend(v38, "setDynamicCollectionDelegate:", v61);
                  }
                  else
                  {
                    if (v36 == 2)
                    {
                      v37 = off_1E3E1A908;
                      goto LABEL_28;
                    }
                    v38 = 0;
                  }
                  objc_msgSend(v3, "safelyAddObject:", v38);

                }
                objc_msgSend(v35, "currentValue");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "nextLevelPicker");
                v40 = objc_claimAutoreleasedReturnValue();

                v35 = (void *)v40;
                if (!v40)
                  break;
                continue;
              }
            }
            v12 = v58;
LABEL_33:

          }
          else
          {
            if (objc_msgSend(v15, "fieldType") == 3)
            {
              objc_msgSend(v15, "labelFieldObject");
              v18 = (PKApplyRequiredFieldSectionController *)objc_claimAutoreleasedReturnValue();
              v21 = objc_alloc_init(MEMORY[0x1E0D66B00]);
              -[PKApplyRequiredFieldSectionController title](v18, "title");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setFooterText:", v22);

              v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              -[PKApplyRequiredFieldSectionController links](v18, "links");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v64;
                do
                {
                  for (i = 0; i != v26; ++i)
                  {
                    if (*(_QWORD *)v64 != v27)
                      objc_enumerationMutation(v24);
                    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66B08]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
                    objc_msgSend(v23, "safelyAddObject:", v29);

                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
                }
                while (v26);
              }

              objc_msgSend(v21, "setLinks:", v23);
              v10 = v55;
              v5 = v57;
              v30 = -[PKApplyInlineFooterSectionController initWithController:applyPage:content:delegate:]([PKApplyInlineFooterSectionController alloc], "initWithController:applyPage:content:delegate:", v55, v57, v21, v61);
              -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v30, "setDynamicCollectionDelegate:", v61);
              v3 = v56;
              objc_msgSend(v56, "addObject:", v30);

            }
            else
            {
              v31 = [PKApplyRequiredFieldSectionController alloc];
              -[PKApplyCollectionViewController controller](v61, "controller");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKApplyCollectionViewController page](v61, "page");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[PKApplyRequiredFieldSectionController initWithController:applyPage:field:](v31, "initWithController:applyPage:field:", v32, v33, v15);

              -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v18, "setDynamicCollectionDelegate:", v61);
              objc_msgSend(v3, "safelyAddObject:", v18);
              v5 = v57;
            }
            v12 = v58;
          }
          v13 = v59;
          goto LABEL_35;
        }
LABEL_36:
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setIsTopmostSection:", 1);

  }
  if (v61->_useInlinePrimaryButton == 1)
  {
    objc_msgSend(v57, "primaryActionTitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      v46 = -[PKApplyCollectionViewSectionController initWithController:applyPage:]([PKApplyPrimaryActionSectionController alloc], "initWithController:applyPage:", v10, v57);
      -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v46, "setDynamicCollectionDelegate:", v61);
      -[PKApplyPrimaryActionSectionController setPrimaryButtonLoading:](v46, "setPrimaryButtonLoading:", v61->_primaryButtonLoading);
      objc_msgSend(v3, "addObject:", v46);

    }
  }
  -[PKDynamicCollectionViewController collectionView](v61, "collectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "contentSize");
  v49 = v48;
  objc_msgSend(v47, "frame");
  v51 = v50;
  objc_msgSend(v47, "contentInset");
  if (v49 > v51 - v52)
  {
    objc_msgSend(v47, "safeAreaInsets");
    objc_msgSend(v47, "setScrollIndicatorInsets:");
    objc_msgSend(v47, "setShowsVerticalScrollIndicator:", 1);
    objc_msgSend(v47, "flashScrollIndicators");
  }
  v53 = (void *)objc_msgSend(v3, "copy");

  return v53;
}

- (BOOL)_determineNextEnablementWithPage:(id)a3
{
  id v3;
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
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "fieldModel", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visiblePaymentSetupFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
  {
    v20 = 1;
    goto LABEL_27;
  }
  v7 = v6;
  v8 = *(_QWORD *)v23;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      if (objc_msgSend(v10, "fieldType") == 5)
      {
        objc_msgSend(v10, "pickerFieldObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "currentValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isOptional") & 1) == 0 && !v12)
          goto LABEL_24;
        objc_msgSend(v12, "nextLevelPicker");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          while (1)
          {
            v14 = v12;
            objc_msgSend(v13, "currentValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v13, "isOptional") & 1) == 0 && !v12)
              break;
            objc_msgSend(v12, "nextLevelPicker");
            v15 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v15;
            if (!v15)
              goto LABEL_16;
          }
          v11 = v13;
LABEL_24:

LABEL_25:
          v20 = 0;
          goto LABEL_27;
        }
LABEL_16:

        goto LABEL_17;
      }
      if ((objc_msgSend(v10, "isOptional") & 1) != 0)
        goto LABEL_17;
      objc_msgSend(v10, "currentValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_16;
      objc_msgSend(v3, "fieldModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "requirementsMetForFieldWithIdentifier:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_25;
LABEL_17:
      ++v9;
    }
    while (v9 != v7);
    v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v7 = v19;
    v20 = 1;
  }
  while (v19);
LABEL_27:

  return v20;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v6, sel_reloadDataAnimated_);
  -[PKApplyFieldsCollectionViewController _recomputeSections](self, "_recomputeSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, v3);

}

- (void)recomputeSectionsWithReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PKApplyFieldsCollectionViewController _recomputeSections](self, "_recomputeSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v5;
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v5, 1);
    v5 = v6;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  -[PKPaymentSetupOptionsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PKApplyFieldsCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[PKApplyFieldsCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[PKApplyFieldsCollectionViewController _updatePrimaryButton](self, "_updatePrimaryButton");
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PKApplyFieldsCollectionViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  -[PKApplyCollectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_needsToReachEndOfPage && self->_useInlinePrimaryButton == 1)
    objc_msgSend(v4, "flashScrollIndicators");

}

- (void)_updatePrimaryButton
{
  void *v3;
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
  void *v14;
  id v15;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_needsToReachEndOfPage)
  {
    v15 = v3;
    objc_msgSend(v3, "contentSize");
    v3 = v15;
    if (v4 != 0.0)
    {
      objc_msgSend(v15, "frame");
      v6 = v5;
      objc_msgSend(v15, "adjustedContentInset");
      v8 = v7;
      objc_msgSend(v15, "adjustedContentInset");
      v10 = v9;
      objc_msgSend(v15, "contentOffset");
      v12 = v11;
      objc_msgSend(v15, "contentSize");
      if (self->_useInlinePrimaryButton || v13 - (v6 - v8 - v10) - v12 <= 24.0)
      {
        self->_useInlinePrimaryButton = 2;
      }
      else
      {
        -[PKPaymentSetupOptionsViewController removeSetupDockView](self, "removeSetupDockView");
        self->_useInlinePrimaryButton = 1;
        -[PKApplyFieldsCollectionViewController _recomputeSections](self, "_recomputeSections");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v14, 0);

        objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 1);
      }
      v3 = v15;
    }
  }

}

- (void)handleNextStep
{
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  -[PKApplyFieldsCollectionViewController verifyAndSubmitFields](self, "verifyAndSubmitFields");
}

- (void)showButtonSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_primaryButtonLoading = a3;
  if (self->_useInlinePrimaryButton == 2)
  {
    -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setShowSpinner:", v3);
    objc_msgSend(v6, "setEnabled:", v3 ^ 1);
  }
  else
  {
    if (a3)
      return;
    -[PKApplyFieldsCollectionViewController _recomputeSections](self, "_recomputeSections");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:");
  }

}

- (void)primaryButtonTapped
{
  -[PKApplyFieldsCollectionViewController showButtonSpinner:](self, "showButtonSpinner:", 1);
  -[PKApplyFieldsCollectionViewController verifyAndSubmitFields](self, "verifyAndSubmitFields");
}

- (void)verifyAndSubmitFields
{
  void *v2;
  uint64_t v3;
  char v4;
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
  int v20;
  void *v21;
  id obj;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v21, "fieldModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visiblePaymentSetupFields");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v3)
  {

LABEL_17:
    -[PKApplyFieldsCollectionViewController submitFields](self, "submitFields");
    goto LABEL_18;
  }
  v4 = 0;
  v24 = *(_QWORD *)v31;
LABEL_3:
  v5 = 0;
  while (1)
  {
    if (*(_QWORD *)v31 != v24)
      objc_enumerationMutation(obj);
    v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
    if (objc_msgSend(v6, "isFieldTypePicker"))
    {
      objc_msgSend(v6, "pickerFieldObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submissionConfirmationTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submissionConfirmationDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "length"))
        goto LABEL_10;
      if (objc_msgSend(v10, "length"))
      {
        objc_initWeak(&location, self);
        v11 = (void *)MEMORY[0x1E0DC3448];
        -[PKApplyCollectionViewController controller](self, "controller");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "featureIdentifier");
        PKLocalizedFeatureString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke;
        v27[3] = &unk_1E3E63F88;
        objc_copyWeak(&v28, &location);
        objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0DC3448];
        -[PKApplyCollectionViewController controller](self, "controller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "featureIdentifier");
        PKLocalizedFeatureString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke_2;
        v25[3] = &unk_1E3E63F88;
        objc_copyWeak(&v26, &location);
        objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addAction:", v14);
        objc_msgSend(v19, "addAction:", v18);
        objc_msgSend(v19, "setPreferredAction:", v18);
        -[PKApplyFieldsCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        v20 = 0;
        v4 = 1;
      }
      else
      {
LABEL_10:
        v20 = 1;
      }

      if (!v20)
        break;
    }
    if (v3 == ++v5)
    {
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v3)
        goto LABEL_3;
      break;
    }
  }

  if ((v4 & 1) == 0)
    goto LABEL_17;
LABEL_18:

}

void __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showButtonSpinner:", 0);
    objc_msgSend(v2, "setShowNavigationBarSpinner:", 0);
    WeakRetained = v2;
  }

}

void __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "submitFields");
    WeakRetained = v2;
  }

}

- (void)submitFields
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  PKApplyTermsVerifyingViewController *v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKApplyTermsVerifyingViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;

  -[PKApplyCollectionViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "featureIdentifier") == 5
    && ((objc_msgSend(v4, "identifier"),
         v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
         v5 == CFSTR("taxWithholding"))
     || (v6 = v5) != 0
     && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("taxWithholding")),
         v6,
         v6,
         v7)))
  {
    v8 = [PKApplyTermsVerifyingViewController alloc];
    -[PKApplyCollectionViewController setupDelegate](self, "setupDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPaymentSetupOptionsViewController context](self, "context");
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    -[PKApplyCollectionViewController controller](self, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "featureApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationTermsIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithObjects:", v14, 0);
    v16 = -[PKApplyTermsVerifyingViewController initWithController:setupDelegate:context:termsIdentifiers:applyPage:](v8, "initWithController:setupDelegate:context:termsIdentifiers:applyPage:", v3, v9, v10, v15, v4);

    -[PKApplyFieldsCollectionViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v16, 1);

  }
  else
  {
    objc_initWeak(&location, self);
    -[PKApplyCollectionViewController controller](self, "controller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController currentPage](self, "currentPage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke;
    v20[3] = &unk_1E3E62598;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v18, "submitFieldsPage:completion:", v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_OWORD *)(a1 + 32) == 0)
    {
      WeakRetained[1345] = 1;
      objc_msgSend(WeakRetained, "_terminateFlow");
    }
    else
    {
      objc_msgSend(WeakRetained, "handleNextViewController:displayableError:");
      objc_msgSend(v3, "showButtonSpinner:", 0);
      objc_msgSend(v3, "setShowNavigationBarSpinner:", 0);
    }
    WeakRetained = v3;
  }

}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyCollectionViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyFieldsCollectionViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_keyboardWillShow:(id)a3
{
  -[PKPaymentSetupOptionsViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 1);
}

- (void)_keyboardWillHide:(id)a3
{
  -[PKPaymentSetupOptionsViewController setIsShowingKeyboard:](self, "setIsShowingKeyboard:", 0);
}

- (BOOL)hasFieldsSubmitted
{
  return self->_hasFieldsSubmitted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerSectionController, 0);
  objc_storeStrong((id *)&self->_inlineFooterSectionController, 0);
}

@end
