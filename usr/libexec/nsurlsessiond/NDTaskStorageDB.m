@implementation NDTaskStorageDB

- (void)_onqueue_deleteEntryForTask:(unint64_t)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8;
  char *v9;
  NSObject *v10;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_deleteEntryForTaskStmt;
  sqlite3_stmt *deleteEntryForTaskStmt;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  const char *v26;

  v8 = a4;
  v9 = (char *)a5;
  v10 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218242;
    v24 = a3;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "_onqueue_deleteEntryForTaskWithIdentifier: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }
  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    v17 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
    goto LABEL_25;
  }
  p_deleteEntryForTaskStmt = &self->_deleteEntryForTaskStmt;
  deleteEntryForTaskStmt = self->_deleteEntryForTaskStmt;
  if (!deleteEntryForTaskStmt)
  {
    if (sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks WHERE session_id = ? AND identifier = ?", -1, &self->_deleteEntryForTaskStmt, 0))
    {
      v18 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        v15 = "Failed to init _deleteEntryForTaskStmt for session_tasks";
        v16 = v18;
        v19 = 2;
LABEL_18:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v19);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    deleteEntryForTaskStmt = *p_deleteEntryForTaskStmt;
  }
  if (sqlite3_bind_text(deleteEntryForTaskStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, 0))
  {
    v14 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = (unint64_t)v9;
      v15 = "Failed to bind sessionID (%@) to the select statement";
      v16 = v14;
LABEL_17:
      v19 = 12;
      goto LABEL_18;
    }
  }
  else if (sqlite3_bind_int(*p_deleteEntryForTaskStmt, 2, a3))
  {
    v20 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      v23 = 134217984;
      v24 = a3;
      v15 = "Failed to bind identifier (%lu) to the delete statement";
      v16 = v20;
      goto LABEL_17;
    }
  }
  else
  {
    if (sqlite3_step(*p_deleteEntryForTaskStmt) != 101)
    {
      v21 = (id)qword_1000C7158;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        v24 = a3;
        v25 = 2080;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to delete task with identifier %lu from db. Error= %s", (uint8_t *)&v23, 0x16u);
      }

    }
    sqlite3_reset(*p_deleteEntryForTaskStmt);
  }
LABEL_25:

}

- (void)_updateDBEntryForTask:(id)a3 updateType:(unint64_t)a4 sessionUUID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = (id)qword_1000C7158;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218498;
    v15 = objc_msgSend(v8, "identifier");
    v16 = 2048;
    v17 = a4;
    v18 = 2112;
    v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "_updateDBEntryForTask: %lu type %lu session: %@", (uint8_t *)&v14, 0x20u);
  }

  switch(a4)
  {
    case 0uLL:
      -[NDTaskStorageDB _onqueue_updateTaskDescriptionForTask:sessionUUID:](self, "_onqueue_updateTaskDescriptionForTask:sessionUUID:", v8, v9);
      break;
    case 1uLL:
      -[NDTaskStorageDB _onqueue_updateResponseForTask:sessionUUID:](self, "_onqueue_updateResponseForTask:sessionUUID:", v8, v9);
      break;
    case 2uLL:
      -[NDTaskStorageDB _onqueue_updateResumableUploadDataForTask:sessionUUID:](self, "_onqueue_updateResumableUploadDataForTask:sessionUUID:", v8, v9);
      break;
    case 3uLL:
      -[NDTaskStorageDB _onqueue_updateDownloadFileURLForTask:sessionUUID:](self, "_onqueue_updateDownloadFileURLForTask:sessionUUID:", v8, v9);
      break;
    case 4uLL:
      -[NDTaskStorageDB _onqueue_updateLoadingPriorityForTask:sessionUUID:](self, "_onqueue_updateLoadingPriorityForTask:sessionUUID:", v8, v9);
      break;
    case 5uLL:
      -[NDTaskStorageDB _onqueue_updateBytesPerSecondLimitForTask:sessionUUID:](self, "_onqueue_updateBytesPerSecondLimitForTask:sessionUUID:", v8, v9);
      break;
    case 6uLL:
      -[NDTaskStorageDB _onqueue_updateExpectedProgressTargetForTask:sessionUUID:](self, "_onqueue_updateExpectedProgressTargetForTask:sessionUUID:", v8, v9);
      break;
    case 7uLL:
      -[NDTaskStorageDB _onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:](self, "_onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:", v8, v9);
      break;
    case 8uLL:
      -[NDTaskStorageDB _onqueue_updateCurrentRequestForTask:sessionUUID:](self, "_onqueue_updateCurrentRequestForTask:sessionUUID:", v8, v9);
      break;
    case 9uLL:
      -[NDTaskStorageDB _onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:](self, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:", v8, v9);
      break;
    case 0xAuLL:
      -[NDTaskStorageDB _onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:](self, "_onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:", v8, v9);
      break;
    case 0xBuLL:
      -[NDTaskStorageDB _onqueue_updateSuspendPathEntriesForTask:sessionUUID:](self, "_onqueue_updateSuspendPathEntriesForTask:sessionUUID:", v8, v9);
      break;
    case 0xCuLL:
      -[NDTaskStorageDB _onqueue_updateSetPriorityEntriesForTask:sessionUUID:](self, "_onqueue_updateSetPriorityEntriesForTask:sessionUUID:", v8, v9);
      break;
    case 0xDuLL:
      v12 = objc_msgSend(v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
      -[NDTaskStorageDB _onqueue_deleteEntryForTask:forSession:sessionUUID:](self, "_onqueue_deleteEntryForTask:forSession:sessionUUID:", v12, v13, v9);

      break;
    case 0xEuLL:
      -[NDTaskStorageDB _onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:](self, "_onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:", v8, v9);
      break;
    default:
      v11 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        v14 = 134217984;
        v15 = (id)a4;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid update type %lu", (uint8_t *)&v14, 0xCu);
      }
      break;
  }

}

- (void)_commitSqliteTransaction
{
  NSObject *v2;
  char *errmsg;
  uint8_t buf[4];
  char *v5;

  errmsg = 0;
  if (sqlite3_exec(self->_dbConnection, "COMMIT TRANSACTION", 0, 0, &errmsg))
  {
    v2 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Error committing sqlite transaction: %s", buf, 0xCu);
    }
  }
}

- (void)_beginSqliteTransaction
{
  NSObject *v2;
  char *errmsg;
  uint8_t buf[4];
  char *v5;

  errmsg = 0;
  if (sqlite3_exec(self->_dbConnection, "BEGIN TRANSACTION", 0, 0, &errmsg))
  {
    v2 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Error beginning sqlite transaction: %s", buf, 0xCu);
    }
  }
}

- (void)_onqueue_updateTaskDescriptionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateTaskDescriptionForTaskStmt;
  sqlite3_stmt *updateTaskDescriptionForTaskStmt;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  sqlite3_stmt *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  int v25;
  id v26;
  __int16 v27;
  const char *v28;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v25 = 134218242;
    v26 = objc_msgSend(v6, "identifier");
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateTaskDescriptionForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTaskDescriptionForTaskStmt = &self->_updateTaskDescriptionForTaskStmt;
    updateTaskDescriptionForTaskStmt = self->_updateTaskDescriptionForTaskStmt;
    if (!updateTaskDescriptionForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET task_description = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateTaskDescriptionForTaskStmt, 0))
      {
        v16 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to init _updateTaskDescriptionForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
        }
        goto LABEL_29;
      }
      updateTaskDescriptionForTaskStmt = *p_updateTaskDescriptionForTaskStmt;
    }
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription")));
    v13 = sqlite3_bind_text(updateTaskDescriptionForTaskStmt, 1, (const char *)objc_msgSend(v12, "UTF8String"), -1, 0) == 0;

    if (!v13)
    {
      v14 = (id)qword_1000C7158;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
        v25 = 138412290;
        v26 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind taskDescription (%@) to the select statement", (uint8_t *)&v25, 0xCu);

      }
LABEL_23:

      goto LABEL_29;
    }
    v17 = *p_updateTaskDescriptionForTaskStmt;
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0) == 0;

    if ((v17 & 1) == 0)
    {
      v14 = (id)qword_1000C7158;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v25 = 138412290;
        v26 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateTaskDescriptionForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v14 = (id)qword_1000C7158;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v6, "identifier");
        v25 = 134217984;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateTaskDescriptionForTaskStmt) != 101)
    {
      v19 = (id)qword_1000C7158;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v6, "identifier");
        v24 = sqlite3_errmsg(self->_dbConnection);
        v25 = 134218242;
        v26 = v23;
        v27 = 2080;
        v28 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update task description for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
      }

    }
    sqlite3_reset(*p_updateTaskDescriptionForTaskStmt);
  }
  else
  {
    v15 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
    }
  }
LABEL_29:

}

- (void)_updateDBEntriesForTasksInSession:(id)a3 taskInfos:(id)a4 updates:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_updateDBEntriesForTasks for session %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000109D4;
  v16[3] = &unk_1000B13E8;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  dispatch_sync(workQueue, v16);

}

