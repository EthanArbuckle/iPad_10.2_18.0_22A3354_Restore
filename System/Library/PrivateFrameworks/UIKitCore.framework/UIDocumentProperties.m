@implementation UIDocumentProperties

- (UIDocumentProperties)initWithURL:(NSURL *)url
{
  NSURL *v6;
  UIDocumentProperties *v7;
  UIDocumentProperties *v8;
  _UIDocumentURLChangeObserver *v9;
  _UIDocumentURLChangeObserver *urlChangeObserver;
  void *v12;
  objc_super v13;

  v6 = url;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UIDocumentProperties;
  v7 = -[UIDocumentProperties init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_url, url);
    v9 = -[_UIDocumentURLChangeObserver initWithFileURL:]([_UIDocumentURLChangeObserver alloc], "initWithFileURL:", v6);
    urlChangeObserver = v8->_urlChangeObserver;
    v8->_urlChangeObserver = v9;

  }
  return v8;
}

- (UIDocumentProperties)initWithMetadata:(LPLinkMetadata *)metadata
{
  LPLinkMetadata *v5;
  UIDocumentProperties *v6;
  uint64_t v7;
  LPLinkMetadata *v8;
  void *v10;
  objc_super v11;

  v5 = metadata;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIDocumentProperties;
  v6 = -[UIDocumentProperties init](&v11, sel_init);
  if (v6)
  {
    v7 = -[LPLinkMetadata copy](v5, "copy");
    v8 = v6->_metadata;
    v6->_metadata = (LPLinkMetadata *)v7;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isObserving");

  if (v4)
  {
    -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopObserving");

  }
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentProperties;
  -[UIDocumentProperties dealloc](&v6, sel_dealloc);
}

- (void)_didLoadMetadata:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIDocumentProperties url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIDocumentProperties _setMetadata:](self, "_setMetadata:", v5);

}

- (void)_fetchMetadataIfNecessary:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  id location[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (a3)
    goto LABEL_2;
  -[UIDocumentProperties _metadata](self, "_metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    return;
  }
  -[UIDocumentProperties _metadataProvider](self, "_metadataProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_2:
    -[UIDocumentProperties _setMetadataProvider:](self, "_setMetadataProvider:", 0);
    -[UIDocumentProperties url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 128, CFSTR("No metadata is provided but also no URL is present. This should never happen."));

    }
    -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isObserving");

    v8 = (void *)MEMORY[0x1E0C809B0];
    if ((v7 & 1) == 0)
    {
      objc_initWeak(location, self);
      -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke;
      v18[3] = &unk_1E16E9398;
      objc_copyWeak(&v20, location);
      v19 = v5;
      objc_msgSend(v9, "startObservingWithChangeHandler:", v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v10 = (void *)getLPMetadataProviderClass_softClass;
    v25 = getLPMetadataProviderClass_softClass;
    if (!getLPMetadataProviderClass_softClass)
    {
      location[0] = v8;
      location[1] = (id)3221225472;
      location[2] = __getLPMetadataProviderClass_block_invoke;
      location[3] = &unk_1E16B14C0;
      location[4] = &v22;
      __getLPMetadataProviderClass_block_invoke((uint64_t)location);
      v10 = (void *)v23[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v22, 8);
    v12 = objc_alloc_init(v11);
    -[UIDocumentProperties _setMetadataProvider:](self, "_setMetadataProvider:", v12);
    -[UIDocumentProperties url](self, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_2;
    v17[3] = &unk_1E16E93C0;
    v17[4] = self;
    objc_msgSend(v12, "startFetchingMetadataForURL:completionHandler:", v13, v17);

  }
}

void __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    objc_msgSend(WeakRetained, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);

    if (v4 == v5)
      objc_msgSend(WeakRetained, "setUrl:", v6);
  }
  objc_msgSend(WeakRetained, "_fetchMetadataIfNecessary:", 1);

}

void __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  unsigned int v9;
  unint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v7 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v8 = _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay)
      {
        while (v7 >= v8)
        {
          _UIInternalPreferenceSync(v7, &_UIInternalPreference_UIDocumentHeaderMetadataReloadDelay, (uint64_t)CFSTR("UIDocumentHeaderMetadataReloadDelay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
          v8 = _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay;
          if (v7 == _UIInternalPreference_UIDocumentHeaderMetadataReloadDelay)
            goto LABEL_5;
        }
        v9 = qword_1EDDA83A0;
        if (qword_1EDDA83A0 >= 1)
        {
          v10 = _UIDocumentPropertiesHeaderPointerRegionShare_block_invoke___s_category;
          if (!_UIDocumentPropertiesHeaderPointerRegionShare_block_invoke___s_category)
          {
            v10 = __UILogCategoryGetNode("DocumentProperties", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v10, (unint64_t *)&_UIDocumentPropertiesHeaderPointerRegionShare_block_invoke___s_category);
          }
          v11 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v15 = v9;
            _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Delaying reload by %d seconds for debugging purposes.", buf, 8u);
          }
          sleep(v9);
        }
      }
    }
