@implementation UIApplication(UIAccessibilityElementTraversal)

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  return objc_msgSend(a1, "_accessibilityViewChildrenWithOptions:referenceWindow:", a3, 0);
}

- (id)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal referenceWindow:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(a1, "_accessibilityMainWindow");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7;
  v25 = a1;
  objc_msgSend(a1, "_accessibilityElementWindowsWithOptions:referenceWindow:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0x1E0CEA000uLL;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(v12 + 2992), "_accessibilityElementsAndContainersDescendingFromViews:options:sorted:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14), v6, objc_msgSend(v6, "sorted"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (objc_msgSend(v6, "shouldReturnScannerGroups")
            && (unint64_t)objc_msgSend(v9, "count") >= 2)
          {
            v16 = v8;
            v17 = (void *)MEMORY[0x1E0C99E08];
            v30 = CFSTR("GroupElements");
            v31 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "dictionaryWithDictionary:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E3E10850, CFSTR("GroupTraits"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v25, "_accessibilityScanningBehaviorTraits") | 0x10);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("GroupScanBehaviorTraits"));

            objc_msgSend(v25, "_accessibilityGroupIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("GroupIdentifier"));
            v8 = v16;
            objc_msgSend(v16, "addObject:", v19);

            v12 = 0x1E0CEA000;
          }
          else
          {
            objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v15);
          }
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }
  AXLogElementTraversal();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[UIApplication(UIAccessibilityElementTraversal) _accessibilityViewChildrenWithOptions:referenceWindow:].cold.1();

  return v8;
}

- (void)_accessibilityAddKeyboardWindowToArray:()UIAccessibilityElementTraversal forModalWindow:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  AXUIAllKeyboardWindows();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__UIApplication_UIAccessibilityElementTraversal___accessibilityAddKeyboardWindowToArray_forModalWindow___block_invoke;
  v10[3] = &unk_1E3DFE190;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

- (id)_accessibilityTraversalWindows
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldIncludeStatusBarWindow:", 1);
  objc_msgSend(a1, "_accessibilityMainWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityElementWindowsWithOptions:referenceWindow:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v2, "axSafelyAddObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v2;
}

- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  AXPerformSafeBlock();
  objc_msgSend(a1, "_accessibilityElementWindowsWithOptions:referenceWindow:allWindows:", v6, v7, v11[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (id)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:allWindows:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  int v32;
  int v33;
  char v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (**v40)(void *, id);
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  id obj;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
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
  _QWORD aBlock[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v72 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_TextEffectsWindow)
  {
    _TextEffectsWindow = (uint64_t)NSClassFromString(CFSTR("UITextEffectsWindow"));
    _CarPlayStatusBarWindow = (uint64_t)NSClassFromString(CFSTR("DBStatusBarHostWindow"));
    _StatusBarWindow = (uint64_t)NSClassFromString(CFSTR("UIStatusBarWindow"));
    _SBMainSwitcherWindow = (uint64_t)NSClassFromString(CFSTR("SBMainSwitcherWindow"));
    _SBBannerWindow = (uint64_t)NSClassFromString(CFSTR("SBNotificationBannerWindow"));
    _SSScreenshotsWindow = (uint64_t)NSClassFromString(CFSTR("SSScreenshotsWindow"));
    _SBJindoWindow = (uint64_t)NSClassFromString(CFSTR("SBSystemApertureWindow"));
  }
  if (objc_msgSend(v9, "_accessibilityIsIsolatedWindow"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    goto LABEL_93;
  }
  v12 = (void *)objc_opt_new();
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke;
  v99[3] = &unk_1E3DFE1B8;
  v71 = v12;
  v100 = v71;
  objc_msgSend(v72, "enumerateObjectsUsingBlock:", v99);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "accessibilityViewIsModal"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityAddKeyboardWindowToArray:forModalWindow:", v13, v9);
    objc_msgSend(v13, "addObject:", v9);
    objc_msgSend(v10, "addObject:", v13);

    goto LABEL_92;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v16;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  if (!v73)
    goto LABEL_91;
  v68 = *(_QWORD *)v96;
  v69 = v10;
  v70 = v9;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v96 != v68)
        objc_enumerationMutation(obj);
      v76 = v17;
      v74 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v17);
      objc_msgSend(v71, "objectForKeyedSubscript:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v75 = v18;
      objc_msgSend(v18, "reverseObjectEnumerator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v92;
        v25 = -1.79769313e308;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v92 != v24)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v26);
            if (!objc_msgSend(v27, "accessibilityIsWindow")
              || (objc_msgSend(v27, "accessibilityElementsHidden") & 1) != 0)
            {
              goto LABEL_37;
            }
            objc_msgSend(v27, "windowLevel");
            if (v28 < v25)
              goto LABEL_24;
            if (!objc_msgSend(v27, "isUserInteractionEnabled"))
              goto LABEL_24;
            objc_msgSend(v27, "alpha");
            if (v29 <= 0.0 || (objc_msgSend(v27, "isHidden") & 1) != 0)
              goto LABEL_24;
            v33 = objc_msgSend(v27, "_accessibilityIsIsolatedWindow");
            v34 = v33;
            if (v33
              && (!objc_msgSend(v8, "shouldIncludeStatusBarWindow") || (objc_opt_isKindOfClass() & 1) == 0))
            {
              goto LABEL_37;
            }
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_43;
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v27, "isHidden") & 1) != 0)
            {
              if ((v34 & 1) != 0)
              {
                v30 = 1;
              }
              else
              {
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && (objc_opt_isKindOfClass() & 1) == 0
                  && (objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(v27, "windowLevel");
                  if (v35 > v25)
                    objc_msgSend(v77, "removeAllObjects");
                  objc_msgSend(v27, "windowLevel");
                  v25 = v36;
                  objc_msgSend(v77, "addObject:", v27);
                }
LABEL_24:
                v30 = 0;
              }
              if (objc_msgSend(v8, "shouldIncludeStatusBarWindow")
                && ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_msgSend(v27, "_accessibilityWindowVisible");
                goto LABEL_30;
              }
              if ((v30 | objc_msgSend(v27, "_accessibilityWindowVisible")) == 1)
LABEL_30:
                objc_msgSend(v19, "addObject:", v27);
              if (objc_opt_class() == _SBBannerWindow)
                objc_msgSend(v19, "insertObject:atIndex:", v27, 0);
              if (objc_opt_class() == _SSScreenshotsWindow)
              {
                objc_msgSend(MEMORY[0x1E0CF4EB8], "server");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "isScreenshotWindowVisible");

                if (v32)
                  objc_msgSend(v19, "insertObject:atIndex:", v27, 0);
              }
              if ((objc_msgSend(v27, "accessibilityViewIsModal") & 1) != 0)
                goto LABEL_57;
              goto LABEL_37;
            }
            objc_msgSend(v27, "subviews");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            if (v38)
