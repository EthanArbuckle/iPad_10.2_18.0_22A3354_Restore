@implementation BRCUploadAllFilesTrackerOperation

- (BRCUploadAllFilesTrackerOperation)initWithSession:(id)a3 appLibraries:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  BRCUploadAllFilesTrackerOperation *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *zonesStillUploading;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "syncContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSyncContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  v11 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v28, sel_initWithName_syncContext_sessionContext_, CFSTR("upload-tracker"), v10, v7);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_session, a3);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "defaultClientZone", (_QWORD)v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");
    zonesStillUploading = v11->_zonesStillUploading;
    v11->_zonesStillUploading = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x24BDB9190], "br_logout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v11, "setGroup:", v22);

  }
  return v11;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  -[_BRCOperation cancel](&v6, sel_cancel);
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BRCUploadAllFilesTrackerOperation_cancel__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(v4, block);

}

void __43__BRCUploadAllFilesTrackerOperation_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 528);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "unregisterAllItemsDidUploadTracker:", *(_QWORD *)(a1 + 32), (_QWORD)v9);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 528);
    *(_QWORD *)(v7 + 528) = 0;

  }
}

- (void)clientZone:(id)a3 didFinishUploadingAllItemsWithError:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *perContainerIDError;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *zonesStillUploading;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  BRCUploadAllFilesTrackerOperation *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (__CFString *)a4;
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertOnQueue");

  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "zoneName");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    *(_DWORD *)buf = 138413058;
    v22 = CFSTR("success");
    v26 = self;
    if (v7)
      v22 = v7;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v22;
    v31 = 2112;
    v32 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished uploading all items in %@: %@%@", buf, 0x2Au);

  }
  -[NSMutableArray removeObject:](self->_zonesStillUploading, "removeObject:", v6);
  if (v7)
  {
    perContainerIDError = self->_perContainerIDError;
    objc_msgSend(v6, "mangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aliasTargetContainerString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](perContainerIDError, "setObject:forKeyedSubscript:", v7, v13);

  }
  if (!-[NSMutableArray count](self->_zonesStillUploading, "count") && self->_zonesStillUploading)
  {
    if (-[NSMutableDictionary count](self->_perContainerIDError, "count"))
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BE17300];
      v16 = (void *)-[NSMutableDictionary copy](self->_perContainerIDError, "copy", *MEMORY[0x24BE17490]);
      v24 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 21, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v18;
    }
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v7);
    zonesStillUploading = self->_zonesStillUploading;
    self->_zonesStillUploading = 0;

  }
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  const char *label;
  _QWORD v19[5];
  __int128 v20;
  uint64_t v21;
  _BYTE block[24];
  void *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__BRCUploadAllFilesTrackerOperation_main__block_invoke;
  v19[3] = &unk_24FE3FA18;
  v19[4] = self;
  v6 = v4;
  v7 = v19;
  v12 = (void *)MEMORY[0x2348B9F14](v7, v8, v9, v10, v11);
  v20 = 0uLL;
  v21 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v20);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = v20;
    label = dispatch_queue_get_label(v6);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v17;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v23 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v26 = v20;
  v27 = v21;
  *(_QWORD *)block = v5;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_18;
  v23 = &unk_24FE3FB28;
  v15 = v6;
  v24 = v15;
  v16 = v7;
  v25 = v16;
  dispatch_async(v15, block);

  objc_autoreleasePoolPop(v12);
}

void __41__BRCUploadAllFilesTrackerOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "count"))
    {
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "copy", 0);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v8;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v8 != v5)
              objc_enumerationMutation(v2);
            objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "registerAllItemsDidUploadTracker:", *(_QWORD *)(a1 + 32));
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        }
        while (v4);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
    }
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)BRCUploadAllFilesTrackerOperation;
  -[_BRCOperation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - zones still uploading: %@"), v4, self->_zonesStillUploading);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perContainerIDError, 0);
  objc_storeStrong((id *)&self->_hiddenZoneWithError, 0);
  objc_storeStrong((id *)&self->_zonesStillUploading, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
