@implementation SearchUICollectionViewController

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICollectionViewController;
  return -[SearchUICollectionViewController respondsToSelector:](&v6, sel_respondsToSelector_)
      || -[SearchUICollectionViewController forwardFeedbackForSelector:](self, "forwardFeedbackForSelector:", a3);
}

- (BOOL)forwardFeedbackForSelector:(SEL)a3
{
  void *v4;
  char v5;

  if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1F02D1D28, a3, 0, 1).name)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)sendVisibleFeedbackIfNecessary
{
  SearchUICollectionViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  char v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  uint64_t v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  SearchUICollectionViewController *v71;
  SearchUICollectionViewController *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v2 = self;
  v83 = *MEMORY[0x1E0C80C00];
  if (-[SearchUICollectionViewController isVisibleFeedbackEnabled](self, "isVisibleFeedbackEnabled"))
  {
    if (-[SearchUICollectionViewController _appearState](v2, "_appearState") != 3)
    {
      if (-[SearchUICollectionViewController _appearState](v2, "_appearState"))
      {
        -[SearchUICollectionViewController dataSource](v2, "dataSource");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "snapshot");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "numberOfSections");

        if (v5 >= 1)
        {
          -[SearchUICollectionViewController collectionView](v2, "collectionView");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "visibleBounds");
          v8 = v7;
          v10 = v9;
          v12 = v11;
          v14 = v13;

          -[SearchUICollectionViewController view](v2, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safeAreaInsets");
          v17 = v16;

          v18 = v10 + v17;
          -[SearchUIKeyboardableCollectionViewController currentKeyboardHeight](v2, "currentKeyboardHeight");
          v20 = v14 - (v17 + v19);
          -[SearchUICollectionViewController tableModel](v2, "tableModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v21, "queryId");

          -[SearchUICollectionViewController feedbackListener](v2, "feedbackListener");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SearchUICollectionViewController potentiallyVisibleCells](v2, "potentiallyVisibleCells");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (v24)
            {
              -[SearchUICollectionViewController potentiallyVisibleCells](v2, "potentiallyVisibleCells");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = v2;
              -[SearchUICollectionViewController visibleViewsInPotentiallyVisibleViews:withinRegion:](v2, "visibleViewsInPotentiallyVisibleViews:withinRegion:", v25, v8, v18, v12, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = (void *)objc_opt_new();
              v28 = (void *)objc_opt_new();
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v29 = v26;
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v78;
                do
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if (*(_QWORD *)v78 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v34, "visibleResults");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v35)
                        objc_msgSend(v27, "addObjectsFromArray:", v35);
                      objc_msgSend(v34, "rowModel", v69);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "cardSection");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v37)
                        objc_msgSend(v28, "addObject:", v37);

                    }
                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
                }
                while (v31);
              }

              v2 = v71;
              -[SearchUICollectionViewController latestVisibleResultsAccountedForInFeedback](v71, "latestVisibleResultsAccountedForInFeedback");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v27, "copy");
              -[SearchUICollectionViewController setLatestVisibleResultsAccountedForInFeedback:](v71, "setLatestVisibleResultsAccountedForInFeedback:", v39);

              -[SearchUICollectionViewController latestVisibleCardSectionsAccountedForInFeedback](v71, "latestVisibleCardSectionsAccountedForInFeedback");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)objc_msgSend(v28, "copy");
              -[SearchUICollectionViewController setLatestVisibleCardSectionsAccountedForInFeedback:](v71, "setLatestVisibleCardSectionsAccountedForInFeedback:", v41);

              v42 = -[SearchUICollectionViewController lastVisibleFeedbackTrigger](v71, "lastVisibleFeedbackTrigger");
              v43 = objc_msgSend(v27, "isEqual:", v38);
              v44 = objc_msgSend(v28, "isEqual:", v40);
              if (!v43 || (v44 & 1) == 0)
              {
                v45 = objc_alloc(MEMORY[0x1E0D8C828]);
                objc_msgSend(v27, "array");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "array");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (void *)objc_msgSend(v45, "initWithResults:triggerEvent:visibleButtons:visibleCardSections:", v46, v42, 0, v47);

                v2 = v71;
                objc_msgSend(v48, "setQueryId:", v69);
                -[SearchUICollectionViewController feedbackListener](v71, "feedbackListener");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "resultsDidBecomeVisible:", v48);

              }
            }
          }
          else
          {

          }
          -[SearchUICollectionViewController feedbackListener](v2, "feedbackListener", v69);
          v50 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[SearchUICollectionViewController potentiallyVisibleHeaders](v2, "potentiallyVisibleHeaders");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "count");

            if (!v52)
              return;
            v53 = (void *)MEMORY[0x1E0C99E10];
            -[SearchUICollectionViewController potentiallyVisibleHeaders](v2, "potentiallyVisibleHeaders");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUICollectionViewController visibleViewsInPotentiallyVisibleViews:withinRegion:](v2, "visibleViewsInPotentiallyVisibleViews:withinRegion:", v54, v8, v18, v12, v20);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "orderedSetWithArray:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = (void *)objc_opt_new();
            v72 = v2;
            -[SearchUICollectionViewController latestVisibleSectionHeadersAccountedForInFeedback](v2, "latestVisibleSectionHeadersAccountedForInFeedback");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v50 = v56;
            v59 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v74;
              do
              {
                for (j = 0; j != v60; ++j)
                {
                  if (*(_QWORD *)v74 != v61)
                    objc_enumerationMutation(v50);
                  v63 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
                  +[SearchUISupplementaryProvider sectionForHeaderView:](SearchUISupplementaryProvider, "sectionForHeaderView:", v63);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v64)
                  {
                    objc_msgSend(v57, "addObject:", v64);
                    if ((objc_msgSend(v58, "containsObject:", v64) & 1) == 0)
                    {
                      v65 = +[SearchUISupplementaryProvider headerTypeForHeaderView:](SearchUISupplementaryProvider, "headerTypeForHeaderView:", v63);
                      v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C830]), "initWithSection:headerType:", v64, v65);
                      objc_msgSend(v66, "setQueryId:", v70);
                      -[SearchUICollectionViewController feedbackListener](v72, "feedbackListener");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "sectionHeaderDidBecomeVisible:", v66);

                    }
                  }

                }
                v60 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
              }
              while (v60);
            }

            v68 = (void *)objc_msgSend(v57, "copy");
            -[SearchUICollectionViewController setLatestVisibleSectionHeadersAccountedForInFeedback:](v72, "setLatestVisibleSectionHeadersAccountedForInFeedback:", v68);

          }
        }
      }
    }
  }
}