- (void)_onqueue_insertOrUpdateAllEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt *insertOrUpdateAllEntriesStmt;
  sqlite3_stmt **p_insertOrUpdateAllEntriesStmt;
  NSObject *v12;
  NSObject *v13;
  sqlite3_stmt *v14;
  double v15;
  const char *v16;
  const char *v17;
  const char *v18;
  sqlite3_stmt *v19;
  id v20;
  const char *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  const char *v26;
  sqlite3_stmt *v27;
  id v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  const char *v34;
  sqlite3_stmt *v35;
  id v36;
  NSObject *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  char *v42;
  sqlite3_stmt *v43;
  void *v44;
  NSObject *v45;
  sqlite3_stmt *v46;
  void *v47;
  double v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  sqlite3_stmt *v55;
  NSObject *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  sqlite3_stmt *v61;
  NSObject *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  unsigned int v69;
  sqlite3_stmt *v70;
  char *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  sqlite3_stmt *v76;
  NSObject *v77;
  sqlite3_stmt *v78;
  id v79;
  BOOL v80;
  sqlite3_stmt *v81;
  id v82;
  BOOL v83;
  char *v84;
  char *v85;
  char *v86;
  unsigned int v87;
  unsigned int v88;
  const char *v89;
  void *v90;
  NSObject *v91;
  unsigned int v92;
  sqlite3_stmt *v93;
  id v94;
  BOOL v95;
  NSObject *v96;
  unsigned int v97;
  const char *v98;
  char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  sqlite3_stmt *v104;
  id v105;
  BOOL v106;
  const char *v107;
  const char *v108;
  const char *v109;
  char *v110;
  const char *v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  void *v116;
  BOOL v117;
  void *v118;
  void *v119;
  unsigned int v120;
  sqlite3_stmt *v121;
  NSObject *v122;
  sqlite3_stmt *v123;
  id v124;
  BOOL v125;
  NSObject *v126;
  NSObject *v127;
  unsigned int v128;
  unsigned int v129;
  sqlite3_stmt *v130;
  double v131;
  const char *v132;
  unsigned int v133;
  char *v134;
  const char *v135;
  void *v136;
  BOOL v137;
  void *v138;
  void *v139;
  sqlite3_stmt *v140;
  NSObject *v141;
  void *v142;
  BOOL v143;
  void *v144;
  void *v145;
  sqlite3_stmt *v146;
  NSObject *v147;
  void *v148;
  BOOL v149;
  void *v150;
  void *v151;
  sqlite3_stmt *v152;
  char *v153;
  void *v154;
  BOOL v155;
  void *v156;
  void *v157;
  sqlite3_stmt *v158;
  char *v159;
  void *v160;
  BOOL v161;
  void *v162;
  void *v163;
  sqlite3_stmt *v164;
  NSObject *v165;
  NSObject *v166;
  unsigned int v167;
  void *v168;
  BOOL v169;
  void *v170;
  void *v171;
  sqlite3_stmt *v172;
  NSObject *v173;
  char *v174;
  sqlite3_stmt *v175;
  id v176;
  BOOL v177;
  char *v178;
  sqlite3_stmt *v179;
  id v180;
  id v181;
  NSObject *v182;
  void *v183;
  BOOL v184;
  void *v185;
  void *v186;
  sqlite3_stmt *v187;
  char *v188;
  const char *v189;
  const char *v190;
  sqlite3_stmt *v191;
  id v192;
  BOOL v193;
  char *v194;
  unsigned int v195;
  NSObject *v196;
  uint32_t v197;
  void *v198;
  BOOL v199;
  void *v200;
  void *v201;
  sqlite3_stmt *v202;
  uint64_t v203;
  void *v204;
  BOOL v205;
  void *v206;
  void *v207;
  sqlite3_stmt *v208;
  NSObject *v209;
  int v210;
  void *v211;
  sqlite3_stmt *v212;
  NSObject *v213;
  NSObject *v214;
  const char *v215;
  const char *v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  NSObject *v223;
  NSObject *v224;
  id v225;
  os_log_t v226;
  NSObject *v227;
  id v228;
  NSObject *log;
  id v230;
  id v231;
  id v232;
  id v233;
  uint8_t v234[16];
  uint8_t buf[4];
  const char *v236;
  __int16 v237;
  const char *v238;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v236 = (const char *)objc_msgSend(v6, "identifier");
    v237 = 2112;
    v238 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_insertOrUpdateAllEntriesForTask: %lu for session: %@", buf, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_insertOrUpdateAllEntriesStmt = &self->_insertOrUpdateAllEntriesStmt;
    insertOrUpdateAllEntriesStmt = self->_insertOrUpdateAllEntriesStmt;
    if (!insertOrUpdateAllEntriesStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "INSERT OR REPLACE INTO session_tasks(\tidentifier, task_kind, creation_time, state, suspend_count, task_description, original_request, current_request, response, earliest_begin_date,\tresponded_to_will_begin_delayed_request_callback, error, retry_error, file_url, download_file_url, bundle_id, session_id, has_started, should_cancel_on_disconnect,\tbase_priority, base_priority_set_explicitly, discretionary, discretionary_override, unique_identifier, storage_partition_identifier, count_of_bytes_client_expects_to_send,\tcount_of_bytes_client_expects_to_receive, count_of_bytes_received, count_of_bytes_sent, count_of_bytes_expected_to_send, count_of_bytes_expected_to_receive,\tbytes_per_second_limit, persona_unique_string, expected_progress_target, may_be_demoted_to_discretionary, tls_minimum_supported_protocol_version,\ttls_maximum_supported_protocol_version, has_sz_extractor, does_sz_extractor_consume_extracted_data, updated_streaming_zip_modification_date, started_user_initiated,\tadditional_properties, path_to_download_task_file, retry_count, loading_priority, qos, background_trailers, task_metrics,\tav_url, av_destination_url, av_options, av_initialized_with_av_asset, av_temporary_destination_url, av_asset_title, av_asset_artwork_data, av_asset_url, av_asset_download_token,\tav_asset_download_child_download_session_identifier, av_enable_spi_delegate_callbacks, av_download_config, av_asset_options_plist, resumable_upload_data, rowid) \tvalues (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,\t\t\t(SELECT max(rowid) FROM session_tasks)+1)", -1, &self->_insertOrUpdateAllEntriesStmt,
             0))
      {
        v12 = (id)qword_1000C7158;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v17 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 136315138;
          v236 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed init the insert statement for session_tasks db. Error = %s", buf, 0xCu);
        }
        goto LABEL_36;
      }
      insertOrUpdateAllEntriesStmt = *p_insertOrUpdateAllEntriesStmt;
    }
    if (sqlite3_bind_int(insertOrUpdateAllEntriesStmt, 1, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = (const char *)objc_msgSend(v6, "identifier");
        *(_DWORD *)buf = 134217984;
        v236 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_205;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 2, (sqlite3_int64)objc_msgSend(v6, "taskKind")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = (const char *)objc_msgSend(v6, "taskKind");
        *(_DWORD *)buf = 134217984;
        v236 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind taskKind (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    v14 = *p_insertOrUpdateAllEntriesStmt;
    objc_msgSend(v6, "creationTime");
    if (sqlite3_bind_double(v14, 3, v15))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "creationTime");
        *(_DWORD *)buf = 134217984;
        v236 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind creationTime (%f) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 4, (sqlite3_int64)objc_msgSend(v6, "state")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v26 = (const char *)objc_msgSend(v6, "state");
        *(_DWORD *)buf = 134217984;
        v236 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind state (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 5, (sqlite3_int64)objc_msgSend(v6, "suspendCount")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v34 = (const char *)objc_msgSend(v6, "suspendCount");
        *(_DWORD *)buf = 134217984;
        v236 = v34;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind suspendCount (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    v19 = *p_insertOrUpdateAllEntriesStmt;
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription")));
    LOBYTE(v19) = sqlite3_bind_text(v19, 6, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0) == 0;

    if ((v19 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v42 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
        *(_DWORD *)buf = 138412290;
        v236 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind taskDescription (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_36;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequest"));
    v23 = v22 == 0;

    if (v23)
    {
      v25 = 0;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequest"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, 0));

    }
    v27 = *p_insertOrUpdateAllEntriesStmt;
    v28 = objc_retainAutorelease(v25);
    if (sqlite3_bind_blob(v27, 7, objc_msgSend(v28, "bytes"), (int)objc_msgSend(v28, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v29 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to bind originalRequest to the select statement", buf, 2u);
      }
      goto LABEL_204;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRequest"));
    v31 = v30 == 0;

    if (v31)
    {
      v33 = 0;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRequest"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v32, 1, 0));

    }
    v35 = *p_insertOrUpdateAllEntriesStmt;
    v36 = objc_retainAutorelease(v33);
    if (sqlite3_bind_blob(v35, 8, objc_msgSend(v36, "bytes"), (int)objc_msgSend(v36, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v37 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to bind currentRequestData to the select statement", buf, 2u);
      }
      goto LABEL_203;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
    v39 = v38 == 0;

    if (v39)
    {
      v41 = 0;
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v40, 1, 0));

    }
    v43 = *p_insertOrUpdateAllEntriesStmt;
    v233 = objc_retainAutorelease(v41);
    v44 = v233;
    if (sqlite3_bind_blob(v43, 9, objc_msgSend(v233, "bytes"), (int)objc_msgSend(v233, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v45 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to bind responseData to the select statement", buf, 2u);
      }
      goto LABEL_202;
    }
    v46 = *p_insertOrUpdateAllEntriesStmt;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earliestBeginDate"));
    objc_msgSend(v47, "timeIntervalSince1970");
    LOBYTE(v46) = sqlite3_bind_double(v46, 10, v48) == 0;

    if ((v46 & 1) == 0)
    {
      v49 = (id)qword_1000C7158;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "earliestBeginDate"));
        objc_msgSend(v67, "timeIntervalSince1970");
        *(_DWORD *)buf = 134217984;
        v236 = v68;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to bind earlierBeginDate (%f) to the select statement", buf, 0xCu);

      }
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 11, (int)objc_msgSend(v6, "respondedToWillBeginDelayedRequestCallback")))
    {
      v50 = (id)qword_1000C7158;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v69 = objc_msgSend(v6, "respondedToWillBeginDelayedRequestCallback");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v69;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", buf, 0xCu);
      }

      goto LABEL_201;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
    v52 = v51 == 0;

    if (v52)
    {
      v54 = 0;
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v53, 1, 0));

    }
    v55 = *p_insertOrUpdateAllEntriesStmt;
    v232 = objc_retainAutorelease(v54);
    if (sqlite3_bind_blob(v55, 12, objc_msgSend(v232, "bytes"), (int)objc_msgSend(v232, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v56 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to bind errorData to the select statement", buf, 2u);
      }
      goto LABEL_200;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "retryError"));
    v58 = v57 == 0;

    if (v58)
    {
      v60 = 0;
    }
    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "retryError"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v59, 1, 0));

    }
    v61 = *p_insertOrUpdateAllEntriesStmt;
    v231 = objc_retainAutorelease(v60);
    if (sqlite3_bind_blob(v61, 13, objc_msgSend(v231, "bytes"), (int)objc_msgSend(v231, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v62 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to bind retryErrorData to the select statement", buf, 2u);
      }
      goto LABEL_199;
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURL"));
    v64 = v63 == 0;

    if (v64)
    {
      v66 = 0;
    }
    else
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURL"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v65, 1, 0));

    }
    v70 = *p_insertOrUpdateAllEntriesStmt;
    v230 = objc_retainAutorelease(v66);
    if (sqlite3_bind_blob(v70, 14, objc_msgSend(v230, "bytes"), (int)objc_msgSend(v230, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      log = (id)qword_1000C7158;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v71 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURL"));
        *(_DWORD *)buf = 138412290;
        v236 = v71;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to bind fileURL (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_198;
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadFileURL"));
    v73 = v72 == 0;

    if (v73)
    {
      v75 = 0;
    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadFileURL"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v74, 1, 0));

    }
    v76 = *p_insertOrUpdateAllEntriesStmt;
    log = objc_retainAutorelease(v75);
    if (sqlite3_bind_blob(v76, 15, -[NSObject bytes](log, "bytes"), (int)-[NSObject length](log, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v84 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadFileURL"));
        *(_DWORD *)buf = 138412290;
        v236 = v84;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind downloadFileURL (%@) to the select statement", buf, 0xCu);

      }
LABEL_119:

LABEL_198:
LABEL_199:

LABEL_200:
LABEL_201:
      v44 = v233;
LABEL_202:

LABEL_203:
LABEL_204:

      goto LABEL_205;
    }
    v78 = *p_insertOrUpdateAllEntriesStmt;
    v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID")));
    v80 = sqlite3_bind_text(v78, 16, (const char *)objc_msgSend(v79, "UTF8String"), -1, 0) == 0;

    if (!v80)
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v85 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
        *(_DWORD *)buf = 138412290;
        v236 = v85;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind bundleID (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_119;
    }
    v81 = *p_insertOrUpdateAllEntriesStmt;
    v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    v83 = sqlite3_bind_text(v81, 17, (const char *)objc_msgSend(v82, "UTF8String"), -1, 0) == 0;

    if (!v83)
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v86 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        *(_DWORD *)buf = 138412290;
        v236 = v86;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 18, (int)objc_msgSend(v6, "hasStarted")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v87 = objc_msgSend(v6, "hasStarted");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v87;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind creationTime (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 19, (int)objc_msgSend(v6, "shouldCancelOnDisconnect")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v88 = objc_msgSend(v6, "shouldCancelOnDisconnect");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v88;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 20, (int)objc_msgSend(v6, "basePriority")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v89 = (const char *)objc_msgSend(v6, "basePriority");
        *(_DWORD *)buf = 134217984;
        v236 = v89;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind basePriority (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 21, (int)objc_msgSend(v6, "basePrioritySetExplicitly")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v92 = objc_msgSend(v6, "basePrioritySetExplicitly");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v92;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind basePrioritySetExplicitly (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 22, (int)objc_msgSend(v6, "isDiscretionary")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v97 = objc_msgSend(v6, "isDiscretionary");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v97;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind discretionary (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 23, (int)objc_msgSend(v6, "discretionaryOverride")))
    {
      v77 = (id)qword_1000C7158;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v98 = (const char *)objc_msgSend(v6, "discretionaryOverride");
        *(_DWORD *)buf = 134217984;
        v236 = v98;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind discretionaryOverride (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
    objc_msgSend(v90, "getUUIDBytes:", v234);

    if (sqlite3_bind_blob(*p_insertOrUpdateAllEntriesStmt, 24, v234, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v91 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Failed to bind uniqueIdentifier to the select statement", buf, 2u);
      }
      goto LABEL_198;
    }
    v93 = *p_insertOrUpdateAllEntriesStmt;
    v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storagePartitionIdentifier")));
    v95 = sqlite3_bind_text(v93, 25, (const char *)objc_msgSend(v94, "UTF8String"), -1, 0) == 0;

    if (!v95)
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v99 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storagePartitionIdentifier"));
        *(_DWORD *)buf = 138412290;
        v236 = v99;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind storagePartitionIdentifier (%@) to the select statement", buf, 0xCu);

      }
LABEL_190:

      goto LABEL_198;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 26, (sqlite3_int64)objc_msgSend(v6, "countOfBytesClientExpectsToSend")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v100 = (const char *)objc_msgSend(v6, "countOfBytesClientExpectsToSend");
        *(_DWORD *)buf = 134217984;
        v236 = v100;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesClientExpectsToSend (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 27, (sqlite3_int64)objc_msgSend(v6, "countOfBytesClientExpectsToReceive")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v101 = (const char *)objc_msgSend(v6, "countOfBytesClientExpectsToReceive");
        *(_DWORD *)buf = 134217984;
        v236 = v101;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesClientExpectsToReceive (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 28, (sqlite3_int64)objc_msgSend(v6, "countOfBytesReceived")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v102 = (const char *)objc_msgSend(v6, "countOfBytesReceived");
        *(_DWORD *)buf = 134217984;
        v236 = v102;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesReceived (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 29, (sqlite3_int64)objc_msgSend(v6, "countOfBytesSent")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v103 = (const char *)objc_msgSend(v6, "countOfBytesSent");
        *(_DWORD *)buf = 134217984;
        v236 = v103;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesSent (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 30, (sqlite3_int64)objc_msgSend(v6, "countOfBytesExpectedToSend")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v107 = (const char *)objc_msgSend(v6, "countOfBytesExpectedToSend");
        *(_DWORD *)buf = 134217984;
        v236 = v107;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesExpectedToSend (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 31, (sqlite3_int64)objc_msgSend(v6, "countOfBytesExpectedToReceive")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v108 = (const char *)objc_msgSend(v6, "countOfBytesExpectedToReceive");
        *(_DWORD *)buf = 134217984;
        v236 = v108;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesExpectedToReceive (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 32, (sqlite3_int64)objc_msgSend(v6, "bytesPerSecondLimit")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v109 = (const char *)objc_msgSend(v6, "bytesPerSecondLimit");
        *(_DWORD *)buf = 134217984;
        v236 = v109;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind bytesPerSecondLimit (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    v104 = *p_insertOrUpdateAllEntriesStmt;
    v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString")));
    v106 = sqlite3_bind_text(v104, 33, (const char *)objc_msgSend(v105, "UTF8String"), -1, 0) == 0;

    if (!v106)
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v110 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
        *(_DWORD *)buf = 138412290;
        v236 = v110;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind personaUniqueString (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 34, (int)objc_msgSend(v6, "expectedProgressTarget")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v111 = (const char *)objc_msgSend(v6, "expectedProgressTarget");
        *(_DWORD *)buf = 134217984;
        v236 = v111;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind expectedProgressTarget (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 35, (int)objc_msgSend(v6, "mayBeDemotedToDiscretionary")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v112 = objc_msgSend(v6, "mayBeDemotedToDiscretionary");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v112;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind mayBeDemotedToDiscretionary (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 36, (int)objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v113 = objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v113;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 37, (int)objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v114 = objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v114;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 38, (int)objc_msgSend(v6, "_hasSZExtractor")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v115 = objc_msgSend(v6, "_hasSZExtractor");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v115;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _hasSZExtractor (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 39, (int)objc_msgSend(v6, "_doesSZExtractorConsumeExtractedData")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v120 = objc_msgSend(v6, "_doesSZExtractorConsumeExtractedData");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v120;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _doesSZExtractorConsumeExtractedData (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 40, (int)objc_msgSend(v6, "_updatedStreamingZipModificationDate")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v128 = objc_msgSend(v6, "_updatedStreamingZipModificationDate");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v128;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _updatedStreamingZipModificationDate (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 41, (int)objc_msgSend(v6, "startedUserInitiated")))
    {
      v96 = (id)qword_1000C7158;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v129 = objc_msgSend(v6, "startedUserInitiated");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v129;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind startedUserInitiated (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalProperties"));
    v117 = v116 == 0;

    if (v117)
    {
      v119 = 0;
    }
    else
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalProperties"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v118, 1, 0));

    }
    v121 = *p_insertOrUpdateAllEntriesStmt;
    v228 = objc_retainAutorelease(v119);
    if (sqlite3_bind_blob(v121, 42, objc_msgSend(v228, "bytes"), (int)objc_msgSend(v228, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v122 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "Failed to bind additionalProperties to the select statement", buf, 2u);
      }
      goto LABEL_197;
    }
    v123 = *p_insertOrUpdateAllEntriesStmt;
    v124 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathToDownloadTaskFile")));
    v125 = sqlite3_bind_text(v123, 43, (const char *)objc_msgSend(v124, "UTF8String"), -1, 0) == 0;

    if (!v125)
    {
      v126 = (id)qword_1000C7158;
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v134 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathToDownloadTaskFile"));
        *(_DWORD *)buf = 138412290;
        v236 = v134;
        _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "Failed to bind pathToDownloadTaskFile (%@) to the select statement", buf, 0xCu);

      }
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 44, (int)objc_msgSend(v6, "retryCount")))
    {
      v127 = (id)qword_1000C7158;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v135 = (const char *)objc_msgSend(v6, "retryCount");
        *(_DWORD *)buf = 134217984;
        v236 = v135;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind retryCount (%lu) to the select statement", buf, 0xCu);
      }
LABEL_221:

LABEL_197:
      goto LABEL_198;
    }
    v130 = *p_insertOrUpdateAllEntriesStmt;
    objc_msgSend(v6, "loadingPriority");
    if (sqlite3_bind_double(v130, 45, v131))
    {
      v127 = (id)qword_1000C7158;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "loadingPriority");
        *(_DWORD *)buf = 134217984;
        v236 = v132;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind loadingPriority (%f) to the select statement", buf, 0xCu);
      }
      goto LABEL_221;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 46, objc_msgSend(v6, "qos")))
    {
      v127 = (id)qword_1000C7158;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v133 = objc_msgSend(v6, "qos");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v133;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind qos (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_221;
    }
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_backgroundTrailers"));
    v137 = v136 == 0;

    if (v137)
    {
      v139 = 0;
    }
    else
    {
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_backgroundTrailers"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v138, 1, 0));

    }
    v140 = *p_insertOrUpdateAllEntriesStmt;
    v219 = objc_retainAutorelease(v139);
    if (sqlite3_bind_blob(v140, 47, objc_msgSend(v219, "bytes"), (int)objc_msgSend(v219, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v141 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "Failed to bind backgroundTrailersData to the select statement", buf, 2u);
      }
      goto LABEL_315;
    }
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskMetrics"));
    v143 = v142 == 0;

    if (v143)
    {
      v145 = 0;
    }
    else
    {
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskMetrics"));
      v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v144, 1, 0));

    }
    v146 = *p_insertOrUpdateAllEntriesStmt;
    v218 = objc_retainAutorelease(v145);
    if (sqlite3_bind_blob(v146, 48, objc_msgSend(v218, "bytes"), (int)objc_msgSend(v218, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v147 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "Failed to bind taskMetricsData to the select statement", buf, 2u);
      }
      goto LABEL_314;
    }
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
    v149 = v148 == 0;

    if (v149)
    {
      v151 = 0;
    }
    else
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
      v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v150, 1, 0));

    }
    v152 = *p_insertOrUpdateAllEntriesStmt;
    v220 = objc_retainAutorelease(v151);
    if (sqlite3_bind_blob(v152, 49, objc_msgSend(v220, "bytes"), (int)objc_msgSend(v220, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v224 = (id)qword_1000C7158;
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
      {
        v153 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
        *(_DWORD *)buf = 138412290;
        v236 = v153;
        _os_log_error_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_ERROR, "Failed to bind URL (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_313;
    }
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationURL"));
    v155 = v154 == 0;

    if (v155)
    {
      v157 = 0;
    }
    else
    {
      v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationURL"));
      v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v156, 1, 0));

    }
    v158 = *p_insertOrUpdateAllEntriesStmt;
    v224 = objc_retainAutorelease(v157);
    if (sqlite3_bind_blob(v158, 50, -[NSObject bytes](v224, "bytes"), (int)-[NSObject length](v224, "length"), 0))
    {
      v223 = (id)qword_1000C7158;
      if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
      {
        v159 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationURL"));
        *(_DWORD *)buf = 138412290;
        v236 = v159;
        _os_log_error_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_ERROR, "Failed to bind destinationURL (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_312;
    }
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
    v161 = v160 == 0;

    if (v161)
    {
      v163 = 0;
    }
    else
    {
      v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "options"));
      v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v162, 200, 0, 0));

    }
    v164 = *p_insertOrUpdateAllEntriesStmt;
    v223 = objc_retainAutorelease(v163);
    if (sqlite3_bind_blob(v164, 51, -[NSObject bytes](v223, "bytes"), (int)-[NSObject length](v223, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v165 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "Failed to bind optionsData to the select statement", buf, 2u);
      }
      goto LABEL_312;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 52, (int)objc_msgSend(v6, "initializedWithAVAsset")))
    {
      v166 = (id)qword_1000C7158;
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
      {
        v167 = objc_msgSend(v6, "initializedWithAVAsset");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v167;
        _os_log_error_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "Failed to bind initializedWithAVAsset (%lu) to the select statement", buf, 0xCu);
      }

      goto LABEL_312;
    }
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryDestinationURL"));
    v169 = v168 == 0;

    if (v169)
    {
      v171 = 0;
    }
    else
    {
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryDestinationURL"));
      v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v170, 1, 0));

    }
    v172 = *p_insertOrUpdateAllEntriesStmt;
    v222 = objc_retainAutorelease(v171);
    if (sqlite3_bind_blob(v172, 53, objc_msgSend(v222, "bytes"), (int)objc_msgSend(v222, "length"), 0))
    {
      v173 = (id)qword_1000C7158;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v174 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryDestinationURL"));
        *(_DWORD *)buf = 138412290;
        v236 = v174;
        _os_log_error_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "Failed to bind temporaryDestinationURL (%@) to the select statement", buf, 0xCu);

      }
LABEL_262:

LABEL_311:
LABEL_312:

LABEL_313:
LABEL_314:

LABEL_315:
      goto LABEL_197;
    }
    v175 = *p_insertOrUpdateAllEntriesStmt;
    v176 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetTitle")));
    v177 = sqlite3_bind_text(v175, 54, (const char *)objc_msgSend(v176, "UTF8String"), -1, 0) == 0;

    if (!v177)
    {
      v173 = (id)qword_1000C7158;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v178 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetTitle"));
        *(_DWORD *)buf = 138412290;
        v236 = v178;
        _os_log_error_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "Failed to bind assetTitle (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_262;
    }
    v179 = *p_insertOrUpdateAllEntriesStmt;
    v180 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetArtworkData")));
    v181 = objc_msgSend(v180, "bytes");
    v226 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetArtworkData"));
    LOBYTE(v179) = sqlite3_bind_blob(v179, 55, v181, (int)-[NSObject length](v226, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL) == 0;

    if ((v179 & 1) == 0)
    {
      v182 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_ERROR, "Failed to bind assetArtworkDataData to the select statement", buf, 2u);
      }
      goto LABEL_311;
    }
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVAssetURL"));
    v184 = v183 == 0;

    if (v184)
    {
      v186 = 0;
    }
    else
    {
      v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVAssetURL"));
      v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v185, 1, 0));

    }
    v187 = *p_insertOrUpdateAllEntriesStmt;
    v225 = objc_retainAutorelease(v186);
    if (sqlite3_bind_blob(v187, 56, objc_msgSend(v225, "bytes"), (int)objc_msgSend(v225, "length"), 0))
    {
      v227 = (id)qword_1000C7158;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v188 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVAssetURL"));
        *(_DWORD *)buf = 138412290;
        v236 = v188;
        _os_log_error_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_ERROR, "Failed to bind AVAssetURL (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_310;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 57, (int)objc_msgSend(v6, "AVAssetDownloadToken")))
    {
      v227 = (id)qword_1000C7158;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v189 = (const char *)objc_msgSend(v6, "AVAssetDownloadToken");
        *(_DWORD *)buf = 134217984;
        v236 = v189;
        v190 = "Failed to bind AVAssetDownloadToken (%lu) to the select statement";
LABEL_285:
        v196 = v227;
        v197 = 12;
LABEL_292:
        _os_log_error_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, v190, buf, v197);
        goto LABEL_310;
      }
      goto LABEL_310;
    }
    v191 = *p_insertOrUpdateAllEntriesStmt;
    v192 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "avAssetDownloadChildDownloadSessionIdentifier")));
    v193 = sqlite3_bind_text(v191, 58, (const char *)objc_msgSend(v192, "UTF8String"), -1, 0) == 0;

    if (!v193)
    {
      v227 = (id)qword_1000C7158;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v194 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "avAssetDownloadChildDownloadSessionIdentifier"));
        *(_DWORD *)buf = 138412290;
        v236 = v194;
        _os_log_error_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_ERROR, "Failed to bind avAssetDownloadChildDownloadSessionIdentifier (%@) to the select statement", buf, 0xCu);

      }
      goto LABEL_310;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 59, (int)objc_msgSend(v6, "enableSPIDelegateCallbacks")))
    {
      v227 = (id)qword_1000C7158;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v195 = objc_msgSend(v6, "enableSPIDelegateCallbacks");
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v195;
        v190 = "Failed to bind enableSPIDelegateCallbacks (%lu) to the select statement";
        goto LABEL_285;
      }
