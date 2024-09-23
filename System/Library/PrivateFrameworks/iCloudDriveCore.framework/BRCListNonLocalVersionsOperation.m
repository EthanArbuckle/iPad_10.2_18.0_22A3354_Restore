@implementation BRCListNonLocalVersionsOperation

- (BRCListNonLocalVersionsOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BRCListNonLocalVersionsOperation *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCNotification *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataSyncContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)BRCListNonLocalVersionsOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v20, sel_initWithName_syncContext_sessionContext_, CFSTR("versions/list-non-local-versions"), v9, v7);

  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[BRCListNonLocalVersionsOperation initWithDocumentItem:sessionContext:].cold.1((uint64_t)v6, (uint64_t)v11, v12);

    -[BRCListNonLocalVersionsOperation setItem:](v10, "setItem:", v6);
    objc_msgSend(v6, "documentRecordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCListNonLocalVersionsOperation setRecordID:](v10, "setRecordID:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initShareIDWithShareableItem:", v6);
    -[BRCListNonLocalVersionsOperation setShareID:](v10, "setShareID:", v14);

    objc_msgSend(v6, "serverZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCListNonLocalVersionsOperation setServerZone:](v10, "setServerZone:", v15);

    objc_msgSend(v6, "currentVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCListNonLocalVersionsOperation setCurrentVersion:](v10, "setCurrentVersion:", v16);

    -[_BRCOperation setNonDiscretionary:](v10, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v10, "setGroup:", v17);

    v18 = -[BRCNotification initWithLocalItem:itemDiffs:]([BRCNotification alloc], "initWithLocalItem:itemDiffs:", v10->_item, 0);
    -[BRCListNonLocalVersionsOperation setNotification:](v10, "setNotification:", v18);

    objc_storeStrong((id *)&v10->_sessionContext, a4);
  }

  return v10;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "versions/list-non-local-versions", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BRCListNonLocalVersionsOperation *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[BRCListNonLocalVersionsOperation serverZone](self, "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCListNonLocalVersionsOperation recordID](self, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = objc_alloc(MEMORY[0x24BDB90B0]);
  v26[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithRecordIDs:", v8);

  objc_msgSend(MEMORY[0x24BDB91D8], "desiredKeysWithMask:", 153);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDesiredKeys:", v10);

  objc_msgSend(MEMORY[0x24BDB9190], "br_fetchNonLocalVersions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroup:", v11);

  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __40__BRCListNonLocalVersionsOperation_main__block_invoke;
  v22[3] = &unk_24FE48388;
  v22[4] = self;
  v13 = v5;
  v23 = v13;
  v24 = v4;
  v14 = v6;
  v25 = v14;
  v15 = v4;
  objc_msgSend(v9, "setFetchRecordVersionsProgressBlock:", v22);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __40__BRCListNonLocalVersionsOperation_main__block_invoke_10;
  v18[3] = &unk_24FE42FD0;
  v19 = v13;
  v20 = self;
  v21 = v14;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v9, "setFetchRecordVersionsCompletionBlock:", v18);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9);

}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  int v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55[3];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v43 = a2;
  v44 = a4;
  v8 = a5;
  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v8);
      goto LABEL_32;
    }
    memset(v55, 0, sizeof(v55));
    __brc_create_section(0, (uint64_t)"-[BRCListNonLocalVersionsOperation main]_block_invoke", 85, v55);
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v39 = v55[0];
      v40 = objc_msgSend(v44, "count");
      v41 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v58 = v39;
      v59 = 2048;
      v60 = v40;
      v61 = 2112;
      v62 = v41;
      v63 = 2112;
      v64 = v9;
      _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Got %lu versions for (recordID:%@)%@", buf, 0x2Au);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v44;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    v8 = 0;
    if (!v11)
    {
LABEL_31:

      __brc_leave_section(v55);
      goto LABEL_32;
    }
    v46 = *(_QWORD *)v52;
    *(_QWORD *)&v12 = 138412546;
    v42 = v12;
LABEL_8:
    v47 = v11;
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v46)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v14, "etag");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v58 = (uint64_t)v37;
        v59 = 2112;
        v60 = (uint64_t)v38;
        v61 = 2112;
        v62 = v15;
        _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Considering etag %@ %@%@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "currentVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ckInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "etag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "etag");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (v21)
      {
        brc_bread_crumbs();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v58 = (uint64_t)v22;
          _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Skipping current version%@", buf, 0xCu);
        }
        goto LABEL_29;
      }
      v49 = v8;
      v50 = 0;
      v24 = objc_msgSend(v14, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:error:", &v50, 0, 0, *(_QWORD *)(a1 + 48), &v49);
      v22 = v50;
      v25 = v49;

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v22, "originalPOSIXName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (!v27)
        {
          if (objc_msgSend(v14, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504)))
          {
            objc_msgSend(v14, "brc_lastEditorDeviceName");
            v23 = objc_claimAutoreleasedReturnValue();
            v28 = 0;
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "cachedCurrentUserRecordName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0;
            v31 = (id)objc_msgSend(v14, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v30, &v48);
            v28 = v48;

            v23 = 0;
          }
          objc_msgSend(*(id *)(a1 + 32), "notification", v42, v43);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "copy");

          objc_msgSend(v14, "etag");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v22, "mtime"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v22, "size"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "markAsLoserVersionWithEtag:modificationDate:editorNameComponents:lastEditorDeviceName:size:", v34, v35, v28, v23, v36);

          objc_msgSend(*(id *)(a1 + 56), "addObject:", v33);
          goto LABEL_28;
        }
        brc_bread_crumbs();
        v23 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412290;
          v58 = (uint64_t)v23;
          _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] Version is lacking a name%@", buf, 0xCu);
        }
      }
      else
      {
        brc_bread_crumbs();
        v23 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = v42;
          v58 = (uint64_t)v25;
          v59 = 2112;
          v60 = (uint64_t)v23;
          _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] Unable to deserialize record: %@%@", buf, 0x16u);
        }
      }

LABEL_28:
      v8 = v25;
LABEL_29:

      if (v47 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v11)
          goto LABEL_31;
        goto LABEL_8;
      }
    }
  }
LABEL_32:

}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __40__BRCListNonLocalVersionsOperation_main__block_invoke_10_cold_1(a1, (uint64_t)v4, v5);

  if ((objc_msgSend(*(id *)(a1 + 40), "finishIfCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", *(_QWORD *)(a1 + 48), v3);

}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (BRCLocalItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
  objc_storeStrong((id *)&self->_serverZone, a3);
}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentVersion, a3);
}

- (BRCNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
}

- (void)initWithDocumentItem:(NSObject *)a3 sessionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] Listing Non Local Versions for item: %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __40__BRCListNonLocalVersionsOperation_main__block_invoke_10_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] completed fetching non-local versions of %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
