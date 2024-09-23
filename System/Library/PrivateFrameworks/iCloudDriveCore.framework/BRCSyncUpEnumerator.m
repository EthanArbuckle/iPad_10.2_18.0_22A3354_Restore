@implementation BRCSyncUpEnumerator

- (BRCSyncUpEnumerator)initWithClientZone:(id)a3
{
  id v5;
  BRCSyncUpEnumerator *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *visitedItemIDsToDepthMap;
  NSMutableSet *v11;
  NSMutableSet *itemIDsLostOrThrottled;
  NSMutableSet *v13;
  NSMutableSet *itemIDsNeedingOSUpgrade;
  NSMutableSet *v15;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  NSMutableSet *v17;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  NSMutableSet *v19;
  NSMutableSet *chainedParentIDAllowlist;
  NSMutableArray *v21;
  NSMutableArray *itemsNeedingUnshare;
  NSMutableArray *v23;
  NSMutableArray *tooDeepItems;
  NSMutableIndexSet *v25;
  NSMutableIndexSet *returned;
  uint64_t v27;
  NSMutableArray *stack;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BRCSyncUpEnumerator;
  v6 = -[BRCSyncUpEnumerator init](&v30, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6->_batchSize = objc_msgSend(v5, "syncUpBatchSize");
    v6->_maxDepth = objc_msgSend(v8, "maxSyncPathDepth");
    v6->_should2PhasePCSChain = objc_msgSend(v8, "should2PhasePCSChain");
    v6->_retryAfter = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_clientZone, a3);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v6->_batchSize);
    visitedItemIDsToDepthMap = v6->_visitedItemIDsToDepthMap;
    v6->_visitedItemIDsToDepthMap = (NSMutableDictionary *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    itemIDsLostOrThrottled = v6->_itemIDsLostOrThrottled;
    v6->_itemIDsLostOrThrottled = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    itemIDsNeedingOSUpgrade = v6->_itemIDsNeedingOSUpgrade;
    v6->_itemIDsNeedingOSUpgrade = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    itemIDsNeedingDirectoryFetch = v6->_itemIDsNeedingDirectoryFetch;
    v6->_itemIDsNeedingDirectoryFetch = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    itemIDsWithChildrenBeingCopiedToNewZone = v6->_itemIDsWithChildrenBeingCopiedToNewZone;
    v6->_itemIDsWithChildrenBeingCopiedToNewZone = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    chainedParentIDAllowlist = v6->_chainedParentIDAllowlist;
    v6->_chainedParentIDAllowlist = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    itemsNeedingUnshare = v6->_itemsNeedingUnshare;
    v6->_itemsNeedingUnshare = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tooDeepItems = v6->_tooDeepItems;
    v6->_tooDeepItems = v23;

    v25 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    returned = v6->_returned;
    v6->_returned = v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6->_maxDepth);
    stack = v6->_stack;
    v6->_stack = (NSMutableArray *)v27;

    v6->_currentDepth = 0;
    v6->_stage = 0;

  }
  return v6;
}

- (void)invalidate
{
  PQLEnumeration *enumerator;

  -[PQLEnumeration close](self->_enumerator, "close");
  enumerator = self->_enumerator;
  self->_enumerator = 0;

}

- (id)_documentsOrAliasesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (1, 2, 8, 5, 6, 7, 3)    AND li.item_state = 0    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_24FE40010;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __65__BRCSyncUpEnumerator__documentsOrAliasesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)_liveDirectoriesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su  ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_type IN (0, 9, 10, 4)    AND (li.item_state = 0)    AND li.item_localsyncupstate = 4    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_24FE40010;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__BRCSyncUpEnumerator__liveDirectoriesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (id)_tombstoneLeavesNeedingSyncUpEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[BRCClientZone db](self->_clientZone, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_processing_stamp, li.item_bouncedname, li.item_scope, li.item_local_change_count, li.item_old_version_identifier, li.fp_creation_item_identifier, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.version_local_change_count, li.version_old_version_identifier, li.item_live_conflict_loser_etags, li.item_file_id, li.item_generation FROM client_items AS li  INNER JOIN client_sync_up AS su    ON su.throttle_id = li.rowid  WHERE         su.throttle_state = 50    AND su.zone_rowid = %@    AND su.in_flight_diffs IS NULL    AND li.item_state = 1    AND li.item_localsyncupstate = 4    AND NOT EXISTS(SELECT 1 FROM client_items AS ci                     WHERE li.item_id = ci.item_parent_id                      AND ci.zone_rowid = su.zone_rowid)    AND li.item_min_supported_os_rowid IS NULL ORDER BY su.retry_count ASC"), v4);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke;
  v8[3] = &unk_24FE40010;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__BRCSyncUpEnumerator__tombstoneLeavesNeedingSyncUpEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5 descendantBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  if (objc_msgSend(v10, "isDirectory"))
  {
    objc_msgSend(v10, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v19, "isDirectory", (_QWORD)v22))
        {
          objc_msgSend(v19, "itemID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

        }
        if (v12)
        {
          objc_msgSend(v19, "itemID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(v14, "removeAllObjects");
}

- (void)_denyListDescendantStack:(id)a3 parentItem:(id)a4 andAddToSet:(id)a5
{
  -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:descendantBlock:](self, "_denyListDescendantStack:parentItem:andAddToSet:descendantBlock:", a3, a4, a5, 0);
}

- (BOOL)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:(id)a3 now:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  unint64_t retryAfter;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "needsOSUpgradeToSyncUp"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:].cold.1();

    -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v6, self->_itemIDsLostOrThrottled);
LABEL_23:
    v16 = 1;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[BRCClientZone syncThrottles](self->_clientZone, "syncThrottles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v22 = 0;
          if (objc_msgSend(v14, "matchesItem:nsecsToRetry:now:", v6, &v22, a4))
            v15 = v22 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            brc_bread_crumbs();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v28 = v6;
              v29 = 2048;
              v30 = v22;
              v31 = 2112;
              v32 = v17;
              _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ and all dependents because %llu nsecs to retry%@", buf, 0x20u);
            }

            retryAfter = self->_retryAfter;
            if (retryAfter >= v22)
              retryAfter = v22;
            self->_retryAfter = retryAfter;
            -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v6, self->_itemIDsLostOrThrottled);

            goto LABEL_23;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = 0;
  }

  return v16;
}

