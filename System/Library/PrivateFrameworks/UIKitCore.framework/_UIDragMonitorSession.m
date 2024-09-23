@implementation _UIDragMonitorSession

- (_UIDragMonitorSession)initWithSessionIdentifier:(unsigned int)a3 remoteControlProxy:(id)a4
{
  id v7;
  _UIDragMonitorSession *v8;
  _UIDragMonitorSession *v9;
  _UIDruidDestinationConnection *v10;
  _UIDruidDestinationConnection *druidDestinationConnection;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIDragMonitorSession;
  v8 = -[_UIDragMonitorSession init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_sessionIdentifier = a3;
    objc_storeStrong((id *)&v8->_remoteControlProxy, a4);
    v10 = -[_UIDruidDestinationConnection initWithSessionIdentifier:systemPolicy:]([_UIDruidDestinationConnection alloc], "initWithSessionIdentifier:systemPolicy:", v9->_sessionIdentifier, 0);
    druidDestinationConnection = v9->_druidDestinationConnection;
    v9->_druidDestinationConnection = v10;

  }
  return v9;
}

- (void)_updateModelWithPreviewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDragMonitorSession previewsByItemProviderIndex](self, "previewsByItemProviderIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
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
        objc_msgSend(v12, "preview", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "index"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v13, v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[_UIDragMonitorSession setPreviewsByItemProviderIndex:](self, "setPreviewsByItemProviderIndex:", v6);
}

- (void)connect
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __32___UIDragMonitorSession_connect__block_invoke;
  v19[3] = &unk_1E16DED60;
  objc_copyWeak(&v20, &location);
  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionBlock:", v19);

  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDragPreviewProviderBlock:", &__block_literal_global_452);

  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __32___UIDragMonitorSession_connect__block_invoke_3;
  v17[3] = &unk_1E16DEDA8;
  objc_copyWeak(&v18, &location);
  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDropPerformBlock:", v17);

  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __32___UIDragMonitorSession_connect__block_invoke_4;
  v15[3] = &unk_1E16C45C0;
  objc_copyWeak(&v16, &location);
  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemsAddedBlock:", v15);

  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __32___UIDragMonitorSession_connect__block_invoke_5;
  v13[3] = &unk_1E16B44C0;
  objc_copyWeak(&v14, &location);
  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDragEndBlock:", v13);

  objc_copyWeak(&v12, &location);
  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection", v3, 3221225472, __32___UIDragMonitorSession_connect__block_invoke_6, &unk_1E16C44F8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpdatedPresentationBlock:", &v11);

  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connect");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)requestPreviews
{
  void *v3;
  _QWORD v4[5];

  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40___UIDragMonitorSession_requestPreviews__block_invoke;
  v4[3] = &unk_1E16B1548;
  v4[4] = self;
  objc_msgSend(v3, "requestVisibleItems:", v4);

}

- (void)requestDrop
{
  id v2;

  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDropWithOperation:layerContext:", 1, 0);

}

- (void)sawDragEndEvent
{
  id v2;

  -[_UIDragMonitorSession druidDestinationConnection](self, "druidDestinationConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sawDragEndEvent");

}

- (void)performOffscreenDrop
{
  id v2;

  -[_UIDragMonitorSession remoteControlProxy](self, "remoteControlProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performOffscreenDrop");

}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_sessionIdentifier = a3;
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (NSDictionary)previewsByItemProviderIndex
{
  return self->_previewsByItemProviderIndex;
}

- (void)setPreviewsByItemProviderIndex:(id)a3
{
  objc_storeStrong((id *)&self->_previewsByItemProviderIndex, a3);
}

- (_UIDragMonitorSessionDelegate)delegate
{
  return (_UIDragMonitorSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (_DUIServerSessionRemoteDragManipulation)remoteControlProxy
{
  return self->_remoteControlProxy;
}

- (void)setRemoteControlProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlProxy, a3);
}

- (_UIDruidDestinationConnection)druidDestinationConnection
{
  return self->_druidDestinationConnection;
}

- (void)setDruidDestinationConnection:(id)a3
{
  objc_storeStrong((id *)&self->_druidDestinationConnection, a3);
}

- (BOOL)connectedToDruid
{
  return self->_connectedToDruid;
}

- (void)setConnectedToDruid:(BOOL)a3
{
  self->_connectedToDruid = a3;
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_itemCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_druidDestinationConnection, 0);
  objc_storeStrong((id *)&self->_remoteControlProxy, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewsByItemProviderIndex, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
