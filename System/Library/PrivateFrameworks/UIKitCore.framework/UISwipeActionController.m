@implementation UISwipeActionController

- (id)_existingSwipeOccurrenceForIndexPath:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_swipeOccurrences;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "indexPath", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqual:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

- (NSSet)swipedIndexPaths
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_swipeOccurrences, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableSet count](self->_swipeOccurrences, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_swipeOccurrences;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "indexPath", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v3;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id WeakRetained;
  id v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_swipeOccurrences, "count", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    if (objc_msgSend(WeakRetained, "isTracking"))
    {

    }
    else
    {
      v5 = objc_loadWeakRetained((id *)&self->_containerView);
      v6 = objc_msgSend(v5, "isScrollAnimating");

      if (!v6)
        return;
    }
    -[UISwipeActionController swipeHandler](self, "swipeHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInteracting");

    if (v8)
    {
      -[UISwipeActionController updateLayout](self, "updateLayout");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = (void *)-[NSMutableSet copy](self->_swipeOccurrences, "copy", 0);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (objc_msgSend(v14, "state") != 3 && objc_msgSend(v14, "state") != 4 && objc_msgSend(v14, "state") != 5)
              objc_msgSend(v14, "resetAnimated:completion:", 1, 0);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }

    }
  }
}

- (void)updateLayout
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_swipeOccurrences;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateLayout", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (UISwipeActionController)initWithSwipeActionHost:(id)a3 style:(unint64_t)a4
{
  id v6;
  UISwipeActionController *v7;
  UISwipeActionController *v8;
  _UISwipeHandler *v9;
  NSMutableSet *v10;
  NSMutableSet *swipeOccurrences;
  void *v12;
  void *v13;
  id WeakRetained;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UISwipeActionController;
  v7 = -[UISwipeActionController init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UISwipeActionController setStyle:](v7, "setStyle:", a4);
    -[UISwipeActionController setSwipeActionHost:](v8, "setSwipeActionHost:", v6);
    v9 = -[_UISwipeHandler initWithSwipeController:]([_UISwipeHandler alloc], "initWithSwipeController:", v8);
    -[UISwipeActionController setSwipeHandler:](v8, "setSwipeHandler:", v9);

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    swipeOccurrences = v8->_swipeOccurrences;
    v8->_swipeOccurrences = v10;

    -[UISwipeActionController swipeActionHost](v8, "swipeActionHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemContainerViewForSwipeActionController:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionController setContainerView:](v8, "setContainerView:", v13);

    WeakRetained = objc_loadWeakRetained((id *)&v8->_containerView);
    objc_msgSend(WeakRetained, "_addScrollViewScrollObserver:", v8);

  }
  return v8;
}

- (UISwipeActionHost)swipeActionHost
{
  return (UISwipeActionHost *)objc_loadWeakRetained((id *)&self->_swipeActionHost);
}

- (void)setSwipeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_swipeHandler, a3);
}

