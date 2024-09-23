@implementation BRCSyncConsistencyReport

+ (void)_finishReport:(id)a3 session:(id)a4 temporaryDBURL:(id)a5 mountFD:(int)a6 completionHandler:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((v8 & 0x80000000) == 0)
  {
    objc_msgSend(a1, "cleanupApfsSnapshotWithMountFD:", v8);
    close(v8);
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeItemAtURL:error:", v14, 0);

  }
  objc_msgSend(v13, "clientTruthWorkloop");
  v17 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke;
  v20[3] = &unk_24FE409B8;
  v21 = v12;
  v22 = v15;
  v18 = v15;
  v19 = v12;
  dispatch_async(v17, v20);

}

uint64_t __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "wasAbleToRun"))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke_cold_1();
  }
  else
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_230455000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry sync consistency report did not run%@", (uint8_t *)&v5, 0xCu);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)cleanupApfsSnapshotWithMountPath:(id)a3
{
  uint64_t v4;
  int v5;

  v4 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 0);
  if ((v4 & 0x80000000) == 0)
  {
    v5 = v4;
    objc_msgSend(a1, "cleanupApfsSnapshotWithMountFD:", v4);
    close(v5);
  }
}

+ (void)cleanupApfsSnapshotWithMountFD:(int)a3
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;

  v14 = 0;
  v4 = BRCUnmountAPFSSnapshot(CFSTR("iCloudDriveSyncConsistency"), &v14);
  v5 = v14;
  v6 = v5;
  if ((v4 & 1) == 0 && (objc_msgSend(v5, "br_isPOSIXErrorCode:", 2) & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountFD:].cold.2();

  }
  v13 = v6;
  v9 = BRCDeleteAPFSSnapshot(a3, CFSTR("iCloudDriveSyncConsistency"), &v13);
  v10 = v13;

  if ((v9 & 1) == 0 && (objc_msgSend(v10, "br_isPOSIXErrorCode:", 2) & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountFD:].cold.1();

  }
}

