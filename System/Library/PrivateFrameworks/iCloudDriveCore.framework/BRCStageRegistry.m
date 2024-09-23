@implementation BRCStageRegistry

- (BRCStageRegistry)initWithAccountSession:(id)a3
{
  id v5;
  BRCStageRegistry *v6;
  BRCStageRegistry *v7;
  NSMutableSet *v8;
  NSMutableSet *activeUploadStageIDs;
  NSMutableSet *v10;
  NSMutableSet *activeDownloadStageIDs;
  uint64_t v12;
  brc_task_tracker *tracker;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCStageRegistry;
  v6 = -[BRCStageRegistry init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeUploadStageIDs = v7->_activeUploadStageIDs;
    v7->_activeUploadStageIDs = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeDownloadStageIDs = v7->_activeDownloadStageIDs;
    v7->_activeDownloadStageIDs = v10;

    brc_task_tracker_create("com.apple.brc.stage");
    v12 = objc_claimAutoreleasedReturnValue();
    tracker = v7->_tracker;
    v7->_tracker = (brc_task_tracker *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.brc.stage", v15);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

  }
  return v7;
}

- (id)_pathForDirIndex:(unsigned __int8)a3
{
  uint64_t v3;
  BRCAccountSessionFPFS *session;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (_pathForDirIndex__once != -1)
    dispatch_once(&_pathForDirIndex__once, &__block_literal_global_41);
  session = self->_session;
  if ((_DWORD)v3 == 1)
    -[BRCAccountSessionFPFS cacheDirPath](session, "cacheDirPath");
  else
    -[BRCAccountSessionFPFS sessionDirPath](session, "sessionDirPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_pathForDirIndex__dirsMapping;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __37__BRCStageRegistry__pathForDirIndex___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24FEB3518;
  v2[1] = &unk_24FEB3530;
  v3[0] = CFSTR("v");
  v3[1] = CFSTR("g");
  v2[2] = &unk_24FEB3548;
  v2[3] = &unk_24FEB3560;
  v3[2] = CFSTR("d");
  v3[3] = CFSTR("u");
  v2[4] = &unk_24FEB3578;
  v2[5] = &unk_24FEB3590;
  v3[4] = CFSTR("s");
  v3[5] = CFSTR("l");
  v2[6] = &unk_24FEB35A8;
  v2[7] = &unk_24FEB35C0;
  v3[6] = CFSTR("t");
  v3[7] = CFSTR("x");
  v2[8] = &unk_24FEB35D8;
  v3[8] = CFSTR("i");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_pathForDirIndex__dirsMapping;
  _pathForDirIndex__dirsMapping = v0;

}

- (void)open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _deviceID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __24__BRCStageRegistry_open__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.brc.stage.backup-exclusion-queue", v0);

  v2 = (void *)open_backupExclusionQueue;
  open_backupExclusionQueue = (uint64_t)v1;

}

uint64_t __24__BRCStageRegistry_open__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v4;

  v1 = open_backupExclusionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__BRCStageRegistry_open__block_invoke_3;
  block[3] = &unk_24FE3FA18;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

  return 0;
}

void __24__BRCStageRegistry_open__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x"));

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *MEMORY[0x24BDBCC68];
  if (v3)
  {
    v16 = 0;
    v7 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C0], v6, &v16);
    v8 = v16;

    if ((v7 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v18 = v11;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to include '%@' in backups: %@%@";
LABEL_10:
        _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, v12, buf, 0x20u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v15 = 0;
    v13 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v6, &v15);
    v8 = v15;

    if ((v13 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v18 = v14;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to exclude '%@' from backups: %@%@";
        goto LABEL_10;
      }
LABEL_7:

    }
  }

}