- (void)setSwipeActionHost:(id)a3
{
  objc_storeWeak((id *)&self->_swipeActionHost, a3);
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (void)rebaseUnambiguousSwipeOccurrencesWithBlock:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeActionController.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rebaseBlock != nil"));

  }
  v6 = (void *)-[NSMutableSet copy](self->_swipeOccurrences, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "_hasAmbiguousIndexPath") & 1) == 0)
        {
          objc_msgSend(v12, "indexPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v12, "setIndexPath:", v14);
          else
            -[UISwipeActionController _handleDeleteOfSwipeOccurrence:](self, "_handleDeleteOfSwipeOccurrence:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (NSMutableSet)swipeOccurrences
{
  return self->_swipeOccurrences;
}

- (void)reloadData
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_swipeOccurrences;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_setDidReloadData", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[UISwipeActionController resetSwipedItemAnimated:completion:](self, "resetSwipedItemAnimated:completion:", 0, 0);
}

- (void)resetSwipedItemAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);
  UISwipeOccurrence *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  UISwipeOccurrence *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  v7 = self->_preparingSwipeOccurrence;
  if (v7)
    *(_BYTE *)&self->_flags |= 1u;
  if (-[NSMutableSet count](self->_swipeOccurrences, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (void *)-[NSMutableSet copy](self->_swipeOccurrences, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(UISwipeOccurrence **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v13 == v7)
            -[UISwipeOccurrence resetWhilePreparing](v7, "resetWhilePreparing");
          else
            -[UISwipeOccurrence resetAnimated:completion:](v13, "resetAnimated:completion:", v4, v6);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[UISwipeActionController swipeHandler](self, "swipeHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetSwipe");

  }
  else
  {
    -[UISwipeActionController swipeHandler](self, "swipeHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetSwipe");

    if (v6)
      v6[2](v6, 1);
  }

}

- (_UISwipeHandler)swipeHandler
{
  return self->_swipeHandler;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  objc_msgSend(WeakRetained, "_removeScrollViewScrollObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)UISwipeActionController;
  -[UISwipeActionController dealloc](&v4, sel_dealloc);
}

- (void)insertRowAtIndexPath:(id)a3
{
  id v4;
  NSMutableSet *swipeOccurrences;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  swipeOccurrences = self->_swipeOccurrences;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UISwipeActionController_insertRowAtIndexPath___block_invoke;
  v7[3] = &unk_1E16E3268;
  v8 = v4;
  v6 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v7);

}

- (void)insertSectionAtIndex:(unint64_t)a3
{
  NSMutableSet *swipeOccurrences;
  _QWORD v4[5];

  swipeOccurrences = self->_swipeOccurrences;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__UISwipeActionController_insertSectionAtIndex___block_invoke;
  v4[3] = &__block_descriptor_40_e31_v24__0__UISwipeOccurrence_8_B16l;
  v4[4] = a3;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v4);
}

- (void)deleteSectionAtIndex:(unint64_t)a3
{
  NSMutableSet *swipeOccurrences;
  _QWORD v4[6];

  swipeOccurrences = self->_swipeOccurrences;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__UISwipeActionController_deleteSectionAtIndex___block_invoke;
  v4[3] = &unk_1E16E31F8;
  v4[4] = self;
  v4[5] = a3;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v4);
}

- (UISwipeOccurrence)currentSwipeOccurrence
{
  return (UISwipeOccurrence *)objc_loadWeakRetained((id *)&self->_currentSwipeOccurrence);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentSwipeOccurrence);
  objc_storeStrong((id *)&self->_swipeOccurrences, 0);
  objc_storeStrong((id *)&self->_swipeHandler, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_incomingSwipeActionsConfiguration, 0);
  objc_destroyWeak((id *)&self->_swipeActionHost);
  objc_storeStrong((id *)&self->_preparingSwipeOccurrence, 0);
}

- (UISwipeActionHost_Internal)_internalSwipeActionHost
{
  return (UISwipeActionHost_Internal *)objc_loadWeakRetained((id *)&self->_swipeActionHost);
}

- (void)setSwipeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISwipeActionController swipeHandler](self, "swipeHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v3);

}