LABEL_310:

      goto LABEL_311;
    }
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadConfig"));
    v199 = v198 == 0;

    if (v199)
    {
      v201 = 0;
    }
    else
    {
      v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadConfig"));
      v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v200, 1, 0));

    }
    v202 = *p_insertOrUpdateAllEntriesStmt;
    v227 = objc_retainAutorelease(v201);
    if (sqlite3_bind_blob(v202, 60, -[NSObject bytes](v227, "bytes"), (int)-[NSObject length](v227, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v203 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v190 = "Failed to bind downloadConfigData to the select statement";
        v196 = v203;
        v197 = 2;
        goto LABEL_292;
      }
      goto LABEL_310;
    }
    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetOptionsPlist"));
    v205 = v204 == 0;

    if (v205
      || (v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetOptionsPlist")),
          v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v206, 200, 0, 0)), v206, !v207))
    {
      v221 = 0;
      v210 = 61;
    }
    else
    {
      v208 = *p_insertOrUpdateAllEntriesStmt;
      v221 = objc_retainAutorelease(v207);
      if (sqlite3_bind_blob(v208, 61, objc_msgSend(v221, "bytes"), (int)objc_msgSend(v221, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v209 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_ERROR, "Failed to bind assetOptionsData to the select statement", buf, 2u);
        }
LABEL_309:

        goto LABEL_310;
      }
      v210 = 62;
    }
    v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resumableUploadData"));
    v212 = *p_insertOrUpdateAllEntriesStmt;
    v217 = objc_retainAutorelease(v211);
    if (sqlite3_bind_blob(v212, v210, objc_msgSend(v217, "bytes"), (int)objc_msgSend(v217, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v213 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_ERROR, "Failed to bind resumableUploadData to the select statement", buf, 2u);
      }
    }
    else
    {
      if (sqlite3_step(*p_insertOrUpdateAllEntriesStmt) != 101)
      {
        v214 = (id)qword_1000C7158;
        if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        {
          v215 = (const char *)objc_msgSend(v6, "identifier");
          v216 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 134218242;
          v236 = v215;
          v237 = 2080;
          v238 = v216;
          _os_log_error_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_ERROR, "Failed to insert task %lu into db. Error= %s", buf, 0x16u);
        }

      }
      sqlite3_reset(*p_insertOrUpdateAllEntriesStmt);
    }

    goto LABEL_309;
  }
  v13 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
  }
