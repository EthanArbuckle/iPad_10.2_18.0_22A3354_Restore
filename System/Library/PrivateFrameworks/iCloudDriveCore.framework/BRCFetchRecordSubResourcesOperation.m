@implementation BRCFetchRecordSubResourcesOperation

- (unint64_t)recordsFetched
{
  return self->_recordsRequested;
}

- (unint64_t)recordsFetchedTotalMetadataSize
{
  return self->_recordsRequestedTotalMetadataSize;
}

- (unint64_t)xattrsFetchedTotalSize
{
  return self->_xattrsFetchedTotalSize;
}

- (id)records
{
  void *v4;
  NSObject *v5;

  if (-[NSMutableDictionary count](self->_subResourceRecordsByID, "count") || self->_pendingChangesStream)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation records].cold.1();

  }
  -[NSMutableDictionary allValues](self->_recordsByID, "allValues");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)movedZoneNames
{
  return self->_movedZoneNames;
}

- (id)initAndScheduleWithServerZone:(id)a3 parentOperation:(id)a4 pendingChangesStream:(id)a5 contentRecordsFetchedInline:(BOOL)a6 sessionContext:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE *v24;
  char v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  dispatch_group_t v41;
  void *v42;
  NSObject *v43;
  const dispatch_source_type_s *v44;
  dispatch_source_t v45;
  void *v46;
  NSObject *v47;
  dispatch_source_t v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD *v52;
  NSObject *v53;
  _QWORD *v54;
  void *v55;
  void (**v56)(id);
  void *v57;
  dispatch_block_t v58;
  void *v59;
  id v60;
  _QWORD *v61;
  NSObject *v62;
  _QWORD *v63;
  void *v64;
  void *v65;
  dispatch_block_t v66;
  void *v68;
  NSObject *v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id location;
  objc_super v77;

  v13 = a3;
  v14 = a4;
  v70 = a5;
  v71 = a7;
  if (!v13 || !v14)
  {
    brc_bread_crumbs();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:].cold.1();

  }
  objc_msgSend(v14, "operationID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("record-fetcher"), "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metadataSyncContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v77.receiver = self;
  v77.super_class = (Class)BRCFetchRecordSubResourcesOperation;
  v19 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v77, sel_initWithName_syncContext_sessionContext_, v17, v18, v71);

  if (v19)
  {
    objc_msgSend(v19, "setNonDiscretionary:", 1);
    v19[629] = a6;
    v20 = (id *)(v19 + 504);
    objc_storeStrong((id *)v19 + 63, a3);
    objc_opt_class();
    v19[626] = objc_opt_isKindOfClass() & 1;
    objc_msgSend(v13, "mangledID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19[626])
    {
      if ((objc_msgSend(v22, "canSaveRecordsDirectlyForDeltaSync") & 1) != 0)
      {
        objc_msgSend(*v20, "failedListItemIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v19 + 627;
        v19[627] = objc_msgSend(v23, "count") == 0;

        goto LABEL_10;
      }
      v25 = 0;
    }
    else
    {
      v25 = objc_msgSend(v22, "canSaveRecordsDirectlyForList");
    }
    v24 = v19 + 627;
    v19[627] = v25;
LABEL_10:
    v26 = objc_msgSend(v22, "canSaveRecordsDirectlyWithDeletes");
    v19[628] = v26;
    if (*v24 && (v26 & 1) == 0 && v19[626])
      *v24 = objc_msgSend(v70, "hasRecordDeletes") ^ 1;
    v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v28 = (void *)*((_QWORD *)v19 + 65);
    *((_QWORD *)v19 + 65) = v27;

    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30 = (void *)*((_QWORD *)v19 + 66);
    *((_QWORD *)v19 + 66) = v29;

    v31 = objc_opt_new();
    v32 = (void *)*((_QWORD *)v19 + 67);
    *((_QWORD *)v19 + 67) = v31;

    v33 = objc_opt_new();
    v34 = (void *)*((_QWORD *)v19 + 68);
    *((_QWORD *)v19 + 68) = v33;

    v35 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v36 = (void *)*((_QWORD *)v19 + 69);
    *((_QWORD *)v19 + 69) = v35;

    objc_storeStrong((id *)v19 + 64, a5);
    objc_msgSend(*v20, "mangledID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v19 + 150) = objc_msgSend(v38, "subResourceFetchLoopCacheSize");

    v39 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v40 = (void *)*((_QWORD *)v19 + 76);
    *((_QWORD *)v19 + 76) = v39;

    if (!v70)
      v19[624] = 2;
    v41 = dispatch_group_create();
    v42 = (void *)*((_QWORD *)v19 + 70);
    *((_QWORD *)v19 + 70) = v41;

    objc_msgSend(v19, "callbackQueue");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (const dispatch_source_type_s *)MEMORY[0x24BDAC9D0];
    v45 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v43);
    v46 = (void *)*((_QWORD *)v19 + 72);
    *((_QWORD *)v19 + 72) = v45;

    objc_msgSend(v19, "callbackQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = dispatch_source_create(v44, 0, 0, v47);
    v49 = (void *)*((_QWORD *)v19 + 74);
    *((_QWORD *)v19 + 74) = v48;

    objc_initWeak(&location, v19);
    v50 = (void *)*((_QWORD *)v19 + 72);
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke;
    v74[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v75, &location);
    v51 = v50;
    v52 = v74;
    v53 = v51;
    v54 = v52;
    v55 = v54;
    v56 = (void (**)(id))MEMORY[0x24BE17840];
    v57 = v54;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v54);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v58 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v57);
    dispatch_source_set_event_handler(v53, v58);

    v59 = (void *)*((_QWORD *)v19 + 74);
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke_7;
    v72[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v73, &location);
    v60 = v59;
    v61 = v72;
    v62 = v60;
    v63 = v61;
    v64 = v63;
    v65 = v63;
    if (*v56)
    {
      (*v56)(v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v66 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v65);
    dispatch_source_set_event_handler(v62, v66);

    dispatch_resume(*((dispatch_object_t *)v19 + 72));
    dispatch_resume(*((dispatch_object_t *)v19 + 74));
    objc_msgSend(v19, "_startWithParentOperation:", v14);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);

  }
  return v19;
}

void __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6[3];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]_block_invoke", 148, v6);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = v6[0];
    objc_msgSend(WeakRetained, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ scheduling xattr fetch%@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "_scheduleXattrFetch");
  __brc_leave_section(v6);

}

void __149__BRCFetchRecordSubResourcesOperation_initAndScheduleWithServerZone_parentOperation_pendingChangesStream_contentRecordsFetchedInline_sessionContext___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6[3];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]_block_invoke", 154, v6);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = v6[0];
    objc_msgSend(WeakRetained, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ scheduling deserialize%@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "_scheduleDeserialize");
  __brc_leave_section(v6);

}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "fetch-record-subresources", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCFetchRecordSubResourcesOperation;
    v5 = -[_BRCOperation shouldRetryForError:](&v7, sel_shouldRetryForError_, v4);
  }

  return v5;
}

