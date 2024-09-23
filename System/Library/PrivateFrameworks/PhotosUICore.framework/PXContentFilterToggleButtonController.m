@implementation PXContentFilterToggleButtonController

- (PXContentFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PXContentFilterToggleButtonController *v7;
  uint64_t v8;
  UIColor *primaryTintColor;
  uint64_t v10;
  UIColor *secondaryTintColor;
  void *v12;
  uint64_t v13;
  UIColor *originalUnfilteredBackgroundColor;
  uint64_t v15;
  UIImageSymbolConfiguration *symbolConfiguration;
  uint64_t v17;
  PXUpdater *updater;
  objc_super v20;

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXContentFilterToggleButtonController;
  v7 = -[PXContentFilterToggleButtonController init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
    primaryTintColor = v7->_primaryTintColor;
    v7->_primaryTintColor = (UIColor *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    secondaryTintColor = v7->_secondaryTintColor;
    v7->_secondaryTintColor = (UIColor *)v10;

    objc_msgSend(v6, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundColor");
    v13 = objc_claimAutoreleasedReturnValue();
    originalUnfilteredBackgroundColor = v7->_originalUnfilteredBackgroundColor;
    v7->_originalUnfilteredBackgroundColor = (UIColor *)v13;

    objc_msgSend(v6, "preferredSymbolConfigurationForImage");
    v15 = objc_claimAutoreleasedReturnValue();
    symbolConfiguration = v7->_symbolConfiguration;
    v7->_symbolConfiguration = (UIImageSymbolConfiguration *)v15;

    v7->_roundedButton = v4;
    v17 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v17;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateButton);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateButtonMenu);
    -[PXContentFilterToggleButtonController _setupButtonWithConfiguration:roundedButton:](v7, "_setupButtonWithConfiguration:roundedButton:", v6, v4);
  }

  return v7;
}

- (void)setLibraryFilterState:(id)a3
{
  PXLibraryFilterState *v4;
  PXLibraryFilterState *v5;
  PXLibraryFilterState *v6;
  BOOL v7;
  _QWORD v8[5];
  PXLibraryFilterState *v9;

  v4 = (PXLibraryFilterState *)a3;
  v5 = self->_libraryFilterState;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXLibraryFilterState isEqual:](v4, "isEqual:", v5);

    if (!v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__PXContentFilterToggleButtonController_setLibraryFilterState___block_invoke;
      v8[3] = &unk_1E511E408;
      v8[4] = self;
      v9 = v4;
      -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v8);

    }
  }

}

- (void)setContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  PXContentFilterState *v5;
  PXContentFilterState *v6;
  BOOL v7;
  _QWORD v8[5];
  PXContentFilterState *v9;

  v4 = (PXContentFilterState *)a3;
  v5 = self->_contentFilterState;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXContentFilterState isEqual:](v4, "isEqual:", v5);

    if (!v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__PXContentFilterToggleButtonController_setContentFilterState___block_invoke;
      v8[3] = &unk_1E511E408;
      v8[4] = self;
      v9 = v4;
      -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v8);

    }
  }

}

