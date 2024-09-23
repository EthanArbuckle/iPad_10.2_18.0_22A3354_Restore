@implementation SBShelfLiveContentOverlayCoordinator

- (SBShelfLiveContentOverlayCoordinator)initWithShelfDelegate:(id)a3
{
  id v4;
  SBShelfLiveContentOverlayCoordinator *v5;
  SBShelfLiveContentOverlayCoordinator *v6;
  uint64_t v7;
  NSMutableDictionary *leafAppLayoutsToOverlays;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBShelfLiveContentOverlayCoordinator;
  v5 = -[SBShelfLiveContentOverlayCoordinator init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfDelegate, v4);
    v7 = objc_opt_new();
    leafAppLayoutsToOverlays = v6->_leafAppLayoutsToOverlays;
    v6->_leafAppLayoutsToOverlays = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  if (self->_isSnapshotCacheObserver)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
    objc_msgSend(WeakRetained, "shelfLiveContentOverlayCoordinatorSnapshotCache:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeSnapshotObserver:", self);
    SBLogShelfLiveContent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Removed live content coordinator as snapshot observer", buf, 2u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)SBShelfLiveContentOverlayCoordinator;
  -[SBShelfLiveContentOverlayCoordinator dealloc](&v6, sel_dealloc);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "fromLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leafAppLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v6;
  objc_msgSend(v6, "floatingAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leafAppLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leafAppLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v7;
  objc_msgSend(v7, "floatingAppLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leafAppLayouts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke;
  v60[3] = &unk_1E8E9DF78;
  v19 = v17;
  v61 = v19;
  objc_msgSend(v12, "bs_filter:", v60);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v18;
  v58[1] = 3221225472;
  v58[2] = __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2;
  v58[3] = &unk_1E8E9DF78;
  v45 = v12;
  v46 = v19;
  v59 = v45;
  objc_msgSend(v19, "bs_filter:", v58);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v5;
  -[SBShelfLiveContentOverlayCoordinator _addOverlaysIfNeededForTransitionContext:](self, "_addOverlaysIfNeededForTransitionContext:", v5);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "setDisplayMode:", 0);
          objc_msgSend(v28, "setPendingSwitcherSnapshotCacheUpdate:", 0);
          SBLogShelfLiveContent();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v26, "itemForLayoutRole:", 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "uniqueIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v64 = v31;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Set displayMode to Snapshot and pendingSnapshotCacheUpdate to NO for %@ because it's going live", buf, 0xCu);

          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v23);
  }
  v44 = v21;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = v43;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "setDisplayMode:", 1);
          SBLogShelfLiveContent();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v37, "itemForLayoutRole:", 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "uniqueIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v64 = v42;
            _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "Set displayMode to LivePortal for %@ because it's going background", buf, 0xCu);

          }
        }

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v34);
  }

}

uint64_t __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __113__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SBShelfLiveContentOverlayCoordinator *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
  objc_msgSend(v5, "fromLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v5;
  objc_msgSend(v5, "toLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leafAppLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v7, "floatingAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leafAppLayouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leafAppLayouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  objc_msgSend(v8, "floatingAppLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leafAppLayouts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = WeakRetained;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __112__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionWillEndWithTransitionContext___block_invoke;
  v47[3] = &unk_1E8E9DF78;
  v36 = v18;
  v37 = v13;
  v48 = v36;
  objc_msgSend(v13, "bs_filter:", v47);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    v23 = 1;
    v41 = self;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v19, "shelfLiveContentOverlayCoordinatorSnapshotCache:", self);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "itemForLayoutRole:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addSnapshotUpdateObserver:forDisplayItem:inAppLayout:", self, v28, v25);

          self->_isSnapshotCacheObserver = 1;
          objc_msgSend(v26, "setPendingSwitcherSnapshotCacheUpdate:", 1);
          SBLogShelfLiveContent();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "itemForLayoutRole:", v23);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "uniqueIdentifier");
            v31 = v21;
            v32 = v22;
            v33 = v23;
            v34 = v19;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v35;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "Set pendingSnapshotCacheUpdate for %@ because it is about to be backgrounded", buf, 0xCu);

            v19 = v34;
            v23 = v33;
            v22 = v32;
            v21 = v31;
            self = v41;
          }

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v21);
  }

}

