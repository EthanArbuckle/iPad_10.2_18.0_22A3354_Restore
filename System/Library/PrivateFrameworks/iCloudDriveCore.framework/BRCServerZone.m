@implementation BRCServerZone

- (BRCSyncContext)metadataSyncContextIfExists
{
  return self->_metadataSyncContext;
}

- (void)removeForegroundClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BRCServerZone metadataSyncContext](self, "metadataSyncContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeForegroundClient:", v4);

}

- (BRCSyncContext)metadataSyncContext
{
  BRCSyncContext *metadataSyncContext;
  void *v4;
  void *v5;
  BRCSyncContext *v6;
  BRCSyncContext *v7;

  metadataSyncContext = self->_metadataSyncContext;
  if (!metadataSyncContext)
  {
    -[BRCAccountSessionFPFS syncContextProvider](self->_session, "syncContextProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone mangledID](self, "mangledID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataSyncContextForMangledID:", v5);
    v6 = (BRCSyncContext *)objc_claimAutoreleasedReturnValue();
    v7 = self->_metadataSyncContext;
    self->_metadataSyncContext = v6;

    metadataSyncContext = self->_metadataSyncContext;
  }
  return metadataSyncContext;
}

- (BOOL)isCloudDocsZone
{
  void *v2;
  char v3;

  -[BRCServerZone clientZone](self, "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudDocsZone");

  return v3;
}

- (void)addForegroundClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BRCServerZone metadataSyncContext](self, "metadataSyncContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addForegroundClient:", v4);

}

- (void)scheduleMoveToCloudDocs
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[BRCServerZone session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(v4, block);

}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2;
  v4[3] = &unk_24FE42B50;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = &v5;
  dispatch_sync(v3, v4);

  if (*((_BYTE *)v6 + 24))
    objc_msgSend(*(id *)(a1 + 32), "forceMoveToCloudDocs");
  _Block_object_dispose(&v5, 8);
}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isCloudDocsZone"))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2_cold_1();

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "state") & 2) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStateBits:", 2);
    objc_msgSend(*(id *)(a1 + 32), "resetServerTruth");
    objc_msgSend(*(id *)(a1 + 32), "db");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flush");

    return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (id)asPrivateZone
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCServerZone asPrivateZone].cold.1();

  return 0;
}

- (id)asSharedZone
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCServerZone asSharedZone].cold.1();

  return 0;
}

- (NSString)ownerName
{
  return (NSString *)(id)*MEMORY[0x24BDB8E88];
}

- (CKRecordZoneID)zoneID
{
  id v3;
  NSString *zoneName;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDB91F8]);
  zoneName = self->_zoneName;
  -[BRCServerZone ownerName](self, "ownerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithZoneName:ownerName:", zoneName, v5);

  return (CKRecordZoneID *)v6;
}

- (BRMangledID)mangledID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BE17640]);
  -[BRCServerZone zoneName](self, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCServerZone ownerName](self, "ownerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithZoneName:ownerName:", v4, v5);

  return (BRMangledID *)v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_zoneName, "hash");
  -[BRCServerZone ownerName](self, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BRCServerZone *v4;
  BRCServerZone *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (BRCServerZone *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqualToString:](self->_zoneName, "isEqualToString:", v5->_zoneName))
      {
        -[BRCServerZone ownerName](self, "ownerName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone ownerName](v5, "ownerName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BRCZoneRowID *dbRowID;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    -[BRCServerZone changeState](self, "changeState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptionWithContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[BRCServerZone mangledID](self, "mangledID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dbRowID = self->_dbRowID;
    -[BRCServerZone changeState](self, "changeState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptionWithContext:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@[%@] %@>"), v5, dbRowID, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[BRCServerZone descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (NSMutableDictionary)plist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  -[BRCServerZone changeState](self, "changeState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientRequestID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientRequestID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "lastSyncDownStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lastSyncStatus"));

  objc_msgSend(v4, "lastSyncDownDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "lastSyncDownDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lastSyncDownDate"));

  }
  objc_msgSend(v4, "changeToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "changeToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("changeToken"));

  }
  return (NSMutableDictionary *)v3;
}

- (BRCServerZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BRCServerZone *v14;
  BRCServerZone *v15;
  uint64_t v16;
  BRCPQLConnection *db;
  uint64_t v18;
  NSString *zoneName;
  BRCServerChangeState *v20;
  BRCServerChangeState *changeState;
  uint64_t v22;
  NSMutableDictionary *failedListDirectoryOperations;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BRCServerZone;
  v14 = -[BRCServerZone init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_session, a6);
    objc_msgSend(v13, "serverDB");
    v16 = objc_claimAutoreleasedReturnValue();
    db = v15->_db;
    v15->_db = (BRCPQLConnection *)v16;

    objc_storeStrong((id *)&v15->_dbRowID, a4);
    objc_msgSend(v10, "appLibraryOrZoneName");
    v18 = objc_claimAutoreleasedReturnValue();
    zoneName = v15->_zoneName;
    v15->_zoneName = (NSString *)v18;

    v20 = objc_alloc_init(BRCServerChangeState);
    changeState = v15->_changeState;
    v15->_changeState = v20;

    v22 = objc_opt_new();
    failedListDirectoryOperations = v15->_failedListDirectoryOperations;
    v15->_failedListDirectoryOperations = (NSMutableDictionary *)v22;

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("state"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_state = objc_msgSend(v24, "unsignedIntValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastSyncDownDate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerChangeState setLastSyncDownDate:](v15->_changeState, "setLastSyncDownDate:", v25);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lastSyncStatus"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerChangeState setLastSyncDownStatus:](v15->_changeState, "setLastSyncDownStatus:", objc_msgSend(v26, "unsignedIntegerValue"));

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("changeToken"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerChangeState setChangeToken:](v15->_changeState, "setChangeToken:", v27);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("clientRequestID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCServerChangeState setClientRequestID:](v15->_changeState, "setClientRequestID:", objc_msgSend(v28, "unsignedLongLongValue"));

    }
  }

  return v15;
}

- (void)activateWithClientZone:(id)a3 offline:(BOOL)a4
{
  objc_storeStrong((id *)&self->_clientZone, a3);
}

- (void)deactivateFromClientZone
{
  BRCClientZone *clientZone;

  clientZone = self->_clientZone;
  self->_clientZone = 0;

}

- (BOOL)_verifyChildbasehashSaltKeysForItemID:(id)a3 saltInfo:(id)a4 record:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled"))
    goto LABEL_4;
  objc_msgSend(v9, "childBasehashSalt");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v12 = (void *)v11;
  objc_msgSend(v9, "childBasehashSalt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "brc_truncatedSHA256");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childBasehashSaltValidation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToData:", v15);

  if ((v16 & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _verifyChildbasehashSaltKeysForItemID:saltInfo:record:].cold.1();

    objc_msgSend(v10, "recordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone mangledID](self, "mangledID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[AppTelemetryTimeSeriesEvent newEDPKeysMismatchForRecordID:mangledID:](AppTelemetryTimeSeriesEvent, "newEDPKeysMismatchForRecordID:mangledID:", v22, v23);

    -[BRCServerZone session](self, "session");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "analyticsReporter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v24);

    v17 = 0;
  }
  else
  {
LABEL_4:
    v17 = 1;
  }

  return v17;
}

- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 origName:(id)a7 base:(id)a8 no:(id)a9 ext:(id)a10
{
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  BRCServerZone *v20;
  BRCAccountSessionFPFS *session;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  BOOL v30;
  BRCPQLConnection *v31;
  void *v32;
  void *v33;
  id v34;
  BRCPQLConnection *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  BRCServerZone *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  char v61;
  char v62;
  BRCPQLConnection *db;
  void *v64;
  id v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  void *v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  const __CFString *v90;
  BRCZoneRowID *dbRowID;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  unsigned int v105;
  void *v106;
  double v107;
  uint64_t v108;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  unsigned int v115;
  void *v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  unsigned int v132;
  unsigned int v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  BRCPQLConnection *v155;
  BRCPQLConnection *v156;
  _BOOL4 v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  BRCServerZone *v165;
  id v166;
  _QWORD *v167;
  void *v168;
  uint64_t v169;
  _BOOL4 v170;
  void *v171;
  void *v172;
  BRCBasehashSaltInfo *v173;
  void *v174;
  id v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  _QWORD block[5];
  id v181;
  uint64_t v182;
  uint8_t buf[4];
  id v184;
  __int16 v185;
  id v186;
  __int16 v187;
  void *v188;
  __int16 v189;
  id v190;
  __int16 v191;
  void *v192;
  uint64_t v193;

  v193 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v175 = a5;
  v18 = a6;
  v176 = a7;
  v178 = a8;
  v19 = a9;
  v20 = self;
  v177 = a10;
  session = self->_session;
  v22 = v18;
  objc_msgSend(v18, "recordID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "zoneID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ownerName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS userKeyForOwnerName:db:](session, "userKeyForOwnerName:db:", v25, self->_db);
  v26 = objc_claimAutoreleasedReturnValue();

  v174 = (void *)v26;
  v179 = v16;
  if (v26)
  {
    v166 = v19;
    v168 = v22;
    if (-[BRCServerZone isSharedZone](self, "isSharedZone"))
    {
      v27 = v175;
LABEL_37:
      v182 = 0;
      if (-[BRCServerZone isSharedZone](v20, "isSharedZone")
        && (objc_msgSend(v17, "parentID"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            v61 = objc_msgSend(v60, "isSharedZoneRoot"),
            v60,
            (v61 & 1) == 0))
      {
        db = v20->_db;
        -[BRCServerZone dbRowID](v20, "dbRowID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT item_favoriterank, item_lastusedtime, item_finder_tags, item_side_car_ckinfo FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v16, v64);

        v66 = objc_msgSend(v65, "next");
        if (v66)
        {
          objc_msgSend(v17, "setFavoriteRank:", objc_msgSend(v65, "longLongAtIndex:", 0));
          objc_msgSend(v17, "setLastUsedTime:", objc_msgSend(v65, "longLongAtIndex:", 1));
          objc_msgSend(v65, "dataAtIndex:", 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setFinderTags:", v67);

          objc_msgSend(v65, "objectOfClass:atIndex:", objc_opt_class(), 3);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v65;
        }
        else
        {
          -[BRCServerZone asSharedZone](v20, "asSharedZone");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sideCarRecordNameWithZone:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          v68 = -[BRCPQLConnection fetch:](v20->_db, "fetch:", CFSTR("SELECT item_favoriterank, item_lastusedtime, item_finder_tags, item_side_car_ckinfo FROM side_car_lookahead WHERE record_name = %@"), v70);
          if (objc_msgSend(v68, "next"))
          {
            objc_msgSend(v17, "setFavoriteRank:", objc_msgSend(v68, "longLongAtIndex:", 0));
            objc_msgSend(v17, "setLastUsedTime:", objc_msgSend(v68, "longLongAtIndex:", 1));
            objc_msgSend(v68, "dataAtIndex:", 2);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setFinderTags:", v71);

            objc_msgSend(v68, "objectOfClass:atIndex:", objc_opt_class(), 3);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCPQLConnection execute:](v20->_db, "execute:", CFSTR("DELETE FROM side_car_lookahead WHERE record_name = %@"), v70);
          }
          else
          {
            v171 = 0;
          }

        }
        v62 = v66 ^ 1;

      }
      else
      {
        v171 = 0;
        v62 = 0;
      }
      v72 = objc_msgSend(v17, "type");
      v73 = -1;
      if (v72 <= 0xA && ((1 << v72) & 0x611) != 0)
      {
        objc_msgSend(v22, "deserializeFolderSharingOptions:", &v182);
        if ((-[BRCServerZone state](v20, "state") & 4) != 0)
        {
          objc_msgSend(v17, "setType:", 0);
        }
        else
        {
          v74 = -[PQLConnection numberWithSQL:](v20->_db, "numberWithSQL:", CFSTR("SELECT item_type FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), v16, v20->_dbRowID);
          v75 = v74;
          if (v74)
          {
            objc_msgSend(v17, "setType:", (char)objc_msgSend(v74, "longLongValue"));
            v115 = objc_msgSend(v17, "type");
            if (v115 > 0xA || ((1 << v115) & 0x611) == 0)
            {
              brc_bread_crumbs();
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
                -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:].cold.4();

            }
          }
          else
          {
            -[BRCServerZone mangledID](v20, "mangledID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "forceDeltaInitialSync");

            if (v78)
              v79 = 0;
            else
              v79 = 9;
            objc_msgSend(v17, "setType:", v79);
            v62 = 1;
          }

        }
        v73 = -5;
      }
      objc_msgSend(v22, "parent");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v80)
      {
        v81 = objc_msgSend(v17, "type");
        v169 = 2;
        if (v81 > 0xA || ((1 << v81) & 0x611) == 0)
          goto LABEL_70;
        if ((objc_msgSend(v22, "hasChainPCS") & 1) == 0)
        {
          brc_bread_crumbs();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v83 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v83, (os_log_type_t)0x90u))
            -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:].cold.3();

          -[BRCAccountSessionFPFS clientTruthWorkloop](v20->_session, "clientTruthWorkloop");
          v84 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __76__BRCServerZone__saveItemID_stat_serverMetrics_record_origName_base_no_ext___block_invoke;
          block[3] = &unk_24FE3FA40;
          block[4] = v20;
          v181 = v16;
          dispatch_async(v84, block);

        }
        v85 = 2;
      }
      else if (objc_msgSend(v22, "hasChainPCS"))
      {
        v85 = 4;
      }
      else
      {
        v85 = 1;
      }
      v169 = v85;
LABEL_70:
      v173 = -[BRCBasehashSaltInfo initWithRecord:]([BRCBasehashSaltInfo alloc], "initWithRecord:", v22);
      if (!-[BRCServerZone _verifyChildbasehashSaltKeysForItemID:saltInfo:record:](v20, "_verifyChildbasehashSaltKeysForItemID:saltInfo:record:", v16))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateBogusKey");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCBasehashSaltInfo setChildBasehashSalt:](v173, "setChildBasehashSalt:", v86);

      }
      v167 = v17;
      v165 = v20;
      if ((v62 & 1) != 0)
        goto LABEL_75;
      v154 = v182;
      v156 = v20->_db;
      objc_msgSend(v17, "ckInfo");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v17, "state");
      v150 = objc_msgSend(v17, "type");
      v148 = objc_msgSend(v17, "mode");
      v144 = objc_msgSend(v17, "birthtime");
      v142 = objc_msgSend(v17, "lastUsedTime");
      v140 = objc_msgSend(v17, "favoriteRank");
      objc_msgSend(v17, "parentID");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = (const __CFString *)v17[7];
      if (!v96)
        v96 = &stru_24FE4A790;
      v146 = v96;
      v132 = objc_msgSend(v17, "isHiddenExt");
      objc_msgSend(v17, "finderTags");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "xattrSignature");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trashPutBackPath");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trashPutBackParentID");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "aliasTarget");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "creatorRowID");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "quotaUsed");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "recursiveChildCount");
      v97 = v27;
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sharedByMeRecursiveCount");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sharedAliasRecursiveCount");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "childCount");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCBasehashSaltInfo childBasehashSalt](v173, "childBasehashSalt");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v73;
      v103 = -[BRCBasehashSaltInfo saltingState](v173, "saltingState");
      -[BRCBasehashSaltInfo basehashSaltValidation](v173, "basehashSaltValidation");
      v120 = v103;
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = -[BRCPQLConnection execute:](v156, "execute:", CFSTR("UPDATE server_items SET   item_rank = NULL, item_depth = 0, item_origname = %@, pcs_state = %d, item_sharing_options = (%lu | (item_sharing_options & %lu)), item_side_car_ckinfo = %@, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, quota_used = %@, recursive_child_count = %@, shared_children_count = %@, shared_alias_count = %@, child_count = %@, child_basehash_salt = %@, salting_state = %u, basehash_salt_validation_key = %@ WHERE item_id = %@ AND zone_rowid = %@"), v176, v169, v154, v102, v171, v164, v152, v150, v148, v144, v142, v140, v161, v146, v132, v159,
               v138,
               v136,
               v134,
               v126,
               v130,
               v128,
               v124,
               v98,
               v99,
               v100,
               v101,
               v120,
               v104,
               v179,
               v20->_dbRowID);

      if (!v157)
      {
        v30 = 0;
        v17 = v167;
        v27 = v175;
        goto LABEL_94;
      }
      v17 = v167;
      v27 = v175;
      if (!-[BRCPQLConnection changes](v20->_db, "changes"))
      {
LABEL_75:
        if ((objc_msgSend(v179, "isDocumentsFolder") & 1) == 0
          && -[NSArray containsObject:](v20->_directoriesCreatedLastSyncUp, "containsObject:", v179)
          && objc_msgSend(v17, "type") == 9)
        {
          brc_bread_crumbs();
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v179, "debugItemIDString");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v184 = v89;
            v185 = 2112;
            v186 = v87;
            _os_log_impl(&dword_230455000, v88, OS_LOG_TYPE_DEFAULT, "[NOTICE] Promoting %@ to be a normal directory because it was created from our own sync up%@", buf, 0x16u);

          }
          objc_msgSend(v17, "setType:", 0);
        }
        v153 = v182;
        v155 = v20->_db;
        objc_msgSend(v17, "ckInfo");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend(v17, "state");
        v149 = objc_msgSend(v17, "type");
        v143 = objc_msgSend(v17, "mode");
        v147 = objc_msgSend(v17, "birthtime");
        v145 = objc_msgSend(v17, "lastUsedTime");
        v139 = objc_msgSend(v17, "favoriteRank");
        objc_msgSend(v17, "parentID");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (const __CFString *)v17[7];
        if (!v90)
          v90 = &stru_24FE4A790;
        v135 = v90;
        v133 = objc_msgSend(v17, "isHiddenExt");
        objc_msgSend(v17, "finderTags");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "xattrSignature");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "trashPutBackPath");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "trashPutBackParentID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "aliasTarget");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "creatorRowID");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        dbRowID = v20->_dbRowID;
        objc_msgSend(v27, "quotaUsed");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "recursiveChildCount");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sharedByMeRecursiveCount");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sharedAliasRecursiveCount");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "childCount");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCBasehashSaltInfo childBasehashSalt](v173, "childBasehashSalt");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = -[BRCBasehashSaltInfo saltingState](v173, "saltingState");
        -[BRCBasehashSaltInfo basehashSaltValidation](v173, "basehashSaltValidation");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = -[BRCPQLConnection execute:](v155, "execute:", CFSTR("INSERT INTO server_items(item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_rank, item_origname, pcs_state, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, zone_rowid, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, child_basehash_salt, salting_state, basehash_salt_validation_key) VALUES(%@, %@, %ld, %@, NULL, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %u, %@)"), v179, v174, v153, v171, v176, v169, v163, v151, v149, v143, v147, v145, v139, v158, v135, v133,
                 v141,
                 v137,
                 v160,
                 v123,
                 v131,
                 v129,
                 dbRowID,
                 v122,
                 v127,
                 v121,
                 v125,
                 v92,
                 v93,
                 v94,
                 v95);

        v20 = v165;
        v17 = v167;

        if (!v170)
        {
          v30 = 0;
LABEL_94:
          v22 = v168;
          v19 = v166;
LABEL_96:

          goto LABEL_97;
        }
      }
      v22 = v168;
      if (-[BRCPQLConnection changes](v20->_db, "changes") != 1)
      {
        brc_bread_crumbs();
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
          -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:].cold.1();

      }
      v105 = objc_msgSend(v17, "type");
      v19 = v166;
      if (v105 <= 0xA
        && ((1 << v105) & 0x611) != 0
        && (objc_msgSend(v168, "modificationDate"),
            v106 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v106, "timeIntervalSince1970"),
            v108 = (uint64_t)v107,
            v106,
            !-[BRCPQLConnection execute:](v20->_db, "execute:", CFSTR("UPDATE server_items SET  version_mtime = %lld  WHERE item_id = %@ AND zone_rowid = %@"), v108, v179, v20->_dbRowID)))
      {
        v30 = 0;
      }
      else
      {
        if (-[BRCPQLConnection changes](v20->_db, "changes") != 1)
        {
          brc_bread_crumbs();
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v119 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
            -[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:].cold.1();

        }
        v30 = 1;
      }
      goto LABEL_96;
    }
    v31 = self->_db;
    objc_msgSend(v17, "parentID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logicalName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PQLConnection itemIDWithSQL:](v31, "itemIDWithSQL:", CFSTR("SELECT item_id FROM server_items  WHERE item_id != %@ AND item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@"), v16, v32, v33, self->_dbRowID);

    v27 = v175;
    if (!v34)
    {
LABEL_36:

      goto LABEL_37;
    }
    v35 = v20->_db;
    objc_msgSend(v17, "parentID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[BRCPQLConnection fetch:](v35, "fetch:", CFSTR("SELECT item_origname, item_filename FROM server_items  WHERE item_id = %@ AND item_parent_id = %@ AND +zone_rowid = %@"), v16, v36, v20->_dbRowID);

    if (objc_msgSend(v37, "next"))
    {
      v172 = v37;
      objc_msgSend(v37, "stringAtIndex:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logicalName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqualToString:", v39);

      if (v40)
      {
        v41 = v20;
        brc_bread_crumbs();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v184 = v16;
          v185 = 2112;
          v186 = v34;
          v187 = 2112;
          v188 = v42;
          _os_log_debug_impl(&dword_230455000, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] Keeping bounce of %@ even though it clashes with %@%@", buf, 0x20u);
        }

        objc_msgSend(v172, "stringAtIndex:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setLogicalName:", v44);
        v45 = v176;
        v176 = v38;
        goto LABEL_33;
      }

      v37 = v172;
    }
    v46 = objc_msgSend(v19, "integerValue");
    if (v46 <= 1)
      v47 = 1;
    else
      v47 = v46;
    v48 = v47 + 1;
    if (v47 == -1)
    {
      v27 = v175;
LABEL_35:

      goto LABEL_36;
    }
    v172 = v37;
    v41 = v20;
    while (1)
    {
      v49 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringValue");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v178, v51, v177, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!-[BRCPQLConnection execute:](v41->_db, "execute:", CFSTR("UPDATE OR IGNORE server_items SET  item_rank = NULL, item_depth = 0, item_filename = %@, item_origname = IFNULL(item_origname, item_filename) WHERE zone_rowid = %@ AND item_id = %@"), v44, v41->_dbRowID, v34))
      {
        brc_bread_crumbs();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          -[BRCPQLConnection lastError](v41->_db, "lastError");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "localizedDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v184 = v57;
          v185 = 2112;
          v186 = v52;
          _os_log_fault_impl(&dword_230455000, v53, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a SQL Error: %@%@", buf, 0x16u);

        }
      }
      if (-[BRCPQLConnection changes](v41->_db, "changes"))
        break;
      brc_bread_crumbs();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v184 = v34;
        v185 = 2112;
        v186 = v44;
        v187 = 2112;
        v188 = v54;
        _os_log_debug_impl(&dword_230455000, v55, OS_LOG_TYPE_DEBUG, "[DEBUG] Not bouncing %@ to %@ because that's not a unique filename%@", buf, 0x20u);
      }

      if (__CFADD__(v48++, 1))
      {
        v27 = v175;
        goto LABEL_34;
      }
    }
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "logicalName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v184 = v34;
      v185 = 2112;
      v186 = v59;
      v187 = 2112;
      v188 = v44;
      v189 = 2112;
      v190 = v16;
      v191 = 2112;
      v192 = v45;
      _os_log_impl(&dword_230455000, v58, OS_LOG_TYPE_DEFAULT, "[WARNING] Bounced itemID %@ from \"%@\" to \"%@\" because it clashes with %@%@", buf, 0x34u);

    }
    v27 = v175;
