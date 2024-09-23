@implementation TVRUICastViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUICastViewController;
  -[TVRUICastViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TVRUICastViewController configureHierarchy](self, "configureHierarchy");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRUICastViewController;
  -[TVRUICastViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[TVRUICastViewController setHasAppeared:](self, "setHasAppeared:", 1);
  -[TVRUICastViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[TVRUICastViewController mediaInfo](self, "mediaInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TVRUICastViewController mediaInfo](self, "mediaInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUICastViewController _updateUIForMediaInfo:](self, "_updateUIForMediaInfo:", v9);

    }
  }
}

- (void)setMetadata:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v5 = a3;
  objc_msgSend(v5, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata canonicalID](self->_metadata, "canonicalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  objc_storeStrong((id *)&self->_metadata, a3);
  if (v5)
  {
    objc_msgSend(v5, "canonicalID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v5, "canonicalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB4148]);

      if (((v11 | v8) & 1) == 0)
      {
        -[TVRUICastViewController setMediaInfo:](self, "setMediaInfo:", 0);
        v12 = objc_alloc_init(MEMORY[0x24BEB40E0]);
        objc_initWeak(&location, self);
        objc_msgSend(v5, "canonicalID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __39__TVRUICastViewController_setMetadata___block_invoke;
        v14[3] = &unk_24DE2D338;
        objc_copyWeak(&v15, &location);
        objc_msgSend(v12, "requestForCanonicalID:includeRoles:completion:", v13, 1, v14);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);

      }
    }
    else
    {

    }
  }

}

void __39__TVRUICastViewController_setMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "roles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6
      || (objc_msgSend(v3, "showIdentifier"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      objc_msgSend(WeakRetained, "setMediaInfo:", v3);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BEB40E0]);
      objc_msgSend(v3, "showIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __39__TVRUICastViewController_setMetadata___block_invoke_2;
      v10[3] = &unk_24DE2D310;
      v10[4] = WeakRetained;
      objc_msgSend(v8, "requestForCanonicalID:includeRoles:completion:", v9, 1, v10);

    }
  }

}

void __39__TVRUICastViewController_setMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "roles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setMediaInfo:", v5);

}

- (void)configureHierarchy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  UICollectionView *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UICollectionView *collectionView;
  UICollectionView *v21;
  UICollectionViewDiffableDataSource *dataSource;
  id v23;
  UICollectionViewDiffableDataSource *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BEBD460];
  v3 = objc_opt_class();
  v4 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __45__TVRUICastViewController_configureHierarchy__block_invoke;
  v35[3] = &unk_24DE2D360;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v2, "registrationWithCellClass:configurationHandler:", v3, v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEBD450]);
  -[TVRUICastViewController _layout](self, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[UICollectionView setDelegate:](v8, "setDelegate:", self);
  v10 = objc_alloc(MEMORY[0x24BEBD480]);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __45__TVRUICastViewController_configureHierarchy__block_invoke_2;
  v33[3] = &unk_24DE2C740;
  v23 = v5;
  v34 = v23;
  v24 = (UICollectionViewDiffableDataSource *)objc_msgSend(v10, "initWithCollectionView:cellProvider:", v8, v33);
  -[TVRUICastViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v8);
  v25 = (void *)MEMORY[0x24BDD1628];
  -[UICollectionView leadingAnchor](v8, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v29;
  -[UICollectionView trailingAnchor](v8, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v26;
  -[UICollectionView topAnchor](v8, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v14;
  -[UICollectionView bottomAnchor](v8, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v19);

  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v21 = v8;

  dataSource = self->_dataSource;
  self->_dataSource = v24;

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __45__TVRUICastViewController_configureHierarchy__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "urlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUrlSession:", v9);

  }
  objc_msgSend(v10, "setRole:", v6);

}

uint64_t __45__TVRUICastViewController_configureHierarchy__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

- (void)setMediaInfo:(id)a3
{
  void *v5;
  _BOOL4 v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_mediaInfo, a3);
  -[TVRUICastViewController _filterNonCharacterRolesIfNeededForMediaInfo:](self, "_filterNonCharacterRolesIfNeededForMediaInfo:", self->_mediaInfo);
  v5 = v7;
  if (v7)
  {
    v6 = -[TVRUICastViewController hasAppeared](self, "hasAppeared");
    v5 = v7;
    if (v6)
    {
      -[TVRUICastViewController _updateUIForMediaInfo:](self, "_updateUIForMediaInfo:", v7);
      v5 = v7;
    }
  }

}

- (id)_layout
{
  void *v2;
  void *v3;
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
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD328];
  objc_msgSend(MEMORY[0x24BEBD300], "fractionalWidthDimension:", 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD300], "absoluteDimension:", 70.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD318], "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD328];
  objc_msgSend(MEMORY[0x24BEBD300], "fractionalWidthDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD300], "absoluteDimension:", 70.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD310];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "verticalGroupWithLayoutSize:subitems:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD320], "sectionWithGroup:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterGroupSpacing:", 10.0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD468]), "initWithSection:", v14);

  return v15;
}

- (void)_updateUIForMediaInfo:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BEBD348];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", &unk_24DE4DD48);
  objc_msgSend(v5, "roles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendItemsWithIdentifiers:", v6);
  -[TVRUICastViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applySnapshot:animatingDifferences:", v8, 0);

}

- (NSURLSession)urlSession
{
  NSURLSession *urlSession;
  void *v4;
  NSURLSession *v5;
  NSURLSession *v6;

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", 30);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlSession;
    self->_urlSession = v5;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)openURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVRUICastViewController sharingProvider](self, "sharingProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:", v4);

}

- (void)_filterNonCharacterRolesIfNeededForMediaInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "roles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "roles", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "characterName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "setRoles:", v6);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[TVRUICastViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    objc_msgSend(v9, "productPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICastViewController openURL:](self, "openURL:", v8);

    v7 = v9;
  }

}

- (TVRUISharingProviding)sharingProvider
{
  return (TVRUISharingProviding *)objc_loadWeakRetained((id *)&self->_sharingProvider);
}

- (void)setSharingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sharingProvider, a3);
}

- (TVRCNowPlayingMetadata)metadata
{
  return self->_metadata;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (TVRCMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_sharingProvider);
}

@end