- (int)_openStageDirectory:(unsigned __int8)a3
{
  uint64_t v3;
  Class *v5;
  id *v6;
  Class v7;
  objc_class *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  objc_class *v29;
  int v30;
  void *v31;
  NSObject *v32;
  dev_t st_dev;
  int v34;
  int v35;
  int v36;
  int v37;
  uid_t v38;
  gid_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  __uint32_t v46;
  int v47;
  int v48;
  void *v49;
  NSObject *v50;
  int v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  char v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  int v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  uint32_t v86;
  void *v88;
  NSObject *v89;
  unsigned __int16 v90;
  unsigned __int16 v91;
  id v92;
  stat v93;
  uint8_t buf[4];
  _BYTE v95[30];
  __int16 v96;
  int v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  __int16 v104;
  int v105;
  __int16 v106;
  int v107;
  __int16 v108;
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  int st_nlink;
  __int16 v116;
  uid_t st_uid;
  __int16 v118;
  gid_t st_gid;
  __int16 v120;
  __darwin_time_t tv_sec;
  __int16 v122;
  __darwin_time_t v123;
  __int16 v124;
  __darwin_time_t v125;
  __int16 v126;
  off_t st_size;
  __int16 v128;
  __uint32_t st_flags;
  __int16 v130;
  _BYTE v131[14];
  uint64_t v132;

  v3 = a3;
  v132 = *MEMORY[0x24BDAC8D0];
  memset(&v93, 0, sizeof(v93));
  v5 = &self->super.isa + a3;
  v7 = v5[2];
  v6 = (id *)(v5 + 2);
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)-[objc_class fileSystemRepresentation](v8, "fileSystemRepresentation");
  v15 = BRCOpenAt(0xFFFFFFFFLL, v9, 33028, v10, v11, v12, v13, v14, v90);
  if (v15 < 0)
  {
    if (*__error() == 2)
      goto LABEL_103;
    v48 = *__error();
    brc_bread_crumbs();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v95 = v8;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v48;
      *(_WORD *)&v95[14] = 2112;
      *(_QWORD *)&v95[16] = v49;
      _os_log_error_impl(&dword_230455000, v50, (os_log_type_t)0x90u, "[ERROR] open('%@') failed %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v48;
  }
  else
  {
    v16 = v15;
    if ((fstat(v15, &v93) & 0x80000000) == 0)
    {
      if ((v93.st_mode & 0xF000) == 0x4000)
      {
        if (v93.st_dev == self->_deviceID)
        {
LABEL_114:
          v79 = v3;
          -[BRCStageRegistry _pathForDirIndex:](self, "_pathForDirIndex:", v3);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_storeStrong(v6, v80);
          self->_stageDirectoryFileID[v79] = v93.st_ino;
          v8 = (objc_class *)v80;
          goto LABEL_155;
        }
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0)
            v20 = 114;
          else
            v20 = 45;
          if ((v93.st_mode & 0x80) != 0)
            v21 = 119;
          else
            v21 = 45;
          if ((v93.st_mode & 0x40) != 0)
            v22 = 120;
          else
            v22 = 45;
          if ((v93.st_mode & 0x20) != 0)
            v23 = 114;
          else
            v23 = 45;
          if ((v93.st_mode & 0x10) != 0)
            v24 = 119;
          else
            v24 = 45;
          if ((v93.st_mode & 8) != 0)
            v25 = 120;
          else
            v25 = 45;
          if ((v93.st_mode & 4) != 0)
            v26 = 114;
          else
            v26 = 45;
          if ((v93.st_mode & 2) != 0)
            v27 = 119;
          else
            v27 = 45;
          if ((v93.st_mode & 1) != 0)
            v28 = 120;
          else
            v28 = 45;
          *(_DWORD *)buf = 138417666;
          *(_QWORD *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(_QWORD *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v19;
          v96 = 1024;
          v97 = v20;
          v98 = 1024;
          v99 = v21;
          v100 = 1024;
          v101 = v22;
          v102 = 1024;
          v103 = v23;
          v104 = 1024;
          v105 = v24;
          v106 = 1024;
          v107 = v25;
          v108 = 1024;
          v109 = v26;
          v110 = 1024;
          v111 = v27;
          v112 = 1024;
          v113 = v28;
          v114 = 1024;
          st_nlink = v93.st_nlink;
          v116 = 1024;
          st_uid = v93.st_uid;
          v118 = 1024;
          st_gid = v93.st_gid;
          v120 = 2048;
          tv_sec = v93.st_atimespec.tv_sec;
          v122 = 2048;
          v123 = v93.st_mtimespec.tv_sec;
          v124 = 2048;
          v125 = v93.st_ctimespec.tv_sec;
          v126 = 2048;
          st_size = v93.st_size;
          v128 = 1024;
          st_flags = v93.st_flags;
          v130 = 2112;
          *(_QWORD *)v131 = v17;
          _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not on the same volume as the root deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = objc_retainAutorelease(v8);
        if (unlink((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation")) < 0
          && *__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            st_dev = v93.st_dev;
            v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0)
              v35 = 114;
            else
              v35 = 45;
            v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0)
              v37 = 119;
            else
              v37 = 45;
            v38 = v93.st_uid;
            v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0)
              v40 = 120;
            else
              v40 = 45;
            if ((v93.st_mode & 0x20) != 0)
              v41 = 114;
            else
              v41 = 45;
            if ((v93.st_mode & 0x10) != 0)
              v42 = 119;
            else
              v42 = 45;
            if ((v93.st_mode & 8) != 0)
              v43 = 120;
            else
              v43 = 45;
            if ((v93.st_mode & 4) != 0)
              v44 = 114;
            else
              v44 = 45;
            if ((v93.st_mode & 2) != 0)
              v45 = 119;
            else
              v45 = 45;
            v46 = v93.st_flags;
            if ((v93.st_mode & 1) != 0)
              v47 = 120;
            else
              v47 = 45;
LABEL_151:
            *(_DWORD *)buf = 138417922;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = st_dev;
            *(_WORD *)&v95[14] = 2048;
            *(_QWORD *)&v95[16] = v93.st_ino;
            *(_WORD *)&v95[24] = 1024;
            *(_DWORD *)&v95[26] = v34;
            v96 = 1024;
            v97 = v35;
            v98 = 1024;
            v99 = v37;
            v100 = 1024;
            v101 = v40;
            v102 = 1024;
            v103 = v41;
            v104 = 1024;
            v105 = v42;
            v106 = 1024;
            v107 = v43;
            v108 = 1024;
            v109 = v44;
            v110 = 1024;
            v111 = v45;
            v112 = 1024;
            v113 = v47;
            v114 = 1024;
            st_nlink = v36;
            v116 = 1024;
            st_uid = v38;
            v118 = 1024;
            st_gid = v39;
            v120 = 2048;
            tv_sec = v93.st_atimespec.tv_sec;
            v122 = 2048;
            v123 = v93.st_mtimespec.tv_sec;
            v124 = 2048;
            v125 = v93.st_ctimespec.tv_sec;
            v126 = 2048;
            st_size = v93.st_size;
            v128 = 1024;
            st_flags = v46;
            v130 = 1024;
            *(_DWORD *)v131 = v30;
            *(_WORD *)&v131[4] = 2112;
            *(_QWORD *)&v131[6] = v31;
            v81 = "[ERROR] unlink('%@') failed deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u a"
                  "time:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x %{errno}d%@";
            v85 = v32;
            v86 = 168;
            goto LABEL_152;
          }
          goto LABEL_153;
        }
      }
      else
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0)
            v57 = 114;
          else
            v57 = 45;
          if ((v93.st_mode & 0x80) != 0)
            v58 = 119;
          else
            v58 = 45;
          if ((v93.st_mode & 0x40) != 0)
            v59 = 120;
          else
            v59 = 45;
          if ((v93.st_mode & 0x20) != 0)
            v60 = 114;
          else
            v60 = 45;
          if ((v93.st_mode & 0x10) != 0)
            v61 = 119;
          else
            v61 = 45;
          if ((v93.st_mode & 8) != 0)
            v62 = 120;
          else
            v62 = 45;
          if ((v93.st_mode & 4) != 0)
            v63 = 114;
          else
            v63 = 45;
          if ((v93.st_mode & 2) != 0)
            v64 = 119;
          else
            v64 = 45;
          if ((v93.st_mode & 1) != 0)
            v65 = 120;
          else
            v65 = 45;
          *(_DWORD *)buf = 138417666;
          *(_QWORD *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(_QWORD *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v56;
          v96 = 1024;
          v97 = v57;
          v98 = 1024;
          v99 = v58;
          v100 = 1024;
          v101 = v59;
          v102 = 1024;
          v103 = v60;
          v104 = 1024;
          v105 = v61;
          v106 = 1024;
          v107 = v62;
          v108 = 1024;
          v109 = v63;
          v110 = 1024;
          v111 = v64;
          v112 = 1024;
          v113 = v65;
          v114 = 1024;
          st_nlink = v93.st_nlink;
          v116 = 1024;
          st_uid = v93.st_uid;
          v118 = 1024;
          st_gid = v93.st_gid;
          v120 = 2048;
          tv_sec = v93.st_atimespec.tv_sec;
          v122 = 2048;
          v123 = v93.st_mtimespec.tv_sec;
          v124 = 2048;
          v125 = v93.st_ctimespec.tv_sec;
          v126 = 2048;
          st_size = v93.st_size;
          v128 = 1024;
          st_flags = v93.st_flags;
          v130 = 2112;
          *(_QWORD *)v131 = v54;
          _os_log_impl(&dword_230455000, v55, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not a directory deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = objc_retainAutorelease(v8);
        if (unlink((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation")) < 0
          && *__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            st_dev = v93.st_dev;
            v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0)
              v35 = 114;
            else
              v35 = 45;
            v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0)
              v37 = 119;
            else
              v37 = 45;
            v38 = v93.st_uid;
            v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0)
              v40 = 120;
            else
              v40 = 45;
            if ((v93.st_mode & 0x20) != 0)
              v41 = 114;
            else
              v41 = 45;
            if ((v93.st_mode & 0x10) != 0)
              v42 = 119;
            else
              v42 = 45;
            if ((v93.st_mode & 8) != 0)
              v43 = 120;
            else
              v43 = 45;
            if ((v93.st_mode & 4) != 0)
              v44 = 114;
            else
              v44 = 45;
            if ((v93.st_mode & 2) != 0)
              v45 = 119;
            else
              v45 = 45;
            v46 = v93.st_flags;
            if ((v93.st_mode & 1) != 0)
              v47 = 120;
            else
              v47 = 45;
            goto LABEL_151;
          }
LABEL_153:

          *__error() = v30;
LABEL_154:
          v16 = -1;
          v8 = v29;
          goto LABEL_155;
        }
      }
LABEL_103:
      v29 = objc_retainAutorelease(v8);
      if (mkdir((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation"), 0x1EDu) < 0
        && *__error() != 17)
      {
        if (*__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, (os_log_type_t)0x90u))
            goto LABEL_153;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v95 = v29;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v30;
          *(_WORD *)&v95[14] = 2112;
          *(_QWORD *)&v95[16] = v31;
          v81 = "[ERROR] mkdir('%@') failed %{errno}d%@";
          goto LABEL_122;
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        v67 = objc_msgSend(v66, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v92);
        v68 = v92;

        if ((v67 & 1) == 0)
        {
          brc_bread_crumbs();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 2112;
            *(_QWORD *)&v95[10] = v68;
            *(_WORD *)&v95[18] = 2112;
            *(_QWORD *)&v95[20] = v88;
            _os_log_error_impl(&dword_230455000, v89, (os_log_type_t)0x90u, "[ERROR] mkdir('%@') withIntermediateDirectories failed: %@%@", buf, 0x20u);
          }

          goto LABEL_154;
        }

      }
      v29 = objc_retainAutorelease(v29);
      v69 = (const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation");
      v75 = BRCOpenAt(0xFFFFFFFFLL, v69, 33028, v70, v71, v72, v73, v74, v91);
      if ((v75 & 0x80000000) == 0)
      {
        v16 = v75;
        if (fstat(v75, &v93) < 0)
        {
          v82 = *__error();
          brc_bread_crumbs();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = v82;
            *(_WORD *)&v95[14] = 2112;
            *(_QWORD *)&v95[16] = v83;
            _os_log_error_impl(&dword_230455000, v84, (os_log_type_t)0x90u, "[ERROR] fstat('%@') failed %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v82;
          close(v16);
          goto LABEL_154;
        }
        if (fcntl(v16, 64, 3))
        {
          v76 = *__error();
          brc_bread_crumbs();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, (os_log_type_t)0x90u))
            -[BRCStageRegistry _openStageDirectory:].cold.1((uint64_t)v77, v76, v78);

          *__error() = v76;
        }
        goto LABEL_114;
      }
      v30 = *__error();
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, (os_log_type_t)0x90u))
        goto LABEL_153;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v95 = v29;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v30;
      *(_WORD *)&v95[14] = 2112;
      *(_QWORD *)&v95[16] = v31;
      v81 = "[ERROR] open('%@') failed %{errno}d%@";
LABEL_122:
      v85 = v32;
      v86 = 28;
LABEL_152:
      _os_log_error_impl(&dword_230455000, v85, (os_log_type_t)0x90u, v81, buf, v86);
      goto LABEL_153;
    }
    v51 = *__error();
    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v95 = v16;
      *(_WORD *)&v95[4] = 2112;
      *(_QWORD *)&v95[6] = v8;
      *(_WORD *)&v95[14] = 1024;
      *(_DWORD *)&v95[16] = v51;
      *(_WORD *)&v95[20] = 2112;
      *(_QWORD *)&v95[22] = v52;
      _os_log_error_impl(&dword_230455000, v53, (os_log_type_t)0x90u, "[ERROR] fstat(%d) '%@' failed %{errno}d%@", buf, 0x22u);
    }

    *__error() = v51;
    close(v16);
  }
  v16 = -1;
LABEL_155:

  return v16;
}

- (int)_performInStageDirectory:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4;
  uint64_t (**v6)(id, _QWORD);
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  v4 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  v7 = -[BRCStageRegistry _openStageDirectory:](self, "_openStageDirectory:", v4);
  if ((v7 & 0x80000000) != 0)
  {
    v9 = -1;
  }
  else
  {
    v8 = v7;
    v9 = v6[2](v6, v7);
    v10 = *__error();
    close(v8);
    *__error() = v10;
  }

  return v9;
}

- (BOOL)copyPackageFileWithPackageFd:(int)a3 toStageFd:(int)a4 relpath:(id)a5
{
  id v8;
  id v9;
  int v10;
  _QWORD v12[4];
  id v13;
  int v14;
  int v15;

  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke;
  v12[3] = &unk_24FE46588;
  v13 = v8;
  v14 = a3;
  v15 = a4;
  v9 = v8;
  v10 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 1, v12);

  return v10 >= 0;
}

uint64_t __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned __int16 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[14];
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(unsigned int *)(a1 + 40);
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v13 = BRCOpenAt(v6, v7, 33028, v8, v9, v10, v11, v12, v42);
  if (v13 < 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
    {
      v38 = *(_DWORD *)(a1 + 40);
      v39 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109890;
      v44 = v38;
      v45 = 2112;
      *(_QWORD *)v46 = v39;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v28;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v31;
      _os_log_error_impl(&dword_230455000, v32, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_RDONLY) failed %{errno}d%@", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v14 = v13;
  v15 = objc_retainAutorelease(v5);
  v16 = (const char *)objc_msgSend(v15, "fileSystemRepresentation");
  v22 = BRCOpenAt(a2, v16, 2822, v17, v18, v19, v20, v21, 0x1B0u);
  if (v22 < 0)
  {
    v33 = *__error();
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      v44 = a2;
      v45 = 2112;
      *(_QWORD *)v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v33;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v34;
      _os_log_error_impl(&dword_230455000, v35, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_CREAT|O_RDWR|O_EXCL) %{errno}d%@", buf, 0x22u);
    }

    *__error() = v33;
    v28 = *__error();
    close(v14);
    goto LABEL_18;
  }
  v23 = v22;
  v24 = fcopyfile(v14, v22, 0, 8u);
  v25 = *__error();
  close(v14);
  *__error() = v25;
  v26 = *__error();
  close(v23);
  *__error() = v26;
  if (v24 < 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      v44 = v14;
      v45 = 1024;
      *(_DWORD *)v46 = v23;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v28;
      *(_WORD *)v47 = 2112;
      *(_QWORD *)&v47[2] = v31;
      _os_log_error_impl(&dword_230455000, v36, (os_log_type_t)0x90u, "[ERROR] fcopyfile(%d, %d, NULL, COPYFILE_DATA) %{errno}d%@", buf, 0x1Eu);
    }

LABEL_17:
LABEL_18:
    *__error() = v28;
    v27 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  v27 = 0;
  if ((BRCRenameAt(a2, v15, *(_DWORD *)(a1 + 44), *(void **)(a1 + 32), 0) & 0x80000000) != 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      v40 = *(_DWORD *)(a1 + 44);
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67110402;
      v44 = a2;
      v45 = 2112;
      *(_QWORD *)v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v40;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v41;
      v48 = 1024;
      v49 = v28;
      v50 = 2112;
      v51 = v29;
      _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] BRCRenameAt(%d, %@, %d, %@, 0) %{errno}d%@", buf, 0x32u);
    }

    goto LABEL_18;
  }
