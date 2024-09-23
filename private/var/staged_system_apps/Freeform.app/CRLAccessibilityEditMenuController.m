@implementation CRLAccessibilityEditMenuController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D2270;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415388 != -1)
    dispatch_once(&qword_101415388, block);
  return (id)qword_101415380;
}

- (id)editMenuTitlesForItemProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxEditMenuItems"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v27 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxWindow"));
    objc_opt_class(CRLUIWindowAccessibility, v7);
    v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v27);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v27)
      abort();
    v11 = (void *)v10;

    v22 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxFirstResponder"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "targetForAction:withSender:", objc_msgSend(v3, "crlaxSelectorForEditMenuItemName:", v18), 0));

          if (v19)
            objc_msgSend(v5, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

  }
  else
  {
    v5 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));

  return v20;
}

- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void **p_vtable;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v34;
  char v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxEditMenuItems"));
  if (objc_msgSend(v7, "count"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v8)
    {
      v9 = v8;
      v35 = 0;
      v10 = *(_QWORD *)v49;
      p_vtable = CRLSearch.vtable;
      v37 = v6;
      v38 = v5;
      v36 = *(_QWORD *)v49;
      do
      {
        v12 = 0;
        v39 = v9;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v12);
          if (objc_msgSend(v13, "isEqualToString:", v5, v34))
          {
            v14 = objc_msgSend(v6, "crlaxSelectorForEditMenuItemName:", v13);
            v47 = 0;
            v15 = v6;
            objc_opt_class(p_vtable + 297, v16);
            v18 = __CRLAccessibilityCastAsClass(v17, (uint64_t)v15, 1, &v47);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (v47)
              abort();
            v20 = (void *)v19;

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", CFSTR("interactiveCanvasController")));
              v22 = v21;
              if (v21)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editorController"));
                v43 = 0u;
                v44 = 0u;
                v45 = 0u;
                v46 = 0u;
                v41 = v23;
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentEditors"));
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
                if (v25)
                {
                  v26 = v25;
                  v40 = v22;
                  v27 = *(_QWORD *)v44;
                  while (2)
                  {
                    for (i = 0; i != v26; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v44 != v27)
                        objc_enumerationMutation(v24);
                      v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
                      if (objc_msgSend(v29, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasEditor))
                      {
                        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", CFSTR("canvasEditorHelper")));
                        v31 = (void *)v30;
                        if (v30
                          && (objc_opt_respondsToSelector(v30, "canPerformEditorAction:withSender:") & 1) != 0
                          && objc_msgSend(v31, "canPerformEditorAction:withSender:", v14, 0))
                        {
                          objc_msgSend(v29, "performSelector:withObject:", v14, 0);

                          v35 = 1;
                          goto LABEL_25;
                        }

                      }
                    }
                    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
                    if (v26)
                      continue;
                    break;
                  }
LABEL_25:
                  v6 = v37;
                  v5 = v38;
                  v10 = v36;
                  v22 = v40;
                }

                p_vtable = (void **)(CRLSearch + 24);
                v9 = v39;
              }

            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v12 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v9);
    }
    else
    {
      v35 = 0;
    }

    v32 = v35 & 1;
    v7 = v34;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