- (BOOL)isDenyListed:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v4) & 1) != 0
    || (-[NSMutableSet containsObject:](self->_itemIDsNeedingOSUpgrade, "containsObject:", v4) & 1) != 0
    || (-[NSMutableSet containsObject:](self->_itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = -[NSMutableSet containsObject:](self->_itemIDsNeedingDirectoryFetch, "containsObject:", v4);
  }

  return v5;
}

- (BOOL)shouldDenylistRemainingDeletionParentStackForItem:(id)a3
{
  id v4;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  void *v6;
  char v7;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isDead"))
  {
    itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
    objc_msgSend(v4, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](itemIDsNeedingDirectoryFetch, "containsObject:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
      objc_msgSend(v4, "itemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableSet containsObject:](itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v9);

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)handleItemForOSUpgrade:(id)a3 parentItemID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *stack;
  NSMutableSet *itemIDsNeedingOSUpgrade;
  BOOL v16;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "needsOSUpgradeToSyncUp") & 1) != 0
    || -[NSMutableSet containsObject:](self->_itemIDsNeedingOSUpgrade, "containsObject:", v7))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:].cold.1();

    if (!objc_msgSend(v6, "needsOSUpgradeToSyncUp"))
    {
      objc_msgSend(v6, "parentItemIDInZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (objc_msgSend(v10, "isNonDesktopRoot") & 1) == 0)
      {
        objc_msgSend(v6, "clientZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemByItemID:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "inheritOSUpgradeNeededFromItem:", v13);
        objc_msgSend(v6, "saveToDB");

      }
      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");

    }
    stack = self->_stack;
    itemIDsNeedingOSUpgrade = self->_itemIDsNeedingOSUpgrade;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke;
    v18[3] = &unk_24FE4A010;
    v18[4] = self;
    v19 = v6;
    -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:descendantBlock:](self, "_denyListDescendantStack:parentItem:andAddToSet:descendantBlock:", stack, v19, itemIDsNeedingOSUpgrade, v18);

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __59__BRCSyncUpEnumerator_handleItemForOSUpgrade_parentItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "itemByItemID:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsOSUpgradeToSyncUp") & 1) == 0)
  {
    objc_msgSend(v3, "inheritOSUpgradeNeededFromItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "saveToDB");
  }

}

- (BOOL)_handleSharedItemWhichMovedToNewShare:(id)a3 rootItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  BRCClientZone *clientZone;
  void *v21;
  NSObject *v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "sharingOptions") & 4) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.1();

    goto LABEL_21;
  }
  objc_msgSend(v6, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToClientZone:", self->_clientZone))
    v11 = -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone");
  else
    v11 = 0;

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = " in the same zone";
    v24 = 138413058;
    if (!v11)
      v14 = 0;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2080;
    v29 = v14;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] item with shareID %@ is moving into a shared parent %@%s%@", (uint8_t *)&v24, 0x2Au);
  }

  if (!v11)
  {
    clientZone = self->_clientZone;
    objc_msgSend(v7, "itemGlobalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone itemMovedIntoShareInThisZone:associatedItemID:](clientZone, "itemMovedIntoShareInThisZone:associatedItemID:", v6, v8);
LABEL_21:
    v19 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v6, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serverItemByItemID:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "sharingOptions") & 4) != 0)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.3();

    -[NSMutableArray addObject:](self->_itemsNeedingUnshare, "addObject:", v6);
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:].cold.2();

  objc_msgSend(v6, "updateItemMetadataFromServerItem:appliedSharingPermission:", v8, 0);
  objc_msgSend(v6, "saveToDBForServerEdit:keepAliases:", 1, 0);
  v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_checkForSharesWithinSharesWithItem:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSMutableArray *itemsNeedingUnshare;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, uint64_t, _BYTE *);
  void *v31;
  id v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  BRCSyncUpEnumerator *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isDead") & 1) != 0 || (objc_msgSend(v4, "isFSRoot") & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x20) != 0 && (objc_msgSend(v4, "sharingOptions") & 4) != 0)
  {
    objc_msgSend(v4, "parentItemOnFS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "sharingOptions") & 0x48) != 0)
    {
      objc_msgSend(v4, "asShareableItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[BRCSyncUpEnumerator _handleSharedItemWhichMovedToNewShare:rootItem:](self, "_handleSharedItemWhichMovedToNewShare:rootItem:", v25, 0);

      if (v26)
      {
        brc_bread_crumbs();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:].cold.2(v4, (uint64_t)v10, v27);

        v6 = 1;
        goto LABEL_34;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x20) != 0
    && -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone")
    && objc_msgSend(v4, "isDirectory"))
  {
    if (!v5)
    {
      objc_msgSend(v4, "parentItemOnFS");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v5, "sharingOptions") & 0x48) != 0)
    {
      -[BRCClientZone session](self->_clientZone, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      objc_msgSend(v4, "asDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke;
      v34[3] = &unk_24FE4A038;
      v10 = v8;
      v38 = &v39;
      v35 = v10;
      v36 = self;
      v11 = v4;
      v37 = v11;
      objc_msgSend(v10, "enumerateItemsWithShareIDUnderParent:block:", v9, v34);

      v6 = *((_BYTE *)v40 + 24) != 0;
      if (*((_BYTE *)v40 + 24))
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "itemID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:].cold.1(v14, (uint64_t)v12, (uint64_t)v47, v13);
        }

      }
      _Block_object_dispose(&v39, 8);
LABEL_34:

      goto LABEL_20;
    }
  }
  v6 = 0;
LABEL_20:
  if ((objc_msgSend(v4, "sharingOptions") & 0x7C) == 4 && objc_msgSend(v4, "isDirectory"))
  {
    objc_msgSend(v4, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverItemByItemID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "sharingOptions") & 0x7C) == 4)
    {
      -[BRCClientZone session](self->_clientZone, "session");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      objc_msgSend(v4, "asDirectory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_13;
      v31 = &unk_24FE4A060;
      v20 = v4;
      v32 = v20;
      v33 = &v39;
      objc_msgSend(v18, "enumerateItemsWithShareIDUnderParent:block:", v19, &v28);

      if (*((_BYTE *)v40 + 24))
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v20;
          v45 = 2112;
          v46 = v21;
          _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Unsharing turd folder share %@ because it now has shared children%@", buf, 0x16u);
        }

        itemsNeedingUnshare = self->_itemsNeedingUnshare;
        objc_msgSend(v20, "asShareableItem", v28, v29, v30, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](itemsNeedingUnshare, "addObject:", v24);

        v6 = 1;
      }

      _Block_object_dispose(&v39, 8);
    }

  }
