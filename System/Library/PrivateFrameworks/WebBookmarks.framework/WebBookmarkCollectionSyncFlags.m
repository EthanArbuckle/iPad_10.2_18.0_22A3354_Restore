@implementation WebBookmarkCollectionSyncFlags

- (void)setUnlockSyncRequested:(BOOL)a3
{
  self->_unlockSyncRequested = a3;
}

- (void)setSyncLockFileDescriptor:(int)a3
{
  self->_syncLockFileDescriptor = a3;
}

- (BOOL)postSyncNotificationWhenUnlocking
{
  return self->_postSyncNotificationWhenUnlocking;
}

- (NSMutableSet)lockSyncHoldRequestorPointers
{
  return self->_lockSyncHoldRequestorPointers;
}

- (int)syncLockFileDescriptor
{
  return self->_syncLockFileDescriptor;
}

- (WebBookmarkCollectionSyncFlags)initWithSyncAllowed:(BOOL)a3
{
  WebBookmarkCollectionSyncFlags *v4;
  WebBookmarkCollectionSyncFlags *v5;
  uint64_t v6;
  NSMutableSet *lockSyncHoldRequestorPointers;
  WebBookmarkCollectionSyncFlags *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebBookmarkCollectionSyncFlags;
  v4 = -[WebBookmarkCollectionSyncFlags init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_syncAllowed = a3;
    v4->_syncLockFileDescriptor = -1;
    v4->_postSyncNotificationWhenUnlocking = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    lockSyncHoldRequestorPointers = v5->_lockSyncHoldRequestorPointers;
    v5->_lockSyncHoldRequestorPointers = (NSMutableSet *)v6;

    v5->_syncNotificationType = 0;
    v8 = v5;
  }

  return v5;
}

- (void)setSyncNotificationType:(int64_t)a3
{
  self->_syncNotificationType = a3;
}

- (BOOL)syncAllowed
{
  return self->_syncAllowed;
}

- (int64_t)syncNotificationType
{
  return self->_syncNotificationType;
}

- (void)setPostSyncNotificationWhenUnlocking:(BOOL)a3
{
  self->_postSyncNotificationWhenUnlocking = a3;
}

- (BOOL)unlockSyncRequested
{
  return self->_unlockSyncRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockSyncHoldRequestorPointers, 0);
}

@end