LABEL_19:

  return v27;
}

- (id)_pathInStage:(unint64_t)a3 index:(unsigned __int8 *)a4 generationID:(unsigned int *)a5
{
  int v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  NSString **stageDirectoryPath;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v9 = BRCOpenByID(self->_deviceID, a3, 2129924);
  if (v9 < 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry _pathInStage:index:generationID:].cold.1((uint64_t)v15, a3, v16);

    v12 = 0;
    goto LABEL_14;
  }
  v10 = v9;
  v21 = 0;
  v11 = _fstatItem(v9, &v22, a5, 0, &v21);
  v12 = v21;
  close(v10);
  if (v11 < 0)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  if (v22 != a3)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218498;
      v24 = v22;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v17;
      _os_log_fault_impl(&dword_230455000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: returnedFileID(%llu) != fileID(%llu)%@", buf, 0x20u);
    }

    goto LABEL_14;
  }
  v13 = 0;
  stageDirectoryPath = self->_stageDirectoryPath;
  while (!objc_msgSend(v12, "hasPrefix:", stageDirectoryPath[v13]))
  {
    if (++v13 == 9)
      goto LABEL_14;
  }
  *a4 = v13;
  v12 = v12;
  v19 = v12;
LABEL_15:

  return v19;
}

- (void)associateSyncUpStageID:(id)a3 withOperation:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  NSMutableSet *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self->_activeUploadStageIDs;
  objc_sync_enter(v8);
  if ((-[NSMutableSet containsObject:](self->_activeUploadStageIDs, "containsObject:", v6) & 1) != 0)
  {
    objc_sync_exit(v8);
  }
  else
  {
    -[NSMutableSet addObject:](self->_activeUploadStageIDs, "addObject:", v6);
    objc_sync_exit(v8);

    objc_msgSend(v7, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke;
    v10[3] = &unk_24FE465B0;
    objc_copyWeak(&v13, &location);
    v8 = v9;
    v12 = v8;
    v11 = v6;
    objc_msgSend(v7, "setCompletionBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x2348B9F14]();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[20];
    objc_sync_enter(v5);
    objc_msgSend(v4[20], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v5);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    objc_msgSend(v4, "cleanupStagedSyncUpWithID:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

  objc_autoreleasePoolPop(v2);
}

- (id)_anchorNamePrefixForRecordZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE17640];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordZoneID:", v4);

  objc_msgSend(v5, "mangledIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_anchorNameForChangeToken:(id)a3 recordZoneID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[BRCStageRegistry _anchorNamePrefixForRecordZoneID:](self, "_anchorNamePrefixForRecordZoneID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hash");

  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%llx"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_anchorNameForRecordID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDB8E88]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ownerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(":%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pendingListRecordDirWithStartingChangeToken:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[BRCStageRegistry _anchorNameForRecordID:](self, "_anchorNameForRecordID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[5], "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pendingDeltaFetchRecordDirWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[BRCStageRegistry _anchorNameForChangeToken:recordZoneID:](self, "_anchorNameForChangeToken:recordZoneID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[4], "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createURLForUploadWithStageID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke;
  v12[3] = &unk_24FE46560;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 3, v12);
  -[NSString stringByAppendingFormat:](self->_stageDirectoryPath[3], "stringByAppendingFormat:", CFSTR("/%@/%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  BRCMkdirAt(a2, *(void **)(a1 + 32), 448);
  return 0;
}

- (id)createURLForThumbnailUploadWithStageID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), self->_stageDirectoryPath[6], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)pendingFetchRecordDirExistsInStageWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  NSObject *v11;

  -[BRCStageRegistry _anchorNameForChangeToken:recordZoneID:](self, "_anchorNameForChangeToken:recordZoneID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[4], "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_stageDirectoryPath[4])
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:].cold.1();

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0);

  return v8;
}

- (void)cleanupStagedSyncUpWithID:(id)a3
{
  void *v4;
  id v5;

  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[3], "stringByAppendingPathComponent:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS diskReclaimer](self->_session, "diskReclaimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v5);

}

- (void)cleanupStagedUploadWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[3], "stringByAppendingPathComponent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF48];
  v9[0] = v4;
  v9[1] = CFSTR("ckpackage");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB9198], "destroyAnchorAndPackageAnchoredAtURL:", v7);
  -[BRCAccountSessionFPFS diskReclaimer](self->_session, "diskReclaimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v4);

}

- (id)createURLForDownloadWithStageID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke;
  v12[3] = &unk_24FE46560;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 2, v12);
  -[NSString stringByAppendingFormat:](self->_stageDirectoryPath[2], "stringByAppendingFormat:", CFSTR("/%@/%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  BRCMkdirAt(a2, *(void **)(a1 + 32), 448);
  return 0;
}

- (void)cleanupStagedDownloadWithID:(id)a3 forItemID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[2], "stringByAppendingPathComponent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || !-[BRCStageRegistry _graveyardAt:path:forItemID:](self, "_graveyardAt:path:forItemID:", 0xFFFFFFFFLL, v6, v8))
  {
    -[BRCAccountSessionFPFS diskReclaimer](self->_session, "diskReclaimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v6);

  }
}

- (BOOL)_graveyardAt:(int)a3 path:(id)a4 forItemID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _BOOL4 lowDiskSpace;
  id v11;
  off_t st_size;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  BRCStageRegistry *v22;
  id v23;
  int v24;
  stat v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  lowDiskSpace = self->_lowDiskSpace;
  memset(&v25, 0, sizeof(v25));
  if (!v9
    || lowDiskSpace
    || (v11 = objc_retainAutorelease(v8),
        !fstatat(v6, (const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v25, 32))
    && (st_size = v25.st_size, (v25.st_size & 0xF000) == 0x8000)
    && (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "minFileSizeForGraveyard"),
        v13,
        st_size <= v14))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      v27 = v6;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v17;
      _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] deleting (%d, '%@') asynchronously%@", buf, 0x1Cu);
    }

    -[BRCAccountSessionFPFS diskReclaimer](self->_session, "diskReclaimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "renameAndUnlinkInBackgroundItemAt:path:", v6, v8);
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke;
    v20[3] = &unk_24FE465D8;
    v21 = v9;
    v22 = self;
    v24 = v6;
    v23 = v11;
    v15 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 1, v20) == 0;

    v16 = v21;
  }

  return v15;
}

uint64_t __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  _BYTE v21[14];
  __int16 v22;
  _BYTE v23[20];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "diskReclaimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renameAndUnlinkInBackgroundItemAt:path:", a2, v4);

  if ((BRCRenameAt(*(_DWORD *)(a1 + 56), *(void **)(a1 + 48), a2, v4, 0) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_DWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *__error();
      v20 = 67110402;
      *(_DWORD *)v21 = v17;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v18;
      v22 = 1024;
      *(_DWORD *)v23 = a2;
      *(_WORD *)&v23[4] = 2112;
      *(_QWORD *)&v23[6] = v4;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v19;
      LOWORD(v24[0]) = 2112;
      *(_QWORD *)((char *)v24 + 2) = v6;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v20, 0x32u);
    }
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "stringByAppendingPathComponent:", v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (chflags((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0) < 0)
    {
      v7 = *__error();
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v20 = 138412802;
        *(_QWORD *)v21 = v6;
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)&v21[10] = v7;
        v22 = 2112;
        *(_QWORD *)v23 = v8;
        _os_log_error_impl(&dword_230455000, v9, (os_log_type_t)0x90u, "[ERROR] failed removing documentID for %@ %{errno}d%@", (uint8_t *)&v20, 0x1Cu);
      }

      *__error() = v7;
    }
    brc_bread_crumbs();
    v10 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_DWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v20 = 67110146;
      *(_DWORD *)v21 = v14;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v15;
      v22 = 2112;
      *(_QWORD *)v23 = v6;
      *(_WORD *)&v23[8] = 2112;
      *(_QWORD *)&v23[10] = v16;
      *(_WORD *)&v23[18] = 2112;
      v24[0] = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] moved (%d, '%@') to the graveyard at '%@' for %@%@", (uint8_t *)&v20, 0x30u);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)moveFromStageToGraveyard:(unint64_t)a3 forItemID:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  unsigned __int8 v10;

  v6 = a4;
  v10 = 0;
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7
    && (v10 | 2) == 2
    && -[BRCStageRegistry _graveyardAt:path:forItemID:](self, "_graveyardAt:path:forItemID:", 0xFFFFFFFFLL, v7, v6);

  return v8;
}