LABEL_33:

LABEL_34:
    v20 = v41;
    v37 = v172;
    goto LABEL_35;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    objc_msgSend(v22, "recordID");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "zoneID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "ownerName");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v184 = v16;
    v185 = 2112;
    v186 = v112;
    v187 = 2112;
    v188 = v28;
    _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", buf, 0x20u);

  }
  v30 = 0;
  v27 = v175;
LABEL_97:

  return v30;
}

void __76__BRCServerZone__saveItemID_stat_serverMetrics_record_origName_base_no_ext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enhancedDrivePrivacyEnabled");
  objc_msgSend(*(id *)(a1 + 40), "itemIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[AppTelemetryTimeSeriesEvent newChainedDirectoryMissingChainPCSEventWithZoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:](AppTelemetryTimeSeriesEvent, "newChainedDirectoryMissingChainPCSEventWithZoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:", v2, v4, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "analyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v7);

}

- (BOOL)_saveItemID:(id)a3 stat:(id)a4 serverMetrics:(id)a5 record:(id)a6 error:(id *)a7
{
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  char *v17;
  char *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  BRCServerZone *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  char *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  const __CFString *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  NSObject *v57;
  int v58;
  char *v59;
  id *v60;
  NSObject *v61;
  id *v62;
  NSObject *v63;
  id *v64;
  id v65;
  id *v66;
  void *v67;
  NSObject *v68;
  char *v70;
  const char *v71;
  char *v72;
  const char *v73;
  id *v74;
  id *v75;
  char *v77;
  id v78;
  id v79;
  __CFString *v80;
  id v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  id *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v11 = (id *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v80 = 0;
  v81 = 0;
  v79 = 0;
  objc_msgSend(v12, "logicalName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "br_nameIsRepresentableOnHFS");

  v17 = 0;
  v18 = 0;
  if ((v16 & 1) == 0)
  {
    v78 = 0;
    v19 = objc_msgSend(v14, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, &v81, &v79, &v80, 0, &v78);
    v17 = (char *)v78;
    if ((v19 & 1) == 0)
    {
      brc_bread_crumbs();
      v41 = (id *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v83 = v17;
        v84 = 2112;
        v85 = (const char *)v14;
        v86 = 2112;
        v87 = v41;
        _os_log_fault_impl(&dword_230455000, v42, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize filename: %@ of %@%@", buf, 0x20u);
      }

      if (!a7)
      {
        v18 = 0;
        goto LABEL_58;
      }
      v43 = objc_retainAutorelease(v17);
      v17 = v43;
      v18 = 0;
      goto LABEL_49;
    }
    v74 = a7;
    v20 = v13;
    objc_msgSend(v12, "logicalName");
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = v81;
    objc_msgSend(v79, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v22, v23, v80, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLogicalName:", v24);

    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "logicalName");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastModifiedUserRecordID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v83 = v27;
      v84 = 2112;
      v85 = v18;
      v86 = 2112;
      v87 = v11;
      v88 = 2112;
      v89 = v28;
      v90 = 2112;
      v91 = v25;
      _os_log_impl(&dword_230455000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] changing filename to \"%@\" because \"%@\" is unrepresentable (item ID: %@, last editor: %@)%@", buf, 0x34u);

    }
    v13 = v20;
    a7 = v74;
  }
  objc_msgSend(v12, "logicalName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "br_isSideFaultName");

  objc_msgSend(v12, "logicalName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "br_isExcludedWithMaximumDepth:", 1);

  if ((v30 & 1) == 0 && !v32)
  {
    v33 = self;
    goto LABEL_35;
  }
  if (!v18)
  {
    objc_msgSend(v12, "logicalName");
    v18 = (char *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "br_emptyFilenameAlternativeName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v81;
  v81 = v34;

  v36 = v79;
  v79 = 0;

  objc_msgSend(v12, "logicalName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "br_pathExtension");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = v80;
  v80 = v38;

  v75 = v11;
  if (v80)
  {
    objc_msgSend(v81, "stringByAppendingPathExtension:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLogicalName:", v40);

  }
  else
  {
    objc_msgSend(v12, "setLogicalName:", v81);
  }
  v44 = v13;
  objc_msgSend(v12, "logicalName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "br_isSideFaultName"))
  {

  }
  else
  {
    objc_msgSend(v12, "logicalName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "br_isExcludedWithMaximumDepth:", 1);

    if (!v47)
      goto LABEL_28;
  }
  if (objc_msgSend(v12, "type") == 1 && (objc_msgSend(v18, "br_isPackageRoot") & 1) != 0)
    v48 = CFSTR("pkg");
  else
    v48 = 0;
  v49 = v80;
  v80 = (__CFString *)v48;

  if (v80)
  {
    objc_msgSend(v81, "stringByAppendingPathExtension:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLogicalName:", v50);

  }
  else
  {
    objc_msgSend(v12, "setLogicalName:", v81);
  }
LABEL_28:
  brc_bread_crumbs();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
  {
    objc_msgSend(v12, "logicalName");
    v70 = (char *)objc_claimAutoreleasedReturnValue();
    v71 = "an excluded";
    *(_DWORD *)buf = 138413058;
    v83 = v70;
    v84 = 2112;
    if (v30)
      v71 = "a side fault";
    v85 = v18;
    v86 = 2080;
    v87 = (id *)v71;
    v88 = 2112;
    v89 = v51;
    _os_log_error_impl(&dword_230455000, v52, (os_log_type_t)0x90u, "[ERROR] changing filename to \"%@\" because \"%@\" is %s name%@", buf, 0x2Au);

  }
  objc_msgSend(v12, "logicalName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "br_isSideFaultName"))
  {

    v13 = v44;
    v33 = self;
  }
  else
  {
    objc_msgSend(v12, "logicalName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "br_isExcludedWithMaximumDepth:", 1);

    v13 = v44;
    v33 = self;
    if (!v55)
    {
      v11 = v75;
      goto LABEL_35;
    }
  }
  brc_bread_crumbs();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v57 = objc_claimAutoreleasedReturnValue();
  v11 = v75;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    -[BRCServerZone _saveItemID:stat:serverMetrics:record:error:].cold.1();

LABEL_35:
  if (!v81)
  {
    v77 = v17;
    v58 = objc_msgSend(v14, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, &v81, &v79, &v80, 0, &v77);
    v59 = v77;

    if (!v58)
    {
      brc_bread_crumbs();
      v62 = (id *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v83 = v59;
        v84 = 2112;
        v85 = (const char *)v14;
        v86 = 2112;
        v87 = v62;
        _os_log_fault_impl(&dword_230455000, v63, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize filename: %@ of %@%@", buf, 0x20u);
      }

      if (!a7)
      {
        v17 = v59;
        goto LABEL_58;
      }
      v43 = objc_retainAutorelease(v59);
      v17 = v43;
      goto LABEL_49;
    }
    v17 = v59;
    v33 = self;
  }
  if (-[BRCServerZone _saveItemID:stat:serverMetrics:record:origName:base:no:ext:](v33, "_saveItemID:stat:serverMetrics:record:origName:base:no:ext:", v11, v12, v13, v14, v18, v79, v80))
  {
    if (-[BRCPQLConnection changes](v33->_db, "changes"))
    {
      LOBYTE(a7) = 1;
    }
    else
    {
      v65 = v14;
      v66 = a7;
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("no record to update: %@"), v11);
      a7 = (id *)objc_claimAutoreleasedReturnValue();
      if (a7)
      {
        brc_bread_crumbs();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, (os_log_type_t)0x90u))
        {
          v73 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v83 = "-[BRCServerZone _saveItemID:stat:serverMetrics:record:error:]";
          v84 = 2080;
          if (!v66)
            v73 = "(ignored by caller)";
          v85 = v73;
          v86 = 2112;
          v87 = a7;
          v88 = 2112;
          v89 = v67;
          _os_log_error_impl(&dword_230455000, v68, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (v66)
        *v66 = objc_retainAutorelease(a7);

      LOBYTE(a7) = 0;
      v14 = v65;
    }
    goto LABEL_58;
  }
  brc_bread_crumbs();
  v60 = (id *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
  {
    -[BRCPQLConnection lastError](v33->_db, "lastError");
    v72 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v83 = (const char *)v11;
    v84 = 2112;
    v85 = v72;
    v86 = 2112;
    v87 = v60;
    _os_log_error_impl(&dword_230455000, v61, (os_log_type_t)0x90u, "[ERROR] Failed to update record (%@): %@%@", buf, 0x20u);

    v33 = self;
  }

  if (a7)
  {
    -[BRCPQLConnection lastError](v33->_db, "lastError");
    v43 = (char *)(id)objc_claimAutoreleasedReturnValue();
LABEL_49:
    v64 = a7;
    LOBYTE(a7) = 0;
    *v64 = v43;
  }
LABEL_58:

  return (char)a7;
}

- (BOOL)_saveItemID:(id)a3 version:(id)a4 record:(id)a5 contentBoundaryKey:(id)a6 iWorkSharingOptions:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  BRCPQLConnection *db;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v27 = a5;
  db = self->_db;
  v35 = a6;
  objc_msgSend(v12, "originalPOSIXName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ckInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v12, "mtime");
  v31 = objc_msgSend(v12, "size");
  v30 = objc_msgSend(v12, "thumbnailSize");
  objc_msgSend(v12, "thumbnailSignature");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentSignature");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xattrSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "editedSinceShared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastEditorDeviceOrUserRowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conflictLoserEtags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quarantineInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE server_items    SET item_rank = NULL, item_depth = 0, item_sharing_options = (%lu | (item_sharing_options & %lu)),         content_boundary_key = %@, version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@  WHERE item_id = %@ AND zone_rowid = %@"), a7, -8, v35, v34, v33, v32, v31, v30, v29, v28, v13, v14, v15, v16, v17, v11,
          self->_dbRowID);

  if (!v18)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
    {
      v21 = v27;
      objc_msgSend(v27, "debugDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection lastError](self->_db, "lastError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      v42 = 2112;
      v43 = v22;
      _os_log_error_impl(&dword_230455000, v23, (os_log_type_t)0x90u, "[ERROR] failed saving document %@: %@%@", buf, 0x20u);

      v19 = 0;
      v20 = v11;
    }
    else
    {
      v19 = 0;
      v21 = v27;
      v20 = v11;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (-[BRCPQLConnection changes](self->_db, "changes") != 1)
  {
    v21 = v27;
    v20 = v11;
    if ((-[BRCServerZone state](self, "state") & 4) != 0 || -[BRCPQLConnection changes](self->_db, "changes"))
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v11;
        v40 = 2112;
        v41 = v12;
        v42 = 2112;
        v43 = v22;
        _os_log_fault_impl(&dword_230455000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: document without a structure:\n    i:%@ %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n       failed inserting the structure record,\n    - or the server forgot to send us a structure record.%@", buf, 0x20u);
      }
      v19 = 0;
    }
    else
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 1;
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v39 = v11;
        v40 = 2112;
        v41 = v12;
        v42 = 2112;
        v43 = v22;
        _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Document without a structure record but we haven't completed full sync.  Dropping the record on the floor for now i:%@ %@%@", buf, 0x20u);
      }
    }
    goto LABEL_11;
  }
  v19 = 1;
  v21 = v27;
  v20 = v11;
LABEL_12:

  return v19;
}

- (BOOL)_saveEditedDirOrDocStructureRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCAccountSessionFPFS *session;
  char v12;
  BOOL v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  char *v20;
  const char *v21;
  id obj;
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = 0;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = 0;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone _saveEditedDirOrDocStructureRecord:error:].cold.1();

  if (!v8)
  {
    v14 = location;
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v27 = "-[BRCServerZone _saveEditedDirOrDocStructureRecord:error:]";
        v28 = 2080;
        if (!a4)
          v21 = "(ignored by caller)";
        v29 = (id)v21;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_230455000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    goto LABEL_16;
  }
  session = self->_session;
  obj = location;
  v12 = objc_msgSend(v6, "deserializeStatInfo:serverMetrics:itemID:session:error:", &v24, &v23, v8, session, &obj);
  objc_storeStrong(&location, obj);
  if ((v12 & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      objc_msgSend(v6, "debugDescription");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v20;
      v28 = 2112;
      v29 = location;
      v30 = 2112;
      v31 = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

    }
    if (a4)
    {
      v13 = 0;
      *a4 = objc_retainAutorelease(location);
      goto LABEL_17;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v13 = -[BRCServerZone _saveItemID:stat:serverMetrics:record:error:](self, "_saveItemID:stat:serverMetrics:record:error:", v8, v24, v23, v6, a4);
LABEL_17:

  return v13;
}

- (BOOL)_saveEditedDocumentContentRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  id *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  BRCAccountSessionFPFS *session;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  char *v38;
  BOOL v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BRFieldUserIdentity *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  int v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  BRCServerZone *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  id obj;
  id v74;
  id v75;
  id v76;
  id location;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = 0;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BRCServerZone isSharedZone](self, "isSharedZone"))
  {
    objc_msgSend(v6, "share");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone _saveEditedDocumentContentRecord:error:].cold.3();

  if (!v8)
  {
    v33 = location;
    if (v33)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v79 = "-[BRCServerZone _saveEditedDocumentContentRecord:error:]";
        v80 = 2080;
        if (!a4)
          v46 = "(ignored by caller)";
        v81 = (id)v46;
        v82 = 2112;
        v83 = v33;
        v84 = 2112;
        v85 = v34;
        _os_log_error_impl(&dword_230455000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v33);

    v17 = 0;
    v18 = 0;
    v16 = 0;
    goto LABEL_38;
  }
  v76 = 0;
  if (v10)
    v13 = &v75;
  else
    v13 = 0;
  if (v10)
    v75 = 0;
  v74 = 0;
  -[BRCServerZone clientZone](self, "clientZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  obj = location;
  v15 = objc_msgSend(v6, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:error:", &v76, v13, &v74, v14, &obj);
  v16 = v76;
  v17 = 0;
  if (v10)
    v17 = v75;
  v18 = v74;
  objc_storeStrong(&location, obj);

  if ((v15 & 1) != 0)
  {
    if (v10
      && !-[BRCServerZone _saveItemID:stat:serverMetrics:record:error:](self, "_saveItemID:stat:serverMetrics:record:error:", v8, v17, 0, v6, a4))
    {
      goto LABEL_38;
    }
    v71 = location;
    v72 = 0;
    v19 = objc_msgSend(v6, "deserializeiWorkSharingOptions:error:", &v72, &v71);
    objc_storeStrong(&location, v71);
    if ((v19 & 1) != 0)
    {
      objc_msgSend(v6, "creatorUserRecordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recordName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCAccountSessionFPFS cachedCurrentUserRecordName](self->_session, "cachedCurrentUserRecordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      objc_msgSend(v6, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v21, &v70);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v70;

      if (v22)
      {
        if ((objc_msgSend(v63, "isEqualToString:", v22) & 1) == 0)
        {
          objc_msgSend(v16, "editedSinceShared");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if ((v24 & 1) == 0)
          {
            v25 = v22;
            brc_bread_crumbs();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              -[BRCServerZone _saveEditedDocumentContentRecord:error:].cold.2();

            objc_msgSend(v16, "setEditedSinceShared:", MEMORY[0x24BDBD1C8]);
            v22 = v25;
          }
        }
      }
      if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDB8E88]))
      {
        objc_msgSend(v16, "lastEditorDeviceName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "rangeOfString:", CFSTR(":_"));
        session = self->_session;
        v31 = v22;
        if (v29 == 64)
        {
          -[BRCAccountSessionFPFS createUserKeyForOwnerName:](session, "createUserKeyForOwnerName:", v22);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLastEditorRowID:", v32);
        }
        else
        {
          -[BRCAccountSessionFPFS createDeviceKeyForNameInServerDB:](session, "createDeviceKeyForNameInServerDB:", v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLastEditorDeviceRowID:", v32);
        }

        v22 = v31;
        goto LABEL_54;
      }
      -[BRCAccountSessionFPFS createUserKeyForOwnerName:](self->_session, "createUserKeyForOwnerName:", v22);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLastEditorRowID:", v41);

      if (!v64)
      {
        v28 = 0;
LABEL_54:
        v50 = v63;
        goto LABEL_55;
      }
      -[BRCAccountSessionFPFS serverDB](self->_session, "serverDB");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v22;
      +[BRCAccountSessionFPFS userIdentityForName:db:](BRCAccountSessionFPFS, "userIdentityForName:db:", v22, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v43)
        v45 = v43;
      else
        v45 = objc_alloc_init(BRFieldUserIdentity);
      v28 = v45;

      objc_msgSend(v28, "nameComponents");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        v48 = (void *)v47;
        objc_msgSend(v28, "nameComponents");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v49, "br_shouldOverwriteExistingName") & 1) != 0)
        {
          v60 = objc_msgSend(v64, "br_shouldOverwriteExistingName");

          if ((v60 & 1) == 0)
            goto LABEL_53;
        }
        else
        {

        }
        v22 = v61;
        v50 = v63;
LABEL_55:

        if (objc_msgSend(v16, "isPackage"))
        {
          v68 = location;
          v69 = 0;
          v51 = objc_msgSend(v6, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, 0, 0, &v69, 0, &v68);
          objc_storeStrong(&location, v68);
          if ((v51 & 1) == 0)
          {
            brc_bread_crumbs();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              v79 = (const char *)location;
              v80 = 2112;
              v81 = v6;
              v82 = 2112;
              v83 = v54;
              _os_log_fault_impl(&dword_230455000, v55, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't deserialize extension: %@ of %@%@", buf, 0x20u);
            }

            if (a4)
              *a4 = objc_retainAutorelease(location);

            v39 = 0;
            goto LABEL_73;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignorePkgExtension"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v62 = v22;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v53 = objc_msgSend(v52, "BOOLValue");
          else
            v53 = 0;
          if (v69)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ((objc_msgSend(v69, "brc_isForcedPackageExtension") | v53) & 1) == 0)
            {
              brc_bread_crumbs();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                -[BRCServerZone _saveEditedDocumentContentRecord:error:].cold.1();

              objc_msgSend(MEMORY[0x24BDD17C8], "brc_addForcedPackageExtension:", v69);
            }
          }

          v22 = v62;
        }
        -[BRCAccountSessionFPFS analyticsReporter](self->_session, "analyticsReporter");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __56__BRCServerZone__saveEditedDocumentContentRecord_error___block_invoke;
        v65[3] = &unk_24FE432D8;
        v59 = v6;
        v66 = v59;
        v67 = self;
        objc_msgSend(v58, "lookupFSEventToSyncUpEventByItemID:accessor:", v8, v65);

        v39 = -[BRCServerZone _saveItemID:version:record:contentBoundaryKey:iWorkSharingOptions:](self, "_saveItemID:version:record:contentBoundaryKey:iWorkSharingOptions:", v8, v16, v59, v18, v72);
LABEL_73:

        goto LABEL_39;
      }
LABEL_53:
      objc_msgSend(v28, "setNameComponents:", v64);
      v22 = v61;
      -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE users SET user_plist = %@ WHERE user_name = %@"), v28, v61);
      goto LABEL_54;
    }
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
      goto LABEL_36;
    objc_msgSend(v6, "debugDescription");
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v79 = v38;
    v80 = 2112;
    v81 = location;
    v82 = 2112;
    v83 = v36;
  }
  else
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
      goto LABEL_36;
    objc_msgSend(v6, "debugDescription");
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v79 = v38;
    v80 = 2112;
    v81 = location;
    v82 = 2112;
    v83 = v36;
  }
  _os_log_error_impl(&dword_230455000, v37, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

LABEL_36:
  if (!a4)
  {
LABEL_38:
    v39 = 0;
    goto LABEL_39;
  }
  v39 = 0;
  *a4 = objc_retainAutorelease(location);
LABEL_39:

  return v39;
}

void __56__BRCServerZone__saveEditedDocumentContentRecord_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndTime:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "analyticsReporter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitEventMetric:", v4);

}

- (BOOL)_saveEditedSymlinkRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCAccountSessionFPFS *session;
  char v12;
  char v13;
  BOOL v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  char *v26;
  const char *v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  id v32;
  id obj;
  id v34;
  id location;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = 0;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_itemIDWithSession:error:", self->_session, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone _saveEditedSymlinkRecord:error:].cold.1();

  if (!v8)
  {
    v15 = location;
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[BRCServerZone _saveEditedSymlinkRecord:error:]";
        v38 = 2080;
        if (!a4)
          v27 = "(ignored by caller)";
        v39 = (id)v27;
        v40 = 2112;
        v41 = v15;
        v42 = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v15);

    goto LABEL_19;
  }
  session = self->_session;
  obj = location;
  v12 = objc_msgSend(v6, "deserializeStatInfo:serverMetrics:itemID:session:error:", &v34, 0, v8, session, &obj);
  objc_storeStrong(&location, obj);
  if ((v12 & 1) != 0)
  {
    if (-[BRCServerZone _saveItemID:stat:serverMetrics:record:error:](self, "_saveItemID:stat:serverMetrics:record:error:", v8, v34, 0, v6, a4))
    {
      v31 = location;
      v32 = 0;
      v13 = objc_msgSend(v6, "deserializeSymlinkTarget:error:", &v32, &v31);
      objc_storeStrong(&location, v31);
      if ((v13 & 1) != 0)
      {
        if (-[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items    SET version_name = %@  WHERE item_id = %@ AND zone_rowid = %@"), v32, v8, self->_dbRowID))
        {
          v14 = 1;
LABEL_31:

          goto LABEL_20;
        }
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        {
          objc_msgSend(v6, "debugDescription");
          v29 = (char *)objc_claimAutoreleasedReturnValue();
          -[BRCPQLConnection lastError](self->_db, "lastError");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v37 = v29;
          v38 = 2112;
          v39 = v30;
          v40 = 2112;
          v41 = v24;
          _os_log_error_impl(&dword_230455000, v25, (os_log_type_t)0x90u, "[ERROR] failed saving symlink %@: %@%@", buf, 0x20u);

        }
        if (a4)
        {
          -[BRCPQLConnection lastError](self->_db, "lastError");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      else
      {
        brc_bread_crumbs();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          objc_msgSend(v6, "debugDescription");
          v28 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v37 = v28;
          v38 = 2112;
          v39 = location;
          v40 = 2112;
          v41 = v21;
          _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

        }
        if (a4)
        {
          v23 = objc_retainAutorelease(location);
LABEL_29:
          v14 = 0;
          *a4 = v23;
          goto LABEL_31;
        }
      }
      v14 = 0;
      goto LABEL_31;
    }
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    objc_msgSend(v6, "debugDescription");
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = v26;
    v38 = 2112;
    v39 = location;
    v40 = 2112;
    v41 = v18;
    _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

  }
  if (!a4)
  {
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v14 = 0;
  *a4 = objc_retainAutorelease(location);
LABEL_20:

  return v14;
}

- (BOOL)_saveEditedFinderBookmarkRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCAccountSessionFPFS *session;
  char v12;
  id v13;
  BRCClientZone *clientZone;
  char v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone _saveEditedFinderBookmarkRecord:error:].cold.1();

  session = self->_session;
  v31 = 0;
  v12 = objc_msgSend(v6, "deserializeStatInfo:serverMetrics:itemID:session:error:", &v32, 0, v8, session, &v31);
  v13 = v31;
  if ((v12 & 1) != 0)
  {
    if (-[BRCServerZone _saveItemID:stat:serverMetrics:record:error:](self, "_saveItemID:stat:serverMetrics:record:error:", v8, v32, 0, v6, a4))
    {
      v29 = 0;
      v30 = 0;
      clientZone = self->_clientZone;
      v28 = v13;
      v15 = objc_msgSend(v6, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:error:", &v30, 0, &v29, clientZone, &v28);
      v16 = v30;
      v17 = v29;
      v18 = v28;

      if ((v15 & 1) != 0)
      {
        v19 = -[BRCServerZone _saveItemID:version:record:contentBoundaryKey:iWorkSharingOptions:](self, "_saveItemID:version:record:contentBoundaryKey:iWorkSharingOptions:", v8, v16, v6, v17, 0);
LABEL_18:
        v13 = v18;
        goto LABEL_19;
      }
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        objc_msgSend(v6, "debugDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v27;
        v35 = 2112;
        v36 = v18;
        v37 = 2112;
        v38 = v23;
        _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

      }
      if (!a4)
      {
        v19 = 0;
        goto LABEL_18;
      }
      v22 = objc_retainAutorelease(v18);
      v13 = v22;
      goto LABEL_11;
    }
LABEL_12:
    v17 = 0;
    v16 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    objc_msgSend(v6, "debugDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v26;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v20;
    _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

  }
  if (!a4)
    goto LABEL_12;
  v22 = objc_retainAutorelease(v13);
  v13 = v22;
  v17 = 0;
  v16 = 0;
LABEL_11:
  v19 = 0;
  *a4 = v22;
LABEL_19:

  return v19;
}

- (BOOL)_saveEditedAliasRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BRCAccountSessionFPFS *session;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  void *v20;
  const __CFString *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  BRCPQLConnection *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  BOOL v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  NSObject *v50;
  char *v52;
  const char *v53;
  char *v54;
  void *v55;
  char *v56;
  uint64_t v57;
  id *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  BRCZoneRowID *dbRowID;
  BRCPQLConnection *db;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  const __CFString **v74;
  id location;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  session = self->_session;
  objc_msgSend(v8, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ownerName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS userKeyForOwnerName:db:](session, "userKeyForOwnerName:db:", v13, self->_db);
  v14 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v14;
  if (v14)
  {
    location = 0;
    objc_msgSend(v8, "recordID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "brc_itemIDWithSession:error:", self->_session, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:].cold.2();

    if (v16)
    {
      v73 = location;
      v19 = objc_msgSend(v8, "deserializeAliasInfo:serverZone:error:", &v74, self, &v73);
      objc_storeStrong(&location, v73);
      if ((v19 & 1) != 0)
      {
        v58 = a5;
        v71 = v9;
        dbRowID = self->_dbRowID;
        db = self->_db;
        objc_msgSend(v8, "parent");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "ckInfo");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v74, "state");
        v64 = objc_msgSend(v74, "type");
        v63 = objc_msgSend(v74, "mode");
        v62 = objc_msgSend(v74, "birthtime");
        v61 = objc_msgSend(v74, "lastUsedTime");
        v60 = objc_msgSend(v74, "favoriteRank");
        objc_msgSend(v74, "parentID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74[7])
          v21 = v74[7];
        else
          v21 = &stru_24FE4A790;
        v22 = objc_msgSend(v74, "isHiddenExt");
        objc_msgSend(v74, "finderTags");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "xattrSignature");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "trashPutBackPath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "trashPutBackParentID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "aliasTarget");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "creatorRowID");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v16;
        v29 = (void *)v27;
        v57 = v69;
        v70 = v28;
        v30 = 1;
        if (v66)
          v30 = 2;
        v31 = -[BRCPQLConnection execute:](db, "execute:", CFSTR("INSERT OR REPLACE INTO server_items(zone_rowid, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_rank, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator) VALUES(%@, %d, %@, %@, %ld, %@, NULL, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@)"), dbRowID, v30, v28, v72, 0, 0, v65, v57, v64, v63, v62, v61, v60, v20, v21, v22,
                v59,
                v23,
                v24,
                v25,
                v26,
                v27);

        if (v31)
        {
          objc_msgSend(v74, "_aliasTargetMangledID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSessionFPFS clientZoneByMangledID:](self->_session, "clientZoneByMangledID:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v70;
          v9 = v71;
          if (objc_msgSend(v33, "isSharedZone"))
          {
            v34 = self->_db;
            objc_msgSend(v74, "_aliasTargetItemID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "dbRowID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCPQLConnection execute:](v34, "execute:", CFSTR("UPDATE server_items SET item_rank = NULL WHERE item_id = %@ AND zone_rowid = %@"), v35, v36);

            if (-[BRCPQLConnection changes](self->_db, "changes"))
            {
              brc_bread_crumbs();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v74, "_aliasTargetItemID");
                v56 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v77 = v56;
                v78 = 2112;
                v79 = v70;
                v80 = 2112;
                v81 = v37;
                _os_log_debug_impl(&dword_230455000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Requesting a new item rank for target %@ of %@%@", buf, 0x20u);

              }
              objc_msgSend(v33, "serverZone");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "addObject:", v39);

            }
          }

          v40 = 1;
          goto LABEL_37;
        }
        brc_bread_crumbs();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v50 = objc_claimAutoreleasedReturnValue();
        v9 = v71;
        if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        {
          objc_msgSend(v8, "debugDescription");
          v54 = (char *)objc_claimAutoreleasedReturnValue();
          -[BRCPQLConnection lastError](self->_db, "lastError");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v77 = v54;
          v78 = 2112;
          v79 = v55;
          v80 = 2112;
          v81 = v49;
          _os_log_error_impl(&dword_230455000, v50, (os_log_type_t)0x90u, "[ERROR] failed saving alias %@: %@%@", buf, 0x20u);

        }
        v16 = v70;
        a5 = v58;
        if (v58)
        {
          -[BRCPQLConnection lastError](self->_db, "lastError");
          v48 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
      }
      else
      {
        brc_bread_crumbs();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
        {
          objc_msgSend(v8, "debugDescription");
          v52 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v77 = v52;
          v78 = 2112;
          v79 = location;
          v80 = 2112;
          v81 = v46;
          _os_log_error_impl(&dword_230455000, v47, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

        }
        if (a5)
        {
          v48 = objc_retainAutorelease(location);
LABEL_35:
          v40 = 0;
          *a5 = v48;
LABEL_37:

          goto LABEL_38;
        }
      }
    }
    else
    {
      v43 = location;
      if (v43)
      {
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, (os_log_type_t)0x90u))
        {
          v53 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v77 = "-[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:]";
          v78 = 2080;
          if (!a5)
            v53 = "(ignored by caller)";
          v79 = (id)v53;
          v80 = 2112;
          v81 = v43;
          v82 = 2112;
          v83 = v44;
          _os_log_error_impl(&dword_230455000, v45, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v43);

    }
    v40 = 0;
    goto LABEL_37;
  }
  brc_bread_crumbs();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
    -[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:].cold.1(v8, (uint64_t)v41, v42);

  v40 = 0;
LABEL_38:

  return v40;
}

- (BOOL)_saveEditedShareRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38 = 0;
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brc_shareItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone _saveEditedShareRecord:error:].cold.4();

  v11 = -[BRCServerZone isSharedZone](self, "isSharedZone");
  objc_msgSend(v6, "currentUserParticipant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "role");

  if (v11)
  {
    if (v13 != 1)
      goto LABEL_9;
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _saveEditedShareRecord:error:].cold.2();
  }
  else
  {
    if (v13 == 1)
      goto LABEL_9;
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _saveEditedShareRecord:error:].cold.3();
  }