- (BOOL)swipeEnabled
{
  void *v2;
  char v3;

  -[UISwipeActionController swipeHandler](self, "swipeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (id)_swipeActionsConfigurationForSwipeDirection:(unint64_t)a3 indexPath:(id)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = -[UISwipeActionController _prefersRTL](self, "_prefersRTL");
  v8 = a3 != 1;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == v7)
    objc_msgSend(v9, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", self, v6);
  else
    objc_msgSend(v9, "swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", self, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)swipeItemAtIndexPath:(id)a3 configuration:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableSet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  id v25;
  void *v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id WeakRetained;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _UISwipeHandler *swipeHandler;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  BOOL v43;
  id v44;
  _QWORD v45[2];
  BOOL v46;
  _BYTE v47[7];
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (!v13)
  {
    -[UISwipeActionController _swipeActionsConfigurationForSwipeDirection:indexPath:](self, "_swipeActionsConfigurationForSwipeDirection:indexPath:", a5, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v12)
  {
    if (v13)
    {
      objc_msgSend(v13, "actions");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v13, "actions");
        v43 = a6;
        v42 = a5;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v44 = v14;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v19 = self->_swipeOccurrences;
          v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v53;
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v53 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "indexPath");
                v24 = (id)objc_claimAutoreleasedReturnValue();
                v25 = v12;
                v26 = v25;
                if (v24 == v25)
                {

LABEL_24:
                  v14 = v44;
                  goto LABEL_27;
                }
                if (v24)
                {
                  v27 = objc_msgSend(v24, "isEqual:", v25);

                  if ((v27 & 1) != 0)
                    goto LABEL_24;
                }
                else
                {

                }
              }
              v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
              if (v21)
                continue;
              break;
            }
          }

          -[UISwipeActionController _swipedViewForItemAtIndexPath:](self, "_swipedViewForItemAtIndexPath:", v12);
          v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet center](v19, "center");
          v29 = v28;
          v31 = v30;
          WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
          -[NSMutableSet superview](v19, "superview");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "convertPoint:fromView:", v33, v29, v31);
          v35 = v34;
          v37 = v36;

          if (!v42)
            -[UISwipeActionController _prefersRTL](self, "_prefersRTL");
          -[_UISwipeHandler initiateSwipeWithDirection:configuration:location:userInitiated:](self->_swipeHandler, "initiateSwipeWithDirection:configuration:location:userInitiated:", v35, v37);
          v50 = 0u;
          v51 = 0u;
          swipeHandler = self->_swipeHandler;
          v14 = v44;
          if (swipeHandler)
          {
            -[_UISwipeHandler currentSwipeConfig](swipeHandler, "currentSwipeConfig");
            v39 = v50;
            v40 = v51;
          }
          else
          {
            v39 = 0;
            v40 = 0;
          }
          -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "beginSwipeTracking:", 0);
          v45[0] = v39;
          v45[1] = 0;
          v46 = v43;
          memset(v47, 0, sizeof(v47));
          v48 = v40;
          v49 = xmmword_186684110;
          objc_msgSend(v41, "updateOffsetWithSwipeInfo:isTracking:completion:", v45, 0, v44);

LABEL_27:
        }
      }
    }
  }

}

