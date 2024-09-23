@implementation SBDisplayAppInteractionEventSource

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  -[SBDisplayAppInteractionEventSource _notifyTransition:beginning:](self, "_notifyTransition:beginning:", a4, 1);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  -[SBDisplayAppInteractionEventSource _notifyTransition:beginning:](self, "_notifyTransition:beginning:", a4, 0);
}

uint64_t __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)_notifyTransition:(id)a3 beginning:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  NSHashTable *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  id WeakRetained;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  uint64_t v99;
  _QWORD v100[8];
  _QWORD v101[8];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v4 = a4;
  v104 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_63;
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");
  v8 = objc_opt_class();
  objc_msgSend(v5, "workspaceTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v11;
  if (v11)
    v12 = objc_msgSend(v11, "source");
  else
    v12 = 0;
  objc_msgSend(v5, "applicationTransitionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestedActivatingWorkspaceEntity");
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = v6;
  v72 = (void *)v14;
  v69 = v5;
  v70 = v4;
  if (v14)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v6, "elements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v87;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v87 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
          objc_msgSend(v21, "workspaceEntity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v72, "isAnalogousToEntity:", v22);

          if (v23)
          {
            v24 = v21;
            goto LABEL_16;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
        if (v18)
          continue;
        break;
      }
      v24 = 0;
LABEL_16:
      v6 = v15;
      v4 = v70;
    }
    else
    {
      v24 = 0;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (v12 == 27)
  {
    objc_msgSend(v5, "fromLayoutState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "elements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "elements");
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v83;
      while (2)
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v83 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
          if ((objc_msgSend(v16, "containsObject:", v31) & 1) == 0)
          {
            v24 = v31;
            goto LABEL_30;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
        if (v28)
          continue;
        break;
      }
    }
    v24 = 0;
LABEL_30:

    v6 = v15;
    goto LABEL_31;
  }
  v24 = 0;
LABEL_32:
  objc_msgSend(v6, "elements");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bs_map:", &__block_literal_global_320);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "elements");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bs_map:", &__block_literal_global_52_2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v67 = v33;
  objc_msgSend(v33, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v37 = objc_claimAutoreleasedReturnValue();

  v66 = v35;
  objc_msgSend(v35, "allObjects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sortedArrayUsingComparator:", &__block_literal_global_59_0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 4;
  if (!v4)
    v39 = 5;
  v64 = v39;
  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  v40 = *MEMORY[0x1E0DABE38];
  v65 = (void *)v37;
  v101[0] = v37;
  v41 = *MEMORY[0x1E0DABE40];
  v100[0] = v40;
  v100[1] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "interfaceOrientationForLayoutRole:", 1));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v63;
  v100[2] = *MEMORY[0x1E0DABE60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "interfaceOrientation"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v61;
  v100[3] = *MEMORY[0x1E0DABE68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "spaceConfiguration"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v42;
  v100[4] = *MEMORY[0x1E0DABE58];
  v43 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "floatingConfiguration"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v44;
  v100[5] = *MEMORY[0x1E0DABE78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v43, "unlockedEnvironmentMode"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v101[5] = v45;
  v100[6] = *MEMORY[0x1E0DABE70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v100[7] = *MEMORY[0x1E0DABE50];
  v101[6] = v46;
  v101[7] = v71;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEvent:withPayload:", v64, v47);

  SBLogDockRecents();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
  if (v70)
  {
    if (v49)
    {
      *(_DWORD *)buf = 134218754;
      v93 = v7;
      v94 = 2112;
      v95 = v15;
      v96 = 2112;
      v97 = v24;
      v98 = 2048;
      v99 = v12;
      _os_log_impl(&dword_1D0540000, v48, OS_LOG_TYPE_INFO, "beginning transition to mode: %ld; layoutState: %@; activatingElement: %@, triggeredBy: %ld",
        buf,
        0x2Au);
    }

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v50 = self->_observers;
    v51 = -[NSHashTable countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v52; ++k)
        {
          if (*(_QWORD *)v79 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v55, "eventSource:didBeginTransitionToMode:withLayoutState:activatingElement:triggeredBy:", self, v7, v15, v24, v12);
        }
        v52 = -[NSHashTable countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      }
      while (v52);
    }
  }
  else
  {
    if (v49)
    {
      *(_DWORD *)buf = 134218754;
      v93 = v7;
      v94 = 2112;
      v95 = v15;
      v96 = 2112;
      v97 = v24;
      v98 = 2048;
      v99 = v12;
      _os_log_impl(&dword_1D0540000, v48, OS_LOG_TYPE_INFO, "ending transition to mode: %ld; layoutState: %@; activatingElement: %@, triggeredBy: %ld",
        buf,
        0x2Au);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v50 = self->_observers;
    v56 = -[NSHashTable countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v75;
      do
      {
        for (m = 0; m != v57; ++m)
        {
          if (*(_QWORD *)v75 != v58)
            objc_enumerationMutation(v50);
          v60 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v60, "eventSource:didFinishTransitionToMode:withLayoutState:activatingElement:triggeredBy:", self, v7, v15, v24, v12);
        }
        v57 = -[NSHashTable countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      }
      while (v57);
    }
  }

  v5 = v69;
  v6 = v15;
LABEL_63:

}

- (void)touchUpOccuredForIdentifier:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 pid:(int)a6
{
  -[SBDisplayAppInteractionEventSource _noteTouchForProcess:context:](self, "_noteTouchForProcess:context:", *(_QWORD *)&a6, *(_QWORD *)&a5);
}

id __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v11[0] = *MEMORY[0x1E0DABE30];
    objc_msgSend(v3, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("none");
    if (v5)
      v7 = (const __CFString *)v5;
    v12[0] = v7;
    v11[1] = *MEMORY[0x1E0DABE48];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "layoutRole"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  NSObject *v25;
  NSString *currentFocusedBundleID;
  NSString *v27;
  NSHashTable *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  NSString *v56;
  uint64_t v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v7 = a4;
  v34 = a5;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = v7;
  objc_msgSend(v7, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v42 = *(_QWORD *)v49;
    v41 = *MEMORY[0x1E0DABD28];
    v11 = *MEMORY[0x1E0DABD30];
    v40 = *MEMORY[0x1E0DABD20];
    v39 = *MEMORY[0x1E0DABD18];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v42)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!v10)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "hasKeyboardFocus", v34))
          {
            objc_msgSend(v13, "bundleIdentifier");
            v10 = (NSString *)objc_claimAutoreleasedReturnValue();
            SBLogDockRecents();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v10;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "elementWithFocusBundleID = %@", buf, 0xCu);
            }

          }
          else
          {
            v10 = 0;
          }
        }
        v15 = v10;
        v16 = (void *)MEMORY[0x1E0C99E08];
        v59[0] = v41;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "level", v34));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = v17;
        v59[1] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "isUIApplicationElement"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dictionaryWithDictionary:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v40);
        objc_msgSend(v13, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v39);
        objc_msgSend(v43, "addObject:", v20);

        v10 = v15;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  v57 = *MEMORY[0x1E0DABD38];
  v58 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "emitEvent:withPayload:", 3, v24);

  if (v10 && !-[NSString isEqualToString:](self->_currentFocusedBundleID, "isEqualToString:", v10))
  {
    SBLogDockRecents();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      currentFocusedBundleID = self->_currentFocusedBundleID;
      *(_DWORD *)buf = 138412546;
      v54 = currentFocusedBundleID;
      v55 = 2112;
      v56 = v10;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "elementWithFocusBundleID changed. old: %@; new: %@;",
        buf,
        0x16u);
    }

    v27 = v10;
    -[SBDisplayAppInteractionEventSource setCurrentFocusedBundleID:](self, "setCurrentFocusedBundleID:", v10);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = self->_observers;
    v29 = -[NSHashTable countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v33, "eventSource:keyboardFocusChangedToApplication:", self, self->_currentFocusedBundleID);
        }
        v30 = -[NSHashTable countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v30);
    }

    v10 = v27;
  }

}

