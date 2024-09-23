@implementation BRCDirectoryItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_previousItemGlobalID, 0);
}

- (id)folderRootStructureRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (-[BRCDirectoryItem isDirectory](self, "isDirectory"))
  {
    -[BRCLocalItem itemID](self, "itemID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", -[BRCStatInfo type](self->super._st, "type"), self->super._serverZone, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("structure"), v4);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(CKConversions) folderRootStructureRecord].cold.1();

    v5 = 0;
  }
  return v5;
}

- (id)folderAppLibraryRootRecord
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[BRCLocalItem clientZone](self, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPrivateZone") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wasMovedToCloudDocs");

  if (!v5)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x24BDB91D8];
    -[BRCLocalItem structureRecordID](self, "structureRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootDirectoryRecordForZoneID:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x24BDB91D8];
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mangledID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalItem structureRecordID](self, "structureRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootAppLibraryRecordForAppLibraryID:zoneID:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v11;
}

- (void)_signalPropagationToChildrenForce:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  if (a3)
    goto LABEL_8;
  -[BRCLocalItem st](self->super._orig, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processingStamp");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_8;
  }
  v6 = (void *)v5;
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_8:
    -[BRCLocalStatInfo _markNeedsPropertiesPropagatedToChildren](self->super._st, "_markNeedsPropertiesPropagatedToChildren");
    -[BRCAccountSessionFPFS(FPFSAdditions) fsImporter](self->super._session, "fsImporter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signal");

    return;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[BRCDirectoryItem(FPFSAdditions) _signalPropagationToChildrenForce:].cold.1(self, (uint64_t)v8, v9);

}

- (void)forceSignalPropagationToChildren
{
  -[BRCDirectoryItem _signalPropagationToChildrenForce:](self, "_signalPropagationToChildrenForce:", 1);
}

- (void)signalPropagationToChildren
{
  -[BRCDirectoryItem _signalPropagationToChildrenForce:](self, "_signalPropagationToChildrenForce:", 0);
}

- (void)documentsDirectoryUpdatedDocumentsScopePublic
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  if (-[BRCItemID isDocumentsFolder](self->super._itemID, "isDocumentsFolder"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._isUserVisible = objc_msgSend(v4, "isDocumentScopePublic");

    self->super._localDiffs |= 0x8000000000uLL;
    -[BRCLocalItem markForceNotify](self, "markForceNotify");
    -[BRCDirectoryItem signalPropagationToChildren](self, "signalPropagationToChildren");
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(FPFSAdditions) documentsDirectoryUpdatedDocumentsScopePublic].cold.1();

  }
}

- (void)markRemovedFromFilesystemRecursively:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem markRemovedFromFilesystemRecursively:](&v12, sel_markRemovedFromFilesystemRecursively_);
  if (v3)
  {
    if (-[BRCDirectoryItem containsDirFault](self, "containsDirFault"))
    {
      -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasDeletionChangeToken") & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      v6 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");

      if (!v6)
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[BRCDirectoryItem(FPFSAdditions) markRemovedFromFilesystemRecursively:].cold.1((uint64_t)self, (uint64_t)v7, v8);

        -[BRCServerZone changeState](self->super._serverZone, "changeState");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "changeToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDeletionChangeToken:", v10);

        goto LABEL_8;
      }
    }
LABEL_9:
    -[BRCLocalStatInfo _markNeedsPropertiesPropagatedToChildren](self->super._st, "_markNeedsPropertiesPropagatedToChildren");
  }
}

- (void)markDirectoryMergeOrCrossZonePropagationComplete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCItemGlobalID *previousItemGlobalID;
  const char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  BRCDirectoryItem *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS itemByItemGlobalID:](self->super._session, "itemByItemGlobalID:", self->_previousItemGlobalID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(FPFSAdditions) markDirectoryMergeOrCrossZonePropagationComplete].cold.2();

  }
  if ((objc_msgSend(v4, "isLost") & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(FPFSAdditions) markDirectoryMergeOrCrossZonePropagationComplete].cold.1();

  }
  -[BRCItemGlobalID zoneRowID](self->_previousItemGlobalID, "zoneRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "br_isEqualToNumber:", v6);

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = "Cross zone move";
    v19 = 136315906;
    if (v7)
      v14 = "Directory merge";
    v20 = v14;
    v21 = 2112;
    v22 = self;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %s propagation completed for item %@. Deleting tombstone item %@%@", (uint8_t *)&v19, 0x2Au);
  }

  objc_msgSend(v4, "markDead");
  objc_msgSend(v4, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v4, "saveToDB");
  -[BRCAccountSessionFPFS applyScheduler](self->super._session, "applyScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rescheduleSuspendedJobsMatching:inState:", v11, 17);

  objc_msgSend(v4, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleSyncUp");

  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = 0;

}

- (void)markChildPropagationComplete
{
  -[BRCLocalStatInfo _markChildPropagationComplete](self->super._st, "_markChildPropagationComplete");
  -[BRCLocalItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  -[BRCClientZone scheduleSyncUp](self->super._clientZone, "scheduleSyncUp");
}

- (void)updateWithContentModificationDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_mtime = (uint64_t)v4;
}

- (BOOL)handlePathMatchConflictForDirectoryCreationIfNecessary
{
  BRCClientZone *clientZone;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BRCClientZone *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  BRCClientZone *v29;
  void *v30;
  void *v31;
  BRCPQLConnection *db;
  id v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  BRCDirectoryItem *v42;
  id v43;

  if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  clientZone = self->super._clientZone;
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone itemByParentID:andLogicalName:](clientZone, "itemByParentID:andLogicalName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.5();

  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "etag");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = 0;
