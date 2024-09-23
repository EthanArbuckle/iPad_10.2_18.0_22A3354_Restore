@implementation SKStateTransitionTable

+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v6 = a3;
  v28 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class(a1));
  v8 = objc_opt_new(NSMutableDictionary);
  objc_msgSend(v7, "setEntriesMap:", v8);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v29 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entriesMap"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));
        v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

        if (!v15)
        {
          v15 = objc_opt_new(NSMutableDictionary);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entriesMap"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "event"));
        if (objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v18)))
          sub_10002C9D8();

        if (objc_msgSend(v12, "selector"))
        {
          if ((objc_opt_respondsToSelector(v28, objc_msgSend(v12, "selector")) & 1) == 0)
            sub_10002C9B0();
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "event"));
          v21 = objc_msgSend(v12, "selector");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextState"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateTransitionEntry entryWithState:event:selector:nextState:](SKStateTransitionEntry, "entryWithState:event:selector:nextState:", v19, v20, v21, v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "event"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v23, v24);
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "event"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "action"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextState"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateTransitionEntry entryWithState:event:action:nextState:](SKStateTransitionEntry, "entryWithState:event:action:nextState:", v19, v20, v22, v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "event"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v24, v25);

        }
        v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "setSelectorTarget:", v28);
  return v7;
}

+ (id)tableWithTransitionEntries:(id)a3
{
  return objc_msgSend(a1, "tableWithTransitionEntries:selectorTarget:", a3, 0);
}

- (id)entryForState:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKStateTransitionTable entriesMap](self, "entriesMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  if (v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));
  else
    v10 = 0;

  return v10;
}

- (NSMutableDictionary)entriesMap
{
  return self->_entriesMap;
}

- (void)setEntriesMap:(id)a3
{
  objc_storeStrong((id *)&self->_entriesMap, a3);
}

- (id)selectorTarget
{
  return self->_selectorTarget;
}

- (void)setSelectorTarget:(id)a3
{
  objc_storeStrong(&self->_selectorTarget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectorTarget, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end
