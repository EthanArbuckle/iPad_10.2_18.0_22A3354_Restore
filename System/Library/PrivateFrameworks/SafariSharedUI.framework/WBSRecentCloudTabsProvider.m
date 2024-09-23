@implementation WBSRecentCloudTabsProvider

- (WBSRecentCloudTabsProvider)initWithCloudTabDeviceProvider:(id)a3
{
  id v5;
  WBSRecentCloudTabsProvider *v6;
  WBSRecentCloudTabsProvider *v7;
  WBSRecentCloudTabsProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRecentCloudTabsProvider;
  v6 = -[WBSRecentCloudTabsProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cloudTabDeviceProvider, a3);
    -[WBSCloudTabDeviceProvider addCloudTabsObserver:](v7->_cloudTabDeviceProvider, "addCloudTabsObserver:", v7);
    v8 = v7;
  }

  return v7;
}

- (NSSet)recentItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  WBSRecentItem *v17;
  void *v18;
  void *v19;
  void *v20;
  WBSRecentItem *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_activeProfileIdentifier, "length"))
  {
    -[WBSCloudTabDeviceProvider syncedRemoteCloudTabDevicesForProfileWithIdentifier:](self->_cloudTabDeviceProvider, "syncedRemoteCloudTabDevicesForProfileWithIdentifier:", self->_activeProfileIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v3;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v39;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
          objc_msgSend(v33, "deviceTypeIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v5;
          v30 = v4;
          if (objc_msgSend(v5, "length"))
          {
            objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:error:", v5, 0);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = v6;
            if (v6)
            {
              v8 = (void *)MEMORY[0x1E0CEA638];
              objc_msgSend(v6, "name");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "_systemImageNamed:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }
          objc_msgSend(v33, "tabs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v31 = v11;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v35 != v14)
                  objc_enumerationMutation(v31);
                v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                v17 = [WBSRecentItem alloc];
                objc_msgSend(v16, "uuidString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "url");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[WBSRecentItem initWithIdentifier:url:date:](v17, "initWithIdentifier:url:date:", v18, v19, v20);

                -[WBSRecentItem setDevice:](v21, "setDevice:", v33);
                -[WBSRecentItem setCloudTab:](v21, "setCloudTab:", v16);
                objc_msgSend(v16, "title");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSRecentItem setTitle:](v21, "setTitle:", v22);

                -[WBSRecentItem setIcon:](v21, "setIcon:", v10);
                v23 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v16, "lastViewedTime");
                objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSRecentItem setDate:](v21, "setDate:", v24);

                objc_msgSend(v32, "addObject:", v21);
              }
              v13 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v13);
          }

          v4 = v30 + 1;
        }
        while (v30 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v28);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v32;
}

- (void)setCloudTabDeviceProvider:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cloudTabDeviceProvider, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    objc_msgSend(WeakRetained, "ingestRecentItemsFromProvider:", self);

  }
}

- (void)setActiveProfileIdentifier:(id)a3
{
  NSString *v4;
  NSString *activeProfileIdentifier;
  id WeakRetained;
  id v7;

  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    activeProfileIdentifier = self->_activeProfileIdentifier;
    self->_activeProfileIdentifier = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    objc_msgSend(WeakRetained, "ingestRecentItemsFromProvider:", self);

  }
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  id WeakRetained;

  if (WBSIsEqual())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    objc_msgSend(WeakRetained, "ingestRecentItemsFromProvider:", self);

  }
}

- (WBSRecentsStore)recentsStore
{
  return (WBSRecentsStore *)objc_loadWeakRetained((id *)&self->_recentsStore);
}

- (void)setRecentsStore:(id)a3
{
  objc_storeWeak((id *)&self->_recentsStore, a3);
}

- (WBSCloudTabDeviceProvider)cloudTabDeviceProvider
{
  return self->_cloudTabDeviceProvider;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudTabDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_recentsStore);
}

@end