LABEL_9:

    goto LABEL_10;
  }
  -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "reviveDeadDirsOnNewDirCreations");

  if (v15)
  {
    v16 = self->super._clientZone;
    -[BRCStatInfo parentID](self->super._st, "parentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone deadItemByParentID:andUnbouncedLogicalName:](v16, "deadItemByParentID:andUnbouncedLogicalName:", v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.4();
    goto LABEL_9;
  }
  v12 = 0;
LABEL_10:
  if (objc_msgSend(v12, "isDead"))
  {
    objc_msgSend(v12, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processingStamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = !v20 && objc_msgSend(v12, "isDirectory") && (objc_msgSend(v12, "sharingOptions") & 4) == 0;

    if (!v6)
      goto LABEL_24;
  }
  else
  {
    v21 = 0;
    if (!v6)
      goto LABEL_24;
  }
  if ((objc_msgSend(v6, "isDead") & 1) != 0)
    goto LABEL_24;
  -[BRCLocalItem itemID](self, "itemID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isDocumentsFolder") & 1) == 0)
  {

LABEL_30:
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.2();

    -[BRCLocalItem markBouncedToNextAvailableBounceNumber:](self, "markBouncedToNextAvailableBounceNumber:", 510);
    if (v21)
      goto LABEL_25;
LABEL_33:
    v34 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v6, "itemID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isDocumentsFolder");

  if ((v24 & 1) != 0)
    goto LABEL_30;
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.3();

  objc_msgSend(v6, "markBouncedToNextAvailableBounceNumber:", 511);
  objc_msgSend(v6, "saveToDB");
LABEL_24:
  if (!v21)
    goto LABEL_33;
LABEL_25:
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[BRCDirectoryItem(FPFSAdditions) handlePathMatchConflictForDirectoryCreationIfNecessary].cold.1();

  v29 = self->super._clientZone;
  objc_msgSend(v12, "itemID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverItemByItemID:](v29, "serverItemByItemID:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  db = self->super._db;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __89__BRCDirectoryItem_FPFSAdditions__handlePathMatchConflictForDirectoryCreationIfNecessary__block_invoke;
  v40[3] = &unk_24FE40868;
  v41 = v12;
  v42 = self;
  v43 = v31;
  v33 = v31;
  v34 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v40);

LABEL_34:
  return v34;
}

uint64_t __89__BRCDirectoryItem_FPFSAdditions__handlePathMatchConflictForDirectoryCreationIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "st");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ckInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "etagBeforeCrossZoneMove");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEtagBeforeCrossZoneMove:", v5);

  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "markNeedsDeleteForItemIDTransfer");
  if (objc_msgSend(*(id *)(a1 + 32), "saveToDB"))
  {
    objc_msgSend(*(id *)(a1 + 40), "learnItemID:serverItem:", v6, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setCkInfo:", v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 80) = 4;
    v7 = objc_msgSend(*(id *)(a1 + 40), "saveToDB");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem updateFromServerItem:](&v9, sel_updateFromServerItem_, v4);
  if (v5)
  {
    self->_mtime = objc_msgSend(v4, "directoryMtime");
    if (objc_msgSend(v4, "isDirectoryFault"))
    {
      if (!-[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"))
      {
        brc_bread_crumbs();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[BRCDirectoryItem(FPFSAdditions) updateFromServerItem:].cold.1();

        -[BRCStatInfo setType:](self->super._st, "setType:", 9);
      }
    }
  }

  return v5;
}

- (BOOL)mergeContentsIntoDirectory:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v8;
  BRCPQLConnection *db;
  _QWORD v11[4];
  _QWORD *v12;
  BRCDirectoryItem *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && !v4[25])
  {
    db = self->super._db;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__BRCDirectoryItem_FPFSAdditions__mergeContentsIntoDirectory___block_invoke;
    v11[3] = &unk_24FE41988;
    v12 = v4;
    v13 = self;
    v8 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v11);

  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem(FPFSAdditions) mergeContentsIntoDirectory:].cold.1();

    v8 = 0;
  }

  return v8;
}

uint64_t __62__BRCDirectoryItem_FPFSAdditions__mergeContentsIntoDirectory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 40), "itemGlobalID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

  objc_msgSend(*(id *)(a1 + 40), "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "etag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "ckInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEtagBeforeCrossZoneMove:", v7);

  objc_msgSend(*(id *)(a1 + 32), "signalPropagationToChildren");
  result = objc_msgSend(*(id *)(a1 + 32), "saveToDB");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "_markZombieForCrossZoneMove");
    return objc_msgSend(*(id *)(a1 + 40), "saveToDB");
  }
  return result;
}

- (void)_markZombieForCrossZoneMove
{
  BRCItemGlobalID *previousItemGlobalID;

  -[BRCLocalStatInfo _markZombieForCrossZoneMove](self->super._st, "_markZombieForCrossZoneMove");
  self->super._isUserVisible = 0;
  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = 0;

}

- (void)_insertZombieForCrossZoneMove
{
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  v3 = (id *)-[BRCDirectoryItem copy](self, "copy");
  objc_msgSend(v3, "_restorePreviousGlobalID:", self->_previousItemGlobalID);
  objc_msgSend(v3[9], "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revertEtagsForOldZoneTombstone");

  objc_msgSend(v3, "_markZombieForCrossZoneMove");
  objc_msgSend(v3, "saveToDB");

}

