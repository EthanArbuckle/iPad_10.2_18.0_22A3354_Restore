@implementation REActivityTracker

- (BOOL)trackingObject:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)endActivity:(id)a3 forObject:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((-[NSCountedSet containsObject:](self->_activities, "containsObject:", v29) & 1) != 0)
    {
      if ((objc_msgSend(v13, "containsObject:", v29) & 1) != 0)
      {
        -[NSCountedSet removeObject:](self->_activities, "removeObject:", v29);
        v26 = -[NSCountedSet containsObject:](self->_activities, "containsObject:", v29);
        objc_msgSend(v13, "removeObject:", v29);
        if ((objc_msgSend(v13, "containsObject:", v29) & 1) == 0 && (*(_BYTE *)&self->delegateCallbacks & 8) != 0)
        {
          -[REActivityTracker delegate](self, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "activityTracker:didEndActivity:forObject:", self, v29, v6);

        }
        if ((v26 & 1) == 0 && (*(_BYTE *)&self->delegateCallbacks & 2) != 0)
        {
          -[REActivityTracker delegate](self, "delegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "activityTracker:didEndActivity:", self, v29);

        }
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is not being tracked for activity %@ by activity tracker %@"), v20, v21, v22, v23, v24, v25, (uint64_t)v6);
      }
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Activity %@ is not being tracked by activity tracker %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v29);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is not being tracked by activity tracker %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }

}

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[NSCountedSet containsObject:](self->_activities, "containsObject:", v18);
    -[NSCountedSet addObject:](self->_activities, "addObject:", v18);
    v15 = objc_msgSend(v13, "containsObject:", v18);
    objc_msgSend(v13, "addObject:", v18);
    if ((v14 & 1) == 0 && (*(_BYTE *)&self->delegateCallbacks & 1) != 0)
    {
      -[REActivityTracker delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activityTracker:didBeginActivity:", self, v18);

    }
    if ((v15 & 1) == 0 && (*(_BYTE *)&self->delegateCallbacks & 4) != 0)
    {
      -[REActivityTracker delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activityTracker:didBeginActivity:forObject:", self, v18, v6);

    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is not being tracked by activity tracker %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }

}

- (REActivityTrackerDelegate)delegate
{
  return (REActivityTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (REActivityTracker)initWithDelegate:(id)a3
{
  id v4;
  REActivityTracker *v5;
  REActivityTracker *v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  NSCountedSet *activities;
  uint64_t v12;
  NSMapTable *activitiesByObject;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REActivityTracker;
  v5 = -[REActivityTracker init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    *(_BYTE *)&v6->delegateCallbacks = *(_BYTE *)&v6->delegateCallbacks & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&v6->delegateCallbacks = *(_BYTE *)&v6->delegateCallbacks & 0xFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *(_BYTE *)&v6->delegateCallbacks = *(_BYTE *)&v6->delegateCallbacks & 0xFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *(_BYTE *)&v6->delegateCallbacks = *(_BYTE *)&v6->delegateCallbacks & 0xF7 | v9;
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activities = v6->_activities;
    v6->_activities = (NSCountedSet *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 16);
    activitiesByObject = v6->_activitiesByObject;
    v6->_activitiesByObject = (NSMapTable *)v12;

  }
  return v6;
}

- (void)trackObject:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMapTable *activitiesByObject;
  void *v12;
  id v13;

  v13 = a3;
  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is already being tracked by activity tracker %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v13);
  }
  else
  {
    activitiesByObject = self->_activitiesByObject;
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](activitiesByObject, "setObject:forKey:", v12, v13);

  }
}

- (void)withdrawObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is still being tracked by activity tracker %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v4);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v19 = v12;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v28 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            v25 = objc_msgSend(v19, "countForObject:", v24);
            if (v25)
            {
              v26 = v25;
              do
              {
                -[REActivityTracker endActivity:forObject:](self, "endActivity:forObject:", v24, v4);
                --v26;
              }
              while (v26);
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v21);
      }

    }
    -[NSMapTable removeObjectForKey:](self->_activitiesByObject, "removeObjectForKey:", v4);

  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is not being tracked by activity tracker %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }

}

- (NSSet)outstandingActivities
{
  return (NSSet *)(id)-[NSCountedSet copy](self->_activities, "copy");
}

- (id)outstandingActivitiesForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  if (v5)
  {
    v13 = objc_msgSend(v5, "copy");
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Object %@ is not being tracked by activity tracker %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitiesByObject, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