LABEL_9:
  -[BRCAccountSessionFPFS learnParticipantIdentitiesForShare:forceUpdate:](self->_session, "learnParticipantIdentitiesForShare:forceUpdate:", v6, 0);
  if (!v8)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_230455000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring unknown itemID on share%@", buf, 0xCu);
    }

    v17 = 0;
    goto LABEL_22;
  }
  v37 = 0;
  v16 = objc_msgSend(v6, "deserializeSharingOptions:error:", &v38, &v37);
  v17 = v37;
  if ((v16 & 1) == 0)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      objc_msgSend(v6, "debugDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v33;
      v41 = 2112;
      v42 = v17;
      v43 = 2112;
      v44 = v27;
      _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] can't deserialize %@: %@%@", buf, 0x20u);

    }
    if (a4)
    {
      v29 = objc_retainAutorelease(v17);
      v17 = v29;
LABEL_31:
      v26 = 0;
      *a4 = v29;
      goto LABEL_33;
    }
LABEL_32:
    v26 = 0;
    goto LABEL_33;
  }
  v18 = -2;
  if ((v38 & 0x20) == 0)
    v18 = -1;
  if (!-[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items    SET item_rank = NULL, item_sharing_options = (%lu | (item_sharing_options & %lu)),         item_mode = (%ld | (item_mode & %lu)), item_depth = 0  WHERE item_id = %@ AND zone_rowid = %@"), v38, 7, ((unint64_t)(v38 & 0x20) >> 5) ^ 1, v18, v8, self->_dbRowID))
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      objc_msgSend(v6, "debugDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection lastError](self->_db, "lastError");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v34;
      v41 = 2112;
      v42 = v35;
      v43 = 2112;
      v44 = v30;
      _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] failed saving document %@: %@%@", buf, 0x20u);

    }
    if (a4)
    {
      -[BRCPQLConnection lastError](self->_db, "lastError");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (-[BRCPQLConnection changes](self->_db, "changes") != 1)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCServerZone _saveEditedShareRecord:error:].cold.1();

    if (-[BRCServerZone isPrivateZone](self, "isPrivateZone"))
    {
      -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "recordName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "reportProblemWithType:recordName:", 10, v23);

    }
  }
