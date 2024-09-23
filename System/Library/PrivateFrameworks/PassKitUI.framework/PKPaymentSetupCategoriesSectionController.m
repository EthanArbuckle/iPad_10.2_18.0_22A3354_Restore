@implementation PKPaymentSetupCategoriesSectionController

- (PKPaymentSetupCategoriesSectionController)init
{
  PKPaymentSetupCategoriesSectionController *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupCategoriesSectionController;
  result = -[PKPaymentSetupListSectionController init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #28.0 }
    result->_iconSize = _Q0;
  }
  return result;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  double *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = (double *)self;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupCategoriesSectionController;
  v6 = a3;
  -[PKPaymentSetupListSectionController decoratePaymentSetListCell:forItem:](&v10, sel_decoratePaymentSetListCell_forItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageProperties", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 += 12;
  objc_msgSend(v8, "setMaximumSize:", *v5, v5[1]);
  objc_msgSend(v8, "setReservedLayoutSize:", *v5, v5[1]);
  objc_msgSend(v8, "setCornerRadius:", 6.0);
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary objectForKey:](self->_sectionIdentifiersToItemIdentifierMapping, "objectForKey:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safelyAddObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "appendItems:", v7);
  return v6;
}

- (id)identifiers
{
  return self->_orderedSectionIdentifiers;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToSectionTitleMapping, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHeaderMode:", objc_msgSend(v9, "length") != 0);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC39A8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "plainHeaderConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToSectionTitleMapping, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v16[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v16[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v14);
    objc_msgSend(v10, "setAttributedText:", v15);

    objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  }
  else
  {
    objc_msgSend(v10, "setAttributedText:", 0);
  }
  objc_msgSend(v9, "setContentConfiguration:", v10);

}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int);
  void *v15;
  PKPaymentSetupCategoriesSectionController *v16;
  id v17;

  v4 = a3;
  self->_didHideLoadingIndicators = 0;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFF8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "didSelectYourCardsWithCompletion:", 0);

  }
  else
  {
    objc_msgSend(v4, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__PKPaymentSetupCategoriesSectionController_didSelectItem___block_invoke;
    v15 = &unk_1E3E619E0;
    v16 = self;
    v10 = v5;
    v17 = v10;
    v11 = objc_msgSend(v8, "didSelectCategory:completion:", v9, &v12);

    if (v11 && !self->_didHideLoadingIndicators)
      -[PKPaymentSetupCategoriesSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", v10, 1, 0, v12, v13, v14, v15, v16);

  }
}

uint64_t __59__PKPaymentSetupCategoriesSectionController_didSelectItem___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateItemIdentifier:loadingIndicatorVisibility:animated:", *(_QWORD *)(result + 40), 0, 0);
  return result;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  void *v4;
  BOOL hasCardsOnFileSelectable;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D6AFF8]))
    hasCardsOnFileSelectable = self->_hasCardsOnFileSelectable;
  else
    hasCardsOnFileSelectable = 1;

  return hasCardsOnFileSelectable;
}

- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  v5 = a5;
  v6 = a4;
  v12 = a3;
  -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "loadingIndicatorVisible") != v6)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "setLoadingIndicatorVisible:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_itemIdentifierToItemMapping, "setObject:forKey:", v10, v12);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadItem:animated:", v10, v5);

  }
}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  id v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  self->_didHideLoadingIndicators = 1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_itemIdentifierToItemMapping, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = (id)*MEMORY[0x1E0D6AFF8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = v11;
        if (v11 == v9)
        {

        }
        else
        {
          if (!v9 || !v11)
          {

LABEL_15:
            -[PKPaymentSetupCategoriesSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", v12, 0, v3);
            continue;
          }
          v13 = objc_msgSend(v11, "isEqualToString:", v9);

          if (!v13)
            goto LABEL_15;
        }
        if (self->_hasCardsOnFileSelectable)
          goto LABEL_15;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (BOOL)updateWithRequirements:(unint64_t)a3 provisioningController:(id)a4 paymentSetupProductModel:(id)a5 forceProductConfiguration:(BOOL)a6
{
  _BOOL4 v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  PKPaymentSetupListItem *v70;
  PKPaymentSetupListItem *v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSMutableDictionary *itemIdentifierToItemMapping;
  NSMutableDictionary *v82;
  NSMutableDictionary *sectionIdentifiersToItemIdentifierMapping;
  NSMutableDictionary *v84;
  NSMutableDictionary *sectionIdentifierToSectionTitleMapping;
  NSMutableDictionary *v86;
  NSMutableArray *orderedSectionIdentifiers;
  NSMutableArray *v88;
  uint64_t v89;
  id v91;
  NSMutableDictionary *v93;
  NSMutableArray *v94;
  id obj;
  uint64_t v96;
  NSMutableDictionary *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  PKPaymentSetupCategoriesSectionController *v101;
  uint64_t v102;
  NSMutableDictionary *v103;
  id v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  uint64_t v115;
  id v116;
  _QWORD v117[6];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v91 = a4;
  v116 = a5;
  v9 = a6
    || (a3 & 2) != 0 && (self->_currentConfiguredRequirements & 2) == 0
    || (a3 & 8) != 0 && (self->_currentConfiguredRequirements & 8) == 0;
  v10 = self->_sectionIdentifierToSectionTitleMapping;
  v11 = self->_itemIdentifierToItemMapping;
  v12 = self->_sectionIdentifiersToItemIdentifierMapping;
  v13 = self->_orderedSectionIdentifiers;
  v14 = v13;
  if (v9)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v93 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);

    v94 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    objc_msgSend(v116, "allSections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
    if (!v98)
      goto LABEL_81;
    v96 = *(_QWORD *)v136;
    v103 = v16;
    v101 = self;
    v97 = v15;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v136 != v96)
          objc_enumerationMutation(obj);
        v100 = v17;
        v18 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v17);
        v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v134 = 0u;
        v99 = v18;
        objc_msgSend(v18, "categories");
        v107 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
        v108 = v19;
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v132;
          v102 = *(_QWORD *)v132;
          do
          {
            v23 = 0;
            v106 = v21;
            do
            {
              if (*(_QWORD *)v132 != v22)
                objc_enumerationMutation(v107);
              v24 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v23);
              objc_msgSend(v24, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "appendString:", v25);
              -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                v28 = (void *)objc_msgSend(v26, "copy");
              }
              else
              {
                -[PKPaymentSetupCategoriesSectionController _listItemForItemIdentifier:paymentSetupProductModel:](self, "_listItemForItemIdentifier:paymentSetupProductModel:", v25, v116);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setIdentifier:", v25);
                objc_msgSend(v28, "setDisplayChevron:", 1);
              }
              if (v25)
                v29 = v28 == 0;
              else
                v29 = 1;
              if (!v29)
              {
                v30 = v16;
                -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v28, v25);
                objc_msgSend(v105, "addObject:", v25);
                objc_msgSend(v104, "addObject:", v28);
                objc_msgSend(v28, "setCategory:", v24);
                objc_msgSend(v24, "localizedDisplayName");
                v31 = objc_claimAutoreleasedReturnValue();
                if (v31)
                  objc_msgSend(v28, "setTitle:", v31);
                v109 = (void *)v31;
                v110 = v27;
                v113 = v28;
                v111 = v25;
                v112 = v23;
                v129 = 0u;
                v130 = 0u;
                v127 = 0u;
                v128 = 0u;
                objc_msgSend(v24, "productIdentifiers");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
                if (v33)
                {
                  v34 = v33;
                  v35 = 0;
                  v114 = v32;
                  v115 = *(_QWORD *)v128;
                  do
                  {
                    for (i = 0; i != v34; ++i)
                    {
                      if (*(_QWORD *)v128 != v115)
                        objc_enumerationMutation(v114);
                      objc_msgSend(v116, "productForProductIdentifier:", *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i));
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v123 = 0u;
                      v124 = 0u;
                      v125 = 0u;
                      v126 = 0u;
                      objc_msgSend(v37, "featureApplications");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
                      if (v39)
                      {
                        v40 = v39;
                        v41 = 0;
                        v42 = *(_QWORD *)v124;
                        do
                        {
                          for (j = 0; j != v40; ++j)
                          {
                            if (*(_QWORD *)v124 != v42)
                              objc_enumerationMutation(v38);
                            v44 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
                            if (objc_msgSend(v44, "applicationState") == 5 && objc_msgSend(v44, "applicationType") == 1)
                              ++v41;
                          }
                          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
                        }
                        while (v40);
                      }
                      else
                      {
                        v41 = 0;
                      }

                      v45 = objc_msgSend(v37, "provisioningStatus");
                      if (v41 <= 1)
                        v46 = 1;
                      else
                        v46 = v41;
                      if (v41)
                        v47 = 1;
                      else
                        v47 = v45 > 1;
                      if (!v47)
                        v46 = 0;
                      v35 += v46;

                    }
                    v34 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
                  }
                  while (v34);

                  self = v101;
                  v22 = v102;
                  v16 = v103;
                  v19 = v108;
                  if (v35)
                  {
                    v48 = (void *)MEMORY[0x1E0CB37F0];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "localizedStringFromNumber:numberStyle:", v49, 0);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v113, "setBadgeText:", v50);

LABEL_59:
                    v21 = v106;
                    v25 = v111;
                    v23 = v112;
                    v27 = v110;

                    v28 = v113;
                    goto LABEL_60;
                  }
                }
                else
                {

                  v16 = v30;
                  v19 = v108;
                }
                objc_msgSend(v113, "setBadgeText:", 0);
                goto LABEL_59;
              }
