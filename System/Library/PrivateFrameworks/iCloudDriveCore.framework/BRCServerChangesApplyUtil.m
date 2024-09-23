@implementation BRCServerChangesApplyUtil

+ (BOOL)shouldForceApplyContentForItem:(id)a3
{
  return 0;
}

+ (BOOL)checkEarlyExitsPriorToApplying:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8 isDeleteOfShareRoot:(BOOL)a9 diffs:(unint64_t)a10 clientZone:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  void *v24;
  uint64_t v25;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  LOBYTE(v25) = a9;
  if (+[BRCServerChangesApplyUtil_Private localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:](BRCServerChangesApplyUtil_Private, "localItemHasUnsyncedChanges:si:rank:scheduler:clientZone:zone:isDeleteOfShareRoot:session:", v16, v17, a5, v18, v21, v19, v25, v20)|| +[BRCServerChangesApplyUtil_Private serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:](BRCServerChangesApplyUtil_Private, "serverItemDeadWithNoLiveLocalItem:si:rank:scheduler:clientZone:zone:", v16, v17, a5, v18, v21, v19)
    || +[BRCServerChangesApplyUtil_Private serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:](BRCServerChangesApplyUtil_Private, "serverItemWouldBeParentedToDeadFolder:si:rank:scheduler:zone:diffs:", v16, v17, a5, v18, v19, a10))
  {
    v22 = 1;
  }
  else
  {
    objc_msgSend(v17, "parentItemIDOnFS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[BRCServerChangesApplyUtil_Private appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:](BRCServerChangesApplyUtil_Private, "appLibraryUndergoingCZM:zone:rank:parentID:scheduler:session:", v16, v19, a5, v24, v18, v20)|| +[BRCServerChangesApplyUtil_Private itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:](BRCServerChangesApplyUtil_Private, "itemUndergoingCZMToAnotherZone:si:clientZone:rank:scheduler:zone:", v16, v17, v21, a5, v18, v19);

  }
  return v22;
}

+ (BOOL)handleApplyChangesForUnliveServerItem:(id)a3 isDeleteOfShareRoot:(BOOL)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 session:(id)a8
{
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  unsigned int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  NSObject *v48;
  const __CFString *v49;
  void *v50;
  int64_t v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  int64_t v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v12 = a4;
  v67 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v49 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v62 = v13;
    v63 = 2112;
    if (v12)
      v49 = CFSTR("YES");
    v64 = v49;
    v65 = 2112;
    v66 = v17;
    _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] handleApplyChangesForUnliveServerItem for %@\ndelete share root: %@%@", buf, 0x20u);
  }

  if (!objc_msgSend(v13, "isFSRoot"))
  {
    if (!v12 || !objc_msgSend(v13, "isDocument"))
      goto LABEL_34;
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:].cold.3();

    v25 = objc_msgSend(v13, "localDiffs");
    objc_msgSend(v16, "syncUpScheduler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "inFlightDiffsForItem:", v13);

    if ((objc_msgSend(v13, "needsUpload") & 1) == 0 && ((v27 | v25) & 0x180000) == 0)
    {
      objc_msgSend(v13, "asDocument");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currentVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uploadError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "br_isCloudDocsErrorCode:", 43);

      if (!v31)
        goto LABEL_34;
    }
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke;
    v55[3] = &unk_24FE43810;
    v56 = v13;
    v32 = v16;
    v57 = v32;
    v58 = v14;
    v60 = a5;
    v59 = v15;
    v33 = (void *)MEMORY[0x2348BA0DC](v55);
    objc_msgSend(v32, "clientDB");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "groupInTransaction:", v33);

    if ((v35 & 1) == 0)
    {
LABEL_34:
      if (!objc_msgSend(v13, "isDirectory")
        || (objc_msgSend(v13, "asDirectory"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = objc_msgSend(v36, "hasLiveChildren"),
            v36,
            !v37))
      {
        v22 = 0;
        goto LABEL_31;
      }
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:].cold.2();

      if (v12)
      {
        v52 = a5;
        objc_msgSend(v13, "db");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "itemID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clientZone");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "dbRowID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v40, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_stat_ckinfo IS NULL AND item_parent_id = %@ AND zone_rowid = %@"), v41, v43);

        if (objc_msgSend(v44, "next"))
        {
          do
          {
            v45 = (void *)MEMORY[0x2348B9F14]();
            v53[0] = MEMORY[0x24BDAC760];
            v53[1] = 3221225472;
            v53[2] = __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_29;
            v53[3] = &unk_24FE40010;
            v54 = v16;
            objc_msgSend(v44, "object:", v53);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs();
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v62 = v13;
              v63 = 2112;
              v64 = v47;
              _os_log_debug_impl(&dword_230455000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Marking item unknown to server %@ as rejected%@", buf, 0x16u);
            }

            objc_msgSend(v46, "markForceRejected");
            objc_msgSend(v46, "saveToDB");

            objc_autoreleasePoolPop(v45);
          }
          while ((objc_msgSend(v44, "next") & 1) != 0);
        }

        a5 = v52;
      }
      objc_msgSend(v15, "dbRowID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setState:forRank:zoneRowID:", 25, a5, v50);

    }
    v22 = 1;
    goto LABEL_31;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:].cold.1();

  objc_msgSend(v13, "markItemForgottenByServer");
  objc_msgSend(v13, "markForceNeedsSyncUp");
  objc_msgSend(v15, "dbRowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setState:forRank:zoneRowID:", 0, a5, v21);

  v22 = 1;
  objc_msgSend(v13, "saveToDBForServerEdit:keepAliases:", 1, 0);