uint64_t __112__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionWillEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "fromLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leafAppLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v6;
  objc_msgSend(v6, "floatingAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leafAppLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leafAppLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v7;
  objc_msgSend(v7, "floatingAppLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leafAppLayouts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
  v59[3] = &unk_1E8E9DF78;
  v19 = v17;
  v60 = v19;
  objc_msgSend(v12, "bs_filter:", v59);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v18;
  v57[1] = 3221225472;
  v57[2] = __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
  v57[3] = &unk_1E8E9DF78;
  v43 = v12;
  v44 = v19;
  v58 = v43;
  objc_msgSend(v19, "bs_filter:", v57);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v5;
  -[SBShelfLiveContentOverlayCoordinator _addOverlaysIfNeededForTransitionContext:](self, "_addOverlaysIfNeededForTransitionContext:", v5);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v20;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v54 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v25, v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "setDisplayMode:", 1);
          SBLogShelfLiveContent();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "itemForLayoutRole:", 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "uniqueIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v30;
            _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Set displayMode to LivePortal for %@ because it is live", buf, 0xCu);

          }
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v22);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v31 = v42;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v36, v42);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
        {
          objc_msgSend(v37, "setDisplayMode:", 0);
          SBLogShelfLiveContent();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v36, "itemForLayoutRole:", 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "uniqueIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v41;
            _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEFAULT, "Set displayMode to Snapshot for %@ because it is backgrounded", buf, 0xCu);

          }
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v33);
  }

}