- (void)reconfigureActiveSwipeOccurrences
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_swipeOccurrences, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "state", (_QWORD)v13);
        if (objc_msgSend(v9, "active")
          && (objc_msgSend(v9, "_hasAmbiguousIndexPath") & 1) == 0
          && v10 <= 1)
        {
          objc_msgSend(v9, "resetForReconfiguration");
          if (objc_msgSend(v9, "direction"))
            v11 = 2;
          else
            v11 = 1;
          objc_msgSend(v9, "indexPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISwipeActionController swipeItemAtIndexPath:configuration:direction:animated:completion:](self, "swipeItemAtIndexPath:configuration:direction:animated:completion:", v12, 0, v11, 0, 0);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (NSIndexPath)swipedIndexPath
{
  void *v2;
  void *v3;

  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (UIView)swipedItemView
{
  void *v3;
  void *v4;

  -[UISwipeActionController swipedIndexPath](self, "swipedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwipeActionController _swipedViewForItemAtIndexPath:](self, "_swipedViewForItemAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (BOOL)_isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  if (-[NSMutableSet count](self->_swipeOccurrences, "count") == 1)
  {
    -[NSMutableSet anyObject](self->_swipeOccurrences, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v7;
    if (v6 == v7)
    {

    }
    else
    {
      if (!v7 || !v6)
      {

        v10 = 0;
        v11 = v6;
        goto LABEL_11;
      }
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if (!v9)
      {
        v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)_swipedViewForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipeActionController:viewForItemAtIndexPath:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_prefersRTL
{
  UISwipeActionController *v2;
  void *v3;

  v2 = self;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "layoutDirectionForSwipeActionController:", v2) == 1;

  return (char)v2;
}

- (unint64_t)_swipeDirectionForLeadingEdge:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = -[UISwipeActionController _prefersRTL](self, "_prefersRTL");
  v5 = 1;
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  if (v3)
    v5 = 2;
  if (v4)
    return v6;
  else
    return v5;
}

void __48__UISwipeActionController_deleteSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  if ((objc_msgSend(v14, "_hasAmbiguousIndexPath") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "section");

    if (v3 >= v5)
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "indexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "section");

      if (v11 == v13)
        objc_msgSend(*(id *)(a1 + 32), "_handleDeleteOfSwipeOccurrence:", v14);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v14, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "row");
      objc_msgSend(v14, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForRow:inSection:", v8, objc_msgSend(v9, "section") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIndexPath:", v10);

    }
  }

}

- (void)deleteRowAtIndexPath:(id)a3
{
  id v4;
  NSMutableSet *swipeOccurrences;
  id v6;
  _QWORD v7[4];
  id v8;
  UISwipeActionController *v9;

  v4 = a3;
  swipeOccurrences = self->_swipeOccurrences;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UISwipeActionController_deleteRowAtIndexPath___block_invoke;
  v7[3] = &unk_1E16E3220;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v7);

}

void __48__UISwipeActionController_deleteRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "_hasAmbiguousIndexPath") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "section");
    objc_msgSend(v16, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == objc_msgSend(v4, "section"))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "row");
      objc_msgSend(v16, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "row");

      v8 = v16;
      if (v5 < v7)
      {
        v9 = (void *)MEMORY[0x1E0CB36B0];
        objc_msgSend(v16, "indexPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "row") - 1;
        objc_msgSend(v16, "indexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "indexPathForRow:inSection:", v11, objc_msgSend(v12, "section"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIndexPath:", v13);

        goto LABEL_8;
      }
    }
    else
    {

      v8 = v16;
    }
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v8, "indexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "isEqual:", v15);

    if ((_DWORD)v14)
      objc_msgSend(*(id *)(a1 + 40), "_handleDeleteOfSwipeOccurrence:", v16);
  }
LABEL_8:

}

void __48__UISwipeActionController_insertSectionAtIndex___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "_hasAmbiguousIndexPath") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "section");

    if (v3 <= v5)
    {
      v6 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v11, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "row");
      objc_msgSend(v11, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForRow:inSection:", v8, objc_msgSend(v9, "section") + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIndexPath:", v10);

    }
  }

}

