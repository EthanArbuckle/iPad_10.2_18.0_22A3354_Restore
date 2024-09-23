@implementation PLJournalEntryPayloadUpdateAdapter

- (PLJournalEntryPayloadUpdateAdapter)initWithManagedObject:(id)a3
{
  id v5;
  PLJournalEntryPayloadUpdateAdapter *v6;
  PLJournalEntryPayloadUpdateAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLJournalEntryPayloadUpdateAdapter;
  v6 = -[PLJournalEntryPayloadUpdateAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_managedObject, a3);

  return v7;
}

- (id)managedObject
{
  return self->_managedObject;
}

- (id)sourceObject
{
  return self->_managedObject;
}

- (BOOL)isValidForJournalPersistence
{
  return 1;
}

- (id)payloadID
{
  return 0;
}

- (id)payloadForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadIDForTombstone:(id)a3
{
  return 0;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  return 0;
}

- (id)payloadsForChangedKeys:(id)a3
{
  return 0;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObject, 0);
}

@end