- (void)addRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BRCFetchSubResourceRecord *v14;
  BRCFetchSubResourceRecord *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  BRCFetchSubResourceRecord *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  BRCFetchSubResourceRecord *v32;
  BRCFetchSubResourceRecord *v33;
  NSObject *v34;
  BRCPendingChangesStream *pendingChangesStream;
  BRCFetchSubResourceRecord *v36;
  void *v37;
  void *v38;
  void *v39;
  BRCFetchSubResourceRecord *v40;
  BRCFetchSubResourceRecord *v41;
  void *v42;
  void *v43;
  BRCFetchSubResourceRecord *v44;
  void *v45;
  BRCFetchSubResourceRecord *v46;
  NSObject *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  BRCFetchSubResourceRecord *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  int v74;
  BRCFetchSubResourceRecord *v75;
  NSObject *v76;
  void *v77;
  id v78;
  BRCFetchSubResourceRecord *v79;
  BRCFetchSubResourceRecord *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  BRCFetchSubResourceRecord *v84;
  BRCPendingChangesStream *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  BRCFetchSubResourceRecord *v93;
  NSObject *v94;
  void *v95;
  BRCFetchSubResourceRecord *v96;
  NSObject *v97;
  void *v98;
  BRCFetchSubResourceRecord *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  BRCFetchSubResourceRecord *v104;
  BRCFetchSubResourceRecord *v105;
  NSObject *v106;
  BOOL v107;
  void *v108;
  void *v109;
  BRCFetchSubResourceRecord *v110;
  BRCFetchSubResourceRecord *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  BRCFetchSubResourceRecord *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  BRCFetchSubResourceRecord *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  NSObject *v135;
  void *v136;
  NSObject *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  BRCFetchSubResourceRecord *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  BRCFetchSubResourceRecord *v148;
  BRCFetchSubResourceRecord *v149;
  uint8_t buf[4];
  id v151;
  __int16 v152;
  BRCFetchSubResourceRecord *v153;
  __int16 v154;
  BRCFetchSubResourceRecord *v155;
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[BRCServerZone session](self->_serverZone, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v9);

  }
  -[BRCServerZone session](self->_serverZone, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "serialQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v13);

  }
  if (!self->_error && (-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (self->_isDoneFetchingRecords)
    {
      brc_bread_crumbs();
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();

    }
    if ((objc_msgSend(v4, "brc_isInterestingRecordForSyncDown") & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "recordName");
        v32 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v151 = v30;
        v152 = 2112;
        v153 = v32;
        v154 = 2112;
        v155 = v15;
        _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ got a record we're not interested in: '%@'%@", buf, 0x20u);

      }
      goto LABEL_100;
    }
    objc_msgSend(v4, "processAppLibraryDataWithMovedZoneNames:serverZone:isDeltaSync:", self->_movedZoneNames, self->_serverZone, self->_isDeltaSync);
    if ((objc_msgSend(v4, "brc_isInterestingRecordForSave") & 1) == 0)
    {
      brc_bread_crumbs();
      v33 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordID");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "recordName");
        v104 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v151 = v102;
        v152 = 2112;
        v153 = v104;
        v154 = 2112;
        v155 = v33;
        _os_log_debug_impl(&dword_230455000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ ignoring record we're not interested in saving named: %@%@", buf, 0x20u);

      }
      pendingChangesStream = self->_pendingChangesStream;
      objc_msgSend(v4, "recordID");
      v15 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      -[BRCPendingChangesStream unblockRecordSavesWaitingOnRecordID:](pendingChangesStream, "unblockRecordSavesWaitingOnRecordID:", v15);
      goto LABEL_100;
    }
    ++self->_recordsRequested;
    self->_recordsRequestedTotalMetadataSize += objc_msgSend(v4, "size");
    objc_msgSend(v4, "recordID");
    v14 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!self->_contentRecordsFetchedInline)
    {
      -[BRCFetchSubResourceRecord recordName](v14, "recordName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "hasPrefix:", CFSTR("documentStructure/")))
      {
        objc_msgSend(v16, "substringFromIndex:", objc_msgSend(CFSTR("documentStructure/"), "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("documentContent/"), "stringByAppendingString:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = objc_alloc(MEMORY[0x24BDB91E8]);
        objc_msgSend(v4, "recordID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "zoneID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v19, "initWithRecordName:zoneID:", v18, v21);

        -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:](self, "addRecordIDToDeserialize:", v22);
        v16 = (void *)v18;
      }

    }
    objc_msgSend(v4, "share");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23
      || (v24 = (void *)v23, v25 = -[BRCServerZone state](self->_serverZone, "state"), v24, (v25 & 4) != 0))
    {
      v36 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v4, "share");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recordID");
    v27 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

    }
    else if (!-[BRCPendingChangesStream hasFetchRecordByID:](self->_pendingChangesStream, "hasFetchRecordByID:", v27))
    {
      brc_bread_crumbs();
      v105 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v151 = v118;
        v152 = 2112;
        v153 = v27;
        v154 = 2112;
        v155 = v105;
        _os_log_debug_impl(&dword_230455000, v106, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs to fetch shareID %@%@", buf, 0x20u);

      }
      v36 = v27;
      goto LABEL_27;
    }
    v36 = 0;
LABEL_27:

LABEL_28:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xattr"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedValues");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("xattrSignature"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v147 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v39)
      {
        v40 = v39;
      }
      else
      {
        objc_msgSend(v37, "signature");
        v40 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      }
      v41 = v40;
      -[BRCServerZone session](self->_serverZone, "session");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stageRegistry");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "urlForXattrSignature:", v41);
      v44 = v41;
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v45, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
      {
        v46 = v44;
        v149 = 0;
      }
      else
      {
        v149 = v44;
        brc_bread_crumbs();
        v46 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          -[BRCFetchRecordSubResourcesOperation name](self, "name");
          v113 = v39;
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v151 = v114;
          v152 = 2112;
          v153 = v149;
          v154 = 2112;
          v155 = v46;
          _os_log_debug_impl(&dword_230455000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ needs to fetch xattr signature %@%@", buf, 0x20u);

          v39 = v113;
        }

      }
    }
    else
    {
      v149 = 0;
    }
    objc_msgSend(v4, "recordType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("content"));

    v148 = v36;
    v146 = v39;
    if (v49)
    {
      -[BRCFetchSubResourceRecord recordName](v15, "recordName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v50, "hasPrefix:", CFSTR("documentContent/")) & 1) == 0)
      {
        v125 = v50;
        brc_bread_crumbs();
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.7();

        v50 = v125;
      }
      v143 = v50;
      objc_msgSend(v50, "substringFromIndex:", objc_msgSend(CFSTR("documentContent/"), "length"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v53 = objc_alloc(MEMORY[0x24BDB91E8]);
      -[BRCFetchSubResourceRecord zoneID](v15, "zoneID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = (void *)v52;
      v55 = (void *)objc_msgSend(v53, "initWithRecordName:zoneID:", v52, v54);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_subResourceRecordsByID, "objectForKeyedSubscript:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        brc_bread_crumbs();
        v57 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v55, "recordName");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recordID");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "recordName");
          v110 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v151 = v109;
          v152 = 2112;
          v153 = v110;
          v154 = 2112;
          v155 = v57;
          _os_log_debug_impl(&dword_230455000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Release block %@ on %@%@", buf, 0x20u);

        }
        objc_msgSend(v56, "recordIDBlockingSave");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recordID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "isEqual:", v60);

        if ((v61 & 1) != 0)
        {
          objc_msgSend(v56, "setRecordIDBlockingSave:", 0);
          -[BRCFetchRecordSubResourcesOperation _markSubResourceRecordAsFetchedIfNecessary:](self, "_markSubResourceRecordAsFetchedIfNecessary:", v56);
        }
        else
        {
          brc_bread_crumbs();
          v80 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "recordID");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "recordName");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "recordIDBlockingSave");
            v141 = v80;
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "recordName");
            v84 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v151 = v82;
            v152 = 2112;
            v153 = v84;
            v154 = 2112;
            v155 = v141;
            _os_log_impl(&dword_230455000, v81, OS_LOG_TYPE_DEFAULT, "[WARNING] Expected recordIDBlockingSave %@ got %@%@", buf, 0x20u);

            v80 = v141;
          }

        }
      }
      v85 = self->_pendingChangesStream;
      objc_msgSend(v4, "recordID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPendingChangesStream unblockRecord:waitingOnRecord:](v85, "unblockRecord:waitingOnRecord:", v55, v86);

      if (-[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone")
        && (objc_msgSend(v4, "share"), (v87 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v55);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v145;
        if (v88)
        {

          v78 = 0;
          v36 = v148;
LABEL_83:

          v79 = v149;
          v68 = v143;
          goto LABEL_84;
        }
        v91 = -[BRCPendingChangesStream hasFetchRecordByID:](self->_pendingChangesStream, "hasFetchRecordByID:", v55);

        if (!v91)
        {
          brc_bread_crumbs();
          v93 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v94 = objc_claimAutoreleasedReturnValue();
          v36 = v148;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "recordID");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "recordName");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "recordName");
            v117 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v151 = v116;
            v152 = 2112;
            v153 = v117;
            v154 = 2112;
            v155 = v93;
            _os_log_debug_impl(&dword_230455000, v94, OS_LOG_TYPE_DEBUG, "[DEBUG] Block %@ on %@%@", buf, 0x20u);

            v36 = v148;
          }

          v78 = v55;
          goto LABEL_82;
        }
      }
      v78 = 0;
      v36 = v148;