LABEL_43:
              objc_msgSend(v19, "addObject:", v27);
LABEL_37:
            ++v26;
          }
          while (v23 != v26);
          v39 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
          v23 = v39;
        }
        while (v39);
      }
LABEL_57:

      objc_msgSend(v14, "addObjectsFromArray:", v19);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __117__UIApplication_UIAccessibilityElementTraversal___accessibilityElementWindowsWithOptions_referenceWindow_allWindows___block_invoke_2;
      aBlock[3] = &unk_1E3DFE1E0;
      aBlock[4] = v74;
      v40 = (unsigned int (**)(void *, id))_Block_copy(aBlock);
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "keyWindow");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v72, "containsObject:", v41))
        v42 = v41;
      else
        v42 = 0;
      v43 = v42;

      v44 = v77;
      if (v43
        && (!objc_msgSend(v77, "count") || (objc_msgSend(v77, "containsObject:", v43) & 1) == 0)
        && (objc_msgSend(v14, "containsObject:", v43) & 1) == 0)
      {
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v45 = v77;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v87;
          while (2)
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v87 != v48)
                objc_enumerationMutation(v45);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "accessibilityViewIsModal") & 1) != 0)
              {

                v44 = v77;
                goto LABEL_76;
              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
            if (v47)
              continue;
            break;
          }
        }

        v44 = v77;
        if ((objc_msgSend(v43, "accessibilityElementsHidden") & 1) == 0 && v40[2](v40, v43))
        {
          objc_msgSend(v19, "addObject:", v43);
          objc_msgSend(v14, "addObject:", v43);
        }
      }
LABEL_76:
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v50 = v44;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v83 != v53)
              objc_enumerationMutation(v50);
            v55 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
            if ((objc_msgSend(v14, "containsObject:", v55) & 1) == 0)
            {
              objc_msgSend(v19, "addObject:", v55);
              objc_msgSend(v14, "addObject:", v55);
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
        }
        while (v52);
      }

      v9 = v70;
      if (v70 && (objc_msgSend(v14, "containsObject:", v70) & 1) == 0 && v40[2](v40, v70))
      {
        objc_msgSend(v19, "addObject:", v70);
        objc_msgSend(v14, "addObject:", v70);
      }
      objc_msgSend(v14, "addObjectsFromArray:", v19);
      v10 = v69;
      objc_msgSend(v69, "addObject:", v19);

      v17 = v76 + 1;
    }
    while (v76 + 1 != v73);
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  }
  while (v73);
LABEL_91:

LABEL_92:
LABEL_93:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v56 = v10;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v78, v101, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v58; ++k)
      {
        if (*(_QWORD *)v79 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
        v62 = objc_msgSend(v61, "count");
        if (v62 - 1 >= 0)
        {
          v63 = v62;
          do
          {
            objc_msgSend(v61, "objectAtIndexedSubscript:", --v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v64, "accessibilityElementsHidden"))
              objc_msgSend(v61, "removeObjectAtIndex:", v63);

          }
          while (v63 > 0);
        }
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v78, v101, 16);
    }
    while (v58);
  }

  AXLogElementTraversal();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    -[UIApplication(UIAccessibilityElementTraversal) _accessibilityElementWindowsWithOptions:referenceWindow:allWindows:].cold.1();

  return v56;
}

- (void)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal referenceWindow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Children of the UIApp are %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityElementWindowsWithOptions:()UIAccessibilityElementTraversal referenceWindow:allWindows:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, v0, v1, "All windows are %{public}@. Reference window was %{public}@");
  OUTLINED_FUNCTION_2();
}

@end
