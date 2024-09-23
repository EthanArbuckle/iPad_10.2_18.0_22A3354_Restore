@implementation AuxiliaryTasksManager

- (VehicleDisambiguationTask)vehicleDisambiguationTask
{
  return (VehicleDisambiguationTask *)-[AuxiliaryTasksManager auxilaryTaskForClass:](self, "auxilaryTaskForClass:", objc_opt_class(VehicleDisambiguationTask));
}

- (RoutePlanningSessionRouteLoadedNotifier)routePlanningSessionRouteLoadedNotifier
{
  return (RoutePlanningSessionRouteLoadedNotifier *)-[AuxiliaryTasksManager auxilaryTaskForClass:](self, "auxilaryTaskForClass:", objc_opt_class(RoutePlanningSessionRouteLoadedNotifier));
}

- (AuxiliaryTasksManager)initWithPlatformController:(id)a3
{
  id v4;
  AuxiliaryTasksManager *v5;
  AuxiliaryTasksManager *v6;
  uint64_t v7;
  NSMutableArray *auxiliaryTasks;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AuxiliaryTasksManager;
  v5 = -[AuxiliaryTasksManager init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    auxiliaryTasks = v6->_auxiliaryTasks;
    v6->_auxiliaryTasks = (NSMutableArray *)v7;

  }
  return v6;
}

- (NSArray)tasks
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks"));
  v5 = objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return (NSArray *)v5;
}

- (void)addTasks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks"));
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  objc_sync_exit(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager platformController](self, "platformController", (_QWORD)v14));
        objc_msgSend(v12, "addObserver:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "postNotificationName:object:", off_1014BC228, self);

}

- (id)auxilaryTaskForClass:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks"));
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AuxiliaryTasksManager auxiliaryTasks](self, "auxiliaryTasks", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  objc_sync_exit(v5);
  return v11;
}

- (NSMutableArray)auxiliaryTasks
{
  return self->_auxiliaryTasks;
}

- (void)setAuxiliaryTasks:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryTasks, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_auxiliaryTasks, 0);
}

@end