- (SearchUICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (SearchUIFeedbackDelegate)feedbackListener
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackListener);
}

- (NSMutableDictionary)potentiallyVisibleHeaders
{
  return self->_potentiallyVisibleHeaders;
}

- (NSMutableDictionary)potentiallyVisibleCells
{
  return self->_potentiallyVisibleCells;
}

- (id)visibleViewsInPotentiallyVisibleViews:(id)a3 withinRegion:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __87__SearchUICollectionViewController_visibleViewsInPotentiallyVisibleViews_withinRegion___block_invoke;
  v27[3] = &unk_1EA1F8188;
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  v27[4] = self;
  v11 = v10;
  v28 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
  v12 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v12, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v12, "copy");
  return v21;
}

- (BOOL)isVisibleFeedbackEnabled
{
  return self->_isVisibleFeedbackEnabled;
}

- (void)viewDidLayoutSubviews
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
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)SearchUICollectionViewController;
  -[SearchUICollectionViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[SearchUICollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SearchUICollectionViewController lastVisibleBounds](self, "lastVisibleBounds");
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[SearchUICollectionViewController setLastVisibleBounds:](self, "setLastVisibleBounds:", v5, v7, v9, v11);
    -[SearchUICollectionViewController latestVisibleCardSectionsAccountedForInFeedback](self, "latestVisibleCardSectionsAccountedForInFeedback");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 9);
  }
  -[SearchUICollectionViewController sendVisibleFeedbackIfNecessary](self, "sendVisibleFeedbackIfNecessary");
}

- (CGRect)lastVisibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastVisibleBounds.origin.x;
  y = self->_lastVisibleBounds.origin.y;
  width = self->_lastVisibleBounds.size.width;
  height = self->_lastVisibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSOrderedSet)latestVisibleCardSectionsAccountedForInFeedback
{
  return self->_latestVisibleCardSectionsAccountedForInFeedback;
}

- (void)setLatestVisibleSectionHeadersAccountedForInFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_latestVisibleSectionHeadersAccountedForInFeedback, a3);
}

- (void)setLatestVisibleResultsAccountedForInFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_latestVisibleResultsAccountedForInFeedback, a3);
}

- (void)setLatestVisibleCardSectionsAccountedForInFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_latestVisibleCardSectionsAccountedForInFeedback, a3);
}

- (NSOrderedSet)latestVisibleSectionHeadersAccountedForInFeedback
{
  return self->_latestVisibleSectionHeadersAccountedForInFeedback;
}

- (NSOrderedSet)latestVisibleResultsAccountedForInFeedback
{
  return self->_latestVisibleResultsAccountedForInFeedback;
}

- (unint64_t)lastVisibleFeedbackTrigger
{
  return self->_lastVisibleFeedbackTrigger;
}

- (void)setLastVisibleBounds:(CGRect)a3
{
  self->_lastVisibleBounds = a3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)footerView
{
  return self->_footerView;
}

id __40__SearchUICollectionViewController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifierForIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "searchUIAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutSectionForSectionModel:layoutEnvironment:attributes:", v8, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SearchUICommandEnvironment)commandEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setFeedbackDelegate:", self);
  objc_msgSend(v3, "setShouldUseInsetRoundedSections:", -[SearchUICollectionViewController shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"));
  -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultsViewDelegate:", v4);

  objc_msgSend(v3, "setShouldUseStandardSectionInsets:", -[SearchUICollectionViewController shouldUseStandardSectionInsets](self, "shouldUseStandardSectionInsets"));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "setSelectableGridPunchoutIndex:", -[SearchUICollectionViewController preferredPunchoutIndex](self, "preferredPunchoutIndex"));
  objc_msgSend(v3, "setThreeDTouchEnabled:", -[SearchUICollectionViewController threeDTouchEnabled](self, "threeDTouchEnabled"));
  -[SearchUICollectionViewController commandDelegate](self, "commandDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCommandDelegate:", v5);

  objc_msgSend(v3, "setRowModelViewDelegate:", self);
  -[SearchUICollectionViewController cardViewDelegate](self, "cardViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCardViewDelegate:", v6);

  -[SearchUICollectionViewController searchUIAttributes](self, "searchUIAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommandEnvironment:", v3);

  return (SearchUICommandEnvironment *)v3;
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (SearchUICollectionViewAttributes)searchUIAttributes
{
  return self->_searchUIAttributes;
}

- (SearchUICardViewDelegate)cardViewDelegate
{
  return (SearchUICardViewDelegate *)objc_loadWeakRetained((id *)&self->_cardViewDelegate);
}

- (BOOL)threeDTouchEnabled
{
  void *v2;
  BOOL v3;

  -[SearchUICollectionViewController contextInteraction](self, "contextInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseStandardSectionInsets
{
  return self->_shouldUseStandardSectionInsets;
}

- (int64_t)preferredPunchoutIndex
{
  return self->_preferredPunchoutIndex;
}

- (SearchUICommandDelegate)commandDelegate
{
  return (SearchUICommandDelegate *)objc_loadWeakRetained((id *)&self->_commandDelegate);
}

- (SearchUIResultsViewDelegate)resultsViewDelegate
{
  return (SearchUIResultsViewDelegate *)objc_loadWeakRetained((id *)&self->_resultsViewDelegate);
}

- (BOOL)isEntitySearch
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "sectionIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v6 = 1;
        v7 |= objc_msgSend(v10, "drawPlattersIfNecessary") ^ 1;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
    LOBYTE(v5) = v7 & v6;
  }

  return v5 & 1;
}

- (void)setCommandDelegate:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_commandDelegate, a3);
  -[SearchUICollectionViewController commandEnvironment](self, "commandEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewAttributes setCommandEnvironment:](self->_searchUIAttributes, "setCommandEnvironment:", v4);

}

- (void)setFocusableIndexPath:(id)a3
{
  NSIndexPath **p_focusableIndexPath;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSIndexPath *v13;
  id v14;

  v14 = a3;
  p_focusableIndexPath = &self->_focusableIndexPath;
  objc_storeStrong((id *)&self->_focusableIndexPath, a3);
  -[SearchUICollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC37E0];
    if (v8)
    {
      -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "focusSystemForEnvironment:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "requestFocusUpdateToEnvironment:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "requestFocusUpdateToEnvironment:", self);
    }
    objc_msgSend(v11, "updateFocusIfNeeded");

    v13 = *p_focusableIndexPath;
    *p_focusableIndexPath = 0;

  }
}