LABEL_22:
  v26 = 1;
LABEL_33:

  return v26;
}

- (BOOL)_saveEditedRecord:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  BOOL v19;
  BOOL v20;
  char *v22;
  NSObject *v23;
  char *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  int v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "brc_isZoneRootRecordID");

  if (v14)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    goto LABEL_7;
  }
  objc_msgSend(v8, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "brc_isAppLibraryRootRecordID");

  if (v18)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
LABEL_6:
      -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:].cold.1();
LABEL_7:

LABEL_8:
    v19 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("structure")))
  {
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("directory/"))
      || objc_msgSend(v11, "hasPrefix:", CFSTR("documentStructure/")))
    {
      v20 = -[BRCServerZone _saveEditedDirOrDocStructureRecord:error:](self, "_saveEditedDirOrDocStructureRecord:error:", v8, a5);
    }
    else if (objc_msgSend(v11, "hasPrefix:", CFSTR("alias/"))
           || objc_msgSend(v11, "hasPrefix:", CFSTR("shareAlias/")))
    {
      v20 = -[BRCServerZone _saveEditedAliasRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedAliasRecord:zonesNeedingAllocRanks:error:", v8, v9, a5);
    }
    else if (objc_msgSend(v11, "hasPrefix:", CFSTR("symlink/")))
    {
      v20 = -[BRCServerZone _saveEditedSymlinkRecord:error:](self, "_saveEditedSymlinkRecord:error:", v8, a5);
    }
    else
    {
      if (!objc_msgSend(v11, "hasPrefix:", CFSTR("finderBookmark/")))
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:].cold.3();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: structure record which isn't a directory or document"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          brc_bread_crumbs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
          {
            v30 = "(passed to caller)";
            v31 = 136315906;
            v32 = "-[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:]";
            v33 = 2080;
            if (!a5)
              v30 = "(ignored by caller)";
            v34 = v30;
            v35 = 2112;
            v36 = v27;
            v37 = 2112;
            v38 = v28;
            _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v31, 0x2Au);
          }

        }
        if (a5)
          *a5 = objc_retainAutorelease(v27);

        goto LABEL_8;
      }
      v20 = -[BRCServerZone _saveEditedFinderBookmarkRecord:error:](self, "_saveEditedFinderBookmarkRecord:error:", v8, a5);
    }
LABEL_20:
    v19 = v20;
    goto LABEL_21;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("content")))
  {
    v20 = -[BRCServerZone _saveEditedDocumentContentRecord:error:](self, "_saveEditedDocumentContentRecord:error:", v8, a5);
    goto LABEL_20;
  }
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB8F28]))
  {
    v20 = -[BRCServerZone _saveEditedShareRecord:error:](self, "_saveEditedShareRecord:error:", v8, a5);
    goto LABEL_20;
  }
  brc_bread_crumbs();
  v22 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordType");
    v24 = (char *)objc_claimAutoreleasedReturnValue();
    v31 = 138412546;
    v32 = v24;
    v33 = 2112;
    v34 = v22;
    _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Consistent state but unknown record type (recordType: %@).%@", (uint8_t *)&v31, 0x16u);

  }
  v19 = 1;
LABEL_21:

  return v19;
}

- (BOOL)_markShareIDDead:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "brc_shareItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items AS si   SET item_sharing_options = ((item_sharing_options & %ld) | IFNULL((SELECT (pi.item_sharing_options & %ld) FROM server_items AS pi WHERE si.item_parent_id = pi.item_id AND si.zone_rowid = pi.zone_rowid), 0)) WHERE si.zone_rowid = %@ AND si.item_id = %@"), 7, 120, self->_dbRowID, v5);
  if (v6)
  {
    if (-[BRCPQLConnection changes](self->_db, "changes"))
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[BRCServerZone _markShareIDDead:].cold.1();
    }
    else
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] deleted shareID %@ was for already dead item%@", buf, 0x16u);
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      -[BRCPQLConnection lastError](self->_db, "lastError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v5;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] failed saving tombstone share %@: %@%@", buf, 0x20u);

    }
  }

  return v6;
}

- (BOOL)_markItemDeadForRecordID:(id)a3
{
  id v4;
  void *v5;
  BRCAccountSessionFPFS *session;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCPQLConnection *db;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    session = self->_session;
    objc_msgSend(v4, "zoneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ownerName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS userKeyForOwnerName:db:](session, "userKeyForOwnerName:db:", v8, self->_db);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BRCClientZone rootItemID](self->_clientZone, "rootItemID");
      v10 = objc_claimAutoreleasedReturnValue();
      db = self->_db;
      objc_msgSend(v5, "itemIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE server_items SET item_state = 1, item_filename = %@, item_rank = NULL, item_depth = 0, item_parent_id = %@ WHERE zone_rowid = %@ AND item_id = %@"), v12, v10, self->_dbRowID, v5);

      if ((v13 & 1) != 0)
      {
        if (-[BRCPQLConnection changes](self->_db, "changes"))
        {
          brc_bread_crumbs();
          v14 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[BRCServerZone _markItemDeadForRecordID:].cold.3();
        }
        else
        {
          brc_bread_crumbs();
          v14 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            -[BRCServerZone _markItemDeadForRecordID:].cold.2();
        }
      }
      else
      {
        brc_bread_crumbs();
        v14 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
        {
          -[BRCPQLConnection lastError](self->_db, "lastError");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v21 = v5;
          v22 = 2112;
          v23 = v16;
          v24 = 2112;
          v25 = v14;
          _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] failed saving tombstone %@: %@%@", buf, 0x20u);

        }
      }

    }
    else
    {
      brc_bread_crumbs();
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        objc_msgSend(v4, "zoneID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ownerName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v5;
        v22 = 2112;
        v23 = v19;
        v24 = 2112;
        v25 = v10;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", buf, 0x20u);

      }
      v13 = 0;
    }

  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _markItemDeadForRecordID:].cold.1();
    v13 = 1;
  }

  return v13;
}

- (BOOL)_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  BRCServerZone *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __119__BRCServerZone__savePendingChangesEditedStructureRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v12[3] = &unk_24FE43300;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v10 = objc_msgSend(a5, "enumerateRecordsOfType:block:", 1, v12);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __119__BRCServerZone__savePendingChangesEditedStructureRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v11 = 0;
    v6 = objc_msgSend(v7, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v5, v8, &v11);
    v9 = v11;
    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_reportCantSaveProblem:record:", v9, v5);

  }
  return v6;
}

- (BOOL)_savePendingChangesEditedContentRecordsIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  BRCServerZone *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __117__BRCServerZone__savePendingChangesEditedContentRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v12[3] = &unk_24FE43300;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v10 = objc_msgSend(a5, "enumerateRecordsOfType:block:", 2, v12);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __117__BRCServerZone__savePendingChangesEditedContentRecordsIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v11 = 0;
    v6 = objc_msgSend(v7, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v5, v8, &v11);
    v9 = v11;
    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_reportCantSaveProblem:record:", v9, v5);

  }
  return v6;
}

- (BOOL)_savePendingChangesDeletedRecordIDsIgnoringRecordIDs:(id)a3 pendingChangeStream:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  BRCServerZone *v14;
  _QWORD v15[4];
  id v16;
  BRCServerZone *v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke;
    v15[3] = &unk_24FE43328;
    v9 = v6;
    v16 = v9;
    v17 = self;
    if (objc_msgSend(v7, "enumerateRecordsOfType:block:", -1, v15))
    {
      if (-[BRCServerZone isSharedZone](self, "isSharedZone"))
      {
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke_2;
        v12[3] = &unk_24FE43328;
        v13 = v9;
        v14 = self;
        v10 = objc_msgSend(v7, "enumerateRecordsOfType:block:", -2, v12);

      }
      else
      {
        v10 = 1;
      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_markItemDeadForRecordID:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "asPrivateClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportProblemWithType:recordName:", 5, v6);

    v4 = 0;
  }

  return v4;
}

uint64_t __90__BRCServerZone__savePendingChangesDeletedRecordIDsIgnoringRecordIDs_pendingChangeStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_markItemDeadForRecordID:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "asPrivateClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportProblemWithType:recordName:", 5, v6);

    v4 = 0;
  }

  return v4;
}

- (BOOL)_savePendingChangesSharesIgnoringRecordIDs:(id)a3 zonesNeedingAllocRanks:(id)a4 pendingChangeStream:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  BRCServerZone *v17;
  _QWORD v18[4];
  id v19;
  BRCServerZone *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke;
    v18[3] = &unk_24FE43300;
    v12 = v8;
    v19 = v12;
    v20 = self;
    v21 = v9;
    if (objc_msgSend(v10, "enumerateRecordsOfType:block:", 3, v18))
    {
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke_2;
      v15[3] = &unk_24FE43328;
      v16 = v12;
      v17 = self;
      v13 = objc_msgSend(v10, "enumerateRecordsOfType:block:", -3, v15);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

uint64_t __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v11;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v11 = 0;
    v6 = objc_msgSend(v7, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v5, v8, &v11);
    v9 = v11;
    if ((v6 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_reportCantSaveProblem:record:", v9, v5);

  }
  return v6;
}

uint64_t __103__BRCServerZone__savePendingChangesSharesIgnoringRecordIDs_zonesNeedingAllocRanks_pendingChangeStream___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "_markShareIDDead:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "asPrivateClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportProblemWithType:recordName:", 5, v6);

    v4 = 0;
  }

  return v4;
}

- (BOOL)_saveEditedStructureRecords:(id)a3 zonesNeedingAllocRanks:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  BOOL v18;
  id v19;
  void *v20;
  BOOL v21;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = *MEMORY[0x24BDB8F28];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v12, "recordType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("content"));

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v12, "recordType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v10);

          if ((v17 & 1) == 0)
          {
            v25 = 0;
            v18 = -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v12, v24, &v25);
            v19 = v25;
            v20 = v19;
            if (!v18)
            {
              -[BRCServerZone _reportCantSaveProblem:record:](self, "_reportCantSaveProblem:record:", v19, v12);

              objc_autoreleasePoolPop(v13);
              v21 = 0;
              goto LABEL_14;
            }

          }
        }
        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_14:

  return v21;
}

- (BOOL)_saveDeletedRecordIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x2348B9F14](v5);
      objc_msgSend(v9, "recordName", (_QWORD)v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "hasPrefix:", CFSTR("documentContent/")))
        break;
      v12 = -[BRCServerZone isSharedZone](self, "isSharedZone");

      if (v12)
        goto LABEL_10;
LABEL_11:
      objc_autoreleasePoolPop(v10);
      if (v6 == ++v8)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v6 = v5;
        if (v5)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

LABEL_10:
    if (!-[BRCServerZone _markItemDeadForRecordID:](self, "_markItemDeadForRecordID:", v9))
    {
      -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportProblemWithType:recordName:", 5, v15);

      objc_autoreleasePoolPop(v10);
      v13 = 0;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_13:
  v13 = 1;
LABEL_15:

  return v13;
}

- (void)_reportCantSaveProblem:(id)a3 record:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE17430]))
  {
    v9 = objc_msgSend(v12, "code");

    if (v9 == 1005)
      v10 = 11;
    else
      v10 = 5;
  }
  else
  {

    v10 = 5;
  }
  -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportProblemWithType:recordName:", v10, v7);

}

- (BOOL)_saveEditedContentRecords:(id)a3 zonesNeedingAllocRanks:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  id v17;
  BOOL v18;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v12, "recordType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("content"));

        if (v15)
        {
          v22 = v9;
          v16 = -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v12, v21, &v22);
          v17 = v22;

          if (!v16)
          {
            -[BRCServerZone _reportCantSaveProblem:record:](self, "_reportCantSaveProblem:record:", v17, v12);
            objc_autoreleasePoolPop(v13);
            v18 = 0;
            goto LABEL_14;
          }
          v9 = v17;
        }
        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
    v18 = 1;
    v17 = v9;
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
LABEL_14:

  return v18;
}

- (BOOL)_saveEditedShareRecords:(id)a3 deletedShareRecordIDs:(id)a4 zonesNeedingAllocRanks:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  BOOL v29;
  void *v30;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v32 = a4;
  v33 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    v13 = *MEMORY[0x24BDB8F28];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x2348B9F14]();
        objc_msgSend(v15, "recordType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v13);

        if (v18)
        {
          v38 = 0;
          v19 = -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedRecord:zonesNeedingAllocRanks:error:", v15, v33, &v38);
          v20 = v38;
          v21 = v20;
          if (!v19)
          {
            -[BRCServerZone _reportCantSaveProblem:record:](self, "_reportCantSaveProblem:record:", v20, v15);
            v23 = v9;
            v22 = v32;
LABEL_22:

            objc_autoreleasePoolPop(v16);
            v29 = 0;
            goto LABEL_23;
          }

        }
        objc_autoreleasePoolPop(v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v11)
        continue;
      break;
    }
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v32;
  v23 = v32;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v16 = (void *)MEMORY[0x2348B9F14]();
        if (!-[BRCServerZone _markShareIDDead:](self, "_markShareIDDead:", v28))
        {
          -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "recordName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "reportProblemWithType:recordName:", 5, v30);

          goto LABEL_22;
        }
        objc_autoreleasePoolPop(v16);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      v29 = 1;
      if (v25)
        continue;
      break;
    }
  }
  else
  {
    v29 = 1;
  }