LABEL_4:

  return v6;
}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemGlobalID:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isDead") & 1) == 0)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 1;
    }
    else
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v6, "asShareableItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "_handleSharedItemWhichMovedToNewShare:rootItem:", v5, *(_QWORD *)(a1 + 48));

    }
  }

}

void __59__BRCSyncUpEnumerator__checkForSharesWithinSharesWithItem___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  char v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "itemGlobalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToItemGlobalID:", v7);

  if ((v9 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_checkIfParentNeedsRevivalWithParentItem:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  BRCClientZone *clientZone;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isRejected"))
  {
    clientZone = self->_clientZone;
    objc_msgSend(v6, "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v13)
      && objc_msgSend(v6, "isKnownByServer")
      && objc_msgSend(v6, "isIdleOrRejected"))
    {
      v14 = objc_msgSend(v6, "isDeadOrMissingInServerTruth");

      if (v14)
      {
        if ((objc_msgSend(v6, "isSharedToMeChildItem") & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v6, "clientZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isPrivateZone");

        if (v16)
        {
          objc_msgSend(v6, "clientZone");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "asPrivateClientZone");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "pcsChainStateForItem:", v19) & 0xFFFFFFFE;

          if (v20 == 2)
          {
LABEL_13:
            brc_bread_crumbs();
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
              goto LABEL_5;
            v22 = 138412546;
            v23 = v6;
            v24 = 2112;
            v25 = v8;
            v10 = "[WARNING] Parent item needs to be revived to sync up %@%@";
            goto LABEL_4;
          }
        }
      }
    }
    else
    {

    }
    v11 = 0;
    goto LABEL_17;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v10 = "[WARNING] Parent item is rejected so we will reset if we try to sync up without syncing up the parent. Item: %@%@";
LABEL_4:
    _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
  }
LABEL_5:

  objc_msgSend(v6, "markForceNeedsSyncUp");
  objc_msgSend(v6, "saveToDB");
  v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_handlePendingShareItemWithPendingDeleteChildren:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preventSharingFolderWithPendingDelete");

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:].cold.1((uint64_t)v12, v17);

    goto LABEL_13;
  }
  if (!objc_msgSend(v3, "isChildSharedItem"))
    goto LABEL_14;
  if (!objc_msgSend(v3, "isSharedByMe"))
    goto LABEL_14;
  if (!objc_msgSend(v3, "isDirectory"))
    goto LABEL_14;
  objc_msgSend(v3, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsPendingDeleteDocuments");

  if (!v9)
    goto LABEL_14;
  objc_msgSend(v3, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverItemByItemID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isChildSharedItem") & 1) != 0)
  {
LABEL_13:

LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v15;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Sync: denylist %@ until the delete of its child%@", (uint8_t *)&v19, 0x16u);

  }
  v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)_checkIfShouldDenylistForPathMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isDirectory") && (objc_msgSend(v4, "isKnownByServerOrInFlight") & 1) == 0)
  {
    objc_msgSend(v4, "serverPathMatchItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (!-[BRCClientZone existsByItemID:](self->_clientZone, "existsByItemID:", v5))
      {
        -[BRCClientZone serverItemByItemID:](self->_clientZone, "serverItemByItemID:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isBRAlias");

        if ((v7 & 1) == 0)
        {
          brc_bread_crumbs();
          v8 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v9) = 1;
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "itemID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = 138412802;
            v15 = v9;
            v16 = 2112;
            v17 = v5;
            v18 = 2112;
            v19 = v8;
            _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's an unresolved path-match with %@%@", (uint8_t *)&v14, 0x20u);

            LOBYTE(v9) = 1;
          }
          goto LABEL_13;
        }
      }
    }

  }
  if ((objc_msgSend(v4, "localDiffs") & 0x1000000060) != 0)
  {
    objc_msgSend(v4, "serverPathMatchItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      LOBYTE(v9) = 0;
      goto LABEL_17;
    }
    -[BRCClientZone itemByItemID:](self->_clientZone, "itemByItemID:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = -[NSObject isLost](v8, "isLost");
    if (!(_DWORD)v9)
    {
LABEL_14:

LABEL_17:
      goto LABEL_18;
    }
    brc_bread_crumbs();
    v10 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because we have a lost item at the same path in the server truth - %@%@", (uint8_t *)&v14, 0x20u);

    }
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
LABEL_18:

  return (char)v9;
}

- (BOOL)_checkIfShouldDenylistForParentDirectoryFaultWithItem:(id)a3 needsDirFaultCheck:(BOOL *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  BRCClientZone *clientZone;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  BRCClientZone *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "state") & 4) != 0
    || (objc_msgSend(v7, "hasFetchedServerZoneState") & 1) == 0
    || -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone")
    && objc_msgSend(v6, "isSharedToMeTopLevelItem"))
  {
    v8 = 0;
    *a4 = 0;
  }
  else
  {
    objc_msgSend(v6, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parentID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    clientZone = self->_clientZone;
    objc_msgSend(v6, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BRCClientZone serverItemTypeByItemID:db:](clientZone, "serverItemTypeByItemID:db:", v11, v13);

    if (v14 == 9)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] denylist %@ because parent is a directory fault in the server truth%@", (uint8_t *)&v19, 0x16u);
      }

      v17 = self->_clientZone;
      v8 = 1;
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:](v17, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v11, 0, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "beginObservingChangesWithDelegate:", 0);
      *a4 = 0;

    }
    else
    {
      v8 = 0;
      if (!(_BYTE)v14)
        *a4 = 0;
    }

  }
  return v8;
}

