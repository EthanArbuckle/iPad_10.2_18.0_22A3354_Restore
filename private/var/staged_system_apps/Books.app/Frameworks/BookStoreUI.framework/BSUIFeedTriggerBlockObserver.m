@implementation BSUIFeedTriggerBlockObserver

- (BSUIFeedTriggerBlockObserver)init
{
  BSUIFeedTriggerBlockObserver *v2;
  uint64_t v3;
  NSMutableDictionary *observersByTrigger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIFeedTriggerBlockObserver;
  v2 = -[BSUIFeedTriggerBlockObserver init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    observersByTrigger = v2->_observersByTrigger;
    v2->_observersByTrigger = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedTriggerBlockObserver observersByTrigger](self, "observersByTrigger"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(v9, "addObserver:forTrigger:", self, v8);
    if (v11)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v12 = objc_retainBlock(v14);
  objc_msgSend(v11, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedTriggerBlockObserver observersByTrigger](self, "observersByTrigger"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v8);

}

- (void)removeObserver:(id)a3 forTrigger:(id)a4 inStateManager:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedTriggerBlockObserver observersByTrigger](self, "observersByTrigger"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v14));

  v10 = objc_retainBlock(v7);
  objc_msgSend(v9, "removeObject:", v10);

  v11 = objc_msgSend(v9, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedTriggerBlockObserver observersByTrigger](self, "observersByTrigger"));
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v14);
  else
    objc_msgSend(v12, "removeObjectForKey:", v14);

}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (**v15)(id, void *);
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIFeedTriggerBlockObserver observersByTrigger](self, "observersByTrigger"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void (**)(id, void *))objc_retainBlock(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14));
        if (v15)
        {
          v16 = NSStringFromTUITriggerState(a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v15[2](v15, v17);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (NSMutableDictionary)observersByTrigger
{
  return self->_observersByTrigger;
}

- (void)setObserversByTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_observersByTrigger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByTrigger, 0);
}

@end