LABEL_82:
      v71 = v145;
      goto LABEL_83;
    }
    objc_msgSend(v4, "recordType");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v62, "isEqualToString:", CFSTR("structure")) & 1) != 0)
    {
      -[BRCFetchSubResourceRecord recordName](v15, "recordName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "hasPrefix:", CFSTR("documentStructure/"));

      if (v64)
      {
        -[BRCFetchSubResourceRecord recordName](v15, "recordName");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "substringFromIndex:", objc_msgSend(CFSTR("documentStructure/"), "length"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("documentContent/"), "stringByAppendingString:", v66);
        v67 = objc_claimAutoreleasedReturnValue();

        v68 = (void *)v67;
        v69 = objc_alloc(MEMORY[0x24BDB91E8]);
        -[BRCFetchSubResourceRecord zoneID](v15, "zoneID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (id)objc_msgSend(v69, "initWithRecordName:zoneID:", v68, v70);

        if (-[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone"))
        {
          objc_msgSend(v4, "share");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {

            goto LABEL_107;
          }
        }
        -[NSMutableDictionary objectForKeyedSubscript:](self->_subResourceRecordsByID, "objectForKeyedSubscript:", v71);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v149;
        if (!v92)
        {
          v107 = -[BRCPendingChangesStream hasRecordIDBlockedOnSubResources:](self->_pendingChangesStream, "hasRecordIDBlockedOnSubResources:", v71);

          if (!v107)
          {
            brc_bread_crumbs();
            v111 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v112 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v4, "recordID");
              v144 = v68;
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "recordName");
              v122 = v71;
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v122, "recordName");
              v124 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v151 = v123;
              v152 = 2112;
              v153 = v124;
              v154 = 2112;
              v155 = v111;
              _os_log_debug_impl(&dword_230455000, v112, OS_LOG_TYPE_DEBUG, "[DEBUG] Block %@ on %@%@", buf, 0x20u);

              v71 = v122;
              v68 = v144;
            }

            v71 = v71;
            v78 = v71;
            goto LABEL_111;
          }
LABEL_107:
          v78 = 0;
LABEL_111:
          v79 = v149;
          goto LABEL_84;
        }

        v78 = 0;
LABEL_84:

LABEL_85:
        if (v36 || v79 || v78)
        {
          v96 = -[BRCFetchSubResourceRecord initWithChangedRecord:recordIDNeedingFetch:xattrSignatureNeedingFetch:recordIDBlockingSave:]([BRCFetchSubResourceRecord alloc], "initWithChangedRecord:recordIDNeedingFetch:xattrSignatureNeedingFetch:recordIDBlockingSave:", v4, v36, v79, v78);
          if (-[NSMutableArray containsObject:](self->_deletedShareIDs, "containsObject:", v15))
          {
            brc_bread_crumbs();
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v135 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v135, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.3();

          }
          if (-[NSMutableArray containsObject:](self->_deletedRecordIDs, "containsObject:", v15))
          {
            brc_bread_crumbs();
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v137 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v137, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.2();

          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v15);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (v100)
          {
            brc_bread_crumbs();
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v139 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.1();

          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subResourceRecordsByID, "setObject:forKeyedSubscript:", v96, v15);
          -[NSMutableArray removeObject:](self->_deletedShareIDs, "removeObject:", v15);
          -[NSMutableArray removeObject:](self->_deletedRecordIDs, "removeObject:", v15);
          -[NSMutableDictionary removeObjectForKey:](self->_recordsByID, "removeObjectForKey:", v15);
          brc_bread_crumbs();
          v97 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            -[BRCFetchRecordSubResourcesOperation name](self, "name");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v151 = v108;
            v152 = 2112;
            v153 = v96;
            v154 = 2112;
            v155 = (BRCFetchSubResourceRecord *)v97;
            _os_log_debug_impl(&dword_230455000, v101, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record changed %@ which needs subResources fetched%@", buf, 0x20u);

          }
          v36 = v148;
        }
        else
        {
          if (-[NSMutableArray containsObject:](self->_deletedShareIDs, "containsObject:", v15))
          {
            brc_bread_crumbs();
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.3();

            v36 = v148;
          }
          if (-[NSMutableArray containsObject:](self->_deletedRecordIDs, "containsObject:", v15))
          {
            brc_bread_crumbs();
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v131 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.2();

            v36 = v148;
          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v15);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          if (v95)
          {
            brc_bread_crumbs();
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v133 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_FAULT))
              -[BRCFetchRecordSubResourcesOperation addRecord:].cold.1();

            v36 = v148;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordsByID, "setObject:forKeyedSubscript:", v4, v15);
          -[NSMutableArray removeObject:](self->_deletedShareIDs, "removeObject:", v15);
          -[NSMutableArray removeObject:](self->_deletedRecordIDs, "removeObject:", v15);
          -[NSMutableDictionary removeObjectForKey:](self->_subResourceRecordsByID, "removeObjectForKey:", v15);
          brc_bread_crumbs();
          v96 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            -[BRCFetchRecordSubResourcesOperation name](self, "name");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "debugDescription");
            v99 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v151 = v98;
            v152 = 2112;
            v153 = v99;
            v154 = 2112;
            v155 = v96;
            _os_log_debug_impl(&dword_230455000, v97, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record changed %@%@", buf, 0x20u);

          }
        }

LABEL_100:
        goto LABEL_101;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "recordType");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "isEqualToString:", *MEMORY[0x24BDB8F28]);

    if (!v74)
    {
      v78 = 0;
      v79 = v149;
      goto LABEL_85;
    }
    -[BRCFetchSubResourceRecord brc_shareItemID](v15, "brc_shareItemID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
    v71 = (id)objc_claimAutoreleasedReturnValue();
    if (!v71)
    {
      brc_bread_crumbs();
      v75 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v151 = v4;
        v152 = 2112;
        v153 = v75;
        _os_log_impl(&dword_230455000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't determine record type for root share record %@%@", buf, 0x16u);
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v71, "isEqualToString:", *MEMORY[0x24BE174E8]))
    {
      objc_msgSend(v68, "structureRecordIDForItemType:zone:aliasTargetZoneIsShared:", 0, self->_serverZone, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCServerZone zoneID](self->_serverZone, "zoneID");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "contentsRecordIDInZoneID:", v89);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v77);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v149;
    if (v90)
    {

    }
    else if (!-[BRCPendingChangesStream hasFetchRecordByID:](self->_pendingChangesStream, "hasFetchRecordByID:", v77))
    {
      v78 = v77;
      goto LABEL_78;
    }
    v78 = 0;
LABEL_78:

    goto LABEL_84;
  }
LABEL_101:

}

- (void)addRecordIDToDeserialize:(id)a3
{
  -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:recordType:](self, "addRecordIDToDeserialize:recordType:", a3, 0);
}

- (void)addRecordIDToDeserialize:(id)a3 recordType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BRCFetchSubResourceRecord *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  BRCFetchSubResourceRecord *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!self->_error && (-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subResourceRecordsByID, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v6),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else if (!-[BRCPendingChangesStream hasFetchRecordByID:](self->_pendingChangesStream, "hasFetchRecordByID:", v6))
    {
      if (self->_isDoneFetchingRecords)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();

      }
      if (-[NSMutableArray containsObject:](self->_deletedShareIDs, "containsObject:", v6))
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.3();

      }
      if (-[NSMutableArray containsObject:](self->_deletedRecordIDs, "containsObject:", v6))
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.2();

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.1();

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subResourceRecordsByID, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:recordType:].cold.1();

      }
      v9 = -[BRCFetchSubResourceRecord initWithRecordIDNeedingFetch:recordType:]([BRCFetchSubResourceRecord alloc], "initWithRecordIDNeedingFetch:recordType:", v6, a4);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subResourceRecordsByID, "setObject:forKeyedSubscript:", v9, v6);
      -[NSMutableArray removeObject:](self->_deletedShareIDs, "removeObject:", v6);
      -[NSMutableArray removeObject:](self->_deletedRecordIDs, "removeObject:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_recordsByID, "removeObjectForKey:", v6);
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v15;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = (BRCFetchSubResourceRecord *)v10;
        _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ scheduling recordID deserialize for %@%@", buf, 0x20u);

      }
      goto LABEL_8;
    }
    brc_bread_crumbs();
    v9 = (BRCFetchSubResourceRecord *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[BRCFetchRecordSubResourcesOperation name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v11;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ has no need to deserialize %@ because we've already fetch it%@", buf, 0x20u);

    }
LABEL_8:

  }
}

