@implementation TSAccessibilityEditMenuController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23DBEC;
  block[3] = &unk_426DD0;
  block[4] = a1;
  if (qword_5438A0 != -1)
    dispatch_once(&qword_5438A0, block);
  return (id)qword_543898;
}

- (id)editMenuTitlesForItemProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  Class v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];

  v3 = objc_msgSend(a3, "tsaxEditMenuItems");
  if (objc_msgSend(v3, "count"))
  {
    v4 = +[NSMutableSet set](NSMutableSet, "set");
    v21 = 0;
    v5 = (void *)objc_opt_class(TSUIWindowAccessibility);
    v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[UIApplication keyWindow](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "keyWindow"), 1, &v21);
    if (v21)
LABEL_17:
      abort();
    v7 = -[objc_class tsaxFirstResponder](v6, "tsaxFirstResponder");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v3);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v21 = 0;
          v13 = (objc_class *)objc_opt_class(UIMenuItem);
          v14 = (void *)__TSAccessibilityCastAsClass(v13, v12, 1, &v21);
          if (v21)
            goto LABEL_17;
          v15 = v14;
          if (v14 && objc_msgSend(v7, "targetForAction:withSender:", objc_msgSend(v14, "action"), 0))
            objc_msgSend(v4, "addObject:", objc_msgSend(v15, "title"));
        }
        v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v4, "allObjects");
}

- (BOOL)performActionTitled:(id)a3 forEditMenuProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  Class v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];

  v5 = objc_msgSend(a4, "tsaxEditMenuItems");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v23 = 0;
    v7 = (void *)objc_opt_class(TSUIWindowAccessibility);
    v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)-[UIApplication keyWindow](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "keyWindow"), 1, &v23);
    if (v23)
LABEL_16:
      abort();
    v9 = -[objc_class tsaxFirstResponder](v8, "tsaxFirstResponder");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v10 = v6;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v5);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
          v23 = 0;
          v14 = (objc_class *)objc_opt_class(UIMenuItem);
          v15 = (void *)__TSAccessibilityCastAsClass(v14, v13, 1, &v23);
          if (v23)
            goto LABEL_16;
          v16 = v15;
          if (objc_msgSend(objc_msgSend(v15, "title"), "isEqualToString:", a3))
          {
            v17 = objc_msgSend(v16, "action");
            if (objc_msgSend(v9, "targetForAction:withSender:", v17, 0))
            {
              objc_msgSend(v9, "performSelector:withObject:", v17, 0);
              LOBYTE(v6) = 1;
              return (char)v6;
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        v10 = v6;
        if (v6)
          continue;
        break;
      }
    }
  }
  return (char)v6;
}

@end
