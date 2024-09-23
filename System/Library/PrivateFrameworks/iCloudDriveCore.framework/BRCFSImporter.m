@implementation BRCFSImporter

- (BRCFSImporter)initWithAccountSession:(id)a3
{
  id v5;
  BRCFSImporter *v6;
  BRCFSImporter *v7;
  BRCFairSource *v8;
  void *v9;
  uint64_t v10;
  BRCFairSource *childPropagationSource;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCFSImporter;
  v6 = -[BRCFSImporter init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_initWeak(&location, v7);
    v8 = [BRCFairSource alloc];
    -[BRCAccountSessionFPFS fairClientDBScheduler](v7->_session, "fairClientDBScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BRCFairSource initWithName:scheduler:](v8, "initWithName:scheduler:", CFSTR("child-propagation"), v9);
    childPropagationSource = v7->_childPropagationSource;
    v7->_childPropagationSource = (BRCFairSource *)v10;

    objc_msgSend(v5, "clientTruthWorkloop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFairSource setWorkloop:](v7->_childPropagationSource, "setWorkloop:", v12);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__BRCFSImporter_initWithAccountSession___block_invoke;
    v14[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v15, &location);
    -[BRCFairSource setEventHandler:](v7->_childPropagationSource, "setEventHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __40__BRCFSImporter_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_childPropagationSchedule");

}

- (id)_createBaseItemWithImportObject:(id)a3 importBookmark:(id)a4 parentItem:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  char v8;
  id v12;
  id v13;
  id v14;
  __objc2_class **v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  char *v22;
  void *v23;
  int v24;
  char *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  NSObject *v43;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v8 = a6;
  v53 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if ((objc_msgSend(v12, "isDocument") & 1) != 0)
  {
    v15 = off_24FE3DB28;
    goto LABEL_17;
  }
  if ((objc_msgSend(v12, "isSymLink") & 1) != 0)
  {
    v15 = off_24FE3DE10;
    goto LABEL_17;
  }
  if (!objc_msgSend(v12, "isBRAlias"))
  {
    if ((objc_msgSend(v12, "isFinderAlias") & 1) != 0)
    {
      v15 = off_24FE3DBE0;
    }
    else
    {
      if ((objc_msgSend(v12, "isUnixDir") & 1) == 0)
      {
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:].cold.4();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Import object of unknown type %@"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_46;
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, (os_log_type_t)0x90u))
          goto LABEL_45;
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v46 = "-[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]";
        v47 = 2080;
        if (!a7)
          v21 = "(ignored by caller)";
        goto LABEL_12;
      }
      v15 = off_24FE3DB20;
    }
LABEL_17:
    v22 = (char *)objc_msgSend(objc_alloc(*v15), "_initWithImportObject:error:", v12, a7);
    objc_msgSend(v13, "mangledID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isShared");

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v22;
        v47 = 2112;
        v48 = v25;
        _os_log_impl(&dword_230455000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as a top level shared item because it has top level share bookmark data%@", buf, 0x16u);
      }

      objc_msgSend(v22, "markImportedItemAsSharedWithImportBookmark:parent:", v13, v14);
    }
    if ((v8 & 1) == 0)
    {
      if (-[BRCFSImporter _isDesktopOrDocumentsItem:](self, "_isDesktopOrDocumentsItem:", v22))
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:].cold.1();

        objc_msgSend(v12, "logicalName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE17568]);

        if (v30)
        {
          +[BRCItemID defaultDesktopItemID](BRCItemID, "defaultDesktopItemID");
          v31 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "logicalName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BE17578]);

          if (!v38)
          {
            v39 = 0;
            goto LABEL_38;
          }
          +[BRCItemID defaultDocumentsItemID](BRCItemID, "defaultDocumentsItemID");
          v31 = objc_claimAutoreleasedReturnValue();
        }
        v39 = (void *)v31;
LABEL_38:
        objc_msgSend(v22, "clientZone");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "existsByItemID:", v39);

        if ((v41 & 1) == 0)
          objc_msgSend(v22, "learnItemID:serverItem:", v39, 0);
        objc_msgSend(v22, "markFromInitialScan");

        goto LABEL_49;
      }
      if ((objc_msgSend(v22, "isUserVisible") & 1) != 0)
        goto LABEL_49;
      if (objc_msgSend(v22, "isInDocumentScope"))
      {
        objc_msgSend(v22, "appLibrary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "containerMetadata");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isDocumentScopePublic");

        if (!v34)
          goto LABEL_49;
      }
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:].cold.2();

    }
    objc_msgSend(v22, "markFromInitialScan");
    goto LABEL_49;
  }
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:].cold.3();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Can't import br aliases anymore %@"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_46;
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v46 = "-[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:]";
    v47 = 2080;
    if (!a7)
      v21 = "(ignored by caller)";
LABEL_12:
    v48 = v21;
    v49 = 2112;
    v50 = v18;
    v51 = 2112;
    v52 = v19;
    _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }
LABEL_45:

LABEL_46:
  if (a7)
    *a7 = objc_retainAutorelease(v18);

  v22 = 0;
LABEL_49:

  return v22;
}

- (BOOL)isFPFSMigrationInProgress
{
  return -[BRCAccountSessionFPFS fpfsMigrationState](self->_session, "fpfsMigrationState") == 1;
}

- (id)_globalItemByDocumentID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;

  v3 = *(_QWORD *)&a3;
  if (-[BRCFSImporter isFPFSMigrationInProgress](self, "isFPFSMigrationInProgress"))
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __41__BRCFSImporter__globalItemByDocumentID___block_invoke;
    v13[3] = &unk_24FE40038;
    v13[4] = self;
    v14 = v5;
    v6 = v5;
    v7 = (void *)objc_msgSend(v6, "fetchObject:sql:", v13, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_doc_id = %u   AND +item_state = 0   AND +item_type IN (1, 2, 8, 6, 7)"), v3);
    if (objc_msgSend(v7, "isMigratingToFPFS"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCFSImporter _globalItemByDocumentID:].cold.1();

    v9 = 0;
  }
  return v9;
}

id __41__BRCFSImporter__globalItemByDocumentID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (id)_globalItemByFileID:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;

  if (-[BRCFSImporter isFPFSMigrationInProgress](self, "isFPFSMigrationInProgress"))
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__BRCFSImporter__globalItemByFileID___block_invoke;
    v13[3] = &unk_24FE40038;
    v13[4] = self;
    v14 = v5;
    v6 = v5;
    v7 = (void *)objc_msgSend(v6, "fetchObject:sql:", v13, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items  WHERE item_file_id = %lld    AND item_state IN (0, -1)"), a3);
    if (objc_msgSend(v7, "isMigratingToFPFS"))
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCFSImporter _globalItemByFileID:].cold.1();

    v9 = 0;
  }
  return v9;
}

id __37__BRCFSImporter__globalItemByFileID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newLocalItemFromPQLResultSet:db:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (BOOL)_shouldRejectItemWithName:(id)a3 templateItem:(id)a4 existingItem:(id)a5 options:(unint64_t)a6 shouldRemoveItemFromDrive:(BOOL *)a7
{
  char v8;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v8 = a6;
  v45 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v11, "br_stringByDeletingPathBounceNo:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v12, "extendedAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("com.apple.fpfs.fileid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || (objc_msgSend(v14, "isEqualToString:", CFSTR(".Trash-from-provider")) & 1) == 0)
  {

    goto LABEL_10;
  }
  -[NSObject st](v13, "st");
  v40 = v14;
  v17 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logicalName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "br_stringByDeletingPathBounceNo:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR(".Trash-from-provider"));

  v13 = v17;
  v14 = v40;

  if (!v21)
  {
LABEL_10:
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE175A0])
      && (!v13 || -[NSObject isInTrashScope](v13, "isInTrashScope")))
    {
      brc_bread_crumbs();
      v25 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v25;
        v27 = "[INFO] rejecting Trash folder%@";
LABEL_20:
        v31 = v26;
        v32 = OS_LOG_TYPE_INFO;
LABEL_26:
        _os_log_impl(&dword_230455000, v31, v32, v27, buf, 0xCu);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (v12)
    {
      objc_msgSend(v12, "contentType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "br_isAliasFileType") & 1) != 0)
      {
        objc_msgSend(v12, "extendedAttributes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("com.apple.clouddocs.security"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          brc_bread_crumbs();
          v25 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v25;
            v27 = "[INFO] rejecting BRAlias%@";
            goto LABEL_20;
          }
LABEL_27:

          v24 = 1;
          goto LABEL_36;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE17598]))
    {
      objc_msgSend(v12, "parentItemIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x24BDC8228]);

      if (v34)
      {
        brc_bread_crumbs();
        v25 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v25;
          v27 = "[WARNING] rejecting shared mangled containerID%@";
          v31 = v26;
          v32 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    objc_msgSend(v12, "contentType");
    v25 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject br_isDirectoryType](v25, "br_isDirectoryType") & 1) == 0)
    {
      v35 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE17578]);

      if (!v35)
      {
LABEL_35:
        v24 = 0;
        goto LABEL_36;
      }
      v36 = (void *)MEMORY[0x24BE17628];
      objc_msgSend(v12, "parentItemIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fileObjectIDWithString:", v37);
      v25 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject isAppLibraryRoot](v25, "isAppLibraryRoot"))
      {
        brc_bread_crumbs();
        v26 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v26;
          _os_log_impl(&dword_230455000, v38, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting documents folder to be anything other then directory%@", buf, 0xCu);
        }

        goto LABEL_27;
      }
    }

    goto LABEL_35;
  }
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v13;
    v43 = 2112;
    v44 = v22;
    _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting .Trash-from-provider item that was mapped to %@%@", buf, 0x16u);
  }

  v24 = 1;
  if (a7)
    *a7 = 1;
LABEL_36:

  return v24;
}

- (BOOL)_isDesktopOrDocumentsItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "parentFileObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCloudDocsRoot")
    && objc_msgSend(v3, "isDirectory")
    && objc_msgSend(v3, "itemScope") == 2)
  {
    objc_msgSend(v3, "st");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logicalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE17568]) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "st");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logicalName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE17578]);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unsigned)capabilityToMoveItem:(id)a3 toNewParentItem:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  char *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  unsigned __int16 v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  char v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  int v25;
  const char *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  const char *v35;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  int v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemNotFound:", 0);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v35 = "(passed to caller)";
          v45 = 136315906;
          v46 = "-[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:]";
          v47 = 2080;
          if (!a5)
            v35 = "(ignored by caller)";
          v48 = v35;
          v49 = 2112;
          v50 = v9;
          v51 = 2112;
          v52 = v14;
          _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v45, 0x2Au);
        }

      }
      if (a5)
      {
        v9 = objc_retainAutorelease(v9);
        *a5 = v9;
      }
      v13 = 1;
      goto LABEL_95;
    }
    objc_msgSend(v7, "clientZone");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isSharedToMeChildItem") && (objc_msgSend(v7, "sharingOptions") & 0x20) != 0)
    {
      brc_bread_crumbs();
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v45 = 138412546;
        v46 = (const char *)v7;
        v47 = 2112;
        v48 = v11;
        v17 = "[WARNING] Can't edit a readonly share for %@%@";
LABEL_36:
        _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v45, 0x16u);
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isSharedToMe") || (objc_msgSend(v8, "sharingOptions") & 0x20) == 0)
      {
        if (((objc_msgSend(v7, "isSharedToMeTopLevelItem") & 1) != 0
           || objc_msgSend(v7, "isSharedByMe")
           && objc_msgSend(v7, "hasShareIDAndIsOwnedByMe"))
          && objc_msgSend(v8, "isInTrashScope"))
        {
          brc_bread_crumbs();
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v45 = 138412802;
            v46 = (const char *)v7;
            v47 = 2112;
            v48 = (const char *)v8;
            v49 = 2112;
            v50 = v11;
            _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Trying to move shared top item %@ into trash at parent %@%@", (uint8_t *)&v45, 0x20u);
          }
          v13 = 4096;
          goto LABEL_93;
        }
        if ((objc_msgSend(v9, "isEqualToClientZone:", v10) & 1) == 0)
        {
          if (objc_msgSend(v7, "isSharedToMeTopLevelItem"))
          {
            if (objc_msgSend(v10, "isSharedZone"))
            {
              brc_bread_crumbs();
              v11 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                v45 = 138412802;
                v46 = (const char *)v7;
                v47 = 2112;
                v48 = (const char *)v8;
                v49 = 2112;
                v50 = v11;
                _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Trying to move shared top item %@ into another shared item %@%@", (uint8_t *)&v45, 0x20u);
              }
              v13 = 2;
            }
            else
            {
              objc_msgSend(v7, "appLibrary");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "defaultClientZone");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToClientZone:", v10);

              if (v29)
              {
                brc_bread_crumbs();
                v11 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                  -[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:].cold.4();
                v13 = 64;
              }
              else
              {
                brc_bread_crumbs();
                v11 = (char *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = 138412546;
                  v46 = (const char *)v7;
                  v47 = 2112;
                  v48 = v11;
                  _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Top level shared item %@ moved across zone boundaries.  Allowing it%@", (uint8_t *)&v45, 0x16u);
                }
                v13 = 256;
              }
            }
            goto LABEL_93;
          }
          if ((objc_msgSend(v9, "isSharedZone") & 1) == 0 && !objc_msgSend(v10, "isSharedZone"))
          {
            brc_bread_crumbs();
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v11;
              v13 = 32;
              _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is crossing zone boundaries to %@%@", (uint8_t *)&v45, 0x20u);
            }
            else
            {
              v13 = 32;
            }
            goto LABEL_93;
          }
          if ((objc_msgSend(v9, "isSharedZone") & 1) != 0
            || !objc_msgSend(v7, "isDirectory")
            || (objc_msgSend(v7, "asDirectory"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v24, "possiblyContainsSharedItem"),
                v24,
                !v25))
          {
            brc_bread_crumbs();
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v11;
              _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to download item %@ which is moving in or out of a shared zone to parent %@%@", (uint8_t *)&v45, 0x20u);
            }
            v13 = 16;
            goto LABEL_93;
          }
          brc_bread_crumbs();
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_80;
          v45 = 138412802;
          v46 = (const char *)v7;
          v47 = 2112;
          v48 = (const char *)v8;
          v49 = 2112;
          v50 = v11;
          v26 = "[WARNING] Moving an unshared directory %@ into a shared parent %@ where the source item has shared subitems%@";
          goto LABEL_79;
        }
        if (objc_msgSend(v7, "hasShareIDAndIsOwnedByMe"))
        {
          if ((objc_msgSend(v8, "isOwnedByMe") & 1) == 0)
          {
            brc_bread_crumbs();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.1();

          }
          if (objc_msgSend(v8, "isSharedByMe"))
          {
            brc_bread_crumbs();
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v11;
              v16 = "[WARNING] Trying to move shared top item %@ into another shared item %@%@";
LABEL_91:
              _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v45, 0x20u);
              goto LABEL_92;
            }
            goto LABEL_92;
          }
          goto LABEL_71;
        }
        if ((objc_msgSend(v7, "isOwnedByMe") & 1) != 0)
        {
          if (!objc_msgSend(v7, "isSharedByMe"))
          {
            if (objc_msgSend(v8, "isSharedByMe"))
            {
              brc_bread_crumbs();
              v11 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                v45 = 138412802;
                v46 = (const char *)v7;
                v47 = 2112;
                v48 = (const char *)v8;
                v49 = 2112;
                v50 = v11;
                v16 = "[WARNING] Moving item %@ into a share with parent %@%@";
                goto LABEL_91;
              }
LABEL_92:
              v13 = 128;
              goto LABEL_93;
            }
LABEL_71:
            if (objc_msgSend(v7, "isDirectory")
              && (objc_msgSend(v7, "isSharedByMe") & 1) == 0
              && (objc_msgSend(v7, "isSharedToMe") & 1) == 0)
            {
              if ((objc_msgSend(v8, "isSharedToMe") & 1) != 0 || objc_msgSend(v8, "isSharedByMe"))
              {
                objc_msgSend(v7, "asDirectory");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "possiblyContainsSharedItem");

                if (v34)
                {
                  brc_bread_crumbs();
                  v11 = (char *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v12 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_80:
                    v13 = 1024;
                    goto LABEL_93;
                  }
                  v45 = 138412802;
                  v46 = (const char *)v7;
                  v47 = 2112;
                  v48 = (const char *)v8;
                  v49 = 2112;
                  v50 = v11;
                  v26 = "[WARNING] Moving item with a shared child %@ into a share with parent %@%@";
LABEL_79:
                  _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v45, 0x20u);
                  goto LABEL_80;
                }
              }
              if (objc_msgSend(v8, "isInTrashScope"))
              {
                objc_msgSend(v7, "asDirectory");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "possiblyContainsSharedItem");

                if (v38)
                {
                  brc_bread_crumbs();
                  v11 = (char *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v12 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                  {
                    v45 = 138412802;
                    v46 = (const char *)v7;
                    v47 = 2112;
                    v48 = (const char *)v8;
                    v49 = 2112;
                    v50 = v11;
                    _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving an item with a shared child %@ into trash at parent %@%@", (uint8_t *)&v45, 0x20u);
                  }
                  v13 = 2048;
                  goto LABEL_93;
                }
              }
            }
            v13 = 64;
            goto LABEL_94;
          }
          if ((objc_msgSend(v8, "isOwnedByMe") & 1) == 0)
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
              -[BRCDaemonContainerHelper br_capabilityToMoveFromLocalItem:toNewParent:session:error:].cold.1();

          }
          if ((objc_msgSend(v8, "isSharedByMe") & 1) == 0)
          {
            brc_bread_crumbs();
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v11;
              v16 = "[WARNING] Moving item %@ out of the share to new parent %@%@";
              goto LABEL_91;
            }
            goto LABEL_92;
          }
          objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v7);
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v8);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12
            || (objc_msgSend(v11, "recordName"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                -[NSObject recordName](v12, "recordName"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v18, "isEqualToString:", v19),
                v19,
                v18,
                (v20 & 1) == 0))
          {
            brc_bread_crumbs();
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v21;
              v23 = "[WARNING] Moving item %@ into a different share with parent %@%@";
LABEL_66:
              _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v45, 0x20u);
              goto LABEL_67;
            }
            goto LABEL_67;
          }
        }
        else
        {
          if (objc_msgSend(v8, "isOwnedByMe"))
          {
            brc_bread_crumbs();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
              -[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:].cold.3();

          }
          objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v7);
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v8);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12
            || (objc_msgSend(v11, "recordName"),
                v30 = (void *)objc_claimAutoreleasedReturnValue(),
                -[NSObject recordName](v12, "recordName"),
                v31 = (void *)objc_claimAutoreleasedReturnValue(),
                v32 = objc_msgSend(v30, "isEqualToString:", v31),
                v31,
                v30,
                (v32 & 1) == 0))
          {
            brc_bread_crumbs();
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v45 = 138412802;
              v46 = (const char *)v7;
              v47 = 2112;
              v48 = (const char *)v8;
              v49 = 2112;
              v50 = v21;
              v23 = "[WARNING] Moving item %@ into another shared item %@%@";
              goto LABEL_66;
            }
