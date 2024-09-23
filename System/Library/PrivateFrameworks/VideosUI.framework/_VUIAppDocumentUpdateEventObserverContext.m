@implementation _VUIAppDocumentUpdateEventObserverContext

- (void)setEventDescriptors:(id)a3
{
  NSSet *v4;
  NSSet *eventDescriptors;
  void *v6;
  id v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (NSSet *)objc_msgSend(a3, "copy");
  eventDescriptors = self->_eventDescriptors;
  self->_eventDescriptors = v4;

  -[_VUIAppDocumentUpdateEventObserverContext refreshTimerByEventDescriptor](self, "refreshTimerByEventDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_eventDescriptors;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v6, "objectForKey:", v14, (_QWORD)v18);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(v6, "removeObjectForKey:", v14);
            goto LABEL_10;
          }
          -[_VUIAppDocumentUpdateEventObserverContext _refreshTimerWithRefreshTimeEventDescriptor:](self, "_refreshTimerWithRefreshTimeEventDescriptor:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_VUIAppDocumentUpdateEventObserverContext _startRefreshTimer:](self, "_startRefreshTimer:", v16);
          if (v16)
          {
LABEL_10:
            objc_msgSend(v7, "setObject:forKey:", v16, v14);

          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VUIAppDocumentUpdateEventObserverContext _cancelRefreshTimers:](self, "_cancelRefreshTimers:", v17);

  -[_VUIAppDocumentUpdateEventObserverContext setRefreshTimerByEventDescriptor:](self, "setRefreshTimerByEventDescriptor:", v7);
}

- (void)_startRefreshTimer:(id)a3
{
  if (a3)
    dispatch_resume((dispatch_object_t)a3);
}

- (id)_refreshTimerWithRefreshTimeEventDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "delayInSeconds");
  if (v5)
  {
    v6 = v5;
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __89___VUIAppDocumentUpdateEventObserverContext__refreshTimerWithRefreshTimeEventDescriptor___block_invoke;
    handler[3] = &unk_1E9F9A938;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    dispatch_source_set_event_handler(v7, handler);
    v8 = dispatch_time(0, 1000000000 * v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)refreshTimerByEventDescriptor
{
  return self->_refreshTimerByEventDescriptor;
}

- (void)setRefreshTimerByEventDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimerByEventDescriptor, a3);
}

- (void)_cancelRefreshTimers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_VUIAppDocumentUpdateEventObserverContext _cancelRefreshTimer:](self, "_cancelRefreshTimer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void)setRefreshTimerFiredBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)dealloc
{
  objc_super v3;

  -[_VUIAppDocumentUpdateEventObserverContext invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_VUIAppDocumentUpdateEventObserverContext;
  -[_VUIAppDocumentUpdateEventObserverContext dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[_VUIAppDocumentUpdateEventObserverContext setEventDescriptors:](self, "setEventDescriptors:", 0);
  -[_VUIAppDocumentUpdateEventObserverContext setRefreshTimerFiredBlock:](self, "setRefreshTimerFiredBlock:", 0);
  -[_VUIAppDocumentUpdateEventObserverContext _cancelAllRefreshTimers](self, "_cancelAllRefreshTimers");
}

- (void)updateDescriptorsWithDescriptors:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *eventDescriptors;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_VUIAppDocumentUpdateEventObserverContext eventDescriptors](self, "eventDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v4);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  eventDescriptors = self->_eventDescriptors;
  self->_eventDescriptors = v6;

  -[_VUIAppDocumentUpdateEventObserverContext refreshTimerByEventDescriptor](self, "refreshTimerByEventDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          objc_msgSend(v9, "objectForKey:", v16, (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v9, "removeObjectForKey:", v16);
            -[_VUIAppDocumentUpdateEventObserverContext _cancelRefreshTimer:](self, "_cancelRefreshTimer:", v17);
          }
          -[_VUIAppDocumentUpdateEventObserverContext _refreshTimerWithRefreshTimeEventDescriptor:](self, "_refreshTimerWithRefreshTimeEventDescriptor:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[_VUIAppDocumentUpdateEventObserverContext _startRefreshTimer:](self, "_startRefreshTimer:", v18);
            objc_msgSend(v9, "setObject:forKey:", v18, v16);
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[_VUIAppDocumentUpdateEventObserverContext setRefreshTimerByEventDescriptor:](self, "setRefreshTimerByEventDescriptor:", v9);
}

- (void)_cancelRefreshTimer:(id)a3
{
  if (a3)
    dispatch_source_cancel((dispatch_source_t)a3);
}

- (void)_cancelAllRefreshTimers
{
  void *v3;
  id v4;

  -[_VUIAppDocumentUpdateEventObserverContext refreshTimerByEventDescriptor](self, "refreshTimerByEventDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[_VUIAppDocumentUpdateEventObserverContext setRefreshTimerByEventDescriptor:](self, "setRefreshTimerByEventDescriptor:", 0);
  -[_VUIAppDocumentUpdateEventObserverContext _cancelRefreshTimers:](self, "_cancelRefreshTimers:", v4);

}

- (NSSet)eventDescriptors
{
  return self->_eventDescriptors;
}

- (id)refreshTimerFiredBlock
{
  return self->_refreshTimerFiredBlock;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_refreshTimerFiredBlock, 0);
  objc_storeStrong((id *)&self->_refreshTimerByEventDescriptor, 0);
  objc_storeStrong((id *)&self->_eventDescriptors, 0);
}

@end