LABEL_205:

}

- (BOOL)migrateSchemaToLatestVersion:(int64_t)a3
{
  sqlite3 *dbConnection;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  int v9;
  NSObject *v10;
  void *v11;
  sqlite3 *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  char *errmsg;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;

  errmsg = 0;
  dbConnection = self->_dbConnection;
  if (!dbConnection)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  v6 = 1;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (sqlite3_exec(dbConnection, "ALTER TABLE session_tasks ADD COLUMN resumable_upload_data blob;", 0, 0, 0))
      {
        v7 = qword_1000C7158;
        if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        *(_WORD *)buf = 0;
        v8 = "Failed to migrate to version 2";
LABEL_25:
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
LABEL_11:
        v9 = sqlite3_exec(self->_dbConnection, "DROP TABLE IF EXISTS session_tasks", 0, 0, &errmsg);
        v10 = qword_1000C7158;
        if (v9 && os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to drop table", buf, 2u);
          v10 = qword_1000C7158;
        }
        v6 = 0;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v19 = a3;
          v20 = 1024;
          v21 = 2;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dropped db table session_tasks as migration from version %ld to %d failed", buf, 0x12u);
          v6 = 0;
        }
      }
    }
    else if (!a3
           && sqlite3_exec(dbConnection, "ALTER TABLE session_tasks ADD COLUMN av_asset_options_plist blob;",
                0,
                0,
                0))
    {
      v7 = qword_1000C7158;
      if (!os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v8 = "Failed to migrate to version 1";
      goto LABEL_25;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("PRAGMA user_version = "), 2));
    v12 = self->_dbConnection;
    v13 = objc_retainAutorelease(v11);
    if (sqlite3_exec(v12, (const char *)objc_msgSend(v13, "UTF8String"), 0, 0, &errmsg))
    {
      v14 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to set user_version", buf, 2u);
      }
      v6 = 0;
    }

  }
  v15 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v19 = a3;
    v20 = 1024;
    v21 = 2;
    v22 = 1024;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrated schema version from %ld to %d success = %d", buf, 0x18u);
  }
  return v6;
}

- (BOOL)handleSchemaVersionChange
{
  sqlite3 *dbConnection;
  BOOL result;
  uint64_t v5;
  NSObject *v6;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  uint64_t v9;

  ppStmt = 0;
  dbConnection = self->_dbConnection;
  if (!dbConnection || sqlite3_prepare_v2(dbConnection, "PRAGMA user_version", -1, &ppStmt, 0))
    return 1;
  if (sqlite3_step(ppStmt) == 100)
  {
    v5 = sqlite3_column_int(ppStmt, 0);
    v6 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "schema version on disk is %ld", buf, 0xCu);
    }
  }
  else
  {
    v5 = -1;
  }
  sqlite3_finalize(ppStmt);
  result = 1;
  if ((v5 & 0x8000000000000000) == 0 && v5 != 2)
    return -[NDTaskStorageDB migrateSchemaToLatestVersion:](self, "migrateSchemaToLatestVersion:", v5);
  return result;
}

