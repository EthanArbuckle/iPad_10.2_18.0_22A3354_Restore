@implementation TUIVisibilityController

+ (id)sharedQueue
{
  if (qword_2CB1E8 != -1)
    dispatch_once(&qword_2CB1E8, &stru_23DBD8);
  return (id)qword_2CB1E0;
}

- (TUIVisibilityController)initWithRootProvider:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  TUIVisibilityController *v8;
  TUIVisibilityController *v9;
  TUIVisibilityCollector *v10;
  TUIVisibilityCollector *rootCollector;
  uint64_t v12;
  NSHashTable *q_trackers;
  NSMutableArray *v14;
  NSMutableArray *l_updates;
  NSMutableDictionary *v16;
  NSMutableDictionary *collectorsMap;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TUIVisibilityController;
  v8 = -[TUIVisibilityController init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = -[TUIVisibilityCollector initWithController:provider:identifier:]([TUIVisibilityCollector alloc], "initWithController:provider:identifier:", v9, v6, 0);
    rootCollector = v9->_rootCollector;
    v9->_rootCollector = v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0));
    q_trackers = v9->_q_trackers;
    v9->_q_trackers = (NSHashTable *)v12;

    v14 = objc_opt_new(NSMutableArray);
    l_updates = v9->_l_updates;
    v9->_l_updates = v14;

    v16 = objc_opt_new(NSMutableDictionary);
    collectorsMap = v9->_collectorsMap;
    v9->_collectorsMap = v16;

  }
  return v9;
}

- (id)newTrackerWithDefaultThreshold:(double)a3 block:(id)a4
{
  id v6;
  TUIVisibilityTracker *v7;
  NSObject *queue;
  TUIVisibilityTracker *v9;
  TUIVisibilityTracker *v10;
  TUIVisibilityTracker *v11;
  _QWORD v13[5];
  TUIVisibilityTracker *v14;

  v6 = a4;
  v7 = -[TUIVisibilityTracker initWithThreshold:block:queue:]([TUIVisibilityTracker alloc], "initWithThreshold:block:queue:", v6, self->_queue, a3);

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1DAC0;
  v13[3] = &unk_23D7D0;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  dispatch_sync(queue, v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)_scheduleUpdate:(id)a3
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  NSObject *queue;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "time");
  v6 = v5;
  if ((objc_msgSend(v4, "flags") & 1) != 0)
    v7 = ((unint64_t)objc_msgSend(v4, "flags") >> 1) & 1;
  else
    LOBYTE(v7) = 1;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  if (!self->_l_processUpdatesScheduled && (v7 & 1) == 0)
  {
    if (v6 - self->_lastUpdate > 0.1 || !-[NSMutableArray count](self->_l_updates, "count"))
      goto LABEL_8;
LABEL_10:
    -[NSMutableArray addObject:](self->_l_updates, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_11;
  }
  if (self->_l_processUpdatesScheduled)
    goto LABEL_10;
LABEL_8:
  self->_l_processUpdatesScheduled = 1;
  -[NSMutableArray addObject:](self->_l_updates, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1DBE8;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(queue, block);
LABEL_11:

}

- (void)_scheduleUpdates:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *queue;
  _QWORD block[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options(p_lock, 0x10000);
  if (self->_l_processUpdatesScheduled)
  {
    -[NSMutableArray addObjectsFromArray:](self->_l_updates, "addObjectsFromArray:", v5);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_l_processUpdatesScheduled = 1;
    -[NSMutableArray addObjectsFromArray:](self->_l_updates, "addObjectsFromArray:", v5);

    os_unfair_lock_unlock(p_lock);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1DCC0;
    block[3] = &unk_23D938;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)q_processUpdates
{
  os_unfair_lock_s *p_lock;
  id v4;
  char v5;
  double v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  void (**v15)(void);
  void (**v16)(void);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  v4 = -[NSMutableArray copy](self->_l_updates, "copy");
  -[NSMutableArray removeAllObjects](self->_l_updates, "removeAllObjects");
  v5 = 0;
  v6 = 0.0;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_24;
  do
  {
    os_unfair_lock_unlock(p_lock);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v8)
      goto LABEL_23;
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "time");
        v14 = v13;
        if ((objc_msgSend(v12, "flags") & 2) != 0)
        {
          if ((v5 & 1) != 0)
            -[TUIVisibilityController q_commitWithTime:](self, "q_commitWithTime:", v6);
          v16 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "block"));
          v16[2]();

          goto LABEL_19;
        }
        if ((v5 & 1) == 0)
          v6 = v14;
        if ((v5 & 1 & (v14 - v6 > 0.01)) == 1)
        {
          -[TUIVisibilityController q_commitWithTime:](self, "q_commitWithTime:", v6);
          v5 = 0;
        }
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "block"));
        v15[2]();

        if ((v5 & 1) == 0)
          v6 = v14;
        if ((objc_msgSend(v12, "flags") & 1) == 0)
        {
          -[TUIVisibilityController q_commitWithTime:](self, "q_commitWithTime:", v6);
LABEL_19:
          v5 = 0;
          continue;
        }
        v5 = 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