void __48__UISwipeActionController_insertRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(v12, "_hasAmbiguousIndexPath") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "section");
    objc_msgSend(v12, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 != objc_msgSend(v4, "section"))
    {
LABEL_5:

      goto LABEL_6;
    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "row");
    objc_msgSend(v12, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "row");

    if (v5 <= v7)
    {
      v8 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v12, "indexPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "row") + 1;
      objc_msgSend(v12, "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathForRow:inSection:", v9, objc_msgSend(v10, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIndexPath:", v11);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)moveSectionAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSMutableSet *swipeOccurrences;
  _QWORD v5[6];

  swipeOccurrences = self->_swipeOccurrences;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UISwipeActionController_moveSectionAtIndex_toIndex___block_invoke;
  v5[3] = &__block_descriptor_48_e31_v24__0__UISwipeOccurrence_8_B16l;
  v5[4] = a3;
  v5[5] = a4;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v5);
}

void __54__UISwipeActionController_moveSectionAtIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  if ((objc_msgSend(v23, "_hasAmbiguousIndexPath") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v23, "indexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "section");

    if (v3 == v5)
    {
      v6 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v23, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForRow:inSection:", objc_msgSend(v7, "row"), *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIndexPath:", v8);
LABEL_8:

      goto LABEL_9;
    }
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v23, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "section");

    if (v9 < v11)
    {
      v12 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v23, "indexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "row");
      objc_msgSend(v23, "indexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForRow:inSection:", v14, objc_msgSend(v15, "section") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIndexPath:", v16);

    }
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v23, "indexPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "section");

    if (v17 <= v19)
    {
      v20 = (void *)MEMORY[0x1E0CB36B0];
      objc_msgSend(v23, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "row");
      objc_msgSend(v23, "indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexPathForRow:inSection:", v21, objc_msgSend(v8, "section") + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIndexPath:", v22);

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)moveRowAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *swipeOccurrences;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  swipeOccurrences = self->_swipeOccurrences;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__UISwipeActionController_moveRowAtIndexPath_toIndexPath___block_invoke;
  v11[3] = &unk_1E16E3220;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](swipeOccurrences, "enumerateObjectsUsingBlock:", v11);

}

void __58__UISwipeActionController_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v3 = objc_msgSend(v25, "_hasAmbiguousIndexPath");
  v4 = v25;
  if ((v3 & 1) != 0)
    goto LABEL_13;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v25, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqual:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(v25, "setIndexPath:", *(_QWORD *)(a1 + 40));
LABEL_12:
    v4 = v25;
    goto LABEL_13;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "section");
  objc_msgSend(v25, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "section"))
    goto LABEL_7;
  v9 = objc_msgSend(*(id *)(a1 + 32), "row");
  objc_msgSend(v25, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "row");

  if (v9 < v11)
  {
    v12 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v25, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "row") - 1;
    objc_msgSend(v25, "indexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForRow:inSection:", v13, objc_msgSend(v14, "section"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIndexPath:", v15);

LABEL_7:
  }
  v16 = objc_msgSend(*(id *)(a1 + 40), "section");
  objc_msgSend(v25, "indexPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 != objc_msgSend(v17, "section"))
  {
LABEL_11:

    goto LABEL_12;
  }
  v18 = objc_msgSend(*(id *)(a1 + 40), "row");
  objc_msgSend(v25, "indexPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "row");

  v4 = v25;
  if (v18 <= v20)
  {
    v21 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v25, "indexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "row") + 1;
    objc_msgSend(v25, "indexPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indexPathForRow:inSection:", v22, objc_msgSend(v23, "section"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIndexPath:", v24);

    goto LABEL_11;
  }
LABEL_13:

}

- (void)_handleDeleteOfSwipeOccurrence:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "_setHasAmbiguousIndexPath");
  objc_msgSend(v7, "currentAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v7, "currentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "style") != 1)
  {

    v4 = v7;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v7, "state");

  v4 = v7;
  if (v6 != 3)
  {
LABEL_6:
    objc_msgSend(v4, "resetAnimated:completion:", 0, 0);
    goto LABEL_7;
  }
  objc_msgSend(v7, "_transitionToState:", 4);
LABEL_7:

}

- (void)prepareForSwipeDirection:(unint64_t)a3 startingAtTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  y = a4.y;
  x = a4.x;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "swipeActionController:indexPathForTouchLocation:", self, x, y);
  v12 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v12;
  if (a3 && v12)
  {
    -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](self, "_existingSwipeOccurrenceForIndexPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && !_canReuseExistingSwipeOccurrenceForSwipeDirection(v10, a3))
      objc_msgSend(v11, "_forceTeardown");

    v9 = (void *)v12;
  }

}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)configureForSwipeDirection:(SEL)a3 configuration:(unint64_t)a4 startingAtTouchLocation:(id)a5
{
  double y;
  double x;
  UISwipeActionsConfiguration *v12;
  void *v13;
  void *v14;
  UISwipeOccurrence *v15;
  UISwipeOccurrence *v16;
  UISwipeActionsConfiguration *incomingSwipeActionsConfiguration;
  UISwipeActionsConfiguration *v18;
  int has_internal_diagnostics;
  UISwipeOccurrence *preparingSwipeOccurrence;
  UISwipeOccurrence **p_preparingSwipeOccurrence;
  __int128 v22;
  char flags;
  UISwipeOccurrence *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  $A7B7FA971CD029BAA4A09478E9E1AEDA *result;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  uint8_t buf[16];
  __int128 v40;

  y = a6.y;
  x = a6.x;
  v12 = (UISwipeActionsConfiguration *)a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "swipeActionController:indexPathForTouchLocation:", self, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 || !v14)
    goto LABEL_31;
  -[UISwipeActionController _existingSwipeOccurrenceForIndexPath:](self, "_existingSwipeOccurrenceForIndexPath:", v14);
  v15 = (UISwipeOccurrence *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
    if (!_canReuseExistingSwipeOccurrenceForSwipeDirection(v15, a4))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("UISwipeActionController.m"), 419, CFSTR("There is an existing swipe occurrence for %@ and it can't be reused for swipe direction %ld, so it should have been cleaned up in prepareForSwipeDirection: %@"), v14, a4, v16);

    }
    -[UISwipeOccurrence updateSwipedView](v16, "updateSwipedView");
    if (v12)
      goto LABEL_13;
    goto LABEL_9;
  }
  v16 = -[UISwipeOccurrence initWithController:indexPath:defaultStyle:]([UISwipeOccurrence alloc], "initWithController:indexPath:defaultStyle:", self, v14, -[UISwipeActionController style](self, "style"));
  -[NSMutableSet addObject:](self->_swipeOccurrences, "addObject:", v16);
  if (!v12)
  {
LABEL_9:
    incomingSwipeActionsConfiguration = self->_incomingSwipeActionsConfiguration;
    if (incomingSwipeActionsConfiguration)
    {
      v18 = incomingSwipeActionsConfiguration;
    }
    else
    {
      -[UISwipeActionController _swipeActionsConfigurationForSwipeDirection:indexPath:](self, "_swipeActionsConfigurationForSwipeDirection:indexPath:", a4, v14);
      v18 = (UISwipeActionsConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v18;
  }
LABEL_13:
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  p_preparingSwipeOccurrence = &self->_preparingSwipeOccurrence;
  preparingSwipeOccurrence = self->_preparingSwipeOccurrence;
  if (has_internal_diagnostics)
  {
    if (preparingSwipeOccurrence || (*(_BYTE *)&self->_flags & 1) != 0)
    {
      __UIFaultDebugAssertLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v34, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: reentrantly preparing a swipe occurrence is not supported", buf, 2u);
      }

    }
  }
  else if (preparingSwipeOccurrence || (*(_BYTE *)&self->_flags & 1) != 0)
  {
    v32 = _MergedGlobals_1229;
    if (!_MergedGlobals_1229)
    {
      v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&_MergedGlobals_1229);
    }
    v33 = *(NSObject **)(v32 + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: reentrantly preparing a swipe occurrence is not supported", buf, 2u);
    }
  }
  objc_storeStrong((id *)&self->_preparingSwipeOccurrence, v16);
  if (v16)
  {
    -[UISwipeOccurrence prepareWithSwipeDirection:configuration:](v16, "prepareWithSwipeDirection:configuration:", a4, v12);
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v40 = 0u;
  }
  v22 = v40;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)buf;
  *(_OWORD *)&retstr->var3 = v22;
  flags = (char)self->_flags;
  if (os_variant_has_internal_diagnostics())
  {
    if ((flags & 1) == 0 && *p_preparingSwipeOccurrence != v16)
    {
      __UIFaultDebugAssertLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: preparingSwipeOccurrence was unexpectedly changed to a different occurrence", buf, 2u);
      }

    }
  }
  else if ((flags & 1) == 0 && *p_preparingSwipeOccurrence != v16)
  {
    v37 = qword_1ECD80860;
    if (!qword_1ECD80860)
    {
      v37 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v37, (unint64_t *)&qword_1ECD80860);
    }
    v38 = *(NSObject **)(v37 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: preparingSwipeOccurrence was unexpectedly changed to a different occurrence", buf, 2u);
    }
  }
  v24 = self->_preparingSwipeOccurrence;
  self->_preparingSwipeOccurrence = 0;

  *(_BYTE *)&self->_flags &= ~1u;
  if (retstr->var0 && -[UISwipeOccurrence active](v16, "active") && (flags & 1) == 0)
  {
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "swipeActionController:willBeginSwipeForItemAtIndexPath:", self, v14);

    }
    -[UISwipeActionController setCurrentSwipeOccurrence:](self, "setCurrentSwipeOccurrence:", v16);
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "swipeActionController:didBeginSwipeForItemAtIndexPath:", self, v14);

    }
  }
  else
  {
    -[NSMutableSet removeObject:](self->_swipeOccurrences, "removeObject:", v16);
  }