- (SearchUICollectionViewController)init
{
  SearchUICollectionViewController *v2;
  void *v3;
  SearchUICollectionViewLayout *v4;
  SearchUICollectionViewLayout *v5;
  SearchUICollectionView *v6;
  SearchUICollectionView *v7;
  void *v8;
  void *v9;
  void *v10;
  SearchUICollectionViewDataSource *v11;
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
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t, uint64_t, void *);
  void *v31;
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)SearchUICollectionViewController;
  v2 = -[SearchUIKeyboardableCollectionViewController init](&v34, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setContentInsetsReference:", 2);
    objc_initWeak(&location, v2);
    v4 = [SearchUICollectionViewLayout alloc];
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __40__SearchUICollectionViewController_init__block_invoke;
    v31 = &unk_1EA1F8160;
    objc_copyWeak(&v32, &location);
    v5 = -[SearchUICollectionViewLayout initWithSectionProvider:configuration:](v4, "initWithSectionProvider:configuration:", &v28, v3);
    -[SearchUICollectionViewLayout setSizingDelegate:](v5, "setSizingDelegate:", v2, v28, v29, v30, v31);
    v6 = [SearchUICollectionView alloc];
    v7 = -[SearchUICollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SearchUIKeyboardableCollectionViewController setCollectionView:](v2, "setCollectionView:", v7);
    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", 0);

    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setShouldBecomeFocusedOnSelection:", 1);

    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDelaysUserInitiatedItemSelection:", 1);

    v11 = -[SearchUICollectionViewDataSource initWithController:]([SearchUICollectionViewDataSource alloc], "initWithController:", v2);
    -[SearchUICollectionViewController setDataSource:](v2, "setDataSource:", v11);

    -[SearchUICollectionViewController dataSource](v2, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDataSource:", v12);

    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentInsetAdjustmentBehavior:", 1);

    -[SearchUICollectionViewController collectionView](v2, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

    -[SearchUICollectionViewController addOrbInteractionIfNeeded](v2, "addOrbInteractionIfNeeded");
    v16 = (void *)objc_opt_new();
    -[SearchUICollectionViewController setPotentiallyVisibleCells:](v2, "setPotentiallyVisibleCells:", v16);

    v17 = (void *)objc_opt_new();
    -[SearchUICollectionViewController setPotentiallyVisibleHeaders:](v2, "setPotentiallyVisibleHeaders:", v17);

    v18 = (void *)MEMORY[0x1E0DBD910];
    -[SearchUICollectionViewController view](v2, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bestAppearanceForView:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController searchUIAttributes](v2, "searchUIAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAppearance:", v20);

    -[SearchUICollectionViewController setIsVisibleFeedbackEnabled:](v2, "setIsVisibleFeedbackEnabled:", 1);
    -[SearchUICollectionViewController view](v2, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsGroupOpacity:", 0);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x100000, sel_skipDown);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWantsPriorityOverSystemBehavior:", 1);
    -[SearchUICollectionViewController addKeyCommand:](v2, "addKeyCommand:", v24);
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x100000, sel_skipUp);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWantsPriorityOverSystemBehavior:", 1);
    -[SearchUICollectionViewController addKeyCommand:](v2, "addKeyCommand:", v25);
    v26 = (void *)objc_opt_new();
    -[SearchUICollectionViewController setExpandedCollectionSections:](v2, "setExpandedCollectionSections:", v26);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)setIsVisibleFeedbackEnabled:(BOOL)a3
{
  self->_isVisibleFeedbackEnabled = a3;
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (void)setPotentiallyVisibleHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallyVisibleHeaders, a3);
}

- (void)setPotentiallyVisibleCells:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallyVisibleCells, a3);
}

- (void)setExpandedCollectionSections:(id)a3
{
  objc_storeStrong((id *)&self->_expandedCollectionSections, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (SearchUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SearchUICollectionViewController *v4;
  uint64_t v5;
  SearchUICollectionViewAttributes *searchUIAttributes;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewController;
  v4 = -[SearchUICollectionViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    searchUIAttributes = v4->_searchUIAttributes;
    v4->_searchUIAttributes = (SearchUICollectionViewAttributes *)v5;

    -[SearchUICollectionViewController commandEnvironment](v4, "commandEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewAttributes setCommandEnvironment:](v4->_searchUIAttributes, "setCommandEnvironment:", v7);

    -[SearchUICollectionViewAttributes setHeaderDelegate:](v4->_searchUIAttributes, "setHeaderDelegate:", v4);
    -[SearchUICollectionViewController setDragInteractionEnabled:](v4, "setDragInteractionEnabled:", 1);
    -[SearchUICollectionViewController setPreferredPunchoutIndex:](v4, "setPreferredPunchoutIndex:", -1);
  }
  return v4;
}

- (void)setPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndex = a3;
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
  self->_dragInteractionEnabled = a3;
}

- (void)addOrbInteractionIfNeeded
{
  void *v3;
  SearchUICollectionPeekDelegate *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchUICollectionViewController contextInteraction](self, "contextInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SearchUICollectionPeekDelegate initWithViewController:]([SearchUICollectionPeekDelegate alloc], "initWithViewController:", self);
    -[SearchUICollectionViewController setPeekDelegate:](self, "setPeekDelegate:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC36C0]);
    -[SearchUICollectionViewController peekDelegate](self, "peekDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDelegate:", v6);
    -[SearchUICollectionViewController setContextInteraction:](self, "setContextInteraction:", v7);

    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController contextInteraction](self, "contextInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addInteraction:", v8);

  }
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setPeekDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_peekDelegate, a3);
}

- (void)setContextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextInteraction, a3);
}

- (SearchUICollectionPeekDelegate)peekDelegate
{
  return self->_peekDelegate;
}

- (SearchUITableModel)tableModel
{
  return self->_tableModel;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)updateContentScrolledOffScreenStatus
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  id v9;

  -[SearchUICollectionViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentOffset");
      objc_msgSend(v9, "didUpdateContentScrolledOffScreenStatus:animated:", v8 > 0.5, 1);

    }
  }
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  if (self->_shouldUseInsetRoundedSections != a3)
  {
    self->_shouldUseInsetRoundedSections = a3;
    v4 = -[SearchUICollectionViewController shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections");
    -[SearchUICollectionViewController searchUIAttributes](self, "searchUIAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldUseInsetRoundedSections:", v4);

    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadModel");

  }
}

