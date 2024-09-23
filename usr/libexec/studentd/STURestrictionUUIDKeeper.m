@implementation STURestrictionUUIDKeeper

- (void)dealloc
{
  objc_super v3;

  -[STURestrictionUUIDKeeper stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)STURestrictionUUIDKeeper;
  -[STURestrictionUUIDKeeper dealloc](&v3, "dealloc");
}

- (STURestrictionUUIDKeeper)initWithExclusiveOperationManager:(id)a3
{
  id v5;
  STURestrictionUUIDKeeper *v6;
  STURestrictionUUIDKeeper *v7;
  NSSet *v8;
  NSSet *activeRestrictionUUIDs;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STURestrictionUUIDKeeper;
  v6 = -[STURestrictionUUIDKeeper init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_exclusiveOperationManager, a3);
    v8 = objc_opt_new(NSSet);
    activeRestrictionUUIDs = v7->_activeRestrictionUUIDs;
    v7->_activeRestrictionUUIDs = v8;

    -[STURestrictionUUIDKeeper startObserving](v7, "startObserving");
  }

  return v7;
}

- (void)startObserving
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STURestrictionUUIDKeeper exclusiveOperationManager](self, "exclusiveOperationManager"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("exclusiveOperations"), 4, CFSTR("STURestrictionUUIDKeeperObservationContext"));

}

- (void)stopObserving
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STURestrictionUUIDKeeper exclusiveOperationManager](self, "exclusiveOperationManager"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("exclusiveOperations"), CFSTR("STURestrictionUUIDKeeperObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("STURestrictionUUIDKeeperObservationContext"))
  {
    -[STURestrictionUUIDKeeper updateUUIDs](self, "updateUUIDs", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STURestrictionUUIDKeeper;
    -[STURestrictionUUIDKeeper observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)updateUUIDs
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[STURestrictionUUIDKeeper makeUUIDs](self, "makeUUIDs"));
  -[STURestrictionUUIDKeeper setActiveRestrictionUUIDs:](self, "setActiveRestrictionUUIDs:", v3);

}

- (id)makeUUIDs
{
  NSSet *v2;

  if (-[STURestrictionUUIDKeeper isAppLockOperationCurrentlyRunning](self, "isAppLockOperationCurrentlyRunning"))
    v2 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CRKRestrictionClientAppLockIdentifier));
  else
    v2 = objc_opt_new(NSSet);
  return v2;
}

- (BOOL)isAppLockOperationCurrentlyRunning
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STURestrictionUUIDKeeper exclusiveOperationManager](self, "exclusiveOperationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "exclusiveOperations"));

  LOBYTE(v2) = objc_msgSend(v3, "crk_containsObjectMatchingPredicate:", &stru_1000C9900);
  return (char)v2;
}

- (NSSet)activeRestrictionUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActiveRestrictionUUIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (STUExclusiveOperationManager)exclusiveOperationManager
{
  return self->_exclusiveOperationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusiveOperationManager, 0);
  objc_storeStrong((id *)&self->_activeRestrictionUUIDs, 0);
}

@end