- (void)_crossZoneMoveToParent:(id)a3
{
  BRCItemGlobalID *v4;
  BRCItemGlobalID *previousItemGlobalID;

  -[BRCLocalItem _updateCrossZoneParent:](self, "_updateCrossZoneParent:", a3);
  v4 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
  previousItemGlobalID = self->_previousItemGlobalID;
  self->_previousItemGlobalID = v4;

  -[BRCLocalItem markForceNeedsSyncUp](self, "markForceNeedsSyncUp");
  -[BRCLocalItem saveToDB](self, "saveToDB");
  -[BRCDirectoryItem _insertZombieForCrossZoneMove](self, "_insertZombieForCrossZoneMove");
}

- (BOOL)isDirectory
{
  unsigned int v2;
  void *v4;
  NSObject *v5;

  v2 = -[BRCStatInfo type](self->super._st, "type");
  if (v2 > 0xA || ((1 << v2) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  return 1;
}

- (BOOL)isDirectoryFault
{
  unsigned int v3;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  if ((-[BRCStatInfo type](self->super._st, "type") - 9) < 2u)
    return 1;
  if (!-[BRCLocalItem isFSRoot](self, "isFSRoot"))
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v8, "state") & 0x2000000) == 0;

  return v7;
}

- (BOOL)isDirectoryWithPackageName
{
  unsigned int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  if (v3 > 0xA || ((1 << v3) & 0x611) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem isDirectory].cold.1();

  }
  -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->super._st, "logicalNameWithoutLocalBounce");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "br_isPackageRoot");

  return v8;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  unint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v17, sel_diffAgainstServerItem_, v4);
  if (-[BRCDirectoryItem isDirectoryWithPackageName](self, "isDirectoryWithPackageName"))
  {
    -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logicalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8) & ((v5 & 0x40) != 0);

    v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
    if ((v9 & 1) != 0)
      v5 &= ~0x40uLL;
  }
  else
  {
    v10 = v5 & 0xFFFFFFFFFFFFFFBFLL;
  }
  if (-[BRCDirectoryItem isDirectoryWithPackageName](self, "isDirectoryWithPackageName"))
  {
    -[BRCLocalStatInfo logicalNameWithoutLocalBounce](self->super._st, "logicalNameWithoutLocalBounce");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logicalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) != 0)
    {

      if ((v5 & 0x40) != 0)
        v5 = v10;
    }
    else
    {

    }
  }
  v14 = -[BRCDirectoryItem mtime](self, "mtime");
  if (v14 == objc_msgSend(v4, "directoryMtime"))
    v15 = v5;
  else
    v15 = v5 | 0x4000;

  return v15;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4;
  unint64_t v5;
  BRCItemGlobalID *previousItemGlobalID;
  _QWORD *v7;
  void *v8;
  BRCItemGlobalID *v9;
  BRCItemGlobalID *v10;
  BRCItemGlobalID *v11;
  int v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem diffAgainstLocalItem:](&v14, sel_diffAgainstLocalItem_, v4);
  if ((v5 & 0x4000000000000) == 0)
  {
    previousItemGlobalID = self->_previousItemGlobalID;
    objc_msgSend(v4, "asDirectory");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7[25];
    v9 = previousItemGlobalID;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 0;
    }
    else if (v10)
    {
      v12 = !-[BRCItemGlobalID isEqual:](v9, "isEqual:", v10);
    }
    else
    {
      v12 = 1;
    }

    if (v12)
      v5 |= 0x4000000000000uLL;
  }

  return v5;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  return v3;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  BRCItemGlobalID *v16;
  void *v17;
  objc_super v19;

  v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDirectoryItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v19, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberAtIndex:", 50);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v16 = -[BRCItemGlobalID initWithZoneRowID:itemID:]([BRCItemGlobalID alloc], "initWithZoneRowID:itemID:", v13, v12);
      v17 = (void *)v11[25];
      v11[25] = v16;

    }
    v11[26] = objc_msgSend(v10, "longLongAtIndex:", 37);

  }
  return v11;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCDirectoryItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v13, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
  {
    *((_QWORD *)v7 + 26) = objc_msgSend(v6, "directoryMtime");
    objc_msgSend(v6, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type"))
    {

    }
    else
    {
      objc_msgSend(*((id *)v7 + 1), "notificationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemGlobalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "hasWatcherMatchingGlobalItemID:", v10);

      if ((v11 & 1) == 0)
        objc_msgSend(*((id *)v7 + 9), "setType:", 9);
    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v8, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asDirectory");
    v6 = objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 26) = *(_QWORD *)(v6 + 208);
    objc_storeStrong((id *)v5 + 25, *(id *)(v6 + 200));

  }
  return v5;
}

- (void)updateItemMetadataFromServerItem:(id)a3 appliedSharingPermission:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BRCDirectoryItem;
  v6 = a3;
  -[BRCLocalItem updateItemMetadataFromServerItem:appliedSharingPermission:](&v8, sel_updateItemMetadataFromServerItem_appliedSharingPermission_, v6, v4);
  v7 = objc_msgSend(v6, "directoryMtime", v8.receiver, v8.super_class);

  self->_mtime = v7;
}

