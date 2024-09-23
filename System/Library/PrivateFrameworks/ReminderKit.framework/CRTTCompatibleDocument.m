@implementation CRTTCompatibleDocument

- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TTCRVectorMultiTimestamp *v14;
  CRTTCompatibleDocument *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[TTCRVectorMultiTimestamp initWithCapacity:]([TTCRVectorMultiTimestamp alloc], "initWithCapacity:", 2);
  v15 = -[CRTTCompatibleDocument initWithVersion:startVersion:rootObject:replica:topoTimestamp:](self, "initWithVersion:startVersion:rootObject:replica:topoTimestamp:", v13, v12, v11, v10, v14);

  return v15;
}

- (CRTTCompatibleDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6 topoTimestamp:(id)a7
{
  id v12;
  CRTTCompatibleDocument *v13;
  CRTTCompatibleDocument *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)CRTTCompatibleDocument;
  v13 = -[CRDocument initWithVersion:startVersion:rootObject:replica:](&v18, sel_initWithVersion_startVersion_rootObject_replica_, a3, a4, a5, a6);
  v14 = v13;
  if (v13)
  {
    -[CRTTCompatibleDocument setSharedTopotextTimestamp:](v13, "setSharedTopotextTimestamp:", v12);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTCompatibleDocument setStringsWithClocksNeedingUpdating:](v14, "setStringsWithClocksNeedingUpdating:", v15);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRTTCompatibleDocument setStringsWithClocksToResetAfterRealizingLocalChanges:](v14, "setStringsWithClocksToResetAfterRealizingLocalChanges:", v16);

  }
  return v14;
}

- (unint64_t)mergeResultForMergingWithDocument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[CRTTCompatibleDocument sharedTopotextTimestamp](self, "sharedTopotextTimestamp"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "sharedTopotextTimestamp"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "compareTo:", v8),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = 2;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRTTCompatibleDocument;
    v10 = -[CRDocument mergeResultForMergingWithDocument:](&v12, sel_mergeResultForMergingWithDocument_, v4);
  }

  return v10;
}

- (void)mergeTimestampWithDocument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRTTCompatibleDocument;
  -[CRDocument mergeTimestampWithDocument:](&v20, sel_mergeTimestampWithDocument_, v4);
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CRTTCompatibleDocument sharedTopotextTimestamp](self, "sharedTopotextTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedTopotextTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mergeWithTimestamp:", v8);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CRTTCompatibleDocument stringsWithClocksNeedingUpdating](self, "stringsWithClocksNeedingUpdating", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "updateClock");
          objc_msgSend(v14, "checkTimestampLogStyleErrors:", 1);
          objc_msgSend(v14, "resetLocalReplicaClocksToTimestampValues");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v11);
    }

    -[CRTTCompatibleDocument stringsWithClocksNeedingUpdating](self, "stringsWithClocksNeedingUpdating");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");

  }
}

- (void)realizeLocalChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CRTTCompatibleDocument;
  -[CRDocument realizeLocalChanges](&v15, sel_realizeLocalChanges);
  -[CRTTCompatibleDocument stringsWithClocksToResetAfterRealizingLocalChanges](self, "stringsWithClocksToResetAfterRealizingLocalChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[CRTTCompatibleDocument stringsWithClocksToResetAfterRealizingLocalChanges](self, "stringsWithClocksToResetAfterRealizingLocalChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "resetLocalReplicaClocksToTimestampValues", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (TTCRVectorMultiTimestamp)sharedTopotextTimestamp
{
  return self->_sharedTopotextTimestamp;
}

- (void)setSharedTopotextTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTopotextTimestamp, a3);
}

- (NSMutableArray)stringsWithClocksNeedingUpdating
{
  return self->_stringsWithClocksNeedingUpdating;
}

- (void)setStringsWithClocksNeedingUpdating:(id)a3
{
  objc_storeStrong((id *)&self->_stringsWithClocksNeedingUpdating, a3);
}

- (NSMutableArray)stringsWithClocksToResetAfterRealizingLocalChanges
{
  return self->_stringsWithClocksToResetAfterRealizingLocalChanges;
}

- (void)setStringsWithClocksToResetAfterRealizingLocalChanges:(id)a3
{
  objc_storeStrong((id *)&self->_stringsWithClocksToResetAfterRealizingLocalChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsWithClocksToResetAfterRealizingLocalChanges, 0);
  objc_storeStrong((id *)&self->_stringsWithClocksNeedingUpdating, 0);
  objc_storeStrong((id *)&self->_sharedTopotextTimestamp, 0);
}

@end
