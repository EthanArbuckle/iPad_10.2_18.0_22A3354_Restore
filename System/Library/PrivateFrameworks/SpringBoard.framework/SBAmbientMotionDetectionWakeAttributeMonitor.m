@implementation SBAmbientMotionDetectionWakeAttributeMonitor

+ (SBAmbientMotionDetectionWakeAttributeMonitor)sharedInstance
{
  if (sharedInstance_onceToken_58 != -1)
    dispatch_once(&sharedInstance_onceToken_58, &__block_literal_global_400);
  return (SBAmbientMotionDetectionWakeAttributeMonitor *)(id)sharedInstance_sharedInstance_8;
}

void __62__SBAmbientMotionDetectionWakeAttributeMonitor_sharedInstance__block_invoke()
{
  SBAmbientMotionDetectionWakeAttributeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SBAmbientMotionDetectionWakeAttributeMonitor);
  v1 = (void *)sharedInstance_sharedInstance_8;
  sharedInstance_sharedInstance_8 = (uint64_t)v0;

}

- (SBAmbientMotionDetectionWakeAttributeMonitor)init
{
  SBAmbientMotionDetectionWakeAttributeMonitor *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAmbientMotionDetectionWakeAttributeMonitor;
  v2 = -[SBAmbientMotionDetectionWakeAttributeMonitor init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "blshService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localAssertionService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:](SBEnableMotionDetectionWakeAttributeHandler, "registerHandlerForService:", v4);
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_setShouldEnableMotionDetectionWake:(BOOL)a3
{
  void *v4;
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
  if (self->_shouldEnableMotionDetectionWake != a3)
  {
    self->_shouldEnableMotionDetectionWake = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "motionDetectionWakeAttributeMonitor:didUpdateShouldEnableMotionDetectionWake:", self, self->_shouldEnableMotionDetectionWake);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)shouldEnableMotionDetectionWake
{
  return self->_shouldEnableMotionDetectionWake;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