LABEL_23:

  return v29;
}

- (BOOL)_recoverFromCorruptShareOptionsWithItemType:(char)a3 itemID:(id)a4 parentID:(id)a5 sharingOptions:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v8 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  if (-[BRCServerZone isPrivateZone](self, "isPrivateZone"))
  {
    if (v8 <= 8 && ((1 << v8) & 0x106) != 0)
    {
      v12 = CFSTR("documentContent/");
    }
    else
    {
      +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", v8, 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reportProblemWithType:recordName:", 13, v16);

  }
  if (objc_msgSend(v11, "isSharedZoneRoot") && -[BRCServerZone isSharedZone](self, "isSharedZone"))
  {
    v17 = a6 | 4;
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:].cold.2();
  }
  else
  {
    if (-[BRCServerZone isSharedZone](self, "isSharedZone"))
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:].cold.3();
      goto LABEL_21;
    }
    v17 = a6 & 0xFFFFFFFFFFFFFF83;
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:].cold.4();
  }

  if (!-[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items SET item_sharing_options = %ld WHERE item_id = %@ AND zone_rowid = %@"), v17, v10, self->_dbRowID))
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      -[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:].cold.1();
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 1;
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Recovered sharing options on %@ by setting ck share options to null%@", buf, 0x16u);
  }
LABEL_22:

  return v22;
}

- (void)_recomputeMinLastUsedTime
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfGreedyRecentlyUsedItems");

  if (v4)
  {
    v5 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT item_lastusedtime FROM server_items ORDER BY item_lastusedtime DESC LIMIT 1 OFFSET %lld"), v4);
    v6 = objc_msgSend(v5, "unsignedLongLongValue");

  }
  else
  {
    v6 = -1;
  }
  -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "minLastUsedTime");

  if (v8 != v6)
  {
    -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMinLastUsedTime:", v6);

    -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveToDB:", self->_db);

  }
}

- (BOOL)allocateRanksWhenCaughtUp:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  int v15;
  _UNKNOWN **v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  unint64_t v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  const char *v98;
  const char *v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  void *v106;
  uint64_t v107;
  unsigned int v108;
  _BOOL4 v109;
  void *context;
  uint64_t v111;
  void *v112;
  _QWORD block[5];
  id v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  _BYTE v118[18];
  __int16 v119;
  void *v120;
  uint64_t v121;

  v109 = a3;
  v121 = *MEMORY[0x24BDAC8D0];
  -[BRCServerZone _recomputeMinLastUsedTime](self, "_recomputeMinLastUsedTime");
  -[BRCServerZone mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maxSyncPathDepth");

  -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v7, "nextRank");

  v108 = -[BRCServerZone state](self, "state");
  if ((v108 & 4) != 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCServerZone allocateRanksWhenCaughtUp:].cold.1();

    v109 = 1;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v98 = "NO";
    if (v109)
      v99 = "YES";
    else
      v99 = "NO";
    *(_DWORD *)buf = 136315650;
    v116 = (uint64_t)v99;
    if ((v108 & 4) != 0)
      v98 = "YES";
    v117 = 2080;
    *(_QWORD *)v118 = v98;
    *(_WORD *)&v118[8] = 2112;
    *(_QWORD *)&v118[10] = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] caughtUp [%s] fullSync [%s]%@", buf, 0x20u);
  }

  if ((v108 & 4) != 0)
  {
    v12 = "";
    v13 = 0;
  }
  else if (v109)
  {
    v12 = " AND item_depth >= -1";
    v13 = 21;
  }
  else
  {
    v12 = " AND item_depth >= 0";
    v13 = 20;
  }
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", v12, v13);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid, item_id, item_parent_id, item_state, item_type, version_ckinfo, item_favoriterank, item_lastusedtime, item_finder_tags IS NOT NULL, item_sharing_options   FROM server_items  WHERE zone_rowid = %@ AND item_rank IS NULL%@"), self->_dbRowID, v106);
  if (objc_msgSend(v14, "next"))
  {
    v15 = (v108 >> 2) & 1;
    v102 = v15 | v109;
    v105 = v15 & v109;
    v16 = &off_24FE3D000;
    v103 = v6;
    v104 = v6;
    do
    {
      v17 = MEMORY[0x2348B9F14]();
      v111 = objc_msgSend(v14, "unsignedLongLongAtIndex:", 0);
      objc_msgSend(v14, "objectOfClass:atIndex:", objc_opt_class(), 1);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectOfClass:atIndex:", objc_opt_class(), 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "charAtIndex:", 3);
      v20 = objc_msgSend(v14, "charAtIndex:", 4);
      v21 = objc_msgSend(v14, "integerAtIndex:", 9);
      context = (void *)v17;
      if (v19 == 1)
      {
        if (!-[BRCServerZone isSharedZone](self, "isSharedZone"))
        {
          v28 = v112;
          v29 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_state = 0 LIMIT 1"), self->_dbRowID, v112);
          if (objc_msgSend(v29, "BOOLValue"))
          {
            brc_bread_crumbs();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v116 = (uint64_t)v112;
              v117 = 2112;
              *(_QWORD *)v118 = v30;
              _os_log_debug_impl(&dword_230455000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Server killed %@ but it still has live children%@", buf, 0x16u);
            }

            if (v109)
            {
              v32 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_state = 0"), self->_dbRowID, v112);

              brc_bread_crumbs();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                v80 = objc_msgSend(objc_retainAutorelease(v112), "UTF8String");
                v81 = objc_msgSend(v32, "intValue");
                *(_DWORD *)buf = 136315650;
                v116 = v80;
                v28 = v112;
                v117 = 1024;
                *(_DWORD *)v118 = v81;
                *(_WORD *)&v118[4] = 2112;
                *(_QWORD *)&v118[6] = v33;
                _os_log_fault_impl(&dword_230455000, v34, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server killed %s but it still has %d live children%@", buf, 0x1Cu);
              }

              -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
              v35 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "itemIDString");
              v36 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("directory/"), "stringByAppendingString:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject reportProblemWithType:recordName:](v35, "reportProblemWithType:recordName:", 3, v37);

            }
            else
            {
              brc_bread_crumbs();
              v35 = objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                v82 = objc_msgSend(v29, "intValue");
                *(_DWORD *)buf = 138412802;
                v116 = (uint64_t)v112;
                v117 = 1024;
                *(_DWORD *)v118 = v82;
                *(_WORD *)&v118[4] = 2112;
                *(_QWORD *)&v118[6] = v35;
                _os_log_debug_impl(&dword_230455000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] State inconsistent because %@ has %d live children%@", buf, 0x1Cu);
              }
              v32 = v29;
            }

            v39 = 0;
            v23 = -1;
            v29 = v32;
            goto LABEL_66;
          }
          v39 = 0;
          v23 = 0x7FFFFFFFLL;
LABEL_67:

          goto LABEL_68;
        }
        v22 = 0;
        v23 = 0x7FFFFFFFLL;
      }
      else
      {
        v24 = v21;
        if ((_DWORD)v20 == 1)
        {
          objc_msgSend(v14, "dataAtIndex:", 5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            if (v105)
            {
              brc_bread_crumbs();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v116 = (uint64_t)v112;
                v117 = 2112;
                *(_QWORD *)v118 = v46;
                _os_log_fault_impl(&dword_230455000, v47, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: State inconsistent because %@ is a document with no version%@", buf, 0x16u);
              }

              -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16[388], "structureRecordPrefixForItemType:targetZoneShared:", 1, 0);
              v49 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "itemIDString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject stringByAppendingString:](v49, "stringByAppendingString:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "reportProblemWithType:recordName:", 4, v51);

LABEL_47:
            }
            else
            {
              brc_bread_crumbs();
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v112, "itemIDString");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v116 = (uint64_t)v50;
                v117 = 2112;
                *(_QWORD *)v118 = v48;
                _os_log_debug_impl(&dword_230455000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] We haven't received a content record on %@ yet, delaying for now%@", buf, 0x16u);
                goto LABEL_47;
              }
            }

            -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items SET item_type = 9, item_rank = NULL WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 0"), v18, self->_dbRowID);
            if (!-[BRCPQLConnection changes](self->_db, "changes"))
            {
              v22 = 0;
              v23 = -3;
              goto LABEL_69;
            }
            brc_bread_crumbs();
            v29 = (id)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v116 = (uint64_t)v18;
              v117 = 2112;
              *(_QWORD *)v118 = v29;
              _os_log_debug_impl(&dword_230455000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %@ to be a directory fault because it has a new unapplied item%@", buf, 0x16u);
            }
            v39 = 0;
            v23 = -3;
LABEL_66:

            goto LABEL_67;
          }
        }
        if ((objc_msgSend(v18, "isNonDesktopRoot") & 1) == 0)
        {
          v22 = -[BRCPQLConnection fetchWithSlowStatementRadar:sql:](self->_db, "fetchWithSlowStatementRadar:sql:", CFSTR("<rdar://problem/37451020>"), CFSTR("WITH RECURSIVE item_parents (item_id, item_state, item_type, depth) AS(    SELECT item_id, item_state, item_type, 0       FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT p.item_parent_id, c.item_state, c.item_type, c.depth + 1       FROM server_items AS p INNER JOIN item_parents AS c USING (item_id)      WHERE p.zone_rowid = %@      LIMIT %u) SELECT item_state, depth, item_type FROM item_parents WHERE item_id_is_root(item_id) OR item_type = 4"), self->_dbRowID, v18, self->_dbRowID, v6);
          if ((objc_msgSend(v22, "next") & 1) != 0)
          {
            v38 = objc_msgSend(v22, "charAtIndex:", 2);
            if (v38 <= 0xA && ((1 << v38) & 0x611) != 0)
            {
              if (v19 || !objc_msgSend(v22, "unsignedIntegerAtIndex:", 0))
              {
                v23 = objc_msgSend(v22, "unsignedIntegerAtIndex:", 1);
              }
              else
              {
                if (v109)
                {
                  brc_bread_crumbs();
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v62 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                  {
                    v84 = objc_msgSend(objc_retainAutorelease(v112), "UTF8String");
                    v85 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
                    *(_DWORD *)buf = 136315650;
                    v116 = v84;
                    v117 = 2080;
                    *(_QWORD *)v118 = v85;
                    *(_WORD *)&v118[8] = 2112;
                    *(_QWORD *)&v118[10] = v61;
                    _os_log_fault_impl(&dword_230455000, v62, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent live item %s parented to dead item %s%@", buf, 0x20u);
                  }

                  -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", v20, 0);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "itemIDString");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "stringByAppendingString:", v65);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "reportProblemWithType:recordName:", 1, v66);

                  v16 = &off_24FE3D000;
                  v23 = -1;
                  goto LABEL_82;
                }
                brc_bread_crumbs();
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v76 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v116 = (uint64_t)v112;
                  v117 = 2112;
                  *(_QWORD *)v118 = v18;
                  *(_WORD *)&v118[8] = 2112;
                  *(_QWORD *)&v118[10] = v75;
                  _os_log_impl(&dword_230455000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] Server sent us live item %@ parented to dead item %@ but we haven't completed full sync. Delaying apply%@", buf, 0x20u);
                }

                v23 = -1;
              }
LABEL_96:
              if ((v24 & 0x48) == 0 || (v24 & 4) != 0 || v23 < 0)
                goto LABEL_69;
              v39 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("WITH RECURSIVE item_parents (item_parent_id, item_sharing_options) AS(    SELECT item_parent_id, item_sharing_options       FROM server_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT p.item_parent_id, p.item_sharing_options       FROM server_items AS p INNER JOIN item_parents AS c      WHERE p.zone_rowid = %@        AND c.item_parent_id = p.item_id      LIMIT %u) SELECT 1 FROM item_parents WHERE (item_sharing_options & 4) != 0"), self->_dbRowID, v18, self->_dbRowID, v103);

              if ((objc_msgSend(v39, "next") & 1) == 0)
              {
                if (!v102)
                {
                  brc_bread_crumbs();
                  v29 = (id)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    v116 = (uint64_t)v112;
                    v117 = 2112;
                    *(_QWORD *)v118 = v18;
                    *(_WORD *)&v118[8] = 2112;
                    *(_QWORD *)&v118[10] = v29;
                    _os_log_debug_impl(&dword_230455000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Server sent us an item %@ which we couldn't locate share for, but we aren't caught up yet (parented to %@)%@", buf, 0x20u);
                  }
                  goto LABEL_51;
                }
                brc_bread_crumbs();
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v116 = (uint64_t)v112;
                  v117 = 2112;
                  *(_QWORD *)v118 = v18;
                  *(_WORD *)&v118[8] = 2112;
                  *(_QWORD *)&v118[10] = v101;
                  _os_log_fault_impl(&dword_230455000, v79, OS_LOG_TYPE_FAULT, "[CRIT] Server sent us an item %@ which has non-root share options but isn't parented to a share (parented to %@)%@", buf, 0x20u);
                }

                if (!-[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:](self, "_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:", v20, v112, v18, v24))
                {
                  brc_bread_crumbs();
                  v29 = (id)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v116 = (uint64_t)v112;
                    v117 = 2112;
                    *(_QWORD *)v118 = v18;
                    *(_WORD *)&v118[8] = 2112;
                    *(_QWORD *)&v118[10] = v29;
                    _os_log_fault_impl(&dword_230455000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent us an item %@ which has non-root share options but isn't parented to a share (parented to %@)%@", buf, 0x20u);
                  }
LABEL_51:
                  v23 = -4;
                  goto LABEL_66;
                }
              }
LABEL_68:
              v22 = v39;
              goto LABEL_69;
            }
            brc_bread_crumbs();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              v116 = (uint64_t)v112;
              v117 = 2112;
              *(_QWORD *)v118 = v18;
              *(_WORD *)&v118[8] = 2112;
              *(_QWORD *)&v118[10] = v67;
              _os_log_fault_impl(&dword_230455000, v68, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent item %@ which is parented to a non-directory %@%@", buf, 0x20u);
            }

            -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCItemID structureRecordPrefixForItemType:targetZoneShared:](BRCItemID, "structureRecordPrefixForItemType:targetZoneShared:", v20, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "itemIDString");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "stringByAppendingString:", v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "reportProblemWithType:recordName:", 8, v72);

            v16 = &off_24FE3D000;
            v23 = -5;
LABEL_82:
            v6 = v104;
            goto LABEL_96;
          }
          if ((v108 & 4) != 0)
          {
            brc_bread_crumbs();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              v83 = objc_msgSend(objc_retainAutorelease(v112), "UTF8String");
              *(_DWORD *)buf = 136315394;
              v116 = v83;
              v117 = 2112;
              *(_QWORD *)v118 = v40;
              _os_log_fault_impl(&dword_230455000, v41, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent item %s which isn't a descendant of 'root'%@", buf, 0x16u);
            }

            -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16[388], "structureRecordPrefixForItemType:targetZoneShared:", v20, 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "itemIDString");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringByAppendingString:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "reportProblemWithType:recordName:", 2, v45);

            v16 = &off_24FE3D000;
            v23 = -2;
            goto LABEL_82;
          }
          brc_bread_crumbs();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v116 = (uint64_t)v112;
            v117 = 2112;
            *(_QWORD *)v118 = v18;
            *(_WORD *)&v118[8] = 2112;
            *(_QWORD *)&v118[10] = v52;
            _os_log_debug_impl(&dword_230455000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Found orphan when we haven't completed initial sync item [%@] parent [%@].  Delaying apply for now%@", buf, 0x20u);
          }

          v54 = objc_msgSend(v14, "unsignedLongLongAtIndex:", 7);
          if (objc_msgSend(v14, "unsignedLongLongAtIndex:", 6))
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v116 = (uint64_t)v55;
              v57 = v56;
              v58 = "[DEBUG] Orphan has favorite rank so fetching parent chain%@";
              goto LABEL_93;
            }
LABEL_94:

            -[BRCClientZone db](self->_clientZone, "db");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "serialQueue");
            v78 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __43__BRCServerZone_allocateRanksWhenCaughtUp___block_invoke;
            block[3] = &unk_24FE3FA40;
            block[4] = self;
            v114 = v18;
            dispatch_async(v78, block);

LABEL_95:
            v23 = -2;
            v16 = &off_24FE3D000;
            goto LABEL_96;
          }
          -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "minLastUsedTime");

          if (v54 && v54 >= v74)
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              goto LABEL_94;
            *(_DWORD *)buf = 138412290;
            v116 = (uint64_t)v55;
            v57 = v56;
            v58 = "[DEBUG] Orphan is recent, so fetching parent chain%@";
          }
          else
          {
            if (!objc_msgSend(v14, "BOOLAtIndex:", 8))
              goto LABEL_95;
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              goto LABEL_94;
            *(_DWORD *)buf = 138412290;
            v116 = (uint64_t)v55;
            v57 = v56;
            v58 = "[DEBUG] Orphan has finder tags so fetching parent chain%@";
          }
