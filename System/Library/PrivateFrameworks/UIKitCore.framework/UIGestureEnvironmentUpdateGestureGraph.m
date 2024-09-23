@implementation UIGestureEnvironmentUpdateGestureGraph

void ___UIGestureEnvironmentUpdateGestureGraph_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = kUIGestureRecognizerUpdateInfo_block_invoke___s_category;
  if (!kUIGestureRecognizerUpdateInfo_block_invoke___s_category)
  {
    v4 = __UILogCategoryGetNode("GestureEnvironment", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&kUIGestureRecognizerUpdateInfo_block_invoke___s_category);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v20 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      objc_msgSend(a2, "valueForKeyPath:", CFSTR("_briefDescription"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "resetting gesture subgraph %@", buf, 0xCu);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = a2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        -[UIGestureEnvironment _nodeForGestureRecognizer:](*(id **)(a1 + 32), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removePropertyForKey:", CFSTR("updateInfo"));
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v11, "edgesForLabel:", CFSTR("dynamicFailureRequirement"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeEdges:", v13);

        -[UIGestureEnvironment _clearGestureNeedsUpdate:](*(_QWORD *)(a1 + 32), v10);
        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__clearGestureBlockedFromReset_, v14, CFSTR("UIGestureEnvironment.m"), 1031, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

LABEL_27:
            v15 = 1;
            goto LABEL_15;
          }
          if ((*(_BYTE *)(v10 + 16) & 0x10) != 0)
            objc_msgSend(*(id *)(v14 + 48), "removeObject:", v10);
        }
        else if (!v10)
        {
          goto LABEL_27;
        }
        if ((*(_QWORD *)(v10 + 8) & 0x200000000) != 0)
        {
          v16 = *(_QWORD *)(a1 + 32);
          if (v16)
            goto LABEL_20;
          goto LABEL_21;
        }
        v15 = 0;
LABEL_15:
        if (!objc_msgSend((id)v10, "state"))
          goto LABEL_22;
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
        {
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__clearGestureIsDirty_, v16, CFSTR("UIGestureEnvironment.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureRecognizer"));

          }
LABEL_20:
          objc_msgSend(*(id *)(v16 + 40), "removeObject:", v10);
        }
LABEL_21:
        objc_msgSend((id)v10, "_resetGestureRecognizer");
LABEL_22:
        if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10))
          -[UIGestureEnvironment _removeNodeFromGestureGraph:](*(id **)(a1 + 32), v11);

        ++v9;
      }
      while (v7 != v9);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v7 = v19;
    }
    while (v19);
  }

}

@end
