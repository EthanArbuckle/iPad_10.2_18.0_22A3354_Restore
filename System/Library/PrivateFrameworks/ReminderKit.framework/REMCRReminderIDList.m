@implementation REMCRReminderIDList

- (REMCRReminderIDList)init
{
  CRTTCompatibleDocument *v3;
  void *v4;
  CRTTCompatibleDocument *v5;
  CRTombstoneOrderedSet *v6;
  id v7;
  REMCRReminderIDList *v8;

  v3 = [CRTTCompatibleDocument alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRDocument initWithReplica:](v3, "initWithReplica:", v4);

  v6 = -[CRTombstoneOrderedSet initWithDocument:]([CRTombstoneOrderedSet alloc], "initWithDocument:", v5);
  -[CRDocument setRootObject:](v5, "setRootObject:", v6);

  v7 = +[REMList newObjectID](REMList, "newObjectID");
  v8 = -[REMCRReminderIDList initWithDocument:objectID:](self, "initWithDocument:objectID:", v5, v7);

  return v8;
}

- (REMCRReminderIDList)initWithDocument:(id)a3 objectID:(id)a4
{
  id v7;
  id v8;
  REMCRReminderIDList *v9;
  REMCRReminderIDList *v10;
  uint64_t v11;
  CRTombstoneOrderedSet *reminderIDsStorage;
  uint64_t v13;
  NSUUID *replica;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REMCRReminderIDList;
  v9 = -[REMCRReminderIDList init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remObjectID, a4);
    objc_storeStrong((id *)&v10->_document, a3);
    objc_msgSend(v7, "rootObject");
    v11 = objc_claimAutoreleasedReturnValue();
    reminderIDsStorage = v10->_reminderIDsStorage;
    v10->_reminderIDsStorage = (CRTombstoneOrderedSet *)v11;

    -[CRTombstoneOrderedSet setDelegate:](v10->_reminderIDsStorage, "setDelegate:", v10);
    objc_msgSend(v7, "replica");
    v13 = objc_claimAutoreleasedReturnValue();
    replica = v10->_replica;
    v10->_replica = (NSUUID *)v13;

  }
  return v10;
}

+ (id)listFromSerializedData:(id)a3 replica:(id)a4
{
  id v5;
  id v6;
  void *v7;
  REMCRReminderIDList *v8;
  id v9;
  REMCRReminderIDList *v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a4;
  v6 = a3;
  +[REMObjectID rem_registerClassAtCRCoderIfNeeded](REMObjectID, "rem_registerClassAtCRCoderIfNeeded");
  +[CRDocument unarchiveFromData:replica:](CRDocument, "unarchiveFromData:replica:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[REMCRReminderIDList listFromSerializedData:replica:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

  }
  v8 = [REMCRReminderIDList alloc];
  v9 = +[REMList newObjectID](REMList, "newObjectID");
  v10 = -[REMCRReminderIDList initWithDocument:objectID:](v8, "initWithDocument:objectID:", v7, v9);

  return v10;
}

- (id)copyForReplica:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMCRReminderIDList *v7;
  void *v8;
  REMCRReminderIDList *v9;

  v4 = a3;
  -[REMCRReminderIDList document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyForReplica:", v4);

  v7 = [REMCRReminderIDList alloc];
  -[REMCRReminderIDList remObjectID](self, "remObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[REMCRReminderIDList initWithDocument:objectID:](v7, "initWithDocument:objectID:", v6, v8);

  return v9;
}

- (void)addReminder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMCRReminderIDList reminderIDsProxy](self, "reminderIDsProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

- (void)mergeWith:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMCRReminderIDList document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mergeWithDocument:", v5);
}

- (NSMutableOrderedSet)reminderIDsProxy
{
  return (NSMutableOrderedSet *)-[REMCRReminderIDList mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("reminderIDs"));
}

- (unint64_t)countOfReminderIDs
{
  return -[CRTombstoneOrderedSet count](self->_reminderIDsStorage, "count");
}

- (id)objectInReminderIDsAtIndex:(unint64_t)a3
{
  return -[CRTombstoneOrderedSet objectAtIndex:](self->_reminderIDsStorage, "objectAtIndex:", a3);
}

- (unint64_t)indexInReminderIDsOfObject:(id)a3
{
  return -[CRTombstoneOrderedSet indexOfEqualObject:](self->_reminderIDsStorage, "indexOfEqualObject:", a3);
}

- (void)insertObject:(id)a3 inReminderIDsAtIndex:(unint64_t)a4
{
  -[CRTombstoneOrderedSet insertObject:atIndex:](self->_reminderIDsStorage, "insertObject:atIndex:", a3, a4);
}

- (void)removeObjectFromReminderIDsAtIndex:(unint64_t)a3
{
  -[CRTombstoneOrderedSet removeObjectAtIndex:](self->_reminderIDsStorage, "removeObjectAtIndex:", a3);
}

- (id)_orderedSet
{
  return self->_reminderIDsStorage;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[REMCRReminderIDList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E67FA3E0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addUndoCommandsForList:block:", self, v8);

}

void __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "remObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "remObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "_orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke_cold_1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (BOOL)wantsUndoCommands
{
  void *v2;
  char v3;

  -[REMCRReminderIDList delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUndoCommands");

  return v3;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Should not call +cdEntityName on this test-only class."));
  return (NSString *)&stru_1E67FB1F0;
}

- (REMCRReminderIDListDelegate)delegate
{
  return (REMCRReminderIDListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)replica
{
  return self->_replica;
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (REMObjectID)remObjectID
{
  return self->_remObjectID;
}

- (void)setRemObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_remObjectID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remObjectID, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replica, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reminderIDsStorage, 0);
}

+ (void)listFromSerializedData:(uint64_t)a3 replica:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "rem_log_fault_if (![document isKindOfClass:[CRTTCompatibleDocument class]]) -- Unexpected class for deserialized document for REMCRReminderIDList {document: %@}", a5, a6, a7, a8, 2u);
}

void __54__REMCRReminderIDList_addUndoCommandsForObject_block___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "An unexpected list is passed to the undo block which does not match the originating list. Passed in: %@", a5, a6, a7, a8, 2u);
}

@end