LABEL_67:

            goto LABEL_92;
          }
        }

        goto LABEL_71;
      }
      brc_bread_crumbs();
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v45 = 138412546;
        v46 = (const char *)v8;
        v47 = 2112;
        v48 = v11;
        v17 = "[WARNING] Can't add a file to a readonly share with parent %@%@";
        goto LABEL_36;
      }
    }
    v13 = 512;
LABEL_93:

LABEL_94:
LABEL_95:

    goto LABEL_96;
  }
  v13 = 8;
LABEL_96:

  return v13;
}

- (void)_resolveConflictLosersForItem:(id)a3 localItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BRFieldContentSignature *v12;
  void *v13;
  BRFieldContentSignature *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "conflictingVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "conflictResolved"))
        {
          v12 = [BRFieldContentSignature alloc];
          objc_msgSend(v11, "contentVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[BRFieldContentSignature initWithData:](v12, "initWithData:", v13);
          -[BRFieldContentSignature etag](v14, "etag");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "asDocument");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appDidResolveConflictLoserWithEtag:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)_changeBasicFieldsOnItem:(id)a3 fields:(unint64_t)a4 template:(id)a5
{
  __int16 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v17 = a3;
  v7 = a5;
  v8 = v7;
  if ((v6 & 8) != 0)
  {
    objc_msgSend(v7, "lastUsedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithLastUsedDate:", v10);

    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v8, "tagData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FPGetTagsFromTagsData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "updateWithFinderTagNames:", v13);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v8, "favoriteRank");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithFavoriteRank:", objc_msgSend(v14, "longLongValue"));

  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v8, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithCreationDate:", v15);

  if ((v6 & 0x80) == 0)
  {
LABEL_6:
    if ((v6 & 0x100) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v17, "updateWithFileSystemFlags:", objc_msgSend(v8, "fileSystemFlags"));
    if ((v6 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v8, "contentModificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateWithContentModificationDate:", v16);

  if ((v6 & 0x100) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v6 & 0x200) != 0)
  {
LABEL_8:
    objc_msgSend(v8, "extendedAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithXattrs:", v9);

  }
LABEL_9:

}

- (void)_updateFPFSMigrationStatsForBouncing:(id)a3 existingItem:(id)a4
{
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  char v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "br_isDirectoryType");

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v17, "contentType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "br_isSymbolicLinkType");

    if ((v11 & 1) != 0)
    {
      v9 = 4;
    }
    else
    {
      objc_msgSend(v17, "contentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "br_isAliasFileType");

      if ((v13 & 1) != 0)
      {
        v9 = 3;
      }
      else
      {
        objc_msgSend(v17, "contentType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "br_isPackageType");

        if (v15)
          v9 = 2;
        else
          v9 = 1;
      }
    }
  }
  if ((objc_msgSend(v6, "isDirectory") & 1) != 0)
  {
    v16 = 0;
  }
  else if ((objc_msgSend(v6, "isSymLink") & 1) != 0)
  {
    v16 = 4;
  }
  else if ((objc_msgSend(v6, "isFinderBookmark") & 1) != 0)
  {
    v16 = 3;
  }
  else if (objc_msgSend(v6, "isPackage"))
  {
    v16 = 2;
  }
  else
  {
    v16 = 1;
  }
  -[BRCAccountSessionFPFS _updateFPFSMigrationBouncedItemType:withExistingItemType:](self->_session, "_updateFPFSMigrationBouncedItemType:withExistingItemType:", v9, v16);

}

- (void)_reportBouncingForMigration:(id)a3 existingItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[BRCFSImporter _updateFPFSMigrationStatsForBouncing:existingItem:](self, "_updateFPFSMigrationStatsForBouncing:existingItem:", a3, v6);
  if (-[BRCFSImporter isFPFSMigrationInProgress](self, "isFPFSMigrationInProgress"))
  {
    if (objc_msgSend(v6, "isDirectory"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "filterDecendantsOfNotMigratedFolders");

      if (v8)
      {
        -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (isFPFSMigrationNonMigratedFoldersExists(v9, v10))
        {
          objc_msgSend(v6, "itemGlobalID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[BRCFSImporter _reportBouncingForMigration:existingItem:].cold.1();

          objc_msgSend(v11, "itemID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "zoneRowID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v9, "execute:", CFSTR("INSERT OR IGNORE INTO fpfs_folders_not_migrated (item_id, zone_rowid) VALUES (%@, %@)"), v14, v15);

          if (!v16 || !objc_msgSend(v9, "changes"))
          {
            brc_bread_crumbs();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "itemID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "zoneRowID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "lastError");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v23 = v19;
              v24 = 2112;
              v25 = v20;
              v26 = 2112;
              v27 = v21;
              v28 = 2112;
              v29 = v17;
              _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed inserting to fpfs_folders_not_migrated with %@, %@. Error: %@%@", buf, 0x2Au);

            }
          }

        }
      }
    }
  }

}

- (id)_parseImportBookmark:(id)a3 templateItem:(id)a4 fileURL:(id)a5 ignoreImportBookmark:(BOOL *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  NSObject *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _BYTE *v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v45 = a5;
  objc_msgSend(v10, "mangledID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientZoneByMangledID:](self->_session, "clientZoneByMangledID:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isTrashBookmark"))
  {
    if ((objc_msgSend(v14, "isPrivateZone") & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find zone for trash putback %@, falling back to clouddocs zone%@", buf, 0x16u);
      }

      -[BRCAccountSessionFPFS cloudDocsClientZone](self->_session, "cloudDocsClientZone");
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    objc_msgSend(v14, "itemByItemID:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "asDirectory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v19, "isInTrashScope") & 1) == 0)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find trash parent for %@, falling back to one at the zone root%@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v50 = __Block_byref_object_copy__23;
      v51 = __Block_byref_object_dispose__23;
      v52 = 0;
      objc_msgSend(v14, "db");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __80__BRCFSImporter__parseImportBookmark_templateItem_fileURL_ignoreImportBookmark___block_invoke;
      v46[3] = &unk_24FE449C0;
      v48 = buf;
      v46[4] = self;
      v47 = v14;
      objc_msgSend(v22, "groupInBatch:", v46);

      v23 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

      v19 = v23;
    }
    if (v19)
    {
      v24 = 0;
LABEL_40:
      objc_msgSend(v24, "markDoneMigratingToFPFS");
      v24 = v24;
      v40 = v24;
      goto LABEL_41;
    }
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
      -[BRCFSImporter _parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:].cold.1();

    goto LABEL_31;
  }
  objc_msgSend(v14, "itemByItemID:", v13);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    brc_bread_crumbs();
    v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "debugItemIDString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v50 = v35;
      _os_log_impl(&dword_230455000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find item by bookmark data %@ (%@)%@", buf, 0x20u);

    }
LABEL_31:
    v24 = 0;
    goto LABEL_32;
  }
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[BRCFSImporter _parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:].cold.2();

  if ((itemsHaveTheSameKind(v24, v11) & 1) != 0)
  {
    if (objc_msgSend(v24, "isDocument"))
    {
      objc_msgSend(v24, "asDocument");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "currentVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "size") <= 0)
      {

LABEL_38:
        goto LABEL_39;
      }
      objc_msgSend(v11, "documentSize");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "longLongValue") == 0;

      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v45, 0, 0, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "nextObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (v32)
        {
          brc_bread_crumbs();
          v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2112;
            v50 = v33;
            _os_log_fault_impl(&dword_230455000, v34, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't match an empty shared package %@ to the existing shared package item %@%@", buf, 0x20u);
          }

          if (a6)
            *a6 = 1;

          goto LABEL_32;
        }
        goto LABEL_38;
      }
    }
LABEL_39:
    v19 = 0;
    goto LABEL_40;
  }
  brc_bread_crumbs();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v41;
    _os_log_impl(&dword_230455000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] The existing shared item doesn't have the right kind%@", buf, 0xCu);
  }

  if (a6)
  {
    v19 = 0;
    v40 = 0;
    *a6 = 1;
    goto LABEL_41;
  }
LABEL_32:
  v19 = 0;
  v40 = 0;
LABEL_41:

  return v40;
}

void __80__BRCFSImporter__parseImportBookmark_templateItem_fileURL_ignoreImportBookmark___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asPrivateClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultAppLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "getOrCreateTrashItemInAppLibrary:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v11 = v6;
      if (!v6)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "db");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] Can't create trash item - %@%@", buf, 0x16u);
      if (!v6)
      {

      }
    }

  }
}

- (id)_locateTemplateItemFromFPFSMigration:(id)a3 fields:(unint64_t *)a4 documentHasChanges:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  _BYTE v47[28];
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a5)
    *a5 = 0;
  if (-[BRCAccountSessionFPFS fpfsMigrationState](self->_session, "fpfsMigrationState") == 1)
  {
    objc_msgSend(v7, "extendedAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.fpfs.fileid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v42 = 0;
    v41 = 0;
    if (!v9 || !objc_msgSend(v9, "getFileIDFromXattr:docID:genCount:", &v43, &v42, &v41))
      goto LABEL_51;
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v45 = (uint64_t)v43;
      v46 = 1024;
      *(_DWORD *)v47 = v42;
      *(_WORD *)&v47[4] = 2048;
      *(_QWORD *)&v47[6] = v41;
      *(_WORD *)&v47[14] = 2112;
      *(_QWORD *)&v47[16] = v10;
      _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_INFO, "[INFO] trying to import from on-disk ID: fileID=%llu docID=%u genCount=%llu%@", buf, 0x26u);
    }

    if (!v42)
    {
      v12 = 0;
      goto LABEL_41;
    }
    -[BRCFSImporter _globalItemByDocumentID:](self, "_globalItemByDocumentID:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asDocument");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      if ((itemsHaveTheSameKind(v12, v7) & 1) == 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v45 = (uint64_t)v12;
          v46 = 2112;
          *(_QWORD *)v47 = v15;
          _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Mismatching type for the found item (%@), ignoring!%@", buf, 0x16u);
        }
        goto LABEL_25;
      }
      if (!v14)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:].cold.3();
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (!v13)
    {
LABEL_26:
      v12 = 0;
LABEL_40:

LABEL_41:
      if (v12)
        goto LABEL_52;
      if (!v43)
        goto LABEL_52;
      -[BRCFSImporter _globalItemByFileID:](self, "_globalItemByFileID:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;
      if (!v33)
        goto LABEL_52;
      if ((itemsHaveTheSameKind(v33, v7) & 1) != 0)
      {
        brc_bread_crumbs();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:].cold.1();

        objc_msgSend(v12, "markDoneMigratingToFPFS");
        goto LABEL_52;
      }
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v45 = (uint64_t)v12;
        v46 = 2112;
        *(_QWORD *)v47 = v36;
        _os_log_impl(&dword_230455000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Mismatching type for the found item (%@), ignoring!%@", buf, 0x16u);
      }

LABEL_51:
      v12 = 0;
LABEL_52:

      goto LABEL_53;
    }
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:].cold.2();

    objc_msgSend(v14, "fileIDForUpload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longLongValue");

    objc_msgSend(v14, "generationIDForUpload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fsGenerationID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedLongLongValue");

    if ((void *)v20 == v43)
    {
      if (objc_msgSend(v14, "isPackage"))
      {
        v40 = v23;
        objc_msgSend(v7, "contentModificationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        v26 = (uint64_t)v25;

        objc_msgSend(v14, "currentVersion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "mtime");

        if (v28 == v26)
        {
          v29 = 0;
        }
        else
        {
          brc_bread_crumbs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218498;
            v45 = v26;
            v46 = 2048;
            *(_QWORD *)v47 = v28;
            *(_WORD *)&v47[8] = 2112;
            *(_QWORD *)&v47[10] = v39;
            _os_log_debug_impl(&dword_230455000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] mtimes don't match %lld vs %lld%@", buf, 0x20u);
          }

          v29 = 1;
        }
        v23 = v40;
      }
      else
      {
        v29 = v23 != v41;
      }
    }
    else
    {
      v29 = 1;
    }
    if (a5)
      *a5 = v29;
    if (v29)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        v45 = v20;
        v46 = 2048;
        *(_QWORD *)v47 = v43;
        *(_WORD *)&v47[8] = 2048;
        *(_QWORD *)&v47[10] = v23;
        *(_WORD *)&v47[18] = 2048;
        *(_QWORD *)&v47[20] = v41;
        v48 = 2112;
        v49 = v31;
        _os_log_debug_impl(&dword_230455000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] We have changes to upload on imported item f:(%llu vs %llu) g:(%llu vs %llu)%@", buf, 0x34u);
      }

    }
    objc_msgSend(v14, "markDoneMigratingToFPFS");
    goto LABEL_40;
  }
  v12 = 0;
LABEL_53:

  return v12;
}

- (id)_findCollidingItemWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  BRCFSImporter *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "parentItemIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDC8230]);

  objc_msgSend(v11, "itemID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__23;
    v44 = __Block_byref_object_dispose__23;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__23;
    v38 = __Block_byref_object_dispose__23;
    v39 = 0;
    objc_msgSend(v11, "appLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "db");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __81__BRCFSImporter__findCollidingItemWithTemplateItem_parentItem_logicalName_error___block_invoke;
    v29 = &unk_24FE449E8;
    v32 = &v34;
    v30 = self;
    v31 = v11;
    v33 = &v40;
    objc_msgSend(v17, "groupInBatch:", &v26);

    v18 = (void *)v41[5];
    if (v18)
    {
      v19 = v18;
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v47 = "-[BRCFSImporter _findCollidingItemWithTemplateItem:parentItem:logicalName:error:]";
        v48 = 2080;
        if (!a6)
          v25 = "(ignored by caller)";
        v49 = v25;
        v50 = 2112;
        v51 = v19;
        v52 = 2112;
        v53 = v20;
        _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a6)
        *a6 = objc_retainAutorelease(v19);
    }
    else
    {
      objc_msgSend((id)v35[5], "itemID", v26, v27, v28, v29, v30);
      v19 = v15;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

    if (v18)
      goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    v23 = 0;
  }
  else
  {
    objc_msgSend(v11, "clientZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "liveItemByParentID:andLogicalName:excludingItemID:", v15, v12, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

void __81__BRCFSImporter__findCollidingItemWithTemplateItem_parentItem_logicalName_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "getOrCreateTrashItemInAppLibrary:error:", v4, &v13);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v7 = v13;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v12 = v7;
      if (!v7)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "db");
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "lastError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v10;
      _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] Can't create trash item - %@%@", buf, 0x16u);
      if (!v7)
      {

      }
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);
  }

}