LABEL_5:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_18;
    v12[3] = &unk_1E16B1B50;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __50__UIDocumentProperties__fetchMetadataIfNecessary___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didLoadMetadata:", *(_QWORD *)(a1 + 40));
}

- (id)_headerViewForMenuInteraction:(id)a3 sourceViewProvider:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _UIDocumentPropertiesHeaderView *v9;
  _UIDocumentPropertiesHeaderView *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  if (WeakRetained)
  {
    v9 = (_UIDocumentPropertiesHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
  }
  else
  {
    v10 = [_UIDocumentPropertiesHeaderView alloc];
    -[UIDocumentProperties _metadata](self, "_metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v9 = -[_UIDocumentPropertiesHeaderView initWithProperties:metadata:menuInteraction:sourceViewProvider:](v10, "initWithProperties:metadata:menuInteraction:sourceViewProvider:", self, v11, v6, v7);
    }
    else
    {
      -[UIDocumentProperties _placeholderMetadata](self, "_placeholderMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UIDocumentPropertiesHeaderView initWithProperties:metadata:menuInteraction:sourceViewProvider:](v10, "initWithProperties:metadata:menuInteraction:sourceViewProvider:", self, v12, v6, v7);

    }
    objc_storeWeak((id *)&self->_headerView, v9);
    -[UIDocumentProperties _fetchMetadataIfNecessary:](self, "_fetchMetadataIfNecessary:", 0);
  }

  return v9;
}

- (id)_iconView
{
  _UIDocumentPropertiesIconView **p_iconView;
  id WeakRetained;
  _UIDocumentPropertiesIconView *v5;
  _UIDocumentPropertiesIconView *v6;
  void *v7;
  void *v8;

  p_iconView = &self->_iconView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);

  if (WeakRetained)
  {
    v5 = (_UIDocumentPropertiesIconView *)objc_loadWeakRetained((id *)p_iconView);
  }
  else
  {
    v6 = [_UIDocumentPropertiesIconView alloc];
    -[UIDocumentProperties _metadata](self, "_metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = -[_UIDocumentPropertiesIconView initWithProperties:metadata:](v6, "initWithProperties:metadata:", self, v7);
    }
    else
    {
      -[UIDocumentProperties _placeholderMetadata](self, "_placeholderMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[_UIDocumentPropertiesIconView initWithProperties:metadata:](v6, "initWithProperties:metadata:", self, v8);

    }
    objc_storeWeak((id *)p_iconView, v5);
    -[UIDocumentProperties _fetchMetadataIfNecessary:](self, "_fetchMetadataIfNecessary:", 0);
  }
  return v5;
}

- (NSURL)_representedURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIDocumentProperties url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIDocumentProperties metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (void)setActivityViewControllerProvider:(void *)activityViewControllerProvider
{
  void *v4;
  id v5;
  id WeakRetained;

  v4 = (void *)objc_msgSend(activityViewControllerProvider, "copy");
  v5 = self->_activityViewControllerProvider;
  self->_activityViewControllerProvider = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  objc_msgSend(WeakRetained, "update");

}

- (void)_performBlockAndCallIconRepresentationChangedHandlerIfNecessary:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  int v6;
  void (**wantsIconRepresentationChangedHandler)(void);

  v4 = (void (**)(_QWORD))a3;
  v5 = -[UIDocumentProperties wantsIconRepresentation](self, "wantsIconRepresentation");
  v4[2](v4);

  v6 = -[UIDocumentProperties wantsIconRepresentation](self, "wantsIconRepresentation");
  wantsIconRepresentationChangedHandler = (void (**)(void))self->__wantsIconRepresentationChangedHandler;
  if (wantsIconRepresentationChangedHandler)
  {
    if (v5 != v6)
      wantsIconRepresentationChangedHandler[2]();
  }
}