- (id)currentSnapshotLayoutConfiguration
{
  void *v2;
  void *v3;

  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSnapshotLayoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  -[SearchUICollectionViewController sizingDelegate](self, "sizingDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSizeDidChange:animated:", -[SearchUICollectionViewController collectionViewAnimating](self, "collectionViewAnimating"), width, height);

}

- (SearchUISizingDelegate)sizingDelegate
{
  return (SearchUISizingDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

- (BOOL)collectionViewAnimating
{
  return self->_collectionViewAnimating;
}

void __87__SearchUICollectionViewController_visibleViewsInPotentiallyVisibleViews_withinRegion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SearchUIAutoLayout view:isVisibleInBounds:ofView:](SearchUIAutoLayout, "view:isVisibleInBounds:ofView:", v6, v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (void)setRestorationContextClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (void)setFeedbackListener:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackListener, a3);
}

- (void)setViewDidUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewController;
  v4 = a3;
  -[SearchUIKeyboardableCollectionViewController scrollViewDidScroll:](&v9, sel_scrollViewDidScroll_, v4);
  objc_msgSend(v4, "panGestureRecognizer", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "velocityInView:", v4);
  v7 = v6;

  if (v7 != 0.0)
  {
    if (v7 <= 0.0)
      v8 = 11;
    else
      v8 = 10;
    -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", v8);
  }
  -[SearchUICollectionViewController updateContentScrolledOffScreenStatus](self, "updateContentScrolledOffScreenStatus");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUICollectionViewController;
  -[SearchUICollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
    -[SearchUICollectionViewController deselectSelectedRows](self, "deselectSelectedRows");
  -[SearchUICollectionViewController updateContentScrolledOffScreenStatus](self, "updateContentScrolledOffScreenStatus");
}

- (void)deselectSelectedRows
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v5, 1);

}

- (void)setTableModel:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  SearchUIDataSourceSnapshotBuilder *v10;
  void *v11;
  void *v12;
  SearchUIDataSourceSnapshotBuilder *v13;
  void *v14;
  SearchUITableModel *v15;

  v6 = a4;
  v15 = (SearchUITableModel *)a3;
  if (self->_tableModel != v15)
  {
    objc_storeStrong((id *)&self->_tableModel, a3);
    v9 = a5;
    v10 = [SearchUIDataSourceSnapshotBuilder alloc];
    -[SearchUICollectionViewController expandedSections](self, "expandedSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SearchUIDataSourceSnapshotBuilder initWithExpandedSections:expandedCollectionSections:](v10, "initWithExpandedSections:expandedCollectionSections:", v11, v12);

    -[SearchUIDataSourceSnapshotBuilder buildSnapshotFromTableModel:](v13, "buildSnapshotFromTableModel:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController updateWithSnapshot:animated:completion:](self, "updateWithSnapshot:animated:completion:", v14, v6, v9);

  }
}

- (NSMutableSet)expandedCollectionSections
{
  return self->_expandedCollectionSections;
}

- (id)viewDidUpdateHandler
{
  return self->viewDidUpdateHandler;
}

- (id)viewWillUpdateHandler
{
  return self->viewWillUpdateHandler;
}

- (void)updateWithSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  id v21;

  v6 = a4;
  v21 = a3;
  v8 = a5;
  if (!-[SearchUICollectionViewController updateMustAccountForLayout](self, "updateMustAccountForLayout"))
  {
    -[SearchUICollectionViewController viewWillUpdateHandler](self, "viewWillUpdateHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SearchUICollectionViewController viewWillUpdateHandler](self, "viewWillUpdateHandler");
      v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v10[2]();

    }
  }
  objc_msgSend(v21, "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v21, "sectionIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itemIdentifiersInSectionWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "cardSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v14) = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
      -[SearchUICollectionViewController setShouldUseInsetRoundedSections:](self, "setShouldUseInsetRoundedSections:", 0);

  }
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 1);
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWithSnapshot:animated:completion:", v21, v6, v8);

  if (!-[SearchUICollectionViewController updateMustAccountForLayout](self, "updateMustAccountForLayout"))
  {
    -[SearchUICollectionViewController viewDidUpdateHandler](self, "viewDidUpdateHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[SearchUICollectionViewController viewDidUpdateHandler](self, "viewDidUpdateHandler");
      v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v20[2]();

    }
  }

}

- (void)setLastVisibleFeedbackTrigger:(unint64_t)a3
{
  self->_lastVisibleFeedbackTrigger = a3;
}

- (void)setTableModel:(id)a3 animated:(BOOL)a4
{
  -[SearchUICollectionViewController setTableModel:animated:completion:](self, "setTableModel:animated:completion:", a3, a4, 0);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a6;
  v10 = a5;
  +[SearchUISupplementaryIdentifiers sectionHeaderKind](SearchUISupplementaryIdentifiers, "sectionHeaderKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    -[SearchUICollectionViewController potentiallyVisibleHeaders](self, "potentiallyVisibleHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v9);

  }
}

- (void)setFooterView:(id)a3
{
  UIView *v5;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      -[SearchUICollectionViewController dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerFooterView:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0DC3370];
      objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sizeWithWidthDimension:heightDimension:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v15, v11, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBoundarySupplementaryItems:", v17);

    }
    else
    {
      objc_msgSend(v8, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
    }
    objc_storeStrong((id *)&self->_footerView, a3);
    objc_msgSend(v7, "setConfiguration:", v9);

  }
  -[SearchUICollectionViewController searchUIAttributes](self, "searchUIAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHasFooter:", v5 != 0);

}

- (void)setResultsViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsViewDelegate, a3);
}

- (id)cellForRowModel:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowModel:atIndexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[SearchUICollectionViewController isActiveRunningShortcutForIndexPath:](self, "isActiveRunningShortcutForIndexPath:", v6);
  if ((_DWORD)v7)
  {
    -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateSourceView:", v13);

    }
  }
  return v9;
}

