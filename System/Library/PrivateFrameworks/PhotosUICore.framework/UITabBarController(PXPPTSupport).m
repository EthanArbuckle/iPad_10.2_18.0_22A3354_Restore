@implementation UITabBarController(PXPPTSupport)

- (void)ppt_runTabSwitchingTestWithName:()PXPPTSupport options:delegate:completionHandler:
{
  id v10;
  id v11;
  id v12;
  const void *v13;
  void (**v14)(void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void (**v46)(void *, _QWORD);
  void *v47;
  id v48;
  id v49;
  id v50;
  void (**v51)(void *, _QWORD);
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
    v13 = a6;
  else
    v13 = &__block_literal_global_192063;
  v14 = (void (**)(void *, _QWORD))_Block_copy(v13);
  objc_msgSend(a1, "selectedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabBarItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1, "viewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("tab"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
    {
      objc_msgSend(v12, "failedTest:withFailureFormat:", v10, CFSTR("No tab specified"));
      v14[2](v14, 0);
LABEL_35:

      goto LABEL_36;
    }
    v46 = v14;
    v47 = v12;
    v45 = v17;
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("all")))
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v21 = v17;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v64 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "tabBarItem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        }
        while (v23);
      }

      objc_msgSend(v18, "removeObject:", v16);
      objc_msgSend(v18, "insertObject:atIndex:", v16, 0);
      objc_msgSend(v18, "addObject:", v16);
    }
    else
    {
      v43 = v11;
      v44 = v10;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v28 = v17;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      if (!v29)
      {
LABEL_28:

LABEL_32:
        v12 = v47;
        v10 = v44;
        objc_msgSend(v47, "failedTest:withFailureFormat:", v44, CFSTR("Couldn't find tab bar item for tab “%@”"), v20);
        v14 = v46;
        v46[2](v46, 0);
        v11 = v43;
LABEL_34:
        v17 = v45;
        goto LABEL_35;
      }
      v30 = v29;
      v31 = *(_QWORD *)v60;
LABEL_22:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v32), "tabBarItem");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "title");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "caseInsensitiveCompare:", v20);

        if (!v35)
          break;

        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          if (v30)
            goto LABEL_22;
          goto LABEL_28;
        }
      }

      if (!v33)
        goto LABEL_32;
      v11 = v43;
      v10 = v44;
      v12 = v47;
      if (v16 != v33)
      {
        objc_msgSend(v18, "addObject:", v16);
        objc_msgSend(v18, "addObject:", v33);

        goto LABEL_16;
      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v36 = v28;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v56;
        while (2)
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v56 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "tabBarItem");
            v41 = objc_claimAutoreleasedReturnValue();
            if ((void *)v41 != v16)
            {
              v42 = (void *)v41;
              objc_msgSend(v18, "addObject:", v41);

              goto LABEL_47;
            }

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v38)
            continue;
          break;
        }
      }
LABEL_47:

      objc_msgSend(v18, "addObject:", v16);
    }
    v12 = v47;
LABEL_16:
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("iterations"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "integerValue");

      objc_msgSend(v12, "startedTest:", v10);
      v52 = v18;
      v53 = v12;
      v54 = v10;
      v48 = v16;
      v49 = v53;
      v50 = v54;
      v14 = v46;
      v51 = v46;
      PXIterateAsynchronously();

    }
    else
    {
      objc_msgSend(v12, "failedTest:withFailureFormat:", v10, CFSTR("couldn't find tab bar items to cycle through"));
      v14 = v46;
      v46[2](v46, 0);
    }
    goto LABEL_34;
  }
  objc_msgSend(v12, "failedTest:withFailureFormat:", v10, CFSTR("Couldn't find initially selected tab bar item"));
  v14[2](v14, 0);
LABEL_36:

}

- (void)_switchToBarBarItem:()PXPPTSupport completionHandler:
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = (void *)MEMORY[0x1E0DC3470];
  v6 = a3;
  objc_msgSend(v5, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v7, "installCACommitCompletionBlock:", v10);
  v8 = objc_msgSend(v6, "action");
  objc_msgSend(v6, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendAction:to:from:forEvent:", v8, v9, v6, 0);

}

@end