- (void)_noteTouchForProcess:(int)a3 context:(unsigned int)a4
{
  _QWORD v4[5];
  int v5;
  unsigned int v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SBDisplayAppInteractionEventSource__noteTouchForProcess_context___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v5 = a3;
  v6 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __67__SBDisplayAppInteractionEventSource__noteTouchForProcess_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "applicationWithPid:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(v3, "bundleIdentifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "eventSource:userTouchedApplication:", *(_QWORD *)(a1 + 32), v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "eventSource:userTouchedApplication:pid:inContext:", *(_QWORD *)(a1 + 32), v10, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)_initWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SBDisplayAppInteractionEventSource *v22;
  SBDisplayAppInteractionEventSource *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBDisplayAppInteractionEventSource;
  v22 = -[SBDisplayAppInteractionEventSource init](&v25, sel_init);
  v23 = v22;
  if (v22)
    -[SBDisplayAppInteractionEventSource _configureEventSourceWithAnalyticsClient:applicationController:applicationRestrictionController:iconModel:layoutStateTransitionCoordinator:displayLayoutPublisher:touchDeliveryObservationService:](v22, "_configureEventSourceWithAnalyticsClient:applicationController:applicationRestrictionController:iconModel:layoutStateTransitionCoordinator:displayLayoutPublisher:touchDeliveryObservationService:", v15, v16, v17, v18, v19, v20, v21);

  return v23;
}

