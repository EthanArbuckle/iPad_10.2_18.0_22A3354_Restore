@implementation PPNotificationHandlerGuardedData

- (PPNotificationHandlerGuardedData)init
{
  PPNotificationHandlerGuardedData *v2;
  PPNotificationHandlerGuardedData *v3;
  uint64_t v4;
  NSMutableSet *objects;
  uint64_t v6;
  NSMapTable *blockMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPNotificationHandlerGuardedData;
  v2 = -[PPNotificationHandlerGuardedData init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_delayedFiringInProgress = 0;
    v2->_lastFiringTimeSince1970 = 0.0;
    v4 = objc_opt_new();
    objects = v3->_objects;
    v3->_objects = (NSMutableSet *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    blockMap = v3->_blockMap;
    v3->_blockMap = (NSMapTable *)v6;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_blockMap, 0);
}

@end