- (BOOL)_createDBSchemaForPath:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  char *v7;
  int v8;
  char f_flags;
  unsigned __int8 v10;
  int v11;
  sqlite3 **p_dbConnection;
  BOOL v13;
  NSObject *v14;
  id v15;
  const char *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  char v22;
  NSObject *v23;
  void *v24;
  char *errmsg[96];
  statfs v27;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  v6 = v5;
  if (v5)
  {
    v7 = dirname_r(v5, (char *)errmsg);
    v8 = statfs(v7, &v27);
    f_flags = v27.f_flags;
    v10 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);
    if (((v8 != -1) & ((f_flags & 0x80) >> 7)) != 0)
      v11 = 3145734;
    else
      v11 = 6;
    p_dbConnection = &self->_dbConnection;
    if (sqlite3_open_v2(v6, &self->_dbConnection, v11, 0))
    {
      sqlite3_close(*p_dbConnection);
      v13 = 0;
      *p_dbConnection = 0;
      goto LABEL_27;
    }
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("PRAGMA user_version = "), 2, 0)));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");

    sqlite3_busy_timeout(*p_dbConnection, 1000);
    if ((v10 & 1) != 0)
    {
      if (-[NDTaskStorageDB handleSchemaVersionChange](self, "handleSchemaVersionChange"))
      {
LABEL_12:
        v17 = 1;
LABEL_24:
        v23 = (id)qword_1000C7158;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
          v27.f_bsize = 138412290;
          *(_QWORD *)&v27.f_iosize = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Opened db at path: %@", (uint8_t *)&v27, 0xCu);

        }
        v13 = v17 != 0;
        goto LABEL_27;
      }
      v20 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        v21 = "Failed to handle db version change";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (sqlite3_exec(*p_dbConnection, "PRAGMA auto_vacuum = 2;", 0, 0, errmsg))
    {
      v18 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        v19 = "Failed to set auto_vacuum to incremental";
LABEL_36:
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v27, 2u);
      }
    }
    else
    {
      if (!sqlite3_exec(*p_dbConnection, "PRAGMA journal_mode = WAL", 0, 0, errmsg))
      {
        v22 = 0;
        v17 = 1;
LABEL_21:
        if (sqlite3_exec(*p_dbConnection, v16, 0, 0, errmsg))
        {
          v20 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            v21 = "Failed to set user_version";
            goto LABEL_34;
          }
        }
        else
        {
          if ((v22 & 1) != 0)
            goto LABEL_24;
          if (!sqlite3_exec(*p_dbConnection, "CREATE TABLE IF NOT EXISTS session_tasks (\tidentifier int NOT NULL, task_kind int, creation_time real, state int, suspend_count int, task_description text, original_request blob, current_request blob, response blob,\tearliest_begin_date real, responded_to_will_begin_delayed_request_callback int, error blob, retry_error blob, file_url text, download_file_url text, bundle_id text, session_id text NOT NULL,\thas_started int, should_cancel_on_disconnect int, base_priority int, base_priority_set_explicitly int, discretionary int, discretionary_override int, unique_identifier blob NOT NULL,\tstorage_partition_identifier text, count_of_bytes_client_expects_to_send int, count_of_bytes_client_expects_to_receive int, count_of_bytes_received int, count_of_bytes_sent int,\tcount_of_bytes_expected_to_send int, count_of_bytes_expected_to_receive int, bytes_per_second_limit int, persona_unique_string text, expected_progress_target int, may_be_demoted_to_discretionary int,\ttls_minimum_supported_protocol_version int, tls_maximum_supported_protocol_version int, has_sz_extractor int, does_sz_extractor_consume_extracted_data int, updated_streaming_zip_modification_date int,\tstarted_user_initiated int, additional_properties blob, path_to_download_task_file text, retry_count int, loading_priority real, qos int, background_trailers blob, task_metrics blob,\tav_url text, av_destination_url text, av_options blob, av_initialized_with_av_asset int, av_temporary_destination_url text, av_asset_title text, av_asset_artwork_data blob, av_asset_url text,\tav_asset_download_token int, av_asset_download_child_download_session_identifier text, av_enable_spi_delegate_callbacks int, av_download_config blob, av_asset_options_plist blob, resumable_upload_data blob,\tUNIQUE(identifier, session_id));",
                  0,
                  0,
                  errmsg))
            goto LABEL_12;
          v20 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            v21 = "Failed to create schema";
            goto LABEL_34;
          }
        }
LABEL_23:
        v17 = 0;
        goto LABEL_24;
      }
      v18 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        v19 = "Failed to set journal mode";
        goto LABEL_36;
      }
    }
    v17 = 0;
    v22 = 1;
    goto LABEL_21;
  }
  v14 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v27.f_bsize) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get dbPath", (uint8_t *)&v27, 2u);
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (void)_onqueue_garbageCollect
{
  NSObject *v3;
  sqlite3 *dbConnection;
  sqlite3_stmt *deleteEntriesStmt;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  char *errmsg;
  uint8_t buf[4];
  char *v14;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Garbage collection started", buf, 2u);
  }
  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    deleteEntriesStmt = self->_deleteEntriesStmt;
    if (deleteEntriesStmt)
    {
LABEL_6:
      if (sqlite3_step(deleteEntriesStmt) != 101)
      {
        v6 = (id)qword_1000C7158;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v10 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 136315138;
          v14 = (char *)v10;
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to delete expired entries from session_tasks db. Error= %s", buf, 0xCu);
        }

      }
      sqlite3_reset(self->_deleteEntriesStmt);
      errmsg = 0;
      if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0, 0, &errmsg))
      {
        v7 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v14 = errmsg;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to auto vacuum when garbage collecting: %s", buf, 0xCu);
        }
      }
      return;
    }
    if (!sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks", -1, &self->_deleteEntriesStmt, 0))
    {
      deleteEntriesStmt = self->_deleteEntriesStmt;
      goto LABEL_6;
    }
    v9 = (id)qword_1000C7158;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = sqlite3_errmsg(self->_dbConnection);
      *(_DWORD *)buf = 136315138;
      v14 = (char *)v11;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to init the _deleteEntriesStmt statement for session_tasks. Error = %s", buf, 0xCu);
    }

  }
  else
  {
    v8 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }
  }
}

- (BOOL)_onqueue_initDB
{
  NDTaskStorageDB *v2;
  _BOOL4 dbInitializationStarted;
  NSURL *path;
  uint64_t v5;
  NSURL *v6;
  NSObject *v7;
  NSURL *v8;
  int v10;
  NSURL *v11;

  if (self->_dbInitialized)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    v2 = self;
    dbInitializationStarted = self->_dbInitializationStarted;
    LOBYTE(self) = 1;
    if (!dbInitializationStarted)
    {
      v2->_dbInitializationStarted = 1;
      path = v2->_path;
      if (!path)
      {
        v5 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:isDirectory:](v2->_dbDir, "URLByAppendingPathComponent:isDirectory:", CFSTR("tasks.sqlite"), 0));
        v6 = v2->_path;
        v2->_path = (NSURL *)v5;

        path = v2->_path;
      }
      if (-[NDTaskStorageDB _createDBSchemaForPath:](v2, "_createDBSchemaForPath:", path))
      {
        LOBYTE(self) = 1;
        v2->_dbInitialized = 1;
      }
      else
      {
        v7 = qword_1000C7158;
        LODWORD(self) = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR);
        if ((_DWORD)self)
        {
          v8 = v2->_path;
          v10 = 138412290;
          v11 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to create persistent store for background tasks at location %@.", (uint8_t *)&v10, 0xCu);
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)_sqlBlobHelper:(sqlite3_stmt *)a3 forColumn:(int)a4
{
  int v6;
  id v7;

  v6 = sqlite3_column_bytes(a3, a4);
  if (v6 < 1)
    v7 = 0;
  else
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", sqlite3_column_blob(a3, a4), v6);
  return v7;
}

