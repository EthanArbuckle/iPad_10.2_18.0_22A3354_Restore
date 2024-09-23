@implementation TUIAXCustomActionsCollector

- (TUIAXCustomActionsCollector)init
{
  TUIAXCustomActionsCollector *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *customActionByRefIdAndTrigger;
  NSMutableArray *v5;
  NSMutableArray *customActionsForPress;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIAXCustomActionsCollector;
  v2 = -[TUIAXCustomActionsCollector init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    customActionByRefIdAndTrigger = v2->_customActionByRefIdAndTrigger;
    v2->_customActionByRefIdAndTrigger = v3;

    v5 = objc_opt_new(NSMutableArray);
    customActionsForPress = v2->_customActionsForPress;
    v2->_customActionsForPress = v5;

  }
  return v2;
}

- (void)addActionTriggerHandler:(id)a3 controlIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  TUIAXCustomAction *v12;
  void *v13;
  void *v14;
  void *v15;
  TUIAXCustomAction *v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *customActionByRefIdAndTrigger;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  id obj;
  void *v26;
  id v27;
  NSMutableDictionary *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a3;
  v27 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionsData"));
  v28 = objc_opt_new(NSMutableDictionary);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allTriggers"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10);
        v12 = [TUIAXCustomAction alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "behaviorDataForTrigger:", v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionObject"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionDelegate"));
        v16 = -[TUIAXCustomAction initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:](v12, "initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:", v11, v13, v14, v15, v27);

        -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v16, v11);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("press")))
          -[NSMutableArray addObject:](self->_customActionsForPress, "addObject:", v16);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
  if (v17)
  {
    v18 = (void *)v17;
    customActionByRefIdAndTrigger = self->_customActionByRefIdAndTrigger;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](customActionByRefIdAndTrigger, "objectForKey:", v20));

    if (!v21)
    {
      v22 = self->_customActionByRefIdAndTrigger;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
      -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v28, v23);

    }
  }

}

- (NSDictionary)customActionByRefIdAndTrigger
{
  return &self->_customActionByRefIdAndTrigger->super;
}

- (NSArray)customActionsForPress
{
  return &self->_customActionsForPress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customActionsForPress, 0);
  objc_storeStrong((id *)&self->_customActionByRefIdAndTrigger, 0);
}

@end