- (void)_learnItemID:(id)a3 serverItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem _learnItemID:serverItem:](&v14, sel__learnItemID_serverItem_, v6, v7);
  if (v7)
  {
    -[BRCLocalItem st](self, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setType:", objc_msgSend(v9, "type"));

LABEL_8:
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isDocumentsFolder"))
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    -[BRCLocalItem st](self, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if ((v11 & 0x4000000) != 0)
      v13 = 0;
    else
      v13 = 9;
    objc_msgSend(v12, "setType:", v13);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)isAppLibraryTrashFolder
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE175A0]);

  if (!v4)
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudDocsAppLibrary");

  -[BRCStatInfo parentID](self->super._st, "parentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = objc_msgSend(v7, "isNonDesktopRoot");
  else
    v9 = objc_msgSend(v7, "isDocumentsFolder");
  v10 = v9;

  return v10;
}

- (id)descriptionWithContext:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem descriptionWithContext:](&v7, sel_descriptionWithContext_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (self->_previousItemGlobalID)
    objc_msgSend(v5, "appendFormat:", CFSTR(" prev-glob{%@}"), self->_previousItemGlobalID);
  if (self->_childItemCount)
    objc_msgSend(v5, "appendFormat:", CFSTR(" ch:%@"), self->_childItemCount);
  return v5;
}

- (BOOL)possiblyContainsSharedItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_by_me_count | shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT IFNULL(shared_children_count, 0) | IFNULL(shared_alias_count, 0) FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedByMeOrContainsSharedByMeItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_by_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT shared_children_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)isSharedToMeOrContainsSharedToMeItem
{
  id v3;
  char v4;
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v7;
  id v8;

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT shared_to_me_count, dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  if (!objc_msgSend(v3, "next"))
    goto LABEL_6;
  if ((objc_msgSend(v3, "BOOLAtIndex:", 0) & 1) == 0)
  {
    if (objc_msgSend(v3, "BOOLAtIndex:", 1))
    {
      db = self->super._db;
      itemID = self->super._itemID;
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT shared_alias_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), itemID, v7);

      v4 = objc_msgSend(v8, "BOOLValue");
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = 1;
LABEL_7:

  return v4;
}