- (BOOL)existsInStage:(unint64_t)a3 generationID:(unsigned int *)a4
{
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  char v10;

  v10 = 0;
  if (!a3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry existsInStage:generationID:].cold.1();

    if (a4)
    {
      v6 = 0;
      *a4 = 0;
      return v6;
    }
    return 0;
  }
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v10, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = v10 == 2;

  return v6;
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v4;
  int64_t v7;
  void *v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  v7 = -[BRCStageRegistry garbageCollectSpace:](self, "garbageCollectSpace:");
  if (v7 < a3 && (int)v4 <= 4)
  {
    do
    {
      v8 = (void *)MEMORY[0x2348B9F14]();
      v7 += -[BRCStageRegistry purgeGraveyardSpace:withUrgency:](self, "purgeGraveyardSpace:withUrgency:", a3 - v7, v4);
      objc_autoreleasePoolPop(v8);
      if ((_DWORD)v4 == -2)
        break;
      if (v7 >= a3)
        break;
      v9 = (int)v4 <= 3;
      v4 = (v4 + 1);
    }
    while (v9);
  }
  return v7;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSObject *queue;
  int64_t v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_24FE46600;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a3;
  v8 = a4;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_purgeSpaceUnderQueue:withUrgency:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  OS_dispatch_queue *queue;
  brc_task_tracker *tracker;
  _QWORD v6[5];

  if (a4)
  {
    self->_lowDiskSpace = 0;
  }
  else if (!self->_lowDiskSpace)
  {
    self->_lowDiskSpace = 1;
    queue = self->_queue;
    tracker = self->_tracker;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke;
    v6[3] = &unk_24FE3FA18;
    v6[4] = self;
    brc_task_tracker_async_with_logs(tracker, queue, v6, 0);
  }
}

uint64_t __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_purgeSpaceUnderQueue:withUrgency:", 0x7FFFFFFFFFFFFFFFLL, 3);
}

- (int64_t)purgableSpace
{
  NSString *v2;
  FTS *v3;
  FTS *v4;
  FTSENT *v5;
  FTSENT *v6;
  int64_t v7;
  off_t st_size;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  NSObject *v13;
  char *fts_path;
  off_t value;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  char *v23[3];

  v23[2] = *(char **)MEMORY[0x24BDAC8D0];
  v2 = objc_retainAutorelease(self->_stageDirectoryPath[1]);
  v23[0] = (char *)-[NSString fileSystemRepresentation](v2, "fileSystemRepresentation");
  v23[1] = 0;
  v3 = fts_open(v23, 16, 0);
  value = 0;
  if (v3)
  {
    v4 = v3;
    v5 = fts_read(v3);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        switch(v6->fts_info)
        {
          case 1u:
            if (v6->fts_level == 1)
            {
              if (getxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0) == 8)
              {
                v7 += value;
                fts_set(v4, v6, 4);
              }
              else
              {
                value = 0;
              }
            }
            break;
          case 6u:
            if (v6->fts_level != 1)
              break;
            setxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0);
            st_size = value;
LABEL_11:
            v7 += st_size;
            break;
          case 7u:
          case 0xAu:
            v11 = *__error();
            brc_bread_crumbs();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
            {
              fts_path = v6->fts_path;
              *(_DWORD *)buf = 136315650;
              v18 = fts_path;
              v19 = 1024;
              v20 = v11;
              v21 = 2112;
              v22 = v12;
              _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] fts_read() failed for path %s %{errno}d%@", buf, 0x1Cu);
            }

            *__error() = v11;
            goto LABEL_23;
          case 8u:
            st_size = v6->fts_statp->st_size;
            if (v6->fts_level == 1)
              goto LABEL_11;
            value += st_size;
            break;
          default:
            break;
        }
        v6 = fts_read(v4);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
LABEL_23:
    fts_close(v4);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCStageRegistry purgableSpace].cold.1((uint64_t)v2, (uint64_t)v9, v10);

    v7 = 0;
  }

  return v7;
}

- (int64_t)purgeGraveyardSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSString *v6;
  time_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSString *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  _QWORD v16[4];
  NSString *v17;
  uint64_t *v18;
  int64_t v19;
  time_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v6 = self->_stageDirectoryPath[1];
  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x2020000000;
  v23[2] = 0;
  v7 = time(0);
  v8 = 0;
  switch(a4)
  {
    case -2:
    case 1:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "graveyardAgeDeltaInLowUrgency");
      goto LABEL_5;
    case 2:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "graveyardAgeDeltaInMedUrgency");
LABEL_5:
      v8 = (uint64_t)v10;

      break;
    case 3:
    case 4:
      v8 = 0x8000000000000000;
      break;
    default:
      break;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke;
  v16[3] = &unk_24FE46628;
  v11 = v6;
  v17 = v11;
  v18 = &v22;
  v19 = a3;
  v20 = v7;
  v21 = v8;
  BRCRemoveFolderInAutoreleasepool(v11, v16, 1, 0);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry purgeGraveyardSpace:withUrgency:].cold.1((uint64_t)v23);

  v14 = *(_QWORD *)(v23[0] + 24);
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", a1[4]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(_QWORD *)(v10 + 24);
    if (v9 != 1)
      goto LABEL_7;
    if (v11 >= a1[6])
    {
      v8 = 2;
      goto LABEL_9;
    }
    if (a1[7] - *(_QWORD *)(a3 + 48) < a1[8])
    {
      v8 = 1;
    }
    else
    {
LABEL_7:
      v8 = 0;
      *(_QWORD *)(v10 + 24) = v11 + *(_QWORD *)(a3 + 96);
    }
  }
LABEL_9:

  return v8;
}

- (int64_t)_garbageCollectPackages
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  objc_msgSend(MEMORY[0x24BDB9198], "clientPackageDatabaseDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__BRCStageRegistry__garbageCollectPackages__block_invoke;
  v4[3] = &unk_24FE46650;
  v4[4] = v5;
  objc_msgSend(MEMORY[0x24BDB9198], "gcPackagesInDirectory:dbInUseBlock:", v2, v4);

  _Block_object_dispose(v5, 8);
  return 0;
}

uint64_t __43__BRCStageRegistry__garbageCollectPackages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  v9 = *MEMORY[0x24BDB9280];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v7 |= objc_msgSend(MEMORY[0x24BDB9198], "anchorExistsForArchiverInfo:", v11);

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
LABEL_12:
    v12 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

  return v12;
}

- (int64_t)_garbageCollectUploads
{
  return -[BRCStageRegistry _garbageCollectUploadsIncludingActiveUploads:](self, "_garbageCollectUploadsIncludingActiveUploads:", 0);
}

- (void)purgeAllUploads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Purging all uploads and live items%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (BOOL)_hasActiveUploadWithStageID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  char v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = self->_activeUploadStageIDs;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](self->_activeUploadStageIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke;
    v10[3] = &unk_24FE434F8;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    v7 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

uint64_t __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_uploads WHERE transfer_stage = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 1;
}

- (int64_t)_garbageCollectUploadsIncludingActiveUploads:(BOOL)a3
{
  NSString *v5;
  NSString *v6;
  int64_t v7;
  _QWORD v9[4];
  NSString *v10;
  BRCStageRegistry *v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = self->_stageDirectoryPath[3];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke;
  v9[3] = &unk_24FE46678;
  v6 = v5;
  v13 = a3;
  v10 = v6;
  v11 = self;
  v12 = &v14;
  BRCRemoveFolderInAutoreleasepool(v6, v9, 1, 0);
  v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 40), "_hasActiveUploadWithStageID:", v9) & 1) != 0)
    {

LABEL_8:
      v14 = 1;
      goto LABEL_12;
    }

  }
  objc_msgSend(v6, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ckpackage"));

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDB9198];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destroyAnchorAndPackageAnchoredAtURL:", v13);

    goto LABEL_8;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1();

  v14 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a3 + 96);
LABEL_12:

  return v14;
}

- (int64_t)_garbageCollectFaults
{
  return 0;
}

- (int64_t)_garbageCollectDownloads
{
  NSString *v3;
  NSString *v4;
  int64_t v5;
  _QWORD v7[4];
  NSString *v8;
  BRCStageRegistry *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = self->_stageDirectoryPath[2];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke;
  v7[3] = &unk_24FE466A0;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  BRCRemoveFolderInAutoreleasepool(v4, v7, 1, 0);
  v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v9 = v6;
    v10 = *(id *)(a1[5] + 168);
    objc_sync_enter(v10);
    v11 = objc_msgSend(*(id *)(a1[5] + 168), "containsObject:", v9);
    objc_sync_exit(v10);

    if ((v11 & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1[5] + 8), "clientDB");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2;
      v20[3] = &unk_24FE434F8;
      v14 = v9;
      v21 = v14;
      v22 = &v23;
      objc_msgSend(v13, "performWithFlags:action:", 1, v20);

      v12 = *((unsigned int *)v24 + 6);
      if (!(_DWORD)v12)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 1);
          *(_DWORD *)buf = 138413058;
          v28 = v14;
          v29 = 1024;
          v30 = v18;
          v31 = 2048;
          v32 = v19;
          v33 = 2112;
          v34 = v15;
          _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] removing staged file for download: %@ device:%d ino:%lld%@", buf, 0x26u);
        }

        v12 = *((unsigned int *)v24 + 6);
      }

    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v12 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *((_QWORD *)a3 + 12);
  }

  return v12;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_downloads WHERE transfer_stage = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 1;
}

- (int64_t)_garbageCollectDeltaSyncDatabases
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = (void *)objc_opt_new();
  -[BRCAccountSessionFPFS serverDB](self->_session, "serverDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke;
  v8[3] = &unk_24FE45210;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performWithFlags:action:", 1, v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 8);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2;
  v15[3] = &unk_24FE46430;
  v15[4] = v3;
  v16 = v4;
  objc_msgSend(v5, "enumerateServerZones:", v15);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3;
  v11[3] = &unk_24FE466A0;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v9 = v6;
  BRCRemoveFolderInAutoreleasepool(v9, v11, 1, 0);

  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_anchorNameForChangeToken:recordZoneID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1
    && (v8 = (void *)a1[5],
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9),
        v9,
        (v8 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
  }

  return v10;
}

- (int64_t)_garbageCollectQBSDatabases
{
  BRCAccountSessionFPFS *v3;
  void *v4;
  BRCAccountSessionFPFS *v5;
  int64_t v6;
  _QWORD v8[5];
  BRCAccountSessionFPFS *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = self->_session;
  -[BRCAccountSessionFPFS serverDB](v3, "serverDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke;
  v8[3] = &unk_24FE466F0;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performWithFlags:action:", 1, v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2;
  v4[3] = &unk_24FE466C8;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v2, "_processPendingListDatabaseObjects:", v4);

  return 1;
}

