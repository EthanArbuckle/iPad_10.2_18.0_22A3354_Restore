@implementation _PUSettingsController

- (_PUSettingsController)initWithRootSettings:(id)a3
{
  id v5;
  _PUSettingsController *v6;
  _PUSettingsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUSettingsController;
  v6 = -[_PUSettingsController initWithRootSettings:](&v9, sel_initWithRootSettings_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootSettings, a3);
    -[PTSettings addKeyPathObserver:](v7->_rootSettings, "addKeyPathObserver:", v7);
  }

  return v7;
}

- (PXSettings)currentSettings
{
  void *v2;
  void *v3;
  id v4;

  -[_PUSettingsController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return (PXSettings *)v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PUSettingsController;
  -[_PUSettingsController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (!-[_PUSettingsController hasWarnedForOverrides](self, "hasWarnedForOverrides"))
  {
    -[_PUSettingsController currentSettings](self, "currentSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasUserDefaultsOverrides");

    if (v5)
    {
      -[_PUSettingsController setHasWarnedForOverrides:](self, "setHasWarnedForOverrides:", 1);
      -[_PUSettingsController _warnForSettingsOverride](self, "_warnForSettingsOverride");
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PUSettingsController;
  -[_PUSettingsController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_PUSettingsController callOnViewDidDisappearBlock](self, "callOnViewDidDisappearBlock");
}

- (void)callOnViewDidDisappearBlock
{
  void *v3;
  void (**v4)(void);

  -[_PUSettingsController onViewDidDisappearBlock](self, "onViewDidDisappearBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PUSettingsController onViewDidDisappearBlock](self, "onViewDidDisappearBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setDismissButtonFactory:(id)a3
{
  void *v4;
  id dismissButtonFactory;

  if (self->_dismissButtonFactory != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    dismissButtonFactory = self->_dismissButtonFactory;
    self->_dismissButtonFactory = v4;

    -[_PUSettingsController _invalidateNavigationItems](self, "_invalidateNavigationItems");
  }
}

- (void)setEllipsisBarButtonItemFactory:(id)a3
{
  void *v4;
  id ellipsisBarButtonItemFactory;

  if (self->_ellipsisBarButtonItemFactory != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    ellipsisBarButtonItemFactory = self->_ellipsisBarButtonItemFactory;
    self->_ellipsisBarButtonItemFactory = v4;

    -[_PUSettingsController _invalidateNavigationItems](self, "_invalidateNavigationItems");
  }
}

- (void)_invalidateNavigationItems
{
  void *v3;
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
  -[_PUSettingsController viewControllers](self, "viewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        -[_PUSettingsController _updateNavigationItemOfViewController:](self, "_updateNavigationItemOfViewController:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)_PUSettingsController;
  v6 = a3;
  -[_PUSettingsController pushViewController:animated:](&v7, sel_pushViewController_animated_, v6, v4);
  -[_PUSettingsController _updateNavigationItemOfViewController:](self, "_updateNavigationItemOfViewController:", v6, v7.receiver, v7.super_class);

}

- (void)_updateNavigationItemOfViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___PUSettingsController__updateNavigationItemOfViewController___block_invoke;
  aBlock[3] = &unk_1E58A7808;
  v13 = v6;
  v7 = v6;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[_PUSettingsController dismissButtonFactory](self, "dismissButtonFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

  -[_PUSettingsController ellipsisBarButtonItemFactory](self, "ellipsisBarButtonItemFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  objc_msgSend(v5, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRightBarButtonItems:", v7);
}

- (UINavigationController)searchNavigationController
{
  UINavigationController *searchNavigationController;
  void *v4;
  UINavigationController *v5;
  UINavigationController *v6;

  searchNavigationController = self->_searchNavigationController;
  if (!searchNavigationController)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B940]), "initWithSettingsController:", self);
    v5 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
    v6 = self->_searchNavigationController;
    self->_searchNavigationController = v5;

    searchNavigationController = self->_searchNavigationController;
  }
  return searchNavigationController;
}

- (void)handleEllipsisBarButtonItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _PUSettingsController *v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  char v32;

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUSettingsController currentSettings](self, "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = (_QWORD *)&unk_1AB0EE000;
  if (v7)
  {
    -[_PUSettingsController rootSettings](self, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v10)
    {
      objc_msgSend(MEMORY[0x1E0D7B3D0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFavoriteSettings:", v7);
      v13 = v12;
      if (v12)
        v14 = CFSTR("Unfavorite");
      else
        v14 = CFSTR("Favorite");
      if (v12)
        v15 = CFSTR("star.fill");
      else
        v15 = CFSTR("star");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke;
      v29[3] = &unk_1E58AA878;
      v30 = v11;
      v32 = v13;
      v31 = v7;
      v17 = v11;
      v18 = v14;
      v9 = &unk_1AB0EE000;
      objc_msgSend(v6, "_addActionWithTitle:image:style:handler:", v18, v16, 0, v29);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v20 = v9[283];
  v28[1] = v20;
  v28[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_2;
  v28[3] = &unk_1E58ABD10;
  v28[4] = self;
  objc_msgSend(v6, "_addActionWithTitle:image:style:handler:", CFSTR("Search"), v19, 0, v28);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bookmark"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    v25[1] = v20;
    v25[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_3;
    v25[3] = &unk_1E58ABCA8;
    v26 = v7;
    v27 = self;
    objc_msgSend(v6, "_addActionWithTitle:image:style:handler:", CFSTR("Configurations"), v21, 0, v25);

  }
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addActionWithTitle:image:style:handler:", CFSTR("Tap to Radar"), v22, 0, &__block_literal_global_795);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v23);

  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  -[_PUSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  objc_msgSend(v6, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBarButtonItem:", v5);

}

- (void)setToast:(id)a3
{
  PXToast *v5;
  PXToast *v6;

  v5 = (PXToast *)a3;
  if (self->_toast != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_toast, a3);
    v5 = v6;
  }

}

- (void)_warnForSettingsOverride
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Internal Settings Are Overridden"), CFSTR("Internal settings have been overridden by a defaults write. Changes made here may not be saved."), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v4);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___PUSettingsController__warnForSettingsOverride__block_invoke;
  v6[3] = &unk_1E58A8DE8;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Clear Overrides"), 2, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v5);

  -[_PUSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
}

- (void)_clearSettingsOverride
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_PUSettingsController currentSettings](self, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearManualOverrides");

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Overrides Cleared"), CFSTR("Internal settings overrides have been cleared. This will take effect on the next launch of Photos."), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v4);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Quit"), 2, &__block_literal_global_808);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v5);

  -[_PUSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_showReminderToQuitAfterChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLForKey:", CFSTR("InternalSettingsDisableReminderToQuitAfterChange")) & 1) == 0)
  {
    if (settingsWindow)
    {
      if ((objc_msgSend((id)settingsWindow, "isHidden") & 1) == 0)
      {
        -[_PUSettingsController toast](self, "toast");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("InternalSettingsReminderToQuitAfterChangeLastDate"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          if (!v5 || (objc_msgSend(v5, "timeIntervalSinceDate:", v4), v7 >= 480.0))
          {
            objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("InternalSettingsReminderToQuitAfterChangeLastDate"));
            v10[0] = MEMORY[0x1E0C809B0];
            v10[1] = 3221225472;
            v10[2] = __55___PUSettingsController__showReminderToQuitAfterChange__block_invoke;
            v10[3] = &unk_1E58A7870;
            v10[4] = self;
            objc_msgSend(MEMORY[0x1E0D7BB08], "show:", v10);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PUSettingsController setToast:](self, "setToast:", v8);

          }
        }
      }
    }
  }

}

- (void)_hideToast
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[_PUSettingsController toast](self, "toast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAnimated:", 1);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7B190];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35___PUSettingsController__hideToast__block_invoke;
  v7[3] = &unk_1E58A7898;
  v8 = v3;
  v6 = v3;
  v5 = (id)objc_msgSend(v4, "show:", v7);

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;

  v8 = objc_msgSend(v7, "isTransientKeyPath:", v6);
  if ((v8 & 1) == 0)
    -[_PUSettingsController _showReminderToQuitAfterChange](self, "_showReminderToQuitAfterChange");

}

- (PTSettings)rootSettings
{
  return self->_rootSettings;
}

- (id)onViewDidDisappearBlock
{
  return self->_onViewDidDisappearBlock;
}

- (void)setOnViewDidDisappearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (id)dismissButtonFactory
{
  return self->_dismissButtonFactory;
}

- (id)ellipsisBarButtonItemFactory
{
  return self->_ellipsisBarButtonItemFactory;
}

- (PXToast)toast
{
  return self->_toast;
}

- (UINavigationController)configurationsNavigationController
{
  return self->_configurationsNavigationController;
}

- (BOOL)hasWarnedForOverrides
{
  return self->_hasWarnedForOverrides;
}

- (void)setHasWarnedForOverrides:(BOOL)a3
{
  self->_hasWarnedForOverrides = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsNavigationController, 0);
  objc_storeStrong((id *)&self->_toast, 0);
  objc_storeStrong(&self->_ellipsisBarButtonItemFactory, 0);
  objc_storeStrong(&self->_dismissButtonFactory, 0);
  objc_storeStrong(&self->_onViewDidDisappearBlock, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_searchNavigationController, 0);
}

@end
