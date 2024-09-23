@implementation SBFMotionGestureController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBFMotionGestureController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_sbf_once_token_0 != -1)
    dispatch_once(&sharedInstance_sbf_once_token_0, block);
  return (id)sharedInstance_sbf_once_object_0;
}

void __44__SBFMotionGestureController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sbf_once_object_0;
  sharedInstance_sbf_once_object_0 = (uint64_t)v0;

}

- (SBFMotionGestureController)init
{
  SBFMotionGestureController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *observersByPriority;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFMotionGestureController;
  v2 = -[SBFMotionGestureController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByPriority = v2->_observersByPriority;
    v2->_observersByPriority = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFMotionGestureController _removeGestureManager](self, "_removeGestureManager");
  v3.receiver = self;
  v3.super_class = (Class)SBFMotionGestureController;
  -[SBFMotionGestureController dealloc](&v3, sel_dealloc);
}

- (void)addGestureObserver:(id)a3
{
  -[SBFMotionGestureController addGestureObserver:withPriority:](self, "addGestureObserver:withPriority:", a3, 0);
}

- (void)addGestureObserver:(id)a3 withPriority:(unint64_t)a4
{
  -[SBFMotionGestureController _addGestureObserver:withPriority:](self, "_addGestureObserver:withPriority:", a3, a4);
  -[SBFMotionGestureController _updateGestureManager](self, "_updateGestureManager");
}

- (void)removeGestureObserver:(id)a3
{
  -[SBFMotionGestureController _removeGestureObserver:](self, "_removeGestureObserver:", a3);
  -[SBFMotionGestureController _updateGestureManager](self, "_updateGestureManager");
}

- (void)_addGestureObserver:(id)a3 withPriority:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  if (v6)
  {
    -[SBFMotionGestureController _removeGestureObserver:](self, "_removeGestureObserver:", v6);
    -[SBFMotionGestureController _observersForPriority:](self, "_observersForPriority:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
    {
      SBLogMotionGesture();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SBFMotionGestureController _addGestureObserver:withPriority:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

      objc_msgSend(v7, "addObject:", v6);
    }

  }
}

- (void)_removeGestureObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__SBFMotionGestureController__removeGestureObserver___block_invoke;
    v6[3] = &unk_1E200EDF0;
    v7 = v4;
    -[SBFMotionGestureController _enumerateObserversByPriority:](self, "_enumerateObserversByPriority:", v6);

  }
}

void __53__SBFMotionGestureController__removeGestureObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(v3, "containsObject:", v5))
  {
    SBLogMotionGesture();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __53__SBFMotionGestureController__removeGestureObserver___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(v3, "removeObject:", *v4);
  }

}

- (void)_notifyObserversOfGesture:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBFMotionGestureController _highestPriorityObservers](self, "_highestPriorityObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!a3)
        {
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
          SBLogMotionGesture();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v9;
            _os_log_debug_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEBUG, "Notifying observer: %@ of raise gesture", buf, 0xCu);
          }

          objc_msgSend(v9, "didReceiveRaiseGesture");
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)_hasObservers
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SBFMotionGestureController__hasObservers__block_invoke;
  v4[3] = &unk_1E200EE18;
  v4[4] = &v5;
  -[SBFMotionGestureController _enumerateObserversByPriority:](self, "_enumerateObserversByPriority:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__SBFMotionGestureController__hasObservers__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_enumerateObserversByPriority:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v6 = (id)-[NSMutableDictionary copy](self->_observersByPriority, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBFMotionGestureController__enumerateObserversByPriority___block_invoke;
  v7[3] = &unk_1E200EE40;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __60__SBFMotionGestureController__enumerateObserversByPriority___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, objc_msgSend(a2, "integerValue"), a4);

}

- (id)_highestPriorityObservers
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[4];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SBFMotionGestureController__highestPriorityObservers__block_invoke;
  v4[3] = &unk_1E200EE68;
  v4[4] = v11;
  v4[5] = &v5;
  -[SBFMotionGestureController _enumerateObserversByPriority:](self, "_enumerateObserversByPriority:", v4);
  v2 = (void *)objc_msgSend((id)v6[5], "copy");
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v2;
}

void __55__SBFMotionGestureController__highestPriorityObservers__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "count") && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }

}

- (id)_observersForPriority:(unint64_t)a3
{
  NSMutableDictionary *observersByPriority;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  observersByPriority = self->_observersByPriority;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](observersByPriority, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_observersByPriority;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  return v7;
}

- (void)_updateGestureManager
{
  if (-[SBFMotionGestureController _hasObservers](self, "_hasObservers") && !self->_motionGestureManager)
  {
    -[SBFMotionGestureController _addGestureManager](self, "_addGestureManager");
  }
  else if (!-[SBFMotionGestureController _hasObservers](self, "_hasObservers"))
  {
    if (self->_motionGestureManager)
      -[SBFMotionGestureController _removeGestureManager](self, "_removeGestureManager");
  }
}

- (void)_addGestureManager
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a1, a3, "Adding motion gesture manager with priority %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke(uint64_t a1, int a2)
{
  id v2;
  int v3;

  v3 = a2;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v2);
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;

  SBLogMotionGesture();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__SBFMotionGestureController__addGestureManager__block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyObserversOfGesture:", *(unsigned int *)(a1 + 40));

}

- (void)_removeGestureManager
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18AB69000, log, OS_LOG_TYPE_DEBUG, "Removing motion gesture manager", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionGestureManager, 0);
  objc_storeStrong((id *)&self->_observersByPriority, 0);
}

- (void)_addGestureObserver:(uint64_t)a3 withPriority:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "Adding motion gesture observer %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __53__SBFMotionGestureController__removeGestureObserver___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "Removing motion gesture observer %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __48__SBFMotionGestureController__addGestureManager__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "Received gesture type %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