- (BOOL)containsOverQuotaItems
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT over_quota_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)containsDirFault
{
  id v4;
  char v5;

  if (-[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"))
    return 1;
  v4 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT dir_faults_count FROM item_recursive_properties WHERE item_rowid = %llu"), self->super._dbRowID);
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)containsPendingUploadOrSyncUp
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->super._db, "numberWithSQL:", CFSTR("SELECT 1 FROM item_recursive_properties WHERE item_rowid = %llu AND (needs_sync_up_count != 0 OR needs_upload_count != 0)"), self->super._dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)containsPendingDeleteDocuments
{
  BRCPQLConnection *db;
  unint64_t dbRowID;
  void *v4;
  id v5;

  db = self->super._db;
  dbRowID = self->super._dbRowID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("WITH RECURSIVE pending_delete_children (item_id, item_type, needs_delete_doc_count) AS(    SELECT item_id, item_type, needs_delete_doc_count FROM item_recursive_properties      WHERE item_rowid = %llu AND needs_delete_doc_count != 0  UNION ALL     SELECT ip.item_id, ip.item_type, ip.needs_delete_doc_count FROM item_recursive_properties AS ip INNER JOIN pending_delete_children AS p WHERE ip.item_parent_id = p.item_id AND ip.zone_rowid = %@ AND ip.needs_delete_doc_count != 0) SELECT 1 FROM pending_delete_children AS pdc WHERE pdc.needs_delete_doc_count != 0 AND pdc.item_type IN (1, 2, 8) LIMIT 1"), dbRowID, v4);

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (void)transformIntoFSRoot
{
  self->super._st->super._type = 4;
}

- (BOOL)hasDeadChildren
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v4;
  id v5;

  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_state = 1 AND item_parent_zone_rowid = %@ LIMIT 1"), itemID, v4);

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (BOOL)hasLiveChildren
{
  void *v3;
  BRCItemID *itemID;
  void *v5;
  void *v6;

  -[BRCClientZone db](self->super._clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_parent_id = %@    AND item_state IN (0)   AND item_parent_zone_rowid = %@ LIMIT 1"), itemID, v5);

  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");
  return (char)v5;
}

- (id)_serverChildItemCount
{
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  void *v5;
  void *v6;
  BRCClientZone *v7;
  BRCItemID *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  BRCDirectoryItem *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  -[BRCLocalItem db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverChildCountWithParentID:db:](clientZone, "serverChildCountWithParentID:db:", itemID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = self->super._clientZone;
    v8 = self->super._itemID;
    -[BRCLocalItem db](self, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone serverHiddenChildCountWithParentID:db:](v7, "serverHiddenChildCountWithParentID:db:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "longLongValue");
    v12 = v11 - objc_msgSend(v10, "longLongValue");
    if (v12 < 0)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v17 = 138413058;
        v18 = v6;
        v19 = 2112;
        v20 = v10;
        v21 = 2112;
        v22 = self;
        v23 = 2112;
        v24 = v13;
        _os_log_fault_impl(&dword_230455000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: server count %@ minus hidden count %@ is less than 0 for %@%@", (uint8_t *)&v17, 0x2Au);
      }

      v12 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)childItemCount
{
  NSNumber *v3;
  void *childItemCount;
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  NSNumber *v7;
  NSNumber *v8;

  if (!self->_childItemCount)
  {
    if (-[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"))
    {
      -[BRCDirectoryItem _serverChildItemCount](self, "_serverChildItemCount");
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      childItemCount = self->_childItemCount;
      self->_childItemCount = v3;
    }
    else
    {
      clientZone = self->super._clientZone;
      itemID = self->super._itemID;
      -[BRCLocalItem db](self, "db");
      childItemCount = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone clientChildCountWithParentID:db:](clientZone, "clientChildCountWithParentID:db:", itemID, childItemCount);
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v8 = self->_childItemCount;
      self->_childItemCount = v7;

    }
  }
  return self->_childItemCount;
}

- (id)serverQuotaUsage
{
  BRCClientZone *clientZone;
  BRCItemID *itemID;
  void *v4;
  void *v5;

  clientZone = self->super._clientZone;
  itemID = self->super._itemID;
  -[BRCLocalItem db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone serverQuotaUsageWithParentID:db:](clientZone, "serverQuotaUsageWithParentID:db:", itemID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clientZonesChildrenNeedingSyncUpAreIn
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v20 = (void *)objc_opt_new();
  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT DISTINCT zone_rowid FROM client_items WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@    AND item_localsyncupstate = 4   AND item_state IN (0, 1)"), itemID, v5);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "enumerateObjectsOfClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[BRCAccountSessionFPFS serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v20, "addObject:", v13);
        }
        else
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v11;
            v27 = 2112;
            v28 = v14;
            _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find clientZone for zoneID %@%@", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v20, "count"))
    v16 = v20;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (void)_retryPostponedIfNeededForDiffs:(unint64_t)a3
{
  int v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  if (-[BRCLocalItem isDead](self, "isDead"))
  {
    if (-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
      return;
LABEL_8:
    -[BRCAccountSessionFPFS applyScheduler](self->super._session, "applyScheduler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCreateMissingParentID:zone:", self->super._itemID, self->super._serverZone);

    return;
  }
  if (v3 < 0)
    goto LABEL_8;
  if (-[BRCLocalItem isOnDisk](self, "isOnDisk"))
  {
    -[BRCLocalItem orig](self, "orig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isOnDisk");

    if ((v6 & 1) == 0)
    {
      if (-[BRCLocalItem isKnownByServerOrInFlight](self, "isKnownByServerOrInFlight"))
        goto LABEL_8;
    }
  }
}

- (BOOL)_repopulateRecursivePropertiesIfNecessary
{
  BRCPQLConnection *db;
  BRCItemID *itemID;
  void *v5;
  id v6;
  BOOL v7;

  db = self->super._db;
  itemID = self->super._itemID;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT SUM(dir_faults_count), SUM(uploaded_size), SUM(needs_upload_size), SUM(uploaded_count), SUM(needs_upload_count), SUM(synced_up_count), SUM(needs_sync_up_count), SUM(over_quota_count), SUM(shared_by_me_count), SUM(shared_to_me_count), SUM(needs_delete_doc_count) FROM item_recursive_properties WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@"), itemID, v5);

  if (objc_msgSend(v6, "next"))
    v7 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET  dir_faults_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu "), objc_msgSend(v6, "unsignedLongLongAtIndex:", 0)+ -[BRCDirectoryItem isDirectoryFault](self, "isDirectoryFault"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 1), objc_msgSend(v6, "unsignedLongLongAtIndex:", 2), objc_msgSend(v6, "unsignedLongLongAtIndex:", 3), objc_msgSend(v6, "unsignedLongLongAtIndex:", 4), objc_msgSend(v6, "unsignedLongLongAtIndex:", 5), objc_msgSend(v6, "unsignedLongLongAtIndex:", 6), objc_msgSend(v6, "unsignedLongLongAtIndex:", 7), objc_msgSend(v6, "unsignedLongLongAtIndex:", 8)+ -[BRCDirectoryItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 9)+ -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"), objc_msgSend(v6, "unsignedLongLongAtIndex:", 10), self->super._dbRowID);
  else
    v7 = 1;

  return v7;
}

- (BOOL)_insertRecursiveProperties
{
  void *v3;
  void *v4;
  int v5;
  BRCPQLConnection *db;
  unint64_t dbRowID;
  BRCItemID *itemID;
  int v9;
  void *v10;
  BOOL v11;

  -[BRCStatInfo parentID](self->super._st, "parentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCItemID isDocumentsFolder](self->super._itemID, "isDocumentsFolder")
    || (-[BRCLocalStatInfo logicalName](self->super._st, "logicalName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE175A0]),
        v4,
        v5))
  {

    v3 = 0;
  }
  db = self->super._db;
  dbRowID = self->super._dbRowID;
  itemID = self->super._itemID;
  v9 = -[BRCStatInfo type](self->super._st, "type");
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(db) = -[BRCPQLConnection execute:](db, "execute:", CFSTR("INSERT OR REPLACE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid) VALUES (%llu, %@, %@, %u, %@, %@)"), dbRowID, itemID, v3, v9, v10, self->super._parentZoneRowID);

  if ((_DWORD)db)
    v11 = -[BRCDirectoryItem _repopulateRecursivePropertiesIfNecessary](self, "_repopulateRecursivePropertiesIfNecessary");
  else
    v11 = 0;

  return v11;
}

- (BOOL)_updateRecursiveProperties
{
  int v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  unsigned int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int sharingOptions;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v22;
  NSObject *v23;

  v3 = -[BRCStatInfo type](self->super._st, "type");
  -[BRCLocalItem st](self->super._orig, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v3 == v5)
  {
    v6 = 1;
    goto LABEL_17;
  }
  if ((-[BRCStatInfo type](self->super._st, "type") - 9) <= 1u)
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (!v8)
    {
      v11 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count + 1 WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
      goto LABEL_16;
    }
  }
  if (!-[BRCStatInfo type](self->super._st, "type"))
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_msgSend(v9, "type") - 9);

    if (v10 <= 1)
    {
      v11 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d, dir_faults_count = dir_faults_count - 1 WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
LABEL_16:
      v6 = v11;
      goto LABEL_17;
    }
  }
  v6 = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET item_type = %d WHERE item_rowid = %llu"), -[BRCStatInfo type](self->super._st, "type"), self->super._dbRowID);
  if (-[BRCStatInfo type](self->super._st, "type") == 4)
    goto LABEL_17;
  -[BRCLocalItem st](self->super._orig, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "type") != 4)
  {
    -[BRCLocalItem st](self->super._orig, "st");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if (v14 == 10)
      goto LABEL_17;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem _updateRecursiveProperties].cold.2();

  }
LABEL_17:
  sharingOptions = self->super._sharingOptions;
  if (((-[BRCLocalItem sharingOptions](self->super._orig, "sharingOptions") ^ sharingOptions) & 4) != 0)
  {
    if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem createSyncUpJob].cold.7();

    }
    if ((self->super._sharingOptions & 4) != 0)
    {
      if (-[BRCServerZone isSharedZone](self->super._serverZone, "isSharedZone"))
        v20 = "shared_to_me_count = shared_to_me_count + 1";
      else
        v20 = "shared_by_me_count = shared_by_me_count + 1";
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v20, 43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        LOBYTE(v6) = 0;
        goto LABEL_31;
      }
    }
    else
    {
      -[BRCLocalItem serverZone](self->super._orig, "serverZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isSharedZone"))
        v18 = "shared_to_me_count = shared_to_me_count - 1";
      else
        v18 = "shared_by_me_count = shared_by_me_count - 1";
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v18, 43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_31;
    }
    LOBYTE(v6) = -[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("UPDATE item_recursive_properties SET %@ WHERE item_rowid = %llu"), v19, self->super._dbRowID);