- (id)_onqueue_convertSqlRowToTaskInfoEntry:(sqlite3_stmt *)a3
{
  id v5;
  const unsigned __int8 *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  const unsigned __int8 *v36;
  void *v37;
  const unsigned __int8 *v38;
  void *v39;
  id v40;
  const unsigned __int8 *v41;
  void *v42;
  const unsigned __int8 *v43;
  void *v44;
  void *v45;
  const unsigned __int8 *v46;
  void *v47;
  uint64_t v48;
  NSDictionary *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  const unsigned __int8 *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  const unsigned __int8 *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint8_t v93[16];
  uint8_t buf[16];
  uint8_t v95[16];

  if (!a3)
  {
    v5 = 0;
LABEL_65:
    v5 = v5;
    v77 = v5;
    goto LABEL_69;
  }
  v5 = objc_alloc_init((Class)__NSCFURLSessionTaskInfo);
  objc_msgSend(v5, "setIdentifier:", sqlite3_column_int(a3, 0));
  objc_msgSend(v5, "setTaskKind:", sqlite3_column_int64(a3, 1));
  objc_msgSend(v5, "setCreationTime:", sqlite3_column_double(a3, 2));
  objc_msgSend(v5, "setState:", sqlite3_column_int64(a3, 3));
  objc_msgSend(v5, "setSuspendCount:", sqlite3_column_int64(a3, 4));
  v6 = sqlite3_column_text(a3, 5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    objc_msgSend(v5, "setTaskDescription:", v7);

  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 6));
  if ((unint64_t)objc_msgSend(v92, "length") <= 0x20000)
  {
    if (v92)
    {
      v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURLRequest), v92, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v5, "setOriginalRequest:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalRequest"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_allProtocolProperties"));
      v12 = estimatedPropertyListSize();

      if (v12 > 0x4000)
      {
        v13 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dropping oversized protocol properties on request", buf, 2u);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalRequest"));
        v15 = objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v15, "_removeAllProtocolProperties");
        objc_msgSend(v5, "setOriginalRequest:", v15);

      }
    }
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 7));
    if (v91)
    {
      v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURLRequest), v91, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v5, "setCurrentRequest:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRequest"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_allProtocolProperties"));
      v20 = estimatedPropertyListSize();

      if (v20 > 0x4000)
      {
        v21 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v93 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Dropping oversized protocol properties on request", v93, 2u);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRequest"));
        v23 = objc_msgSend(v22, "mutableCopy");

        objc_msgSend(v23, "_removeAllProtocolProperties");
        objc_msgSend(v5, "setCurrentRequest:", v23);

      }
    }
    v24 = objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 8));
    v80 = v24;
    if (v24)
    {
      v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURLResponse), v24, 0, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v5, "setResponse:", v26);

    }
    if (sqlite3_column_double(a3, 9) != 0.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
      objc_msgSend(v5, "setEarliestBeginDate:", v27);

    }
    objc_msgSend(v5, "setRespondedToWillBeginDelayedRequestCallback:", sqlite3_column_int(a3, 10) != 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 11));
    if (v90)
    {
      v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSError), v90, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v5, "setError:", v29);

    }
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 12, v80));
    if (v89)
    {
      v30 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSError), v89, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v5, "setRetryError:", v31);

    }
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 13));
    if (v88)
    {
      v32 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v88, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v5, "setFileURL:", v33);

    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 14));
    if (v87)
    {
      v34 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v87, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v5, "setDownloadFileURL:", v35);

    }
    v36 = sqlite3_column_text(a3, 15);
    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v36));
      objc_msgSend(v5, "setBundleID:", v37);

    }
    v38 = sqlite3_column_text(a3, 16);
    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v38));
      objc_msgSend(v5, "setSessionID:", v39);

    }
    objc_msgSend(v5, "setHasStarted:", sqlite3_column_int(a3, 17) != 0);
    objc_msgSend(v5, "setShouldCancelOnDisconnect:", sqlite3_column_int(a3, 18) != 0);
    objc_msgSend(v5, "setBasePriority:", sqlite3_column_int(a3, 19));
    objc_msgSend(v5, "setBasePrioritySetExplicitly:", sqlite3_column_int(a3, 20) != 0);
    objc_msgSend(v5, "setDiscretionary:", sqlite3_column_int(a3, 21) != 0);
    objc_msgSend(v5, "setDiscretionaryOverride:", sqlite3_column_int(a3, 22));
    v86 = (id)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 23));
    if (v86)
    {
      v40 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v86), "bytes"));
      objc_msgSend(v5, "setUniqueIdentifier:", v40);

    }
    v41 = sqlite3_column_text(a3, 24);
    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v41));
      objc_msgSend(v5, "setStoragePartitionIdentifier:", v42);

    }
    objc_msgSend(v5, "setCountOfBytesClientExpectsToSend:", sqlite3_column_int64(a3, 25));
    objc_msgSend(v5, "setCountOfBytesClientExpectsToReceive:", sqlite3_column_int64(a3, 26));
    objc_msgSend(v5, "setCountOfBytesReceived:", sqlite3_column_int64(a3, 27));
    objc_msgSend(v5, "setCountOfBytesSent:", sqlite3_column_int64(a3, 28));
    objc_msgSend(v5, "setCountOfBytesExpectedToSend:", sqlite3_column_int64(a3, 29));
    objc_msgSend(v5, "setCountOfBytesExpectedToReceive:", sqlite3_column_int64(a3, 30));
    objc_msgSend(v5, "setBytesPerSecondLimit:", sqlite3_column_int64(a3, 31));
    v43 = sqlite3_column_text(a3, 32);
    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v43));
      objc_msgSend(v5, "setPersonaUniqueString:", v44);

    }
    objc_msgSend(v5, "setExpectedProgressTarget:", sqlite3_column_int64(a3, 33));
    objc_msgSend(v5, "setMayBeDemotedToDiscretionary:", sqlite3_column_int(a3, 34) != 0);
    objc_msgSend(v5, "set_TLSMinimumSupportedProtocolVersion:", (unsigned __int16)sqlite3_column_int(a3, 35));
    objc_msgSend(v5, "set_TLSMaximumSupportedProtocolVersion:", (unsigned __int16)sqlite3_column_int(a3, 36));
    objc_msgSend(v5, "set_hasSZExtractor:", sqlite3_column_int(a3, 37) != 0);
    objc_msgSend(v5, "set_doesSZExtractorConsumeExtractedData:", sqlite3_column_int(a3, 38) != 0);
    objc_msgSend(v5, "set_updatedStreamingZipModificationDate:", sqlite3_column_int(a3, 39) != 0);
    objc_msgSend(v5, "setStartedUserInitiated:", sqlite3_column_int(a3, 40) != 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 41));
    if (v85)
    {
      if (qword_1000C7060 != -1)
        dispatch_once(&qword_1000C7060, &stru_1000B10D0);
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", qword_1000C7058, v85, 0));
      objc_msgSend(v5, "setAdditionalProperties:", v45);

    }
    v46 = sqlite3_column_text(a3, 42);
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v46));
      objc_msgSend(v5, "setPathToDownloadTaskFile:", v47);

    }
    objc_msgSend(v5, "setRetryCount:", sqlite3_column_int(a3, 43));
    objc_msgSend(v5, "setLoadingPriority:", sqlite3_column_double(a3, 44));
    objc_msgSend(v5, "setQos:", sqlite3_column_int64(a3, 45));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 46));
    if (v84)
    {
      v48 = objc_opt_class(NSString);
      v49 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v48, objc_opt_class(NSString), v84, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      objc_msgSend(v5, "set_backgroundTrailers:", v50);

    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 47));
    if (v83)
    {
      v51 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(__CFN_TaskMetrics), v83, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      objc_msgSend(v5, "setTaskMetrics:", v52);

    }
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 48));
    if (v82)
    {
      v53 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v82, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      objc_msgSend(v5, "setURL:", v54);

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 49));
    if (v55)
    {
      v56 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v55, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      objc_msgSend(v5, "setDestinationURL:", v57);

    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 50));
    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v58, 0, 0, 0));
      objc_msgSend(v5, "setOptions:", v59);

    }
    objc_msgSend(v5, "setInitializedWithAVAsset:", sqlite3_column_int(a3, 51) != 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 52));
    if (v60)
    {
      v61 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v60, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      objc_msgSend(v5, "setTemporaryDestinationURL:", v62);

    }
    v63 = sqlite3_column_text(a3, 53);
    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v63));
      objc_msgSend(v5, "setAssetTitle:", v64);

    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 54));
    objc_msgSend(v5, "setAssetArtworkData:", v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 55));
    if (v66)
    {
      v67 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(NSURL), v66, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      objc_msgSend(v5, "setAVAssetURL:", v68);

    }
    objc_msgSend(v5, "setAVAssetDownloadToken:", sqlite3_column_int64(a3, 56));
    v69 = sqlite3_column_text(a3, 57);
    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v69));
      objc_msgSend(v5, "setAvAssetDownloadChildDownloadSessionIdentifier:", v70);

    }
    objc_msgSend(v5, "setEnableSPIDelegateCallbacks:", sqlite3_column_int(a3, 58) != 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 59));
    v72 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AVAssetDownloadConfiguration), v71, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    objc_msgSend(v5, "setDownloadConfig:", v73);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 60));
    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v74, 0, 0, 0));
      objc_msgSend(v5, "setAssetOptionsPlist:", v75);

    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 61));
    objc_msgSend(v5, "setResumableUploadData:", v76);

    goto LABEL_65;
  }
  v78 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v95 = 0;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Dropping oversized request", v95, 2u);
  }

  v77 = 0;
LABEL_69:

  return v77;
}

- (void)_onqueue_updateResponseForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateResponseForTaskStmt;
  void *v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  sqlite3_stmt *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  int v26;
  id v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v26 = 134218242;
    v27 = objc_msgSend(v6, "identifier");
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateResponseForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResponseForTaskStmt = &self->_updateResponseForTaskStmt;
    if (!self->_updateResponseForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET response = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateResponseForTaskStmt, 0))
    {
      v17 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to init _updateResponseForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_28;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0));

    v13 = *p_updateResponseForTaskStmt;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_bind_blob(v13, 1, objc_msgSend(v14, "bytes"), (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v15 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind responseData to the select statement", (uint8_t *)&v26, 2u);
      }
    }
    else
    {
      v18 = *p_updateResponseForTaskStmt;
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)objc_msgSend(v19, "UTF8String"), -1, 0) == 0;

      if ((v18 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateResponseForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
        {
          if (sqlite3_step(*p_updateResponseForTaskStmt) != 101)
          {
            v21 = (id)qword_1000C7158;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v24 = objc_msgSend(v6, "identifier");
              v25 = sqlite3_errmsg(self->_dbConnection);
              v26 = 134218242;
              v27 = v24;
              v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to update response for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }

          }
          sqlite3_reset(*p_updateResponseForTaskStmt);
          goto LABEL_27;
        }
        v20 = (id)qword_1000C7158;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_msgSend(v6, "identifier");
          v26 = 134217984;
          v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        v20 = (id)qword_1000C7158;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
          v26 = 138412290;
          v27 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);

        }
      }

    }
LABEL_27:

    goto LABEL_28;
  }
  v16 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_28:

}

- (void)_onqueue_updateResumableUploadDataForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateResumableUploadDataForTaskStmt;
  void *v11;
  sqlite3_stmt *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  sqlite3_stmt *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  int v25;
  id v26;
  __int16 v27;
  const char *v28;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v25 = 134218242;
    v26 = objc_msgSend(v6, "identifier");
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateResumableUploadDataForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResumableUploadDataForTaskStmt = &self->_updateResumableUploadDataForTaskStmt;
    if (!self->_updateResumableUploadDataForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET resumable_upload_data = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateResumableUploadDataForTaskStmt, 0))
    {
      v16 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to init _updateResumableUploadDataForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
      }
      goto LABEL_28;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resumableUploadData"));
    v12 = *p_updateResumableUploadDataForTaskStmt;
    v13 = objc_retainAutorelease(v11);
    if (sqlite3_bind_blob(v12, 1, objc_msgSend(v13, "bytes"), (int)objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v14 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind resumableUploadData to the select statement", (uint8_t *)&v25, 2u);
      }
    }
    else
    {
      v17 = *p_updateResumableUploadDataForTaskStmt;
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
      LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0) == 0;

      if ((v17 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateResumableUploadDataForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
        {
          if (sqlite3_step(*p_updateResumableUploadDataForTaskStmt) != 101)
          {
            v20 = (id)qword_1000C7158;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v23 = objc_msgSend(v6, "identifier");
              v24 = sqlite3_errmsg(self->_dbConnection);
              v25 = 134218242;
              v26 = v23;
              v27 = 2080;
              v28 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to update resumableUploadData for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
            }

          }
          sqlite3_reset(*p_updateResumableUploadDataForTaskStmt);
          goto LABEL_27;
        }
        v19 = (id)qword_1000C7158;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend(v6, "identifier");
          v25 = 134217984;
          v26 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
        }
      }
      else
      {
        v19 = (id)qword_1000C7158;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
          v25 = 138412290;
          v26 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);

        }
      }

    }
LABEL_27:

    goto LABEL_28;
  }
  v15 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
  }
LABEL_28:

}

- (void)_onqueue_updateShouldCancelOnDisconnectForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateShouldCancelOnDisconnectForTaskStmt;
  sqlite3_stmt *updateShouldCancelOnDisconnectForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218242;
    v24 = objc_msgSend(v6, "identifier");
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateShouldCancelOnDisconnectForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateShouldCancelOnDisconnectForTaskStmt = &self->_updateShouldCancelOnDisconnectForTaskStmt;
    updateShouldCancelOnDisconnectForTaskStmt = self->_updateShouldCancelOnDisconnectForTaskStmt;
    if (!updateShouldCancelOnDisconnectForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET should_cancel_on_disconnect = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateShouldCancelOnDisconnectForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateShouldCancelOnDisconnectForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateShouldCancelOnDisconnectForTaskStmt = *p_updateShouldCancelOnDisconnectForTaskStmt;
    }
    if (sqlite3_bind_int(updateShouldCancelOnDisconnectForTaskStmt, 1, (int)objc_msgSend(v6, "shouldCancelOnDisconnect")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v6, "shouldCancelOnDisconnect");
        v23 = 134217984;
        v24 = (id)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    v15 = *p_updateShouldCancelOnDisconnectForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v23 = 138412290;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateShouldCancelOnDisconnectForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v6, "identifier");
        v23 = 134217984;
        v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateShouldCancelOnDisconnectForTaskStmt) != 101)
    {
      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        v24 = v21;
        v25 = 2080;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update shouldCancelOnDisconnect for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }

    }
    sqlite3_reset(*p_updateShouldCancelOnDisconnectForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:

}