LABEL_60:

              ++v23;
            }
            while (v23 != v21);
            v21 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
          }
          while (v21);
        }

        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v51 = v104;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v120;
          do
          {
            for (k = 0; k != v53; ++k)
            {
              if (*(_QWORD *)v120 != v54)
                objc_enumerationMutation(v51);
              v56 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * k);
              objc_msgSend(v56, "setSectionIdentifier:", v19);
              if (!objc_msgSend(v56, "isLoadingIcon"))
              {
                objc_msgSend(v56, "setIsLoadingIcon:", 1);
                objc_msgSend(v56, "category");
                v57 = objc_claimAutoreleasedReturnValue();
                v58 = v19;
                v59 = (void *)v57;
                v117[0] = MEMORY[0x1E0C809B0];
                v117[1] = 3221225472;
                v117[2] = __142__PKPaymentSetupCategoriesSectionController_updateWithRequirements_provisioningController_paymentSetupProductModel_forceProductConfiguration___block_invoke;
                v117[3] = &unk_1E3E63F60;
                v117[4] = v56;
                v117[5] = self;
                v118 = v58;
                objc_msgSend(v59, "logoCachedImage:", v117);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (v60)
                {
                  objc_msgSend(v56, "setIcon:", v60);
                }
                else
                {
                  PKUIImageNamed(CFSTR("default_welcome_icon"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "setIcon:", v61);

                }
                v19 = v108;
              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
          }
          while (v53);
        }

        v15 = v97;
        v16 = v103;
        if (objc_msgSend(v105, "count") && objc_msgSend(v19, "length"))
        {
          -[NSMutableArray addObject:](v94, "addObject:", v19);
          objc_msgSend(v99, "localizedTitle");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
            -[NSMutableDictionary setObject:forKey:](v97, "setObject:forKey:", v62, v19);
          -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v105, v19);

        }
        v17 = v100 + 1;
      }
      while (v100 + 1 != v98);
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v144, 16);
      if (!v98)
      {
LABEL_81:

        v63 = v16;
        goto LABEL_83;
      }
    }
  }
  v93 = v12;
  v94 = v13;
  v63 = v11;
  v15 = v10;
LABEL_83:
  objc_msgSend(v91, "associatedCredentials");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "count");

  v66 = *MEMORY[0x1E0D6AFF8];
  v67 = v63;
  -[NSMutableDictionary objectForKey:](v63, "objectForKey:", *MEMORY[0x1E0D6AFF8]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = v68;
    v70 = (PKPaymentSetupListItem *)objc_msgSend(v68, "copy");
  }
  else
  {
    v71 = [PKPaymentSetupListItem alloc];
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_YOUR_CARDS"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    PKUIImageNamed(CFSTR("your_cards_welcome_icon"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v71, "initWithTitle:subtitle:icon:", v72, 0, v73);

    -[PKPaymentSetupListItem setIdentifier:](v70, "setIdentifier:", v66);
    -[PKPaymentSetupListItem setDisplayChevron:](v70, "setDisplayChevron:", 1);
    -[NSMutableArray firstObject](v94, "firstObject");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
      -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v69);
    v139 = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v74, v66);

    -[NSMutableArray insertObject:atIndex:](v94, "insertObject:atIndex:", v66, 0);
  }

  if ((a3 & 0x20) != 0)
  {
    if (v65)
    {
      v76 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v65);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedStringFromNumber:numberStyle:", v77, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupListItem setLabelText:](v70, "setLabelText:", v78);

      v75 = 1;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("NONE"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupListItem setLabelText:](v70, "setLabelText:", v77);
      v75 = 0;
    }

    -[PKPaymentSetupListItem setDisplayChevron:](v70, "setDisplayChevron:", v65 != 0);
  }
  else
  {
    -[PKPaymentSetupListItem setLabelText:](v70, "setLabelText:", 0);
    v75 = 0;
  }
  self->_hasCardsOnFileSelectable = v75;
  -[PKPaymentSetupListItem setLoadingIndicatorVisible:](v70, "setLoadingIndicatorVisible:", (a3 & 0x20) == 0);
  -[NSMutableDictionary setObject:forKey:](v67, "setObject:forKey:", v70, v66);
  -[NSMutableArray firstObject](v94, "firstObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_AVAILABLE_CARDS"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v80, v79);

  }
  itemIdentifierToItemMapping = self->_itemIdentifierToItemMapping;
  self->_itemIdentifierToItemMapping = v67;
  v82 = v67;

  sectionIdentifiersToItemIdentifierMapping = self->_sectionIdentifiersToItemIdentifierMapping;
  self->_sectionIdentifiersToItemIdentifierMapping = v93;
  v84 = v93;

  sectionIdentifierToSectionTitleMapping = self->_sectionIdentifierToSectionTitleMapping;
  self->_sectionIdentifierToSectionTitleMapping = v15;
  v86 = v15;

  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  self->_orderedSectionIdentifiers = v94;
  v88 = v94;

  self->_currentConfiguredRequirements = a3;
  v89 = -[NSMutableArray count](self->_orderedSectionIdentifiers, "count");

  return v89 != 0;
}