LABEL_31:
  return result;
}

- (BOOL)touchAtLocationShouldDismissSwipedItem:(CGPoint)a3 isTouchUp:(BOOL)a4
{
  double y;
  double x;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_swipeOccurrences;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "shouldDismissWithTouchLocation:", x, y, (_QWORD)v24))break;
        if (v9 == ++v11)
        {
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          v12 = 1;
          if (v9)
            goto LABEL_4;
          goto LABEL_25;
        }
      }
LABEL_23:
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gestureRecognizerViewForSwipeActionController:", self);
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_swipeOccurrences;
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "indexPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UISwipeActionController _swipedViewForItemAtIndexPath:](self, "_swipedViewForItemAtIndexPath:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[NSMutableSet convertPoint:toView:](v7, "convertPoint:toView:", v20, x, y);
            if (v21 >= 0.0)
            {
              v22 = v21;
              objc_msgSend(v20, "bounds");
              if (v22 <= CGRectGetHeight(v35))
              {

                goto LABEL_23;
              }
            }
          }

        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v16)
          continue;
        break;
      }
    }

    v12 = -[NSMutableSet count](self->_swipeOccurrences, "count") != 0;
  }
LABEL_25:

  return v12;
}

- (void)swipeOccurrence:(id)a3 willFinishWithDeletion:(BOOL)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "swipeActionController:willEndSwipeForItemAtIndexPath:", self, v8);

  }
  -[UISwipeActionController swipeHandler](self, "swipeHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resetSwipe");

}

