@implementation ErrorActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = objc_opt_class(ErrorAction);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("kMapsInterruptionTitle"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("kMapsInterruptionMessage"));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v28 = v7;
      v14 = objc_alloc_init((Class)NSMutableArray);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v29 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
            v22 = objc_msgSend(v20, "cancels");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handler"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v21, v22, v23));

            objc_msgSend(v14, "addObject:", v24);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v17);
      }

      v25 = objc_msgSend(v14, "copy");
      v7 = v28;
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("kMapsInterruptionActions"));

      v6 = v29;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v27 = objc_msgSend(v7, "copy");
    objc_msgSend(v26, "interruptApplicationWithKind:userInfo:completionHandler:", 3, v27, 0);

  }
}

@end
