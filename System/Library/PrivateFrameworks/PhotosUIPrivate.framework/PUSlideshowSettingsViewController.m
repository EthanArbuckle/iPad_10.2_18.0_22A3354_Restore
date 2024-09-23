@implementation PUSlideshowSettingsViewController

- (PUSlideshowSettingsViewController)initWithSession:(id)a3
{
  id v5;
  PUSlideshowSettingsViewController *v6;
  PUSlideshowSettingsViewController *v7;
  uint64_t v8;
  PUSlideshowSettingsViewModel *settingsViewModel;
  PUSlideshowSettingsViewControllerSpec *v10;
  PUSlideshowSettingsViewControllerSpec *spec;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUSlideshowSettingsViewController;
  v6 = -[PUSlideshowSettingsViewController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    -[PUSlideshowSession settingsViewModel](v7->_session, "settingsViewModel");
    v8 = objc_claimAutoreleasedReturnValue();
    settingsViewModel = v7->_settingsViewModel;
    v7->_settingsViewModel = (PUSlideshowSettingsViewModel *)v8;

    -[PUSlideshowSettingsViewModel registerChangeObserver:](v7->_settingsViewModel, "registerChangeObserver:", v7);
    v10 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v7->_spec;
    v7->_spec = v10;

    -[PUViewControllerSpec registerChangeObserver:](v7->_spec, "registerChangeObserver:", v7);
    -[PUSlideshowSettingsViewModel preset](v7->_settingsViewModel, "preset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowSettingsViewController _setPendingPreset:](v7, "_setPendingPreset:", v12);

    -[PUSlideshowSettingsViewModel mediaItem](v7->_settingsViewModel, "mediaItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowSettingsViewController _setPendingMediaItem:](v7, "_setPendingMediaItem:", v13);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PUSlideshowSettingsViewModel unregisterChangeObserver:](self->_settingsViewModel, "unregisterChangeObserver:", self);
  -[PUViewControllerSpec unregisterChangeObserver:](self->_spec, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  UITableView *v9;
  UITableView *tableView;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PUSlideshowSettingsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_NAVBAR_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__didTapDoneButton_);
  -[PUSlideshowSettingsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[PUSlideshowSettingsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = (UITableView *)objc_msgSend(v7, "initWithFrame:");
  tableView = self->_tableView;
  self->_tableView = v9;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[PUSlideshowSettingsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_tableView);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  self->_shouldHideTableViewWhenViewWillDisappear = 0;
  -[UITableView setHidden:](self->_tableView, "setHidden:", 0);
  -[PUSlideshowSettingsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
  -[PUSlideshowSettingsViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowSettingsViewController _invalidateNavigationBar](self, "_invalidateNavigationBar");
  -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[UITableView setHidden:](self->_tableView, "setHidden:", self->_shouldHideTableViewWhenViewWillDisappear);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UITableView contentSize](self->_tableView, "contentSize");
  -[PUSlideshowSettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewController;
  -[PUSlideshowSettingsViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUSlideshowSettingsViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setPendingPreset:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->__pendingPreset) & 1) == 0)
  {
    objc_storeStrong((id *)&self->__pendingPreset, a3);
    -[PUSlideshowSettingsViewController _invalidatePreset](self, "_invalidatePreset");
    -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");
  }

}

- (void)_setPendingMediaItem:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->__pendingMediaItem) & 1) == 0)
  {
    objc_storeStrong((id *)&self->__pendingMediaItem, a3);
    -[PUSlideshowSettingsViewController _invalidateMediaItem](self, "_invalidateMediaItem");
    -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");
  }

}

- (BOOL)_needsUpdate
{
  return -[PUSlideshowSettingsViewController _needsUpdateSpec](self, "_needsUpdateSpec")
      || -[PUSlideshowSettingsViewController _needsUpdateTableView](self, "_needsUpdateTableView")
      || -[PUSlideshowSettingsViewController _needsUpdateNavigationBar](self, "_needsUpdateNavigationBar")
      || -[PUSlideshowSettingsViewController _needsUpdatePreset](self, "_needsUpdatePreset")
      || -[PUSlideshowSettingsViewController _needsUpdateMusicOn](self, "_needsUpdateMusicOn");
}