- (void)recordIDWasDeleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_error && (-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (!self->_canSaveDirectlyWithDeletes)
      self->_canSaveDirectly = 0;
    if (objc_msgSend(v4, "brc_isZoneRootRecordID"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v8;
        v32 = 2112;
        v33 = v4;
        v34 = 2112;
        v35 = v6;
        _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ Zone root record ID was deleted %@%@", buf, 0x20u);

      }
      -[BRCServerZone clientZone](self->_serverZone, "clientZone");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleRootRecordDeletion");
    }
    else if (objc_msgSend(v4, "brc_isAppLibraryRootRecordID"))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v12;
        v32 = 2112;
        v33 = v4;
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ App library root record ID was deleted %@%@", buf, 0x20u);

      }
      -[BRCServerZone session](self->_serverZone, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerZone session](self->_serverZone, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientTruthWorkloop");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__BRCFetchRecordSubResourcesOperation_recordIDWasDeleted___block_invoke;
      block[3] = &unk_24FE3FA40;
      v28 = v13;
      v29 = v4;
      v9 = v13;
      dispatch_async_and_wait(v15, block);

    }
    else
    {
      if (-[NSMutableArray containsObject:](self->_deletedRecordIDs, "containsObject:", v4))
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.2();

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        brc_bread_crumbs();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecord:].cold.1();

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_subResourceRecordsByID, "objectForKeyedSubscript:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v26 = 528;
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation addRecordIDToDeserialize:recordType:].cold.1();

      }
      -[NSMutableArray addObject:](self->_deletedRecordIDs, "addObject:", v4, v26);
      -[NSMutableDictionary removeObjectForKey:](self->_recordsByID, "removeObjectForKey:", v4);
      -[NSMutableDictionary removeObjectForKey:](self->_subResourceRecordsByID, "removeObjectForKey:", v4);
      brc_bread_crumbs();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[BRCFetchRecordSubResourcesOperation name](self, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v19;
        v32 = 2112;
        v33 = v4;
        v34 = 2112;
        v35 = v9;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ record ID was deleted %@%@", buf, 0x20u);

      }
    }

  }
}

void __58__BRCFetchRecordSubResourcesOperation_recordIDWasDeleted___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "brc_appLibraryRootZoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appLibraryByID:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "clearStateBits:", 134217730);
}

- (void)shareIDWasDeleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_error && (-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsByID, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation shareIDWasDeleted:].cold.2();

    }
    if (-[NSMutableArray containsObject:](self->_deletedShareIDs, "containsObject:", v4))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation shareIDWasDeleted:].cold.1();

    }
    -[NSMutableDictionary removeObjectForKey:](self->_recordsByID, "removeObjectForKey:", v4);
    -[NSMutableArray addObject:](self->_deletedShareIDs, "addObject:", v4);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[BRCFetchRecordSubResourcesOperation name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ share ID was deleted %@%@", buf, 0x20u);

    }
  }

}

- (void)_notifyWhenRecordsAreFetched:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *deserializeGroup;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  BRCFetchRecordSubResourcesOperation *v16;
  id v17;

  v4 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke;
  v15 = &unk_24FE409B8;
  v16 = self;
  v5 = v4;
  v17 = v5;
  v6 = MEMORY[0x2348BA0DC](&v12);
  v7 = (void *)v6;
  if (self->_deserializeGroup)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFetchRecordSubResourcesOperation _notifyWhenRecordsAreFetched:].cold.1();

    deserializeGroup = self->_deserializeGroup;
    -[_BRCOperation callbackQueue](self, "callbackQueue", v12, v13, v14, v15, v16);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(deserializeGroup, v11, v7);

  }
  else
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

}

void __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[71])
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke_cold_1();

    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[71];
    objc_msgSend(v5, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v6, v7, *(dispatch_block_t *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v2, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, *(dispatch_block_t *)(a1 + 40));

  }
}

- (void)notifyWhenCaughtUp:(BOOL)a3 whenRecordsAreFetchedAndFinish:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:].cold.3();

  if (self->_pendingChangesStream)
  {
    if (-[NSMutableDictionary count](self->_recordsByID, "count")
      || -[NSMutableArray count](self->_deletedShareIDs, "count")
      || -[NSMutableArray count](self->_deletedRecordIDs, "count")
      || -[NSMutableDictionary count](self->_subResourceRecordsByID, "count"))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:].cold.2();

    }
    -[BRCFetchRecordSubResourcesOperation _createSubResourceGroupsFromPendingChangesStreamIfNecessary](self, "_createSubResourceGroupsFromPendingChangesStreamIfNecessary");
  }
  else
  {
    -[BRCFetchRecordSubResourcesOperation _prepareToSaveRecords](self, "_prepareToSaveRecords");
  }
  self->_deserializeState = 2;
  if (v4)
  {
    -[BRCFetchRecordSubResourcesOperation _fetchRecordsBlockingSaveIfNecessary](self, "_fetchRecordsBlockingSaveIfNecessary");
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:].cold.1();

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke;
  v14[3] = &unk_24FE40478;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  -[BRCFetchRecordSubResourcesOperation _notifyWhenRecordsAreFetched:](self, "_notifyWhenRecordsAreFetched:", v14);

}

uint64_t __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)notifyWhenRecordsAreFetchedAndFinish:(id)a3
{
  -[BRCFetchRecordSubResourcesOperation notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:](self, "notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:", 1, a3);
}

- (void)_startWithParentOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (self->_isDoneFetchingRecords)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation addRecord:].cold.8();

  }
  dispatch_group_enter((dispatch_group_t)self->_operationGroup);
  objc_msgSend(v4, "addSubOperation:", self);

}

- (void)stopWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v5 && !self->_error)
    objc_storeStrong((id *)&self->_error, a3);
  if (!self->_isDoneFetchingRecords)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[BRCFetchRecordSubResourcesOperation name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ stopping fetching records with error %@%@", (uint8_t *)&v12, 0x20u);

    }
    dispatch_group_leave((dispatch_group_t)self->_operationGroup);
    self->_isDoneFetchingRecords = 1;
  }
  if (self->_deserializeState == 1)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCFetchRecordSubResourcesOperation stopWithError:].cold.1();

    self->_deserializeState = 0;
    dispatch_resume((dispatch_object_t)self->_deserializeSource);
  }

}

- (void)cancel
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] cancelling %@%@", v1);
  OUTLINED_FUNCTION_0();
}

void __45__BRCFetchRecordSubResourcesOperation_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorOperationCancelled");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopWithError:", v2);

}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _xattrFetchingGroup == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)main
{
  NSObject *operationGroup;
  NSObject *v4;
  _QWORD block[5];

  operationGroup = self->_operationGroup;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BRCFetchRecordSubResourcesOperation_main__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_group_notify(operationGroup, v4, block);

}

uint64_t __43__BRCFetchRecordSubResourcesOperation_main__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__BRCFetchRecordSubResourcesOperation_main__block_invoke_2;
  v3[3] = &unk_24FE3FA18;
  v3[4] = v1;
  return objc_msgSend(v1, "_notifyWhenRecordsAreFetched:", v3);
}

uint64_t __43__BRCFetchRecordSubResourcesOperation_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 616));
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id queryFinishedServerTruthCallback;
  id queryFinishedClientTruthCallback;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  objc_super v21;

  v6 = a4;
  v7 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.5();

  if ((-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0 && self->_xattrFetchingGroup)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.4();

  }
  if ((-[BRCFetchRecordSubResourcesOperation isCancelled](self, "isCancelled") & 1) == 0 && self->_deserializeGroup)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.3();

  }
  if (!v6)
  {
    if (self->_queryFinishedServerTruthCallback)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.2();

    }
    if (self->_queryFinishedClientTruthCallback)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation finishWithResult:error:].cold.1();

    }
  }
  queryFinishedServerTruthCallback = self->_queryFinishedServerTruthCallback;
  self->_queryFinishedServerTruthCallback = 0;

  queryFinishedClientTruthCallback = self->_queryFinishedClientTruthCallback;
  self->_queryFinishedClientTruthCallback = 0;

  dispatch_source_cancel((dispatch_source_t)self->_xattrFetchingSource);
  dispatch_source_cancel((dispatch_source_t)self->_deserializeSource);
  v21.receiver = self;
  v21.super_class = (Class)BRCFetchRecordSubResourcesOperation;
  -[_BRCOperation finishWithResult:error:](&v21, sel_finishWithResult_error_, v7, v6);

}

- (BOOL)_willFetchRecordForDeserialize:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  v5 = -[NSMutableOrderedSet containsObject:](self->_loopDetectionCache, "containsObject:", v4);
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCFetchRecordSubResourcesOperation _willFetchRecordForDeserialize:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Fetch loop trying to fetch %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFetchRecordSubResourcesOperation stopWithError:](self, "stopWithError:", v8);

  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_loopDetectionCache, "addObject:", v4);
    if (self->_loopDetectionCacheSize < -[NSMutableOrderedSet count](self->_loopDetectionCache, "count"))
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_loopDetectionCache, "removeObjectAtIndex:", 0);
  }

  return v5 ^ 1;
}

- (void)_scheduleDeserialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _deserializeState != BRCDeserializeStateWaitingForNextBatchSave%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

