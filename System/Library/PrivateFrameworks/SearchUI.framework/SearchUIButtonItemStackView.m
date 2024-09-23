@implementation SearchUIButtonItemStackView

- (SearchUIButtonItemStackView)init
{
  SearchUIButtonItemStackView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemStackView;
  v2 = -[SearchUIButtonItemStackView init](&v5, sel_init);
  if (v2)
  {
    +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v2);
    -[SearchUIButtonItemStackView setIsCompact:](v2, "setIsCompact:", 0);
    -[SearchUIButtonItemStackView layer](v2, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

    -[SearchUIButtonItemStackView setCountMoreButtonTowardsMaxCount:](v2, "setCountMoreButtonTowardsMaxCount:", 1);
  }
  return v2;
}

- (void)setIsCompact:(BOOL)a3
{
  double v5;
  int v6;
  int v7;
  _QWORD v8[4];
  BOOL v9;

  self->_isCompact = a3;
  v5 = 8.0;
  if (!a3)
  {
    v6 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS", 8.0);
    v5 = 10.0;
    if (v6)
    {
      v7 = TLKSnippetModernizationEnabled();
      v5 = 10.0;
      if (v7)
        v5 = 8.0;
    }
  }
  -[NUIContainerStackView setSpacing:](self, "setSpacing:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SearchUIButtonItemStackView_setIsCompact___block_invoke;
  v8[3] = &__block_descriptor_33_e42_v16__0__SearchUIButtonItemViewController_8l;
  v9 = a3;
  -[SearchUIButtonItemStackView enumerateCachedViewControllersUsingBlock:](self, "enumerateCachedViewControllersUsingBlock:", v8);
}

uint64_t __44__SearchUIButtonItemStackView_setIsCompact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsCompact:", *(unsigned __int8 *)(a1 + 32));
}

- (void)enumerateCachedViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SearchUIButtonItemStackView buttonItemViewControllersForClassNames](self, "buttonItemViewControllersForClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              v4[2](v4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v14);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

}

- (void)updateWithButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 buttonItemViewType:(unint64_t)a5 rowModel:(id)a6 feedbackDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, char);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[SearchUIButtonItemStackView buttonItems](self, "buttonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isEqualToArray:", v15);

  if ((v16 & 1) == 0)
  {
    -[SearchUIButtonItemStackView setButtonItems:](self, "setButtonItems:", v12);
    -[SearchUIButtonItemStackView setHidden:](self, "setHidden:", objc_msgSend(v12, "count") == 0);
    -[SearchUIButtonItemStackView setButtonItemFactory:](self, "setButtonItemFactory:", 0);
    if (objc_msgSend(v12, "count"))
    {
      -[SearchUIButtonItemStackView enumerateCachedViewControllersUsingBlock:](self, "enumerateCachedViewControllersUsingBlock:", &__block_literal_global_23);
      -[SearchUIButtonItemStackView setHasLeftMainThread:](self, "setHasLeftMainThread:", 0);
      -[SearchUIButtonItemStackView setAlpha:](self, "setAlpha:", 0.0);
      objc_initWeak(&location, self);
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setDelegate:", self);
      objc_msgSend(v17, "setFeedbackDelegate:", v14);
      objc_msgSend(v17, "setCountMoreButtonTowardsMaxCount:", -[SearchUIButtonItemStackView countMoreButtonTowardsMaxCount](self, "countMoreButtonTowardsMaxCount"));
      -[SearchUIButtonItemStackView setIsDoneUpdating:](self, "setIsDoneUpdating:", 0);
      v18 = -[SearchUIButtonItemStackView shouldReverseButtonOrder](self, "shouldReverseButtonOrder");
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_2;
      v22 = &unk_1EA1F7B48;
      objc_copyWeak(v26, &location);
      v23 = v12;
      v24 = v13;
      v25 = v14;
      v26[1] = (id)a5;
      objc_msgSend(v17, "fetchSearchUIButtonitemsWithSFButtonItems:maxButtonItems:shouldReverseButtonOrder:completion:", v23, a4, v18, &v19);
      -[SearchUIButtonItemStackView setHasLeftMainThread:](self, "setHasLeftMainThread:", 1, v19, v20, v21, v22);
      -[SearchUIButtonItemStackView setButtonItemFactory:](self, "setButtonItemFactory:", v17);

      objc_destroyWeak(v26);
      objc_destroyWeak(&location);
    }
  }

}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[2];
  char v15;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_3;
  v9[3] = &unk_1EA1F7B20;
  objc_copyWeak(v14, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 32);
  v6 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(void **)(a1 + 64);
  v13 = v7;
  v14[1] = v8;
  v15 = a3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v9);

  objc_destroyWeak(v14);
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  _BOOL8 v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "buttonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToArray:", v4);

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)objc_msgSend(v5, "searchUI_viewControllerClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "buttonItemViewControllersForClassNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(WeakRetained, "setButtonItemViewControllersForClassNames:", v8);

    }
    objc_msgSend(WeakRetained, "buttonItemViewControllersForClassNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v13 = v12;

    v14 = *(void **)(a1 + 40);
    v15 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_4;
    v34[3] = &unk_1EA1F7AF8;
    v16 = v13;
    v35 = v16;
    v36 = WeakRetained;
    v37 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 72);
    v38 = v17;
    v39 = v18;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v34);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = *(id *)(a1 + 32);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v19);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_searchUIButtonItemGeneratorClass");
          if (v23 == objc_opt_class())
          {
            LODWORD(v20) = 1;
            goto LABEL_17;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (v20)
          continue;
        break;
      }
