@implementation BRCServerChangesApplyUtil_Private

+ (BOOL)itemUndergoingCZMToAnotherZone:(id)a3 si:(id)a4 clientZone:(id)a5 rank:(int64_t)a6 scheduler:(id)a7 zone:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int64_t v29;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = objc_msgSend(v13, "isDocument");
  v18 = 0;
  if (!a3 && v17)
  {
    v29 = a6;
    objc_msgSend(v14, "db");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dbRowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v19, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE version_old_zone_item_id = %@ AND version_old_zone_rowid = %@"), v20, v22);
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:].cold.1();

      objc_msgSend(v16, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setState:forRank:zoneRowID:", 17, v29, v27);

      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)appLibraryUndergoingCZM:(id)a3 zone:(id)a4 rank:(int64_t)a5 parentID:(id)a6 scheduler:(id)a7 session:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  void *v29;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (a3)
    goto LABEL_10;
  if (!objc_msgSend(v14, "isNonDesktopRoot"))
    goto LABEL_10;
  if (!objc_msgSend(v13, "isCloudDocsZone"))
    goto LABEL_10;
  objc_msgSend(v14, "appLibraryRowID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asPrivateClientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultAppLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dbRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v29, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v14, "appLibraryRowID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appLibraryByRowID:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v23, "state") & 0x200000) != 0)
  {

LABEL_10:
    v27 = 0;
    goto LABEL_11;
  }
  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:].cold.1();

  objc_msgSend(v13, "dbRowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setState:forRank:zoneRowID:", 27, a5, v26);

  v27 = 1;
LABEL_11:

  return v27;
}

+ (BOOL)_handleApplyingDeletedUnlistedDirectoryIfNecessary:(id)a3 localItem:(id)a4 parent:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "isDead");
  v11 = 0;
  if (v8 || !v10)
    goto LABEL_12;
  objc_msgSend(v9, "st");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ckInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasDeletionChangeToken") & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v7, "clientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToClientZone:", v15);

  if (!v16)
  {
LABEL_11:
    v11 = 0;
    v8 = 0;
    goto LABEL_12;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v29 = 138412802;
    v30 = v7;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v17;
    _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] New item %@ older than a deleted directory %@ so marking dead%@", (uint8_t *)&v29, 0x20u);
  }

  objc_msgSend(v7, "serverZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "newLocalItemWithServerZone:dbRowID:", v19, objc_msgSend(0, "dbRowID"));

  objc_msgSend(v8, "markDead");
  objc_msgSend(v9, "st");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ckInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deletionChangeToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isDocument"))
  {
    objc_msgSend(v8, "asDocument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ckInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeletionChangeToken:", v22);

  }
  objc_msgSend(v8, "st");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ckInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDeletionChangeToken:", v22);

  objc_msgSend(v8, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v8, "saveToDB");

  v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)serverItemWouldBeParentedToDeadFolder:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t)a8
{
  char v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v8 = a8;
  v42 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (v14 && (v8 & 0x20) == 0 || !objc_msgSend(v15, "isLive"))
    goto LABEL_8;
  objc_msgSend(v15, "parentLocalItemOnFS");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    if ((objc_msgSend(a1, "_handleApplyingDeletedUnlistedDirectoryIfNecessary:localItem:parent:", v15, v14, 0) & 1) == 0)
    {
      if (objc_msgSend(v15, "shouldBeGreedyForApply"))
      {
        objc_msgSend(v15, "clientZone");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "parentItemIDOnFS");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "serverItemByItemID:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:].cold.1();

          objc_msgSend(v17, "dbRowID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setState:forRank:zoneRowID:", 16, a5, v31);

          objc_msgSend(v15, "parentZoneOnFS");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "clientZone");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "parentItemIDOnFS");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v32, "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v33, 0);

          goto LABEL_14;
        }
      }
LABEL_12:
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" parent = %@"), v19);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = &stru_24FE4A790;
        }
        *(_DWORD *)buf = 134218498;
        v37 = a5;
        v38 = 2112;
        v39 = v35;
        v40 = 2112;
        v41 = v25;
        _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent)%@%@", buf, 0x20u);
        if (v19)

      }
      objc_msgSend(v17, "dbRowID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setState:forRank:zoneRowID:", 21, a5, v27);