- (id)_handleCollisionIfNecessaryWithTemplateItem:(id)a3 parentItem:(id)a4 logicalName:(id)a5 fileURL:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  char v9;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  BRCFSImporter *v31;
  char v32;
  void *v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  char v64;
  void *v65;
  id v66;
  NSObject *v67;
  uint8_t buf[4];
  NSObject *v69;
  __int16 v70;
  NSObject *v71;
  __int16 v72;
  NSObject *v73;
  uint64_t v74;

  v9 = a7;
  v74 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a6;
  -[BRCFSImporter _findCollidingItemWithTemplateItem:parentItem:logicalName:error:](self, "_findCollidingItemWithTemplateItem:parentItem:logicalName:error:", v14, a4, a5, a8);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_57;
  if (v15)
  {
    v17 = 0;
    if ((v9 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    -[NSObject contentType](v14, "contentType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "br_isDocumentType");

    if ((v9 & 1) != 0)
    {
LABEL_9:
      v19 = 0;
      goto LABEL_10;
    }
  }
  if ((-[NSObject isInDataScope](v16, "isInDataScope") & 1) != 0
    || !-[NSObject isUserVisible](v16, "isUserVisible")
    || -[BRCFSImporter _isDesktopOrDocumentsItem:](self, "_isDesktopOrDocumentsItem:", v16))
  {
    goto LABEL_9;
  }
  -[NSObject itemID](v16, "itemID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "isDocumentsFolder") & 1) != 0)
  {
    v65 = v54;
    v19 = 1;
LABEL_10:
    v20 = v16;
    v21 = v14;
    v66 = v15;
    -[NSObject parentItemIdentifier](v21, "parentItemIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDC8230]))
    {
      v23 = -[NSObject isInTrashScope](v20, "isInTrashScope");

      if ((v23 & 1) == 0)
      {
        brc_bread_crumbs();
        v67 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v69 = v21;
          v70 = 2112;
          v71 = v20;
          v72 = 2112;
          v73 = v67;
          v25 = "[DEBUG] template item %@ differs in trash-ness from %@%@";
LABEL_20:
          _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x20u);
          goto LABEL_29;
        }
        goto LABEL_29;
      }
    }
    else
    {

    }
    if ((itemsHaveTheSameKind(v20, v21) & 1) != 0)
    {
      -[NSObject extendedAttributes](v21, "extendedAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("com.apple.clouddocs.private.share-bookmark#B"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v67 = v27;
      }
      else
      {
        -[NSObject extendedAttributes](v21, "extendedAttributes");
        v63 = v14;
        v29 = v19;
        v30 = v15;
        v31 = self;
        v32 = v17;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N"));
        v67 = objc_claimAutoreleasedReturnValue();

        v17 = v32;
        self = v31;
        v15 = v30;
        v19 = v29;
        v14 = v63;
      }

      if ((!-[NSObject isSharedToMeTopLevelItem](v20, "isSharedToMeTopLevelItem") || v67)
        && ((-[NSObject isSharedToMe](v20, "isSharedToMe") & 1) != 0 || !v67))
      {
        if (!-[NSObject isDocument](v20, "isDocument"))
        {
          v35 = 1;
LABEL_31:

          if (v19)
          {

            if ((v35 & 1) == 0)
              goto LABEL_33;
          }
          else if (!v35)
          {
LABEL_33:
            if ((v17 & 1) == 0)
              goto LABEL_34;
LABEL_57:
            v45 = 0;
            goto LABEL_58;
          }
          brc_bread_crumbs();
          v43 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v20;
            v70 = 2112;
            v71 = v43;
            _os_log_impl(&dword_230455000, v44, OS_LOG_TYPE_INFO, "[INFO] found item that seems to match template: %@%@", buf, 0x16u);
          }

          -[NSObject markDoneMigratingToFPFS](v20, "markDoneMigratingToFPFS");
          v42 = v20;
          goto LABEL_43;
        }
        -[NSObject asDocument](v20, "asDocument");
        v24 = objc_claimAutoreleasedReturnValue();
        v46 = -[NSObject isPackage](v24, "isPackage");
        v35 = 1;
        if (!v66 || !v46)
        {
LABEL_30:

          goto LABEL_31;
        }
        -[NSObject documentSize](v21, "documentSize");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "longLongValue"))
        {

        }
        else
        {
          v64 = v17;
          -[NSObject currentVersion](v24, "currentVersion");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v55, "size");

          if (!v61)
          {
            v35 = 1;
            v17 = v64;
            goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v66, 0, 0, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = v57;
          objc_msgSend(v57, "nextObject");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v64;
          if (!v58)
          {
            brc_bread_crumbs();
            v60 = objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              v69 = v21;
              v70 = 2112;
              v71 = v24;
              v72 = 2112;
              v73 = v60;
              _os_log_fault_impl(&dword_230455000, v59, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't path-match an empty package %@ to the existing package item %@%@", buf, 0x20u);
            }

            goto LABEL_29;
          }

        }
        v35 = 1;
        goto LABEL_30;
      }
      brc_bread_crumbs();
      v24 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v69 = v21;
        v70 = 2112;
        v71 = v20;
        v72 = 2112;
        v73 = v24;
        _os_log_debug_impl(&dword_230455000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] template item %@ differs in share-bookmark from %@%@", buf, 0x20u);
      }

    }
    else
    {
      brc_bread_crumbs();
      v67 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v69 = v21;
        v70 = 2112;
        v71 = v20;
        v72 = 2112;
        v73 = v67;
        v25 = "[DEBUG] template item %@ differs in kind from %@%@";
        goto LABEL_20;
      }
    }
LABEL_29:
    v35 = 0;
    goto LABEL_30;
  }

  if ((v17 & 1) != 0)
    goto LABEL_57;
LABEL_34:
  -[NSObject st](v16, "st", v60);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fpCreationItemIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject itemIdentifier](v14, "itemIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isEqualToString:", v38);

  if (!v39)
  {
LABEL_53:
    brc_bread_crumbs();
    v50 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v69 = v16;
      v70 = 2112;
      v71 = v14;
      v72 = 2112;
      v73 = v50;
      _os_log_impl(&dword_230455000, v51, OS_LOG_TYPE_INFO, "[INFO] Bouncing item %@ because of %@%@", buf, 0x20u);
    }

    -[BRCAccountSessionFPFS bouncingAnalyzer](self->_session, "bouncingAnalyzer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "analyzeBouncingOfItem:withTemplateItem:", v16, v14);

    -[NSObject markBouncedToNextAvailableBounceNumber:](v16, "markBouncedToNextAvailableBounceNumber:", 504);
    LODWORD(v52) = -[NSObject isMigratingToFPFS](v16, "isMigratingToFPFS");
    -[NSObject markDoneMigratingToFPFS](v16, "markDoneMigratingToFPFS");
    -[NSObject saveToDB](v16, "saveToDB");
    if ((_DWORD)v52)
      -[BRCFSImporter _reportBouncingForMigration:existingItem:](self, "_reportBouncingForMigration:existingItem:", v14, v16);
    goto LABEL_57;
  }
  if (!itemsHaveTheSameKind(v16, v14))
  {
    brc_bread_crumbs();
    v48 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v69 = v16;
      v70 = 2112;
      v71 = v14;
      v72 = 2112;
      v73 = v48;
      _os_log_fault_impl(&dword_230455000, v49, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Items have the same creation identifier but are of differnt kinds %@ vs %@%@", buf, 0x20u);
    }

    goto LABEL_53;
  }
  brc_bread_crumbs();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[BRCFSImporter _handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:].cold.1();

  v42 = v16;
LABEL_43:
  v45 = v42;
LABEL_58:

  return v45;
}

- (id)_locateMatchingItemForTemplateItem:(id)a3 parentItem:(id)a4 options:(unint64_t)a5 fileURL:(id)a6 fields:(unint64_t *)a7 shouldReject:(BOOL *)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 ignoreImportBookmark:(BOOL *)a11 stillPendingFields:(unint64_t *)a12 error:(id *)a13
{
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  NSObject *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  char v69;
  uint64_t v70;
  char v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  const char *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  id v93;
  void *v94;
  NSObject *v95;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  void *v102;
  NSObject *v103;
  BOOL v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  _QWORD v109[5];
  id v110;
  id v111;
  id v112;
  uint64_t *v113;
  _BYTE *v114;
  unint64_t *v115;
  unint64_t *v116;
  BOOL v117;
  _QWORD v118[7];
  char v119;
  char v120;
  uint64_t v121;
  _QWORD v122[4];
  id v123;
  uint8_t v124[4];
  const char *v125;
  __int16 v126;
  const char *v127;
  __int16 v128;
  id v129;
  __int16 v130;
  void *v131;
  _BYTE buf[24];
  uint64_t (*v133)(uint64_t, uint64_t);
  __int128 v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v107 = a4;
  v20 = a6;
  v105 = a9;
  v106 = a10;
  v121 = 0;
  v122[0] = &v121;
  v122[1] = 0x3032000000;
  v122[2] = __Block_byref_object_copy__23;
  v122[3] = __Block_byref_object_dispose__23;
  v123 = 0;
  v120 = 0;
  objc_msgSend(v19, "filename");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 1) == 0)
    goto LABEL_5;
  -[BRCFSImporter _locateTemplateItemFromFPFSMigration:fields:documentHasChanges:](self, "_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:", v19, a7, &v120);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(v122[0] + 40);
  *(_QWORD *)(v122[0] + 40) = v21;

  v23 = *(_QWORD *)(v122[0] + 40);
  v24 = v23 != 0;
  if (v106 && !v23)
  {
    -[BRCFSImporter _parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:](self, "_parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:", v106, v19, v20, a11);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(v122[0] + 40);
    *(_QWORD *)(v122[0] + 40) = v25;

LABEL_5:
    v24 = 0;
  }
  v104 = v24;
  v27 = *(void **)(v122[0] + 40);
  if (v27 && (itemsHaveTheSameKind(v27, v19) & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      v97 = *(_QWORD *)(v122[0] + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v133 = v28;
      _os_log_fault_impl(&dword_230455000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Items dont have the same kind so can't be matched! %@ vs %@%@", buf, 0x20u);
    }

    v30 = *(void **)(v122[0] + 40);
    *(_QWORD *)(v122[0] + 40) = 0;

  }
  v31 = 0;
  *a8 = 0;
  if (!v20)
  {
    objc_msgSend(v19, "contentType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "br_isDocumentType") & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      objc_msgSend(v19, "contentType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v33, "br_isAliasFileType");

    }
    if ((((a5 & 1) == 0) & v31) == 1)
    {
      brc_bread_crumbs();
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
        -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:].cold.4();

      v31 = 1;
    }
  }
  v119 = 0;
  if (-[BRCFSImporter _shouldRejectItemWithName:templateItem:existingItem:options:shouldRemoveItemFromDrive:](self, "_shouldRejectItemWithName:templateItem:existingItem:options:shouldRemoveItemFromDrive:", v108, v19, *(_QWORD *)(v122[0] + 40), a5, &v119))
  {
    *a8 = 1;
    v34 = *(void **)(v122[0] + 40);
    if (v34 && v119)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v133 = __Block_byref_object_copy__23;
      *(_QWORD *)&v134 = __Block_byref_object_dispose__23;
      *((_QWORD *)&v134 + 1) = 0;
      objc_msgSend(v34, "db");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x24BDAC760];
      v118[1] = 3221225472;
      v118[2] = __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke;
      v118[3] = &unk_24FE44A10;
      v118[5] = &v121;
      v118[6] = buf;
      v118[4] = self;
      objc_msgSend(v35, "groupInBatch:", v118);

      v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v36)
      {
        v37 = v36;
        brc_bread_crumbs();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
        {
          v98 = "(passed to caller)";
          *(_DWORD *)v124 = 136315906;
          v125 = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:addit"
                 "ionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          v126 = 2080;
          if (!a13)
            v98 = "(ignored by caller)";
          v127 = v98;
          v128 = 2112;
          v129 = v37;
          v130 = 2112;
          v131 = v38;
          _os_log_error_impl(&dword_230455000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v124, 0x2Au);
        }

        if (a13)
          *a13 = objc_retainAutorelease(v37);

      }
      _Block_object_dispose(buf, 8);

    }
    else if (v34 && (objc_msgSend(v34, "saveToDB") & 1) == 0)
    {
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "lastError");
      v58 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        brc_bread_crumbs();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
        {
          v101 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shou"
                               "ldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a13)
            v101 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v101;
          *(_WORD *)&buf[22] = 2112;
          v133 = v58;
          LOWORD(v134) = 2112;
          *(_QWORD *)((char *)&v134 + 2) = v59;
          _os_log_error_impl(&dword_230455000, v60, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a13)
        *a13 = objc_retainAutorelease(v58);

    }
    goto LABEL_93;
  }
  v40 = v122[0];
  v41 = *(void **)(v122[0] + 40);
  if (v41)
    goto LABEL_32;
  -[BRCFSImporter _handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:](self, "_handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:", v19, v107, v108, v20, a5, a13);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(void **)(v122[0] + 40);
  *(_QWORD *)(v122[0] + 40) = v42;

  v44 = *(void **)(v122[0] + 40);
  if (v44 && (itemsHaveTheSameKind(v44, v19) & 1) == 0)
  {
    brc_bread_crumbs();
    v45 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      v100 = *(_QWORD *)(v122[0] + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v133 = v45;
      _os_log_fault_impl(&dword_230455000, v46, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't match items of different kind! %@ vs %@%@", buf, 0x20u);
    }

    v47 = *(void **)(v122[0] + 40);
    *(_QWORD *)(v122[0] + 40) = 0;

  }
  v40 = v122[0];
  v41 = *(void **)(v122[0] + 40);
  if (v41)
  {
LABEL_32:
    if (v31)
    {
      *a7 &= ~1uLL;
      v41 = *(void **)(v40 + 40);
    }
    v48 = objc_msgSend(v41, "syncUpState");
    if (!v20 && v48 == 7)
    {
      objc_msgSend(*(id *)(v122[0] + 40), "clientZone");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v122[0] + 40), "itemID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "serverItemByItemID:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v52;
        _os_log_impl(&dword_230455000, v53, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find file id for %@.  Updating from server item because we have no way to get its content%@", buf, 0x16u);
      }

      v54 = objc_msgSend(v51, "newLocalItemWithDBRowID:", objc_msgSend(*(id *)(v122[0] + 40), "dbRowID"));
      v55 = *(void **)(v122[0] + 40);
      *(_QWORD *)(v122[0] + 40) = v54;

    }
    if (objc_msgSend(*(id *)(v122[0] + 40), "syncUpState"))
      v56 = objc_msgSend(*(id *)(v122[0] + 40), "isMigratingToFPFS");
    else
      v56 = 1;
    if ((objc_msgSend(*(id *)(v122[0] + 40), "isDocument") & v56) == 1 && (*(_BYTE *)a7 & 1) != 0)
    {
      objc_msgSend(*(id *)(v122[0] + 40), "asDocument");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "currentVersion");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "mtime");
      objc_msgSend(v19, "contentModificationDate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "timeIntervalSince1970");
      v66 = v65;

      objc_msgSend(v61, "currentVersion");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "versionSignature");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "isPendingSignature");

      v70 = objc_msgSend(v61, "localDiffs");
      if (trunc(v66) == (double)v63 && v120 == 0)
        v72 = v69;
      else
        v72 = 1;
      if ((v72 & 1) == 0 && (v70 & 0x180000) == 0)
      {
        if ((objc_msgSend(v61, "isPackage") & 1) != 0)
          goto LABEL_62;
        objc_msgSend(v61, "currentVersion");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "size");
        objc_msgSend(v19, "documentSize");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v74) = v74 == objc_msgSend(v75, "longLongValue");

        if ((_DWORD)v74)
        {
LABEL_62:
          brc_bread_crumbs();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:].cold.3();

          *a7 &= ~1uLL;
        }
      }

    }
    if (objc_msgSend(v107, "isSharedToMe") && (objc_msgSend(v107, "sharingOptions") & 0x20) != 0)
    {
      brc_bread_crumbs();
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v87;
        _os_log_impl(&dword_230455000, v88, OS_LOG_TYPE_DEFAULT, "[WARNING] This isn't implemented yet in FPFS%@", buf, 0xCu);
      }

      brc_bread_crumbs();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:].cold.2((uint64_t)v122);

      objc_msgSend(*(id *)(v122[0] + 40), "saveToDB");
      if ((a5 & 1) == 0)
      {
        brc_bread_crumbs();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
          -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:].cold.1((uint64_t)v122);

      }
    }
    else
    {
      v78 = *(void **)(v122[0] + 40);
      if (!v78)
      {
LABEL_88:
        v93 = v78;
        goto LABEL_94;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v133 = __Block_byref_object_copy__23;
      *(_QWORD *)&v134 = __Block_byref_object_dispose__23;
      *((_QWORD *)&v134 + 1) = 0;
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = MEMORY[0x24BDAC760];
      v109[1] = 3221225472;
      v109[2] = __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke_35;
      v109[3] = &unk_24FE44A38;
      v109[4] = self;
      v113 = &v121;
      v115 = a7;
      v80 = v19;
      v110 = v80;
      v111 = v20;
      v117 = v104;
      v116 = a12;
      v112 = v105;
      v114 = buf;
      objc_msgSend(v79, "groupInTransaction:", v109);

      v81 = *(id *)(*(_QWORD *)&buf[8] + 40);
      if (v81)
      {
        brc_bread_crumbs();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, (os_log_type_t)0x90u))
        {
          v99 = "(passed to caller)";
          *(_DWORD *)v124 = 136315906;
          v125 = "-[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:addit"
                 "ionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:]";
          v126 = 2080;
          if (!a13)
            v99 = "(ignored by caller)";
          v127 = v99;
          v128 = 2112;
          v129 = v81;
          v130 = 2112;
          v131 = v82;
          _os_log_error_impl(&dword_230455000, v83, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v124, 0x2Au);
        }

      }
      if (a13)
        *a13 = objc_retainAutorelease(v81);

      if ((a5 & 1) == 0)
      {
        brc_bread_crumbs();
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          v86 = *(const char **)(v122[0] + 40);
          *(_DWORD *)v124 = 138412802;
          v125 = v86;
          v126 = 2112;
          v127 = (const char *)v80;
          v128 = 2112;
          v129 = v84;
          _os_log_impl(&dword_230455000, v85, OS_LOG_TYPE_DEFAULT, "[WARNING] Merging existing item without may already exist flag %@ with template %@%@", v124, 0x20u);
        }

      }
      _Block_object_dispose(buf, 8);

    }
    v78 = *(void **)(v122[0] + 40);
    goto LABEL_88;
  }
  if (!v31)
  {
LABEL_93:
    v93 = 0;
    goto LABEL_94;
  }
  brc_bread_crumbs();
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v95 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v94;
    _os_log_impl(&dword_230455000, v95, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejecting dataless item which doesn't exist in our db%@", buf, 0xCu);
  }

  v93 = 0;
  *a8 = 1;
LABEL_94:

  _Block_object_dispose(&v121, 8);
  return v93;
}

void __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "markRemovedFromFilesystemRecursively:", 1);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "saveToDB") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "clientDB");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastError");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