- (BOOL)isActiveRunningShortcutForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemIdentifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "cardSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "command");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "voiceShortcutIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController activeVoiceShortcutIdentifier](self, "activeVoiceShortcutIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFWorkflowRunViewSource)activeRunViewSource
{
  return self->_activeRunViewSource;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  +[SearchUIAppEntityAnnotator registerCollectionViewController:](SearchUIAppEntityAnnotator, "registerCollectionViewController:", self);
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionViewController;
  -[SearchUICollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  -[SearchUICollectionViewController sendVisibleFeedbackIfNecessary](self, "sendVisibleFeedbackIfNecessary");
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a6;
  v8 = a5;
  +[SearchUISupplementaryIdentifiers sectionHeaderKind](SearchUISupplementaryIdentifiers, "sectionHeaderKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    -[SearchUICollectionViewController potentiallyVisibleHeaders](self, "potentiallyVisibleHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  id v15;

  v15 = a4;
  v7 = a5;
  -[SearchUICollectionViewController potentiallyVisibleCells](self, "potentiallyVisibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "embeddedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v15, "embeddedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginAppearanceTransition:animated:", 1, 0);
      -[SearchUICollectionViewController addChildViewController:](self, "addChildViewController:", v10);
      objc_msgSend(v10, "didMoveToParentViewController:", self);
      objc_msgSend(v10, "endAppearanceTransition");

    }
  }
  objc_msgSend(v15, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowsAppEntityAnnotation");

  if (!v12
    || (objc_msgSend(v15, "rowModel"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = +[SearchUIAppEntityAnnotator annotateView:withRowModel:](SearchUIAppEntityAnnotator, "annotateView:withRowModel:", v15, v13), v13, !v14))
  {
    +[SearchUIAppEntityAnnotator resetAnnotationForView:](SearchUIAppEntityAnnotator, "resetAnnotationForView:", v15);
  }

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned __int8 isKindOfClass;
  void *v5;
  void *v6;
  objc_super v8;

  if (sel_copy_ == a3)
  {
    -[SearchUICollectionViewController preferredFocusSystem](self, "preferredFocusSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUICollectionViewController;
    isKindOfClass = -[SearchUICollectionViewController canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return isKindOfClass & 1;
}

- (void)copy:(id)a3
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICollectionViewController preferredFocusSystem](self, "preferredFocusSystem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController commandEnvironment](self, "commandEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v33[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setItemProviders:", v10);

  }
  else
  {
    objc_msgSend(v5, "rowModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cardSection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "previewButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      goto LABEL_4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "rowModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cardSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewButtonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v10);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "command");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v22, "command");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SearchUICollectionViewController commandEnvironment](self, "commandEnvironment");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[SearchUICommandHandler handlerForCommand:environment:](SearchUICommandHandler, "handlerForCommand:environment:", v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "executeWithTriggerEvent:", 18);

            }
          }
        }
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }
  }

LABEL_4:
}

- (void)skipDown
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[SearchUICollectionViewController preferredFocusSystem](self, "preferredFocusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v4)
  {
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfSections");

    if (v14 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController setFocusableIndexPath:](self, "setFocusableIndexPath:", v6);
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[SearchUICollectionViewController indexPathForFocusView:](self, "indexPathForFocusView:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "section") + 1;
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfSections");

    if (v7 < v10)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v6, "section") + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController scrollAndFocusAtIndexPath:](self, "scrollAndFocusAtIndexPath:", v11);

    }
  }
LABEL_8:

}

- (void)skipUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[SearchUICollectionViewController preferredFocusSystem](self, "preferredFocusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v9 = objc_claimAutoreleasedReturnValue();

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)v9;
  if ((void *)v9 != v4)
  {
    -[SearchUICollectionViewController indexPathForFocusView:](self, "indexPathForFocusView:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "section") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v7, "section") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController scrollAndFocusAtIndexPath:](self, "scrollAndFocusAtIndexPath:", v8);

    }
    v5 = (void *)v9;
  }

}

- (id)indexPathForFocusView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4)
  {
    if (v5 != v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (-[SearchUICollectionViewController collectionView](self, "collectionView"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "indexPathForCell:", v4),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            !v6))
      {
        objc_msgSend(v4, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewController indexPathForFocusView:](self, "indexPathForFocusView:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v6;
}

- (void)scrollAndFocusAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 4, 0);

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 4, 0);

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[SearchUICollectionViewController setFocusableIndexPath:](self, "setFocusableIndexPath:", v8);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUICollectionViewController;
  -[SearchUICollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SearchUICollectionViewController resetVisibleFeedback](self, "resetVisibleFeedback");
}

- (void)updateWithCardSection:(id)a3
{
  id v4;

  +[SearchUITableModel tableModelWithCardSections:isInline:queryId:](SearchUITableModel, "tableModelWithCardSections:isInline:queryId:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController updateWithTableModel:](self, "updateWithTableModel:", v4);

}

- (void)updateWithResultSections:(id)a3
{
  id v4;

  +[SearchUITableModel tableModelWithSections:expandedSections:expandedCollectionCardSections:](SearchUITableModel, "tableModelWithSections:expandedSections:expandedCollectionCardSections:", a3, 0, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController updateWithTableModel:](self, "updateWithTableModel:", v4);

}

- (void)updateWithTableModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "buildSnapshotFromTableModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController updateWithSnapshot:](self, "updateWithSnapshot:", v5);
}

- (void)shortcutDidEnd:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SearchUICommandHandlerShortcutDidEndNotification"), v7);

  -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v5)
  {
    -[SearchUICollectionViewController setActiveRunViewSource:](self, "setActiveRunViewSource:", 0);
    -[SearchUICollectionViewController setActiveVoiceShortcutIdentifier:](self, "setActiveVoiceShortcutIdentifier:", 0);
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a4;
  v7 = a5;
  -[SearchUICollectionViewController potentiallyVisibleCells](self, "potentiallyVisibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v17);

  if (v10)
  {
    -[SearchUICollectionViewController potentiallyVisibleCells](self, "potentiallyVisibleCells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "embeddedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v17, "embeddedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beginAppearanceTransition:animated:", 0, 0);
      objc_msgSend(v13, "willMoveToParentViewController:", 0);
      objc_msgSend(v13, "removeFromParentViewController");
      objc_msgSend(v13, "endAppearanceTransition");

    }
  }
  if (-[SearchUICollectionViewController isActiveRunningShortcutForIndexPath:](self, "isActiveRunningShortcutForIndexPath:", v7))
  {
    -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateSourceView:", 0);

    }
  }
  +[SearchUIAppEntityAnnotator resetAnnotationForView:](SearchUIAppEntityAnnotator, "resetAnnotationForView:", v17);

}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  double v6;
  uint64_t v7;

  objc_msgSend(a4, "_panGestureVelocityInView:", a3);
  if (v6 != 0.0)
  {
    if (v6 <= 0.0)
      v7 = 17;
    else
      v7 = 16;
    -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", v7);
  }
}

- (BOOL)canHighlightRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController commandEnvironment](self, "commandEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SearchUICommandHandler hasValidHandlerForRowModel:environment:](SearchUICommandHandler, "hasValidHandlerForRowModel:environment:", v6, v9))
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v8, "needsInternalFocus");
  }

  return v10;
}