- (void)setPrimaryTintColor:(id)a3
{
  UIColor *v4;
  char v5;
  UIColor *v6;
  UIColor *primaryTintColor;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = self->_primaryTintColor;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIColor isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)-[UIColor copy](v8, "copy");
      primaryTintColor = self->_primaryTintColor;
      self->_primaryTintColor = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setSecondaryTintColor:(id)a3
{
  UIColor *v4;
  char v5;
  UIColor *v6;
  UIColor *secondaryTintColor;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = self->_secondaryTintColor;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIColor isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)-[UIColor copy](v8, "copy");
      secondaryTintColor = self->_secondaryTintColor;
      self->_secondaryTintColor = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setSymbolName:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *symbolName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_symbolName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      symbolName = self->_symbolName;
      self->_symbolName = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setFilteringSymbolName:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *filteringSymbolName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_filteringSymbolName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      filteringSymbolName = self->_filteringSymbolName;
      self->_filteringSymbolName = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setSymbolConfiguration:(id)a3
{
  UIImageSymbolConfiguration *v4;
  char v5;
  UIImageSymbolConfiguration *v6;
  UIImageSymbolConfiguration *symbolConfiguration;
  UIImageSymbolConfiguration *v8;

  v8 = (UIImageSymbolConfiguration *)a3;
  v4 = self->_symbolConfiguration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImageSymbolConfiguration isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImageSymbolConfiguration *)-[UIImageSymbolConfiguration copy](v8, "copy");
      symbolConfiguration = self->_symbolConfiguration;
      self->_symbolConfiguration = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setFilteringSymbolConfiguration:(id)a3
{
  UIImageSymbolConfiguration *v4;
  char v5;
  UIImageSymbolConfiguration *v6;
  UIImageSymbolConfiguration *filteringSymbolConfiguration;
  UIImageSymbolConfiguration *v8;

  v8 = (UIImageSymbolConfiguration *)a3;
  v4 = self->_filteringSymbolConfiguration;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIImageSymbolConfiguration isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIImageSymbolConfiguration *)-[UIImageSymbolConfiguration copy](v8, "copy");
      filteringSymbolConfiguration = self->_filteringSymbolConfiguration;
      self->_filteringSymbolConfiguration = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)setBaseBackgroundColor:(id)a3
{
  UIColor *v4;
  char v5;
  UIColor *v6;
  UIColor *baseBackgroundColor;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v4 = self->_baseBackgroundColor;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[UIColor isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (UIColor *)-[UIColor copy](v8, "copy");
      baseBackgroundColor = self->_baseBackgroundColor;
      self->_baseBackgroundColor = v6;

      -[PXContentFilterToggleButtonController _invalidateButton](self, "_invalidateButton");
    }
  }

}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, PXContentFilterToggleButtonController *))a3 + 2))(a3, self);
  if (!isPerformingChanges)
    -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  self->_isPerformingChanges = isPerformingChanges;
}

- (NSArray)filterMenuItems
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentFilterToggleButtonController.m"), 143, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentFilterToggleButtonController filterMenuItems]", v6);

  abort();
}

- (NSArray)viewOptionsMenuItems
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentFilterToggleButtonController.m"), 147, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentFilterToggleButtonController viewOptionsMenuItems]", v6);

  abort();
}

- (NSArray)allMenuItems
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentFilterToggleButtonController.m"), 151, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentFilterToggleButtonController allMenuItems]", v6);

  abort();
}

- (BOOL)shouldHideButton
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PXContentFilterToggleButtonController libraryFilterState](self, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[PXContentFilterToggleButtonController contentFilterState](self, "contentFilterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)invalidateButton
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__PXContentFilterToggleButtonController_invalidateButton__block_invoke;
  v2[3] = &unk_1E51321B0;
  v2[4] = self;
  -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v2);
}

- (void)invalidateButtonMenu
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__PXContentFilterToggleButtonController_invalidateButtonMenu__block_invoke;
  v2[3] = &unk_1E51321B0;
  v2[4] = self;
  -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v2);
}

- (void)_setupButtonWithConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXContentFilterToggleButtonController *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PXContentFilterToggleButtonController__setupButtonWithConfiguration_roundedButton___block_invoke;
  v8[3] = &unk_1E511E430;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[PXContentFilterToggleButtonController performChanges:](self, "performChanges:", v8);

}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentFilterToggleButtonController.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isPerformingChanges"));

  }
}

- (void)_invalidateButton
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateButton);
}

- (void)_updateButton
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *originalUnfilteredBackgroundColor;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  -[PXContentFilterToggleButtonController libraryFilterState](self, "libraryFilterState");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContentFilterToggleButtonController contentFilterState](self, "contentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "isFiltering") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isFiltering");
  -[PXContentFilterToggleButtonController button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (self->_roundedButton)
  {
    -[PXContentFilterToggleButtonController baseBackgroundColor](self, "baseBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v5, "backgroundColor");
      v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
      originalUnfilteredBackgroundColor = v11;
      if (!v11)
        originalUnfilteredBackgroundColor = self->_originalUnfilteredBackgroundColor;
      v10 = originalUnfilteredBackgroundColor;

    }
    v13 = v10;
    if (v4)
    {
      objc_msgSend(v5, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    if (v4)
  }
  if ((v4 & 1) != 0)
    -[PXContentFilterToggleButtonController primaryTintColor](self, "primaryTintColor");
  else
    -[PXContentFilterToggleButtonController secondaryTintColor](self, "secondaryTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseForegroundColor:", v15);
  -[PXContentFilterToggleButtonController symbolName](self, "symbolName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[PXContentFilterToggleButtonController allMenuItems](self, "allMenuItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v19, "count") < 2)
    {
      v18 = CFSTR("line.3.horizontal.decrease");
    }
    else
    {
      PXContentFilterImageNameForFilterStates(v37, v3);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  -[PXContentFilterToggleButtonController symbolConfiguration](self, "symbolConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXContentFilterToggleButtonController filteringSymbolName](self, "filteringSymbolName");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v18;
    v24 = v23;

    -[PXContentFilterToggleButtonController filteringSymbolConfiguration](self, "filteringSymbolConfiguration");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (void *)v25;
    else
      v27 = v20;
    v28 = v27;

    v18 = v24;
    v20 = v28;
  }
  v29 = (void *)MEMORY[0x1E0DC3870];
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v30);

    objc_msgSend(v7, "setPreferredSymbolConfigurationForImage:", v20);
  }
  else
  {
    v36 = v3;
    objc_msgSend(v7, "image");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "systemImageNamed:withConfiguration:", v18, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PXContentFilterToggleButtonController primaryTintColor](self, "primaryTintColor");
    else
      -[PXContentFilterToggleButtonController secondaryTintColor](self, "secondaryTintColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageWithTintColor:renderingMode:", v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v35);

    v3 = v36;
  }
  objc_msgSend(v5, "setConfiguration:", v7);
  objc_msgSend(v5, "setHidden:", -[PXContentFilterToggleButtonController shouldHideButton](self, "shouldHideButton"));
  -[PXContentFilterToggleButtonController _invalidateButtonMenu](self, "_invalidateButtonMenu");

}