BOOL __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 40);
}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x2348B9F14]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_4:
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v8;
      v59 = 2112;
      v60 = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] We deserialized record id %@ which was useless because it came later%@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "unblockRecordSavesWaitingOnRecordID:", v8);
    goto LABEL_38;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "hasFetchRecordByID:", v8) & 1) != 0)
    goto LABEL_4;
  if (v7)
  {
    v46 = v10;
    v47 = v9;
    v48 = v7;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v54 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v20, "recordIDNeedingFetch");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v20, "recordIDNeedingFetch");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v8, "isEqual:", v23);

            if (v24)
            {
              objc_msgSend(v20, "setRecordIDNeedingFetch:", 0);
              objc_msgSend(*(id *)(a1 + 32), "_markSubResourceRecordAsFetchedIfNecessary:", v20);
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v17);
    }

    v7 = v48;
    objc_msgSend(*(id *)(a1 + 32), "addRecord:", v48);
LABEL_37:
    v10 = v46;
    v9 = v47;
    goto LABEL_38;
  }
  if (objc_msgSend(v9, "brc_isCloudKitUnknownItemError"))
  {
    v45 = 512;
    v46 = v10;
    v47 = v9;
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_28_cold_1();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v32, "recordIDNeedingFetch", v45);
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = (void *)v33;
            objc_msgSend(v32, "recordIDNeedingFetch");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v8, "isEqual:", v35);

            if (v36)
            {
              objc_msgSend(v32, "setRecordIDNeedingFetch:", 0);
              objc_msgSend(*(id *)(a1 + 32), "_markSubResourceRecordAsFetchedIfNecessary:", v32);
            }
          }
          objc_msgSend(v32, "recordIDBlockingSave");
          v37 = objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v38 = (void *)v37;
            objc_msgSend(v32, "recordIDBlockingSave");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v8, "isEqual:", v39);

            if (v40)
            {
              objc_msgSend(v32, "setRecordIDBlockingSave:", 0);
              objc_msgSend(*(id *)(a1 + 32), "_markSubResourceRecordAsFetchedIfNecessary:", v32);
            }
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      }
      while (v29);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v45), "unblockRecordSavesWaitingOnRecordID:", v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = 0;
    goto LABEL_37;
  }
  if (v9)
  {
    v41 = v10;
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v58 = v44;
      v59 = 2112;
      v60 = v8;
      v61 = 2112;
      v62 = v9;
      v63 = 2112;
      v64 = v42;
      _os_log_error_impl(&dword_230455000, v43, (os_log_type_t)0x90u, "[ERROR] %@ Deserialize record failed for %@ - %@%@", buf, 0x2Au);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v10 = v41;
  }
LABEL_38:
  objc_autoreleasePoolPop(v10);

}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 592), 1uLL);
  if ((objc_msgSend(v4, "brc_isCloudKitCancellationError") & 1) != 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to deserialize records for %@: %@%@", (uint8_t *)&v16, 0x20u);
LABEL_22:

    }
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      _os_log_error_impl(&dword_230455000, v6, (os_log_type_t)0x90u, "[ERROR] failed to deserialize records for %@: %@%@", (uint8_t *)&v16, 0x20u);
      goto LABEL_22;
    }
  }

  if (!v4
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v8 + 624) == 2)
    {
      objc_msgSend((id)v8, "saveRecordsWithQueryCursor:", 0);
    }
    else
    {
      if (!*(_QWORD *)(v8 + 616))
      {
        *(_BYTE *)(v8 + 624) = 1;
        v11 = " but waiting to resume";
        goto LABEL_16;
      }
      *(_BYTE *)(v8 + 624) = 0;
    }
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 592));
    v11 = "";
LABEL_16:
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2080;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ finished fetching record batch to deserialize%s%@", (uint8_t *)&v16, 0x20u);

    }
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v15;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ encountered an operation error so we should stop %@%@", (uint8_t *)&v16, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 624) = 0;
  objc_msgSend(*(id *)(a1 + 32), "stopWithError:", v4);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 592));
LABEL_19:

}

- (BOOL)_markSubResourceRecordAsFetchedIfNecessary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "recordIDNeedingFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(v4, "xattrSignature"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v4, "recordIDBlockingSave");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[BRCFetchRecordSubResourcesOperation name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v13;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v11;
    _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ has sub resource that no longer has info to fetch %@ -> %@%@", (uint8_t *)&v15, 0x2Au);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_subResourceRecordsByID, "removeObjectForKey:", v9);
  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordsByID, "setObject:forKeyedSubscript:", v10, v9);

  v6 = 1;
LABEL_5:

  return v6;
}

- (void)_dump
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allValues](self->_subResourceRecordsByID, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6);
        brc_bread_crumbs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v7;
          v26 = 2112;
          v27 = v8;
          _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@%@", buf, 0x16u);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_recordsByID, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    while (1)
    {
      if (*(_QWORD *)v16 != v13)
        objc_enumerationMutation(v10);
      if (!--v12)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (!v12)
          break;
      }
    }
  }

}

- (void)_scheduleXattrFetch
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] ┣%llx running the xattr fetch operation%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0();
}

BOOL __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 48);
}

void __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v54 = a2;
  v5 = a3;
  v68 = *(_OWORD *)(a1 + 48);
  v58 = a1;
  v69 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v73 = v68;
    v74 = 2112;
    v75 = v43;
    v76 = 2112;
    v77 = (uint64_t)v6;
    _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ finished fetching xattrs%@", buf, 0x20u);

  }
  if (v5)
  {
    if ((objc_msgSend(v5, "brc_isCloudKitCancellationError") & 1) != 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v73 = (uint64_t)v10;
        v74 = 2112;
        v75 = v5;
        v76 = 2112;
        v77 = (uint64_t)v8;
        _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to fetch xattr assets for %@: %@%@", buf, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v73 = (uint64_t)v44;
        v74 = 2112;
        v75 = v5;
        v76 = 2112;
        v77 = (uint64_t)v8;
        _os_log_error_impl(&dword_230455000, v9, (os_log_type_t)0x90u, "[ERROR] failed to fetch xattr assets for %@: %@%@", buf, 0x20u);

      }
    }

    objc_msgSend(*(id *)(a1 + 32), "stopWithError:", v5);
    goto LABEL_46;
  }
  if (objc_msgSend(v54, "count") == *(_QWORD *)(a1 + 72))
  {
    v56 = (void *)objc_opt_new();
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v54, "objectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v12)
    {
      v57 = *(_QWORD *)v65;
      obj = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v65 != v57)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("xattr"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "encryptedValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("xattrSignature"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v15, "signature");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "fileURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (!v19)
            {
              v63 = 0;
              objc_msgSend(*(id *)(v58 + 40), "session");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stageRegistry");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "fileURL");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "saveXattrAtURL:forSignature:error:", v22, v17, &v63);

              if ((v23 & 1) != 0)
              {
                brc_bread_crumbs();
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(*(id *)(v58 + 32), "name");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "brc_hexadecimalString");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v15, "size");
                  *(_DWORD *)buf = 138413058;
                  v73 = (uint64_t)v28;
                  v74 = 2112;
                  v75 = v29;
                  v76 = 2048;
                  v77 = v30;
                  v78 = 2112;
                  v79 = v24;
                  _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saved xattr for signature: %@ sz:%lld%@", buf, 0x2Au);

                }
                objc_msgSend(v56, "addObject:", v17);
              }
              else
              {
                brc_bread_crumbs();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
                {
                  objc_msgSend(*(id *)(v58 + 32), "name");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "brc_hexadecimalString");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v73 = (uint64_t)v31;
                  v74 = 2112;
                  v75 = v32;
                  v76 = 2112;
                  v77 = (uint64_t)v63;
                  v78 = 2112;
                  v79 = v26;
                  _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %@ failed to store xattr for signature: %@ - %@%@", buf, 0x2Au);

                }
                objc_msgSend(*(id *)(v58 + 32), "stopWithError:", v63);
              }
              *(_QWORD *)(*(_QWORD *)(v58 + 32) + 648) += objc_msgSend(v15, "size");

            }
          }

        }
        v11 = obj;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v12);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v58 + 32) + 512), "finishedFetchingXattrSignatures:", v56);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(v58 + 32) + 528), "allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v34)
    {
      v35 = 0;
      v36 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v60 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(v38, "xattrSignature");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v38, "xattrSignature");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v56, "containsObject:", v40);

            if (v41)
            {
              objc_msgSend(v38, "setXattrSignature:", 0);
              objc_msgSend(*(id *)(v58 + 32), "_markSubResourceRecordAsFetchedIfNecessary:", v38);
              ++v35;
            }
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v34);

      if (!v35)
        goto LABEL_42;
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_36_cold_1((uint64_t)v33, v35, v42);

    }
