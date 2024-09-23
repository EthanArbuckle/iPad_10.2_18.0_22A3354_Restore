@implementation SearchUIContactButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "contactIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContactIdentifier:", v11);

    }
    objc_msgSend(v8, "actionTypesToShow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = (void *)objc_opt_class();
    if (v13)
      objc_msgSend(v14, "buttonCategoriesForActionTypes:", v12);
    else
      objc_msgSend(v14, "defaultButtonCategoriesForPerson:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "command");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "phoneNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "phoneNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPhoneNumbers:", v17);

    }
    else
    {
      objc_msgSend(v9, "setPhoneNumbers:", 0);
    }

    v28 = *MEMORY[0x1E0C965F8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_opt_new();
    -[SearchUIContactButtonItemGenerator setQuickActionViews:](self, "setQuickActionViews:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C974C0]), "initWithActionTypes:contactQuickActionViewContainer:", v18, self);
    -[SearchUIContactButtonItemGenerator setQuickActionsController:](self, "setQuickActionsController:", v20);
    -[SearchUIContactButtonItemGenerator setSfButtonItem:](self, "setSfButtonItem:", v6);
    -[SearchUIContactButtonItemGenerator setCompletionHandler:](self, "setCompletionHandler:", v7);
    +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __93__SearchUIContactButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
    v26 = &unk_1EA1F8A18;
    v27 = v20;
    v22 = v20;
    objc_msgSend(v21, "fetchContactForPerson:completionHandler:", v9, &v23);

    -[SearchUIContactButtonItemGenerator updateButtons](self, "updateButtons", v23, v24, v25, v26);
  }
  else
  {
    v7[2](v7, 0, 1);
  }

}

uint64_t __93__SearchUIContactButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContact:", a2);
}

+ (id)cachedEnabledActionsForButtonItems
{
  if (cachedEnabledActionsForButtonItems_onceToken != -1)
    dispatch_once(&cachedEnabledActionsForButtonItems_onceToken, &__block_literal_global_41);
  return (id)cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems;
}

void __72__SearchUIContactButtonItemGenerator_cachedEnabledActionsForButtonItems__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems;
  cachedEnabledActionsForButtonItems_cachedEnabledActionsForButtonItems = v0;

}

- (id)cachedEnabledActionTypes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "cachedEnabledActionsForButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItemGenerator sfButtonItem](self, "sfButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cacheEnabledActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SearchUIContactButtonItemGenerator cachedEnabledActionTypes](self, "cachedEnabledActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "cachedEnabledActionsForButtonItems");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SearchUIContactButtonItemGenerator sfButtonItem](self, "sfButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, v6);

  }
}

- (void)updateButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  SearchUIContactButtonItem *v13;
  void *v14;
  SearchUIContactButtonItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  id obj;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = (void *)objc_opt_new();
  -[SearchUIContactButtonItemGenerator quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItemGenerator cachedEnabledActionTypes](self, "cachedEnabledActionTypes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItemGenerator sfButtonItem](self, "sfButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIContactButtonItemGenerator sfButtonItem](self, "sfButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v3, "actionTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = v7;
    v35 = *(_QWORD *)v37;
    v32 = *MEMORY[0x1E0C96618];
    v33 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[SearchUIContactButtonItemGenerator quickActionViews](self, "quickActionViews");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "enabled") & 1) != 0 || objc_msgSend(v30, "containsObject:", v10))
        {
          v13 = [SearchUIContactButtonItem alloc];
          -[SearchUIContactButtonItemGenerator sfButtonItem](self, "sfButtonItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[SearchUIButtonItem initWithSFButtonItem:](v13, "initWithSFButtonItem:", v14);

          -[SearchUIContactButtonItem setQuickActionsController:](v15, "setQuickActionsController:", v3);
          -[SearchUIContactButtonItem setActionType:](v15, "setActionType:", v10);
          if (v6)
          {
            -[SearchUIContactButtonItem setTitle:](v15, "setTitle:", v6);
          }
          else
          {
            v16 = (void *)objc_opt_class();
            objc_msgSend(v3, "contact");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "buttonTitleForActionType:contact:", v10, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIContactButtonItem setTitle:](v15, "setTitle:", v18);

          }
          -[SearchUIContactButtonItemGenerator quickActionsController](self, "quickActionsController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](v15, "setShowsMenuAsPrimaryAction:", objc_msgSend(v19, "hasDefaultActionForActionType:", v10) ^ 1);

          if (!objc_msgSend(v10, "isEqualToString:", v32)
            || ((objc_msgSend(v3, "contact"),
                 v20 = (void *)objc_claimAutoreleasedReturnValue(),
                 v21 = objc_msgSend(v20, "hasBeenPersisted"),
                 v22 = CFSTR("square.and.pencil"),
                 !v21)
              ? (v23 = CFSTR("square.and.pencil"))
              : (v23 = 0),
                v24 = v23,
                v20,
                v21))
          {
            objc_msgSend(MEMORY[0x1E0D13DA8], "symbolOulinedImageNameForActionType:", v10);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          if (-[__CFString length](v22, "length"))
          {
            v25 = (void *)objc_opt_new();
            objc_msgSend(v25, "setSymbolName:", v22);
            objc_msgSend(v25, "setIsTemplate:", 1);
            -[SearchUIContactButtonItem setImage:](v15, "setImage:", v25);

          }
          objc_msgSend(v12, "setButtonItem:", v15);
          objc_msgSend(v3, "setModelTrackingDelegate:", v15);
          objc_msgSend(v34, "addObject:", v15);
          -[SearchUIContactButtonItemGenerator cacheEnabledActionType:](self, "cacheEnabledActionType:", v10);

          v6 = v33;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "actionTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  v28 = v27 == objc_msgSend(v34, "count");

  -[SearchUIContactButtonItemGenerator completionHandler](self, "completionHandler");
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _BOOL8))v29)[2](v29, v34, v28);

}