LABEL_93:
          _os_log_debug_impl(&dword_230455000, v57, OS_LOG_TYPE_DEBUG, v58, buf, 0xCu);
          goto LABEL_94;
        }
        v23 = 0;
        v22 = 0;
        if ((v24 & 0x48) == 0 || (v24 & 4) != 0)
          goto LABEL_69;
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v116 = (uint64_t)v112;
          v117 = 2112;
          *(_QWORD *)v118 = v26;
          _os_log_fault_impl(&dword_230455000, v27, OS_LOG_TYPE_FAULT, "[CRIT] Server sent us an item %@ which has non-root share options but should be a root share%@", buf, 0x16u);
        }

        if (!-[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone")
          || !-[BRCServerZone _recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:](self, "_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:", v20, v112, v18, v24))
        {
          brc_bread_crumbs();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v116 = (uint64_t)v112;
            v117 = 2112;
            *(_QWORD *)v118 = v29;
            _os_log_fault_impl(&dword_230455000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Server sent us an item %@ which has non-root share options but should be a root share%@", buf, 0x16u);
          }
          v39 = 0;
          goto LABEL_51;
        }
        v23 = 0;
        v22 = 0;
      }
LABEL_69:
      brc_bread_crumbs();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v116 = v111;
        v117 = 2048;
        *(_QWORD *)v118 = v23;
        *(_WORD *)&v118[8] = 2112;
        *(_QWORD *)&v118[10] = v59;
        _os_log_debug_impl(&dword_230455000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting rowid [%lld] item_depth [%lld]%@", buf, 0x20u);
      }

      -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items SET item_depth = %lld WHERE rowid = %lld"), v23, v111);
      objc_autoreleasePoolPop(context);
    }
    while ((objc_msgSend(v14, "next") & 1) != 0);
  }
  v86 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid   FROM server_items  WHERE zone_rowid = %@ AND item_rank IS NULL AND item_depth >= 0 ORDER BY item_depth ASC"), self->_dbRowID);

  v87 = v107;
  if (objc_msgSend(v86, "next"))
  {
    v88 = v107;
    do
    {
      v89 = objc_msgSend(v86, "unsignedLongLongAtIndex:", 0);
      brc_bread_crumbs();
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v116 = v89;
        v117 = 2048;
        *(_QWORD *)v118 = v88;
        *(_WORD *)&v118[8] = 2112;
        *(_QWORD *)&v118[10] = v90;
        _os_log_debug_impl(&dword_230455000, v91, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting rowid [%lld] rank to [%lld]%@", buf, 0x20u);
      }

      v87 = v88 + 1;
      -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("UPDATE server_items SET item_rank = %lld WHERE rowid = %lld"), v88++, v89);
    }
    while ((objc_msgSend(v86, "next") & 1) != 0);
  }
  brc_bread_crumbs();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    -[BRCServerZone mangledID](self, "mangledID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v116 = (uint64_t)v100;
    v117 = 2048;
    *(_QWORD *)v118 = v107;
    *(_WORD *)&v118[8] = 2048;
    *(_QWORD *)&v118[10] = v87;
    v119 = 2112;
    v120 = v92;
    _os_log_debug_impl(&dword_230455000, v93, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Allocated ranks [%lld, %lld]%@", buf, 0x2Au);

  }
  -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setNextRank:", v87);

  -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS serverDB](self->_session, "serverDB");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "saveToDB:", v96);

  return 1;
}

id __43__BRCServerZone_allocateRanksWhenCaughtUp___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", *(_QWORD *)(a1 + 40), 0);
}

- (void)checkIfFinishedFullSync
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ has no more directory faults so it is now full sync%@");
  OUTLINED_FUNCTION_0();
}

- (void)handleMovedZoneNames:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2348B9F14]();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithZoneName:ownerName:", v10, 0);
        -[BRCAccountSessionFPFS getOrCreateAppLibraryAndPrivateZonesIfNecessary:](self->_session, "getOrCreateAppLibraryAndPrivateZonesIfNecessary:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          break;

        objc_autoreleasePoolPop(v11);
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v10;

      objc_autoreleasePoolPop(v11);
      if (!v14)
        goto LABEL_15;
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCServerZone handleMovedZoneNames:].cold.1(v14, (uint64_t)v15, v16);

    }
    else
    {
LABEL_10:

LABEL_15:
      v14 = (id)objc_opt_new();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v5;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        v21 = *MEMORY[0x24BE17550];
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v23, "isEqualToString:", v21))
            {
              brc_bread_crumbs();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v24;
                _os_log_fault_impl(&dword_230455000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
              }

            }
            else
            {
              -[BRCAccountSessionFPFS privateServerZoneByID:](self->_session, "privateServerZoneByID:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                objc_msgSend(v14, "addObject:", v24);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        }
        while (v19);
      }

      -[BRCAccountSessionFPFS scheduleZoneMovesToCloudDocs:](self->_session, "scheduleZoneMovesToCloudDocs:", v14);
    }
    v4 = v26;

  }
}

- (unint64_t)didSyncDownRequestID:(unint64_t)a3 serverChangeToken:(id)a4 editedRecords:(id)a5 deletedRecordIDs:(id)a6 deletedShareRecordIDs:(id)a7 allocRankZones:(id *)a8 caughtUp:(BOOL)a9 pendingChanges:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  BRCAccountSessionFPFS *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BRCPQLConnection *db;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  BRCAccountSessionFPFS *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  id v46;
  id v47;
  id v48;
  NSObject *v49;
  _QWORD v50[5];
  _QWORD v51[4];
  id v52;
  id v53;
  BRCServerZone *v54;
  id v55;
  id v56;
  id v57;
  BRCAccountSessionFPFS *v58;
  id v59;
  _BYTE *v60;
  uint64_t *v61;
  unint64_t v62;
  id *v63;
  BOOL v64;
  uint64_t v65[3];
  os_activity_scope_state_s state;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  char v71[32];
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  __int128 v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v46 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a10;
  v18 = self->_session;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v49 = _os_activity_create(&dword_230455000, "server-zone/did-sync-down", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v49, &state);
  memset(v65, 0, sizeof(v65));
  __brc_create_section(0, (uint64_t)"-[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:]", 1674, v65);
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v37 = v65[0];
    v38 = objc_msgSend(v14, "count");
    v39 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2048;
    v73 = (uint64_t (*)(uint64_t, uint64_t))v39;
    LOWORD(v74) = 2112;
    *(_QWORD *)((char *)&v74 + 2) = v19;
    _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx saving sync-down batch (edits:%ld deletions:%ld)%@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v73 = __Block_byref_object_copy__19;
  *(_QWORD *)&v74 = __Block_byref_object_dispose__19;
  if (a9)
    v21 = v17;
  else
    v21 = 0;
  *((_QWORD *)&v74 + 1) = v21;
  -[NSMutableDictionary allValues](self->_failedListDirectoryOperations, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_failedListDirectoryOperations, "removeAllObjects");
  if (!a9 && objc_msgSend(v22, "count"))
  {
    abc_report_panic_with_signature();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We have failed streams even though we aren't caught up? Crashing to prevent state corruption"));
    objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      brc_append_system_info_to_message();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      __88__BRCAccountSessionFPFS_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(v42, (uint64_t)v40, (uint64_t)v71, v41);
    }

    brc_append_system_info_to_message();
    v43 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
    __assert_rtn("-[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 1681, v43);
  }
  db = self->_db;
  v24 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke;
  v51[3] = &unk_24FE43350;
  v47 = v15;
  v52 = v47;
  v48 = v14;
  v53 = v48;
  v54 = self;
  v62 = a3;
  v25 = v22;
  v55 = v25;
  v26 = v16;
  v56 = v26;
  v63 = a8;
  v64 = a9;
  v27 = v17;
  v57 = v27;
  v60 = buf;
  v61 = &v67;
  v28 = v18;
  v58 = v28;
  v29 = v46;
  v59 = v29;
  v50[0] = v24;
  v50[1] = 3221225472;
  v50[2] = __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_156;
  v50[3] = &unk_24FE43378;
  v50[4] = buf;
  -[BRCPQLConnection performWithFlags:action:whenFlushed:](db, "performWithFlags:action:whenFlushed:", 9, v51, v50);
  if (v68[3])
  {
    v30 = (void *)MEMORY[0x24BE175F8];
    -[BRCServerZone mangledID](self, "mangledID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BE17340];
    -[BRCServerChangeState lastSyncDownDate](self->_changeState, "lastSyncDownDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "postContainerStatusChangeNotificationWithID:key:value:", v31, v32, v34);
    if (!v33)

    v35 = v68[3];
  }
  else
  {
    v35 = 0;
  }

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v65);
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v67, 8);
  return v35;
}

uint64_t __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (**v28)(void);
  void *v29;
  id *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  NSObject *v43;
  int v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char *v54;
  void *v55;
  int v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  uint64_t v107;
  id v109;
  uint64_t v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  void *v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint8_t v138[128];
  uint8_t buf[4];
  uint64_t v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 48), "mangledID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v140 = v6;
      v141 = 2048;
      v142 = v7;
      v143 = 2112;
      v144 = v8;
      v145 = 2112;
      v146 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] received %lu edited items and %lu deleted items from the cloud for %@\n%@", buf, 0x2Au);

    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v9 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 48), "mangledID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v140 = v9;
      v141 = 2112;
      v142 = (uint64_t)v10;
      v143 = 2112;
      v144 = v4;
      v11 = "[NOTICE] received %lu deleted items from the cloud for %@\n%@";
    }
    else
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v12 = objc_msgSend(*(id *)(a1 + 40), "count");
      objc_msgSend(*(id *)(a1 + 48), "mangledID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v140 = v12;
      v141 = 2112;
      v142 = (uint64_t)v10;
      v143 = 2112;
      v144 = v4;
      v11 = "[NOTICE] received %lu edited items from the cloud for %@\n%@";
    }
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, v11, buf, 0x20u);

  }
LABEL_11:

  v13 = (id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 112);
  if (v14 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "clientRequestID"))
  {
    brc_bread_crumbs();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT))
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_5();

  }
  v119 = a1;
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(*(id *)(a1 + 56), "count");
      *(_DWORD *)buf = 134218242;
      v140 = v17;
      v141 = 2112;
      v142 = (uint64_t)v15;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Saving %lu failed directory list operations first%@", buf, 0x16u);
    }

    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v18 = *(id *)(a1 + 56);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v131 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v23, "pendingChangesStream");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v13, "_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", 0, 0, v24);
          objc_msgSend(*v13, "_savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", 0, 0, v24);
          objc_msgSend(*v13, "_savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", 0, 0, v24);
          objc_msgSend(v23, "serverTruthCallback");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            objc_msgSend(v24, "lastError");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              objc_msgSend(v23, "serverTruthCallback");
              v28 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v28[2]();

            }
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
      }
      while (v20);
    }

    a1 = v119;
  }
  v118 = v3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 64));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", *(_QWORD *)(a1 + 48), 0);
  v30 = *(id **)(a1 + 120);
  if (v30)
    objc_storeStrong(v30, v29);
  v117 = v29;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v126, v137, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v127;
    v35 = *MEMORY[0x24BDB8F28];
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v127 != v34)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
        objc_msgSend(v37, "recordType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", v35);

        objc_msgSend(v37, "recordID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v120, "addObject:", v40);
        }
        else
        {
          objc_msgSend(v121, "addObject:", v40);

          objc_msgSend(v37, "recordType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v40, "isEqualToString:", CFSTR("content")) & 1) == 0)
          {
            objc_msgSend(v37, "recordType");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("structure"));

            if ((v42 & 1) != 0)
              continue;
            brc_bread_crumbs();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v140 = (uint64_t)v40;
              _os_log_fault_impl(&dword_230455000, v43, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [record.recordType isEqualToString:kBRRecordTypeContent] || [record.recordType isEqualToString:kBRRecordTypeStructure]%@", buf, 0xCu);
            }

          }
        }

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v126, v137, 16);
    }
    while (v33);
  }

  v44 = *(unsigned __int8 *)(v119 + 128);
  v45 = objc_msgSend(*(id *)(v119 + 48), "state");
  if (!v44)
  {
    v47 = v117;
    v46 = v118;
    if ((v45 & 4) != 0)
    {
      brc_bread_crumbs();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_4();

      objc_msgSend(*v13, "clearStateBits:", 4);
    }
    goto LABEL_60;
  }
  v47 = v117;
  v46 = v118;
  if ((v45 & 4) != 0 || (objc_msgSend(*v13, "state") & 0x20) == 0 && !objc_msgSend(*v13, "isSharedZone"))
  {
LABEL_60:
    objc_msgSend(*((id *)*v13 + 6), "directoryItemIDsCreatedLastSyncUp");
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)*((_QWORD *)*v13 + 10);
    *((_QWORD *)*v13 + 10) = v63;

    goto LABEL_61;
  }
  brc_bread_crumbs();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = *v13;
    *(_DWORD *)buf = 138412546;
    v140 = (uint64_t)v50;
    v141 = 2112;
    v142 = (uint64_t)v48;
    _os_log_impl(&dword_230455000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] Promoting %@ to full sync because we have completed full sync before and now we're caught up again%@", buf, 0x16u);
  }

  objc_msgSend(*v13, "setStateBits:", 4);
  objc_msgSend(*v13, "mangledID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "dbMigrationBatchSize");

  v54 = 0;
  do
  {
    objc_msgSend(*v13, "dbRowID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v118, "execute:", CFSTR("UPDATE server_items SET item_type = 0 WHERE item_type = 9 AND zone_rowid = %@ LIMIT %lld"), v55, v53);

    v54 += objc_msgSend(v118, "changes");
  }
  while (v56 && objc_msgSend(v118, "changes") >= v53);
  brc_bread_crumbs();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    v109 = *v13;
    *(_DWORD *)buf = 134218498;
    v140 = (uint64_t)v54;
    v141 = 2112;
    v142 = (uint64_t)v109;
    v143 = 2112;
    v144 = v57;
    _os_log_debug_impl(&dword_230455000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated %llu items to be normal directories in %@%@", buf, 0x20u);
  }

  objc_msgSend(*((id *)*v13 + 6), "directoryItemIDsCreatedLastSyncUp");
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)*((_QWORD *)*v13 + 10);
  *((_QWORD *)*v13 + 10) = v59;

  if ((v56 & 1) == 0)
    goto LABEL_89;
LABEL_61:
  if (!objc_msgSend(*(id *)(v119 + 48), "_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v121, v47, *(_QWORD *)(v119 + 72)))goto LABEL_89;
  if (!objc_msgSend(*(id *)(v119 + 48), "_savePendingChangesDeletedRecordIDsIgnoringRecordIDs:pendingChangeStream:", v121, *(_QWORD *)(v119 + 72)))goto LABEL_89;
  v65 = *(void **)(v119 + 48);
  objc_msgSend(*(id *)(v119 + 40), "objectEnumerator");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v65) = objc_msgSend(v65, "_saveEditedStructureRecords:zonesNeedingAllocRanks:", v66, v47);

  if (!(_DWORD)v65
    || !objc_msgSend(*(id *)(v119 + 48), "_saveDeletedRecordIDs:", *(_QWORD *)(v119 + 32))
    || !objc_msgSend(*(id *)(v119 + 48), "_savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v121, v47, *(_QWORD *)(v119 + 72))|| (v67 = *(void **)(v119 + 48), objc_msgSend(*(id *)(v119 + 40), "objectEnumerator"), v68 = (void *)objc_claimAutoreleasedReturnValue(), LODWORD(v67) = objc_msgSend(v67, "_saveEditedContentRecords:zonesNeedingAllocRanks:", v68, v47), v68, !(_DWORD)v67)|| (objc_msgSend(*(id *)(v119 + 48), "_savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v120, v47, *(_QWORD *)(v119 + 72)) & 1) == 0)
  {
LABEL_89:
    v98 = (void *)*((_QWORD *)*v13 + 10);
    *((_QWORD *)*v13 + 10) = 0;

    goto LABEL_90;
  }
  v69 = *(void **)(v119 + 48);
  objc_msgSend(*(id *)(v119 + 40), "objectEnumerator");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v69) = objc_msgSend(v69, "_saveEditedShareRecords:deletedShareRecordIDs:zonesNeedingAllocRanks:", v70, *(_QWORD *)(v119 + 64), v47);

  v71 = *(_QWORD *)(v119 + 48);
  v72 = *(void **)(v71 + 80);
  *(_QWORD *)(v71 + 80) = 0;

  if ((v69 & 1) != 0)
  {
    brc_bread_crumbs();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v114 = *(_QWORD *)(v119 + 48);
      v115 = *(_QWORD *)(v119 + 112);
      prettyPrintServerChangeToken(*(void **)(v119 + 88), 0);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v140 = v114;
      v141 = 2048;
      v142 = v115;
      v143 = 2112;
      v144 = v116;
      v145 = 2112;
      v146 = v73;
      _os_log_debug_impl(&dword_230455000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] updating %@\nwith requestID:%llu token:%@%@", buf, 0x2Au);

    }
    brc_bread_crumbs();
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_2();

    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v77 = v47;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v123;
      while (2)
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v123 != v80)
            objc_enumerationMutation(v77);
          v82 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * k);
          if (*(_BYTE *)(v119 + 128))
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * k), "dbRowID");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v82, "allocateRanksWhenCaughtUp:", objc_msgSend(v83, "br_isEqualToNumber:", *((_QWORD *)*v13 + 5)));

            if ((v84 & 1) == 0)
              goto LABEL_101;
          }
          else if ((objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * k), "allocateRanksWhenCaughtUp:", 0) & 1) == 0)
          {
LABEL_101:
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40), "destroyDatabase");
            v110 = *(_QWORD *)(*(_QWORD *)(v119 + 96) + 8);
            v111 = *(void **)(v110 + 40);
            *(_QWORD *)(v110 + 40) = 0;

            v104 = 0;
            goto LABEL_99;
          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
        if (v79)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(v119 + 48), "checkIfFinishedFullSync");
    objc_msgSend(*(id *)(v119 + 48), "changeState");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "updateWithServerChangeToken:clientRequestID:caughtUp:", *(_QWORD *)(v119 + 88), *(_QWORD *)(v119 + 112), *(unsigned __int8 *)(v119 + 128));

    objc_msgSend(*(id *)(v119 + 48), "changeState");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "lastSyncDownDate");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v119 + 80), "serverState");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setLastSyncDownDate:", v87);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = *MEMORY[0x24BE17370];
    v134 = *MEMORY[0x24BE174F0];
    objc_msgSend(*(id *)(v119 + 48), "changeState");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "lastSyncDownDate");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v92;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "postNotificationName:object:userInfo:", v90, 0, v93);

    objc_msgSend(*(id *)(v119 + 80), "serverState");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v119 + 48), "db");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "saveToDB:", v95);

    if ((objc_msgSend(*(id *)(v119 + 80), "saveServerZoneToDB:", *(_QWORD *)(v119 + 48)) & 1) != 0)
    {
      objc_msgSend(*(id *)(v119 + 80), "serverState");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v119 + 104) + 8) + 24) = objc_msgSend(v96, "nextRank");

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40), *(id *)(v119 + 72));
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40))
      {
        v104 = 1;
        goto LABEL_100;
      }
      brc_bread_crumbs();
      v77 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_1();

      goto LABEL_94;
    }
