@implementation PUSlideshowThemeViewController

- (PUSlideshowThemeViewController)init
{
  PUSlideshowThemeViewController *v2;
  void *v3;
  id v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSArray *presets;
  PUSlideshowSettingsViewControllerSpec *v11;
  PUSlideshowSettingsViewControllerSpec *spec;
  PUSlideshowThemeViewController *result;
  void *v14;
  void *v15;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v16.receiver = self;
  v16.super_class = (Class)PUSlideshowThemeViewController;
  v2 = -[PUSlideshowThemeViewController init](&v16, sel_init);
  if (!v2)
    return v2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v3 = (void *)getOKProducerPresetsManagerClass_softClass_88503;
  v25 = getOKProducerPresetsManagerClass_softClass_88503;
  if (!getOKProducerPresetsManagerClass_softClass_88503)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = (uint64_t)__getOKProducerPresetsManagerClass_block_invoke_88504;
    v20 = &unk_1E58AAEB0;
    v21 = &v22;
    __getOKProducerPresetsManagerClass_block_invoke_88504((uint64_t)&v17);
    v3 = (void *)v23[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v4, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = (uint64_t)&v17;
  v19 = 0x2020000000;
  v6 = (id *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88505;
  v20 = (void *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88505;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88505)
  {
    v7 = SlideshowKitLibrary_88506();
    v6 = (id *)dlsym(v7, "kOKProducerPresetsFamilyPhotosPhone");
    *(_QWORD *)(v18 + 24) = v6;
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88505 = (uint64_t)v6;
  }
  _Block_object_dispose(&v17, 8);
  if (v6)
  {
    v8 = *v6;
    objc_msgSend(v5, "presetsForFamily:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    presets = v2->_presets;
    v2->_presets = (NSArray *)v9;

    v11 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v2->_spec;
    v2->_spec = v11;

    -[PUViewControllerSpec registerChangeObserver:](v2->_spec, "registerChangeObserver:", v2);
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkOKProducerPresetsFamilyPhotosPhone(void)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PUSlideshowThemeViewController.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PUViewControllerSpec unregisterChangeObserver:](self->_spec, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UITableView *v6;
  UITableView *tableView;
  UITableView *v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PUSlideshowThemeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_NAVBAR_THEMES_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v6;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PUSlideshowThemeDisclosureCell"));
  v8 = self->_tableView;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UITableView setTableFooterView:](v8, "setTableFooterView:", v9);

  -[PUSlideshowThemeViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_tableView);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", 0);
  self->_shouldHideTableViewWhenViewWillDisappear = 0;
  -[UITableView setHidden:](self->_tableView, "setHidden:", 0);
  -[UITableView contentSize](self->_tableView, "contentSize");
  -[PUSlideshowThemeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[PUSlideshowThemeViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowThemeViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 shouldHideTableViewWhenViewWillDisappear;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self->_spec, "shouldUseBlurredBackground"))
  {
    -[PUSlideshowThemeViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", self))
    {
      shouldHideTableViewWhenViewWillDisappear = self->_shouldHideTableViewWhenViewWillDisappear;

      if (!shouldHideTableViewWhenViewWillDisappear)
        return;
    }
    else
    {

    }
    -[UITableView setHidden:](self->_tableView, "setHidden:", 1);
  }
}

- (void)viewDidLayoutSubviews
{
  UITableView *tableView;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  tableView = self->_tableView;
  -[PUSlideshowThemeViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

  -[PUSlideshowThemeViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView contentSize](self->_tableView, "contentSize");
  objc_msgSend(v5, "setPreferredContentSize:");

  -[PUSlideshowThemeViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowThemeViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setCurrentPreset:(id)a3
{
  OKProducerPreset *v5;
  OKProducerPreset *v6;

  v5 = (OKProducerPreset *)a3;
  if (self->_currentPreset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentPreset, a3);
    -[UITableView reloadData](self->_tableView, "reloadData");
    v5 = v6;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowThemeViewController;
  -[PUSlideshowThemeViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUSlideshowThemeViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowThemeViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return -[PUSlideshowThemeViewController _needsUpdateSpec](self, "_needsUpdateSpec")
      || -[PUSlideshowThemeViewController _needsUpdateBackgroundView](self, "_needsUpdateBackgroundView");
}

- (void)_invalidateSpec
{
  -[PUSlideshowThemeViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 1);
  -[PUSlideshowThemeViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateBackgroundView
{
  -[PUSlideshowThemeViewController _setNeedsUpdateBackgroundView:](self, "_setNeedsUpdateBackgroundView:", 1);
  -[PUSlideshowThemeViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTableView
{
  -[PUSlideshowThemeViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 1);
  -[PUSlideshowThemeViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUSlideshowThemeViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUSlideshowThemeViewController _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    -[PUSlideshowThemeViewController _updateTableViewIfNeeded](self, "_updateTableViewIfNeeded");
    -[PUSlideshowThemeViewController _updateBackgroundViewIfNeeded](self, "_updateBackgroundViewIfNeeded");
    if (-[PUSlideshowThemeViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowThemeViewController.m"), 168, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (void)_updateSpecIfNeeded
{
  void *v3;
  void *v4;
  PUSlideshowSettingsViewControllerSpec *spec;
  id v6;
  _QWORD v7[5];
  id v8;

  if (-[PUSlideshowThemeViewController _needsUpdateSpec](self, "_needsUpdateSpec"))
  {
    -[PUSlideshowThemeViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 0);
    -[PUSlideshowThemeViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    spec = self->_spec;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PUSlideshowThemeViewController__updateSpecIfNeeded__block_invoke;
    v7[3] = &unk_1E58ABCA8;
    v7[4] = self;
    v8 = v4;
    v6 = v4;
    -[PUViewControllerSpec performChanges:](spec, "performChanges:", v7);

  }
}

- (void)_updateBackgroundViewIfNeeded
{
  UITableView *tableView;
  void *v4;
  UITableView *v5;
  id v6;

  if (-[PUSlideshowThemeViewController _needsUpdateBackgroundView](self, "_needsUpdateBackgroundView"))
  {
    -[PUSlideshowThemeViewController _setNeedsUpdateBackgroundView:](self, "_setNeedsUpdateBackgroundView:", 0);
    tableView = self->_tableView;
    -[PUSlideshowSettingsViewControllerSpec tableViewBackgroundColor](self->_spec, "tableViewBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v4);

    v5 = self->_tableView;
    -[PUSlideshowSettingsViewControllerSpec tableViewHeaderView](self->_spec, "tableViewHeaderView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView setTableHeaderView:](v5, "setTableHeaderView:", v6);

  }
}

- (void)_updateTableViewIfNeeded
{
  if (-[PUSlideshowThemeViewController _needsUpdateTableView](self, "_needsUpdateTableView"))
  {
    -[PUSlideshowThemeViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 0);
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)_didFinish
{
  PUSlideshowThemeDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self->_spec, "shouldUseBlurredBackground"))
      self->_shouldHideTableViewWhenViewWillDisappear = 1;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "themePickerDidFinish:", self);

  }
}

- (void)_didPickPreset:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "themePicker:didPickPreset:", self, v7);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_presets, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *presets;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PUSlideshowThemeDisclosureCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  presets = self->_presets;
  v9 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndexedSubscript:](presets, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[PUSlideshowSettingsViewControllerSpec cellBackgroundColor](self->_spec, "cellBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v13);

  if (-[OKProducerPreset isEqual:](self->_currentPreset, "isEqual:", v10))
    v14 = 3;
  else
    v14 = 0;
  objc_msgSend(v7, "setAccessoryType:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *presets;
  uint64_t v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  presets = self->_presets;
  v8 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndexedSubscript:](presets, "objectAtIndexedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowThemeViewController _didPickPreset:](self, "_didPickPreset:", v9);
  -[PUSlideshowThemeViewController _didFinish](self, "_didFinish");

}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    -[PUSlideshowThemeViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", -[PUSlideshowSettingsViewControllerSpec rectEdgeForExtendedLayout](self->_spec, "rectEdgeForExtendedLayout"));
    -[PUSlideshowThemeViewController _invalidateTableView](self, "_invalidateTableView");
    -[PUSlideshowThemeViewController _invalidateBackgroundView](self, "_invalidateBackgroundView");
    -[PUSlideshowThemeViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (OKProducerPreset)currentPreset
{
  return self->_currentPreset;
}

- (PUSlideshowThemeDelegate)delegate
{
  return (PUSlideshowThemeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (BOOL)_needsUpdateBackgroundView
{
  return self->__needsUpdateBackgroundView;
}

- (void)_setNeedsUpdateBackgroundView:(BOOL)a3
{
  self->__needsUpdateBackgroundView = a3;
}

- (BOOL)_needsUpdateTableView
{
  return self->__needsUpdateTableView;
}

- (void)_setNeedsUpdateTableView:(BOOL)a3
{
  self->__needsUpdateTableView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

uint64_t __53__PUSlideshowThemeViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setTraitCollection:", *(_QWORD *)(a1 + 40));
}

@end