uint64_t __176__BRCFSImporter__locateMatchingItemForTemplateItem_parentItem_options_fileURL_fields_shouldReject_additionalAttrs_importBookmark_ignoreImportBookmark_stillPendingFields_error___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  id obj;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v4 = *(_QWORD *)(a1 + 88);
  v5 = **(_QWORD **)(a1 + 80);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_BYTE *)(a1 + 96) == 0;
  v11 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v11 + 40);
  LOBYTE(v16) = v10;
  v12 = objc_msgSend(v6, "changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:", v3, 0, v5, v7, v8, v9, v16, v4, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((v12 & 1) == 0)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  return v12;
}

- (id)_createAndInsertNewItemWithImportObject:(id)a3 parentItem:(id)a4 fields:(unint64_t)a5 templateItem:(id)a6 fileURL:(id)a7 options:(unint64_t)a8 additionalAttrs:(id)a9 importBookmark:(id)a10 stillPendingFields:(unint64_t *)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  const char *v35;
  id v36;
  _QWORD v38[4];
  id v39;
  BRCFSImporter *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v36 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__23;
  v61 = __Block_byref_object_dispose__23;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__23;
  v55 = __Block_byref_object_dispose__23;
  v56 = 0;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke;
  v38[3] = &unk_24FE44A60;
  v23 = v17;
  v39 = v23;
  v40 = self;
  v46 = &v57;
  v48 = a5;
  v24 = v18;
  v41 = v24;
  v25 = v19;
  v42 = v25;
  v26 = v20;
  v49 = a11;
  v43 = v26;
  v47 = &v51;
  v27 = v21;
  v44 = v27;
  v28 = v36;
  v45 = v28;
  v50 = a8;
  v29 = objc_msgSend(v22, "groupInTransaction:", v38);

  if ((v29 & 1) == 0)
  {
    v30 = (id)v52[5];
    if (v30)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v64 = "-[BRCFSImporter _createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:add"
              "itionalAttrs:importBookmark:stillPendingFields:error:]";
        v65 = 2080;
        if (!a12)
          v35 = "(ignored by caller)";
        v66 = v35;
        v67 = 2112;
        v68 = v30;
        v69 = 2112;
        v70 = v31;
        _os_log_error_impl(&dword_230455000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a12)
      *a12 = objc_retainAutorelease(v30);

  }
  if (v29)
    v33 = (id)v58[5];
  else
    v33 = 0;
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v33;
}

uint64_t __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v52;
  id v53;
  id v54;
  id obj;
  id v56;

  if (objc_msgSend(*(id *)(a1 + 32), "isDocumentsFolder"))
  {
    objc_msgSend(*(id *)(a1 + 32), "appLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentsFolder");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_3();

      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_2(a1 + 88);

      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      v11 = *(void **)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 104);
      v16 = *(_QWORD *)(a1 + 112);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v56 = *(id *)(v17 + 40);
      LOBYTE(v52) = 1;
      v18 = objc_msgSend(v11, "changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:", v10, 0, v15, v12, v13, v14, v52, v16, &v56);
      v19 = v56;
      v20 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v19;
LABEL_29:

      return v18;
    }
  }
  v22 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 72);
  v24 = *(_QWORD *)(a1 + 80);
  v25 = *(_QWORD *)(a1 + 120);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  obj = *(id *)(v26 + 40);
  objc_msgSend(v21, "_createBaseItemWithImportObject:importBookmark:parentItem:options:error:", v22, v23, v24, v25, &obj);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v26 + 40), obj);
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v27;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    return 0;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "_changeBasicFieldsOnItem:fields:template:");
    objc_msgSend(*(id *)(a1 + 48), "parentItemIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BDC8230]))
    {
      v31 = objc_msgSend(*(id *)(a1 + 80), "isInTrashScope");

      if ((v31 & 1) == 0)
      {
        v32 = *(void **)(a1 + 40);
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v54 = *(id *)(v34 + 40);
        v35 = objc_msgSend(v32, "_trashItem:error:", v33, &v54);
        objc_storeStrong((id *)(v34 + 40), v54);
        if ((v35 & 1) == 0)
          return 0;
      }
    }
    else
    {

    }
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "isDirectory")
    || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "asDirectory"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        v37 = objc_msgSend(v36, "handlePathMatchConflictForDirectoryCreationIfNecessary"),
        v36,
        (v37 & 1) == 0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "markNeedsUploadOrSyncingUp");
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "saveToDB") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "db");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lastError");
      v47 = objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
          __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_1(v47, (uint64_t)v48, v49);

      }
      v18 = 0;
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v20 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = v47;
      goto LABEL_29;
    }
  }
  if (!*(_QWORD *)(a1 + 56))
    goto LABEL_22;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "isDocument"))
    goto LABEL_22;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "needsUpload"))
    goto LABEL_22;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "stageRegistry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "liveStageFilename");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v53 = *(id *)(v41 + 40);
  v18 = objc_msgSend(v38, "moveFromURLToLiveStage:liveStageFilename:error:", v39, v40, &v53);
  objc_storeStrong((id *)(v41 + 40), v53);

  if ((_DWORD)v18)
  {
LABEL_22:
    if ((*(_BYTE *)(a1 + 120) & 1) != 0)
      return 1;
    v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 48), "itemIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updateFPCreationItemIdentifier:", v43);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientState");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("most-recent-item-creation-date"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "forceBatchStart");
    v18 = 1;
    goto LABEL_29;
  }
  return v18;
}

- (id)importAppLibraryRootFromTemplateItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  BRCFSImporter *v17;
  _BYTE *v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE17640]);
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithMangledString:", v6);

  -[BRCAccountSessionFPFS appLibraryByMangledID:](self->_session, "appLibraryByMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    brc_bread_crumbs();
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v20 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Importing an existing app library %@ with mangledID %@%@", buf, 0x20u);
    }

  }
  else
  {
    -[BRCAccountSessionFPFS getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self->_session, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__23;
  v21 = __Block_byref_object_dispose__23;
  v22 = 0;
  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BRCFSImporter_importAppLibraryRootFromTemplateItem___block_invoke;
  block[3] = &unk_24FE433F0;
  v16 = v8;
  v17 = self;
  v18 = buf;
  v12 = v8;
  dispatch_async_and_wait(v11, block);

  v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v13;
}

void __54__BRCFSImporter_importAppLibraryRootFromTemplateItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BRCNotification *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRootItemInDB:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v10, 0);
  v5 = (void *)MEMORY[0x24BE17670];
  objc_msgSend(*(id *)(a1 + 32), "containerMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerItemForContainer:withRepresentativeItem:", v6, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)importNewItemAtURL:(id)a3 parentItem:(id)a4 templateItem:(id)a5 fields:(unint64_t)a6 options:(unint64_t)a7 additionalItemAttributes:(id)a8 importBookmark:(id)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v27;
  BRCAccountSessionFPFS *session;
  id v29;
  BRCImportObject *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BRCImportObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  char v53;
  char v54;
  unint64_t v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v17 = a4;
  v18 = a5;
  v55 = a6;
  v19 = a8;
  v20 = a9;
  v54 = 0;
  objc_msgSend(v18, "filename");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v51 = v17;
  v52 = 0;
  -[BRCFSImporter _locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:](self, "_locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:", v18, v17, a7, v50, &v55, &v54, v19, v20, &v53, a10, &v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v52;
  v23 = v22;
  if (v22)
  {
    if (a11)
    {
      v24 = 0;
      *a11 = objc_retainAutorelease(v22);
LABEL_6:
      v25 = v21;
      goto LABEL_7;
    }
LABEL_5:
    v24 = 0;
    goto LABEL_6;
  }
  if (v54)
    goto LABEL_5;
  if (v53)
  {

    v20 = 0;
  }
  if (!v21)
  {
    -[BRCAccountSessionFPFS updateFPFSMigrationNewItemsInDB](self->_session, "updateFPFSMigrationNewItemsInDB");
    v29 = v50;
    if (v50)
    {
      v30 = -[BRCImportObject initWithURL:logicalName:quarantineInfo:parentItem:error:]([BRCImportObject alloc], "initWithURL:logicalName:quarantineInfo:parentItem:error:", v50, v49, 0, v51, a11);
      if (!v30)
        goto LABEL_5;
    }
    else
    {
      objc_msgSend(v18, "contentType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v38, "br_isSymbolicLinkType");

      if (v46)
      {
        objc_msgSend(v18, "symlinkTargetPath");
        v39 = objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("symlink-target"));
          v39 = objc_claimAutoreleasedReturnValue();
        }
        v47 = (void *)v39;
        v40 = -[BRCImportObject initAsSymlinkWithTarget:parentItem:logicalName:error:]([BRCImportObject alloc], "initAsSymlinkWithTarget:parentItem:logicalName:error:", v39, v51, v49, a11);

        v30 = v40;
      }
      else
      {
        objc_msgSend(v18, "contentType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v41, "br_isDirectoryType");

        if (!v48)
        {
          brc_bread_crumbs();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
            -[BRCFSImporter importNewItemAtURL:parentItem:templateItem:fields:options:additionalItemAttributes:importBookmark:stillPendingFields:error:].cold.1();

          v24 = 0;
          goto LABEL_30;
        }
        v30 = -[BRCImportObject initAsNewDirectoryWithLogicalName:parentItem:]([BRCImportObject alloc], "initAsNewDirectoryWithLogicalName:parentItem:", v49, v51);
      }
      v29 = 0;
      if (!v30)
        goto LABEL_5;
    }
    v42 = v30;
    -[BRCFSImporter _createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:additionalAttrs:importBookmark:stillPendingFields:error:](self, "_createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:additionalAttrs:importBookmark:stillPendingFields:error:", v30, v51, v55, v18, v29, a7, v19, v20, a10, a11);
    v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v25 = 0;

    goto LABEL_7;
  }
  v25 = v21;
  v27 = objc_msgSend(v21, "isPackage");
  session = self->_session;
  if (v27)
  {
    -[BRCAccountSessionFPFS updateFPFSMigrationMigratedTypesWithPackage](self->_session, "updateFPFSMigrationMigratedTypesWithPackage");
  }
  else
  {
    objc_msgSend(v21, "st");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS updateFPFSMigrationMigratedTypes:](session, "updateFPFSMigrationMigratedTypes:", objc_msgSend(v31, "type"));

  }
  v32 = objc_msgSend(v21, "isMigratingToFPFS");
  v33 = objc_msgSend(v21, "dbItemIsMigratingToFPFS");
  v34 = v33;
  if ((v32 & 1) != 0 || v33)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      v44 = "not-migrating";
      *(_DWORD *)buf = 138413058;
      v57 = v25;
      if (v32)
        v45 = "migrating";
      else
        v45 = "not-migrating";
      v58 = 2080;
      v59 = v45;
      if (v34)
        v44 = "migrating";
      v60 = 2080;
      v61 = v44;
      v62 = 2112;
      v63 = v35;
      _os_log_fault_impl(&dword_230455000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item %@ local state: %s db state: %s%@", buf, 0x2Au);
    }

    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("FPFSMigration"), CFSTR("MigratingItem"), 0);

  }
  v24 = v25;
LABEL_7:

  return v24;
}

- (id)createAndImportNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[BRCImportObject initAsNewDirectoryWithLogicalName:parentItem:]([BRCImportObject alloc], "initAsNewDirectoryWithLogicalName:parentItem:", v8, v9);
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "isUnixDir") & 1) == 0)
      -[BRCFSImporter createAndImportNewDirectoryWithLogicalName:parentItem:error:].cold.1();
    -[BRCFSImporter _createBaseItemWithImportObject:importBookmark:parentItem:options:error:](self, "_createBaseItemWithImportObject:importBookmark:parentItem:options:error:", v11, 0, v9, 0, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asDirectory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "handlePathMatchConflictForDirectoryCreationIfNecessary")
      || (objc_msgSend(v13, "markNeedsUploadOrSyncingUp"), (objc_msgSend(v13, "saveToDB") & 1) != 0))
    {
      v14 = v13;
      v15 = 0;
    }
    else
    {
      objc_msgSend(v13, "db");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v15 = v20;
      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v9, "itemID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "debugItemIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "brc_errorItemNotFound:", v24);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a5)
        *a5 = objc_retainAutorelease(v15);
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        objc_msgSend(v9, "itemID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138413058;
        v31 = v8;
        v32 = 2112;
        v33 = v29;
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v25;
        _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] Fail to create new directory with name %@ and parent %@. Returning error %@%@", (uint8_t *)&v30, 0x2Au);

      }
      v14 = 0;
    }

  }
  else
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      objc_msgSend(v9, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v8;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v16;
      _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] Fail to create directory import object with name %@ and parent %@%@", (uint8_t *)&v30, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (a5)
    {
      v15 = objc_retainAutorelease(v18);
      v14 = 0;
      *a5 = v15;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)getOrCreateTrashItemInAppLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v6 = a3;
  objc_msgSend(v6, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBatchSuspended");

  if ((v8 & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCFSImporter getOrCreateTrashItemInAppLibrary:error:].cold.2();

  }
  objc_msgSend(v6, "documentsFolderItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultClientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE175A0];
  objc_msgSend(v10, "itemByParentID:andLogicalName:", v9, *MEMORY[0x24BE175A0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v6, "defaultClientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemByItemID:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asDirectory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 || (objc_msgSend(v6, "createDocumentsFolder"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BRCFSImporter createAndImportNewDirectoryWithLogicalName:parentItem:error:](self, "createAndImportNewDirectoryWithLogicalName:parentItem:error:", v11, v16, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
        -[BRCFSImporter getOrCreateTrashItemInAppLibrary:error:].cold.1();

      v13 = 0;
    }

  }
  return v13;
}

- (BOOL)trashItem:(id)a3 parentItemInTrash:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  char *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  char *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInTransaction");

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.4();

  }
  if (objc_msgSend(v8, "isSharedToMe"))
  {
    brc_bread_crumbs();
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We can't trash shared-to-me items. Marking dead%@", buf, 0xCu);
    }

    v14 = 1;
    objc_msgSend(v8, "markRemovedFromFilesystemRecursively:", 1);
  }
  else
  {
    objc_msgSend(v8, "appLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    -[BRCFSImporter getOrCreateTrashItemInAppLibrary:error:](self, "getOrCreateTrashItemInAppLibrary:error:", v15, &v52);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v52;

    v14 = v16 != 0;
    if (v16)
    {
      if (v9
        && (objc_msgSend(v16, "itemGlobalID"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "itemGlobalID"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v18, "isEqual:", v19),
            v19,
            v18,
            !v20))
      {
        v21 = 0;
        v23 = 0;
      }
      else
      {
        objc_msgSend(v8, "computeItemPathRelativeToRoot");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "st");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "parentID");
        v23 = objc_claimAutoreleasedReturnValue();

        v24 = v16;
        v9 = v24;
      }
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "itemID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "debugItemIDString");
        v50 = (char *)objc_claimAutoreleasedReturnValue();
        -[NSObject debugItemIDString](v23, "debugItemIDString");
        v41 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v54 = v50;
        v55 = 2112;
        v56 = v21;
        v57 = 2112;
        v58 = v41;
        v42 = (void *)v41;
        v59 = 2112;
        v60 = v29;
        _os_log_debug_impl(&dword_230455000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ put back: path [%@] parentID [%@]%@", buf, 0x2Au);

      }
      v49 = v17;

      if (objc_msgSend(v9, "itemScope") != 3)
      {
        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.2();

      }
      objc_msgSend(v9, "clientZone", v21);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itemID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "st");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logicalName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v31, "existsByParentID:andLogicalName:excludingItemID:", v32, v34, v35);

      objc_msgSend(v9, "itemGlobalID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v48;
      objc_msgSend(v8, "updateToBeInTrashWithParent:trashPutBackPath:trashPutBackParentID:", v37, v48, v23);

      if (v36)
        objc_msgSend(v8, "markBouncedToNextAvailableBounceNumber:", 508);
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      v17 = v49;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.1();

      v14 = v16 != 0;
    }
    else
    {
      v25 = v17;
      if (v25)
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          v43 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v54 = "-[BRCFSImporter trashItem:parentItemInTrash:error:]";
          v55 = 2080;
          if (!a5)
            v43 = "(ignored by caller)";
          v56 = (uint64_t)v43;
          v57 = 2112;
          v58 = (uint64_t)v25;
          v59 = 2112;
          v60 = v26;
          _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v25);

      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.3();
    }

  }
  return v14;
}

- (BOOL)_trashItem:(id)a3 error:(id *)a4
{
  return -[BRCFSImporter trashItem:parentItemInTrash:error:](self, "trashItem:parentItemInTrash:error:", a3, 0, a4);
}

