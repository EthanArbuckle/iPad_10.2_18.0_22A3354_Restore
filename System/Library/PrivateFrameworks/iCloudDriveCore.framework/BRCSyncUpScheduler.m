@implementation BRCSyncUpScheduler

- (BRCSyncUpScheduler)initWithAccountSession:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCSyncUpScheduler;
  return -[BRCFSSchedulerBase initWithSession:name:tableName:](&v4, sel_initWithSession_name_tableName_, a3, CFSTR("Sync-Up"), CFSTR("client_sync_up"));
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = (void *)MEMORY[0x24BEDD648];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "rawInjection:length:", "in_flight_diffs, zone_rowid", 27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)BRCSyncUpScheduler;
  -[BRCFSSchedulerBase descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:](&v12, sel_descriptionForJobsMatching_ordering_additionalColumns_additionalValuesHandler_context_, v8, 0, v9, &__block_literal_global_45, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __49__BRCSyncUpScheduler_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "unsignedLongLongAtIndex:", a4);
  objc_msgSend(v6, "numberAtIndex:", (a4 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendFormat:", CFSTR("zone:%@"), v8);
  if (v7)
  {
    BRCItemFieldsPrettyPrint();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(" in-flight{%@}"), v9);

  }
}

- (void)createSyncUpJobForItem:(id)a3 inZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "br_isEqualToNumber:", &unk_24FEB35F0) & 1) == 0)
  {
    -[BRCAccountSessionFPFS serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isSyncBlockedBecauseAppNotInstalled"))
    {
      objc_msgSend(v6, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isDocumentsFolder");

      if ((v11 & 1) == 0)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpScheduler createSyncUpJobForItem:inZone:].cold.1();

        objc_msgSend(v9, "clearStateBits:", 4096);
      }
    }

  }
  -[BRCSyncUpScheduler createSyncUpJobForRowID:inZone:](self, "createSyncUpJobForRowID:inZone:", objc_msgSend(v6, "dbRowID"), v7);

}

- (void)createSyncUpJobForRowID:(unint64_t)a3 inZone:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BRCItemDBRowIDAndZoneJobIdentifier *v13;

  v6 = a4;
  v13 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", a3, v6);

  -[BRCAccountSessionFPFS syncContextProvider](self->super._session, "syncContextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSyncContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uploadThrottle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("in_flight_diffs = NULL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](self, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v13, v9, 1, 0, 0, v10, 0);
  v12 = v11;

  if (v12 <= brc_current_date_nsec())
    -[BRCSyncUpScheduler _scheduleSyncUpJob:](self, "_scheduleSyncUpJob:", v13);

}

- (void)prepareItemForSyncUp:(id)a3 inFlightDiffs:(unint64_t)a4 inZone:(id)a5
{
  id v8;
  BRCAccountSessionFPFS *session;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BRCItemDBRowIDAndZoneJobIdentifier *v14;
  void *v15;
  id v16;

  v8 = a5;
  session = self->super._session;
  v10 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase tableName](self, "tableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "dbRowID");

  v16 = v8;
  v14 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v13, v16);

  -[BRCIntAndZoneJobIdentifier matchingJobsWhereSQLClause](v14, "matchingJobsWhereSQLClause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "execute:", CFSTR("UPDATE %@SET in_flight_diffs = %lldWHERE %@"), v12, a4, v15);

}

- (void)_clearSyncUpErrorForItem:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v4;
  uint64_t v5;
  id v6;

  session = self->super._session;
  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dbRowID");

  objc_msgSend(v6, "execute:", CFSTR("DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d"), v5, 3);
}

