@implementation PXViewControllerEventTracker

- (void)_updateIsViewVisible
{
  id v3;

  if (-[PXUserInterfaceElementEventTracker isVisible](self, "isVisible"))
  {
    -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXViewControllerEventTracker setIsViewVisible:](self, "setIsViewVisible:", v3 != 0);

  }
  else
  {
    -[PXViewControllerEventTracker setIsViewVisible:](self, "setIsViewVisible:", 0);
  }
}

- (void)setIsViewVisible:(BOOL)a3
{
  if (self->_isViewVisible != a3)
  {
    self->_isViewVisible = a3;
    -[PXViewControllerEventTracker signalChange:](self, "signalChange:", 8);
  }
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXViewControllerEventTracker;
  -[PXUserInterfaceElementEventTracker didPerformChanges](&v4, sel_didPerformChanges);
  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)EventTrackerObserverContext_280208 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewControllerEventTracker.m"), 134, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__PXViewControllerEventTracker_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51479C8;
    v12[4] = self;
    -[PXViewControllerEventTracker performChanges:](self, "performChanges:", v12);
  }

}

uint64_t __61__PXViewControllerEventTracker_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsViewVisible");
}

- (PXViewControllerEventTracker)init
{
  PXViewControllerEventTracker *v2;
  PXViewControllerEventTracker *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXViewControllerEventTracker;
  v2 = -[PXUserInterfaceElementEventTracker init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXViewControllerEventTracker registerChangeObserver:context:](v2, "registerChangeObserver:context:", v2, EventTrackerObserverContext_280208);
    -[PXUserInterfaceElementEventTracker updater](v3, "updater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUpdateSelector:", sel__updateIsViewVisible);

  }
  return v3;
}

- (void)setCurrentViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_currentViewController, obj);
    -[PXViewControllerEventTracker signalChange:](self, "signalChange:", 16);
    -[PXViewControllerEventTracker _invalidateIsViewVisible](self, "_invalidateIsViewVisible");
    v5 = obj;
  }

}

- (void)_invalidateIsViewVisible
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsViewVisible);

}

- (void)logViewControllerDidAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PXViewControllerEventTracker *v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v4;
        v28 = 2112;
        v29 = v17;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "viewController %@ appeared with unexpected currentViewController %@", buf, 0x16u);

      }
    }
  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __59__PXViewControllerEventTracker_logViewControllerDidAppear___block_invoke;
  v21 = &unk_1E5144868;
  v22 = self;
  v9 = v4;
  v23 = v9;
  -[PXViewControllerEventTracker performChanges:](self, "performChanges:", &v18);
  -[PXViewControllerEventTracker viewName](self, "viewName", v18, v19, v20, v21, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (-[PXViewControllerEventTracker viewSignpost](self, "viewSignpost"))
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "did appear callback called twice without did disappear for view controller %@", buf, 0xCu);
      }
    }
    else
    {
      -[PXViewControllerEventTracker setViewSignpost:](self, "setViewSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
      v12 = (void *)MEMORY[0x1E0D09910];
      v13 = *MEMORY[0x1E0D09748];
      v14 = *MEMORY[0x1E0D09868];
      v24[0] = *MEMORY[0x1E0D09830];
      v24[1] = v14;
      v25[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PXViewControllerEventTracker viewSignpost](self, "viewSignpost"));
      v11 = objc_claimAutoreleasedReturnValue();
      v25[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendEvent:withPayload:", v13, v16);

    }
  }

}

- (int64_t)viewSignpost
{
  return self->_viewSignpost;
}

- (PXAnonymousViewController)currentViewController
{
  return (PXAnonymousViewController *)objc_loadWeakRetained((id *)&self->_currentViewController);
}

- (void)setViewSignpost:(int64_t)a3
{
  self->_viewSignpost = a3;
}

- (BOOL)isViewVisible
{
  return self->_isViewVisible;
}

uint64_t __59__PXViewControllerEventTracker_logViewControllerDidAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didAppear");
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentViewController:", *(_QWORD *)(a1 + 40));
}

- (PXViewControllerEventTracker)initWithViewName:(id)a3
{
  id v4;
  PXViewControllerEventTracker *v5;
  uint64_t v6;
  NSString *viewName;

  v4 = a3;
  v5 = -[PXViewControllerEventTracker init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    viewName = v5->_viewName;
    v5->_viewName = (NSString *)v6;

  }
  return v5;
}

- (void)logViewControllerDidDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v4;
        v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "disappearing viewController %@ doesn't match currentViewController %@", buf, 0x16u);

      }
    }
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__PXViewControllerEventTracker_logViewControllerDidDisappear___block_invoke;
  v24[3] = &unk_1E51479C8;
  v24[4] = self;
  -[PXViewControllerEventTracker performChanges:](self, "performChanges:", v24);
  -[PXViewControllerEventTracker viewName](self, "viewName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[PXViewControllerEventTracker viewSignpost](self, "viewSignpost");
    if (v10)
    {
      v11 = v10;
      v12 = (void *)MEMORY[0x1E0D09910];
      v13 = *MEMORY[0x1E0D09878];
      v27 = *MEMORY[0x1E0D09830];
      v14 = v27;
      v28 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endSignpost:forEventName:withPayload:", v11, v13, v16);

      v17 = (void *)MEMORY[0x1E0D09910];
      v18 = *MEMORY[0x1E0D09750];
      v19 = *MEMORY[0x1E0D09868];
      v25[0] = v14;
      v25[1] = v19;
      v26[0] = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendEvent:withPayload:", v18, v22);

      -[PXViewControllerEventTracker setViewSignpost:](self, "setViewSignpost:", 0);
    }
  }

}

- (NSString)viewName
{
  return self->_viewName;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentViewController);
  objc_storeStrong((id *)&self->_viewName, 0);
}

uint64_t __62__PXViewControllerEventTracker_logViewControllerDidDisappear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didDisappear");
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentViewController:", 0);
}

@end