- (BOOL)_processParentAndFilenameIfNecessaryWithLocalItem:(id)a3 changedFields:(unint64_t)a4 templateItem:(id)a5 error:(id *)a6
{
  char v8;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  unsigned __int16 v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  const char *v63;
  void *v64;
  NSObject *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  BRCFSImporter *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v8 = a4;
  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __100__BRCFSImporter__processParentAndFilenameIfNecessaryWithLocalItem_changedFields_templateItem_error___block_invoke;
  v66[3] = &unk_24FE44A88;
  v12 = v10;
  v67 = v12;
  v13 = v11;
  v68 = v13;
  v69 = self;
  v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v66);
  if ((v8 & 4) != 0)
  {
    objc_msgSend(v13, "parentItemIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDC8230]);

    if (v21)
    {
      if ((v8 & 2) != 0)
      {
        objc_msgSend(v13, "filename");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateWithLogicalName:newParent:", v22, 0);

      }
      if (-[BRCFSImporter _trashItem:error:](self, "_trashItem:error:", v12, a6))
        goto LABEL_54;
      goto LABEL_48;
    }
    objc_msgSend(v13, "parentItemIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDC8228]);

    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:].cold.4();

      if ((objc_msgSend(v12, "isInTrashScope") & 1) == 0)
      {
        brc_bread_crumbs();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
          -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:].cold.3();

      }
      objc_msgSend(v12, "appLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fetchDocumentsDirectoryItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fileObjectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = (void *)MEMORY[0x24BE17628];
      objc_msgSend(v13, "parentItemIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fileObjectIDWithString:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v29)
    {
      v45 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v13, "parentItemIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "brc_errorInvalidParameter:value:", CFSTR("parentItemIdentifier"), v46);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        brc_bread_crumbs();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
        {
          v63 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
          v72 = 2080;
          if (!a6)
            v63 = "(ignored by caller)";
          v73 = v63;
          v74 = 2112;
          v75 = v29;
          v76 = 2112;
          v77 = v47;
          _os_log_error_impl(&dword_230455000, v48, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v29);
      goto LABEL_47;
    }
    objc_msgSend(v12, "session");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "itemByFileObjectID:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "asDirectory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 && !objc_msgSend(v33, "isDead"))
    {
      v49 = -[BRCFSImporter capabilityToMoveItem:toNewParentItem:error:](self, "capabilityToMoveItem:toNewParentItem:error:", v12, v33, 0);
      if ((v8 & 6) == 0 || (v49 & 0x35FB) != 0)
      {
        if ((v8 & 2) != 0)
        {
          objc_msgSend(v13, "filename");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "st");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "logicalName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v33, "clientZone");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "itemID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = ((uint64_t (**)(_QWORD, void *, void *, void *, void *))v14)[2](v14, v58, v59, v60, v33);

        if ((v61 & 1) == 0)
        {
LABEL_46:

LABEL_47:
          goto LABEL_48;
        }
      }
      else
      {
        brc_bread_crumbs();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v71 = (const char *)v12;
          v72 = 2112;
          v73 = (const char *)v33;
          v74 = 2112;
          v75 = v50;
          _os_log_debug_impl(&dword_230455000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't reparent to folder: undoing reparent on %@ to %@%@", buf, 0x20u);
        }

        v33 = 0;
      }

LABEL_54:
      v56 = 1;
      goto LABEL_55;
    }
    if ((objc_msgSend(v33, "isDead") & 1) != 0
      || (objc_msgSend(v12, "session"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v34, "recentsEnumerator"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_msgSend(v35, "hasDeletedFileObjectID:", v29),
          v35,
          v34,
          v36))
    {
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:].cold.1();

      v39 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v13, "parentItemIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "brc_errorParentItemRemotelyDeleted:", v40);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_43;
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, (os_log_type_t)0x90u))
      {
LABEL_42:

LABEL_43:
        if (a6)
        {
          v41 = objc_retainAutorelease(v41);
          *a6 = v41;
        }

        goto LABEL_46;
      }
      v44 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
      v72 = 2080;
      if (!a6)
        v44 = "(ignored by caller)";
    }
    else
    {
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:].cold.2();

      v54 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v13, "parentItemIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "brc_errorItemNotFound:", v55);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_43;
      brc_bread_crumbs();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, (os_log_type_t)0x90u))
        goto LABEL_42;
      v44 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v71 = "-[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:]";
      v72 = 2080;
      if (!a6)
        v44 = "(ignored by caller)";
    }
    v73 = v44;
    v74 = 2112;
    v75 = v41;
    v76 = 2112;
    v77 = v42;
    _os_log_error_impl(&dword_230455000, v43, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_42;
  }
  if ((v8 & 2) == 0)
    goto LABEL_54;
  objc_msgSend(v13, "filename");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parentClientZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "st");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "parentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = ((uint64_t (**)(_QWORD, void *, void *, void *, _QWORD))v14)[2](v14, v15, v16, v18, 0);

  if (v19)
    goto LABEL_54;
LABEL_48:
  v56 = 0;
LABEL_55:

  return v56;
}

uint64_t __100__BRCFSImporter__processParentAndFilenameIfNecessaryWithLocalItem_changedFields_templateItem_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "liveItemByParentID:andLogicalName:excludingItemID:", v12, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 40);
      v21 = 138412802;
      v22 = v15;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_INFO, "[INFO] Bouncing item %@ because of %@%@", (uint8_t *)&v21, 0x20u);
    }

    objc_msgSend(v15, "markBouncedToNextAvailableBounceNumber:", 505);
    v19 = objc_msgSend(v15, "isMigratingToFPFS");
    objc_msgSend(v15, "markDoneMigratingToFPFS");
    objc_msgSend(v15, "saveToDB");
    if (v19)
      objc_msgSend(*(id *)(a1 + 48), "_reportBouncingForMigration:existingItem:", *(_QWORD *)(a1 + 40), v15);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateWithLogicalName:newParent:", v9, v10);

  return 1;
}

- (void)_learnEtagsIfNecessaryWithItem:(id)a3 changedFields:(unint64_t)a4 baseVersion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BRFieldContentSignature *v11;
  int v12;
  BRFieldContentSignature *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BRFieldStructureSignature *v28;
  void *v29;
  BRFieldStructureSignature *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isDocument"))
  {
    objc_msgSend(v7, "asDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDocumentBeingCopiedToNewZone");

    if ((v10 & 1) != 0)
      goto LABEL_19;
  }
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v8, "contentVersion");
    v11 = (BRFieldContentSignature *)objc_claimAutoreleasedReturnValue();
    if (!-[BRFieldContentSignature length](v11, "length"))
    {
LABEL_11:

      goto LABEL_12;
    }
    v12 = objc_msgSend(v7, "isDocument");

    if (v12)
    {
      v13 = [BRFieldContentSignature alloc];
      objc_msgSend(v8, "contentVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[BRFieldContentSignature initWithData:](v13, "initWithData:", v14);

      objc_msgSend(v7, "asDocument");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "versionSignature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[BRFieldContentSignature isEquivalentToSignature:](v11, "isEquivalentToSignature:", v17))
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[BRFieldContentSignature versionIdentifier](v11, "versionIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "versionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138412802;
          v41 = v20;
          v42 = 2112;
          v43 = v21;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Base version differs from local version content! overwriting our local version (%@ vs %@)%@", (uint8_t *)&v40, 0x20u);

        }
        objc_msgSend(v7, "asDocument");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentVersion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "ckInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRFieldContentSignature etag](v11, "etag");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setEtag:", v25);

      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (a4 >= 2)
  {
    objc_msgSend(v8, "metadataVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
    {
      v28 = [BRFieldStructureSignature alloc];
      objc_msgSend(v8, "metadataVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[BRFieldStructureSignature initWithData:](v28, "initWithData:", v29);

      objc_msgSend(v7, "st");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "versionSignature");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[BRFieldStructureSignature isEquivalentToSignature:](v30, "isEquivalentToSignature:", v32))
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          -[BRFieldStructureSignature versionIdentifier](v30, "versionIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "versionIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 138412802;
          v41 = v35;
          v42 = 2112;
          v43 = v36;
          v44 = 2112;
          v45 = v33;
          _os_log_impl(&dword_230455000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Base version differs from local version structure! overwriting our local version (%@ vs %@)%@", (uint8_t *)&v40, 0x20u);

        }
        objc_msgSend(v7, "st");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ckInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRFieldStructureSignature etag](v30, "etag");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setEtag:", v39);

      }
    }
  }
LABEL_19:

}

- (BOOL)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 newValues:(id)a6 contents:(id)a7 additionalAttrs:(id)a8 clearCKInfoOnSyncUp:(BOOL)a9 stillPendingFields:(unint64_t *)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  BRCImportObject *v23;
  NSObject *v24;
  BRCImportObject *v25;
  BOOL v26;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  BRCImportObject *v38;
  void *v39;
  BRCImportObject *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  char *v46;
  NSObject *v47;
  NSObject *v48;
  BRCImportObject *v49;
  BOOL v50;
  void *v51;
  NSObject *v52;
  int v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  int v72;
  char *v73;
  id v74;
  BRCImportObject *v75;
  BRCImportObject *v76;
  id v77;
  id v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  BRCImportObject *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v74 = a8;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isInTransaction");

  if ((v22 & 1) == 0)
  {
    brc_bread_crumbs();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      -[BRCFSImporter trashItem:parentItemInTrash:error:].cold.4();

  }
  if (!objc_msgSend(v17, "isZoneRoot"))
  {
    if (objc_msgSend(v17, "isShareAcceptationFault"))
    {
      brc_bread_crumbs();
      v23 = (BRCImportObject *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.2();
      goto LABEL_8;
    }
    objc_msgSend(v17, "parentFileObjectID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isAppLibraryRoot"))
    {
      objc_msgSend(v17, "itemID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_msgSend(v29, "isDocumentsFolder") & 1) != 0
         || -[BRCFSImporter _isDesktopOrDocumentsItem:](self, "_isDesktopOrDocumentsItem:", v17);

    }
    else
    {
      v30 = -[BRCFSImporter _isDesktopOrDocumentsItem:](self, "_isDesktopOrDocumentsItem:", v17);
    }

    if ((a5 & 6) != 0 && v30)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.5();

      a5 &= 0xFFFFFFFFFFFFFFF9;
    }
    if ((a5 & 1) == 0)
    {
      v25 = 0;
      goto LABEL_56;
    }
    if (v20)
    {
      if ((objc_msgSend(v17, "isDocument") & 1) == 0)
      {
        brc_bread_crumbs();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.4();

      }
      if (objc_msgSend(v17, "isDocument"))
      {
        objc_msgSend(v17, "asDocument");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "currentVersion");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "quarantineInfo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v35 = 0;
      }
      v78 = 0;
      v23 = -[BRCImportObject initWithURL:existingItem:quarantineInfo:error:]([BRCImportObject alloc], "initWithURL:existingItem:quarantineInfo:error:", v20, v17, v35, &v78);
      v40 = (BRCImportObject *)v78;
    }
    else
    {
      objc_msgSend(v19, "contentType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "br_isSymbolicLinkType");

      if (!v37)
      {
        brc_bread_crumbs();
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v46;
          _os_log_impl(&dword_230455000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got nil content URL and the item is not a symbolic link. Ignoring the content change field%@", buf, 0xCu);
        }

        v40 = 0;
        v23 = 0;
        v25 = 0;
        if (!objc_msgSend(0, "br_isPOSIXErrorCode:", 1))
          goto LABEL_55;
        goto LABEL_50;
      }
      objc_msgSend(v19, "symlinkTargetPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        objc_msgSend(v74, "objectForKey:", CFSTR("symlink-target"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v38 = [BRCImportObject alloc];
      objc_msgSend(v17, "parentItemOnFS");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "st");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "logicalName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0;
      v23 = -[BRCImportObject initAsSymlinkWithTarget:parentItem:logicalName:error:](v38, "initAsSymlinkWithTarget:parentItem:logicalName:error:", v35, v70, v39, &v77);
      v40 = (BRCImportObject *)v77;

    }
    if (v23)
    {
      v76 = v40;
      v41 = objc_msgSend(v17, "updateWithImportObject:onlyContentDependentProperties:error:", v23, v19 != 0, &v76);
      v25 = v76;

      if ((v41 & 1) != 0)
      {
        if (v20)
        {
          -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "liveStageFilename");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v42, "moveFromURLToLiveStage:liveStageFilename:error:", v20, v43, a11);

          if (!v72)
            goto LABEL_82;
        }
        goto LABEL_55;
      }
      v40 = v25;
    }
    if ((-[BRCImportObject br_isPOSIXErrorCode:](v40, "br_isPOSIXErrorCode:", 1) & 1) == 0)
    {
      v25 = v40;
      if (v25)
      {
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          v65 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyn"
                "cUp:stillPendingFields:error:]";
          v81 = 2080;
          if (!a11)
            v65 = "(ignored by caller)";
          v82 = v65;
          v83 = 2112;
          v84 = v25;
          v85 = 2112;
          v86 = v44;
          _os_log_error_impl(&dword_230455000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a11)
        *a11 = objc_retainAutorelease(v25);

      goto LABEL_82;
    }
LABEL_50:
    brc_bread_crumbs();
    v73 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v80 = (const char *)v17;
      v81 = 2112;
      v82 = v73;
      _os_log_impl(&dword_230455000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed updating the content of the item %@ from the template due to EPERM error, will continue and flag the content of the item as pending%@", buf, 0x16u);
    }

    if (a10)
      *a10 |= 1uLL;

    v25 = 0;
LABEL_55:

LABEL_56:
    v49 = v25;
    -[BRCFSImporter _learnEtagsIfNecessaryWithItem:changedFields:baseVersion:](self, "_learnEtagsIfNecessaryWithItem:changedFields:baseVersion:", v17, a5, v18);
    v75 = v25;
    v50 = -[BRCFSImporter _processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:](self, "_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:", v17, a5, v19, &v75);
    v25 = v75;

    if (!v50)
    {
      v23 = v25;
      if (v23)
      {
        brc_bread_crumbs();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
        {
          v63 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyn"
                "cUp:stillPendingFields:error:]";
          v81 = 2080;
          if (!a11)
            v63 = "(ignored by caller)";
          v82 = v63;
          v83 = 2112;
          v84 = v23;
          v85 = 2112;
          v86 = v58;
          _os_log_error_impl(&dword_230455000, v59, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a11)
      {
        v23 = objc_retainAutorelease(v23);
        v26 = 0;
        *a11 = v23;
      }
      else
      {
        v26 = 0;
      }
      v25 = v23;
      goto LABEL_9;
    }
    -[BRCFSImporter _changeBasicFieldsOnItem:fields:template:](self, "_changeBasicFieldsOnItem:fields:template:", v17, a5, v19);
    if ((a5 & 0x80000000) != 0 && objc_msgSend(v17, "isDocument"))
      -[BRCFSImporter _resolveConflictLosersForItem:localItem:](self, "_resolveConflictLosersForItem:localItem:", v19, v17);
    objc_msgSend(v17, "markNeedsUploadOrSyncingUp");
    if (a9 && (objc_msgSend(v17, "isIdleOrRejected") & 1) == 0)
    {
      brc_bread_crumbs();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.3();

      v53 = objc_msgSend(v17, "localDiffs");
      v54 = objc_msgSend(v17, "diffAgainstOriginalItem") | v53;
      if (objc_msgSend(v17, "isDocument") && (v54 & 0x1FE0000) != 0)
      {
        objc_msgSend(v17, "asDocument");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "currentVersion");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "clearCKInfo");

      }
      if ((v54 & 0x3FFE) != 0)
      {
        objc_msgSend(v17, "st");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "clearCKInfo");

      }
    }
    if ((objc_msgSend(v17, "saveToDB") & 1) != 0)
    {
      v26 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v17, "db");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "lastError");
    v23 = (BRCImportObject *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      brc_bread_crumbs();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, (os_log_type_t)0x90u))
      {
        v64 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v80 = "-[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncU"
              "p:stillPendingFields:error:]";
        v81 = 2080;
        if (!a11)
          v64 = "(ignored by caller)";
        v82 = v64;
        v83 = 2112;
        v84 = v23;
        v85 = 2112;
        v86 = v61;
        _os_log_error_impl(&dword_230455000, v62, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a11)
    {
      v23 = objc_retainAutorelease(v23);
      v26 = 0;
      *a11 = v23;
      goto LABEL_9;
    }
LABEL_82:
    v26 = 0;
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v23 = (BRCImportObject *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[BRCFSImporter changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:].cold.1();
LABEL_8:

  v25 = 0;
  v26 = 1;
LABEL_9:

LABEL_10:
  return v26;
}

- (unsigned)_itemTypeToFileObjectIDType:(char)a3 itemID:(id)a4
{
  unsigned int v4;

  v4 = a3;
  if ((objc_msgSend(a4, "isDocumentsFolder") & 1) != 0)
    return 4;
  if (v4 > 0xA)
    return 5;
  return byte_230722ED0[v4];
}

- (BOOL)_deleteAppLibrary:(id)a3 documentsFolder:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  BRCNotification *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(v7, "deleteAppLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v27 = "-[BRCFSImporter _deleteAppLibrary:documentsFolder:error:]";
        v28 = 2080;
        if (!a5)
          v22 = "(ignored by caller)";
        v29 = v22;
        v30 = 2112;
        v31 = v11;
        v32 = 2112;
        v33 = v12;
        _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v11);
    }
    else
    {
      objc_msgSend(v7, "didRemoveDocumentsFolder");
      objc_msgSend(v7, "rootFileObjectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "asString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __57__BRCFSImporter__deleteAppLibrary_documentsFolder_error___block_invoke;
      v24[3] = &unk_24FE3F6A0;
      v16 = v8;
      v25 = v16;
      +[BRCImportUtil forceIngestionForItemID:completionHandler:](BRCImportUtil, "forceIngestionForItemID:completionHandler:", v15, v24);

      v17 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v16, 0);
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorForRejectedDeletionOfItem:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v23 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v27 = "-[BRCFSImporter _deleteAppLibrary:documentsFolder:error:]";
          v28 = 2080;
          if (!a5)
            v23 = "(ignored by caller)";
          v29 = v23;
          v30 = 2112;
          v31 = v18;
          v32 = 2112;
          v33 = v19;
          _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v18);

      v11 = v25;
    }

  }
  else if (a5)
  {
    *a5 = 0;
  }

  return 0;
}

