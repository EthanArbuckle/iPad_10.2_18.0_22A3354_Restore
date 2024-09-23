@implementation PUSlideshowMusicViewController

- (PUSlideshowMusicViewController)init
{
  PUSlideshowMusicViewController *v2;
  uint64_t v3;
  NSArray *mediaItems;
  PUSlideshowSettingsViewControllerSpec *v5;
  PUSlideshowSettingsViewControllerSpec *spec;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUSlideshowMusicViewController;
  v2 = -[PUSlideshowMusicViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    +[PUSlideshowMediaItem mediaItemsForOKThemes](PUSlideshowMediaItem, "mediaItemsForOKThemes");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaItems = v2->_mediaItems;
    v2->_mediaItems = (NSArray *)v3;

    v5 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v2->_spec;
    v2->_spec = v5;

    -[PUViewControllerSpec registerChangeObserver:](v2->_spec, "registerChangeObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PUViewControllerSpec unregisterChangeObserver:](self->_spec, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController dealloc](&v3, sel_dealloc);
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
  v11.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PUSlideshowMusicViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_NAVBAR_MUSIC_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v6;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PUSlideshowThemeMusicCell"));
  v8 = self->_tableView;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UITableView setTableFooterView:](v8, "setTableFooterView:", v9);

  -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 44.0);
  -[PUSlideshowMusicViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_tableView);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", 0);
  self->_shouldHideTableViewWhenViewWillDisappear = 0;
  -[UITableView setHidden:](self->_tableView, "setHidden:", 0);
  -[UITableView contentSize](self->_tableView, "contentSize");
  -[PUSlideshowMusicViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[PUSlideshowMusicViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowMusicViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 shouldHideTableViewWhenViewWillDisappear;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self->_spec, "shouldUseBlurredBackground"))
  {
    -[PUSlideshowMusicViewController navigationController](self, "navigationController");
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
  v6.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  tableView = self->_tableView;
  -[PUSlideshowMusicViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

  -[PUSlideshowMusicViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView contentSize](self->_tableView, "contentSize");
  objc_msgSend(v5, "setPreferredContentSize:");

  -[PUSlideshowMusicViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowMusicViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setCurrentMediaItem:(id)a3
{
  PUSlideshowMediaItem *v5;
  PUSlideshowMediaItem *v6;

  v5 = (PUSlideshowMediaItem *)a3;
  if (self->_currentMediaItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentMediaItem, a3);
    -[UITableView reloadData](self->_tableView, "reloadData");
    v5 = v6;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowMusicViewController;
  -[PUSlideshowMusicViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUSlideshowMusicViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUSlideshowMusicViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return -[PUSlideshowMusicViewController _needsUpdateSpec](self, "_needsUpdateSpec")
      || -[PUSlideshowMusicViewController _needsUpdateBackgroundView](self, "_needsUpdateBackgroundView");
}

- (void)_invalidateSpec
{
  -[PUSlideshowMusicViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 1);
  -[PUSlideshowMusicViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateBackgroundView
{
  -[PUSlideshowMusicViewController _setNeedsUpdateBackgroundView:](self, "_setNeedsUpdateBackgroundView:", 1);
  -[PUSlideshowMusicViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTableView
{
  -[PUSlideshowMusicViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 1);
  -[PUSlideshowMusicViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUSlideshowMusicViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUSlideshowMusicViewController _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    -[PUSlideshowMusicViewController _updateTableViewIfNeeded](self, "_updateTableViewIfNeeded");
    -[PUSlideshowMusicViewController _updateBackgroundViewIfNeeded](self, "_updateBackgroundViewIfNeeded");
    if (-[PUSlideshowMusicViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSlideshowMusicViewController.m"), 170, CFSTR("updates still needed after an update cycle"));

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

  if (-[PUSlideshowMusicViewController _needsUpdateSpec](self, "_needsUpdateSpec"))
  {
    -[PUSlideshowMusicViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 0);
    -[PUSlideshowMusicViewController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    spec = self->_spec;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PUSlideshowMusicViewController__updateSpecIfNeeded__block_invoke;
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
  id v4;

  if (-[PUSlideshowMusicViewController _needsUpdateBackgroundView](self, "_needsUpdateBackgroundView"))
  {
    -[PUSlideshowMusicViewController _setNeedsUpdateBackgroundView:](self, "_setNeedsUpdateBackgroundView:", 0);
    tableView = self->_tableView;
    -[PUSlideshowSettingsViewControllerSpec tableViewBackgroundColor](self->_spec, "tableViewBackgroundColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v4);

  }
}

- (void)_updateTableViewIfNeeded
{
  if (-[PUSlideshowMusicViewController _needsUpdateTableView](self, "_needsUpdateTableView"))
  {
    -[PUSlideshowMusicViewController _setNeedsUpdateTableView:](self, "_setNeedsUpdateTableView:", 0);
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[NSArray count](self->_mediaItems, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PUSlideshowItunesMusicCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PUSlideshowItunesMusicCell"));
      objc_msgSend(v8, "detailTextLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v11);

    }
    PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_MUSIC_LIBRARY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUSlideshowMediaItem type](self->_currentMediaItem, "type") != 1)
    {
      v15 = 1;
      goto LABEL_11;
    }
    objc_msgSend(v8, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowMediaItem localizedName](self->_currentMediaItem, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);

    v15 = 1;
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("PUSlideshowThemeMusicCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUSlideshowMediaItem isEqual:](self->_currentMediaItem, "isEqual:", v13))
      v15 = 3;
    else
      v15 = 0;
  }

LABEL_11:
  objc_msgSend(v8, "setAccessoryType:", v15);
  objc_msgSend(v8, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v12);

  -[PUSlideshowSettingsViewControllerSpec cellBackgroundColor](self->_spec, "cellBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v17);

  return v8;
}

- (void)_didFinish
{
  PUSlideshowMusicDelegate **p_delegate;
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
    objc_msgSend(v6, "musicPickerDidFinish:", self);

  }
}

- (void)_didPickMediaItem:(id)a3
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_currentMediaItem, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "musicPicker:didPickMediaItem:", self, v8);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  if (objc_msgSend(v8, "section"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2418]), "initWithMediaTypes:", 1);
    objc_msgSend(v6, "setShowsItemsWithProtectedAssets:", 0);
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView frame](self->_tableView, "frame");
    objc_msgSend(v7, "setFrame:");

    -[UITableView contentSize](self->_tableView, "contentSize");
    objc_msgSend(v6, "setPreferredContentSize:");
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setShowsCloudItems:", 0);
    objc_msgSend(v6, "setModalPresentationStyle:", 3);
    -[PUSlideshowMusicViewController presentModalViewController:withTransition:](self, "presentModalViewController:withTransition:", v6, 1);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", objc_msgSend(v8, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSlideshowMusicViewController _didPickMediaItem:](self, "_didPickMediaItem:", v6);
    -[PUSlideshowMusicViewController _didFinish](self, "_didFinish");
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return PULocalizedString(CFSTR("SLIDESHOW_SETTINGS_THEMES_MUSIC_SECTION_TITLE"));
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  objc_msgSend(a3, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "textLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v10);

  objc_msgSend(v11, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(v11, "setHidden:", a5 != 0);

}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (a4)
  {
    objc_msgSend(a4, "representativeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUSlideshowMediaItem initWitMediaItem:]([PUSlideshowMediaItem alloc], "initWitMediaItem:", v6);
    -[PUSlideshowMusicViewController _didPickMediaItem:](self, "_didPickMediaItem:", v7);
    -[UITableView reloadData](self->_tableView, "reloadData");

  }
  objc_msgSend(v8, "dismissModalViewControllerWithTransition:", 2);

}

- (void)mediaPickerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissModalViewControllerWithTransition:", 2);
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    -[PUSlideshowMusicViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", -[PUSlideshowSettingsViewControllerSpec rectEdgeForExtendedLayout](self->_spec, "rectEdgeForExtendedLayout"));
    -[PUSlideshowMusicViewController _invalidateTableView](self, "_invalidateTableView");
    -[PUSlideshowMusicViewController _invalidateBackgroundView](self, "_invalidateBackgroundView");
    -[PUSlideshowMusicViewController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (PUSlideshowMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (PUSlideshowMusicDelegate)delegate
{
  return (PUSlideshowMusicDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_currentMediaItem, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

uint64_t __53__PUSlideshowMusicViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setTraitCollection:", *(_QWORD *)(a1 + 40));
}

@end