LABEL_31:

  }
  return v6;
}

- (BOOL)_recomputeChildItemCount
{
  BRCPQLConnection *db;
  void *v4;
  void *v5;

  db = self->super._db;
  -[BRCLocalItem itemID](self, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(db) = -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE client_items AS parent SET visible_child_count = (SELECT COUNT(*) FROM client_items AS child WHERE child.item_parent_id = parent.item_id AND child.item_parent_zone_rowid = parent.zone_rowid AND (child.item_user_visible = 1 OR (child.item_scope == 3 AND child.item_filename != \".Trash\"))) WHERE parent.item_id = %@ AND parent.zone_rowid = %@"), v4, v5);

  return (char)db;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  const __CFString *v20;
  void *v21;
  unint64_t sharingOptions;
  int64_t v23;
  void *v24;
  int64_t v25;
  int v26;
  int64_t v27;
  int v28;
  int v29;
  BRCUserRowID *ownerKey;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  BRCItemID *itemID;
  int64_t mtime;
  int v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;

  v47 = a3;
  -[BRCDirectoryItem _retryPostponedIfNeededForDiffs:](self, "_retryPostponedIfNeededForDiffs:", 0xFF003FF3FF7FFFLL);
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  mtime = self->_mtime;
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "dbRowID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[BRCStatInfo state](self->super._st, "state");
  v26 = -[BRCStatInfo type](self->super._st, "type");
  v28 = -[BRCStatInfo mode](self->super._st, "mode");
  v27 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v25 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v23 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v20 = logicalName;
  v19 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v12 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v47, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, version_mtime, visible_child_count, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier) VALUES(%lld, %@, %lld, 0, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@)"), a4, v46, mtime, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v45, minimumSupportedOSRowID, isUserVisible, v44, v29,
          v26,
          v28,
          v27,
          v25,
          v23,
          v43,
          v20,
          v19,
          v24,
          v21,
          v18,
          v17,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v16,
          v13);

  v14 = v40
     && (v48.receiver = self,
         v48.super_class = (Class)BRCDirectoryItem,
         -[BRCLocalItem _insertInDB:dbRowID:](&v48, sel__insertInDB_dbRowID_, v47, a4))
     && -[BRCDirectoryItem _insertRecursiveProperties](self, "_insertRecursiveProperties")
     && -[BRCDirectoryItem _recomputeChildItemCount](self, "_recomputeChildItemCount");

  return v14;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6;
  BRCItemGlobalID *previousItemGlobalID;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  BRCItemID *itemID;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  BRCDirectoryItem *v34;
  NSObject *v35;
  void *v36;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  unint64_t v45;
  void *v46;
  _BOOL4 v47;
  BOOL v48;
  void *v50;
  BRCItemID *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  const __CFString *v62;
  void *v63;
  int64_t v64;
  void *v65;
  unint64_t sharingOptions;
  int64_t v67;
  int64_t v68;
  int v69;
  int v70;
  int v71;
  BRFieldCKInfo *sideCarCKInfo;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRCUserRowID *ownerKey;
  BRCItemID *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id obj;
  id obja;
  objc_super v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t v95[128];
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  BRCItemID *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((a4 & 0x80000000) != 0
    && (previousItemGlobalID = self->_previousItemGlobalID,
        -[BRCLocalItem itemGlobalID](self->super._orig, "itemGlobalID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(previousItemGlobalID) = -[BRCItemGlobalID isEqualToItemGlobalID:](previousItemGlobalID, "isEqualToItemGlobalID:", v8), v8, (previousItemGlobalID & 1) == 0))
  {
    if ((objc_msgSend(v6, "isBatchSuspended") & 1) == 0)
    {
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        -[BRCDirectoryItem _updateInDB:diffs:].cold.1();

    }
    itemID = self->super._itemID;
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self->super._orig, "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items   SET item_parent_id = %@,       item_parent_zone_rowid = %@ WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@"), itemID, v16, v17, v18);

    v19 = objc_msgSend(v6, "changes");
    if (v19 >= 1)
    {
      v20 = v19;
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        -[BRCLocalItem itemID](self->super._orig, "itemID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = self->super._itemID;
        *(_DWORD *)buf = 134218754;
        v97 = v20;
        v98 = 2112;
        v99 = v50;
        v100 = 2112;
        v101 = v51;
        v102 = 2112;
        v103 = v21;
        _os_log_debug_impl(&dword_230455000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items from parent %@ to %@%@", buf, 0x2Au);

      }
    }
  }
  else
  {
    v9 = 1;
  }
  if ((a4 & 0x4000000000000) != 0)
  {
    -[BRCItemGlobalID itemID](self->_previousItemGlobalID, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCItemGlobalID zoneRowID](self->_previousItemGlobalID, "zoneRowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items   SET version_old_zone_item_id = %@,       version_old_zone_rowid = %@ WHERE rowid = %llu"), v10, v11, self->super._dbRowID);

    if ((v12 & 1) == 0)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
  }
  else if (!v9)
  {
    goto LABEL_17;
  }
  if (-[BRCLocalItem isAlmostDead](self, "isAlmostDead"))
  {
    -[BRCLocalItem orig](self, "orig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isAlmostDead");

    if ((v14 & 1) == 0)
    {
      if ((objc_msgSend(v6, "isBatchSuspended") & 1) == 0)
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
          -[BRCDirectoryItem _updateInDB:diffs:].cold.1();

      }
      v57 = a4;
      v86 = v6;
      -[BRCClientZone db](self->super._clientZone, "db");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem itemID](self, "itemID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "fetch:", CFSTR("SELECT si.rowid FROM server_items AS si INNER JOIN client_unapplied_table AS ap ON si.item_rank = ap.throttle_id WHERE si.item_parent_id = %@   AND si.zone_rowid = %@   AND si.item_type = 3   AND ap.throttle_state = 24"), v25, v26);

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v84 = v27;
      objc_msgSend(v27, "enumerateObjectsOfClass:", objc_opt_class());
      obj = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v92;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v92 != v30)
              objc_enumerationMutation(obj);
            -[BRCClientZone serverItemByRowID:](self->super._clientZone, "serverItemByRowID:", objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v31), "longLongValue"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v34 = self;
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v97 = (uint64_t)v32;
              v98 = 2112;
              v99 = v33;
              _os_log_debug_impl(&dword_230455000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting tombstone for alias %@ which is pending target%@", buf, 0x16u);
            }

            v36 = (void *)objc_msgSend(v32, "newLocalItemWithServerZone:dbRowID:", v34->super._serverZone, 0);
            objc_msgSend(v36, "markDead");
            objc_msgSend(v36, "markForceNeedsSyncUp");
            objc_msgSend(v36, "saveToDB");

            ++v31;
            self = v34;
          }
          while (v29 != v31);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
        }
        while (v29);
      }

      -[BRCDirectoryItem signalPropagationToChildren](self, "signalPropagationToChildren");
      a4 = v57;
      -[BRCDirectoryItem _retryPostponedIfNeededForDiffs:](self, "_retryPostponedIfNeededForDiffs:", v57);
      v6 = v86;
      goto LABEL_33;
    }
  }
  LOBYTE(v9) = 1;
