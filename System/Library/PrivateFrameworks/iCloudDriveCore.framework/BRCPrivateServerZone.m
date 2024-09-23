@implementation BRCPrivateServerZone

- (BRCPrivateClientZone)clientZone
{
  return (BRCPrivateClientZone *)-[BRCClientZone asPrivateClientZone](self->super._clientZone, "asPrivateClientZone");
}

- (BOOL)isPrivateZone
{
  return 1;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCPrivateServerZone;
  -[BRCServerZone activateWithClientZone:offline:](&v10, sel_activateWithClientZone_offline_, v6, v4);
  if (-[BRCServerZone hasFetchedRecentsAndFavorites](self, "hasFetchedRecentsAndFavorites")
    && (-[BRCServerZone state](self, "state") & 4) == 0
    && !-[BRCClientZone isSyncBlocked](self->super._clientZone, "isSyncBlocked")
    && !v4)
  {
    -[BRCAccountSessionFPFS clientTruthWorkloop](self->super._session, "clientTruthWorkloop");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__BRCPrivateServerZone_activateWithClientZone_offline___block_invoke;
    block[3] = &unk_24FE3FA18;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

void __55__BRCPrivateServerZone_activateWithClientZone_offline___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appLibraries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "fetchPristineness");
        objc_msgSend(v7, "scheduleFullLibraryContentsFetch");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BRCZonePurgeOperation)deleteAllContentsOperation
{
  BRCPrivateServerZone *v2;
  BRCZonePurgeOperation *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deleteAllContentsOperation;
  objc_sync_exit(v2);

  return v3;
}

- (NSError)deleteAllContentsOperationLastError
{
  BRCPrivateServerZone *v2;
  NSError *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deleteAllContentsOperationLastError;
  objc_sync_exit(v2);

  return v3;
}

- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3
{
  id v4;
  BRCZonePurgeOperation *v5;
  void *v6;
  id v7;
  BRCPrivateServerZone *v8;
  BRCZonePurgeOperation *deleteAllContentsOperation;
  BRCZonePurgeOperation *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  BRCPrivateServerZone *v15;
  id v16;

  v4 = a3;
  v5 = -[BRCZonePurgeOperation initWithServerZone:sessionContext:]([BRCZonePurgeOperation alloc], "initWithServerZone:sessionContext:", self, self->super._session);
  objc_msgSend(MEMORY[0x24BDB9190], "br_purge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation setGroup:](v5, "setGroup:", v6);

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __69__BRCPrivateServerZone_deleteAllContentsOnServerWithCompletionBlock___block_invoke;
  v14 = &unk_24FE42DE0;
  v15 = self;
  v16 = v4;
  v7 = v4;
  -[_BRCOperation setFinishBlock:](v5, "setFinishBlock:", &v11);
  v8 = self;
  objc_sync_enter(v8);
  deleteAllContentsOperation = v8->_deleteAllContentsOperation;
  v8->_deleteAllContentsOperation = v5;
  v10 = v5;

  objc_sync_exit(v8);
  -[_BRCOperation schedule](v10, "schedule", v11, v12, v13, v14, v15);

}

void __69__BRCPrivateServerZone_deleteAllContentsOnServerWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v4;
  v10 = v4;

  objc_sync_exit(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)itemByParentID:(id)a3 andName:(id)a4
{
  BRCPQLConnection *db;
  _QWORD v6[5];

  db = self->super._db;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__BRCPrivateServerZone_itemByParentID_andName___block_invoke;
  v6[3] = &unk_24FE40010;
  v6[4] = self;
  return -[BRCPQLConnection fetchObject:sql:](db, "fetchObject:sql:", v6, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@"), a3, a4, self->super._dbRowID);
}

id __47__BRCPrivateServerZone_itemByParentID_andName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newServerItemFromPQLResultSet:error:", v5, a3);

  return v7;
}

- (void)_checkResultSetIsEmpty:(id)a3 logToFile:(__sFILE *)a4 reason:(id)a5 result:(BOOL *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v9, "enumerateObjectsOfClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        *a6 = 0;
        fprintf(a4, "itemID %s %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    *a6 = 0;
    objc_msgSend(v9, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(a4, "SQL error: %s\n", (const char *)objc_msgSend(v19, "UTF8String"));

  }
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v6 = a4;
  v20 = 1;
  -[BRCPrivateServerZone clientZone](self, "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultAppLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "execute:", CFSTR("DROP TABLE IF EXISTS items_checks")) & 1) != 0
    && (objc_msgSend(v6, "execute:", CFSTR("CREATE TABLE items_checks (item_id blob PRIMARY KEY, depth integer not null)")) & 1) != 0&& (objc_msgSend(v6, "execute:", CFSTR("CREATE INDEX items_checks__depth__idx ON items_checks (depth)")) & 1) != 0&& (fprintf(a3, "server truth structure validation (%s)\n=================================\n", -[NSString UTF8String](self->super._zoneName, "UTF8String")), objc_msgSend(v6, "execute:", CFSTR("INSERT INTO items_checks (item_id, depth) VALUES (%@, 0)"), v9)))
  {
    v10 = 0;
    while (objc_msgSend(v6, "changes"))
    {
      v11 = objc_msgSend(v6, "execute:", CFSTR("INSERT INTO items_checks    SELECT c.item_id, %lld      FROM items_checks AS p INNER JOIN server_items AS c ON (p.item_id = c.item_parent_id)     WHERE zone_rowid = %@ AND p.depth = %lld"), v10 + 1, self->super._dbRowID, v10);
      ++v10;
      if ((v11 & 1) == 0)
        goto LABEL_8;
    }
    v16 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT item_id FROM server_items WHERE zone_rowid = %@ AND item_id NOT IN(SELECT item_id FROM items_checks)"), self->super._dbRowID);
    -[BRCPrivateServerZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v16, a3, CFSTR("is an orphan or part of a cycle"), &v20);
    v17 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@ AND c.item_state = 0       AND p.item_state = 1"), self->super._dbRowID);

    -[BRCPrivateServerZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v17, a3, CFSTR("is a live item parented to a tombstone"), &v20);
    v18 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@       AND p.item_type NOT IN (1, 2, 8, 5, 6, 7, 3)"), self->super._dbRowID);

    -[BRCPrivateServerZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v18, a3, CFSTR("is parented to a document"), &v20);
    v19 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT c.item_id      FROM server_items AS c INNER JOIN server_items AS p ON (c.zone_rowid = p.zone_rowid AND c.item_parent_id = p.item_id)     WHERE c.zone_rowid = %@ AND c.item_rank >= p.item_rank       AND p.item_state = 1"), self->super._dbRowID);

    -[BRCPrivateServerZone _checkResultSetIsEmpty:logToFile:reason:result:](self, "_checkResultSetIsEmpty:logToFile:reason:result:", v19, a3, CFSTR("is an item with a greater rank than a dead parent"), &v20);
    if (v20)
      fputs("OK\n", a3);
    fputc(10, a3);
    v14 = v20 != 0;

  }
  else
  {
LABEL_8:
    objc_msgSend(v6, "lastError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(a3, "SQL error: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

    v14 = 0;
  }

  return v14;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  fprintf(a3, "server items checks (%s)\n===================\n", -[NSString UTF8String](self->super._zoneName, "UTF8String"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[BRCServerZone itemsEnumeratorWithDB:](self, "itemsEnumeratorWithDB:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v8)
  {

LABEL_11:
    fputs("OK\n", a3);
    v13 = 1;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = *(_QWORD *)v16;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v11 &= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "validateLoggingToFile:", a3);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v9);

  if (v11)
    goto LABEL_11;
  v13 = 0;
LABEL_12:
  fputc(10, a3);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteAllContentsOperationLastError, 0);
  objc_storeStrong((id *)&self->_deleteAllContentsOperation, 0);
}

@end