BOOL __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL8 v18;
  void *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serverZoneByName:ownerName:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v9, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v7, v12);

    objc_msgSend(v10, "brc_itemIDWithSession:", *(_QWORD *)(a1 + 32));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v9 && v10 && v13)
    {
      objc_msgSend(v9, "clientZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serverDB");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "serverItemTypeByItemID:db:", v14, v16);

      v18 = (v17 - 9) < 2;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = 0;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v22 = 138412802;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v19;
    _os_log_fault_impl(&dword_230455000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to parse record name %@ or zone %@%@", (uint8_t *)&v22, 0x20u);
  }

  v18 = 0;
LABEL_10:

  return v18;
}

- (int64_t)_garbageCollectOldVersions
{
  BRCAccountSessionFPFS *v3;
  NSString *v4;
  NSString *v5;
  BRCAccountSessionFPFS *v6;
  int64_t v7;
  _QWORD v9[4];
  NSString *v10;
  BRCAccountSessionFPFS *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = self->_session;
  v4 = self->_stageDirectoryPath[0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke;
  v9[3] = &unk_24FE466A0;
  v5 = v4;
  v10 = v5;
  v6 = v3;
  v11 = v6;
  v12 = &v13;
  BRCRemoveFolderInAutoreleasepool(v5, v9, 1, 0);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  _QWORD block[4];
  id v36;
  uint64_t *v37;
  int *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2;
    block[3] = &unk_24FE41DE8;
    v9 = *(id *)(a1 + 40);
    v37 = &v39;
    v38 = a3;
    v36 = v9;
    dispatch_async_and_wait(v8, block);

    v10 = *((unsigned int *)v40 + 6);
    if (!(_DWORD)v10)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *((_QWORD *)a3 + 12);
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = *a3;
        v15 = *((_QWORD *)a3 + 1);
        v16 = *((unsigned __int16 *)a3 + 2);
        v17 = aPcDBLSW[v16 >> 12];
        if ((v16 & 0x100) != 0)
          v18 = 114;
        else
          v18 = 45;
        v19 = *((unsigned __int16 *)a3 + 3);
        if ((v16 & 0x80) != 0)
          v20 = 119;
        else
          v20 = 45;
        v21 = a3[4];
        v22 = a3[5];
        if ((v16 & 0x40) != 0)
          v23 = 120;
        else
          v23 = 45;
        v24 = *((_QWORD *)a3 + 4);
        if ((v16 & 0x20) != 0)
          v25 = 114;
        else
          v25 = 45;
        v26 = *((_QWORD *)a3 + 6);
        if ((v16 & 0x10) != 0)
          v27 = 119;
        else
          v27 = 45;
        v28 = *((_QWORD *)a3 + 8);
        if ((v16 & 8) != 0)
          v29 = 120;
        else
          v29 = 45;
        if ((v16 & 4) != 0)
          v30 = 114;
        else
          v30 = 45;
        v31 = *((_QWORD *)a3 + 12);
        if ((v16 & 2) != 0)
          v32 = 119;
        else
          v32 = 45;
        v33 = a3[29];
        *(_DWORD *)buf = 67114242;
        if ((v16 & 1) != 0)
          v34 = 120;
        else
          v34 = 45;
        v44 = v14;
        v45 = 2048;
        v46 = v15;
        v47 = 1024;
        v48 = v17;
        v49 = 1024;
        v50 = v18;
        v51 = 1024;
        v52 = v20;
        v53 = 1024;
        v54 = v23;
        v55 = 1024;
        v56 = v25;
        v57 = 1024;
        v58 = v27;
        v59 = 1024;
        v60 = v29;
        v61 = 1024;
        v62 = v30;
        v63 = 1024;
        v64 = v32;
        v65 = 1024;
        v66 = v34;
        v67 = 1024;
        v68 = v19;
        v69 = 1024;
        v70 = v21;
        v71 = 1024;
        v72 = v22;
        v73 = 2048;
        v74 = v24;
        v75 = 2048;
        v76 = v26;
        v77 = 2048;
        v78 = v28;
        v79 = 2048;
        v80 = v31;
        v81 = 1024;
        v82 = v33;
        v83 = 2112;
        v84 = v11;
        _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] removing deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0x98u);
      }

      v10 = *((unsigned int *)v40 + 6);
    }

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v10 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *((_QWORD *)a3 + 12);
  }

  return v10;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3;
  v3[3] = &unk_24FE46718;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumeratePrivateServerZones:", v3);
}

BOOL __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemByFileID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v4 == 0;
}

- (unint64_t)_processPendingListDatabaseObjects:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  NSString *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = self->_stageDirectoryPath[5];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke;
  v10[3] = &unk_24FE46740;
  v6 = v5;
  v11 = v6;
  v13 = &v14;
  v7 = v4;
  v12 = v7;
  BRCRemoveFolderInAutoreleasepool(v6, v10, 1, 0);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") != 1)
    {
      v10 = 0;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
LABEL_16:

      return v10;
    }
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 3)
    {
      v19 = v5;
      v9 = (id)*MEMORY[0x24BDB8E88];
    }
    else
    {
      if (objc_msgSend(v8, "count") != 4)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1();

        v10 = 0;
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
        goto LABEL_15;
      }
      v19 = v5;
      objc_msgSend(v8, "lastObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
    if (!(_DWORD)v10)
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);

    v5 = v19;
LABEL_15:

    goto LABEL_16;
  }
  return 1;
}

- (void)removeDatabaseObjectsForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  id v9;
  NSString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSString *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStageRegistry _anchorNamePrefixForRecordZoneID:](self, "_anchorNamePrefixForRecordZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_stageDirectoryPath[4];
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke;
  v14[3] = &unk_24FE46768;
  v15 = v7;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  BRCRemoveFolderInAutoreleasepool(v10, v14, 1, 0);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2;
  v12[3] = &unk_24FE466C8;
  v13 = v4;
  v11 = v4;
  -[BRCStageRegistry _processPendingListDatabaseObjects:](self, "_processPendingListDatabaseObjects:", v12);

}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "length") != 0;

  }
  return v8;
}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", v8);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ownerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v10 = (void *)*MEMORY[0x24BDB8E88];
    v12 = objc_msgSend(v10, "isEqualToString:", v6);

    v13 = v12 ^ 1u;
  }
  else
  {

    v13 = 1;
  }

  return v13;
}

- (BOOL)_hasContentsInPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, 0, 5, &__block_literal_global_96);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v3, "br_isParentOfURL:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __39__BRCStageRegistry__hasContentsInPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_230455000, v7, (os_log_type_t)0x90u, "[ERROR] Failed checking contents at %@ - %@%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (int64_t)_removeUnusedXattrBlobs
{
  time_t v3;
  void *v4;
  double v5;
  double v6;
  BRCAccountSessionFPFS *v7;
  NSString *v8;
  NSObject *v9;
  const char *v10;
  int64_t v11;
  NSString *v12;
  _QWORD v14[4];
  NSObject *v15;
  BRCAccountSessionFPFS *v16;
  uint64_t *v17;
  time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v3 = time(0);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xattrAgeDelta");
  v6 = v5;

  v7 = self->_session;
  if (-[BRCStageRegistry _hasContentsInPath:](self, "_hasContentsInPath:", self->_stageDirectoryPath[4]))
  {
    brc_bread_crumbs();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching delta change records%@";
LABEL_7:
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    if (!-[BRCStageRegistry _hasContentsInPath:](self, "_hasContentsInPath:", self->_stageDirectoryPath[5]))
    {
      v12 = self->_stageDirectoryPath[8];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke;
      v14[3] = &unk_24FE467B0;
      v8 = v12;
      v15 = v8;
      v18 = v3;
      v19 = (uint64_t)v6;
      v16 = v7;
      v17 = &v20;
      BRCRemoveFolderInAutoreleasepool(v8, v14, 1, 0);
      v11 = v21[3];

      v9 = v15;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching item records%@";
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if (*(_QWORD *)(a1 + 56) - *(_QWORD *)(a3 + 48) >= *(_QWORD *)(a1 + 64))
    {
      if (objc_msgSend(v7, "count") != 1)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1();

      }
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_dataFromHexidecimalString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v25 = 0;
        objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_97;
        block[3] = &unk_24FE433F0;
        v19 = *(id *)(a1 + 40);
        v12 = v10;
        v20 = v12;
        v21 = &v22;
        dispatch_async_and_wait(v11, block);

        if (*((_BYTE *)v23 + 24))
        {
          v8 = 1;
        }
        else
        {
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Removing unused xattr signature %@%@", buf, 0x16u);
          }

          v8 = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a3 + 96);
        }

        _Block_object_dispose(&v22, 8);
      }
      else
      {
        v8 = 1;
      }

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_97(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM client_pkg_upload_items WHERE xattr_signature = %@)"), *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v3 = v8;
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM client_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v3 = v5;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM server_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

  v7 = objc_msgSend(v9, "BOOLValue");
  v3 = v9;
  if (v7)
    goto LABEL_6;
LABEL_7:

}

- (int64_t)_garbageCollectUnusedLiveItems
{
  return -[BRCStageRegistry _garbageCollectLiveItemsIncludingActiveItems:](self, "_garbageCollectLiveItemsIncludingActiveItems:", 0);
}