LABEL_31:

  return v22;
}

uint64_t __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  int v62;
  id v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  _BYTE buf[12];
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  const __CFString *v90;
  _QWORD v91[2];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  if (!objc_msgSend(*(id *)(a1 + 32), "isTopLevelSharedItem"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_8();

    objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", *v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "clientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "brc_shareItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemByItemID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "brc_shareItemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "itemID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "debugItemIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v25;
        v84 = 2112;
        v85 = v27;
        v86 = 2112;
        v87 = v23;
        _os_log_impl(&dword_230455000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not find share root item %@ for item %@. Just trash ...%@", buf, 0x20u);

      }
      objc_msgSend(*v2, "appLibrary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "defaultClientZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v7 = 0;
      goto LABEL_35;
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_7();

    objc_msgSend(v13, "extendedAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("com.apple.clouddocs.private.recovered-bookmark#N"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v17, 4);
      *(_QWORD *)buf = 0;
      objc_msgSend(v18, "parseUnsaltedBookmarkDataWithItemID:mangledID:error:", buf, 0, 0);
      objc_msgSend(v13, "parentClientZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "itemByItemID:", *(_QWORD *)buf);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "asDirectory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_6(v6, (uint64_t)v21, v22);

        v7 = 0;
        goto LABEL_29;
      }
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_5((id *)buf, (uint64_t)v28, v29);

    }
    v78 = v10;
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_4(v13, (uint64_t)v30, v31);

    objc_msgSend(*(id *)(a1 + 40), "fsImporter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appLibrary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    objc_msgSend(v32, "getOrCreateTrashItemInAppLibrary:error:", v33, &v82);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v82;

    objc_msgSend(*(id *)(a1 + 40), "fsImporter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "st");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logicalNameWithoutLocalBounce");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v35;
    v76 = (void *)v34;
    objc_msgSend(v36, "createAndImportNewDirectoryWithLogicalName:parentItem:error:", v38, v34, &v81);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v81;

    objc_msgSend(v13, "computeItemPathRelativeToRoot");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "st");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTrashPutBackPath:", v39);

    objc_msgSend(v13, "st");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "parentID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "st");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTrashPutBackParentID:", v42);

    if (objc_msgSend(v6, "saveToDB"))
    {
      v74 = v17;
      v44 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "itemID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "itemIDString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientZone");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "mangledID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "unsaltedBookmarkDataWithItemResolutionString:serverZoneMangledID:", v46, v48);
      v49 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v49;
      brc_bread_crumbs();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_3();

      v90 = CFSTR("com.apple.clouddocs.private.recovered-bookmark#N");
      objc_msgSend(v50, "dataUsingEncoding:", 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v53;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateWithXattrs:", v54);

      objc_msgSend(v13, "saveToDB");
      v17 = v74;
    }

    if (!v6)
    {
      brc_bread_crumbs();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v58 = objc_claimAutoreleasedReturnValue();
      v10 = v78;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v57;
        _os_log_impl(&dword_230455000, v58, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not create parent item in trash. Just trash ...%@", buf, 0xCu);
      }

      objc_msgSend(*v2, "appLibrary");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "defaultClientZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      goto LABEL_35;
    }
    v10 = v78;
LABEL_29:
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v71 = *v2;
      objc_msgSend(v13, "st");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "logicalNameWithoutLocalBounce");
      v75 = v17;
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemGlobalID");
      v79 = v10;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v71;
      v84 = 2112;
      v85 = v72;
      v86 = 2112;
      v87 = v73;
      v88 = 2112;
      v89 = v55;
      _os_log_debug_impl(&dword_230455000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Trash item %@ under folder %@ with id %@%@", buf, 0x2Au);

      v10 = v79;
      v17 = v75;

    }
    objc_msgSend(v6, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

    goto LABEL_36;
  }
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_2();

  objc_msgSend(*v2, "parentClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
LABEL_36:
  objc_msgSend(*(id *)(a1 + 32), "_moveToZoneWhenServerItemIsDead:", v5);
  objc_msgSend(*(id *)(a1 + 40), "fsImporter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = *(_QWORD *)(a1 + 32);
  v80 = v7;
  v62 = objc_msgSend(v60, "trashItem:parentItemInTrash:error:", v61, v6, &v80);
  v63 = v80;

  if (v62 && (objc_msgSend(*v2, "markNeedsUploadOrSyncingUp"), objc_msgSend(*v2, "saveToDB")))
  {
    brc_bread_crumbs();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_1(v2, (uint64_t)v64, v65);

    v66 = *(_QWORD *)(a1 + 64);
    v67 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "dbRowID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setState:forRank:zoneRowID:", 0, v66, v68);

    v69 = 1;
  }
  else
  {
    v69 = 0;
  }

  return v69;
}

id __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

+ (BOOL)deletingShareRoot:(id)a3 localItem:(id)a4
{
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_msgSend(a3, "isDead");
  if (a3 && !v6)
    goto LABEL_8;
  if ((objc_msgSend(v5, "isSharedToMeTopLevelItem") & 1) != 0)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "isSharedToMeChildItem"))
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brc_shareItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverItemByItemID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v7 = objc_msgSend(v11, "isDead");
  else
    v7 = 1;