- (void)scrollAndSelectLastSelectedIndexPath
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
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
  dispatch_time_t v20;
  _QWORD block[5];

  -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifierForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SearchUICollectionViewController doesIndexPathExist:](self, "doesIndexPathExist:", v8);

      if (v9)
      {
        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutIfNeeded");

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 18);

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "layoutIfNeeded");

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scrollToItemAtIndexPath:atScrollPosition:animated:", v15, 18, 0);

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "layoutIfNeeded");

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, 18);

        -[SearchUICollectionViewController collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layoutBelowIfNeeded");

        v20 = dispatch_time(0, 250000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__SearchUICollectionViewController_scrollAndSelectLastSelectedIndexPath__block_invoke;
        block[3] = &unk_1EA1F62F0;
        block[4] = self;
        dispatch_after(v20, MEMORY[0x1E0C80D38], block);
      }
    }
  }
}

uint64_t __72__SearchUICollectionViewController_scrollAndSelectLastSelectedIndexPath__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "lastSelectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "doesIndexPathExist:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastSelectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v5, 1);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setLastSelectedIndexPath:", 0);
}

- (BOOL)doesIndexPathExist:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && (v7 = objc_msgSend(v5, "numberOfSections"), v7 > objc_msgSend(v4, "section")))
  {
    v8 = objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
    v9 = v8 > objc_msgSend(v4, "item");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setRestorationContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "lastSelectedIndexPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController setLastSelectedIndexPath:](self, "setLastSelectedIndexPath:", v4);

}

- (id)restorationContext
{
  void *v3;
  void *v4;

  if (!-[SearchUICollectionViewController restorationContextClass](self, "restorationContextClass"))
    objc_opt_class();
  v3 = (void *)objc_opt_new();
  -[SearchUICollectionViewController lastSelectedIndexPath](self, "lastSelectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastSelectedIndexPath:", v4);

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a4;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController commandEnvironmentForIndexPath:](self, "commandEnvironmentForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController setLastSelectedIndexPath:](self, "setLastSelectedIndexPath:", v5);
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v21, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "command");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else if (objc_msgSend(v10, "needsInternalFocus"))
  {
    objc_msgSend(v10, "returnKeyPressed");
    goto LABEL_11;
  }
  objc_msgSend(v21, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "command");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "voiceShortcutIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController setActiveVoiceShortcutIdentifier:](self, "setActiveVoiceShortcutIdentifier:", v14);

    v15 = objc_alloc(MEMORY[0x1E0DC7E70]);
    objc_msgSend(v7, "sourceView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithView:", v17);
    -[SearchUICollectionViewController setActiveRunViewSource:](self, "setActiveRunViewSource:", v18);

    -[SearchUICollectionViewController activeRunViewSource](self, "activeRunViewSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performSelector:withObject:", sel_setRunViewSource_, v19);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_shortcutDidEnd_, CFSTR("SearchUICommandHandlerShortcutDidEndNotification"), 0);

  }
  objc_msgSend(v8, "executeWithTriggerEvent:", 2);
  if (objc_msgSend(v8, "shouldDeselectAfterExecution"))
    -[SearchUICollectionViewController deselectSelectedRows](self, "deselectSelectedRows");

LABEL_11:
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  _BOOL8 v6;
  BOOL v7;

  v5 = a4;
  v6 = -[SearchUICollectionViewController canHighlightRowAtIndexPath:](self, "canHighlightRowAtIndexPath:", v5);
  v7 = v6;
  -[SearchUICollectionViewController setSectionBackgroundHighlighted:indexPath:](self, "setSectionBackgroundHighlighted:indexPath:", v6, v5);

  return v7;
}

- (void)setSectionBackgroundHighlighted:(BOOL)a3 indexPath:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "searchui_focusStyle") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v11, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_visibleSupplementaryViewOfKind:atIndexPath:", CFSTR("SearchUIBackgroundReuseIdentifer"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "setHighlighted:", v4);
    }

  }
}

- (void)setTableModelWithoutReset:(id)a3
{
  objc_storeStrong((id *)&self->_tableModel, a3);
}

- (void)setTableModel:(id)a3
{
  -[SearchUICollectionViewController setTableModel:animated:](self, "setTableModel:animated:", a3, 0);
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_inPreviewPlatter != a3)
  {
    v3 = a3;
    self->_inPreviewPlatter = a3;
    -[SearchUICollectionViewController searchUIAttributes](self, "searchUIAttributes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInPreviewPlatter:", v3);

  }
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  if (self->_shouldUseStandardSectionInsets != a3)
  {
    self->_shouldUseStandardSectionInsets = a3;
    -[SearchUICollectionViewController invalidateLayout](self, "invalidateLayout");
  }
}

- (void)invalidateLayout
{
  void *v3;
  void *v4;
  id v5;

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (BOOL)updateMustAccountForLayout
{
  return 0;
}

- (void)updateWithSnapshot:(id)a3
{
  -[SearchUICollectionViewController updateWithSnapshot:animated:completion:](self, "updateWithSnapshot:animated:completion:", a3, 0, 0);
}

- (void)purgeMemory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUICollectionViewController setTableModel:](self, "setTableModel:", 0);
    -[SearchUICollectionViewController updateWithSnapshot:](self, "updateWithSnapshot:", 0);
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_purgeReuseQueues");

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SearchUICollectionViewController childViewControllers](self, "childViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "beginAppearanceTransition:animated:", 0, 0);
        objc_msgSend(v11, "willMoveToParentViewController:", 0);
        objc_msgSend(v11, "removeFromParentViewController");
        objc_msgSend(v11, "endAppearanceTransition");
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeFromSuperview");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (-[SearchUICollectionViewController threeDTouchEnabled](self, "threeDTouchEnabled"))
  {
    -[SearchUICollectionViewController setThreeDTouchEnabled:](self, "setThreeDTouchEnabled:", 0);
    -[SearchUICollectionViewController setThreeDTouchEnabled:](self, "setThreeDTouchEnabled:", 1);
  }
  -[SearchUICollectionViewController potentiallyVisibleHeaders](self, "potentiallyVisibleHeaders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[SearchUICollectionViewController potentiallyVisibleCells](self, "potentiallyVisibleCells");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[SearchUICollectionViewController resetVisibleFeedback](self, "resetVisibleFeedback");
  +[SearchUIUtilities purgeMemory](SearchUIUtilities, "purgeMemory");

}

- (void)resetVisibleFeedback
{
  -[SearchUICollectionViewController setLatestVisibleResultsAccountedForInFeedback:](self, "setLatestVisibleResultsAccountedForInFeedback:", 0);
  -[SearchUICollectionViewController setLatestVisibleCardSectionsAccountedForInFeedback:](self, "setLatestVisibleCardSectionsAccountedForInFeedback:", 0);
  -[SearchUICollectionViewController setLatestVisibleSectionHeadersAccountedForInFeedback:](self, "setLatestVisibleSectionHeadersAccountedForInFeedback:", 0);
}

- (id)preferredFocusSystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC37E0];
  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "focusSystemForEnvironment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusSystemForEnvironment:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v4;
  NSIndexPath *v5;
  NSIndexPath *focusableIndexPath;

  -[SearchUICollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = self->_focusableIndexPath;
  focusableIndexPath = self->_focusableIndexPath;
  self->_focusableIndexPath = 0;

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionViewController;
  -[SearchUICollectionViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didUpdateContentScrolledOffScreenStatus:animated:", 0, 1);

  }
}