- (int64_t)_garbageCollectItemsIncludingActiveItems:(BOOL)a3 stageIndex:(unsigned __int8)a4 maxAge:(int64_t)a5 deletePredicate:(id)a6
{
  int v7;
  id v10;
  time_t v11;
  NSString *v12;
  BRCAccountSessionFPFS *v13;
  NSString *v14;
  id v15;
  int64_t v16;
  _QWORD v18[4];
  NSString *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  time_t v23;
  int64_t v24;
  BOOL v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v7 = a4;
  v10 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v11 = time(0);
  v12 = self->_stageDirectoryPath[v7];
  v13 = self->_session;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke;
  v18[3] = &unk_24FE467D8;
  v21 = v26;
  v14 = v12;
  v25 = a3;
  v19 = v14;
  v22 = &v28;
  v23 = v11;
  v24 = a5;
  v15 = v10;
  v20 = v15;
  BRCRemoveFolderInAutoreleasepool(v14, v18, 1, 0);
  v16 = v29[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

uint64_t __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      v8 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return v8;
    }
  }
  if (!a3)
    return 1;
  if (*(_BYTE *)(a1 + 80))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke_cold_2();

    v8 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a3[12];
    return v8;
  }
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  if (v11 - a3[8] < v12 || v11 - a3[6] < v12)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "brc_stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BE17628], "fileObjectIDWithString:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, a3[1]);

    if ((_DWORD)v19)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke_cold_1();

      v8 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a3[12];
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_garbageCollectLiveItemsIncludingActiveItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  int64_t v7;
  _QWORD v9[5];

  v3 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveItemsStageAgeDelta");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__BRCStageRegistry__garbageCollectLiveItemsIncludingActiveItems___block_invoke;
  v9[3] = &unk_24FE46828;
  v9[4] = self;
  v7 = -[BRCStageRegistry _garbageCollectItemsIncludingActiveItems:stageIndex:maxAge:deletePredicate:](self, "_garbageCollectItemsIncludingActiveItems:stageIndex:maxAge:deletePredicate:", v3, 7, (uint64_t)v6, v9);

  return v7;
}

uint64_t __65__BRCStageRegistry__garbageCollectLiveItemsIncludingActiveItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__BRCStageRegistry__garbageCollectLiveItemsIncludingActiveItems___block_invoke_2;
  v11[3] = &unk_24FE46800;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v14 = &v16;
  v15 = a3;
  objc_msgSend(v6, "performWithFlags:action:", 1, v11);

  v9 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v9;
}

uint64_t __65__BRCStageRegistry__garbageCollectLiveItemsIncludingActiveItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE rowid = %lld AND item_type IN (1, 2, 8) AND item_file_id = %lld LIMIT 1"), objc_msgSend(*(id *)(a1 + 32), "rawID"), *(_QWORD *)(a1 + 56));

    if ((objc_msgSend(v3, "BOOLValue") & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
  return 1;
}

- (int64_t)_garbageCollectUploadThumbnailsIncludingActiveUploads:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  int64_t v9;
  _QWORD v11[4];
  NSString *v12;
  BRCStageRegistry *v13;
  _QWORD *v14;
  uint64_t *v15;
  BOOL v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry _garbageCollectUploadThumbnailsIncludingActiveUploads:].cold.1(a3);

  v7 = self->_stageDirectoryPath[6];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke;
  v11[3] = &unk_24FE46850;
  v14 = v17;
  v8 = v7;
  v16 = a3;
  v12 = v8;
  v13 = self;
  v15 = &v19;
  BRCRemoveFolderInAutoreleasepool(v8, v11, 1, 0);
  v9 = v20[3];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  int v7;
  uint64_t result;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return result;
    }
  }
  if (!a3)
    return 1;
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      objc_msgSend(v10, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(*(id *)(a1 + 40), "_hasActiveUploadWithStageID:", v13);

      if ((v14 & 1) != 0)
      {

        return 1;
      }
    }

  }
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += *(_QWORD *)(a3 + 96);
  return result;
}

- (int64_t)_garbageCollectSpace:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[BRCStageRegistry _garbageCollectPackages](self, "_garbageCollectPackages");
  v6 = -[BRCStageRegistry _garbageCollectUploads](self, "_garbageCollectUploads") + v5;
  v7 = -[BRCStageRegistry _garbageCollectFaults](self, "_garbageCollectFaults");
  v8 = v6 + v7 + -[BRCStageRegistry _garbageCollectDownloads](self, "_garbageCollectDownloads");
  v9 = -[BRCStageRegistry _garbageCollectDeltaSyncDatabases](self, "_garbageCollectDeltaSyncDatabases");
  v10 = v9 + -[BRCStageRegistry _garbageCollectQBSDatabases](self, "_garbageCollectQBSDatabases");
  v11 = v8 + v10 + -[BRCStageRegistry _removeUnusedXattrBlobs](self, "_removeUnusedXattrBlobs");
  v12 = -[BRCStageRegistry _garbageCollectUploadThumbnailsIncludingActiveUploads:](self, "_garbageCollectUploadThumbnailsIncludingActiveUploads:", 0);
  v13 = v11 + v12 + -[BRCStageRegistry _garbageCollectUnusedLiveItems](self, "_garbageCollectUnusedLiveItems");
  if (v13 < a3)
    -[BRCStageRegistry _garbageCollectOldVersions](self, "_garbageCollectOldVersions");
  return v13;
}

- (int64_t)garbageCollectSpace:(int64_t)a3
{
  time_t v5;
  void *v6;
  NSObject *v7;
  int64_t v8;

  v5 = time(0);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry garbageCollectSpace:].cold.1((uint64_t)v6, v5, v7);

  v8 = -[BRCStageRegistry _garbageCollectSpace:](self, "_garbageCollectSpace:", a3);
  -[BRCStageRegistry _updatePersistedStateWithLatestGCStartTime:](self, "_updatePersistedStateWithLatestGCStartTime:", v5);
  return v8;
}

- (void)_updatePersistedStateWithLatestGCStartTime:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke;
  v6[3] = &unk_24FE41740;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(v5, v6);

}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  BRCStagePersistedState *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(a1, (uint64_t)v2, v3);

  v4 = -[BRCStagePersistedState initWithLatestGCStartTime:]([BRCStagePersistedState alloc], "initWithLatestGCStartTime:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 192);
  objc_msgSend(*(id *)(v7 + 8), "clientState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("stage"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "forceBatchStart");

}

+ (void)migrateStageToVersion2_0WithSession:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "sessionDirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("i"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  BRCRemoveFolder(v4, 0, 0, 0);
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] closing%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __25__BRCStageRegistry_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLowDiskObserver:forDevice:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 224));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 192);
  *(_QWORD *)(v2 + 192) = 0;

}

- (void)disarmLockedTestTimer
{
  NSObject *lockedTestTimer;
  OS_dispatch_source *v4;

  lockedTestTimer = self->_lockedTestTimer;
  if (lockedTestTimer)
  {
    dispatch_source_cancel(lockedTestTimer);
    v4 = self->_lockedTestTimer;
    self->_lockedTestTimer = 0;

  }
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: minDelta >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __26__BRCStageRegistry_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 192))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __26__BRCStageRegistry_resume__block_invoke_cold_2();

    v2 = *(_QWORD *)(a1 + 32);
  }
  +[BRCPersistedState loadFromClientStateInSession:](BRCStagePersistedState, "loadFromClientStateInSession:", *(_QWORD *)(v2 + 8));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __26__BRCStageRegistry_resume__block_invoke_cold_1();

  }
}

void __26__BRCStageRegistry_resume__block_invoke_113(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "timeSinceLatestGCStartTime");
  if (v2 <= *(_QWORD *)(a1 + 48))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v2;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v2;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "garbageCollectSpace:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

void __26__BRCStageRegistry_resume__block_invoke_119(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3))
        goto LABEL_13;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }

    }
    if (xpc_activity_get_state(v3) == 2)
    {
      v7 = WeakRetained[26];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __26__BRCStageRegistry_resume__block_invoke_120;
      block[3] = &unk_24FE41A28;
      v8 = *(_QWORD *)(a1 + 48);
      block[4] = WeakRetained;
      v13 = v8;
      v12 = *(id *)(a1 + 32);
      dispatch_sync(v7, block);
      if (!xpc_activity_set_state(v3, 5))
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v9;
          _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", buf, 0xCu);
        }

      }
    }
  }
LABEL_13:

}

void __26__BRCStageRegistry_resume__block_invoke_120(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accountHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acAccountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    if (_block_invoke___personaOnceToken_1 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_1, &__block_literal_global_124);
    v8 = (id)_block_invoke___personalPersona_1;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPersona");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(v10, "userPersonaUniqueString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == v8 || (objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0)
  {
    v13 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v30 = 0;
    v19 = (void *)objc_msgSend(v10, "copyCurrentPersonaContextWithError:", &v30);
    v20 = v30;
    v21 = v31;
    v31 = v19;

    if (v20)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        -[_BRCOperation completedWithResult:error:].cold.1();

    }
    objc_msgSend(v10, "generateAndRestorePersonaContextWithPersonaUniqueString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v33 = (uint64_t)v5;
        v34 = 2112;
        v35 = v13;
        v36 = 2112;
        v37 = v24;
        _os_log_error_impl(&dword_230455000, v25, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_35:

    }
  }
  else
  {
    if (!v7 && (objc_msgSend(v10, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v13 = 0;
      goto LABEL_35;
    }
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "timeSinceLatestGCStartTime");
  if (v14 >= *(_QWORD *)(a1 + 48))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v33 = v14;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v17;
      _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "garbageCollectSpace:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v33 = v14;
      v34 = 2112;
      v35 = v28;
      v36 = 2112;
      v37 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }

  }
  _BRRestorePersona();

}

void __26__BRCStageRegistry_resume__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_1;
  _block_invoke___personalPersona_1 = v0;

}

- (void)cancel
{
  self->_isCancelled = 1;
  brc_task_tracker_cancel(self->_tracker);
}

+ (unsigned)computeItemModeFromStatInfo:(id)a3 isPackage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  __int16 v8;
  unsigned __int16 v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  v7 = (v6 < 0xB) & (0x611u >> v6);
  if (objc_msgSend(v5, "type") == 5)
    v8 = -24284;
  else
    v8 = 292;
  if ((v7 & 1) != 0 || v4)
  {
    v9 = v8 | 0x49;
LABEL_12:
    v9 |= 0x92u;
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "mode") & 2) != 0)
    v9 = v8 | 0x49;
  else
    v9 = v8;
  if ((objc_msgSend(v5, "mode") & 1) != 0)
    goto LABEL_12;
LABEL_13:

  return v9;
}