LABEL_98:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40), "destroyDatabase");
    v104 = 0;
    v107 = *(_QWORD *)(*(_QWORD *)(v119 + 96) + 8);
    v77 = *(id *)(v107 + 40);
    *(_QWORD *)(v107 + 40) = 0;
    goto LABEL_99;
  }
LABEL_90:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40), "lastError");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v99)
  {
    brc_bread_crumbs();
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, (os_log_type_t)0x90u))
      __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_3(v46, (uint64_t)v105, v106);

    goto LABEL_98;
  }
  brc_bread_crumbs();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v140 = (uint64_t)v100;
    _os_log_impl(&dword_230455000, v101, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed enumerating the changes stream but don't broken structure%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v119 + 96) + 8) + 40), "destroyDatabase");
  v102 = *(_QWORD *)(*(_QWORD *)(v119 + 96) + 8);
  v103 = *(void **)(v102 + 40);
  *(_QWORD *)(v102 + 40) = 0;

  objc_msgSend(*(id *)(v119 + 80), "serverState");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v119 + 104) + 8) + 24) = objc_msgSend(v77, "nextRank");
LABEL_94:
  v104 = 1;
LABEL_99:

LABEL_100:
  return v104;
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_156(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "destroyDatabase");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (unint64_t)didListDirectoryChangesWithResults:(id)a3 pendingFetchChanges:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((-[BRCPQLConnection isInTransaction](self->_db, "isInTransaction") & 1) == 0)
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCServerZone didListDirectoryChangesWithResults:pendingFetchChanges:].cold.2();

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v13), "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", self, 0);
  if (!-[BRCServerZone _savePendingChangesEditedStructureRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:](self, "_savePendingChangesEditedStructureRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v8, v15, v7))goto LABEL_16;
  if (!-[BRCServerZone _savePendingChangesDeletedRecordIDsIgnoringRecordIDs:pendingChangeStream:](self, "_savePendingChangesDeletedRecordIDsIgnoringRecordIDs:pendingChangeStream:", v8, v7))goto LABEL_16;
  objc_msgSend(v9, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BRCServerZone _saveEditedStructureRecords:zonesNeedingAllocRanks:](self, "_saveEditedStructureRecords:zonesNeedingAllocRanks:", v16, v15);

  if (!v17)
    goto LABEL_16;
  if (-[BRCServerZone _savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:](self, "_savePendingChangesEditedContentRecordsIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v8, v15, v7)&& (objc_msgSend(v9, "objectEnumerator"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19 = -[BRCServerZone _saveEditedContentRecords:zonesNeedingAllocRanks:](self, "_saveEditedContentRecords:zonesNeedingAllocRanks:", v18, v15), v18, v19)&& -[BRCServerZone _savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:](self, "_savePendingChangesSharesIgnoringRecordIDs:zonesNeedingAllocRanks:pendingChangeStream:", v8, v15,
         v7))
  {
    objc_msgSend(v9, "objectEnumerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BRCServerZone _saveEditedShareRecords:deletedShareRecordIDs:zonesNeedingAllocRanks:](self, "_saveEditedShareRecords:deletedShareRecordIDs:zonesNeedingAllocRanks:", v20, 0, v15);

  }
  else
  {
LABEL_16:
    v21 = 0;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = v15;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        if ((v21 & 1) != 0)
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v26), "allocateRanksWhenCaughtUp:", 0);
        else
          v21 = 0;
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v24);
  }

  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[BRCServerZone didListDirectoryChangesWithResults:pendingFetchChanges:].cold.1();

  -[BRCAccountSessionFPFS serverState](self->_session, "serverState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "nextRank");

  if (v21 && (-[BRCServerZone checkIfFinishedFullSync](self, "checkIfFinishedFullSync"), v30))
  {
    if (-[BRCAccountSessionFPFS saveServerZoneToDB:](self->_session, "saveServerZoneToDB:", self))
      v31 = v30;
    else
      v31 = 0;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)failedListingDirectoryChanges:(id)a3 serverTruthCallback:(id)a4 clientTruthCallback:(id)a5 folderItemID:(id)a6
{
  NSMutableDictionary *failedListDirectoryOperations;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BRCFailedListSaveObject *v16;
  void *v17;
  NSObject *v18;

  failedListDirectoryOperations = self->_failedListDirectoryOperations;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](failedListDirectoryOperations, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCServerZone failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:].cold.1();

  }
  v16 = -[BRCFailedListSaveObject initWithPendingChangesStream:serverTruthCallback:clientTruthCallback:]([BRCFailedListSaveObject alloc], "initWithPendingChangesStream:serverTruthCallback:clientTruthCallback:", v14, v13, v12);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_failedListDirectoryOperations, "setObject:forKeyedSubscript:", v16, v11);
}

- (id)failedListItemIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_failedListDirectoryOperations, "allKeys");
}

- (void)_collectTombstoneForRank:(unint64_t)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BRCPQLConnection *db;
  void *v8;
  void *v9;

  v4 = -[PQLConnection itemIDWithSQL:](self->_db, "itemIDWithSQL:", CFSTR("SELECT item_id FROM server_items WHERE zone_rowid = %@ AND item_rank = %lld AND item_state = 1"), self->_dbRowID, a3);
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCServerZone _collectTombstoneForRank:].cold.1();

    if (-[BRCServerZone isPrivateZone](self, "isPrivateZone"))
    {
      db = self->_db;
      -[BRCServerZone clientZone](self, "clientZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootItemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPQLConnection execute:](db, "execute:", CFSTR("UPDATE server_items SET item_parent_id = %@ WHERE zone_rowid = %@ AND item_parent_id = %@"), v9, self->_dbRowID, v4);

    }
    -[BRCPQLConnection execute:](self->_db, "execute:", CFSTR("DELETE FROM server_items WHERE zone_rowid = %@ AND item_id = %@"), self->_dbRowID, v4);
  }

}

- (void)collectTombstoneRanks:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke;
  v7[3] = &unk_24FE3FA40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__BRCServerZone_collectTombstoneRanks___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activated"))
  {
    memset(v14, 0, sizeof(v14));
    __brc_create_section(0, (uint64_t)"-[BRCServerZone collectTombstoneRanks:]_block_invoke", 1918, v14);
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v8 = v14[0];
      v9 = objc_msgSend(*(id *)(a1 + 40), "count");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 134218754;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v2;
      _os_log_debug_impl(&dword_230455000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting to GC %ld server tombstones in %@%@", buf, 0x2Au);
    }

    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke_166;
    v11[3] = &unk_24FE41988;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v5, "groupInTransaction:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "didGCTombstoneRanks:", *(_QWORD *)(a1 + 40));

    __brc_leave_section(v14);
  }
}

uint64_t __39__BRCServerZone_collectTombstoneRanks___block_invoke_166(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__BRCServerZone_collectTombstoneRanks___block_invoke_2;
  v3[3] = &unk_24FE433A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "enumerateIndexesUsingBlock:", v3);
  return 1;
}

uint64_t __39__BRCServerZone_collectTombstoneRanks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collectTombstoneForRank:", a2);
}

- (BOOL)resetServerTruthAndDestroyZone:(BOOL)a3
{
  BRCServerZone *v4;
  BRCZoneRowID *v5;
  BRCPQLConnection *db;
  BRCZoneRowID *v7;
  _QWORD v9[5];
  BRCZoneRowID *v10;
  BOOL v11;

  v4 = self;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  v5 = v4->_dbRowID;
  db = v4->_db;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke;
  v9[3] = &unk_24FE433C8;
  v9[4] = v4;
  v10 = v5;
  v11 = a3;
  v7 = v5;
  LOBYTE(v4) = -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", 26, v9);

  return (char)v4;
}

uint64_t __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dbMigrationBatchSize");

  while ((objc_msgSend(v3, "execute:", CFSTR("DELETE FROM server_items WHERE zone_rowid = %@ LIMIT %lld"), *(_QWORD *)(a1 + 40), v6) & 1) != 0)
  {
    if (objc_msgSend(v3, "changes") < v6)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        brc_bread_crumbs();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_2();

        v9 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM server_zones WHERE rowid = %@"), *(_QWORD *)(a1 + 40));
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "forgetChangeTokens");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "forgetClientRequestID");
        objc_msgSend(*(id *)(a1 + 32), "clearStateBits:", 60);
        brc_bread_crumbs();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_1();

        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "saveServerZoneToDB:");
      }
      v12 = v9;
      goto LABEL_15;
    }
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "lastError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    v22 = 2112;
    v23 = v10;
    _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] failed purging zone %@ - %@%@", buf, 0x20u);

  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (BOOL)resetServerTruth
{
  return -[BRCServerZone resetServerTruthAndDestroyZone:](self, "resetServerTruthAndDestroyZone:", 0);
}

- (void)deleteAllContentsOnServerWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v3 = a3;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[BRCServerZone deleteAllContentsOnServerWithCompletionBlock:].cold.1();

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, v3);

}

- (id)deleteAllContentsOperation
{
  return 0;
}

- (BOOL)shouldRecreateServerZoneAfterError:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[BRCServerZone isPrivateZone](self, "isPrivateZone")
    && !-[BRCServerZone hasFetchedServerZoneState](self, "hasFetchedServerZoneState"))
  {
    v5 = objc_msgSend(v4, "brc_isCloudKitErrorImplyingZoneNeedsCreation");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasFetchedServerZoneState
{
  id v2;
  void *v3;
  BOOL v4;

  -[BRCServerZone changeState](self, "changeState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend(v2, "changeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)forceMoveToCloudDocs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !appLibrary.wasMovedToCloudDocs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __37__BRCServerZone_forceMoveToCloudDocs__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_2;
  block[3] = &unk_24FE433F0;
  v8 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 48);
  dispatch_sync(v3, block);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_3;
    v6[3] = &unk_24FE3FA18;
    v6[4] = *(_QWORD *)(a1 + 48);
    dispatch_sync(v5, v6);

  }
}

void __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 16), "cloudDocsClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_crossZoneMoveDocumentsToZone:", v3);

  if ((v2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
}

uint64_t __37__BRCServerZone_forceMoveToCloudDocs__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetServerTruthAndDestroyZone:", 1);
}

- (BOOL)saveQueryRecords:(id)a3 zonesNeedingAllocRanks:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    v14 = 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v14 = v14
           && -[BRCServerZone _saveEditedRecord:zonesNeedingAllocRanks:error:](self, "_saveEditedRecord:zonesNeedingAllocRanks:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v9, a5, (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  uint64_t state;
  unsigned int v6;
  unsigned int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  state = self->_state;
  v6 = a3 | 0x38;
  if ((a3 & 4) == 0)
    v6 = a3;
  v7 = state | v6;
  self->_state = v7;
  v8 = v7 ^ state;
  if (v7 != state)
  {
    -[BRCServerZone setNeedsSave:](self, "setNeedsSave:", 1);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[BRCServerZone mangledID](self, "mangledID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      BRCPrettyPrintBitmapWithContext(state, (uint64_t)&server_zone_state_entries, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&server_zone_state_entries, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ server state changed, %@ -> %@%@", buf, 0x2Au);

    }
    if ((v8 & 0x18) != 0 && (~self->_state & 0x18) == 0)
    {
      -[BRCClientZone db](self->_clientZone, "db");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serialQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[BRCClientZone db](self->_clientZone, "db");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serialQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __30__BRCServerZone_setStateBits___block_invoke;
        block[3] = &unk_24FE3FA18;
        block[4] = self;
        dispatch_async(v14, block);

      }
    }
  }
  return v8 != 0;
}

void __30__BRCServerZone_setStateBits___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isPrivateZone")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isSyncBlocked") & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "asPrivateClientZone", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appLibraries");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "fetchPristineness");
          objc_msgSend(v8, "scheduleFullLibraryContentsFetch");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "fsUploader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "fsDownloader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rescheduleJobsPendingRecentsAndFavoritesFetchInZone:", *(_QWORD *)(a1 + 32));

}

- (void)clearStateBits:(unsigned int)a3
{
  uint64_t state;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  state = self->_state;
  self->_state = state & ~a3;
  if ((state & a3) != 0)
  {
    -[BRCServerZone setNeedsSave:](self, "setNeedsSave:", 1);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[BRCServerZone mangledID](self, "mangledID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BRCPrettyPrintBitmapWithContext(state, (uint64_t)&server_zone_state_entries, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&server_zone_state_entries, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ server state changed, %@ -> %@%@", (uint8_t *)&v11, 0x2Au);

    }
  }
}

- (BOOL)hasFetchedRecentsAndFavorites
{
  return (~self->_state & 0x18) == 0;
}

- (unsigned)zoneCreationState
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (!-[BRCClientZone hasCompletedInitialSyncDownOnce](self->_clientZone, "hasCompletedInitialSyncDownOnce"))
    return 0;
  -[BRCServerZone changeState](self, "changeState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = 2;

  return v5;
}

- (id)itemByItemID:(id)a3 db:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__BRCServerZone_itemByItemID_db___block_invoke;
  v5[3] = &unk_24FE40010;
  v5[4] = self;
  return (id)objc_msgSend(a4, "fetchObject:sql:", v5, CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@"), a3, self->_dbRowID);
}

id __33__BRCServerZone_itemByItemID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "newServerItemFromPQLResultSet:error:", a2, a3);
}

- (id)itemByItemID:(id)a3
{
  return -[BRCServerZone itemByItemID:db:](self, "itemByItemID:db:", a3, self->_db);
}

- (id)itemsEnumeratorWithDB:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(a3, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE zone_rowid = %@"), self->_dbRowID);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BRCServerZone_itemsEnumeratorWithDB___block_invoke;
  v7[3] = &unk_24FE40010;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjects:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__BRCServerZone_itemsEnumeratorWithDB___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "newServerItemFromPQLResultSet:error:", a2, a3);
}