LABEL_14:

    }
LABEL_15:

    v21 = 1;
    goto LABEL_16;
  }
  v20 = objc_msgSend(v18, "isDead");
  if ((objc_msgSend(a1, "_handleApplyingDeletedUnlistedDirectoryIfNecessary:localItem:parent:", v15, v14, v19) & 1) != 0)
    goto LABEL_15;
  if ((v20 & 1) != 0)
    goto LABEL_12;

LABEL_8:
  v21 = 0;
LABEL_16:

  return v21;
}

+ (BOOL)serverItemDeadWithNoLiveLocalItem:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v14 && !objc_msgSend(v14, "isDead") || v13 && !objc_msgSend(v13, "isDead"))
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v13, "markNeedsDeleteForRescheduleOfItem:", 0);
    if (objc_msgSend(v13, "isSharedToMeTopLevelItem"))
    {
      objc_msgSend(v13, "asSharedToMeTopLevelItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertTombstoneAliasRecordInZone:", 0);

    }
    objc_msgSend(v13, "saveToDBForServerEdit:keepAliases:", 1, 0);
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:].cold.1();

    objc_msgSend(v17, "dbRowID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setState:forRank:zoneRowID:", 0, a5, v21);

    objc_msgSend(v16, "didApplyTombstoneForRank:", a5);
    v22 = 1;
  }

  return v22;
}

