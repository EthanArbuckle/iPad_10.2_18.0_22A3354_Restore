@implementation WKWebView(ScribbleUtilities)

- (double)safari_zoomScale
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "scrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "zoomScale");
  v3 = v2;

  return v3;
}

- (WBSScribbleStyleSheet)safari_styleSheetForTargets:()ScribbleUtilities forceScrollable:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  WBSScribbleStyleSheet *v22;
  void *v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v25 = a4;
    v24 = a1;
    v26 = v8;
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        v28 = v12;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "safari_isOutOfFlow") & 1) == 0)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v15, "safari_selectorsForStyleSheetRules");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v31;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v31 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
                  if ((objc_msgSend(v10, "containsObject:", v21) & 1) == 0)
                  {
                    objc_msgSend(v10, "addObject:", v21);
                    objc_msgSend(v9, "appendFormat:", CFSTR("%@{display:none!important;}"), v21);
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v18);
            }

            v12 = v28;
          }
          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v12);
    }

    if (v25)
      objc_msgSend(v9, "appendString:", CFSTR("body,html{overflow:scroll!important;pointer-events:auto!important;}"));
    v8 = v26;
    if (objc_msgSend(v9, "length"))
      v22 = -[WBSScribbleStyleSheet initWithSource:webView:host:]([WBSScribbleStyleSheet alloc], "initWithSource:webView:host:", v9, v24, v26);
    else
      v22 = 0;
    v6 = v27;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