- (BOOL)_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:(id)a3
{
  id v4;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(itemIDsWithChildrenBeingCopiedToNewZone) = -[NSMutableSet containsObject:](itemIDsWithChildrenBeingCopiedToNewZone, "containsObject:", v6);

  if ((itemIDsWithChildrenBeingCopiedToNewZone & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[BRCClientZone db](self->_clientZone, "db");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items AS ci INNER JOIN server_items AS si ON ci.version_old_zone_item_id = si.item_id AND ci.version_old_zone_rowid = si.zone_rowid  WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ LIMIT 1"), v9, v10);

    v7 = objc_msgSend(v11, "BOOLValue");
  }

  return v7;
}

- (id)_nextLiveItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *visitedItemIDsToDepthMap;
  void *v8;
  NSMutableArray *tooDeepItems;
  void *v10;
  uint64_t v11;
  PQLEnumeration *v12;
  __int128 v13;
  PQLEnumeration *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  NSMutableArray *v27;
  void *v28;
  int v29;
  char v30;
  PQLEnumeration *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  BRCClientZone *v44;
  PQLEnumeration *v45;
  NSObject *v46;
  void *v47;
  BRCClientZone *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  PQLEnumeration *v56;
  void *v57;
  BRCClientZone *clientZone;
  void *v59;
  NSObject *v60;
  __int128 v61;
  uint64_t v62;
  PQLEnumeration *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  BRCClientZone *v72;
  __int16 v73;
  PQLEnumeration *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v64 = brc_current_date_nsec();
  -[NSMutableArray lastObject](self->_stack, "lastObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = (void *)MEMORY[0x2348B9F14]();
      ++self->_currentDepth;
      -[NSMutableArray removeLastObject](self->_stack, "removeLastObject");
      if (self->_currentDepth >= self->_maxDepth)
      {
        tooDeepItems = self->_tooDeepItems;
        objc_msgSend(v4, "itemID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](tooDeepItems, "addObject:", v10);

        objc_msgSend(v4, "markCannotSynchronizeForTooDeepHierarchy");
        objc_msgSend(v4, "saveToDB");
      }
      else
      {
        if (objc_msgSend(v4, "isDirectory"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentDepth);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          visitedItemIDsToDepthMap = self->_visitedItemIDsToDepthMap;
          objc_msgSend(v4, "itemID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](visitedItemIDsToDepthMap, "setObject:forKeyedSubscript:", v6, v8);

        }
        if ((-[NSMutableIndexSet containsIndex:](self->_returned, "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) == 0
          && objc_msgSend(v4, "syncUpState") == 4
          && !-[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:](self, "_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:", v4, v64))
        {
          -[NSMutableIndexSet addIndex:](self->_returned, "addIndex:", objc_msgSend(v4, "dbRowID"));
          v56 = v4;
          objc_autoreleasePoolPop(v5);
          v57 = v56;
          goto LABEL_70;
        }
      }
      objc_autoreleasePoolPop(v5);
      -[NSMutableArray lastObject](self->_stack, "lastObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
    while (v11);
  }
  self->_currentDepth = 0;
  if (-[NSMutableArray count](self->_stack, "count"))
  {
    brc_bread_crumbs();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpEnumerator _nextLiveItem].cold.1((uint64_t)v59, v60);

  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v12 = self->_enumerator;
  v65 = -[PQLEnumeration countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (!v65)
  {
LABEL_60:
    v57 = 0;
    v56 = v12;
    goto LABEL_70;
  }
  v14 = 0;
  v15 = *(_QWORD *)v68;
  *(_QWORD *)&v13 = 138412546;
  v61 = v13;
  v62 = *(_QWORD *)v68;
  v63 = v12;
LABEL_15:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v68 != v15)
      objc_enumerationMutation(v12);
    v56 = (PQLEnumeration *)*(id *)(*((_QWORD *)&v67 + 1) + 8 * v16);

    if ((-[NSMutableIndexSet containsIndex:](self->_returned, "containsIndex:", -[PQLEnumeration dbRowID](v56, "dbRowID")) & 1) != 0)
    {
      v14 = v56;
      goto LABEL_55;
    }
    -[PQLEnumeration itemID](v56, "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BRCSyncUpEnumerator isDenyListed:](self, "isDenyListed:", v17);

    if (!v18)
      break;
LABEL_54:
    v14 = v56;
    v15 = v62;
    v12 = v63;
LABEL_55:
    if (++v16 == v65)
    {
      v49 = -[PQLEnumeration countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      v65 = v49;
      if (!v49)
      {

        goto LABEL_60;
      }
      goto LABEL_15;
    }
  }
  while (2)
  {
    v66 = 0;
    -[PQLEnumeration itemID](v56, "itemID", v61);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isDocumentsFolder") ^ 1;

    v66 = v20;
    -[PQLEnumeration clientZone](v56, "clientZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToClientZone:", self->_clientZone))
    {

    }
    else
    {
      -[PQLEnumeration parentClientZone](v56, "parentClientZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToClientZone:", self->_clientZone);

      if (v23)
      {
        -[PQLEnumeration parentItemOnFS](v56, "parentItemOnFS");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "itemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v24;
        goto LABEL_26;
      }
    }
    -[PQLEnumeration parentItemIDInZone](v56, "parentItemIDInZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
LABEL_26:
    v27 = self->_tooDeepItems;
    -[PQLEnumeration itemID](v56, "itemID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = -[NSMutableArray containsObject:](v27, "containsObject:", v28);

    if ((_DWORD)v27)
    {
      self->_currentDepth = self->_maxDepth + 1;
      goto LABEL_53;
    }
    -[NSMutableArray addObject:](self->_stack, "addObject:", v56);
    v29 = -[PQLEnumeration isLost](v56, "isLost");
    v30 = v29;
    if (v29)
    {
      brc_bread_crumbs();
      v31 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[PQLEnumeration itemID](v56, "itemID");
        v44 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v61;
        v72 = v44;
        v73 = 2112;
        v74 = v31;
        _os_log_debug_impl(&dword_230455000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's lost%@", buf, 0x16u);

      }
    }
    -[BRCClientZone itemIDsBlockedFromSyncForCZMProcessing](self->_clientZone, "itemIDsBlockedFromSyncForCZMProcessing");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PQLEnumeration itemGlobalID](v56, "itemGlobalID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "containsObject:", v34);

    if (!v35)
    {
      if ((v30 & 1) != 0)
        goto LABEL_52;
      v36 = -[BRCSyncUpEnumerator _checkForSharesWithinSharesWithItem:](self, "_checkForSharesWithinSharesWithItem:", v56);
      if (!v36 && v66)
        v36 = -[BRCSyncUpEnumerator _checkIfShouldDenylistForParentDirectoryFaultWithItem:needsDirFaultCheck:](self, "_checkIfShouldDenylistForParentDirectoryFaultWithItem:needsDirFaultCheck:", v56, &v66);
      if (v36
        || -[BRCSyncUpEnumerator _checkIfShouldDenylistForPathMatch:](self, "_checkIfShouldDenylistForPathMatch:", v56)
        || -[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v25))
      {
        goto LABEL_52;
      }
      if (-[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:](self, "handleItemForOSUpgrade:parentItemID:", v56, v25)|| -[BRCSyncUpEnumerator _handlePendingShareItemWithPendingDeleteChildren:](self, "_handlePendingShareItemWithPendingDeleteChildren:", v56))
      {
        goto LABEL_53;
      }
      -[NSMutableDictionary objectForKey:](self->_visitedItemIDsToDepthMap, "objectForKey:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_visitedItemIDsToDepthMap, "objectForKeyedSubscript:", v25);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        self->_currentDepth = objc_msgSend(v47, "intValue");

        goto LABEL_53;
      }
      if ((objc_msgSend(v25, "isNonDesktopRoot") & 1) != 0)
        goto LABEL_53;
      v38 = v26;
      if (!v26)
      {
        objc_msgSend(0, "clientZone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PQLEnumeration clientZone](v56, "clientZone");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqualToClientZone:", v40);

        if ((v41 & 1) != 0)
          goto LABEL_61;
        if (!v25)
          goto LABEL_62;
        -[PQLEnumeration clientZone](v56, "clientZone");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "itemByItemID:", v25);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
LABEL_61:

LABEL_62:
          brc_bread_crumbs();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            clientZone = self->_clientZone;
            *(_DWORD *)buf = 138412802;
            v72 = clientZone;
            v73 = 2112;
            v74 = v56;
            v75 = 2112;
            v76 = v50;
            _os_log_fault_impl(&dword_230455000, v51, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
          }

          -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self->_clientZone, "scheduleResetServerAndClientTruthsForReason:", CFSTR("orphan.live"));
          v57 = 0;
          goto LABEL_69;
        }
      }
      -[BRCSyncUpEnumerator _checkIfParentNeedsRevivalWithParentItem:item:](self, "_checkIfParentNeedsRevivalWithParentItem:item:", v38, v56);
      v43 = v38;

      v56 = (PQLEnumeration *)v43;
      continue;
    }
    break;
  }
  brc_bread_crumbs();
  v45 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    -[PQLEnumeration itemID](v56, "itemID");
    v48 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v61;
    v72 = v48;
    v73 = 2112;
    v74 = v45;
    _os_log_debug_impl(&dword_230455000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: denylist %@ because it's already being processed for CZM%@", buf, 0x16u);

  }
LABEL_52:
  -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v56, self->_itemIDsLostOrThrottled);
LABEL_53:

  if (!-[NSMutableArray count](self->_stack, "count"))
    goto LABEL_54;
  if ((unint64_t)-[NSMutableArray count](self->_stack, "count") >= 2)
  {
    v52 = 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v52 - 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "checkIsInDocumentsScopeWithParent:", v54);

      ++v52;
    }
    while (v52 < -[NSMutableArray count](self->_stack, "count"));
  }
  -[BRCSyncUpEnumerator _nextLiveItem](self, "_nextLiveItem");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_69:

LABEL_70:
  return v57;
}

- (id)_nextTombstone
{
  void *v3;
  id v4;
  int *v5;
  int *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSMutableArray *stack;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *tombstonesEmbargo;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  NSObject *v62;
  NSMutableSet *itemIDsWithChildrenBeingCopiedToNewZone;
  void *v64;
  void *v65;
  int v66;
  NSMutableSet *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  NSMutableSet *itemIDsNeedingDirectoryFetch;
  void *v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  unsigned int maxDepth;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSMutableSet *v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  NSObject *v110;
  BRCClientZone *clientZone;
  id v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id obj;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint8_t v127[128];
  uint8_t buf[4];
  _BYTE v129[28];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v115 = brc_current_date_nsec();
  v3 = 0;
  v4 = 0;
  v5 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
  v6 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
  while (2)
  {
    while (1)
    {
      v7 = v4;
      -[NSMutableArray firstObject](self->_stack, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v4)
        break;
      v8 = (void *)MEMORY[0x2348B9F14]();
      v9 = -[BRCSyncUpEnumerator shouldDenylistRemainingDeletionParentStackForItem:](self, "shouldDenylistRemainingDeletionParentStackForItem:", v4);
      stack = self->_stack;
      if (v9)
      {
        -[NSMutableArray removeAllObjects](stack, "removeAllObjects");
        objc_autoreleasePoolPop(v8);
        break;
      }
      -[NSMutableArray removeObjectAtIndex:](stack, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v4, "isDirectory"))
        goto LABEL_37;
      objc_msgSend(v4, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visitedItemIDsToDepthMap, "setObject:forKeyedSubscript:", &unk_24FEB3C20, v11);
      if (objc_msgSend(v4, "syncUpState") == 4)
      {
        v12 = v3;
        v13 = v6[541];
        if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_tombstonesEmbargo, "objectForKeyedSubscript:", v11);
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v15;
          if (v15)
            goto LABEL_11;
          -[BRCClientZone db](self->_clientZone, "db");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(uint64_t *)((char *)&self->super.super.isa + v13);
          -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v19, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM client_items  WHERE item_parent_id = %@     AND item_localsyncupstate = 4    AND NOT indexset_contains(%p, rowid)    AND zone_rowid = %@"), v11, v20, v21);

          v116 = (void *)v22;
          if (!v22)
          {
            brc_bread_crumbs();
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v129 = v105;
              _os_log_fault_impl(&dword_230455000, v106, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: n%@", buf, 0xCu);
            }

          }
          -[BRCClientZone mangledID](self->_clientZone, "mangledID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "checkTombstoneEmbargoReparents");

          if (v25)
          {
            -[BRCClientZone db](self->_clientZone, "db");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCClientZone dbRowID](self->_clientZone, "dbRowID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v26, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items AS si INNER JOIN client_items AS ci USING (item_id, zone_rowid) WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ci.item_parent_id != si.item_parent_id AND ci.item_localsyncupstate != 0 AND NOT indexset_contains(%p, ci.rowid)"), v11, v27, *(Class *)((char *)&self->super.super.isa + v13));

            if (!v28)
            {
              brc_bread_crumbs();
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v108 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v129 = v107;
                _os_log_fault_impl(&dword_230455000, v108, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: reparentedOutCount%@", buf, 0xCu);
              }

            }
            v3 = v116;
            if (objc_msgSend(v28, "unsignedLongLongValue"))
            {
              brc_bread_crumbs();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v30 = objc_claimAutoreleasedReturnValue();
              v6 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = objc_msgSend(v28, "unsignedLongLongValue");
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v129 = v11;
                *(_WORD *)&v129[8] = 2048;
                *(_QWORD *)&v129[10] = v31;
                *(_WORD *)&v129[18] = 2112;
                *(_QWORD *)&v129[20] = v29;
                _os_log_impl(&dword_230455000, v30, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ has %llu items with a new parent%@", buf, 0x20u);
              }

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v28, "unsignedLongLongValue") + objc_msgSend(v116, "unsignedLongLongValue"));
              v32 = objc_claimAutoreleasedReturnValue();

              v3 = (void *)v32;
            }
            else
            {
              v6 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
            }

          }
          else
          {
            v3 = v116;
            v6 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
          }
          if (objc_msgSend(v3, "BOOLValue"))
          {
            if (!self->_tombstonesEmbargo)
            {
              v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
              tombstonesEmbargo = self->_tombstonesEmbargo;
              self->_tombstonesEmbargo = v35;

            }
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v3;
              *(_WORD *)&v129[18] = 2112;
              *(_QWORD *)&v129[20] = v37;
              _os_log_debug_impl(&dword_230455000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoing item %@: it has %@ unsynced children%@", buf, 0x20u);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tombstonesEmbargo, "setObject:forKeyedSubscript:", v3, v11);
            v16 = v3;
            if (!v3)
              goto LABEL_36;
LABEL_11:
            v3 = v16;
            if (objc_msgSend(v16, "integerValue"))
            {
              brc_bread_crumbs();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v129 = v11;
                *(_WORD *)&v129[8] = 2112;
                *(_QWORD *)&v129[10] = v16;
                *(_WORD *)&v129[18] = 2112;
                *(_QWORD *)&v129[20] = v17;
                _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is embargoed: %@ unsynced children%@", buf, 0x20u);
              }

              -[NSMutableArray removeAllObjects](self->_stack, "removeAllObjects");
              goto LABEL_45;
            }
            brc_bread_crumbs();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v33;
              _os_log_debug_impl(&dword_230455000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is un-embargoed%@", buf, 0x16u);
            }

            -[NSMutableDictionary removeObjectForKey:](self->_tombstonesEmbargo, "removeObjectForKey:", v11);
          }
          else
          {

            v3 = 0;
          }
