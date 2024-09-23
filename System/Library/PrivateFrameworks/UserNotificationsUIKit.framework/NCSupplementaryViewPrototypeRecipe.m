@implementation NCSupplementaryViewPrototypeRecipe

- (NCSupplementaryViewPrototypeRecipe)init
{
  NCSupplementaryViewPrototypeRecipe *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *lastModifiedDatesByGroupingIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
  v2 = -[NCSupplementaryViewPrototypeRecipe init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastModifiedDatesByGroupingIdentifiers = v2->_lastModifiedDatesByGroupingIdentifiers;
    v2->_lastModifiedDatesByGroupingIdentifiers = v3;

  }
  return v2;
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_39);
  return (id)_sharedInstance___sharedInstance;
}

void __53__NCSupplementaryViewPrototypeRecipe__sharedInstance__block_invoke()
{
  NCSupplementaryViewPrototypeRecipe *v0;
  void *v1;

  v0 = objc_alloc_init(NCSupplementaryViewPrototypeRecipe);
  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;

}

+ (void)registerRecipeWithDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_registerRecipeWithDelegate:", v3);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
  if (-[NCSupplementaryViewPrototypeRecipe respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)NCSupplementaryViewPrototypeRecipe;
      -[NCSupplementaryViewPrototypeRecipe forwardInvocation:](&v6, sel_forwardInvocation_, v4);
    }

  }
}

- (void)requestsRemovalForPrototypeRecipeViewController:(id)a3
{
  NCSupplementaryViewPrototypeRecipeDelegate **p_delegate;
  id v4;
  void *v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSupplementaryViewController:", v4);

}

- (void)requestsUpdateForPrototypeRecipeViewController:(id)a3
{
  NCSupplementaryViewPrototypeRecipeDelegate **p_delegate;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSupplementaryViewController:withConfiguration:", v4, v6);

}

- (void)requestsInsertForPrototypeRecipeViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  -[NCSupplementaryViewPrototypeRecipe _updateGroupLastModifiedDateForViewController:](self, "_updateGroupLastModifiedDateForViewController:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSupplementaryViewController:withConfiguration:", v4, v6);

}

- (void)requestsUpdatePositionIfNeededForPrototypeRecipeViewController:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = a3;
  -[NCSupplementaryViewPrototypeRecipe _updateGroupLastModifiedDateForViewController:](self, "_updateGroupLastModifiedDateForViewController:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePositionIfNeededForSupplementaryViewController:", v4);

}

- (unint64_t)prototypeRecipeViewController:(id)a3 requestsCountForGroupWithIdentifier:(id)a4
{
  NCSupplementaryViewPrototypeRecipeDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supplementaryViewControllersByGroupingIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  return v10;
}

- (void)recipeMenuViewController:(id)a3 requestsInsertContentViewController:(id)a4
{
  NCSupplementaryViewPrototypeRecipeDelegate **p_delegate;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSupplementaryViewController:withConfiguration:", v5, v7);

}

- (void)_registerRecipeWithDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  -[NCSupplementaryViewPrototypeRecipe setDelegate:](self, "setDelegate:", v4);
  -[NCSupplementaryViewPrototypeRecipe _supplementaryViewsTestRecipeWithDelegate:](self, "_supplementaryViewsTestRecipeWithDelegate:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[PTDomain registerTestRecipe:](NCUNUIKitPrototypeDomain, "registerTestRecipe:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSupplementaryViewPrototypeRecipe _setSortComparatorsForContainer:](self, "_setSortComparatorsForContainer:", v6);

}

- (void)_setSortComparatorsForContainer:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke;
  v8[3] = &unk_1E8D1F6E8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setViewControllerSortComparator:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke_2;
  v6[3] = &unk_1E8D1F710;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setGroupSortComparator:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

uint64_t __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v8 = objc_msgSend(WeakRetained, "_compareByAgeForViewController:otherViewController:", v5, v6);

  return v8;
}

uint64_t __70__NCSupplementaryViewPrototypeRecipe__setSortComparatorsForContainer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(&unk_1E8D5FE68, "indexOfObject:", v5);
    v9 = objc_msgSend(&unk_1E8D5FE68, "indexOfObject:", v6);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          objc_msgSend(WeakRetained, "lastModifiedDatesByGroupingIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(WeakRetained, "lastModifiedDatesByGroupingIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = objc_msgSend(v14, "compare:", v12);
        }
        else
        {
          v7 = -1;
        }
      }
      else if (v9 < v8)
      {
        v7 = 1;
      }
      else
      {
        v7 = -1;
      }
    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (id)_mostRecentDateForGroupingIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "supplementaryViewControllersByGroupingIdentifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
  {

LABEL_14:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dateModified");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v11 || objc_msgSend(v14, "compare:", v11) == 1)
      {
        v16 = v15;

        v11 = v16;
      }

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v10);

  if (!v11)
    goto LABEL_14;
LABEL_15:

  return v11;
}

- (int64_t)_compareByAgeForViewController:(id)a3 otherViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a4;
  objc_msgSend(a3, "dateModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

- (void)_presentSupplementaryViewController
{
  id WeakRetained;
  void *v4;
  void *v5;
  NCSupplementaryViewPrototypeRecipeMenuViewController *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "testRecipeSupplementaryViewsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v4, "supplementaryViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__NCSupplementaryViewPrototypeRecipe__presentSupplementaryViewController__block_invoke;
  v8[3] = &unk_1E8D1F738;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  if (!*((_BYTE *)v10 + 24))
  {
    v6 = objc_alloc_init(NCSupplementaryViewPrototypeRecipeMenuViewController);
    -[NCSupplementaryViewPrototypeRecipeViewController configuration](v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSupplementaryViewController:withConfiguration:", v6, v7);

    -[NCSupplementaryViewPrototypeRecipeViewController setDelegate:](v6, "setDelegate:", self);
  }
  _Block_object_dispose(&v9, 8);

}

void __73__NCSupplementaryViewPrototypeRecipe__presentSupplementaryViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = isKindOfClass & 1;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)_updateGroupLastModifiedDateForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupingIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dateModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v6)
  {
    -[NSMutableDictionary objectForKey:](self->_lastModifiedDatesByGroupingIdentifiers, "objectForKey:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (v7)
    {
      if (objc_msgSend(v6, "compare:", v7) == 1)
        v8 = v6;
      else
        v8 = v7;
    }
    v9 = v8;

    -[NSMutableDictionary setObject:forKey:](self->_lastModifiedDatesByGroupingIdentifiers, "setObject:forKey:", v9, v10);
    v6 = v9;
  }

}

- (id)_supplementaryViewsTestRecipeWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v5 = (void *)MEMORY[0x1E0D83038];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__NCSupplementaryViewPrototypeRecipe__supplementaryViewsTestRecipeWithDelegate___block_invoke;
  v8[3] = &unk_1E8D1CB40;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v5, "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Add/Remove Supplementary Views in Notifications List"), v8, &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __80__NCSupplementaryViewPrototypeRecipe__supplementaryViewsTestRecipeWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "_presentSupplementaryViewController");
    WeakRetained = v3;
  }

}

- (NCSupplementaryViewPrototypeRecipeDelegate)delegate
{
  return (NCSupplementaryViewPrototypeRecipeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)lastModifiedDatesByGroupingIdentifiers
{
  return self->_lastModifiedDatesByGroupingIdentifiers;
}

- (void)setLastModifiedDatesByGroupingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDatesByGroupingIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDatesByGroupingIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
