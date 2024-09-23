@implementation BRCFileUnlinker

- (BRCFileUnlinker)initWithCacheDirPath:(id)a3
{
  id v4;
  BRCFileUnlinker *v5;
  BRCFileUnlinker *v6;
  uint64_t v7;
  NSString *unlinkRootPath;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  dispatch_source_t v13;
  OS_dispatch_source *cachePurgeSource;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  dispatch_block_t v22;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BRCFileUnlinker;
  v5 = -[BRCFileUnlinker init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    atomic_store(1u, (unsigned int *)&v5->_suspendCount);
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("unlink"));
    v7 = objc_claimAutoreleasedReturnValue();
    unlinkRootPath = v6->_unlinkRootPath;
    v6->_unlinkRootPath = (NSString *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.bird.file-unlinker", v10);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)v6->_queue);
    cachePurgeSource = v6->_cachePurgeSource;
    v6->_cachePurgeSource = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v6);
    v15 = v6->_cachePurgeSource;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __40__BRCFileUnlinker_initWithCacheDirPath___block_invoke;
    v24[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v25, &location);
    v16 = v15;
    v17 = v24;
    v18 = v16;
    v19 = v17;
    v20 = v19;
    v21 = v19;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v21);
    dispatch_source_set_event_handler(v18, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__BRCFileUnlinker_initWithCacheDirPath___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)os_transaction_create();
    objc_msgSend(WeakRetained, "_purge");
    v2 = (id)objc_opt_self();

  }
}

- (void)dealloc
{
  BRCFileUnlinker *v3;
  NSObject *cachePurgeSource;
  OS_dispatch_source *v5;
  objc_super v6;

  -[BRCFileUnlinker suspend](self, "suspend");
  v3 = self;
  objc_sync_enter(v3);
  cachePurgeSource = v3->_cachePurgeSource;
  if (cachePurgeSource)
  {
    dispatch_resume(cachePurgeSource);
    v5 = v3->_cachePurgeSource;
    v3->_cachePurgeSource = 0;

  }
  objc_sync_exit(v3);

  v6.receiver = v3;
  v6.super_class = (Class)BRCFileUnlinker;
  -[BRCFileUnlinker dealloc](&v6, sel_dealloc);
}

- (void)resume
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: suspendCount >= 0%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)suspend
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109634;
  v3[1] = a1;
  v4 = 1024;
  v5 = a1 + 1;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] suspending - suspendCount:%d->%d%@", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_0();
}

- (BOOL)renameAndUnlinkInBackgroundItemAtPath:(id)a3
{
  return -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAt:path:](self, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, a3);
}

- (void)_purge
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
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] removed '%@/*'%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)forcePurgeWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BRCFileUnlinker_forcePurgeWithCompletionBlock___block_invoke;
  v8[3] = &unk_24FE409B8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(queue, v7);

}

