@implementation PLCloudFeedEntriesChangeNotification

+ (id)notificationWithFullReload
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFullReload");
}

+ (id)notificationWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInsertedEntries:updatedEntries:deletedEntries:", v10, v9, v8);

  return v11;
}

- (id)_initWithFullReload
{
  if (self)
    -[PLCloudFeedEntriesChangeNotification setShouldReload:](self, "setShouldReload:", 1);
  return self;
}

- (id)_initWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5
{
  id v8;
  id v9;

  if (self)
  {
    v8 = a5;
    v9 = a4;
    -[PLCloudFeedEntriesChangeNotification setInsertedEntries:](self, "setInsertedEntries:", a3);
    -[PLCloudFeedEntriesChangeNotification setUpdatedEntries:](self, "setUpdatedEntries:", v9);

    -[PLCloudFeedEntriesChangeNotification setDeletedEntries:](self, "setDeletedEntries:", v8);
  }
  return self;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLCloudFeedEntriesDidChangeNotification");
  return CFSTR("PLCloudFeedEntriesDidChangeNotification");
}

- (id)object
{
  return 0;
}

- (id)userInfo
{
  return 0;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (NSSet)insertedEntries
{
  return self->_insertedEntries;
}

- (void)setInsertedEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)updatedEntries
{
  return self->_updatedEntries;
}

- (void)setUpdatedEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)deletedEntries
{
  return self->_deletedEntries;
}

- (void)setDeletedEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedEntries, 0);
  objc_storeStrong((id *)&self->_updatedEntries, 0);
  objc_storeStrong((id *)&self->_insertedEntries, 0);
}

@end
