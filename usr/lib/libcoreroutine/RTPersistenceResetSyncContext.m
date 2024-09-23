@implementation RTPersistenceResetSyncContext

- (NSManagedObjectID)currentDeviceObjectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentDeviceObjectID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSUUID)currentDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSPersistentHistoryToken)historyToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHistoryToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_currentDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceObjectID, 0);
}

@end