uint64_t __49__BRCFileUnlinker_forcePurgeWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_purge");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)renameAndUnlinkInBackgroundItemAt:(int)a3 path:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *cachePurgeSource;
  BOOL v18;
  int v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  NSObject *v24;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  stat v46;
  uint8_t buf[4];
  _BYTE v48[24];
  __int16 v49;
  _BYTE v50[14];
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
  int st_nlink;
  __int16 v71;
  uid_t st_uid;
  __int16 v73;
  gid_t st_gid;
  __int16 v75;
  _BYTE v76[44];
  __int16 v77;
  _BYTE v78[10];
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  memset(&v46, 0, sizeof(v46));
  v6 = objc_retainAutorelease(a4);
  if ((fstatat(a3, (const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v46, 32) & 0x80000000) == 0)
  {
    v7 = self->_unlinkRootPath;
    if ((BRCMkdirAt(-1, v7, 511) & 0x80000000) != 0 && *__error() != 17)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID", *(_QWORD *)&v46.st_dev);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((BRCRenameAt(a3, v6, -1, v11, 0) & 0x80000000) == 0)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v26 = aPcDBLSW[(unint64_t)v46.st_mode >> 12];
        if ((v46.st_mode & 0x100) != 0)
          v27 = 114;
        else
          v27 = 45;
        if ((v46.st_mode & 0x80) != 0)
          v28 = 119;
        else
          v28 = 45;
        if ((v46.st_mode & 0x40) != 0)
          v29 = 120;
        else
          v29 = 45;
        if ((v46.st_mode & 0x20) != 0)
          v30 = 114;
        else
          v30 = 45;
        if ((v46.st_mode & 0x10) != 0)
          v31 = 119;
        else
          v31 = 45;
        if ((v46.st_mode & 8) != 0)
          v32 = 120;
        else
          v32 = 45;
        if ((v46.st_mode & 4) != 0)
          v33 = 114;
        else
          v33 = 45;
        if ((v46.st_mode & 2) != 0)
          v34 = 119;
        else
          v34 = 45;
        if ((v46.st_mode & 1) != 0)
          v35 = 120;
        else
          v35 = 45;
        *(_DWORD *)buf = 138417922;
        *(_QWORD *)v48 = v6;
        *(_WORD *)&v48[8] = 2112;
        *(_QWORD *)&v48[10] = v11;
        *(_WORD *)&v48[18] = 1024;
        *(_DWORD *)&v48[20] = v46.st_dev;
        v49 = 2048;
        *(_QWORD *)v50 = v46.st_ino;
        *(_WORD *)&v50[8] = 1024;
        *(_DWORD *)&v50[10] = v26;
        v51 = 1024;
        v52 = v27;
        v53 = 1024;
        v54 = v28;
        v55 = 1024;
        v56 = v29;
        v57 = 1024;
        v58 = v30;
        v59 = 1024;
        v60 = v31;
        v61 = 1024;
        v62 = v32;
        v63 = 1024;
        v64 = v33;
        v65 = 1024;
        v66 = v34;
        v67 = 1024;
        v68 = v35;
        v69 = 1024;
        st_nlink = v46.st_nlink;
        v71 = 1024;
        st_uid = v46.st_uid;
        v73 = 1024;
        st_gid = v46.st_gid;
        v75 = 2048;
        *(_QWORD *)v76 = v46.st_atimespec.tv_sec;
        *(_WORD *)&v76[8] = 2048;
        *(_QWORD *)&v76[10] = v46.st_mtimespec.tv_sec;
        *(_WORD *)&v76[18] = 2048;
        *(_QWORD *)&v76[20] = v46.st_ctimespec.tv_sec;
        *(_WORD *)&v76[28] = 2048;
        *(_QWORD *)&v76[30] = v46.st_size;
        *(_WORD *)&v76[38] = 1024;
        *(_DWORD *)&v76[40] = v46.st_flags;
        v77 = 2112;
        *(_QWORD *)v78 = v12;
        _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed '%@' to '%@' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xACu);
      }

      v14 = objc_retainAutorelease(v11);
      if (chflags((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 0) < 0)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[BRCFileUnlinker renameAndUnlinkInBackgroundItemAt:path:].cold.1((uint64_t)v14, (uint64_t)v15, v16);

      }
      cachePurgeSource = self->_cachePurgeSource;
      v18 = 1;
      dispatch_source_merge_data(cachePurgeSource, 1uLL);

      goto LABEL_19;
    }
    v22 = *__error();
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      v36 = aPcDBLSW[(unint64_t)v46.st_mode >> 12];
      if ((v46.st_mode & 0x100) != 0)
        v37 = 114;
      else
        v37 = 45;
      if ((v46.st_mode & 0x80) != 0)
        v38 = 119;
      else
        v38 = 45;
      if ((v46.st_mode & 0x40) != 0)
        v39 = 120;
      else
        v39 = 45;
      if ((v46.st_mode & 0x20) != 0)
        v40 = 114;
      else
        v40 = 45;
      if ((v46.st_mode & 0x10) != 0)
        v41 = 119;
      else
        v41 = 45;
      if ((v46.st_mode & 8) != 0)
        v42 = 120;
      else
        v42 = 45;
      if ((v46.st_mode & 4) != 0)
        v43 = 114;
      else
        v43 = 45;
      if ((v46.st_mode & 2) != 0)
        v44 = 119;
      else
        v44 = 45;
      if ((v46.st_mode & 1) != 0)
        v45 = 120;
      else
        v45 = 45;
      *(_DWORD *)buf = 67115266;
      *(_DWORD *)v48 = a3;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v6;
      *(_WORD *)&v48[14] = 2112;
      *(_QWORD *)&v48[16] = v11;
      v49 = 1024;
      *(_DWORD *)v50 = v46.st_dev;
      *(_WORD *)&v50[4] = 2048;
      *(_QWORD *)&v50[6] = v46.st_ino;
      v51 = 1024;
      v52 = v36;
      v53 = 1024;
      v54 = v37;
      v55 = 1024;
      v56 = v38;
      v57 = 1024;
      v58 = v39;
      v59 = 1024;
      v60 = v40;
      v61 = 1024;
      v62 = v41;
      v63 = 1024;
      v64 = v42;
      v65 = 1024;
      v66 = v43;
      v67 = 1024;
      v68 = v44;
      v69 = 1024;
      st_nlink = v45;
      v71 = 1024;
      st_uid = v46.st_nlink;
      v73 = 1024;
      st_gid = v46.st_uid;
      v75 = 1024;
      *(_DWORD *)v76 = v46.st_gid;
      *(_WORD *)&v76[4] = 2048;
      *(_QWORD *)&v76[6] = v46.st_atimespec.tv_sec;
      *(_WORD *)&v76[14] = 2048;
      *(_QWORD *)&v76[16] = v46.st_mtimespec.tv_sec;
      *(_WORD *)&v76[24] = 2048;
      *(_QWORD *)&v76[26] = v46.st_ctimespec.tv_sec;
      *(_WORD *)&v76[34] = 2048;
      *(_QWORD *)&v76[36] = v46.st_size;
      v77 = 1024;
      *(_DWORD *)v78 = v46.st_flags;
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v22;
      v79 = 2112;
      v80 = v23;
      _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] renameat(%d, '%@', -1, '%@' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x failed %{errno}d%@", buf, 0xB8u);
    }

    *__error() = v22;
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  if (*__error() == 2)
    goto LABEL_18;
  v19 = *__error();
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v48 = v6;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)&v48[10] = v19;
    *(_WORD *)&v48[14] = 2112;
    *(_QWORD *)&v48[16] = v20;
    _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] lstat('%@') failed %{errno}d%@", buf, 0x1Cu);
  }

  v18 = 0;
  *__error() = v19;
LABEL_19:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlinkRootPath, 0);
  objc_storeStrong((id *)&self->_cachePurgeSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)renameAndUnlinkInBackgroundItemAt:(NSObject *)a3 path:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 138412802;
  v9 = a1;
  v10 = 2080;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] failed removing documentID for %@ (%s)%@", (uint8_t *)&v8, 0x20u);
}

@end