LABEL_17:
  v23 = -[BRCLocalItem isLive](self, "isLive");
  if ((a4 & 0x40001040000060) != 0 && v23)
    -[BRCDirectoryItem signalPropagationToChildren](self, "signalPropagationToChildren");
  -[BRCDirectoryItem _retryPostponedIfNeededForDiffs:](self, "_retryPostponedIfNeededForDiffs:", a4);
  if ((v9 & 1) == 0)
  {
LABEL_43:
    v48 = 0;
    goto LABEL_45;
  }
LABEL_33:
  v58 = a4;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v80 = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "dbRowID");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[BRCStatInfo state](self->super._st, "state");
  v70 = -[BRCStatInfo type](self->super._st, "type");
  v69 = -[BRCStatInfo mode](self->super._st, "mode");
  v68 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v67 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v64 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v62 = logicalName;
  v61 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v45 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v56 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items SET zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@, version_mtime = %lld  WHERE rowid = %llu"), obja, v80, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v87, minimumSupportedOSRowID, isUserVisible, v85, v71, v70, v69,
          v68,
          v67,
          v64,
          v83,
          v62,
          v61,
          v65,
          v63,
          v60,
          v39,
          v40,
          v41,
          v42,
          v43,
          v56,
          v45,
          v59,
          v46,
          self->_mtime,
          self->super._dbRowID);

  if (!v81)
  {
    v48 = 0;
    goto LABEL_45;
  }
  v90.receiver = self;
  v90.super_class = (Class)BRCDirectoryItem;
  if (!-[BRCLocalItem _updateInDB:diffs:](&v90, sel__updateInDB_diffs_, v6, v58))
    goto LABEL_43;
  v47 = -[BRCDirectoryItem _updateRecursiveProperties](self, "_updateRecursiveProperties");
  v48 = (v58 & 0x80000000) == 0 && v47;
  if ((v58 & 0x80000000) != 0 && v47)
    v48 = -[BRCDirectoryItem _recomputeChildItemCount](self, "_recomputeChildItemCount");