- (void)_invalidateSpec
{
  -[PUSlideshowSettingsViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTableView
{
  -[PUSlideshowSettingsViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateNavigationBar
{
  -[PUSlideshowSettingsViewController _setNeedsUpdateNavigationBar:](self, "_setNeedsUpdateNavigationBar:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidatePreset
{
  -[PUSlideshowSettingsViewController _setNeedsUpdatePreset:](self, "_setNeedsUpdatePreset:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateMediaItem
{
  -[PUSlideshowSettingsViewController _setNeedsUpdateMediaItem:](self, "_setNeedsUpdateMediaItem:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateMusicOn
{
  -[PUSlideshowSettingsViewController _setNeedsUpdateMusicOn:](self, "_setNeedsUpdateMusicOn:", 1);
  -[PUSlideshowSettingsViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUSlideshowSettingsViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUSlideshowSettingsViewController _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    -[PUSlideshowSettingsViewController _updateTableViewIfNeeded](self, "_updateTableViewIfNeeded");
    -[PUSlideshowSettingsViewController _updateNavigationBarIfNeeded](self, "_updateNavigationBarIfNeeded");
    -[PUSlideshowSettingsViewController _updatePresetIfNeeded](self, "_updatePresetIfNeeded");
    -[PUSlideshowSettingsViewController _updateMediaItemIfNeeded](self, "_updateMediaItemIfNeeded");
    -[PUSlideshowSettingsViewController _updateMusicOnIfNeeded](self, "_updateMusicOnIfNeeded");
    if (-[PUSlideshowSettingsViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSettingsViewController.m"), 213, CFSTR("updates still needed after an update cycle"));

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

  if (-[PUSlideshowSettingsViewController _needsUpdateSpec](self, "_needsUpdateSpec"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 0);
    -[PUSlideshowSettingsViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    spec = self->_spec;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__PUSlideshowSettingsViewController__updateSpecIfNeeded__block_invoke;
    v7[3] = &unk_1E58ABCA8;
    v7[4] = self;
    v8 = v4;
    v6 = v4;
    -[PUViewControllerSpec performChanges:](spec, "performChanges:", v7);

  }
}

- (void)_updateTableViewIfNeeded
{
  UITableView *tableView;
  void *v4;
  UITableView *v5;
  void *v6;

  if (-[PUSlideshowSettingsViewController _needsUpdateTableView](self, "_needsUpdateTableView"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 0);
    tableView = self->_tableView;
    -[PUSlideshowSettingsViewControllerSpec tableViewBackgroundColor](self->_spec, "tableViewBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v4);

    v5 = self->_tableView;
    -[PUSlideshowSettingsViewControllerSpec tableViewHeaderView](self->_spec, "tableViewHeaderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setTableHeaderView:](v5, "setTableHeaderView:", v6);

    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)_updateNavigationBarIfNeeded
{
  _BOOL4 v3;
  id v4;

  if (-[PUSlideshowSettingsViewController _needsUpdateNavigationBar](self, "_needsUpdateNavigationBar"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdateNavigationBar:](self, "_setNeedsUpdateNavigationBar:", 0);
    v3 = -[PUSlideshowSettingsViewControllerSpec shouldShowNavigationBar](self->_spec, "shouldShowNavigationBar");
    -[PUSlideshowSettingsViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNavigationBarHidden:", !v3);

  }
}

- (void)_updatePresetIfNeeded
{
  if (-[PUSlideshowSettingsViewController _needsUpdatePreset](self, "_needsUpdatePreset"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdatePreset:](self, "_setNeedsUpdatePreset:", 0);
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)_updateMediaItemIfNeeded
{
  id v3;

  if (-[PUSlideshowSettingsViewController _needsUpdateMediaItem](self, "_needsUpdateMediaItem"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdateMediaItem:](self, "_setNeedsUpdateMediaItem:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](self->_tableView, "reloadSections:withRowAnimation:", v3, 100);

  }
}

- (void)_updateMusicOnIfNeeded
{
  id v3;

  if (-[PUSlideshowSettingsViewController _needsUpdateMusicOn](self, "_needsUpdateMusicOn"))
  {
    -[PUSlideshowSettingsViewController _setNeedsUpdateMusicOn:](self, "_setNeedsUpdateMusicOn:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadSections:withRowAnimation:](self->_tableView, "reloadSections:withRowAnimation:", v3, 100);

  }
}

- (void)_synchronizedChangedSettings
{
  OKProducerPreset *pendingPreset;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  PUSlideshowMediaItem *pendingMediaItem;
  void *v10;
  PUSlideshowSettingsViewModel *settingsViewModel;
  _QWORD v12[5];
  char v13;
  _QWORD v14[4];
  id v15;

  pendingPreset = self->__pendingPreset;
  if (pendingPreset)
  {
    -[PUSlideshowSettingsViewModel preset](self->_settingsViewModel, "preset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[OKProducerPreset isEqual:](pendingPreset, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      -[PUSlideshowSession viewModel](self->_session, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke;
      v14[3] = &unk_1E58ABD10;
      v8 = v6;
      v15 = v8;
      objc_msgSend(v8, "performChanges:", v14);
      pendingMediaItem = self->__pendingMediaItem;
      if (pendingMediaItem)
      {
        -[PUSlideshowSettingsViewModel mediaItem](self->_settingsViewModel, "mediaItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(pendingMediaItem) = !-[PUSlideshowMediaItem isEqual:](pendingMediaItem, "isEqual:", v10);

      }
      settingsViewModel = self->_settingsViewModel;
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke_2;
      v12[3] = &unk_1E58AAD68;
      v12[4] = self;
      v13 = (char)pendingMediaItem;
      -[PUViewModel performChanges:](settingsViewModel, "performChanges:", v12);

    }
  }
}

- (void)_didTapDoneButton:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  -[PUSlideshowSettingsViewController _synchronizedChangedSettings](self, "_synchronizedChangedSettings", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "settingsDidFinished:", self);

    }
  }
}

- (void)_toggleRepeat:(id)a3
{
  char v4;
  PUSlideshowSettingsViewModel *settingsViewModel;
  _QWORD v6[5];
  char v7;

  v4 = objc_msgSend(a3, "isOn");
  settingsViewModel = self->_settingsViewModel;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PUSlideshowSettingsViewController__toggleRepeat___block_invoke;
  v6[3] = &unk_1E58AAD68;
  v6[4] = self;
  v7 = v4;
  -[PUViewModel performChanges:](settingsViewModel, "performChanges:", v6);
}

- (void)_toggleMusic:(id)a3
{
  char v4;
  PUSlideshowSettingsViewModel *settingsViewModel;
  _QWORD v6[5];
  char v7;

  v4 = objc_msgSend(a3, "isOn");
  settingsViewModel = self->_settingsViewModel;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PUSlideshowSettingsViewController__toggleMusic___block_invoke;
  v6[3] = &unk_1E58AAD68;
  v6[4] = self;
  v7 = v4;
  -[PUViewModel performChanges:](settingsViewModel, "performChanges:", v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PUSlideshowSpeedCell *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PUSlideshowSpeedCell *v28;
  void *v29;
  void *v30;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  -[PUSlideshowSettingsViewController _pendingPreset](self, "_pendingPreset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v9)
  {
    case 0:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("SlideshowSettingsViewControllerSubtitleCellIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("SlideshowSettingsViewControllerSubtitleCellIdentifier"));
        objc_msgSend(v11, "setAccessoryType:", 1);
        objc_msgSend(v11, "detailTextLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTextColor:", v14);

      }
      objc_msgSend(v11, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_THEME"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v16);

      v17 = 1016;
      goto LABEL_10;
    case 1:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("SlideshowSettingsViewControllerSubtitleCellIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("SlideshowSettingsViewControllerSubtitleCellIdentifier"));
        objc_msgSend(v11, "setAccessoryType:", 1);
        objc_msgSend(v11, "detailTextLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "textColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTextColor:", v22);

      }
      objc_msgSend(v11, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_SELECTED_MUSIC"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v24);

      v17 = 1024;
LABEL_10:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v17), "localizedName");
      v19 = (PUSlideshowSpeedCell *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailTextLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v19);
      goto LABEL_15;
    case 2:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("SlideshowSettingsViewControllerRepeatCellIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v11 = v18;
        objc_msgSend(v18, "accessoryView");
        v19 = (PUSlideshowSpeedCell *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("SlideshowSettingsViewControllerRepeatCellIdentifier"));
        v19 = (PUSlideshowSpeedCell *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
        -[PUSlideshowSpeedCell setOn:](v19, "setOn:", -[PUSlideshowSettingsViewModel shouldRepeat](self->_settingsViewModel, "shouldRepeat"));
        -[PUSlideshowSpeedCell addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", self, sel__toggleRepeat_, 4096);
        objc_msgSend(v11, "setAccessoryView:", v19);
        objc_msgSend(v11, "setSelectionStyle:", 0);
      }
      -[PUSlideshowSpeedCell setEnabled:](v19, "setEnabled:", objc_msgSend(v10, "supportsSettingType:", 1));
      objc_msgSend(v11, "textLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_REPEAT"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v27);

LABEL_15:
      goto LABEL_19;
    case 3:
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("SlideshowSettingsViewControllerSpeedCellIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v19 = v26;
      }
      else
      {
        v28 = -[PUSlideshowSpeedCell initWithStyle:reuseIdentifier:]([PUSlideshowSpeedCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("SlideshowSettingsViewControllerSpeedCellIdentifier"));
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUSlideshowSpeedCell setBackgroundColor:](v28, "setBackgroundColor:", v29);

        -[PUSlideshowSpeedCell setDelegate:](v28, "setDelegate:", self);
        v19 = v28;
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSettingsViewController.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v34);
          goto LABEL_22;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSlideshowSpeedCell px_descriptionForAssertionMessage](v19, "px_descriptionForAssertionMessage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSettingsViewController.m"), 397, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v34, v36);

LABEL_22:
LABEL_18:
      -[PUSlideshowSettingsViewModel stepDuration](self->_settingsViewModel, "stepDuration");
      -[PUSlideshowSpeedCell setStepDuration:](v19, "setStepDuration:");
      -[PUSlideshowSpeedCell setEnabled:](v19, "setEnabled:", objc_msgSend(v10, "supportsSettingType:", 2));
      -[PUSlideshowSpeedCell setNeedsUpdateConstraints](v19, "setNeedsUpdateConstraints");
      -[PUSlideshowSpeedCell updateConstraintsIfNeeded](v19, "updateConstraintsIfNeeded");
      v11 = v19;
LABEL_19:

      -[PUSlideshowSettingsViewControllerSpec cellBackgroundColor](self->_spec, "cellBackgroundColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v30);

      objc_msgSend(v11, "setNeedsLayout");
      objc_msgSend(v11, "layoutIfNeeded");

      return v11;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowSettingsViewController.m"), 408, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int v7;
  PUSlideshowMusicViewController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  if (v7 == 1)
  {
    v8 = objc_alloc_init(PUSlideshowMusicViewController);
    -[PUSlideshowSettingsViewController _pendingMediaItem](self, "_pendingMediaItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowMusicViewController setCurrentMediaItem:](v8, "setCurrentMediaItem:", v9);
  }
  else
  {
    if (v7)
      goto LABEL_8;
    v8 = objc_alloc_init(PUSlideshowThemeViewController);
    -[PUSlideshowSettingsViewController _pendingPreset](self, "_pendingPreset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowMusicViewController setCurrentPreset:](v8, "setCurrentPreset:", v9);
  }

  -[PUSlideshowMusicViewController setDelegate:](v8, "setDelegate:", self);
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self->_spec, "shouldUseBlurredBackground"))
    self->_shouldHideTableViewWhenViewWillDisappear = 1;
  -[PUSlideshowSettingsViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v8, 1);

LABEL_8:
  objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v6, 0);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (self->_settingsViewModel == a3)
  {
    if (objc_msgSend(a4, "musicOnDidChange"))
    {
      -[PUSlideshowSettingsViewController _invalidateMusicOn](self, "_invalidateMusicOn");
      -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");
    }
  }
}

- (void)themePicker:(id)a3 didPickPreset:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  -[PUSlideshowSettingsViewModel mediaItem](self->_settingsViewModel, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 2)
  {
    v6 = -[PUSlideshowMediaItem initWitPreset:]([PUSlideshowMediaItem alloc], "initWitPreset:", v7);
    -[PUSlideshowSettingsViewController _setPendingMediaItem:](self, "_setPendingMediaItem:", v6);

  }
  -[PUSlideshowSettingsViewController _setPendingPreset:](self, "_setPendingPreset:", v7);

}

- (void)themePickerDidFinish:(id)a3
{
  id v3;
  id v4;

  -[PUSlideshowSettingsViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)musicPicker:(id)a3 didPickMediaItem:(id)a4
{
  id v5;
  PUSlideshowSettingsViewModel *settingsViewModel;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[PUSlideshowSettingsViewController _setPendingMediaItem:](self, "_setPendingMediaItem:", v5);
  settingsViewModel = self->_settingsViewModel;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PUSlideshowSettingsViewController_musicPicker_didPickMediaItem___block_invoke;
  v8[3] = &unk_1E58ABCA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PUViewModel performChanges:](settingsViewModel, "performChanges:", v8);

}

- (void)musicPickerDidFinish:(id)a3
{
  id v3;
  id v4;

  -[PUSlideshowSettingsViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    -[PUSlideshowSettingsViewController _invalidateTableView](self, "_invalidateTableView");
    -[PUSlideshowSettingsViewController _invalidateNavigationBar](self, "_invalidateNavigationBar");
    -[PUSlideshowSettingsViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;

  v4 = a3;
  -[PUSlideshowSettingsViewController _synchronizedChangedSettings](self, "_synchronizedChangedSettings");
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v7 = a3;
  v8 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__PUSlideshowSettingsViewController_presentationController_willPresentWithAdaptiveStyle_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E58A8108;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)PUSlideshowSpeedCell:(id)a3 stepDurationDidChange:(double)a4
{
  PUSlideshowSettingsViewModel *settingsViewModel;
  _QWORD v5[6];

  settingsViewModel = self->_settingsViewModel;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__PUSlideshowSettingsViewController_PUSlideshowSpeedCell_stepDurationDidChange___block_invoke;
  v5[3] = &unk_1E58AACF0;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  -[PUViewModel performChanges:](settingsViewModel, "performChanges:", v5);
}

- (PUSlideshowSettingsViewControllerDelegate)delegate
{
  return (PUSlideshowSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (BOOL)_needsUpdateTableView
{
  return self->__needsUpdateTableView;
}

- (void)_setNeedsUpdateTableView:(BOOL)a3
{
  self->__needsUpdateTableView = a3;
}

- (BOOL)_needsUpdateNavigationBar
{
  return self->__needsUpdateNavigationBar;
}

- (void)_setNeedsUpdateNavigationBar:(BOOL)a3
{
  self->__needsUpdateNavigationBar = a3;
}

- (BOOL)_needsUpdatePreset
{
  return self->__needsUpdatePreset;
}

- (void)_setNeedsUpdatePreset:(BOOL)a3
{
  self->__needsUpdatePreset = a3;
}

- (BOOL)_needsUpdateMediaItem
{
  return self->__needsUpdateMediaItem;
}

- (void)_setNeedsUpdateMediaItem:(BOOL)a3
{
  self->__needsUpdateMediaItem = a3;
}

- (BOOL)_needsUpdateMusicOn
{
  return self->__needsUpdateMusicOn;
}

- (void)_setNeedsUpdateMusicOn:(BOOL)a3
{
  self->__needsUpdateMusicOn = a3;
}

- (OKProducerPreset)_pendingPreset
{
  return self->__pendingPreset;
}

- (PUSlideshowMediaItem)_pendingMediaItem
{
  return self->__pendingMediaItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingMediaItem, 0);
  objc_storeStrong((id *)&self->__pendingPreset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_settingsViewModel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

uint64_t __80__PUSlideshowSettingsViewController_PUSlideshowSpeedCell_stepDurationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setStepDuration:", *(double *)(a1 + 40));
}

void __111__PUSlideshowSettingsViewController_presentationController_willPresentWithAdaptiveStyle_transitionCoordinator___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateSpec");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateIfNeeded");

}

uint64_t __66__PUSlideshowSettingsViewController_musicPicker_didPickMediaItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setMediaItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__PUSlideshowSettingsViewController__toggleMusic___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setMusicOn:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__PUSlideshowSettingsViewController__toggleRepeat___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setShouldRepeat:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 4);
}

uint64_t __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setPreset:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016));
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setMediaItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
  return result;
}

uint64_t __56__PUSlideshowSettingsViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setTraitCollection:", *(_QWORD *)(a1 + 40));
}

@end