LABEL_36:

LABEL_37:
          objc_msgSend(v4, "st");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "parentID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](self->_tombstonesEmbargo, "objectForKeyedSubscript:", v11);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v40, "integerValue") - 1);
            v3 = (void *)objc_claimAutoreleasedReturnValue();

            brc_bread_crumbs();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v3;
              *(_WORD *)&v129[18] = 2112;
              *(_QWORD *)&v129[20] = v41;
              _os_log_debug_impl(&dword_230455000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] Embargoed item %@ has now %@ unreturned dead children left%@", buf, 0x20u);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tombstonesEmbargo, "setObject:forKeyedSubscript:", v3, v11);
          }
          else
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v129 = v11;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v43;
              _os_log_debug_impl(&dword_230455000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] item %@ isn't embargoed%@", buf, 0x16u);
            }

            v3 = 0;
          }
          if (!-[BRCSyncUpEnumerator _denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:](self, "_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:", v4, v115))
          {
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v6[541]), "addIndex:", objc_msgSend(v4, "dbRowID"));
            v114 = v4;
            v14 = 1;
            goto LABEL_47;
          }
LABEL_45:
          v14 = 4;
          goto LABEL_47;
        }
        v14 = 3;
        v3 = v12;
      }
      else
      {
        v14 = 3;
      }