- (BOOL)saveXattrAtURL:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  const char *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v17 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v8, v9, &v24);
      v18 = v24;
      v10 = v24;

      if ((v17 & 1) == 0)
      {
        v10 = v10;
        if (v10)
        {
          brc_bread_crumbs();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          {
            v23 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
            v27 = 2080;
            if (!a5)
              v23 = "(ignored by caller)";
            v28 = v23;
            v29 = 2112;
            v30 = v10;
            v31 = 2112;
            v32 = v19;
            _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
          objc_storeStrong(a5, v18);

        v15 = 0;
        goto LABEL_19;
      }
    }
    v15 = 1;
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry saveXattrAtURL:forSignature:error:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Asked to save xattr without url"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
        v27 = 2080;
        if (!a5)
          v22 = "(ignored by caller)";
        v28 = v22;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a5)
    {
      v15 = 0;
      goto LABEL_20;
    }
    v10 = v10;
    v15 = 0;
    v9 = *a5;
    *a5 = v10;
  }
LABEL_19:

LABEL_20:
  return v15;
}

- (BOOL)saveXattrBlob:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8 && a4)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 2, &v36);
    v11 = v36;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
LABEL_4:
      v13 = 1;
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v11, "br_isCocoaErrorCode:", 516))
    {
      brc_bread_crumbs();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.1(v9, (uint64_t)v18, v19);
      goto LABEL_30;
    }
    if ((objc_msgSend(v12, "br_isCocoaErrorCode:", 4) & 1) != 0
      || objc_msgSend(v12, "br_isCocoaErrorCode:", 260))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByDeletingLastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v12;
      v22 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v35);
      v23 = v35;

      if ((v22 & 1) != 0)
      {

      }
      else
      {
        v24 = objc_msgSend(v23, "br_isCocoaErrorCode:", 516);

        if ((v24 & 1) == 0)
        {
          v18 = v23;
          if (v18)
          {
            brc_bread_crumbs();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            {
              v33 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
              v39 = 2080;
              if (!a5)
                v33 = "(ignored by caller)";
              v40 = v33;
              v41 = 2112;
              v42 = v18;
              v43 = 2112;
              v44 = v29;
              _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
            goto LABEL_29;
          goto LABEL_38;
        }
      }
      v34 = v23;
      v25 = objc_msgSend(v8, "writeToURL:options:error:", v9, 2, &v34);
      v12 = v34;

      if ((v25 & 1) != 0)
        goto LABEL_4;
      if (objc_msgSend(v12, "br_isCocoaErrorCode:", 516))
      {
        brc_bread_crumbs();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v13 = 1;
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.1(v9, (uint64_t)v18, v19);
        goto LABEL_30;
      }
    }
    v18 = v12;
    if (v18)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v32 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
        v39 = 2080;
        if (!a5)
          v32 = "(ignored by caller)";
        v40 = v32;
        v41 = 2112;
        v42 = v18;
        v43 = 2112;
        v44 = v26;
        _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
    {
LABEL_29:
      v18 = v18;
      v13 = 0;
      v19 = *a5;
      *a5 = v18;
      v12 = v18;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
LABEL_38:
    v13 = 0;
    v12 = v18;
    goto LABEL_31;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.3();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Asked to save xattr without signature or data"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      v31 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
      v39 = 2080;
      if (!a5)
        v31 = "(ignored by caller)";
      v40 = v31;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v16;
      _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
  {
    v12 = v12;
    v13 = 0;
    v9 = *a5;
    *a5 = v12;
    goto LABEL_32;
  }
  v13 = 0;
LABEL_33:

  return v13;
}

- (id)loadXattrBlobForSignature:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  const char *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 1, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = v19;
    v9 = v8;
    if (!v6)
    {
      v9 = v8;
      if (v9)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
        {
          v18 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
          v22 = 2080;
          if (!a4)
            v18 = "(ignored by caller)";
          v23 = v18;
          v24 = 2112;
          v25 = v9;
          v26 = 2112;
          v27 = v10;
          _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        objc_storeStrong(a4, v7);

    }
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry loadXattrBlobForSignature:error:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Asked for xattr without signature"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
        v22 = 2080;
        if (!a4)
          v17 = "(ignored by caller)";
        v23 = v17;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = v14;
        _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a4)
    {
      v6 = 0;
      goto LABEL_17;
    }
    v9 = v9;
    v6 = 0;
    v5 = *a4;
    *a4 = v9;
  }

LABEL_17:
  return v6;
}

- (id)urlForXattrSignature:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  if (a3)
  {
    v4 = self->_stageDirectoryPath[8];
    objc_msgSend(a3, "brc_hexadecimalString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry loadXattrBlobForSignature:error:].cold.1();

    v7 = 0;
  }
  return v7;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_flushingQueue, 0);
  objc_storeStrong((id *)&self->_lockedTestTimer, 0);
  objc_storeStrong((id *)&self->_activeDownloadStageIDs, 0);
  objc_storeStrong((id *)&self->_activeUploadStageIDs, 0);
  for (i = 80; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (BOOL)_moveFromURLToTargetStageLocation:(id)a3 stageIndex:(unsigned __int8)a4 filename:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v8 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __95__BRCStageRegistry_FPFSAdditions___moveFromURLToTargetStageLocation_stageIndex_filename_error___block_invoke;
  v20[3] = &unk_24FE47D68;
  v20[4] = self;
  v12 = v11;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", v8, v20);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "-[BRCStageRegistry(FPFSAdditions) _moveFromURLToTargetStageLocation:stageIndex:filename:error:]";
        v25 = 2080;
        if (!a6)
          v19 = "(ignored by caller)";
        v26 = v19;
        v27 = 2112;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v15);

  }
  return v14 == 0;
}

uint64_t __95__BRCStageRegistry_FPFSAdditions___moveFromURLToTargetStageLocation_stageIndex_filename_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fileUnlinker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", a2, *(_QWORD *)(a1 + 40));

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] remembering %@ in stage at %@%@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BRCRenameAt(-1, v7, a2, *(void **)(a1 + 40), 0);

  return v8;
}

- (BOOL)moveFromURLToLiveStage:(id)a3 liveStageFilename:(id)a4 error:(id *)a5
{
  return -[BRCStageRegistry _moveFromURLToTargetStageLocation:stageIndex:filename:error:](self, "_moveFromURLToTargetStageLocation:stageIndex:filename:error:", a3, 7, a4, a5);
}

- (BOOL)saveXattrsForURL:(id)a3 withMaximumSize:(unint64_t)a4 xattrSignature:(id *)a5 error:(id *)a6
{
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v21 = 0;
  v9 = +[BRFieldXattrBlob loadXattrsFromURL:structuralBlob:contentBlob:localBlob:withMaximumSize:error:](BRFieldXattrBlob, "loadXattrsFromURL:structuralBlob:contentBlob:localBlob:withMaximumSize:error:", a3, 0, &v23, 0, a4, &v21);
  v10 = v21;
  v22 = v10;
  if (!v9)
  {
    v13 = v10;
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      -[BRCStageRegistry(FPFSAdditions) saveXattrsForURL:withMaximumSize:xattrSignature:error:].cold.1((uint64_t)v13);

    if (a6)
    {
      v16 = objc_retainAutorelease(v13);
      v12 = 0;
      *a6 = v16;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v23, "length"))
  {
    objc_msgSend(v23, "brc_signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRCStageRegistry saveXattrBlob:forSignature:error:](self, "saveXattrBlob:forSignature:error:", v23, v11, &v22))
    {
      if (a5)
        *a5 = objc_retainAutorelease(v11);

      goto LABEL_7;
    }
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      objc_msgSend(v11, "brc_hexadecimalString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v20;
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] failed saving xattrs blob signature: %@ error:%@%@", buf, 0x20u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(v22);

LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
LABEL_7:
  v12 = 1;
LABEL_18:

  return v12;
}

- (id)cloneURLToLiveStage:(id)a3 liveStageFilename:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const char *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __79__BRCStageRegistry_FPFSAdditions__cloneURLToLiveStage_liveStageFilename_error___block_invoke;
  v18[3] = &unk_24FE47D68;
  v18[4] = self;
  v10 = v9;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  if (-[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 7, v18))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "-[BRCStageRegistry(FPFSAdditions) cloneURLToLiveStage:liveStageFilename:error:]";
        v23 = 2080;
        if (!a5)
          v17 = "(ignored by caller)";
        v24 = v17;
        v25 = 2112;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v12);

    v15 = 0;
  }
  else
  {

    -[BRCStageRegistry _liveURLForliveStageFilename:](self, "_liveURLForliveStageFilename:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

uint64_t __79__BRCStageRegistry_FPFSAdditions__cloneURLToLiveStage_liveStageFilename_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fileUnlinker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", a2, *(_QWORD *)(a1 + 40));

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] remembering %@ in live stage at %@%@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BRCCloneAt(-1, v7, a2, *(void **)(a1 + 40));

  return v8;
}

- (id)_liveURLForliveStageFilename:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  v9[0] = self->_stageDirectoryPath[7];
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)unlinkLiveStageFilename:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry(FPFSAdditions) unlinkLiveStageFilename:].cold.1((uint64_t)v4);

  -[BRCStageRegistry _liveURLForliveStageFilename:](self, "_liveURLForliveStageFilename:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fileUnlinker](self->_session, "fileUnlinker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renameAndUnlinkInBackgroundItemAtPath:", v9);

}

- (id)createStageURLForThumbnailFromLiveStageFilename:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  _QWORD v14[4];
  id v15;
  BRCStageRegistry *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__42;
  v22 = __Block_byref_object_dispose__42;
  v23 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __89__BRCStageRegistry_FPFSAdditions__createStageURLForThumbnailFromLiveStageFilename_error___block_invoke;
  v14[3] = &unk_24FE47D90;
  v7 = v6;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  if (-[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 7, v14))
  {

    v8 = (id)v19[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[BRCStageRegistry(FPFSAdditions) createStageURLForThumbnailFromLiveStageFilename:error:]";
        v26 = 2080;
        if (!a4)
          v13 = "(ignored by caller)";
        v27 = v13;
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v8 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v8;
}

uint64_t __89__BRCStageRegistry_FPFSAdditions__createStageURLForThumbnailFromLiveStageFilename_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("thumbnail-%@"), a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (*(_QWORD *)(a1[5] + 72))
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v11[0] = *(_QWORD *)(a1[5] + 72);
    v11[1] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPathComponents:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
    v9 = 1;
  }
  else
  {
    *__error() = 22;
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __89__BRCStageRegistry_FPFSAdditions__createStageURLForThumbnailFromLiveStageFilename_error___block_invoke_cold_1((uint64_t)v5, v8);
    v9 = 0;
  }

  return v9;
}