- (id)viewForRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)scrollRowModelToVisible:(id)a3
{
  void *v4;
  id v5;

  -[SearchUICollectionViewController viewForRowModel:](self, "viewForRowModel:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "scrollRectToVisible:animated:", 0);

  }
}

- (id)commandEnvironmentForIndexPath:(id)a3
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
  -[SearchUICollectionViewController commandEnvironment](self, "commandEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastEngagedSection:", v7);

    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceView:", v9);

    objc_msgSend(v5, "lastEngagedSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "section");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resultSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSectionTitle:", v13);

  }
  return v5;
}

- (void)resignTextField
{
  id v2;

  -[SearchUIKeyboardableCollectionViewController textField](self, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)showViewController:(id)a3
{
  -[SearchUICollectionViewController showViewController:sender:](self, "showViewController:sender:", a3, 0);
}

- (void)updateTableForNewCellHeightAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v6 = v3 & v5;
  -[SearchUICollectionViewController setCollectionViewAnimating:](self, "setCollectionViewAnimating:", v6);
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v6);
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke;
  v8[3] = &unk_1EA1F62F0;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke_2;
  v7[3] = &unk_1EA1F62F0;
  +[SearchUIUtilities performAnimatableChanges:animated:completion:](SearchUIUtilities, "performAnimatableChanges:animated:completion:", v8, 1, v7);
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v5);
}

void __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidationContextForRefreshingVisibleElementAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayoutWithContext:", v6);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

uint64_t __72__SearchUICollectionViewController_updateTableForNewCellHeightAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCollectionViewAnimating:", 0);
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];

  v4 = a4;
  v6 = a3;
  -[SearchUICollectionViewController updateTableForNewCellHeightAnimated:](self, "updateTableForNewCellHeightAnimated:", v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SearchUICollectionViewController_cardSectionViewDidInvalidateSize_animate___block_invoke;
  v10[3] = &unk_1EA1F62F0;
  v10[4] = self;
  +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v10);
  -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewDidInvalidateSize:animate:", v6, v4);

  }
}

void __77__SearchUICollectionViewController_cardSectionViewDidInvalidateSize_animate___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)removeRowModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 1);
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeRowModel:completion:", v7, v6);

}

- (void)removeSectionContainingRowModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 1);
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSectionContaining:completion:", v7, v6);

}

- (void)removeSectionModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", 1);
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSectionModel:completion:", v7, v6);

}

- (void)updateViewControllerTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICollectionViewController parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)performScrollTestWithCompletion:(id)a3
{
  -[SearchUICollectionViewController performScrollTestWithHandlerForFirstScrollCompletion:completion:](self, "performScrollTestWithHandlerForFirstScrollCompletion:completion:", 0, a3);
}

- (void)performScrollTestWithHandlerForFirstScrollCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[SearchUICollectionViewController setScrollTester:](self, "setScrollTester:", v8);

  -[SearchUICollectionViewController scrollTester](self, "scrollTester");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performScrollTestOnTableView:firstScroll:completion:", v9, v7, v6);

}

- (void)performRecapScrollTestWithTestName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D83C80], "isRecapAvailable"))
  {
    v8 = objc_alloc(MEMORY[0x1E0D83C68]);
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__SearchUICollectionViewController_performRecapScrollTestWithTestName_completion___block_invoke;
    v12[3] = &unk_1EA1F6DA8;
    v13 = v7;
    v10 = (void *)objc_msgSend(v8, "initWithTestName:scrollView:completionHandler:", v6, v9, v12);

    objc_msgSend(v10, "scrollingContentLength");
    objc_msgSend(v10, "setScrollingContentLength:", v11 + v11);
    objc_msgSend(MEMORY[0x1E0D83C80], "runTestWithParameters:", v10);

  }
}

uint64_t __82__SearchUICollectionViewController_performRecapScrollTestWithTestName_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)numberOfSections
{
  void *v3;
  void *v4;
  int64_t v5;

  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "numberOfSectionsInCollectionView:", v4);

  return v5;
}

- (void)iterateIndexPaths:(id)a3
{
  void (**v4)(id, void *, void *, void *, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, void *, void *))a3;
  if (v4)
  {
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v6;
    objc_msgSend(v6, "sectionIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v23)
    {
      v21 = *(_QWORD *)v32;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(obj);
          v24 = v7;
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
          objc_msgSend(v22, "itemIdentifiersInSectionWithIdentifier:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v25 = v8;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v28;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v28 != v11)
                  objc_enumerationMutation(v25);
                v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
                -[SearchUICollectionViewController dataSource](self, "dataSource");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "indexPathForItemIdentifier:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v26, "section");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "resultSection");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "identifyingResult");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "cardSection");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v4[2](v4, v17, v18, v19, v15);

                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v10);
          }

          v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v23);
    }

  }
}

- (void)toggleShowMoreForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewController scrollToIndexPath:](self, "scrollToIndexPath:");
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    objc_msgSend(v6, "sectionIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICollectionViewController toggleExpansionForSectionModel:](self, "toggleExpansionForSectionModel:", v10);
  }

}

- (CGRect)scrollToIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = a3;
  -[SearchUICollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 0, 0);

  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)tapAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifierForIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);

    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICollectionViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v7, v8);

  }
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[SearchUICollectionViewController addOrbInteractionIfNeeded](self, "addOrbInteractionIfNeeded");
  }
  else
  {
    -[SearchUICollectionViewController contextInteraction](self, "contextInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SearchUICollectionViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICollectionViewController contextInteraction](self, "contextInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeInteraction:", v6);

      -[SearchUICollectionViewController setPeekDelegate:](self, "setPeekDelegate:", 0);
      -[SearchUICollectionViewController setContextInteraction:](self, "setContextInteraction:", 0);
    }
  }
}