LABEL_47:

      objc_autoreleasePoolPop(v8);
      v5 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
      if (v14 != 3)
      {
        if (v14 != 4)
        {
          v113 = v114;
          goto LABEL_152;
        }
        break;
      }
    }
    if (-[NSMutableArray count](self->_stack, "count"))
    {
      brc_bread_crumbs();
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v129 = v103;
        _os_log_fault_impl(&dword_230455000, v104, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", buf, 0xCu);
      }

      v5 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
    }
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    obj = *(id *)((char *)&self->super.super.isa + v5[545]);
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
    if (!v45)
    {
      v53 = 0;
      v113 = 0;
      v48 = v4;
      goto LABEL_151;
    }
    v46 = v45;
    v117 = v3;
    v47 = *(_QWORD *)v124;
    v48 = v4;
    v120 = *(_QWORD *)v124;
    while (2)
    {
      v49 = 0;
      v121 = v46;
LABEL_53:
      if (*(_QWORD *)v124 != v47)
        objc_enumerationMutation(obj);
      v4 = *(id *)(*((_QWORD *)&v123 + 1) + 8 * v49);

      v50 = v6[541];
      if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "containsIndex:", objc_msgSend(v4, "dbRowID")) & 1) != 0)
      {
        v48 = v4;
        goto LABEL_125;
      }
      v119 = v50;
      objc_msgSend(v4, "itemID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[BRCSyncUpEnumerator isDenyListed:](self, "isDenyListed:", v51);

      if (v52)
      {
LABEL_124:
        v48 = v4;
        v47 = v120;
        v46 = v121;
LABEL_125:
        if (++v49 == v46)
        {
          v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v127, 16);
          v46 = v99;
          if (!v99)
          {
            v53 = 0;
            v113 = 0;
            v3 = v117;
            goto LABEL_151;
          }
          continue;
        }
        goto LABEL_53;
      }
      break;
    }
    -[NSMutableArray addObject:](self->_stack, "addObject:", v4);
    if (-[NSMutableArray count](self->_stack, "count") >= (unint64_t)self->_maxDepth)
    {
      v48 = 0;
LABEL_110:
      brc_bread_crumbs();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        maxDepth = self->_maxDepth;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v129 = maxDepth;
        *(_WORD *)&v129[4] = 2112;
        *(_QWORD *)&v129[6] = v4;
        *(_WORD *)&v129[14] = 2112;
        *(_QWORD *)&v129[16] = v55;
        _os_log_impl(&dword_230455000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] max depth %u reached at %@%@", buf, 0x1Cu);
      }