- (void)swipeOccurrenceDidFinish:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
    -[UISwipeActionController setCurrentSwipeOccurrence:](self, "setCurrentSwipeOccurrence:", 0);
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "swipeActionController:didEndSwipeForItemAtIndexPath:", self, v8);

  }
  -[NSMutableSet removeObject:](self->_swipeOccurrences, "removeObject:", v9);

}

- (void)swipeOccurrence:(id)a3 didChangeStateFrom:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UISwipeActionController _internalSwipeActionHost](self, "_internalSwipeActionHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UISwipeActionController _internalSwipeActionHost](self, "_internalSwipeActionHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "swipeActionController:swipeOccurrence:didChangeStateFrom:to:", self, v9, a4, objc_msgSend(v9, "state"));

  }
}

- (BOOL)swipeHandler:(id)a3 mayBeginSwipeAtLocation:(CGPoint)a4 withProposedDirection:(unint64_t)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;

  y = a4.y;
  x = a4.x;
  -[UISwipeActionController swipeActionHost](self, "swipeActionHost", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "swipeActionController:indexPathForTouchLocation:", self, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11
      && (objc_msgSend(v11, "state") & 0xFFFFFFFFFFFFFFFELL) == 4
      && (objc_msgSend(v12, "_hasAmbiguousIndexPath") & 1) != 0)
    {
      goto LABEL_13;
    }
    -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[UISwipeActionController swipeActionHost](self, "swipeActionHost");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "swipeActionController:mayBeginSwipeForItemAtIndexPath:", self, v10);

      if (!v16)
      {
LABEL_13:
        v21 = 0;
        goto LABEL_22;
      }
    }
    if (v12)
    {
      objc_msgSend(v12, "indexPath");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      v19 = v18;
      if (v17 == v18)
      {

        goto LABEL_19;
      }
      if (v17)
      {
        v20 = objc_msgSend(v17, "isEqual:", v18);

        if ((v20 & 1) != 0)
        {
          v21 = 1;
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {

      }
    }
    -[UISwipeActionController _swipeActionsConfigurationForSwipeDirection:indexPath:](self, "_swipeActionsConfigurationForSwipeDirection:indexPath:", a5, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;
    if (!v22
      || (objc_msgSend(v22, "actions"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "count"),
          v23,
          !v24))
    {
      -[UISwipeActionController setIncomingSwipeActionsConfiguration:](self, "setIncomingSwipeActionsConfiguration:", 0);
      v21 = 0;
      goto LABEL_21;
    }
    -[UISwipeActionController setIncomingSwipeActionsConfiguration:](self, "setIncomingSwipeActionsConfiguration:", v19);
LABEL_19:
    v21 = 1;
LABEL_21:

    goto LABEL_22;
  }
  v21 = 0;
LABEL_23:

  return v21;
}

- (void)swipeHandlerDidBeginSwipe:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeActionController.m"), 575, CFSTR("No current swipe occurrence"));

    v5 = 0;
  }
  objc_msgSend(v5, "beginSwipeTracking:", 1);
  -[UISwipeActionController setIncomingSwipeActionsConfiguration:](self, "setIncomingSwipeActionsConfiguration:", 0);

}

