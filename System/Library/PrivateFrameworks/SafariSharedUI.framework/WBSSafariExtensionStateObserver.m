@implementation WBSSafariExtensionStateObserver

- (WBSSafariExtensionStateObserver)init
{

  return 0;
}

- (WBSSafariExtensionStateObserver)initWithWebView:(id)a3 extensionsController:(id)a4
{
  id v6;
  id v7;
  WBSSafariExtensionStateObserver *v8;
  WBSSafariExtensionStateObserver *v9;
  WBSSafariExtensionStateObserver *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSSafariExtensionStateObserver;
  v8 = -[WBSSafariExtensionStateObserver init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_webView, v6);
    objc_storeWeak((id *)&v9->_extensionsController, v7);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSSafariExtensionStateObserver _stopObservingExtensionNotifications](self, "_stopObservingExtensionNotifications");
  v3.receiver = self;
  v3.super_class = (Class)WBSSafariExtensionStateObserver;
  -[WBSSafariExtensionStateObserver dealloc](&v3, sel_dealloc);
}

- (void)startObservingExtensionStateChanges
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WBSSafariExtensionStateObserver _startObservingExtensionNotifications](self, "_startObservingExtensionNotifications");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  objc_msgSend(WeakRetained, "enabledExtensions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        -[WBSSafariExtensionStateObserver _addNamesForExtension:toMap:](self, "_addNamesForExtension:toMap:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v9 = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(v9, "_didEnableBrowserExtensions:", v3);

  }
}

- (void)_startObservingExtensionNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleExtensionWasAdded_, *MEMORY[0x1E0D8A380], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleExtensionWasRemoved_, *MEMORY[0x1E0D8A388], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleExtensionEnabledStateDidChange_, *MEMORY[0x1E0D8A300], 0);

}

- (void)_stopObservingExtensionNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D8A380], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D8A388], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D8A300], 0);

}

- (BOOL)_shouldObserveExtension:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  objc_msgSend(v4, "sf_uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "extensionWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (BOOL)_teardownObserverIfNecessary
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)&self->_extensionsController);

    if (v5)
      return 0;
  }
  -[WBSSafariExtensionStateObserver _stopObservingExtensionNotifications](self, "_stopObservingExtensionNotifications");
  return 1;
}

- (void)_handleExtensionWasAdded:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (!-[WBSSafariExtensionStateObserver _teardownObserverIfNecessary](self, "_teardownObserverIfNecessary"))
  {
    objc_msgSend(v9, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WBSSafariExtensionStateObserver _shouldObserveExtension:](self, "_shouldObserveExtension:", v4))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
      v6 = objc_msgSend(WeakRetained, "extensionIsEnabled:", v4);

      if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSafariExtensionStateObserver _addNamesForExtension:toMap:](self, "_addNamesForExtension:toMap:", v4, v7);
        v8 = objc_loadWeakRetained((id *)&self->_webView);
        objc_msgSend(v8, "_didEnableBrowserExtensions:", v7);

      }
    }

  }
}

- (void)_handleExtensionWasRemoved:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (!-[WBSSafariExtensionStateObserver _teardownObserverIfNecessary](self, "_teardownObserverIfNecessary"))
  {
    objc_msgSend(v9, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WBSSafariExtensionStateObserver _shouldObserveExtension:](self, "_shouldObserveExtension:", v4))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
      v6 = objc_msgSend(WeakRetained, "extensionIsEnabled:", v4);

      if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSafariExtensionStateObserver _addIDsForExtension:toSet:](self, "_addIDsForExtension:toSet:", v4, v7);
        v8 = objc_loadWeakRetained((id *)&self->_webView);
        objc_msgSend(v8, "_didDisableBrowserExtensions:", v7);

      }
    }

  }
}

- (void)_handleExtensionEnabledStateDidChange:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[WBSSafariExtensionStateObserver _teardownObserverIfNecessary](self, "_teardownObserverIfNecessary"))
  {
    objc_msgSend(v9, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WBSSafariExtensionStateObserver _shouldObserveExtension:](self, "_shouldObserveExtension:", v4))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
      v6 = objc_loadWeakRetained((id *)&self->_extensionsController);
      v7 = objc_msgSend(v6, "extensionIsEnabled:", v4);

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSafariExtensionStateObserver _addNamesForExtension:toMap:](self, "_addNamesForExtension:toMap:", v4, v8);
        objc_msgSend(WeakRetained, "_didEnableBrowserExtensions:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSafariExtensionStateObserver _addIDsForExtension:toSet:](self, "_addIDsForExtension:toSet:", v4, v8);
        objc_msgSend(WeakRetained, "_didDisableBrowserExtensions:", v8);
      }

    }
  }

}

- (void)_addNamesForExtension:(id)a3 toMap:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  objc_msgSend(WeakRetained, "extensionDataForExtension:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safariExtensionBaseURI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v11);

}

- (void)_addIDsForExtension:(id)a3 toSet:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsController);
  objc_msgSend(WeakRetained, "extensionDataForExtension:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safariExtensionBaseURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v6, "addObject:", v10);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionsController);
  objc_destroyWeak((id *)&self->_webView);
}

@end
