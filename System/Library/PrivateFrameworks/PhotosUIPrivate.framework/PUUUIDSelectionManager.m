@implementation PUUUIDSelectionManager

- (void)pu_registerSelectionIndicatorObserver:(id)a3
{
  -[PUUUIDSelectionManager registerChangeObserver:context:](self, "registerChangeObserver:context:", a3, AssetExplorerSelectionManagerObservationContext);
}

- (void)pu_unregisterSelectionIndicatorObserver:(id)a3
{
  -[PUUUIDSelectionManager unregisterChangeObserver:context:](self, "unregisterChangeObserver:context:", a3, AssetExplorerSelectionManagerObservationContext);
}

- (BOOL)pu_isAssetReferenceSelected:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PUUUIDSelectionManager isSelectedUUID:](self, "isSelectedUUID:", v5);
  return (char)self;
}

- (PUUUIDSelectionManager)initWithSelectedUUIDs:(id)a3
{
  id v4;
  PUUUIDSelectionManager *v5;
  uint64_t v6;
  NSMutableSet *mutableSelectedUUIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUUUIDSelectionManager;
  v5 = -[PUUUIDSelectionManager init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    mutableSelectedUUIDs = v5->__mutableSelectedUUIDs;
    v5->__mutableSelectedUUIDs = (NSMutableSet *)v6;

  }
  return v5;
}

- (PUUUIDSelectionManager)init
{
  return -[PUUUIDSelectionManager initWithSelectedUUIDs:](self, "initWithSelectedUUIDs:", 0);
}

- (BOOL)isSelectedUUID:(id)a3
{
  if (a3)
    return -[NSMutableSet containsObject:](self->__mutableSelectedUUIDs, "containsObject:");
  else
    return 0;
}

- (void)addSelectedUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[PUUUIDSelectionManager isSelectedUUID:](self, "isSelectedUUID:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSMutableSet addObject:](self->__mutableSelectedUUIDs, "addObject:", v6);
      -[PUUUIDSelectionManager signalChange:](self, "signalChange:", 1);
      v4 = v6;
    }
  }

}

- (void)removeSelectedUUID:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[PUUUIDSelectionManager isSelectedUUID:](self, "isSelectedUUID:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSMutableSet removeObject:](self->__mutableSelectedUUIDs, "removeObject:", v6);
      -[PUUUIDSelectionManager signalChange:](self, "signalChange:", 1);
      v4 = v6;
    }
  }

}

- (NSSet)selectedUUIDs
{
  return (NSSet *)(id)-[NSMutableSet copy](self->__mutableSelectedUUIDs, "copy");
}

- (void)setSelectedUUIDs:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet isEqualToSet:](self->__mutableSelectedUUIDs, "isEqualToSet:") & 1) == 0)
  {
    -[NSMutableSet setSet:](self->__mutableSelectedUUIDs, "setSet:", v4);
    -[PUUUIDSelectionManager signalChange:](self, "signalChange:", 1);
  }

}

- (void)deselectAllUUIDs
{
  if (-[NSMutableSet count](self->__mutableSelectedUUIDs, "count"))
  {
    -[NSMutableSet removeAllObjects](self->__mutableSelectedUUIDs, "removeAllObjects");
    -[PUUUIDSelectionManager signalChange:](self, "signalChange:", 1);
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUUUIDSelectionManager;
  -[PUUUIDSelectionManager performChanges:](&v3, sel_performChanges_, a3);
}

- (NSMutableSet)_mutableSelectedUUIDs
{
  return self->__mutableSelectedUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableSelectedUUIDs, 0);
}

@end