- (void)_onqueue_updateCurrentRequestForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateCurrentRequestForTaskStmt;
  void *v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  sqlite3_stmt *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  int v26;
  id v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v26 = 134218242;
    v27 = objc_msgSend(v6, "identifier");
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateCurrentRequestForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateCurrentRequestForTaskStmt = &self->_updateCurrentRequestForTaskStmt;
    if (!self->_updateCurrentRequestForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET current_request = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateCurrentRequestForTaskStmt, 0))
    {
      v17 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to init _updateCurrentRequestForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_28;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0));

    v13 = *p_updateCurrentRequestForTaskStmt;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_bind_blob(v13, 1, objc_msgSend(v14, "bytes"), (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v15 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind currentRequestData to the select statement", (uint8_t *)&v26, 2u);
      }
    }
    else
    {
      v18 = *p_updateCurrentRequestForTaskStmt;
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)objc_msgSend(v19, "UTF8String"), -1, 0) == 0;

      if ((v18 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateCurrentRequestForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
        {
          if (sqlite3_step(*p_updateCurrentRequestForTaskStmt) != 101)
          {
            v21 = (id)qword_1000C7158;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v24 = objc_msgSend(v6, "identifier");
              v25 = sqlite3_errmsg(self->_dbConnection);
              v26 = 134218242;
              v27 = v24;
              v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to update currentRequest for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }

          }
          sqlite3_reset(*p_updateCurrentRequestForTaskStmt);
          goto LABEL_27;
        }
        v20 = (id)qword_1000C7158;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_msgSend(v6, "identifier");
          v26 = 134217984;
          v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        v20 = (id)qword_1000C7158;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
          v26 = 138412290;
          v27 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);

        }
      }

    }
LABEL_27:

    goto LABEL_28;
  }
  v16 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_28:

}

- (void)_onqueue_updateTLSSupportedProtocolVersionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateTLSSupportedProtocolVersionForTaskStmt;
  sqlite3_stmt *updateTLSSupportedProtocolVersionForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  unsigned int v17;
  NSObject *v18;
  unsigned int v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  int v24;
  id v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = 134218242;
    v25 = objc_msgSend(v6, "identifier");
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateTLSSupportedProtocolVersionForTask: %lu, for session: %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTLSSupportedProtocolVersionForTaskStmt = &self->_updateTLSSupportedProtocolVersionForTaskStmt;
    updateTLSSupportedProtocolVersionForTaskStmt = self->_updateTLSSupportedProtocolVersionForTaskStmt;
    if (!updateTLSSupportedProtocolVersionForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET tls_minimum_supported_protocol_version = ?, tls_maximum_supported_protocol_version = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateTLSSupportedProtocolVersionForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateTLSSupportedProtocolVersionForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_33;
      }
      updateTLSSupportedProtocolVersionForTaskStmt = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    }
    if (sqlite3_bind_int(updateTLSSupportedProtocolVersionForTaskStmt, 1, (int)objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion");
        v24 = 134217984;
        v25 = (id)v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_27:

      goto LABEL_33;
    }
    if (sqlite3_bind_int(*p_updateTLSSupportedProtocolVersionForTaskStmt, 2, (int)objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion");
        v24 = 134217984;
        v25 = (id)v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    v15 = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v24 = 138412290;
        v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);

      }
      goto LABEL_27;
    }
    if (sqlite3_bind_int(*p_updateTLSSupportedProtocolVersionForTaskStmt, 4, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v24 = 134217984;
        v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_step(*p_updateTLSSupportedProtocolVersionForTaskStmt) != 101)
    {
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v6, "identifier");
        v23 = sqlite3_errmsg(self->_dbConnection);
        v24 = 134218242;
        v25 = v22;
        v26 = 2080;
        v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update TLSSupportedProtocolVersions for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }

    }
    sqlite3_reset(*p_updateTLSSupportedProtocolVersionForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_33:

}

- (void)_onqueue_updateBytesPerSecondLimitForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateBytesPerSecondLimitForTaskStmt;
  sqlite3_stmt *updateBytesPerSecondLimitForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218242;
    v24 = objc_msgSend(v6, "identifier");
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateBytesPerSecondLimitForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateBytesPerSecondLimitForTaskStmt = &self->_updateBytesPerSecondLimitForTaskStmt;
    updateBytesPerSecondLimitForTaskStmt = self->_updateBytesPerSecondLimitForTaskStmt;
    if (!updateBytesPerSecondLimitForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET bytes_per_second_limit = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateBytesPerSecondLimitForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateBytesPerSecondLimitForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateBytesPerSecondLimitForTaskStmt = *p_updateBytesPerSecondLimitForTaskStmt;
    }
    if (sqlite3_bind_int64(updateBytesPerSecondLimitForTaskStmt, 1, (sqlite3_int64)objc_msgSend(v6, "bytesPerSecondLimit")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v6, "bytesPerSecondLimit");
        v23 = 134217984;
        v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind bytesPerSecondLimit (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    v15 = *p_updateBytesPerSecondLimitForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v23 = 138412290;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateBytesPerSecondLimitForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v6, "identifier");
        v23 = 134217984;
        v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateBytesPerSecondLimitForTaskStmt) != 101)
    {
      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        v24 = v21;
        v25 = 2080;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update bytesPerSecondLimit for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }

    }
    sqlite3_reset(*p_updateBytesPerSecondLimitForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:

}

- (void)_onqueue_updateLoadingPriorityForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateLoadingPriorityForTaskStmt;
  sqlite3_stmt *updateLoadingPriorityForTaskStmt;
  double v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  sqlite3_stmt *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  int v24;
  id v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = 134218242;
    v25 = objc_msgSend(v6, "identifier");
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateLoadingPriorityForTask: %lu for session: %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateLoadingPriorityForTaskStmt = &self->_updateLoadingPriorityForTaskStmt;
    updateLoadingPriorityForTaskStmt = self->_updateLoadingPriorityForTaskStmt;
    if (!updateLoadingPriorityForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET loading_priority = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateLoadingPriorityForTaskStmt, 0))
      {
        v15 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to init _updateLoadingPriorityForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_29;
      }
      updateLoadingPriorityForTaskStmt = *p_updateLoadingPriorityForTaskStmt;
    }
    objc_msgSend(v6, "loadingPriority");
    if (sqlite3_bind_double(updateLoadingPriorityForTaskStmt, 1, v12))
    {
      v13 = (id)qword_1000C7158;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "loadingPriority");
        v24 = 134217984;
        v25 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind loadingPriority (%f) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    v16 = *p_updateLoadingPriorityForTaskStmt;
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v16) = sqlite3_bind_text(v16, 2, (const char *)objc_msgSend(v17, "UTF8String"), -1, 0) == 0;

    if ((v16 & 1) == 0)
    {
      v13 = (id)qword_1000C7158;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v24 = 138412290;
        v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateLoadingPriorityForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v13 = (id)qword_1000C7158;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v24 = 134217984;
        v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateLoadingPriorityForTaskStmt) != 101)
    {
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v6, "identifier");
        v23 = sqlite3_errmsg(self->_dbConnection);
        v24 = 134218242;
        v25 = v22;
        v26 = 2080;
        v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update loadingPriority for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }

    }
    sqlite3_reset(*p_updateLoadingPriorityForTaskStmt);
  }
  else
  {
    v14 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_29:

}

- (void)_onqueue_updateExpectedProgressTargetForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateExpectedProgressTargetForTaskStmt;
  sqlite3_stmt *updateExpectedProgressTargetForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218242;
    v24 = objc_msgSend(v6, "identifier");
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateExpectedProgressTargetForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateExpectedProgressTargetForTaskStmt = &self->_updateExpectedProgressTargetForTaskStmt;
    updateExpectedProgressTargetForTaskStmt = self->_updateExpectedProgressTargetForTaskStmt;
    if (!updateExpectedProgressTargetForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET expected_progress_target = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateExpectedProgressTargetForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateExpectedProgressTargetForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateExpectedProgressTargetForTaskStmt = *p_updateExpectedProgressTargetForTaskStmt;
    }
    if (sqlite3_bind_int64(updateExpectedProgressTargetForTaskStmt, 1, (int)objc_msgSend(v6, "expectedProgressTarget")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v6, "expectedProgressTarget");
        v23 = 134217984;
        v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind expectedProgressTarget (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    v15 = *p_updateExpectedProgressTargetForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v23 = 138412290;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateExpectedProgressTargetForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v6, "identifier");
        v23 = 134217984;
        v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateExpectedProgressTargetForTaskStmt) != 101)
    {
      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        v24 = v21;
        v25 = 2080;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update expectedProgressTarget for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }

    }
    sqlite3_reset(*p_updateExpectedProgressTargetForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:

}

- (void)_onqueue_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_deleteEntriesForSessionStmt;
  sqlite3_stmt *deleteEntriesForSessionStmt;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  const char *v19;
  char *errmsg;
  uint8_t buf[4];
  char *v22;

  v6 = a3;
  v7 = (char *)a4;
  v8 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_deleteAllTaskEntriesForSession session: %@", buf, 0xCu);
  }
  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    v14 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }
    goto LABEL_23;
  }
  p_deleteEntriesForSessionStmt = &self->_deleteEntriesForSessionStmt;
  deleteEntriesForSessionStmt = self->_deleteEntriesForSessionStmt;
  if (!deleteEntriesForSessionStmt)
  {
    if (sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks WHERE session_id = ?", -1, &self->_deleteEntriesForSessionStmt, 0))
    {
      v15 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "Failed to init _deleteEntriesForSessionStmt for session_tasks";
        v16 = v15;
        v17 = 2;
LABEL_22:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v13, buf, v17);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    deleteEntriesForSessionStmt = *p_deleteEntriesForSessionStmt;
  }
  if (sqlite3_bind_text(deleteEntriesForSessionStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0))
  {
    v12 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      v13 = "Failed to bind sessionID (%@) to the select statement";
LABEL_21:
      v16 = v12;
      v17 = 12;
      goto LABEL_22;
    }
  }
  else
  {
    if (sqlite3_step(*p_deleteEntriesForSessionStmt) != 101)
    {
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = sqlite3_errmsg(self->_dbConnection);
        *(_DWORD *)buf = 136315138;
        v22 = (char *)v19;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to delete tasks from db. Error= %s", buf, 0xCu);
      }

    }
    sqlite3_reset(*p_deleteEntriesForSessionStmt);
    errmsg = 0;
    if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0, 0, &errmsg))
    {
      v12 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = errmsg;
        v13 = "Failed to auto vacuum when garbage collecting: %s";
        goto LABEL_21;
      }
    }
  }
