@implementation TUIResourceLoaderTaskTracker

- (TUIResourceLoaderTaskTracker)init
{
  TUIResourceLoaderTaskTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *controllerPriorities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIResourceLoaderTaskTracker;
  v2 = -[TUIResourceLoaderTaskTracker init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    controllerPriorities = v2->_controllerPriorities;
    v2->_controllerPriorities = v3;

  }
  return v2;
}

- (void)_updateTaskWithHighestRequestedPriority
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  float v7;
  void *i;
  void *v9;
  float v10;
  float v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_controllerPriorities, "allValues", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "floatValue");
        if (v10 > v7)
        {
          objc_msgSend(v9, "floatValue");
          v7 = v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[TUIResourceLoaderTask setPriority:](self->_resourceLoaderTask, "setPriority:", v7);
}

- (void)updatePriorty:(float)a3 forController:(id)a4
{
  NSMutableDictionary *controllerPriorities;
  id v7;
  double v8;
  void *v9;

  controllerPriorities = self->_controllerPriorities;
  v7 = a4;
  *(float *)&v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  -[NSMutableDictionary setObject:forKey:](controllerPriorities, "setObject:forKey:", v9, v7);

  -[TUIResourceLoaderTaskTracker _updateTaskWithHighestRequestedPriority](self, "_updateTaskWithHighestRequestedPriority");
}

- (BOOL)stopTrackingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_controllerPriorities, "objectForKey:", v4));

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_controllerPriorities, "removeObjectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_controllerPriorities, "allKeys"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      -[TUIResourceLoaderTask cancel](self->_resourceLoaderTask, "cancel");
      v8 = 1;
      goto LABEL_6;
    }
    -[TUIResourceLoaderTaskTracker _updateTaskWithHighestRequestedPriority](self, "_updateTaskWithHighestRequestedPriority");
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (NSArray)controllers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_controllerPriorities, "allKeys");
}

- (TUIResourceLoaderTask)resourceLoaderTask
{
  return self->_resourceLoaderTask;
}

- (void)setResourceLoaderTask:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoaderTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoaderTask, 0);
  objc_storeStrong((id *)&self->_controllerPriorities, 0);
}

@end