LABEL_23:

    os_unfair_lock_lock_with_options(p_lock, 0x10000);
    v4 = -[NSMutableArray copy](self->_l_updates, "copy");
    -[NSMutableArray removeAllObjects](self->_l_updates, "removeAllObjects");
  }
  while (objc_msgSend(v4, "count"));
LABEL_24:
  self->_l_processUpdatesScheduled = 0;
  os_unfair_lock_unlock(p_lock);

  if ((v5 & 1) != 0)
    -[TUIVisibilityController q_commitWithTime:](self, "q_commitWithTime:", v6);
}

- (void)q_commitWithTime:(double)a3
{
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  TUIVisibilityCollector *rootCollector;
  id v12;
  void *v13;
  BOOL v14;
  NSHashTable *q_needsUpdate;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_q_trackers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v16 = 0;
        rootCollector = self->_rootCollector;
        -[TUIVisibilityCollector q_visibleBoundsSize](rootCollector, "q_visibleBoundsSize");
        v12 = -[TUIVisibilityCollector q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:](rootCollector, "q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:", v10, &v16, 0, self->_q_needsUpdate);
        v13 = v12;
        if (v16)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
          objc_msgSend(v10, "q_notifyObserversWithRootNode:time:", v12, a3);

      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  q_needsUpdate = self->_q_needsUpdate;
  self->_q_needsUpdate = 0;

}

- (void)removeTracker:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1E0F8;
  block[3] = &unk_23D7D0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)queueUpdateWithBlock:(id)a3
{
  id v4;
  _TUIVisibilityUpdate *v5;

  v4 = a3;
  v5 = -[_TUIVisibilityUpdate initWithTime:flags:block:]([_TUIVisibilityUpdate alloc], "initWithTime:flags:block:", 2, v4, 0.0);

  -[TUIVisibilityController _scheduleUpdate:](self, "_scheduleUpdate:", v5);
}

- (void)q_setNeedsUpdateForCollector:(id)a3
{
  id v4;
  NSHashTable *q_needsUpdate;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  q_needsUpdate = self->_q_needsUpdate;
  v8 = v4;
  if (!q_needsUpdate)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v7 = self->_q_needsUpdate;
    self->_q_needsUpdate = v6;

    v4 = v8;
    q_needsUpdate = self->_q_needsUpdate;
  }
  -[NSHashTable addObject:](q_needsUpdate, "addObject:", v4);

}

- (void)queueUpdateForCollector:(id)a3 time:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _TUIVisibilityUpdate *v19;
  id v20;
  id v21;
  _TUIVisibilityUpdate *v22;
  _QWORD v23[4];
  id v24;
  TUIVisibilityController *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
  -[TUIVisibilityController _computeClippedBoundsForProvider:](self, "_computeClippedBoundsForProvider:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = [_TUIVisibilityUpdate alloc];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1E304;
  v23[3] = &unk_23DC00;
  v27 = v12;
  v28 = v14;
  v29 = v16;
  v30 = v18;
  v25 = self;
  v26 = v9;
  v24 = v8;
  v20 = v9;
  v21 = v8;
  v22 = -[_TUIVisibilityUpdate initWithTime:flags:block:](v19, "initWithTime:flags:block:", 1, v23, a4);
  -[TUIVisibilityController _scheduleUpdate:](self, "_scheduleUpdate:", v22);

}