LABEL_42:

    v5 = 0;
    goto LABEL_46;
  }
  brc_bread_crumbs();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    v51 = objc_msgSend(v54, "count");
    v52 = *(void **)(v58 + 72);
    objc_msgSend(*(id *)(v58 + 32), "name");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v73 = v51;
    v74 = 2048;
    v75 = v52;
    v76 = 2112;
    v77 = (uint64_t)v53;
    v78 = 2112;
    v79 = v45;
    _os_log_fault_impl(&dword_230455000, v46, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Received %lu xattr records instead of expected %lu records for %@%@", buf, 0x2Au);

  }
  v47 = (void *)MEMORY[0x24BDD1540];
  v48 = objc_msgSend(v54, "count");
  v49 = *(_QWORD *)(v58 + 72);
  objc_msgSend(*(id *)(v58 + 32), "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Received %lu xattr records instead of expected %lu records for %@"), v48, v49, v50);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v58 + 32), "stopWithError:", v5);
LABEL_46:
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(v58 + 32) + 576));
  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(v58 + 32) + 576), 1uLL);
  __brc_leave_section((uint64_t *)&v68);

}

- (void)_createSubResourceGroupsFromPendingChangesStreamIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Creating _deserializeGroup because we have more records to deserialize in _pendingChangesStream%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (int64_t)_compareRecordsForSaveWithFirstRecord:(id)a3 secondRecord:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "recordType") != 3 && objc_msgSend(v6, "recordType") == 3)
    goto LABEL_7;
  if (objc_msgSend(v5, "recordType") == 3 && objc_msgSend(v6, "recordType") != 3)
  {
LABEL_11:
    v7 = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "recordType") == 2 || objc_msgSend(v6, "recordType") != 2)
  {
    if (objc_msgSend(v5, "recordType") != 2 || objc_msgSend(v6, "recordType") == 2)
    {
      v7 = 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  v7 = -1;
LABEL_12:

  return v7;
}

- (void)_prepareToSaveRecords
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138413314;
  v7 = v5;
  v8 = 2048;
  v9 = OUTLINED_FUNCTION_9_5(520);
  v10 = 2048;
  v11 = OUTLINED_FUNCTION_9_5(528);
  v12 = 2048;
  v13 = OUTLINED_FUNCTION_9_5(552);
  v14 = 2112;
  v15 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ preparing to save record batch with %lu in memory items %lu subresource items %lu moved zone names%@", (uint8_t *)&v6, 0x34u);

}

uint64_t __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareRecordsForSaveWithFirstRecord:secondRecord:", a2, a3);
}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;

  v2 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_2;
  v15[3] = &unk_24FE49BC0;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v16 = v4;
  v17 = v5;
  v10 = *(_OWORD *)(a1 + 56);
  v6 = (id)v10;
  v18 = v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);
  v7 = *(void **)(a1 + 56);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_43;
  v11[3] = &unk_24FE49BE8;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "sharingOptions") & 0x48) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRecordIDNeedingFetch:", 0);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "recordID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ no longer needs to fetch shareID in %@ from server truth check%@", (uint8_t *)&v25, 0x20u);

    }
    v11 = objc_msgSend(*(id *)(a1 + 40), "_markSubResourceRecordAsFetchedIfNecessary:", v8);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = (v11 & 1) != 0 || *(_BYTE *)(v12 + 24) != 0;
    *(_BYTE *)(v12 + 24) = v13;

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v5);
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRecordIDBlockingSave:", 0);
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v15, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412802;
        v26 = v23;
        v27 = 2112;
        v28 = v24;
        v29 = 2112;
        v30 = v16;
        _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is no longer blocked for save in %@ from server truth check%@", (uint8_t *)&v25, 0x20u);

      }
      v18 = objc_msgSend(*(id *)(a1 + 40), "_markSubResourceRecordAsFetchedIfNecessary:", v15);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = (v18 & 1) != 0 || *(_BYTE *)(v19 + 24) != 0;
      *(_BYTE *)(v19 + 24) = v20;

    }
  }

}

void __60__BRCFetchRecordSubResourcesOperation__prepareToSaveRecords__block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecordIDBlockingSave:", 0);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is no longer blocked for save in %@ from server truth check%@", (uint8_t *)&v15, 0x20u);

    }
    v10 = objc_msgSend(*(id *)(a1 + 40), "_markSubResourceRecordAsFetchedIfNecessary:", v7);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = (v10 & 1) != 0 || *(_BYTE *)(v11 + 24) != 0;
    *(_BYTE *)(v11 + 24) = v12;

  }
}

- (void)_fetchRecordsBlockingSaveIfNecessary
{
  BRCFetchRecordSubResourcesOperation *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BRCFetchRecordSubResourcesOperation *v14;
  NSMutableDictionary *subResourceRecordsByID;
  void *v16;
  void *v17;
  BRCPendingChangesStream *pendingChangesStream;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  BRCFetchRecordSubResourcesOperation *v25;
  void *v26;
  NSObject *v27;
  dispatch_group_t v28;
  OS_dispatch_group *deserializeGroup;
  uint64_t v30;
  BRCPendingChangesStream *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  dispatch_group_t v38;
  OS_dispatch_group *v39;
  void *v40;
  __int128 v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[NSMutableDictionary objectEnumerator](v2->_subResourceRecordsByID, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v44;
    *(_QWORD *)&v6 = 138412290;
    v41 = v6;
    v42 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
        objc_msgSend(v10, "recordIDNeedingFetch", v41);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {

          goto LABEL_16;
        }
        objc_msgSend(v10, "recordIDBlockingSave");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = v2;
          subResourceRecordsByID = v2->_subResourceRecordsByID;
          objc_msgSend(v10, "recordIDBlockingSave");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](subResourceRecordsByID, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {

            v2 = v14;
LABEL_11:
            v4 = v42;
            goto LABEL_16;
          }
          pendingChangesStream = v14->_pendingChangesStream;
          objc_msgSend(v10, "recordIDBlockingSave");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(pendingChangesStream) = -[BRCPendingChangesStream hasRecordIDBlockedOnSubResources:](pendingChangesStream, "hasRecordIDBlockedOnSubResources:", v19);

          v2 = v14;
          v4 = v42;
          if ((pendingChangesStream & 1) == 0)
          {
            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "recordIDBlockingSave");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "recordID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v48 = (uint64_t)v22;
              v49 = 2112;
              v50 = v23;
              v51 = 2112;
              v52 = v20;
              _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] We need to fetch %@ to unblock %@ from saving, but it wasn't found.  Forcing fetch%@", buf, 0x20u);

            }
            objc_msgSend(v10, "recordIDBlockingSave");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setRecordIDNeedingFetch:", v24);

            if (!v2->_deserializeGroup)
            {
              v25 = v2;
              brc_bread_crumbs();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v41;
                v48 = (uint64_t)v26;
                _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating _deserializeGroup because we have more records to deserialize in memory%@", buf, 0xCu);
              }

              v28 = dispatch_group_create();
              v2 = v25;
              deserializeGroup = v25->_deserializeGroup;
              v25->_deserializeGroup = (OS_dispatch_group *)v28;

              dispatch_group_enter((dispatch_group_t)v25->_deserializeGroup);
              dispatch_source_merge_data((dispatch_source_t)v25->_deserializeSource, 1uLL);
              goto LABEL_11;
            }
          }
        }
LABEL_16:
        ++v9;
      }
      while (v7 != v9);
      v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      v7 = v30;
    }
    while (v30);
  }

  v31 = v2->_pendingChangesStream;
  -[NSMutableDictionary objectEnumerator](v2->_subResourceRecordsByID, "objectEnumerator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[BRCPendingChangesStream copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:](v31, "copyBlockingSaveRecordsToNeedingFetchIgnoringRecords:", v32);

  if (v33)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
    {
      -[BRCFetchRecordSubResourcesOperation name](v2, "name");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v48 = v33;
      v49 = 2112;
      v50 = v40;
      v51 = 2112;
      v52 = v34;
      _os_log_error_impl(&dword_230455000, v35, (os_log_type_t)0x90u, "[ERROR] We need to fetch %llu records in the pending changes stream to allow saving for %@.  Forcing fetch%@", buf, 0x20u);

    }
    if (!v2->_deserializeGroup)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[BRCFetchRecordSubResourcesOperation _createSubResourceGroupsFromPendingChangesStreamIfNecessary].cold.1();

      v38 = dispatch_group_create();
      v39 = v2->_deserializeGroup;
      v2->_deserializeGroup = (OS_dispatch_group *)v38;

      dispatch_group_enter((dispatch_group_t)v2->_deserializeGroup);
      dispatch_source_merge_data((dispatch_source_t)v2->_deserializeSource, 1uLL);
    }
  }
}