LABEL_23:

}

- (void)_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
  sqlite3_stmt *updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  NSObject *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  int v23;
  id v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218242;
    v24 = objc_msgSend(v6, "identifier");
    v25 = 2112;
    v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    if (!updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET responded_to_will_begin_delayed_request_callback = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    }
    if (sqlite3_bind_int(updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 1, (int)objc_msgSend(v6, "respondedToWillBeginDelayedRequestCallback")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v6, "respondedToWillBeginDelayedRequestCallback");
        v23 = 134217984;
        v24 = (id)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    v15 = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v23 = 138412290;
        v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);

      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v6, "identifier");
        v23 = 134217984;
        v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt) != 101)
    {
      v17 = (id)qword_1000C7158;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        v24 = v21;
        v25 = 2080;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update respondedToWillBeginDelayedRequestCallback for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }

    }
    sqlite3_reset(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:

}

- (void)_onqueue_updateDownloadFileURLForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateDownloadFileURLForTaskStmt;
  void *v11;
  void *v12;
  sqlite3_stmt *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  sqlite3_stmt *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  const char *v25;
  int v26;
  id v27;
  __int16 v28;
  const char *v29;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v26 = 134218242;
    v27 = objc_msgSend(v6, "identifier");
    v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateDownloadFileURLForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateDownloadFileURLForTaskStmt = &self->_updateDownloadFileURLForTaskStmt;
    if (!self->_updateDownloadFileURLForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET download_file_url = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateDownloadFileURLForTaskStmt, 0))
    {
      v18 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to init _updateDownloadFileURLForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_22;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadFileURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0));

    v13 = *p_updateDownloadFileURLForTaskStmt;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_bind_blob(v13, 1, objc_msgSend(v14, "bytes"), (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v15 = (id)qword_1000C7158;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadFileURL"));
        v26 = 138412290;
        v27 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind downloadFileURL (%@) to the select statement", (uint8_t *)&v26, 0xCu);

      }
    }
    else
    {
      v19 = *p_updateDownloadFileURLForTaskStmt;
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
      LOBYTE(v19) = sqlite3_bind_text(v19, 2, (const char *)objc_msgSend(v20, "UTF8String"), -1, 0) == 0;

      if ((v19 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateDownloadFileURLForTaskStmt, 3, (int)objc_msgSend(v6, "identifier")))
        {
          if (sqlite3_step(*p_updateDownloadFileURLForTaskStmt) != 101)
          {
            v22 = (id)qword_1000C7158;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v24 = objc_msgSend(v6, "identifier");
              v25 = sqlite3_errmsg(self->_dbConnection);
              v26 = 134218242;
              v27 = v24;
              v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to update downloadFileURL for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }

          }
          sqlite3_reset(*p_updateDownloadFileURLForTaskStmt);
          goto LABEL_21;
        }
        v15 = (id)qword_1000C7158;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_msgSend(v6, "identifier");
          v26 = 134217984;
          v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        v15 = (id)qword_1000C7158;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
          v26 = 138412290;
          v27 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);

        }
      }
    }

LABEL_21:
    goto LABEL_22;
  }
  v17 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_22:

}

- (void)_onqueue_updateSuspendPathEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateSuspendPathEntriesForTaskStmt;
  sqlite3_stmt *updateSuspendPathEntriesForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  int v24;
  id v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = 134218242;
    v25 = objc_msgSend(v6, "identifier");
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateSuspendPathEntriesForTask: %lu for session %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSuspendPathEntriesForTaskStmt = &self->_updateSuspendPathEntriesForTaskStmt;
    updateSuspendPathEntriesForTaskStmt = self->_updateSuspendPathEntriesForTaskStmt;
    if (!updateSuspendPathEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET state = ?, suspend_count = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateSuspendPathEntriesForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateSuspendPathEntriesForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_33;
      }
      updateSuspendPathEntriesForTaskStmt = *p_updateSuspendPathEntriesForTaskStmt;
    }
    if (sqlite3_bind_int64(updateSuspendPathEntriesForTaskStmt, 1, (sqlite3_int64)objc_msgSend(v6, "state")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v6, "state");
        v24 = 134217984;
        v25 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind state (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_27:

      goto LABEL_33;
    }
    if (sqlite3_bind_int64(*p_updateSuspendPathEntriesForTaskStmt, 2, (sqlite3_int64)objc_msgSend(v6, "suspendCount")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_msgSend(v6, "suspendCount");
        v24 = 134217984;
        v25 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind suspendCount (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    v15 = *p_updateSuspendPathEntriesForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v24 = 138412290;
        v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);

      }
      goto LABEL_27;
    }
    if (sqlite3_bind_int(*p_updateSuspendPathEntriesForTaskStmt, 4, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v6, "identifier");
        v24 = 134217984;
        v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_step(*p_updateSuspendPathEntriesForTaskStmt) != 101)
    {
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v6, "identifier");
        v23 = sqlite3_errmsg(self->_dbConnection);
        v24 = 134218242;
        v25 = v22;
        v26 = 2080;
        v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update suspend related entries for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }

    }
    sqlite3_reset(*p_updateSuspendPathEntriesForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_33:

}

- (void)_onqueue_updateSetPriorityEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6;
  char *v7;
  NSObject *v8;
  sqlite3 *dbConnection;
  sqlite3_stmt **p_updateSetPriorityEntriesForTaskStmt;
  sqlite3_stmt *updateSetPriorityEntriesForTaskStmt;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  sqlite3_stmt *v15;
  id v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  int v25;
  id v26;
  __int16 v27;
  const char *v28;

  v6 = a3;
  v7 = (char *)a4;
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v25 = 134218242;
    v26 = objc_msgSend(v6, "identifier");
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateSetPriorityEntriesForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSetPriorityEntriesForTaskStmt = &self->_updateSetPriorityEntriesForTaskStmt;
    updateSetPriorityEntriesForTaskStmt = self->_updateSetPriorityEntriesForTaskStmt;
    if (!updateSetPriorityEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET discretionary = ?, base_priority = ?, base_priority_set_explicitly = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateSetPriorityEntriesForTaskStmt, 0))
      {
        v14 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateSetPriorityEntriesForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
        }
        goto LABEL_37;
      }
      updateSetPriorityEntriesForTaskStmt = *p_updateSetPriorityEntriesForTaskStmt;
    }
    if (sqlite3_bind_int(updateSetPriorityEntriesForTaskStmt, 1, (int)objc_msgSend(v6, "isDiscretionary")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v6, "isDiscretionary");
        v25 = 134217984;
        v26 = (id)v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind discretionary (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
LABEL_31:

      goto LABEL_37;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 2, (int)objc_msgSend(v6, "basePriority")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(v6, "basePriority");
        v25 = 134217984;
        v26 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind basePriority (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 3, (int)objc_msgSend(v6, "basePrioritySetExplicitly")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v6, "basePrioritySetExplicitly");
        v25 = 134217984;
        v26 = (id)v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind basePrioritySetExplicitly (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    v15 = *p_updateSetPriorityEntriesForTaskStmt;
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID")));
    LOBYTE(v15) = sqlite3_bind_text(v15, 4, (const char *)objc_msgSend(v16, "UTF8String"), -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v25 = 138412290;
        v26 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);

      }
      goto LABEL_31;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 5, (int)objc_msgSend(v6, "identifier")))
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v6, "identifier");
        v25 = 134217984;
        v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    if (sqlite3_step(*p_updateSetPriorityEntriesForTaskStmt) != 101)
    {
      v19 = (id)qword_1000C7158;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v6, "identifier");
        v24 = sqlite3_errmsg(self->_dbConnection);
        v25 = 134218242;
        v26 = v23;
        v27 = 2080;
        v28 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update setPriority related entries for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
      }

    }
    sqlite3_reset(*p_updateSetPriorityEntriesForTaskStmt);
  }
  else
  {
    v13 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
    }
  }
LABEL_37:

}

- (id)_initDB:(id)a3
{
  id v5;
  NSObject *v6;
  NDTaskStorageDB *v7;
  NDTaskStorageDB *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  NSObject *v15;
  NDTaskStorageDB *v16;
  NDTaskStorageDB *v17;
  NSObject *v18;
  _QWORD v20[4];
  NDTaskStorageDB *v21;
  __int128 *p_buf;
  objc_super v23;
  __int128 buf;
  uint64_t v25;
  char v26;

  v5 = a3;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_initDB at dir: %@", (uint8_t *)&buf, 0xCu);
  }
  v23.receiver = self;
  v23.super_class = (Class)NDTaskStorageDB;
  v7 = -[NDTaskStorageDB init](&v23, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dbDir, a3);
    v8->_dbConnection = 0;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.nsurlsessiond.session-archive-queue", v12);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v13;

    *(_WORD *)&v8->_dbInitialized = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v26 = 0;
    v15 = v8->_workQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002C5B4;
    v20[3] = &unk_1000B1B08;
    p_buf = &buf;
    v16 = v8;
    v21 = v16;
    dispatch_sync(v15, v20);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v17 = v16;

      _Block_object_dispose(&buf, 8);
      goto LABEL_10;
    }

    _Block_object_dispose(&buf, 8);
  }
  v18 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "_initDB failed", (uint8_t *)&buf, 2u);
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (id)_getAllTasksFromDBForSession:(id)a3 sessionUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NDTaskStorageDB *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C2EC;
  v16[3] = &unk_1000B13E8;
  v17 = v7;
  v18 = self;
  v19 = v6;
  v10 = v8;
  v20 = v10;
  v11 = v6;
  v12 = v7;
  dispatch_sync(workQueue, v16);
  v13 = v20;
  v14 = v10;

  return v14;
}

- (void)_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C2DC;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(workQueue, block);

}

- (void)_deleteAllTaskEntriesInDB
{
  NSObject *v3;
  NSObject *workQueue;
  NSURL *path;
  _QWORD block[5];
  uint8_t buf[4];
  NSURL *v8;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v8 = path;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_deleteAllTaskEntriesInDB at path: %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C2D4;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_cleanupDB
{
  NSObject *v3;
  NSObject *workQueue;
  NSURL *path;
  _QWORD block[5];
  uint8_t buf[4];
  NSURL *v8;

  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v8 = path;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cleanupDB at path: %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C168;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (id)_getAllSessionIDsForBundle:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  NDTaskStorageDB *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BE94;
  block[3] = &unk_1000B20B8;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  dispatch_sync(workQueue, block);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (void)_deleteTaskEntriesWithIdentifiers:(id)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_deleteEntriesWithIdentifiers for session %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002BD5C;
  v16[3] = &unk_1000B13E8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  dispatch_sync(workQueue, v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dbDir, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
