@implementation PPEventStorageGuardedData

- (PPEventStorageGuardedData)init
{
  PPEventStorageGuardedData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPEventStorageGuardedData;
  result = -[PPEventStorageGuardedData init](&v3, sel_init);
  if (result)
    result->_activeNoPurgeSessions = 0;
  return result;
}

- (id)ekStore
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1C3BD6630](self, a2);
  -[EKTimedEventStorePurger acquireCachedEventStoreOrCreate:](self->_ekStorePurger, "acquireCachedEventStoreOrCreate:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarObjectIDs, 0);
  objc_storeStrong((id *)&self->_invisibleCalendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_ekStorePurger, 0);
}

@end