- (BOOL)wantsIconRepresentation
{
  return self->_iconRepresentationAction || self->_wantsIconRepresentation;
}

- (void)setWantsIconRepresentation:(BOOL)wantsIconRepresentation
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__UIDocumentProperties_setWantsIconRepresentation___block_invoke;
  v3[3] = &unk_1E16B1B78;
  v3[4] = self;
  v4 = wantsIconRepresentation;
  -[UIDocumentProperties _performBlockAndCallIconRepresentationChangedHandlerIfNecessary:](self, "_performBlockAndCallIconRepresentationChangedHandlerIfNecessary:", v3);
}

uint64_t __51__UIDocumentProperties_setWantsIconRepresentation___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setIconRepresentationAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__UIDocumentProperties_setIconRepresentationAction___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDocumentProperties _performBlockAndCallIconRepresentationChangedHandlerIfNecessary:](self, "_performBlockAndCallIconRepresentationChangedHandlerIfNecessary:", v6);

}

void __52__UIDocumentProperties_setIconRepresentationAction___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

- (void)_setAssociatedNavigationItem:(id)a3
{
  id v4;
  UINavigationItem **p_associatedNavigationItem;
  id WeakRetained;
  void *v7;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  UIDocumentProperties *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_associatedNavigationItem = &self->_associatedNavigationItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedNavigationItem);
  v7 = WeakRetained;
  if (WeakRetained != v4 && v4 != 0 && WeakRetained != 0)
  {
    v10 = _setAssociatedNavigationItem____s_category;
    if (!_setAssociatedNavigationItem____s_category)
    {
      v10 = __UILogCategoryGetNode("UINavigationItem", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_setAssociatedNavigationItem____s_category);
    }
    v11 = *(id *)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = self;
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v13);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = CFSTR("(nil)");
      }
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = v4;
      v28 = v16;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = v7;
      v24 = v21;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412802;
      v30 = v16;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Setting %@ as the documentProperties object on %@ while already associated with %@ will result in the old navigation item's documentProperties to become nil.", buf, 0x20u);

    }
    objc_msgSend(v7, "setDocumentProperties:", 0);
  }
  objc_storeWeak((id *)p_associatedNavigationItem, v4);

}

- (id)_placeholderMetadata
{
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[UIDocumentProperties url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 250, CFSTR("No URL available, unable to create placeholder metadata. This is a UIKit bug."));

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getLPLinkMetadataClass_softClass;
  v14 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getLPLinkMetadataClass_block_invoke_0;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getLPLinkMetadataClass_block_invoke_0((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setOriginalURL:", v4);
  objc_msgSend(v7, "setURL:", v4);

  return v7;
}

- (void)_setMetadata:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  UIDocumentProperties *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata != nil"));

  }
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 265, CFSTR("Call must be made on main thread"));

  }
  -[UIDocumentProperties _setMetadataProvider:](self, "_setMetadataProvider:", 0);
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_storeStrong((id *)&self->_metadata, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__UIDocumentProperties__setMetadata___block_invoke;
  v10[3] = &unk_1E16B2218;
  v11 = v6;
  v12 = self;
  v7 = v6;
  objc_msgSend(v7, "_loadAsynchronousFieldsWithUpdateHandler:", v10);

}

