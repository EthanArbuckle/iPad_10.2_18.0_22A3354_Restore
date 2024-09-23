@implementation CRDocument

- (id)clockElementListForReplicaUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMClockElementList *v7;
  void *v8;
  REMClockElementList *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRDocument realizeLocalChanges](self, "realizeLocalChanges");
  -[CRDocument version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clockElementForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [REMClockElementList alloc];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[REMClockElementList initWithCRVectorTimestampElements:](v7, "initWithCRVectorTimestampElements:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (CRDocument)documentWithReplica:(id)a3
{
  id v3;
  CRDocument *v4;
  CRVectorTimestamp *v5;
  CRDocument *v6;

  v3 = a3;
  v4 = [CRDocument alloc];
  v5 = objc_alloc_init(CRVectorTimestamp);
  v6 = -[CRDocument initWithVersion:rootObject:replica:](v4, "initWithVersion:rootObject:replica:", v5, 0, v3);

  return v6;
}

+ (CRDocument)documentWithRootObject:(id)a3 replica:(id)a4
{
  id v5;
  id v6;
  CRDocument *v7;
  CRVectorTimestamp *v8;
  CRDocument *v9;

  v5 = a4;
  v6 = a3;
  v7 = [CRDocument alloc];
  v8 = objc_alloc_init(CRVectorTimestamp);
  v9 = -[CRDocument initWithVersion:rootObject:replica:](v7, "initWithVersion:rootObject:replica:", v8, v6, v5);

  return v9;
}

- (CRDocument)init
{
  void *v3;
  CRDocument *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRDocument initWithReplica:](self, "initWithReplica:", v3);

  return v4;
}

- (CRDocument)initWithReplica:(id)a3
{
  id v4;
  CRVectorTimestamp *v5;
  CRDocument *v6;

  v4 = a3;
  v5 = objc_alloc_init(CRVectorTimestamp);
  v6 = -[CRDocument initWithVersion:startVersion:rootObject:replica:](self, "initWithVersion:startVersion:rootObject:replica:", v5, 0, 0, v4);

  return v6;
}

- (CRDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  return -[CRDocument initWithVersion:startVersion:rootObject:replica:](self, "initWithVersion:startVersion:rootObject:replica:", a3, 0, a4, a5);
}

- (CRDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRDocument *v15;
  CRDocument *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *objects;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRDocument;
  v15 = -[CRDocument init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    v17 = -[CRVectorTimestamp clockForUUID:](v16->_version, "clockForUUID:", v14);
    v16->_replicaClock = v17;
    v16->_unserializedReplicaClock = v17;
    objc_storeStrong((id *)&v16->_startVersion, a4);
    if (v13)
      objc_storeStrong(&v16->_rootObject, a5);
    objc_storeStrong((id *)&v16->_replica, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objects = v16->_objects;
    v16->_objects = v18;

  }
  return v16;
}

- (void)setRootObject:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_rootObject != v5)
  {
    objc_storeStrong(&self->_rootObject, a3);
    -[CRDocument setDocumentFor:](self, "setDocumentFor:", v5);
  }

}

- (id)copyForReplica:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRDocument archivedData](self, "archivedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRDocument unarchiveFromData:replica:](CRDocument, "unarchiveFromData:replica:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)archivedData
{
  -[CRDocument realizeLocalChanges](self, "realizeLocalChanges");
  return +[CRCoderArchiver encodedDataWithDocument:](CRCoderArchiver, "encodedDataWithDocument:", self);
}

+ (id)unarchiveFromData:(id)a3 replica:(id)a4
{
  return +[CRCoderUnarchiver decodedDocumentFromData:replica:](CRCoderUnarchiver, "decodedDocumentFromData:replica:", a3, a4);
}

- (id)localObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF101708))
  {
    -[CRDocument objects](self, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = v4;
    v9 = v8;

    v4 = v9;
  }
  return v4;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "startVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  objc_msgSend(v4, "startVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDocument version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if ((v9 & 4) != 0)
  {
    v13 = 0;
  }
  else
  {
LABEL_3:
    -[CRDocument version](self, "version");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if ((v12 & 1) != 0)
      v13 = 2;
    else
      v13 = 1;
  }

  return v13;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRDocument version](self, "version");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mergeWith:", v5);
}

