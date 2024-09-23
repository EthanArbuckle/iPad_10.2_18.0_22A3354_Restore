@implementation SKStateTransitionTable

+ (id)tableWithTransitionEntries:(id)a3 selectorTarget:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = a4;
  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "setEntriesMap:", v7);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v28 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(v6, "entriesMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "state");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = (void *)objc_opt_new();
          objc_msgSend(v6, "entriesMap");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "state");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        objc_msgSend(v11, "event");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v17);
        if (objc_claimAutoreleasedReturnValue())
          +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:].cold.2();

        if (objc_msgSend(v11, "selector"))
        {
          objc_msgSend(v11, "selector");
          if ((objc_opt_respondsToSelector() & 1) == 0)
            +[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:].cold.1();
          objc_msgSend(v11, "state");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "event");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "selector");
          objc_msgSend(v11, "nextState");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKStateTransitionEntry entryWithState:event:selector:nextState:](SKStateTransitionEntry, "entryWithState:event:selector:nextState:", v18, v19, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "event");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v23);
        }
        else
        {
          objc_msgSend(v11, "state");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "event");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "action");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "nextState");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKStateTransitionEntry entryWithState:event:action:nextState:](SKStateTransitionEntry, "entryWithState:event:action:nextState:", v18, v19, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "event");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v24);

        }
        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "setSelectorTarget:", v27);
  return v6;
}

+ (id)tableWithTransitionEntries:(id)a3
{
  return (id)objc_msgSend(a1, "tableWithTransitionEntries:selectorTarget:", a3, 0);
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
  -[SKStateTransitionTable entriesMap](self, "entriesMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

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

+ (void)tableWithTransitionEntries:selectorTarget:.cold.1()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 85, "[target respondsToSelector:entry.selector]");
}

+ (void)tableWithTransitionEntries:selectorTarget:.cold.2()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 83, "events[entry.event] == nil");
}

@end