- (id)createStageURLFromLiveURLForItem:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, int);
  void *v20;
  id v21;
  BRCStageRegistry *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
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
  objc_msgSend(v8, "fileIDForUpload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__42;
    v29 = __Block_byref_object_dispose__42;
    v30 = 0;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke;
    v20 = &unk_24FE47DB8;
    v21 = v8;
    v22 = self;
    v23 = &v25;
    v24 = a4;
    v10 = (void *)MEMORY[0x2348BA0DC](&v17);
    if (-[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 7, v10, v17, v18, v19, v20))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        {
          v16 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v32 = "-[BRCStageRegistry(FPFSAdditions) createStageURLFromLiveURLForItem:options:error:]";
          v33 = 2080;
          if (!a5)
            v16 = "(ignored by caller)";
          v34 = v16;
          v35 = 2112;
          v36 = v11;
          v37 = 2112;
          v38 = v12;
          _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v11);

      v14 = 0;
    }
    else
    {
      v14 = (id)v26[5];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  void *v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  _QWORD v56[3];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "liveStageFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_1(v4);

    goto LABEL_23;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    brc_bread_crumbs();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_2(v4);

    v29 = __error();
    v30 = 22;
LABEL_22:
    *v29 = v30;
    goto LABEL_23;
  }
  v50 = 0;
  v49 = 0;
  v7 = objc_retainAutorelease(v5);
  v8 = openat(a2, (const char *)objc_msgSend(v7, "fileSystemRepresentation"), 2129924);
  if (v8 < 0)
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_3((uint64_t)v7);

    goto LABEL_23;
  }
  v9 = v8;
  v10 = _fstatItem(v8, &v50, &v49, 0, 0);
  v11 = *__error();
  close(v9);
  *__error() = v11;
  if ((v10 & 0x80000000) == 0)
  {
    v12 = v50;
    objc_msgSend((id)*v4, "fileIDForUpload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == (void *)objc_msgSend(v13, "unsignedLongLongValue"))
    {
      v14 = v49;
      objc_msgSend((id)*v4, "generationIDForUpload");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fsGenerationID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v14 == v17)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(id **)(a1 + 40);
        if ((*(_BYTE *)(a1 + 56) & 2) != 0)
        {
          objc_msgSend((id)*v4, "liveStageFilename");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          objc_msgSend(v19, "createStageURLForThumbnailFromLiveStageFilename:error:", v38, &v48);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v48;

          if (v39)
          {

            brc_bread_crumbs();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
              __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_4(v4);

            v25 = 0;
            goto LABEL_34;
          }
        }
        else
        {
          objc_msgSend(v19[1], "downloadStagePathForCurrentPersona");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("%@-%@"), v7, v22);
          v23 = v18;
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v23;
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        v43 = objc_msgSend(v42, "copyItemAtURL:toURL:error:", v18, v25, &v47);
        v39 = v47;

        if ((v43 & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v25);
          v36 = 0;
LABEL_35:

          goto LABEL_24;
        }
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          v46 = *v4;
          *(_DWORD *)buf = 138412802;
          v52 = v46;
          v53 = 2112;
          v54 = v39;
          v55 = 2112;
          v56[0] = v44;
          _os_log_fault_impl(&dword_230455000, v45, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't copy item to restaged url for %@ - %@%@", buf, 0x20u);
        }

        *__error() = 5;
LABEL_34:
        v36 = 0xFFFFFFFFLL;
        goto LABEL_35;
      }
    }
    else
    {

    }
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *v4;
      *(_DWORD *)buf = 138413058;
      v52 = v35;
      v53 = 2048;
      v54 = v50;
      v55 = 1024;
      LODWORD(v56[0]) = v49;
      WORD2(v56[0]) = 2112;
      *(_QWORD *)((char *)v56 + 6) = v33;
      _os_log_impl(&dword_230455000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] File inode changed in live stage for %@ ino:%llu gen:%u%@", buf, 0x26u);
    }

    v29 = __error();
    v30 = 4;
    goto LABEL_22;
  }
LABEL_23:
  v36 = 0xFFFFFFFFLL;
LABEL_24:

  return v36;
}

- (id)downloadStageURLWithStageID:(id)a3
{
  void *v3;
  void *v4;

  -[NSString stringByAppendingFormat:](self->_stageDirectoryPath[2], "stringByAppendingFormat:", CFSTR("/%@/%@"), a3, CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)rescueUnuploadedFile:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  const char *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  unsigned __int8 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[BRCAccountSessionFPFS volume](self->_session, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_pathWithDeviceID:fileID:", objc_msgSend(v8, "deviceID"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v34, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;

  if (v11 && v12 == 3)
  {
    brc_bread_crumbs();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry(FPFSAdditions) rescueUnuploadedFile:error:].cold.1((uint64_t)v13, a3, v15);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "lastPathComponent", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "brc_stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "br_pathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v18, v20, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __62__BRCStageRegistry_FPFSAdditions__rescueUnuploadedFile_error___block_invoke;
    v31[3] = &unk_24FE47DE0;
    v32 = v10;
    v13 = v23;
    v33 = v13;
    v24 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 3, v31);
    v14 = (_DWORD)v24 == 0;
    if ((_DWORD)v24)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v29 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v36 = "-[BRCStageRegistry(FPFSAdditions) rescueUnuploadedFile:error:]";
          v37 = 2080;
          if (!v30)
            v29 = "(ignored by caller)";
          v38 = v29;
          v39 = 2112;
          v40 = v25;
          v41 = 2112;
          v42 = v26;
          _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (v30)
        *v30 = objc_retainAutorelease(v25);

    }
    v15 = v32;
  }

  return v14;
}

uint64_t __62__BRCStageRegistry_FPFSAdditions__rescueUnuploadedFile_error___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _WORD v23[17];

  *(_QWORD *)&v23[13] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BRCRenameAt(-1, v4, a2, *(void **)(a1 + 40), 0);

  if (v5 < 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *__error();
      v16 = 138413314;
      v17 = v13;
      v18 = 1024;
      v19 = a2;
      v20 = 2112;
      v21 = v14;
      v22 = 1024;
      *(_DWORD *)v23 = v15;
      v23[2] = 2112;
      *(_QWORD *)&v23[3] = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(-1, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v16, 0x2Cu);

    }
    return *__error();
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v16 = 138413058;
      v17 = v11;
      v18 = 1024;
      v19 = a2;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      *(_QWORD *)v23 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(-1, '%@', %d, '%@') succeeded%@", (uint8_t *)&v16, 0x26u);

    }
    return 0;
  }
}

- (BOOL)existsInUploadOrLiveItemsStage:(unint64_t)a3 generationID:(unsigned int *)a4
{
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  const char *v10;
  char v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  if (a3)
  {
    -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v11, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (v5 && (v11 & 0xFB) == 3)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        if (v11 == 7)
          v10 = "live items stage";
        else
          v10 = "uploads stage";
        v13 = a3;
        v14 = 2080;
        v15 = v10;
        v16 = 2112;
        v17 = v7;
        _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] fileID:%llu is in the %s%@", buf, 0x20u);
      }

      v6 = 1;
    }
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  return v6;
}

- (void)_openStageDirectory:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
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
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] Can't set data protection %{errno}d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)_pathInStage:(uint64_t)a1 index:(uint64_t)a2 generationID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  __error();
  v6 = 134218498;
  v7 = a2;
  OUTLINED_FUNCTION_10_2();
  v8 = a1;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open by fileID:%llu %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
  OUTLINED_FUNCTION_5_1();
}

- (void)pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _stageDirectoryPath[kBRCStageDirectoryForPendingFetchStream] != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)existsInStage:generationID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] fileID:0 doesn't exist in stage (metadata-only update)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] running GC because we are in low disk space%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)purgableSpace
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  __error();
  v6 = 138412802;
  v7 = a1;
  OUTLINED_FUNCTION_10_2();
  v8 = a2;
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] fts_open(%@) failed %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
  OUTLINED_FUNCTION_5_1();
}

- (void)purgeGraveyardSpace:(uint64_t)a1 withUrgency:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 24);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Collected %lld bytes from purging the graveyard%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] removing staged file for upload: %@%@");
  OUTLINED_FUNCTION_0();
}

void __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected record name %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: components.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] removing staged item: %@%@");
  OUTLINED_FUNCTION_0();
}

void __95__BRCStageRegistry__garbageCollectItemsIncludingActiveItems_stageIndex_maxAge_deletePredicate___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] removing staged item: %s%@");
  OUTLINED_FUNCTION_0();
}

- (void)_garbageCollectUploadThumbnailsIncludingActiveUploads:(char)a1 .cold.1(char a1)
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "YES";
  if ((a1 & 1) == 0)
    v1 = "NO";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] _garbageCollectUploadThumbnailsIncludingActiveUploads: [%s]%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

- (void)garbageCollectSpace:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] starting garbage collection at %ld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  if (v4)
    v4 = *(_QWORD *)(v4 + 16);
  v5 = 134218498;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] latest GC:%ld; previous GC:%ld%@",
    (uint8_t *)&v5,
    0x20u);
}

void __26__BRCStageRegistry_resume__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _persistedState%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __26__BRCStageRegistry_resume__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_persistedState%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveXattrAtURL:forSignature:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without url%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveXattrBlob:(void *)a1 forSignature:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Saving an xattr signature that already exists! %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)saveXattrBlob:forSignature:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without signature or data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)loadXattrBlobForSignature:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Asked for xattr without signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __89__BRCStageRegistry_FPFSAdditions__createStageURLForThumbnailFromLiveStageFilename_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230455000, a2, (os_log_type_t)0x90u, "[ERROR] Stage directory path for live items does not exist!%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] %@ doesn't have a live stage file name%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_2(uint64_t *a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_230455000, v2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't create live path for %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Couldn't open file %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __82__BRCStageRegistry_FPFSAdditions__createStageURLFromLiveURLForItem_options_error___block_invoke_cold_4(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Could not create stage URL for thumbnail for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