void __57__BRCFSImporter__deleteAppLibrary_documentsFolder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "appLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed force ingesting the root of the app library %@ - %@%@", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (BOOL)_shouldRejectItemDeleteDueToEtags:(id)a3 baseVersion:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BRFieldStructureSignature *v13;
  void *v14;
  BRFieldStructureSignature *v15;
  void *v16;
  char *v17;
  BRFieldContentSignature *v18;
  void *v19;
  BRCNotification *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  BRCNotification *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "appLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mangledID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rejectDeletionsBasedOnEtag");

  if (!v12 || (objc_msgSend(v7, "isSharedToMeTopLevelItem") & 1) != 0)
    goto LABEL_8;
  v13 = [BRFieldStructureSignature alloc];
  objc_msgSend(v8, "metadataVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BRFieldStructureSignature initWithData:](v13, "initWithData:", v14);

  objc_msgSend(v7, "st");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "versionSignature");
  v17 = (char *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "isEquivalentToSignature:", v15) & 1) == 0)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v17;
      v40 = 2112;
      v41 = (const char *)v15;
      v42 = 2112;
      v43 = v26;
      _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Structure signature mismatch for deletion %@ vs %@%@", buf, 0x20u);
    }

    v20 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v7, 0);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorForRejectedDeletionOfItem:", v20);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v39 = "-[BRCFSImporter _shouldRejectItemDeleteDueToEtags:baseVersion:error:]";
        v40 = 2080;
        if (!a5)
          v35 = "(ignored by caller)";
        v41 = v35;
        v42 = 2112;
        v43 = v23;
        v44 = 2112;
        v45 = v28;
        _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
    {
      v23 = objc_retainAutorelease(v23);
      *a5 = v23;
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v7, "isDocument"))
  {
    v18 = [BRFieldContentSignature alloc];
    objc_msgSend(v8, "contentVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[BRFieldContentSignature initWithData:](v18, "initWithData:", v19);

    objc_msgSend(v7, "asDocument");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "versionSignature");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v23, "isEquivalentToSignature:", v20) & 1) != 0)
    {

      goto LABEL_7;
    }
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v39 = (const char *)v20;
      v40 = 2112;
      v41 = (const char *)v23;
      v42 = 2112;
      v43 = v30;
      _os_log_debug_impl(&dword_230455000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Content signature mismatch for deletion %@ vs %@%@", buf, 0x20u);
    }

    v32 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v7, 0);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorForRejectedDeletionOfItem:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        v36 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v39 = "-[BRCFSImporter _shouldRejectItemDeleteDueToEtags:baseVersion:error:]";
        v40 = 2080;
        if (!a5)
          v36 = "(ignored by caller)";
        v41 = v36;
        v42 = 2112;
        v43 = v33;
        v44 = 2112;
        v45 = v37;
        _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v33);

LABEL_25:
    v24 = 1;
    goto LABEL_9;
  }
LABEL_7:

LABEL_8:
  v24 = 0;
LABEL_9:

  return v24;
}

- (BOOL)deleteItem:(id)a3 recursively:(BOOL)a4 baseVersion:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  _QWORD v31[4];
  id v32;
  BRCFSImporter *v33;
  _BYTE *v34;
  BOOL v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  _BYTE v44[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assertOnQueue");

  if (!v10 || objc_msgSend(v10, "isDead"))
  {
    if (a6)
    {
      v13 = 0;
      *a6 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  if (!a4 && objc_msgSend(v10, "isDirectory"))
  {
    objc_msgSend(v10, "asDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "hasLiveChildren"))
    {

LABEL_11:
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDeletingNonEmptyDirectoryNonRecursively");
      v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v30 = "(passed to caller)";
          *(_DWORD *)v44 = 136315906;
          *(_QWORD *)&v44[4] = "-[BRCFSImporter deleteItem:recursively:baseVersion:error:]";
          *(_WORD *)&v44[12] = 2080;
          if (!a6)
            v30 = "(ignored by caller)";
          *(_QWORD *)&v44[14] = v30;
          *(_WORD *)&v44[22] = 2112;
          v45 = v18;
          LOWORD(v46) = 2112;
          *(_QWORD *)((char *)&v46 + 2) = v19;
          _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v44, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v18);

      goto LABEL_21;
    }
    if (objc_msgSend(v10, "isDirectoryFault"))
    {
      objc_msgSend(v10, "asDirectory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "childItemCount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "longLongValue");

      if (v17 > 0)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_msgSend(v10, "fileObjectID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAppLibraryDocumentsFolder");

  if (v22)
  {
    objc_msgSend(v10, "appLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSImporter _deleteAppLibrary:documentsFolder:error:](self, "_deleteAppLibrary:documentsFolder:error:", v23, v10, a6);

    goto LABEL_21;
  }
  if (-[BRCFSImporter _shouldRejectItemDeleteDueToEtags:baseVersion:error:](self, "_shouldRejectItemDeleteDueToEtags:baseVersion:error:", v10, v11, a6))
  {
    goto LABEL_21;
  }
  *(_QWORD *)v44 = 0;
  *(_QWORD *)&v44[8] = v44;
  *(_QWORD *)&v44[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__23;
  *(_QWORD *)&v46 = __Block_byref_object_dispose__23;
  *((_QWORD *)&v46 + 1) = 0;
  objc_msgSend(v10, "db");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke;
  v31[3] = &unk_24FE44AB0;
  v35 = a4;
  v33 = self;
  v34 = v44;
  v32 = v10;
  objc_msgSend(v25, "groupInBatch:", v31);

  v26 = *(id *)(*(_QWORD *)&v44[8] + 40);
  if (v26)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      v29 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v37 = "-[BRCFSImporter deleteItem:recursively:baseVersion:error:]";
      v38 = 2080;
      if (!a6)
        v29 = "(ignored by caller)";
      v39 = v29;
      v40 = 2112;
      v41 = v26;
      v42 = 2112;
      v43 = v27;
      _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v26);

  v13 = *(_QWORD *)(*(_QWORD *)&v44[8] + 40) == 0;
  _Block_object_dispose(v44, 8);

LABEL_22:
  return v13;
}

void __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "markRemovedFromFilesystemRecursively:", *(unsigned __int8 *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 32), "saveToDB") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "db");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flush");

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Failed to save to db without an error"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    if (!v3)

  }
}

- (void)_markNextChildBatchDead:(id)a3 persistedState:(id)a4 batchSize:(int)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  NSObject *v47;
  BRFileObjectID *v48;
  BRFileObjectID *currentPropagationObject;
  void *v50;
  NSObject *v51;
  BRFileObjectID *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id obj;
  id obja;
  id v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD *v76;
  uint64_t v77;
  _QWORD v78[3];
  uint64_t v79;
  uint64_t v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  _BYTE v84[14];
  _BYTE v85[128];
  uint64_t v86;

  obj = *(id *)&a5;
  v86 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v60 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:].cold.4();

  v80 = objc_msgSend(v60, "nextNotifRank");
  v55 = (int)obj;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:");
  v11 = (void *)objc_opt_new();
  objc_msgSend(v7, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dbRowID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v64, "longLongValue");
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v79 = 0;
  v14 = brc_current_date_nsec();
  v15 = MEMORY[0x24BDAC760];
  v79 = v14;
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke;
  v73[3] = &unk_24FE44AD8;
  v73[4] = self;
  v74 = v10;
  v77 = v13;
  v16 = v11;
  v17 = v74;
  v63 = v16;
  v75 = v16;
  v76 = v78;
  v57 = (void *)MEMORY[0x2348BA0DC](v73);
  v71[0] = v15;
  v71[1] = 3221225472;
  v71[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_68;
  v71[3] = &unk_24FE3FEF0;
  v65 = v7;
  v72 = v65;
  v59 = (void *)MEMORY[0x2348BA0DC](v71);
  v70[0] = v15;
  v70[1] = 3221225472;
  v70[2] = __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_71;
  v70[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
  v70[4] = v13;
  v56 = (void *)MEMORY[0x2348BA0DC](v70);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x2348BA0DC](v57);
  v20 = (void *)MEMORY[0x2348BA0DC](v56);
  v21 = (void *)MEMORY[0x2348BA0DC](v59);
  v22 = (void *)MEMORY[0x2348BA0DC](v59);
  objc_msgSend(v65, "itemID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "clientZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dbRowID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "execute:", CFSTR("UPDATE client_items SET item_notifs_rank = fetch_and_inc64(%p), item_state = 1, item_processing_stamp = call_block(%p, item_type, rowid, zone_rowid, item_id), item_localsyncupstate = 4, item_file_id = NULL, item_doc_id = NULL, item_generation = NULL, item_bouncedname = NULL, item_filename = call_block(%p, item_id), item_staged_file_id = NULL, item_staged_generation = NULL, item_local_diffs = call_block(%p, item_local_diffs, zone_rowid), item_stat_ckinfo = call_block(%p, item_stat_ckinfo), version_ckinfo = call_block(%p, version_ckinfo),  item_user_visible = 0  WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0 LIMIT %d"), &v80, v19, &__block_literal_global_29, v20, v21, v22, v23, v25, obj);

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v26, "changes");

  if (v58 != objc_msgSend(v17, "count"))
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:].cold.3();

  }
  objc_msgSend(v60, "setNextNotifRank:", v80);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obja = v17;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v67;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(obja);
        v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v29);
        -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "createSyncUpJobForRowID:inZone:", objc_msgSend(v30, "rawID"), v64);

        objc_msgSend(v63, "objectForKeyedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          -[BRCAccountSessionFPFS syncUpScheduler](self->_session, "syncUpScheduler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "createSyncUpJobForRowID:inZone:", objc_msgSend(v30, "rawID"), v32);

        }
        if (objc_msgSend(v30, "type") == 2)
        {
          brc_bread_crumbs();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v44 = objc_msgSend(v30, "type");
            *(_DWORD *)buf = 138412802;
            v82 = v30;
            v83 = 1024;
            *(_DWORD *)v84 = v44;
            *(_WORD *)&v84[4] = 2112;
            *(_QWORD *)&v84[6] = v34;
            _os_log_debug_impl(&dword_230455000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Inserting recursive properties job for %@ type %d%@", buf, 0x1Cu);
          }

          -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "itemDBRowID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "execute:", CFSTR("INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid, needs_delete_doc_count, needs_sync_up_count) SELECT rowid, item_id, item_parent_id, item_type, zone_rowid, item_parent_zone_rowid, 0, 0 FROM client_items WHERE rowid = %@"), v37);

          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v30, "itemDBRowID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v82 = v45;
            v83 = 2112;
            *(_QWORD *)v84 = v38;
            _os_log_debug_impl(&dword_230455000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating recursive properties table for %@%@", buf, 0x16u);

          }
          -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "itemDBRowID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "execute:", CFSTR("UPDATE item_recursive_properties SET needs_delete_doc_count =  1, needs_sync_up_count = 1 WHERE item_rowid = %@"), v41);

        }
        -[BRCAccountSessionFPFS stageRegistry](self->_session, "stageRegistry");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "liveStageFilename");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "unlinkLiveStageFilename:", v43);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    }
    while (v27);
  }

  if (v58 == v55)
  {
    brc_bread_crumbs();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:].cold.1();

    objc_msgSend(v65, "fileObjectID");
    v48 = (BRFileObjectID *)objc_claimAutoreleasedReturnValue();
    currentPropagationObject = self->_currentPropagationObject;
    self->_currentPropagationObject = v48;

    self->_currentPropagationMinRowID = 0;
  }
  else
  {
    brc_bread_crumbs();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[BRCFSImporter _markNextChildBatchDead:persistedState:batchSize:].cold.2();

    v52 = self->_currentPropagationObject;
    self->_currentPropagationObject = 0;

    self->_currentPropagationMinRowID = 0;
    objc_msgSend(v65, "markChildPropagationComplete");
    objc_msgSend(v65, "saveToDB");
  }

  _Block_object_dispose(v78, 8);
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  sqlite3_int64 v10;
  sqlite3_int64 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  sqlite3_int64 v15;
  void *v16;
  NSObject *v17;

  if (a3 != 4)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_cold_1();

  }
  v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  v8 = +[BRCItemID newFromSqliteValue:](BRCItemID, "newFromSqliteValue:", *(_QWORD *)(a4 + 24));
  v9 = objc_msgSend(*(id *)(a1 + 32), "_itemTypeToFileObjectIDType:itemID:", (char)v7, v8);
  v10 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 8));
  v11 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 16));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17618]), "initWithRowID:type:", v10, v9);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  if (v11 != *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v12);

  }
  if (v7 <= 0xAu && ((1 << v7) & 0x611) != 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(_QWORD *)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v15 + 1;
    sqlite3_result_int64(a2, v15);
  }
  else
  {
    sqlite3_result_null(a2);
  }

}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_68(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasDeletionChangeToken");

  if ((v9 & 1) != 0)
  {
    v10 = +[BRFieldCKInfo newFromSqliteValue:](BRFieldCKInfo, "newFromSqliteValue:", *a4);
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "hasDeletionChangeToken"))
      {
        sqlite3_result_value(a2, *a4);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "st");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ckInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deletionChangeToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDeletionChangeToken:", v14);

        objc_msgSend(v11, "data");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        sqlite3_result_blob(a2, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      }
    }
    else
    {
      sqlite3_result_null(a2);
    }

  }
  else
  {
    sqlite3_result_value(a2, *a4);
  }
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_70(uint64_t a1, sqlite3_context *a2, int a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v6 = +[BRCItemID newFromSqliteValue:](BRCItemID, "newFromSqliteValue:", *a4);
  objc_msgSend(v6, "itemIDString");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_result_text(a2, (const char *)objc_msgSend(v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_71(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  if (a3 != 2)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __br_update_tables_30_000_block_invoke_2_cold_2();

  }
  v7 = sqlite3_value_int64(*a4);
  if (sqlite3_value_int64(a4[1]) == *(_QWORD *)(a1 + 32))
    v8 = v7;
  else
    v8 = v7 | 8;
  sqlite3_result_int64(a2, v8 | 2);
}

- (void)_propagateDirectoryMergeOrCrossZoneMove:(id)a3 persistedState:(id)a4 batchSize:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  BRFileObjectID *currentPropagationObject;
  void *v38;
  NSObject *v39;
  BRFileObjectID *v40;
  int v41;
  BRCFSImporter *v42;
  const char *v43;
  int v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousItemGlobalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoneRowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "br_isEqualToNumber:", v11);

  v13 = "cross-zone move";
  if ((_DWORD)v12)
    v13 = "directory merge";
  v43 = v13;
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v53 = v43;
    v54 = 2112;
    v55 = v7;
    v56 = 2112;
    v57 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating %s of %@ to children%@", buf, 0x20u);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v7, "appLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousItemGlobalID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = a5;
  v42 = self;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enumerateChildrenOfItemGlobalID:sortOrder:offset:limit:db:", v17, 0, 0, a5, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v48;
    v45 = *(_QWORD *)v48;
    do
    {
      v44 = v22;
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v53 = v43;
          v54 = 2112;
          v55 = v25;
          v56 = 2112;
          v57 = v26;
          _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating %s to item: %@%@", buf, 0x20u);
        }

        objc_msgSend(v25, "updateWithLogicalName:newParent:", 0, v7);
        if ((_DWORD)v12)
        {
          objc_msgSend(v7, "clientZone");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "itemID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "st");
          v30 = v7;
          v31 = v12;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logicalName");
          v33 = v21;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v28, "existsByParentID:andLogicalName:", v29, v34);

          v21 = v33;
          v12 = v31;
          v7 = v30;
          v23 = v45;

          if (v35)
            objc_msgSend(v25, "markBouncedToNextAvailableBounceNumber:", 509);
        }
        objc_msgSend(v25, "saveToDB");
      }
      v22 = v44 + v21;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  if (v22 == v41)
  {
    objc_msgSend(v7, "fileObjectID");
    v36 = objc_claimAutoreleasedReturnValue();
    currentPropagationObject = v42->_currentPropagationObject;
    v42->_currentPropagationObject = (BRFileObjectID *)v36;

    v42->_currentPropagationMinRowID = 0;
  }
  else
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v53 = v43;
      v54 = 2112;
      v55 = v7;
      v56 = 2112;
      v57 = v38;
      _os_log_debug_impl(&dword_230455000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished propagating %s of %@ to children%@", buf, 0x20u);
    }

    v40 = v42->_currentPropagationObject;
    v42->_currentPropagationObject = 0;

    v42->_currentPropagationMinRowID = 0;
    objc_msgSend(v7, "markDirectoryMergeOrCrossZonePropagationComplete");
    objc_msgSend(v7, "markChildPropagationComplete");
    objc_msgSend(v7, "saveToDB");
  }

}