+ (id)buttonTitleForActionType:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hasBeenPersisted");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96658]))
  {
    v8 = CFSTR("FACE_TIME_VIDEO");
    if (v7)
      v8 = CFSTR("VIDEO_CALL_MENU_TITLE");
    v9 = v8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v9 = CFSTR("SEND_MESSAGE");
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C965F8]))
  {
    objc_msgSend(v6, "phoneNumbers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = CFSTR("AUDIO_CALL_MENU_TITLE");
    if (!v11)
      v12 = CFSTR("FACE_TIME_AUDIO");
    v9 = v12;

  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C96618]))
  {
    v9 = CFSTR("SEND_EMAIL");
  }
  else
  {
    v9 = 0;
  }
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)viewForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SearchUIContactButtonItemGenerator quickActionViews](self, "quickActionViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setGenerator:", self);
    -[SearchUIContactButtonItemGenerator quickActionViews](self, "quickActionViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

+ (id)defaultButtonCategoriesForPerson:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C96620];
  v10 = *MEMORY[0x1E0C96658];
  v11 = v3;
  v12 = *MEMORY[0x1E0C965F8];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy", v10, v11, v12, v13);

  objc_msgSend(v5, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "insertObject:atIndex:", *MEMORY[0x1E0C96618], 0);
  }
  else if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
  {
    objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C96618]);
  }
  return v7;
}

+ (id)buttonCategoriesForActionTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v23 = (void *)*MEMORY[0x1E0C96610];
    v22 = (void *)*MEMORY[0x1E0C96608];
    v21 = (void *)*MEMORY[0x1E0C96630];
    v20 = (void *)*MEMORY[0x1E0C96648];
    v19 = (void *)*MEMORY[0x1E0C96638];
    v18 = (void *)*MEMORY[0x1E0C965F8];
    v9 = (void *)*MEMORY[0x1E0C96658];
    v10 = (void *)*MEMORY[0x1E0C96620];
    v11 = (void *)*MEMORY[0x1E0C96618];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "intValue", v18) - 1;
        v13 = v11;
        switch(v14)
        {
          case 0:
            goto LABEL_15;
          case 1:
            v13 = v10;
            goto LABEL_15;
          case 2:
            v13 = v9;
            goto LABEL_15;
          case 3:
            v13 = v18;
            goto LABEL_15;
          case 4:
            v13 = v19;
            goto LABEL_15;
          case 5:
            v13 = v20;
            goto LABEL_15;
          case 6:
            v13 = v21;
            goto LABEL_15;
          case 7:
            v13 = v22;
            goto LABEL_15;
          case 8:
            v13 = v23;
LABEL_15:
            v15 = v13;
            if (v15)
            {
              v16 = v15;
              objc_msgSend(v4, "addObject:", v15);

            }
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)visibleButtonForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SearchUIContactButtonItemGenerator quickActionViews](self, "quickActionViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIButtonItemGenerator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewForButtonItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITraitCollection)traitCollection
{
  return self->traitCollection;
}

- (CNContactQuickActionsController)quickActionsController
{
  return (CNContactQuickActionsController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuickActionsController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableDictionary)quickActionViews
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQuickActionViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (SFButtonItem)sfButtonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSfButtonItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfButtonItem, 0);
  objc_storeStrong((id *)&self->_quickActionViews, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_quickActionsController, 0);
  objc_storeStrong((id *)&self->traitCollection, 0);
}

@end