LABEL_9:
  return v7;
}

+ (BOOL)handleNonRevivedItemIfNecessary:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 hasInitialScanItemTypeMismatch:(BOOL *)a8
{
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!a3)
  {
    if (a8)
      *a8 = 0;
    objc_msgSend(v13, "parentItemIDOnFS");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logicalName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemByParentID:andLogicalName:", v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v21, "isFromInitialScan"))
      goto LABEL_40;
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v21;
      v42 = 2112;
      v43 = v13;
      v44 = 2112;
      v45 = v22;
      _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a freshly scanned item from an initial scan that path matches: %@ for server item: %@%@", buf, 0x20u);
    }

    objc_msgSend(v21, "clientZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isEqualToClientZone:", v25))
      goto LABEL_35;
    if (objc_msgSend(v21, "isFSRoot") && (objc_msgSend(v13, "isDirectory") & 1) != 0)
      goto LABEL_22;
    objc_msgSend(v21, "st");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v39, "type");
    objc_msgSend(v13, "st");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v38, "type");
    if (v26 != v27)
    {
      if (v26 > 0xA)
        goto LABEL_34;
      if (((1 << v26) & 0x611) == 0)
      {
        if (((1 << v26) & 0x106) != 0)
        {
LABEL_15:
          if (v27 > 8 || ((1 << v27) & 0x106) == 0)
          {
            if (v26 != 6)
              goto LABEL_34;
            goto LABEL_29;
          }
          goto LABEL_21;
        }
        if (v26 == 6)
        {
LABEL_29:
          v34 = v27;

          if (v34 != 6)
          {
LABEL_36:
            brc_bread_crumbs();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.3();

            if (a8)
            {
              v16 = 0;
              *a8 = 1;
LABEL_41:

              goto LABEL_42;
            }
LABEL_40:
            v16 = 0;
            goto LABEL_41;
          }
LABEL_23:
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.2();

          objc_msgSend(v13, "itemID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "learnItemID:serverItem:", v30, v13);

          objc_msgSend(v21, "saveToDBForServerEdit:keepAliases:", 1, 0);
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            +[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:].cold.1();

          objc_msgSend(v15, "dbRowID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setState:forRank:zoneRowID:", 22, a5, v33);

          v16 = 1;
          goto LABEL_41;
        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      if (v27 > 0xA || ((1 << v27) & 0x611) == 0)
      {
        if (v26 - 1 < 2)
          goto LABEL_15;
        if (v26 == 6)
          goto LABEL_29;
        if (v26 == 8)
          goto LABEL_15;
        goto LABEL_34;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v16 = 0;
LABEL_42:

  return v16;
}

+ (BOOL)handleEtagsChangesOnly:(id)a3 si:(id)a4 rank:(int64_t)a5 scheduler:(id)a6 zone:(id)a7 diffs:(unint64_t *)a8 needsSave:(BOOL *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v23;
  NSObject *v24;
  void *v25;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (!v14)
    goto LABEL_8;
  v18 = *a8;
  if ((*a8 & 0x7FFF) == 1)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:].cold.2();

    objc_msgSend(v14, "updateStructuralCKInfoFromServerItem:", v15);
    *a9 = 1;
    v18 = *a8 & 0xFFFFFFFFFFFFFFFELL;
    *a8 = v18;
  }
  if (v18 || (objc_msgSend(v14, "isDocument") & 1) != 0)
  {
LABEL_8:
    v21 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:].cold.1();

    objc_msgSend(v17, "dbRowID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setState:forRank:zoneRowID:", 0, a5, v25);

    v21 = 1;
    if (a9)
      objc_msgSend(v14, "saveToDBForServerEdit:keepAliases:", 1, 0);
  }

  return v21;
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] the fs root was remotely deleted, we need to recreate it and reupload it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Apply Changes[%lld]: postponing rank (live child)%@");
  OUTLINED_FUNCTION_0();
}

+ (void)handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Deleting share root for document %@%@");
  OUTLINED_FUNCTION_0();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] Item after trash %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Document is top level shared --> Just trash%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Saving trashURLBookmarkDataToSet: %@%@");
  OUTLINED_FUNCTION_0();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "st");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logicalNameWithoutLocalBounce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v6, "[DEBUG] Create folder %@ under trash%@", v7);

  OUTLINED_FUNCTION_6();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_5(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Could not find previously created folder in trash: %@%@", v6);

  OUTLINED_FUNCTION_6();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_6(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugItemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v6, "[DEBUG] Found previously created folder in trash: %@%@", v7);

  OUTLINED_FUNCTION_6();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found share root %@%@");
  OUTLINED_FUNCTION_0();
}

void __115__BRCServerChangesApplyUtil_handleApplyChangesForUnliveServerItem_isDeleteOfShareRoot_rank_scheduler_zone_session___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Document is under some share root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Suspending rank since freshly scanned means either same content or conflict: %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Item type matches with the server item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Item type does not match with the server item type%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Remove rank for item with no real changes: %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Accepting Structural Etag update for %@%@");
  OUTLINED_FUNCTION_0();
}

@end