+ (void)generateReportWithSession:(id)a3 mangledIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRCSyncConsistencyReport *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  BOOL v33;
  NSError *v34;
  NSError *v35;
  const __CFString *v36;
  NSError *v37;
  uint64_t v38;
  NSError *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSError *v53;
  uint64_t v54;
  id v55;
  BRCSyncConsistencyReport *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  NSError *v65;
  NSError *v66;
  id v67;
  __CFString *v68;
  NSError *lastError;
  id v70;
  void *v71;
  NSObject *v72;
  NSError *v73;
  NSError *v74;
  id v75;
  NSError *v76;
  void *v77;
  NSObject *v78;
  NSError *v79;
  NSError *v80;
  id v81;
  unsigned int v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  BRCSyncConsistencyReport *v89;
  __CFString *v90;
  unsigned int v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  BRCSyncConsistencyReport *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  unsigned int v106;
  _QWORD v107[4];
  BRCSyncConsistencyReport *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  unsigned int v113;
  _QWORD v114[4];
  id v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  NSError *v123;
  id v124;
  _QWORD v125[4];
  id v126;
  id v127;
  _QWORD block[4];
  id v129;
  id v130;
  _BYTE v131[128];
  void *v132;
  uint8_t buf[4];
  id v134;
  __int16 v135;
  NSError *v136;
  __int16 v137;
  void *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(BRCSyncConsistencyReport);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volume");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hasEnoughSpaceForDevice:", objc_msgSend(v14, "deviceID"));

  if ((v15 & 1) != 0)
  {
    v97 = v12;
    v98 = a1;
    v96 = v10;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0x24BDBC000uLL;
    v18 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v8, "sessionDirPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("telemetry-db"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "checkResourceIsReachableAndReturnError:", 0))
      objc_msgSend(v16, "removeItemAtURL:error:", v21, 0);
    v95 = v16;
    objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);
    objc_msgSend(v8, "serverTruthWorkloop");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke;
    block[3] = &unk_24FE3FA40;
    v24 = v8;
    v129 = v24;
    v25 = v21;
    v130 = v25;
    dispatch_async_and_wait(v22, block);

    objc_msgSend(v24, "clientTruthWorkloop");
    v26 = objc_claimAutoreleasedReturnValue();
    v125[0] = v23;
    v125[1] = 3221225472;
    v125[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2;
    v125[3] = &unk_24FE3FA40;
    v27 = v24;
    v126 = v27;
    v94 = v25;
    v127 = v94;
    dispatch_async_and_wait(v26, v125);

    objc_msgSend(v27, "volume");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mountPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v30, "syncConsistencyCheckerSnapshotting");

    if ((_DWORD)v26)
    {
      v31 = objc_retainAutorelease(v29);
      v32 = open((const char *)objc_msgSend(v31, "fileSystemRepresentation"), 0);
      if ((v32 & 0x80000000) != 0)
      {
        lastError = v11->_lastError;
        v11->_lastError = 0;

        v70 = v27;
        v58 = v94;
        v10 = v96;
        objc_msgSend(v98, "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", v11, v70, v94, v32, v96);
        v68 = CFSTR("/");
        v12 = v97;
      }
      else
      {
        objc_msgSend(v98, "cleanupApfsSnapshotWithMountFD:", v32);
        v124 = 0;
        v33 = BRCGenerateAPFSSnapshot(v32, CFSTR("iCloudDriveSyncConsistency"), &v124);
        v34 = (NSError *)v124;
        v35 = v34;
        v93 = v29;
        if (v33)
        {
          v123 = v34;
          BRCMountAPFSSnapshot(v32, CFSTR("iCloudDriveSyncConsistency"), &v123);
          v36 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v37 = v123;

          if (v36)
          {
            v91 = v32;

            v17 = 0x24BDBC000;
            goto LABEL_11;
          }
          v76 = v37;
          brc_bread_crumbs();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v134 = v31;
            v135 = 2112;
            v136 = v37;
            v137 = 2112;
            v138 = v77;
            _os_log_error_impl(&dword_230455000, v78, (os_log_type_t)0x90u, "[ERROR] Failed to mount snapshot at %@ - %@%@", buf, 0x20u);
          }

          v79 = v11->_lastError;
          v11->_lastError = v76;
          v80 = v76;

          v81 = v27;
          v58 = v94;
          v10 = v96;
          objc_msgSend(v98, "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", v11, v81, v94, v32, v96);

          v68 = 0;
        }
        else
        {
          brc_bread_crumbs();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v134 = v31;
            v135 = 2112;
            v136 = v35;
            v137 = 2112;
            v138 = v71;
            _os_log_error_impl(&dword_230455000, v72, (os_log_type_t)0x90u, "[ERROR] Failed to generate snapshot at %@ - %@%@", buf, 0x20u);
          }

          v73 = v11->_lastError;
          v11->_lastError = v35;
          v74 = v35;

          v75 = v27;
          v58 = v94;
          v10 = v96;
          objc_msgSend(v98, "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", v11, v75, v94, v32, v96);

          v68 = CFSTR("/");
        }
        v12 = v97;
        v29 = v93;
      }
LABEL_34:

      goto LABEL_35;
    }
    v93 = v29;
    v36 = CFSTR("/");
    v91 = -1;
