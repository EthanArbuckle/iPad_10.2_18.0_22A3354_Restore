@implementation SBSUIInCallWindowSceneBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_45;
  v32 = v12;
  v33 = v10;
  v14 = v11;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v34 = v9;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v16)
  {
    v35 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_25;
  }
  v17 = v16;
  v35 = 0;
  v18 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v41 != v20)
        objc_enumerationMutation(v15);
      v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v18)
        {
          v23 = v18;
        }
        else
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v18 = v23;
        }
LABEL_19:
        objc_msgSend(v23, "addObject:", v22);
        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v19)
        {
          v23 = v19;
        }
        else
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v19 = v23;
        }
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        BYTE4(v35) = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        LOBYTE(v35) = 1;
      }
LABEL_20:
      objc_msgSend(v13, "removeObject:", v22);
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  }
  while (v17);
LABEL_25:

  if (objc_msgSend(v18, "count"))
    objc_msgSend(v14, "_handleHardwareButtonEventSceneActions:", v18);
  if (objc_msgSend(v19, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = v19;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(v14, "_handleDeviceLockAction:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v26);
    }

  }
  v10 = v33;
  v9 = v34;
  if ((v35 & 0x100000000) != 0)
  {
    objc_msgSend(v14, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v29, "inCallWindowSceneHandleShowingNoticeForRevealingSystemControls:", v14);

  }
  if ((v35 & 1) != 0)
  {
    objc_msgSend(v14, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "inCallWindowSceneHandleSilenceRingtone:", v14);

  }
  v12 = v32;
LABEL_45:

  return v13;
}

@end