- (void)_propagateFieldsToNextChildBatch:(id)a3 persistedState:(id)a4 minRowID:(unint64_t)a5 batchSize:(int)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  id v44;
  BRFileObjectID *v45;
  BRFileObjectID *currentPropagationObject;
  BRFileObjectID *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  id v58;
  id v59;
  id v60;
  BOOL v61;
  id v62;
  void *v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  void *v74;
  char v75;
  id v76;
  uint64_t v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  _QWORD v83[5];
  id v84;
  _QWORD v85[5];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  _QWORD *v99;
  uint64_t v100;
  unint64_t v101;
  int v102;
  char v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t *v113;
  _QWORD *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  char v119;
  char v120;
  char v121;
  BOOL v122;
  _QWORD v123[4];
  id v124;
  BOOL v125;
  _QWORD v126[4];
  id v127;
  _QWORD *v128;
  _QWORD v129[4];
  id v130;
  _QWORD *v131;
  _QWORD v132[4];
  id v133;
  _QWORD *v134;
  _QWORD v135[4];
  id v136;
  _QWORD *v137;
  _QWORD v138[4];
  id v139;
  _QWORD *v140;
  _QWORD v141[3];
  char v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD v151[3];
  uint64_t v152;
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v82 = a4;
  objc_msgSend(v8, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v9, "isNonDesktopRoot");

  objc_msgSend(v8, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v10, "isDocumentsFolder");

  v67 = objc_msgSend(v8, "sharingOptions");
  v69 = objc_msgSend(v8, "itemScope");
  objc_msgSend(v8, "appLibrary");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v8, "isUserVisible");
  objc_msgSend(v8, "st");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logicalName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = objc_msgSend(v8, "localDiffs");
  if (objc_msgSend(v8, "isSharedToMe"))
    v61 = (objc_msgSend(v8, "sharingOptions") & 0x20) == 0;
  else
    v61 = 0;
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v59 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend(v80, "dbRowID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v17, "longLongValue");

  v151[0] = 0;
  v151[1] = v151;
  v151[2] = 0x2020000000;
  v152 = 0;
  v152 = brc_current_date_nsec();
  v147 = 0;
  v148 = &v147;
  v149 = 0x2020000000;
  v150 = 0;
  v150 = objc_msgSend(v82, "nextNotifRank");
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  v146 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x2020000000;
  v142 = 0;
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[BRCFSImporter _propagateFieldsToNextChildBatch:persistedState:minRowID:batchSize:].cold.1();

  v138[0] = MEMORY[0x24BDAC760];
  v138[1] = 3221225472;
  v138[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke;
  v138[3] = &unk_24FE447A8;
  v20 = v12;
  v139 = v20;
  v140 = v141;
  v56 = (void *)MEMORY[0x2348BA0DC](v138);
  v135[0] = MEMORY[0x24BDAC760];
  v135[1] = 3221225472;
  v135[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_81;
  v135[3] = &unk_24FE447A8;
  v21 = v13;
  v136 = v21;
  v137 = v141;
  v55 = (void *)MEMORY[0x2348BA0DC](v135);
  v132[0] = MEMORY[0x24BDAC760];
  v132[1] = 3221225472;
  v132[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_82;
  v132[3] = &unk_24FE447A8;
  v22 = v14;
  v133 = v22;
  v134 = v141;
  v54 = (void *)MEMORY[0x2348BA0DC](v132);
  v129[0] = MEMORY[0x24BDAC760];
  v129[1] = 3221225472;
  v129[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_83;
  v129[3] = &unk_24FE447A8;
  v23 = v16;
  v130 = v23;
  v131 = v141;
  v53 = (void *)MEMORY[0x2348BA0DC](v129);
  v126[0] = MEMORY[0x24BDAC760];
  v126[1] = 3221225472;
  v126[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_84;
  v126[3] = &unk_24FE447A8;
  v24 = v15;
  v127 = v24;
  v128 = v141;
  v52 = (void *)MEMORY[0x2348BA0DC](v126);
  v123[0] = MEMORY[0x24BDAC760];
  v123[1] = 3221225472;
  v123[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_85;
  v123[3] = &unk_24FE44B40;
  v125 = v61;
  v25 = v59;
  v124 = v25;
  v26 = (void *)MEMORY[0x2348BA0DC](v123);
  v104[0] = MEMORY[0x24BDAC760];
  v27 = (v57 >> 39) & 1;
  v104[1] = 3221225472;
  v104[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_86;
  v104[3] = &unk_24FE44B68;
  v113 = &v143;
  v116 = v67 & 0x78;
  v118 = v65;
  v119 = v75;
  v120 = v69;
  v49 = v63;
  v105 = v49;
  v48 = v80;
  v106 = v48;
  v121 = v71;
  v122 = (v57 & 0x8000000000) != 0;
  v81 = v25;
  v107 = v81;
  v114 = v151;
  v117 = v78;
  v115 = &v147;
  v50 = v20;
  v108 = v50;
  v51 = v21;
  v109 = v51;
  v58 = v22;
  v110 = v58;
  v60 = v24;
  v111 = v60;
  v62 = v23;
  v112 = v62;
  v28 = (void *)MEMORY[0x2348BA0DC](v104);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_89;
  v90[3] = &unk_24FE44B90;
  v64 = v56;
  v92 = v64;
  v66 = v55;
  v93 = v66;
  v68 = v54;
  v94 = v68;
  v100 = v78;
  v70 = v53;
  v95 = v70;
  v72 = v52;
  v96 = v72;
  v76 = v26;
  v97 = v76;
  v103 = v27;
  v30 = v8;
  v91 = v30;
  v101 = a5;
  v102 = a6;
  v79 = v28;
  v98 = v79;
  v99 = v141;
  objc_msgSend(v29, "groupInTransaction:", v90);

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "changes");

  v33 = v148[3];
  if (v33 != objc_msgSend(v82, "nextNotifRank"))
  {
    objc_msgSend(v30, "appLibrary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "hasActiveQueries");

    if (v35)
    {
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v82, "nextNotifRank");
      v74 = (void *)objc_msgSend(v36, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_notifs_rank >= %lld AND item_notifs_rank < %lld ORDER BY item_notifs_rank"), v37, v148[3], v48, v49, v50, v51);

      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_2;
      v85[3] = &unk_24FE40010;
      v85[4] = self;
      objc_msgSend(v74, "enumerateObjects:", v85);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v86, v153, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v87 != v40)
              objc_enumerationMutation(v38);
            +[BRCNotification notificationFromItem:](BRCNotification, "notificationFromItem:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCAccountSessionFPFS notificationManager](self->_session, "notificationManager");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "queueUpdate:", v42);

          }
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v86, v153, 16);
        }
        while (v39);
      }

    }
    objc_msgSend(v82, "setNextNotifRank:", v148[3]);
  }
  v83[0] = MEMORY[0x24BDAC760];
  v83[1] = 3221225472;
  v83[2] = __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_3;
  v83[3] = &unk_24FE44BB8;
  v83[4] = self;
  v44 = v30;
  v84 = v44;
  objc_msgSend(v81, "enumerateIndexesUsingBlock:", v83);
  if (v32 == a6)
  {
    objc_msgSend(v44, "fileObjectID");
    v45 = (BRFileObjectID *)objc_claimAutoreleasedReturnValue();
    currentPropagationObject = self->_currentPropagationObject;
    self->_currentPropagationObject = v45;

    self->_currentPropagationMinRowID = v144[3];
  }
  else
  {
    v47 = self->_currentPropagationObject;
    self->_currentPropagationObject = 0;

    self->_currentPropagationMinRowID = 0;
    objc_msgSend(v44, "markChildPropagationComplete");
    objc_msgSend(v44, "saveToDB");
  }

  _Block_object_dispose(v141, 8);
  _Block_object_dispose(&v143, 8);
  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(v151, 8);

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_int64(*a4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, objc_msgSend(v10, "intValue"));

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_81(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_int64(*a4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_81_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, objc_msgSend(v10, "intValue"));

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_82(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_int64(*a4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_82_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int(a2, objc_msgSend(v10, "intValue"));

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_83(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  sqlite3_int64 v13;
  void *v14;
  NSObject *v15;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_int64(*a4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_83_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  v13 = objc_msgSend(v10, "longLongValue");
  if (v13)
    sqlite3_result_int64(a2, v13);
  else
    sqlite3_result_null(a2);

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_84(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __recursive_table_recreate_schema_block_invoke_cold_1();

  }
  v7 = sqlite3_value_int64(*a4);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_84_cold_1();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  sqlite3_result_int64(a2, objc_msgSend(v10, "longLongValue"));

}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_85(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  sqlite3_int64 v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  if (a3 != 2)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __br_update_tables_30_000_block_invoke_2_cold_2();

  }
  v7 = sqlite3_value_int64(*a4);
  if (*(_BYTE *)(a1 + 40)
    && (v8 = v7,
        v9 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "newFromSqliteValue:", a4[1]),
        v10 = objc_msgSend(v9, "br_isCloudDocsErrorCode:", 43),
        v9,
        v10))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_85_cold_1();

    sqlite3_result_null(a2);
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", v8);
  }
  else
  {
    sqlite3_result_value(a2, a4[1]);
  }
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_86(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  sqlite3_int64 v10;
  unsigned __int8 v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  sqlite3_int64 v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  sqlite3_int64 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  sqlite3_context *v34;
  void *v35;

  if (a3 != 9)
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_86_cold_1();

  }
  v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  v8 = sqlite3_value_int(*(sqlite3_value **)(a4 + 8));
  v35 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "newFromSqliteValue:", *(_QWORD *)(a4 + 16));
  v9 = sqlite3_value_int(*(sqlite3_value **)(a4 + 24));
  v10 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 32));
  v11 = sqlite3_value_int(*(sqlite3_value **)(a4 + 40));
  v31 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 48));
  v12 = sqlite3_value_int(*(sqlite3_value **)(a4 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = sqlite3_value_int64(*(sqlite3_value **)(a4 + 64));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a2;
  v32 = v9;
  v33 = v11;
  v14 = v8;
  if ((v7 & 4) != 0)
  {
    v16 = v7 & 4;
    v15 = v7;
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 120);
    v16 = v15 & 4;
  }
  v17 = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:](BRCLocalItem, "computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:", *(unsigned __int8 *)(a1 + 136), *(unsigned __int8 *)(a1 + 137), *(unsigned __int8 *)(a1 + 138), v35, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v18 = +[BRCLocalItem computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:](BRCLocalItem, "computeItemScopeFromParentIsRoot:parentIsDocuments:parentScope:logicalName:", *(unsigned __int8 *)(a1 + 137), *(unsigned __int8 *)(a1 + 139), *(unsigned __int8 *)(a1 + 138), v35);
  if ((_DWORD)v18 == 3 && v16)
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v13, "longLongValue"));
  if (v12 == 8)
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v13, "longLongValue"));
  if (v15 == v7 && (v14 == 0) != v17 && (_DWORD)v18 == v32 && *(_QWORD *)(a1 + 128) == v10 && !*(_BYTE *)(a1 + 140))
  {
    v19 = 0;
    v23 = 0;
    v22 = v31;
  }
  else
  {
    v19 = 0;
    if (v33 <= 0xAu && ((1 << v33) & 0x611) != 0)
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v19 = *(_QWORD *)(v20 + 24);
      *(_QWORD *)(v20 + 24) = v19 + 1;
    }
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v22 = *(_QWORD *)(v21 + 24);
    *(_QWORD *)(v21 + 24) = v22 + 1;
    v23 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v24, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v25, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v26, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v27, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v28, v13);

  sqlite3_result_int(v34, v23);
}

BOOL __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v3 = *(_QWORD *)(a1 + 40);
  v18 = a2;
  v17 = (void *)MEMORY[0x2348BA0DC](v3);
  v16 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 48));
  v14 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 56));
  v15 = *(_QWORD *)(a1 + 104);
  v4 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 64));
  v5 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 72));
  v6 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 80));
  v13 = (unint64_t)*(unsigned __int8 *)(a1 + 124) << 39;
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dbRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 112);
  v11 = (void *)MEMORY[0x2348BA0DC](*(_QWORD *)(a1 + 88));
  LODWORD(v15) = objc_msgSend(v18, "execute:", CFSTR("UPDATE client_items SET item_sharing_options = call_block(%p, rowid), item_user_visible = call_block(%p, rowid), item_scope = call_block(%p, rowid), app_library_rowid = %llu, item_processing_stamp = call_block(%p, rowid), item_notifs_rank = call_block(%p, rowid), version_upload_error = call_block(%p, rowid, version_upload_error), item_local_diffs = (item_local_diffs | %lld) WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_state = 0 AND rowid > %lld  AND call_block(%p, item_sharing_options, item_user_visible, item_filename, item_scope, app_library_rowid, item_type, item_notifs_rank, item_localsyncupstate, rowid) ORDER BY rowid LIMIT %d"), v17, v16, v14, v15, v4, v5, v6, v13, v7, v9, v10, v11, *(unsigned int *)(a1 + 120));

  return (_DWORD)v15 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) == 0;
}

id __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x2348B9F14]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "itemByRowID:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logicalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithLogicalName:newParent:", v7, *(_QWORD *)(a1 + 40));

  if (objc_msgSend(v5, "isInTrashScope") && objc_msgSend(v5, "isSharedToMeTopLevelItem"))
    objc_msgSend(v5, "markRemovedFromFilesystemRecursively:", 1);
  objc_msgSend(v5, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v5, "saveToDB");

  objc_autoreleasePoolPop(v4);
}

- (void)_processIngestBatch:(id)a3 minRowID:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BRCFSImporter *v15;
  id v16;
  unint64_t v17;
  int v18;

  v6 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "readerScanBatchSize");

  +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", self->_session);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__BRCFSImporter__processIngestBatch_minRowID___block_invoke;
  v13[3] = &unk_24FE44BE0;
  v14 = v6;
  v15 = self;
  v18 = v8;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v10, "groupInBatch:", v13);

}

uint64_t __46__BRCFSImporter__processIngestBatch_minRowID___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isDead"))
    return objc_msgSend(*(id *)(a1 + 40), "_markNextChildBatchDead:persistedState:batchSize:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "previousItemGlobalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  if (v3)
    return objc_msgSend(v4, "_propagateDirectoryMergeOrCrossZoneMove:persistedState:batchSize:", v5, v6, *(unsigned int *)(a1 + 64));
  else
    return objc_msgSend(v4, "_propagateFieldsToNextChildBatch:persistedState:minRowID:batchSize:", v5, v6, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
}

- (void)signal
{
  -[BRCFairSource signal](self->_childPropagationSource, "signal");
}

- (void)resume
{
  -[BRCFairSource resume](self->_childPropagationSource, "resume");
  -[BRCFairSource signal](self->_childPropagationSource, "signal");
}

- (void)suspend
{
  -[BRCFairSource suspend](self->_childPropagationSource, "suspend");
}

- (void)cancel
{
  -[BRCFairSource cancel](self->_childPropagationSource, "cancel");
}

- (void)_childPropagationSchedule
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  BRCAccountSessionFPFS *session;
  void *v28;
  void *v29;
  void *v30;
  BRFileObjectID *v31;
  BRFileObjectID *currentPropagationObject;
  id v33;
  _QWORD v34[5];

  if (self->_currentPropagationObject
    && (-[BRCAccountSessionFPFS itemByFileObjectID:](self->_session, "itemByFileObjectID:"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "asDirectory"),
        v33 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v33))
  {
    -[BRCFSImporter _processIngestBatch:minRowID:](self, "_processIngestBatch:minRowID:", v33, self->_currentPropagationMinRowID);
    -[BRCFairSource signal](self->_childPropagationSource, "signal");

  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maxSyncPathDepth");

    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __42__BRCFSImporter__childPropagationSchedule__block_invoke;
    v34[3] = &unk_24FE40010;
    v34[4] = self;
    v7 = (void *)objc_msgSend(v6, "fetchObject:sql:", v34, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_processing_stamp IS NOT NULL ORDER BY item_processing_stamp ASC LIMIT 1"));
    objc_msgSend(v7, "asDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "st");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "parentID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentClientZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dbRowID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "fetch:", CFSTR("WITH RECURSIVE item_parents  (rowid, item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp) AS( SELECT rowid, item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.rowid, li.item_parent_id, li.item_parent_zone_rowid, li.item_state, li.item_processing_stamp FROM client_items AS li  INNER JOIN item_parents AS p WHERE p.item_parent_id = li.item_id AND p.item_parent_zone_rowid = li.zone_rowid      LIMIT %u) SELECT rowid, item_processing_stamp FROM item_parents WHERE item_processing_stamp IS NOT NULL"), v11, v13, v5);

      v15 = (void *)objc_opt_new();
      v16 = (void *)objc_opt_new();
      if (objc_msgSend(v14, "next"))
      {
        do
        {
          v17 = (void *)MEMORY[0x2348B9F14]();
          objc_msgSend(v14, "numberAtIndex:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberAtIndex:", 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "insertObject:atIndex:", v18, 0);
          objc_msgSend(v16, "insertObject:atIndex:", v19, 0);

          objc_autoreleasePoolPop(v17);
        }
        while ((objc_msgSend(v14, "next") & 1) != 0);
      }
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedLongLongValue");

      }
      else
      {
        v21 = 0;
      }
      if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      {
        v22 = 1;
        do
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedLongLongValue");

          if (v24 >= v21)
          {
            v21 = v24 + 1;
          }
          else
          {
            if (v21 < 0x7FFFFFFFFFFFFFFFLL)
              ++v21;
            else
              v21 = 0x7FFFFFFFFFFFFFFFLL;
            -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "execute:", CFSTR("UPDATE client_items SET item_processing_stamp = %lld WHERE rowid = %llu"), v21, objc_msgSend(v26, "unsignedLongLongValue"));

          }
          ++v22;
        }
        while (v22 < objc_msgSend(v15, "count"));
      }
      if (objc_msgSend(v15, "count"))
      {
        session = self->_session;
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCAccountSessionFPFS itemByRowID:](session, "itemByRowID:", objc_msgSend(v28, "unsignedLongLongValue"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "asDirectory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = v8;
      }
      objc_msgSend(v30, "fileObjectID");
      v31 = (BRFileObjectID *)objc_claimAutoreleasedReturnValue();
      currentPropagationObject = self->_currentPropagationObject;
      self->_currentPropagationObject = v31;

      -[BRCFSImporter _processIngestBatch:minRowID:](self, "_processIngestBatch:minRowID:", v30, 0);
      -[BRCFairSource signal](self->_childPropagationSource, "signal");

    }
    else
    {
      -[BRCFSImporter _cleanItemBatchAfterMigrationToFPFSIfNecessary](self, "_cleanItemBatchAfterMigrationToFPFSIfNecessary");
    }
  }
}