LABEL_118:
      v6 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
      if (v48)
      {
        brc_bread_crumbs();
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v48, "debugItemIDString");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v94;
          *(_WORD *)&v129[8] = 2112;
          *(_QWORD *)&v129[10] = v91;
          _os_log_debug_impl(&dword_230455000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching recursive contents of %@ because it is the highest dead parent dir-fault%@", buf, 0x16u);

        }
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:](self->_clientZone, "fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:", v48, 0, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "beginObservingChanges");

      }
      if (-[NSMutableArray count](self->_stack, "count"))
      {
        if ((unint64_t)-[NSMutableArray count](self->_stack, "count") >= 2)
        {
          v100 = 1;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray objectAtIndexedSubscript:](self->_stack, "objectAtIndexedSubscript:", v100 - 1);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "checkIsInDocumentsScopeWithParent:", v102);

            ++v100;
          }
          while (v100 < -[NSMutableArray count](self->_stack, "count"));
        }

        v3 = v117;
        v5 = &OBJC_IVAR___BRFieldPkgLocalItem__fileID;
        continue;
      }

      goto LABEL_124;
    }
    break;
  }
  v48 = 0;
  v118 = 0;
  v53 = v4;
  while (1)
  {
    objc_msgSend(v53, "st");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "parentID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v53, "isLost") & 1) != 0)
    {
      v56 = 1;
    }
    else if (objc_msgSend(v53, "isDirectory") && objc_msgSend(v53, "isDead"))
    {
      objc_msgSend(v53, "st");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "processingStamp");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v58 != 0;

    }
    else
    {
      v56 = 0;
    }
    if (objc_msgSend(v53, "isDead") && objc_msgSend(v53, "isDirectory"))
    {
      if ((v118 & 1) != 0
        || (objc_msgSend(v53, "asDirectory"),
            v59 = (void *)objc_claimAutoreleasedReturnValue(),
            v60 = -[BRCSyncUpEnumerator _checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:](self, "_checkIfShouldDenylistForChildrenOfItemBeingCopiedToNewZone:", v59), v59, v60))
      {
        brc_bread_crumbs();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v53;
          *(_WORD *)&v129[8] = 2112;
          *(_QWORD *)&v129[10] = v61;
          _os_log_debug_impl(&dword_230455000, v62, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all deletes for item which has children being copied to a new zone %@%@", buf, 0x16u);
        }

        itemIDsWithChildrenBeingCopiedToNewZone = self->_itemIDsWithChildrenBeingCopiedToNewZone;
        objc_msgSend(v53, "itemID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](itemIDsWithChildrenBeingCopiedToNewZone, "addObject:", v64);

        v118 = 1;
        if (v48)
        {
LABEL_73:
          objc_msgSend(v53, "asDirectory");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "isDirectoryFault");

          if (!v66)
          {
LABEL_87:
            itemIDsNeedingDirectoryFetch = self->_itemIDsNeedingDirectoryFetch;
            objc_msgSend(v53, "itemID");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](itemIDsNeedingDirectoryFetch, "addObject:", v77);

            goto LABEL_88;
          }
LABEL_79:
          if (objc_msgSend(v53, "isSharedToMeTopLevelItem"))
          {
            brc_bread_crumbs();
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v129 = v53;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v71;
              _os_log_debug_impl(&dword_230455000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is nil because it's a shared-to-me top level item - %@%@", buf, 0x16u);
            }

            v73 = 0;
          }
          else
          {
            brc_bread_crumbs();
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v53, "itemID");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "itemIDString");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v129 = v84;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v74;
              _os_log_debug_impl(&dword_230455000, v75, OS_LOG_TYPE_DEBUG, "[DEBUG] Highest parent dead fault is %@%@", buf, 0x16u);

            }
            objc_msgSend(v53, "itemID");
            v73 = objc_claimAutoreleasedReturnValue();
          }

          v48 = (void *)v73;
          goto LABEL_87;
        }
      }
      else
      {
        v118 = 0;
        if (v48)
          goto LABEL_73;
      }
      v67 = self->_itemIDsNeedingDirectoryFetch;
      objc_msgSend(v53, "itemID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableSet containsObject:](v67, "containsObject:", v68))
      {

      }
      else
      {
        objc_msgSend(v53, "asDirectory");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "containsDirFault");

        if ((v70 & 1) == 0)
        {
          v48 = 0;
          goto LABEL_88;
        }
      }
      goto LABEL_79;
    }