- (unint64_t)finishSyncUpForItem:(id)a3 inZone:(id)a4 success:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  BRCItemDBRowIDAndZoneJobIdentifier *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32[3];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v5)
    -[BRCSyncUpScheduler _clearSyncUpErrorForItem:](self, "_clearSyncUpErrorForItem:", v8);
  -[BRCAccountSessionFPFS clientDB](self->super._session, "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isBatchSuspended");

  if ((v11 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:].cold.2();

  }
  if (!v9)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:].cold.1();

  }
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCSyncUpScheduler finishSyncUpForItem:inZone:success:]", 129, v32);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v25 = v32[0];
    -[BRCFSSchedulerBase name](self, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jobsDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = v25;
    v35 = 2112;
    v36 = v26;
    v37 = 2112;
    v38 = v27;
    v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@[%@]: finishing sync up%@", buf, 0x2Au);

  }
  v14 = -[BRCSyncUpScheduler inFlightDiffsForItem:zoneRowID:](self, "inFlightDiffsForItem:zoneRowID:", v8, v9);
  v15 = objc_msgSend(v8, "dbRowID");
  v16 = v9;
  v17 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v15, v16);

  if (-[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", 0, v17)
    && objc_msgSend(v8, "isDocument"))
  {
    objc_msgSend(v8, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dbRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "br_isEqualToNumber:", v16);

    if (v20)
    {
      objc_msgSend(v8, "asDocument");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 || (objc_msgSend(v8, "needsSyncUp") & 1) == 0)
      {
        -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cancelAndCleanupItemUpload:", v21);

      }
      if (objc_msgSend(v8, "needsUpload"))
      {
        -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uploadItem:", v21);

      }
      goto LABEL_17;
    }
    if (objc_msgSend(v8, "needsUpload"))
    {
      -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rescheduleSuspendedJobsMatching:inState:", v8, 31);
LABEL_17:

    }
  }

  __brc_leave_section(v32);
  return v14;
}

- (BOOL)isItemInSyncUpAndInFlight:(id)a3
{
  return -[BRCSyncUpScheduler inFlightDiffsForItem:](self, "inFlightDiffsForItem:", a3) != 0;
}

- (BOOL)isItemInSyncUpAndInFlight:(id)a3 inZone:(id)a4
{
  return -[BRCSyncUpScheduler inFlightDiffsForItem:zoneRowID:](self, "inFlightDiffsForItem:zoneRowID:", a3, a4) != 0;
}

- (unint64_t)inFlightDiffsForItem:(id)a3 zoneRowID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  BRCItemDBRowIDAndZoneJobIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "dbRowID");
  v9 = v6;
  v10 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v8, v9);

  objc_msgSend(v7, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCFSSchedulerBase tableName](self, "tableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCIntAndZoneJobIdentifier matchingJobsWhereSQLClause](v10, "matchingJobsWhereSQLClause");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT in_flight_diffs FROM %@WHERE %@ AND throttle_state != 0"), v12, v13);

  v15 = objc_msgSend(v14, "unsignedLongLongValue");
  return v15;
}

- (unint64_t)inFlightDiffsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT in_flight_diffs FROM %@WHERE %@ AND throttle_state != 0"), v6, v7);
  objc_msgSend(v8, "enumerateObjectsOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v10);
        v13 |= objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "unsignedLongLongValue");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isItemPendingSyncUp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSSchedulerBase tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM %@WHERE %@ AND throttle_state != 0"), v6, v7);
  LOBYTE(v6) = objc_msgSend(v8, "BOOLValue");

  return (char)v6;
}

- (void)setState:(int)a3 forItem:(id)a4 zone:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  BRCItemDBRowIDAndZoneJobIdentifier *v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a4;
  v8 = a5;
  if (objc_msgSend(v12, "dbRowID") || (objc_msgSend(v12, "isZoneRoot") & 1) == 0)
  {
    v9 = objc_msgSend(v12, "dbRowID");
    v10 = v8;
    v11 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v9, v10);

    -[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", v6, v11);
  }

}

- (void)_scheduleSyncUpJobForZoneWithRowID:(id)a3
{
  int v4;
  BRCAccountSessionFPFS *session;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "br_isEqualToNumber:", &unk_24FEB35F0);
  session = self->super._session;
  if (v4)
  {
    -[BRCAccountSessionFPFS containerScheduler](session, "containerScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleSyncUpForSideCar");
  }
  else
  {
    -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleSyncUp");

  }
}

- (void)_scheduleSyncUpJob:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpScheduler _scheduleSyncUpJob:].cold.1();

  -[BRCFSSchedulerBase setState:forJobID:](self, "setState:forJobID:", 50, v4);
  objc_msgSend(v4, "zoneRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpScheduler _scheduleSyncUpJobForZoneWithRowID:](self, "_scheduleSyncUpJobForZoneWithRowID:", v7);

}