- (id)directDirectoryChildItemIDsOfParentEnumerator:(id)a3
{
  id v3;
  void *v4;

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT item_id FROM server_items WHERE zone_rowid = %@   AND item_parent_id = %@   AND item_type = 0"), self->_dbRowID, a3);
  objc_msgSend(v3, "enumerateObjectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  BRCServerZone *v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[3];
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v43 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__19;
  v36 = __Block_byref_object_dispose__19;
  v37 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __43__BRCServerZone_dumpStatusToContext_error___block_invoke;
  v24[3] = &unk_24FE43468;
  v29 = v38;
  v8 = v6;
  v25 = v8;
  v26 = self;
  v9 = v7;
  v27 = v9;
  v28 = 0;
  v30 = &v32;
  v31 = &v40;
  v41[3] = (uint64_t)v24;
  if (a4)
    *a4 = objc_retainAutorelease((id)v33[5]);
  if (-[BRCServerZone isPrivateZone](self, "isPrivateZone"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[BRCServerZone clientZone](self, "clientZone", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asPrivateClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appLibraries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v44, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          v16 = v41[3];
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "rootItemID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, _QWORD, const __CFString *, id *))(v16 + 16))(v16, v17, 0, CFSTR("/"), a4);

          if ((v16 & 1) == 0)
          {
            v18 = 0;
            goto LABEL_15;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v44, 16);
        if (v13)
          continue;
        break;
      }
    }
    v18 = 1;
LABEL_15:

  }
  else
  {
    v18 = 1;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  return v18;
}

uint64_t __43__BRCServerZone_dumpStatusToContext_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v34;
  void *v35;
  id v36;
  void (**v38)(void);
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[3];
  char v46;

  v7 = a2;
  v8 = a4;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 1;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __43__BRCServerZone_dumpStatusToContext_error___block_invoke_2;
  v40[3] = &unk_24FE43440;
  v43 = *(_QWORD *)(a1 + 64);
  v41 = *(id *)(a1 + 32);
  v44 = v45;
  v36 = v8;
  v42 = v36;
  v38 = (void (**)(void))MEMORY[0x2348BA0DC](v40);
  objc_msgSend(*(id *)(a1 + 32), "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, rowid      FROM server_items    WHERE zone_rowid = %@ AND item_parent_id = %@ ORDER BY item_filename"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v7);
  v34 = v7;

  do
  {
    v11 = objc_msgSend(v10, "next");
    if (!v11)
      break;
    v12 = (void *)MEMORY[0x2348B9F14]();
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_msgSend(v10, "integerAtIndex:", 44);
      if (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v14))
      {
        v38[2]();
        objc_msgSend(*(id *)(a1 + 32), "pushIndentation");
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", v16, *(_QWORD *)(a1 + 32));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "writeLineWithFormat:", CFSTR("ERROR: item ID %@ seen twice"), v17);

        objc_msgSend(*(id *)(a1 + 32), "popIndentation");
        v13 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "addIndex:", v14);
        v18 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        obj = *(id *)(v19 + 40);
        v20 = (void *)objc_msgSend(v18, "newServerItemFromPQLResultSet:error:", v10, &obj);
        objc_storeStrong((id *)(v19 + 40), obj);
        if (v20)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "applyScheduler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "descriptionForServerItem:context:", v20, *(_QWORD *)(a1 + 32));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v38[2]();
            objc_msgSend(*(id *)(a1 + 32), "pushIndentation");
            v23 = *(void **)(a1 + 32);
            objc_msgSend(v20, "descriptionWithContext:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "writeLineWithFormat:", CFSTR("%@"), v24);

            objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("> apply{%@}"), v22);
            objc_msgSend(*(id *)(a1 + 32), "popIndentation");
          }
          v25 = objc_msgSend(v20, "isDirectory") ^ 1;
          if (a3 > 99)
            LOBYTE(v25) = 1;
          if ((v25 & 1) != 0)
            goto LABEL_15;
          v26 = *(void **)(a1 + 56);
          objc_msgSend(v20, "itemID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v26) = objc_msgSend(v26, "containsObject:", v27);

          if ((v26 & 1) != 0)
            goto LABEL_15;
          v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
          objc_msgSend(v20, "itemID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "st");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "displayName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringByAppendingPathComponent:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *, _QWORD, void *, uint64_t))(v28 + 16))(v28, v35, (a3 + 1), v31, a5);

          if ((_DWORD)v28)
LABEL_15:
            v13 = 0;
          else
            v13 = 1;

        }
        else
        {
          v13 = 1;
        }

      }
    }
    objc_autoreleasePoolPop(v12);
  }
  while ((v13 | 2) == 2);

  _Block_object_dispose(v45, 8);
  return v11 ^ 1u;
}

uint64_t __43__BRCServerZone_dumpStatusToContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(result + 32), "writeLineWithFormat:", CFSTR("Needs Apply Changes:"));
    result = objc_msgSend(*(id *)(v1 + 32), "writeLineWithFormat:", CFSTR("-------------------"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24))
  {
    result = objc_msgSend(*(id *)(v1 + 32), "writeLineWithFormat:", CFSTR("Under %@"), *(_QWORD *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BRCZoneRowID *dbRowID;
  void *v31;
  void *v32;
  BRCAccountSessionFPFS *session;
  id *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  int v42;
  char v43;
  void *v44;
  BOOL v45;
  BRCPendingChangesStream *v46;
  BOOL v47;
  BOOL v48;
  id v50;
  _BOOL4 v51;
  id obj;
  id v54;
  _QWORD v55[4];
  BRCPendingChangesStream *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  BRCServerZone *v63;
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  BOOL v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE v83[128];
  uint64_t v84;

  v51 = a4;
  v84 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__19;
  v81 = __Block_byref_object_dispose__19;
  v82 = 0;
  -[BRCServerZone descriptionWithContext:](self, "descriptionWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeLineWithFormat:", CFSTR("server items (%@)"), v8);

  objc_msgSend(v6, "writeLineWithFormat:", CFSTR("============"));
  v73 = 0;
  v74 = &v73;
  v75 = 0x2050000000;
  v76 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke;
  v61[3] = &unk_24FE43490;
  v9 = v6;
  v62 = v9;
  v63 = self;
  v65 = &v69;
  v68 = v51;
  v50 = v7;
  v64 = v50;
  v66 = &v77;
  v67 = &v73;
  v74[3] = (uint64_t)v61;
  -[BRCServerZone clientZone](self, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isPrivateZone");

  if ((_DWORD)v8)
  {
    -[BRCServerZone clientZone](self, "clientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asPrivateClientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appLibraries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[BRCServerZone clientZone](self, "clientZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asPrivateClientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appLibraries");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v83, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v58;
      v19 = 1;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v58 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if (v14 >= 2)
          {
            if ((v19 & 1) == 0)
              objc_msgSend(v9, "writeLineWithFormat:", &stru_24FE4A790);
            objc_msgSend(v21, "logName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "dbRowID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "writeLineWithFormat:", CFSTR("----------------------%@[%@]----------------------"), v22, v23);

            v19 = 0;
          }
          *((_DWORD *)v70 + 6) = 0;
          v24 = v74[3];
          objc_msgSend(v21, "rootItemID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD, id *))(v24 + 16))(v24, v25, 0, a5);

          if ((objc_msgSend(v9, "isCancelled") & 1) != 0)
          {
            v45 = 0;
            goto LABEL_36;
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v83, 16);
        if (v17)
          continue;
        break;
      }
    }

  }
  objc_msgSend(v9, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v9, "db");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v26, "numberWithSQL:", CFSTR("SELECT COUNT(*) FROM server_items WHERE zone_rowid = %@"), self->_dbRowID);

  v27 = objc_msgSend(obj, "unsignedIntegerValue");
  if (v27 == objc_msgSend(v50, "count"))
  {
    v28 = 0;
  }
  else
  {
    if (!-[BRCServerZone isSharedZone](self, "isSharedZone"))
      objc_msgSend(v9, "writeLineWithFormat:", CFSTR("ORPHANED ITEMS:"));
    objc_msgSend(v9, "db");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    dbRowID = self->_dbRowID;
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2;
    v55[3] = &unk_24FE3FEF0;
    v56 = (BRCPendingChangesStream *)v50;
    v31 = (void *)MEMORY[0x2348BA0DC](v55);
    v28 = (void *)objc_msgSend(v29, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, validation_key(content_boundary_key) FROM server_items WHERE zone_rowid = %@ AND call_block(%@, rowid)"), dbRowID, v31);

    *((_DWORD *)v70 + 6) = 0;
    while (objc_msgSend(v28, "next"))
    {
      v32 = (void *)MEMORY[0x2348B9F14]();
      session = self->_session;
      v34 = (id *)(v78 + 5);
      v54 = (id)v78[5];
      v35 = -[BRCAccountSessionFPFS newServerItemFromPQLResultSet:error:](session, "newServerItemFromPQLResultSet:error:", v28, &v54);
      objc_storeStrong(v34, v54);
      objc_msgSend(v28, "dataAtIndex:", 44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v36, "brc_hexadecimalString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v39, 2, v9);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR(" ctvk{%@}"), v40);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v41 = &stru_24FE4A790;
      }
      ++*((_DWORD *)v70 + 6);
      v42 = objc_msgSend(v9, "shouldKeepDumpingWithItemCount:includeAllItems:");
      v43 = v42;
      if (v42)
      {
        objc_msgSend(v35, "descriptionWithContext:", v9);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "writeLineWithFormat:", CFSTR("%@%@"), v44, v41);

      }
      objc_autoreleasePoolPop(v32);
      if ((v43 & 1) == 0)
      {
        v45 = 0;
        v46 = v56;
        goto LABEL_35;
      }
    }
    objc_msgSend(v9, "writeLineWithFormat:", &stru_24FE4A790);

  }
  v46 = -[BRCPendingChangesStream initWithServerZone:]([BRCPendingChangesStream alloc], "initWithServerZone:", self);
  v47 = -[BRCPendingChangesStream dumpTablesToContext:includeAllItems:error:](v46, "dumpTablesToContext:includeAllItems:error:", v9, v51, a5);
  v45 = v47;
  if (a5)
    v48 = v47;
  else
    v48 = 0;
  if (v48)
    *a5 = objc_retainAutorelease((id)v78[5]);
LABEL_35:

LABEL_36:
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);

  return v45;
}

uint64_t __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  id obj;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, child_basehash_salt, salting_state, basehash_salt_validation_key, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count, rowid , validation_key(content_boundary_key)     FROM server_items    WHERE zone_rowid = %@ AND item_parent_id = %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v7);

  if (objc_msgSend(v9, "next"))
  {
    v32 = a4;
    v31 = v7;
    while (1)
    {
      v10 = (void *)MEMORY[0x2348B9F14]();
      v11 = objc_msgSend(v9, "integerAtIndex:", 44);
      objc_msgSend(v9, "dataAtIndex:", 45);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (!objc_msgSend(v13, "shouldKeepDumpingWithItemCount:includeAllItems:"))
        break;
      if (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v11))
      {
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v9, "objectOfClass:atIndex:", objc_opt_class(), 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCDumpContext stringFromItemID:context:](BRCDumpContext, "stringFromItemID:context:", v15, *(_QWORD *)(a1 + 32));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "writeLineWithFormat:", CFSTR("%*sERROR: item ID %@ seen twice"), a3, ", v16);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "addIndex:", v11);
        v17 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        obj = *(id *)(v18 + 40);
        v15 = (void *)objc_msgSend(v17, "newServerItemFromPQLResultSet:error:", v9, &obj);
        objc_storeStrong((id *)(v18 + 40), obj);
        if (!v15)
          goto LABEL_20;
        if (v12)
        {
          v19 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v12, "brc_hexadecimalString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v20, 2, *(_QWORD *)(a1 + 32));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR(" ctvk{%@}"), v21);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = &stru_24FE4A790;
        }
        v22 = *(void **)(a1 + 32);
        objc_msgSend(v15, "descriptionWithContext:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "writeLineWithFormat:", CFSTR("%*s%@%@"), a3, ", v23, v16);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "applyScheduler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "descriptionForServerItem:context:", v15, *(_QWORD *)(a1 + 32));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%*s> apply{%@}"), a3, ", v25);
        v26 = objc_msgSend(v15, "isDirectory");
        if ((int)a3 <= 99)
        {
          if (v26)
          {
            v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            objc_msgSend(v15, "itemID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v27) = (*(uint64_t (**)(uint64_t, void *, _QWORD, uint64_t))(v27 + 16))(v27, v28, (a3 + 1), v32);

            if ((v27 & 1) == 0)
            {

LABEL_20:
              break;
            }
          }
        }

      }
      objc_autoreleasePoolPop(v10);
      if ((objc_msgSend(v9, "next") & 1) == 0)
      {
        v29 = 1;
        goto LABEL_22;
      }
    }

    objc_autoreleasePoolPop(v10);
    v29 = 0;
LABEL_22:
    v7 = v31;
  }
  else
  {
    v29 = 1;
  }

  return v29;
}

void __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, int a3, sqlite3_value **a4)
{
  int v7;
  void *v8;
  NSObject *v9;

  if (a3 != 1)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2_cold_1();

  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", sqlite3_value_int64(*a4));
  sqlite3_result_int64(a2, v7 ^ 1u);
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("you must override this"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_fault_impl(&dword_230455000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);

  }
  brc_append_system_info_to_message();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCServerZone validateStructureLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 2429, v8);
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  abc_report_panic_with_signature();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("you must override this"));
  objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_fault_impl(&dword_230455000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);

  }
  brc_append_system_info_to_message();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCServerZone validateItemsLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCServerZone.m", 2434, v8);
}

- (BRCZoneRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
  objc_storeStrong((id *)&self->_dbRowID, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (BRCServerChangeState)changeState
{
  return (BRCServerChangeState *)objc_getProperty(self, a2, 8, 1);
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoriesCreatedLastSyncUp, 0);
  objc_storeStrong((id *)&self->_failedListDirectoryOperations, 0);
  objc_storeStrong((id *)&self->_metadataSyncContext, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_changeState, 0);
}

- (id)jobsDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[BRCServerZone dbRowID](self, "dbRowID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("z:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)matchingJobsWhereSQLClause
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEDD638];
  -[BRCServerZone dbRowID](self, "dbRowID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatInjection:", CFSTR("zone_rowid = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __58__BRCServerZone_BRCZoneMigration__scheduleMoveToCloudDocs__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't czm move clouddocs zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asPrivateZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: This is not a private zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)asSharedZone
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: This is not a shared zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_verifyChildbasehashSaltKeysForItemID:saltInfo:record:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Got unexpected basehash validation key for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _db.changes == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] PCS chained directory doesn't have chain PCS! %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveItemID:stat:serverMetrics:record:origName:base:no:ext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(st.type)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_saveItemID:stat:serverMetrics:record:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !(st.logicalName.br_isSideFaultName || [st.logicalName br_isExcludedWithMaximumDepth:1])%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedDirOrDocStructureRecord:error:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_1();
  objc_msgSend(v0, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v2, v3, "[DEBUG] saving consistent structure record (%@) to db %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_1();
}

- (void)_saveEditedDocumentContentRecord:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Adding %@ to the list of force package extensions (according to CKRecord)%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedDocumentContentRecord:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the modifier name is different%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedDocumentContentRecord:error:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_1();
  objc_msgSend(v0, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v2, v3, "[DEBUG] saving consistent document record (%@) to db %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_1();
}

- (void)_saveEditedSymlinkRecord:error:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_1();
  objc_msgSend(v0, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v2, v3, "[DEBUG] saving consistent symlink structure record (%@) to db %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_1();
}

- (void)_saveEditedFinderBookmarkRecord:error:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_1();
  objc_msgSend(v0, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v2, v3, "[DEBUG] saving consistent finder bookmark structure record (%@) to db %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_1();
}

- (void)_saveEditedAliasRecord:(void *)a1 zonesNeedingAllocRanks:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v9;
  v14 = 2112;
  v15 = a2;
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] can't save %@: missing ownerKey for ownerName \"%@\"%@", (uint8_t *)&v10, 0x20u);

}

- (void)_saveEditedAliasRecord:zonesNeedingAllocRanks:error:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_1();
  objc_msgSend(v0, "parent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v2, v3, "[DEBUG] saving consistent alias structure record (%@) to db %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_1();
}

- (void)_saveEditedShareRecord:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] share without root record:\n    i:%@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n       failed inserting the shared record,\n    - or the server forgot to send it to us.%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedShareRecord:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: share.currentUserParticipant.role != CKShareParticipantRoleOwner%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedShareRecord:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: share.currentUserParticipant.role == CKShareParticipantRoleOwner%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedShareRecord:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] saving consistent share record to db %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedRecord:zonesNeedingAllocRanks:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't save zone root record %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_saveEditedRecord:zonesNeedingAllocRanks:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: structure record which isn't a directory or document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_markShareIDDead:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] marked shareID dead %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_markItemDeadForRecordID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't decode itemID from recordID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_markItemDeadForRecordID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Not inserting tombstone entry for %@ because we don't have a server item already.  Let's go through rejected code path for perf.%@");
  OUTLINED_FUNCTION_0();
}

- (void)_markItemDeadForRecordID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] saving consistent record delete to db %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed to recover sharing options on %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] Fixing up sharing options to have shareID for something that looks like a shared zone root for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Can't recover share options on shared zone child item %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_recoverFromCorruptShareOptionsWithItemType:itemID:parentID:sharingOptions:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] Stripping share options for something that doesn't seem to need them %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)allocateRanksWhenCaughtUp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Forcing caught up state because we completed full sync so we must have synced down an unrelated zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)handleMovedZoneNames:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, a3, v4, "[CRIT] UNREACHABLE: Can't create app library and zones for zone named: %s%@", v5);
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Delta sync successfully alloced rank so allowing finished changes stream to be destroyed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Allocating ranks for %@%@");
  OUTLINED_FUNCTION_0();
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] something went wrong while saving to the db: %@%@", v5, 0x16u);

}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ is no longer full sync because of a large delta sync operation%@");
  OUTLINED_FUNCTION_0();
}

void __148__BRCServerZone_didSyncDownRequestID_serverChangeToken_editedRecords_deletedRecordIDs_deletedShareRecordIDs_allocRankZones_caughtUp_pendingChanges___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: requestID >= self->_changeState.clientRequestID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)didListDirectoryChangesWithResults:pendingFetchChanges:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Listed directory changes in zones %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)didListDirectoryChangesWithResults:pendingFetchChanges:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _db.isInTransaction%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _failedListDirectoryOperations[itemID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_collectTombstoneForRank:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Removing applied tombstone: %@%@");
  OUTLINED_FUNCTION_0();
}

void __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Finished resetting server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __48__BRCServerZone_resetServerTruthAndDestroyZone___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Finishing destroying server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)deleteAllContentsOnServerWithCompletionBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: attempted delete all content on an unsupported zone type: %@%@");
  OUTLINED_FUNCTION_0();
}

void __59__BRCServerZone_dumpTablesToContext_includeAllItems_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: argc == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