- (unint64_t)mergeWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  NSObject *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CRDocument replica](self, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRDocument unarchiveFromData:replica:](CRDocument, "unarchiveFromData:replica:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRDocument realizeLocalChanges](self, "realizeLocalChanges");
  v7 = -[CRDocument mergeResultForMergingWithDocument:](self, "mergeResultForMergingWithDocument:", v6);
  if (v7 == 2)
  {
    v27 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[CRDocument objects](self, "objects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "objectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
          objc_msgSend(v6, "objects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mergeWith:", v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    -[CRDocument rootObject](self, "rootObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mergeWith:", v20);

    -[CRDocument mergeTimestampWithDocument:](self, "mergeTimestampWithDocument:", v6);
    -[CRDocument version](self, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDocument replica](self, "replica");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "clockForUUID:", v22);
    v24 = -[CRDocument replicaClock](self, "replicaClock");

    v4 = v27;
    if (v23 != v24)
    {
      +[REMLog crdt](REMLog, "crdt");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CRDocument mergeWithData:].cold.1(self);

    }
    -[CRDocument updateGraphDocumentPointers](self, "updateGraphDocumentPointers");
    -[CRDocument updateObjectsSet](self, "updateObjectsSet");
    v7 = 2;
  }

  return v7;
}

- (void)walkGraph:(id)a3 root:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 514);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3042000000;
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __29__CRDocument_walkGraph_root___block_invoke;
  v11[3] = &unk_1E67FAD80;
  v8 = v7;
  v12 = v8;
  v9 = v5;
  v13 = v9;
  v14 = &v15;
  v10 = (void *)MEMORY[0x1B5E3E098](v11);
  objc_storeWeak(v16 + 5, v10);
  (*((void (**)(id, id))v9 + 2))(v9, v6);
  objc_msgSend(v6, "walkGraph:", v10);

  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);

}

void __29__CRDocument_walkGraph_root___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v3 = v6;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v6, "walkGraph:", WeakRetained);

      v3 = v6;
    }
  }

}

- (void)realizeLocalChanges
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "replicaClock");
  objc_msgSend(a1, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockForUUID:", v3);
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v4, v5, "Version clock should equal cached replica clock: %ld => %ld", v6, v7, v8, v9, 0);

}

uint64_t __33__CRDocument_realizeLocalChanges__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "realizeLocalChangesIn:", *(_QWORD *)(a1 + 32));
}

- (void)updateGraphDocumentPointers
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__CRDocument_updateGraphDocumentPointers__block_invoke;
  v4[3] = &unk_1E67FADA8;
  v4[4] = self;
  -[CRDocument rootObject](self, "rootObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDocument walkGraph:root:](self, "walkGraph:root:", v4, v3);

}

uint64_t __41__CRDocument_updateGraphDocumentPointers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDocument:", *(_QWORD *)(a1 + 32));
}

- (void)updateObjectsSet
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CRDocument objects](self, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CRDocument_updateObjectsSet__block_invoke;
  v5[3] = &unk_1E67FADA8;
  v5[4] = self;
  -[CRDocument rootObject](self, "rootObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDocument walkGraph:root:](self, "walkGraph:root:", v5, v4);

}

void __30__CRDocument_updateObjectsSet__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF101708))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v7;
    objc_msgSend(v3, "objects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
}

- (void)setDocumentFor:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__CRDocument_setDocumentFor___block_invoke;
  v3[3] = &unk_1E67FADA8;
  v3[4] = self;
  -[CRDocument walkGraph:root:](self, "walkGraph:root:", v3, a3);
}

uint64_t __29__CRDocument_setDocumentFor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDocument:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)mergeWithDocument:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "archivedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRDocument mergeWithData:](self, "mergeWithData:", v4);

  return v5;
}

- (id)deltaSince:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  CRDocument *v10;
  void *v11;
  void *v12;
  CRDocument *v13;

  v4 = a3;
  -[CRDocument realizeLocalChanges](self, "realizeLocalChanges");
  -[CRDocument version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if ((v6 & 1) != 0)
  {
    -[CRDocument rootObject](self, "rootObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deltaSince:in:", v4, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [CRDocument alloc];
    -[CRDocument version](self, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDocument replica](self, "replica");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CRDocument initWithVersion:startVersion:rootObject:replica:](v10, "initWithVersion:startVersion:rootObject:replica:", v11, v4, v9, v12);

    -[CRDocument archivedData](v13, "archivedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDocument version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDocument rootObject](self, "rootObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p version=%@ root=%@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CRVectorTimestamp)version
{
  return self->_version;
}

- (CRVectorTimestamp)startVersion
{
  return self->_startVersion;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (int64_t)replicaClock
{
  return self->_replicaClock;
}

- (int64_t)unserializedReplicaClock
{
  return self->_unserializedReplicaClock;
}

- (void)setUnserializedReplicaClock:(int64_t)a3
{
  self->_unserializedReplicaClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_replica, 0);
  objc_storeStrong((id *)&self->_startVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)mergeWithData:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clockForUUID:", v3);
  objc_msgSend(a1, "replicaClock");
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v4, v5, "Merging should not modify local replica clock: %ld => %ld", v6, v7, v8, v9, 0);

}

@end
