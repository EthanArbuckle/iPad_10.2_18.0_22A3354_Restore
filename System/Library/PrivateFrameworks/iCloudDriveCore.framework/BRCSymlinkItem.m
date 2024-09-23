@implementation BRCSymlinkItem

- (id)_initWithImportObject:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCSymlinkItem;
  v7 = -[BRCLocalItem _initWithImportObject:error:](&v11, sel__initWithImportObject_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "symlinkContent");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[25];
    v7[25] = v8;

  }
  return v7;
}

- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  NSString *v9;
  NSString *symlinkTarget;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "symlinkContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "symlinkContent");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    symlinkTarget = self->_symlinkTarget;
    self->_symlinkTarget = v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        v16 = 136315906;
        v17 = "-[BRCSymlinkItem(FPFSAdditions) updateWithImportObject:onlyContentDependentProperties:error:]";
        v18 = 2080;
        if (!a5)
          v15 = "(ignored by caller)";
        v19 = v15;
        v20 = 2112;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v16, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v11);

  }
  return v8 != 0;
}

- (BOOL)isSymLink
{
  return 1;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCSymlinkItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v11, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "symlinkTarget");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[25];
    v7[25] = v8;

  }
  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v10, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asSymlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "symlinkTarget");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[25];
    v5[25] = v7;

  }
  return v5;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCSymlinkItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v15, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 35);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v11[25];
    v11[25] = v12;

  }
  return v11;
}

- (id)descriptionWithContext:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCSymlinkItem;
  -[BRCLocalItem descriptionWithContext:](&v7, sel_descriptionWithContext_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_obfuscatedPath](self->_symlinkTarget, "fp_obfuscatedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" target:'%@'"), v5);

  return v4;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  NSString *symlinkTarget;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v21, sel_diffAgainstServerItem_, v4);
  if (v4 && (objc_msgSend(v4, "isSymLink") & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCSymlinkItem diffAgainstServerItem:].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  if (objc_msgSend(v4, "isSymLink") && (v5 & 0x2000) == 0)
  {
    symlinkTarget = self->_symlinkTarget;
    objc_msgSend(v4, "symlinkTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = symlinkTarget;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 0;
    }
    else if (v9)
    {
      v11 = -[NSString isEqual:](v8, "isEqual:", v9) ^ 1;
    }
    else
    {
      v11 = 1;
    }

    if (v11)
      v5 |= 0x2000uLL;
  }

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSString *symlinkTarget;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  int v13;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCSymlinkItem;
  v5 = -[BRCLocalItem diffAgainstLocalItem:](&v23, sel_diffAgainstLocalItem_, v4);
  if (v4 && (objc_msgSend(v4, "isSymLink") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCSymlinkItem diffAgainstServerItem:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  if (objc_msgSend(v4, "isSymLink"))
  {
    objc_msgSend(v4, "asSymlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 0x2000) == 0)
    {
      symlinkTarget = self->_symlinkTarget;
      objc_msgSend(v6, "symlinkTarget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = symlinkTarget;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v13 = 0;
      }
      else if (v11)
      {
        v13 = -[NSString isEqual:](v10, "isEqual:", v11) ^ 1;
      }
      else
      {
        v13 = 1;
      }

      if (v13)
        v5 |= 0x2000uLL;
    }

  }
  else
  {
    v5 |= 0x2000uLL;
  }

  return v5;
}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int64_t v24;
  int v25;
  int64_t v26;
  int64_t v27;
  int v28;
  int v29;
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
  int v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  objc_super v49;

  v48 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
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
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[BRCStatInfo state](self->super._st, "state");
  v28 = -[BRCStatInfo type](self->super._st, "type");
  v25 = -[BRCStatInfo mode](self->super._st, "mode");
  v27 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v26 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v24 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v22 = logicalName;
  v20 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v13 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSymlinkItem symlinkTarget](self, "symlinkTarget");
  v18 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v48, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@, %@)"), a4, v47, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v46, minimumSupportedOSRowID, isUserVisible, v44, v29, v28,
          v25,
          v27,
          v26,
          v24,
          v45,
          v22,
          v20,
          v43,
          v23,
          v21,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v18,
          v19,
          v14,
          v15);

  if (v40)
  {
    v49.receiver = self;
    v49.super_class = (Class)BRCSymlinkItem;
    v16 = -[BRCLocalItem _insertInDB:dbRowID:](&v49, sel__insertInDB_dbRowID_, v48, a4);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
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
  void *v14;
  BOOL v15;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  const __CFString *v22;
  void *v23;
  int64_t v24;
  int64_t v25;
  int v26;
  int64_t v27;
  int v28;
  unint64_t sharingOptions;
  int v30;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;

  v47 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
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
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[BRCStatInfo state](self->super._st, "state");
  v28 = -[BRCStatInfo type](self->super._st, "type");
  v26 = -[BRCStatInfo mode](self->super._st, "mode");
  v27 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v25 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v24 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v22 = logicalName;
  v21 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
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
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSymlinkItem symlinkTarget](self, "symlinkTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v47, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@, version_name = %@  WHERE rowid = %llu"), v46, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v44, minimumSupportedOSRowID, isUserVisible, v45, v30, v28, v26,
          v27,
          v25,
          v24,
          v42,
          v22,
          v21,
          v43,
          v23,
          v20,
          v19,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12,
          v18,
          v13,
          v14,
          self->super._dbRowID);

  if (v40)
  {
    v48.receiver = self;
    v48.super_class = (Class)BRCSymlinkItem;
    v15 = -[BRCLocalItem _updateInDB:diffs:](&v48, sel__updateInDB_diffs_, v47, a4);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateSymlinkTarget:(id)a3
{
  objc_storeStrong((id *)&self->_symlinkTarget, a3);
}

- (NSString)symlinkTarget
{
  return self->_symlinkTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symlinkTarget, 0);
}

- (void)diffAgainstServerItem:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !info || info.isSymLink%@", a5, a6, a7, a8, 2u);
}

@end