- (id)expandedSections
{
  return 0;
}

- (void)performExpansion:(BOOL)a3 withSection:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v4 = a3;
  v6 = a4;
  if (v4)
    v7 = 3;
  else
    v7 = 6;
  -[SearchUICollectionViewController setLastVisibleFeedbackTrigger:](self, "setLastVisibleFeedbackTrigger:", v7);
  if (v6)
  {
    objc_msgSend(v6, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[SearchUICollectionViewController resultsViewDelegate](self, "resultsViewDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didChangeExpansionStateForSection:expanded:", v9, v4);

      }
    }
    v13 = (void *)MEMORY[0x1E0CB36B0];
    -[SearchUICollectionViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForRow:inSection:", 0, objc_msgSend(v15, "indexOfSectionIdentifier:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICollectionViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForItemAtIndexPath:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isExpandable"))
    {
      objc_msgSend(v18, "updateExpanded:animated:", v4, 1);
      -[SearchUICollectionViewController updateTableForNewCellHeightAnimated:](self, "updateTableForNewCellHeightAnimated:", 1);
    }
    else
    {
      objc_initWeak(&location, self);
      -[SearchUICollectionViewController tableModelForExpansion](self, "tableModelForExpansion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke;
      v23 = &unk_1EA1F8030;
      objc_copyWeak(&v26, &location);
      v24 = v6;
      v25 = v16;
      -[SearchUICollectionViewController setTableModel:animated:completion:](self, "setTableModel:animated:completion:", v19, 1, &v20);

      -[SearchUICollectionViewController didToggleExpansion](self, "didToggleExpansion", v20, v21, v22, v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }

  }
}

void __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "indexOfSectionIdentifier:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v3, "numberOfItemsInSection:", *(_QWORD *)(a1 + 32)))
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, objc_msgSend(*(id *)(a1 + 40), "section"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke_2;
      v14[3] = &unk_1EA1F6518;
      v15 = v8;
      v10 = v3;
      v16 = v10;
      v17 = v6;
      v11 = v6;
      v12 = v8;
      objc_msgSend(v9, "performWithoutAnimation:", v14);

      ++v4;
    }
    while (v4 < objc_msgSend(v10, "numberOfItemsInSection:", *(_QWORD *)(a1 + 32)));
  }

}

void __65__SearchUICollectionViewController_performExpansion_withSection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "sectionIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 48), "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithRowModel:", v6);

}

- (BOOL)isExpandedForSectionModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionSection");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v9;
    LOBYTE(v11) = objc_msgSend(v7, "containsObject:", v9);

    goto LABEL_6;
  }
  objc_msgSend(v4, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SearchUICollectionViewController expandedSections](self, "expandedSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultSection");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return (char)v11;
}

- (void)toggleExpansionForSectionModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    -[SearchUICollectionViewController expandedCollectionSections](self, "expandedCollectionSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "removeObject:", v7);
    else
      objc_msgSend(v10, "addObject:", v7);

    -[SearchUICollectionViewController performExpansion:withSection:](self, "performExpansion:withSection:", v9 ^ 1u, v12);
  }

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SearchUICollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isFocusable");
  return (char)v5;
}

- (void)didUpdateKeyboardFocusToResult:(id)a3 cardSection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUIKeyboardableCollectionViewController interactionDelegate](self, "interactionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didUpdateKeyboardFocusToResult:cardSection:", v10, v6);

  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (-[SearchUICollectionViewController forwardFeedbackForSelector:](self, "forwardFeedbackForSelector:"))
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICollectionViewController;
    -[SearchUICollectionViewController forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)lockupViewForAppIdentifier:(id)a3 didFailRequestWithError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lockupViewForAppIdentifier:didFailRequestWithError:", v10, v6);

  }
}

- (void)lockupViewEngagedForAppIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockupViewEngagedForAppIdentifier:", v7);

  }
}

- (void)lockupViewForAppIdentifier:(id)a3 didChangeState:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUICollectionViewController feedbackListener](self, "feedbackListener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lockupViewForAppIdentifier:didChangeState:", v10, v6);

  }
}

- (void)setViewWillUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void)setCardViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewDelegate, a3);
}

- (BOOL)dragInteractionEnabled
{
  return self->_dragInteractionEnabled;
}

- (BOOL)inPreviewPlatter
{
  return self->_inPreviewPlatter;
}

- (NSIndexPath)focusableIndexPath
{
  return self->_focusableIndexPath;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (Class)restorationContextClass
{
  return (Class)objc_getProperty(self, a2, 1168, 1);
}

- (void)setCollectionViewAnimating:(BOOL)a3
{
  self->_collectionViewAnimating = a3;
}

- (NSString)activeVoiceShortcutIdentifier
{
  return self->_activeVoiceShortcutIdentifier;
}

- (void)setActiveVoiceShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeVoiceShortcutIdentifier, a3);
}

- (void)setActiveRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_activeRunViewSource, a3);
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (TLKTableViewScrollTester)scrollTester
{
  return self->_scrollTester;
}

- (void)setScrollTester:(id)a3
{
  objc_storeStrong((id *)&self->_scrollTester, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollTester, 0);
  objc_storeStrong((id *)&self->_searchUIAttributes, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_activeRunViewSource, 0);
  objc_storeStrong((id *)&self->_activeVoiceShortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_latestVisibleSectionHeadersAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_potentiallyVisibleHeaders, 0);
  objc_storeStrong((id *)&self->_latestVisibleCardSectionsAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_latestVisibleResultsAccountedForInFeedback, 0);
  objc_storeStrong((id *)&self->_potentiallyVisibleCells, 0);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
  objc_storeStrong((id *)&self->_peekDelegate, 0);
  objc_storeStrong((id *)&self->_restorationContextClass, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_expandedCollectionSections, 0);
  objc_storeStrong((id *)&self->_focusableIndexPath, 0);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableModel, 0);
  objc_destroyWeak((id *)&self->_cardViewDelegate);
  objc_destroyWeak((id *)&self->_feedbackListener);
  objc_destroyWeak((id *)&self->_commandDelegate);
  objc_storeStrong(&self->viewDidUpdateHandler, 0);
  objc_storeStrong(&self->viewWillUpdateHandler, 0);
}

@end