LABEL_11:
    BRDiskCheckerServiceConnection();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (__CFString *)v36;
    objc_msgSend(*(id *)(v17 + 3912), "fileURLWithPath:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE17610], "mobileDocumentsURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v40;
    objc_msgSend(v40, "URLByAppendingPathComponent:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = v9;
    v87 = v43;
    if (v9 && objc_msgSend(v9, "count"))
    {
      v121[0] = MEMORY[0x24BDAC760];
      v121[1] = 3221225472;
      v121[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_613;
      v121[3] = &unk_24FE40DC0;
      v122 = v43;
      objc_msgSend(v9, "br_transform:", v121);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v132 = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v132, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45 = (void *)objc_opt_new();
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v46 = v44;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
    v89 = v11;
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v118;
      while (2)
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v118 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v50);
          v116 = 0;
          objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v51, 1, &v116);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (NSError *)v116;
          if (v53)
          {
            v65 = v11->_lastError;
            v11->_lastError = v53;
            v66 = v53;

            v67 = v27;
            v58 = v94;
            v10 = v96;
            objc_msgSend(v98, "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", v11, v67, v94, v91, v96);

            v64 = v46;
            v61 = v86;
            goto LABEL_25;
          }
          objc_msgSend(v45, "addObject:", v52);

          ++v50;
        }
        while (v48 != v50);
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
        if (v48)
          continue;
        break;
      }
    }

    v114[0] = MEMORY[0x24BDAC760];
    v54 = MEMORY[0x24BDAC760];
    v114[1] = 3221225472;
    v114[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2_615;
    v114[3] = &unk_24FE40DE8;
    v55 = v27;
    v115 = v55;
    objc_msgSend(v92, "br_transform:", v114);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v54;
    v107[1] = 3221225472;
    v107[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_3;
    v107[3] = &unk_24FE40E10;
    v56 = v11;
    v108 = v56;
    v112 = v98;
    v57 = v55;
    v109 = v57;
    v58 = v94;
    v59 = v94;
    v110 = v59;
    v113 = v91;
    v60 = v96;
    v111 = v60;
    v61 = v86;
    objc_msgSend(v86, "remoteObjectProxyWithErrorHandler:", v107);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v97, "syncConsistencyFileChecksumRate");
    v82 = objc_msgSend(v97, "syncConsistencyPackageChecksumRate");
    v62 = objc_msgSend(v97, "syncConsistencyMaxEventsCount");
    v99[0] = MEMORY[0x24BDAC760];
    v99[1] = 3221225472;
    v99[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_617;
    v99[3] = &unk_24FE40E38;
    v100 = v56;
    v105 = v98;
    v101 = v57;
    v102 = v59;
    v106 = v91;
    v63 = v60;
    v10 = v96;
    v104 = v63;
    v103 = v86;
    objc_msgSend(v84, "checkTreeConsistencyWithDatabaseURL:rootURLWrappers:fileChecksumRatePerThousand:packageChecksumRatePerThousand:maxEventsCount:forZoneRowIDs:reply:", v102, v45, v83, v82, v62, v85, v99);

    v64 = v115;
LABEL_25:

    v9 = v92;
    v29 = v93;
    v12 = v97;
    v11 = v89;
    v68 = v90;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 28);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v11->_lastError;
  v11->_lastError = (NSError *)v38;

  objc_msgSend(a1, "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", v11, v8, 0, 0xFFFFFFFFLL, v10);
LABEL_35:

}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

  objc_msgSend(*(id *)(a1 + 32), "serverDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", CFSTR("server.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backupToURL:progress:", v3, 0);

}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flush");

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", CFSTR("client.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backupToURL:progress:", v3, 0);

}

uint64_t __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_613(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", a2);
}

id __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2_615(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BE17640];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMangledString:", v4);

  objc_msgSend(v2, "appLibraryByMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    objc_msgSend(*(id *)(a1 + 64), "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56));
  }

}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_617(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  AppTelemetryTimeSeriesEvent *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  AppTelemetryTimeSeriesEvent *v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    v28 = v7;
    if (v7)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v11);
            v16 = -[AppTelemetryTimeSeriesEvent initWithData:]([AppTelemetryTimeSeriesEvent alloc], "initWithData:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v13);
      }

      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 16);
      *(_QWORD *)(v17 + 16) = v10;

      v7 = v28;
    }
    if (v8)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v20 = v8;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v30 != v23)
              objc_enumerationMutation(v20);
            v25 = -[AppTelemetryTimeSeriesEvent initWithData:]([AppTelemetryTimeSeriesEvent alloc], "initWithData:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
            objc_msgSend(v19, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v22);
      }

      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(v26 + 24);
      *(_QWORD *)(v26 + 24) = v19;

      v7 = v28;
    }
  }
  objc_msgSend(*(id *)(a1 + 72), "_finishReport:session:temporaryDBURL:mountFD:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 64));

}

- (NSArray)telemetryErrorEvents
{
  return self->_telemetryErrorEvents;
}

- (NSArray)telemetryWarningEvents
{
  return self->_telemetryWarningEvents;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BOOL)wasAbleToRun
{
  return self->_wasAbleToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_telemetryWarningEvents, 0);
  objc_storeStrong((id *)&self->_telemetryErrorEvents, 0);
}

void __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke_cold_1()
{
  id *v0;
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_14();
  v1 = v0;
  objc_msgSend(*v0, "telemetryErrorEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  objc_msgSend(*v1, "telemetryWarningEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v4, v5, "[DEBUG] Telemetry sync consistency report succeeded with %lu error and %lu warning events%@", v6, v7, v8, v9, 2u);

}

+ (void)cleanupApfsSnapshotWithMountFD:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed to delete old snapshot - %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)cleanupApfsSnapshotWithMountFD:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed to unmount old snapshot - %@%@");
  OUTLINED_FUNCTION_0();
}

@end
