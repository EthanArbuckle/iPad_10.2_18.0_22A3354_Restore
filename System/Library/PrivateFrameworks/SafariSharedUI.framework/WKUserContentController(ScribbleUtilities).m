@implementation WKUserContentController(ScribbleUtilities)

- (void)safari_updateScribbleStyleSheetForWebView:()ScribbleUtilities targets:forceScrollable:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
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
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v26 = v9;
  objc_msgSend(v8, "safari_styleSheetForTargets:forceScrollable:", v9, a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "_userStyleSheets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "webView");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = v17 == (_QWORD)v8;
          else
            v19 = 1;
          if (v19)
            objc_msgSend(v10, "addObject:", v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v13);
  }

  if (v25)
    objc_msgSend(a1, "_addUserStyleSheet:", v25);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(a1, "_removeUserStyleSheet:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v22);
  }

}

@end
