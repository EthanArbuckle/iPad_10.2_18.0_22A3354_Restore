@implementation SUICKPMapCardSectionViewController

+ (id)cardSectionClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (id)_initWithCardSection:(id)a3
{
  id v4;
  CFRunLoopObserverRef *v5;
  __CFRunLoop *Main;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUICKPMapCardSectionViewController;
  v5 = -[CRKCardSectionViewController _initWithCardSection:](&v11, sel__initWithCardSection_, v4);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__SUICKPMapCardSectionViewController__initWithCardSection___block_invoke;
    v8[3] = &unk_24E385E70;
    objc_copyWeak(&v9, &location);
    v5[130] = CFRunLoopObserverCreateWithHandler(0, 0x81uLL, 1u, 0, v8);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v5[130], (CFRunLoopMode)*MEMORY[0x24BDF7F78]);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __59__SUICKPMapCardSectionViewController__initWithCardSection___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *WeakRetained;
  _BYTE *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((a3 & 1) != 0)
    {
      WeakRetained[1025] = 1;
    }
    else
    {
      WeakRetained[1025] = 0;
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "_loadCardSectionViewIfNeeded");
      WeakRetained = v5;
    }
  }

}

- (void)dealloc
{
  __CFRunLoop *Main;
  objc_super v4;

  if (self->_mainRunLoopObserverRef)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_mainRunLoopObserverRef, (CFRunLoopMode)*MEMORY[0x24BDF7F78]);
    CFRelease(self->_mainRunLoopObserverRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)SUICKPMapCardSectionViewController;
  -[SUICKPMapCardSectionViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUICKPMapCardSectionViewController;
  -[CRKCardSectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SUICKPMapCardSectionViewController _loadCardSectionViewIfNeeded](self, "_loadCardSectionViewIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUICKPMapCardSectionViewController;
  -[CRKCardSectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SUICKPMapCardSectionViewController _updateContentSize](self, "_updateContentSize");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUICKPMapCardSectionViewController _snapshotCardSectionView](self, "_snapshotCardSectionView");
  v5.receiver = self;
  v5.super_class = (Class)SUICKPMapCardSectionViewController;
  -[SUICKPMapCardSectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)_snapshotCardSectionView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRKCardSectionView *mapSectionView;
  id v11;

  if (-[SUICKPMapCardSectionViewController _shouldAttemptToSnapshotMapView](self, "_shouldAttemptToSnapshotMapView"))
  {
    if (!self->_needsToLoadCardSectionView)
    {
      v3 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[SUICKPMapCardSectionViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v11 = (id)objc_msgSend(v3, "initWithFrame:");

      objc_msgSend(v11, "setClipsToBounds:", 1);
      v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
      -[SUICKPMapCardSectionViewController _viewSnapshot](self, "_viewSnapshot");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithImage:", v6);

      objc_msgSend(v7, "setContentMode:", 2);
      -[SUICKPMapCardSectionViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v7, "setFrame:");

      objc_msgSend(v7, "setAutoresizingMask:", 18);
      objc_msgSend(v11, "addSubview:", v7);
      -[SUICKPMapCardSectionViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentView:", v11);

      mapSectionView = self->_mapSectionView;
      self->_mapSectionView = 0;

      self->_needsToLoadCardSectionView = 1;
    }
  }
}

- (void)_loadCardSectionView
{
  id v3;
  objc_super v4;

  if (-[SUICKPMapCardSectionViewController _shouldAttemptToSnapshotMapView](self, "_shouldAttemptToSnapshotMapView"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE15468]);
    objc_msgSend(v3, "setInterceptsTouches:", 0);
    -[SUICKPMapCardSectionViewController setView:](self, "setView:", v3);
    -[SUICKPMapCardSectionViewController _loadMapCardSectionView](self, "_loadMapCardSectionView");

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUICKPMapCardSectionViewController;
    -[CRKCardSectionViewController _loadCardSectionView](&v4, sel__loadCardSectionView);
  }
}

- (void)_loadMapCardSectionView
{
  void *v3;
  void *v4;
  CRKCardSectionView *v5;
  CRKCardSectionView *mapSectionView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRKCardSectionView *v11;
  CRKCardSectionView *v12;
  void *v13;
  CRKCardSectionView *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_mapSectionView)
  {
    -[CRKCardSectionViewController viewConfiguration](self, "viewConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CRKCardSectionViewController viewConfiguration](self, "viewConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cardSectionView");
      v5 = (CRKCardSectionView *)objc_claimAutoreleasedReturnValue();
      mapSectionView = self->_mapSectionView;
      self->_mapSectionView = v5;

    }
    else
    {
      v7 = (void *)MEMORY[0x24BE85210];
      -[SUICKPMapCardSectionViewController _mapCardSection](self, "_mapCardSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewsForCardSections:feedbackListener:", v9, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (CRKCardSectionView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_mapSectionView;
      self->_mapSectionView = v11;

    }
    -[SUICKPMapCardSectionViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_mapSectionView;
    -[CRKCardSectionViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingSizeForCardSectionViewController:", self);
    -[CRKCardSectionView sizeThatFits:](v14, "sizeThatFits:");
    objc_msgSend(v13, "setContentSize:");

    -[SUICKPMapCardSectionViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentView:", self->_mapSectionView);

  }
}

- (void)_loadCardSectionViewIfNeeded
{
  _QWORD block[5];

  if (self->_needsToLoadCardSectionView && !self->_inTrackingRunLoopMode)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__SUICKPMapCardSectionViewController__loadCardSectionViewIfNeeded__block_invoke;
    block[3] = &unk_24E385E98;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    self->_needsToLoadCardSectionView = 0;
  }
}

uint64_t __66__SUICKPMapCardSectionViewController__loadCardSectionViewIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMapCardSectionView");
}

- (void)_updateContentSize
{
  CRKCardSectionView *mapSectionView;
  void *v4;
  id v5;

  if (self->_mapSectionView)
  {
    -[SUICKPMapCardSectionViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    mapSectionView = self->_mapSectionView;
    -[CRKCardSectionViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundingSizeForCardSectionViewController:", self);
    -[CRKCardSectionView sizeThatFits:](mapSectionView, "sizeThatFits:");
    objc_msgSend(v5, "setContentSize:");

  }
}

- (id)_viewSnapshot
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  CGSize v15;

  -[SUICKPMapCardSectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v15.width = v5;
  v15.height = v7;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);

  -[SUICKPMapCardSectionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUICKPMapCardSectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "drawViewHierarchyInRect:afterScreenUpdates:", 0);

  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)_mapCardSection
{
  void *v2;
  void *v3;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldAttemptToSnapshotMapView
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SUICKPMapCardSectionViewController _mapCardSection](self, "_mapCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "interactive") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[CRKCardSectionViewController _remoteViewController](self, "_remoteViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)didEngageCardSection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  const __CFString *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUICKPMapCardSectionViewController;
  -[SUICKPInteractiveCardSectionViewController didEngageCardSection:](&v31, sel_didEngageCardSection_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_msgSend(v5, "triggerEvent");
      if (v8 == 14 || objc_msgSend(v5, "triggerEvent") == 2)
      {
        -[CRKCardSectionViewController cardSection](self, "cardSection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          -[CRKCardSectionViewController cardSection](self, "cardSection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "actionCommands");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRKCardSectionViewController _extraCommands](self, "_extraCommands");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v12;
          v26 = v4;
          if (v13)
          {
            -[CRKCardSectionViewController _extraCommands](self, "_extraCommands", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14);
            v15 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v15 = v12;
          }
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v28 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                if (v8 == 14)
                {
                  v32 = CFSTR("CRKMapCardSectionPlacemarkData");
                  objc_msgSend(v5, "modifiedPlacemarkData");
                  v22 = v5;
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = v23;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setUserInfo:", v24);

                  v5 = v22;
                }
                -[CRKCardSectionViewController _performCommand:](self, "_performCommand:", v21, v25);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
            }
            while (v18);
          }

          v4 = v26;
        }
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSectionView, 0);
}

@end