- (void)swipeHandler:(id)a3 didGenerateSwipeWithInfo:(id *)a4 isTracking:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];

  v5 = a5;
  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeActionController.m"), 585, CFSTR("No current swipe occurrence"));

  }
  v10 = *(_OWORD *)&a4->var2;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->var4;
  objc_msgSend(v9, "updateOffsetWithSwipeInfo:isTracking:completion:", v12, v5, 0);

}

- (void)swipeHandler:(id)a3 didConfirmSwipeWithInfo:(id *)a4
{
  void *v7;
  __int128 v8;
  void *v9;
  _OWORD v10[3];

  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeActionController.m"), 593, CFSTR("No current swipe occurrence"));

  }
  v8 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a4->var4;
  objc_msgSend(v7, "performPrimaryActionWithSwipeInfo:", v10);

}

- (CGRect)swipeHandlerRestingFrame:(id)a3
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
  double v14;
  double v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __int16 v19[8];
  uint8_t buf[16];
  CGRect result;

  -[UISwipeActionController currentSwipeOccurrence](self, "currentSwipeOccurrence", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "No current swipe occurrence.", buf, 2u);
      }

    }
    else
    {
      v16 = swipeHandlerRestingFrame____s_category;
      if (!swipeHandlerRestingFrame____s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&swipeHandlerRestingFrame____s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19[0] = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "No current swipe occurrence.", (uint8_t *)v19, 2u);
      }
    }
  }
  objc_msgSend(v3, "swipedViewRestingFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (UISwipeActionsConfiguration)incomingSwipeActionsConfiguration
{
  return self->_incomingSwipeActionsConfiguration;
}

- (void)setIncomingSwipeActionsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_incomingSwipeActionsConfiguration, a3);
}

- (UIScrollView)containerView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setSwipeOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_swipeOccurrences, a3);
}

- (void)setCurrentSwipeOccurrence:(id)a3
{
  objc_storeWeak((id *)&self->_currentSwipeOccurrence, a3);
}

@end
