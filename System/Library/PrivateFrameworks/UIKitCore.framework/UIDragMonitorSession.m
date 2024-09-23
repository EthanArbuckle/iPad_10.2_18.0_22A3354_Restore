@implementation UIDragMonitorSession

void __32___UIDragMonitorSession_connect__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setConnectedToDruid:", 1);
    objc_msgSend(v5, "setItemProviders:", v9);
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v5, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dragMonitorSession:didConnectWithItems:", v5, v9);

    }
  }

}

void __32___UIDragMonitorSession_connect__block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setItemProviders:", v12);
  objc_msgSend(WeakRetained, "setItemCollection:", v8);

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dragMonitorSession:didAcceptDropRequestWithItems:", WeakRetained, v12);

  }
  if (a5)
    *a5 = 0;

}

void __32___UIDragMonitorSession_connect__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIItemProvider *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = -[UIItemProvider initWithPBItem:]([UIItemProvider alloc], "initWithPBItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(WeakRetained, "setItemProviders:", v7);
  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dragMonitorSession:didUpdateRegisteredItems:", WeakRetained, v7);

  }
}

void __32___UIDragMonitorSession_connect__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragMonitorSession:didConcludeDragNormally:", WeakRetained, a2);

  }
}

void __32___UIDragMonitorSession_connect__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  _UIDragMonitorSessionPresentationUpdate *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = -[_UIDragMonitorSessionPresentationUpdate initWithDragPresentationUpdate:]([_UIDragMonitorSessionPresentationUpdate alloc], "initWithDragPresentationUpdate:", v3);

  -[_UIDragMonitorSessionPresentationUpdate previewUpdates](v4, "previewUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateModelWithPreviewUpdates:", v5);

  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dragMonitorSession:didUpdateDragPresentation:", WeakRetained, v4);

  }
}

void __40___UIDragMonitorSession_requestPreviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___UIDragMonitorSession_requestPreviews__block_invoke_2;
  block[3] = &unk_1E16B1B50;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __40___UIDragMonitorSession_requestPreviews__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _DUIPreviewAndImageComponentUpdate *v9;
  void *v10;
  void *v11;
  _UIDragMonitorSessionPreviewUpdate *v12;
  void *v13;
  char v14;
  _UIDragMonitorSessionPresentationUpdate *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = objc_alloc_init(_DUIPreviewAndImageComponentUpdate);
        -[_DUIPreviewAndImageComponent setIndex:](v9, "setIndex:", objc_msgSend(v8, "itemIndex"));
        objc_msgSend(v8, "preview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DUIPreviewAndImageComponent setPreview:](v9, "setPreview:", v10);

        objc_msgSend(v8, "imageComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DUIPreviewAndImageComponent setImageComponent:](v9, "setImageComponent:", v11);

        v12 = -[_UIDragMonitorSessionPreviewUpdate initWithPreviewAndImageComponentUpdate:]([_UIDragMonitorSessionPreviewUpdate alloc], "initWithPreviewAndImageComponentUpdate:", v9);
        objc_msgSend(v2, "addObject:", v12);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(v17 + 40), "_updateModelWithPreviewUpdates:", v2);
  objc_msgSend(*(id *)(v17 + 40), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = -[_UIDragMonitorSessionPresentationUpdate initWithPreviewUpdates:badgeUpdate:]([_UIDragMonitorSessionPresentationUpdate alloc], "initWithPreviewUpdates:badgeUpdate:", v2, 0);
    objc_msgSend(*(id *)(v17 + 40), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dragMonitorSession:didUpdateDragPresentation:", *(_QWORD *)(v17 + 40), v15);

  }
}

@end
