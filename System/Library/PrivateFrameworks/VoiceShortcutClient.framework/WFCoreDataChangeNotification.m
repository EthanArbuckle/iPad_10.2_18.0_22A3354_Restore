@implementation WFCoreDataChangeNotification

- (WFCoreDataChangeNotification)initWithInvalidatedAllObjects:(BOOL)a3 updated:(id)a4 inserted:(id)a5 deleted:(id)a6 processIdentifier:(int)a7
{
  id v12;
  id v13;
  id v14;
  WFCoreDataChangeNotification *v15;
  WFCoreDataChangeNotification *v16;
  uint64_t v17;
  NSSet *updated;
  uint64_t v19;
  NSSet *inserted;
  uint64_t v21;
  NSSet *deleted;
  WFCoreDataChangeNotification *v23;
  objc_super v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFCoreDataChangeNotification;
  v15 = -[WFCoreDataChangeNotification init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_invalidatedAllObjects = a3;
    v17 = objc_msgSend(v12, "copy");
    updated = v16->_updated;
    v16->_updated = (NSSet *)v17;

    v19 = objc_msgSend(v13, "copy");
    inserted = v16->_inserted;
    v16->_inserted = (NSSet *)v19;

    v21 = objc_msgSend(v14, "copy");
    deleted = v16->_deleted;
    v16->_deleted = (NSSet *)v21;

    v16->_processIdentifier = a7;
    v23 = v16;
  }

  return v16;
}

- (BOOL)hasChanges
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[WFCoreDataChangeNotification invalidatedAllObjects](self, "invalidatedAllObjects"))
    return 1;
  -[WFCoreDataChangeNotification updated](self, "updated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v3 = 1;
  }
  else
  {
    -[WFCoreDataChangeNotification inserted](self, "inserted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v3 = 1;
    }
    else
    {
      -[WFCoreDataChangeNotification deleted](self, "deleted");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "count") != 0;

    }
  }

  return v3;
}

- (NSSet)updated
{
  return self->_updated;
}

- (BOOL)invalidatedAllObjects
{
  return self->_invalidatedAllObjects;
}

- (NSSet)inserted
{
  return self->_inserted;
}

- (NSSet)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
}

- (WFCoreDataChangeNotification)initWithDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFCoreDataChangeNotification *v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("invalidatedAllObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("updated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFChangesFromArray(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inserted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFChangesFromArray(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deleted"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFChangesFromArray(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("processIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WFCoreDataChangeNotification initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:](self, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", v5, v7, v9, v11, objc_msgSend(v12, "integerValue"));
  return v13;
}

- (id)notificationByMergingChangesFromNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFCoreDataChangeNotification *v13;
  unsigned int v15;
  WFCoreDataChangeNotification *v16;
  void *v17;

  v4 = a3;
  v16 = [WFCoreDataChangeNotification alloc];
  if (-[WFCoreDataChangeNotification invalidatedAllObjects](self, "invalidatedAllObjects"))
    v15 = 1;
  else
    v15 = objc_msgSend(v4, "invalidatedAllObjects");
  -[WFCoreDataChangeNotification updated](self, "updated");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataChangeNotification inserted](self, "inserted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inserted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataChangeNotification deleted](self, "deleted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFCoreDataChangeNotification initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:](v16, "initWithInvalidatedAllObjects:updated:inserted:deleted:processIdentifier:", v15, v6, v9, v12, -[WFCoreDataChangeNotification processIdentifier](self, "processIdentifier"));

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("invalidatedAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFCoreDataChangeNotification invalidatedAllObjects](self, "invalidatedAllObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("updated");
  -[WFCoreDataChangeNotification updated](self, "updated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFArrayFromChanges(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("inserted");
  -[WFCoreDataChangeNotification inserted](self, "inserted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFArrayFromChanges(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("deleted");
  -[WFCoreDataChangeNotification deleted](self, "deleted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFArrayFromChanges(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("processIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[WFCoreDataChangeNotification processIdentifier](self, "processIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)originatedInCurrentProcess
{
  int v2;

  v2 = -[WFCoreDataChangeNotification processIdentifier](self, "processIdentifier");
  return v2 == getpid();
}

- (BOOL)appliesToResultState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFCoreDataChangeNotification invalidatedAllObjects](self, "invalidatedAllObjects"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[WFCoreDataChangeNotification inserted](self, "inserted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "objectType");
          if (v11 == objc_msgSend(v4, "objectType"))
          {
LABEL_22:
            LOBYTE(v5) = 1;
            goto LABEL_23;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v8)
          continue;
        break;
      }
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[WFCoreDataChangeNotification updated](self, "updated", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataChangeNotification deleted](self, "deleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObjectsFromSet:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v5)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v5; ++j)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v6);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(v4, "state");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "containsObject:", v16))
          {

            goto LABEL_22;
          }
          objc_msgSend(v4, "state");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (!v19)
            goto LABEL_22;
        }
        v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_23:

  }
  return v5;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[WFCoreDataChangeNotification dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

@end
