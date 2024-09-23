@implementation BRCSharedServerZone

- (BOOL)isSharedZone
{
  return 1;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (BRCSharedClientZone)clientZone
{
  return (BRCSharedClientZone *)-[BRCClientZone asSharedClientZone](self->super._clientZone, "asSharedClientZone");
}

- (id)ownerName
{
  return self->_ownerName;
}

- (BRCSharedServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6
{
  id v10;
  BRCSharedServerZone *v11;
  uint64_t v12;
  NSString *ownerName;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSharedServerZone;
  v11 = -[BRCServerZone initWithMangledID:dbRowID:plist:session:](&v15, sel_initWithMangledID_dbRowID_plist_session_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "ownerName");
    v12 = objc_claimAutoreleasedReturnValue();
    ownerName = v11->_ownerName;
    v11->_ownerName = (NSString *)v12;

  }
  return v11;
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  return 1;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  return 1;
}

- (int64_t)_propagateDeleteToChildrenOfItemID:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE server_items SET item_state = 1, item_rank = NULL WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_state = 0"), v4, self->super._dbRowID))
  {
    v5 = -[BRCPQLConnection changes](self->super._db, "changes");
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      -[BRCPQLConnection lastError](self->super._db, "lastError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_230455000, v7, (os_log_type_t)0x90u, "[ERROR] failed saving sharing options update %@: %@%@", buf, 0x20u);

    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)_propagateFolderDeletesToTheirChildren
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  BOOL v25;
  id v26;
  void *context;
  uint8_t buf[4];
  int64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[BRCServerZone mangledID](self, "mangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxRelativePathDepth");

  v6 = -[BRCItemID _initAsZoneRootWithZoneRowID:]([BRCItemID alloc], "_initAsZoneRootWithZoneRowID:", self->super._dbRowID);
  v7 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE server_items SET item_state = 1 , item_parent_id = %@ WHERE zone_rowid = %@   AND item_rank IS NULL   AND NOT EXISTS (SELECT 1 FROM server_items as pi WHERE pi.item_id = server_items.item_parent_id AND pi.zone_rowid = server_items.zone_rowid LIMIT 1)   AND item_parent_id != %@"), v6, self->super._dbRowID, v6);
  if (-[BRCPQLConnection changes](self->super._db, "changes"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[BRCPQLConnection changes](self->super._db, "changes");
      *(_DWORD *)buf = 134218242;
      v29 = v10;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Forced %lld orphans to be tombstones in the shared zone%@", buf, 0x16u);
    }

  }
  v11 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT item_id   FROM server_items  WHERE zone_rowid = %@    AND item_state = 1    AND item_type = 0    AND item_rank IS NULL"), self->super._dbRowID);
  if (objc_msgSend(v11, "next"))
  {
    v25 = v7;
    v26 = v6;
LABEL_7:
    context = (void *)MEMORY[0x2348B9F14]();
    objc_msgSend(v11, "objectOfClass:atIndex:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    -[BRCServerZone directDirectoryChildItemIDsOfParentEnumerator:](self, "directDirectoryChildItemIDsOfParentEnumerator:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    v15 = -[BRCSharedServerZone _propagateDeleteToChildrenOfItemID:](self, "_propagateDeleteToChildrenOfItemID:", v12);
    while (1)
    {
      if (!objc_msgSend(v13, "count"))
      {
        if (v15)
        {
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            v29 = v15;
            v30 = 2112;
            v31 = v12;
            v32 = 2112;
            v33 = v20;
            _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] propagated delete of %lld recursive children of %@%@", buf, 0x20u);
          }

        }
        objc_autoreleasePoolPop(context);
        if ((objc_msgSend(v11, "next") & 1) == 0)
        {
          v6 = v26;
          v7 = v25;
          break;
        }
        goto LABEL_7;
      }
      v16 = (void *)MEMORY[0x2348B9F14]();
      objc_msgSend(v13, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "nextObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[BRCServerZone directDirectoryChildItemIDsOfParentEnumerator:](self, "directDirectoryChildItemIDsOfParentEnumerator:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        if (objc_msgSend(v13, "count") > (unint64_t)v5)
        {
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            -[BRCSharedServerZone _propagateFolderDeletesToTheirChildren].cold.1((uint64_t)v22, v23);

          objc_autoreleasePoolPop(v16);
          objc_autoreleasePoolPop(context);
          v7 = 0;
          v6 = v26;
          break;
        }
        v15 += -[BRCSharedServerZone _propagateDeleteToChildrenOfItemID:](self, "_propagateDeleteToChildrenOfItemID:", v18);
      }
      else
      {
        objc_msgSend(v13, "removeLastObject");
      }

      objc_autoreleasePoolPop(v16);
    }
  }

  return v7;
}

- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  -[BRCSharedServerZone _propagateFolderDeletesToTheirChildren](self, "_propagateFolderDeletesToTheirChildren");
  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  return -[BRCServerZone allocateRanksWhenCaughtUp:](&v6, sel_allocateRanksWhenCaughtUp_, v3);
}

- (void)sideCarZoneWasReset
{
  NSObject *v3;
  _QWORD block[5];

  -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE server_items SET item_favoriterank = NULL, item_lastusedtime = NULL, item_side_car_ckinfo = NULL, item_rank = NULL WHERE zone_rowid = %@ AND (item_sharing_options & 4) == 0"), self->super._dbRowID);
  -[BRCAccountSessionFPFS clientTruthWorkloop](self->super._session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__BRCSharedServerZone_sideCarZoneWasReset__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __42__BRCSharedServerZone_sideCarZoneWasReset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "scheduleSyncDown");
}

- (void)addForegroundClient:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[BRCSharedServerZone transferSyncContext](self, "transferSyncContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addForegroundClient:", v4);

  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  -[BRCServerZone addForegroundClient:](&v6, sel_addForegroundClient_, v4);

}

- (void)removeForegroundClient:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[BRCSharedServerZone transferSyncContext](self, "transferSyncContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeForegroundClient:", v4);

  v6.receiver = self;
  v6.super_class = (Class)BRCSharedServerZone;
  -[BRCServerZone removeForegroundClient:](&v6, sel_removeForegroundClient_, v4);

}

- (BRCSyncContext)transferSyncContext
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSessionFPFS syncContextProvider](self->super._session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (BRCSyncContext)transferSyncContextIfExists
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSessionFPFS syncContextProvider](self->super._session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:createIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
}

- (void)_propagateFolderDeletesToTheirChildren
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Path depth overflow%@", (uint8_t *)&v2, 0xCu);
}

@end