- (void)windowSceneDidConnect:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v22, "homeScreenController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "model");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (self->_displayLayoutPublisher)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayAppInteractionEventSource.m"), 70, CFSTR("An event source cannot have multiple window scene connections."));

  }
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "restrictionController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sceneManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_layoutStateTransitionCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayLayoutPublisher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00E00], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAppInteractionEventSource _configureEventSourceWithAnalyticsClient:applicationController:applicationRestrictionController:iconModel:layoutStateTransitionCoordinator:displayLayoutPublisher:touchDeliveryObservationService:](self, "_configureEventSourceWithAnalyticsClient:applicationController:applicationRestrictionController:iconModel:layoutStateTransitionCoordinator:displayLayoutPublisher:touchDeliveryObservationService:", v13, v14, v16, v11, v18, v19, v20);

}

- (void)_configureEventSourceWithAnalyticsClient:(id)a3 applicationController:(id)a4 applicationRestrictionController:(id)a5 iconModel:(id)a6 layoutStateTransitionCoordinator:(id)a7 displayLayoutPublisher:(id)a8 touchDeliveryObservationService:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FBSDisplayLayoutPublishing *displayLayoutPublisher;
  id v22;
  id v23;

  v15 = a8;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_storeWeak((id *)&self->_analyticsClient, a3);
  objc_storeWeak((id *)&self->_applicationController, v20);
  objc_msgSend(v19, "addObserver:", self);
  objc_storeWeak((id *)&self->_applicationRestrictionController, v19);

  objc_msgSend(v17, "addObserver:", self);
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, v17);

  objc_msgSend(v15, "addObserver:", self);
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = (FBSDisplayLayoutPublishing *)v15;
  v22 = v15;

  objc_msgSend(v16, "addObserver:", self);
  objc_storeWeak((id *)&self->_touchDeliveryObservationService, v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__installedAppsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), v20);

  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__userQuitApplication_, CFSTR("SBAppSwitcherQuitAppNotification"), 0);
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__iconVisibilityDidChange_, *MEMORY[0x1E0DAAA10], v18);

  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__userRemovedSuggestion_, CFSTR("SBFloatingDockSuggestionsDeletedNotification"), 0);
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__webBookmarkUninstalled_, *MEMORY[0x1E0DAAAB0], 0);

}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_touchDeliveryObservationService);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[FBSDisplayLayoutPublishing removeObserver:](self->_displayLayoutPublisher, "removeObserver:", self);
  v5 = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  objc_msgSend(v5, "removeObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_applicationRestrictionController);
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)SBDisplayAppInteractionEventSource;
  -[SBDisplayAppInteractionEventSource dealloc](&v7, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)touchDetachedForIdentifier:(unsigned int)a3 context:(unsigned int)a4 pid:(int)a5
{
  -[SBDisplayAppInteractionEventSource _noteTouchForProcess:context:](self, "_noteTouchForProcess:context:", *(_QWORD *)&a5, *(_QWORD *)&a4);
}