- (unint64_t)recoverAndReportMissingJobs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  uint64_t v26;
  int v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS clientDB](self->super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE ci.rowid = su.throttle_id AND su.throttle_state != 0)"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __49__BRCSyncUpScheduler_recoverAndReportMissingJobs__block_invoke;
  v28[3] = &unk_24FE40010;
  v28[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v25 = v4;
    v26 = 8;
    LODWORD(v8) = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      v27 = v8;
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v11, "clientZone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dbRowID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpScheduler createSyncUpJobForItem:inZone:](self, "createSyncUpJobForItem:inZone:", v11, v14);

        if (objc_msgSend(v11, "isSharedToMeChildItem"))
        {
          -[BRCSyncUpScheduler createSyncUpJobForItem:inZone:](self, "createSyncUpJobForItem:inZone:", v11, &unk_24FEB35F0);
        }
        else if (objc_msgSend(v11, "isSharedToMeTopLevelItem"))
        {
          objc_msgSend(v11, "parentClientZone");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dbRowID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpScheduler createSyncUpJobForItem:inZone:](self, "createSyncUpJobForItem:inZone:", v11, v16);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = (v27 + v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);

    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpScheduler recoverAndReportMissingJobs].cold.1((uint64_t)v17, v8, v18);

    -[BRCSyncUpScheduler schedule](self, "schedule");
    v4 = v25;
  }
  else
  {

    v8 = 0;
  }
  -[BRCAccountSessionFPFS clientDB](self->super._session, "clientDB", v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "fetch:", CFSTR("SELECT DISTINCT su.zone_rowid FROM client_sync_up AS su  INNER JOIN client_items AS li ON su.throttle_id = li.rowid  WHERE su.throttle_state = 50       AND su.throttle_state != 0       AND li.item_localsyncupstate = 4       AND li.item_min_supported_os_rowid IS NULL       AND NOT item_id_is_documents(li.item_id)"));

  if (objc_msgSend(v20, "next"))
  {
    do
    {
      objc_msgSend(v20, "numberAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpScheduler _scheduleSyncUpJobForZoneWithRowID:](self, "_scheduleSyncUpJobForZoneWithRowID:", v21);

    }
    while ((objc_msgSend(v20, "next") & 1) != 0);
  }
  v22 = +[AppTelemetryTimeSeriesEvent newMissingSyncUpJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingSyncUpJobEventWithNumberMissing:", v8);
  -[BRCAccountSessionFPFS analyticsReporter](self->super._session, "analyticsReporter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v22);

  return (int)v8;
}

id __49__BRCSyncUpScheduler_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

- (void)schedule
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxRecordCountInModifyRecordsOperation");

  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "throttle_id, zone_rowid", 23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__BRCSyncUpScheduler_schedule__block_invoke;
  v6[3] = &unk_24FE429E8;
  v6[4] = self;
  -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:](self, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v4, 0, v5, v6);

}

void __30__BRCSyncUpScheduler_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  BRCItemDBRowIDAndZoneJobIdentifier *v8;
  id v9;

  v5 = a2;
  v6 = objc_msgSend(v5, "longLongAtIndex:", a3);
  objc_msgSend(v5, "numberAtIndex:", (a3 + 1));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v6, v9);
  objc_msgSend(v7, "_scheduleSyncUpJob:", v8);

}

- (unint64_t)postponeSyncUpCallback:(id)a3 inZone:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  BRCItemDBRowIDAndZoneJobIdentifier *v9;
  uint64_t v10;
  BRCAccountSessionFPFS *session;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v6 = a4;
  v7 = objc_msgSend(a3, "dbRowID");
  v8 = v6;
  v9 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:]([BRCItemDBRowIDAndZoneJobIdentifier alloc], "initWithItemDBRowID:zoneRowID:", v7, v8);

  v10 = objc_msgSend(v8, "longLongValue");
  session = self->super._session;
  if (v10 <= 0)
  {
    -[BRCAccountSessionFPFS syncContextProvider](session, "syncContextProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultSyncContext");
  }
  else
  {
    -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadataSyncContext");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "perItemSyncUpThrottle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BRCFSSchedulerBase postponeJobID:withThrottle:](self, "postponeJobID:withThrottle:", v9, v14);

  return v15;
}

- (void)blockSyncUpCallback:(id)a3 inZone:(id)a4
{
  -[BRCSyncUpScheduler setState:forItem:zone:](self, "setState:forItem:zone:", 51, a3, a4);
}

- (void)createSyncUpJobForItem:inZone:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Clearing app sync blocked bit because we created an item that needs sync%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)finishSyncUpForItem:inZone:success:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishSyncUpForItem:inZone:success:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_scheduleSyncUpJob:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_230455000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync-Up[%@]: Scheduling a sync-up job%@", v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)recoverAndReportMissingJobs
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync-Up: Recovered from %u missing sync up jobs%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

@end