- (void)queueVisibleBoundsUpdateForCollector:(id)a3 time:(double)a4
{
  id v6;
  NSMutableArray *v7;

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  -[TUIVisibilityController _appendVisibleBoundsUpdatesAtTime:forCollector:toUpdates:](self, "_appendVisibleBoundsUpdatesAtTime:forCollector:toUpdates:", v6, v7, a4);

  -[TUIVisibilityController _scheduleUpdates:](self, "_scheduleUpdates:", v7);
}

- (void)queueUpdateVisible:(BOOL)a3 forCollector:(id)a4 time:(double)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TUIVisibilityUpdate *v18;
  id v19;
  _TUIVisibilityUpdate *v20;
  _QWORD v21[4];
  id v22;
  TUIVisibilityController *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
  -[TUIVisibilityController _computeClippedBoundsForProvider:](self, "_computeClippedBoundsForProvider:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = [_TUIVisibilityUpdate alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1E4C4;
  v21[3] = &unk_23DC28;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  v27 = v17;
  v28 = a3;
  v22 = v8;
  v23 = self;
  v19 = v8;
  v20 = -[_TUIVisibilityUpdate initWithTime:flags:block:](v18, "initWithTime:flags:block:", 0, v21, a5);
  -[TUIVisibilityController _scheduleUpdate:](self, "_scheduleUpdate:", v20);

}

- (CGRect)_computeClippedBoundsForProvider:(id)a3
{
  id v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v4 = a3;
  objc_msgSend(v4, "visibilityProviderVisibleBounds");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVisibilityCollector provider](self->_rootCollector, "provider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "visibilityProviderHostingLayer"));

  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibilityProviderHostingLayer"));
  v16 = (void *)v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (!v17 && v14 != (void *)v15)
  {
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    if (!CGRectIsEmpty(v49))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVisibilityCollector provider](self->_rootCollector, "provider"));
      objc_msgSend(v19, "visibilityProviderVisibleBounds");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      objc_msgSend(v14, "convertRect:toLayer:", v16, v21, v23, v25, v27);
      v59.origin.x = v28;
      v59.origin.y = v29;
      v59.size.width = v30;
      v59.size.height = v31;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v51 = CGRectIntersection(v50, v59);
      x = v51.origin.x;
      y = v51.origin.y;
      width = v51.size.width;
      height = v51.size.height;
    }
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    if (!CGRectIsEmpty(v52))
    {
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superlayer"));
      if (v32)
      {
        v33 = (void *)v32;
        do
        {
          if (objc_msgSend(v33, "masksToBounds"))
          {
            objc_msgSend(v33, "bounds");
            objc_msgSend(v33, "convertRect:toLayer:", v16);
            v60.origin.x = v34;
            v60.origin.y = v35;
            v60.size.width = v36;
            v60.size.height = v37;
            v53.origin.x = x;
            v53.origin.y = y;
            v53.size.width = width;
            v53.size.height = height;
            v54 = CGRectIntersection(v53, v60);
            x = v54.origin.x;
            y = v54.origin.y;
            width = v54.size.width;
            height = v54.size.height;
            if (CGRectIsEmpty(v54))
              break;
          }
          if (v33 == v14)
          {
            v33 = v14;
            break;
          }
          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "superlayer"));

          v33 = (void *)v38;
        }
        while (v38);

      }
    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVisibilityCollector provider](self->_rootCollector, "provider"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "visibilityProviderWindowLayer"));

  if (v40)
  {
    if (v16)
    {
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      if (!CGRectIsEmpty(v55))
      {
        objc_msgSend(v40, "bounds");
        objc_msgSend(v40, "convertRect:toLayer:", v16);
        v61.origin.x = v41;
        v61.origin.y = v42;
        v61.size.width = v43;
        v61.size.height = v44;
        v56.origin.x = x;
        v56.origin.y = y;
        v56.size.width = width;
        v56.size.height = height;
        v57 = CGRectIntersection(v56, v61);
        x = v57.origin.x;
        y = v57.origin.y;
        width = v57.size.width;
        height = v57.size.height;
      }
    }
  }

  v45 = x;
  v46 = y;
  v47 = width;
  v48 = height;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (id)newCollectorForProvider:(id)a3 withIdentifier:(id)a4 parentIdentifier:(id)a5
{
  id v8;
  id v9;
  TUIVisibilityCollector *v10;
  TUIVisibilityCollector *v11;
  TUIVisibilityCollector *v12;

  v8 = a3;
  v9 = a4;
  if (a5)
    v10 = (TUIVisibilityCollector *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_collectorsMap, "objectForKeyedSubscript:", a5));
  else
    v10 = self->_rootCollector;
  v11 = v10;
  v12 = -[TUIVisibilityCollector initWithController:provider:identifier:]([TUIVisibilityCollector alloc], "initWithController:provider:identifier:", self, v8, v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_collectorsMap, "setObject:forKeyedSubscript:", v12, v9);
  -[TUIVisibilityCollector _addChild:](v11, "_addChild:", v12);

  return v12;
}

