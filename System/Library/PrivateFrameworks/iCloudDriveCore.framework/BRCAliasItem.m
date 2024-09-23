@implementation BRCAliasItem

+ (id)targetReferenceWithItemID:(id)a3 targetZone:(id)a4 isFolderShare:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v10 = CFSTR("directory/");
  }
  else
  {
    v11 = objc_msgSend(v8, "isSharedZone");
    v10 = CFSTR("documentStructure/");
    if (v11)
      v10 = CFSTR("documentContent/");
  }
  v12 = v10;
  objc_msgSend(v7, "itemIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v14, v9);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v15, 0);

  return v16;
}

+ (void)fillStructureRecord:(id)a3 inZone:(id)a4 itemID:(id)a5 ckInfo:(id)a6 parentID:(id)a7 targetItemID:(id)a8 targetZone:(id)a9 diffs:(unint64_t)a10 isFolderShare:(BOOL)a11 beingDeadInServerTruth:(BOOL)a12 shouldPCSChainStatus:(unsigned __int8)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;

  v33 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (a12)
  {
    v24 = 1;
  }
  else
  {
    objc_msgSend(v20, "etag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v25 == 0;

  }
  if ((a13 & 0x2C) != 0 || (a10 & 0x20) != 0 || v24)
  {
    objc_msgSend(v21, "validatingDirectoryReferenceInZone:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v26, CFSTR("parent"));

    if ((a13 & 0x3C) != 0)
    {
      objc_msgSend(v21, "pcsChainParentReferenceInZone:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setParent:", v27);

    }
  }
  if (v24)
  {
    if (objc_msgSend(v23, "isPrivateZone"))
      v28 = v22;
    else
      v28 = v19;
    objc_msgSend(v28, "itemIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "brc_SHA256");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v30, CFSTR("basehash"));

    objc_msgSend(a1, "targetReferenceWithItemID:targetZone:isFolderShare:", v22, v23, a11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v31, CFSTR("target"));

  }
  if (!a12)
    objc_msgSend(v33, "serializeSystemFields:", v20);

}

- (id)structureRecordBeingDeadInServerTruth:(BOOL)a3 stageID:(id)a4 shouldPCSChainStatus:(unsigned __int8)a5
{
  void *v6;
  void *v7;
  BRCServerZone *serverZone;
  BRCItemID *itemID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  -[BRCLocalItem baseStructureRecord](self, "baseStructureRecord", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  serverZone = self->super._serverZone;
  itemID = self->super._itemID;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAliasItem targetItemID](self, "targetItemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAliasItem targetClientZone](self, "targetClientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serverZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v16) = a5;
  BYTE1(v16) = a3;
  LOBYTE(v16) = 0;
  objc_msgSend(v7, "fillStructureRecord:inZone:itemID:ckInfo:parentID:targetItemID:targetZone:diffs:isFolderShare:beingDeadInServerTruth:shouldPCSChainStatus:", v6, serverZone, itemID, v10, v11, v12, v14, self->super._localDiffs | -[BRCLocalItem diffAgainstOriginalItem](self, "diffAgainstOriginalItem"), v16);

  return v6;
}

- (BOOL)isBRAlias
{
  void *v3;
  NSObject *v4;

  if (-[BRCStatInfo type](self->super._st, "type") != 3)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCAliasItem isBRAlias].cold.1((uint64_t)v3, v4);

  }
  return 1;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  const __CFString *v20;
  int v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int v25;
  int v26;
  void *v27;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_super v46;

  v45 = a3;
  -[BRCServerZone dbRowID](self->super._serverZone, "dbRowID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dbRowID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[BRCStatInfo state](self->super._st, "state");
  v21 = -[BRCStatInfo type](self->super._st, "type");
  v25 = -[BRCStatInfo mode](self->super._st, "mode");
  v24 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v23 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v22 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v20 = logicalName;
  v7 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v13 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@)"), a4, v27, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v43, minimumSupportedOSRowID, isUserVisible, v44, v26, v21,
                       v25,
                       v24,
                       v23,
                       v22,
                       v42,
                       v20,
                       v7,
                       v8,
                       v41,
                       v40,
                       v19,
                       v18,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15))
  {
    v46.receiver = self;
    v46.super_class = (Class)BRCAliasItem;
    v16 = -[BRCLocalItem _insertInDB:dbRowID:](&v46, sel__insertInDB_dbRowID_, v45, a4);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  int64_t v5;
  void *v6;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  BRFieldCKInfo *sideCarCKInfo;
  int v28;
  int v29;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t sharingOptions;
  unint64_t notifsRank;
  uint64_t syncUpState;
  id v35;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v35 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dbRowID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[BRCStatInfo state](self->super._st, "state");
  v29 = -[BRCStatInfo type](self->super._st, "type");
  v28 = -[BRCStatInfo mode](self->super._st, "mode");
  v5 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v26 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v25 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v23 = logicalName;
  v21 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v13 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@  WHERE rowid = %llu"), v45, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v44, minimumSupportedOSRowID, isUserVisible, v43, v19, v29, v28,
                       v5,
                       v26,
                       v25,
                       v6,
                       v23,
                       v21,
                       v42,
                       v41,
                       v24,
                       v22,
                       v20,
                       v9,
                       v10,
                       v11,
                       v12,
                       v13,
                       v14,
                       v15,
                       self->super._dbRowID))
  {
    v46.receiver = self;
    v46.super_class = (Class)BRCAliasItem;
    v16 = -[BRCLocalItem _updateInDB:diffs:](&v46, sel__updateInDB_diffs_, v35, a4);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BRCClientZone)targetClientZone
{
  BRCAccountSessionFPFS *session;
  void *v3;
  void *v4;

  session = self->super._session;
  -[BRCStatInfo _aliasTargetMangledID](self->super._st, "_aliasTargetMangledID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientZoneByMangledID:](session, "clientZoneByMangledID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCClientZone *)v4;
}

- (BRCItemID)targetItemID
{
  return (BRCItemID *)-[BRCStatInfo _aliasTargetItemID](self->super._st, "_aliasTargetItemID");
}

- (void)markNeedsUploadOrSyncingUp
{
  -[BRCAliasItem markNeedsUploadOrSyncingUpWithAliasTarget:](self, "markNeedsUploadOrSyncingUpWithAliasTarget:", 0);
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;

  self->super._localDiffs = 0;
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCAliasItem markLatestSyncRequestRejectedInZone:].cold.1((uint64_t)v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)BRCAliasItem;
  -[BRCLocalItem markLatestSyncRequestRejectedInZone:](&v7, sel_markLatestSyncRequestRejectedInZone_, v4);

}

- (void)isBRAlias
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _st.type == BRC_ITEM_TYPE_ALIAS%@", (uint8_t *)&v2, 0xCu);
}

- (void)markLatestSyncRequestRejectedInZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing rejection of alias item%@", (uint8_t *)&v2, 0xCu);
}

@end
