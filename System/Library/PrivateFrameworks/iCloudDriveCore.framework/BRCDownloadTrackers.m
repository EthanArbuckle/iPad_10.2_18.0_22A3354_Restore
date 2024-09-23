@implementation BRCDownloadTrackers

- (BRCDownloadTrackers)initWithSession:(id)a3
{
  id v4;
  BRCDownloadTrackers *v5;
  BRCDownloadTrackers *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCDownloadTrackers;
  v5 = -[BRCDownloadTrackers init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_session, v4);

  return v6;
}

- (id)trackedFileObjectIDs
{
  BRCDownloadTrackers *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_trackersByFileObjectID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)addDownloadTracker:(id)a3 forFileObjectID:(id)a4 withEtagIfLoser:(id)a5
{
  id v8;
  id v9;
  id v10;
  BRCDownloadTrackers *v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *trackersByFileObjectID;
  void *v16;
  id v17;
  NSMapTable *fileObjectIDsByTracker;
  uint64_t v19;
  NSMapTable *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = 134219010;
    v23 = v8;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] addDownloadTracker %p %@ forFileObjectID %@ withEtagIfLoser %@%@", (uint8_t *)&v22, 0x34u);
  }

  if (!v11->_trackersByFileObjectID)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    trackersByFileObjectID = v11->_trackersByFileObjectID;
    v11->_trackersByFileObjectID = v14;

  }
  +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v9, v10, objc_msgSend(v8, "kind"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v11->_trackersByFileObjectID, "objectForKeyedSubscript:", v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_trackersByFileObjectID, "setObject:forKeyedSubscript:", v17, v16);
  }
  objc_msgSend(v17, "addObject:", v8);
  fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  if (!fileObjectIDsByTracker)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v11->_fileObjectIDsByTracker;
    v11->_fileObjectIDsByTracker = (NSMapTable *)v19;

    fileObjectIDsByTracker = v11->_fileObjectIDsByTracker;
  }
  -[NSMapTable objectForKey:](fileObjectIDsByTracker, "objectForKey:", v8);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMapTable setObject:forKey:](v11->_fileObjectIDsByTracker, "setObject:forKey:", v21, v8);
  }
  objc_msgSend(v21, "addObject:", v16);

  objc_sync_exit(v11);
}

- (void)removeDownloadTracker:(id)a3
{
  id v4;
  BRCDownloadTrackers *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *trackersByFileObjectID;
  NSMapTable *fileObjectIDsByTracker;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCDownloadTrackers removeDownloadTracker:].cold.1((uint64_t)v4, (uint64_t)v6, v7);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectForKey:](v5->_fileObjectIDsByTracker, "objectForKey:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_trackersByFileObjectID, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v4);
        if (!objc_msgSend(v13, "count"))
          -[NSMutableDictionary removeObjectForKey:](v5->_trackersByFileObjectID, "removeObjectForKey:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (!-[NSMutableDictionary count](v5->_trackersByFileObjectID, "count"))
  {
    trackersByFileObjectID = v5->_trackersByFileObjectID;
    v5->_trackersByFileObjectID = 0;

  }
  -[NSMapTable removeObjectForKey:](v5->_fileObjectIDsByTracker, "removeObjectForKey:", v4);
  if (!-[NSMapTable count](v5->_fileObjectIDsByTracker, "count"))
  {
    fileObjectIDsByTracker = v5->_fileObjectIDsByTracker;
    v5->_fileObjectIDsByTracker = 0;

  }
  objc_sync_exit(v5);

}

- (void)document:(id)a3 didCompleteDownloadEtagIfLoser:(id)a4 kind:(int)a5 withError:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BRCDownloadTrackers *v15;
  NSMutableDictionary *trackersByFileObjectID;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v7 = *(_QWORD *)&a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "fileObjectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (objc_msgSend(v10, "orig"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "fileObjectID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13))
  {
    v15 = self;
    objc_sync_enter(v15);
    trackersByFileObjectID = v15->_trackersByFileObjectID;
    +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v13, v11, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](trackersByFileObjectID, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    objc_sync_exit(v15);
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_notifications_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v32 = v10;
        v33 = 2112;
        v34 = v11;
        v35 = 2112;
        v36 = v12;
        v37 = 2112;
        v38 = v20;
        _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[NOTIF] document %@ didCompleteDownloadEtagIfLoser %@ withError %@ -- notifying trackers%@", buf, 0x2Au);
      }

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v27;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v25++), "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v13, v11, v12, (_QWORD)v26);
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v23);
    }

  }
}

- (BRCAccountSessionFPFS)session
{
  return (BRCAccountSessionFPFS *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDsByTracker, 0);
  objc_storeStrong((id *)&self->_trackersByFileObjectID, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (void)removeDownloadTracker:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 134218498;
  v4 = a1;
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[NOTIF] Removing download tracker %p %@%@", (uint8_t *)&v3, 0x20u);
}

@end