- (void)removeCollector:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](self->_collectorsMap, "removeObjectForKey:", v4);

}

- (void)updateVisible
{
  double v3;

  v3 = sub_1C2AC();
  -[TUIVisibilityController updateVisibleAtTime:](self, "updateVisibleAtTime:", v3);
}

- (void)_appendVisibleBoundsUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _TUIVisibilityUpdate *v19;
  id v20;
  _TUIVisibilityUpdate *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  TUIVisibilityController *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
  -[TUIVisibilityController _computeClippedBoundsForProvider:](self, "_computeClippedBoundsForProvider:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = [_TUIVisibilityUpdate alloc];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1EAA8;
  v31[3] = &unk_23DC50;
  v20 = v8;
  v34 = v12;
  v35 = v14;
  v36 = v16;
  v37 = v18;
  v32 = v20;
  v33 = self;
  v21 = -[_TUIVisibilityUpdate initWithTime:flags:block:](v19, "initWithTime:flags:block:", 1, v31, a3);
  objc_msgSend(v9, "addObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "children"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[TUIVisibilityController _appendVisibleBoundsUpdatesAtTime:forCollector:toUpdates:](self, "_appendVisibleBoundsUpdatesAtTime:forCollector:toUpdates:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v26), v9, a3);
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v24);
  }

}

- (void)_appendVisibilityUpdatesAtTime:(double)a3 forCollector:(id)a4 toUpdates:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _TUIVisibilityUpdate *v19;
  id v20;
  _TUIVisibilityUpdate *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  TUIVisibilityController *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "provider"));
  -[TUIVisibilityController _computeClippedBoundsForProvider:](self, "_computeClippedBoundsForProvider:", v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  LOBYTE(v10) = objc_msgSend(v8, "_computeVisible");
  v19 = [_TUIVisibilityUpdate alloc];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1ECDC;
  v31[3] = &unk_23DC28;
  v20 = v8;
  v34 = v12;
  v35 = v14;
  v36 = v16;
  v37 = v18;
  v38 = (char)v10;
  v32 = v20;
  v33 = self;
  v21 = -[_TUIVisibilityUpdate initWithTime:flags:block:](v19, "initWithTime:flags:block:", 1, v31, a3);
  objc_msgSend(v9, "addObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "children"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[TUIVisibilityController _appendVisibilityUpdatesAtTime:forCollector:toUpdates:](self, "_appendVisibilityUpdatesAtTime:forCollector:toUpdates:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v26), v9, a3);
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v24);
  }

}

- (void)updateVisibleAtTime:(double)a3
{
  NSMutableArray *v5;

  v5 = objc_opt_new(NSMutableArray);
  -[TUIVisibilityController _appendVisibilityUpdatesAtTime:forCollector:toUpdates:](self, "_appendVisibilityUpdatesAtTime:forCollector:toUpdates:", self->_rootCollector, v5, a3);
  -[TUIVisibilityController _scheduleUpdates:](self, "_scheduleUpdates:", v5);

}

- (TUIVisibilityCollector)rootCollector
{
  return self->_rootCollector;
}

- (TUIVisibilityTracker)impressionTracker
{
  return self->_impressionTracker;
}

- (TUIVisibilityTracker)linkEntityTracker
{
  return self->_linkEntityTracker;
}

- (double)scrollingMaxUpdateInterval
{
  return self->_scrollingMaxUpdateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntityTracker, 0);
  objc_storeStrong((id *)&self->_impressionTracker, 0);
  objc_storeStrong((id *)&self->_rootCollector, 0);
  objc_storeStrong((id *)&self->_collectorsMap, 0);
  objc_storeStrong((id *)&self->_q_needsUpdate, 0);
  objc_storeStrong((id *)&self->_l_updates, 0);
  objc_storeStrong((id *)&self->_q_trackers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