void __142__PKPaymentSetupCategoriesSectionController_updateWithRequirements_provisioningController_paymentSetupProductModel_forceProductConfiguration___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setIsLoadingIcon:", 2);
  if (v9 && a2)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setIcon:", v9);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 128));
    objc_msgSend(WeakRetained, "reloadRequiredForSectionIdentifier:animated:", *(_QWORD *)(a1 + 48), 0);

  }
}

- (id)_listItemForItemIdentifier:(id)a3 paymentSetupProductModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKPaymentSetupCategoriesListItem *v11;
  void *v12;
  PKPaymentSetupCategoriesListItem *v13;
  PKPaymentSetupCategoriesListItem *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  PKPaymentSetupCategoriesListItem *v18;
  void *v19;
  __CFString *v20;
  PKPaymentSetupCategoriesListItem *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFC8]))
  {
    PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_APPLE_CARD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productsForFeatureIdentifier:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayName");
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    v11 = [PKPaymentSetupCategoriesListItem alloc];
    PKUIImageNamed(CFSTR("apple_card_welcome_icon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v11, "initWithTitle:subtitle:icon:", v7, 0, v12);

    -[PKPaymentSetupCategoriesListItem setIsLoadingIcon:](v13, "setIsLoadingIcon:", 2);
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFC0]))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFD8]))
    {
      if ((PKPaymentSetupMergeProductsPartnersAPIEnabled() & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136315138;
          v29 = "-[PKPaymentSetupCategoriesSectionController _listItemForItemIdentifier:paymentSetupProductModel:]";
          _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled PKPaymentSetupProductCategoryTypeCreditDebit", (uint8_t *)&v28, 0xCu);
        }

        v16 = CFSTR("Old Products API for Bank App");
      }
      v18 = [PKPaymentSetupCategoriesListItem alloc];
      PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CREDIT_DEBIT"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("credit_debit_welcome_icon");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFF0]))
      {
        if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFD0]))
        {
          v21 = [PKPaymentSetupCategoriesListItem alloc];
          PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_CARKEY"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("carkey_welcome_icon");
        }
        else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFE8]))
        {
          if (!PKIdentityEnabled())
          {
            v13 = 0;
            goto LABEL_32;
          }
          v21 = [PKPaymentSetupCategoriesListItem alloc];
          PKLocalizedIdentityString(CFSTR("PAYMENT_SETUP_IDENTITY"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("IDENTITY_welcome_icon");
        }
        else
        {
          if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6AFE0]))
          {
            v13 = objc_alloc_init(PKPaymentSetupCategoriesListItem);
            goto LABEL_32;
          }
          v21 = [PKPaymentSetupCategoriesListItem alloc];
          PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_EMONEY"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = CFSTR("emoney_welcome_icon");
        }
        PKUIImageNamed(v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v21, "initWithTitle:subtitle:icon:", v22, 0, v26);

        goto LABEL_31;
      }
      if ((PKPaymentSetupMergeProductsPartnersAPIEnabled() & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136315138;
          v29 = "-[PKPaymentSetupCategoriesSectionController _listItemForItemIdentifier:paymentSetupProductModel:]";
          _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled PKPaymentSetupProductCategoryTypeTransit", (uint8_t *)&v28, 0xCu);
        }

        v16 = CFSTR("Old Products API for Transit");
      }
      v18 = [PKPaymentSetupCategoriesListItem alloc];
      PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_RIDE_TRANSIT"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("transit_welcome_icon");
    }
    PKUIImageNamed(v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v18, "initWithTitle:subtitle:icon:", v19, v16, v25);

LABEL_31:
    -[PKPaymentSetupCategoriesListItem setIsLoadingIcon:](v13, "setIsLoadingIcon:", 2);
    goto LABEL_32;
  }
  PKLocalizedLynxString(CFSTR("APPLY_FLOW_NEW_APPLICATION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PKPaymentSetupCategoriesListItem alloc];
  PKUIImageNamed(CFSTR("AppleBalance_welcome_icon"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v14, "initWithTitle:subtitle:icon:", v7, 0, v15);

  -[PKPaymentSetupCategoriesListItem setIsLoadingIcon:](v13, "setIsLoadingIcon:", 2);
LABEL_7:

LABEL_32:
  return v13;
}

- (PKPaymentSetupCategoriesSectionControllerDelegate)delegate
{
  return (PKPaymentSetupCategoriesSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersToItemIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionTitleMapping, 0);
}

@end