void __37__UIDocumentProperties__setMetadata___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      objc_msgSend(*(id *)(a1 + 40), "_updateMetadataInUse");
  }
}

- (void)_updateMetadataInUse
{
  LPLinkMetadata *metadata;
  void *v5;
  void *v6;
  LPLinkMetadata *v7;
  void *v8;
  id v9;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentProperties.m"), 289, CFSTR("Call must be made on main thread"));

  }
  metadata = self->_metadata;
  -[UIDocumentProperties headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", metadata);

  v7 = self->_metadata;
  -[UIDocumentProperties iconView](self, "iconView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetadata:", v7);

}

- (void)_setMetadataProvider:(id)a3
{
  LPMetadataProvider *v4;
  LPMetadataProvider *metadataProvider;

  v4 = (LPMetadataProvider *)a3;
  -[LPMetadataProvider cancel](self->__metadataProvider, "cancel");
  metadataProvider = self->__metadataProvider;
  self->__metadataProvider = v4;

}

- (void)setMetadata:(LPLinkMetadata *)metadata
{
  void *v4;
  int v5;
  void *v6;

  -[UIDocumentProperties _setMetadata:](self, "_setMetadata:", metadata);
  -[UIDocumentProperties _setMetadataProvider:](self, "_setMetadataProvider:", 0);
  -[UIDocumentProperties setUrl:](self, "setUrl:", 0);
  -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isObserving");

  if (v5)
  {
    -[UIDocumentProperties urlChangeObserver](self, "urlChangeObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopObserving");

  }
  -[UIDocumentProperties setUrlChangeObserver:](self, "setUrlChangeObserver:", 0);
}

- (LPLinkMetadata)metadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIDocumentProperties _metadata](self, "_metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIDocumentProperties _placeholderMetadata](self, "_placeholderMetadata");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (LPLinkMetadata *)v7;
}

- (UINavigationItem)_associatedNavigationItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_associatedNavigationItem);
}

- (LPLinkMetadata)_metadata
{
  return self->_metadata;
}

- (void)dragItemsProvider
{
  return self->_dragItemsProvider;
}

- (void)setDragItemsProvider:(void *)dragItemsProvider
{
  objc_setProperty_nonatomic_copy(self, a2, dragItemsProvider, 32);
}

- (void)activityViewControllerProvider
{
  return self->_activityViewControllerProvider;
}

- (_UIDocumentPropertiesHeaderView)headerView
{
  return (_UIDocumentPropertiesHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (_UIDocumentPropertiesIconView)iconView
{
  return (_UIDocumentPropertiesIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (_UIDocumentURLChangeObserver)urlChangeObserver
{
  return self->_urlChangeObserver;
}

- (void)setUrlChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_urlChangeObserver, a3);
}

- (LPMetadataProvider)_metadataProvider
{
  return self->__metadataProvider;
}

- (id)_wantsIconRepresentationChangedHandler
{
  return self->__wantsIconRepresentationChangedHandler;
}

- (void)_setWantsIconRepresentationChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIAction)iconRepresentationAction
{
  return self->_iconRepresentationAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconRepresentationAction, 0);
  objc_storeStrong(&self->__wantsIconRepresentationChangedHandler, 0);
  objc_storeStrong((id *)&self->__metadataProvider, 0);
  objc_storeStrong((id *)&self->_urlChangeObserver, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_headerView);
  objc_storeStrong(&self->_activityViewControllerProvider, 0);
  objc_storeStrong(&self->_dragItemsProvider, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_associatedNavigationItem);
}

@end