+ (BOOL)localItemHasUnsyncedChanges:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 clientZone:(id)a7 zone:(id)a8 isDeleteOfShareRoot:(BOOL)a9 session:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  const char *v63;
  void *v64;
  void *v65;
  char v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  if (!a9)
  {
    if ((objc_msgSend(v15, "localDiffs") & 0x1000000000000000) != 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.6();

      objc_msgSend(v19, "dbRowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v17;
      v27 = 22;
      goto LABEL_12;
    }
    if (+[BRCServerChangesApplyUtil shouldForceApplyContentForItem:](BRCServerChangesApplyUtil, "shouldForceApplyContentForItem:", v15))
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.2();
      goto LABEL_4;
    }
    if (!v15 || (objc_msgSend(v15, "isIdleOrRejected") & 1) != 0)
    {
      v23 = 0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v16, "isDead") & 1) != 0)
    {
      v29 = objc_msgSend(v15, "isDead");
      if ((objc_msgSend(v15, "isDirectory") & 1) == 0 && v29)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.5();

        objc_msgSend(v15, "markNeedsDeleteForRescheduleOfItem:", 0);
        objc_msgSend(v15, "saveToDB");
LABEL_42:
        objc_msgSend(v18, "didApplyTombstoneForRank:", a5);
        objc_msgSend(v19, "dbRowID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v17;
        v27 = 0;
LABEL_12:
        objc_msgSend(v26, "setState:forRank:zoneRowID:", v27, a5, v21);
LABEL_13:
        v23 = 1;
        goto LABEL_14;
      }
      if ((objc_msgSend(v16, "isBRAlias") & v29) == 1)
      {
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.3();

        goto LABEL_42;
      }
    }
    else
    {
      objc_msgSend(v15, "isDirectory");
      objc_msgSend(v16, "isBRAlias");
    }
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v62 = objc_msgSend(v16, "isDead");
      v63 = "";
      *(_DWORD *)buf = 138412802;
      v73 = v15;
      if (v62)
        v63 = "\n(dead in server truth)";
      v74 = 2080;
      v75 = v63;
      v76 = 2112;
      v77 = v32;
      _os_log_debug_impl(&dword_230455000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Suspending rank for item with conflicts: %@%s%@", buf, 0x20u);
    }

    if (objc_msgSend(v15, "isMigratingToFPFS"))
      v34 = 15;
    else
      v34 = 22;
    objc_msgSend(v19, "dbRowID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setState:forRank:zoneRowID:", v34, a5, v35);

    if (!v16)
    {
LABEL_53:
      if (objc_msgSend(v15, "isSharedToMeChildItem", v69))
      {
        objc_msgSend(v15, "st");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "ckInfo");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v48)
        {
          v49 = objc_msgSend(v15, "localDiffs");
          objc_msgSend(v20, "syncUpScheduler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "clientZone");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "dbRowID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v50, "inFlightDiffsForItem:zoneRowID:", v15, v52) | v49;

          if (v53)
          {
            if ((v53 & 0xFEFFFFFFFFFFE5FFLL) == 0)
            {
              brc_bread_crumbs();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.4();

              objc_msgSend(v16, "st");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "ckInfo");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "st");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setCkInfo:", v57);

              objc_msgSend(v15, "saveToDBForServerEdit:keepAliases:", 1, 1);
              objc_msgSend(v20, "containerScheduler");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "scheduleSyncUpForSideCar");

            }
          }
        }
      }
      objc_msgSend(v15, "appLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "state") & 4) != 0 || !objc_msgSend(v15, "needsSyncUp"))
        goto LABEL_13;
      objc_msgSend(v15, "clientZone");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "isSyncBlocked"))
        goto LABEL_65;
      objc_msgSend(v15, "clientZone");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v61, "syncState") & 5) != 0)
      {

LABEL_65:
        goto LABEL_13;
      }
      objc_msgSend(v20, "syncUpScheduler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v64, "jobStateFor:", v15);

      if (v71 != 50)
      {
        v23 = 1;
        goto LABEL_15;
      }
      objc_msgSend(v15, "itemID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v65, "isDocumentsFolder") & 1) == 0)
      {
        v66 = objc_msgSend(v15, "isSharedToMe");

        if ((v66 & 1) != 0)
        {
LABEL_76:
          objc_msgSend(v15, "clientZone");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scheduleSyncUp");
          goto LABEL_13;
        }
        brc_bread_crumbs();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "clientZone");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v73 = v68;
          v74 = 2112;
          v75 = (const char *)v65;
          _os_log_impl(&dword_230455000, v67, OS_LOG_TYPE_DEFAULT, "[WARNING] client zone %@ forgot to sync up!%@", buf, 0x16u);

        }
      }

      goto LABEL_76;
    }
    objc_msgSend(v15, "st");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ckInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37 || (objc_msgSend(v19, "isPrivateZone") & 1) == 0)
    {
      if (!objc_msgSend(v15, "isDocument"))
      {
        if ((objc_msgSend(v15, "sharingOptions") & 0x7C) != 4)
        {

          goto LABEL_53;
        }
        v44 = objc_msgSend(v15, "localDiffs");

        if ((v44 & 0x1000000000000000) != 0)
          goto LABEL_53;
        goto LABEL_49;
      }
      v70 = v36;
      objc_msgSend(v15, "asDocument");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "currentVersion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ckInfo");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = (void *)v40;
        if ((objc_msgSend(v15, "sharingOptions") & 0x7C) != 4)
        {

          goto LABEL_53;
        }
        v69 = objc_msgSend(v15, "localDiffs");

        if ((v69 & 0x1000000000000000) != 0)
          goto LABEL_53;
        goto LABEL_49;
      }

      v36 = v70;
    }

LABEL_49:
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v73 = v15;
      v74 = 2112;
      v75 = (const char *)v16;
      v76 = 2112;
      v77 = v45;
      _os_log_debug_impl(&dword_230455000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning sharing options on local item %@ from %@%@", buf, 0x20u);
    }

    objc_msgSend(v15, "setSharingOptions:", objc_msgSend(v16, "sharingOptions"));
    objc_msgSend(v15, "saveToDBForServerEdit:keepAliases:", 1, 1);
    goto LABEL_53;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    +[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:].cold.1();
LABEL_4:

  v23 = 0;
LABEL_14:

LABEL_15:
  return v23;
}

+ (void)itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (item CZM processing)%@");
  OUTLINED_FUNCTION_0();
}

+ (void)appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (ongoing cross-zone migration)%@");
  OUTLINED_FUNCTION_0();
}

+ (void)serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (missing parent while greedy)%@");
  OUTLINED_FUNCTION_0();
}

+ (void)serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Dead item doesn't need any action%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Don't suspend delete of shared to me item %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Not suspending download of an item that needs CZM processing %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Ignoring deletion of share alias with a locally dead item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Learning structure etag on item with only side car diffs %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Forcing deletion of item dead in both client and server truth %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Suspending rank for item which needs an OOB sync ack %@%@");
  OUTLINED_FUNCTION_0();
}

@end
