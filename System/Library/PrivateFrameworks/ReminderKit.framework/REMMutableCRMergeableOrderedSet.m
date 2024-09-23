@implementation REMMutableCRMergeableOrderedSet

- (REMMutableCRMergeableOrderedSet)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4 undos:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMMutableCRMergeableOrderedSet *v12;
  REMMutableCRMergeableOrderedSet *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *undos;
  REMReplicaIDHelper *v17;
  REMReplicaIDHelper *replicaIDHelper;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)REMMutableCRMergeableOrderedSet;
  v12 = -[REMMutableCRMergeableOrderedSet init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeStrong((id *)&v13->_document, a4);
    -[CRDocument rootObject](v13->_document, "rootObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v13);

    v15 = objc_msgSend(v11, "mutableCopy");
    undos = v13->_undos;
    v13->_undos = (NSMutableArray *)v15;

    v17 = -[REMReplicaIDHelper initWithReplicaIDSource:owner:replicaClockProvider:]([REMReplicaIDHelper alloc], "initWithReplicaIDSource:owner:replicaClockProvider:", v9, v13, v10);
    replicaIDHelper = v13->_replicaIDHelper;
    v13->_replicaIDHelper = v17;

  }
  return v13;
}

- (id)immutableOrderedSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  REMCRMergeableOrderedSet *v8;
  void *v9;
  void *v10;
  REMCRMergeableOrderedSet *v11;

  v3 = (void *)MEMORY[0x1B5E3DEC4](self, a2);
  -[REMMutableCRMergeableOrderedSet document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMReplicaIDHelper nonEditingReplicaUUID](REMReplicaIDHelper, "nonEditingReplicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copyForReplica:", v5);

  -[REMMutableCRMergeableOrderedSet replicaIDHelper](self, "replicaIDHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didCopy");

  v8 = [REMCRMergeableOrderedSet alloc];
  -[REMMutableCRMergeableOrderedSet replicaIDSource](self, "replicaIDSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[REMCRMergeableOrderedSet initWithReplicaIDSource:document:undos:](v8, "initWithReplicaIDSource:document:undos:", v9, v6, v10);

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMMutableCRMergeableOrderedSet document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p document: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setReplicaManagerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_replicaManagerProvider, a3);
}

- (id)documentToEdit
{
  void *v3;

  -[REMMutableCRMergeableOrderedSet replicaIDHelper](self, "replicaIDHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willEdit");

  return -[REMMutableCRMergeableOrderedSet document](self, "document");
}

- (id)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", v7);

  v8 = (void *)MEMORY[0x1B5E3DEC4]();
  -[REMMutableCRMergeableOrderedSet documentToEdit](self, "documentToEdit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertObject:atIndex:", v6, a4);

  objc_autoreleasePoolPop(v8);
  -[REMMutableCRMergeableOrderedSet currentUndo](self, "currentUndo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "immutableCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", 0);
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

  return v12;
}

- (id)addObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", v5);

  v6 = (void *)MEMORY[0x1B5E3DEC4]();
  -[REMMutableCRMergeableOrderedSet documentToEdit](self, "documentToEdit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

  objc_autoreleasePoolPop(v6);
  -[REMMutableCRMergeableOrderedSet currentUndo](self, "currentUndo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "immutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", 0);
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  return v10;
}

- (id)removeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_opt_new();
  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", v5);

  v6 = (void *)MEMORY[0x1B5E3DEC4]();
  -[REMMutableCRMergeableOrderedSet documentToEdit](self, "documentToEdit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);

  objc_autoreleasePoolPop(v6);
  -[REMMutableCRMergeableOrderedSet currentUndo](self, "currentUndo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "immutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", 0);
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  return v10;
}

- (id)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)objc_opt_new();
  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", v7);

  v8 = (void *)MEMORY[0x1B5E3DEC4]();
  -[REMMutableCRMergeableOrderedSet documentToEdit](self, "documentToEdit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moveObjectFromIndex:toIndex:", a3, a4);

  objc_autoreleasePoolPop(v8);
  -[REMMutableCRMergeableOrderedSet currentUndo](self, "currentUndo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "immutableCopy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMMutableCRMergeableOrderedSet setCurrentUndo:](self, "setCurrentUndo:", 0);
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

  return v12;
}

- (void)undo
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Undo stack is empty. Cannot -undo.", a5, a6, a7, a8, 0);
}

- (void)undo:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMMutableCRMergeableOrderedSet undos](self, "undos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    +[REMLog crdt](REMLog, "crdt");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[REMMutableCRMergeableOrderedSet undo:].cold.2(self, v24);

  }
  v7 = (void *)MEMORY[0x1B5E3DEC4]();
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "undoBlocks", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reverseObjectEnumerator");
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[REMMutableCRMergeableOrderedSet documentToEdit](self, "documentToEdit");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "rootObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[REMMutableCRMergeableOrderedSet undo].cold.1(v9, v17, v18, v19, v20, v21, v22, v23);
  }

  objc_autoreleasePoolPop(v7);
}

- (BOOL)wantsUndoCommands
{
  return 1;
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[REMMutableCRMergeableOrderedSet currentUndo](self, "currentUndo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUndoBlock:", v5);

}

- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)MEMORY[0x1B5E3DEC4]();
  objc_msgSend(v12, "replicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableOrderedSet document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyForReplica:", v5);
  -[REMMutableCRMergeableOrderedSet setDocument:](self, "setDocument:", v7);

  -[REMMutableCRMergeableOrderedSet document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMutableCRMergeableOrderedSet replicaIDHelper](self, "replicaIDHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReplicaClockProvider:", v8);

  -[REMMutableCRMergeableOrderedSet document](self, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  objc_autoreleasePoolPop(v4);
}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDSource, a3);
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (REMReplicaIDHelper)replicaIDHelper
{
  return self->_replicaIDHelper;
}

- (void)setReplicaIDHelper:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDHelper, a3);
}

- (NSMutableArray)undos
{
  return self->_undos;
}

- (REMMutableCRUndo)currentUndo
{
  return self->_currentUndo;
}

- (void)setCurrentUndo:(id)a3
{
  objc_storeStrong((id *)&self->_currentUndo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUndo, 0);
  objc_storeStrong((id *)&self->_undos, 0);
  objc_storeStrong((id *)&self->_replicaIDHelper, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);
  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
}

- (void)undo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "undos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self.undos containsObject:undo]) -- Supplied undo is not found in undo stack. Normally, if the undo is obtained from this particular REMCRMergeableOrderedSet, the undo will also be present in self.undos, whose value is now: %@", (uint8_t *)&v4, 0xCu);

}

@end
