@implementation SAUIIndicatorElementViewController

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SAUIIndicatorElementViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUIIndicatorElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingDidAppear_, v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SAUIIndicatorElementViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUIIndicatorElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingWillAppear_, v4);
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }

}

uint64_t __53__SAUIIndicatorElementViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingWillAppear:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__SAUIIndicatorElementViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingDidAppear:", *(_QWORD *)(a1 + 32));
}

- (SAUIIndicatorElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (void)addElementViewControllingObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](self->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (SAUIIndicatorElementViewController)initWithIndicatorElementViewProvider:(id)a3
{
  id v6;
  SAUIIndicatorElementViewController *v7;
  SAUIIndicatorElementViewController *v8;
  uint64_t v9;
  NSHashTable *observers;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIIndicatorElementViewController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementViewProvider"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SAUIIndicatorElementViewController;
  v7 = -[SAUIIndicatorElementViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_elementViewProvider, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

  }
  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SAUIIndicatorElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIIndicatorElementViewProviding indicatorView](self->_elementViewProvider, "indicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

- (void)viewWillLayoutSubviews
{
  id WeakRetained;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewWillLayoutSubviews](&v22, sel_viewWillLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  -[SAUIIndicatorElementViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "interSensorRegionInContentView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  CGRectGetWidth(v23);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  CGRectGetHeight(v24);
  UIRectCenteredYInRectScale();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SAUIIndicatorElementViewProviding indicatorView](self->_elementViewProvider, "indicatorView", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SAUIRegisterSystemApertureLogging();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SAUIIndicatorElementViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUIIndicatorElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingWillDisappear_, v4);
}

uint64_t __56__SAUIIndicatorElementViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingWillDisappear:", *(_QWORD *)(a1 + 32));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  -[SAUIIndicatorElementViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SAUIIndicatorElementViewController_viewDidDisappear___block_invoke;
  v4[3] = &unk_25193CCD8;
  v4[4] = self;
  -[SAUIIndicatorElementViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementViewControllingDidDisappear_, v4);
}

uint64_t __55__SAUIIndicatorElementViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementViewControllingDidDisappear:", *(_QWORD *)(a1 + 32));
}

- (int64_t)handleElementTap:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if (-[SAUIIndicatorElementViewProviding handleElementViewEvent:](self->_elementViewProvider, "handleElementViewEvent:", 0))return 2;
  return 0;
}

- (int64_t)handleElementLongPress:(id)a3
{
  return 0;
}

- (BOOL)handleTap:(id)a3
{
  return -[SAUIIndicatorElementViewController handleElementTap:](self, "handleElementTap:", a3) != 0;
}

- (BOOL)handleLongPress:(id)a3
{
  return -[SAUIIndicatorElementViewController handleElementLongPress:](self, "handleElementLongPress:", a3) != 0;
}

- (void)removeElementViewControllingObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