LABEL_88:
    if (objc_msgSend(v53, "isSharedToMeTopLevelItem")
      && objc_msgSend(v53, "isDirectory")
      && objc_msgSend(v53, "isAlmostDead")
      && -[BRCClientZone isSharedZone](self->_clientZone, "isSharedZone"))
    {
      break;
    }
    -[NSMutableDictionary objectForKey:](self->_visitedItemIDsToDepthMap, "objectForKey:", v55);
    v78 = objc_claimAutoreleasedReturnValue();
    if (v78 && (v79 = (void *)v78, v80 = objc_msgSend(v53, "isLost"), v79, (v80 & 1) == 0))
    {
      if ((objc_msgSend(v53, "isLive") & 1) != 0)
        goto LABEL_117;
      if ((objc_msgSend(v53, "isDead") & 1) == 0)
      {
        brc_bread_crumbs();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v129 = v85;
          _os_log_fault_impl(&dword_230455000, v86, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: item.isDead%@", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v56 || -[NSMutableSet containsObject:](self->_itemIDsLostOrThrottled, "containsObject:", v55))
      {
        brc_bread_crumbs();
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v129 = v53;
          *(_WORD *)&v129[8] = 2112;
          *(_QWORD *)&v129[10] = v89;
          _os_log_debug_impl(&dword_230455000, v90, OS_LOG_TYPE_DEBUG, "[DEBUG] denylisting %@ and its descendants%@", buf, 0x16u);
        }

        -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v53, self->_itemIDsLostOrThrottled);
        goto LABEL_117;
      }
      if (-[BRCSyncUpEnumerator handleItemForOSUpgrade:parentItemID:](self, "handleItemForOSUpgrade:parentItemID:", v53, v55))
      {
        goto LABEL_117;
      }
    }
    objc_msgSend(v53, "parentItemIDInZone");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "isNonDesktopRoot"))
    {

LABEL_117:
      v4 = v53;
      goto LABEL_118;
    }
    if (!v81
      || (objc_msgSend(v53, "clientZone"),
          v82 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v82, "itemByItemID:", v81),
          v4 = (id)objc_claimAutoreleasedReturnValue(),
          v82,
          !v4))
    {
      brc_bread_crumbs();
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
      {
        clientZone = self->_clientZone;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v129 = clientZone;
        *(_WORD *)&v129[8] = 2112;
        *(_QWORD *)&v129[10] = v53;
        *(_WORD *)&v129[18] = 2112;
        *(_QWORD *)&v129[20] = v109;
        _os_log_fault_impl(&dword_230455000, v110, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because of orphan %@%@", buf, 0x20u);
      }

      -[BRCClientZone scheduleResetServerAndClientTruthsForReason:](self->_clientZone, "scheduleResetServerAndClientTruthsForReason:", CFSTR("orphan.tombstone"));
      v113 = 0;
      goto LABEL_150;
    }

    -[NSMutableArray addObject:](self->_stack, "addObject:", v4);
    v53 = v4;
    if (-[NSMutableArray count](self->_stack, "count") >= (unint64_t)self->_maxDepth)
      goto LABEL_110;
  }
  brc_bread_crumbs();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v129 = v53;
    *(_WORD *)&v129[8] = 2112;
    *(_QWORD *)&v129[10] = v95;
    _os_log_debug_impl(&dword_230455000, v96, OS_LOG_TYPE_DEBUG, "[DEBUG] denylist all children deletes when leaving top level folder share %@%@", buf, 0x16u);
  }

  -[BRCSyncUpEnumerator _denyListDescendantStack:parentItem:andAddToSet:](self, "_denyListDescendantStack:parentItem:andAddToSet:", self->_stack, v53, self->_itemIDsLostOrThrottled);
  if (v118 & 1 | ((objc_msgSend(v53, "isDead") & 1) == 0))
    goto LABEL_117;
  v97 = self->_itemIDsWithChildrenBeingCopiedToNewZone;
  objc_msgSend(v53, "itemID");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v97) = -[NSMutableSet containsObject:](v97, "containsObject:", v98);

  if ((v97 & 1) != 0)
  {
    v4 = v53;
    goto LABEL_118;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v119), "addIndex:", objc_msgSend(v53, "dbRowID"));
  v113 = v53;
LABEL_150:
  v3 = v117;

LABEL_151:
  v4 = v53;
LABEL_152:

  return v113;
}

- (id)nextObject
{
  int stage;
  void *v4;
  void *enumerator;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  PQLEnumeration *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  stage = self->_stage;
  if (stage <= 3)
  {
    do
    {
      if ((stage - 1) > 1)
      {
        if (stage == 3)
        {
          -[BRCSyncUpEnumerator _nextTombstone](self, "_nextTombstone");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
            return v4;
        }
      }
      else
      {
        -[BRCSyncUpEnumerator _nextLiveItem](self, "_nextLiveItem");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
      }
      stage = self->_stage + 1;
      self->_stage = stage;
      switch(stage)
      {
        case 0:
          brc_bread_crumbs();
          enumerator = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v16 = enumerator;
            _os_log_fault_impl(&dword_230455000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Sync: shouldn't be here%@", buf, 0xCu);
          }
          goto LABEL_22;
        case 1:
          brc_bread_crumbs();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v7;
            _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating documents needing sync up%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _documentsOrAliasesNeedingSyncUpEnumerator](self, "_documentsOrAliasesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 2:
          brc_bread_crumbs();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v10;
            _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating live or new directories%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _liveDirectoriesNeedingSyncUpEnumerator](self, "_liveDirectoriesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        case 3:
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v12;
            _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: enumerating tombstones%@", buf, 0xCu);
          }

          -[BRCSyncUpEnumerator _tombstoneLeavesNeedingSyncUpEnumerator](self, "_tombstoneLeavesNeedingSyncUpEnumerator");
          v9 = (PQLEnumeration *)objc_claimAutoreleasedReturnValue();
LABEL_19:
          enumerator = self->_enumerator;
          self->_enumerator = v9;
          goto LABEL_23;
        case 4:
          brc_bread_crumbs();
          enumerator = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = enumerator;
            _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: done enumerating all stages%@", buf, 0xCu);
          }
LABEL_22:

LABEL_23:
          stage = self->_stage;
          break;
        default:
          break;
      }
    }
    while (stage < 4);
  }
  v4 = 0;
  return v4;
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (unint64_t)retryAfter
{
  return self->_retryAfter;
}

- (NSMutableSet)chainedParentIDAllowlist
{
  return self->_chainedParentIDAllowlist;
}

- (NSMutableArray)itemsNeedingUnshare
{
  return self->_itemsNeedingUnshare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsNeedingUnshare, 0);
  objc_storeStrong((id *)&self->_chainedParentIDAllowlist, 0);
  objc_storeStrong((id *)&self->_tooDeepItems, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_returned, 0);
  objc_storeStrong((id *)&self->_tombstonesEmbargo, 0);
  objc_storeStrong((id *)&self->_itemIDsWithChildrenBeingCopiedToNewZone, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingDirectoryFetch, 0);
  objc_storeStrong((id *)&self->_itemIDsNeedingOSUpgrade, 0);
  objc_storeStrong((id *)&self->_itemIDsLostOrThrottled, 0);
  objc_storeStrong((id *)&self->_visitedItemIDsToDepthMap, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)_denyListDescendantStackAndItemIfThrottledOrNeedsOSUpgrade:now:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Sync: denylist %@ because it needs a newer OS to sync up%@");
  OUTLINED_FUNCTION_0();
}

- (void)handleItemForOSUpgrade:parentItemID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] marking needs-upgrade %@ and its descendants%@");
  OUTLINED_FUNCTION_0();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected item %@. Ignoring%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Just learning share property changes from %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_handleSharedItemWhichMovedToNewShare:rootItem:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We need to unshare %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_checkForSharesWithinSharesWithItem:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a4, a3, "[DEBUG] Sync: denylist %@ because it is moving into a share and has shared children%@", (uint8_t *)a3);

}

- (void)_checkForSharesWithinSharesWithItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v6, "[DEBUG] Sync: denylist %@ for item share-within-share processing%@", (uint8_t *)&v7);

}

- (void)_handlePendingShareItemWithPendingDeleteChildren:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not waiting for deletes because of a default%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)_nextLiveItem
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _stack.count == 0%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