LABEL_17:
      v15 = MEMORY[0x1E0C809B0];
    }

    objc_msgSend(WeakRetained, "buttonItemStackViewDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(WeakRetained, "buttonItemStackViewDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didUpdateWithButtonItems:isFinalUpdate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));

    }
    if (((*(_BYTE *)(a1 + 80) == 0) & ~(_DWORD)v20) != 0)
    {
      v27 = 0;
    }
    else
    {
      v26 = objc_msgSend(WeakRetained, "hasLeftMainThread");
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_5;
      v29[3] = &unk_1EA1F62F0;
      v29[4] = WeakRetained;
      objc_msgSend(MEMORY[0x1E0DBDA48], "performAnimatableChanges:animated:", v29, v26 & (v20 ^ 1));
      v27 = *(_BYTE *)(a1 + 80) != 0;
    }
    objc_msgSend(WeakRetained, "setIsDoneUpdating:", v27);
    if (v6)
    {
      objc_msgSend(WeakRetained, "buttonItemViewControllersForClassNames");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, v6);

      objc_msgSend(WeakRetained, "setCurrentButtonItemViewControllers:", v16);
    }

  }
}

void __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3
    || (objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[SearchUIButtonItemViewController buttonItemViewControllerForButtonItem:](SearchUIButtonItemViewController, "buttonItemViewControllerForButtonItem:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v7);

  }
  objc_msgSend(v5, "setRowModel:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setFeedbackDelegate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setIsCompact:", objc_msgSend(*(id *)(a1 + 40), "isCompact"));
  objc_msgSend(v5, "updateWithButtonItem:buttonItemViewType:", v14, *(_QWORD *)(a1 + 64));
  if (objc_msgSend(v14, "isOverflowButton"))
    v8 = 1000.0;
  else
    v8 = 250.0;
  objc_msgSend(v5, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = v8;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v10);

  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v8;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

  objc_msgSend(v5, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

}

uint64_t __113__SearchUIButtonItemStackView_updateWithButtonItems_maxButtonItems_buttonItemViewType_rowModel_feedbackDelegate___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (id)viewForButtonItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SearchUIButtonItemStackView_viewForButtonItem___block_invoke;
  v8[3] = &unk_1EA1F7B70;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SearchUIButtonItemStackView enumerateCachedViewControllersUsingBlock:](self, "enumerateCachedViewControllersUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__SearchUIButtonItemStackView_viewForButtonItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "buttonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v8, "view");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)buttonTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SearchUIButtonItemStackView currentButtonItemViewControllers](self, "currentButtonItemViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isHidden");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "buttonItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", objc_opt_class());

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)deviceIsAuthenticated
{
  return +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", self);
}

- (BOOL)shouldReverseButtonOrder
{
  return self->_shouldReverseButtonOrder;
}

- (void)setShouldReverseButtonOrder:(BOOL)a3
{
  self->_shouldReverseButtonOrder = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (UIColor)overridenButtonColor
{
  return self->_overridenButtonColor;
}

- (void)setOverridenButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_overridenButtonColor, a3);
}

- (SearchUIButtonItemStackViewDelegate)buttonItemStackViewDelegate
{
  return (SearchUIButtonItemStackViewDelegate *)objc_loadWeakRetained((id *)&self->_buttonItemStackViewDelegate);
}

- (void)setButtonItemStackViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonItemStackViewDelegate, a3);
}

- (BOOL)isDoneUpdating
{
  return self->_isDoneUpdating;
}

- (void)setIsDoneUpdating:(BOOL)a3
{
  self->_isDoneUpdating = a3;
}

- (BOOL)countMoreButtonTowardsMaxCount
{
  return self->_countMoreButtonTowardsMaxCount;
}

- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3
{
  self->_countMoreButtonTowardsMaxCount = a3;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItems, a3);
}

- (SearchUIButtonItemFactory)buttonItemFactory
{
  return self->_buttonItemFactory;
}

- (void)setButtonItemFactory:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemFactory, a3);
}

- (NSMutableDictionary)buttonItemViewControllersForClassNames
{
  return self->_buttonItemViewControllersForClassNames;
}

- (void)setButtonItemViewControllersForClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemViewControllersForClassNames, a3);
}

- (NSMutableArray)currentButtonItemViewControllers
{
  return self->_currentButtonItemViewControllers;
}

- (void)setCurrentButtonItemViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonItemViewControllers, a3);
}

- (BOOL)hasLeftMainThread
{
  return self->_hasLeftMainThread;
}

- (void)setHasLeftMainThread:(BOOL)a3
{
  self->_hasLeftMainThread = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentButtonItemViewControllers, 0);
  objc_storeStrong((id *)&self->_buttonItemViewControllersForClassNames, 0);
  objc_storeStrong((id *)&self->_buttonItemFactory, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_destroyWeak((id *)&self->_buttonItemStackViewDelegate);
  objc_storeStrong((id *)&self->_overridenButtonColor, 0);
}

@end