id __42__BRCFSImporter__childPropagationSchedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (BOOL)_doesAppLibraryMatchWithItemURL:(id)a3 appLibraryRowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[BRCAccountSessionFPFS appLibraryByRowID:](self->_session, "appLibraryByRowID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BE17640]);
    objc_msgSend(v6, "br_containerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithAppLibraryName:", v11);

    v13 = 0;
    if (v9 && v12)
      v13 = objc_msgSend(v12, "isEqualToMangledID:", v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_cleanItemBatchAfterMigrationToFPFSIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Done scanning for now%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

uint64_t __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  int8x16_t v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  int8x16_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  __int128 v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[128];
  _BYTE v77[24];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 136))
  {
    dropFPFSMigrationTablesWithDB(v3);
    if (objc_msgSend(*(id *)(a1 + 32), "filterDecendantsOfNotMigratedFolders"))
      fillFPFSMigrationNonMigratedFoldersTable(v4);
  }
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2;
  v72[3] = &unk_24FE3FEF0;
  v73 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x2348BA0DC](v72);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111;
  v60[3] = &unk_24FE44C08;
  v66 = &v68;
  v61 = *(id *)(a1 + 48);
  v62 = *(id *)(a1 + 32);
  v63 = *(id *)(a1 + 56);
  v67 = *(_OWORD *)(a1 + 88);
  v64 = *(id *)(a1 + 64);
  v65 = *(id *)(a1 + 72);
  v6 = (void *)MEMORY[0x2348BA0DC](v60);
  v7 = (void *)MEMORY[0x2348BA0DC](v5);
  v8 = (void *)MEMORY[0x2348BA0DC](v5);
  v9 = (void *)MEMORY[0x2348BA0DC](v6);
  objc_msgSend(v4, "execute:", CFSTR("UPDATE client_items SET item_file_id = call_block(%p, item_file_id, item_type, item_localsyncupstate, rowid, item_generation, item_local_diffs, item_doc_id, app_library_rowid), item_generation = call_block(%p, item_generation, item_type, item_localsyncupstate), item_localsyncupstate = call_block(%p, item_localsyncupstate, rowid, item_stat_ckinfo IS NULL, item_type, item_birthtime, item_id, item_filename, version_content_signature, item_parent_zone_rowid, item_parent_id), item_doc_id = NULL WHERE rowid > %llu ORDER BY rowid ASC LIMIT %llu"), v7, v8, v9, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144));

  objc_msgSend(v4, "lastError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    brc_bread_crumbs();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      objc_msgSend(v4, "lastError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_3(v13, (uint64_t)v11, (uint64_t)v77, v12);
    }

LABEL_8:
    v14 = 0;
  }
  else
  {
    v42 = objc_msgSend(v4, "changes");
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v11 = *(id *)(a1 + 64);
    v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v57 != v17)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(a1 + 72), "itemByRowID:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "unsignedLongLongValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            brc_bread_crumbs();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
              __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_2();

            goto LABEL_8;
          }
          objc_msgSend(v19, "markNeedsUploadOrSyncingUp");
          v21 = objc_msgSend(v20, "saveToDB");

          if (!v21)
            goto LABEL_8;
        }
        v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (objc_msgSend(*(id *)(a1 + 32), "filterDecendantsOfNotMigratedFolders")
      && isFPFSMigrationNonMigratedFoldersExists(v4, v22))
    {
      v23 = *(void **)(a1 + 56);
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_117;
      v52[3] = &unk_24FE44C30;
      v53 = v4;
      v24 = *(id *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 104);
      v54 = v24;
      v55 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v52);

    }
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_121;
    v43[3] = &unk_24FE44C58;
    v26 = *(void **)(a1 + 48);
    v27 = *(id *)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 112);
    v44 = v27;
    v47 = v28;
    v50 = *(_QWORD *)(a1 + 152);
    v29 = *(id *)(a1 + 72);
    v30 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    v51 = *(_QWORD *)(a1 + 160);
    v31 = *(_QWORD *)(a1 + 80);
    v45 = v29;
    v46 = v31;
    v32 = *(_OWORD *)(a1 + 120);
    v48 = v30;
    v49 = v32;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v43);
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 72), "updateFPFSMigrationCleanupLastRowID:lostItemCount:childLostItemCount:busyDateLostItemCount:ignoredFromSyncLostItemCount:investigatedItemsCount:notMigratedItems:", v69[3], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
    if (v42 < *(_QWORD *)(a1 + 144))
    {
      v35 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v36, "br_roundedLongLongValue"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v74[0] = CFSTR("ProcessingComplete");
      v74[1] = CFSTR("LostItemCount");
      v75[0] = MEMORY[0x24BDBD1C8];
      v75[1] = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      objc_msgSend(*(id *)(a1 + 72), "applyScheduler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "rescheduleAllItemsPendingMigration");

      objc_msgSend(*(id *)(a1 + 72), "sendNonMigratedItemTelemetryWithfileIDs:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 72), "markMigrationToFPFSCleanupComplete");
      dropFPFSMigrationNonMigratedFoldersTable(v4);

    }
    v14 = 1;
    v11 = v44;
  }

  _Block_object_dispose(&v68, 8);
  return v14;
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  void *v8;
  NSObject *v9;
  int v10;
  unsigned int v11;
  sqlite3_int64 v12;
  sqlite3_int64 v13;
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  sqlite3_int64 v16;
  sqlite3_int64 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  void *v27;
  sqlite3_context *v28;
  sqlite3_int64 v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  if (a3 != 3 && a3 != 8)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2_cold_1();

  }
  v10 = sqlite3_value_int(a4[1]);
  v11 = sqlite3_value_int(a4[2]);
  if (a3 == 8)
  {
    v29 = sqlite3_value_int64(a4[3]);
    v12 = sqlite3_value_int64(*a4);
    v13 = sqlite3_value_int64(a4[4]);
    v14 = sqlite3_value_int64(a4[5]);
    v15 = sqlite3_value_int64(a4[6]);
    v16 = sqlite3_value_int64(a4[7]);
    if (v12)
    {
      v17 = v16;
      v27 = *(void **)(a1 + 32);
      v28 = a2;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v19;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v21;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[4] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v23, v24);

      a2 = v28;
    }
  }
  v25 = (v10 - 3) >= 0xFFFFFFFE || v10 == 8;
  if (v25 && (v11 <= 6 ? (v26 = ((1 << v11) & 0x63) == 0) : (v26 = 1), v26))
    sqlite3_result_value(a2, *a4);
  else
    sqlite3_result_null(a2);
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  sqlite3_int64 v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  const void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int busy;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  sqlite3_context *v25;
  int v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  sqlite3_int64 v33;
  id v34;
  BRCItemGlobalID *v35;
  void *v36;
  BRCItemGlobalID *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;

  if (a3 != 10)
  {
    brc_bread_crumbs();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111_cold_2();

  }
  v7 = sqlite3_value_int(*(sqlite3_value **)a4);
  v8 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 8));
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (v8 > *(_QWORD *)(v10 + 24))
    *(_QWORD *)(v10 + 24) = v8;
  v11 = sqlite3_value_int(*(sqlite3_value **)(a4 + 24));
  v12 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 32));
  if (v7 == 6)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111_cold_1();

    objc_msgSend(*(id *)(a1 + 64), "updateFPFSMigrationNonMigratedTypes:", v11);
    v25 = a2;
    v26 = 1;
    goto LABEL_15;
  }
  if (v7 != 5)
  {
    v25 = a2;
    v26 = v7;
LABEL_15:
    sqlite3_result_int(v25, v26);
    return;
  }
  v13 = v12;
  v14 = +[BRCItemID isDocumentsItemIDWithSQLiteValue:](BRCItemID, "isDocumentsItemIDWithSQLiteValue:", *(_QWORD *)(a4 + 40));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", sqlite3_value_text(*(sqlite3_value **)(a4 + 48)));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x24BDBCE50]);
  v17 = sqlite3_value_blob(*(sqlite3_value **)(a4 + 56));
  v18 = (void *)objc_msgSend(v16, "initWithBytesNoCopy:length:freeWhenDone:", v17, sqlite3_value_bytes(*(sqlite3_value **)(a4 + 56)), 0);
  v19 = v18;
  v20 = 0;
  if (v11 == 1)
    v20 = objc_msgSend(v18, "brc_signatureIsPackage") ^ 1;
  busy = BRCIsBusyDate(v13);
  if (((busy | v14) & 1) == 0)
  {
    v27 = +[BRCImportUtil isFileNameIgnoredForSync:isRegFile:](BRCImportUtil, "isFileNameIgnoredForSync:isRegFile:", v15, v20);
    if (!objc_msgSend(v15, "length") || !v27)
    {
      v43 = *(void **)(a1 + 32);
      v28 = (void *)MEMORY[0x24BE17650];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pairWithLeft:andRight:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKey:", v31, v32);

      if (objc_msgSend(*(id *)(a1 + 40), "filterDecendantsOfNotMigratedFolders"))
      {
        v33 = sqlite3_value_int64(*(sqlite3_value **)(a4 + 64));
        v34 = +[BRCItemID newFromSqliteValue:](BRCItemID, "newFromSqliteValue:", *(_QWORD *)(a4 + 72));
        v44 = *(void **)(a1 + 48);
        v35 = [BRCItemGlobalID alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v35, "initWithZoneRowID:itemID:", v36, v34);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v37, v38);

      }
      goto LABEL_22;
    }
    v22 = *(_QWORD *)(a1 + 80);
    goto LABEL_19;
  }
  if (busy)
  {
    v22 = *(_QWORD *)(a1 + 88);
LABEL_19:
    ++*(_QWORD *)(*(_QWORD *)(v22 + 8) + 24);
  }
LABEL_22:
  sqlite3_result_int(a2, 0);
  if (sqlite3_value_int(*(sqlite3_value **)(a4 + 16)))
  {
    v39 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v40);

  }
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "numberWithSQL:", CFSTR("SELECT 1 from fpfs_folders_not_migrated WHERE item_id = %@ and zone_rowid = %@"), v8, v9);
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v5);
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ was not migrated but it's parent %@ was also not migrated%@", buf, 0x20u);
    }

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  void *v19;
  NSObject *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int16 v39;
  _QWORD v40[6];

  v40[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "left");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v7, "right");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "intValue");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(_QWORD *)(v16 + 24);
  if (v17 > *(_QWORD *)(a1 + 96) || v9 == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_121_cold_1();

    v27 = 0;
    goto LABEL_9;
  }
  *(_QWORD *)(v16 + 24) = v17 + 1;
  v39 = 0;
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "volume");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithInt:", objc_msgSend(v24, "deviceID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v26 = +[BRCImportUtil shouldFileIDBeIgnoredAsNonMigrated:docID:deviceID:isRegFile:rowid:outItemURL:isBusyDate:isIgnoredFromSync:](BRCImportUtil, "shouldFileIDBeIgnoredAsNonMigrated:docID:deviceID:isRegFile:rowid:outItemURL:isBusyDate:isIgnoredFromSync:", v9, v11, v25, v13, v5, &v38, (char *)&v39 + 1, &v39);
  v27 = v38;

  if (!v26)
  {
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v28 && (unint64_t)objc_msgSend(v28, "count") < *(_QWORD *)(a1 + 104))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(a1 + 48);
      objc_msgSend(v36, "objectAtIndexedSubscript:", 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "_doesAppLibraryMatchWithItemURL:appLibraryRowID:", v27, v30);

      v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v40[0] = v5;
      v40[1] = v37;
      v40[2] = v35;
      v40[3] = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v40[4] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v33, v9);

    }
LABEL_9:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (v15 == 1)
      v21 = v13;
    else
      v21 = 1;
    v22 = *(void **)(a1 + 40);
    if ((v21 & 1) != 0)
      objc_msgSend(v22, "updateFPFSMigrationNonMigratedTypes:", v15);
    else
      objc_msgSend(v22, "updateFPFSMigrationNonMigratedTypesWithPackage");
    goto LABEL_20;
  }
  if (HIBYTE(v39))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if ((_BYTE)v39)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
LABEL_20:

}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPropagationObject, 0);
  objc_storeStrong((id *)&self->_childPropagationSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking desktop or documents item as from initial scan %@ to avoid bounce%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking user invisible item as from initial scan %@ to avoid bounce%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't import br aliases anymore %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_createBaseItemWithImportObject:importBookmark:parentItem:options:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Import object of unknown type %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_globalItemByDocumentID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Returning nil when looking up by documentID and no migration is in progress%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_globalItemByFileID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Returning nil when looking up by fileID and no migration is in progress%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)capabilityToMoveItem:toNewParentItem:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !parent.isOwnedByMe%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)capabilityToMoveItem:toNewParentItem:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Allowing move of top level folder share item %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_reportBouncingForMigration:existingItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Going to insert bounced folder into fpfs_folders_not_migrated: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_230455000, v0, (uint64_t)v0, "[ERROR] Can't find a parent for trashed item %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_parseImportBookmark:templateItem:fileURL:ignoreImportBookmark:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found shared item by bookmark data %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found existing item by fileID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found existing item by docID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_locateTemplateItemFromFPFSMigration:fields:documentHasChanges:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Existing item isn't a document! %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_handleCollisionIfNecessaryWithTemplateItem:parentItem:logicalName:fileURL:options:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found a colliding item that has the same FP item identifier, returning it - %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_locateMatchingItemForTemplateItem:(uint64_t)a1 parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Child of readonly share path-match should always already exist - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_locateMatchingItemForTemplateItem:(uint64_t)a1 parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] forcing child of read-only share to match what exists in our db %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Item doesn't appear to be edited so stripping the content edited bit for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_locateMatchingItemForTemplateItem:parentItem:options:fileURL:fields:shouldReject:additionalAttrs:importBookmark:ignoreImportBookmark:stillPendingFields:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: options & NSFileProviderCreateItemMayAlreadyExist%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136315906;
  v4 = "-[BRCFSImporter _createAndInsertNewItemWithImportObject:parentItem:fields:templateItem:fileURL:options:additional"
       "Attrs:importBookmark:stillPendingFields:error:]_block_invoke";
  v5 = 2080;
  v6 = "(passed to caller)";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Found existing documents folder %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __160__BRCFSImporter__createAndInsertNewItemWithImportObject_parentItem_fields_templateItem_fileURL_options_additionalAttrs_importBookmark_stillPendingFields_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't have an existing documents folder%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)importNewItemAtURL:parentItem:templateItem:fields:options:additionalItemAttributes:importBookmark:stillPendingFields:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_230455000, v0, (uint64_t)v0, "[ERROR] Received item with unexpected type and no content %@. Rejecting it%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)createAndImportNewDirectoryWithLogicalName:parentItem:error:.cold.1()
{
  __assert_rtn("-[BRCFSImporter createAndImportNewDirectoryWithLogicalName:parentItem:error:]", "BRCFSImporter.m", 1237, "importObject.isUnixDir");
}

- (void)getOrCreateTrashItemInAppLibrary:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_230455000, v0, v3, "[ERROR] Failed to create documents folder for app library %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)getOrCreateTrashItemInAppLibrary:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: appLibrary.db.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)trashItem:parentItemInTrash:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] item after trash: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)trashItem:parentItemInTrash:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentItemInTrash.itemScope == BRC_ITEM_SCOPE_TRASH%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)trashItem:parentItemInTrash:error:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] could not find trash item for app library: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)trashItem:parentItemInTrash:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.isInTransaction%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "parentItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Parent item remotely deleted: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "parentItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] Failed to find parent with item identifier: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: li.isInTrashScope%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_processParentAndFilenameIfNecessaryWithLocalItem:changedFields:templateItem:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Received a reparent request to the root item. Overwriting to the app library documents directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We can't save a zone root so don't modify it%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We can't update a share acceptation fault %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking %@ as forgotten because we matched based on template%@");
  OUTLINED_FUNCTION_0();
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: li.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)changeItem:baseVersion:changedFields:newValues:contents:additionalAttrs:clearCKInfoOnSyncUp:stillPendingFields:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Attempting to rename/reparent/trash special folder: undoing this operation on %@%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCFSImporter_deleteItem_recursively_baseVersion_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Failed to save to db without an error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Propagating removal to %llu dead children%@");
  OUTLINED_FUNCTION_0();
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Finished propagating removal to %llu dead children%@");
  OUTLINED_FUNCTION_0();
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: changes == (int64_t)newlyDeadFileObjectIDs.count%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_markNextChildBatchDead:persistedState:batchSize:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking next child batch dead for %@%@");
  OUTLINED_FUNCTION_0();
}

void __66__BRCFSImporter__markNextChildBatchDead_persistedState_batchSize___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: argc == 4%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_propagateFieldsToNextChildBatch:persistedState:minRowID:batchSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Propagating fields of %@ to child%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no sharing options for %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_81_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no visible for %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_82_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no scope for %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_83_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no timestamp for %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_84_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no notif rank for %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_85_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Clearing upload error for rowid %llu%@");
  OUTLINED_FUNCTION_0();
}

void __84__BRCFSImporter__propagateFieldsToNextChildBatch_persistedState_minRowID_batchSize___block_invoke_86_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: argc == 9%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Processed %lld items needing clean after migration%@");
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't find rowid %@%@");
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_cold_3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_8_0(&dword_230455000, a4, a3, "[ERROR] Failed to update client items - %@%@", (uint8_t *)a3);

}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: argc == 3 || argc == 8%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] rejected item with rowid %llu got left behind when migrating%@");
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_111_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: argc == 10%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSImporter__cleanItemBatchAfterMigrationToFPFSIfNecessary__block_invoke_121_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: item with rowID %@ got left behind when migrating%@");
  OUTLINED_FUNCTION_0();
}

@end