- (void)_cleanUpAfterSavingRecords
{
  NSObject *v3;

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NSMutableDictionary removeAllObjects](self->_subResourceRecordsByID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_recordsByID, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_deletedShareIDs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_deletedRecordIDs, "removeAllObjects");
  if (self->_deserializeState == 1)
  {
    self->_deserializeState = 0;
    dispatch_resume((dispatch_object_t)self->_deserializeSource);
  }
}

- (void)_saveRecordsToPendingChangesWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4
{
  BRCPendingChangesStream *pendingChangesStream;
  NSMutableDictionary *recordsByID;
  id v8;
  NSMutableArray *deletedRecordIDs;
  NSMutableArray *deletedShareIDs;
  void *v11;
  id v12;

  pendingChangesStream = self->_pendingChangesStream;
  recordsByID = self->_recordsByID;
  v8 = a3;
  -[NSMutableDictionary objectEnumerator](recordsByID, "objectEnumerator");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  deletedRecordIDs = self->_deletedRecordIDs;
  deletedShareIDs = self->_deletedShareIDs;
  -[NSMutableDictionary objectEnumerator](self->_subResourceRecordsByID, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPendingChangesStream saveEditedRecords:deletedRecordIDs:deletedShareIDs:subResourceEditedRecords:serverChangeToken:clientChangeToken:](pendingChangesStream, "saveEditedRecords:deletedRecordIDs:deletedShareIDs:subResourceEditedRecords:serverChangeToken:clientChangeToken:", v12, deletedRecordIDs, deletedShareIDs, v11, v8, a4);

}

- (BOOL)_hasRecordsPendingSubResources
{
  return -[NSMutableDictionary count](self->_subResourceRecordsByID, "count")
      || -[BRCPendingChangesStream hasSubResourceRecords](self->_pendingChangesStream, "hasSubResourceRecords");
}

- (BOOL)saveRecordsWithServerChangeToken:(id)a3 clientChangeToken:(int64_t)a4 syncStatus:(int64_t)a5
{
  id v8;
  NSObject *v9;
  NSError *error;
  BOOL v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  BRCServerZone *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  BRCPendingChangesStream *v21;
  BRCPendingChangesStream *pendingChangesStream;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  const char *v31;
  _BOOL4 canSaveDirectly;
  const char *v33;
  const char *v34;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  _QWORD v42[4];
  BRCServerZone *v43;
  id v44;
  int64_t v45;
  uint64_t v46;
  BOOL v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  error = self->_error;
  if (!error)
  {
    -[BRCFetchRecordSubResourcesOperation _prepareToSaveRecords](self, "_prepareToSaveRecords");
    v11 = a5 == 3;
    v12 = -[BRCFetchRecordSubResourcesOperation _hasRecordsPendingSubResources](self, "_hasRecordsPendingSubResources");
    if (self->_queryFinishedServerTruthCallback)
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:].cold.3();

    }
    if (self->_queryFinishedClientTruthCallback)
    {
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:].cold.2();

    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[BRCFetchRecordSubResourcesOperation name](self, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionWithContext:", 0);
      v30 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v30;
      v31 = "NO";
      canSaveDirectly = self->_canSaveDirectly;
      v33 = "YES";
      *(_DWORD *)buf = 138413570;
      v53 = 2048;
      if (a5 == 3)
        v34 = "YES";
      else
        v34 = "NO";
      v50 = v29;
      if (v12)
        v33 = "NO";
      v51 = 2112;
      v52 = v30;
      if (canSaveDirectly || a5 == 3)
        v31 = v33;
      v54 = a4;
      v55 = 2080;
      v56 = v34;
      v57 = 2080;
      v58 = v31;
      v59 = 2112;
      v60 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saving records with server change token:%@ requestID:%llu caught up:%s directly:%s%@", buf, 0x3Eu);

    }
    if (v12)
    {
      -[BRCFetchRecordSubResourcesOperation _saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:](self, "_saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:", v8, a4);
      if (a5 == 3)
        -[BRCFetchRecordSubResourcesOperation _fetchRecordsBlockingSaveIfNecessary](self, "_fetchRecordsBlockingSaveIfNecessary");
    }
    else if (a5 == 3 || self->_canSaveDirectly)
    {
      v15 = a5 == 3;
      v48 = 0;
      v16 = self->_serverZone;
      LOBYTE(v40) = v15;
      v17 = -[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:](v16, "didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:", a4, v8, self->_recordsByID, self->_deletedRecordIDs, self->_deletedShareIDs, &v48, v40, self->_pendingChangesStream);
      if (v17)
      {
        v18 = v17;
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:].cold.1();

        -[BRCPendingChangesStream destroyDatabase](self->_pendingChangesStream, "destroyDatabase");
        v21 = -[BRCPendingChangesStream initWithServerZone:]([BRCPendingChangesStream alloc], "initWithServerZone:", self->_serverZone);
        pendingChangesStream = self->_pendingChangesStream;
        self->_pendingChangesStream = v21;

        -[BRCServerZone clientZone](v16, "clientZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "db");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __101__BRCFetchRecordSubResourcesOperation_saveRecordsWithServerChangeToken_clientChangeToken_syncStatus___block_invoke;
        v42[3] = &unk_24FE49C38;
        v43 = v16;
        v45 = a4;
        v46 = v18;
        v47 = v11;
        v44 = v48;
        objc_msgSend(v24, "performWithFlags:action:", 41, v42);

      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[BRCFetchRecordSubResourcesOperation name](self, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v27;
          v51 = 2112;
          v52 = (uint64_t)v25;
          _os_log_impl(&dword_230455000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ Allocating ranks failed when not caught up.  We'll save to pending changes from now on%@", buf, 0x16u);

        }
        self->_canSaveDirectly = 0;
        -[BRCFetchRecordSubResourcesOperation _saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:](self, "_saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:", v8, a4);
      }

    }
    else
    {
      -[BRCFetchRecordSubResourcesOperation _saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:](self, "_saveRecordsToPendingChangesWithServerChangeToken:clientChangeToken:", v8, a4);
    }
    -[BRCFetchRecordSubResourcesOperation _cleanUpAfterSavingRecords](self, "_cleanUpAfterSavingRecords");
  }

  return error == 0;
}

uint64_t __101__BRCFetchRecordSubResourcesOperation_saveRecordsWithServerChangeToken_clientChangeToken_syncStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (v9 != *(_QWORD *)(a1 + 32))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "session", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "applyScheduler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "generatedRanksForZone:upToRank:", v9, *(_QWORD *)(a1 + 56));

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return 1;
}