LABEL_45:

  return v48;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BRCItemID *itemID;
  void *v12;
  BOOL v13;
  objc_super v15;
  _QWORD v16[4];
  BOOL v17;

  v4 = a4;
  v6 = a3;
  v7 = -[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem")
    || -[BRCLocalItem isSharedToMeChildItem](self, "isSharedToMeChildItem");
  if (self->_needsDeleteForItemIDTransfer)
  {
    if ((-[BRCPQLConnection isInTransaction](self->super._db, "isInTransaction") & 1) == 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRCDirectoryItem _deleteFromDB:keepAliases:].cold.1();

    }
  }
  else
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke;
    v16[3] = &__block_descriptor_33_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    v17 = v7;
    v10 = (void *)MEMORY[0x2348BA0DC](v16);
    itemID = self->super._itemID;
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(itemID) = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items SET item_parent_id = call_block(%@, item_state, app_library_rowid, zone_rowid, rowid),     item_localname = call_block(%@) WHERE item_parent_id = %@   AND item_parent_zone_rowid = %@"), v10, &__block_literal_global_58, itemID, v12);

    if ((itemID & 1) == 0)
    {
      v13 = 0;
      goto LABEL_11;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)BRCDirectoryItem;
  v13 = -[BRCLocalItem _deleteFromDB:keepAliases:](&v15, sel__deleteFromDB_keepAliases_, v6, v4);
LABEL_11:

  return v13;
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  char v13;
  int v14;

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2((uint64_t)a4, (uint64_t)v7, v8);

  if (sqlite3_value_int(*a4) != 1)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1();

  }
  if (*(_BYTE *)(a1 + 32))
    v9 = 5;
  else
    v9 = 1;
  v10 = 2;
  if (!*(_BYTE *)(a1 + 32))
    v10 = 1;
  v13 = v9;
  v14 = sqlite3_value_int(a4[v10]);
  sqlite3_result_blob(a2, &v13, 5, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_87(uint64_t a1, sqlite3_context *a2)
{
  _BYTE v3[37];
  uuid_t out;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, sizeof(out));
  memset(v3, 0, sizeof(v3));
  uuid_generate_random(out);
  uuid_unparse(out, v3);
  sqlite3_result_text(a2, v3, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)prepareForSyncUpInZone:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCDirectoryItem;
  v4 = a3;
  -[BRCLocalItem prepareForSyncUpInZone:](&v6, sel_prepareForSyncUpInZone_, v4);
  objc_msgSend(v4, "clientZone", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "prepareDirectoryForSyncUp:", self);
}

- (BOOL)isShareableItem
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  char v10;

  if ((self->super._sharingOptions & 4) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  if (!-[BRCItemID isDocumentsFolder](self->super._itemID, "isDocumentsFolder"))
  {
    -[BRCLocalItem clientZone](self, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCloudDocsZone"))
    {
      -[BRCLocalItem st](self, "st");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isNonDesktopRoot") & 1) != 0)
      {
        -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE17568]) & 1) != 0)
        {

          LOBYTE(v3) = 0;
LABEL_12:

          return v3;
        }
        -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17578]);

        if ((v10 & 1) != 0)
          goto LABEL_3;
LABEL_11:
        -[BRCLocalItem appLibrary](self, "appLibrary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mangledID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "isBlacklistedFromFolderSharing") ^ 1;
        goto LABEL_12;
      }

    }
    goto LABEL_11;
  }
LABEL_3:
  LOBYTE(v3) = 0;
  return v3;
}

- (id)asShareableItem
{
  BRCDirectoryItem *v3;
  void *v4;
  NSObject *v5;

  if (-[BRCDirectoryItem isShareableItem](self, "isShareableItem"))
  {
    v3 = self;
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDirectoryItem asShareableItem].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)collaborationIdentifierIfComputable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[BRCDirectoryItem isShareableItem](self, "isShareableItem"))
  {
    v3 = objc_alloc(MEMORY[0x24BDB91E8]);
    -[BRCDirectoryItem asShareableItem](self, "asShareableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initShareIDWithShareableItem:", v4);

    -[BRCLocalItem session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedCurrentUserRecordNameIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)markNeedsDeleteForItemIDTransfer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCDirectoryItem;
  -[BRCLocalItem markNeedsDeleteForItemIDTransfer](&v3, sel_markNeedsDeleteForItemIDTransfer);
  self->_needsDeleteForItemIDTransfer = 1;
}

- (BOOL)isCrossZoneMoveTombstone
{
  _QWORD *v3;
  char v4;
  void *v5;

  -[BRCLocalItem asDirectory](self->super._orig, "asDirectory");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (-[BRCLocalItem isDead](self, "isDead") && (objc_msgSend(v3, "isDead") & 1) == 0)
  {
    -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToItemGlobalID:", v3[25]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_mtime = a3;
}

- (BRCItemGlobalID)previousItemGlobalID
{
  return self->_previousItemGlobalID;
}

- (void)isDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(_st.type)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecursiveProperties
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_FS_ROOT || _orig.st.type == BRC_ITEM_TYPE_DIRECTORY_SHARE_ACCEPT_FAULT%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateInDB:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [db isBatchSuspended]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_deleteFromDB:keepAliases:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _db.isInTransaction%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: sqlite3_value_int(argv[0]) == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __46__BRCDirectoryItem__deleteFromDB_keepAliases___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = sqlite3_value_int(*(sqlite3_value **)(a1 + 24));
  v6[0] = 67109378;
  v6[1] = v5;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] _deleteFromDB: Updating item parent id for item rowid: %d%@", (uint8_t *)v6, 0x12u);
}

- (void)asShareableItem
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asShareableItem called on a non-shareable item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
