@implementation BRCSharedClientZone

- (NSString)ownerName
{
  return self->super._ownerName;
}

- (BOOL)isSharedZone
{
  return 1;
}

- (BRCSharedServerZone)sharedZone
{
  return (BRCSharedServerZone *)self->super._serverZone;
}

- (void)setServerZone:(id)a3
{
  BRCServerZone *v4;
  BRCServerZone *serverZone;
  void *v6;
  NSObject *v7;

  v4 = (BRCServerZone *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCSharedClientZone setServerZone:].cold.1((uint64_t)v6, v7);

  }
  serverZone = self->super._serverZone;
  self->super._serverZone = v4;

}

- (id)rootItemID
{
  BRCItemID *v3;
  void *v4;
  id v5;

  v3 = [BRCItemID alloc];
  -[BRCClientZone dbRowID](self, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCItemID _initAsZoneRootWithZoneRowID:](v3, "_initAsZoneRootWithZoneRowID:", v4);

  return v5;
}

- (id)shareAcceptationSidefaultEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->super._db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE item_type IN (8, 10) AND zone_rowid = %@"), self->super._dbRowID);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__BRCSharedClientZone_shareAcceptationSidefaultEnumerator__block_invoke;
  v6[3] = &unk_24FE40010;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__BRCSharedClientZone_shareAcceptationSidefaultEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)addAcceptOperation:(id)a3 forItemID:(id)a4
{
  id v6;
  id v7;
  BRCSharedClientZone *v8;
  NSMutableDictionary *shareAcceptationByItemID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  shareAcceptationByItemID = v8->_shareAcceptationByItemID;
  if (!shareAcceptationByItemID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v11 = v8->_shareAcceptationByItemID;
    v8->_shareAcceptationByItemID = v10;

    shareAcceptationByItemID = v8->_shareAcceptationByItemID;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](shareAcceptationByItemID, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCSharedClientZone addAcceptOperation:forItemID:].cold.1((uint64_t)v12, (uint64_t)v13, v14);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_shareAcceptationByItemID, "setObject:forKeyedSubscript:", v6, v7);
  objc_msgSend(v6, "completionBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__BRCSharedClientZone_addAcceptOperation_forItemID___block_invoke;
  v18[3] = &unk_24FE49DA0;
  objc_copyWeak(&v21, &location);
  v18[4] = v8;
  v16 = v7;
  v19 = v16;
  v17 = v15;
  v20 = v17;
  objc_msgSend(v6, "setCompletionBlock:", v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  objc_sync_exit(v8);
  -[BRCClientZone addSyncDownDependency:](v8, "addSyncDownDependency:", v6);

}

void __52__BRCSharedClientZone_addAcceptOperation_forItemID___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 504);
    *(_QWORD *)(v4 + 504) = 0;

  }
  objc_sync_exit(v2);

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

- (id)shareAcceptOperationForItemID:(id)a3
{
  id v4;
  BRCSharedClientZone *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_shareAcceptationByItemID, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllShareAcceptationSidefaults
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[BRCSharedClientZone shareAcceptationSidefaultEnumerator](self, "shareAcceptationSidefaultEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412290;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if ((objc_msgSend(v9, "isShareAcceptationFault", v17) & 1) == 0)
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v14;
            _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isShareAcceptationFault%@", buf, 0xCu);
          }

        }
        objc_msgSend(v9, "itemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCClientZone serverItemByItemID:](self, "serverItemByItemID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "asShareAcceptationFault");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          objc_msgSend(v12, "markNeedsTransformIntoNormalFault");

          objc_msgSend(v9, "saveToDB");
        }
        else
        {
          objc_msgSend(v12, "deleteShareAcceptationFault");

        }
        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v6 = v16;
    }
    while (v16);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareAcceptationByItemID, 0);
}

- (void)setServerZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [serverZone isKindOfClass:[BRCSharedServerZone class]]%@", (uint8_t *)&v2, 0xCu);
}

- (void)addAcceptOperation:(os_log_t)log forItemID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_230455000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there is already a share acceptation running for that itemID; %@%@",
    (uint8_t *)&v3,
    0x16u);
}

@end