- (void)_invalidateButtonMenu
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateButtonMenu);
}

- (id)_deferredMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__PXContentFilterToggleButtonController__deferredMenu__block_invoke;
  v11 = &unk_1E5134E50;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC39D0];
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_updateChildMenuIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXFilterMenuTitle"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PXContentFilterToggleButtonController filterMenuItems](self, "filterMenuItems");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXContentViewOptionsMenuTitle"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (!v10)
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[PXContentFilterToggleButtonController viewOptionsMenuItems](self, "viewOptionsMenuItems");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;
  objc_msgSend(v4, "menuByReplacingChildren:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

- (void)_updateButtonMenu
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[UIButton contextMenuInteraction](self->_button, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXContentFilterToggleButtonController__updateButtonMenu__block_invoke;
  v4[3] = &unk_1E511E458;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "updateVisibleMenuWithBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (UIColor)primaryTintColor
{
  return self->_primaryTintColor;
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)filteringSymbolName
{
  return self->_filteringSymbolName;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (UIImageSymbolConfiguration)filteringSymbolConfiguration
{
  return self->_filteringSymbolConfiguration;
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_filteringSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_filteringSymbolName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
  objc_storeStrong((id *)&self->_originalUnfilteredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

id __58__PXContentFilterToggleButtonController__updateButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateChildMenuIfNecessary:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;

      v3 = v7;
LABEL_19:

      goto LABEL_20;
    }
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v20 = 0;
      v21 = WeakRetained;
      v14 = 0;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_updateChildMenuIfNecessary:", v17, v20, v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "addObject:", v18);
            v14 = 1;
          }
          else
          {
            objc_msgSend(v10, "addObject:", v17);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);

      if ((v14 & 1) == 0)
      {
        v6 = v20;
        WeakRetained = v21;
        goto LABEL_18;
      }
      objc_msgSend(v3, "menuByReplacingChildren:", v10);
      v11 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v20;
      WeakRetained = v21;
    }

LABEL_18:
    goto LABEL_19;
  }
LABEL_20:

  return v3;
}

void __54__PXContentFilterToggleButtonController__deferredMenu__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "allMenuItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA60]);
  }

}

uint64_t __85__PXContentFilterToggleButtonController__setupButtonWithConfiguration_roundedButton___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    +[PXPhotosViewRoundedAccessoryButton buttonWithConfiguration:primaryAction:](PXPhotosViewRoundedAccessoryButton, "buttonWithConfiguration:primaryAction:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMenuOffset:", 0.0, -8.0);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v2, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v7 + 104);
    *(_QWORD *)(v7 + 104) = v6;
  }

  objc_msgSend(*(id *)(a1 + 40), "_deferredMenu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setMenu:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setShowsMenuAsPrimaryAction:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setPreferredMenuElementOrder:", 2);
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateButton");
}

uint64_t __61__PXContentFilterToggleButtonController_invalidateButtonMenu__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButtonMenu");
}

uint64_t __57__PXContentFilterToggleButtonController_invalidateButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __63__PXContentFilterToggleButtonController_setContentFilterState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

uint64_t __63__PXContentFilterToggleButtonController_setLibraryFilterState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateButton");
}

@end