- (BOOL)saveRecordsWithQueryCursor:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  _BOOL4 canSaveDirectly;
  void *v8;
  NSObject *v9;
  BRCPendingChangesStream *pendingChangesStream;
  void *v11;
  void *v12;
  int v13;
  BRCServerZone *v14;
  uint64_t v15;
  BRCServerZone *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BRCPendingChangesStream *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  BRCPendingChangesStream *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  _QWORD block[5];
  _QWORD v45[4];
  id v46;
  BRCServerZone *v47;
  BRCFetchRecordSubResourcesOperation *v48;
  _BYTE *v49;
  char v50;
  _QWORD v51[5];
  BRCServerZone *v52;
  _BYTE *v53;
  char v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[24];
  const char *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_error)
  {
    if (v4 && !self->_pendingChangesStream)
    {
      brc_bread_crumbs();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:].cold.3();

    }
    -[BRCServerZone session](self->_serverZone, "session");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    canSaveDirectly = self->_canSaveDirectly;
    -[BRCFetchRecordSubResourcesOperation _prepareToSaveRecords](self, "_prepareToSaveRecords");
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[BRCFetchRecordSubResourcesOperation name](self, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = "YES";
      *(_DWORD *)v59 = 138413058;
      *(_QWORD *)&v59[4] = v36;
      *(_WORD *)&v59[12] = 2112;
      if (!canSaveDirectly)
        v37 = "NO";
      *(_QWORD *)&v59[14] = v4;
      *(_WORD *)&v59[22] = 2080;
      v60 = v37;
      v61 = 2112;
      v62 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ saving records with query cursor:%@ directly:%s%@", v59, 0x2Au);

    }
    if (v4 != 0 && !canSaveDirectly)
    {
      pendingChangesStream = self->_pendingChangesStream;
      if (!pendingChangesStream)
      {
        brc_bread_crumbs();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:].cold.1();

        pendingChangesStream = self->_pendingChangesStream;
      }
      -[NSMutableDictionary objectEnumerator](self->_recordsByID, "objectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectEnumerator](self->_subResourceRecordsByID, "objectEnumerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPendingChangesStream saveEditedRecords:subResourceEditedRecords:queryCursor:](pendingChangesStream, "saveEditedRecords:subResourceEditedRecords:queryCursor:", v11, v12, v4);

      v6 = 1;
      goto LABEL_30;
    }
    *(_QWORD *)v59 = 0;
    *(_QWORD *)&v59[8] = v59;
    *(_QWORD *)&v59[16] = 0x2020000000;
    v60 = 0;
    if (v4)
      v13 = 0;
    else
      v13 = !-[BRCFetchRecordSubResourcesOperation _hasRecordsPendingSubResources](self, "_hasRecordsPendingSubResources");
    v14 = self->_serverZone;
    -[BRCServerZone db](self->_serverZone, "db");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke;
    v51[3] = &unk_24FE49C60;
    v51[4] = self;
    v53 = v59;
    v16 = v14;
    v52 = v16;
    v54 = v13;
    objc_msgSend(v42, "performWithFlags:action:", 25, v51);
    if (*(_QWORD *)(*(_QWORD *)&v59[8] + 24))
    {
      objc_msgSend(v43, "clientDB");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v15;
      v45[1] = 3221225472;
      v45[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_2;
      v45[3] = &unk_24FE49C88;
      v46 = v43;
      v48 = self;
      v49 = v59;
      v47 = v16;
      v50 = v13;
      objc_msgSend(v17, "performWithFlags:action:", 41, v45);

      if (v13)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          -[BRCFetchRecordSubResourcesOperation name](self, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCFetchRecordSubResourcesOperation saveRecordsWithQueryCursor:].cold.2(v20, (uint64_t)v18, (uint64_t)buf, v19);
        }

        -[BRCPendingChangesStream destroyDatabase](self->_pendingChangesStream, "destroyDatabase");
        v21 = self->_pendingChangesStream;
        self->_pendingChangesStream = 0;
      }
      else
      {
        v31 = self->_pendingChangesStream;
        -[NSMutableDictionary objectEnumerator](self->_subResourceRecordsByID, "objectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectEnumerator](self->_recordsByID, "objectEnumerator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCPendingChangesStream saveSubResourceRecords:afterSavingMainTableItems:queryCursor:](v31, "saveSubResourceRecords:afterSavingMainTableItems:queryCursor:", v21, v32, v4);

      }
    }
    else
    {
      self->_canSaveDirectly = 0;
      v22 = self->_pendingChangesStream;
      -[NSMutableDictionary objectEnumerator](self->_recordsByID, "objectEnumerator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectEnumerator](self->_subResourceRecordsByID, "objectEnumerator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPendingChangesStream saveEditedRecords:subResourceEditedRecords:queryCursor:](v22, "saveEditedRecords:subResourceEditedRecords:queryCursor:", v23, v24, v4);

      -[BRCPendingChangesStream lastError](self->_pendingChangesStream, "lastError");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[BRCPendingChangesStream lastError](self->_pendingChangesStream, "lastError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFetchRecordSubResourcesOperation stopWithError:](self, "stopWithError:", v26);

      }
      if (v13)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[BRCFetchRecordSubResourcesOperation name](self, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v56 = v29;
          v57 = 2112;
          v58 = v27;
          _os_log_impl(&dword_230455000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ got a (temporary) broken structure while listing directory contents%@", buf, 0x16u);

        }
        objc_msgSend(v43, "clientTruthWorkloop");
        v30 = objc_claimAutoreleasedReturnValue();
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_48;
        block[3] = &unk_24FE3FA18;
        block[4] = self;
        dispatch_async(v30, block);

        v6 = 0;
        goto LABEL_29;
      }
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v33;
        _os_log_impl(&dword_230455000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] Allocating ranks failed when not caught up and listing.  We'll save to pending changes from now on%@", buf, 0xCu);
      }

    }
    v6 = 1;
LABEL_29:

    _Block_object_dispose(v59, 8);
LABEL_30:
    -[BRCFetchRecordSubResourcesOperation _cleanUpAfterSavingRecords](self, "_cleanUpAfterSavingRecords", v42);

    goto LABEL_31;
  }
  v6 = 0;
LABEL_31:

  return v6;
}

BOOL __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "didListDirectoryChangesWithResults:pendingFetchChanges:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  v4 = *(_QWORD *)(a1 + 48);
  if (v3 && *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) && *(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(v3 + 16))();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 656);
    *(_QWORD *)(v5 + 656) = 0;

    v4 = *(_QWORD *)(a1 + 48);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24) != 0;

  return v7;
}

uint64_t __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "applyScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedRanksForZone:upToRank:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 664);
  if (v3 && *(_BYTE *)(a1 + 64))
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void **)(v4 + 664);
    *(_QWORD *)(v4 + 664) = 0;

  }
  return 1;
}

void __66__BRCFetchRecordSubResourcesOperation_saveRecordsWithQueryCursor___block_invoke_48(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleSyncDownFirst");

}

- (NSError)error
{
  return self->_error;
}

- (BRCPendingChangesStream)pendingChangesStream
{
  return self->_pendingChangesStream;
}

- (id)queryFinishedServerTruthCallback
{
  return self->_queryFinishedServerTruthCallback;
}

- (void)setQueryFinishedServerTruthCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (id)queryFinishedClientTruthCallback
{
  return self->_queryFinishedClientTruthCallback;
}

- (void)setQueryFinishedClientTruthCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryFinishedClientTruthCallback, 0);
  objc_storeStrong(&self->_queryFinishedServerTruthCallback, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_loopDetectionCache, 0);
  objc_storeStrong((id *)&self->_deserializeSource, 0);
  objc_storeStrong((id *)&self->_deserializeGroup, 0);
  objc_storeStrong((id *)&self->_xattrFetchingSource, 0);
  objc_storeStrong((id *)&self->_xattrFetchingGroup, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_movedZoneNames, 0);
  objc_storeStrong((id *)&self->_deletedShareIDs, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_subResourceRecordsByID, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong((id *)&self->_pendingChangesStream, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

- (void)records
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _subResourceRecordsByID.count == 0 && _pendingChangesStream == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverZone && parentOperation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _recordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecord:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![_deletedRecordIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![_deletedShareIDs containsObject:recordID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecord:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [contentRecordName hasPrefix:kBRRecordIDPrefixContent]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecord:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_isDoneFetchingRecords%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addRecordIDToDeserialize:recordType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _subResourceRecordsByID[recordID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)shareIDWasDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![_deletedShareIDs containsObject:shareID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)shareIDWasDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _recordsByID[shareID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_notifyWhenRecordsAreFetched:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Wait on _deserializeGroup to remaining records to deserialize%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __68__BRCFetchRecordSubResourcesOperation__notifyWhenRecordsAreFetched___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Wait on _xattrFetchingGroup to remaining xattrs records%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Not fetching records blocking save because we aren't caught up%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _recordsByID.count == 0 && _deletedShareIDs.count == 0 && _deletedRecordIDs.count == 0 && _subResourceRecordsByID.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] %@ waiting to fetch all records%@", v4);

  OUTLINED_FUNCTION_6();
}

void __89__BRCFetchRecordSubResourcesOperation_notifyWhenCaughtUp_whenRecordsAreFetchedAndFinish___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Done waiting on deserialize/xattr groups%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)stopWithError:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] %@ resuming deserialize source which was waiting for batch save%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)finishWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _queryFinishedClientTruthCallback == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _queryFinishedServerTruthCallback == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _deserializeGroup == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _xattrFetchingGroup == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.5()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] %@ finished record fetcher%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_willFetchRecordForDeserialize:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Fetch loop trying to fetch %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __59__BRCFetchRecordSubResourcesOperation__scheduleDeserialize__block_invoke_28_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] We can't find a record which really should exist - %@.  Unblocking other records from save%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __58__BRCFetchRecordSubResourcesOperation__scheduleXattrFetch__block_invoke_36_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] Removed xattr requirement from %lld in-memory subResourceRecords%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v3, "[DEBUG] %@ recreating pending changes stream with updated change token%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_queryFinishedClientTruthCallback%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_queryFinishedServerTruthCallback%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveRecordsWithQueryCursor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _pendingChangesStream%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveRecordsWithQueryCursor:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a4, a3, "[DEBUG] %@ Destroying pending changes db because we are done with it%@", (uint8_t *)a3);

}

- (void)saveRecordsWithQueryCursor:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _pendingChangesStream || !cursor%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
