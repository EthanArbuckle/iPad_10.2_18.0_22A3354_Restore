@implementation PXUserInterfaceElementEventTracker

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    -[PXUserInterfaceElementEventTracker signalChange:](self, "signalChange:", 1);
  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

uint64_t __66__PXUserInterfaceElementEventTracker__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAppActive:", 1);
}

uint64_t __47__PXUserInterfaceElementEventTracker_didAppear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasAppeared:", 1);
}

- (void)setIsAppActive:(BOOL)a3
{
  if (self->_isAppActive != a3)
  {
    self->_isAppActive = a3;
    -[PXUserInterfaceElementEventTracker signalChange:](self, "signalChange:", 4);
    -[PXUserInterfaceElementEventTracker _invalidateIsVisible](self, "_invalidateIsVisible");
  }
}

- (void)setHasAppeared:(BOOL)a3
{
  if (self->_hasAppeared != a3)
  {
    self->_hasAppeared = a3;
    -[PXUserInterfaceElementEventTracker signalChange:](self, "signalChange:", 2);
    -[PXUserInterfaceElementEventTracker _invalidateIsVisible](self, "_invalidateIsVisible");
  }
}

- (PXUserInterfaceElementEventTracker)init
{
  PXUserInterfaceElementEventTracker *v2;
  uint64_t v3;
  PXUpdater *updater;
  BOOL v5;
  id *v6;
  id *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  PXUserInterfaceElementEventTracker *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PXUserInterfaceElementEventTracker;
  v2 = -[PXUserInterfaceElementEventTracker init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v2, sel__setNeedsUpdate);
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v3;

    -[PXUpdater addUpdateSelector:](v2->_updater, "addUpdateSelector:", sel__updateIsVisible);
    if ((_UIApplicationIsExtension() & 1) != 0)
    {
      v5 = 1;
      v6 = (id *)MEMORY[0x1E0CB29E8];
      v7 = (id *)MEMORY[0x1E0CB2A00];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "applicationState") == 0;

      v6 = (id *)MEMORY[0x1E0DC4750];
      v7 = (id *)MEMORY[0x1E0DC4868];
    }
    v9 = *v7;
    v10 = *v6;
    v11 = v10;
    v2->_isAppActive = v5;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      PXAssertGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v2;
        _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "%@ failed to start tracking app state", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v13, "addObserver:selector:name:object:", v2, sel__applicationWillResignActive_, v9, 0);
      -[NSObject addObserver:selector:name:object:](v13, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActive_, v11, 0);
    }

  }
  return v2;
}

- (void)_invalidateIsVisible
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsVisible);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUserInterfaceElementEventTracker;
  -[PXUserInterfaceElementEventTracker didPerformChanges](&v4, sel_didPerformChanges);
  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_setNeedsUpdate
{
  -[PXUserInterfaceElementEventTracker signalChange:](self, "signalChange:", 0);
}

- (void)_updateIsVisible
{
  _BOOL8 v3;

  if (-[PXUserInterfaceElementEventTracker isAppActive](self, "isAppActive"))
    v3 = -[PXUserInterfaceElementEventTracker hasAppeared](self, "hasAppeared");
  else
    v3 = 0;
  -[PXUserInterfaceElementEventTracker setIsVisible:](self, "setIsVisible:", v3);
}

- (BOOL)isAppActive
{
  return self->_isAppActive;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (id)finalPayloadWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *payload;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_payload, "count"))
  {
    v5 = objc_msgSend(v4, "count");
    payload = self->_payload;
    if (!v5)
    {
      v11 = (void *)-[NSMutableDictionary copy](payload, "copy");
      goto LABEL_9;
    }
    v7 = (void *)-[NSMutableDictionary mutableCopy](payload, "mutableCopy");
    objc_msgSend(v7, "addEntriesFromDictionary:", v4);
    v8 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v9 = objc_msgSend(v4, "copy");
    v7 = (void *)v9;
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v9)
      v10 = (void *)v9;
    v8 = v10;
  }
  v11 = v8;

LABEL_9:
  return v11;
}

- (double)currentTimestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)didAppear
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__PXUserInterfaceElementEventTracker_didAppear__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXUserInterfaceElementEventTracker performChanges:](self, "performChanges:", v2);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PXUserInterfaceElementEventTracker__applicationDidBecomeActive___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXUserInterfaceElementEventTracker performChanges:](self, "performChanges:", v3);
}

- (void)didDisappear
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PXUserInterfaceElementEventTracker_didDisappear__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXUserInterfaceElementEventTracker performChanges:](self, "performChanges:", v2);
}

- (NSMutableDictionary)payload
{
  NSMutableDictionary *payload;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  payload = self->_payload;
  if (!payload)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_payload;
    self->_payload = v4;

    payload = self->_payload;
  }
  return payload;
}

- (double)timeIntervalSinceTimestamp:(double)a3
{
  double v5;
  double result;

  -[PXUserInterfaceElementEventTracker currentTimestamp](self, "currentTimestamp");
  -[PXUserInterfaceElementEventTracker timeIntervalBetweenTimestamp:andTimestamp:](self, "timeIntervalBetweenTimestamp:andTimestamp:", a3, v5);
  return result;
}

- (double)timeIntervalBetweenTimestamp:(double)a3 andTimestamp:(double)a4
{
  return a4 - a3;
}

- (void)_applicationWillResignActive:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PXUserInterfaceElementEventTracker__applicationWillResignActive___block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXUserInterfaceElementEventTracker performChanges:](self, "performChanges:", v3);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

uint64_t __67__PXUserInterfaceElementEventTracker__applicationWillResignActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAppActive:", 0);
}

uint64_t __50__PXUserInterfaceElementEventTracker_didDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasAppeared:", 0);
}

@end
