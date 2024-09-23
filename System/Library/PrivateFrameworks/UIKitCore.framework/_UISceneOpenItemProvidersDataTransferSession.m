@implementation _UISceneOpenItemProvidersDataTransferSession

- (_UISceneOpenItemProvidersDataTransferSession)initWithItemProviders:(id)a3 itemCollection:(id)a4 continuation:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UISceneOpenItemProvidersDataTransferSession *v12;
  _UISceneOpenItemProvidersDataTransferSession *v13;
  _UIDataTransferMonitor *v14;
  _UIDataTransferMonitor *monitor;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UISceneOpenItemProvidersDataTransferSession;
  v12 = -[_UISceneOpenItemProvidersDataTransferSession init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemProviders, a3);
    objc_storeStrong((id *)&v13->_itemCollection, a4);
    v14 = objc_alloc_init(_UIDataTransferMonitor);
    monitor = v13->_monitor;
    v13->_monitor = v14;

    -[_UIDataTransferMonitor setDelegate:](v13->_monitor, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_continuation, a5);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v13->_itemProviders;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "setDataTransferDelegate:", v13->_monitor, (_QWORD)v22);
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  return v13;
}

- (void)didFinishSendingRequests
{
  void *v3;
  _QWORD v4[5];

  -[_UISceneOpenItemProvidersDataTransferSession itemCollection](self, "itemCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72___UISceneOpenItemProvidersDataTransferSession_didFinishSendingRequests__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "waitForItemRequestsDeliveryCompletion:", v4);

}

- (void)dataTransferMonitorBeganTransfers:(id)a3
{
  id v4;

  -[_UISceneOpenItemProvidersDataTransferSession delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTransferSessionBeganTransfers:", self);

}

- (void)dataTransferMonitorFinishedTransfers:(id)a3
{
  id v4;

  -[_UISceneOpenItemProvidersDataTransferSession delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTransferSessionFinishedTransfers:", self);

}

- (_UISceneOpenItemProvidersDataTransferSessionDelegate)delegate
{
  return (_UISceneOpenItemProvidersDataTransferSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIDataTransferMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_itemCollection, a3);
}

- (_DUIDragContinuation)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(id)a3
{
  objc_storeStrong((id *)&self->_continuation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuation, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