uint64_t __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __111__SBShelfLiveContentOverlayCoordinator_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)_addOverlaysIfNeededForTransitionContext:(id)a3
{
  id v4;
  id WeakRetained;
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
  void *v16;
  SBShelfLiveContentOverlayCoordinator *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  SBShelfLiveContentOverlay *v51;
  NSObject *v52;
  void *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  SBShelfLiveContentOverlayCoordinator *v63;
  void *v64;
  void *v65;
  id obj;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBShelfLiveContentOverlayCoordinator delegate](self, "delegate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_shelfDelegate);
  objc_msgSend(v4, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v4;
  objc_msgSend(v4, "applicationTransitionContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = WeakRetained;
  objc_msgSend(WeakRetained, "shelfLiveContentOverlayCoordinatorAppLayouts:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v58 = v7;
  objc_msgSend(v7, "bs_map:", &__block_literal_global_399);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_flatten");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leafAppLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v6;
  objc_msgSend(v6, "floatingAppLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leafAppLayouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v73;
    v55 = *MEMORY[0x1E0CD2B98];
    *(_QWORD *)&v19 = 138412290;
    v54 = v19;
    v63 = v17;
    v56 = *(_QWORD *)v73;
    v57 = v11;
    do
    {
      v22 = 0;
      v62 = v20;
      do
      {
        if (*(_QWORD *)v73 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v22);
        if (objc_msgSend(v23, "containsAnyItemFromSet:", v11, v54))
        {
          -[NSMutableDictionary objectForKey:](v17->_leafAppLayoutsToOverlays, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
            goto LABEL_12;
          v25 = v24;
          if (objc_msgSend(v24, "isPendingSwitcherSnapshotCacheUpdate"))
          {
            -[NSMutableDictionary removeObjectForKey:](v17->_leafAppLayoutsToOverlays, "removeObjectForKey:", v23);
            objc_msgSend(v64, "removeLiveContentOverlayForAppLayout:animated:", v23, 1);
            SBLogShelfLiveContent();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v23, "itemForLayoutRole:", 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uniqueIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v54;
              v77 = v28;
              _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Removing live content overlay for %@ because it's waiting for a snapshot and we're going to re-add it with live content", buf, 0xCu);

              v17 = v63;
            }

LABEL_12:
            +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "itemForLayoutRole:", 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "bundleIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "applicationWithBundleIdentifier:", v32);
            v33 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "uniqueIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)v33;
            objc_msgSend(v29, "sceneIdentityForApplication:uniqueIdentifier:", v33, v34);
            v35 = objc_claimAutoreleasedReturnValue();

            v70 = v29;
            v68 = (void *)v35;
            objc_msgSend(v29, "existingSceneHandleForSceneIdentity:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke_7;
            v71[3] = &unk_1E8E9DF78;
            v71[4] = v23;
            objc_msgSend(v58, "bs_firstObjectPassingTest:", v71);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 3;
            if (objc_msgSend(v67, "environment") != 2)
            {
              objc_msgSend(v65, "appLayout");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "itemForLayoutRole:", 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v38, "layoutRoleForItem:", v39);

            }
            objc_msgSend(v59, "entityForLayoutRole:", v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "frameForApplicationSceneEntity:", v40);
            v42 = v41;
            v44 = v43;
            objc_msgSend(v36, "sceneIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v65, "interfaceOrientationForElementIdentifier:", v45);

            v47 = objc_msgSend(v65, "interfaceOrientation");
            objc_msgSend(v60, "shelfLiveContentOverlayCoordinator:liveViewForAppLayout:", v17, v23);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "layer");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setShouldRasterize:", 1);
            objc_msgSend(v64, "displayScaleForContentOverlay");
            objc_msgSend(v49, "setRasterizationScale:", v50 * 0.5);
            objc_msgSend(v49, "setMinificationFilter:", v55);
            v51 = -[SBShelfLiveContentOverlay initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:]([SBShelfLiveContentOverlay alloc], "initWithSceneHandle:referenceSize:contentOrientation:containerOrientation:livePortalView:", v36, v46, v47, v48, v42, v44);
            v17 = v63;
            objc_msgSend(v64, "addLiveContentOverlay:forAppLayout:animated:", v51, v23, objc_msgSend(v61, "animationsDisabled") ^ 1);
            -[NSMutableDictionary setObject:forKey:](v63->_leafAppLayoutsToOverlays, "setObject:forKey:", v51, v23);
            SBLogShelfLiveContent();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v30, "uniqueIdentifier");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v54;
              v77 = v53;
              _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "Creating and adding live content overlay for %@", buf, 0xCu);

            }
            v25 = 0;
            v21 = v56;
            v11 = v57;
            v20 = v62;
          }

        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v20);
  }

}

uint64_t __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allItems");
}

uint64_t __81__SBShelfLiveContentOverlayCoordinator__addOverlaysIfNeededForTransitionContext___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOrContainsAppLayout:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateCacheEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "appLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_leafAppLayoutsToOverlays, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isPendingSwitcherSnapshotCacheUpdate"))
  {
    -[SBShelfLiveContentOverlayCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLiveContentOverlayForAppLayout:animated:", v4, 1);

    -[NSMutableDictionary removeObjectForKey:](self->_leafAppLayoutsToOverlays, "removeObjectForKey:", v4);
    SBLogShelfLiveContent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "itemForLayoutRole:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Removing live content overlay for %@ because its cached snapshot is ready", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)appLayoutForKeyboardFocusedScene
{
  return 0;
}

- (BOOL)performSwitcherKeyboardShortcutAction:(int64_t)a3
{
  return 0;
}

- (BOOL)wantsEdgeProtectForHomeGestureForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsHomeAffordanceAutoHideForAppLayout:(id)a3
{
  return 0;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBShelfLiveContentOverlayCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_leafAppLayoutsToOverlays, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v3, "removeLiveContentOverlayForAppLayout:animated:", v9, 1);
        -[NSMutableDictionary removeObjectForKey:](self->_leafAppLayoutsToOverlays, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (int64_t)containerOrientation
{
  return self->containerOrientation;
}

- (void)setContainerOrientation:(int64_t)a3
{
  self->containerOrientation = a3;
}

- (SBSwitcherLiveContentOverlayCoordinatorDelegate)delegate
{
  return (SBSwitcherLiveContentOverlayCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)areLiveContentOverlayUpdatesSuspended
{
  return self->liveContentOverlayUpdatesSuspended;
}

- (void)setLiveContentOverlayUpdatesSuspended:(BOOL)a3
{
  self->liveContentOverlayUpdatesSuspended = a3;
}

- (SBShelfLiveContentOverlayCoordinatorDelegate)shelfDelegate
{
  return (SBShelfLiveContentOverlayCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_shelfDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelfDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_leafAppLayoutsToOverlays, 0);
}

@end