- (void)_installedAppsDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogDockRecents();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "installedAppsChanged changed. removedBundleIDs: %@;",
      buf,
      0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "eventSource:userDeletedApplications:", self, v5, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_userQuitApplication:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBAppSwitcherQuitAppBundleIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogDockRecents();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "userQuitApplication: %@;", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "eventSource:userQuitApplicationInSwitcher:", self, v5, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)applicationRestrictionController:(id)a3 didUpdateVisibleTags:(id)a4 hiddenTags:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSHashTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "count"))
  {
    SBLogDockRecents();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "hiddenTags: %@;", buf, 0xCu);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = self->_observers;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "eventSource:applicationsBecameHidden:", self, v8);
        }
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }

  }
  if (objc_msgSend(v7, "count"))
  {
    SBLogDockRecents();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "visibleTags: %@;", buf, 0xCu);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = self->_observers;
    v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "eventSource:applicationsBecameVisible:", self, v7, (_QWORD)v23);
        }
        v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }

  }
}

- (void)_userRemovedSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SBFloatingDockSuggestionsDeletedNotificationBundleIdentifierKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v4;
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SBFloatingDockSuggestionsDeletedNotificationWebAppIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogDockRecents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "userRemovedSuggestion: %@;", buf, 0xCu);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (v6)
            objc_msgSend(v15, "eventSource:userRemovedSuggestions:", self, v6);
          if (v8)
            objc_msgSend(v15, "eventSource:userRemovedSuggestions:", self, v8);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void)_webBookmarkUninstalled:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SBLogDockRecents();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "uninstalled bookmark for webClip: %@", buf, 0xCu);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_observers;
    v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "eventSource:userDeletedWebBookmark:", self, v7, (_QWORD)v16);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

uint64_t __66__SBDisplayAppInteractionEventSource__notifyTransition_beginning___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *MEMORY[0x1E0DABE30];
  v5 = a3;
  objc_msgSend(a2, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v7);
  return v8;
}

- (void)_iconVisibilityDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSHashTable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DAABC8]);
  v6 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v6;
  -[SBDisplayAppInteractionEventSource _bundleIDsForIcons:](self, "_bundleIDsForIcons:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    SBLogDockRecents();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "applications became hidden: %@", buf, 0xCu);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = self->_observers;
    v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "eventSource:applicationsBecameHidden:", self, v7);
        }
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DAABD0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDisplayAppInteractionEventSource _bundleIDsForIcons:](self, "_bundleIDsForIcons:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v25 = v16;
    SBLogDockRecents();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "applications became unhidden: %@", buf, 0xCu);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = self->_observers;
    v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "eventSource:applicationsBecameVisible:", self, v17);
        }
        v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }

    v16 = v25;
  }

}

- (id)_bundleIDsForIcons:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "applicationBundleID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)currentFocusedBundleID
{
  return self->_currentFocusedBundleID;
}

- (void)setCurrentFocusedBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKSTouchDeliveryObservationService)touchDeliveryObservationService
{
  return (BKSTouchDeliveryObservationService *)objc_loadWeakRetained((id *)&self->_touchDeliveryObservationService);
}

- (void)setTouchDeliveryObservationService:(id)a3
{
  objc_storeWeak((id *)&self->_touchDeliveryObservationService, a3);
}

- (FBSDisplayLayoutPublishing)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (void)setDisplayLayoutPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutPublisher, a3);
}

- (SBApplicationController)applicationController
{
  return (SBApplicationController *)objc_loadWeakRetained((id *)&self->_applicationController);
}

- (void)setApplicationController:(id)a3
{
  objc_storeWeak((id *)&self->_applicationController, a3);
}

- (SBApplicationRestrictionController)applicationRestrictionController
{
  return (SBApplicationRestrictionController *)objc_loadWeakRetained((id *)&self->_applicationRestrictionController);
}

- (void)setApplicationRestrictionController:(id)a3
{
  objc_storeWeak((id *)&self->_applicationRestrictionController, a3);
}

- (SBFAnalyticsClient)analyticsClient
{
  return (SBFAnalyticsClient *)objc_loadWeakRetained((id *)&self->_analyticsClient);
}

- (void)setAnalyticsClient:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsClient, a3);
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return (SBLayoutStateTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_destroyWeak((id *)&self->_analyticsClient);
  objc_destroyWeak((id *)&self->_applicationRestrictionController);
  objc_destroyWeak((id *)&self->_applicationController);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_destroyWeak((id *)&self->_touchDeliveryObservationService);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentFocusedBundleID, 0);
}

@end
