@implementation TUITriggerStateManager

- (TUITriggerStateManager)init
{
  TUITriggerStateManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *triggerStates;
  NSMutableDictionary *v5;
  NSMutableDictionary *lastUpdateEventForTrigger;
  NSMutableDictionary *v7;
  NSMutableDictionary *observers;
  NSMutableSet *v9;
  NSMutableSet *embeddedCollectionDelegates;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUITriggerStateManager;
  v2 = -[TUITriggerStateManager init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    triggerStates = v2->_triggerStates;
    v2->_triggerStates = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastUpdateEventForTrigger = v2->_lastUpdateEventForTrigger;
    v2->_lastUpdateEventForTrigger = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observers = v2->_observers;
    v2->_observers = v7;

    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    embeddedCollectionDelegates = v2->_embeddedCollectionDelegates;
    v2->_embeddedCollectionDelegates = v9;

  }
  return v2;
}

- (void)addObserver:(id)a3 forTrigger:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUITriggerStateManager observers](self, "observers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (!v8)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  objc_msgSend(v8, "addObject:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUITriggerStateManager observers](self, "observers"));
  objc_msgSend(v9, "setObject:forKey:", v8, v6);

}

- (void)removeObserver:(id)a3 forTrigger:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUITriggerStateManager observers](self, "observers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    objc_msgSend(v8, "removeObject:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUITriggerStateManager observers](self, "observers"));
    objc_msgSend(v9, "setObject:forKey:", v8, v6);

  }
}

- (void)updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4
{
  NSMutableSet *embeddedCollectionDelegates;
  _QWORD v7[5];

  -[TUITriggerStateManager _updateTriggerStatesWithNewStates:updateEvent:](self, "_updateTriggerStatesWithNewStates:updateEvent:", a3);
  embeddedCollectionDelegates = self->_embeddedCollectionDelegates;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1279F0;
  v7[3] = &unk_2420D0;
  v7[4] = a4;
  -[NSMutableSet enumerateObjectsUsingBlock:](embeddedCollectionDelegates, "enumerateObjectsUsingBlock:", v7);
}

- (unint64_t)stateForTriggerWithName:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_triggerStates, "objectForKey:", a3));
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (void)registerEmbeddedCollectionDelegate:(id)a3
{
  -[NSMutableSet addObject:](self->_embeddedCollectionDelegates, "addObject:", a3);
}

- (void)unregisterEmbeddedCollectionDelegate:(id)a3
{
  -[NSMutableSet removeObject:](self->_embeddedCollectionDelegates, "removeObject:", a3);
}

- (void)_updateTriggerStatesWithNewStates:(id)a3 updateEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  void *i;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  NSMutableDictionary *triggerStates;
  void *v18;
  NSMutableDictionary *lastUpdateEventForTrigger;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "namesForTriggersInUpdate"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v31)
  {
    v29 = v6;
    v30 = *(_QWORD *)v37;
    v28 = v7;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v7);
        v9 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v10 = (unint64_t)objc_msgSend(v6, "observationModeForTriggerWithName:", v9, v28, v29);
        if (a4 < 2)
        {
          if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
            continue;
        }
        else if (a4 != 2 && (a4 != 3 || v10 >= 2))
        {
          continue;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_triggerStates, "objectForKey:", v9));
        v12 = objc_msgSend(v11, "intValue");

        v13 = objc_msgSend(v6, "stateForTriggerWithName:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lastUpdateEventForTrigger, "objectForKey:", v9));
        v15 = objc_msgSend(v14, "intValue");

        if (v13 != (id)(int)v12 || v15 != a4)
        {
          triggerStates = self->_triggerStates;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
          -[NSMutableDictionary setObject:forKey:](triggerStates, "setObject:forKey:", v18, v9);

          lastUpdateEventForTrigger = self->_lastUpdateEventForTrigger;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
          -[NSMutableDictionary setObject:forKey:](lastUpdateEventForTrigger, "setObject:forKey:", v20, v9);

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUITriggerStateManager observers](self, "observers"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v9));

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(_QWORD *)v33 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j), "handleTrigger:didChangeState:updateEvent:", v9, v13, a4);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v25);
          }

          v7 = v28;
          v6 = v29;
        }
      }
      v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v31);
  }

}

- (NSMutableDictionary)triggerStates
{
  return self->_triggerStates;
}

- (void)setTriggerStates:(id)a3
{
  objc_storeStrong((id *)&self->_triggerStates, a3);
}

- (NSMutableDictionary)lastUpdateEventForTrigger
{
  return self->_lastUpdateEventForTrigger;
}

- (void)setLastUpdateEventForTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateEventForTrigger, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableSet)embeddedCollectionDelegates
{
  return self->_embeddedCollectionDelegates;
}

- (void)setEmbeddedCollectionDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedCollectionDelegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedCollectionDelegates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventForTrigger, 0);
  objc_storeStrong((id *)&self->_triggerStates, 0);
}

@end
